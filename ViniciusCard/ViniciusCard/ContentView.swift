//
//  ContentView.swift
//  ViniciusCard
//
//  Created by vinicius p  vieira on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("perfil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Vinicius Vieira!")
                    .font(Font.custom("Pacifico-Regular", size: 24))
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                Text("IOS developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(
                    text: "55-55-123456789", imageName: "phone.fill"
                )
                InfoView(
                    text: "vinipachecov@gmail.com", imageName: "envelope.fill"
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

