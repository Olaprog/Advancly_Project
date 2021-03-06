
Feature: View borrower all loans

    As a valid Aggregator I want to view all loans taken by a borrower

    Scenario: As an Aggregator view all borrower loans
        Given I visit the aggregator page
        Then I enter username as "paelyt@qa.team"
        And password as "P@ssword01"
        And I click on Log in button
        And I wait for 7000 seconds
        And I can search for a borrower loan with the reference "35D212B585"
        Then I can view all loans taken by a borrower