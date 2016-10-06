#include "stdafx.h"
#include "Card.cpp"

#include <string>
#include <list>

class Deck {
public:
	std::list<Card> deck;
	
	Deck() {
		loadDeck();
	}

	void loadDeck() 
	{
		deck.clear();
		int cardNum = 1;
		Card currentCard;

		for (int i = 1; i < 5; i++)							// four suits
		{
			for (int j = 1; j < 14; j++)					// 13 ranks in each suit
			{
				switch (i)									// assign suit
				{
					case 1:
						currentCard.setSuit("Spades");
					case 2:
						currentCard.setSuit("Diamonds");
					case 3:
						currentCard.setSuit("Hearts");
					case 4:
						currentCard.setSuit("Clubs");
				}
				currentCard.setValue(cardNum);				// set card Value
				currentCard.setRank(j);						// assign rank
				deck.push_back(currentCard);				// add card to deck
				cardNum++;									// next card
			}
		}
	}

};