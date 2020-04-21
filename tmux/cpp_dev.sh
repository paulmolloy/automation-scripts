#!/bin/bash
SESSIONNAME="cpp_dev"
tmux has-session -t $SESSIONNAME &> /dev/null
if [ $? != 0 ]
then
	tmux new -s $SESSIONNAME -d
fi

tmux attach -t $SESSIONNAME


