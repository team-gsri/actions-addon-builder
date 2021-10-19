# AddonBuilder Github action

This document describes how to use the `team-gsri/actions-addon-builder` Github action.

## Table of contents
* [Limitations](#requirements-and-limitations)
* [Installation](#installation)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Example](#example)

## Requirements and limitations

> **This action can only be used on Windows self-hosted runners** and requires a manual installation of the Arma 3 Tools with a valid Steam account in order for this action to work. This requires you to agree to the Steam EULA, Arma 3 EULA, and BI Tools EULA. **The Steam client must be running** during workflow execution for the action to work.

This action also requires Powershell 7+

## Installation

Before using this action you need to follow this procedure :
* Install Steam client
* Create an account on the Steam network, if needed
* Log on the Steam client and agree to the Steam EULA
* Download and install Arma 3 Tools using Steam client
* Launch the Arma 3 Tools and agree to BI Tools EULA
* Launch AddonBuilder in order to setup paths in the registry

We strongly encourage you to use 2FA with your Steam account.

## Inputs

### `source`

**Required.** Path to the source directory to pack, relative to repository root.

### `target`

**Required.** Path to a directory where AdonBuilder will put the pbo file, relative to the repository root.

### `includes`

**Required.** List of wildcards file patterns to pack in the pbo, separated by a semicolon.

### `flags`

**Optional.** Additional flags to pass to AddonBuilder. Separate multiple flags with commas.

## Outputs

*There is no output*

## Example

This example will pack content of `addons/gsri_opex` into `addons/gsri_opex.pbo` :

```yml
uses: team-gsri/actions-addon-builder@master
with:
  target: 'addons'
  source: 'addons/gsri_opex'
  includes: '*.sqf;*.wss;*.paa'
  flags: '-prefix=fr/gsri/opex,-clear'
```