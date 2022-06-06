//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

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
  // stores information about creators
  struct Creator {
    uint256 creatorId;
    string firstName;
    string lastName;
    string description;
    string banner;
    Category category;
    uint256 created;
    uint256 updated;
  }

  // store information about creator posts
  struct Post {
    uint256 postId;
    uint256 timestamp;
    string title;
    string data;
    string banner;
    string likes;   // change to struct
    string comments;    // change to struct
    uint256 created;
    uint256 updated;
  }

  // store information about creator levels
  struct Levels {
    uint256 cost;    // store in wei?
    string title;
    string banner;
    string description;
  }

  // store information about members
  struct Members {
    address wallet;
    string[] subscriptions;   // array of creatorIds, change to mapping with creatorId and level
  }

  // store information about categories
  struct Category {
    string name;
    string description;
  }

  uint256 private creatorCounter = 0;
  Creator[] creators;

  //outlines use of SafeMath for uint256 variables
  using SafeMath for uint256;

  /* ========== EVENTS ========== */
  event CreatorCreated(uint256 creatorId, uint256 created);

  /* ========== CONSTRUCTOR ========== */
  constructor() payable {
    
  }

  /**
    * @notice create a new creator and adds it to the creator array
    * @param _firstName first name of creator
    * @param _lastName last name of creator
    * @param _description creator description
    * @param _banner IPFS URL of creator banner image
    * @return output success/fail of transaction
    * NOTE: optimize function for gas
  */
  function createCreator(
    string memory _firstName,
    string memory _lastName,
    string memory _description,
    string memory _banner) external returns(bool output) {
      require(bytes(_firstName).length > 0, "First Name can't be empty");
      require(bytes(_lastName).length > 0, "Last Name can't be empty");
      require(bytes(_description).length > 0, "Description can't be empty");
      require(bytes(_banner).length > 0, "Banner URL can't be empty");

      creatorCounter++;   // increment creator counter
      creators.push(
        Creator(
          creatorCounter,
          _firstName,
          _lastName,
          _description,
          _banner,
          Category("test","test"),
          block.timestamp,
          block.timestamp
        )
      );

      return true;

      //console.log(msg.sender,"set purpose to",purpose);
      //emit CreatorCreated();
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
