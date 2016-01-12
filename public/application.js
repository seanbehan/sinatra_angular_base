angular.module('app', ['ngRoute'])

.config(function($routeProvider, $locationProvider){
  $locationProvider.html5Mode(true)

  $routeProvider
  .when("/", {
    templateUrl: "/app/home.html",
    controller: "Home/show"
  })
  .otherwise({
    redirectTo: "/login"
  })
})

.run(function($http){
  window.get = function(path){
    return $http.get(path)
  }
  window.post = function(path, data){
    return $http.post(path, data)
  }
})

.controller("Home/show", function($scope){
  get('/users.json').success(function(resp){
    $scope.users = resp.users
  })
  $scope.save = function(user){
    post('/users.json', {user: user}).success(function(resp){
      $scope.users.push(resp)
    })
  }
});
