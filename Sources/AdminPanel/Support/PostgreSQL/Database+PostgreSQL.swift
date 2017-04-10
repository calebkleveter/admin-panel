import Fluent

extension Database {
    // MARK: Index
    
    /// A helper function to index
    /// Use to execute the query drop.database.driver.raw()
    ///
    /// - Parameters:
    ///   - table: table
    ///   - column: column
    ///   - name: name of index
    /// - Returns: MySQL query
    public static func index(table: String, column: String, name: String? = nil) -> String {
        
        var nameString = name ?? ""
        
        // Add trailing space
        if(nameString.count > 0) {
            nameString += " "
        }
        
        return "CREATE INDEX " + nameString + " ON " + table + " (" + column + ")"
    }
    
    /// A helper function to execute index
    ///
    /// - Parameters:
    ///   - table: table
    ///   - column: column
    ///   - name: name of index
    /// - Returns: MySQL query
    public func index(table: String, column: String, name: String? = nil) throws {
        try self.driver.raw(Database.index(table: table, column: column, name: name))
    }
}
