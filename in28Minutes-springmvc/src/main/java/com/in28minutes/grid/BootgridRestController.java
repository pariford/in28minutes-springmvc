package com.in28minutes.grid;

import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.in28minutes.common.BootgridWrapper;
import com.in28minutes.todo.Todo;

@RestController
public class BootgridRestController {

	 @RequestMapping(value = "/boot1data", method=RequestMethod.POST,produces = "application/json; charset=utf-8")
	 public ResponseEntity<BootgridWrapper<Todo>> getData() {
		 BootgridWrapper<Todo> source = new BootgridWrapper<>();
		 source.setCurrent(1);
		 source.setRowCount(10);
		 source.setTotal(100);
		 source.getRows().add(new Todo(1,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(2,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(3,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(4,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(5,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(6,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(7,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(8,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(9,"ABC","Description 1", new Date(),false));
		 source.getRows().add(new Todo(10,"ABC","Description 1", new Date(),false));
		 
		 
		 final ObjectMapper mapper = new ObjectMapper();
		 try {
			System.out.println(mapper.writeValueAsString(source));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 return new ResponseEntity<BootgridWrapper<Todo>>(source, HttpStatus.OK);
	 }
	 

}
