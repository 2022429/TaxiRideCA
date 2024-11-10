// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

//Define the restaurant contract
contract Restaurant {
    address public owner;
    uint public ownerBalance;

    struct MenuItem {
            string name; // Name of the item (burger, veg)
            uint price; // price os the item is in wei

    }

    //Mapping to store menu items
    mapping(uint => MenuItem) public menu;
    uint public MenuItemCount;


    event MenuItemAdded (uint ItemId, string name, uint price);
    event orderPlaced(address customer, uint ItemId, uint quantity, uint totalCost);
    event paymentReceived(address customer, uint amount);

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can perform this function");_;
    }

    constructor(){
        owner = msg.sender;

    }

    function addMenuItem(string memory _name, uint _price) public onlyOwner
          menu[MenuItemCount] = MenuItem(_name, _price);
    emit MenuItemAdded(MenuItemCount,_name, _price);
    menuItemCount++; 
    
}

function placeOrder(uint _itemId, uint _quantity) public payable {
    require(_itemId < MenuItemCount, "Invalid menu item");
    MenuItem memory item = menu [_itemId];
    uint totalCost = item.price * _quantity;
    require(msg.value == totalCost, "Incorrect payment amount");
    OwnerBalance += msg.value;
    emit orderPlaced(msg.sender, _ItemId, _quantity, totalCost);
    emit paymentReceived(msg.sender, msg.value);
}

function withdrawBalance() public onlyOwner {
    uint anount = ownerBalance;
    ownerBalance = 0;
    payable (owner).transfer(amount);
}

function getMenuItem(uint _itemId) public view returns (string memory name, uint price) {
    require(_itemId < MenuItemCount, "Invalid menu item.");
    menuItem memory item = menu [_itemId];
    return(item.name, item.price);
}
