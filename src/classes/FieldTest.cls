@isTest
private class FieldTest
{
    private static testMethod void testFieldChangedFilter_Schema()
    {
        Test.startTest();

            Filter companyChangedFilter = Field.hasChanged( Lead.Company );

        Test.stopTest();

        System.assert( companyChangedFilter.predicate instanceof FieldChangedPredicate,
            'The filter should be of the proper variety' );

        FieldChangedPredicate predicate = (FieldChangedPredicate)companyChangedFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldChangedFilter_String()
    {
        Test.startTest();

            Filter companyChangedFilter = Field.hasChanged( 'Company' );

        Test.stopTest();

        System.assert( companyChangedFilter.predicate instanceof FieldChangedPredicate,
            'The filter should be of the proper variety' );

        FieldChangedPredicate predicate = (FieldChangedPredicate)companyChangedFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter_Schema()
    {
        Test.startTest();

            Filter companyNewFilter = Field.isNew( Lead.Company );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof FieldNewPredicate,
            'The filter should be of the proper variety' );

        FieldNewPredicate predicate = (FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNewFilter_String()
    {
        Test.startTest();

            Filter companyNewFilter = Field.isNew( 'Company' );

        Test.stopTest();

        System.assert( companyNewFilter.predicate instanceof FieldNewPredicate,
            'The filter should be of the proper variety' );

        FieldNewPredicate predicate = (FieldNewPredicate)companyNewFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldHasChildren()
    {
        Test.startTest();

            Filter hasOpportunitiesFilter = Field.hasChildren( 'Opportunities' );

        Test.stopTest();

        System.assert( hasOpportunitiesFilter.predicate instanceof HasChildrenPredicate,
            'The filter should be of the proper variety' );

        HasChildrenPredicate predicate = (HasChildrenPredicate)hasOpportunitiesFilter.predicate;
        System.assertEquals( 'Opportunities', predicate.childrenField,
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldHasNoChildren()
    {
        Test.startTest();

            Filter hasNoOpportunitiesFilter = Field.hasNoChildren( 'Opportunities' );

        Test.stopTest();

        System.assert( hasNoOpportunitiesFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        HasChildrenPredicate predicate = (HasChildrenPredicate)((NotPredicate)hasNoOpportunitiesFilter.predicate).inverted;
        System.assertEquals( 'Opportunities', predicate.childrenField,
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldEqualsFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Field.isEqual( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldEqualsFilter_String()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyEqualsFoobarFilter = Field.isEqual( 'Company', FILTER_VALUE );

        Test.stopTest();

        System.assert( companyEqualsFoobarFilter.predicate instanceof FieldEqualsPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)companyEqualsFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotEqualsFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyNotEqualsFoobarFilter = Field.notEqual( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)((NotPredicate)companyNotEqualsFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotEqualsFilter_String()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyNotEqualsFoobarFilter = Field.notEqual( 'Company', FILTER_VALUE );

        Test.stopTest();

        System.assert( companyNotEqualsFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldEqualsPredicate predicate = (FieldEqualsPredicate)((NotPredicate)companyNotEqualsFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldInFilter_Schema()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyInFoobarFilter = Field.isIn( Lead.Company, FILTER_VALUES );

        Test.stopTest();

        System.assert( companyInFoobarFilter.predicate instanceof FieldInPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)companyInFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldInFilter_String()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyInFoobarFilter = Field.isIn( 'Company', FILTER_VALUES );

        Test.stopTest();

        System.assert( companyInFoobarFilter.predicate instanceof FieldInPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)companyInFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotInFilter_Schema()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyNotInFoobarFilter = Field.notIn( Lead.Company, FILTER_VALUES );

        Test.stopTest();

        System.assert( companyNotInFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)((NotPredicate)companyNotInFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNotInFilter_String()
    {
        Set<Object> FILTER_VALUES = new Set<Object>{ 'Foobar' };

        Test.startTest();

            Filter companyNotInFoobarFilter = Field.notIn( 'Company', FILTER_VALUES );

        Test.stopTest();

        System.assert( companyNotInFoobarFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldInPredicate predicate = (FieldInPredicate)((NotPredicate)companyNotInFoobarFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( 1, predicate.values.size(),
            'The set passed in should be the filter set' );
        System.assert( predicate.values.containsAll( FILTER_VALUES ),
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldNullFilter_Schema()
    {
        Test.startTest();

            Filter companyNullFilter = Field.isNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof FieldNullPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNullFilter_String()
    {
        Test.startTest();

            Filter companyNullFilter = Field.isNull( 'Company' );

        Test.stopTest();

        System.assert( companyNullFilter.predicate instanceof FieldNullPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)companyNullFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_Schema()
    {
        Test.startTest();

            Filter companyNotNullFilter = Field.notNull( Lead.Company );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)((NotPredicate)companyNotNullFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldNotNullFilter_String()
    {
        Test.startTest();

            Filter companyNotNullFilter = Field.notNull( 'Company' );

        Test.stopTest();

        System.assert( companyNotNullFilter.predicate instanceof NotPredicate,
            'The filter should be of the proper variety' );

        FieldNullPredicate predicate = (FieldNullPredicate)((NotPredicate)companyNotNullFilter.predicate).inverted;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
    }

    private static testMethod void testFieldStartsWithFilter_Schema()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyStartsWithFoobarFilter = Field.startsWith( Lead.Company, FILTER_VALUE );

        Test.stopTest();

        System.assert( companyStartsWithFoobarFilter.predicate instanceof FieldStartsWithPredicate,
            'The filter should be of the proper variety' );

        FieldStartsWithPredicate predicate = (FieldStartsWithPredicate)companyStartsWithFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }

    private static testMethod void testFieldStartsWithFilter_String()
    {
        final String FILTER_VALUE = 'Foobar';

        Test.startTest();

            Filter companyStartsWithFoobarFilter = Field.startsWith( 'Company', FILTER_VALUE );

        Test.stopTest();

        System.assert( companyStartsWithFoobarFilter.predicate instanceof FieldStartsWithPredicate,
            'The filter should be of the proper variety' );

        FieldStartsWithPredicate predicate = (FieldStartsWithPredicate)companyStartsWithFoobarFilter.predicate;
        System.assertEquals( 'Company', predicate.field.toString(),
            'The field passed in should be the filter field' );
        System.assertEquals( FILTER_VALUE, predicate.value,
            'The value passed in should be the filter value' );
    }
}
