/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.controller;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cn.com.crowdsourcedtesting.DAO.PublisherDAO;
import cn.com.crowdsourcedtesting.bean.Administrator;
import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.Questionnaire;
import cn.com.crowdsourcedtesting.bean.Tester;
import cn.com.crowdsourcedtesting.model.SecurityHandler;
import cn.com.crowdsourcedtesting.modelhelper.MethodNumber;
import cn.com.crowdsourcedtesting.modelhelper.UserType;
import cn.com.crowdsourcedtesting.struts.form.AdminLoginForm;
import cn.com.crowdsourcedtesting.struts.form.ChangeInformationForm;
import cn.com.crowdsourcedtesting.struts.form.FindPasswordForm;
import cn.com.crowdsourcedtesting.struts.form.CheckRegisterDetailForm;
import cn.com.crowdsourcedtesting.struts.form.CheckRegisterListForm;
import cn.com.crowdsourcedtesting.struts.form.LoginForm;
import cn.com.crowdsourcedtesting.struts.form.PageIdForm;
import cn.com.crowdsourcedtesting.struts.form.PublisherLoginForm;
import cn.com.crowdtest.factory.DAOFactory;
import cn.com.other.page.Page;

/**
 * MyEclipse Struts Creation date: 04-29-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/login" name="loginForm" input="/security/login.jsp"
 *                scope="request" validate="true"
 */
public class SecurityRouter extends DispatchAction {
	/*
	 * Generated Methods
	 */

	private SecurityHandler handler = new SecurityHandler();
	
	/**
	 * 测试者登�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward testerLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// LoginForm loginForm = (LoginForm) form;// TODO Auto-generated method
		// stub

		LoginForm f = (LoginForm) form;

		HttpSession session = request.getSession();
		Tester tester = handler.handleTesterLogin(f);

		if (tester != null) {
			// 测试者登陆成�
			session.setAttribute("UserType", UserType.Tester);
			session.setAttribute("Tester", tester);
			return this.testerFindAllQuestionnaire(mapping, form, request, response);

		} else {
			// 测试者登录失�
			session.setAttribute("login", "fail");
			return mapping.findForward("login");
		}

	}

	/**
	 * 测试者登�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward testerLogout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (session.getAttribute("UserType") != null) {
			session.removeAttribute("UserType");
		}
		return mapping.findForward("home");
	}

	/**
	 * 跳转到测试者登录页�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward goToLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		return mapping.findForward("login");
	}

	/**
	 * 跳转到管理员的登录页�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */

	public ActionForward adminLogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		return mapping.findForward("adminLogin");
	}

	/**
	 * 进入管理者页�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */

	public ActionForward manage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		if (form == null) {

			System.out.println("failed");
		}

		AdminLoginForm f = (AdminLoginForm) form;

		HttpSession session = request.getSession();
		Administrator administrator = handler.handleAdministratorLogin(f);

		if (administrator != null) {
			// 管理员登陆成�
			session.setAttribute("UserType", UserType.Administor);
			session.setAttribute("Administrator", administrator);

			return mapping.findForward("home");

		} else {
			// 测试者登录失�
			session.setAttribute("a_login", "fail");
			return mapping.findForward("adminLogin");
		}

	}

	/**
	 * 测试者登�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward enter(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PublisherLoginForm f = (PublisherLoginForm) form;

		HttpSession session = request.getSession();
		Publisher publisher = handler.handlePublisherLogin(f);

		if (publisher != null) {
			// 测试者登陆成�
			session.setAttribute("UserType", UserType.Publisher);
			session.setAttribute("Publisher", publisher);

			return mapping.findForward("manage");

		} else {
			// 测试者登录失�
			session.setAttribute("p_login", "fail");
			return mapping.findForward("login");
		}

	}

	/**
	 * 审核注册的列�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkCompanyList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		CheckRegisterListForm f = (CheckRegisterListForm) form;

		PageIdForm pageIDForm = new PageIdForm();
		pageIDForm.setId(f.getId());
		pageIDForm.setPage(f.getPage());
		pageIDForm.setSubType(f.getSubType());
		// 交给事务处理
		handler.ListHandle(pageIDForm, request, MethodNumber.MethodOne); // 调用第一个接�

		return mapping.findForward("list");

	}

	/**
	 * 查看注册者细�
	 */
	public ActionForward checkDetail(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		CheckRegisterListForm f = (CheckRegisterListForm) form;

		PageIdForm pageIDForm = new PageIdForm();
		pageIDForm.setId(f.getId());
		pageIDForm.setPage(f.getPage());
		pageIDForm.setSubType(f.getSubType());
		// 交给事务处理
		handler.detailHandle(pageIDForm, request, MethodNumber.MethodOne); // 调用第一个接�

		return mapping.findForward("detail");

	}

	/**
	 * 审核注册的列�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward checkPersonList(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		CheckRegisterListForm f = (CheckRegisterListForm) form;

		PageIdForm pageIDForm = new PageIdForm();
		pageIDForm.setId(f.getId());
		pageIDForm.setPage(f.getPage());
		pageIDForm.setSubType(f.getSubType());
		// 交给事务处理
		handler.ListHandle(pageIDForm, request, MethodNumber.MethodTwo); // 调用第一个接�

		return mapping.findForward("list");

	}
/**
 * 响应审核操作
 * @param mapping
 * @param form
 * @param request
 * @param response
 * @return
 */
	public ActionForward checkConfirm(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		CheckRegisterDetailForm detailForm = (CheckRegisterDetailForm) form;

		HttpSession session = request.getSession();

		Administrator admin = (Administrator) session // 得到审核者的信息
				.getAttribute("Administrator");

		String publisherType = (String) session.getAttribute("publisherType");

		if (admin == null) { // 审核者未登录

			return mapping.findForward("adminLogin");

		} else if (form == null) { // 如果传过来的表单为空

			// 如果表单为空，则直接跳转到列�
			Page currentPage = (Page) session.getAttribute("currentPage");
			CheckRegisterListForm p = new CheckRegisterListForm();
			p.setPage(currentPage.getCurrentPage() + "");

			if (publisherType != null && publisherType.equals("Company")) {    //如果是公司，返回公司表单
				return this.checkCompanyList(mapping, p, request, response);
			} else {
				return this.checkPersonList(mapping, p, request, response);    //如果是跟人，返回个人表单
			}

		} else {

			String subType = detailForm.getSubType(); // 通过或者不通过类型

			int id = Integer.parseInt(detailForm.getId()); // 得到要处理的问卷
			PublisherDAO qd = DAOFactory.getPublisherDAO();
			Publisher q = qd.findById(id);
			q.setAdministrator(admin);

			if ("yes".equals(subType)) { // 审核通过

				q.setIsPassed(true);

			} else // 审核不通过
			{

				q.setIsPassed(false);

			}
			qd.save(q); // 修改数据�

			Page currentPage = (Page) session.getAttribute("currentPage");
			PageIdForm p = new PageIdForm();
			p.setPage(currentPage.getCurrentPage() + "");
			
			if (publisherType != null && publisherType.equals("Company")) {    //如果是公司，返回公司表单
				return this.checkCompanyList(mapping, p, request, response);
			} else {
				return this.checkPersonList(mapping, p, request, response);    //如果是跟人，返回个人表单
			}
		}

	}
	
	public ActionForward testerSendCode(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		FindPasswordForm findPasswordForm = (FindPasswordForm) form;
		
		RandomCode randomCode = new RandomCode();
		
		findPasswordForm.setRandomcode(randomCode.getRandomCode(6));
		
		findAuthenticator authenticator = new findAuthenticator("lin1014582610@163.com","zhaoyunting36057");
		
		Properties pros = new Properties();
		pros.put("mail.smtp,host","smtp.163.com");
		pros.put("mail.smtp.port", "25");
		pros.put("mail.transport.protocol", "smtp");
		pros.put("mail.smtp.auth", "true");
		
		Session sendMailSession = Session.getDefaultInstance(pros,authenticator);
		
		try {
			Message mailMessage = new MimeMessage(sendMailSession);
			Address fromAddress = new InternetAddress("lin1014582610@163.com");
			mailMessage.setFrom(fromAddress);
			Address toAddress = new InternetAddress(findPasswordForm.getEmail());
			mailMessage.setRecipient(Message.RecipientType.TO, toAddress);
			mailMessage.setSubject("密码修改验证");
			mailMessage.setSentDate(new Date());
			Multipart mainpart = new MimeMultipart();
			BodyPart htmlBodyPart  = new MimeBodyPart();
			htmlBodyPart.setContent(findPasswordForm.getRandomcode(),"text/html;charset=utf-8");
			mainpart.addBodyPart(htmlBodyPart);
			mailMessage.setContent(mainpart);
			
			Transport transport = sendMailSession.getTransport("smtp");
			transport.connect("smtp.163.com","lin1014582610@163.com","zhaoyunting36057");
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		request.setAttribute("randomcode", findPasswordForm.getRandomcode());
		request.setAttribute("email",findPasswordForm.getEmail());
		return mapping.findForward("findpassword");	
		
	}
	
	public ActionForward testerFindPassword(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		FindPasswordForm findPasswordForm_confirm = (FindPasswordForm)form;
		
		handler.handleTesterFindPassword(findPasswordForm_confirm);

		return mapping.findForward("success");
	
	}
	
	public ActionForward testerChangeInformation(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ChangeInformationForm changeInformationForm = (ChangeInformationForm) form;
		
		handler.handleTesterChangeInformation(changeInformationForm,request);

		return mapping.findForward("success");
	
	}
	
	public ActionForward testerFindAllQuestionnaire(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Tester tester = (Tester)session.getAttribute("Tester");
		
		if (tester == null) {
			return mapping.findForward("login");
		}
		
		else {
			handler.findAllQuestionnair(tester,request);	
			List<Questionnaire> questionnaires = (List<Questionnaire>)session.getAttribute("Questionnaires");
			Iterator iterator = questionnaires.iterator();
			while (iterator.hasNext()) {
				Questionnaire questionnaire = (Questionnaire)iterator.next();
			}
			return mapping.findForward("personal_center");		
		}	
	}
}
class findAuthenticator extends Authenticator{  
    String userName=null;  
    String password=null;  
       
    public findAuthenticator(){  
    }  
    public findAuthenticator(String username, String password) {   
        this.userName = username;   
        this.password = password;   
    }   
    @Override
	protected PasswordAuthentication getPasswordAuthentication(){  
        return new PasswordAuthentication(userName, password);  
    }  
}  