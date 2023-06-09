//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public with sharing class TeamTreehouseWrapper {

    public String name;
	public String profile_name;
	public String profile_url;
	public List<Badges> badges;
	public Points points;

	public class Courses {
		public String title;
		public String url;
		public Integer badge_count;
	}

	public class Points {
		public Integer total;
		public Integer HTML;
		public Integer CSS;
		public Integer Design;
		public Integer JavaScript;
		public Integer Ruby;
		public Integer PHP;
		public Integer Android;
		public Integer AI;
		public Integer React;
	}

	public class Badges {
		public Integer id;
		public String name;
		public String url;
		public String icon_url;
		public String earned_date;
		public List<Courses> courses;
	}
	
	public static TeamTreehouseWrapper parse(String json) {
		return (TeamTreehouseWrapper) System.JSON.deserialize(json, TeamTreehouseWrapper.class);
	}
}