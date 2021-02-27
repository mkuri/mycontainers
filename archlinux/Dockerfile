FROM archlinux:latest

ARG USERNAME=arch
ARG USER_UID=1000
ARG USER_GID=1000
COPY library-scripts/*.sh /tmp/library-scripts/
RUN pacman -Syu --noconfirm \
    && /bin/bash /tmp/library-scripts/common-arch.sh "${USERNAME}" "${USER_UID}" "${USER_GID}" \
    && rm -rf /var/cache/pacman/pkg/*

# Install base packages
RUN pacman -Syu --noconfirm base-devel git \
    && rm -rf /var/cache/pacman/pkg/*

# Install yay
USER "${USERNAME}"
WORKDIR /home/"${USERNAME}"
RUN git clone https://aur.archlinux.org/yay-bin.git \
    && cd yay-bin \
    && makepkg --noconfirm -sirc \
    && cd ../
