FROM mkuri/archlinux-dev:latest

ARG USERNAME=arch

USER ${USERNAME}
WORKDIR /home/"${USERNAME}"

# Install Python language server
RUN yay -Syu --noconfirm npm
USER root
RUN npm install -g pyright

# Remove cache
RUN rm -rf /var/cache/pacman/pkg/* \
    && rm -rf /home/${USERNAME}/.cache/yay/*
USER ${USERNAME}
