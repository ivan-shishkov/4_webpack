# Webpack внутри Docker

Данное решение позволяет запустить [Webpack](https://webpack.js.org/) внутри Docker контейнера в development и production режимах.

## Рабочее окружение

* Ubuntu 16.04
* Docker CE
* Docker Compose
* арендованный VPS (для деплоя JS сборки)

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

Для отображения стартовой страницы необходимо открыть браузер и перейти по адресу [http://localhost:8080/](http://localhost:8080/). При любом изменении исходных файлов в директории **webpack-demo/src** будет происходить автоматическое обновление страницы в браузере.

Для остановки development-сервера необходимо выполнить команду:

```bash

$ sudo docker-compose down

```

## Деплой JS-сборки на удалённый сервер

Перед деплоем JS-сборки на удалённый сервер необходимо:

* настроить доступ к серверу через SSH-ключи
* создать пользователя с получением прав sudo без ввода пароля
* установить веб-сервер nginx

### Запуск webpack для сборки в production режиме с последующим деплоем

Перед запуском необходимо скопировать все исходные файлы в директорию **prod/src**.

Затем необходимо сделать скрипт **deploy.sh** исполняемым с помощью команды:

```bash

$ chmod ugo+x deploy.sh

```

и выполнить его, указав в качестве аргументов **данные для доступа на удалённый сервер** (**имя пользователя**, **хост**, **номер порта ssh**):

```bash

$ ./deploy.sh user 123.123.123.123 22222

```

При этом произойдёт запуск webpack в production режиме, сборка **bundle.js** и копирование на удалённый сервер в директорию **/var/www/html**. После этого **bundle.js** станет доступным при обращении к нему через браузер.
