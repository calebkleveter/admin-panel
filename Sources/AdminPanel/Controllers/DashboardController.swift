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
    
    public func custom() -> [(route: (Request) throws -> ResponseRepresentable, url: String)] {
        if let routes = customRoutePaths?.map({ (path) -> ((Request) throws -> ResponseRepresentable) in
            return { (Request) throws -> ResponseRepresentable in
                return try self.drop.view.make(path)
            }
        }) {
            var pages: [(route: (Request) throws -> ResponseRepresentable, url: String)] = []
            
            if let urls = self.customRouteURLs {
                var counter = 0
                for url in urls {
                    let page = (route: routes[counter], url: url)
                    pages.append(page)
                }
                counter += 1
            }
            return pages
        } else {
            fatalError("The paths set for the views for the custom routes do not exist.")
        }
    }
}
