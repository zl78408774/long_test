use Pod::Autopod;

 # new Pod::Autopod(readfile=>'subs_lapdm.pm', writefile=>'test1.pm');

 # reading Foo.pm and writing Foo2.pm but with pod
my $basedir = 'C:/temp/subs/';
my $num = 37;
my $pattern = 'pm';

my @files = ();
my @dirs = ($basedir);
die "error $basedir: $!" unless(-d $basedir);

# recursively find all files
while(@dirs){
 $d = $dirs[0];
 $d .= "/" unless($d=~/\/$/);
 for my $f (glob($d . '*')){
  push(@dirs, $f) if(-d $f) ;
  push(@files,$f) if(-f $f && $f=~/$pattern/);
 }
 shift @dirs;
}

#sort according to modified-time
# @files=sort{
 # @sta1=stat($a);
 # @sta2=stat($b);
 # $sta2[9]<=>$sta1[9];
 # }@files;
 
# # delete files earlier than the $num-th
# @files2del = @files[$num..@files-1]; 
# my $cnt = 0;
# if(@files2del){
 # local $"="\n\t";
 # print "going to delete these files:\n\t@files2del\n[y/N]?";
 # my $choice = <>||'N';
 # $cnt = unlink(@files2del)if($choice =~ /^\s*y\s*$/i); 
# }
# print "$cnt files deleted\n";
while (@files){
 my $f =$files[0];
 my $ap = new Pod::Autopod(readfile=>$f);
 print $ap->getPod();
 $ap->writeFile(">>out.pod");
 $ap->writeFile("$f.pod");
 shift @files;
 }
 # reading and Foo.pm and prints the generated pod. 

 # my $ap = new Pod::Autopod();
 # $ap->setPerlCode($mycode);
 # print $ap->getPod();
 # $ap->writeFile('out.pod');

 # asumes perl code in $mycoce and prints out the pod.
 # also writes to the file out.pod