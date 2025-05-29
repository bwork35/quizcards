import Foundation

@Observable
class ModelData {
    var collections: [Collection] = createMocks()
}

func createMocks() -> [Collection] {
    let math = Collection(subject: "Multiplication", flashcards: createMultiplication(), timestamp: Date(), recordID: .init(recordName: "123"))
    
    let periodic = Collection(subject: "Periodic Table", flashcards: createPeriodic(), timestamp: Date(), recordID: .init(recordName: "234"))
    
    let states = Collection(subject: "States and Capitals", flashcards: createStates(), timestamp: Date(), recordID: .init(recordName: "345"))
    
    return [math, periodic, states]
}

func createMultiplication() -> [Flashcard] {
    let prompts = MultiplicationTables.prompts
    let answers = MultiplicationTables.answers
    
    var flashcards: [Flashcard] = []
    
    for index in prompts.enumerated() {
        let flashcard = Flashcard(frontString: prompts[index.offset], backString: answers[index.offset], backIsPKImage: false, frontPhoto: nil, backPhoto: nil, collectionReference: nil)
    }
    
    return flashcards
}

func createPeriodic() -> [Flashcard] {
    let prompts = PeriodicTable.symbols
    let answers = PeriodicTable.numberAndName
    
    var flashcards: [Flashcard] = []
    
    for index in prompts.enumerated() {
        let flashcard = Flashcard(frontString: prompts[index.offset], backString: answers[index.offset], backIsPKImage: false, frontPhoto: nil, backPhoto: nil, collectionReference: nil)
    }
    
    return flashcards
}

func createStates() -> [Flashcard] {
    let prompts = StatesAndCapitals.states
    let answers = StatesAndCapitals.capitals
    
    var flashcards: [Flashcard] = []
    
    for index in prompts.enumerated() {
        let flashcard = Flashcard(frontString: prompts[index.offset], backString: answers[index.offset], backIsPKImage: false, frontPhoto: nil, backPhoto: nil, collectionReference: nil)
    }
    
    return flashcards
}
