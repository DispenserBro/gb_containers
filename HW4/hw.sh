# входим под рутом
sudo su

# создадим свою папку(по умолчанию мы в домашней директории /home/$USER)
mkdir test_script

# заходим в неё
cd test_script

# создадим тут конфигурационный файл
nano Dockerfile

# а так же python скрипт
nano hw.py

# соберём наш контейнер с названием pyscr в текущей директории
docker build -t pyscr .

# запустим наш контейнер и увидим успешное выполнение программы "hello world"
docker run -v /home/vovqa/test_script/:/dir pyscr python3 dir/hw.py