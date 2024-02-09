// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Property.sol";

interface IRealState {
    function newProperty(
        address _broker,
        address _owner,
        uint256 _price,
        uint256 _commission,
        uint256 _timeDoubleCommission
    ) external returns (address);

    function owner() external view returns (address);
    function properties(uint256 index) external view returns (Property);
}
