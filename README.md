# EthicForge 🛠️

**Modular Smart Contract Factory for Ethical Finance**

A collection of reusable "Lego blocks" — secure, transparent, and modular smart contracts designed for fair and responsible financial applications.

---

## Table of Contents

- [Philosophy](#-philosophy)
- [Features](#-features)
- [Prerequisites](#prerequisites)
- [Installation](#-installation)
- [Project Structure](#-project-structure)
- [Available Modules](#-available-modules)
- [Quick Start](#-quick-start)
- [Development & Testing](#-development--testing)
- [Contributing](#-contributing)
- [License](#license)

---

## ✨ Philosophy

We believe finance should be built on **transparency, fairness, and real economic activity** — not speculation or exploitation.

EthicForge provides building blocks that promote:
- **Profit-sharing** instead of fixed interest
- **Asset-backed** transactions
- **Clear custody** and responsibility

---

## 📌 Features

- **Factory pattern** — Easy to deploy multiple instances
- **Modular design** — Mix and match contracts like Lego
- **Reusable contracts** — Deploy once, use many times
- **Full test coverage** — Comprehensive test suite
- **Gas optimized** — Efficient smart contracts
- **Transparent events** — Everything is verifiable on-chain
- **Well-documented** — Clean, readable code with comments
- **Upgradeable-ready** — Prepared for future improvements

---

## Prerequisites

- **Solidity** ^0.8.34
- **Foundry** — [Install Foundry](https://book.getfoundry.sh/getting-started/installation)
- **Git**
- **Node.js** (optional, for additional tooling)

---

## 🚀 Installation

```bash
git clone https://github.com/saftanasdalihin/ethicforge.git
cd ethicforge
forge install
```

---

## 📁 Project Structure

```
.
├── src/                          # Core smart contracts
│   ├── EthicForge.sol           # Main factory contract
│   ├── PartnershipPool.sol      # Profit-sharing module
│   ├── AssetFinancing.sol       # Asset financing module
│   ├── SecureVault.sol          # Custody module
│   ├── Errors.sol               # Custom error definitions
│   └── pawnshop/                # Pawnshop utilities
├── test/                         # Test files
├── lib/                          # External dependencies
│   ├── forge-std/               # Foundry standard library
│   └── openzeppelin-contracts/  # OpenZeppelin utilities
├── foundry.toml                 # Foundry configuration
└── README.md                    # This file
```

---

## 📦 Available Modules

| Module              | Purpose                      | Use Case                     |
|---------------------|------------------------------|------------------------------|
| **PartnershipPool** | Profit-sharing partnerships  | Investment, venture funding  |
| **AssetFinancing**  | Cost-plus / markup financing | Asset purchase, trade        |
| **SecureVault**     | Trusted asset custody        | Deposits, safekeeping        |

Each module is independently deployable and composable.

---

## 🚀 Quick Start

### Build the project
```bash
forge build
```

### Run tests
```bash
forge test
```

### Run tests with verbose output
```bash
forge test -vvv
```

---

## 🛠️ Development & Testing

### Running the full test suite
```bash
forge test --match-path "test/**/*.sol"
```

### Running specific tests
```bash
forge test --match-test "testFunctionName"
```

### View gas usage
```bash
forge test --gas-report
```

### Check code coverage
```bash
forge coverage
```

---

## Why EthicForge?

### Core Benefits
- **Modular** → Mix and match contracts like Lego
- **Reusable** → Deploy once, use many times
- **Transparent** → Everything is on-chain and verifiable
- **Ethical-first** → Designed with fairness and responsibility in mind

### Perfect for
- DeFi builders seeking ethical frameworks
- Impact projects and responsible finance applications
- Learning advanced Solidity patterns
- Building transparent financial systems

---

## 🤝 Contributing

Contributions are welcome! We're building this together.

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for:
- Code style guidelines
- Testing requirements
- Pull request process
- Development setup

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

⭐ **If this project helps you build better systems, please consider starring it!**

Made with ❤️ for transparent and ethical finance.
