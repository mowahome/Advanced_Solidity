pragma solidity ^0.5.0;

// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";


 // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
        // constructor can stay empty
    
contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale {
    constructor(
        uint rate,
        address payable wallet,
        KaseiCoinToken token
    ) Crowdsale(rate, wallet, token) public {

    }  
}

contract KaseiCoinCrowdsaleDeployer {
    // Create an `address public` variable called `kasei_token_address`.
   // Create an `address public` variable called `kasei_crowdsale_address`.
    address public KaseiTokenAddress;
    address public KaseiCrowdsaleAddress;

    // Add the constructor.
    constructor(
      string memory name,
      string memory symbol,
      address payable wallet
    ) public {
        // Create a new instance of the KaseiCoin contract.
    KaseiCoin token = new KaseiCoin(name, symbol, 0);
        
        // Assign the token contract’s address to the `kasei_token_address` variable.
    KaseiTokenAddress = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
    KaseiCoinCrowdsale KaseiCrowdsale = new KaseiCoinCrowdsale(1, wallet, token);
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
    KaseiCrowdsaleAddress = address(KaseiCrowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
    token.addMinter(KaseiCrowdsaleAddress);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
    token.renounceMinter();
    }
}