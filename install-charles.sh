#!/bin/bash
# author: Drian Freitas <drian.io>
# collab: Luis Teixeira
# Simple script to install charles proxy

# Baixar charles proxy
wget --quiet --show-progress  "https://www.charlesproxy.com/assets/release/4.6.2/charles-proxy-4.6.2_amd64.tar.gz?k=616ff66d1b"

# extrair o arquivo .tar.gz
tar -xf charles-proxy-4.6.2_amd64.tar.gz

# Mover arquivos forçadamente para a dir /opt/
rsync -a charles /opt/ --remove-sent-files --ignore-existing --whole-file

# Atualizar arquivo charles-proxy.desktop com dir absoluto da localização do ícone do Charles
sed -i 's+../icon/128x128/apps/charles-proxy.png+/opt/charles/icon/128x128/apps/charles-proxy.png+g' /opt/charles/etc/charles-proxy.desktop

# Criar link simbólico
sudo ln -s /opt/charles/etc/charles-proxy.desktop /usr/share/applications/charles.desktop

# Fazer com o ambiente reconheça as alterações feitas
source ~/.bashrc
