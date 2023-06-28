// HTTP METHODS SHOUD BE WRITTEN IN DIFFERENT HTTP CLASS THAT HANDLES THEM
public with sharing class CourseController {

    // This should be done in a SF NamedCredential. It is only written here for demostration purposes.
    public static final String ENDPOINT = 'https://teamtreehouse.com/profiles/ignaciodelatorre.json?limit=1';
    //This should be done in a separate STATIC variables Class
    public static final String GET = 'GET';

    public static void getBadges(){

        List<TeamTreehouseWrapper.badges> badges = new List<TeamTreehouseWrapper.badges>();
        List<TeamTreehouseWrapper.courses> courses = new List<TeamTreehouseWrapper.courses>();
        
        try
        {
            Http httpCallout = new Http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint(ENDPOINT);
            req.setMethod(GET);
    
            HttpResponse res = httpCallout.send(req);

            TeamTreehouseWrapper teamTreehouseWrapper = TeamTreehouseWrapper.parse(res.getBody());
            badges = teamTreehouseWrapper.badges;

            for(TeamTreehouseWrapper.badges b : badges)
            {
                if(String.valueOf(b.courses) != '')
             		courses.addAll(b.courses);   
            }
            
            for(TeamTreehouseWrapper.courses course : courses)
            {
				system.debug(course.title);
                system.debug(course.url);
            }
            
            System.debug(teamTreehouseWrapper + '   response   ');
        }
        catch(Exception ex)
        {
            System.debug(ex.getMessage());
        }
    }
}