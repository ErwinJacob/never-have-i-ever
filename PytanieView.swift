//
//  PytanieView.swift
//  never have i ever
//
//  Created by Jakub Górka on 20/12/2021.
//

import SwiftUI

struct PytanieView: View {
    
//    @State var tekst: String = "pytanie numero uno"
    @State var nrPytania: Int = 0
    @State var baza: System = System()
    @State var start: Bool = false
    var body: some View {

        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 35)
                    .frame(width: 340, height: 650)
                    .foregroundColor(.blue)
            
                VStack{
                    Text("Nigdy, przenigdy...")
                        .bold()
                        .foregroundColor(.white)
                        .font(.title)
                        .padding(.top, 30.0)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            
                            

//                        Text("Nr pytania: \(nrPytania) \\ \(String(baza.counter))")
                        if baza.counter == 0{
                            Text("Brak pytań")
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        else if baza.counter == -1{
                            Text(" ")
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding()
                        }

                        else{
                        Text("Pozostało pytań: \(String(baza.counter-1))")
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()

                    
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            
                            

                        Text(baza.pytania[nrPytania])
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        if(start == false){
                            startSystem(baza: &baza)
                            start = true
                        }
                        
                        if(baza.counter > 0){
                            nrPytania = baza.counter - 1
                            baza.counter -= 1
                        }
                        else{
                            nrPytania = 0
                            baza.counter = 0
                        }
//                        losujPytanie(nr: &nrPytania, baza: &baza)
                        }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: 300, height: 60)
                                .padding(.bottom, 25)
                                .foregroundColor(.white)
                            
                                
                            HStack{
                                Spacer()
                                Text("Następne pytanie")
                                    .bold()
                                Spacer()
                                Text(">>>")
                                    .bold()
                                    .font(.title3)
                                Spacer()
                            }
                            
                            .padding(.bottom, 25)
                            
                        }
                        .frame(width: 300, height: 60, alignment: .center)
                    })
                }
                
            }
            .frame(width: 340, height: 650)
            
        }

    }
}

struct PytanieView_Previews: PreviewProvider {
    static var previews: some View {
        PytanieView()
    }
}
