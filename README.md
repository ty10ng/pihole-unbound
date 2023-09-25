# Pi-hole & Unbound with Docker Compose

## Introduction

[Pihole](https://pi-hole.net/) is a network-level ad blocker, which means it blocks ads at the DNS level. This approach allows Pi-hole to block ads in non-traditional places such as in videos, apps, and websites with hardcoded ads. 

[Unbound](https://www.nlnetlabs.nl/projects/unbound/about/) is a lightweight, recursive DNS resolver. In this setup, Pi-hole handles the blocking of ads and tracking domains, while Unbound resolves any other DNS queries. 

This combo provides a powerful privacy solution for your home network, blocking unwanted content and ensuring your DNS queries are private and secure.

## Why is this needed?

Many internet users are aware of browser-based ad blockers, but these tools only work at the browser level. Pi-hole works at the network level, meaning it can block ads for all devices on your network, including IoT devices, mobile apps, and more. When combined with Unbound, your DNS queries stay within your local network, providing additional privacy.

## Running on a Raspberry Pi

A Raspberry Pi is an affordable and efficient solution for running services like Pi-hole and Unbound:

1. **Energy Efficiency**: Raspberry Pi devices consume minimal power, making them ideal for running 24/7.
2. **Affordability**: A Raspberry Pi can be purchased for relatively low cost.
3. **Performance**: For home network usage, a Raspberry Pi (even models 3 and up) provides sufficient processing power to run both Pi-hole and Unbound smoothly.

To run this setup on a Raspberry Pi:

1. Install Docker and Docker Compose on the Raspberry Pi.
2. Clone this repository onto the Pi.
3. Follow the setup instructions below.

## Gotchas and Other Considerations
### Network Mode: Host

> **Note**: The `network_mode: host` setting for the PiHole docker container is needed for PiHole to associate FQDNs to each request. If you have an alternative way to do this, please let me know. 

In a standard Docker setup, services communicate through an internal Docker network. If Pi-hole were to use this internal network, all DNS requests would appear to come from a single internal Docker IP address. This would prevent Pi-hole from providing meaningful client-based metrics and would make it hard to discern which device on your network made which request.

By using `network_mode: host`, Pi-hole operates on the host's network stack and can therefore see the true IP address of each device making a DNS request. This not only provides better metrics but also allows for more granular control, such as setting up specific blocklists or allowlists for individual devices.

## Project Structure

- `docker-compose.yml`: Contains the Docker Compose configuration for Pi-hole and Unbound services.
- `pihole/`: Directory containing Pi-hole's configuration files.
  - `etc-pihole/`: Configuration directory for Pi-hole.
  - `etc-dnsmasq.d/`: Additional dnsmasq configuration for Pi-hole.
- `unbound/`: Directory containing Unbound's configuration files.
  - `unbound.conf`: Main Unbound configuration file.
  - `unbound_zones/`: Directory for Unbound's zone files (if any).

## Setup and Usage

1. **Clone the Repository**:
    ```bash
    git clone [your-repository-url] pihole-unbound-setup
    cd pihole-unbound-setup
    ```

2. **Configure Environment**:
    If `.env` file does not exist in the directory, run `./run_docker_compose.sh` to prompt for necessary environment variables (like `PIHOLE_PASSWORD` and `LOCAL_IPV4_ADDRESS`). This will create an `.env` file with your inputs.

3. **Run with Docker Compose**:
    Use the provided shell script:
    ```bash
    ./run_docker_compose.sh up -d
    ```

4. **Access Pi-hole Admin Console**:
    Access the Pi-hole admin console through `http://[YOUR_HOST_IP]/admin`.

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check issues page if you want to contribute.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
