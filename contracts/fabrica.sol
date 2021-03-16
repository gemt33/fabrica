pragma solidity ^0.6.6; // patrick advises to use this version. This is a stable and well documented one.

// OpenZepplin ERC20 and Ownable. (for Solidity 0.6.0 to 0.8.0)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

// Contract for the FAB token
contract Fabrica is ERC20, Ownable {
    
    // basic constructor, the token will have "fabrica" as name and "FAB" as symbol.
    constructor() ERC20("fabrica", "FAB") Ownable() public { }
    
}
