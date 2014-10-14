use Pod::HtmlEasy;
  my $podhtml = Pod::HtmlEasy->new ( 
        # on_L => sub {
		# my ( $this , $txt ) = @_ ;
		# return "<p><i><a href='http://search.cpan.org/perldoc?$txt'>$txt</a></i></p>" ;},
		on_textblock => sub {
		my ( $this , $txt ) = @_ ;
		return "<pre>$txt</pre>\n" ;},
		
);
  my $html = $podhtml->pod2html( 'out.pod' );
  open (MYFILE, '>>new.html');
  print MYFILE $html;
  # $html->writeFile('new.html');
  # write ('new.html', $html)；
  close (MYFILE);
  
# use Pod::HtmlEasy;

# my $podhtml = Pod::HtmlEasy->new( 
# #   on_textblock => sub {
# #         my ( $this , $txt ) = @_ ;
# #         return "<pre>'$txt'</pre>\n" ;} 
# );
#   
# my $html = $podhtml->pod2html( 'out.pod' ) ;

# print $html ;