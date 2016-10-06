#include "stdafx.h"
#include <string>


class Card
{
private:
	int cardValue;
	std::string suit;
	int rank;

public:
	Card() {
		cardValue = -1;
		suit = "";
		rank = -1;
	}

	Card(std::string suit, int rank) {
		this->suit = suit;
		this->rank = rank;
	}

	~Card();

	std::string setSuit(std::string suit) {
		this->suit = suit;
	}

	int setRank(int rank) {
		this->rank = rank;
	}

	int setValue(int cardValue) {
		this->cardValue = cardValue;
	}

	std::string getSuit() {
		return suit;
	}

	int getRank() {
		return rank;
	}

	int getValue() {
		return cardValue;
	}
};
