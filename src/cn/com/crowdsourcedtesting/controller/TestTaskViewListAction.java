/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import cn.com.crowdsourcedtesting.DAO.TestTaskDAO;
import cn.com.crowdsourcedtesting.bean.TestTask;
import cn.com.crowdsourcedtesting.struts.form.TestTaskViewListForm;
import cn.com.other.page.Page;

/** 
 * MyEclipse Struts
 * Creation date: 05-28-2014
 * 
 * XDoclet definition:
 * @struts.action path="/testTaskViewList" name="testTaskViewListForm" input="/form/testTaskViewList.jsp" scope="request" validate="true"
 */
public class TestTaskViewListAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TestTaskViewListForm testTaskViewListForm = (TestTaskViewListForm) form;
		TestTaskDAO testTaskDAO = new TestTaskDAO();
		Page page = new Page();
		page.setCurrentPage(1);
		page.setPerRows(3);
		List<TestTask> list = testTaskDAO.findcheckedWebByPage(page);
		request.getSession().setAttribute("TestTaskViewList", list);
		return mapping.findForward("dispPage");
	}
}