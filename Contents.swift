import Foundation

/*
 Observer pattern
 */
protocol Subscriber {
    func notifly(news:String)
}

protocol Subjust {
    func addCustom(subscriber:Subscriber)
    func removeCustom(subscriber:Subscriber)
}

class Custom:Subscriber {
    private var user:String
    
    init(name:String) {
        user = name
    }
    
    func notifly(news: String) {
        print("\(user) receive news [\(news)]")
    }
}

class SubjectManager:Subjust {
    private var subscribers = [Subscriber]()
    
    func addCustom(subscriber:Subscriber) {
        subscribers.append(subscriber)
    }
    
    func removeCustom(subscriber:Subscriber) {
        
    }
    
    func sendNews(news:String) {
        for subscriber in subscribers {
            subscriber.notifly(news:news)
        }
    }
}

let tony = Custom(name:"Tony")
let allen = Custom(name:"Allen")

let newspaper = SubjectManager()
newspaper.addCustom(subscriber: tony)
newspaper.addCustom(subscriber: allen)

newspaper.sendNews(news: "test")



enum OperatorType {
    case Plus
    case Subtract
    case Multiply
    case Divide
}

class Operation {
    private var operand1: Int
    private var operand2: Int
    
    init() {
        operand1 = 0
        operand2 = 0
    }
    
    var Operand1: Int {
        get { return operand1}
        set { operand1 = newValue}
    }
    
    var Operand2: Int {
        get { return operand2 }
        set { operand2 = newValue}
    }
    
    func Result() -> Int {
        return 0
    }
    
}

class Plus : Operation {
    init(operand1: Int, operand2: Int) {
        super.init()
        Operand1 = operand1
        Operand2 = operand2
    }
    override func Result() -> Int {
        return Operand1 + Operand2
    }
}

class Subtract : Operation {
    init(operand1: Int, operand2: Int) {
        super.init()
        Operand1 = operand1
        Operand2 = operand2
    }
    override func Result() -> Int {
        return Operand1 - Operand2
    }
}

class Multiply : Operation {
    init(operand1: Int, operand2: Int) {
        super.init()
        Operand1 = operand1
        Operand2 = operand2
    }
    override func Result() -> Int {
        return Operand1 * Operand2
    }
}

class Divide : Operation {
    init(operand1: Int, operand2: Int) {
        super.init()
        Operand1 = operand1
        Operand2 = operand2
    }
    override func Result() -> Int {
        return Operand1 / Operand2
    }
}


class Calculator {
    func calculation(operationType: OperatorType) -> Int? {
        switch operationType {
        case .Plus:
            let plus = Plus(operand1: 1, operand2: 2)
            print ("Plus result : \(plus.Result())")
        case .Subtract:
            let subtract = Subtract(operand1: 1, operand2: 2)
            print ("Subtract result : \(subtract.Result())")
        case .Multiply:
            let multiply = Multiply(operand1: 1, operand2: 2)
            print ("Multiply result : \(multiply.Result())")
        case .Divide:
            let divide = Divide(operand1: 1, operand2: 2)
            print ("Divide result : \(divide.Result())")
        }
        return 0
    }
}

let calculatoe = Calculator()
calculatoe.calculation(operationType: OperatorType.Plus)
calculatoe.calculation(operationType: OperatorType.Subtract)
calculatoe.calculation(operationType: OperatorType.Multiply)
calculatoe.calculation(operationType: OperatorType.Divide)
