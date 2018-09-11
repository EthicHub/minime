pragma solidity ^0.4.18;
/*
    Copyright 2017, Raúl Martínez

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import "./TokenFactory.sol";
import "./MiniMeToken.sol";

/// @title FutureMiniMeToken Contract
/// @author Raul Martinez
/// @dev Example of MiniMe with added functionality
contract MockFutureMiniMeToken is MiniMeToken {

    ////////////////
    // Constructor
    ////////////////

    /// @notice Constructor to create a MiniMeToken
    /// @param _tokenFactory The address of the MiniMeTokenFactory contract that
    ///  will create the Clone token contracts, the token factory needs to be
    ///  deployed first
    /// @param _parentToken Address of the parent token, set to 0x0 if it is a
    ///  new token
    /// @param _parentSnapShotBlock Block of the parent token that will
    ///  determine the initial distribution of the clone token, set to 0 if it
    ///  is a new token
    /// @param _tokenName Name of the new token
    /// @param _decimalUnits Number of decimals of the new token
    /// @param _tokenSymbol Token Symbol for the new token
    /// @param _transfersEnabled If true, tokens will be able to be transferred
    function MockFutureMiniMeToken(
        address _tokenFactory,
        address _parentToken,
        uint _parentSnapShotBlock,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol,
        bool _transfersEnabled
    ) MiniMeToken(
        _tokenFactory,
        _parentToken,
        _parentSnapShotBlock,
        _tokenName,
        _decimalUnits,
        _tokenSymbol,
        _transfersEnabled
    ) public {
    }
    /// @dev example of added functionality in future MiniMeTokens
    /// @return sample results
    function achieveDecentralizedWorld() public pure returns (string) {
        return "decentralization achieved";
    }

}

/// @title MilestoneTracker Contract
/// @author Raul Martinez
/// @dev Example of the factory that will generate the FutureMiniMes
contract MockFutureMiniMeTokenFactory is TokenFactory {

  /// @notice Update the DApp by creating a new token with new functionalities
  ///  the msg.sender becomes the controller of this clone token
  /// @param _parentToken Address of the token being cloned
  /// @param _snapshotBlock Block of the parent token that will
  ///  determine the initial distribution of the clone token
  /// @param _tokenName Name of the new token
  /// @param _decimalUnits Number of decimals of the new token
  /// @param _tokenSymbol Token Symbol for the new token
  /// @param _transfersEnabled If true, tokens will be able to be transferred
  /// @return The address of the new token contract
  function createCloneToken(
      address _parentToken,
      uint _snapshotBlock,
      string _tokenName,
      uint8 _decimalUnits,
      string _tokenSymbol,
      bool _transfersEnabled
  ) public returns (address) {
      MockFutureMiniMeToken newToken = new MockFutureMiniMeToken(
          this,
          _parentToken,
          _snapshotBlock,
          _tokenName,
          _decimalUnits,
          _tokenSymbol,
          _transfersEnabled
          );

      newToken.changeController(msg.sender);
      return newToken;
  }
}
