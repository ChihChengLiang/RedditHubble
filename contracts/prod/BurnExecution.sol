pragma solidity ^0.5.15;
pragma experimental ABIEncoderV2;

import { BurnExecution } from "../BurnExecution.sol";
import { MerkleTreeUtils as MTUtils } from "../MerkleTreeUtils.sol";
import { Governance } from "../Governance.sol";
import { NameRegistry as Registry } from "../NameRegistry.sol";
import { ParamManager } from "../libs/ParamManager.sol";

contract BurnExecutionProduction is BurnExecution {
    constructor(Registry _registry) public {
        nameRegistry = _registry;

        governance = Governance(
            nameRegistry.getContractDetails(ParamManager.Governance())
        );

        merkleUtils = MTUtils(
            nameRegistry.getContractDetails(ParamManager.MERKLE_UTILS())
        );
    }
}
