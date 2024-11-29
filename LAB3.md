# BASIC PIPELINE

1. Clonare la repository [basic-spring-app](https://github.com/alleCresti/basic-spring-app/tree/main) in locale e creare un Jenkinsfile sul branch main nella root del progetto, il Jenkinsfile deve
   1. Dichiarare maven come tool di compilazione
   2. Compilare e testare il codice
   3. Registrare i risultati dei test
   4. Archiviare l'artefatto con lo step `archiveArtifacts`
2. Su Jenkins, creare una multi-branch-pipeline
3. Creare delle credentials che contengano il PAT per connettersi alla repository GitHub
4. Installare il tool maven attrverso la pagina di configurazione Jenkins
