#!/bin/bash

# Output HTML file
OUTPUT="/var/www/project01/index.html"

# Gather system information
HOSTNAME=$(hostname)
CPU=$(lscpu | grep "Model name" | awk -F ':' '{print $2}' | sed 's/^[ \t]*//')
RAM=$(free -h | awk '/^Mem:/ { print $3 " / " $2 }')
DISK=$(df -h / | awk 'NR==2 { print $3 " / " $2 }')
IP=$(hostname -I | awk '{print $1}')
OS=$(lsb_release -ds)
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Generate the HTML
cat <<EOF > "$OUTPUT"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>System Info Dashboard</title>
    <meta http-equiv="refresh" content="60" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #283e51, #485563);
            color: #f1f1f1;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #1c1c1c;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
            width: 500px;
            max-width: 90%;
        }
        h1 {
            text-align: center;
            color: #00ffc3;
            margin-bottom: 20px;
        }
        .info {
            margin: 10px 0;
            font-size: 1.1rem;
        }
        .label {
            color: #00d0ff;
            font-weight: bold;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #888;
        }
        #refreshNote {
            font-size: 0.85em;
            margin-top: 10px;
            color: #ccc;
        }
        i {
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>System Info Dashboard</h1>
        <div class="info"><span class="label">Last Updated:</span> $DATE</div>
        <div class="info"><span class="label">Hostname:</span> $HOSTNAME</div>
        <div class="info"><span class="label">CPU:</span> $CPU</div>
        <div class="info"><span class="label">RAM:</span> $RAM</div>
        <div class="info"><span class="label">Disk:</span> $DISK</div>
        <div class="info">
            <span class="label">IP Address:</span>
            <span id="ip-value" style="letter-spacing: 2px;">••••••••••••</span>
            <i id="toggle-ip" class="fa-solid fa-eye" title="Show IP" style="margin-left: 10px;"></i>
        </div>
        <div class="info"><span class="label">Operating System:</span> $OS</div>

        <div id="refreshNote">Auto-refresh in <span id="countdown">60</span> seconds</div>
        <div class="footer">&copy; 2025 • System Dashboard</div>
    </div>

    <script>
        function getSecondsUntilNextMinute() {
            const now = new Date();
            return 60 - now.getSeconds();
        }

        let seconds = getSecondsUntilNextMinute();
        const countdown = document.getElementById('countdown');
        countdown.textContent = seconds;

        const interval = setInterval(() => {
            seconds--;
            if (seconds >= 0) countdown.textContent = seconds;
        }, 1000);

        let ipHidden = true;
        const ipValue = document.getElementById('ip-value');
        const toggleIcon = document.getElementById('toggle-ip');
        const actualIP = "$IP";

        toggleIcon.addEventListener('click', () => {
            if (ipHidden) {
                ipValue.textContent = actualIP;
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
                toggleIcon.title = "Hide IP";
            } else {
                ipValue.textContent = "••••••••••••";
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
                toggleIcon.title = "Show IP";
            }
            ipHidden = !ipHidden;
        });
    </script>
</body>
</html>
EOF

