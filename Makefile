# Define the default target
default: ansible-setup ansible-collections run-playbook

# Target for running the setup script
ansible-setup:
	@echo "Running ansible setup script..."
	@bash scripts/ansible_setup.sh

# Target for installing or updating Ansible packages
ansible-collections:
	@echo "Running Ansible packages script..."
	@bash scripts/ansible_collections.sh

# Target for executing the Ansible playbook
run-playbook:
	@echo "Running Ansible playbook..."
	@ansible-playbook playbooks/install_playbook.yaml

.PHONY: default ansible-setup ansible-collections run-playbook
