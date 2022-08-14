// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BeyondMetaVerse is ERC721, ERC721URIStorage, Ownable {
    
    constructor() ERC721("BeyondMetaVerse", "BMV") {}

    /**
    
       * @dev safeMint is for minting MTV token 
       * Requirements: 
       * @param addressTo- to mint token to any adress
         @param tokenId- Give an id to token to be minted
         @param uri- string data type tp give unique identifier to any token
       * OnlyOwner is allowed to perform this function
    
    **/

    function safeMint(address addressTo, uint256 tokenId, string memory uri)
        public
        onlyOwner
    {
         _safeMint(addressTo, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
