//
//  view.h
//  SegmentControlExperimentation
//
//  Created by Admin on 27/01/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface view: UIView

@property (weak, nonatomic) IBOutlet UIView *reserva;
@property (weak, nonatomic) IBOutlet UIView *informacoes;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *reservaWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *informacoesWidth;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *numPessoas;
@property (weak, nonatomic) IBOutlet UILabel *pessoas;
@property (weak, nonatomic) IBOutlet UILabel *diaSemana;
@property (weak, nonatomic) IBOutlet UILabel *data;

@end
