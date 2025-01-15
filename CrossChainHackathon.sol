// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract CrossChainHackathon {
    
    // Owner of the contract
    address public owner;

    // Event to log the interaction
    event CrossChainInteraction(address indexed user, string targetChain, string message);

    // Mapping to store messages per chain
    mapping(string => string[]) private chainMessages;

    // Constructor to set the owner of the contract
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to send a message with a gas fee of 5%
    function sendMessage(string calldata targetChain, string calldata message) external payable {
        require(bytes(targetChain).length > 0, "Target chain cannot be empty");
        require(bytes(message).length > 0, "Message cannot be empty");
        require(msg.value > 0, "A fee must be sent with the message");

        // Calculate the 5% fee
        uint256 fee = (msg.value * 5) / 100;

        // Transfer the fee to the owner
        (bool success, ) = owner.call{value: fee}("");
        require(success, "Fee transfer failed");

        // Store the message
        chainMessages[targetChain].push(message);

        // Emit an event for off-chain tracking or notifications
        emit CrossChainInteraction(msg.sender, targetChain, message);
    }

    // Function to retrieve messages for a specific chain
    function getMessages(string calldata targetChain) external view returns (string[] memory) {
        require(bytes(targetChain).length > 0, "Target chain cannot be empty");
        return chainMessages[targetChain];
    }

    // Function to withdraw contract balance (only for the owner)
    function withdraw() external onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");

        (bool success, ) = owner.call{value: balance}("");
        require(success, "Withdrawal failed");
    }
}
