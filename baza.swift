//
//  baza.swift
//  never have i ever
//
//  Created by Jakub Górka on 20/12/2021.
//

import Foundation

class System: ObservableObject{
    @Published var pytania: Array<String> = []
    @Published var counter: Int = -1
    @Published var wykorzystane: Array<Int> = []
    
    init(){
        pytania.append("Aby zobaczyć pierwsze pytanie kliknij \"Następne\"")
    }
}

func losujPytanie(nr: inout Int, baza: inout System){
    baza.pytania.remove(at: nr)
    baza.counter -= 1
    let errorCheck: Int = nr;
//    if(baza.counter == 0){
//        baza.pytania[0] = "Skonczyly sie pytania"
//        nr = 0
//        return
//    }
//    else{
    while(nr == errorCheck || nr == baza.counter){
            nr = Int.random(in: 0...(baza.counter))
        }
//    }
    
    
}

func wczytajPytaniaZPliku(baza: inout System){
    do {
        let path: String = Bundle.main.path(forResource: "pytania", ofType: "txt")!
        let file = try String(contentsOfFile: path)
        var text: [String] = file.components(separatedBy: "\n")
        text.remove(at: text.count-1)
        baza.pytania = text
        baza.counter = text.count
    } catch let error {
        Swift.print("Fatal Error: \(error.localizedDescription)")
    }
    
    var doSprawdzenia: Int = baza.counter-1
    while(doSprawdzenia != 0){
        if(baza.pytania[doSprawdzenia] == ""){
            baza.pytania.remove(at: doSprawdzenia)
            baza.counter -= 1
        }
        doSprawdzenia -= 1

    }
}

func pomieszajPytania(baza: inout System){
    baza.pytania.shuffle()
    
//    var pytania: Array<String> = baza.pytania
//    var nr: Int
//    baza.pytania.removeAll()
//    while(pytania.count > 0){
//        nr = Int.random(in: 0...(pytania.count-1))
//        baza.pytania.append(pytania[nr])
//        pytania.remove(at: nr)
//        print("dodano pytanie \(nr): \(baza.pytania[baza.pytania.count-1])")
//    }
    
}

func startSystem(baza: inout System){

    wczytajPytaniaZPliku(baza: &baza)
    pomieszajPytania(baza: &baza)
    baza.pytania.insert("Koniec bazy pytań", at: 0); baza.counter += 1
}
