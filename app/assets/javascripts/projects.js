$(document).ready(function(){
	
	$('.task').on('change',function(){
	  $.post('/projects/'+$(this).data('project-id')+'/tasks/'+$(this).data('id')+'/update_finish',{"_method":"patch"},function(){

	  });
	});

});