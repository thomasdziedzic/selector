@isTest
global class RecordTest
{
    private static testMethod void isNew()
    {
        Test.startTest();

            Filter constructed = Record.isNew();

        Test.stopTest();

        System.assert( constructed.predicate instanceof IsNewPredicate,
            'The filter should be on new records' );
    }

    private static testMethod void notNew()
    {
        Test.startTest();

            Filter constructed = Record.notNew();

        Test.stopTest();

        System.assert( constructed.predicate instanceof NotPredicate,
            'The filter should be an inversion' );
        System.assert( ((NotPredicate)constructed.predicate).inverted instanceof IsNewPredicate,
            'The filter should be on non-new records' );
    }

    private static testMethod void byId()
    {
        Test.startTest();

            Filter constructed = Record.byId( '001000000000001' );

        Test.stopTest();

        System.assert( constructed instanceof FilterIdMap,
            'The filter should be an Id-optimized filter' );

        FilterIdMap filter = (FilterIdMap)constructed;
        System.assertEquals( '001000000000001', filter.searchId,
            'The value passed in should be the filter value' );
    }

    private static testMethod void byName()
    {
        Test.startTest();

            Filter constructed = Record.byName( 'Foobar' );

        Test.stopTest();

        System.assert( constructed.predicate instanceof FieldEqualsPredicate,
            'The filter should be a field equals filter' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)constructed.predicate;
        System.assertEquals( 'Name', predicate.field.toString(),
            'The filter should be on the Name field' );
        System.assertEquals( 'Foobar', predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void isOrphan()
    {
        Test.startTest();

            Filter constructed = Record.isOrphan( 'Account' );

        Test.stopTest();

        System.assert( constructed.predicate instanceof FieldNullPredicate,
            'The filter should be a field null filter' );

        FieldNullPredicate predicate = (FieldNullPredicate)constructed.predicate;
        System.assertEquals( 'Account', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }
}
