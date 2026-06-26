// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

contract Mudharabah {
    uint256 public capital;
    uint256 public totalProfit;
    uint256 public profitShare;
    address public investor;
    address public entrepreneur;

    constructor(uint256 _capital, uint256 _profitShare, address _investor, address _manager) {
        capital = _capital;
        totalProfit = 0;
        profitShare = _profitShare;
        investor = _investor;
        entrepreneur = _manager;
    }
}
