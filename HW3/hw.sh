# заходим под рутом
sudo su

# запускаем контейнер MySQL с именем some-mysql, установка пароля для root: my-secret-pw
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:8.0.31
docker run --name myphp -d --link some-mysql:db -p 8081:80 phpmyadmin/phpmyadmin
# -d        демон процесс
# --link    установка связи между 'some-mysql' и 'phpMyAdmin'
# -p        проброс порта, 8081(на хост-машине) на порт 80(который внутри контейнера)



# создаём контейнер из образа 'ubuntu' с версией '22.10'
docker run -it -h GB --name my_ubunto ubuntu:22.10
# -it       интерактивный режим
# -h        назавние хоста
# --name    имя контейнера

# создадим папку 'eg', файл 'test.txt' и внесём первую правку
mkdir /eg
touch /eg/test.txt
echo "first edit" >> /eg/test.txt

# необязательно выполнять 2 команды ниже, можно создать контейнер с другим именем,
# но я не буду мусорить контейнерами и пересоздам с такими же параметрами
# смотрим все контейнеры
docker ps -a

# удаляем контейнер, чтобы пересоздать с синхронизирующей папкой
docker rm < container_name >

# дружим папки 'eg' и 'eg_container' которая внутри контейнера(двустороняя синхра)
docker run -it -h GB --name my_ubunto -v /eg:/eg_container ubuntu:22.10

# внесём в файл вторую правку и увидим что синхронизация прошла с обоих сторон
echo "second edit" >> /eg_container/test.txt