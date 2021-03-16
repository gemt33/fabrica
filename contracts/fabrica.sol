pragma solidity ^0.6.6; // patrick advises to use this version. This is a stable and well documented one.

// OpenZepplin ERC20 and Ownable. (for Solidity 0.6.0 to 0.8.0)
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/access/Ownable.sol";

// Contract for the FAB token
contract Fabrica is ERC20, Ownable {
    
    // basic constructor, the token will have "fabrica" as name and "FAB" as symbol.
    // an initial supply of tokens will be created and sent to the deployer's address.
    // warning: if you want the initial supply to be 1 FAB token, you need to write (1* 10**18)
    constructor(uint256 initialSupply) ERC20("fabrica", "FAB") Ownable() public { 
        _mint(msg.sender, initialSupply);
    }
    
}
