//
//  ViewController.m
//  SegmentControlExperimentation
//
//  Created by Admin on 26/01/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"
#import "view.h"
#import "CustomCollectionViewCell.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation ViewController{
    NSArray *titles;
    NSArray *subtitles;
    NSArray *Ttitles;
    NSArray *Tsubtitles;
    NSArray *Tp;
    NSArray *TnumP;
    int Tindex;
    int TDindex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"MyCell"];
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"MyCell"];
    
    Tindex = 0;
    TDindex = 0;
    
    titles = @[@"19:00", @"19:30", @"20:00", @"20:30", @"21:00", @"21:30", @"22:00", @"22:30", @"23:00"];
    subtitles = @[@"10%", @"25%", @"30%", @"15%", @"20%", @"30%", @"25%", @"10%", @"15%"];
    
    Ttitles = @[@"quarta-feira", @"quinta-feita", @"sexta-feira", @"sabado", @"domingo", @"segunda-feira", @"terça-feira", @"quarta-feira", @"quinta-feira"];
    Tsubtitles = @[@"14 de janeiro, 2015", @"15 de janeiro, 2015", @"16 de janeiro, 2015", @"17 de janeiro, 2015", @"18 de janeiro, 2015", @"19 de janeiro, 2015", @"20 de janeiro, 2015", @"21 de janeiro, 2015", @"22 de janeiro, 2015"];
    
    
    Tp = @[@"pessoa", @"pessoas", @"pessoas", @"pessoas", @"pessoas", @"pessoas", @"pessoas", @"pessoas", @"pessoas"];
    TnumP = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];

    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:0
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeading
                                                                     multiplier:1.0
                                                                       constant:0];
    [self.view addConstraint:leftConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:0
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeTrailing
                                                                      multiplier:1.0
                                                                        constant:0];
    [self.view addConstraint:rightConstraint];
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                     attribute:NSLayoutAttributeTrailing
                                                                     relatedBy:0
                                                                        toItem:self.view
                                                                     attribute:NSLayoutAttributeTopMargin
                                                                    multiplier:1.0
                                                                      constant:0];
    [self.view addConstraint:topConstraint];

    
    
    CGFloat viewWidth = CGRectGetWidth(self.view.frame);
    
    [_segmentControl setType:HMSegmentedControlTypeText];
    [_segmentControl setSectionTitles:@[@"Reservas", @"Informações"]];
    _segmentControl.selectionIndicatorHeight = 1.0f;
    _segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentControl.selectionIndicatorColor = [UIColor colorWithRed:0 green:150/255.0 blue:136/255.0 alpha:1.0];
    _segmentControl.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    
    UIFont *font = [UIFont systemFontOfSize:14.0f];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    
    [_segmentControl setTitleTextAttributes:attributes];
    _segmentControl.selectedSegmentIndex = 0;
    
    __weak typeof(self) weakSelf = self;
    [_segmentControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(viewWidth * index, 0, viewWidth, 200) animated:YES];
    }];
    
    view* view = [[[NSBundle mainBundle] loadNibNamed:@"view" owner:self options:nil] objectAtIndex:0];
    
    view.reservaWidth.constant = 320.0;
    view.informacoesWidth.constant = 320.0;
    
    view.numPessoas.text = TnumP[Tindex];
    view.pessoas.text = Tp[Tindex];
    
    view.data.text = Tsubtitles[TDindex];
    view.diaSemana.text = Ttitles[TDindex];
    
    CGRect finalFrame2 = CGRectMake(0, 0, 560, 350);
    view.frame = finalFrame2;
    [view layoutIfNeeded];

    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.scrollEnabled = YES;
    //self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(viewWidth * 2, 200);
    //[self.scrollView scrollRectToVisible:CGRectMake(viewWidth, 0, viewWidth, 500) animated:NO];
    //[self.view addSubview:self.scrollView];
    [self.scrollView setScrollEnabled:NO];   
    [self.scrollView addSubview:self.collectionView];
    
    [self.scrollView addSubview:view];

    
    NSLog(@"viewWith: %f",viewWidth);

}

#pragma mark - Button Action

- (IBAction)pessoasRightButton:(id)sender {
    
    NSLog(@"right button");
    NSLog(@"index before: %d",Tindex);
    Tindex++;
    NSLog(@"index during: %d",Tindex);
    if (Tindex < Ttitles.count && Tindex >= 0) {
        self.numPessoasLabel.text = TnumP[Tindex];
        self.pessoasLabel.text = Tp[Tindex];
    }else{
        Tindex--;
        NSLog(@"index after: %d",Tindex);
    }
}

- (IBAction)pessoasLeftButton:(id)sender {

    NSLog(@"left button");
    NSLog(@"index before: %d",Tindex);
    Tindex--;
    NSLog(@"index during: %d",Tindex);
    if (Tindex < Ttitles.count && Tindex >= 0) {
        self.numPessoasLabel.text = TnumP[Tindex];
        self.pessoasLabel.text = Tp[Tindex];
    }else{
        Tindex++;
        NSLog(@"index after: %d",Tindex);
    }
}

- (IBAction)dataRightButton:(id)sender {
    
    NSLog(@"right button");
    NSLog(@"index before: %d",TDindex);
    TDindex++;
    NSLog(@"index during: %d",TDindex);
    if (TDindex < Ttitles.count && TDindex >= 0) {
        self.diaSemanaLabel.text = Ttitles[TDindex];
        self.dataLabel.text = Tsubtitles[TDindex];
    }else{
        TDindex--;
        NSLog(@"index after: %d",TDindex);
    }
}
- (IBAction)dataLeftButton:(id)sender {

    NSLog(@"left button");
    NSLog(@"index before: %d",TDindex);
    TDindex--;
    NSLog(@"index during: %d",TDindex);
    if (TDindex < Ttitles.count && TDindex >= 0) {
        self.diaSemanaLabel.text = Ttitles[TDindex];
        self.dataLabel.text = Tsubtitles[TDindex];
    }else{
        TDindex++;
        NSLog(@"index after: %d",Tindex);
    }
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [_segmentControl setSelectedSegmentIndex:page animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark : Collection View Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(50, 50);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    
//    cell.horario.text = titles[indexPath.row];
//    cell.desconto.text = subtitles[indexPath.row];
    
    return cell;
    
}



@end
