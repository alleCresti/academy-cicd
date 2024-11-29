# BASIC PIPELINE

## Setup Jenkins

1. Installare Jenkins e Docker con lo script di setup seguendo le istruzioni del README
2. Installare i seguenti plugin: Pipeline: Stage view, Docker, Docker Pipeline

## Istruzioni

1. Forkare la repository [basic-spring-app](https://github.com/alleCresti/basic-spring-app/tree/main), clonarla in locale e creare un Jenkinsfile sul branch main nella root del progetto; il Jenkinsfile deve:
   1. Impostare come agente un container docker che usi l'immagine `maven:3-eclipse-temurin-17-alpine`. [Docs Docker Pipeline](https://www.jenkins.io/doc/book/pipeline/docker/#execution-environment)
   2. Compilare e testare il codice
   3. Registrare i risultati dei test con `junit`
   4. Archiviare l'artefatto con lo step `archiveArtifacts`
2. Su Jenkins, creare una multi-branch-pipeline e configurarla in modo che si connetta alla repo basic-spring-app
3. Creare delle credentials che contengano il PAT per connettersi alla repository GitHub e configurarle nella multi-branch-pipeline
