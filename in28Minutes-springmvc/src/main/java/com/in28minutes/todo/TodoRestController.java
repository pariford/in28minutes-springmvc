package com.in28minutes.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TodoRestController {
	
	@Autowired
	TodoService service;
	
	@RequestMapping(path="/todos",method = RequestMethod.GET)
	public List<Todo> retrieveAllTodos(){
		List<Todo> users = service.retrieveTodos("in28Minutes");
        return users;
	}
	
	@RequestMapping(path="/todos/{id}",method = RequestMethod.GET)
	public Todo retrieveTodo(@PathVariable int id){
		return service.retrieveTodo(id);
	}

}
