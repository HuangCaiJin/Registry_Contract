// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

abstract contract InitOwner {
    address public owner;
    bool private _initialized = false;
    string public constant NOT_CURRENT_OWNER = "018001";
    string public constant CANNOT_TRANSFER_TO_ZERO_ADDRESS = "018002";
    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );
    // 检查是否为所有者
    modifier onlyOwner()
    {
        require(msg.sender == owner, NOT_CURRENT_OWNER);
        _;
    }
    // 初始化一个所有者
    function initializOwner(address _owner) internal {
        require(!_initialized,'Already initialized');
        owner = _owner;
        _initialized = true;
    }
    function transferOwnership(
        address _newOwner
    ) public onlyOwner
    {
        require(_newOwner != address(0), CANNOT_TRANSFER_TO_ZERO_ADDRESS);
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
}