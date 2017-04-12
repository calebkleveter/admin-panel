import Vapor
import HTTP
import Auth

public final class DashboardController {
    
    public let drop: Droplet
    public let customRoutePaths: [String]?
    public var customRouteURLs: [String]?
    
    public init(droplet: Droplet, customViews views: [String]?) {
        drop = droplet
        customRoutePaths = views
        
        if let paths = self.customRoutePaths {
            var urls: [String] = []
            for path in paths {
                if let fileName = path.characters.split(separator: "/").map(String.init).last {
                    urls.append(fileName)
                }
            }
            customRouteURLs = urls
        }
    }
    
    public func index(request: Request) throws -> ResponseRepresentable {
        return try drop.view.make("Dashboard/view", for: request)
    }
}
