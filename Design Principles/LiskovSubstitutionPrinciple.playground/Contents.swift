//LSP Violation
//class Tesla {
//
//    private var battery: Int = 100
//    private var tirePressure: Int = 34
//    private var carStarted: Bool = false
//
//    func checkBatteryLevel() -> Int {
//        return battery
//    }
//
//    func checkTirePressure() -> Int {
//        return tirePressure
//    }
//
//    func start() -> Bool {
//        carStarted = true
//        return carStarted
//    }
//
//    func stop() -> Bool {
//        carStarted = false
//        return carStarted
//    }
//}
//
//class BMWHybrid {
//
//    private var battery: Int = 100
//    private var fuel: Int = 100
//    private var tirePressure: Int = 34
//    private var carStarted: Bool = false
//
//    func checkBatteryLevel() -> (Int,Int) {
//        return (battery, fuel)
//    }
//
//    func checkTirePressure() -> Int {
//        return tirePressure
//    }
//
//    func start() -> Bool {
//        carStarted = true
//        return carStarted
//    }
//
//    func stop() -> Bool {
//        carStarted = false
//        return carStarted
//    }
//}
//
//class CarOwner {
//    let car: BMWHybrid
//
//    init(car: BMWHybrid) {
//        self.car = car
//    }
//
//    func startTheCar(){
//        if(carPreStartCheksDone()) {
//            car.start()
//        }
//    }
//
//    func carPreStartCheksDone() -> Bool {
//        if (car.checkBatteryLevel().0 > 10  && car.checkTirePressure() > 32){
//            return true
//        }
//        return false
//    }
//}








//Better LSP practice using Interface
//protocol Car {
//    func checkTirePressure() -> Int
//    func start() -> Bool
//    func stop() -> Bool
//    func preStartBatteryLevelCheck() -> Bool
//}
//
//class Tesla: Car {
//
//    private var battery: Int = 100
//    private var tirePressure: Int = 34
//    private var carStarted: Bool = false
//
//    func checkBatteryLevel() -> Int {
//        return battery
//    }
//
//    func checkTirePressure() -> Int {
//        return tirePressure
//    }
//
//    func start() -> Bool {
//        carStarted = true
//        return carStarted
//    }
//
//    func stop() -> Bool {
//        carStarted = false
//        return carStarted
//    }
//
//    func preStartBatteryLevelCheck() -> Bool{
//        return checkBatteryLevel() > 10
//    }
//}
//
//class BMWHybrid: Car {
//
//    private var battery: Int = 100
//    private var fuel: Int = 100
//    private var tirePressure: Int = 34
//    private var carStarted: Bool = false
//
//    func checkBatteryLevel() -> (Int,Int) {
//        return (battery, fuel)
//    }
//
//    func checkTirePressure() -> Int {
//        return tirePressure
//    }
//
//    func start() -> Bool {
//        carStarted = true
//        return carStarted
//    }
//
//    func stop() -> Bool {
//        carStarted = false
//        return carStarted
//    }
//
//    func preStartBatteryLevelCheck() -> Bool{
//        return checkBatteryLevel().0 > 10 && checkBatteryLevel().1 > 8
//    }
//}
//
//class CarOwner {
//    let car: Car
//
//    init(car: Car) {
//        self.car = car
//    }
//
//    func startTheCar(){
//        if(carPreStartCheksDone()) {
//            car.start()
//        }
//    }
//
//    func carPreStartCheksDone() -> Bool {
//        return car.preStartBatteryLevelCheck() && car.checkTirePressure() > 32
//    }
//}


//Better LSP practice using SuperClass
class Car {
    private var battery: Int = 100
    private var tirePressure: Int = 34
    private var carStarted: Bool = false
    
    func checkTirePressure() -> Int {
        return tirePressure
    }
    
    func start() -> Bool {
        carStarted = true
        return carStarted
    }
    
    func stop() -> Bool {
        carStarted = false
        return carStarted
    }
    
    func preStartBatteryLevelCheck() -> Bool{
        return battery > 10
    }
}

class Tesla: Car {
//no override needed at this point
}

class BMWHybrid: Car {
    
    private var fuel: Int = 100
    
    func checkFuelLevel() -> Int {
        return fuel
    }
  
    override func preStartBatteryLevelCheck() -> Bool{
        return super.preStartBatteryLevelCheck() && checkFuelLevel() > 8
    }
}

class CarOwner {
    let car: Car
    
    init(car: Car) {
        self.car = car
    }
    
    func startTheCar(){
        if(carPreStartCheksDone()) {
            car.start()
        }
    }
    
    func carPreStartCheksDone() -> Bool {
        return car.preStartBatteryLevelCheck() && car.checkTirePressure() > 32
    }
}

let bmw = BMWHybrid()
let co = CarOwner(car: bmw)
co.startTheCar()


























