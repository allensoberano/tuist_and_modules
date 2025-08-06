import ProjectDescription

let project = Project(
    name: "TuistAndModules",
    targets: [
        .target(
            name: "TuistAndModules",
            destinations: .iOS,
            product: .app,
            bundleId: "com.example.tuistandmodules",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["TuistAndModules/Sources/**"],
            resources: ["TuistAndModules/Resources/**"],
            dependencies: [
                .project(target: "NetworkingInterface", path: "Modules/Networking"),
                .project(target: "Networking", path: "Modules/Networking")
            ]
        ),
        .target(
            name: "TuistAndModulesTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.example.tuistandmodules.tests",
            infoPlist: .default,
            sources: ["TuistAndModules/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistAndModules")]
        ),
    ]
)