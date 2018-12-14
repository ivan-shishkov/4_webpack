# Webpack внутри Docker

Данное решение позволяет запустить [Webpack](https://webpack.js.org/) внутри Docker контейнера как на локальной машине (в режиме development), так и на удалённом сервере (в режиме production).

## Рабочее окружение

* Ubuntu 16.04
* Docker CE
* Docker Compose
* Docker Machine (для запуска webpack на удалённом сервере)
* арендованный VPS (для запуска webpack на удалённом сервере)

## Подготовка к использованию

Необходимо клонировать данный репозиторий: 

```bash

$ git clone https://github.com/ivan-shishkov/4_webpack.git

```

и перейти внутрь директории:

```bash

$ cd 4_webpack/

```

## Запуск на локальной машине в development режиме

Запуск development-сервера с функцией live reload выполняется с помощью команды:

```bash

$ sudo docker-compose up

```

Для отображения стартовой страницы необходимо открыть браузер и перейти по адресу [http://localhost:8080/](http://localhost:8080/). При любом изменении исходных файлов в директории **webpack/src** будет происходить автоматическое обновление страницы в браузере.

Для остановки development-сервера необходимо выполнить команду:

```bash

$ sudo docker-compose down

```

## Запуск на удалённом сервере

Перед запуском на удалённом сервере необходимо:

* настроить доступ к серверу через SSH-ключи
* создать пользователя с получением прав sudo без ввода пароля
* установить веб-сервер nginx

### Установка Docker на удалённый сервер

Для установки Docker на удалённый сервер необходимо выполнить команду:

```bash

$ docker-machine create --driver generic --generic-ip-address=123.123.123.123 --generic-ssh-port 22222 --generic-ssh-user user --generic-engine-port 33333  --generic-ssh-key ~/.ssh/id_rsa docker-webpack-host

```

### Запуск в production режиме

Перед запуском необходимо скопировать все исходные файлы в директорию **prod/src**.

Затем необходимо переключить контекст на удалённый сервер:

```bash

$ eval $(docker-machine env docker-webpack-host)

```

и выполнить команду:

```bash

$ docker-compose -f docker-compose.prod.yml up --build

```

При этом результирующий файл **bundle.js** будет скопирован в директорию **/var/www/html** и станет доступным при обращении к нему через браузер.
