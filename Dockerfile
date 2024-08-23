# Usa la imagen oficial de Fedora como base
FROM fedora:latest

# Establece el autor/mantenedor
LABEL maintainer="joseluismoralesvega24@gmail.com"

# Instala Neofetch y otras herramientas
RUN dnf -y update && \
    dnf -y install neofetch dovecot vim curl wget git sudo && \
    dnf clean all

# Crea un nuevo usuario y configura un entorno de trabajo
RUN useradd -ms /bin/bash miusuario
WORKDIR /home/miusuario

# Cambia a este usuario para futuras operaciones
USER miusuario

# Establece el comando predeterminado al iniciar el contenedor
CMD ["neofetch"]