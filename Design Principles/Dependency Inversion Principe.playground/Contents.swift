//import UIKit
//
////This is concrete data binding
//class Laptop {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//
//    func ConnectToKeyboard() {
//        let keychron = Keychron(laptop: self)
//        keychron.connection(viaBluetooth: true)
//    }
//}
//
//class Keychron {
//    let laptop: Laptop
//    init(laptop: Laptop) {
//        self.laptop = laptop
//    }
//
//    func connection(viaBluetooth: Bool){
//        print("Keychron connected to \(laptop.name) via \(viaBluetooth ? "bluetooth" : "cable")")
//    }
//}
//
//class GMMK {
//    func connection(laptop: Laptop, viaBluetooth: Bool){
//        print("GMMK connected to \(laptop.name) via \(viaBluetooth ? "bluetooth" : "cable")")
//    }
//}
//
//let u = Laptop(name: "Macbook 2016")
//u.ConnectToKeyboard()

import UIKit
//abstraction introduced, we do not have any concrete class anymore.
//Constructor dependency injection, we could also move it into the method from constructor.
class Laptop {
    let name: String
    let keyboard: KeyboardConnection
    init(name: String, keyboard: KeyboardConnection) {
        self.name = name
        self.keyboard = keyboard
    }

    func connectKeyboard(viaBluetooth: Bool) {
        keyboard.connect(laptopName: self.name, viaBluetooth: viaBluetooth)
    }
}

protocol KeyboardConnection {
    func connect(laptopName: String, viaBluetooth:Bool)
}

class Keychron: KeyboardConnection {
    let laptopName: String
    init(laptopName: String) {
        self.laptopName = laptopName
    }

    func connection(viaBluetooth: Bool){
        print("Keychron connected to \(laptopName) via \(viaBluetooth ? "bluetooth" : "cable")")
    }
    
    func connect(laptopName: String, viaBluetooth:Bool){
        self.connection(viaBluetooth: viaBluetooth)
    }
}

class GMMK : KeyboardConnection {
    func connection(laptopName: String, viaBluetooth: Bool){
        print("GMMK connected to \(laptopName) via \(viaBluetooth ? "bluetooth" : "cable")")
    }
    
    
    func connect(laptopName: String, viaBluetooth:Bool){
        self.connection(laptopName: laptopName, viaBluetooth: viaBluetooth)
    }
}


let u = Laptop(name: "Macbook 2016", keyboard: Keychron(laptopName: "Macbook 2016"))
u.connectKeyboard(viaBluetooth: true)

let u2 = Laptop(name: "Macbook Pro 2021", keyboard: GMMK())
u2.connectKeyboard(viaBluetooth: false)
