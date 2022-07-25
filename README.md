# Advanced_Solidity
For this project, I created a fungible token (KaseiCoin) that's ERC-20 compliant. This token will be minted by using a `Crowdsale` contract from the OpenZeppelin Solidity library. The crowdsale contract created will manage the entire crowdsale process. This process will allow users to send ether to the contract and receive KaseiCoin tokens, or **KAI**, in return. The contract will automatically mint the tokens and distribute them to a buyer in one transaction.

To accomplish this, I did the following steps:

### Step 1: Create the KaseiCoin Token Contract

In this subsection, I created a smart contract that defines KaseiCoin as an ERC-20 token. To do so, I completed the following steps:

1. Import the provided `KaseiCoin.sol` starter file into the Remix IDE.

2. Import the following contracts from the OpenZeppelin library:

    * `ERC20`

    * `ERC20Detailed`

    * `ERC20Mintable`

3. Define a contract for the KaseiCoin token, and name it `KaseiCoin`. Have the contract inherit the three contracts that you just imported from OpenZeppelin.

4. Inside your `KaseiCoin` contract, add a constructor with the following parameters: `name`, `symbol`, and `initial_supply`.

5. As part of your constructor definition, add a call to the constructor of the `ERC20Detailed` contract, passing the parameters `name`, `symbol`, and `18`. (Recall that 18 is the value for the `decimals` parameter.)

6. Compile the contract by using compiler version 0.5.0.

7. Screenshot of the compiled KaseiCoin Token Contract
![image](https://user-images.githubusercontent.com/98926434/180880647-b45fff87-1510-485b-8643-169060cdcc20.png)

### Step 2: Create the KaseiCoin Crowdsale Contract

In this subsection, you’ll define the KaseiCoin crowdsale contract. To do so, complete the following steps:

1. Import the provided `KaseiCoinCrowdsale.sol` starter code into the Remix IDE.

2. Have this contract inherit the following OpenZeppelin contracts:

    * `Crowdsale`

    * `MintedCrowdsale`

3. In the `KaisenCoinCrowdsale` constructor, provide parameters for all the features of your crowdsale, such as `rate`, `wallet` (where to deposit the funds that the token raises), and `token`. Configure these parameters as you want for your KaseiCoin token.

4. Compile the contract by using compiler version 0.5.0.

5. Check for any errors, and debug them as needed.

6. Screenshot of the compiled contract
![image](https://user-images.githubusercontent.com/98926434/180881184-ee2453bf-2202-4b51-a753-2ef5fa37f72b.png)


### Step 3: Create the KaseiCoin Deployer Contract

In this subsection, you’ll create the KaseiCoin deployer contract. Start by uncommenting the `KaseiCoinCrowdsaleDeployer` contract in the provided `KaseiCoinCrowdsale.sol` starter code.

Next, in the `KaseiCoinCrowdsaleDeployer` contract, you’ll add variables to store the addresses of the `KaseiCoin` and `KaseiCoinCrowdsale` contracts, which this contract will deploy. Finally, you’ll complete the `KaseiCoinCrowdsaleDeployer` contract. To do so, complete the following steps:

1. Create an `address public` variable named `kasei_token_address`, which will store the `KaseiCoin` address once that contract has been deployed.

2. Create an `address public` variable named `kasei_crowdsale_address`, which will store the `KaseiCoinCrowdsale` address once that contract has been deployed.

3. Add the following parameters to the constructor for the `KaseiCoinCrowdsaleDeployer` contract: `name`, `symbol`, and `wallet`.

4. Inside of the constructor body (that is, between the braces), complete the following steps:

    * Create a new instance of the `KaseiCoinToken` contract.

    * Assign the address of the KaseiCoin token contract to the `kasei_token_address` variable. (This will allow you to easily fetch the token's address later.)

    * Create a new instance of the `KaseiCoinCrowdsale` contract by using the following parameters:

      * The `rate` parameter: Set `rate` equal to 1 to maintain parity with ether.

      * The `wallet` parameter: Pass in `wallet` from the main constructor. This is the wallet that will get paid all the ether that the crowdsale contract raises.

      * The `token` parameter: Make this the `token` variable where `KaseiCoin` is stored.

    * Assign the address of the KaseiCoin crowdsale contract to the `kasei_crowdsale_address` variable. (This will allow you to easily fetch the crowdsale’s address later.)

    * Set the `KaseiCoinCrowdsale` contract as a minter.

    * Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.

5. Compile the contract by using compiler version 0.5.0.

6. Check for any errors, and debug them as needed.
![image](https://user-images.githubusercontent.com/98926434/180881261-6a55d77c-f857-42cb-9b69-da3a25bd978a.png)

### Step 4: Deploy and Test the Crowdsale on a Local Blockchain
1. Deploy the crowdsale to a local blockchain by using Remix, MetaMask, and Ganache.
![image](https://user-images.githubusercontent.com/98926434/180881630-efd4dfb9-2263-4c5f-96ed-7232ebec4ce5.png)
![image](https://user-images.githubusercontent.com/98926434/180881681-f59bfdc9-4936-4743-adc2-bee42ab9667c.png)


2. Test the functionality of the crowdsale by using test accounts to buy new tokens and then checking the balances of those accounts.

3. Review the total supply of minted tokens and the amount of wei that the crowdsale contract has raised.
![image](https://user-images.githubusercontent.com/98926434/180881781-b69a3082-938a-4fd3-a27d-ca9bd86a9e26.png)
