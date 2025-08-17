# 📊 System Info Dashboard

A lightweight, static system information dashboard built with **Bash**, **HTML**, **CSS**, and **JavaScript**, designed for **local hosting using Nginx**. It displays real-time system stats such as CPU model, memory usage, disk usage, IP address, and OS version.

The dashboard auto-refreshes every 60 seconds and is synchronized with the system clock using JavaScript — perfectly aligned with a cron job that regenerates it every minute.

---

## 🖥️ Screenshot

<img width="580" height="451" alt="screenshot" src="https://github.com/user-attachments/assets/88c63660-a5dc-4e81-9866-a2edebe84a90" />

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
