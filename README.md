# 📊 System Info Dashboard

A lightweight, static system information dashboard built with **Bash**, **HTML**, **CSS**, and **JavaScript**, designed for **local hosting using Nginx**. It displays real-time system stats such as CPU model, memory usage, disk usage, IP address, and OS version.

The dashboard auto-refreshes every 60 seconds and is synchronized with the system clock using JavaScript — perfectly aligned with a cron job that regenerates it every minute.

---

## 🖥️ Screenshot

> ![screenshot](screenshot.png)

---

## ✨ Features

- ✅ Fully static dashboard (no backend server required)
- ⏱️ Countdown timer synchronized to system clock
- 🔁 Auto-refreshes every 60 seconds
- 👁️ IP address visibility toggle with eye icon
- 📡 Real-time system info from:
  - `lscpu`
  - `free`
  - `df`
  - `hostname`
  - `lsb_release`

---

## 🛠️ Technologies Used

| Tool         | Purpose                         |
|--------------|---------------------------------|
| **Bash**     | System data collection & HTML generation |
| **HTML/CSS** | Page structure and styling      |
| **JavaScript** | Countdown timer + IP toggle   |
| **Nginx**    | Static file hosting             |
| **cron**     | Scheduled dashboard regeneration |

---

## 📦 File Structure

system-info-dashboard/
├── generate_dashboard.sh # Bash script to generate the dashboard
├── index.html # Generated dashboard file
├── README.md # You're reading it
└── screenshot.png # (Optional screenshot of your dashboard)
