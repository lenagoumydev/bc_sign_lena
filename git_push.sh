#!/bin/bash


###############################
# A EXECUTER POUR PUSHER     #
##############################




git_push() {

  # Vous stockez le résultat de la commande dans une variable CURRENT_BRANCH 
  # Très bien car vous allez pouvoir ainsi savoir si vous êtes bien sur la branche dev
  
  CURRENT_BRANCH=$(git branch --show-current)


  
  if [ "$CURRENT_BRANCH" != "dev" ]; then
    echo "You must be on the master branch to execute this script."
    exit 1
  fi

  read -p "To which branch do you want to push the commit ? " BRANCH
  read -p "What is your commit message before pushing it to the Internet ? " MESSAGE

  if [ -z "$BRANCH" ] || [ -z "$MESSAGE" ]; then
    echo "No answer has been given, aborting the git push process ..."
    exit 1
  fi

  if [ "$BRANCH" != "dev" ]; then
    echo "You are only allowed to push to the master branch."
    exit 1
  fi

  git add .
  git commit -m "$MESSAGE"
  git push origin master

  echo "✅ Commit and push to master completed successfully."
}

git_push
