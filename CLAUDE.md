# Tuist Modular iOS Project Guidelines

## Project Architecture

- **Use Tuist** for modularization and project maintainability
- **Each module** has its own Project.swift file
- **Root Workspace.swift** lists all projects
- **Follow interface target patterns** from SwiftRocks and Runway articles for build time optimization

## Module Creation Standards

### Directory Structure
Create modules in `Modules/[ModuleName]/` directory structure:
```
Modules/
├── [ModuleName]/
│   ├── Project.swift
│   ├── Sources/
│   │   └── [ModuleName implementation files]
│   └── Tests/
│       └── [ModuleName test files]
```

### Module Requirements
- Each module should have `Sources/`, `Tests/` folders
- Use **framework product type** for modules
- Include both **implementation and interface targets** when needed for build optimization
- Follow **dependency injection patterns** to reduce coupling

### Template Project.swift Structure

```swift
import ProjectDescription

let project = Project(
    name: "[ModuleName]",
    targets: [
        // Interface target for build optimization
        .target(
            name: "[ModuleName]Interface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.[modulename].interface",
            infoPlist: .default,
            sources: ["Sources/Interface/**"],
            resources: [],
            dependencies: []
        ),
        // Implementation target
        .target(
            name: "[ModuleName]",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.example.[modulename]",
            infoPlist: .default,
            sources: ["Sources/Implementation/**"],
            resources: [],
            dependencies: [
                .target(name: "[ModuleName]Interface")
            ]
        ),
        // Tests target
        .target(
            name: "[ModuleName]Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.example.[modulename].tests",
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [
                .target(name: "[ModuleName]"),
                .target(name: "[ModuleName]Interface")
            ]
        ),
    ]
)
```

### Dependency Declaration Examples

In main app or other modules:
```swift
dependencies: [
    // Depend on interface for faster builds
    .project(target: "[ModuleName]Interface", path: "Modules/[ModuleName]"),
    // Or full implementation when needed
    .project(target: "[ModuleName]", path: "Modules/[ModuleName]")
]
```

In root Workspace.swift:
```swift
let workspace = Workspace(
    name: "TuistAndModules",
    projects: [
        ".",
        "Modules/[ModuleName]",
        // Add new modules here
    ]
)
```

## Reference Materials

- **SwiftRocks reducing build times**: https://swiftrocks.com/reducing-ios-build-times-by-using-interface-targets
- **Runway modularization guide**: https://www.runway.team/blog/how-to-improve-ios-build-times-with-modularization

## Commands

- **Generate**: `tuist generate`
- **Open**: `open TuistAndModules.xcworkspace`
- **Clean**: `tuist clean`

## Best Practices

1. **Interface Segregation**: Create lean interface targets with protocols and public APIs
2. **Implementation Hiding**: Keep concrete implementations in separate targets
3. **Dependency Injection**: Use protocols and dependency injection to reduce coupling
4. **Build Optimization**: Depend on interface targets when possible to reduce build times
5. **Testing**: Test both interface contracts and implementation details separately