# 目标文件
Target = libsraop.so
# mk文件所在的路径
MK_PWD = ./
# 头文件所在的目录
Include += -I$(MK_PWD)include/ 
# 所有的cpp/c源文件
SourceFile = $(shell find $(MK_PWD) -name "*.c" )

LoadLibs +=  
# 依赖文件

ObjectFile = $(SourceFile:%.c=%.o)

# 开始编译
# 链接
$(Target): $(ObjectFile)
	@echo  "Begin lib linking.............."
    $(CC) $(CFLAGS) $(LDFLAGS) $(LoadLibs) -o $@ $^ -fPIC -shared
# 编译
$(ObjectFile): %.o : %.c
	@echo  "Begin bulid c.............."
    $(CC) $(CFLAGS) $(LDFLAGS) $(LoadLibs) -c $^ -o $@ -fPIC -shared
	
all: $(TARGET) install

# 伪目标
.PHONY: clean
clean:
	-rm -fr $(SourceFile) $(Target)
