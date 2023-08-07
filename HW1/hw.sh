sudo su

# Приступаем к созданию своей изоляционной оболочки
mkdir new_docker
mkdir new_docker/bin

# скопируем стандартную оболочку bash
cp /bin/bash new_docker/bin

# осталось скопировать зависимости для bash
ldd /bin/bash

# создадим папки для будущих скопированных зависимостей
mkdir new_docker/lib
mkdir new_docker/lib64

# ну и копируем зависимости
cp /lib/x86_64-linux-gnu/libtinfo.so.6 new_docker/lib
cp /lib/x86_64-linux-gnu/libc.so.6 new_docker/lib
cp /lib64/ld-linux-x86-64.so.2 new_docker/lib64/

# теперь вызовем операцию смены корневого каталога для изоляции нашего процесса(оболочка bash)
chroot new_docker /bin/bash

exit
# Если мы выходим из какого то пространства имён,
# к примеру изолированной оболочки, то она уничтожается.


# Далее попробуем создать сетевое пространство имён - подобие коммутатора(switch)
# нам понадобится утилита ip, для работы с сетью

# добавим через утилиту ip сетевое пространство с названием my_ns
ip netns add my_ns

# удостоверимся что создали наше сетевое пространство(сетевую папку) my_ns
ip netns list

# можем посмотреть на то какие IP адреса используются в текущий момент
ip a

# войдём в bash через наше сетевое пространство my_ns
ip netns exec my_ns bash

# снова смотрим на IP адреса и видим изменения...
ip a
# появилась изоляции от всей сети кроме loopback(localhost)

# посмотрим на процессы нашей системы
ps aux
# делаем вывод, что изоляция состоялась только на сеть

# выйдем с сетевой изоляции и попробуем ещё один пример

# утилита которая позволяет разграничивать что то из перечисленных параметров:
# net           - сетевое пространство
# pid           - дерево процессов
# fork          - память
# mount-proc    - разграничиваем процесс
unshare --net --pid --fork --mount-proc /bin/bash

# удостоверимся в этой утилите и посмотрим на процессы нашей системы
ps aux


