## О проекте
data_lakehouse_earthquake — это пет-проект, реализующий архитектуру data lakehouse для сбора, хранения и анализа данных о землетрясениях. Проект предназначен для демонстрации основных принципов построения современной платформы обработки данных с использованием Python и контейнеризации через Docker.

## Ключевые возможности
- Интеграция и загрузка данных о землетрясениях из открытых [источников](https://earthquake.usgs.gov/fdsnws/event/1/#methods)
- Хранение и обработка данных с использованием data lakehouse архитектуры
- Организация и автоматизация задач в Apache Airflow
- Визуализация данных и создание дашбордов в Metabase
- Контейнеризация проекта через Docker для простой развертки

## Используемые технологии
- Python
- Apache Airflow
- PostgreSQL
- MinIO (S3)
- Metabase
- Docker

## Установка и запуск
1. Требования
Свободные порты:
- 8081 — Airflow Webserver
- 5432 — PostgreSQL (Airflow metadata)
- 5431 — PostgreSQL DWH (данные о землетрясениях)
- 9000/9001 — MinIO (API + консоль)
- 3000 — Metabase

2. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/nezlusya/data_lakehouse_earthquake.git
   cd data_lakehouse_earthquake
   ```

3. Установите зависимости:
   ```bash
   pip install -r requirements.txt
   ```

4. Запустите проект:
   ```bash
   docker-compose up --build
   ```

## Первичная настройка

1. Создайте бакет в MinIO
   - Перейдите в MinIO Console: [http://localhost:9001](http://localhost:9001)  
   - Войдите, используя логин `minioadmin` и пароль `minioadmin`  
   - Создайте новый бакет с именем, например, `earthquakes-bucket`  
   - Используйте это имя бакета в DAG’ах Airflow для сохранения и загрузки данных
   - Получите access key и secret key

2. Активируйте DAG’и в Airflow
   - Перейдите в Airflow UI: [http://localhost:8081](http://localhost:8081)
   - Войдите, используя логин `airflow` и пароль `airflow`  
   - Во вкладке Admin добавьте переменные access key и secret key
   - Включите DAG’и

3. Инициализируйте таблицы в PostgreSQL DWH
   ```bash
   docker exec -i <postgres_dwh_container_id> psql -U postgres -d postgres < pg_script.sql

  ## Пример работы
  
