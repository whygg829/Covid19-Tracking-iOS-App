//
//  TotalDataCard.swift
//  CoronaStats
//
//  Created by 小肥圓 on 7/17/20.
//  Copyright © 2020 Hsiao Yuan Wang. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number: String = "Err"
    var name: String = "Confirmed"
    var color: Color = .primary
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack {
                
                Text(self.number)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(5)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(5)
                    .foregroundColor(self.color)
            }
                .frame(width: geometry.size.width, height: 80,
                   alignment: .center)
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8.0)
        }
        
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
