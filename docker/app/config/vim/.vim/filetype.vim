augroup filetypedetect
    au BufRead, BufNewFile *.go setfiletype golang
    au BufRead, BufNewFile *.sh setfiletype shell
augroup END