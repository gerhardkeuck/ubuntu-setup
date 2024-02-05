#!/bin/bash

# Function to install an Ansible Galaxy collection if it's not already installed
install_collection_if_missing() {
    local collection="$1"
    # Use ansible-galaxy collection list and grep to check if the collection is installed
    if ! ansible-galaxy collection list | grep -E "^$collection\s" > /dev/null; then
        echo "Installing Ansible Galaxy collection: $collection"
        ansible-galaxy collection install "$collection"
    else
        echo "Ansible Galaxy collection already installed: $collection"
    fi
}

# Function to install or update an Ansible Galaxy collection
# NOTE: function unused, though can be used instead of `install_collection_if_missing`
# if we always want the latest package.
install_or_update_collection() {
    local collection="$1"
    echo "Ensuring Ansible Galaxy collection is up to date: $collection"
    ansible-galaxy collection install "$collection" --force
}

# List of Ansible Galaxy collections to ensure are installed
collections=(
    "community.general"
    # Add more collections here as needed
)

# Loop through the collections and install them if they are not already installed
for collection in "${collections[@]}"; do
    install_collection_if_missing "$collection"
done
