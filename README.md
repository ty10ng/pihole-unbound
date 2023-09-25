# Pi-hole & Unbound with Docker Compose

This project sets up [Pi-hole](https://pi-hole.net/) and [Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) using Docker Compose. Pi-hole acts as a network-wide ad blocker, while Unbound serves as a recursive DNS resolver.

## Project Structure

- `docker-compose.yml`: Contains the Docker Compose configuration for Pi-hole and Unbound services.
- `pihole/`: Directory containing Pi-hole's configuration files.
  - `etc-pihole/`: Configuration directory for Pi-hole.
  - `etc-dnsmasq.d/`: Additional dnsmasq configuration for Pi-hole.
- `unbound/`: Directory containing Unbound's configuration files.
  - `unbound.conf`: Main Unbound configuration file.
  - `unbound_zones/`: Directory for Unbound's zone files (if any).

## Setup and Usage

1. **Clone the Repository**

2. **Configure Environment**:

    If `.env` file does not exist in the directory, run `./run_docker_compose.sh` to prompt for necessary environment variables (like `PIHOLE_PASSWORD` and `LOCAL_IPV4_ADDRESS`). This will create an `.env` file with your inputs.

3. **Run with Docker Compose**:

    Use the provided shell script:

    ```bash
    ./run_docker_compose.sh up -d
    ```

    This will start the services in detached mode.

4. **Access Pi-hole Admin Console**:

    You can access the Pi-hole admin console through your browser at `http://[YOUR_HOST_IP]/admin`.

## Notes

- Ensure that `LOCAL_IPV4_ADDRESS` specified in the `.env` file is the host's primary IPV4 address to ensure proper DNS forwarding from Pi-hole to Unbound.

## Contributing

Feel free to submit issues or pull requests if you have suggestions or improvements for this setup.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

