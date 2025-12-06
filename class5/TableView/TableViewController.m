//
//  TableViewController.m
//  class5
//
//  Created by Holeon on 2025/12/5.
//

#import "TableViewController.h"
#import "Contact.h"
#import "ContactCell.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate> //这里同时遵循了两个协议，详情可以见ScrollViewController.m

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray<Contact *> *contacts;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - 视图懒加载

- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height - 50) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor lightGrayColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[ContactCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (NSMutableArray<Contact *> *)contacts{ //这个数组的初始化仅作为Demo数据，我们会在下面的章节详细讨论如何从网络或者本地数据库获取存储的内容
    if(_contacts == nil){
        _contacts = [[NSMutableArray alloc] init];
        Contact *contact1 = [[Contact alloc] initWithName:@"陈学长" phoneNumber:@"18888888888"];
        Contact *contact2 = [[Contact alloc] initWithName:@"许学长" phoneNumber:@"16888888888"];
        Contact *contact3 = [[Contact alloc] initWithName:@"孙学长" phoneNumber:@"19888888888"];
        Contact *contact4 = [[Contact alloc] initWithName:@"陈学姐" phoneNumber:@"13888888888"];
        [_contacts addObject:contact1];
        [_contacts addObject:contact2];
        [_contacts addObject:contact3];
        [_contacts addObject:contact4];
    }
    return _contacts;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    这种方法不需要判空，但要选择默认样式的时候会比较麻烦。不过如果你要自定义一个cell类的话，直接用这个是最方便的👍
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
//    还有一个方法，但是在使用的时候需要判断cell是否为空，不过好处是你在使用自带cell的时候可以选择UIKit提供的三种默认样式。
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    if(cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
//    }
    
//    以下是一个很老的方法，可以在不注册的时候实现cell的复用，但缺点是需要判断cell是否为nil，有可能导致cell显示出来是空白的，不推荐使用。
//    - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullableNSString *)reuseIdentifier API_AVAILABLE(ios(3.0)) NS_DESIGNATED_INITIALIZER;
//    - (nullable __kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString*)identifier; // 委托⽅使⽤此⽅法获取⼀个已分配的 cell，替代分配新 cell 的操作。
    
    Contact *contact = self.contacts[indexPath.row];
    cell.nameLabel.text = contact.name;
    cell.phoneNumberLabel.text = contact.phoneNumber;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"联系人列表";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

// 各个方法的含义和其余DataSource方法可参考讲义

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@的电话号码是%@", self.contacts[indexPath.row].name, self.contacts[indexPath.row].phoneNumber);
}

// 当然，TableView是继承自ScrollView的，所以ScrollView的代理方法TableView同样也可以使用

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"TableView滚动了");
}

// 各个方法的含义和其余Delegate方法可参考讲义

@end
