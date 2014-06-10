package cn.com.crowdsourcedtesting.datawebservices;

import java.sql.Date;
import java.util.List;

import cn.com.crowdsourcedtesting.DAO.AdministratorDAO;
import cn.com.crowdsourcedtesting.DAO.PublisherDAO;
import cn.com.crowdsourcedtesting.DAO.TesterDAO;
import cn.com.crowdsourcedtesting.bean.Administrator;
import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.Tester;

public class UserManagement {
	
	TesterDAO testerDAO = new TesterDAO();
	PublisherDAO publisherDAO = new PublisherDAO();
	AdministratorDAO administratorDAO = new AdministratorDAO();
	
	public Tester isTester(String email,String password) {
		return testerDAO
				.isTester(email, password);
	}
	
	public Publisher isPublisher(String email,String password) {
		return publisherDAO
				.isPublisher(email, password);
	}
	
	public Administrator isAdministrator(String email,String password) {
		return administratorDAO
				.isAdministrator(email, password);
	}
	
	public Tester addTester(String email,String password,String name,
			boolean gender,String mobile,Date birthday,double credit) {
		return testerDAO
				.addTester(email, password, name, gender, mobile, birthday, credit);
	}
	
	public Publisher addPublisher(String name,String email,String password,
			double credit,boolean authority,boolean publisherType,String company,
			String connectEmail){
		return publisherDAO
				.addPublisher(name, email, password, credit, authority, publisherType, company, connectEmail);
	}
	
	public Administrator addAdministrator(String name,String email,
				String password,boolean authority,String occupation) {
		return administratorDAO
				.addAdministrator(name, email, password, authority, occupation);
	}
	
	public Boolean checkPublisher(String email) {
		return publisherDAO
				.checkPublisher(email);
	}//check
	
	public List<Publisher> viewAllPublisher() {
		return (List<Publisher>)publisherDAO
				.findAll();
	}
	
	public List<Publisher> findUncheckedCompany(int page,int row) {
		return publisherDAO
				.findUncheckedCompanyByPageNumber(page, row);
	}
	
	public List<Publisher> findUncheckedPerson(int page,int row)
	{
		return publisherDAO
				.findUncheckedPersonByPageNumber(page, row);
	}
	
	public int getUncheckedCompanyTotalRows() {
		return publisherDAO
				.getUncheckedCompanyTotalRows();
	}
	
	public int getUncheckedPersonTotalRows() {
		return publisherDAO
				.getUncheckedPersonTotalRows();
	}
}