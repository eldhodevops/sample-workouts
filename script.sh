book1=`grep -ow "bk101\|bk102\|bk103" book.txt`
author=`cat book.txt | grep author | cut -d">" -f2 | cut -d"<" -f1`
for book in $book1;do
if [ "$book" = "bk101" ]
then
 echo "Author of $book is " `echo $author | awk -v i=1 '{print $i}'`
elif [ "$book" = "bk102" ]
then
 echo "Author of $book is" `echo $author | awk -v i=3 '{print $i}'`
elif [ "$book" = "bk103" ]
then
 echo "Author of $book is" `echo $author | awk -v i=5 '{print $i}'`
fi
done
