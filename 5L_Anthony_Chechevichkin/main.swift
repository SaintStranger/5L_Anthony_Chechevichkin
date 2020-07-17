//
//  main.swift
//  5L_Anthony_Chechevichkin
//
//  Created by Katerina on 17.07.2020.
//  Copyright © 2020 CHAS. All rights reserved.
//

import Foundation

protocol Car {
    var doors: Int { get }
    var speed: Double { get }
    var wheels: Int { get }
    
    func checkDoors () -> Bool
    func checkStatus ()
}

extension Car {
    
    
    func wheelsStatus () -> Bool {
        if wheels >= 4 {
            return true
        } else {
            return false
        }
    }
    
    
    func engingStatus () -> Bool {
        if speed > 0 {
            return true
        } else {
            return false
        }
    }
    
    
    
}



class SportCar: Car {
    
    
    var doors: Int
    
    var speed: Double
    
    var wheels: Int
    
    var topSpeed: Double
    
    init(doors: Int, speed: Double, wheels: Int, topSpeed: Double) {
        self.doors = doors
        self.speed = speed
        self.wheels = wheels
        self.topSpeed = topSpeed
    }
    
    func checkDoors() -> Bool {
        if doors == 2 || doors == 4 {
            return true
        } else {
            return false
        }
    }
    
    
    func checkStatus() {
        if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && topSpeed >= 220 {
            print("Следи за дорогой! У тебя скорость \(topSpeed) км!")
        } else if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && topSpeed <= 220 {
            print("Машина едет, но спортивной её не назовёшь")
        } else if engingStatus() {
            print("Включай мотор, поехали")
        } else {
            print("ОСАГО есть? Пора им воспользоваться")
        }
    }
    
    
}


class SedanCar: Car {
    
    var doors: Int
    
    var speed: Double
    
    var wheels: Int
    
    var safetyPillows: Bool
    
    init(doors: Int, speed: Double, wheels: Int, safetyPillows: Bool) {
        self.doors = doors
        self.speed = speed
        self.wheels = wheels
        self.safetyPillows = safetyPillows
    }
    
    func checkDoors() -> Bool {
        if doors == 4 {
            return true
        } else {
            return false
        }
    }
    
    func checkStatus() {
        if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && safetyPillows == true {
            print("Семья и дети готовы, пикник ждёт")
        } else if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && safetyPillows == false {
            print("Семья и дети готовы, вперёд в реанимацию")
        } else if engingStatus() {
            print("Погоди, проверь подушки")
        } else {
            print("ОСАГО есть? Пора им воспользоваться")
        }
    }
    
    
}


class TrunkCar: Car {
    
    var doors: Int
    
    var speed: Double
    
    var wheels: Int
    
    var maxCapacity: Double
    
    init(doors: Int, speed: Double, wheels: Int, maxCapacity: Double) {
        self.doors = doors
        self.speed = speed
        self.wheels = wheels
        self.maxCapacity = maxCapacity
    }
    
    func checkDoors() -> Bool {
        if doors == 2 {
            return true
        } else {
            return false
        }
    }
    
    func checkStatus() {
        if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && maxCapacity >= 200 {
            print("На холостом ходу пойдёшь, грузи больше")
        } else if checkDoors() == true && engingStatus() == true && wheelsStatus() == true && maxCapacity <= 200 {
            print("Не стоило покупать Газельку")
        } else if engingStatus() {
            print("Дорога ждёт, дальнобойщик")
        } else {
            print("ОСАГО есть? Пора им воспользоваться")
        }
    }
    
    
    
}


class Owner {
    var ownedCars: [Car]
    
    init(ownedCars: [Car]) {
        self.ownedCars = ownedCars
    }
    
    func manStatus () {
        for Car in ownedCars {
            Car.checkStatus()
        }
    }
    
}



extension SportCar: CustomDebugStringConvertible {
    var debugDescription: String {
        return "На скорости \(topSpeed) уже подушки не нужны"
    }
}

extension SedanCar: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Тише едешь - дальше будешь"
    }
}

extension  TrunkCar: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Сейчас загрузим все \(maxCapacity) т и поедем"
    }
}


var McLaren = SportCar(doors: 2, speed: 60, wheels: 4, topSpeed: 280)
var PeterBilt = TrunkCar(doors: 2, speed: 20, wheels: 4, maxCapacity: 200)
var Volvo = SedanCar(doors: 4, speed: 40, wheels: 4, safetyPillows: true)


print(Volvo)
print(McLaren)
print(PeterBilt)


var man = Owner(ownedCars: [McLaren, PeterBilt, Volvo])

man.manStatus()  // Попытка в полиморфизм



//  На самом деле пока вроде все понятно. Сейчас еще раз пройдусь по примеру полиморфизма из методички. Но я, честно говоря, пока не понял, что лучше использовать, чтобы не городить "else if", как в примере выше, Свитч не очень подошёл. Буду рад совету какой-нибудь статьи на эту тему )
