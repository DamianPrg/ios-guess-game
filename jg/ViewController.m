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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)numberSelected:(UIButton *)sender forEvent:(UIEvent *)event {
    
  
    
    int v = [[[sender titleLabel] text] intValue];
    
    
      if(self.numberToGuess != v)
      {
          [sender setEnabled:FALSE];
          [sender setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
          
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
    else
    {
        NSString* s = [NSString stringWithFormat:@"You got it! You tried: %i times!", self.tries];
        [self.infoLabel setText:s];
        [self.infoLabel setTextColor:[UIColor greenColor]];
        
        [self.buttonGroup setEnabled:FALSE];
        
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


@end
