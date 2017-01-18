//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// Immutability in Swift

let x = 10
var y = 100

/// Enumerations

enum Weekday: UInt32 {
    case monday, tuesday, wednesday, thursday, friday
    
    private static let _count: Weekday.RawValue = {
        var max: UInt32 = 0
        while let _ = Weekday(rawValue: max) {
            max += 1
        }
        return max
    }()
    
    static var randomWeekday: Weekday {
        let random = arc4random_uniform(_count)
        return Weekday(rawValue: random) ?? Weekday.monday
    }
}

func doThingsOn(weekDay: Weekday) {
}

/// Optionals

struct User {
    let name: String!
    let age: Int!
    var emailAddress: String!
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let aUser = User(name: "Kim Jong Un", age: 15)

/// Protocol Oriented Programming

extension CGFloat {
    var radians: CGFloat {
        return CGFloat(M_PI) * (self / 180.0)
    }
}

protocol MyPolygon {
    var sides: Int { get }
    func polygonPoints(center: CGPoint, radius: CGFloat) -> [CGPoint]
}

extension MyPolygon {
    
    func polygonPoints(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        let angle = (360.0 / CGFloat(sides)).radians
        let centerX = center.x
        let centerY = center.y
        var points: [CGPoint] = []
        for i in 0 ... sides {
            let xPosition = centerX + radius * cos(angle * CGFloat(i))
            let yPosition = centerY + radius * sin(angle * CGFloat(i))
            points.append(CGPoint(x: xPosition, y: yPosition))
        }
        return points
    }
}

/// Thinning Cocoa View Controller