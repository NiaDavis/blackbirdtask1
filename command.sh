# Contents of command.sh
#!/bin/bash

# Step 1: Create React App
npx create-react-app my-react-app
cd my-react-app

# Step 2: Commit the code and create a GitHub repository using GitHub CLI
git init
git add .
git commit -m "Initial commit"
gh repo create my-react-app --public --source=. --remote=origin
git push -u origin master

# Step 3: Switch branch to “update_logo”
git checkout -b update_logo

# Step 4: Replace the existing logo and link
curl -o src/logo.svg https://www.propelleraero.com/wp-content/uploads/2021/05/Vector.svg
sed -i 's,https://reactjs.org,https://www.propelleraero.com/dirtmate,g' src/App.js

# Step 5: Commit the changes
git add src/logo.svg src/App.js
git commit -m "Update logo and link"

# Step 6: Push the code
git push -u origin update_logo

# Step 7: Create a Pull Request from “update_logo” to “master” branch using GitHub CLI
gh pr create --base master --head update_logo --title "Update logo and link" --body "This PR updates the logo and link in the application."

# Step 8: Merge the PR using GitHub CLI
gh pr merge update_logo --squash --delete-branch