//
//  CardViewModel.swift
//  Cards
//
//  Created by Zach Evetts on 3/18/23.
//

import Foundation

import Foundation

class CardViewModel : ObservableObject {
    @Published private(set) var cardData = [CardModel]()
    @Published var hasError = false
    @Published var error : CardModelError?
    private let url = "https://db.ygoprodeck.com/api/v7/cardinfo.php"
    
    @MainActor
    func fetchData() async {
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(CardResults?.self, from: data) else {
                    self.hasError.toggle()
                    self.error = CardModelError.decodeError
                    return
                }
                self.cardData = results.data
            } catch {
                self.hasError.toggle()
                self.error = CardModelError.customError(error: error)
            }
        }
    }
}

extension CardViewModel {
    enum CardModelError : LocalizedError {
        case decodeError
        case customError(error: Error)

        var errorDescription: String? {
            switch self {
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }

    }

}
