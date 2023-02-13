// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
import "@openzeppelin/contracts/access/Ownable.sol";
//import "https://github.com/ipv4dao/root_tokens/blob/main/ipv4dao_root_tokens.sol";
contract PoolUsageVote is Ownable {
    struct Votes {
        uint8 grow;
        uint8 help;
        uint8 daouse;
        uint8 liquidate;
    }
    mapping(address => Votes) public poolVotes;

    function vote(Votes memory _newVote) public {
        require(_newVote.grow+_newVote.help+_newVote.daouse+_newVote.liquidate==100, "The sum should be equal to 100");
        poolVotes[msg.sender].grow=_newVote.grow;
        poolVotes[msg.sender].help=_newVote.help;
        poolVotes[msg.sender].daouse=_newVote.daouse;
        poolVotes[msg.sender].liquidate=_newVote.liquidate;

  }
}
