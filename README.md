# ⚠️ WARNING: Intentionally Vulnerable Repository

> **DO NOT use any code from this repository in production.**

This repository contains **intentionally vulnerable** files across all 4 security scan categories for **Defender for DevOps (DfD) bug bash testing**.

## Scan Categories Covered

| Category | Files |
|----------|-------|
| **Code Scanning** | `code/vuln_app.py`, `code/vuln_app.js` |
| **IaC Scanning** | `iac/main.tf`, `iac/Dockerfile` |
| **Dependency Scanning** | `deps/requirements.txt`, `deps/package.json` |
| **Secret Scanning** | `secrets/.env.example`, `secrets/config.yaml` |

## Purpose

This repo exists solely for testing Microsoft Defender for DevOps security scanning capabilities. All vulnerabilities are deliberate.
