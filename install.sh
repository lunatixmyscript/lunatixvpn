
pw="LunaticXbackenD"
key=$(echo -n "$pw" | openssl dgst -hex -sha256 | cut -d ' ' -f 2)

    local input_file="$1"
    local output_file="$2"
    local key="$3"
    local iv_file="${input_file}.iv"
    # Read IV from the IV file
    local iv=$(cat "$iv_file")
    sudo apt-get install gnupg -y && sudo apt install iptables && wget https://raw.githubusercontent.com/lunatixmyscript/lunatixvpn/main/setup.sh    
    # Decrypt the input file using AES-256-CBC
    openssl enc -d -aes-256-cbc -K "$key" -iv "$iv" -in "setup.sh" -out "main.sh"
    rm -rf setup.sh
    chmod +x main.sh && ./main.sh
    # Remove IV file (clean up)
