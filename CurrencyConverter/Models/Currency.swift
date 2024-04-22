import UIKit

struct CurrencyDataResponse: Codable {
    let data: [String: Double]
}

let currencyAbbreviations: [String: String] = [
    "SGD": "Singapore Dollar",
    "BGN": "Bulgarian Lev",
    "AUD": "Australian Dollar",
    "MXN": "Mexican Peso",
    "DKK": "Danish Krone",
    "THB": "Thai Baht",
    "INR": "Indian Rupee",
    "NZD": "New Zealand Dollar",
    "CHF": "Swiss Franc",
    "SEK": "Swedish Krona",
    "KRW": "South Korean Won",
    "ISK": "Icelandic Krona",
    "BRL": "Brazilian Real",
    "PLN": "Polish Zloty",
    "JPY": "Japanese Yen",
    "HUF": "Hungarian Forint",
    "HRK": "Croatian Kuna",
    "PHP": "Philippine Peso",
    "CZK": "Czech Koruna",
    "NOK": "Norwegian Krone",
    "CNY": "Chinese Yuan",
    "TRY": "Turkish Lira",
    "GBP": "British Pound Sterling",
    "IDR": "Indonesian Rupiah",
    "HKD": "Hong Kong Dollar",
    "EUR": "Euro",
    "RON": "Romanian Leu",
    "ZAR": "South African Rand",
    "MYR": "Malaysian Ringgit",
    "RUB": "Russian Ruble",
    "ILS": "Israeli New Shekel",
    "CAD": "Canadian Dollar"
]
func lowerCase(_ input: String) -> String {
    guard input.count == 3 else {
        return "Problem with func:lowerCase"
    }
    let lowercased = input.prefix(2).lowercased()
    return String(lowercased)
}
