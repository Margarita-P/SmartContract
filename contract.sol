pragma solidity 0.5.1;

contract Counter {
    uint public BuyerPays = 0;
    uint public SellerSells = 0;
    uint public CourierShips = 0;
    uint public BuyerReceives = 0;
    uint public ContractComplete = 0;

    event Pay(uint value);
    event Sell(uint value);
    event Ship(uint value);
    event bReceive(uint value);
    event complete(uint value);

    
    function Buyer() public {
        BuyerPays = 1;
        emit Pay(BuyerPays);
    }

    function Seller() public {
        SellerSells = 1;
        emit Sell(SellerSells);
    }

    function Courier() public {
        CourierShips = 1;
        emit Ship(CourierShips);
    }

    function Receive() public {
        BuyerReceives = 1;
        emit bReceive(BuyerReceives);
    }

    function Complete() public {
        if(BuyerPays == 1 && SellerSells == 1 && CourierShips == 1 && BuyerReceives == 1) {
            ContractComplete = 1;
        } 
        emit complete(ContractComplete);
    }
   
}