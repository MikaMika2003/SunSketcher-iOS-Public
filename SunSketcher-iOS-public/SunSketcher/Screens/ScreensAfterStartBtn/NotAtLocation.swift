//
//  NotAtLocation.swift
//  Sunsketcher
//
//  Created by Ferguson, Tameka on 2/9/24.
//

import SwiftUI

struct NotAtLocation: View {
    @Environment(\.dismiss) private var dismiss
    let prefs = UserDefaults.standard
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack{
                
                ZStack {
                    // For background
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .background(Color(red: 0.04, green: 0.04, blue: 0.03))
                        .offset(x: 0, y: 0)
                    
                    // For logo
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.14)
                        .background(
                            Image("img-logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geo.size.width * 0.65, height: geo.size.height * 0.07)
                                .clipped()
                            
                        )
                        .offset(x: 0, y: -geo.size.height * 0.45)
                        .padding(.top, 20)
                    
                    // For eclipse image
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: geo.size.width * 0.85, height: geo.size.height * 1)
                        .background(
                            Image("img-eclipse")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width * 1, height: geo.size.height * 1.4)
                            
                        )
                        .offset(x: 0, y: geo.size.height * 0.22)
                    
                
                    VStack {
                        // This is for the top white line of the background overlay
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: geo.size.width, height: geo.size.height * 0.004)
                            .background(Color(red: 1, green: 1, blue: 1))
                            .padding(.top, geo.size.height * 0.11)
                        
                        ZStack {
                            // For dark somewhat clear background overlay
                            Color.black.opacity(0.4)
                                .frame(width: geo.size.width * 1, height: geo.size.height * 0.8)
                                .offset(x: 0, y: geo.size.height * 0.04)
                            
                            
                            VStack {
                                
                                Text("Oh no!")
                                    .font(
                                        Font.custom("Oswald", size: geo.size.width * 0.14)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(width: geo.size.width * 0.9, alignment: .top)
                                    .offset(x: 0, y: geo.size.height * 0.1)
                                
                                
                                Text("Please wait to activate the camera until you are at the location you will be during the eclipse.")
                                    .font(
                                        Font.custom("Montserrat", size: geo.size.width * 0.06)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .offset(x: 0, y: geo.size.height * 0.13)
                                
                                
                                
                                
                                // For button
                                Button(action: {
                                    print("Button pressed")
                                    prefs.set(true, forKey: "Close skiptutorial")
                                    
                                    prefs.setValue(true, forKey: "Close locverif")
                                    
                                    dismiss()
                                
                                }) {
                                    Image("ic-checkmark")
                                        .frame(width: geo.size.width * 0.10, height: geo.size.width * 0.08)
                                        .offset(x: geo.size.width * 0.0, y: geo.size.height * 0.03)
                                        .padding(.top, geo.size.height * 0.3)
                                }
                                
                            }// VStack
                        }// ZStack
                        .padding(.top, geo.size.width * 0.01)
                        
                        // This is for the bottom white line of the background overlay
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: geo.size.width, height: geo.size.height * 0.004)
                            .background(Color(red: 1, green: 1, blue: 1))
                            .padding(.top, geo.size.height * 0.028)
                    }// VStack
                    
                }// Zstack
            }// Navigation stack
            .navigationBarBackButtonHidden()
            
        }// Geometry reader
    }
}

#Preview {
    NotAtLocation()
}
