# syntax=docker/dockerfile:experimental

FROM mkuri/archlinux:latest

ARG USERNAME=arch

USER root
WORKDIR /home/"${USERNAME}"

# Install main packages for development
RUN pacman -Syu --noconfirm base-devel git neovim openssh \
    && rm -rf /var/cache/pacman/pkg/*

# Install util packages for development
RUN pacman -Syu --noconfirm tmux ranger fzf fd ripgrep \
    && rm -rf /var/cache/pacman/pkg/*

# Install yay
USER "${USERNAME}"
RUN git clone https://aur.archlinux.org/yay.git \
    && cd yay \
    && makepkg --noconfirm -sirc \
    && cd ../
USER root

# Clone dotfiles
RUN mkdir ~/.ssh \
    && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN --mount=type=ssh git clone git@github.com:mkuri/dotfiles.git

# Config bash
RUN rm -rf /home/${USERNAME}/.bashrc \
    && ln -s /home/${USERNAME}/dotfiles/bash/.bashrc /home/${USERNAME}/

# Config readline
RUN ln -s /home/${USERNAME}/dotfiles/readline/.inputrc /home/${USERNAME}/

# Config nvim
RUN pacman -Syu --noconfirm nodejs \
    && rm -rf /var/cache/pacman/pkg/*
USER "${USERNAME}"
COPY library-scripts/*.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/neovim.sh

# Config tmux
RUN mkdir -p /home/${USERNAME}/.config/tmux \
    && ln -s /home/${USERNAME}/dotfiles/tmux/tmux.conf /home/${USERNAME}/.config/tmux/
