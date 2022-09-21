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
var __spreadArray = (this && this.__spreadArray) || function (to, from) {
    for (var i = 0, il = from.length, j = to.length; i < il; i++, j++)
        to[j] = from[i];
    return to;
};
var tree = [
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
];
function getCreations(element, isTest) {
    var _a;
    if (isTest === void 0) { isTest = false; }
    var children = [];
    (_a = element.children) === null || _a === void 0 ? void 0 : _a.forEach(function (c) {
        children = __spreadArray(__spreadArray([], children), getCreations(c, isTest)
            .map(function (s) {
            return {
                folder: element.folder + "/" + s.folder,
                namespace: element.namespace + "." + s.namespace
            };
        }));
    });
    if (isTest == true) {
        children = __spreadArray(__spreadArray([], children), [
            {
                folder: element.folder,
                namespace: element.namespace
            }
        ]);
    }
    if (children.length > 0)
        return children;
    return [
        {
            folder: element.folder,
            namespace: element.namespace
        }
    ];
}
var root = "AfCore.Generics";
var list = [];
tree.forEach(function (c) {
    list = __spreadArray(__spreadArray([], list), getCreations(c, false)
        .map(function (s) {
        return {
            folder: "src/" + s.folder,
            namespace: root + "." + s.namespace
        };
    }));
});
tree.forEach(function (c) {
    list = __spreadArray(__spreadArray([], list), getCreations(c, false)
        .map(function (s) {
        return {
            folder: "test/" + s.folder,
            namespace: root + ".Test." + s.namespace
        };
    }));
});
list.forEach(function (b) {
    return console.log("dotnet new classlib -o " + b.folder + " -n " + b.namespace);
});
console.log();
list.forEach(function (b) {
    return console.log("dotnet sln add ./" + b.folder + "/" + b.namespace + ".csproj");
});
