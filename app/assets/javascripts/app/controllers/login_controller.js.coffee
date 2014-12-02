angular.module('Blog').controller 'LoginController', ['$log', '$scope', '$rootScope', '$location', '$http', ($log, $scope, $rootScope, $location, $http) ->
  # ViewState.current = 'login'

  login = (email, password) ->
    $http.post("/users/sign_in.json",
      email: email
      password: password
    ).then (response) ->
      $rootScope.currentUser = response.data.user
      $location.path "/"  if $rootScope.currentUser
    , (error) ->
      $scope.authError = []
      $scope.authError.push(error.data.message)

  $scope.submit = ->
    login($scope.email, $scope.password)

  $scope.logout = ->
    $http.get("/users/sign_out",
      email: $rootScope.currentUser
    ).then ->
      service.currentUser = null
      $location.path '/'

]