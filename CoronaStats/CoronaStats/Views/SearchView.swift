//
//  SearchView.swift
//  CoronaStats
//
//  Created by 小肥圓 on 7/17/20.
//  Copyright © 2020 Hsiao Yuan Wang. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    // variable to bind with user type text
    @Binding var searchText: String
    
    var body: some View {
        
        HStack {
            TextField("Country...", text: $searchText)
            .padding()
        }
    .frame(height: 50)
    .background(Color("cardBackgroundGray"))
    }
}
