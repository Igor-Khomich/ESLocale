#import "DateAlignmentTest.h"

#import "ESLocaleFactory.h"

#import "NSCalendar+DateAlignment.h"

static NSDate* dateFromString( NSString* date_ )
{
    NSDateFormatter* dateFormatter_ = [ ESLocaleFactory ansiDateFormatter ];
    return [ dateFormatter_ dateFromString: date_ ];
}

static NSString* stringFromDate( NSDate* string_ )
{
    NSDateFormatter* dateFormatter_ = [ ESLocaleFactory ansiDateFormatter ];
    return [ dateFormatter_ stringFromDate: string_ ];
}

static NSInteger weekdayFromDateString( NSString* string_, NSCalendar* calendar_ )
{
    NSDateFormatter* dateFormatter_ = [ ESLocaleFactory ansiDateFormatter ];
    NSDate* date_ = [ dateFormatter_ dateFromString: string_ ];

    NSCalendarUnit unit_ = NSYearForWeekOfYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit;
    NSDateComponents* components_ = [ calendar_ components: unit_
                  fromDate: date_ ];

    return [ components_ weekday ];
}

@implementation DateAlignmentTest

//////////////////// YEAR PAST ////////////////////

-(void)testPastMar31_2011_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2011-03-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2010-12-31", @"ok" );
}

-(void)testPastJan01_2010_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2010-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2009-12-31", @"ok" );
}

-(void)testPastDec31_2012_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2012-12-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-12-31", @"ok" );
}

//////////////////// YEAR FUTURE ////////////////////

-(void)testFutureMar31_2011_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2011-03-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-01-01", @"ok" );
}

-(void)testFutureJan01_2010_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2010-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2010-01-01", @"ok" );
}

-(void)testFutureDec31_2012_YearDateResolution
{
    NSDate* date_ = dateFromString( @"2012-12-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESYearDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2013-01-01", @"ok" );
}

//////////////////// WEEK PAST ////////////////////

-(void)testPastJan01_2011_WeekDateResolution
{
    NSDate* date_ = dateFromString( @"2011-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-01-01", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 7, @"ok" );//should be saturday
}

-(void)testPastMay22_2012_WeekDateResolution
{
    NSDate* date_ = dateFromString( @"2012-05-22" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-05-19", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 7, @"ok" );//should be saturday
}

-(void)testPastJan01_2012_WeekDateResolution
{
    NSDate* date_ = dateFromString( @"2012-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-12-31", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 7, @"ok" );//should be saturday
}

//////////////////// WEAK FUTURE ////////////////////

-(void)testFutureDec30_2010_WeakDateResolution
{
    NSDate* date_ = dateFromString( @"2010-12-30" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-01-02", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 1, @"ok" );//should be sunday
}

-(void)testFutureJan02_2011_WeakDateResolution
{
    NSDate* date_ = dateFromString( @"2011-01-02" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-01-02", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 1, @"ok" );//should be sunday
}

-(void)testFutureDec31_2011_WeakDateResolution
{
    NSDate* date_ = dateFromString( @"2011-12-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESWeekDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-01-01", @"ok" );

    NSInteger weekday_ = weekdayFromDateString( result_, calendar_ );
    STAssertEquals( weekday_, 1, @"ok" );//should be sunday
}

//////////////////// MONTH PAST ////////////////////

-(void)testPastJan01_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2012-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-12-31", @"ok" );
}

-(void)testPastMay22_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2012-05-22" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-04-30", @"ok" );
}

-(void)testPastDec31_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2011-12-31" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toPast: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2011-12-31", @"ok" );
}

//////////////////// MONTH FUTURE ////////////////////

-(void)testFutureJan01_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2012-01-01" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-01-01", @"ok" );
}

-(void)testFutureDec28_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2011-12-28" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-01-01", @"ok" );
}

-(void)testFutureJan11_2012_MonthDateResolution
{
    NSDate* date_ = dateFromString( @"2012-01-11" );

    NSCalendar* calendar_ = [ ESLocaleFactory gregorianCalendar ];
    date_ = [ calendar_ toFuture: date_ forResolution: ESMonthDateResolution ];

    NSString* result_ = stringFromDate( date_ );

    STAssertEqualObjects( result_, @"2012-02-01", @"ok" );
}

@end
