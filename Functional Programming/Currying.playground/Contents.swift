import Foundation

func valuedMember(since date: Date, name: String) -> String {
    let format = DateFormatter()
    format.dateFormat = "yyyy"
    let year = format.string(from: date)
    return "\(name) is a valued member since \(year)."
}


func valuedMember(since date: Date) -> (String) -> String {
    return { name in
        let format = DateFormatter()
        format.dateFormat = "yyyy"
        let year = format.string(from: date)
        return "\(name) is a valued member since \(year)."
    }
}

func curry<A, B, C>(_ f: @escaping (A,B) -> C) -> (A) -> (B) -> C {
    return {a in { b in f(a,b) } }
}

valuedMember(since:name:)
valuedMember(since:)
curry(valuedMember(since:name:))

let curried = curry(valuedMember(since:name:))(Date())
curried("David")
curried("Joe")
