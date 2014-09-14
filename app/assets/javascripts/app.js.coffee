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

	clickedArr = []

	$scope.clicked = (letter) ->
		this.button = false
		clickedArr.push(letter)
		console.log(clickedArr)
		console.log(letter)
		if letter in $scope.secretWord
			$scope.letterFound(letter, $scope.secretWord.indexOf(letter))
		else
			$scope.guesses++

		if $scope.letterCount == $scope.secretWord.length
			$scope.winner = true

		if $scope.guesses == 6
			$scope.loser = true


	$scope.letterFound = (letter, index) ->
		console.log "found it!"
		console.log(letter)
		console.log(index)
		$scope.letterCount++

	$scope.reset = ->
		# need to figure out how to reset the game
		$scope.enteredWord = ""
		$scope.button.all = true
		$scope.alphabet = []
		$scope.init()

	$scope.getWord = ->
		# user inputs word and
		word = $scope.enteredWord.toUpperCase()
		$scope.secretWord = word.split("")
		$scope.entry = false
		$scope.keyboard = true


	$scope.init = ->
		$scope.count = 0
		$scope.guesses = 0
		$scope.letterCount = 0
		$scope.winner = false
		$scope.loser = false
		$scope.entry = true
		$scope.wordPopup = true
		$scope.button = true
		$scope.keyboard = false

		$scope.alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

	$scope.init()
]