pragma solidity 0.5.1;

contract CoinFlip {
    mapping(address => uint) balances;
    address payable[] recipients;

    uint public outcome = 1;
    uint private chosen;
    uint public winner;

    address payable player;
    
    function flip() public{
        uint temp = uint(keccak256(abi.encodePacked(now, block.difficulty, msg.sender))) % 5;
        if(temp == 0 || temp == 1) {
            outcome = 1;
        }
        else if (temp == 2 || temp == 3) {
            outcome = 2;
        }
        else if (temp == 4 ) {
            outcome = 3;
        }
    }
    
    function choose(uint number) public {
        chosen = number;
    }

    function seeOutcome() public {
        if(chosen == outcome){
            winner = 1;
        }
        else {
            winner = 2;
        }
    }

    function SeeWinner(address payable addressX) public {
        addressX.transfer(address(this).balance);
    }

    function Loser(address payable addressX) public {
        addressX.transfer(address(this).balance);
    }

    function invest() external payable {
        if(msg.value < 1) {
            revert();
        }
        balances[msg.sender] += msg.value;
    }

    function balanceOf() external view returns(uint) {
        return address(this).balance;
    }
}
