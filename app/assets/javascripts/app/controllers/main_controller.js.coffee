angular.module('Blog').controller 'MainController', ['$log', '$scope', '$rootScope', '$location', '$http', '$modal', 'Post',  ($log, $scope, $rootScope, $location, $http, $modal, Post) ->

  $rootScope.currentUser = null

  $scope.init = ->
    $http.get("/current_user").then (response) ->
      $rootScope.currentUser = response.data

      Post.index().$promise.then (data) ->
        $rootScope.posts = data

  $scope.toHome = ->
    $location.path '/'

  $scope.toLogIn = ->
    $location.path '/login'

  $scope.toRegister = ->
    $location.path '/signup'

  $scope.logOut = ->
    $http.get("/users/sign_out",
      email: $rootScope.currentUser
    ).then ->
      $rootScope.currentUser = null
      $location.path '/'

  $scope.newPost = ->
    modalInstance = $modal.open(
      templateUrl: "/assets/new_post.html",
      controller: 'NewPostCtrl',
      scope: $scope,
      backdrop: 'static'
    )

  $scope.editPost = (post) ->
    modalInstance = $modal.open(
      templateUrl: "/assets/new_post.html",
      controller: 'EditPostCtrl',
      scope: $scope,
      backdrop: 'static'
    )
    $scope.post = post

  $scope.showPost = (id) ->
    $location.path '/posts/' + id

  $scope.deletePost = (post) ->
    if confirm "Are you sure?"
      currIndex = $rootScope.posts.indexOf(post)
      post.$delete (data) ->
        $rootScope.posts.splice(currIndex, 1)
]