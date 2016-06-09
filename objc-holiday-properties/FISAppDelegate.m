//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    NSMutableArray *holidays = [@[]mutableCopy];
    for (NSString *holiday in self.database[season]) {
        [holidays addObject:holiday];
    }
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSMutableArray *supplies = [[NSMutableArray alloc]init];
    for (NSString *supply in self.database[season][holiday]) {
        [supplies addObject:supply];
    }
    return supplies;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    BOOL isHolidayInSeason = [[self.database[season] allKeys] containsObject:holiday];
    return isHolidayInSeason;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    BOOL containsSupply = [self.database[season][holiday]containsObject:supply];
    return containsSupply;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
//    Not sure why this works if the property is immutable

    [self.database[season] setObject:[@[]mutableCopy] forKey:holiday];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    [self.database[season][holiday] addObject:supply];
    NSLog(@"%@",self.database);
}

@end
