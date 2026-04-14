# Laboratornay-3. «Настройка инфраструктуры разработки: Git, CI/CD и контейнеризация»
## 1. Организация репозитория
Создали в папке на рабочем столе папку для лабораторной работы и через командную строку создали файл README.md. Команды для создания:

```bash
echo "# Laboratornay-3" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Kriiissss/Laboratornay-3.git
git push -u origin main
```

## 1.2. Создание локального репозитория и настройка Git Flow

```bash
mkdir ml-pipeline-project
cd ml-pipeline-project
git init
git remote add origin

Настройка  .gitignore
git checkout -b develop
git add .gitignore
git commit -m "Initial commit with .gitignore and develop branch"
git push -u origin develop
```
## 1.3. Создание структуры папок

```bash
Создание директории в корне проекта:
mkdir data notebooks src tests models

Пустые файлы-заглушки:
touch src/__init__.py
touch src/main.py
touch notebooks/exploratory_data_analysis.ipynb
touch tests/test_main.py
touch models/model.py

Фиксация изменений:
git add data notebooks src tests models src/__init__.py src/main.py notebooks/exploratory_data_analysis.ipynb tests/test_main.py models/model.py .gitignore
git commit -m "Add project structure and initial files"
git push origin develop
```

## 2. Управление данными (DVC)
## 2.1. Установка DVC

```bash
pip install "dvc[s3]"
```

## 2.2. Инициализация DVC в репозитории

```bash
python -m dvc init
```

## 2.3. Настройка удаленного хранилища

```bash
python -m dvc remote add -d myremote gdrive:://Laboratornaya_3
python -m dvc remote list
```

## 2.4. Добавление датасета под версионный контроль DVC

```bash
echo "id,value,label\n1,10,A\n2,15,B\n3,12,A" > data/raw_data.csv
python -m dvc add data/raw_data.csv
```
## 2.5. Фиксация изменений DVC в Git

```bash
git add data/raw_data.csv.dvc .gitignore
git commit -m "Add raw_data.csv managed by DVC"
git push origin develop
```

## 2.7. Загрузка данных в удаленное хранилище

```bash
python -m dvc push
```

## 3. Контейнеризация (Docker)
## 3.1. Создание Dockerfile

```bash
touch Dockerfile

