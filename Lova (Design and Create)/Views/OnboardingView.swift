//
//  OnboardingView.swift
//  Lova (Design and Create)
//
//  Created by Emmanuel Campbell on 8/10/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            background
            
            content
                .offset(y: showModal ? -50 : 0)
            
            Color("Shadow")
                .opacity(showModal ? 0.4 : 0)
                .ignoresSafeArea()
            
            if showModal {
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button {
                            withAnimation(.spring()) {
                                showModal = false
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .frame(width: 36, height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
                        }
                            .frame(maxHeight: .infinity, alignment: .bottom)
                    )
                    .zIndex(1)
            }
            Button {
                withAnimation {
                    show = false
                }
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 36,height: 36)
                    .background(.black)
                    .foregroundColor(.white)
                    .mask(Circle())
                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .offset(y: showModal ? -200 : 80)
    }
}
    var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Lova design & art")
                .font(.custom("Poppins Bold", size: 60))
                .frame(width: 260, alignment: .leading)
                .foregroundColor(.white)
            
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
               
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .overlay(
                    Label("Start the course", systemImage: "arrow.forward")
                        .offset(x: 0, y: 0)
                        .font(.headline)
                        
                )
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y: 10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        withAnimation(.spring()) {
                            showModal = true
                        }
                    }
            }
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
                .foregroundColor(.white)
        }
        .padding(40)
        .padding(.top, 40)
    }
    
    var background: some View {
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
            Image("Spline")
                .blur(radius: 50)
                .offset(x: 200, y: 100)
        )
            .background(Color(hex: "28282B"))
    }
}

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true))
    }
}
