#!/bin/bash
jira issue list -q"assignee=$USER AND status!=closed" --plain | fzf | cut -f 2 | xargs jira open
