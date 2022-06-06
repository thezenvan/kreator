pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
 * @title Kreator - A Platform For Creators
 * @author @thezenvan
 * @notice Functions for working with the Kreator front-end
 */
contract Kreator {
  /* ========== GLOBAL VARIABLES ========== */

  // store information about categories
  struct Category {
    string name;
    string description;
  }

  // stores information about creators
  struct Creator {
    string name;
    string description;
    string banner;
    Category[] category;
  }

  // store information about creator posts
  struct Post {
    string timestamp;
    string title;
    string data;
    string banner;
    string likes;   // change to struct
    string comments;    // change to struct
  }

  // store information about creator levels
  struct Levels {
    uint256 cost;    // store in wei?
    string title;
    string banner;
    string description;
  }

  // store information 

  mapping (uint256 => Creator) creators;

  using SafeMath for uint256; //outlines use of SafeMath for uint256 variables

  /* ========== EVENTS ========== */

  /* ========== CONSTRUCTOR ========== */
  constructor() payable {
    
  }

  /**
    * @notice create a new creator and adds it to the creator array
    * @param _name name of creator
    * @param _description creator description
    * @param _banner IPFS URL of creator banner image
    * NOTE: optimize function for gas
  */
  function createCreator(string memory _name, string memory _description, string memory _banner) public {
      require(bytes(_name).length > 0, "Name can't be empty");
      //console.log(msg.sender,"set purpose to",purpose);
      //emit SetPurpose(msg.sender, purpose);
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
