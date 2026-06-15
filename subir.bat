@echo off
title Subiendo Semana 6 a GitHub

:: Cambiar a la ruta de la carpeta
cd /d "G:\uni\udeacartagena\semana_6"

:: --- CONFIGURA TU IDENTIDAD AQUÍ ---
git config --local user.email "tu_correo@ejemplo.com"
git config --local user.name "Tu Nombre De GitHub"
:: ------------------------------------

:: Forzar a Git a usar el gestor de credenciales de Windows (abre el navegador)
echo [INFO] Configurando el inicio de sesion por navegador...
git config --global credential.helper manager

:: Verificar si ya es un repositorio de Git, si no, inicializarlo
if not exist .git (
    echo [INFO] Inicializando repositorio Git local...
    git init
    git branch -M main
    git remote add origin https://github.com/takanashi4k/semana_6.git
) else (
    echo [INFO] Repositorio Git ya inicializado.
    git remote remove origin >nul 2>&1
    git remote add origin https://github.com/takanashi4k/semana_6.git
)

:: Agregar todos los archivos de la carpeta
echo [INFO] Agregando archivos...
git add .

:: Crear el commit con la fecha y hora actual
set "fecha=%date% %time%"
echo [INFO] Creando commit...
git commit -m "Actualizacion automatica: %fecha%"

:: Subir los archivos a la rama main
echo [INFO] Subiendo a GitHub...
git push -u origin main --force

echo --------------------------------------------------
echo [OK] Proceso terminado con exito.
pause