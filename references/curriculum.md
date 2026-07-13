# Linux Beginner Curriculum

Use this roadmap only for structured learning or when choosing the next lesson. Prefer the earliest module the learner cannot yet complete independently. Keep each lesson small and verify understanding through one safe exercise.

## 0. Safety and orientation

- Distinguish read-only, state-changing, and destructive commands.
- Understand the prompt, current user, host, shell, and exit status.
- Practice: inspect `whoami`, `pwd`, `uname -srm`, and `$?`.

## 1. Paths and files

- Learn absolute and relative paths, `.`, `..`, and the home directory.
- Use `pwd`, `ls`, `file`, `stat`, `mkdir`, `cp`, and `mv` in a practice directory.
- Practice: create and organize a harmless directory tree.

## 2. Reading text and shell composition

- Use `less`, `sed`, `rg` or `grep`, pipes, and redirection.
- Learn quoting, globbing, standard input, output, and error.
- Practice: filter a small sample log without changing it.

## 3. Users and permissions

- Understand owner, group, mode bits, and least privilege.
- Use `id`, `ls -l`, `chmod`, and `chown` in a practice directory.
- Practice: predict access before making a narrow permission change.

## 4. Processes and resources

- Understand processes, PIDs, CPU, memory, disk, and swap.
- Use `ps`, `top` or `htop`, `free`, `df`, `du`, and `lsblk`.
- Practice: identify one process and explain its resource columns.

## 5. Packages

- Detect the distribution and package manager before giving commands.
- Learn search, install, update, and removal concepts without performing changes automatically.
- Practice: search for a package and inspect its metadata.

## 6. Services and logs

- Detect the init system; use `systemctl` only on systemd hosts.
- Learn status, enablement, startup, failure, and bounded logs.
- Practice: inspect one service and explain `Loaded`, `Active`, and recent messages.

## 7. Networking

- Learn addresses, routes, DNS, listening sockets, firewalls, and HTTP ports.
- Use `ip`, `ss`, `curl`, and the detected firewall tooling.
- Practice: map a listening socket to its process and exposure scope.

## 8. Bash scripting

- Learn variables, quoting, tests, loops, functions, exit codes, and dry-run behavior.
- Add `set -euo pipefail` only after explaining its tradeoffs.
- Practice: build a read-only health-check script.

## 9. Containers

- Learn images, containers, ports, volumes, networks, logs, and Compose.
- Verify whether Docker or another runtime exists before using it.
- Practice: run a small local-only container, inspect it, and remove it after approval.

## 10. Small deployment

- Combine directories, permissions, services or Compose, logs, backups, and networking.
- Add reverse proxy and HTTPS only after the local service works.
- Practice: deploy one lightweight project with a rollback note and resource check.

## Advancement rule

Move forward when the learner can explain the command's purpose, predict its main output, and complete the safe exercise with little help. Revisit a module when the learner can copy commands but cannot yet interpret the result.
