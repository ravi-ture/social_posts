Assumptions:

1. There are many models for different lists including users from that particular list
2. The fields of legacy lists like federal_legislator can be changed so I am,
  1. taking out the first_name and last_name fields and keeping them in user table
  2. Adding user_id to lagacy lists to refer to user model
  3. taking out facebook_id and twitter_username fields and keeping them in identity table. This identity table link back to user.
3. Custom lists many or may not include the users from these predefined lists(like users from federal_legislators)
4. For demo purpose I am creating two legacy lists as FederalLegislator and StateGovernor


Conditions: 
1. Project will only work in development work as its not set up for production mode.

Set Up:

1. Update config/database.yml with local username and password
2. Run the rake task : 'rake db:setup'
3. run the rails server and check the home page in browser 