//
//  AddressAndMessageViewController.m
//  Work
//
//  Created by Ricardo on 15/8/31.
//  Copyright (c) 2015年 Ricardo. All rights reserved.
//

#import "AddressAndMessageViewController.h"


@interface AddressAndMessageViewController () <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)UITableView *tableView;

//@property (strong, nonatomic)NSMutableArray *source;
@property (strong, nonatomic)NSMutableDictionary *cellPhone;
@property (strong, nonatomic)NSMutableDictionary *cellDetail;
@property (strong, nonatomic)NSArray *cellName;

@end

@implementation AddressAndMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame: CGRectMake(0, 0, self.view.bounds.size.width, 0)];
//    searchBar.translucent = YES;
//    searchBar.barStyle = UIBarStyleBlackTranslucent;
//    searchBar.showsCancelButton = YES;
//    [searchBar sizeToFit];
//    
//    [self.tableView setTableHeaderView:searchBar];
    [self.view addSubview:self.tableView];
//
//    //索引颜色
//    self.tableView.sectionIndexColor = [UIColor blueColor];
//    
//    //改变索引选中的背景颜色
//    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor grayColor];
//    
//    _source = [[NSMutableArray alloc] init];
    
//    for (char a = 'A'; a < 'Z'; a++) {
//        [_source addObject:[NSString stringWithFormat:@"%c",a]];
//    }
    
    self.cellName = @[@"Canady",
                       @"Bill",
                       @"Ciri",
                       @"Siri",
                       @"Xioo",
                       @"Abort",
                       @"Vart",
                       @"Dival",
                       @"Lxooholick",
                       @"Monika"];
    self.cellPhone = @{@"Canady":@"111",
                        @"Bill":@"100",
                        @"Ciri":@"101",
                        @"Siri":@"980",
                        @"Xioo":@"009",
                        @"Abort":@"908",
                        @"Vart":@"098",
                        @"Dival":@"980",
                        @"Lxooholick":@"898",
                        @"Monika":@"888"};
    self.cellDetail = @{@"111":@"AK",
                       @"100":@"SB",
                       @"101":@"NV",
                       @"980":@"SR",
                       @"009":@"XO",
                       @"908":@"AO",
                       @"098":@"VR",
                       @"980":@"DV",
                       @"898":@"XH",
                       @"888":@"MK"};
    
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    //取消选中的cell
//    NSArray *indexpaths = [self.tableView indexPathsForSelectedRows];
//    for (NSIndexPath *indexPath in indexpaths) {
//        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    }
//}

////返回索引数组
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    
//}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, 375, 667)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
        [_tableView registerNib:nib forCellReuseIdentifier:@"TableViewCell"];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"TableViewCell";
    TableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!tvCell) {
        tvCell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
    }
    NSString *name = self.cellName[indexPath.row];
    tvCell.nameLabel.text = name;
    tvCell.phoneLabel.text = [self.cellPhone objectForKey:name];
    return tvCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *phone = [self.cellPhone objectForKey:self.cellName[indexPath.row]];
    NSString *detail = [self.cellDetail objectForKey:phone];
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Detail" message:detail delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [av show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
