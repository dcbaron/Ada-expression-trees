



package body tree_expression is

	--Function Construct_ExpressionTree
	-- returns a binary tree representation of the expression
	function Construct_ExpressionTree (math_string : String; First, Last : Natural) return Expression_Node_Ptr is
		
		stack : array (1.. last-first) of Expression_Node_Ptr; -- a pseudo-stack
		stacksize : natural := 0;

		current : tree_string := (others=> ' ');
		currentstringsize : natural:=0;
	
		foundOperator : Boolean := False; --tests whether expression is just a parenthesized number, eg (3).
		opencount : integer := 0;	
	
		--Procedure nodify
		-- 	If there is a number waiting in 'current', makes it into a node
		--	and pushes it to the stack.
		procedure nodify is
		begin
			if currentstringsize > 0 then
		     	stacksize := stacksize + 1;
		       	stack(stacksize) := Create_Node( 
		       			data => current,
		        		left_child => null, right_child => null);
		        currentstringsize := 0;
		        current := (others => ' ');
		    end if;
		end nodify;	
	
	begin
		for i in first..last loop
		    
		    -- numbers
		    if math_string(i) in '0'..'9' then
		        currentstringsize := currentstringsize + 1;
		        current(currentstringsize) := math_string(i);
		                    
		    --operators
		    elsif math_string(i) = '+'
		    OR    math_string(i) = '-'
		    OR    math_string(i) = '*'
		    OR    math_string(i) = '^'
		    OR    math_string(i) = '/' then
		        
		        foundOperator := True;
		        nodify;
		        
		        --push operator node
		        stacksize := stacksize + 1;
		        current(1) := math_string(i);
		        stack(stacksize) := Create_Node( 
		        			data => current,
		        			left_child => stack(stacksize-1), right_child => null);
		        current := (others => ' ');
			
		    elsif math_string(i) = ' ' then null; --ignore spaces; thus eg (3 2+1) = (32+1)
		    elsif math_string(i) = '(' then --count open parentheses to be sure that
		        opencount := opencount+1;   --input is valid.
	        
		    -- the meat of the algorithm.
		    elsif math_string(i) = ')' then
		        opencount := opencount-1;  --decrement open parentheses count.
		        
		        nodify;
		        if foundOperator then -- expression is NOT just (3)
			        -- set the operator node's children, then push it back to the stack
			        Set_Right_Child( stack(stacksize-1), stack(stacksize) );
			        stack(stacksize-2) := stack(stacksize-1);
			        stacksize := stacksize -2;
			    end if;
			    			    		        		        
		    else         -- a bad character!
		        RAISE bad_input;
		    end if;
		    
		end loop;
		
		nodify;
		
		-- If expression was bad, then the stack will still have unresolved stuff
		-- or else the parentheses won't balance.
		if stacksize /=1 OR opencount /=0 then
			RAISE bad_input;
		end if;
		return stack(stacksize);
		
	-- If the expression was bad, the stack size might have been set to -1,
	-- resulting in this error.
	Exception
	    when constraint_error =>
	    	raise bad_input;
	END Construct_ExpressionTree;
	
--	Function Evaluate expression
	-- Mathematically evaluates an expression tree.
	function Evaluate_Expression (Node : Expression_Node_Ptr) return Float is
		nodestring: string (1.. to_string(get_data(node))'length) --the string in the top node
							:= to_string(get_data(node)); 
		num1, n : integer; -- num1 holds the integer in number nodes. n is only for GET.
		x, y, absolute: float; -- recursive results
		ans : float; -- return value
	begin
		if nodestring(1) in '0'..'9' then
			io_int.get( nodestring, num1, n);
			return float(num1);
		else
			x:= Evaluate_Expression( Get_Left_Child(Node) );
			y:= Evaluate_Expression( Get_Right_Child(Node) );
			
			
			if nodestring(1) = '+' then
				ans := x + y;
			elsif nodestring(1) = '-' then
				ans := x - y;
			elsif nodestring(1) = '*' then
				ans := x * y;
			elsif nodestring(1) = '/' then
				ans := x / y;
			elsif nodestring(1) = '^' then
				absolute := sqrt(x**2);
				ans := absolute ** y;
			end if;							
			
			return ans;
		end if;			
	end evaluate_expression;
	
	--function to_string
	-- converts a tree-string to a short string
	function To_String (Input : Tree_String) return string is
        digit : integer := 0;
    begin
        for i in 1..20 loop
            if Input(i) /= ' ' then --discard spaces
                digit := digit +1;
            end if;
        end loop;

        return Input(1..digit);
    end To_String;




function Infix_Notation (Node : Expression_Node_Ptr) return string is
begin
    if binary_expression_tree.get_left_child(Node) = null and binary_expression_tree.get_right_child(Node) = null then
        return To_String(binary_expression_tree.get_data(node));
    else
        return "(" & infix_notation(binary_expression_tree.get_left_child(Node)) & to_string(binary_expression_tree.get_data(Node)) & infix_notation(binary_expression_tree.get_right_child(Node)) & ")";
--        tempstring := tempstring(length+1..infixlength) & infix_notation(binary_expression_tree.get_left_child(Node));
--        tempstring := tempstring & binary_expression_tree.get_data(Node);
--        tempstring := tempstring & infix_notation(binary_expression_tree.get_right_child(Node));
--        tempstring := tempstring & ")";
    end if;

end Infix_Notation;


function Prefix_Notation (Node : Expression_Node_Ptr) return string is
begin
    return Binary_Expression_Tree.Preorder_Traversal(Node);
end Prefix_Notation;

function Postfix_Notation (Node : Expression_Node_Ptr) return string is
begin
    return Binary_Expression_Tree.Postorder_Traversal(Node);
end Postfix_Notation;


	
Begin
	null;
end tree_expression;











		













