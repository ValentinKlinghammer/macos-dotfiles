#!/bin/bash
# ionic-desk.sh
#
# Description: Desk for working on Ionic projects
# First argument is working directory
# Second argument is project name
FOLDER="$HOME/work/web/mm-botanical-log";
NAME="mm-botanical";

function startNewSession {
  cd $FOLDER;

  tmux new-session -s $NAME -d 'sudo htop;bash --login'
  tmux split-window -h -p 50 'vim;bash --login'
  tmux split-window -v -p 50 -t 0 'git status;bash --login'
  tmux split-window -v -p 50 -t 0 'bundle exec middleman;bash --login'
  tmux resize-pane -t 0 -x 80
  tmux select-pane -t 1
  tmux -2 attach-session -d
}

# Resume session by name or start new session
tmux attach -t $NAME || startNewSession;
