" -----------------------------------------------------------------------------
" Filedetect stuff
" -----------------------------------------------------------------------------

augroup filetypedetect
	au! BufRead,BufNewFile *.vm,*.velocity setfiletype velocity
augroup END

