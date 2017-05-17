//
//  main.swift
//  LTMGeneric
//

import Foundation

/// enum Couleur
enum Couleur {
    case noir
    case blanc
    case rouge
    case vert
    case bleu
}

/// class Point adhérant à Equatable
class Point : Equatable {
    
    // Adhésion au protocole Equatable
    static func == ( left:Point, right:Point ) -> Bool {
        return left.x == right.x && left.y == right.y
    }
    
    var x:Double
    var y:Double
    
    init( x:Double, y:Double ) {
        self.x = x
        self.y = y
    }
}

/// Le Segment contient 2 points
class Segment : Equatable {
    
    var p1 = Point( x:1.0, y:2.0 )
    var p2 = Point( x:1.1, y:2.1)
    
    var couleur:Couleur = .noir
    
    static func == ( left:Segment, right:Segment ) -> Bool {
        return left.p1 == right.p1 && left.p2 == right.p2
    }
}

/// Utilise les types contraints
func swapObjet<T: Equatable>( _ objet1: inout T, _ objet2: inout T ) {
    
    // Appel de l'opérateur ==
    if( objet1 == objet2 ) {
        return
    }
    
    // swapping
    let temp = objet1
    objet1 = objet2
    objet2 = temp
}

var p3:Point = Point( x:4.5, y:5.4)
var p4:Point = Point( x:1.4, y:0.6)

swapObjet( &p3, &p4 )
print( p3, p4 )

var seg1 = Segment()
var seg2 = Segment()

swapObjet( &seg1, &seg2 )

//

struct NoData : Error {}

/// class StackInt
class StackInt {
    private var tab:[Int] = [Int]()
    
    func push( valeur: Int ) {
        tab.append(valeur)
    }
    
    func pop() throws -> Int {
        guard tab.count > 0 else {
            throw NoData()
        }
        
        return tab.popLast()!
    }
    
    var count:Int { return tab.count }
}

/// Generic Stack<T>
class Stack<T> {
    private var tab:[T] = [T]()
    
    func push( valeur: T ) {
        tab.append(valeur)
    }
    
    func pop() throws -> T {
        guard tab.count > 0 else {
            throw NoData()
        }
        return tab.popLast()!
    }
    
    var count:Int { return tab.count }
}























