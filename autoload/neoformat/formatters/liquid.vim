function! neoformat#formatters#liquid#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#liquid#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['-s 4', '-q'],
        \ 'stdin': 1
        \ }
endfunction
