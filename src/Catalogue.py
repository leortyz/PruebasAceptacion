def get_game_name(game_list, name):
	"""Search games by name"""
	result = list(filter(lambda x: name.lower() in x.name.lower(), game_list))
	if len(result)==1:
		message = 'A game was found containing the word: ' + name
	elif len(result)>0:
		message = str(len(result))+' games were found containing the word: ' + name
	else:
		message = 'No game with the specified name was found.'
	return result, message


def get_game_rating(game_list, ratings):
	"""Search games by raiting"""
	allowed_values = ["T", "E", "M"]
	not_allowed_values = []
	matches = []
	for rate in ratings:
		if rate not in allowed_values:
			not_allowed_values.append(rate)
		else:
			matches.append(rate)

	result = list(filter(lambda x: x.rating in ratings, game_list))
	if len(result)==1:
		message = 'A game was found'
	elif len(result)>0:
		message = str(len(result))+' games were found containing the rate: ' + "['" + "','".join(matches) + "']"
	else:
		message = 'No game with the specified rate was found.'

	if(len(not_allowed_values) > 0):
		error = "Ratings "+str(not_allowed_values)+" are not an available search option."
	else:
		error = None
	return result, message, error


def get_game_developer(game_list, developer):
	"""Search game by developer"""
	result = list(filter(lambda x: developer.lower() in x.developer.lower(), game_list))
	if len(result)>0:
		message = str(len(result))+' games were found containing the study: ' + developer +""
	else:
		message = 'No game with the specified study was found.'
	return result, message


def get_game_release_date(game_list, start_year=2000, end_year=2020):
	if(start_year > end_year):
		message = 'The initial year cannot be greater than the final year of search.'
		result = []
	else:
		result = list(filter(lambda x: start_year <= x.release <= end_year, game_list))
		if len(result)==1:
			message = 'A game was found'
		elif len(result)>0:
			message = str(len(result))+' games were found.'
		else:
			message = 'No game was released between '+str (start_year)+' and '+ str (end_year)
	return result, message
