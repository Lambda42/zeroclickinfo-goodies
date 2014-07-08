package DDG::Goodie::Tags;
#Brings joy to the world.

use DDG::Goodie;

name 'Tags';
source 'http://www.w3schools.com/tags/default.asp';
description 'Gives basic information about HTML tags';
primary_example_queries "tag <abbr>", "tag <small>";
category 'programming ';
code_url 'https://github.com/duckduckgo/zeroclickinfo-goodies/blob/master/lib/DDG/Goodie/Tags.pm';
attribution github => "Lambda42"; 

zci answer_type => "Tags";
zci is_cached => 1;

triggers start =>
	'tag',
	'HTML tag';

#pulls tag definitions from the 
my $text = scalar share('tags.txt')->slurp;
my @defs = split(";",$text);

handle remainder => sub{
	
	my $var=$_;
    my $defSize=@defs;
    my $count=0;
    
    while($count<$defSize)
    {
    	if(index($defs[$count],$var) != -1)
        {
        	
    		return $defs[$count+1],
            	html=>qq{$defs[$count+1] <br> <a href="$defs[$count+2]">Learn More</a>};
           
    	};
       $count++;
	};
	return;

};
1;
