angie = angular.module('angie', [
  'templates',
  'ngRoute',
  'controllers',
])

angie.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Baked Potato w/ Cheese'
  },
  {
    id: 2
    name: 'Pizza'
  },
  {
    id: 3
    name: 'Your mom'
  },
  {
    id: 4
    name: 'Salad'
  },
]

controllers = angular.module('controllers',[])
controllers.controller("RecipesController", [ '$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location)->
    $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.recipes = recipes.filter (recipe)-> recipe.name.toLowerCase().indexOf(keywords) != -1
    else
      $scope.recipes = []
])



