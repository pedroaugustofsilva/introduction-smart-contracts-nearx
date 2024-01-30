// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SupplyChainStore {
    enum Status {
        PENDING,
        LOGGED,
        PURCHASE,
        RECEIVE
    }

    Status public status;
    uint256 constant minAge = 18;
    uint256 constant minValue = 1 ether;
    string[] products = ["Iphone 15", "Macbook", "Apple Watch"];
    address payable constant storeAddress = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    mapping(address => bool) approvedAccounts;
    mapping(address => uint256) balances;

    function get() external view returns (Status) {
        return status;
    }

    function login(uint256 age) external returns (bool) {
        if (age < minAge) {
            revert("Your not legal Age in Brazil");
        } else {
            status = Status.LOGGED;
            approvedAccounts[msg.sender] = true;
            return true;
        }
    }

    function loginTernario(uint256 age) external pure returns (bool) {
        return age >= minAge;
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return(keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b)));
    }

    function executePurchase(string memory product) external payable checkProduct(product) {
        if (!approvedAccounts[msg.sender]) revert("not approved");

        if (compareStrings(product, products[0])) {
            require(msg.value == 1 ether, "incorrect iphone value");
            balances[msg.sender] += msg.value;
            status = Status.PURCHASE;
        }

        if (compareStrings(product, products[1])) {
            require(msg.value == 2 ether, "incorrect MacBook Value");
            balances[msg.sender] += msg.value;
            status = Status.PURCHASE;
        }

        if (compareStrings(product, products[2])) {
            require(msg.value == 5_000_000_000_000_000_000 wei, "incorrect Apple Watch Value");
            balances[msg.sender] += msg.value;
            status = Status.PURCHASE;
        }
    }

    function receiveOrNot(bool _received) external {
       if (!approvedAccounts[msg.sender]) revert("not approved");
       if (_received == true) {
        payable(storeAddress).transfer(address(this).balance);
        status = Status.RECEIVE;
       } else {
        payable(msg.sender).transfer(balances[msg.sender]);
       }
    }

    modifier checkProduct(string memory productName) {
        require(
            compareStrings(productName, products[0]) || compareStrings(productName, products[1]) || compareStrings(productName, products[2]),
            "There is no product with that name"
        );
        _;
    }
}
