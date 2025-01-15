# Hackaton-Agoric
Project Crosschain Hackaton Agoric

The CrossChainHackathon smart contract is designed for blockchain hackathons and showcases basic cross-chain interaction functionality. Key features include:

Cross-Chain Messaging:

Users can send messages targeted to specific chains by providing a chain identifier and the message content. Messages are stored and can be retrieved later.
Gas Fee Mechanism:

A 5% gas fee is applied to each message sent. This fee is transferred to the contract's owner.
Owner Management:

The contract owner is defined during deployment and can withdraw accumulated funds from the contract.
Events for Transparency:

Emits a CrossChainInteraction event for each message, enabling easy off-chain tracking and notifications.
Secure Access:

Only the owner can withdraw funds, ensuring controlled access to the contract's balance.
This contract provides a foundational template for implementing more advanced features such as oracles, multi-chain integration, or incentivized participation. It is a great starting point for blockchain enthusiasts exploring decentralized applications and cross-chain communication.
