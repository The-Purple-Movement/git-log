#!/bin/bash
# beyond-guestbook.sh
# A script to automate Beyond Guestbook commits

REPO_DIR="$HOME/beyond-guestbook"   # adjust this to your repo path
FILE="$REPO_DIR/thoughts.txt"

cd "$REPO_DIR" || exit 1

while true; do
    echo "🌌 Beyond Guestbook"
    echo "Enter your Name (GitHub username works best):"
    read NAME
    echo "Enter your Thought:"
    read THOUGHT

    # Append entry
    echo "$NAME | $THOUGHT" >> "$FILE"

    # Configure commit with this user's GitHub identity
    git config user.name "$NAME"
    echo "Enter your GitHub email (linked to commits):"
    read EMAIL
    git config user.email "$EMAIL"

    # Commit & push
    git add "$FILE"
    git commit -m "$NAME | $THOUGHT"
    git push origin main

    echo "✅ Commit pushed as $NAME <$EMAIL>!"
    echo "Press [Ctrl+C] to exit or wait for next entry..."
    echo ""
done
