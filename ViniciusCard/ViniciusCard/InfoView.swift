//
//  InfoView.swift
//  ViniciusCard
//
//  Created by vinicius p  vieira on 28/12/21.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(Color.green)
                    Text(text)
                }
            ).padding(.all)
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(
            text: "55-55-123456789", imageName: "phone.fill"
        ).previewLayout(.sizeThatFits)
    }
}
