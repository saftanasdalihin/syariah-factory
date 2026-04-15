// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

import {Mudharabah} from "./Mudharabah.sol";
import {Murabahah} from "./Murabahah.sol";
import {Wadiah} from "./Wadiah.sol";

contract SyariahFactory {
    Mudharabah[] public mudharabah;
    Murabahah[] public murabahah;
    Wadiah[] public wadiah;

    function createMudharabah(uint256 _capital, uint256 _profitShare) public {
        Mudharabah newMudharabah = new Mudharabah(_capital, _profitShare);
        mudharabah.push(newMudharabah);
    }

    function createMurabahah(uint256 _cost, uint256 _profit) public {
        Murabahah newMurabahah = new Murabahah(_cost, _profit);
        murabahah.push(newMurabahah);
    }

    function createWadiah(uint256 _deposit) public {
        Wadiah newWadiah = new Wadiah(_deposit);
        wadiah.push(newWadiah);
    }
}
