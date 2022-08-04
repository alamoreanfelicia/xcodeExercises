//Se da o lista de studenti in format json cu urmatoarele date pt fiecare student: nume, prenume, data nasterii, domiciliu (tara, oras, judet, strada), an, profil. Sa se modeleze o clasa Student care sa contina elementele date si sa se foloseasca pentru incarcarea json-ului intr-un array de obiecte de tip student.

import UIKit

struct Students: Decodable {
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let address: Address
    let year: Int
    let profile: String
    
    var name: String {
        ("\(firstName) \(lastName)")
    }
    var personAddress: String {
        ("\(address.country), judetul \(address.conty), oras \(address.city), strada \(address.street)")
    }
    var description: String {
        ("este nascut la data de \(dateOfBirth), este la facultatea de \(profile) si se afla in anul \(year) de studiu")
    }
    
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
    let studentName = person.name
    let studentAddress = person.personAddress
    let studentDescription = person.description
    print("\(studentName) locuieste in \(studentAddress) si \(studentDescription)")
}
