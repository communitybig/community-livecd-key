#!/usr/bin/env bash

msg() {
  local ALL_OFF="\e[1;0m"
  local BOLD="\e[1;1m"
  local GREEN="${BOLD}\e[1;32m"

  local MESSAGE=$1
  shift 1
  printf "${GREEN}==>[community-livecd-key]${ALL_OFF}${BOLD} ${MESSAGE}${ALL_OFF}\n" "$@" >&2
}

# Lista dos arquivos a serem copiados
files=('pubring.gpg' 'trustdb.gpg')

# Caminhos de origem e destino
srcpath='/usr/share/pacman/keyrings'
destpath='/etc/pacman.d/gnupg'

# Verifica se o diretório de destino existe, caso contrário, cria-o
[[ ! -d "$destpath" ]] && mkdir -p "$destpath"

# Itera pelos arquivos da lista
for file in "${files[@]}"; do
	srcfile="$srcpath/$file"
	destfile="$destpath/$file"

	# Verifica se o arquivo existe na origem
	if [[ -e "$srcfile" ]]; then
    msg "Copying 'Public Keyring' and 'Trust Database' ${srcfile} into ${destfile}..."
    cp -af "$srcfile" "$destfile" >/dev/null 2>&1
  fi
done

# Garante que o chaveiro está inicializado corretamente
msg "Initializing pacman keyring..."
pacman-key --init >/dev/null 2>&1
msg "Done!"
