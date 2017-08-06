/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "MasterViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DetailViewController.h"
#import <SDWebImage/FLAnimatedImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>


@interface MyCustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *customTextLabel;
@property (nonatomic, strong) FLAnimatedImageView *customImageView;

@end


@implementation MyCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _customImageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(20.f, 4.f, 120.f, 80.f)];
        [self.contentView addSubview:_customImageView];
        _customTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(160.f, 34.f, 200.f, 20.f)];
        [self.contentView addSubview:_customTextLabel];
        
        _customImageView.clipsToBounds = YES;
        _customImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

@end



@interface MasterViewController ()

@property (nonatomic, strong) NSMutableArray<NSString *> *objects;

@end

@implementation MasterViewController

@synthesize detailViewController = _detailViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem.alloc initWithTitle:@"Clear Cache"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(flushCache)];
//    NSArray<NSURL *> *webpURLs = [[NSBundle mainBundle] URLsForResourcesWithExtension:@"webp" subdirectory:@"webp"];
//    self.objects = [NSMutableArray array];
//    
//    [self.objects addObjectsFromArray:webpURLs];
    self.objects = [NSMutableArray arrayWithObjects:
                @"http://assets.sbnation.com/assets/2512203/dogflops.gif",
                @"https://raw.githubusercontent.com/liyong03/YLGIFImage/master/YLGIFImageDemo/YLGIFImageDemo/joy.gif",
                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp",
                @"http://www.ioncannon.net/wp-content/uploads/2011/06/test9.webp",
                @"http://littlesvr.ca/apng/images/SteamEngine.webp",
                @"http://littlesvr.ca/apng/images/world-cup-2014-42.webp",
                @"https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp",
                @"https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png",
                nil];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView reloadData];
}

- (void)flushCache
{
    [SDWebImageManager.sharedManager.imageCache clearMemory];
    [SDWebImageManager.sharedManager.imageCache clearDiskOnCompletion:nil];
}
							
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 88.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    static UIImage *placeholderImage = nil;
    if (!placeholderImage) {
        placeholderImage = [UIImage imageNamed:@"placeholder"];
    }
    
    MyCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [cell.customImageView sd_setShowActivityIndicatorView:YES];
    [cell.customImageView sd_setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    cell.customTextLabel.text = [NSString stringWithFormat:@"Image #%ld", (long)indexPath.row];
    [cell.customImageView sd_setImageWithURL:[NSURL URLWithString:_objects[indexPath.row]]
                            placeholderImage:placeholderImage
                                     options:SDWebImageProgressiveDownload];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.detailViewController)
    {
        self.detailViewController = [[DetailViewController alloc] init];
    }
    NSURL *largeImageURL = [NSURL URLWithString:self.objects[indexPath.row]];
    self.detailViewController.imageURL = largeImageURL;
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

@end
