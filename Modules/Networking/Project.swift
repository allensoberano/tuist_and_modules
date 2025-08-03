import ProjectDescription

let project = Project(
    name: "Networking",
    targets: [
        .target(
            name: "Networking",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.networking",
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [],
            dependencies: []
        ),
        .target(
            name: "NetworkingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.example.networking.tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "Networking")]
        ),
    ]
)