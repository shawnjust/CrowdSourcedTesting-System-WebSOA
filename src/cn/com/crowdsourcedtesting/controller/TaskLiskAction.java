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
import org.apache.struts.action.ActionRedirect;

import cn.com.crowdsourcedtesting.DAO.TestTaskDAO;
import cn.com.crowdsourcedtesting.bean.Publisher;
import cn.com.crowdsourcedtesting.bean.TestTask;
import cn.com.crowdsourcedtesting.modelhelper.TaskType;
import cn.com.crowdsourcedtesting.struts.form.TaskLiskForm;
import cn.com.other.page.Page;

/**
 * MyEclipse Struts Creation date: 05-25-2014
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/taskLisk" name="taskLiskForm"
 *                input="/form/taskLisk.jsp" scope="request" validate="true"
 */
public class TaskLiskAction extends Action {
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
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TaskLiskForm taskLiskForm = (TaskLiskForm) form;// TODO Auto-generated
														// method stub

		Publisher publisher = (Publisher) request.getSession().getAttribute(
				"Publisher");
		if (publisher == null) {
			return new ActionRedirect(
					mapping.findForwardConfig("publisherLogin"));
		}

		Integer pageCount = taskLiskForm.getPage();
		Integer type = taskLiskForm.getType();
		if (pageCount == null || pageCount < 1) {
			pageCount = 1;
		}
		if (type == null
				|| (type != TaskType.Web && type != TaskType.Android && type != TaskType.Desktop)) {
			type = TaskType.Web;
		}

		TestTaskDAO testTaskDAO = new TestTaskDAO();
		Page page = new Page();
		page.setCurrentPage(pageCount);
		List<TestTask> resultList;
		switch (type) {
		case (TaskType.Web):
			resultList = testTaskDAO.findPublisherWebTestTaskByPage(page,
					publisher);
			break;
		case (TaskType.Android):
			break;
		case (TaskType.Desktop):
			break;
		}
		resultList = testTaskDAO
				.findPublisherWebTestTaskByPage(page, publisher);

		request.getSession().removeAttribute("PublisherWebTestTaskByPage");
		request.getSession().setAttribute("PublisherWebTestTaskByPage",
				resultList);

		return mapping.findForward("taskList");
	}
}