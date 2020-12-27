FROM archlinux:latest

ARG USERNAME=arch
ARG USER_UID=1000
ARG USER_GID=1000
COPY library-scripts/*.sh /tmp/library-scripts/
RUN pacman -Syu --noconfirm \
    && /bin/bash /tmp/library-scripts/common-arch.sh "${USERNAME}" "${USER_UID}" "${USER_GID}" \
    && rm -rf /var/cache/pacman/pkg/*

USER "${USERNAME}"
WORKDIR /home/"${USERNAME}"
