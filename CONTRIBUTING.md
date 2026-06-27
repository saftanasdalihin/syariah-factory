# Contributing to EthicForge

Thank you for your interest in contributing to EthicForge! We're building transparent, ethical financial infrastructure together, and we welcome contributions from developers of all skill levels.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [How to Contribute](#how-to-contribute)
- [Coding Standards](#coding-standards)
- [Testing Requirements](#testing-requirements)
- [Commit Conventions](#commit-conventions)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)

---

## Code of Conduct

We are committed to providing a welcoming and inclusive environment for all contributors.

**Expected behavior:**
- Be respectful and inclusive
- Welcome feedback and different perspectives
- Focus on what is best for the community
- Show empathy towards others

**Unacceptable behavior:**
- Harassment, discrimination, or abuse
- Trolling or insulting comments
- Private attacks or doxxing
- Unwelcome sexual attention or advances

**Reporting:** If you experience or witness unacceptable behavior, please report it to the project maintainers.

---

## Getting Started

### Prerequisites

- **Git** installed and configured
- **Foundry** installed ([Installation Guide](https://book.getfoundry.sh/getting-started/installation))
- **Solidity** knowledge (or willingness to learn!)
- **GitHub** account

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/ethicforge.git
   cd ethicforge
   ```
3. Add the upstream remote:
   ```bash
   git remote add upstream https://github.com/saftanasdalihin/ethicforge.git
   ```

---

## Development Setup

### Install Dependencies

```bash
forge install
```

### Build the Project

```bash
forge build
```

### Verify Setup

```bash
forge test
```

All tests should pass before you start contributing.

---

## How to Contribute

### Types of Contributions

We welcome:
- **Bug fixes** — Fix issues and improve stability
- **New features** — Implement new modules or functionality
- **Documentation** — Improve READMEs, comments, and guides
- **Tests** — Increase coverage and catch edge cases
- **Optimization** — Reduce gas costs and improve efficiency
- **Security improvements** — Help us build safer contracts

### Finding Issues to Work On

1. Check [GitHub Issues](https://github.com/saftanasdalihin/ethicforge/issues) for open tasks
2. Look for labels:
   - `good first issue` — Great for newcomers
   - `help wanted` — Community support needed
   - `bug` — Issues to fix
   - `enhancement` — New features
3. Comment on an issue to claim it before starting work

### Creating a Feature Branch

Always create a new branch for your work:

```bash
git checkout -b feature/your-feature-name
# or for bug fixes:
git checkout -b fix/bug-description
```

Use descriptive branch names that clearly indicate what you're working on.

---

## Coding Standards

### Solidity Style Guide

We follow **Solidity best practices** with the following guidelines:

#### Naming Conventions

- **Contracts:** `PascalCase` (e.g., `PartnershipPool`)
- **Functions:** `camelCase` (e.g., `deployContract()`)
- **Variables:** `camelCase` for local/state variables
- **Constants:** `UPPER_SNAKE_CASE` (e.g., `MAX_SUPPLY`)
- **Private/Internal:** Prefix with underscore (e.g., `_internalFunction()`)
- **Events:** `PascalCase` (e.g., `ContractDeployed`)
- **Custom Errors:** `PascalCase` (e.g., `InsufficientBalance()`)

#### Code Organization

Within each contract, organize in this order:

1. Pragma statements
2. Imports
3. Custom errors
4. Events
5. State variables (public, internal, private)
6. Modifiers
7. Constructor
8. External functions
9. Public functions
10. Internal functions
11. Private functions
12. View/Pure functions

#### Best Practices

- Use **custom errors** instead of require strings (saves gas):
  ```solidity
  if (amount == 0) revert InvalidAmount();
  ```
- Use **meaningful variable names** — avoid `x`, `y`, `temp`
- Add **NatSpec comments** for all public/external functions:
  ```solidity
  /// @notice Withdraws funds from the vault
  /// @param amount The amount to withdraw
  /// @return success Whether the withdrawal succeeded
  ```
- Keep functions **focused and modular**
- Avoid deep nesting — use guards and early returns

#### Example Function

```solidity
/// @notice Deposits tokens into the vault
/// @param token The token address to deposit
/// @param amount The amount to deposit
/// @dev Only callable by authorized users
function deposit(address token, uint256 amount) external onlyAuthorized {
    if (token == address(0)) revert InvalidToken();
    if (amount == 0) revert InvalidAmount();

    IERC20(token).transferFrom(msg.sender, address(this), amount);

    emit TokensDeposited(msg.sender, token, amount);
}
```

### General Guidelines

- **No magic numbers** — Use named constants
- **Gas optimization** — Write efficient code, but prioritize clarity
- **Security first** — Assume contracts will hold real value
- **Documentation** — Future maintainers will thank you
- **Modularity** — Make functions reusable and testable

---

## Testing Requirements

### Writing Tests

- **Every public function** must have tests
- **Edge cases** should be tested (zero amounts, max values, etc.)
- **Happy paths and error cases** both need coverage

### Test File Naming

Follow this pattern:
```
test/[ContractName].t.sol
```

Example:
```
test/PartnershipPool.t.sol
```

### Test Structure

Use Foundry's testing conventions:

```solidity
pragma solidity ^0.8.34;

import {Test} from "forge-std/Test.sol";
import {PartnershipPool} from "src/PartnershipPool.sol";

contract PartnershipPoolTest is Test {
    PartnershipPool pool;
    address testUser = address(0x123);

    function setUp() public {
        pool = new PartnershipPool();
    }

    function test_DeploymentSucceeds() public {
        assertNotEq(address(pool), address(0));
    }

    function test_RevertWhenZeroAmount() public {
        vm.expectRevert(PartnershipPool.InvalidAmount.selector);
        pool.deposit(0);
    }

    function testFuzz_DepositAmount(uint256 amount) public {
        vm.assume(amount > 0 && amount < type(uint128).max);
        // Test logic
    }
}
```

### Running Tests

```bash
# Run all tests
forge test

# Run with verbose output
forge test -vvv

# Run specific test
forge test --match-test "testFunctionName"

# Run with gas report
forge test --gas-report

# Check coverage
forge coverage
```

### Coverage Requirements

- Aim for **>90% code coverage** for core contracts
- Document why any code is intentionally untested

---

## Commit Conventions

We use **Conventional Commits** for clear, descriptive commit messages.

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat:` — A new feature
- `fix:` — A bug fix
- `docs:` — Documentation changes
- `test:` — Adding or updating tests
- `refactor:` — Code refactoring without feature changes
- `perf:` — Performance improvements
- `chore:` — Maintenance tasks
- `style:` — Code style changes (formatting, semicolons, etc.)

### Examples

```
feat(PartnershipPool): add profit distribution mechanism

fix(AssetFinancing): correct interest calculation rounding error

docs: update README with deployment instructions

test: add fuzz tests for deposit function

refactor(SecureVault): simplify custody logic
```

### Guidelines

- Use lowercase
- Keep subject line under 50 characters
- Use imperative mood ("add" not "added" or "adds")
- Reference issues when relevant: `(#123)`
- Be descriptive but concise

---

## Pull Request Process

### Before Submitting

1. **Update your branch** with the latest upstream changes:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Run tests locally**:
   ```bash
   forge test
   ```

3. **Check gas usage**:
   ```bash
   forge test --gas-report
   ```

4. **Verify code quality**:
   - No console logs left in code
   - All comments are clear
   - No commented-out code
   - Proper error handling

### Submitting a Pull Request

1. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. Open a Pull Request on GitHub with:
   - Clear title following Conventional Commits
   - Detailed description of changes
   - Reference to related issues: `Closes #123`
   - Any relevant context or considerations

### PR Template

```markdown
## Description
Brief description of what this PR does

## Related Issue
Closes #123

## Changes
- Change 1
- Change 2
- Change 3

## Testing
How to test these changes:
```

### Review Process

- **Maintainers will review** your PR within a few days
- **Address feedback** by making additional commits
- **Rebase and squash** only if requested
- **Once approved**, your PR will be merged!

---

## Reporting Issues

### Bug Reports

Include:
- **Clear description** of the bug
- **Steps to reproduce**
- **Expected behavior** vs. actual behavior
- **Environment** (Foundry version, Solidity version, OS)
- **Error messages** and stack traces

### Feature Requests

Include:
- **Clear description** of the feature
- **Why it's needed** — what problem does it solve?
- **Example use case**
- **Potential implementation approach** (optional)

### Security Issues

**Do not open public issues for security vulnerabilities!**

Instead, email security details to the maintainers directly. We take security seriously and will respond promptly.

---

## Questions?

Have questions about contributing? 

- Check existing issues and discussions
- Review the main [README.md](README.md)
- Comment on relevant issues
- Reach out to maintainers

---

## Recognition

We appreciate all contributions! Contributors will be:
- Listed in the project README
- Credited in release notes
- Part of the EthicForge community

---

## License

By contributing to EthicForge, you agree that your contributions will be licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

**Thank you for helping build ethical, transparent finance! ❤️**
