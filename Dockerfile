# Stage 1: Builder
# Этап для сборки зависимостей.
# Используем полный образ Python, чтобы установить все зависимости.
FROM python:3.10 as builder

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файл с зависимостями
COPY requirements.txt /app/

# Устанавливаем pip и все зависимости из requirements.txt
# --no-cache-dir уменьшает размер образа, не сохраняя кэш pip
# --upgrade pip обновляет pip до последней версии
RUN python -m pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Копируем остальной код проекта
# Пути соответствуют структуре проекта
COPY src/ ./src/
COPY notebooks/ ./notebooks/
COPY models/ ./models/
COPY data/ ./data/

# Stage 2: Runner
# Этот этап использует более легкий образ Python (slim)
# чтобы финальный образ был меньше.
FROM python:3.10-slim

WORKDIR /app

# Копируем установленные пакеты из этапа 'builder'
COPY --from=builder /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Копируем только нужные для запуска файлы приложения
COPY src/ ./src/
COPY models/ ./models/
COPY data/ ./data/

# Указываем, какую команду выполнять при старте контейнера
CMD ["python", "src/main.py"]