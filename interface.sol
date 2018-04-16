{\rtf1\ansi\ansicpg936\cocoartf1561\cocoasubrtf100
{\fonttbl\f0\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs28 \cf2 \cb3 \expnd0\expndtw0\kerning0
// Abstract contract for the full ERC 20 Token standard\cb1 \
\cb3 // https://github.com/ethereum/EIPs/issues/20\cb1 \
\cb3 pragma solidity ^0.4.18;\cb1 \
\
\
\cb3 contract EIP20Interface \{\cb1 \
\cb3 /* This is a slight change to the ERC20 base standard.\cb1 \
\cb3 function totalSupply() constant returns (uint256 supply);\cb1 \
\cb3 is replaced with:\cb1 \
\cb3 uint256 public totalSupply;\cb1 \
\cb3 This automatically creates a getter function for the totalSupply.\cb1 \
\cb3 This is moved to the base contract since public getter functions are not\cb1 \
\cb3 currently recognised as an implementation of the matching abstract\cb1 \
\cb3 function by the compiler.\cb1 \
\cb3 */\cb1 \
\cb3 /// total amount of tokens\cb1 \
\cb3 uint256 public totalSupply;\cb1 \
\
\cb3 /// @param _owner The address from which the balance will be retrieved\cb1 \
\cb3 /// @return The balance\cb1 \
\cb3 function balanceOf(address _owner) public view returns (uint256 balance);\cb1 \
\
\cb3 /// @notice send `_value` token to `_to` from `msg.sender`\cb1 \
\cb3 /// @param _to The address of the recipient\cb1 \
\cb3 /// @param _value The amount of token to be transferred\cb1 \
\cb3 /// @return Whether the transfer was successful or not\cb1 \
\cb3 function transfer(address _to, uint256 _value) public returns (bool success);\cb1 \
\
\cb3 /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`\cb1 \
\cb3 /// @param _from The address of the sender\cb1 \
\cb3 /// @param _to The address of the recipient\cb1 \
\cb3 /// @param _value The amount of token to be transferred\cb1 \
\cb3 /// @return Whether the transfer was successful or not\cb1 \
\cb3 function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);\cb1 \
\
\cb3 /// @notice `msg.sender` approves `_spender` to spend `_value` tokens\cb1 \
\cb3 /// @param _spender The address of the account able to transfer the tokens\cb1 \
\cb3 /// @param _value The amount of tokens to be approved for transfer\cb1 \
\cb3 /// @return Whether the approval was successful or not\cb1 \
\cb3 function approve(address _spender, uint256 _value) public returns (bool success);\cb1 \
\
\cb3 /// @param _owner The address of the account owning tokens\cb1 \
\cb3 /// @param _spender The address of the account able to transfer the tokens\cb1 \
\cb3 /// @return Amount of remaining tokens allowed to spent\cb1 \
\cb3 function allowance(address _owner, address _spender) public view returns (uint256 remaining);\cb1 \
\
\cb3 // solhint-disable-next-line no-simple-event-func-name \cb1 \
\cb3 event Transfer(address indexed _from, address indexed _to, uint256 _value); \cb1 \
\cb3 event Approval(address indexed _owner, address indexed _spender, uint256 _value);\cb1 \
\cb3 \}}