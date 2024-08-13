//
//  BaseView.swift
//  Lova (Design and Create)
//
//  Created by Emmanuel Campbell on 8/12/24.
//

import SwiftUI

struct BaseView: View {
    @State private var isEnlarged = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .frame(width: isEnlarged ? 350 : 300, height: isEnlarged ? 550 : 500)
                .shadow(radius: 10)
                .offset(y: -25)
                .animation(.spring(), value: isEnlarged)
                .onTapGesture {
                    isEnlarged.toggle()
                }
            
            VStack(spacing: 20) {
                Text("M")
                    .font(.custom("Inter Regular", size: isEnlarged ? 46 : 39))
                    .foregroundColor(.white)
                    .scaleEffect(isEnlarged ? 1.2 : 1.0)
                    .offset(y: -10)
            }
            .padding()
            .animation(.spring(), value: isEnlarged)
        }
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x:
                    0, y:3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        
    }
}

struct BaseView_Preview: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
