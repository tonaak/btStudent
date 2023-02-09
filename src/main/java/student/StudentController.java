package student;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudentController {
	private List<Student> students = new ArrayList<Student>();

	@Autowired
	StudentService studentService;

	@RequestMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/list")
	public String showList(Model model) {
		students = studentService.listAll();
		model.addAttribute("list", students);
		return "list";
	}

	@GetMapping("/new")
	public String showFormNewStudent(Model model) {
		Student newStudent = new Student();
		model.addAttribute("student", newStudent);
		return "newStudent";
	}

	@PostMapping("/new")
	public String submitForm(@ModelAttribute("student") Student student, Model model) {
		studentService.save(student);
		return showList(model);
	}

	@GetMapping("/detail")
	public String showDetail(@RequestParam String id, Model model) {
		Student studentDetail = new Student();
		studentDetail = studentService.get(id);
		model.addAttribute("student", studentDetail);
		return "studentDetail";
	}

	@GetMapping("/edit")
	public String showEditForm(@ModelAttribute("student") Student student, @RequestParam String id, Model model) {
		Student studentEdit = new Student();
		studentEdit = studentService.get(id);
		model.addAttribute("detail", studentEdit);
		return "editStudent";
	}

	@PostMapping("/update")
	public String editStudent(@ModelAttribute("student") Student student, Model model) {
		studentService.save(student);
		return showList(model);
	}
	
	@PostMapping("/check")
	public @ResponseBody String checkId(@RequestParam String id) {
		if(studentService.checkStudent(id)) {
			return "<p style=\"color:red\">Not available</p>";
		} else {
			return "<p style=\"color:green\">Available</p>";
		}
	}

	@PostMapping("/checkDelete")
	public String controllerMethod(@RequestParam(value="myArray[]") String[] myArray){
		for (int i = 0; i < myArray.length; i++) {
			studentService.delete(myArray[i]);
		}
		return "list";
	}
}
