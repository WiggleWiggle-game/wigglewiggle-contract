// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract WiggleFree is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    mapping(address => uint256) private _tokenIdByAddress;
    
    address[] private _userList;

    constructor() ERC721("WiggleFree", "WGGFR") {}

    function safeMint(address _to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(_to, tokenId);
        _userList.push(_to);
        _tokenIdByAddress[_to] = tokenId;
    }

    function getUserList() public view returns (address[] memory) {
        return _userList;
    }

    function getTokenIdByAddress(address _address) public view returns (uint256) {
        return _tokenIdByAddress[_address];
    }
}