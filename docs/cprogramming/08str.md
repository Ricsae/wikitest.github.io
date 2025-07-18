## 字符串的存储

字符串简称串。存放字符串时，是从左往右依次存储字符的，末尾以'\0'结束。

举例：“Hello”

| ... | H | e | l | l | o | \0 | ... |
|-----|---|---|---|---|---|----|-----|

强调以下重要的几点：

1. 要把含n个字符的字符串存储起来，要申请至少n+1个元素的一个数组，因为需要存储'\0'字符。

```c
#include<stdio.h>
int main()
{
	char str1[4]="abc";
	printf("%s\n",str1);//结果：abc 
	/*char str2[3]="abc";//报错，因为字符串的存储空间小了 
	printf("%s\n",str2);*/ 
	return 0;
}
```

2. 可以使用两种方法把一个串存储到数组中

- 使用字符串常量，格式是：

 char 数组名[元素个数]=字符串常量;

```c
#include<stdio.h>
int main()
{
	char str1[9]="Good Day";//因为空格也算一个字符所以一个有8个字符，但因为'\0'也需要占1个字符空间，则至少要9个元素
	char str2[]="Good Day";//元素个数可以省略
	char str3[11]="Good Day";//元素个数可以比字符多，但是不能比字符少
	printf("%s\n",str1);
	printf("%s\n",str2);
	printf("%s\n",str3);
	return 0;
 } 
```

str1,str2,str3的存储方式依次如下：

| G | o | o | d |      | d | a | y | \0 |
|---|---|---|---|------|---|---|---|----|

| G | o | o | d |      | d | a | y | \0 |
|---|---|---|---|------|---|---|---|----|

| G | o | o | d |      | d | a | y | \0 | ? | ? |
|---|---|---|---|------|---|---|---|----|---|---|

- 使用字符常量，格式是：

 char 数组名[元素个数]={字符常量列表};

```c
#include<stdio.h>
int main()
{
	char str1[6]={'H','e','l','l','o','\0'};//因为'\0'也需要占1个字符空间，则至少要6个元素
	char str2[]={'H','e','l','l','o','\0'};//元素个数可以省略
	char str3[11]={'H','e','l','l','o','\0'};//元素个数可以比字符多，但是不能比字符少
	printf("%s\n",str1);
	printf("%s\n",str2);
	printf("%s\n",str3);
	return 0;
 } 
```

上面程序语句中实现了把字符串"Hello"存储到字符型的数组中，要注意，使用字符常量时最后一个字符必须是'\0'。

## 指针与字符串

既然字符串存储在字符型数组中，当然也可以用前面的方法指针来处理字符串。

### 把字符串常量直接赋给指针

一个字符串常量的值是该字符串首字符在内存中的地址。因此，可以直接把一个字符串常量赋给字符型的指针。

```c
#include<stdio.h>
int main()
{
	char* ps="Good day";
	printf("%s\n",ps);
	return 0;
 } 
```

### 用指针指向数组

字符串存储到数组后，可以用指针指向数组，然后通过指针来处理串。

```c
#include<stdio.h>
int main()
{
	char s[10]="Good day";
	char* ps=s;
	printf("%s\n",ps);
	return 0;
 } 
```

### 用指针数组指向多个串

可以用指针数组指向多个串。

```c
#include<stdio.h>
int main()
{
	char* ps[3]={"wangli","sunli","zhaona"};
	printf("%s\n",ps[0]);
	printf("%s\n",ps[1]);
	printf("%s\n",ps[2]);
	return 0;
 } 
```

## 字符串输入\输出

我们经常使用的输入scanf和输出printf，其实也可以用字符串专门的输入gets和输出puts来输入输出字符串。它们都包含在头文件stdio.h中。

### 使用scanf函数输入字符串

1. 格式：scanf("%s",数组名);

2. 作用：将用户从键盘上输入的字符序列以字符串的形式存储到数组中。

```c
#include<stdio.h>
int main()
{
	char name[20];
	scanf("%s",name);
	printf("%s",name);
	return 0;
 } 
```

3. 弊端：scanf中输入的字符串中不能出现空格或Tab

```c
#include<stdio.h>
int main()
{
	char name[20];
	scanf("%s",name);
	printf("%s",name);
	return 0;
 } 
```

```c
//输入 
zhangsan
//输出
zhangsan
```

这种情况是输入的时候不含有空格和Tab。

```c
//输入 
zhang	san
//输出
zhang
```

这种情况是输入含有Tab，会导致Tab之后的字符不能出现。

```c
//输入 
zhang san
//输出
zhang
```

这种情况是含有空格的，它与Tab一样，空格之后的字符不在出现。

### 使用gets函数输入串

1. 格式：gets(数组名);

2. 作用：将用户从键盘上输入的字符序列以字符串的形式存储到数组中。

```c
#include<stdio.h>
int main()
{
	char name[20];
	gets(name);
	printf("%s",name);
	return 0;
 } 
```

```c
//输入 
zhang san
//输出
zhang san
```

这个时候空白也能出现在屏幕上了。

**总结**与scanf函数不同的是gets函数可以录入空白字符。

### 使用printf函数输出串

（1）格式： printf("%s",地址);

（2）作用：将指定地址开始的字符串输出到屏幕。

```c
#include<stdio.h>
int main()
{
	char str[20]="abcdef123"; 
	printf("%s\n",str);
	printf("%s\n",str+4);
	printf("%s\n",&str[2]);
	return 0;
 } 
```

```c
//输出
abcdef123
ef123
cde123
```

**强调**字符串在内存中既然是以空字符（\0）结束字符序列，因此就可以使用%c来控制输出一个字符串。

```c
#include<stdio.h>
int main()
{
	char str[20]="abcdef123"; 
	char* ps=str;
	while(*ps)
	{
		printf("%c",*ps++);
	}
	return 0;
 } 
```

```c
//输出
abcdef123
```

### 使用puts函数输出串

（1）格式：puts(地址);

（2）作用：将指定地址开始的字符串输出到屏幕后换行。puts函数的这条语句结束直接换行。

```c
#include<stdio.h>
int main()
{
	char str[20]="abcdef123"; 
	puts(str);
	puts(str+4);
	puts(&str[2]);
	return 0;
 } 
```

```c
//输出
abcdef123
ef123
cde123
```

### 例题部分

1：输入一个字符串，把其中的大写字母转换为小写字母后输出。

```c
#include<stdio.h>
int main()
{
	char s[1000];
	int i;
	printf("请输入一个字符串：");
	scanf("%s",s);
	printf("刚刚输入的字符串是什么：%s\n",s);
	i=0;
	while(s[i]!='\0')//因为字符串是以'\0'结束，所以这句话作为结束循环的标志
	{
		if(s[i]>='A'&&s[i]<='Z')
		{
			s[i]+='a'-'A';//这个语句的意思是大写字母转换为小写字母，此处使用ASCII码表大写字母与小写字母的差值
            //可以替换成s[i]+=32;
		}
		i++;//将下标向后移动一位
	}
	printf("最终的字符串为：%s\n",s);
	return 0;
}
```

```c
// 最终结果
请输入一个字符串：ABC
刚刚输入的字符串是什么: ABC
最终的字符串为: abc
```

2：输入一个字符串，把其中的空格字符删除后输出

```c
#include<stdio.h>
int main()
{
	char s[1000];
	int i=0;
	int k=0;
	printf("请输入一个字符串：");
	gets(s);//这里不用scanf的原因是因为这道题需要输入空格，gets可以接收空格，但是gets不可以接收空格 
	printf("刚刚输入的字符串是：%s\n",s);
	while(s[i]!='\0')
	{
		if(s[i]!=' ')
		{
			s[k++]=s[i];//这句话的意思是，如果是s[i]不是空格，将s[i]中字符赋值给s[k],然后k++;
			//上面那句话可以写成两句，即：
			//s[k]=s[i];
			//k++; 
		}
		i++;
	} 
	s[k]='\0';//最后字符串要以'\0'结束这个语句
	printf("最终字符串为：");//其实这句加下面那句可以改成printf("最终字符串为：%s\n",s);结果都是一样的 
	puts(s); 
	return 0;
}
```

```c
// 最终结果
请输入一个字符串：abc 123
刚刚输入的字符串是什么: abc 123
最终的字符串为: abc123
```

例题3：输入月份号码（1~12），输出对应月份的英文名字（法一）

```c
#include<stdio.h>
char* monName[13]={" ","January","Febrary","March",
					"April","May","June",
					"July","August","September",
					"October","November","December"};//第一个为空字符是因为数组的下标总是从0开始 ，这个其实也可以用二维数组写，看完下面的例题4和例题5应该先思考以下吧！在例题5后面会给出答案
int main()
{
	int monN;
	do
	{
		printf("请输入一个月号(1-12)：");
		scanf("%d",&monN);
	}while(monN<1||monN>12);//如果输入的月份不在1~12月，那么就会一直执行这条语句 
	printf("\n月份是%d月，月份名是%s\n",monN,monName[monN]);
	return 0;
 } 
```

```c
请输入一个月号（1-12）：0
请输入一个月号（1-12）：13
请输入一个月号（1-12）：-1
请输入一个月号（1-12）：1

月份是1月，月份名是January
```

例题4：定义一个数组存储5个学生的名字并进行遍历

```c
#include<stdio.h>
int main()
{
	//字符串的底层就是字符数组
	//把多个字符数组再放到一个大数组当中
	//二维数组
	//1.定义一个二维数组，存储多个学生的名字
	char strarr[5][100]=
	{
		"zhangsan",
		"lisi",
		"wangwu",
		"zhaoliu",
		"qianqi"
	 };
	 //2.遍历二维数组
	 for(int i=0;i<5;i++) 
	 {
	 	//依次表示二维数组中的每一个索引
		 char* str=strarr[i];
		 printf("%s\n",str); 
	 }
	return 0;
}
```

```c
// 输出
zhangsan
lisi
wangwu
zhaoliu
qianqi
```

例题5：输入5个国家的英文名字，按每行一个输出

```c
#include<stdio.h>
int main()
{
	char couName[5][20];
	int i=0;
	for(i=0;i<5;i++)
	{
		printf("请输入一个国家的姓名：");
		scanf("%s",couName[i]);
	}
	for(i=0;i<5;i++)
	{
		puts(couName[i]);//这里题目说了按每一行一个输出所以用puts，当然也可以用printf记得加\n就可以了
	}
	return 0;
 } 
```

```c
// 控制台输出
请输入一个国家的姓名：china
请输入一个国家的姓名：japan
请输入一个国家的姓名：russia
请输入一个国家的姓名：austrilia
请输入一个国家的姓名：france
china
japan
russia
austrilia
france
```

例题3补充：输入月份号码（1~12），输出对应月份的英文名字（法二）

```c
#include<stdio.h>
char monName[13][20]={" ","January","Febrary","March",
					"April","May","June",
					"July","August","September",
					"October","November","December"};//第一个为空字符是因为数组的下标总是从0开始 
int main()
{
	int monN;
	do
	{
		printf("请输入一个月号(1-12)：");
		scanf("%d",&monN);
	}while(monN<1||monN>12);//如果输入的月份不在1~12月，那么就会一直执行这条语句 
	printf("\n月份是%d月，月份名是%s\n",monN,monName[monN]);
	return 0;
 } 
```

## 字符串处理函数

字符串不是标准数据类型，对串的操作需要借助库函数完成。
C语言提供了丰富的字符串处理函数。所有函数的原型包含在string.h中，函数的名字有一个共同的特点——一般都含有前缀str,如strcpy、strcmp等。在这里将介绍几个常用的串处理函数。

### strlen函数

（1）函数原型:    int strlen(const char*string)

（2）函数功能： 返回参数string所指向串的长度，即除空格字符外的字符个数。

如：char s[ ]="Hello";

则下列函数调用的结果是：

strlen(s)            结果是：5

strlen(s+2)        结果是：3

```c
#include<stdio.h>
#include<string.h>
int main()
{
	char s[81];
	printf("输入一个字符串：");
	gets(s);
	printf("字符串是：%s\n",s);
	printf("长度是：%d\n",strlen(s));
	return 0;
}
```

```c
输入一个字符串：abc1123
字符串是：abc1123
长度是: 7
```

1. 从键盘输入一个字符串，输出这个串和它的逆串（如“abc”的逆串是“cba”）；

```c
#include<stdio.h>
#include<string.h>
int main()
{
	char s[81];
	char temp;
	int i=0;
	int n=0;
	printf("输入一个字符串：");
	gets(s);
	printf("字符串是：%s\n",s);
	for(i=0,n=strlen(s);i<n/2;i++)
	{
		temp=s[i];
		s[i]=s[n-i-1];
		s[n-i-1]=temp;
	}//i指向字符串的第一个字符，n指向字符串的最后一个字符 
	printf("逆串是：%s\n",s);
	return 0;
}
```

```c
输入一个字符串：abc1123
字符串是：abc1123
逆串是: 321cba
```

### strcpy函数

（1）函数原型： char*  strcpy(char* to_string,const char* from_string);

（2）函数功能： 用来把from_string（源串）的字符串连同‘\0’一起复制到to_string（目标串）中的字符串。若有以下定义：

 char s1[20];
 char s2[ ]="C language";
 char*  p="World";

则下面的语句都是合法的：

 strcpy(s1,"Hello"); 则s1的内容为串"Hello"
 strcpy(s1,p); 则s1的内容为串"World"
 strcpy(s1,s2+2); 则s1的内容为串"language"

（3）注意事项：第一个参数to_string一定是字符型数组，且长度要足够大。如果源串大于目标串，与目标串相邻的后方内存数据将被破坏，这是很危险的。

### strcmp函数

（1）函数原型： int strcmp(const char*  string1,const char* string2);

（2）函数功能： 比较两个参数指向的字符串的大小，返回一个整数。

 若string1>string2，返回值为1.

 若string1=string2，返回值为0.

 若string1<string2，返回值为-1.

下列表中将举一些例子：

| string1  | string2  | 比较结果             | 函数返回值 |
|----------|----------|------------------|-------|
| "ABC123" | "ABC123" | string1等于string2 | 0     |
| "ABC123" | "ABC456" | string1小于string2 | <0    |
| "ABC"    | "ABC123" | string1小于string2 | <0    |
| "ABC123" | "ABC"    | string2大于string2 | >0    |

（3）注意事项：两个字符串比较时，是从头到尾依次比较对应位置字符的ASCII码值的大小，结果一旦确定就停止。两个串只有长度相同且每个位置的字符也相同才是相等关系。

例题2：从键盘上输入5个国家的名字，使用冒泡法按降序排列后输出：

```c
#include<stdio.h>
#include<string.h>
int main()
{
	char strName[5][20];
	char temp[20];
	int i;
	int j;
	int k;
	for(i=0;i<5;i++)
	{
		printf("输入一个国家的名字：");
		gets(strName[i]);
	}//这个循环是把5个国家的名字输出 
	k=1;
	for(i=0;i<4&&k;i++)
	{
		for(k=0,j=4;j>i;j--)
		{
			if(strcmp(strName[j],strName[j-1])>0)
			{
				strcpy(temp,strName[j]);
				strcpy(strName[j],strName[j-1]);
				strcpy(strName[j-1],temp);
				k++;
			}
		}
	}//基本的冒泡排序 
	for(i=0;i<5;i++)
	{
		puts(strName[i]);
	}//把冒泡排好的国家全部输出 
	return 0;
 } 
```

```c
// 控制台输出
请输入一个国家的姓名：china
请输入一个国家的姓名：japan
请输入一个国家的姓名：russia
请输入一个国家的姓名：austrilia
请输入一个国家的姓名：france
russia
japan
france
china
austrilia
```

### strcat函数

（1）函数原型： char* strcat(char* string1,char* string2);

（2）函数功能 ： 把string2连接到string1的后面生成一个新串

```c
#include<stdio.h>
#include<string.h>
int main()
{
	char s1[20]="123";
	char s2[ ]="C language";
	char* p="World";
	printf("%s\n",strcat(s1,"Hello"));
	printf("%s\n",strcat(s1,p));
	printf("%s\n",strcat(s1,s2+2));
	return 0;
 } 
```

```c
//输出
123Hello
123HelloWorld
123HelloWorldlanguage
```

（3）注意事项：第一个参数string1一定是字符型数组，且长度要足够大。

strcpy和strcat的区别是strcpy是，strcpy将源串复制到目标串，而strcat是将string2拼接到string1中。

至此，第七章完结

------