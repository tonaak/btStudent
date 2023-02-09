package student;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
	
	@Autowired
	StudentRepository studentRepository;
	
	public List<Student> listAll() {
		return studentRepository.findAll();
	}
	
	public void save(Student student) {
		studentRepository.save(student);
	}
	
	public Student get(String id) {
		return studentRepository.findById(id).get();
	}
	
	public void delete(String id) {
		studentRepository.deleteById(id);
	}
	
	public boolean checkStudent(String id) {
		return studentRepository.existsById(id);
	}
}
