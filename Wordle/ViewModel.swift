//
//  ViewModel.swift
//  Wordle
//
//  Created by Brady Robshaw on 4/8/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var tiles = [Tile]()
    var cursorPosition = Coordinates(row: 1, column: 1)
    private let words = AcceptableWords()
    private var rightAnswer = ""
    private var keyColor = KeyColor()
    
    init() {
        addTiles()
        pickRightAnswer()
    }
    
    func addTiles() {
        for row in 1...6{
            for column in 1...5 {
                self.tiles.append(contentsOf: [Tile(leter: "",
                                                    status: .blank,
                                                    coordinates: Coordinates(row: row,
                                                                             column: column))])
            }
        }
    }
    
    func pickRightAnswer() {
        let numOfAnswers = words.allAnswers.count
        self.rightAnswer = words.allAnswers[Int.random(in: 0...numOfAnswers-1)]
    }
    
    func tileFromCoordinates(coordinates: Coordinates) -> Tile? {
        for tile in tiles {
            if tile.coordinates == coordinates {
                return tile
            }
        }
        return nil
    }
    
    func colorState(coordinates: Coordinates) -> Color {
        
        for tile in tiles {
            if tile.coordinates == coordinates {
                switch tile.status {
                case .blank:
                    return .clear
                case .rightSpot:
                    return .green
                case .rightWrongSpot:
                    return .yellow
                case .rong:
                    return .gray
                }
            }
        }
        return .clear
        
    }
    
    func leterPress(key: String) {
        
        if let index = self.tiles.firstIndex(where: { $0.coordinates == cursorPosition }) {
            if tiles[index].leter == "" {
                tiles[index].leter = key
            }
        }
        
        if cursorPosition.column < 5 {
            cursorPosition.column += 1
        }
    }
    
    func leterColor(key: String) -> Color {
        
        if key == "A" {
            return keyColor.a
        }
        else if key == "B" {
            return keyColor.b
        }
        else if key == "C" {
            return keyColor.c
        }
        else if key == "D" {
            return keyColor.d
        }
        else if key == "E" {
            return keyColor.e
        }
        else if key == "F" {
            return keyColor.f
        }
        else if key == "G" {
            return keyColor.g
        }
        else if key == "H" {
            return keyColor.h
        }
        else if key == "I" {
            return keyColor.i
        }
        else if key == "J" {
            return keyColor.j
        }
        else if key == "K" {
            return keyColor.k
        }
        else if key == "L" {
            return keyColor.l
        }
        else if key == "M" {
            return keyColor.m
        }
        else if key == "N" {
            return keyColor.n
        }
        else if key == "O" {
            return keyColor.o
        }
        else if key == "P" {
            return keyColor.p
        }
        else if key == "Q" {
            return keyColor.q
        }
        else if key == "R" {
            return keyColor.r
        }
        else if key == "S" {
            return keyColor.s
        }
        else if key == "T" {
            return keyColor.t
        }
        else if key == "U" {
            return keyColor.u
        }
        else if key == "V" {
            return keyColor.v
        }
        else if key == "W" {
            return keyColor.q
        }
        else if key == "X" {
            return keyColor.x
        }
        else if key == "Y" {
            return keyColor.y
        }
        else if key == "Z" {
            return keyColor.z
        }
        return Color.gray
    }
    
    func updateLeterColor(key: String, status: SubmissionStatus) {
        if key == "A" {
            switch status {
            case .rightSpot:
                self.keyColor.a = Color.green
            case .rightWrongSpot:
                if keyColor.a != Color.green {
                    self.keyColor.a = Color.yellow
                }
            case .rong, .blank:
                if keyColor.a != Color.yellow || keyColor.a != Color.green {
                    self.keyColor.a = Color.secondary
                }
            }
        }
        else if key == "B" {
            switch status {
            case .rightSpot:
                self.keyColor.b = Color.green
            case .rightWrongSpot:
                if keyColor.b != Color.green {
                    self.keyColor.b = Color.yellow
                }
            case .rong, .blank:
                if keyColor.b != Color.yellow || keyColor.b != Color.green {
                    self.keyColor.b = Color.secondary
                }
            }
        }
        else if key == "C" {
            switch status {
            case .rightSpot:
                self.keyColor.c = Color.green
            case .rightWrongSpot:
                if keyColor.c != Color.green {
                    self.keyColor.c = Color.yellow
                }
            case .rong, .blank:
                if keyColor.c != Color.yellow || keyColor.c != Color.green {
                    self.keyColor.c = Color.secondary
                }
            }
        }
        else if key == "D" {
            switch status {
            case .rightSpot:
                self.keyColor.d = Color.green
            case .rightWrongSpot:
                if keyColor.d != Color.green {
                    self.keyColor.d = Color.yellow
                }
            case .rong, .blank:
                if keyColor.d != Color.yellow || keyColor.d != Color.green {
                    self.keyColor.d = Color.secondary
                }
            }
        }
        else if key == "E" {
            switch status {
            case .rightSpot:
                self.keyColor.e = Color.green
            case .rightWrongSpot:
                if keyColor.e != Color.green {
                    self.keyColor.e = Color.yellow
                }
            case .rong, .blank:
                if keyColor.e != Color.yellow || keyColor.e != Color.green {
                    self.keyColor.e = Color.secondary
                }
            }
        }
        else if key == "F" {
            switch status {
            case .rightSpot:
                self.keyColor.f = Color.green
            case .rightWrongSpot:
                if keyColor.f != Color.green {
                    self.keyColor.f = Color.yellow
                }
            case .rong, .blank:
                if keyColor.f != Color.yellow || keyColor.f != Color.green {
                    self.keyColor.f = Color.secondary
                }
            }
        }
        else if key == "G" {
            switch status {
            case .rightSpot:
                self.keyColor.g = Color.green
            case .rightWrongSpot:
                if keyColor.g != Color.green {
                    self.keyColor.g = Color.yellow
                }
            case .rong, .blank:
                if keyColor.g != Color.yellow || keyColor.g != Color.green {
                    self.keyColor.g = Color.secondary
                }
            }
        }
        else if key == "H" {
            switch status {
            case .rightSpot:
                self.keyColor.h = Color.green
            case .rightWrongSpot:
                if keyColor.h != Color.green {
                    self.keyColor.h = Color.yellow
                }
            case .rong, .blank:
                if keyColor.h != Color.yellow || keyColor.h != Color.green {
                    self.keyColor.h = Color.secondary
                }
            }
        }
        else if key == "I" {
            switch status {
            case .rightSpot:
                self.keyColor.i = Color.green
            case .rightWrongSpot:
                if keyColor.i != Color.green {
                    self.keyColor.i = Color.yellow
                }
            case .rong, .blank:
                if keyColor.i != Color.yellow || keyColor.i != Color.green {
                    self.keyColor.i = Color.secondary
                }
            }
        }
        else if key == "J" {
            switch status {
            case .rightSpot:
                self.keyColor.j = Color.green
            case .rightWrongSpot:
                if keyColor.j != Color.green {
                    self.keyColor.j = Color.yellow
                }
            case .rong, .blank:
                if keyColor.j != Color.yellow || keyColor.j != Color.green {
                    self.keyColor.j = Color.secondary
                }
            }
        }
        else if key == "K" {
            switch status {
            case .rightSpot:
                self.keyColor.k = Color.green
            case .rightWrongSpot:
                if keyColor.k != Color.green {
                    self.keyColor.k = Color.yellow
                }
            case .rong, .blank:
                if keyColor.k != Color.yellow || keyColor.k != Color.green {
                    self.keyColor.k = Color.secondary
                }
            }
        }
        else if key == "L" {
            switch status {
            case .rightSpot:
                self.keyColor.l = Color.green
            case .rightWrongSpot:
                if keyColor.l != Color.green {
                    self.keyColor.l = Color.yellow
                }
            case .rong, .blank:
                if keyColor.l != Color.yellow || keyColor.l != Color.green {
                    self.keyColor.l = Color.secondary
                }
            }
            
        }
        else if key == "M" {
            switch status {
            case .rightSpot:
                self.keyColor.m = Color.green
            case .rightWrongSpot:
                if keyColor.m != Color.green {
                    self.keyColor.m = Color.yellow
                }
            case .rong, .blank:
                if keyColor.m != Color.yellow || keyColor.m != Color.green {
                    self.keyColor.m = Color.secondary
                }
            }
        }
        else if key == "N" {
            switch status {
            case .rightSpot:
                self.keyColor.n = Color.green
            case .rightWrongSpot:
                if keyColor.n != Color.green {
                    self.keyColor.n = Color.yellow
                }
            case .rong, .blank:
                if keyColor.n != Color.yellow || keyColor.n != Color.green {
                    self.keyColor.n = Color.secondary
                }
            }
        }
        else if key == "O" {
            switch status {
            case .rightSpot:
                self.keyColor.o = Color.green
            case .rightWrongSpot:
                if keyColor.o != Color.green {
                    self.keyColor.o = Color.yellow
                }
            case .rong, .blank:
                if keyColor.o != Color.yellow || keyColor.o != Color.green {
                    self.keyColor.o = Color.secondary
                }
            }
            
        }
        else if key == "P" {
            switch status {
            case .rightSpot:
                self.keyColor.p = Color.green
            case .rightWrongSpot:
                if keyColor.p != Color.green {
                    self.keyColor.p = Color.yellow
                }
            case .rong, .blank:
                if keyColor.p != Color.yellow || keyColor.p != Color.green {
                    self.keyColor.p = Color.secondary
                }
            }
        }
        else if key == "Q" {
            switch status {
            case .rightSpot:
                self.keyColor.q = Color.green
            case .rightWrongSpot:
                if keyColor.q != Color.green {
                    self.keyColor.q = Color.yellow
                }
            case .rong, .blank:
                if keyColor.q != Color.yellow || keyColor.q != Color.green {
                    self.keyColor.q = Color.secondary
                }
            }
        }
        else if key == "R" {
            switch status {
            case .rightSpot:
                self.keyColor.r = Color.green
            case .rightWrongSpot:
                if keyColor.r != Color.green {
                    self.keyColor.r = Color.yellow
                }
            case .rong, .blank:
                if keyColor.r != Color.yellow || keyColor.r != Color.green {
                    self.keyColor.r = Color.secondary
                }
            }
        }
        else if key == "S" {
            switch status {
            case .rightSpot:
                self.keyColor.s = Color.green
            case .rightWrongSpot:
                if keyColor.s != Color.green {
                    self.keyColor.s = Color.yellow
                }
            case .rong, .blank:
                if keyColor.s != Color.yellow || keyColor.s != Color.green {
                    self.keyColor.s = Color.secondary
                }
            }
        }
        else if key == "T" {
            switch status {
            case .rightSpot:
                self.keyColor.t = Color.green
            case .rightWrongSpot:
                if keyColor.t != Color.green {
                    self.keyColor.t = Color.yellow
                }
            case .rong, .blank:
                if keyColor.t != Color.yellow || keyColor.t != Color.green {
                    self.keyColor.t = Color.secondary
                }
            }
        }
        else if key == "U" {
            switch status {
            case .rightSpot:
                self.keyColor.u = Color.green
            case .rightWrongSpot:
                if keyColor.u != Color.green {
                    self.keyColor.u = Color.yellow
                }
            case .rong, .blank:
                if keyColor.u != Color.yellow || keyColor.u != Color.green {
                    self.keyColor.u = Color.secondary
                }
            }
        }
        else if key == "V" {
            switch status {
            case .rightSpot:
                self.keyColor.v = Color.green
            case .rightWrongSpot:
                if keyColor.v != Color.green {
                    self.keyColor.v = Color.yellow
                }
            case .rong, .blank:
                if keyColor.v != Color.yellow || keyColor.v != Color.green {
                    self.keyColor.v = Color.secondary
                }
            }
        }
        else if key == "W" {
            switch status {
            case .rightSpot:
                self.keyColor.w = Color.green
            case .rightWrongSpot:
                if keyColor.w != Color.green {
                    self.keyColor.w = Color.yellow
                }
            case .rong, .blank:
                if keyColor.w != Color.yellow || keyColor.w != Color.green {
                    self.keyColor.w = Color.secondary
                }
            }
        }
        else if key == "X" {
            switch status {
            case .rightSpot:
                self.keyColor.x = Color.green
            case .rightWrongSpot:
                if keyColor.x != Color.green {
                    self.keyColor.x = Color.yellow
                }
            case .rong, .blank:
                if keyColor.x != Color.yellow || keyColor.x != Color.green {
                    self.keyColor.x = Color.secondary
                }
            }
        }
        else if key == "Y" {
            switch status {
            case .rightSpot:
                self.keyColor.y = Color.green
            case .rightWrongSpot:
                if keyColor.y != Color.green {
                    self.keyColor.y = Color.yellow
                }
            case .rong, .blank:
                if keyColor.y != Color.yellow || keyColor.y != Color.green {
                    self.keyColor.y = Color.secondary
                }
            }
        }
        else if key == "Z" {
            switch status {
            case .rightSpot:
                self.keyColor.z = Color.green
            case .rightWrongSpot:
                if keyColor.z != Color.green {
                    self.keyColor.z = Color.yellow
                }
            case .rong, .blank:
                if keyColor.z != Color.yellow || keyColor.z != Color.green {
                    self.keyColor.z = Color.secondary
                }
            }
        }
    }
    
    func baspaceButton() {
        
        if let index = self.tiles.firstIndex(where: { $0.coordinates == cursorPosition }) {
            
            if tiles[index].leter == "" && cursorPosition.column > 1 {
                cursorPosition.column -= 1
                if let index = self.tiles.firstIndex(where: { $0.coordinates == cursorPosition }) {
                    tiles[index].leter = ""
                }
                
            }
            else if cursorPosition.column == 5 || cursorPosition.column == 1 {
                tiles[index].leter = ""
            }
            else {
                print("Something has gone terribly wrong. =( Check your backspace button func! Your cursor position might not be where you expect it to be!")
            }
        }
    }
    
    func enterButton() {
        
        if let index = self.tiles.firstIndex(where: { $0.coordinates == cursorPosition }) {
            let test = isARealWorld()
            if cursorPosition.column == 5 && tiles[index].leter != "" && test == true {
                checkLine() // this Hass to be done before we move to the next row because it's getting its row information from the current cursor position
                cursorPosition.column = 1
                
                if cursorPosition.row != 6 {
                    cursorPosition.row += 1
                }
            }
        }
    }
    
    func isARealWorld() -> Bool {
        var userWord = ""
        for column in 1...5 {
            if let index = self.tiles.firstIndex(where: { $0.coordinates == Coordinates(row: cursorPosition.row, column: column) }) {
                userWord += tiles[index].leter.lowercased()
            }
        }
        return words.input.contains(userWord) || words.allAnswers.contains(userWord)
    }
    
    // this has to be done before we move to the next row because it's getting its row information from the current cursor position
    func checkLine() {
        
        var hasAVerticalMach = [false,false,false,false,false]
        var hasAMach = [false,false,false,false,false]
        
        // vertical test for .rightSpot
        for column in 1...5 {
            if let index = self.tiles.firstIndex(where: { $0.coordinates == Coordinates(row: cursorPosition.row, column: column) }) {
                if rightAnswer[column - 1].uppercased() == tiles[index].leter.uppercased() {
                    tiles[index].status = .rightSpot
                    updateLeterColor(key: tiles[index].leter.uppercased(), status: .rightSpot)
                    hasAVerticalMach[column - 1] = true
                }
                else {
                    tiles[index].status = .rong
                    updateLeterColor(key: tiles[index].leter.uppercased(), status: .rong)
                }
            }
        }
        // diagonal test for rightWrongSpot
        for column in 1...5 {
            if hasAVerticalMach[column - 1] == false {
                if let index = self.tiles.firstIndex(where: { $0.coordinates == Coordinates(row: cursorPosition.row, column: column) }) {
                    for letterInAnswer in 1...5 {
                        if hasAVerticalMach[letterInAnswer - 1] == false && hasAMach[letterInAnswer - 1] == false {
                            if tiles[index].leter.uppercased() == rightAnswer[letterInAnswer - 1].uppercased() {
                                tiles[index].status = .rightWrongSpot
                                updateLeterColor(key: tiles[index].leter.uppercased(), status: .rightWrongSpot)
                                hasAMach[letterInAnswer - 1] = true
                            }
                        }
                    }
                }
            }
        }
    }
}


struct Tile {
    var leter: String
    var status: SubmissionStatus
    let coordinates: Coordinates
}

struct Coordinates: Equatable {
    var row: Int
    var column: Int
}

enum SubmissionStatus {
    case rightSpot
    case rightWrongSpot
    case rong
    case blank
}

struct KeyColor {
    var a = Color.gray
    var b = Color.gray
    var c = Color.gray
    var d = Color.gray
    var e = Color.gray
    var f = Color.gray
    var g = Color.gray
    var h = Color.gray
    var i = Color.gray
    var j = Color.gray
    var k = Color.gray
    var l = Color.gray
    var m = Color.gray
    var n = Color.gray
    var o = Color.gray
    var p = Color.gray
    var q = Color.gray
    var r = Color.gray
    var s = Color.gray
    var t = Color.gray
    var u = Color.gray
    var v = Color.gray
    var w = Color.gray
    var x = Color.gray
    var y = Color.gray
    var z = Color.gray
}

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
