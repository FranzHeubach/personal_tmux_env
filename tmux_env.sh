#! /bin/bash


# customize these environment variables
SESSIONNAME="python_dev"

PYTHONENV_LEFT="~/python_env/bin/activate"
PYTHONENV_RIGHT="~/python_env/bin/activate"

WDIR_LEFT="~"
WDIR_RIGHT="~/Desktop"

FILE_LEFT="~/something.txt"
FILE_RIGHT="~/somethingtwo.txt"

EDITOR="vim"

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
    then
        tmux new-session -s $SESSIONNAME -n file_edit -d
        tmux send-keys -t $SESSIONNAME "source $PYTHONENV_LEFT" Enter
        tmux send-keys -t $SESSIONNAME "cd $WDIR_LEFT" Enter
        tmux send-keys -t $SESSIONNAME "clear" Enter
        tmux send-keys -t $SESSIONNAME "vim $FILE_LEFT" Enter

        tmux split-window -v
        tmux send-keys -t $SESSIONNAME "source $PYTHONENV_LEFT" Enter
        tmux send-keys -t $SESSIONNAME "cd $WDIR_LEFT" Enter
        tmux send-keys -t $SESSIONNAME "clear" Enter
        tmux select-pane -U -t $SESSIONNAME

        tmux split-window -h
        tmux send-keys -t $SESSIONNAME "source $PYTHONENV_RIGHT" Enter
        tmux send-keys -t $SESSIONNAME "cd $WDIR_RIGHT" Enter
        tmux send-keys -t $SESSIONNAME "clear" Enter
        tmux send-keys -t $SESSIONNAME "vim $FILE_RIGHT" Enter

        tmux select-pane -D -t $SESSIONNAME
        tmux resize-pane -D -t $SESSIONNAME 15

        tmux split-window -h
        tmux send-keys -t $SESSIONNAME "source $PYTHONENV_RIGHT" Enter
        tmux send-keys -t $SESSIONNAME "cd $WDIR_RIGHT" Enter
        tmux send-keys -t $SESSIONNAME "clear" Enter
fi

tmux attach -t $SESSIONNAME
