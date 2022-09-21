
// const tree = [
//     {
//         folder: "domain",
//         namespace: "Domain",
//         children: [
//             {
//                 folder: "entities",
//                 namespace: "Entities"
//             }
//         ]
//     },
//     {
//         folder: "application",
//         namespace: "Application",
//         children: [
//             {
//                 folder: "entities",
//                 namespace: "Entities"
//             },
//             {
//                 folder: "services",
//                 namespace: "Services"
//             },
//             {
//                 folder: "repo-implementation",
//                 namespace: "RepoImplementations"
//             },
//             {
//                 folder: "config-implementation",
//                 namespace: "ConfigImplementations"
//             },
//             {
//                 folder: "external-service",
//                 namespace: "ExternalService"
//             },
//             {
//                 folder: "registrations",
//                 namespace: "Registrations"
//             }
//         ]
//     },
//     {
//         folder: "infrastructure",
//         namespace: "Infrastructure",
//         children: [
//             {
//                 folder: "entities",
//                 namespace: "Entities"
//             },
//             {
//                 folder: "services",
//                 namespace: "Services"
//             },
//             {
//                 folder: "repository",
//                 namespace: "Repository"
//             },
//             {
//                 folder: "configurations",
//                 namespace: "Configurations"
//             },
//             {
//                 folder: "external-service",
//                 namespace: "ExternalService"
//             },
//             {
//                 folder: "registrations",
//                 namespace: "Registrations"
//             }
//         ]
//     },
//     {
//         folder: "presentations",
//         namespace: "Presentations",
//         children: [
//             {
//                 folder: "entities",
//                 namespace: "Entities"
//             },
//             {
//                 folder: "controllers",
//                 namespace: "Controllers"
//             },
//             {
//                 folder: "filters",
//                 namespace: "Filters"
//             },
//             {
//                 folder: "middlewares",
//                 namespace: "Middlewares"
//             },
//             {
//                 folder: "registrations",
//                 namespace: "Registrations"
//             }
//         ]
//     },
//     {
//         folder: "aggregation",
//         namespace: "Aggregation",
//         children: [
//             {
//                 folder: "entities",
//                 namespace: "Entities"
//             },
//             {
//                 folder: "abstractions",
//                 namespace: "Abstractions"
//             },
//             {
//                 folder: "wep-application",
//                 namespace: "WepApplication"
//             }
//         ]
//     }
// ]

const tree = [
    {
        folder: "domain",
        namespace: "Domain",
        children: [
            {
                folder: "entities",
                namespace: "Entities"
            }
        ]
    },
    {
        folder: "application",
        namespace: "Application",
        children: [
            {
                folder: "entities",
                namespace: "Entities"
            },
            {
                folder: "services",
                namespace: "Services"
            },
            {
                folder: "implementation",
                namespace: "Implementations"
            },
            {
                folder: "config-implementation",
                namespace: "ConfigImplementations"
            },
            {
                folder: "external-service",
                namespace: "ExternalService"
            },
            {
                folder: "registrations",
                namespace: "Registrations"
            }
        ]
    },
    {
        folder: "infrastructure",
        namespace: "Infrastructure",
        children: [
            {
                folder: "entities",
                namespace: "Entities"
            },
            {
                folder: "services",
                namespace: "Services"
            },
            {
                folder: "repository",
                namespace: "Repository"
            },
            {
                folder: "configurations",
                namespace: "Configurations"
            },
            {
                folder: "external-service",
                namespace: "ExternalService"
            },
            {
                folder: "registrations",
                namespace: "Registrations"
            }
        ]
    },
    {
        folder: "presentations",
        namespace: "Presentations",
        children: [
            {
                folder: "entities",
                namespace: "Entities"
            },
            {
                folder: "controllers",
                namespace: "Controllers"
            },
            {
                folder: "filters",
                namespace: "Filters"
            },
            {
                folder: "middlewares",
                namespace: "Middlewares"
            },
            {
                folder: "registrations",
                namespace: "Registrations"
            }
        ]
    },
    {
        folder: "aggregation",
        namespace: "Aggregation",
        children: [
            {
                folder: "entities",
                namespace: "Entities"
            },
            {
                folder: "abstractions",
                namespace: "Abstractions"
            },
            {
                folder: "wep-application",
                namespace: "WepApplication"
            }
        ]
    }
]

function getCreations(element: any, isTest: boolean = false) {

    let children: any [] = [];
    element.children?.forEach(c => {
                children = [
                    ...children,
                    ...getCreations(c, isTest)
                        .map(s => {
                            return {
                                folder: element.folder + "/"+ s.folder,
                                namespace: element.namespace + "."+ s.namespace,
                            }
                        })
                ];
            });
    if(isTest == true) {
        children = [
            ...children,
            {
                folder: element.folder ,
                namespace: element.namespace
            }
        ]
    }
    
    if(children.length > 0) return children;
    return [
        {
            folder: element.folder,
            namespace: element.namespace
        }
    ];
}

const root = "AfCore.Generics";

let list: any [] = [];
tree.forEach(c => {
        list = [
            ...list,
            ...getCreations(c, false)
                .map(s => {
                    return {
                        folder: "src/"+ s.folder,
                        namespace: root + "."+ s.namespace,
                    }
                })
        ];
    });
tree.forEach(c => {
        list = [
            ...list,
            ...getCreations(c, false)
                .map(s => {
                    return {
                        folder: "test/"+ s.folder,
                        namespace: root + ".Test."+ s.namespace,
                    }
                })
        ];
    });

list.forEach(b =>
    console.log("dotnet new classlib -o " + b.folder + " -n " + b.namespace)
);
console.log()
list.forEach(b =>
    console.log("dotnet sln add ./" + b.folder + "/" + b.namespace + ".csproj")
);


