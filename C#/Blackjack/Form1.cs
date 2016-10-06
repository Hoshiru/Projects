using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace blackjack
{
    public partial class Form1 : Form
    {
        public Deck currentdeck { get; set; }
        public Hand player_hand { get; set; }
        public Hand dealer_hand { get; set; }
        public int numcards { get; set; }

        public Form1()
        {
           InitializeComponent();

           button1.Visible = true; // deal button is visible
           button2.Visible = false; // hit button hidden
           button3.Visible = false; // stick button hidden
           pictureBox1.Visible = true; //showing spot for first card
           pictureBox2.Visible = false; //showing second card
           pictureBox3.Visible = false; //hiding the rest
           pictureBox4.Visible = false; //hiding the rest
           pictureBox5.Visible = false; //hiding the rest
           pictureBox6.Visible = false; //hiding the rest
           pictureBox7.Visible = false; //hiding the rest
           pictureBox8.Visible = false; //hiding the rest
           pictureBox9.Visible = false; //hiding the rest
           pictureBox10.Visible = false; //hiding the rest
           pictureBox11.Visible = false; //hiding the rest
           pictureBox12.Visible = false; //hiding the rest
            
        } //END Form1

        private void pictureBox7_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox10_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e) //Deal button
        {
            //initialise components
            numcards = 2; //deal 2 cards initially
            currentdeck = new Deck(); //create new deck of cards
            player_hand = new Hand(numcards); //create hand for player
            dealer_hand = new Hand(numcards); // create hand for dealer

            button1.Visible = true; // deal button is visible
            button2.Visible = false; // hit button hidden
            button3.Visible = false; // stick button hidden
            pictureBox1.Visible = true; //showing spot for first card
            pictureBox2.Visible = false; //showing second card
            pictureBox3.Visible = false; //hiding the rest
            pictureBox4.Visible = false; //hiding the rest
            pictureBox5.Visible = false; //hiding the rest
            pictureBox6.Visible = false; //hiding the rest
            pictureBox7.Visible = false; //hiding the rest
            pictureBox8.Visible = false; //hiding the rest
            pictureBox9.Visible = false; //hiding the rest
            pictureBox10.Visible = false; //hiding the rest
            pictureBox11.Visible = false; //hiding the rest
            pictureBox12.Visible = false; //hiding the rest

            richTextBox1.Text = "Welcome to CaptNemo BlackJack" + Environment.NewLine;
            richTextBox1.Text += "Press Deal to begin" + Environment.NewLine;

            player_hand.deal_cards(currentdeck, numcards);
            display_hand(player_hand);
            player_hand.evaluate_hand();
           
            richTextBox1.Text = player_hand.result + Environment.NewLine;
            button1.Visible = false;
            button2.Visible = true;
            button3.Visible = true;
        }
 // ***************** Display current hand *******************************************************
        public void display_hand(Hand playerhand)
        {
            int count = 0;
            string currentcard_picture = "";
            DateTime t = DateTime.Now;

            if (playerhand.cards != null && playerhand != null)
                foreach (Card currentcard in playerhand.cards)
                {
                    if (currentcard != null && currentcard.suit != "" )
                    {
                        if (currentcard.value < 10)
                            currentcard_picture = "_0" + currentcard.value.ToString() + "_" + currentcard.suit;
                        if (currentcard.value == 10)
                            currentcard_picture = "_" + currentcard.value.ToString() + "_" + currentcard.suit;
                        if (currentcard.value == 11)
                            currentcard_picture = "J" + "_" + currentcard.suit;
                        if (currentcard.value == 12)
                            currentcard_picture = "Q" + "_" + currentcard.suit;
                        if (currentcard.value >= 13)
                            currentcard_picture = "K" + "_" + currentcard.suit;
                    }
                    else
                        currentcard_picture = "space";
                   
                    if (count == 0)
                    {

                        pictureBox1.Visible = true; //showing first card
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox1.Image = myImage;
                        pictureBox1.BringToFront();
                        pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 1)
                    {                       
                        pictureBox2.Visible = true; //showing second card
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox2.Image = myImage;
                        pictureBox2.BringToFront();
                        pictureBox2.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 2)
                    {
                        pictureBox3.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox3.BringToFront();
                        pictureBox3.Image = myImage;
                        pictureBox3.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 3)
                    {
                        pictureBox4.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox4.BringToFront();
                        pictureBox4.Image = myImage;
                        pictureBox4.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 4)
                    {
                        pictureBox5.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        pictureBox3.BringToFront();
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox5.BringToFront();
                        pictureBox5.Image = myImage;
                        pictureBox5.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 5)
                    {
                        pictureBox6.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox6.BringToFront();
                        pictureBox6.Image = myImage;
                        pictureBox6.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 6)
                    {
                        pictureBox7.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox7.BringToFront();
                        pictureBox7.Image = myImage;
                        pictureBox7.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 7)
                    {
                        pictureBox8.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox8.BringToFront();
                        pictureBox8.Image = myImage;
                        pictureBox8.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 8)
                    {
                        pictureBox9.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox9.BringToFront();
                        pictureBox9.Image = myImage;
                        pictureBox9.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 9)
                    {
                        pictureBox10.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox10.BringToFront();
                        pictureBox10.Image = myImage;
                        pictureBox10.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 10)
                    {
                        pictureBox11.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox11.BringToFront();
                        pictureBox11.Image = myImage;
                        pictureBox11.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    if (count == 11)
                    {
                        pictureBox12.Visible = true; 
                        System.Resources.ResourceManager rm = blackjack.Properties.Resources.ResourceManager;
                        Bitmap myImage = (Bitmap)rm.GetObject(currentcard_picture);
                        pictureBox12.BringToFront();
                        pictureBox12.Image = myImage;
                        pictureBox12.SizeMode = PictureBoxSizeMode.StretchImage;
                    }
                    count++;
                }
        }

        private void button2_Click(object sender, EventArgs e) // Hit function
        {
            player_hand.add_card(currentdeck, 1);
            display_hand(player_hand);
            player_hand.evaluate_hand();

            richTextBox1.Text = player_hand.result + Environment.NewLine;
            button1.Visible = false;
            button2.Visible = true;
            button3.Visible = true;
            if (player_hand.score >= 21)
            {
                 end_game(player_hand, dealer_hand);
            }
        } 

        private void end_game(Hand player_hand, Hand dealer_hand)
        {
            dealer_hand.deal_cards(currentdeck, numcards); //deal cards to dealer
            dealer_hand.evaluate_hand();
            while(dealer_hand.score<15) //dealer sticks on 15 or higher
            {
                dealer_hand.add_card(currentdeck, 1);
                dealer_hand.evaluate_hand();
            }
            richTextBox1.Text += "Dealer has " + dealer_hand.score + Environment.NewLine;
            if (player_hand.score > 21)
            {
                richTextBox1.Text = "You bust better luck next time." + Environment.NewLine;
            }
            if (dealer_hand.score==21)
            {
                richTextBox1.Text = "Dealer has " + dealer_hand.score + ", Dealer wins." + Environment.NewLine;
            }
            if (dealer_hand.score > 21)
            {
                richTextBox1.Text = "Dealer has " + dealer_hand.score + ", congratulations you win ." + Environment.NewLine;
            }
            else
            {
                if ((player_hand.score >= dealer_hand.score) && (player_hand.score <= 21))
                {
                    richTextBox1.Text = "Dealer has " + dealer_hand.score + ", congratulations you win ." + Environment.NewLine;
                }
                if(dealer_hand.score > 21)
                {
                    richTextBox1.Text = "Dealer bust, you win ." + Environment.NewLine;
                }
                if(player_hand.score ==21)
                {
                    richTextBox1.Text = "Congratulations BLACKJACK, you win ." + Environment.NewLine;
                }
                if( (dealer_hand.score <=21) && (player_hand.score<=dealer_hand.score) )
                {
                    richTextBox1.Text = "Dealer has " + dealer_hand.score + ", better luck next time." + Environment.NewLine;
                }
            }
            button1.Visible = true; // deal button is visible
            button2.Visible = false; // hit button hidden
            button3.Visible = false; // stick button hidden
         }

        private void button3_Click(object sender, EventArgs e) // stick button
        {
            end_game(player_hand, dealer_hand);
        }
        // end display hand
// ******************************************************************************************************************
    } //End partial Class
}
