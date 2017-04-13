import Vapor
import Routing

public protocol AdminPanelController {
    init()
    
    func addRoutes(to group: RouteGroup<Droplet.Value, (RouteGroup<Droplet.Value, Droplet>)>)
}
