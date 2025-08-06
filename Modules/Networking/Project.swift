import ProjectDescription

let project = Project(
    name: "Networking",
    targets: [
        // Interface target for build optimization
        .target(
            name: "NetworkingInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.networking.interface",
            infoPlist: .default,
            sources: ["Sources/Interface/**"],
            resources: [],
            dependencies: []
        ),
        // Implementation target
        .target(
            name: "Networking",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.networking",
            infoPlist: .default,
            sources: ["Sources/Implementation/**"],
            resources: [],
            dependencies: [
                .target(name: "NetworkingInterface")
            ]
        ),
        // Tests target
        .target(
            name: "NetworkingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.example.networking.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "Networking"),
                .target(name: "NetworkingInterface")
            ]
        ),
    ]
)