#!/bin/bash

# Enable error handling
set -e

# Define color variables
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo -e "${RED}This script must be run as root or with sudo!${RESET}"
  exit 1
fi

# Function to display messages
function info() {
  echo -e "${YELLOW}[INFO] $1${RESET}"
}

function success() {
  echo -e "${GREEN}[SUCCESS] $1${RESET}"
}

function error() {
  echo -e "${RED}[ERROR] $1${RESET}"
}

info "Checking if dnf is installed..."
if ! command -v dnf &>/dev/null; then
  error "dnf is not installed. Please install it before running this script."
  exit 1
fi

info "Installing dnf plugins..."
sudo dnf -y install dnf-plugins-core
success "dnf plugins installed."

info "Adding jenkins GPG key"
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo dnf upgrade
success "done"

info "Installing Jenkins"
sudo dnf install -y fontconfig java-17-openjdk
sudo dnf install -y jenkins
success "done"

info "Adding Docker repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
success "Docker repository added."

info "Installing Docker and related tools..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
success "Docker and related tools installed."

info "Enabling and starting Docker service..."
sudo systemctl enable --now docker
success "Docker service is running."

info "Adding the current user to the Docker group..."
sudo usermod -aG docker $USER
sudo usermod -aG docker jenkins
newgrp docker

info "Enabling and starting Jenkins"
sudo systemctl enable jenkins
sudo systemctl start jenkins

success "All steps completed successfully! Your lab is ready!"

