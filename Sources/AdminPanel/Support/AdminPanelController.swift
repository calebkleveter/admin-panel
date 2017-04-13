import Vapor

protocol AdminPanelController {
    init()
    
    func addRoutes(to drop: Droplet)
}
