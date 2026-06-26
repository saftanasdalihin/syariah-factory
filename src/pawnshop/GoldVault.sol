// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {notOwner, insufficientFunds, withdrawalFailed} from "../Errors.sol";

contract GoldVault {
    address public owner;
    uint256 public balance;

    event Deposit(address indexed sender, uint256 amount);
    event Withdrawal(address indexed recipient, uint256 amount);

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert notOwner();
        }
        _;
    }

    function deposit() external payable {
        if (msg.value <= 0) {
            revert insufficientFunds();
        }
        balance += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner {
        if (amount > balance) {
            revert insufficientFunds();
        }
        balance -= amount;
        (bool success,) = payable(owner).call{value: amount}("");
        if (!success) {
            revert withdrawalFailed();
        }
        emit Withdrawal(owner, amount);
    }
}
