var SolidityDatatype  = artifacts.require("./SolidityDatatype");
var SolidityComparison  = artifacts.require("./SolidityComparison");
var StringUtils  = artifacts.require("./StringUtils");
var Chatty  = artifacts.require("./Chatty");
var ChatterInherited  = artifacts.require("./ChatterInherited");
var Owned  = artifacts.require("./Owned");
var Mortal  = artifacts.require("./Mortal");
var Car  = artifacts.require("./Car");
var ToyotaCar  = artifacts.require("./ToyotaCar");



module.exports = function(deployer) {
  deployer.deploy(SolidityDatatype);
  deployer.deploy(StringUtils);
  // Link 2 dependable contracts and merged them in single contract
  deployer.link(StringUtils, SolidityComparison);
  deployer.deploy(SolidityComparison);
  deployer.deploy(Chatty).then(function(){
    deployer.deploy(ChatterInherited);
  });
  deployer.deploy(Owned);
  deployer.deploy(Mortal);
  deployer.deploy(Car, "Toyota");
  /*  .then(function(){
      deployer.deploy(ToyotaCar)
    })*/
  
};
