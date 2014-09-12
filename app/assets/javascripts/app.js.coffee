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

	$scope.count = 0
	$scope.guesses = 0
	$scope.letterCount = 0

	$scope.clicked = (letter) ->
		this.button = false
		console.log(letter)
		if letter in secretWord
			$scope.letterFound(letter, secretWord.indexOf(letter))
		else
			$scope.guesses++

		if $scope.letterCount == secretWord.length
			console.log("you win!")

		if $scope.guesses == 6
			alert "DOH!!"

	$scope.letterFound = (letter, index) ->
		console.log "found it!"
		console.log(letter)
		console.log(index)
		$scope.letterCount++



	secretWord = "WORD".split("")



	$scope.button = true

	$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
]