# ADVANCED PIPELINE

1. Installare docker sulla macchina
   1. Assicurarsi che l'user jenkins sia nel gruppo docker
      ```bash
      sudo usermod -aG docker jenkins
      groups jenkins
      sudo systemctl restart jenkins
      ```
2. Installare i plugin Docker, Docker Pipeline e Grype
3. Aggiungere le credenziali di Docker Hub su Jenkins
4. Estendere il Jenkinsfile del LAB2 in modo che:
   1. Usi agenti containerizzati
   2. Effettui la scansione di sicurezza dell'immagine. Farsi aiutare dal generatore di snippet pipeline per capire come usare lo step `grypeScan`
   3. Pushi la nuova immagine su docker-hub usando Docker Pipeline
      ```
      docker.withRegistry('', 'credentials-id) {
          def image = docker.build('image-name:tag')
          image.push()
      }
      ```
      [Docker pipeline docs](https://www.jenkins.io/doc/book/pipeline/docker/)
