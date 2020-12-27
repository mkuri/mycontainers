FROM mkuri/archlinux-dev:latest

ARG USERNAME=arch
WORKDIR /home/"${USERNAME}"

USER root

# Install main packages for python development
# RUN pacman -Syu --noconfirm clang llvm lldb cmake cppcheck valgrind \
#     && rm -rf /var/cache/pacman/pkg/*

# Install LSP for python development
RUN pacman -Syu --noconfirm yarn \
    && rm -rf /var/cache/pacman/pkg/*

USER "${USERNAME}"
RUN nvim -c 'CocInstall -sync coc-pyright' -c q -c q
