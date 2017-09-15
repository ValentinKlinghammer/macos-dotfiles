#!/bin/bash
# lesara-app.sh
#
# Description: Desk for working on the Sencha Touch project for Lesara
#

cd ~/work/cordova/sencha-lesara

# TODO Resume session
tmux new-session -s lesara -d 'sudo htop;bash --login'
tmux split-window -h -p 75 'vim;bash --login'
tmux split-window -v -p 50 -t 0 'git status;bash --login'
tmux split-window -v -p 50 -t 0 'sencha app watch;bash --login'
tmux select-pane -t 1
tmux -2 attach-session -d

