// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract Proxy is TransparentUpgradeableProxy {
    receive() external payable {}

    constructor(
        address tss_contract,
        address admin_,
        bytes memory _data
    ) TransparentUpgradeableProxy(tss_contract, admin_, _data) {}
}
