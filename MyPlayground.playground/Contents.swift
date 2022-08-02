import UIKit

//1. Sa se scrie o functie care pentru o propozitie data creeaza un cuvant cu prima litera a feicarui cuvant, mai putin cele de legatura (max 3 litere). ex: Charlie si Fabrica de Ciocolata -> CFC
var sentence = "Charlie si Fabrica de Ciocolata";
var array = sentence.split(separator: " ")
var firstLetters = array
    .filter({ (val) -> Bool in
        return val.count > 3 })
    .map ({ $0.prefix(1) })
    .joined(separator: "")
print(firstLetters)
//new commit
//2. Sa se scrie o functie care primeste ca si parametru un cuvant si returneaza cuvantul scris in pasareasca. Practic dupa fiecare vocala se insereaza "p<vocala>". Ex: elena -> epelepenapa

var word = "elena"
var vowels = "aeiou"
var pasareasca = word.map({vowels.contains($0) ? "\($0)p\($0)" : "\($0)"}).joined(separator: "")
print(pasareasca)
