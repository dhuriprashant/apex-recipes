@isTest
public class TestDataHelpers {
    private static final Map<String, String> COUNTRY_CODE_TO_NAME = new Map<String, String>{
        'US' => 'United States',
        'MX' => 'Mexico',
        'UK' => 'United Kingdom',
        'CA' => 'Canada',
        'IT' => 'Italy',
        'IR' => 'Ireland'
    };

    /**
     * @description      Generates an Account object with an optional Country set
     * @param setCountry Boolean should this code set the country code.
     * @param country    String of Country to insert, if setCountry is true
     */
    public static void createAccount(Boolean setCountry, String country) {
        insert genAccountWithOptions(setCountry, country);
    }

    /**
     * @description       Generates a list of Accounts.
     * @param numAccounts Nubmer of accounts to generate.
     */
    public static List<Account> genXNumberOfAccounts(Integer numAccounts) {
        List<Account> toInsert = new List<Account>();
        for (Integer intx = 0; intx < numAccounts; intx++) {
            toinsert.add(genAccountWithOptions(true, 'US'));
        }
        return toInsert;
    }

    /**
     * @description      Generates an Account with (optionally) the Country code Set
     * @param setCountry Boolean should the country field be populated
     * @param country    What to populate the ShippingCountry field with
     */
    public static Account genAccountWithOptions(
        Boolean setCountry,
        String country
    ) {
        Account acct = new Account(
            Name = 'The Test Account of Awesomeness' +
                Crypto.getRandomInteger(),
            ShippingStreet = '123 Sessame St.',
            ShippingCity = 'Wehawkin'
        );

        if (setCountry) {
            String upperCountry = country.toUpperCase();
            acct.ShippingCountry = COUNTRY_CODE_TO_NAME.containsKey(upperCountry)
                ? COUNTRY_CODE_TO_NAME.get(upperCountry)
                : country;
        }
        return acct;
    }

    /**
     * @description  Generates a contact associated with the acctId param.
     * @param acctId AccountID to set the contact's accountId to.
     */
    public static Contact genContactForAccount(Id acctId) {
        return new Contact(
            AccountId = acctId,
            LastName = 'Spectacular Spectacular',
            FirstName = String.valueOf(Crypto.getRandomInteger())
        );
    }
}
