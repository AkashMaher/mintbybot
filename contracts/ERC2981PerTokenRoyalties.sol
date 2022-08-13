// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ERC2981Base.sol";
/// @dev This is a contract used to add ERC2981 support to ERC721 and 1155
abstract contract ERC2981PerTokenRoyalties is ERC2981Base {
    mapping(uint256 => RoyaltyInfo) internal _royalties;

    /// @dev Sets token royalties
    /// @param tokenId the token id fir which we register the royalties
    /// @param recipient recipient of the royalties
    /// @param percent percentage (using 2 decimals - 10000 = 100, 0 = 0)
	/// @param amount royalty amount that does not depend on the price of the token
    function _setTokenRoyalty(
        uint256 tokenId,
        address recipient,
        uint256 percent,
		uint256 amount
    ) internal {
        require(percent <= 10000, 'ERC2981Royalties: Too high');
        _royalties[tokenId] = RoyaltyInfo(recipient, uint24(percent), amount);
    }

    /// @inheritdoc	IERC2981Royalties
    function royaltyInfo(uint256 tokenId, uint256 value)
        external
        view
        override
        returns (address receiver, uint256 royaltyAmount)
    {
        RoyaltyInfo memory royalties = _royalties[tokenId];
        receiver = royalties.recipient;
		if (royalties.amount == 0) {
          royaltyAmount = (value * royalties.percent) / 10000;
		}
		else{
		  royaltyAmount = royalties.amount;
		}
    }
}