//
//  BordView.swift
//  Wordle
//
//  Created by Brady Robshaw on 4/7/22.
//

import SwiftUI

struct BordView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack {
                ForEach((1...6), id: \.self) { row in
                    HStack {
                        ForEach((1...5), id: \.self) { colum in
                            BordTile(coordinates: Coordinates(row: row, column: colum))
                        }
                    }
                }
            }
        }
    }
}

struct BordView_Previews: PreviewProvider {
    static var previews: some View {
        BordView()
            .environmentObject(ViewModel())
    }
}

struct BordTile: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    let coordinates: Coordinates
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 55, height: 55)
                .foregroundColor(viewModel.colorState(coordinates: coordinates))
                .border(viewModel.colorState(coordinates: coordinates) == .clear ? .gray : .clear, width: 2)
            Text(viewModel.tileFromCoordinates(coordinates: coordinates)?.leter ?? "")
                .foregroundColor(.white)
                .bold()
                .font(.largeTitle)
        }
    }
    
}
