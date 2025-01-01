#!/usr/bin/env bash

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
    # Copia o arquivo apenas para o destino
    cp -af "$srcfile" "$destfile" # Copia o arquivo
  fi
done

# Garante que o chaveiro está inicializado corretamente
pacman-key --init
