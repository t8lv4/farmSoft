//
//  farmSoft.swift
//  a stock management app.
//
//  Created by Morgan on 25/01/2018.
//

import Foundation
//===========
//MARK: variables and collection
//===========

var income: Double = 0
var barn: [String : Int] = ["wheat" : 0, "wool" : 0, "milk" : 0]

//===========
//MARK: activity functions
//===========

//feed the cows
func feed () {
    income -= 4
}
//add wheat to the barn
func harvest() {
    barn["wheat"]! += 100
}
//add wool to the barn
func mow () {
    barn["wool"]! += 30
}
//add milk to the barn
func milk() {
    barn["milk"]! += 30
}
//sell products and reset stocks
func sell () {
    income += Double(barn["wheat"]!) * 0.3
    income += Double(barn["wool"]!) * 1
    income += Double(barn["milk"]!) * 0.5
    //empty barn
    barn = ["wheat" : 0, "wool" : 0, "milk" : 0]
}
//get income balance
func bank() {
    print("\nvotre banque contient \(income) euros\n")
}
//print stocks values
func stock(){
    print("\nles stocks :\n"
        + "\n   \(barn["milk"]!) bidons de lait"
        + "\n   \(barn["wheat"]!) bottes de blé"
        + "\n   \(barn["wool"]!) pelottes de laine\n")
}

//============
//MARK: interaction functions
//============

//choose an activity
func activity(){
    print("\nquelle est votre activité ?"
    + "\n1. nourrir les vaches"
    + "\n2. vendre mes produits"
    + "\n3. traire les vaches"
    + "\n4. moissoner le blé"
    + "\n5. tondre les moutons\n")
    
    if let choice = readLine(){
        switch choice {
        case "1": feed()
        case "2": sell()
        case "3": milk()
        case "4": harvest()
        case "5": mow()
        default:
            print("choisissez une activité parmis les suivantes\n")
            activity()
        }
    }
    print("bravo !\n"
        + "\net maintenant,")
}

//main menu
func menu() {
    print("\nque voulez vous faire ?"
        + "\n1. enregistrer une nouvelle activité"
        + "\n2. consulter ma banque"
        + "\n3. consulter les stocks\n")
    
    if let choice = readLine(){
        switch choice {
        case "1":
            activity()
        case "2":
            bank()
        case "3":
            stock()
        default:
            print("\nje ne comprends pas.\n")
            menu()
        }
    }
}


//============
//MARK: loop
//============

while true {
    menu()
}


