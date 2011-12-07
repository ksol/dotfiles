autoload -U colors
colors
cn="%{$reset_color%}"
cr="%{$fg[red]%}"
cg="%{$fg[green]%}"

export RPROMPT="[${cr}%~${cn}]"

# Function used to find the .git folder

function findup()
{
	arg="$1"
	if test -z "$arg"; then exit 1; fi

	while ! test -e "$arg"; do
	 cd ..
	 if test "$PWD" = "/"; then
	    exit 1
	 fi
	done

	echo $PWD/$arg	
}

# Sets the prompt

function precmd()
{
    # Adjust this to your current preferred prompt
    PROMPT="[%n${cg}@${cn}%m]"
    local _git _branch

    _git=`findup .git`

    if test -n "$_git"; then
        _branch=`sed -e 's,.*/,,' $_git/HEAD`
        PROMPT="$PROMPT [${cg}$_branch${cn}]"
    fi

    # Add final character after the optional git branch (usually # or >)
    export PROMPT="$PROMPT ${cr}%(!.#.$)${cn} "
}