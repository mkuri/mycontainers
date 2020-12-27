FROM mkuri/archlinux-dev:latest

ARG USERNAME=arch
WORKDIR /home/"${USERNAME}"

USER root

# Install main packages for c++ development
RUN pacman -Syu --noconfirm clang llvm lldb cmake cppcheck valgrind \
    && rm -rf /var/cache/pacman/pkg/*

# Install lib packages for c++ development
RUN pacman -Syu --noconfirm boost benchmark \
    && rm -rf /var/cache/pacman/pkg/*

# Install LSP for c++ development
USER "${USERNAME}"
RUN yay -Syu --noconfirm ccls \
    && rm -rf /home/"${USERNAME}"/.cache/yay/*
USER root
RUN rm -rf /var/cache/pacman/pkg/*

USER "${USERNAME}"
