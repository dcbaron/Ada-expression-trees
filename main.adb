with ada.text_io, ada.integer_text_io, tree_expression, ada.float_text_io;
use ada.text_io, ada.integer_text_io, tree_expression,ada.float_text_io;

procedure main is
    inputstring : string(1..50);
    charcount : integer := 0;
    expression_tree : expression_node_ptr;
begin
    put_line("Please enter an expression to evaluate: ");
    get_line(inputstring, charcount);

    expression_tree := construct_expressiontree(inputstring, 1, charcount);
    put_line(binary_expression_tree.inorder_traversal(expression_tree));
    put("Prefix Notation: ");
    put_line(prefix_notation(expression_tree));
	put("Infix Notation: ");
    put_line(infix_notation(expression_tree));

    put("Postfix Notation: ");
    put_line(postfix_notation(expression_tree));

    put("Value: ");
    put(evaluate_expression(expression_tree));
    
    exception
    when bad_error =>
        put_line("Error, incorrect input.");
    
end main;
