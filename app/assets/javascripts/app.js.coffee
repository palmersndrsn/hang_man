HangManApp = angular.module "HangManApp", ["ngRoute", "templates"]

HangManApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "SitesCtrl"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]

HangManApp.controller "SitesCtrl", ["$scope", "$http", ($scope, $http) ->




]