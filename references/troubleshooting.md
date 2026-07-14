# Evidence-First Linux Troubleshooting

Use only the playbook that matches the current symptom. Adapt commands to the detected host and keep output bounded. A diagnostic sequence is a hypothesis tree, not a ritual checklist.

## Common workflow

1. Define the intended state and exact failure.
2. Record when it started, its scope, and the latest relevant change.
3. Classify the first likely layer: shell or command, path or permission, process or service, storage, network or application.
4. Gather the smallest read-only evidence that can distinguish two plausible causes.
5. State the supported hypothesis and remaining uncertainty.
6. Propose a minimal reversible repair, obtain approval, and verify the original success condition.

## Command or script failure

- Capture the exact command, shell, exit status, and short stderr excerpt.
- Check command availability and local help before assuming package installation is required.
- Inspect quoting, variable expansion, globbing, redirection, pipelines, paths, and privilege.
- For Bash, use `bash -n` for syntax and an available linter when useful.
- Never request environment dumps, credential files, or unredacted secrets.

## Path or permission failure

- Verify the current user, target path, ownership, mode, parent-directory traversal, and whether the filesystem is read-only.
- Consider ACLs or mandatory access controls only when basic ownership and mode do not explain the evidence.
- Distinguish missing path, wrong path, insufficient permission, and incorrect privilege.
- Avoid broad recursive permission or ownership changes as a first response.

## Process or service failure

- Detect the init system; do not assume systemd.
- Inspect process existence, bounded service status, recent logs, configuration validation, dependencies, and listening sockets.
- Distinguish active from enabled and a running process from a healthy application.
- Do not restart merely to collect evidence. Validate configuration before an approved reload or restart.

## Storage failure

- Check capacity and inode use, then inspect only the relevant filesystem or directory tree.
- Compare filesystem-level and file-level accounting; consider deleted-but-open files when evidence supports it.
- Inspect logs, caches, container storage, and backups with bounded depth.
- Do not respond to a full disk with unscoped deletion. Identify ownership, retention, backup, and recovery first.

## Network or HTTP failure

- Clarify whether the target is a hostname or IP and capture the client-visible error.
- Check name resolution, local addresses and routes, the target process and bind address, a loopback request, host firewall, cloud firewall, and application logs as relevant.
- Treat `ping` as optional evidence; it can fail while the application works or succeed while the application is broken.
- Distinguish connection refused, timeout, DNS failure, TLS failure, and an HTTP error response.
- Do not open a public port until the local service is healthy and the exposure scope is explicitly approved.

## Verification

- Re-run the original success check after an approved repair.
- Check the changed component and one likely side effect.
- Classify the result as `passed`, `partially passed`, `failed`, or `unverified`.
- If unresolved, preserve evidence and revise the hypothesis instead of stacking unrelated changes.
