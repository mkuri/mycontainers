# syntax=docker/dockerfile:experimental

FROM mkuri/archlinux:latest

ARG USERNAME=arch

USER ${USERNAME}
WORKDIR /home/${USERNAME}

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
RUN git clone https://github.com/mkuri/dotfiles.git

# Config
RUN rm -rf $HOME/.bashrc $HOME/.bash_profile \
    && ln -s $HOME/dotfiles/bash/.bashrc $HOME/ \
    && ln -s $HOME/dotfiles/bash/.bash_profile $HOME/ \
    && ln -s $HOME/dotfiles/readline/.inputrc $HOME/ \
    && mkdir -p $HOME/.config/git \
    && ln -s $HOME/dotfiles/git/config $HOME/.config/git/ \
    && mkdir -p $HOME/.config/tmux \
    && ln -s $HOME/dotfiles/tmux/tmux.conf $HOME/.config/tmux/

# Config neovim
RUN mkdir -p $HOME/.config/nvim \
    && ln -s $HOME/dotfiles/nvim/init.vim $HOME/.config/nvim/ \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
    && $HOME/.local/bin/nvim -c PlugInstall -c q -c q

# Remove cache
USER root
RUN rm -rf /var/cache/pacman/pkg/* \
    && rm -rf /home/${USERNAME}/.cache/yay/*
USER ${USERNAME}
