@echo off
title Subiendo Semana 6 a GitHub

:: Cambiar a la ruta de la carpeta
cd /d "G:\uni\udeacartagena\semana_6"

:: Configurar identidad local
git config --local user.email "tu_correo@ejemplo.com"
git config --local user.name "Tu Nombre De GitHub"

:: Forzar el uso del Gestor de Credenciales de Git para Windows
git config --global credential.helper manager

:: Inicializar o reconfigurar el repositorio
if not exist .git (
    echo [INFO] Inicializando repositorio Git local...
    git init
) else (
    echo [INFO] Repositorio Git ya inicializado.
    git remote remove origin >nul 2>&1
)

:: Vincular al repositorio remoto de GitHub
git remote add origin https://github.com/takanashi4k/semana_6.git

:: Agregar los archivos locales
echo [INFO] Agregando archivos...
git add .

:: Crear el commit
set "fecha=%date% %time%"
echo [INFO] Creando commit...
git commit -m "Actualizacion automatica: %fecha%"

:: FORZAR LA CREACIÓN DE LA RAMA MAIN LOCAL
git branch -M main

:: Subir los archivos (Aquí se abrirá el navegador obligatoriamente)
echo [INFO] Subiendo a GitHub...
git push -u origin main --force

echo --------------------------------------------------
echo [OK] Proceso terminado con exito.
pause