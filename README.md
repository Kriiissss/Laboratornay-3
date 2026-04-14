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
