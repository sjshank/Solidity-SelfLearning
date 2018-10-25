
pragma solidity ^0.4.24;

pragma experimental ABIEncoderV2;


// Contract name. Same as class.
contract SolidityDatatype{

/*
*   Memory based data types starts from here
*/


    bool boolVariable; // Boolean datatype. Default value is false
    bytes32 byteStr; // used to store raw byte data

/**************************************************************************************************** */
    uint unsignedIntegerVariable; // unsigned Integer datatype. Default value is 0

    // command for executing inside truffle console --->>  SolidityDatatype.deployed().then(function(inst){return inst.setUnsignedIntegerVariable(somevalue);});
    function setUnsignedIntegerVariable(uint val) public{
        unsignedIntegerVariable = val;
    }


    /**** VIEW functions read from blockchain storage but do not write to it ****/
    // Use view instead of constant(deprecated). Public is visibility modifier and it should comes first before other modifiere
    // command for executing inside truffle console --->>  SolidityDatatype.deployed().then(function(inst){return inst.getUnsignedIntegerVariable.call();});
    function getUnsignedIntegerVariable() public view returns (uint){
        return unsignedIntegerVariable;
    }

    /*******  PURE functions do not read or write to storage */
    // command for executing inside truffle console --->> SolidityDatatype.deployed().then(function(inst){return inst.subtractUnSignedInteger(40, 20);});
    function subtractUnSignedInteger(uint256 val1, uint256 val2) public pure returns(uint256 output){
        return val1 - val2;
    }

/**************************************************************************************************** */

    
    int signedIntegerVariable; // signed Integer datatype. Default value is 0

    // command for executing inside truffle console --->>  SolidityDatatype.deployed().then(function(inst){return inst.setSignedIntegerVariable(50);});
    function setSignedIntegerVariable(int val) public{
        signedIntegerVariable = val;
    }

    // Use view instead of constant(deprecated). Public is visibility modifier and it should comes first before other modifiers
    // command for executing inside truffle console --->>  SolidityDatatype.deployed().then(function(inst){return inst.getSignedIntegerVariable();});
    function getSignedIntegerVariable() public view returns (int){
        return signedIntegerVariable;
    }

    // command for executing inside truffle console --->>  SolidityDatatype.deployed().then(function(inst){return inst.addSignedInteger(10, 20);});
    function addSignedInteger(int val1, int val2) public pure returns(int output){
        return val1 + val2;
    }


/**************************************************************************************************** */

    string strVariable; // String datatype. Default value is empty string ''

    // SolidityDatatype.deployed().then(function(inst){return inst.setStrVariable('saurabh shankariya');});
    function setStrVariable(string _strInput) public {
        strVariable = _strInput;
    }

    // SolidityDatatype.deployed().then(function(inst){return inst.getStrVariable();});
    function getStrVariable() public view returns(string){
        return strVariable;
    }


/**************************************************************************************************** */


    address addrVariable; // address datatype - special type of datatype to store 20 byte (Specially. Ethereum address)
    // It has 2 members balance and transfer and mostly use for quering balance of address using  PROPERTY 'balance'
    // and send ether to an address using FUNCTION 'transfer'

    function setAddrVariable(address _addrVariable) public{
        addrVariable = _addrVariable;
    }

    // SolidityDatatype.deployed().then(function(inst){return inst.getSender();});
    function getSender() public view returns(address){
        return msg.sender;
    }

    //SolidityDatatype.deployed().then(function(inst){return inst.getBalance();});
    function getBalance() public view returns(uint256){
        return msg.sender.balance;
    }



/*
*   Storage based data types starts from here
*/

    //uint[]  unsignedIntegerArray;  // Array datatype. Default value is []

    //SolidityDatatype.deployed().then(function(inst){ return inst.arrayFunc(10);});
    function arrayFunc(uint length) public pure returns(uint[]){
         uint[] memory a = new uint[](length);
        bytes memory b = new bytes(length);
        // Here we have a.length == 7 and b.length == len
        a[length-1] = 8;
        return a;
    }


/**************************************************************************************************** */

    // New datatype to define custom objects(datatype)
    struct Book {
        string name;
        string author;
        uint price;
    }

    /*function setBook(string _name, string _author, uint256 _price) public{
        Book memory b = Book({name:_name, author:_author, price:_price});
    }*/


    // use pragma experimental ABIEncoderV2; to support custom return datatype
    /*function getBookDetails() public view returns(Book){
        return Book;
    }*/


    /**************************************************************************************************** */    

    mapping(address => uint) balances;

    // SolidityDatatype.deployed().then(function(inst){ return inst.updateBalance(45000000);});
    function updateBalance(uint newB) public{
        balances[msg.sender] = newB;
    }

    // SolidityDatatype.deployed().then(function(inst){ return inst.getUpdatedBalance();});
    function getUpdatedBalance() public view returns(uint balance){
        return balances[msg.sender];
    }

}