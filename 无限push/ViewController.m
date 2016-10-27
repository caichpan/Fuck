//
//  ViewController.m
//  无限push
//
//  Created by huanghuan on 16/10/27.
//  Copyright © 2016年 ChinaCloudBI. All rights reserved.
//
#define HScreen [[UIScreen mainScreen] bounds].size.height
#define WScreen [[UIScreen mainScreen] bounds].size.width

static  int stopInt = 0;

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
 UITableView *secondTableView;
   
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"aaafdsa";
    self.view.backgroundColor = [UIColor brownColor];
    secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WScreen, HScreen-20) style:UITableViewStylePlain];
    secondTableView.delegate = self;
    secondTableView.dataSource = self;
    [self.view addSubview:secondTableView];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
    }
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据 - %ld",indexPath.row+1];
    //    cell.imageView.image = [UIImage imageNamed:@"collection@2X"];
    //    cell.contentView.backgroundColor = [UIColor colorWithHexString:@"#094A84"];
    //无色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    stopInt = stopInt+1;
    
    NSLog(@"点了第%d次",stopInt);
    
    if (stopInt<3) {
        ViewController  *about = [[ViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
    }else{
        NSLog(@"fuck");
    }
    
  

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
