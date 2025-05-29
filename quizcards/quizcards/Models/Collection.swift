import Foundation
import CloudKit

struct FlashStrings {
    static let recordTypeKey = "Collection"
    fileprivate static let subjectKey = "subject"
    fileprivate static let flashcardKey = "flashcards"
    fileprivate static let timestampKey = "timestamp"
}

struct Collection: Hashable {
    var subject: String
    var flashcards: [Flashcard]
    var timestamp: Date
    
    let recordID: CKRecord.ID
    
    init (subject: String, flashcards: [Flashcard] = [], timestamp: Date = Date(), recordID: CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString)) {
        self.subject = subject
        self.flashcards = flashcards
        self.timestamp = timestamp
        self.recordID = recordID
    }
}

extension Collection {
    init?(ckRecord: CKRecord) {
        guard let subject = ckRecord[FlashStrings.subjectKey] as? String,
            let timestamp = ckRecord[FlashStrings.timestampKey] as? Date else {return nil}
        
        self.init(subject: subject, flashcards: [], timestamp: timestamp, recordID: ckRecord.recordID)
    }
}

extension CKRecord {
    convenience init(collection: Collection) {
        self.init(recordType: FlashStrings.recordTypeKey, recordID: collection.recordID)
        
        self.setValuesForKeys([
            FlashStrings.subjectKey : collection.subject,
            FlashStrings.timestampKey : collection.timestamp
        ])
    }
}

extension Collection: Equatable {
    static func == (lhs: Collection, rhs: Collection) -> Bool {
        return lhs.recordID == rhs.recordID
    }
} 
