FROM mkuri/archlinux-dev:latest

ARG USERNAME=arch

USER ${USERNAME}
WORKDIR /home/${USERNAME}

# Install main packages for C++ development
RUN yay -Syu --noconfirm clang llvm lldb cmake cppcheck valgrind

# Install lib packages for C++ develpment
RUN yay -Syu --noconfirm boost benchmark

# Remove cache
USER root
RUN rm -rf /var/cache/pacman/pkg/* \
    && rm -rf /home/${USERNAME}/.cache/yay/*
USER ${USERNAME}
