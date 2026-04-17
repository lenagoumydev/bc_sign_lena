#!/bin/bash
 
git_commit() {
    echo "What is your commit message ?"
    read commit_message
    if [ -z "$commit_message" ]; then
        echo "No answer has been given, aborting the git commit process …"
        exit 1
    fi
    # Commit sur la branche dev uniquement
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    if [ "$current_branch" != "dev" ]; then
        echo "You are not on the dev branch. Please switch to dev before committing."
        exit 1
    fi
 
    git add .
    git commit -m "$commit_message"
    git push origin dev

}
 
git_commit

 
