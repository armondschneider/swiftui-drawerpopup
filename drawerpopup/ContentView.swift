//
//  ContentView.swift
//  drawerpopup
//
//  Created by Armond Schneider (@armondme) on 4/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isDrawerOpen = false
    
    var body: some View {
        ZStack {
            
            // Your UI content here
            
            if isDrawerOpen {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            isDrawerOpen = false
                        }
                    }
            }
            
            // Button Styling
            Button(action: {
                withAnimation {
                    isDrawerOpen.toggle()
                }
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 50)
                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.98))
                        .cornerRadius(15)
                    
                    Text("Open Drawer")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                    
                }
                
                
                if isDrawerOpen {
                    BottomDrawerView()
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeInOut(duration: 0.3), value: isDrawerOpen)
        }
    }
    
    // Define your bottom drawer view here
    struct BottomDrawerView: View {
        var body: some View {
            VStack {
                // Your drawer content
                Text("Drawer Content Goes Here")
                    .padding()
            }
            .frame(width: 350, height: 400)
            .background(Color.white)
            .cornerRadius(30)
            .transition(.move(edge: .bottom))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
