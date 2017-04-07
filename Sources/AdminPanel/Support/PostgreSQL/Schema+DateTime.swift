import Fluent

extension Schema.Creator {
    
    
    /// Creates a timestamp type.
    ///
    /// - Parameters:
    ///   - name: name of column.
    ///   - optional: make column optional.
    ///   - unique: make column unique.
    ///   - default: default value.
    public func dateTime(_ name: String, optional: Bool = false, unique: Bool = false, defaultValue: NodeRepresentable? = nil) {
        self.custom(name, type: "timestamp", optional: optional, unique: unique, default: defaultValue)
    }
    
    /// Creates created_at & updated_at timestamp.
    public func timestamps() {
        self.dateTime("created_at", optional: true)
        self.dateTime("updated_at", optional: true)
    }
}
