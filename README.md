# Usage

Connettersi via ssh alla macchina

```
ssh <username>@<indirizzo_ip>
```

Installare git

```
sudo dnf install -y git
```

Clonare la repo

```
git clone https://github.com/alleCresti/academy-cicd.git
```

Eseguire lo script

```
cd academy-cicd && chmod u+x quick_setup.sh
sudo ./quick_setup.sh
```

Lanciare Jenkins

```
sudo systemctl enable --now jenkins
```

Sbloccare Jenkins connettendosi a `http://<indirizzo_ip_pubblico>:8080` e seguendo le istruzioni https://www.jenkins.io/doc/book/installing/linux/#setup-wizard

Installare i plugin suggeriti

Creare un utente fantoccio
