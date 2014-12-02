angular.module('Blog').controller 'SignupController'
, ['$log', '$scope', '$rootScope', '$location', '$http'
, ($log, $scope, $rootScope, $location, $http) ->
  # ViewState.current = 'login'

  signup = (email, password, password_confirmation) ->
    $http.post("/users.json",
      user:
        email: email
        password: password
        password_confirmation: password_confirmation
    ).then (response) ->
      $rootScope.currentUser = response.data
      $location.path "/"  if $rootScope.currentUser
    , (error) ->
      $scope.authError = []
      for k,v of error.data.errors
        $scope.authError.push(k + " " + v)


  $scope.submit = ->
    signup($scope.email, $scope.password, $scope.password_confirmation)

]