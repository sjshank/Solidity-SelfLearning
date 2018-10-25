pragma solidity ^0.4.24;


// Importing utility library
import "./StringUtils.sol";

contract SolidityComparison{
/*
    Booleans
        ! (logical negation)
        && (logical conjunction, “and”)
        || (logical disjunction, “or”)
        == (equality)
        != (inequality)
*/
    // SolidityComparison.deployed().then(function(inst){ return inst.reverseInput(false);});
    function reverseInput(bool var1) public pure returns(bool output){
        output = !var1;
    }

    // SolidityComparison.deployed().then(function(inst){ return inst.compareString('saurabh', 'saurabh');});
    function compareString(string memory var1, string memory var2) public pure returns(bool){
        // calling function from utility lib
        return StringUtils.equal(var1, var2);
    }

    // SolidityComparison.deployed().then(function(inst){ return inst.isGreater(23, 22);});
    // Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
    function isGreater(uint var1, uint var2) public pure returns(bool){
        return var1 > var2;
    }


/************************************************************************************ */

// Function types

    string str = "saurabh";

    // Wrting to blockchain storage
    function writeToStorage(string name) public{
        str = name;
    }

    // VIEW function type - Only reads from blockchain storage 
    function readFromStorageIsView() public view returns (string){
        return str;
    }

    // PURE function type - Do not read/write blockchain storage 
    function getFullNamePureFunction(bool input) public pure returns(bool) {
        return !input;
    }

/************************************************************************************ */

// Function modifiers

    address owner;
    string input1;
    string input2;

    //Constructoor
    constructor() public{
        owner = msg.sender;
    }

    // Defining a modifier
    modifier onlyOwner() {
        if(msg.sender != owner) {
            revert("Sender is not an owner.");
        }else{
            _;
        }
    }


    // Defining modifier to check string is a subset of another string
    modifier isIndexOf(string var1, string var2) {
        int256 result = StringUtils.indexOf(var1, var2);
        if(result < 0) {
            revert("String is not subset of other string");
        }else{
            _;
        }
    }

    // SolidityComparison.deployed().then(function(inst){ return inst.testModifier('abc', 'd');}); --- it will fail in modifier

    // SolidityComparison.deployed().then(function(inst){ return inst.testModifier('abc', 'a');});
    function testModifier(string var1, string var2) public isIndexOf(var1, var2) pure returns(bool) {
        return true;
    }

    //Applying modifier. It will call modifier before executing kill function
    function kill() private onlyOwner { 
        selfdestruct(owner);
    }
}