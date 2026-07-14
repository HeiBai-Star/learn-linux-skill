# Linux Placement and Mastery Assessment

Use this reference only for initial placement, review gates, or an explicit assessment. Let the learner answer “I do not know.” Prefer one question at a time or a small related batch. Do not execute state-changing commands during placement.

## Mastery levels

- **Recognition:** Identify a command, object, or concept and describe its broad purpose.
- **Prediction:** Predict the important output or state change before execution.
- **Composition:** Combine commands or concepts to complete a bounded task and explain the data or control flow.
- **Troubleshooting:** Gather evidence, isolate a layer, test a hypothesis, and verify a repair.

Record demonstrated evidence rather than confidence alone. Treat copied commands without explanation as `unverified`.

## Placement prompts

1. Which facts should you check before running an unfamiliar command on a host?
2. After `cd /tmp`, `mkdir demo`, `cd demo`, and `touch report.txt`, where is the file and why?
3. What is the difference between an absolute path and a relative path?
4. What changes when `>` is replaced by `>>`?
5. In `grep ERROR app.log | wc -l`, what does the second command receive when there are no matching lines?
6. Interpret `-rwxr-x---` for owner, group, and others. How does directory execute permission differ from file execute permission?
7. What is the operational difference between a normal termination signal and `kill -9`?
8. Why can `df` and `du` disagree?
9. What is the difference between a service being active and enabled?
10. Why does a successful `ping` not prove that an HTTP service works?
11. Review `sudo chmod -R 777 /var/www`: what is its scope, risk, and a safer verification-first approach?
12. What evidence would you gather before changing a service that appears unavailable?

## Routing

- Map prompts 1-3 to Modules 0-2, prompts 4-5 to Module 3, prompt 6 to Module 4, prompt 7 to Module 5, prompt 8 to Module 6, prompt 9 to Module 8, prompts 10 and 12 to Modules 9-10, and prompt 11 to command safety across all modules.
- Start at the earliest mapped module the learner cannot explain or verify independently.
- Advance through ordinary modules when the learner demonstrates at least `prediction` and passes the safe practice.
- Require `composition` at the foundation review gate and `troubleshooting` at the operations and deployment review gates.
- Reassess only weak areas; do not repeat the entire placement set by default.
