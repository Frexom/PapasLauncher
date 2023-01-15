_papas_completion() {
    local argc cur opts;

    #Auto-completion anwser
    COMPREPLY=();

    #Current arg index
    argc=${COMP_CWORD};

    #Current arg word
    cur="${COMP_WORDS[argc]}"

    case $argc in
        1)
            opts="run random"
        ;;

        2)
            #For each game in directory
            Games="$HOME/PapasLauncher/games/*"
            for file in $HOME/PapasLauncher/games/*
            do
                filename=$(basename $file .swf)
                opts+="$filename "
            done
        ;;
esac

    #Send
    COMPREPLY=( $(compgen -W "$opts" -- $cur ) )
}
complete -F _papas_completion papas;
