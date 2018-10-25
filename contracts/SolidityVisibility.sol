pragma solidity ^0.4.24;

contract Chatty{
    // Private static variables are only visible for the contract they are defined.
    string private privateStr = "Private String";
    // Public static variables are visible for the other contracts as well, since they are a part of actual contract interface.
    string public publicStr = "Public String";
    // Internal static variables can be access within current contract and contracts deriving from it. It's a typr of PROTECTED keywrod in java.
    string internal internalStr = "Internal String";

    // External keyword for static variable doesn't work


    // Function visible to all.
    function helloPublic() public pure returns(string){
        return "This is helloPublic function !";
    }

    // Function only visible for current contract instance 
    function helloPrivate() private pure returns(string) {
        return "This is helloPrivate function !";
    }

    // Function only visible for current contract instance and one who is deriving this contract
    function helloInternal() internal pure returns(string) {
        return "This is helloInternal function !";
    }

    // Function only visible for another contract instance
    function helloExternal() external pure returns(string) {
        return "This is helloExternal function !";
    }


    function chat(Chatty buddy) public pure{
        
        helloPublic(); //It will work.
        buddy.helloPublic(); // It will work.

        helloPrivate(); //It will work
        //buddy.helloPrivate(); //It won't work since buddy is an instance of other contract

        helloInternal(); //It will work
        //buddy.helloInternal(); //It won't work since buddy is an instance of other contract and neither it is deriving contract

        //helloExternal(); //It won't work because you cannot call it internally
        buddy.helloExternal(); // will work because calling from another contract instance

        //buddy.publicStr; // will work since visible to all
        //buddy.privateStr; // won't work since buddy is is an instance of other contract
        //buddy.internalStr; // won't work since buddy is an instance of other contract
    }
}


contract ChatterInherited is Chatty{
    constructor() public {
        // will work because public makes it accessible by all
        Chatty.helloPublic();
        
        // will work because internal is visibile for derived contracts too
        Chatty.helloInternal();
        
        // won't work because private is only visible for the contract they are defined in
        //Chatty.helloPrivate();
        
        // won't work because external can only be called from external contract instances
        //Chatty.helloExternal();
        
        // will work because public makes it accessible by all
        //string publicStr2 = Chatty.publicStr;
        
        // will work because internal is visibile for derived contracts too
        //string internalStr = Chatty.internalStr;
        
        // won't work because private is only visible for the contract they are defined in
        //string privateStr = Chatty.privateStr;
    }
}