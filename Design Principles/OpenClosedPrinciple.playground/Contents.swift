final class Car {
    
    var engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func start() {
        engine.started = true
    }
    
    func stop() {
        engine.started = false
    }
    
    func maxPower(){
        engine.sportMode()
    }
}

protocol Engine {
    var started: Bool { get set }
    func sportMode()
}

class BMWHybrid: Engine {
    var started: Bool = false
    
    func sportMode() {
        print("BMW sport mode")
    }
}

class Tesla: Engine {
    var started: Bool = false
    
    func sportMode() {
        print("Tesla sport mode")
    }
}


let tesla = Car(engine: Tesla())
let bmw = Car(engine: BMWHybrid())

extension Car {
    func start2() {
        print("start2")
    }
}

