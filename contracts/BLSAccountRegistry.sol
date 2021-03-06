pragma solidity ^0.5.15;

import { AccountTree } from "./AccountTree.sol";
import { BLS } from "./libs/BLS.sol";

contract BLSAccountRegistry is AccountTree {
    event PubkeyRegistered(uint256[4] pubkey, uint256 pubkeyID);

    function register(uint256[4] calldata pubkey) external returns (uint256) {
        bytes32 leaf = keccak256(abi.encodePacked(pubkey));
        uint256 pubkeyID = _updateSingle(leaf);
        emit PubkeyRegistered(pubkey, pubkeyID);
        return pubkeyID;
    }

    function registerBatch(uint256[4][BATCH_SIZE] calldata pubkeys)
        external
        returns (uint256)
    {
        bytes32[BATCH_SIZE] memory leafs;
        for (uint256 i = 0; i < BATCH_SIZE; i++) {
            emit PubkeyRegistered(pubkeys[i], leafIndexRight + SET_SIZE + i);
            bytes32 leaf = keccak256(abi.encodePacked(pubkeys[i]));
            leafs[i] = leaf;
        }
        uint256 lowerOffset = _updateBatch(leafs);
        return lowerOffset;
    }

    function exists(
        uint256 pubkeyID,
        uint256[4] calldata pubkey,
        bytes32[WITNESS_LENGTH] calldata witness
    ) external view returns (bool) {
        bytes32 leaf = keccak256(abi.encodePacked(pubkey));
        return _checkInclusion(leaf, pubkeyID, witness);
    }
}
