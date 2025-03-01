#!/bin/bash

# Step 1: Make a list of all the profile files on your system.
echo "Listing all profile files on your system..."
profile_files=(
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.profile"
  "/etc/profile"
  "/etc/bash.bashrc"
  "/etc/environment"
  "/etc/login.defs"
)

# Output the profile files
for file in "${profile_files[@]}"; do
  if [[ -f "$file" ]]; then
    echo "$file exists"
  else
    echo "$file does not exist"
  fi
done

# Step 2: Read the contents of each of these files, often they source extra scripts.
echo -e "\nReading the contents of each profile file:"
for file in "${profile_files[@]}"; do
  if [[ -f "$file" ]]; then
    echo "Contents of $file:"
    cat "$file"
    echo "--------------------------------"
  fi
done

# Step 3: Put a unique variable, alias, and function in each of those files.
echo -e "\nAdding unique variable, alias, and function in each profile file:"
unique_var="export MY_UNIQUE_VAR='HelloWorld'"
unique_alias="alias myalias='echo Custom Alias'"
unique_func="myfunc() { echo 'Custom Function Executed'; }"

for file in "${profile_files[@]}"; do
  if [[ -f "$file" ]]; then
    echo -e "\n# Custom Entries" >> "$file"
    echo "$unique_var" >> "$file"
    echo "$unique_alias" >> "$file"
    echo "$unique_func" >> "$file"
    echo "Added to $file"
  fi
done

# Step 4: Try several different ways to obtain a shell and verify the presence of variables, aliases, and functions.
echo -e "\nTry different shells to check for custom variables, aliases, and functions..."

# Launch different shells and check for presence of customizations
shells=("su" "su -" "ssh" "tmux" "gnome-terminal")
for shell in "${shells[@]}"; do
  echo -e "\nTesting $shell:"
  $shell -c "source ~/.bash_profile && source ~/.bashrc && echo \$MY_UNIQUE_VAR && type myalias && declare -f myfunc"
done

# Step 5: Order in which profile files are executed
echo -e "\nThe order in which these profile files are executed is typically as follows:"
echo -e "1. /etc/profile (system-wide settings)\n2. ~/.bash_profile (user-specific settings for login shells)\n3. ~/.bashrc (user-specific settings for interactive non-login shells)"
echo -e "4. /etc/bash.bashrc (system-wide settings for bash)\n5. ~/.profile (additional user-specific settings)"

# Step 6: Check if $HOME/.profile is affected by the existence of $HOME/.bash_profile
echo -e "\nDoes $HOME/.profile depend on $HOME/.bash_profile? Let's check if the environment behaves differently:"
if [[ -f "$HOME/.bash_profile" ]]; then
  echo "Since $HOME/.bash_profile exists, it will be sourced before $HOME/.profile in login shells."
else
  echo "$HOME/.bash_profile does not exist, so $HOME/.profile will be sourced for login shells."
fi
