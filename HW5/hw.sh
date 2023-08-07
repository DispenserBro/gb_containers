# заходим под рутом
sudo su

# если Docker Compose не установлен то сделаем это
apt install docker-compose

# создаём папку для запуска наших будущих контейнеров в Docker Compose
mkdir my_compose
#  и заходим в неё
cd my_compose/

# создаём конфиг файл для наших будущих контейнеров
nano compose.yml

# делаем быстрый запуск контейнеров без подробных отчётов
docker-compose up -d