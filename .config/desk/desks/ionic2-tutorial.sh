#!/bin/bash
# quadriga-circle.sh
#
# Description: Desk for working on the Laravel Homestead project "Quadriga Circle"
#

cd ~/work/cordova/ionic2-tutorial

# TODO Resume session by name?
tmux new-session -d 'sudo htop'
tmux split-window -h -p 50 -t 0 'git status;bash --login'
tmux select-pane -t 0
tmux split-window -v -p 50 'cd development && vagrant up && vagrant ssh'
tmux select-window -t 0
tmux select-pane -t 2
tmux -2 attach-session -d


# Start and open connection to Vagrant
# launch() {
  # cd development/
  # vagrant up && vagrant ssh
# }
