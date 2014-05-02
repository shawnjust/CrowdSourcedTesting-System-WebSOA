/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.Tester;
import cn.com.crowdsourcedtesting.model.SecurityHandler;
import cn.com.crowdsourcedtesting.modelhelper.UserType;
import cn.com.crowdsourcedtesting.struts.form.LoginForm;
import cn.com.crowdsourcedtesting.struts.form.PublisherLoginForm;

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
	 * 测试者登陆
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
		
		
		if (tester!=null) {
			// 测试者登陆成功
			session.setAttribute("UserType", UserType.Tester);
			session.setAttribute("Tester", tester);
			return mapping.findForward("home");

		} else {
			// 测试者登录失败
			session.setAttribute("login", "fail");
			return mapping.findForward("login");
		}

	}

	/**
	 * 测试者登出
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
	 * 跳转到测试者登录页面
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
	 * 测试者登陆
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
		
		
		if (publisher!=null) {
			// 测试者登陆成功
			session.setAttribute("UserType", UserType.Publisher);
			session.setAttribute("Publisher",publisher);
			return mapping.findForward("manage");

		} else {
			// 测试者登录失败
			session.setAttribute("p_login", "fail");
			return mapping.findForward("login");
		}
		
		
		
	}
	
}