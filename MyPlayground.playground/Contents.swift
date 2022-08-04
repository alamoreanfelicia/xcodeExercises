//Se da o lista de studenti in format json cu urmatoarele date pt fiecare student: nume, prenume, data nasterii, domiciliu (tara, oras, judet, strada), an, profil. Sa se modeleze o clasa Student care sa contina elementele date si sa se foloseasca pentru incarcarea json-ului intr-un array de obiecte de tip student.

import UIKit


struct Students: Decodable {
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let address: Address
    let year: Int
    let profile: String
}

struct Address: Decodable {
    let country: String
    let conty: String
    let city: String
    let street: String
}


guard let sourceURL = Bundle.main.url(forResource: "studentsDates", withExtension: "json") else {
    fatalError("errorrrr")
}

guard let studentData = try? Data(contentsOf: sourceURL) else {
    fatalError("error")
}

let decoder = JSONDecoder()

guard let student = try? decoder.decode([Students].self, from: studentData) else {
    fatalError("eroare")
}

for person in student {
    
    var name: String {
        return ("\(person.firstName) \(person.lastName)")
    }
    var studentAddress: String {
        return ("\(person.address.country), judetul \(person.address.conty), oras \(person.address.city), strada \(person.address.street)")
    }
    var description: String {
        return ("este nascut la data de \(person.dateOfBirth), este la facultatea de \(person.profile) si se afla in anul \(person.year) de studiu")
    }
    print("\(name) locuieste in \(studentAddress) si \(description)")

}



