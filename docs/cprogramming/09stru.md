## 类型定义

类型定义是使用typedef关键字将一种数据类型定义为一种新类型的过程。

注意以下两点：

1. 类型定义是为已有的类型定义了一个别名，习惯上用大写表示。如：
    ````c
    typedef int INT;
    typedef float REAL;
    ````
2. 程序中有了类型定义后，就可以使用新的类型名来定义变量。如：
    ````c
    typedef int INT;
    // 这两个语句都表示x,y均为整型变量。
    int x;
    INT y;
    ````

## 结构类型
### 结构的声明

在使用结构体之前，要使用语句的形式对结构的成员情况进行说明，称为结构的声明。结构声明形式如下：
````c
struct 结构名
{
    类型 结构成员名1;
    类型 结构成员名2;
    ...
    类型 结构成员名n;
};
````

其中struct为关键字。{ }中包括的是组成该结构的成员列表。举例：

````c
struct date
{
    int year;
    int month;
    int day;
};

int main() {
    ...
}
````
**注意**

1. 结构类型声明是一条语句，末尾必须以分号结束。
2. 结构名可以省略，此时定义的结构称为无名结构。如上面的结构也可以声明为：
    ````c
    struct
    {
        int year;
        int month;
        int day;
    };
    ````
3. struct与结构体一起，称作结构类型名。无名结构是没有结构类型名的。
4. 无论是有名结构还是无名结构，都可以在声明是，把它定义为另一种类型。

````c
typedef struct date // 这是有名结构
{
    int year;
    int month;
    int day;
}DATE; 

typedef struct  
{
    int year;
    int month;
    int day;
}DATE; // 这是无名结构
````
### 定义结构变量

#### 先声明类型后定义变量

若结构已经声明，并且结构名没有省略，则可以在需要时使用结构类型名来定义变量。例：
````c
struct date
{
    int year;
    int month;
    int day;
}; //声明了名字为date的结构

struct date myBirthday; //定义struct date 型的变量myBirthday
````
#### 声明结构的同时定义变量

可以在声明时同时定义变量。如：
````c
struct date
{
    int year;
    int month;
    int day;
}d1,d2,d3;

struct 
{
    int year;
    int month;
    int day;
}d1,d2,d3;
````
#### 使用typedef定义的类型名来定义变量

若使用了typedef为结构类型定义了新类型名，那么就可以使用这个新类型名定义结构变量。如：
````c
typedef struct date DATE;
DATE myBirthday;

// 伪代码
typedef struct 结构体
{
    ...
}类型名;
类型名	变量名列表;
````
#### 结构指针

定义结构指针的方法与定义标准类型指针的方法完全一样

```C
typedef struct
{
    int x;
    int y;
    float t;
    char u;
}SAMPLE;
SAMPLE sam1;
SAMPLE *ptr=&sam1;
```

定义结构指针的方法与定义标准类型指针的方法完全一样，只要把数据类型换为结构类型即可。若把一个结构变量的地址赋给一个结构指针，指针就指向了该变量。与对标准类型操作一样，只要对指针取间接运算 `*` 
就可以访问它所指向的变量，也就是 `*ptr`和`sam1`两者是等价的。

## 结构的处理

### 结构变量的初始化


对结构变量初始化的方法与对数组初始化的方法类似，格式是：`结构类型 变量名={值列表};`

```C
typedef struct
{
    int x;
    float t;
    char u;
}SAMPLE;

SAMPLE sam1={2,1.5,'A'};
SAMPLE sam2={1,5.5,'B'};
sam1=sam2;
```
把sam2中的值全部赋给sam1.

### 访问结构成员

#### 通过结构变量访问结构成员

格式： 结构变量名.成员名

##### 列题1：结构变量的定义、初始化和成员访问

```c
#include<stdio.h>
typedef struct
{
	int x;
	float y;
	char c;
}SAMPLE;

int main()
{
	SAMPLE sam={-1,1.5,'A'};
	printf("%d,%lf,%c\n",sam.x,sam.y,sam.c);
	sam.c='?';
	printf("%d,%lf,%c\n",sam.x,sam.y,sam.c);
	return 0;
}
```

```c
// 输出
-1,1.500000,A
-1,1.500000,?
```

#### 2.通过结构指针访问结构成员

格式： 结构变量名->成员名

##### 例题2：使用结构指针访问成员

```c
#include<stdio.h>
typedef struct
{
	int x;
	float y;
	char c;
}SAMPLE;

int main()
{
	SAMPLE sam={-1,1.5,'A'};
	SAMPLE *p=&sam;
	printf("%d,%lf,%c\n",(*p).x,(*p).y,(*p).c);//(*p)与sam是一样的 
	sam.c='?';
	printf("%d,%lf,%c\n",p->x,p->y,p->c);
	return 0;
}
```

```c
// 输出
-1,1.500000,A
-1,1.500000,?
```

## 复杂结构

### 嵌套结构

#### 声明嵌套结构

可以使用两种方法声明嵌套结构：分别声明和整体声明。在实际编程中建议大家使用分别声明的方法，因为这样的格式更容易读。

分别声明：
```c
typedef struct
{
    int month;
    int day;
    int year;
}DATE;

typedef struct
{
    int hour;
    int min;
    int sec;
}TIME;

typedef struct
{
    DATE date;
    TIME time;
}STAMP;

typedef struct
{
    STAMP startTime;
    STAMP endTime;
}JOB;
```

整体声明：
```c
typedef struct
{
    struct
    {
        int month;
        int day;
        int year;
    }date;
    struct
    {
        int hour;
        int min;
        int sec;
    }time;
}STAMP;

typedef struct
{
    STAMP startTime;
    STAMP endTime;
}JOB;
```

#### 嵌套结构成员初始化

在对嵌套结构进行初始化时，要把每一层上的数据值使用一对{ }括起来。如：

```c
{% raw %}
STAMP myStamp={{11,18,1968},{22,45,00}};
JOB myJob={{{01,01,2000},{00,00,00}},{{12,18,2007},{00,00,00}}};
{% endraw %}
```

#### 嵌套结构成员的访问

访问嵌套结构中的成员，必须从最外层开始由外向里包含每一层，直到包含了要访问的成员为止。格式是：

结构变量名.外层成员名. ... .内层成员名

若stamp、job分别是STMP、JOB类型的变量，则下列的访问格式都是正确的

```c
stamp.date;
stamp.date.month;
job.starttime.time.hour;
```
嵌套结构及成员访问:

```c
#include<stdio.h>
typedef struct
{
	int x;
	float y;
	char c;
}DATA;
typedef struct 
{
	DATA d1;
	DATA d2;
}NODE;

int main()
{
	NODE node={{1,2.5,'A'},{10,25.5,'B'}};
	NODE *p=&node;
	printf("%d,%lf,%c\n",(*p).d1.x,(*p).d1.y,(*p).d1.c);//(*p)与node是一样的 
	printf("%d,%lf,%c\n",node.d2.x,node.d2.y,node.d2.c);
	printf("%d,%lf,%c\n",p->d1.x,p->d1.y,p->d1.c);
	return 0;
}
```

```c
// 输出
1,2.500000,A
10,25.500000,B
1,2.500000,A
```

### 含数组的结构

输入和输出学生信息:

```c
#include<stdio.h>
typedef struct
{
	char name[20];
	char sex;
	int midterm[3];
	int final;
}STUDENT;

int main()
{
	STUDENT stu;
	int i;
	printf("输入姓名：");
	gets(stu.name);
	printf("输入性别：");
	scanf("%c",&stu.sex);
	for(i=0;i<3;i++)
	{
		printf("输入midterm[%d]：",i);
		scanf("%d",&stu.midterm[i]);	
	} 
	printf("输入final：");
	scanf("%d",&stu.final);
	printf("%s , %c ,",stu.name,stu.sex);
	for(i=0;i<3;i++)
	{
		printf("%d,",stu.midterm[i]);
	 } 
	 printf("%d\n",stu.final);
	return 0;
}
```

```c
//控制台输出
输入姓名：limeida
输入性别：M
输入midterm[0]: 87
输入midterm[0]: 76 
输入midterm[0]: 65
输入final： 96
limeida , M ,87,76,65,96

```

至此，第九章完结

------
