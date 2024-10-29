# If we're not already inside screen
if [ -z "$STY" ]; then
    echo ""
    # Try to reconnect to screen session
    screen -r
fi
