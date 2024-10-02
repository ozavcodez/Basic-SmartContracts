// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.19;

contract Bank {
    
 struct Account  {
        string name;
        string email;
        bool isActive; 
        uint256 balance; 
    }

    address public owner;

    mapping(address => Account) public accounts;
    mapping(string => bool) public createdAccounts;
    mapping(address => uint) private balances;

   


    event depositEvent(address depositor, uint256 _amount);

    event withdrawEvent(address withdrawer, uint256 _withdraw);

    event accountCreated(address _accountAddress, string name, string email);

    constructor(){
        owner = msg.sender;
    }



    // Creating a new account
    function createbankAccount(string memory _name, string memory _email) public {
       
        // Check if an account with the given name already exists
        require(createdAccounts[_email] == false, "Account already exists");

        // Mark the account name as created
        createdAccounts[_email] = true;

        // create the account
        accounts[msg.sender] = Account(_name, _email, true, 0);
        emit accountCreated(msg.sender, _name, _email);
    }
    
   // Function to get account details 
    function getAccountDetails() public view returns (string memory , string memory , bool , uint256 ) {
        Account memory account = accounts[msg.sender];
        return (account.name, account.email, account.isActive, account.balance);
    }

    //deposit

    function deposit () public payable  returns(uint){
       
        //Check if the new balance is greater than the previous one before deposit
        require((balances[msg.sender] + msg.value) >= balances[msg.sender], "No deposit made");
      
       //update the balance after making a deposit
        balances[msg.sender] += msg.value;

        emit depositEvent(msg.sender, msg.value);
        return balances[msg.sender];    
    }

    //withdraw

    function withdraw(uint256 _amount) public returns (uint256 remainingBalance){
        //check if the withdraw amount is not greater than the current amount
        require(_amount <= balances[msg.sender], "INSUFFICIENT FUNDS");
        
        //update the balance after the withdraw
        balances[msg.sender]-= _amount;
        emit withdrawEvent(msg.sender, _amount);

        return balances[msg.sender];
        
    } 


    //getting balance 
    function getBalance() public view  returns(uint){
        return balances[msg.sender];
    }
  
}

