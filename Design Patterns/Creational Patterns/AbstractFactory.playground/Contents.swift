import UIKit

protocol Engine {
    func start()
}

class Motorcycle: Engine {
    func start() {
        print("Motorcycle start method called")
    }
}

class Car: Engine {
    func start() {
        print("Car start method called")
    }
}

class EM: Engine {
    func start() {
        print("EM start method called")
    }
}

class EV: Engine {
    func start() {
        print("EV start method called")
    }
}

protocol AbstractFactory {
    func getEngine(_ engineType: String) -> Engine?
}

class CarEngineFactory: AbstractFactory {
    func getEngine(_ engineType: String) -> Engine? {
        if (engineType == "Regular") {
            return Car()
        }else if (engineType == "Electric") {
            return EV()
        }
        return nil
    }
}

class MotorcycleEngineFactory: AbstractFactory {
    func getEngine(_ engineType: String) -> Engine? {
        if (engineType == "Regular") {
            return Motorcycle()
        }else if (engineType == "Electric") {
            return EM()
        }
        return nil
    }
}


class FactoryProducer {
    static func getFactory(isCar: Bool) -> AbstractFactory {
        return isCar ? CarEngineFactory() : MotorcycleEngineFactory()
    }
}


    let carFactory = FactoryProducer.getFactory(isCar: true)
    if let ford = carFactory.getEngine("Regular"){
        ford.start()
    }
    if let tesla = carFactory.getEngine("Electric") {
        tesla.start()
    }
    let motorcycleFactory = FactoryProducer.getFactory(isCar: false)
    if let harley = motorcycleFactory.getEngine("Regular") {
        harley.start()
    }
    if let electricMotor = motorcycleFactory.getEngine("Electric") {
        electricMotor.start()
    }
