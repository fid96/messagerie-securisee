@echo off
REM Script batch pour compiler et packager le client Java SSL/TLS avec interface graphique Swing

REM Nom du fichier manifeste
set MANIFEST=manifest.txt

REM Nom du JAR à créer
set JAR=ClientGUISSL.jar

REM Répertoire source (dossier courant)
set SRC_DIR=.

echo Compilation des fichiers Java du client...
javac %SRC_DIR%\ClientGUISSL.java %SRC_DIR%\FenetreDiscussion.java

if errorlevel 1 (
    echo ERREUR : La compilation a échoué !
    pause
    exit /b 1
)

REM Création du fichier manifeste si il n'existe pas
if not exist %MANIFEST% (
    echo Main-Class: ClientGUISSL> %MANIFEST%
    REM Ligne vide obligatoire à la fin du manifeste
    echo. >> %MANIFEST%
)

echo Création du JAR exécutable %JAR%...
REM Le -C . . indique d'ajouter tous les fichiers du dossier courant (les .class générés)
jar cfm %JAR% %MANIFEST% -C %SRC_DIR% .

if errorlevel 1 (
    echo ERREUR : La création du JAR a échoué !
    pause
    exit /b 1
)

echo JAR %JAR% créé avec succès.

pause
