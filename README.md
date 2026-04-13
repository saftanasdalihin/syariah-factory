# Syariah Factory

A smart contract factory implementing Sharia-compliant Islamic finance instruments on the blockchain using Solidity. This project provides decentralized implementations of traditional Islamic financing mechanisms.

## Overview

Syariah Factory provides three core Islamic finance contracts that can be instantiated through a factory pattern:

### Core Contracts

#### **Mudharabah**
A profit-sharing partnership contract based on Islamic commerce principles. Capital is provided by one party, with returns shared according to an agreed profit-sharing percentage.

- **Parameters**: Capital amount and profit share percentage
- **Use Case**: Investment partnerships and venture financing

#### **Murabahah**
A cost-plus financing contract commonly used in Islamic banking. The financier adds an agreed-upon profit margin to the cost of goods.

- **Parameters**: Cost of asset and profit margin
- **Use Case**: Asset financing and installment purchases

#### **Wadiah**
A safekeeping/deposit contract ensuring secure storage of funds or assets with an optional custodian fee.

- **Parameters**: Deposit amount
- **Use Case**: Custodial services and deposits

#### **SyariahFactory**
Factory contract that creates and manages instances of all three Islamic finance contracts.

- **Functions**:
  - `createMudharabah()` - Deploy a new Mudharabah contract
  - `createMurabahah()` - Deploy a new Murabahah contract
  - `createWadiah()` - Deploy a new Wadiah contract

## Project Structure

```
src/
├── SyariahFactory.sol   # Main factory contract
├── Mudharabah.sol       # Profit-sharing partnership
├── Murabahah.sol        # Cost-plus financing
└── Wadiah.sol           # Safekeeping deposit
```

## Development with Foundry

This project uses **Foundry**, a blazing fast toolkit for Ethereum development written in Rust.

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)

### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Format Code

```shell
forge fmt
```

### Gas Snapshots

```shell
forge snapshot
```

### Local Node (Anvil)

```shell
anvil
```

### Deploy

```shell
forge script script/Deploy.s.sol --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast (Interact with Contracts)

```shell
cast <subcommand>
```

## Foundry Documentation

For more information, visit the [Foundry Book](https://book.getfoundry.sh/).

## Contributing

Contributions are welcome! Please ensure all code follows Solidity best practices and is compatible with Sharia principles.

## License

MIT
