// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import {Script} from "forge-std/Script.sol";
import "../src/core/TssGroupManager.sol";
import "../src/access/proxy/Proxy.sol";

contract TssGroupManagerScript is Script {
    TssGroupManager tssGroupManager;
    Proxy proxyTssGroupManager;

    function run() public {
        vm.startBroadcast();
        address admin = msg.sender;

        tssGroupManager = new TssGroupManager();
        proxyTssGroupManager = new Proxy(address(tssGroupManager), admin, "");
        TssGroupManager(address(proxyTssGroupManager)).initialize();

        vm.stopBroadcast();
    }
}