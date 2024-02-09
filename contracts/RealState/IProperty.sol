// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IProperty {
    function purchase() external payable;
    function approveSaleFor(address _buyer) external;
    function removeSalesApprovalFrom(address _buyer) external;
    function withdraw() external;

    function realState() external view returns (address);
    function broker() external view returns (address);
    function price() external view returns (uint256);

    event PropertyPurchased(address indexed buyer, uint256 price);
}
