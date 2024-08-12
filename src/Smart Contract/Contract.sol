// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract proje is ERC1155,Ownable{
 
 uint256 public constant TWEET1=0;
 uint256 public constant TWEET2=1;
 uint256 deadline;
 uint256 nftCount;
 uint256 _id;
 mapping(address=>uint256) public balances;

 constructor() ERC1155("https://rsbbnpsqvccz.usemoralis.com/{id}.json"){
     _mint(msg.sender,TWEET1,1,"");
     _mint(msg.sender,TWEET2,1,"");
 }
 function mint(address account,uint256 id,uint256 amount) public{
   _mint(account,id,amount,"");
   nftCount=nftCount+amount;
   _id=_id+1;
 }
 function burn(address account,uint256 id,uint256 amount) public{
    _burn(account,id,amount);
    nftCount=nftCount-amount;
 }
 function transfer(address from,address to,uint256 id,uint256 amount) public{
    _safeTransferFrom(from, to, id, amount, "");
 }
 function getNftCount() view public returns(uint256){
     return nftCount;
 }
 function getId()view public returns(uint256){
     return _id;
 }
}