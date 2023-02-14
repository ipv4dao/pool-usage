// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/access/Ownable.sol";
//import "./ipv4dao_root_tokens.abi.json";
interface RootTokensContract {
        function totalSupply() external view returns (uint256);
        function ownerOf(uint256 tokenId) external view returns (address owner);
        function balanceOf(address owner) external view returns (uint256 balance);
}

contract PoolUsageVote is Ownable {
    RootTokensContract rootTokens = RootTokensContract(address(0x9d83e140330758a8fFD07F8Bd73e86ebcA8a5692));

    struct Votes {
        uint8 grow;
        uint8 help;
        uint8 daouse;
        uint8 liquidate;
    }
    struct Results {
        uint256 grow;
        uint256 help;
        uint256 daouse;
        uint256 liquidate;
        uint256 timestamp;
    } 
    Results public results;
    mapping(address => Votes) public poolVotes;

    function vote(Votes memory _newVote) public {
        //Checking that the sum is 100
        require(_newVote.grow+_newVote.help+_newVote.daouse+_newVote.liquidate==100, "The sum of all options should be equal to 100");
        require(rootTokens.balanceOf(msg.sender)>0, "You should own at least one Root Token to vote");
        poolVotes[msg.sender]=_newVote;

  }
  function refreshResults () public {
      Results memory newResult;
      address curOwner;
      newResult.grow=0;
      newResult.help=0;
      newResult.daouse=0;
      newResult.liquidate=0;
      uint256 totalSupply=rootTokens.totalSupply();
      for (uint256 i=1; i <= totalSupply; i++) {
        curOwner = rootTokens.ownerOf(i);
        newResult.grow += poolVotes[curOwner].grow;
        newResult.help += poolVotes[curOwner].help;
        newResult.daouse += poolVotes[curOwner].daouse;
        newResult.liquidate += poolVotes[curOwner].liquidate;
        }
    newResult.timestamp=block.timestamp;
    results=newResult;
  }
}
