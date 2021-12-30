//
//  ContentView.swift
//  Dicee-swiftUi
//
//  Created by vinicius p  vieira on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    var numbers = ["One", "Two", "Three", "Four", "Five", "Six"]
    @State var leftDiceNumber = "One"
    @State var rightDiceNumber = "One"
    var body: some View {
        ZStack {
            Image("GreenBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("DiceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = numbers[Int.random(in: 0 ... 5)]
                    self.rightDiceNumber = numbers[Int.random(in: 0 ... 5)]
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: String
    var body: some View {
        Image("Dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}
