#!/usr/bin/env bash

# Read-only, bounded Linux inspection for teaching and troubleshooting.
# Do not exit on a missing optional command; partial evidence is still useful.
set -u
export LC_ALL=C

mode=${1:-all}

section() {
  printf '\n[%s]\n' "$1"
}

have() {
  command -v "$1" >/dev/null 2>&1
}

system_info() {
  section system
  printf 'kernel: '
  uname -srm
  if [[ -r /etc/os-release ]]; then
    printf 'os: '
    sed -n 's/^PRETTY_NAME=//p' /etc/os-release | sed -n '1{s/^"//; s/"$//; p;}'
  fi
  printf 'init: '
  ps -p 1 -o comm= 2>/dev/null || printf 'unknown\n'
  printf 'user: '
  id 2>/dev/null || true
  if have uptime; then
    uptime -p 2>/dev/null || uptime
  fi
}

resource_info() {
  section resources
  if have nproc; then
    printf 'cpus: %s\n' "$(nproc)"
  fi
  if have free; then
    free -h | sed -n '1,3p'
  fi
  if have df; then
    if df -h -x tmpfs -x devtmpfs >/dev/null 2>&1; then
      df -h -x tmpfs -x devtmpfs | sed -n '1,12p'
    else
      df -h | sed -n '1,12p'
    fi
  fi
  if have swapon; then
    swapon --show 2>/dev/null | sed -n '1,8p'
  fi
}

service_info() {
  section services
  if have systemctl; then
    printf 'system-state: '
    systemctl is-system-running 2>/dev/null || true
    printf 'failed-units:\n'
    systemctl --failed --no-legend --no-pager 2>/dev/null | sed -n '1,20p'
    printf 'running-services (first 20):\n'
    systemctl list-units --type=service --state=running --no-legend --no-pager 2>/dev/null | sed -n '1,20p'
  else
    printf 'systemctl not found; top processes:\n'
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu 2>/dev/null | sed -n '1,12p'
  fi
}

network_info() {
  section network
  if have ip; then
    ip -brief address 2>/dev/null | sed -n '1,20p'
    printf 'routes:\n'
    ip route 2>/dev/null | sed -n '1,20p'
  fi
  printf 'listening-sockets (first 25):\n'
  if have ss; then
    ss -lntup 2>&1 | sed -n '1,25p'
  elif have netstat; then
    netstat -lntup 2>&1 | sed -n '1,25p'
  else
    printf 'ss and netstat not found\n'
  fi
}

docker_info() {
  section docker
  if have docker; then
    docker --version 2>&1 | sed -n '1,2p'
    docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}' 2>&1 | sed -n '1,20p'
  else
    printf 'docker: not installed or not on PATH\n'
  fi
}

case "$mode" in
  system) system_info ;;
  resources) resource_info ;;
  services) service_info ;;
  network) network_info ;;
  docker) docker_info ;;
  all)
    system_info
    resource_info
    service_info
    network_info
    docker_info
    ;;
  *)
    printf 'Usage: %s {system|resources|services|network|docker|all}\n' "$0" >&2
    exit 2
    ;;
esac
