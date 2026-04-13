// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Mudharabah {
    uint256 public capital;
    uint256 public profitShare;

    constructor(uint256 _capital, uint256 _profitShare) {
        capital = _capital;
        profitShare = _profitShare;
    }
}
