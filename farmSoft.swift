//
//  farmSoft.swift
//  a stock management app.
//  follows an OpenClassrooms exercice
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
func harvest(add quantity: Int) {
    barn["wheat"]! += quantity
}
//add wool to the barn
func mow (add quantity: Int) {
    barn["wool"]! += quantity
}
//add milk to the barn
func milk(add quantity: Int) {
    barn["milk"]! += quantity
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
    print("\nton solde est \(income) euros\n")
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

//add quantity
func addQuantity(of type: String) -> Int? {
    print("combien de \(type) ?")
    if let answer = readLine(){
        if let quantity = Int(answer){
            return quantity
        }
    }
    //si la valeur n'est pas lue
    print("je n'ai pas saisie")
    return nil
}


//choose an activity
func activity(){
    print("\nquelle est ton activité ?"
    + "\n1. nourrir les vaches"
    + "\n2. vendre mes produits"
    + "\n3. traire les vaches"
    + "\n4. moissoner le blé"
    + "\n5. tondre les moutons\n")
    
    if let choice = readLine(){
        switch choice {
        case "1": feed()
        case "2": sell()
        case "3": if let quantity = addQuantity(of: "bidons") {
            milk(add: quantity)
            }
        case "4": if let quantity = addQuantity(of: "bottes") {
            harvest(add: quantity)
            }
        case "5": if let quantity = addQuantity(of: "pelottes") {
            mow(add: quantity)
            }
        default:
            print("choisis une activité parmis les suivantes\n")
            activity()
        }
    }
    print("bravo !\n"
        + "\net maintenant, ")
}

//main menu
func menu() {
    print("\nque veux-tu faire ?"
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


