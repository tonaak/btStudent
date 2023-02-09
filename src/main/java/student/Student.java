package student;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Student {
	
	@Id
	private String id;
	
    private String name;
    private boolean male;
    private Date birthDay;
    private String placeOfBirth;
    private String address;
    private String depName;
    
    
}
