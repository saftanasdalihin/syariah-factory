// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

/**
 * @title AssetFinancing
 * @notice Cost-plus financing model (ethical asset-backed sale)
 * @dev Modular building block for transparent markup-based financing
 */
contract AssetFinancing {
    uint256 public costPrice;
    uint256 public profitMargin;
    uint256 public totalPrice;
    
    address public seller;
    address public buyer;

    event FinancingCreated(uint256 costPrice, uint256 profitMargin, uint256 totalPrice);

    constructor(
        uint256 _costPrice,
        uint256 _profitMargin
    ) {
        require(_costPrice > 0, "Cost price must be greater than zero");
        require(_profitMargin > 0, "Profit margin must be greater than zero");
        
        costPrice = _costPrice;
        profitMargin = _profitMargin;
        totalPrice = _costPrice + _profitMargin;
        
        // In real use case, seller and buyer would be set properly
        seller = msg.sender;
        
        emit FinancingCreated(costPrice, profitMargin, totalPrice);
    }

    /**
     * @notice Get the final selling price (cost + profit)
     */
    function getTotalPrice() external view returns (uint256) {
        return totalPrice;
    }

    /**
     * @notice Get profit margin percentage
     */
    function getProfitMarginPercentage() external view returns (uint256) {
        return (profitMargin * 100) / costPrice;
    }
}
