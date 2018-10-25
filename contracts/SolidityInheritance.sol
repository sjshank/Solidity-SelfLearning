pragma solidity ^0.4.24;

contract Owned {
    address public owner;

    constructor() public{
        owner = msg.sender;
    }
}

//Inheriting/deriving Owned contract using 'is' keyword
contract Mortal is Owned{

    function getOwner() public view returns(address) {
        return owner; // accessing parent contract variable
    }
}

contract Car{
    string public make;
    string public color;

    constructor(string _make) public{
        make = _make;
    }

    function makeNoise() public pure returns(string) {
        return "VROMMMMMM !!!";
    }

    function getColor() public view returns(string) {
        return color;
    }
}

//Inheriting/deriving Owned contract using 'is' keyword
contract ToyotaCar is Car{

    //Set parent varaiable in child contract
    function setColor(string _color) private {
        color = _color;
    }

    //Poylmorphism
    function makeNoise() public pure returns(string) {
        return "Toyotaaaaa BROMMMMM !!!";
    }
}