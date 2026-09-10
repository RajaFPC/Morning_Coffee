//
//  ContentView.swift
//  Morning_Coffee
//
//  Created by Raja Abhishek Lagadapati on 8/27/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(CoffeeManager.self) private var coffeeManager
    var body: some View {
        VStack{
            // Title
            Text("It's time for your morning coffee ☕️")
                .font(.system(size: 20))
                .foregroundStyle(LinearGradient(
                    colors: [Color("LightBrown"), Color("DarkBrown")],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
//                .foregroundStyle(Color("DarkBrown"))
            
            
            // Content Box
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundStyle(Color("DeepGray"))
                ScrollView{
                    VStack {
                        if coffeeManager.coffee.isEmpty {Text("No Images yet...")} else {
                            ForEach(coffeeManager.coffee){ coffeeItem in AsyncImage(url: coffeeItem.file) { image in
                                image.resizable().aspectRatio(contentMode: .fit)}
                                placeholder: {
                                    Text("Images coming soon...")
                                        .foregroundStyle(Color.white)
                                }
                            }
                            
                        }
                        
                    }
                }
/*
               AsyncImage(url: coffeeManager.coffee?.file) { image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    Text("Images coming soon...")
                        .foregroundStyle(Color.white)
                }
 */
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .clipped()
                
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color("LightBrown"), lineWidth: 1)
                
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 25)
            
            // Button
            Button{
                Task { do {try await coffeeManager.getCoffee()
                } catch { print(error)
                }
                }
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius:8)
                        .foregroundStyle(Color("DarkBrown"))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                    Text("Call To Action")
                        .bold()
                        .foregroundStyle(Color.white)
                }
                .border(Color("LightBrown"), width: 1)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
                
            }
        }
        .task {
            do { try await coffeeManager.getCoffee()}
            catch { print(error)}
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // for the full screen to be used

        .background(Color("LightCream"))
    }
}

#Preview {
    ContentView()
}


