//
//  MainView.swift
//  Wordle
//
//  Created by Brady Robshaw on 4/7/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack (spacing: 0){
            BordView()
            KeyboardView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
