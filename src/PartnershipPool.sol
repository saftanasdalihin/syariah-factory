// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

/**
 * @title PartnershipPool
 * @notice Profit-sharing partnership model (inspired by ethical joint venture)
 * @dev Modular building block for fair investment partnerships
 */
contract PartnershipPool {
    uint256 public capital;
    uint256 public totalProfit;
    uint256 public profitSharePercentage; // e.g. 30 = 30%
    
    address public investor;
    address public manager; // entrepreneur / operator

    event ProfitDistributed(uint256 totalProfit, uint256 investorShare, uint256 managerShare);

    constructor(
        uint256 _capital,
        uint256 _profitSharePercentage,
        address _investor,
        address _manager
    ) {
        require(_capital > 0, "Capital must be greater than zero");
        require(_profitSharePercentage <= 100, "Profit share must be <= 100%");
        
        capital = _capital;
        profitSharePercentage = _profitSharePercentage;
        investor = _investor;
        manager = _manager;
        totalProfit = 0;
    }

    /**
     * @notice Record new profit and distribute according to share
     */
    function recordProfit(uint256 _profit) external {
        require(_profit > 0, "Profit must be positive");
        
        totalProfit += _profit;
        
        uint256 investorShare = (_profit * profitSharePercentage) / 100;
        uint256 managerShare = _profit - investorShare;
        
        emit ProfitDistributed(_profit, investorShare, managerShare);
        
        // In real implementation, you would transfer tokens here
        // payable(investor).transfer(investorShare);
        // payable(manager).transfer(managerShare);
    }

    /**
     * @notice Get current total profit
     */
    function getTotalProfit() external view returns (uint256) {
        return totalProfit;
    }
}
