#!/bin/bash

# Step 1: Create the user 'vjudge'
sudo useradd -m vjudge

# Step 2: Set a password for the user 'vjudge' (will prompt for password input)
echo "Please set a password for user vjudge:"
sudo passwd vjudge

# Step 3: Block access to search engines and ChatGPT for the 'vjudge' user
echo "Blocking access to search engines and ChatGPT for user vjudge..."

# Block Google Search (search.google.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 search.google.com" >> /etc/hosts'

# Block ChatGPT (chat.openai.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 chat.openai.com" >> /etc/hosts'

# Block Brave Search (search.brave.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 search.brave.com" >> /etc/hosts'

# Block DuckDuckGo (duckduckgo.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 duckduckgo.com" >> /etc/hosts'

# Block Bing (bing.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 bing.com" >> /etc/hosts'

# Block Yahoo (search.yahoo.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 search.yahoo.com" >> /etc/hosts'

# Block Ecosia (ecosia.org) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 ecosia.org" >> /etc/hosts'

# Block Startpage (startpage.com) by modifying /etc/hosts
sudo bash -c 'echo "127.0.0.1 startpage.com" >> /etc/hosts'

# Step 4: Block IP ranges associated with these services using iptables
# Block Google IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 172.217.0.0/16 -j REJECT
# Block OpenAI ChatGPT IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 104.18.0.0/16 -j REJECT
# Block Brave IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 104.18.0.0/16 -j REJECT
# Block DuckDuckGo IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 185.45.32.0/22 -j REJECT
# Block Bing IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 13.107.21.0/24 -j REJECT
# Block Yahoo IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 98.137.246.8 -j REJECT
# Block Ecosia IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 185.77.232.0/22 -j REJECT
# Block Startpage IP range
sudo iptables -A OUTPUT -m owner --uid-owner vjudge -d 185.60.216.0/22 -j REJECT

echo "User 'vjudge' has been created and access to multiple search engines has been blocked."

# Step 5: Confirm everything
echo "User vjudge created with restricted access to search engines and ChatGPT."
