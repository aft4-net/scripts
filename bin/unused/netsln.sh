# #! bash

# alias netsln="netsln.sh"

# format () {
#     set ${*//[-]/ }
#     set ${*,,}
#     set ${*^}
#     echo ${*} | tr -d ' '
# }

# getNamespace () {
#     folder="$1"
#     echo $folder
#     IFS='/'
#     read -a segs <<< "$folder"
#     namespace=""
#     i=0
#     for seg in ${segs[@]}
#     do
#         formated=`format $seg`
#         if [ i > 0 ]; then namespace="$namespace."; fi
#         namespace="$namespace$formated"
#         i=`expr $i+1`
#     done
#     echo $namespace
# }

# # getNamespaces () {
# #     parent=`getNamespace $1`
# #     folder="$1/$2"
# #     IFS='/'
# #     read -a segs <<< "$folder"
# #     namespaces=()
# #     parent=
# #     for seg in ${segs[@]}
# #     do
# #         formated=`format $seg`
# #         namespace="$namespace.$formated"
# #     done
# #     namespace=${namespace#\.}
# #     return namespace
# # }

# create () {
#     fP=$1
#     f=$2
#     echo "folder: $fP"
#     echo "namespace: $f"
#     echo "creating..."
#     nsP=`expr getNamespace $fP`
#     ns=`expr getNamespace $f`
#     echo "folder: $fP/$f"
#     echo "namespace: $nsP.$ns"
#     # `dotnet new classlib -o src/$fP/$f -n $nsP.$ns && dotnet sln add ./src/$fP/$f/$nsP.$ns.csproj`
#     # `dotnet new classlib -o test/$fP/$f -n $nsP.Test.$ns && dotnet sln add ./test/$fP/$f/$nsP.Test.$ns.csproj`
# }

# createProject () {
#     eval "create $1 $2"
#     # col=$@
#     # fP=$1
#     # f=$2
#     # col=()
#     # i=3
#     # while [ i < 6 ]; do col+=(${i}); i=`$i+1`; done
#     # echo "creating..."
#     # nsP=`getNamespace $fP`
#     # ns=`getNamespace $f`
#     # `dotnet new classlib -o src/$fP/$f -n $nsP.$ns && dotnet sln add ./src/$fP/$f/$nsP.$ns.csproj`
#     # `dotnet new classlib -o test/$fP/$f -n $nsP.Test.$ns && dotnet sln add ./test/$fP/$f/$nsP.Test.$ns.csproj`
#     # for each in col
#     # do
#     #     nsR=`getNamespace $each`
#     #     `dotnet add ./src/$fP/$f/$nsP.$ns.csproj reference ./src/$fP/$each/$nsP.$nsR.csproj`
#     #     `dotnet add ./test/$fP/$f/$nsP.Test.$ns.csproj reference ./test/$fP/$each/$nsP.Test.$nsR.csproj`
#     # done
#     # `dotnet add ./test/$fP/$f/$nsP.Test.$ns.csproj reference ./src/$fP/$f/$nsP.$nsR.csproj`
# }



# # -> 0
# core="core"
# # -> 1
# domain="domain"
# # -> 2
# root="root"
# setup="setup"
# # -> 1
# application="application"
# # -> 2
# entities="entities"
# services="services"
# implementations="implementations"
# registration="registration"
# # <- 0
# infrastructure="infrastructure"
# # -> 1
# # entities="entities"
# # services="services"
# # implementations="implementations"
# # registration="registration"
# # <- 0
# presentation="presentation"
# # -> 1
# controllers="controllers"
# middlewares="middlewares"
# decorations="decorations"
# # services="services"
# # implementations="implementations"
# # registration="registration"
# # <- 0
# aggregation="aggregation"

# #Domain
# cde="$core/$domain/$root"
# cds="$core/$domain/$setup"
# # Application
# cae="$core/$application/$entities"
# cas="$core/$application/$services"
# cai="$core/$application/$implementations"
# car="$core/$application/$registration"
# # Infrastructure
# ie="$infrastructure/$entities"
# is="$infrastructure/$services"
# ii="$infrastructure/$implementations"
# ir="$core/$infrastructure/$registration"
# # Presentation
# pc="$presentation/$controllers"
# pm="$presentation/$middlewares"
# # aggregation
# all=($cde $cds $cae $cas $cai $car $ie $is $ii $ir $pc $pm $aggregation)

# for each in ${all[@]}; do
#     echo $each
# done

# # read -p "Name of root: " root
# read -p "Name of parent: " parent
# # git init
# # dotnet new gitignore
# # git add .gitignore
# # git commit -m "initial"
# # dotnet new sln



# # Features
# # base="base"
# # persistence="persistence"
# # identification="identification"
# # configuration="configuration"
# # shared="shared"
# # features=($base $persistence $identification $configuration $shared)

# for p in ${all[@]}
# do
#     eval "create $parent $p"
# done

# # eval "createProject $parent $cde"

core/domain/root
core/domain/setup
core/application/entities
core/application/services
core/application/implementations
core/application/registration
infrastructure/entities
infrastructure/services
infrastructure/implementations
core/infrastructure/registration
presentation/controllers
presentation/middlewares
aggregation

dotnet new classlib -o src/core/domain/root