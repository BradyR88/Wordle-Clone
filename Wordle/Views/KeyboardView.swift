//
//  KeyboardView.swift
//  Wordle
//
//  Created by Brady Robshaw on 4/7/22.
//

import SwiftUI

struct KeyboardView: View {
    
    private let topRow = ["Q","W","E","R","T","Y","U","I","O","P"]
    private let midRow = ["A","S","D","F","G","H","J","K","L"]
    private let bottomRow = ["Z","X","C","V","B","N","N","M"]
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                KeyRow(rowString: topRow, lastrow: false)
                KeyRow(rowString: midRow, lastrow: false)
                KeyRow(rowString: bottomRow, lastrow: true)
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView()
    }
}

struct Key: View {
    
    var keyName: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(8)
                .frame(width: 30, height: 44, alignment: .center)
            Text(keyName)
                .foregroundColor(.white)
        }
    }
}

struct KeyRow: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let rowString: [String]
    let lastrow: Bool
    
    var body: some View {
        HStack {
            Spacer()
            if lastrow == true {
                Button {
                    // enter
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                            .frame(width: 30, height: 44, alignment: .center)
                        Image(systemName: "arrow.up.to.line")
                            .foregroundColor(.white)
                    }
                }

 
            }
            ForEach(rowString, id: \.self) { letter in
                Button {
                    //row letter
                    viewModel.leterPress(key: letter)
                } label: {
                    Key(keyName: letter)
                }

            }
            if lastrow == true {
                Button {
                    // delete
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                            .frame(width: 30, height: 44, alignment: .center)
                        Image(systemName: "delete.left")
                            .foregroundColor(.white)
                    }
                }

            }
            Spacer()
        }
        .frame(height: 44)
    }
}
