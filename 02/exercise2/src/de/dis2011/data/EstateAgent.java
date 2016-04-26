package de.dis2011.data;


/**
 * EstateAgent-Pojo
 */
public class EstateAgent {

    public static final String DB_COLUMN_ID = "ID";
    public static final String DB_COLUMN_NAME = "NAME";
    public static final String DB_COLUMN_ADDRESS = "ADDRESS";
	public static final String DB_COLUMN_LOGIN = "LOGIN";
	public static final String DB_COLUMN_PASSWORD = "PASSWORD";
	private int id = -1;
	private String name;
	private String address;
	private String login;
	private String password;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public void setId(String id) {
		this.id = Integer.parseInt(id);
	}


	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getLogin() {
		return login;
	}
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}
