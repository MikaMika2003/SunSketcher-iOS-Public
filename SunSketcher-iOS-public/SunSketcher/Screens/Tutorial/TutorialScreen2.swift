//
//  TutorialScreen2.swift
//  Sunsketcher
//
//  Created by Ferguson, Tameka on 2/5/24.
//

import SwiftUI

struct TutorialScreen2: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var shouldRefreshView: Bool
    
    let prefs = UserDefaults.standard
    
    let txt = "Approximately 5 minutes before totality, press the start button on the homepage.\nDo not press start until you are at your eclipse viewing location!"
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                
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
                                
                                ScrollView {
                                    Text("Step one")
                                      .font(
                                        Font.custom("Oswald", size: geo.size.width * 0.14)
                                          .weight(.bold)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(.white)
                                      .frame(maxWidth: .infinity)
                                      .padding(.top, -geo.size.height * 0)
                                }.frame(width: geo.size.width * 1, height: geo.size.height * 0.15, alignment: .top)
                                
                                // For image
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: geo.size.width * 0.55, height: geo.size.height * 0.24)
                                    .background(
                                        Image("img-startbtntutorial")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: geo.size.width * 0.73, height: geo.size.height * 0.01)
                                    ).padding(.bottom, geo.size.height * 0.06)
                                
                                ScrollView {
                                    Text(txt)
                                      .font(
                                        Font.custom("Montserrat", size: geo.size.width * 0.049)
                                          .weight(.medium)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(.white)
                                      .frame(maxWidth: .infinity)
                                      //.frame(width: geo.size.width * 0.8, height: geo.size.height * 0.2, alignment: .top)
                                }.frame(width: geo.size.width * 0.9, height: geo.size.height * 0.22)
                                
                                
                                
                                // For buttons
                                HStack {
                                    
                                    NavigationLink(destination: TutorialScreen1(shouldRefreshView:$shouldRefreshView), label: {
                                        EmptyView()
                                    })
                                    .navigationBarBackButtonHidden(true)
                                    Button(action: {
                                        dismiss()
                                    }) {
                                        Image("ic-leftarrow")
                                            .frame(width: geo.size.width * 0.10, height: geo.size.width * 0.08)
                                            .padding(.trailing, geo.size.width * 0.02)
                                            .offset(x: geo.size.width * 0.0, y: geo.size.height * 0.03)
                                    }
                                    
                                    NavigationLink(destination: TutorialScreen3(shouldRefreshView:$shouldRefreshView), label: {
                                        Image("ic-rightarrow")
                                            .frame(width: geo.size.width * 0.10, height: geo.size.width * 0.08)
                                           .padding(.leading, geo.size.width * 0.6)
                                            .offset(x: geo.size.width * 0.0, y: geo.size.height * 0.03)
                                    })
                                }// For HStack
                                
                            }// VStack
                            
                        }// Zstack
                        // This is for the bottom white line of the background overlay
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: geo.size.width, height: geo.size.height * 0.004)
                            .background(Color(red: 1, green: 1, blue: 1))
                            .padding(.top, geo.size.height * 0.04)
                        
                    }// For VStack
                }// For Zstack
            }// For NavigationStack
            .onAppear {
                if prefs.bool(forKey: "Checked") {
                    dismiss()
                }
            }
        }// For geomtry
    }// For body view
}

struct TutorialScreen2_Previews: PreviewProvider {
    static var previews: some View {
        TutorialScreen2(shouldRefreshView: .constant(false))
    }
}
