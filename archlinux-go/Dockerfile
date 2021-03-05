FROM mkuri/archlinux-dev:latest

ARG USERNAME=arch

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Install main packages for Go development
RUN yay -Syu --noconfirm go

# Install gotools
RUN go get golang.org/x/tools/gopls@latest
ENV PATH $PATH:/home/${USERNAME}/go/bin

# Remove cache
USER root
RUN rm -rf /var/cache/pacman/pkg/* \
    && rm -rf /home/${USERNAME}/.cache/yay/*
USER ${USERNAME}
