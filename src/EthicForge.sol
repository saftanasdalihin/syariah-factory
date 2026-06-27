// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {PartnershipPool} from "./PartnershipPool.sol";
import {AssetFinancing} from "./AssetFinancing.sol";
import {SecureVault} from "./SecureVault.sol";

contract EthicForge {
    PartnershipPool[] public partnershipPools;
    AssetFinancing[] public assetFinancings;
    SecureVault[] public secureVaults;

    event PoolCreated(address poolAddress, string poolType);
    
    /**
     * @notice Create a new Profit-Sharing Partnership (similar to Mudharabah)
     */
    function createPartnershipPool(
        uint256 initialCapital,
        uint256 profitSharePercentage,
        address investor,
        address manager
    ) public returns (address) {
        PartnershipPool newPool = new PartnershipPool(
            initialCapital,
            profitSharePercentage,
            investor,
            manager
        );
        
        partnershipPools.push(newPool);
        emit PoolCreated(address(newPool), "Partnership");
        
        return address(newPool);
    }

    /**
     * @notice Create a new Cost-Plus Financing (similar to Murabahah)
     */
    function createAssetFinancing(
        uint256 assetCost,
        uint256 profitMargin
    ) public returns (address) {
        AssetFinancing newFinancing = new AssetFinancing(assetCost, profitMargin);
        
        assetFinancings.push(newFinancing);
        emit PoolCreated(address(newFinancing), "AssetFinancing");
        
        return address(newFinancing);
    }

    /**
     * @notice Create a new Secure Custody Vault (similar to Wadiah)
     */
    function createSecureVault(uint256 initialDeposit) public returns (address) {
        SecureVault newVault = new SecureVault(initialDeposit);
        
        secureVaults.push(newVault);
        emit PoolCreated(address(newVault), "SecureVault");
        
        return address(newVault);
    }

    // View functions
    function getPartnershipPoolCount() public view returns (uint256) {
        return partnershipPools.length;
    }

    function getAssetFinancingCount() public view returns (uint256) {
        return assetFinancings.length;
    }

    function getSecureVaultCount() public view returns (uint256) {
        return secureVaults.length;
    }
}
