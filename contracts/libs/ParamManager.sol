pragma solidity ^0.5.15;

library ParamManager {
    function DEPOSIT_MANAGER() public pure returns (bytes32) {
        return keccak256("deposit_manager");
    }

    function WITHDRAW_MANAGER() public pure returns (bytes32) {
        return keccak256("withdraw_manager");
    }

    function TEST_TOKEN() public pure returns (bytes32) {
        return keccak256("test_token");
    }

    function POB() public pure returns (bytes32) {
        return keccak256("pob");
    }

    function Governance() public pure returns (bytes32) {
        return keccak256("governance");
    }

    function ROLLUP_CORE() public pure returns (bytes32) {
        return keccak256("rollup_core");
    }

    function ACCOUNT_REGISTRY() public pure returns (bytes32) {
        return keccak256("account_registry");
    }

    function LOGGER() public pure returns (bytes32) {
        return keccak256("logger");
    }

    function MERKLE_UTILS() public pure returns (bytes32) {
        return keccak256("merkle_lib");
    }

    function PARAM_MANAGER() public pure returns (bytes32) {
        return keccak256("param_manager");
    }

    function TOKEN_REGISTRY() public pure returns (bytes32) {
        return keccak256("token_registry");
    }

    function TRANSFER() public pure returns (bytes32) {
        return keccak256("transfer");
    }

    function MASS_MIGS() public pure returns (bytes32) {
        return keccak256("mass_migs");
    }

    function SPOKE_REGISTRY() public pure returns (bytes32) {
        return keccak256("spoke_registry");
    }

    function VAULT() public pure returns (bytes32) {
        return keccak256("vault");
    }

    bytes32 public constant _CHAIN_ID = keccak256("hubble-123");

    function CHAIN_ID() public pure returns (bytes32) {
        return _CHAIN_ID;
    }
}
