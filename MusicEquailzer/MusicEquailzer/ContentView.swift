//
//  ContentView.swift
//  MusicEquailzer
//
//  Created by Abhilasha Chumbalkar on 11/10/2021.
//

import SwiftUI

struct ContentView: View {
    let bgColor = Color(red: 0.542, green: 0.0, blue: 0.948)
    var body: some View {
        VStack {
            GroupView()
                .background(LinearGradient(gradient: Gradient(colors: [bgColor, Color.blue.opacity(0.8)]), startPoint: .bottomLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea()
    }
}

struct GroupView: View {
    @State var scale : CGFloat = 1.0
    
    var body: some View {
        HStack {
            BarView(scale: scale, delay: 0.0)
            BarView(scale: scale, delay: 0.1)
            BarView(scale: scale, delay: 0.2)
            BarView(scale: scale, delay: 0.3)
            BarView(scale: scale, delay: 0.4)
        }.padding()
        .onTapGesture {
            self.scale = (self.scale == 1.0 ? 0.2 : 1.0)
        }
    }
}

struct BarView : View {
    var scale : CGFloat
    var delay : Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5).foregroundColor(.white)
            .frame(width: 7, height: 50, alignment: .center)
            .scaleEffect(scale)
            .animation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true).delay(delay), value: self.scale)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
