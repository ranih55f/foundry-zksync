// Automatically generated from `foundry-cheatcodes` Vm definitions. Do not modify manually.
// This interface is just for internal testing purposes. Use `forge-std` instead.

// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.4;

interface Vm {
    error CheatcodeError(string message);

    enum CallerMode {
        None,
        Broadcast,
        RecurrentBroadcast,
        Prank,
        RecurrentPrank
    }
    enum AccountAccessKind {
        Call,
        DelegateCall,
        CallCode,
        StaticCall,
        Create,
        SelfDestruct,
        Resume
    }

    struct Log {
        bytes32[] topics;
        bytes data;
        address emitter;
    }

    struct Rpc {
        string key;
        string url;
    }

    struct EthGetLogs {
        address emitter;
        bytes32[] topics;
        bytes data;
        bytes32 blockHash;
        uint64 blockNumber;
        bytes32 transactionHash;
        uint64 transactionIndex;
        uint256 logIndex;
        bool removed;
    }

    struct DirEntry {
        string errorMessage;
        string path;
        uint64 depth;
        bool isDir;
        bool isSymlink;
    }

    struct FsMetadata {
        bool isDir;
        bool isSymlink;
        uint256 length;
        bool readOnly;
        uint256 modified;
        uint256 accessed;
        uint256 created;
    }

    struct Wallet {
        address addr;
        uint256 publicKeyX;
        uint256 publicKeyY;
        uint256 privateKey;
    }

    struct FfiResult {
        int32 exitCode;
        bytes stdout;
        bytes stderr;
    }

    struct ChainInfo {
        uint256 forkId;
        uint256 chainId;
    }

    struct AccountAccess {
        ChainInfo chainInfo;
        AccountAccessKind kind;
        address account;
        address accessor;
        bool initialized;
        uint256 oldBalance;
        uint256 newBalance;
        bytes deployedCode;
        uint256 value;
        bytes data;
        bool reverted;
        StorageAccess[] storageAccesses;
    }

    struct StorageAccess {
        address account;
        bytes32 slot;
        bool isWrite;
        bytes32 previousValue;
        bytes32 newValue;
        bool reverted;
    }

    function accesses(address target) external returns (bytes32[] memory readSlots, bytes32[] memory writeSlots);
    function activeFork() external view returns (uint256 forkId);
    function addr(uint256 privateKey) external pure returns (address keyAddr);
    function allowCheatcodes(address account) external;
    function assume(bool condition) external pure;
    function breakpoint(string calldata char) external;
    function breakpoint(string calldata char, bool value) external;
    function broadcast() external;
    function broadcast(address signer) external;
    function broadcast(uint256 privateKey) external;
    function chainId(uint256 newChainId) external;
    function clearMockedCalls() external;
    function closeFile(string calldata path) external;
    function coinbase(address newCoinbase) external;
    function computeCreate2Address(bytes32 salt, bytes32 initCodeHash, address deployer)
        external
        pure
        returns (address);
    function computeCreate2Address(bytes32 salt, bytes32 initCodeHash) external pure returns (address);
    function computeCreateAddress(address deployer, uint256 nonce) external pure returns (address);
    function cool(address target) external;
    function copyFile(string calldata from, string calldata to) external returns (uint64 copied);
    function createDir(string calldata path, bool recursive) external;
    function createFork(string calldata urlOrAlias) external returns (uint256 forkId);
    function createFork(string calldata urlOrAlias, uint256 blockNumber) external returns (uint256 forkId);
    function createFork(string calldata urlOrAlias, bytes32 txHash) external returns (uint256 forkId);
    function createSelectFork(string calldata urlOrAlias) external returns (uint256 forkId);
    function createSelectFork(string calldata urlOrAlias, uint256 blockNumber) external returns (uint256 forkId);
    function createSelectFork(string calldata urlOrAlias, bytes32 txHash) external returns (uint256 forkId);
    function createWallet(string calldata walletLabel) external returns (Wallet memory wallet);
    function createWallet(uint256 privateKey) external returns (Wallet memory wallet);
    function createWallet(uint256 privateKey, string calldata walletLabel) external returns (Wallet memory wallet);
    function deal(address account, uint256 newBalance) external;
    function deriveKey(string calldata mnemonic, uint32 index) external pure returns (uint256 privateKey);
    function deriveKey(string calldata mnemonic, string calldata derivationPath, uint32 index)
        external
        pure
        returns (uint256 privateKey);
    function deriveKey(string calldata mnemonic, uint32 index, string calldata language)
        external
        pure
        returns (uint256 privateKey);
    function deriveKey(string calldata mnemonic, string calldata derivationPath, uint32 index, string calldata language)
        external
        pure
        returns (uint256 privateKey);
    function difficulty(uint256 newDifficulty) external;
    function envAddress(string calldata name) external view returns (address value);
    function envAddress(string calldata name, string calldata delim) external view returns (address[] memory value);
    function envBool(string calldata name) external view returns (bool value);
    function envBool(string calldata name, string calldata delim) external view returns (bool[] memory value);
    function envBytes32(string calldata name) external view returns (bytes32 value);
    function envBytes32(string calldata name, string calldata delim) external view returns (bytes32[] memory value);
    function envBytes(string calldata name) external view returns (bytes memory value);
    function envBytes(string calldata name, string calldata delim) external view returns (bytes[] memory value);
    function envInt(string calldata name) external view returns (int256 value);
    function envInt(string calldata name, string calldata delim) external view returns (int256[] memory value);
    function envOr(string calldata name, bool defaultValue) external returns (bool value);
    function envOr(string calldata name, uint256 defaultValue) external returns (uint256 value);
    function envOr(string calldata name, string calldata delim, address[] calldata defaultValue)
        external
        returns (address[] memory value);
    function envOr(string calldata name, string calldata delim, bytes32[] calldata defaultValue)
        external
        returns (bytes32[] memory value);
    function envOr(string calldata name, string calldata delim, string[] calldata defaultValue)
        external
        returns (string[] memory value);
    function envOr(string calldata name, string calldata delim, bytes[] calldata defaultValue)
        external
        returns (bytes[] memory value);
    function envOr(string calldata name, int256 defaultValue) external returns (int256 value);
    function envOr(string calldata name, address defaultValue) external returns (address value);
    function envOr(string calldata name, bytes32 defaultValue) external returns (bytes32 value);
    function envOr(string calldata name, string calldata defaultValue) external returns (string memory value);
    function envOr(string calldata name, bytes calldata defaultValue) external returns (bytes memory value);
    function envOr(string calldata name, string calldata delim, bool[] calldata defaultValue)
        external
        returns (bool[] memory value);
    function envOr(string calldata name, string calldata delim, uint256[] calldata defaultValue)
        external
        returns (uint256[] memory value);
    function envOr(string calldata name, string calldata delim, int256[] calldata defaultValue)
        external
        returns (int256[] memory value);
    function envString(string calldata name) external view returns (string memory value);
    function envString(string calldata name, string calldata delim) external view returns (string[] memory value);
    function envUint(string calldata name) external view returns (uint256 value);
    function envUint(string calldata name, string calldata delim) external view returns (uint256[] memory value);
    function etch(address target, bytes calldata newRuntimeBytecode) external;
    function eth_getLogs(uint256 fromBlock, uint256 toBlock, address addr, bytes32[] memory topics)
        external
        returns (EthGetLogs[] memory logs);
    function exists(string calldata path) external returns (bool result);
    function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes calldata data) external;
    function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes calldata data, uint64 count)
        external;
    function expectCall(address callee, bytes calldata data) external;
    function expectCall(address callee, bytes calldata data, uint64 count) external;
    function expectCall(address callee, uint256 msgValue, bytes calldata data) external;
    function expectCall(address callee, uint256 msgValue, bytes calldata data, uint64 count) external;
    function expectCall(address callee, uint256 msgValue, uint64 gas, bytes calldata data) external;
    function expectCall(address callee, uint256 msgValue, uint64 gas, bytes calldata data, uint64 count) external;
    function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData) external;
    function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData, address emitter)
        external;
    function expectEmit() external;
    function expectEmit(address emitter) external;
    function expectRevert() external;
    function expectRevert(bytes4 revertData) external;
    function expectRevert(bytes calldata revertData) external;
    function expectSafeMemory(uint64 min, uint64 max) external;
    function expectSafeMemoryCall(uint64 min, uint64 max) external;
    function fee(uint256 newBasefee) external;
    function ffi(string[] calldata commandInput) external returns (bytes memory result);
    function fsMetadata(string calldata path) external view returns (FsMetadata memory metadata);
    function getCode(string calldata artifactPath) external view returns (bytes memory creationBytecode);
    function getDeployedCode(string calldata artifactPath) external view returns (bytes memory runtimeBytecode);
    function getLabel(address account) external returns (string memory currentLabel);
    function getMappingKeyAndParentOf(address target, bytes32 elementSlot)
        external
        returns (bool found, bytes32 key, bytes32 parent);
    function getMappingLength(address target, bytes32 mappingSlot) external returns (uint256 length);
    function getMappingSlotAt(address target, bytes32 mappingSlot, uint256 idx) external returns (bytes32 value);
    function getNonce(address account) external view returns (uint64 nonce);
    function getNonce(Wallet calldata wallet) external returns (uint64 nonce);
    function getRecordedLogs() external returns (Log[] memory logs);
    function isDir(string calldata path) external returns (bool result);
    function isFile(string calldata path) external returns (bool result);
    function isPersistent(address account) external view returns (bool persistent);
    function keyExists(string calldata json, string calldata key) external view returns (bool);
    function label(address account, string calldata newLabel) external;
    function load(address target, bytes32 slot) external view returns (bytes32 data);
    function loadAllocs(string calldata pathToAllocsJson) external;
    function makePersistent(address account) external;
    function makePersistent(address account0, address account1) external;
    function makePersistent(address account0, address account1, address account2) external;
    function makePersistent(address[] calldata accounts) external;
    function mockCallRevert(address callee, bytes calldata data, bytes calldata revertData) external;
    function mockCallRevert(address callee, uint256 msgValue, bytes calldata data, bytes calldata revertData)
        external;
    function mockCall(address callee, bytes calldata data, bytes calldata returnData) external;
    function mockCall(address callee, uint256 msgValue, bytes calldata data, bytes calldata returnData) external;
    function parseAddress(string calldata stringifiedValue) external pure returns (address parsedValue);
    function parseBool(string calldata stringifiedValue) external pure returns (bool parsedValue);
    function parseBytes(string calldata stringifiedValue) external pure returns (bytes memory parsedValue);
    function parseBytes32(string calldata stringifiedValue) external pure returns (bytes32 parsedValue);
    function parseInt(string calldata stringifiedValue) external pure returns (int256 parsedValue);
    function parseJsonAddress(string calldata json, string calldata key) external pure returns (address);
    function parseJsonAddressArray(string calldata json, string calldata key)
        external
        pure
        returns (address[] memory);
    function parseJsonBool(string calldata json, string calldata key) external pure returns (bool);
    function parseJsonBoolArray(string calldata json, string calldata key) external pure returns (bool[] memory);
    function parseJsonBytes(string calldata json, string calldata key) external pure returns (bytes memory);
    function parseJsonBytes32(string calldata json, string calldata key) external pure returns (bytes32);
    function parseJsonBytes32Array(string calldata json, string calldata key)
        external
        pure
        returns (bytes32[] memory);
    function parseJsonBytesArray(string calldata json, string calldata key) external pure returns (bytes[] memory);
    function parseJsonInt(string calldata json, string calldata key) external pure returns (int256);
    function parseJsonIntArray(string calldata json, string calldata key) external pure returns (int256[] memory);
    function parseJsonKeys(string calldata json, string calldata key) external pure returns (string[] memory keys);
    function parseJsonString(string calldata json, string calldata key) external pure returns (string memory);
    function parseJsonStringArray(string calldata json, string calldata key) external pure returns (string[] memory);
    function parseJsonUint(string calldata json, string calldata key) external pure returns (uint256);
    function parseJsonUintArray(string calldata json, string calldata key) external pure returns (uint256[] memory);
    function parseJson(string calldata json) external pure returns (bytes memory abiEncodedData);
    function parseJson(string calldata json, string calldata key) external pure returns (bytes memory abiEncodedData);
    function parseUint(string calldata stringifiedValue) external pure returns (uint256 parsedValue);
    function pauseGasMetering() external;
    function prank(address msgSender) external;
    function prank(address msgSender, address txOrigin) external;
    function prevrandao(bytes32 newPrevrandao) external;
    function projectRoot() external view returns (string memory path);
    function readCallers() external returns (CallerMode callerMode, address msgSender, address txOrigin);
    function readDir(string calldata path) external view returns (DirEntry[] memory entries);
    function readDir(string calldata path, uint64 maxDepth) external view returns (DirEntry[] memory entries);
    function readDir(string calldata path, uint64 maxDepth, bool followLinks)
        external
        view
        returns (DirEntry[] memory entries);
    function readFile(string calldata path) external view returns (string memory data);
    function readFileBinary(string calldata path) external view returns (bytes memory data);
    function readLine(string calldata path) external view returns (string memory line);
    function readLink(string calldata linkPath) external view returns (string memory targetPath);
    function record() external;
    function recordLogs() external;
    function rememberKey(uint256 privateKey) external returns (address keyAddr);
    function removeDir(string calldata path, bool recursive) external;
    function removeFile(string calldata path) external;
    function resetNonce(address account) external;
    function resumeGasMetering() external;
    function revertTo(uint256 snapshotId) external returns (bool success);
    function revokePersistent(address account) external;
    function revokePersistent(address[] calldata accounts) external;
    function roll(uint256 newHeight) external;
    function rollFork(uint256 blockNumber) external;
    function rollFork(bytes32 txHash) external;
    function rollFork(uint256 forkId, uint256 blockNumber) external;
    function rollFork(uint256 forkId, bytes32 txHash) external;
    function rpc(string calldata method, string calldata params) external returns (bytes memory data);
    function rpcUrl(string calldata rpcAlias) external view returns (string memory json);
    function rpcUrlStructs() external view returns (Rpc[] memory urls);
    function rpcUrls() external view returns (string[2][] memory urls);
    function selectFork(uint256 forkId) external;
    function serializeAddress(string calldata objectKey, string calldata valueKey, address value)
        external
        returns (string memory json);
    function serializeAddress(string calldata objectKey, string calldata valueKey, address[] calldata values)
        external
        returns (string memory json);
    function serializeBool(string calldata objectKey, string calldata valueKey, bool value)
        external
        returns (string memory json);
    function serializeBool(string calldata objectKey, string calldata valueKey, bool[] calldata values)
        external
        returns (string memory json);
    function serializeBytes32(string calldata objectKey, string calldata valueKey, bytes32 value)
        external
        returns (string memory json);
    function serializeBytes32(string calldata objectKey, string calldata valueKey, bytes32[] calldata values)
        external
        returns (string memory json);
    function serializeBytes(string calldata objectKey, string calldata valueKey, bytes calldata value)
        external
        returns (string memory json);
    function serializeBytes(string calldata objectKey, string calldata valueKey, bytes[] calldata values)
        external
        returns (string memory json);
    function serializeInt(string calldata objectKey, string calldata valueKey, int256 value)
        external
        returns (string memory json);
    function serializeInt(string calldata objectKey, string calldata valueKey, int256[] calldata values)
        external
        returns (string memory json);
    function serializeJson(string calldata objectKey, string calldata value) external returns (string memory json);
    function serializeString(string calldata objectKey, string calldata valueKey, string calldata value)
        external
        returns (string memory json);
    function serializeString(string calldata objectKey, string calldata valueKey, string[] calldata values)
        external
        returns (string memory json);
    function serializeUint(string calldata objectKey, string calldata valueKey, uint256 value)
        external
        returns (string memory json);
    function serializeUint(string calldata objectKey, string calldata valueKey, uint256[] calldata values)
        external
        returns (string memory json);
    function setEnv(string calldata name, string calldata value) external;
    function setNonce(address account, uint64 newNonce) external;
    function setNonceUnsafe(address account, uint64 newNonce) external;
    function sign(uint256 privateKey, bytes32 digest) external pure returns (uint8 v, bytes32 r, bytes32 s);
    function sign(Wallet calldata wallet, bytes32 digest) external returns (uint8 v, bytes32 r, bytes32 s);
    function skip(bool skipTest) external;
    function sleep(uint256 duration) external;
    function snapshot() external returns (uint256 snapshotId);
    function startBroadcast() external;
    function startBroadcast(address signer) external;
    function startBroadcast(uint256 privateKey) external;
    function startMappingRecording() external;
    function startPrank(address msgSender) external;
    function startPrank(address msgSender, address txOrigin) external;
    function startStateDiffRecording() external;
    function stopAndReturnStateDiff() external returns (AccountAccess[] memory accesses);
    function stopBroadcast() external;
    function stopMappingRecording() external;
    function stopPrank() external;
    function store(address target, bytes32 slot, bytes32 value) external;
    function toString(address value) external pure returns (string memory stringifiedValue);
    function toString(bytes calldata value) external pure returns (string memory stringifiedValue);
    function toString(bytes32 value) external pure returns (string memory stringifiedValue);
    function toString(bool value) external pure returns (string memory stringifiedValue);
    function toString(uint256 value) external pure returns (string memory stringifiedValue);
    function toString(int256 value) external pure returns (string memory stringifiedValue);
    function transact(bytes32 txHash) external;
    function transact(uint256 forkId, bytes32 txHash) external;
    function tryFfi(string[] calldata commandInput) external returns (FfiResult memory result);
    function txGasPrice(uint256 newGasPrice) external;
    function unixTime() external returns (uint256 milliseconds);
    function warp(uint256 newTimestamp) external;
    function writeFile(string calldata path, string calldata data) external;
    function writeFileBinary(string calldata path, bytes calldata data) external;
    function writeJson(string calldata json, string calldata path) external;
    function writeJson(string calldata json, string calldata path, string calldata valueKey) external;
    function writeLine(string calldata path, string calldata data) external;
}
