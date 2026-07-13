# Linux Beginner Curriculum

Use this roadmap only for structured learning, placement, or next-lesson selection. Start at the earliest module the learner cannot pass independently. Keep each lesson to one concept and normally no more than three commands. Detect the host before choosing distribution-specific tools.

For every lesson, state the outcome, label commands as read-only or state-changing, run one safe practice, verify the resulting state, and apply the Practice Review Loop from `SKILL.md`. Use the learner's language.

## Learning routes

- **Foundation:** Modules 0-4.
- **Server operations:** Modules 5-10.
- **Automation and deployment:** Modules 11-13.
- Do not skip a prerequisite merely because the learner can copy its commands. Allow experienced learners to pass a module through its verification exercise.

## 0. Safety and environment orientation

- **Outcome:** Identify the current user, host, working directory, shell, operating system, kernel, init system, and privilege level.
- **Concepts:** Prompt, command, output, exit status, read-only action, state change, destructive action, and least privilege.
- **Safe practice:** Inspect the environment with bounded commands such as `whoami`, `pwd`, and `uname -srm`; introduce `$?` after a harmless command.
- **Verification:** Ask the learner to classify example commands by risk and explain what the observed host facts mean.
- **Pass criteria:** Independently identify the execution context and request confirmation before a state-changing action.

## 1. Terminal use and getting help

- **Outcome:** Run, edit, interrupt, and investigate commands without guessing blindly.
- **Concepts:** Command name, options, arguments, quoting, Tab completion, command cancellation, built-ins, `--help`, `help`, and `man`.
- **Safe practice:** Find one option in local help, correct one harmless malformed command, and interrupt a harmless foreground command.
- **Verification:** Ask the learner to distinguish a command, option, and argument and locate authoritative local help.
- **Pass criteria:** Obtain help and correct a simple command error with little assistance.

## 2. Paths, files, and directories

- **Outcome:** Navigate and organize files safely using absolute and relative paths.
- **Concepts:** `/`, home, `.`, `..`, hidden files, file types, metadata, links, and path expansion.
- **Safe practice:** Build and organize a disposable tree under a confirmed practice directory using tools such as `pwd`, `ls`, `mkdir`, `touch`, `cp`, `mv`, `file`, and `stat`.
- **Verification:** Inspect the resulting tree and ask the learner to predict each source and destination before a copy or move.
- **Pass criteria:** Resolve paths correctly, verify targets before changes, and modify only the practice tree.

## 3. Reading text, search, pipes, and redirection

- **Outcome:** Inspect and transform text without accidentally overwriting important files.
- **Concepts:** Standard input, output, error, pipes, redirection, quoting, globbing, regular expressions, and pagination.
- **Safe practice:** Read and filter a small sample log using available tools such as `less`, `sed`, `rg` or `grep`, `head`, `tail`, `wc`, and a pipeline.
- **Verification:** Ask the learner to explain what each pipeline stage receives and emits; verify created practice output before replacement redirection.
- **Pass criteria:** Build a simple pipeline, explain its data flow, and distinguish `>`, `>>`, and a pipe.

## 4. Users, groups, permissions, and privilege

- **Outcome:** Explain and safely adjust access within a practice directory.
- **Concepts:** UID, GID, owner, group, mode bits, symbolic and numeric modes, umask, `sudo`, and least privilege.
- **Safe practice:** Inspect identity and permissions with `id`, `ls -l`, or `stat`, then make one narrow permission change only inside the practice directory after approval.
- **Verification:** Ask the learner to predict read, write, and execute access before and after the change.
- **Pass criteria:** Interpret a permission string, choose a minimal mode, and explain why broad modes such as `777` are usually unsafe.

## 5. Processes, jobs, and system resources

- **Outcome:** Identify processes and explain CPU, memory, load, uptime, and swap observations.
- **Concepts:** PID, parent process, foreground and background jobs, signals, CPU time, memory, load average, and resource pressure.
- **Safe practice:** Inspect processes and resources with bounded views from `ps`, `top` or an equivalent, `free`, and `uptime`; optionally manage only a learner-created harmless process.
- **Verification:** Ask the learner to identify one process, its owner, resource columns, and the safest way to stop it.
- **Pass criteria:** Distinguish normal observations from likely pressure and target a process by verified PID rather than guesswork.

## 6. Storage, archives, backups, and recovery

- **Outcome:** Explain storage usage and create and verify a recoverable backup of practice data.
- **Concepts:** Filesystems, mounts, block devices, capacity, inodes, directory size, archives, compression, checksums, backup, and restore.
- **Safe practice:** Inspect with `df`, `du`, and `lsblk`, then archive a practice directory and restore it to a separate location.
- **Verification:** Compare the original and restored practice data with metadata, checksums, or a recursive comparison.
- **Pass criteria:** Locate disk usage, explain the difference between `df` and `du`, and demonstrate a verified restore.

## 7. Package management

- **Outcome:** Find the correct package tool and explain search, install, update, and removal safely.
- **Concepts:** Distribution repositories, package metadata, dependencies, cache, upgrades, signatures, and package-manager differences.
- **Safe practice:** Detect the distribution and package manager, then search for and inspect one package without installing it by default.
- **Verification:** Ask the learner to identify the package source, proposed changes, and whether elevated privileges are required.
- **Pass criteria:** Choose the host's correct package manager and preview or explain a package change before approval.

## 8. Services, startup, and logs

- **Outcome:** Inspect a service, its startup behavior, and its recent bounded logs.
- **Concepts:** Init system, unit or service state, active versus enabled, dependencies, exit status, structured logs, and configuration validation.
- **Safe practice:** Detect the init system and inspect one existing service with read-only status and recent-log commands; do not restart it merely to practice.
- **Verification:** Ask the learner to explain loaded, active, enabled, PID, and the most relevant recent message.
- **Pass criteria:** Determine whether a service is healthy and gather useful evidence before proposing a change.

## 9. Networking, DNS, ports, and HTTP

- **Outcome:** Trace a local service from address and route through listening socket, DNS, and HTTP response.
- **Concepts:** Interface, IP address, subnet, route, DNS, TCP and UDP, loopback, bind address, port, firewall, cloud firewall, and HTTP status.
- **Safe practice:** Inspect bounded output from available tools such as `ip`, `ss`, `getent`, and `curl`; map one listening socket to its process and exposure scope.
- **Verification:** Ask the learner to distinguish `127.0.0.1`, a private address, and a wildcard bind and to identify every exposure control layer.
- **Pass criteria:** Explain whether a service is local-only or externally reachable without opening a port casually.

## 10. SSH and remote server administration

- **Outcome:** Connect to and inspect a remote host without exposing credentials or locking out access.
- **Concepts:** SSH client and server, public and private keys, host keys, `known_hosts`, configuration, sessions, file transfer, and recovery access.
- **Safe practice:** Inspect the current SSH context and safe client configuration or key permissions without displaying private-key content; teach `scp` or `rsync` with disposable data when available.
- **Verification:** Ask the learner to distinguish a public key from a private key and explain how to preserve a working session before configuration changes.
- **Pass criteria:** Use or describe key-based access safely, verify the target host, and plan rollback before changing SSH settings.

## 11. Bash scripting

- **Outcome:** Write and test a small read-only script with predictable inputs, output, and exit status.
- **Concepts:** Shebang, variables, quoting, positional parameters, tests, conditionals, loops, functions, exit codes, and error handling.
- **Safe practice:** Build a bounded health-check script; explain the tradeoffs of `set -euo pipefail` before using it.
- **Verification:** Run the script with expected and invalid input, inspect its exit status, and use `bash -n` or an available linter.
- **Pass criteria:** Explain every command in the script, handle one error path, and avoid unsafe expansion or destructive defaults.

## 12. Containers and Compose

- **Outcome:** Explain and safely operate images, containers, ports, volumes, networks, logs, and a small Compose application.
- **Concepts:** Image versus container, lifecycle, port publishing, bind mounts, named volumes, container networks, resource limits, and persistence.
- **Safe practice:** Verify the available runtime and host resources, then run a small local-only container, inspect it, and remove it only after approval.
- **Verification:** Use bounded runtime status, inspection, and logs to identify the image, bind scope, storage, and resource impact.
- **Pass criteria:** Predict what survives container removal and distinguish container isolation from firewall protection.

## 13. Small deployment, validation, and rollback

- **Outcome:** Deploy one lightweight project locally, validate it, observe it, and perform or clearly rehearse rollback.
- **Concepts:** Requirements, directory layout, configuration, least privilege, service or Compose lifecycle, health checks, logs, backups, rollback, reverse proxy, and HTTPS.
- **Safe practice:** Start local-only, validate configuration before reload, record the previous state, check resources, and add public exposure only after explicit approval.
- **Verification:** Confirm process or container state, listening scope, HTTP response, bounded logs, restart behavior when relevant, backup, and rollback steps.
- **Pass criteria:** Complete the deployment without unexplained commands and restore the previous known-good state or demonstrate a credible tested rollback.

## Review gates

- **Foundation gate after Module 4:** Organize a practice tree, inspect its contents, filter text, and explain its permissions without unsafe shortcuts.
- **Operations gate after Module 10:** Diagnose a supplied service problem using bounded process, storage, log, network, and SSH evidence before suggesting a change.
- **Deployment gate after Module 13:** Explain and verify the complete path from configuration to process, port, HTTP response, logs, backup, and rollback.

## Advancement rule

Use the Practice Review Loop result classification. Advance on `passed`. For `partially passed`, give one focused remedial exercise and verify again. For `failed` or `unverified`, do not silently advance; explain the missing evidence or concept and reduce the exercise scope.
