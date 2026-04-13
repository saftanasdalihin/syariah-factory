// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Murabahah {
    uint256 public cost;
    uint256 public profit;

    constructor(uint256 _cost, uint256 _profit) {
        cost = _cost;
        profit = _profit;
    }
}
