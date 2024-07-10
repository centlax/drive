
#!/bin/bash

# Check if the current directory is a Git repository
git rev-parse --is-inside-work-tree > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Error: The current directory is not a Git repository."
    exit 1
fi

# Get the current Git branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Prompt the user for a commit message
read -p "Enter a commit message: " commit_message

# Check if there are any changes to commit
if [ -z "$(git status --porcelain)" ]; then
    echo "Nothing to commit."
    exit 0
fi

# Add all changes to the staging area
git add .

# Create a new commit
git commit -m "$commit_message"

# Check if a remote repository is configured
if [ -z "$(git remote get-url origin)" ]; then
    read -p "No remote repository configured. Would you like to set one up? (y/n) " configure_remote
    if [ "$configure_remote" == "y" ]; then
        read -p "Enter the remote repository URL: " remote_url
        git remote add origin "$remote_url"
    else
        echo "Skipping remote repository setup."
        exit 0
    fi
fi

# Push the changes to the remote repository
read -p "Push changes to the remote repository? (y/n) " push_confirm
if [ "$push_confirm" == "y" ]; then
    git push -u origin "$current_branch"
else
    echo "Changes not pushed to the remote repository."
fi