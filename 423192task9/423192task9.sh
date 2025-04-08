#!/bin/bash

# Function to check the Linux distribution type
detect_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$NAME
    elif [ -f /etc/issue ]; then
        DISTRO=$(cat /etc/issue)
    else
        DISTRO="Unknown"
    fi

    echo "Detected distribution: $DISTRO"
}

# Function to install packages using APT (Debian-based systems like Ubuntu)
install_apt() {
    echo "Installing package(s) using APT (Debian-based)..."
    
    # Update the package list first
    sudo apt update
    
    # Install required packages using apt
    for pkg in "$@"; do
        sudo apt install -y "$pkg"
    done
}

# Function to install packages using RPM (RHEL-based systems like CentOS, Fedora)
install_rpm() {
    echo "Installing package(s) using RPM (RHEL-based)..."
    
    # Install required packages using rpm
    for pkg in "$@"; do
        sudo rpm -ivh "$pkg"
    done
}

# Function to install .deb files (in case you have .deb packages manually)
install_deb() {
    echo "Installing package(s) using DEB (Debian-based)..."
    
    # Install required .deb packages using dpkg
    for pkg in "$@"; do
        sudo dpkg -i "$pkg"
        # Fix missing dependencies after installing .deb
        sudo apt-get install -f -y
    done
}

# Function to install .rpm files (in case you have .rpm packages manually)
install_rpm_file() {
    echo "Installing package(s) using RPM files..."
    
    for pkg in "$@"; do
        sudo dnf install -y "$pkg"  # Using dnf for modern RHEL systems
    done
}

# Main script execution starts here
detect_distro

# Check if the system is Debian/Ubuntu based or RedHat/CentOS based
if [[ "$DISTRO" == *"Ubuntu"* ]] || [[ "$DISTRO" == *"Debian"* ]]; then
    echo "Debian-based distribution detected."
    # Example packages to install using apt or dpkg
    install_apt "curl" "git" "vim"  # Add more package names as needed

    # If you have local .deb files to install
    # install_deb "package1.deb" "package2.deb"  # Uncomment and replace with actual .deb files

elif [[ "$DISTRO" == *"CentOS"* ]] || [[ "$DISTRO" == *"Fedora"* ]] || [[ "$DISTRO" == *"RHEL"* ]]; then
    echo "RHEL-based distribution detected."
    # Example packages to install using rpm or dnf
    install_rpm "package1.rpm" "package2.rpm"  # Replace with actual rpm files or packages
    
    # Alternatively, for systems using rpm directly
    # install_rpm_file "package1.rpm" "package2.rpm"  # Uncomment and replace with actual .rpm files

else

