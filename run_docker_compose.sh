#!/bin/bash

# Path to the .env file
ENV_FILE=".env"

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
    # If .env doesn't exist, prompt for variables and create it
    echo "Creating $ENV_FILE..."

    # Prompt for PIHOLE_PASSWORD
    read -p "Enter value for PIHOLE_PASSWORD: " pihole_password
    echo "PIHOLE_PASSWORD=$pihole_password" >> $ENV_FILE

    # Prompt for LOCAL_IPV4_ADDRESS
    read -p "Enter value for LOCAL_IPV4_ADDRESS: " local_ipv4
    echo "LOCAL_IPV4_ADDRESS=$local_ipv4" >> $ENV_FILE

    echo "$ENV_FILE created."
else
    echo "$ENV_FILE already exists."
fi

# Run docker-compose
docker compose $@
