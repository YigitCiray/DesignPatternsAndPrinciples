import UIKit

// Bad ISP practice
protocol Payment{
    func usemyBTCWallet()
    func useCreditCard()
    func useCheck()
}

// Good ISP practice
protocol BitcoinPayment{
    func usemyBTCWallet()
}
protocol CreditCardPayment{
    func useCreditCard()
}
protocol CheckPayment{
    func useCheck()
}


class CartUIViewController: Payment{
    func usemyBTCWallet() {//functionality
        
    }
    func useCreditCard() {//functionality
        
    }
    func useCheck() {//functionality
        
    }
    func useETHWaller() {
        //method not used
    }
}

protocol EtheriumPayment{
    func usemyETHWallet()
}

protocol BTCPayment: EtheriumPayment{
    func usemyBTCWallet()
    func usemyBTCLightningAccount()
}

class CartViaCryptoUIViewController: BTCPayment{
    func usemyETHWallet() {
    }
    func usemyBTCLightningAccount() {
    }
    func usemyBTCWallet() {//functionalit
    }
}
