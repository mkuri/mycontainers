# syntax=docker/dockerfile:experimental

FROM mkuri/archlinux:latest

ARG USERNAME=arch

USER root
WORKDIR /home/"${USERNAME}"

# Install packages for development
RUN yay -Syu --noconfirm fzf fd ripgrep git-delta-bin lazygit-bin \
                         ranger tmux translate-shell bash-completion

# Install nightly neovim
RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
    && chmod u+x nvim.appimage \
    && ./nvim.appimage --appimage-extract \
    && mkdir -p $HOME/.local/bin \
    && mv squashfs-root $HOME/.local/ \
    && ln -s $HOME/.local/squashfs-root/usr/bin/nvim $HOME/.local/bin/ \
    && rm -rf nvim.appimage


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
