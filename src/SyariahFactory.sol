// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Mudharabah.sol";
import "./Murabahah.sol";
import "./Wadiah.sol";

contract SyariahFactory {
    Mudharabah[] public mudharabah;
    Murabahah[] public murabahah;
    Wadiah[] public wadiah;

    constructor() {
        mudharabah = new Mudharabah();
        murabahah = new Murabahah();
        wadiah = new Wadiah();
    }
}
