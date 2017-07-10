import PackageDescription

let package = Package(
    name: "AdminPanel",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/nodes-vapor/sugar.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor-community/forms.git", majorVersion: 0),
        .Package(url: "https://github.com/nodes-vapor/slugify.git", majorVersion: 1),
        .Package(url: "https://github.com/nodes-vapor/flash.git", majorVersion: 1),
        .Package(url: "https://github.com/nodes-vapor/paginator.git", majorVersion: 1),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", majorVersion: 2),
    ]
)
