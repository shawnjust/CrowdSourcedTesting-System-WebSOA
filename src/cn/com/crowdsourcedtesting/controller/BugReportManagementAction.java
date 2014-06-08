/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package cn.com.crowdsourcedtesting.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionRedirect;
import org.apache.struts.actions.DispatchAction;

import cn.com.crowdsourcedtesting.DAO.BugReportDAO;
import cn.com.crowdsourcedtesting.DAO.TestTaskDAO;
import cn.com.crowdsourcedtesting.bean.BugReport;
import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.TestTask;
import cn.com.crowdsourcedtesting.struts.form.BugReportManagementForm;

/**
 * MyEclipse Struts Creation date: 06-05-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/bugReportManagement" name="bugReportManagementForm"
 *                parameter="method" scope="request" validate="true"
 */
public class BugReportManagementAction extends DispatchAction {
	/*
	 * Generated Methods
	 */

	/**
	 * Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward bugReportList(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		BugReportManagementForm bugReportManagementForm = (BugReportManagementForm) form;
		System.out.println(bugReportManagementForm.getBugReportId());
		System.out.println(bugReportManagementForm.getTaskId());

		Publisher publisher = (Publisher) request.getSession().getAttribute(
				"Publisher");
		if (publisher == null) {
			return new ActionRedirect(
					mapping.findForwardConfig("publisherLogin"));
		}

		Integer bugReportId = bugReportManagementForm.getBugReportId();
		Integer taskId = bugReportManagementForm.getTaskId();

		if (taskId == null) {
			return new ActionRedirect(mapping.findForwardConfig("taskList"));
		}

		TestTaskDAO testTaskDAO = new TestTaskDAO();
		BugReportDAO bugReportDAO = new BugReportDAO();
		TestTask testTask = testTaskDAO.findById(taskId);

		if (testTask == null
				|| !testTask.getPublisher().getPublisherId()
						.equals(publisher.getPublisherId())) {
			return new ActionRedirect(mapping.findForwardConfig("taskList"));
		}

		List<BugReport> bugReportList = bugReportDAO
				.getBugReportByTask(testTask);

		if (bugReportList == null || bugReportList.size() == 0) {
			return mapping.findForward("noBugReport");
		}
		request.setAttribute("BugReportList", bugReportList);

		if (bugReportId != null) {
			BugReport bugReport = bugReportDAO.findById(bugReportId);
			if (bugReport.getTestTask().getTaskId().equals(taskId)) {
				request.setAttribute("BugReportDetail", bugReport);
			}
		}

		return mapping.findForward("bugReportDetail");
	}
}