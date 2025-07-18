在学习前几章的知识时候，听说过函数这个名字吧。

函数是一个笼统的叫法，你可以把任何一个进行某种计算或者操作的代码块都叫做函数（至少我这么做的）

就像前几章所学的：printf，scanf 等，那我们可能会好奇，函数是怎样编写和定义的。

其实我们所接触到的第一个关键函数就是 main 函数，并且 main 函数中已经给出了函数的编写格式

让我们进入代码

```c
#include<stdio.h>

int main(){

}
// 上面一个main函数，他与我们一开始学的有所不同，不同点在于少了些代码，让我们补全
```

```c
#include<stdio.h>

int main(void){

return 0;
}
// 这段代码与上面一段main函数相比，在()中多了一个void（空类型），在末尾有一句 return 0;
// 把return翻译成中文就是返回，所以末尾语句通俗易懂就是返回0
```

看到了上述两个代码，可能你还有点懵，但是第二块代码就是函数的标准写法

```c
返回类型 函数名称 (传入类型 传入名称){

return 返回值(可以为表达式);
}
```

这就是函数标准的定义方式

```c
#include<stdio.h>

int main(void){

return 0;
}
// 所以我们再来看一下main函数
// 就可以理解为什么格式是这样的，而第一个代码块暨缺少内容的main函数也是正确的，因为void的类型在传入参数的时候可以不添加
// 而return的返回值是根据你的返回类型来看的，int型可以不加添加return，这样就是自动返回0
```

让我们来定义一个函数

```c
#include<stdio.h>

int addition(int a,int b){
	int sum = a + b;
	return sum;
    // 或者直接返回 a+b
    // retrun a + b;
}

int main(){
    int a,b;
    scanf("%d%d",&a,&b);
    int c;
    c = addition(a,b);
    printf("%d",c);
}

// 我们首先定义了一个名字叫addition的函数，而addition函数的作用相信大家也能看出来，就是接收传入的两个int型变量，相加并返回相加后的值
// 而之后我们就可以使用这个自己定义的函数，进行操作（注意传入参数和返回值的类型以便于正确使用）
```

趁热打铁，我们在定义一个

```c
#include<stdio.h>

int main(){
    int a,b;
    scanf("%d%d",&a,&b);
    int c;
    c = addition(a,b);
    printf("%d",c);
}

int subtraction(int a,int b){
	int nosum = a - b;
	return sum;
}

// 这个函数呢，是减法，我就不多说了哈，但是，但是，但是
// 这个样子在程序中会报错，这是为什么
// 明明跟上个代码块的定义差不多，只不过是换个名字符号，还有定义位置，为什么会报错。
// 是因为C语言是一个顺序执行结构，三大结构：顺序结构，分支结构，循环结构
// 所以上面的执行顺序就是先进入了main函数，遇到了subtraction函数的使用，但是程序从上到使用函数的时候，并没有见到subtraction的定义
// 于是就报错了
```

所以要使上块代码正确运行就需要把定义提前，可是有的人就喜欢在main函数下方定义，那有没有这种下方定义方式

有的，我们只需要在前面告诉程序，我这有一个函数叫xxx就行了

```c
#include<stdio.h>

int subtraction(int a,int b); // 在使用之前告诉程序之后有程序要运行这个函数，

int main(){
    int a,b;
    scanf("%d%d",&a,&b);
    int c;
    c = addition(a,b);
    printf("%d",c);
}

int subtraction(int a,int b){
	int nosum = a - b;
	return sum;
}
```

这样这个函数就能正常的被调用

这就是基础函数的一些注意要点和知识，本文并不讲解**指针型函数和函数指针**
请自行搜索学习，在计算机这条路上最重要的就是自学能力还有自我查询资料的能力，所以这也是一种考验。ps：如果搜索后实在看不懂，可以去求助学长。

至此，第八章函数结束。虽说函数，但是写的都是基础函数知识，难一点的也没有写上去，就等你们补全吧hahaha。

------