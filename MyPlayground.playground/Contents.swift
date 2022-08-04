//Se da o lista de studenti in format json cu urmatoarele date pt fiecare student: nume, prenume, data nasterii, domiciliu (tara, oras, judet, strada), an, profil. Sa se modeleze o clasa Student care sa contina elementele date si sa se foloseasca pentru incarcarea json-ului intr-un array de obiecte de tip student.

import UIKit

struct Students: Decodable {
    let firstName: String
    let lastName: String
    let dateOfBirth: String
    let location: Location
    let year: String
    let profile: String
}

struct Location: Decodable {
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
    print("\(person.firstName) \(person.lastName) locuieste in \(person.location.country) juetul \(person.location.conty) pe strada \(person.location.street) din \(person.location.city)")
}
