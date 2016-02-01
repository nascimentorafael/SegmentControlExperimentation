//
//  ViewController.h
//  SegmentControlExperimentation
//
//  Created by Admin on 26/01/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "view.h"

@interface ViewController : UIViewController<UIScrollViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *numPessoasLabel;
@property (weak, nonatomic) IBOutlet UILabel *pessoasLabel;
@property (weak, nonatomic) IBOutlet UILabel *diaSemanaLabel;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@end

