# Personal Tmux Environment
Small script the start up of tmux pane splitting and python virtual environments. Good for running tests on one side and active project on the other. On github so I can download it quickly on a new machine.

# Use
Just replace the environment variables with the desired ones and run the script

SESSIONNAME - The name of the tmux session

PYTHONENV_LEFT - The path to the activate script to start python virtual environment for the left two panes
PYTHONENV_RIGHT - The path to the activate script to start python virtual environment for the right two panes

WDIR_LEFT - The working directory for the left two panes
WDIR_RIGHT - The working directory for the right two panes

FILE_LEFT - The file opened in vim on the left
FILE RIGHT - The file opened in vim on the right
