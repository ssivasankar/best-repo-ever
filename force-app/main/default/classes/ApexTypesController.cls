public with sharing class ApexTypesController {
    @AuraEnabled(cacheable=true)
    public static String checkApexTypes(CustomWrapper wrapper) {
        // Using System.debug() isn't good practice for production applications.
        // It's used here to showcase how the received data looks like in Apex.
        System.debug(wrapper);
        // The values are based on the data that is defined in the
        // apexImperativeMethodWithComplexParams Lightning web component.
        String response =
            'You entered "' +
            wrapper.someString +
            '" as String, and "' +
            wrapper.someInteger +
            '" as Integer value. The list contained ' +
            wrapper.someList.size() +
            ' items.';
        return response;
    }
    class CustomWrapper{
        @AuraEnabled
        public Integer someInteger { get; set; }
        @AuraEnabled
        public String someString { get; set; }
        @AuraEnabled
        public List<String> someList { get; set; }
    }
}