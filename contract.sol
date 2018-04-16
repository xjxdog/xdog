{\rtf1\ansi\ansicpg936\cocoartf1561\cocoasubrtf100
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww15500\viewh16100\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
/*\cb1 \
\cb3 Implements EIP20 token standard: https://github.com/ethereum/EIPs/issues/20\cb1 \
\cb3 .*/\cb1 \
\
\
\cb3 pragma solidity ^0.4.18;\cb1 \
\
\cb3 import "./EIP20Interface.sol";\cb1 \
\
\
\cb3 contract TheToken is EIP20Interface \{\cb1 \
\
\cb3 uint256 constant private MAX_UINT256 = 2**256 - 1;\cb1 \
\cb3 mapping (address => uint256) public balances;\cb1 \
\cb3 mapping (address => mapping (address => uint256)) public allowed;\cb1 \
\cb3 /*\cb1 \
\cb3 NOTE:\cb1 \
\cb3 The following variables are OPTIONAL vanities. One does not have to include them.\cb1 \
\cb3 They allow one to customise the token contract & in no way influences the core functionality.\cb1 \
\cb3 Some wallets/interfaces might not even bother to look at this information.\cb1 \
\cb3 */\cb1 \
\cb3 string public name; //fancy name: eg Simon Bucks\cb1 \
\cb3 uint8 public decimals; //How many decimals to show.\cb1 \
\cb3 string public symbol; //An identifier: eg SBX\cb1 \
\
\cb3 function TheToken(\cb1 \
\cb3 uint256 _initialAmount,\cb1 \
\cb3 string _tokenName,\cb1 \
\cb3 uint8 _decimalUnits,\cb1 \
\cb3 string _tokenSymbol\cb1 \
\cb3 ) public \{\cb1 \
\cb3 balances[msg.sender] = _initialAmount; // Give the creator all initial tokens\cb1 \
\cb3 totalSupply = _initialAmount; // Update total supply\cb1 \
\cb3 name = _tokenName; // Set the name for display purposes\cb1 \
\cb3 decimals = _decimalUnits; // Amount of decimals for display purposes\cb1 \
\cb3 symbol = _tokenSymbol; // Set the symbol for display purposes\cb1 \
\cb3 \}\cb1 \
\
\cb3 function transfer(address _to, uint256 _value) public returns (bool success) \{\cb1 \
\cb3 require(balances[msg.sender] >= _value);\cb1 \
\cb3 balances[msg.sender] -= _value;\cb1 \
\cb3 balances[_to] += _value;\cb1 \
\cb3 Transfer(msg.sender, _to, _value);\cb1 \
\cb3 return true;\cb1 \
\cb3 \}\cb1 \
\
\cb3 function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) \{\cb1 \
\cb3 uint256 allowance = allowed[_from][msg.sender];\cb1 \
\cb3 require(balances[_from] >= _value && allowance >= _value);\cb1 \
\cb3 balances[_to] += _value;\cb1 \
\cb3 balances[_from] -= _value;\cb1 \
\cb3 if (allowance < MAX_UINT256) \{\cb1 \
\cb3 allowed[_from][msg.sender] -= _value;\cb1 \
\cb3 \}\cb1 \
\cb3 Transfer(_from, _to, _value);\cb1 \
\cb3 return true;\cb1 \
\cb3 \}\cb1 \
\
\cb3 function balanceOf(address _owner) public view returns (uint256 balance) \{\cb1 \
\cb3 return balances[_owner];\cb1 \
\cb3 \}\cb1 \
\
\cb3 function approve(address _spender, uint256 _value) public returns (bool success) \{\cb1 \
\cb3 allowed[msg.sender][_spender] = _value;\cb1 \
\cb3 Approval(msg.sender, _spender, _value);\cb1 \
\cb3 return true;\cb1 \
\cb3 \}\cb1 \
\
\cb3 function allowance(address _owner, address _spender) public view returns (uint256 remaining) \{\cb1 \
\cb3 return allowed[_owner][_spender];\cb1 \
\cb3 \} \cb1 \
\cb3 \}}