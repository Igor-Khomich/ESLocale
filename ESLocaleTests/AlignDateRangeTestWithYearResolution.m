#import <SenTestingKit/SenTestingKit.h>

#import "testDateUtils.h"

#import "ESLocaleFactory.h"

#import "NSCalendar+DateAlignment.h"

@interface AlignDateRangeTestWithYearResolution : SenTestCase
@end

@implementation AlignDateRangeTestWithYearResolution

/////////////////// RESULT: YEAR RESOLUTION ///////////////////

-(void)testAlignDates_Oct20_2008_May15_2011_toTwoYearResolution
{
    NSDate* startDate_ = dateFromString( @"2008-10-20" );
    NSDate* endDate_   = dateFromString( @"2011-05-15" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESYearDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2008-01-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2011-12-31", @"ok" );
}

-(void)testAlignDates_Oct20_2008_May15_2011_toTwoYearResolution_withDefaultResolution
{
    NSDate* startDate_ = dateFromString( @"2008-10-20" );
    NSDate* endDate_   = dateFromString( @"2011-05-15" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];
    
    STAssertEquals( ESYearDateResolution, resolution_, @"ok" );
    
    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );
    
    STAssertEqualObjects( startDateStr_, @"2008-01-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2011-12-31", @"ok" );
}

-(void)testAlignDates_Oct20_2009_May15_2011_toOneYearResolution
{
    NSDate* startDate_ = dateFromString( @"2009-10-20" );
    NSDate* endDate_   = dateFromString( @"2011-05-15" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESYearDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2009-01-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2011-12-31", @"ok" );
}

-(void)testAlignDates_Jan01_2010_May15_2011_toOneYearResolution
{
    NSDate* startDate_ = dateFromString( @"2010-01-01" );
    NSDate* endDate_   = dateFromString( @"2011-05-15" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESYearDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2010-01-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2011-12-31", @"ok" );
}

/////////////////// RESULT: HALF YEAR RESOLUTION ///////////////////

-(void)testAlignDates_May20_2010_May15_2011_toHalfYearResolution
{
    NSDate* startDate_ = dateFromString( @"2010-05-20" );
    NSDate* endDate_   = dateFromString( @"2011-05-15" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESHalfYearDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2010-01-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2011-06-30", @"ok" );
}

-(void)testAlignDates_Sep20_2011_Mar31_2012_toTwoQuarterResolution
{
    NSDate* startDate_ = dateFromString( @"2011-09-20" );
    NSDate* endDate_   = dateFromString( @"2012-03-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESHalfYearDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2011-07-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2012-06-30", @"ok" );
}

-(void)testAlignDates_Sep20_2011_Mar31_2012_toFourMonthResolution
{
    NSDate* startDate_ = dateFromString( @"2011-10-02" );
    NSDate* endDate_   = dateFromString( @"2012-03-30" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESQuarterDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2011-10-01", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2012-03-31", @"ok" );
}

/////////////////// RESULT: WEEK RESOLUTION ///////////////////

//May 2012
//Su Mo Tu We Th Fr Sa
//      1  2  3  4  5
//6  7  8  9 10 11 12
//13 14 15 16 17 18 19
//20 21 22 23 24 25 26
//27 28 29 30 31
-(void)testAlignDates_May02_2012_May24_2012_toTwoWeekResolution
{
    NSDate* startDate_ = dateFromString( @"2012-05-02" );
    NSDate* endDate_   = dateFromString( @"2012-05-24" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    ESDateResolution resolution_ = [ calendar_ maximumResolutionFromDate: startDate_ toDate: endDate_ ];

    [ calendar_ alignDateRangeFromDate: &startDate_
                                toDate: &endDate_
                            resolution: resolution_ ];

    STAssertEquals( ESWeekDateResolution, resolution_, @"ok" );

    NSString* startDateStr_ = stringFromDate( startDate_ );
    NSString* endDateStr_   = stringFromDate( endDate_ );

    STAssertEqualObjects( startDateStr_, @"2012-04-29", @"ok" );
    STAssertEqualObjects( endDateStr_  , @"2012-05-26", @"ok" );
}

@end
