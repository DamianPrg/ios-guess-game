//
//  ViewController.m
//  jg
//
//  Created by DamianPro on 26/03/2015.
//  Copyright (c) 2015 dbappa. All rights reserved.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonGroup;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UILabel *infoL;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonNumbers;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *twoLabels;
@property (weak, nonatomic) IBOutlet UIButton *buttonLink;
@property (weak, nonatomic) IBOutlet UIButton *tryAgainButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // initialize variables
    self.tries = 0;
    self.numberToGuess =  arc4random_uniform(9)+1;// random number between 1 and 9
    
    self.keyPoints = @[@1, @3, @6, @8];
    self.valuePoints = @[@"Lucky :)!", @"Good", @"OK", @"Bad"];
    
    NSLog([NSString stringWithFormat:@"random:%i", self.numberToGuess]);
    
    [self.startButton setTitle:@"" forState:UIControlStateNormal];
    
    
    for(int i = 0; i < [_buttons count]; i++)
    {
        [_buttons[i] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        [_buttons[i] setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)numberSelected:(UIButton *)sender forEvent:(UIEvent *)event {
    
    // get int value from clicked button titles
    int v = [[[sender titleLabel] text] intValue];
    
    // if it is not same as our random number then do:
      if(self.numberToGuess != v)
      {
          [sender setEnabled:FALSE];
         // [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
          
          if(v > self.numberToGuess)
          {
              [self.infoLabel setText:@"Number too big!"];
              [self.infoLabel setTextColor:[UIColor redColor]];
          }
          else if(v < self.numberToGuess)
          {
              [self.infoLabel setText:@"Number too low!"];
                [self.infoLabel setTextColor:[UIColor redColor]];
          }
          
          self.tries ++;
     
      }
    // bingo!
    else
    {
        NSString* s = [NSString stringWithFormat:@"You got it! You tried: %i times!", self.tries];
        [self.infoLabel setText:s];
        [self.infoLabel setTextColor:[UIColor greenColor]];
        
        [self.buttonGroup setEnabled:FALSE];
        
        [self.startButton setTitle:@"Try again" forState:UIControlStateNormal];

        
        // grade
        for (int i = 0; i < [self.keyPoints count]; i++) {
            if(self.tries < [[self.keyPoints objectAtIndex:i] integerValue])
            {
                NSLog(@"grade: %li", (long)[self.keyPoints[i] integerValue]);
                
                [self.gradeLabel setText:self.valuePoints[i]];
                
                
                break;
            }
        }

    }
    
    
    
    // log
    NSLog(@"int: %i", v);
}
- (IBAction)startClicked:(UIButton *)sender {
    self.tries = 0;
    self.numberToGuess =  arc4random_uniform(9)+1;
    
    [sender setTitle:@"" forState:UIControlStateNormal];
    [_infoL setText:@"SELECT NUMBER BELOW"];
    [_infoL setTextColor:[UIColor grayColor]];
    
    [_gradeLabel setText:@"GRADE"];
    
    
    for(int i = 0; i < [self.buttons count]; i++)
    {
       
        [self.buttons[i] setEnabled:TRUE];
    
    }
}



@end
