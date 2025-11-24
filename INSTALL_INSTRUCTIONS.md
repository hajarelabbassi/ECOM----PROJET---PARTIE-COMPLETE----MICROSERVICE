# Installation Instructions for Node.js and Angular CLI

## Step 1: Install Node.js (includes npm)

Open PowerShell as Administrator and run:

```powershell
winget install OpenJS.NodeJS
```

Or if you want the LTS version specifically:

```powershell
winget install OpenJS.NodeJS.LTS
```

**Note:** If winget asks for confirmation, type `Y` and press Enter.

## Step 2: Restart PowerShell

After installation, **close and reopen PowerShell** (or restart your terminal) so that the PATH environment variable is updated.

## Step 3: Verify Node.js and npm Installation

In your new PowerShell window, run:

```powershell
node --version
npm --version
```

You should see version numbers. If you get errors, the PATH hasn't updated yet - try restarting PowerShell again.

## Step 4: Install Angular CLI Globally

Once Node.js is working, install Angular CLI globally:

```powershell
npm install -g @angular/cli
```

This may take a few minutes to download and install.

## Step 5: Verify Angular CLI Installation

Check if Angular CLI is installed:

```powershell
ng version
```

## Alternative: If winget doesn't work

If winget is not available or doesn't work, you can download Node.js directly:

1. Go to https://nodejs.org/
2. Download the LTS version (Windows Installer .msi)
3. Run the installer
4. Restart PowerShell
5. Then run: `npm install -g @angular/cli`


