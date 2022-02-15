//
//class SoccerPlayer {
//    func saveTheBall(goalkeeeper:String ) { }
//    func scoreGoal(striker:String ) { }
//    func pass() { }
//    func tackle(defender:String ) { }
//}

//Good SRP Practice
protocol Goalkeeper {
    func save()
}
protocol Striker {
    func score()
}
protocol Defender {
    func tackle()
}

class SoccerPlayer {
    func saveTheBall(goalkeeeper:Goalkeeper ) { goalkeeeper.save() }
    func scoreGoal(striker:Striker ) { striker.score() }
    func pass() { }
    func tackle(defender:Defender ) { defender.tackle() }
}
