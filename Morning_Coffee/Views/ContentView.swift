//
//  ContentView.swift
//  Morning_Coffee
//
//  Created by Raja Abhishek Lagadapati on 8/27/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            // Title
            Text("It's time for your morning coffee")
                .font(.system(size: 20))
                .foregroundStyle(Color("DarkBrown"))
            
            // Content Box
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    .foregroundStyle(Color("DarkGray"))
                
                Text("Images coming soon...")
                    .foregroundStyle(Color.white)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 25)
            
            // Button
            Button{
                // TODO: CTA functionality
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius:8)
                        .foregroundStyle(Color("DarkBrown"))
                        .frame(maxWidth: .infinity)
                    Text("Call To Action")
                        .bold()
                        .foregroundStyle(Color.white)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // for the full screen to be used
    }
}
#Preview {
    ContentView()
}


