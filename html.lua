local html =  {}


function html.applyTitle(fname, title, level)
	
	o=io.open(fname, "a+")
	
	s="<h"..level..">"..title.."</h"..tostring(level)..">\n"
	
	o:write(s)
	
	o:close()

end

function html.applyText(fname, text, font, color, size)
	
	o=io.open(fname, "a+")
	
	s="<p><font size=\""..size.."\" color=\""..color.."\" face=\""..font.."\">"..text.."</font></p>\n"
	
	o:write(s)
	
	o:close()

end

function html.applyPageBreak(fname)
	
	o=io.open(fname, "a+")
	
	s="<p style=\"page-break-after:always;\"></p>\n"
	
	o:write(s)
	
	o:close()

end

function processLine(l,sepa)
	
end




function html.importTable_CSV(fname, source, sep, withheader)
	
	sourcelines={}
	i=1
	o=io.open(fname, "a+")
	
	for line in io.lines(source) do
		sourcelines[i]=line 
		i=i+1 
	end
	
	
	o:write("<style>")
	o:write("table, th, td {")
	o:write("border-bottom: 1px solid grey;")
	o:write("border-collapse: collapse;")
	o:write("text-align: left;")
	o:write("}")
	o:write("th, td {")
	o:write("padding: 5px;")
	o:write("}")
	o:write("</style>")
	
	o:write("<table style=\"width:100%\">\n")
	
	k=1
	
	while (sourcelines[k]) do
	
		i=1
		l=sourcelines[k]
		j=string.find(l, sep, i)
		o:write("<tr>\n")
		while j and j>1 do
			colValue=string.sub(l, i, j-1)
			if (withheader)and k==1 then s=string.format("<th>%s</td>", colValue)
			else s=string.format("<td>%s</td>", colValue)end
			o:write(s)
			i=j+1
			j=string.find(l, sep, i)
		end
		o:write("</tr>\n")
		
		k=k+1

	end

	o:write("</table>\n")
	
	o:close()
end

--html.importTable_CSV("spese.html", "test.csv", ";")

return html