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
    let rightAnswer = "ClIMB"
    
    init() {
        addTiles()
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
            
            if cursorPosition.column == 5 && tiles[index].leter != "" /* && isARealWorld == true */ {
                checkLine() // this Hass to be done before we move to the next row because it's getting its row information from the current cursor position
                cursorPosition.column = 1
                
                if cursorPosition.row != 6 {
                    cursorPosition.row += 1
                }
            }
        }
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
                    hasAVerticalMach[column - 1] = true
                }
                else {
                    tiles[index].status = .rong
                }
            }
        }
        // diagonal test for rightWrongSpot
        for column in 1...5 {
            if hasAVerticalMach[column - 1] == false {
                if let index = self.tiles.firstIndex(where: { $0.coordinates == Coordinates(row: cursorPosition.row, column: column) }) {
                    for letterInAnswer in 1...5 {
                        if hasAVerticalMach[letterInAnswer - 1] == false || hasAVerticalMach[letterInAnswer - 1] == false {
                            if tiles[index].leter.uppercased() == rightAnswer[letterInAnswer - 1] {
                                tiles[index].status = .rightWrongSpot
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


extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
