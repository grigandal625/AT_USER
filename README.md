# AT_USER
Микросервис пользователей AT-ТЕХНОЛОГИЯ

1. `git clone https://github.com/grigandal625/AT_USER`

2. Установить Docker
3. Установить и запустить RabbtMQ, лучше запускать в Docker командой 
      
```bash
docker run --name at_rabbitmq -d --expose 5672 -p 5672:5672 -p 15672:15672 rabbitmq:management
```

4. Установить python-пакет `poetry`
5. `poetry install`
6. `poetry update`
7. Скопировать файл [docker/at_user_local/.env.example](./docker/at_user_local/.env.example) в файл `docker/at_user_local/.env` (создать с тким же содержимым), и если надо, поменять настройки

    Если RabbitMq был запущен на хосте или в Docker командой из пункта 3., то убдитесь, что утановлена переменная `RABBITMQ_HOST=host.docker.internal`

8. `chmod +x ./alembic_upgrade_head.sh`
9.  `./alembic_upgrade_head.sh`
10. Если нигде больше не запущен пакет `at_queue`, выполнить `poetry run python -m at_queue` (запустится только если запущен RabbitMQ)
11. `make components`

После этогозапустится сервер для авторизации пользователей по адресу http://127.0.0.1:8181 или по адресу http://0.0.0.0:8181 (если не меняли порт в .env)

Далее нужно добавить пользователя

1. Заходим на http://127.0.0.1:8181/docs - откроется swagger
2. Нужно выполнить метод `sign_up`, с любыми данными, но **почту указать с доменом `@campus.mephi.ru`, например

```json
{
  "login": "admin",
  "password": "admin",
  "email": "user@campus.mephi.ru",
  "group": "Б21-524"
}
```

3. После этого можно получить токен пользователя с помощью метода `sign_in`, токен дейтвует сутки.