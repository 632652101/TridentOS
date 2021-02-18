#define  COL8_000000  0
#define  COL8_FF0000  1
#define  COL8_00FF00  2
#define  COL8_FFFF00  3
#define  COL8_0000FF  4
#define  COL8_FF00FF  5
#define  COL8_00FFFF  6
#define  COL8_FFFFFF  7
#define  COL8_C6C6C6  8
#define  COL8_840000  9
#define  COL8_008400  10
#define  COL8_848400  11
#define  COL8_000084  12
#define  COL8_840084  13
#define  COL8_008484  14
#define  COL8_848484  15

#define  PORT_KEYDAT  0x0060
#define  PIC_OCW2     0x20
#define  PIC1_OCW2    0xA0
#include "mem_util.h"
#include "win_sheet.h"
#include "timer.h"
#include "global_define.h"
#include "multi_task.h"
//change here
void load_ldt(short s);

void cmd_dir();
void asm_end_app(int*);
void kill_process();
void cons_putstr(char *s);
struct MEMMAN* memman = (struct MEMMAN*)0x100000;
void asm_cons_putchar();


char get_font_data(int c, int offset);
void io_hlt(void);
void io_cli(void);
void io_sti(void);
int  io_load_eflags(void);
void io_store_eflags(int eflags);
void init_palette(void);
void set_palette(int start, int end, unsigned char *rgb);
void boxfill8(unsigned char *vram,int xsize,  unsigned char c, int x, int y,
int x0, int y0);

int get_leds();
void start_app(int eip, int cs, int esp, int ds, int *esp0);


void close_constask(struct TASK *task);
void close_console(struct TASK *task);
void cmd_exit(struct TASK *cons_task);

void cons_putchar(char chr, char move);

static char keytable[0x54] = {
		0,   0,   '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '-', '^', 0,   0,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '@', '[', 0,   0,   'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', ':', 0,   0,   ']', 'Z', 'X', 'C', 'V',
		'B', 'N', 'M', ',', '.', '/', 0,   '*', 0,   ' ', 0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   '7', '8', '9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.'
	};


static char keytable1[0x90] = {
		0,   0,   '!', '@', '#', '$', '%','^', '&', '*', '(', ')', '-', '=', '~', 0,   0,
		'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '`', '{', 0,   0,   'A', 'S',
		'D', 'F', 'G', 'H', 'J', 'K', 'L', '+', '*', 0,   0,   '}', 'Z', 'X', 'C', 'V',
		'B', 'N', 'M', '<', '>', '?', 0,   '*', 0,   ' ', 0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   '7', '8', '9', '-', '4', '5', '6', '+', '1',
		'2', '3', '0', '.', 0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
		0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
		0,   0,   0,   '_', 0,   0,   0,   0,   0,   0,   0,   0,   0,   '|', 0,   0
	};

/*标志, 1: shift键被按下; 0: shift键未被按下*/
int  key_shift = 0;
/*标志, 1: capslock键开启; 0: capslock键关闭*/
int  caps_lock = 0;

/**
 * BOOTINFO存储系统信息: 
 * vagRam:显存地址
 * screenX, screenY: 背景宽高
 */
struct  BOOTINFO {
    char* vgaRam;
    short screenX, screenY;
};
static struct BOOTINFO bootInfo;

/**
 * 初始化系统信息
 */
void initBootInfo(struct BOOTINFO *pBootInfo);

/**
 * 系统字体数组
 */
extern char systemFont[16];

/**
 * 像缓冲区中写入一个字的像素数据
 */
void showFont8(char *vram, int xsize, int x, int y, char c, char* font);

/**
 * 在sht上显示字符串
 */
void showString(struct SHTCTL *shtctl, struct SHEET *sht, int x, int y, char color, unsigned char *s );

/**
 * 没有用到
 */
void putblock(char* vram, int vxsize, int pxsize,int pysize, int px0, int py0, char* buf, int bxsize);

/**
 * 初始化鼠标像素数组, 不可见颜色向数组中放入bc
 */
void init_mouse_cursor(char* mouse, char bc);

/**
 * key 中断处理函数
 */
void intHandlerFromC(char* esp);

/**
 * 没有用到
 */
static char keyval[5] = {'0', 'X', 0, 0, 0};

/**
 * 键盘消息队列
 */
static struct FIFO8 keyinfo;
/**
 * 鼠标消息队列
 */
static struct  FIFO8 mouseinfo;

/**
 * 键盘消息队列内部接受数组
 */
static char keybuf[32];
/**
 * 鼠标消息队列内部接受数组
 */
static char mousebuf[128];

/**
 * 鼠标消息数据结构
 */
struct MOUSE_DEC {
    unsigned char buf[3], phase;
    int x, y, btn;
};

static struct MOUSE_DEC mdec;

/**
 * 时钟消息队列
 */
static struct FIFO8 timerinfo;
static char timerbuf[8];

char   charToHexVal(char c);
char*  charToHexStr(unsigned char c);
char*  intToHexStr(unsigned int d);


/**
 * 初始化键盘硬件
 */
void  init_keyboard(void);

/**
 * 初始化鼠标硬件
 */
void  enable_mouse(struct MOUSE_DEC *mdec);

/**
 * 显示鼠标图像并处理有关鼠标按键消息
 */
void  show_mouse_info(struct SHTCTL *shtctl, struct SHEET* sht_back, struct SHEET *sht_mouse);

/**
 * 解码鼠标消息队列信息
 */
int   mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat);

/**
 * 可用内存信息数据结构
 */
struct AddrRangeDesc {
    unsigned int baseAddrLow;
    unsigned int baseAddrHigh;
    unsigned int lengthLow;
    unsigned int lengthHigh;
    unsigned int type;
};

/**
 * 获取可用内存信息的个数
 */
int   get_memory_block_count(void);

/**
 * 获取可用内存信息地址
 */
char* get_adr_buffer(void);

/**
 * 获取可用内存信息
 */
void  showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht,struct AddrRangeDesc* desc, char* vram, int page, int xsize,int color);

/**
 * 像素壁纸写入像素数组vram中
 */
void init_screen8(char *vram, int x, int y);

/**
 * 创建一个message_box
 */
struct SHEET* message_box(struct SHTCTL *shtctl,  char* title);


/**
 * 创建一个window, act = 0, 该窗口未被激活, act = 1 该窗口被激活
 */
void make_window8(struct SHTCTL *shtctl, struct SHEET *sht,  char *title, char act);

/**
 * mx, my 鼠标位置,  mmx = -1, mmy = -1, 按下时鼠标的位置;
 */
static int mx = 0, my = 0, mmx = -1, mmy = -1;

/**
 * xsize, ysize 窗口长宽
 */
static int xsize = 0, ysize = 0;
/**
 * buf_back: 窗口像素数组
 * buf_mouse:鼠标队列数据
 */
static  unsigned char *buf_back, buf_mouse[256];


#define COLOR_INVISIBLE  99
#define KEY_RETURN  0x1C

/**
 * 向sht中绘制一块文本框
 * x0, y0 
 * c color 颜色
 */
void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c);

/**
 * shtMsgBox: message box
 */
static struct SHEET* shtMsgBox;

/**
 * 图层管理器
 */
static struct SHTCTL *shtctl;

/**
 * sht_back: back 图层
 * sht_mouse: mouse 图层
 */
static struct SHEET *sht_back, *sht_mouse;

/**
 * 鼠标点击的图层
 */
static struct SHEET *mouse_clicked_sht;

/**
 * 绘制光标   cursor_c 光标颜色
 */ 
void  set_cursor(struct SHTCTL *shtctl, struct SHEET *sheet, int cur_x, int cur_y, int cursor_c);

/**
 * 开启一个控制台
 */
struct SHEET *launch_console(int i);

/**
 * 控制台代码
 */
void console_task(struct SHEET *sheet, int memtotal); 

/**
 * 给窗口写入标题 act = 0, 该窗口没有被激活
 */
void make_wtitle8(struct SHTCTL *shtctl, struct SHEET *sht,char *title, char act);

/**
 * 第一个控制台进程编号
 */
int first_task_cons_selector = 0;

/**
 * task_main 内核进程, current_console_task console进程
 */
static struct TASK *task_main = 0, *current_console_task = 0;

/**
 * 根据键盘消息更改 key_shift caps_lock标志
 */
char transferScanCode(int data);

/**
 * 根据键盘消息是否是特殊按键 capsLock shift ctrl 等按键
 */
int  isSpecialKey(int data);

/**
 * 创建一个新行, 修改cursor
 */
int cons_newline(int cursor_y, struct SHEET *sheet);

/**
 * 创建一个新行, 修改cursor
 */
void file_loadfile(char *fileName, struct Buffer *pBuffer);

int KEY_CONTROL = 0x1D;

/**
 * 当前运行的console指针
 */
int current_console = 0;

/**
 * 当前运行的console个数
 */
int console_count = 0;

void CMain(void) {
	/*标明显存地址, 高度, 宽度*/
    initBootInfo(&bootInfo);
	
	/*vram : 显存地址*/
    char*vram = bootInfo.vgaRam;

	/*xsize, ysize: 整个背景的长宽*/
    xsize = bootInfo.screenX, ysize = bootInfo.screenY;
	
    init_pit();									/*初始化时钟中断硬件*/


    fifo8_init(&timerinfo, 8, timerbuf, 0);		/*初始化时钟消息队列*/
    fifo8_init(&keyinfo, 32, keybuf, 0);		/*初始化键盘消息队列*/
    fifo8_init(&mouseinfo, 128, mousebuf, 0);   /*初始化鼠标消息队列*/

    init_palette();								/*初始化调色板相关硬件*/	
    init_keyboard();							/*初始化键盘相关硬件*/
       
	/*可用内存描述结构*/
    struct AddrRangeDesc* memDesc = (struct AddrRangeDesc*)get_adr_buffer();
    
	memman_init(memman);						/*初始化内存管理器*/
    memman_free(memman, 0x001008000, 0x3FEE8000);

	/*初始化图层管理器*/
    shtctl = shtctl_init(memman, vram, xsize, ysize);

    sht_back = sheet_alloc(shtctl);
    sht_mouse = sheet_alloc(shtctl);
    buf_back = (unsigned char*)memman_alloc_4k(memman, xsize*ysize);
    
    sheet_setbuf(sht_back, buf_back, xsize, ysize, COLOR_INVISIBLE);
    sheet_setbuf(sht_mouse, buf_mouse, 16, 16, COLOR_INVISIBLE);

	/*写入back图层数据*/
    init_screen8(buf_back, xsize, ysize);
	/*写入mouse图层数据*/
    init_mouse_cursor(buf_mouse, COLOR_INVISIBLE);

	/*显示背景图层*/
    sheet_slide(shtctl, sht_back, 0, 0);
    
	/*设置鼠标位置*/
    mx = (xsize - 16) / 2;
    my = (ysize - 28 - 16) / 2;

	/*显示鼠标图层*/
    sheet_slide(shtctl, sht_mouse, mx, my);
    
    int cursor_x = 8, cursor_c=COL8_FFFFFF;

    shtMsgBox = message_box(shtctl, "counter");

    sheet_updown(shtctl, sht_back, 0);
  
    sheet_updown(shtctl, sht_mouse, 4);


    io_sti();

	/*初始化鼠标中断硬件*/
    enable_mouse(&mdec);


    static struct TASK *task_a;
	
	/*初始化任务管理器*/
    task_a = task_init(memman);
    keyinfo.task = task_a;
    task_main = task_a;
    task_run(task_a, 0, 0);
    
	/*开启一个控制台*/
    struct SHEET* sht_cons;
    sht_cons = launch_console(0);
    console_count++;
    sheet_slide(shtctl, sht_cons, 8, 2);
    sheet_updown(shtctl, sht_cons, 2);

 
    int data = 0;					/*接受key数据队列data*/
    int i = 0;						/*接受time数据队列data*/
    int key_to = 0;					/*进程焦点, 0: 主进程, 1: console进程*/
    int couser_c = COL8_000000;		/*couser 颜色, COL8_000000 黑*/
    
    for(;;) {
		if (fifo8_status(&keyinfo) + fifo8_status(&mouseinfo) +
			fifo8_status(&timerinfo) == 0) {
			/*没有数据输入*/
			io_sti();
		}else if(fifo8_status(&keyinfo) != 0){
			/*处理键盘数据*/
			io_sti();
			data = fifo8_get(&keyinfo);

			/*shfit + w create a new console window*/
			if (key_shift != 0 && data == 0x11) {
				sht_cons = launch_console(console_count);
				sheet_slide(shtctl, sht_cons, 156, 176);
				sheet_updown(shtctl, sht_cons, 1);
				console_count++;
			}

			/*console closing message*/
			if (data == 255 && current_console_task != 0) {
				close_console(current_console_task);
				continue;
			} 

			/*处理键盘数据, 更改shift caps 等标志位*/
			transferScanCode(data);
			
			/*按q进行图层切换*/
			if (data == 0x10) {
				sheet_updown(shtctl, shtctl->sheets[1], shtctl->top - 1);
			}
			
			/*当前按键数据是tab*/
			if (data == 0x0f) {
				/*如果当前进程是主进程*/
				if (key_to == 0) {
					key_to = 1;
					/*将msgbox涂灰*/
					make_wtitle8(shtctl, shtMsgBox,"task_a", 0);
					
					if (current_console_task != 0) {、
						/*将当前console涂篮*/
						make_wtitle8(shtctl, current_console_task->sht, "console", 1);
					}
					/*将光标涂白*/
					set_cursor(shtctl, shtMsgBox, cursor_x, 28 ,COL8_FFFFFF);
				} /*end of if (key_to == 0)*/ 
				else {
					/*如果当前进程是console进程*/
					key_to = 0;
					/*将主进程窗口涂篮*/
					make_wtitle8(shtctl, shtMsgBox,  "task_a",1);
					if (current_console_task != 0) {
						/*将当前console涂灰*/
						make_wtitle8(shtctl, current_console_task->sht, "console", 0);
					}
				} 
				
				/*刷新显存*/
				sheet_refresh(shtctl, shtMsgBox, 0, 0, shtMsgBox->bxsize, 21);
				if (current_console_task != 0) {
					sheet_refresh(shtctl, current_console_task->sht, 0,
						0, current_console_task->sht->bxsize, 21);
				}
			}/*end of if (data == 0x0f)*/
 
          if (key_to == 0) {
			  /*当前进程是主进程*/
               if (transferScanCode(data) != 0 && cursor_x < 144) {
					/*如果该字符是有效字符, 并且空格没有填满*/
					/*填写该字符*/
                   set_cursor(shtctl, shtMsgBox, cursor_x,28 ,COL8_FFFFFF);
                   char c = transferScanCode(data);
                   char buf[2] = {c, 0};
                   showString(shtctl,  shtMsgBox, cursor_x, 28, COL8_000000, buf);
                   cursor_x += 8;
                
                   set_cursor(shtctl, shtMsgBox, cursor_x, 28, cursor_c);
              }
           }/*end of if (key_to == 0)*/ 
		   else if (isSpecialKey(data) == 0 && current_console_task != 0)  {
				/*该字符是有效字符, 将该字符送入对应的消息队列中*/
				fifo8_put(&(current_console_task->fifo), data);
				/*防止console进程接受数据缓慢导致问题, 采用先缓冲再一次性处理的方式*/
				if (fifo8_status(&keyinfo) == 0) {             
				 task_sleep(task_a);
				}
           }
       }/*end of if(fifo8_status(&keyinfo) != 0)*/
	   else if (fifo8_status(&mouseinfo) != 0) {
			/*处理鼠标数据*/
           show_mouse_info(shtctl, sht_back, sht_mouse);
       }  
      
       if (fifo8_status(&timerinfo) != 0) {
			/*主进程的时钟数据*/
			io_sti();
			int i = fifo8_get(&timerinfo);

			if (i != 0) {
				timer_init(timer3, &timerinfo, 0);
				cursor_c = COL8_000000;
			} else {
				timer_init(timer3, &timerinfo, 1);
				cursor_c = COL8_FFFFFF;
			}

			timer_settime(timer3, 50);
			if (key_to == 0) {
				set_cursor(shtctl, shtMsgBox, cursor_x, 28, cursor_c);
			} else {
				set_cursor(shtctl, shtMsgBox, cursor_x, 28, COL8_FFFFFF);
			}
      }/*end of if (fifo8_status(&timerinfo) != 0)*/
       
    }/*end of for(;;) */
}/*end of Cmain */

/*绘制光标*/
void  set_cursor(struct SHTCTL *shtctl, struct SHEET *sheet, int cursor_x, int cursor_y,int cursor_c) {
    if (sheet == 0) {
        return;
    }
    boxfill8(sheet->buf, sheet->bxsize, cursor_c, cursor_x,
               cursor_y, cursor_x + 7, cursor_y + 15);
    sheet_refresh(shtctl, sheet, cursor_x, cursor_y, cursor_x+8, cursor_y + 16);

}

/*判定是否是一个特殊按键, 同时修正shift caps全局标志符*/
int isSpecialKey(int data) {
    transferScanCode(data);

    if (data == 0x3a || data == 0x1d || data == 0xba || data == 0x2a || data == 0x36
       || data == 0xaa || data == 0xb6) {
        return 1;
    }

    return 0;
}

/*修正shift caps全局标志符*/
char  transferScanCode(int data) {
    if (data == 0x2a)  {//left shift key down
        key_shift |= 1;
    }

    if (data == 0x36) {
        //right shift key down 
        key_shift |= 2; 
    }

    if (data == 0xaa) {
        //left shift key up
        key_shift &= ~1;
    }
    
    if (data == 0xb6) {
       //right shift key up
        key_shift &= ~2;
    }

    //caps lock
    if (data == 0x3a) {
        if (caps_lock == 0) {
            caps_lock = 1;
        } else {
            caps_lock = 0;
        }
    }

    if (data == 0x2a || data == 0x36 || data == 0xaa || data == 0xb6 || 
        data >= 0x54 || data == 0x3a ) {
        return 0;
    }

    char c = 0;
    
    if (key_shift == 0 && data<0x54 && keytable[data] != 0) {
        c = keytable[data];
        if ('A' <= c && c <= 'Z' && caps_lock == 0) {
            c += 0x20;
        }
        
    } 
    else if (key_shift != 0 && data < 0x80 && keytable1[data] != 0){
        c = keytable1[data];
    }
    else  {
        c = 0;
    }
    
    return c;
}

/*启动一个控制台*/
struct SHEET*  launch_console(int i) {
	/* 0, 这个控制台本身是一个task需要初始化如下内容:
	 * 1, fifo buf
	 * 2, tss32
	 * 3, console->sht & sht buf
	 * 4, console->timer
	 * 5, console->cmdline
	 * 6, file handle
	 * *7, Buffer(在该控制台上运行应用程序需要的, 用的时候再新建也可以)
	 */

    /*初始化console->sht & sht buf*/
    struct SHEET *sht_cons = 0;
    sht_cons = sheet_alloc(shtctl);
    unsigned char *buf_cons = (unsigned char *)memman_alloc_4k(memman, 256*165);
    sheet_setbuf(sht_cons, buf_cons, 256, 165, COLOR_INVISIBLE);
   
    if (i > 0) {
        make_window8(shtctl, sht_cons, "console", 1);
    } else {
        make_window8(shtctl, sht_cons, "console", 0);
    }
    sheet_refresh(shtctl, sht_cons, 0, 0, sht_cons->bxsize, sht_cons->bysize);
	make_textbox8(sht_cons, 8, 28, 240, 128, COL8_000000);

    struct TASK *task_console = task_alloc();

    task_console->sht = sht_cons;
    sht_cons->task = task_console;
    
	//inactive last console window
    if (current_console_task != 0) {
        make_wtitle8(shtctl, current_console_task->sht, "console", 0);
        sheet_refresh(shtctl, current_console_task->sht, 0, 0, current_console_task->sht->bxsize, current_console_task->sht->bysize);
    }

    current_console_task = task_console;

	/*初始化tss32*/
    int addr_code32 = get_code32_addr();
    task_console->tss.eip =  (int)(console_task - addr_code32);

    task_console->tss.es = 0;
    task_console->tss.cs = 1*8;//6 * 8;
    task_console->tss.ss = 4*8;
    task_console->tss.ds = 3*8;   
    *((int*)(task_console->tss.esp + 4)) = (int)sht_cons;
    *((int*)(task_console->tss.esp + 8)) = memman_total(memman);
	
	/*初始化fifobuf*/
    char *fifobuf = (char *)memman_alloc(memman, 128);
    fifo8_init(&task_console->fifo, 128, fifobuf, task_console);

	/*初始化fhandle*/
	// FILEHANDLE fhandle = memman_alloc(mem, 128);
    struct FILEHANDLE fhandle[8];
    for (i = 0; i < 8; i++) {
        fhandle[i].buf = 0;
    }

    task_console->fhandle = fhandle;
	/*
	    mov     eax, dword [ebp-14H]                    
        lea     edx, [ebp-7CH]         7c = 124                 
        mov     dword [eax+0CCH], edx    
	*/
    
    task_run(task_console,1, 5);
    
    if (i == 0) {
        first_task_cons_selector = task_console->sel;
    }

    return sht_cons;
}

/*杀死一个任务*/
void kill_process() {
    struct TASK *task = task_now();
    cons_newline(task->console.cur_y, task->console.sht);
    task->console.cur_y += 16;
    asm_end_app(&(task->tss.esp0));
	/*
	 asm_end_app:
		 mov eax, [esp + 4]
		 mov esp, [eax]
		 mov DWORD [eax+4], 0  ; task->tss.ss0 = 0;
		 popad
		 ret
	*/
}

/*cmd dir 命令显示所有文件信息*/
void cmd_dir() {
    struct TASK *task = task_now();
	/*文件header结构存储位置*/
    struct FILEINFO *finfo = (struct FILEINFO*)(ADR_DISKIMG);
    char *s = (char *)memman_alloc(memman, 13);
    s[12] = 0;
    while (finfo->name[0] != 0) {
        
        int k;
        for (k = 0; k < 8; k++) {
        if (finfo->name[k] != 0) {
              s[k] = finfo->name[k]; 
        }else {
           break;
           }
                   
        }
    
        int t = 0;
        s[k] = '.';
        k++;
        for (t = 0; t < 3; t++) {
            s[k] = finfo->ext[t];
            k++;
         }
    
                       
        showString(shtctl, task->console.sht, 16, task->console.cur_y, COL8_FFFFFF, s);
        int offset = 16 + 8*15;
        char* p = intToHexStr(finfo->size);
        showString(shtctl, task->console.sht, offset, task->console.cur_y, COL8_FFFFFF, p);
        task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);
        finfo++;
      } 
    memman_free(memman, (int)s, 13);
}


/*cmd dtype 显示文件内容*/
void cmd_type(char *cmdline) {
    struct TASK* task=task_now();
    if (task->console.sht == 0) {
        return;
    }
	
    char *name = (char *) memman_alloc(memman, 13);
    name[12] = 0;
    int p = 0;
    int x = 5;
    for (x = 5; x < 17; x++) {
        if (cmdline[x] != 0) {
              name[p] = cmdline[x];
              p++;
        } else {
              break;
          }
    }
    
    name[p] = 0;              
    struct FILEINFO *finfo = (struct FILEINFO*)(ADR_DISKIMG);
    while (finfo->name[0] != 0) {
         char s[13];
         s[12] = 0;
         int k;
         for (k = 0; k < 8; k++) {
             if (finfo->name[k] != 0) {
                 s[k] = finfo->name[k];
             }else {
                 break;
             }
         }

        int t = 0;
        s[k] = '.';
        k++;
       for (t = 0; t < 3; t++) {
          s[k] = finfo->ext[t];
          k++;
       }
       /*文件header指向的名字和命令行匹配*/                                      
       if (strcmp(name, s) == 1) {
		    /*获取该文件内容所在的地址*/
            char *p = (char *)  FILE_CONTENT_HEAD_ADDR;
            p += finfo->clustno * DISK_SECTOR_SIZE;
            int sz = finfo->size;	/*文件大小*/
            char c[2];				/*单个字符*/
            int t = 0;				/*cnt*/
            task->console.cur_x = 16;
            for (t = 0; t < sz; t++) {
                c[0] = p[t];
                c[1] = 0;
                if (c[0] == 0x09) {
                    //handle tab key
                   for(;;) {
                       showString(shtctl, task->console.sht, task->console.cur_x,
                             task->console.cur_y, COL8_FFFFFF, " ");
                       task->console.cur_x += 8;

                       if (task->console.cur_x == 8 + 240) {
                             task->console.cur_x = 8;
                             task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);
                       }
                                        
                       if ((task->console.cur_x - 8) & 0x1f == 0) {
                             break;
                       }
                   }
                } else if (c[0] == 0x0a) {
                     //handle return
                     task->console.cur_x = 8;
                     task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);
                 } else if (c[0] == 0x0d) {
                     //do nothing
                 } else {
                     showString(shtctl, task->console.sht, task->console.cur_x,task->console.cur_y, COL8_FFFFFF, c);
                     task->console.cur_x += 8;
                     if (task->console.cur_x == 8 + 240) {
                           task->console.cur_x = 16;
                           task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);
                     }
                 }
           }// end of for (t = 0; t < sz; t++) 
           break; // break of while (finfo->name[0] != 0)
     }// end of if (strcmp(name, s) == 1)
                          
       finfo++;
    } // end of while (finfo->name[0] != 0)

	/*另起一行*/
    task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);  
    memman_free(memman,(int) name, 13);
    task->console.cur_x = 16;
}

/*显示内存信息*/
void cmd_mem(int memtotal) {
    struct TASK* task=task_now();
    if (task->console.sht == 0) {
        return;
    }  
    char *s = intToHexStr(memtotal / (1024));
    showString(shtctl,task->console.sht,16,task->console.cur_y,COL8_FFFFFF, "free ");
    showString(shtctl,task->console.sht,52,task->console.cur_y, COL8_FFFFFF, s);
    showString(shtctl, task->console.sht, 126, task->console.cur_y, COL8_FFFFFF, " KB");
    task->console.cur_y = cons_newline(task->console.cur_y, task->console.sht);
}

/*清空命令行内容*/
void cmd_cls() {
    struct TASK* task = task_now();
    //change here
    if (task->console.sht == 0) {
        return;
    }

    int x = 8;
    int y = 28;
    for (y = 28; y < 28 + 128; y++)
        for (x = 8; x < 8 + 240; x++) {
             task->console.sht->buf[x + y * task->console.sht->bxsize] = COL8_000000;
        }

        sheet_refresh(shtctl, task->console.sht, 8, 28, 8+240, 28+128);
        task->console.cur_y = 28;
        showString(shtctl, task->console.sht, 8, 28, COL8_FFFFFF, ">");
}

/*执行应用程序*/
void cmd_execute_program(char* file) {
	/*关中断*/
    io_cli();
	
	/*初始化TASK中的次要应用程序内存描述结构*/
    struct Buffer *appBuffer = (struct Buffer*)memman_alloc(memman, 16);
    struct TASK *task = task_now();
    task->pTaskBuffer = appBuffer;
	
	/*加载应用程序数据到内存中,分配代码段内存空间,并对应修改Buffer的代码段地址和length内容*/
    file_loadfile(file, appBuffer);

	/*设置代码段LDT内容0x409a + 0x60 可执行 + 特权级别3*/
    set_segmdesc(task->ldt + 0, 0xfffff, (int) appBuffer->pBuffer, 0x409a + 0x60);

    /*分配数据段内存空间*/
    char *q = (char *) memman_alloc_4k(memman, 64*1024);
	/*设置Buffer的数据段地址*/
    appBuffer->pDataSeg = (unsigned char*)q;

	/*设置数据段LDT内容0x4092 + 0x60 数据 + 特权级别3*/
    set_segmdesc(task->ldt + 1, 0xfffff, (int) q, 0x4092 + 0x60);

    task->tss.esp0 = 0;

    io_sti();
    start_app(0, 0*8+4,64*1024, 1*8+4, &(task->tss.esp0));
    io_cli();
    //change here
    /*
    close any file handles
    */
    int i = 0;
    for (i = 0; i < 8; i++) {
        if (task->fhandle[i].buf != 0) {
            memman_free_4k(memman, (unsigned int)task->fhandle[i].buf, task->fhandle[i].size);
            task->fhandle[i].buf = 0;
        }
    }
    memman_free_4k(memman,(unsigned int) appBuffer->pBuffer, appBuffer->length);
    memman_free_4k(memman, (unsigned int) q, 64 * 1024);
    memman_free(memman,(unsigned int)appBuffer, 16);
    task->pTaskBuffer = 0;
    io_sti();
}


void cmd_start(char *scanCodeBuf) {
    struct SHEET *sht_cons = launch_console(console_count);

    sheet_slide(shtctl, sht_cons, 156, 176);
    sheet_updown(shtctl, sht_cons, 1);
    console_count++;
    struct TASK *task = sht_cons->task;
    task->fifo.task = 0;
    int i = 6;
    while (scanCodeBuf[i] != 0) {
        fifo8_put(&task->fifo, scanCodeBuf[i]);
        i++;
    }
    task->fifo.task = task;
    fifo8_put(&task->fifo, KEY_RETURN);
}


void cmd_ncst(char *scanCodeBuf) {
    launch_console(console_count);
  
    console_count++;
    struct TASK *task = current_console_task;
  
    task->fifo.task = 0;
    int i = 5;
    int pos = 0;
    while (scanCodeBuf[i] != 0) {
        fifo8_put(&task->fifo, scanCodeBuf[i]);
        i++;
    }
    task->fifo.task = task;
    fifo8_put(&task->fifo, KEY_RETURN);
}


void console_task(struct SHEET *sheet, int memtotal) {
    struct TIMER *timer;
    struct TASK *task = task_now();
    int i, cursor_c = COL8_000000;

    int x = 0, y = 0;
    char *cmdline = (char *)memman_alloc(memman, 30);
    char scanCodeBuf[32];
    int pos = 96;
    int pos1 = 176;

    task->console.sht = sheet;
    task->console.cur_x = 16;
    task->console.cur_y = 28;
    task->console.cur_c = -1;

	/*初始化timer*/
    timer = timer_alloc();
    timer_init(timer, &task->fifo, 1);
    timer_settime(timer, 50);
    task->console.timer = timer;
    task->console.cmdline = cmdline;

    showString(shtctl, sheet, 8, 28, COL8_FFFFFF, ">");

    struct FILEINFO* finfo = (struct FILEINFO*)(ADR_DISKIMG);
    int hlt = 0;

    for(;;) { 
        io_cli();

        task = task_now();

        if (fifo8_status(&task->fifo) == 0) {
            io_sti();
        } else {
			/*消息队列中存在信息*/
            i = fifo8_get(&task->fifo);
			
			/*每隔一段时间更改光标*/
            if (i <= 1 && cursor_c >= 0) {
                if (i != 0) {
                    timer_init(timer, &task->fifo, 0);
                    cursor_c = COL8_FFFFFF;
                } else {
                    timer_init(timer, &task->fifo, 1);
                    cursor_c = COL8_000000;
                }

                timer_settime(timer, 50);
            }  
            /*恢复进程*/
            else if (i == PROC_RESUME) {
                cursor_c = COL8_FFFFFF;
                timer_init(timer, &task->fifo, 0);
                timer_settime(timer, 50);
            }
			/*暂停这个进程*/
            else if (i == PROC_PAUSE) {
                set_cursor(shtctl, sheet, task->console.cur_x, task->console.cur_y,COL8_000000);
                cursor_c = -1;
                task_run(task_main, -1, 0);
                task_sleep(task);
            }
            
            else if (i == KEY_RETURN) {
                set_cursor(shtctl, sheet, task->console.cur_x, task->console.cur_y, COL8_000000);
                cmdline[task->console.cur_x / 8 - 2] = 0; 
                scanCodeBuf[task->console.cur_x / 8 - 2] = 0;
                task->console.cur_y = cons_newline(task->console.cur_y, sheet); 

                if (strcmp(cmdline, "mem") == 1) {
                   cmd_mem(memtotal);
                } else if (strcmp(cmdline, "cls") == 1) {
                   cmd_cls();
                } else if (strcmp(cmdline, "hlt") == 1) {
                   cmd_execute_program("abc.exe");
                } else if (strcmp(cmdline, "dir") == 1) {
                   cmd_dir();
                }
                else if (strcmp(cmdline, "exit") == 1) {
                   cmd_exit(task);
                }
                else if (cmdline[0] == 't' && cmdline[1] == 'y' &&
                             cmdline[2] == 'p' && cmdline[3] == 'e') {
                    cmd_type(cmdline);
                }
                else if (strcmp(cmdline, "start") == 1) {
                   cmd_start(scanCodeBuf);   
                }
                else if (strcmp(cmdline, "ncst") == 1) {
                   cmd_ncst(scanCodeBuf);
                }//change here
                else if (strcmp(cmdline, "crack") == 1) {
                   cmd_execute_program("crack.exe");
                }

                task->console.cur_x = 16;
            } /*end of if (i == KEY_RETURN)*/
            else if (i == 0x0e && task->console.cur_x > 8) {
					/*回退键*/
                    set_cursor(shtctl, sheet, task->console.cur_x, task->console.cur_y, COL8_000000);
                    task->console.cur_x -= 8;
                    set_cursor(shtctl, sheet, task->console.cur_x, task->console.cur_y, COL8_000000); 
                 }
			else {
				 char c = transferScanCode(i);
				 if (task->console.cur_x < 240 && c!=0 ) {
				   cmdline[task->console.cur_x / 8 - 2] = c;
				   cmdline[task->console.cur_x / 8 - 1] = 0;
				   
				   scanCodeBuf[task->console.cur_x / 8 - 2] = i;
				   scanCodeBuf[task->console.cur_x / 8 - 1] = 0;
				   cons_putchar(c, 1);
				 }
               } 
            
            
            if (cursor_c >= 0 && task->console.sht != 0) {
                 set_cursor(shtctl, task->console.sht, task->console.cur_x, task->console.cur_y, cursor_c);
            } 
     }	// end of else { /*消息队列中存在信息*/
    io_sti();
  } /* end of for(;;) */
}

void cons_putstr(char *s) {
    for (; *s != 0; s++) {
        cons_putchar(*s, 1);
    }
    return;
}

/*绘制API在sht上绘制一个线条*/
int api_linewin(struct SHEET *sht, int x0, int y0, int x1, int y1, int col) {
    int i, x, y, len, dx, dy;
    dx = x1 - x0;
    dy = y1 - y0;
    x = x0 << 10;
    y = y0 << 10;
    
    if (dx < 0) {
        dx = -dx;
    }
    if (dy < 0) {
        dy = -dy;
    }

    if (dx >= dy) {
        len = dx + 1;
        if (x0 > x1) {
            dx = -1024;
        } else {
            dx = 1024;
        }

        if (y0 <= y1) {
            dy = ((y1 - y0 + 1) << 10) / len;
        } else {
            dy = ((y1 - y0 - 1) << 10) / len;
        }
    } else {
        len = dy + 1;
        if (y0 > y1) {
            dy = -1024;
        } else {
            dy = 1024;
        }

        if (x0 <= x1) {
           dx = ((x1 - x0 + 1) << 10) / len;
        } else {
           dx = ((x1 - x0 - 1) << 10) / len;
        }
    }

    for (i = 0; i < len; i++) {
        sht->buf[(y >> 10) * sht->bxsize + (x>>10)] = col;
        x += dx;
        y += dy;
    }
}

int handle_keyboard(struct TASK *task, int eax, int* reg) {
    for (; ;) {
        io_cli();
        
        if (fifo8_status(&task->fifo) == 0) {
            io_sti();
            if (eax != 0) {
               continue;
            } else {
                io_sti();
				/*reg[7] = popad 出来的eax*/
                reg[7] = -1;
                return 0;
            }
       } /*end of if (fifo8_status(&task->fifo) == 0)*/
		
       /*task 消息队列中传来的消息*/
       int i;
       i = fifo8_get(&task->fifo);
       io_sti();

       if (i >= 256) {
          showString(shtctl, sht_back, 0, 176, COL8_FFFFFF, "keyboard");
       } 
       if (i <= 1) {
           timer_init(task->console.timer, &task->fifo, 1);
           timer_settime(task->console.timer, 50);
       }else if (i == 2) {
           task->console.cur_c = COL8_FFFFFF;
       } else {
            reg[7] = i;
            return 0;
       }
       
    } /*end of for (; ;)*/ 
    
    
    return 0;
}


/*关闭一个task*/
void close_constask(struct TASK *task) {
    task_sleep(task);	/*休眠该task*/
    memman_free(memman, (int)task->fifo.buf, 128);
    memman_free(memman, (int)task->console.cmdline, 30);
    task->flags = 0;	/*该task未被分配*/
    current_console_task = 0;
}

/*关闭一个task*/
void close_console(struct TASK *task) {
	/* 关闭一个task要做的事情
	 * 1, 修正flages状态
	 * 2, 释放 console->sht
	 * 3, 释放 console->timer
	 * 4, 释放 console->cmdline
	 * 5, 释放 FIFO
	 */
   // struct TASK *task = sht->task;
    timer_free(task->console.timer);

    if (task->sht != 0) {
        struct SHEET *sht = task->sht;
        memman_free_4k(memman, (int)sht->buf, 256 * 165);
        sheet_free(shtctl, sht);
    }
    close_constask(task);
}

void cmd_exit(struct TASK *cons_task) {
    io_cli();
    /*由主进程关闭一个task*/
    fifo8_put(&keyinfo, 255);
    io_sti();
}


int* kernel_api(int edi, int esi, int ebp, int esp,
                int ebx, int edx, int ecx, int eax) {
    struct TASK *task = task_now();
    struct SHEET *sht = 0;
    int  *reg = &eax + 1;
    int i = 0;
    struct FILEHANDLE  *fh = 0; 

    if (edx == 1) {
        cons_putchar(eax & 0xff, 1);
    }else if (edx == 2) {
        cons_putstr((char*)(task->pTaskBuffer->pBuffer + ebx)); 
    }else if (edx == 4) {
        task->tss.ss0 = 0;

       // return &(task->tss.esp0);
        return &task->tss.esp0;
    }else if (edx == 5) {      
        sht = sheet_alloc(shtctl);
        sht->task = task;
        sht->flags |= 0x10;
    
        char* buf = memman_alloc(memman, esi * edi);
		/*task->pTaskBuffer->pDataSeg+ebx 数据段中的数据*/
        sheet_setbuf(sht, task->pTaskBuffer->pDataSeg+ebx, esi, edi, eax);

		/*task->pTaskBuffer->pBuffer 代码段中存的数据(字符串)*/
        make_window8(shtctl, sht , (char*)(ecx+task->pTaskBuffer->pBuffer), 0);
        sheet_slide(shtctl,sht, (shtctl->xsize - esi)/2, (shtctl->ysize - edi)/2);
        sheet_updown(shtctl, sht, shtctl->top);

		/*return eax = reg[7]*/
        reg[7] = (int)sht;
    
    }else if (edx == 6) {
        sht = (struct SHEET*)ebx;
        //showString(shtctl, sht, esi, edi, eax, (char*)(ebp+buffer.pBuffer));
        showString(shtctl, sht, esi, edi, eax, (char*)(ebp+task->pTaskBuffer->pDataSeg));
        sheet_refresh(shtctl, sht, esi, edi, esi + ecx*8, edi+16);
    }else if (edx == 7) {
        sht = (struct SHEET*)ebx;
        boxfill8(sht->buf, sht->bxsize, ebp, eax, ecx, esi, edi);
        sheet_refresh(shtctl, sht, eax, ecx, esi+1, edi+1); 
    }else if (edx == 11){
        sht = (struct SHEET*)ebx;
        sht->buf[sht->bxsize * edi + esi] = eax;
       // sheet_refresh(shtctl, sht, esi, edi, esi + 1, edi + 1);
    }else if (edx == 12) {
        sht = (struct SHEET*)ebx;
        sheet_refresh(shtctl, sht, eax, ecx, esi, edi);
    } else if (edx == 13) {
        sht = (struct SHEET*)ebx;
        api_linewin(sht, eax, ecx, esi, edi, ebp);
    } else if (edx == 14) {
        sheet_free(shtctl, (struct SHEET*)ebx);
        cons_putstr((char*)(task->pTaskBuffer->pDataSeg + 0x123));
    } else if (edx == 15) {
        handle_keyboard(task, eax, reg);
    } else if (edx == 16) {
        reg[7] = (int)timer_alloc();
    } else if (edx == 17) {
        timer_init((struct TIMER*)ebx, &task->fifo, eax+256);
    }  else if (edx == 18) {
        timer_settime((struct TIMER*)ebx, eax);
    } else if (edx == 19) {
        timer_free((struct TIMER*)ebx);
    }
    //change here
    /*
    add file handling api
    */
    else if (edx == 21) {
        for (i = 0; i < 8; i++) {
            if (task->fhandle[i].buf == 0) {
                break;
            }
        }
        fh = &task->fhandle[i];
        reg[7] = 0;
        if ( i < 8) {
			 /*这里的buffer是一个中间变量, 实际分配到的地方还是在fh 中*/
             struct Buffer buffer;
             buffer.pBuffer = 0;
             char *file_name = (char*)(task->pTaskBuffer->pBuffer + ebx);
             file_loadfile(file_name, &buffer);
             if (buffer.pBuffer != 0) {
                 reg[7] = (int)fh;
                 fh->buf = buffer.pBuffer;
                 fh->size = buffer.length;
                 fh->pos = 0;
             }
        }
    }
    else if (edx == 22) {
        fh = (struct FILEHANDLE *)eax;
        memman_free_4k(memman, (unsigned int)fh->buf, fh->size);
        fh->buf = 0;
    }
    else if (edx == 23) {
        fh = (struct FILEHANDLE *)eax;
        if (ecx == 0) {
            fh->pos = ebx;
        } else if (ecx == 1) {
            fh->pos += ebx;
        } else if (ecx == 2) {
            fh->pos = fh->size + ebx;
        }
        if (fh->pos < 0) {
            fh->pos = 0;
        }
        if (fh->pos > fh->size) {
            fh->pos = fh->size;
        }
    }
	/*获取文件大小*/
    else if (edx == 24) {
        fh = (struct FILEHANDLE*)eax;
        if (ecx == 0) {
            reg[7] = fh->size;
        } else if (ecx == 1) {
            reg[7] = fh->pos;
        } else if (ecx == 2) {
            reg[7] = fh->pos - fh->size;
        }
    }
	/*读取文件到buffer中*/
    else if (edx == 25) {
       fh = (struct FILEHANDLE*)eax;
       for (i = 0; i < ecx; i++) {
           if (fh->pos == fh->size) {
               break;
           }
           *((char*)(task->pTaskBuffer->pDataSeg + ebx + i)) = fh->buf[fh->pos];
           fh->pos++;
       }
       reg[7] = i;
    }
    return 0;
}

void cons_putchar(char c, char move) {
   struct TASK *task = task_now();
   set_cursor(shtctl, task->console.sht, task->console.cur_x, task->console.cur_y, COL8_000000);
   task->console.s[0] = c;
   task->console.s[1] = 0;    
   showString(shtctl, task->console.sht, task->console.cur_x, task->console.cur_y, COL8_FFFFFF, task->console.s);
   task->console.cur_x += 8;
   
}


int cons_newline(int cursor_y, struct SHEET *sheet) {
    //change here
    if (sheet == 0) {
        return;
    }

    int x, y;
    

    if (cursor_y < 28 + 112) {
         cursor_y += 16;
    } else {
         for (y = 28; y < 28 + 112; y++) {
             for (x = 8; x < 8 + 240; x++) {
                 sheet->buf[x + y * sheet->bxsize] =
                 sheet->buf[x + (y + 16) * sheet->bxsize];
             }
         }

         for (y = 28 + 112; y < 28 + 128; y++) {
             for (x = 8; x < 8 + 240; x++) {
                 sheet->buf[x + y * sheet->bxsize] = COL8_000000;
             }
         }

         sheet_refresh(shtctl, sheet, 8, 28, 8+240, 28+128);
   }

    showString(shtctl, sheet, 8, cursor_y, COL8_FFFFFF, ">"); 
    return cursor_y;
}

void init_screen8(char* vram, int xsize, int ysize) {
    boxfill8(vram, xsize, COL8_008484, 0, 0, xsize-1, ysize-29);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize-28, xsize-1, ysize-28);
    boxfill8(vram, xsize, COL8_FFFFFF, 0, ysize-27, xsize-1, ysize-27);
    boxfill8(vram, xsize, COL8_C6C6C6, 0, ysize-26, xsize-1, ysize-1);

    boxfill8(vram, xsize, COL8_FFFFFF, 3, ysize-24, 59, ysize-24);
    boxfill8(vram, xsize, COL8_FFFFFF, 2, ysize-24, 2, ysize-4);
    boxfill8(vram, xsize, COL8_848484, 3, ysize-4,  59, ysize-4);
    boxfill8(vram, xsize, COL8_848484, 59, ysize-23, 59, ysize-5);
    boxfill8(vram, xsize, COL8_000000, 2, ysize-3, 59, ysize-3);
    boxfill8(vram, xsize, COL8_000000, 60, ysize-24, 60, ysize-3);

    boxfill8(vram, xsize, COL8_848484, xsize-47, ysize-24, xsize-4, ysize-24);
    boxfill8(vram, xsize, COL8_848484, xsize-47, ysize-23, xsize-47, ysize-4);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize-47, ysize-3, xsize-4, ysize-3);
    boxfill8(vram, xsize, COL8_FFFFFF, xsize-3,  ysize-24, xsize-3, ysize-3);

}

void computeMousePosition(struct SHTCTL *shtctl, struct SHEET *sht,struct MOUSE_DEC* mdec) {
    mx += mdec->x;
    my += mdec->y;
    if (mx < 0) {
       mx = 0;
    }

    if (my < 0) {
       my = 0;
    }

    if (mx > xsize - 1) {
       mx = xsize - 1;
    }
    if (my > ysize - 1) {
       my = ysize - 1;
    }

}

void showString(struct SHTCTL *shtctl ,struct SHEET *sht, int x, int y, char color, unsigned char *s ) {
    //change here 
    if (shtctl == 0 || sht == 0) {
        return;
    }

    int begin = x;
    int i = 0;
    for (; *s != 0x00; s++) {
       showFont8(sht->buf, sht->bxsize, x, y,color, systemFont+ *s * 16);
       x += 8;
    }

    sheet_refresh(shtctl, sht, begin, y, x , y + 16);
}


void  show_mouse_info(struct SHTCTL *shtctl, struct SHEET *sht_back,struct SHEET *sht_mouse) {
    char*vram = buf_back;
    unsigned char data = 0;
    int j; 
    struct SHEET *sht = 0;
    int x, y;
    io_sti();
    data = fifo8_get(&mouseinfo);
    if (mouse_decode(&mdec, data) != 0) {
		 /*当前解码的是一个完整的数据*/
         computeMousePosition(shtctl, sht_back, &mdec);
        
         sheet_slide(shtctl, sht_mouse, mx, my);
         if ((mdec.btn & 0x01) != 0) { 
            if (mmx < 0) {
				/*按键之前就被按下过*/
                for (j = shtctl->top - 1; j > 0; j--) {
                    sht = shtctl->sheets[j];
                    x = mx - sht->vx0;
                    y = my - sht->vy0;
                    if (0 <= x && x < sht->bxsize && 0 <= y && y < sht->bysize) {
                        if (sht->buf[y * sht->bxsize + x] != sht->col_inv) {
                            //change here
                            if (current_console_task->sht != 0) {
                                make_wtitle8(shtctl, current_console_task->sht, "console", 0);
                                sheet_refresh(shtctl,current_console_task->sht, 0, 0, sht->bxsize, sht->bysize);
                            }
                            current_console_task = sht->task;
                            if (current_console_task->sht == 0) {
                                 showString(shtctl, sht_back, 0, 96, COL8_FFFFFF, "user proc");
                            }
                            if (current_console_task->sht != 0) {
                                make_wtitle8(shtctl, current_console_task->sht, "console", 1);
                                sheet_refresh(shtctl, sht, 0, 0, sht->bxsize, sht->bysize);
                            }
                            sheet_updown(shtctl ,sht, shtctl->top - 1);
                            if (3 <= x && x <sht->bxsize - 3 && 3 <= y && y < 21) {
                                mmx = mx;
                                mmy = my;
                                mouse_clicked_sht = sht;
                            }

                            if (sht->bxsize - 21 <= x && x < sht->bxsize - 5 && 5 <= y && y < 19 && sht->task != 0) {
                                   
                                   io_cli();
                                   sheet_free(shtctl, sht);
                                   int addr_code32 = get_code32_addr();
								   // 没有任何意义啊, 你的ss都没有换回来更不用说整个CPU的访问权限的状态了, 这里这样写是有严重错误的, 会导致系统重启
                                   sht->task->tss.eip = (int)kill_process - addr_code32;
                                   io_sti();
                                  
                                  //change here
                                  //cmd_exit(sht->task);
                            }
                            break;
                        }
                    }   
                } /*end of for (j = shtctl->top - 1; j > 0; j--) */
            } /*end of if (mmx < 0) */ 
			else {
                x = mx - mmx;
                y = my - mmy;
                sheet_slide(shtctl, mouse_clicked_sht, mouse_clicked_sht->vx0 + x, mouse_clicked_sht->vy0 + y);
                mmx = mx;
                mmy = my;
            }  
         } /*end of if ((mdec.btn & 0x01) != 0)*/ 
		 else {
			/*鼠标左键没有被按下*/
            mmx = -1;
         }
    } /*end of if (mouse_decode(&mdec, data) != 0)*/
}

void initBootInfo(struct BOOTINFO *pBootInfo) {
    pBootInfo->vgaRam = (char*)0xe0000000;
    pBootInfo->screenX = 640;
    pBootInfo->screenY = 480;
}


void init_palette(void) {
    static  unsigned char table_rgb[16 *3] = {
        0x00,  0x00,  0x00,
        0xff,  0x00,  0x00,
        0x00,  0xff,  0x00,
        0xff,  0xff,  0x00,
        0x00,  0x00,  0xff,
        0xff,  0x00,  0xff,
        0x00,  0xff,  0xff,
        0xff,  0xff,  0xff,
        0xc6,  0xc6,  0xc6,
        0x84,  0x00,  0x00,
        0x00,  0x84,  0x00,
        0x84,  0x84,  0x00,
        0x00,  0x00,  0x84,
        0x84,  0x00,  0x84,
        0x00,  0x84,  0x84,
        0x84,  0x84,  0x84,
    };
 
    set_palette(0, 15, table_rgb);
    unsigned char table2[216 * 3];
    int r, g, b;
    for (b = 0; b < 6; b++) {
       for (g = 0; g < 6; g++) {
           for (r = 0; r < 6; r++) {
               table2[(r + g*6 + b *36)*3 + 0] = r * 51;
               table2[(r + g*6 + b *36)*3 + 1] = g * 51;
               table2[(r + g*6 + b *36)*3 + 2] = b * 51;
           }
       }
    }

    set_palette(16, 231, table2);
    return;
}

void set_palette(int start,  int end,  unsigned char* rgb) {
    int i, eflags;
    eflags = io_load_eflags();
    io_cli();
    io_out8(0x03c8,  start);  //set  palette number
    for (i = start; i <=end; i++ ) {
        io_out8(0x03c9,  rgb[0] / 4);
        io_out8(0x03c9,  rgb[1] / 4);
        io_out8(0x03c9,  rgb[2] / 4);
 
        rgb += 3;
    }

    io_store_eflags(eflags);
    return;
}

void boxfill8(unsigned char* vram, int xsize, unsigned char c, 
int x0, int y0, int x1, int y1) {
    int  x, y;
    for (y = y0; y <= y1; y++)
     for (x = x0; x <= x1; x++) {
         vram[y * xsize + x] = c;
     }

}

void showFont8(char *vram, int xsize, int x, int y, char c, char* font) {
    int i;
    char d;

    for (i = 0; i < 16; i++) {
        d = font[i]; 
        if ((d & 0x80) != 0) {vram[(y+i)*xsize + x + 0] = c;}
        if ((d & 0x40) != 0) {vram[(y+i)*xsize + x + 1] = c;}
        if ((d & 0x20) != 0) {vram[(y+i)*xsize + x + 2] = c;} 
        if ((d & 0x10) != 0) {vram[(y+i)*xsize + x + 3] = c;}
        if ((d & 0x08) != 0) {vram[(y+i)*xsize + x + 4] = c;}
        if ((d & 0x04) != 0) {vram[(y+i)*xsize + x + 5] = c;}
        if ((d & 0x02) != 0) {vram[(y+i)*xsize + x + 6] = c;}
        if ((d & 0x01) != 0) {vram[(y+i)*xsize + x + 7] = c;}
    }

}

void init_mouse_cursor(char* mouse, char bc) {
    static char cursor[16][16] = {
		"**************..",
		"*OOOOOOOOOOO*...",
		"*OOOOOOOOOO*....",
		"*OOOOOOOOO*.....",
		"*OOOOOOOO*......",
		"*OOOOOOO*.......",
		"*OOOOOOO*.......",
		"*OOOOOOOO*......",
		"*OOOO**OOO*.....",
		"*OOO*..*OOO*....",
		"*OO*....*OOO*...",
		"*O*......*OOO*..",
		"**........*OOO*.",
		"*..........*OOO*",
		"............*OO*",
		".............***"
	};

      int x, y;
      for (y = 0; y < 16; y++) {
          for (x = 0; x < 16; x++) {
             if (cursor[y][x] == '*') {
                 mouse[y*16 + x] = COL8_000000;
             }
             if (cursor[y][x] == 'O') {
                mouse[y*16 + x] = COL8_FFFFFF;
             }
             if (cursor[y][x] == '.') {
                 mouse[y*16 + x] = bc;
             }
          }
      }
}

void putblock(char* vram, int vxsize, int pxsize,
int pysize, int px0, int py0, char* buf, int bxsize) {
    int x, y;
    for (y = 0; y < pysize; y++)
      for (x = 0; x < pxsize; x++) {
          vram[(py0+y) * vxsize + (px0+x)] = buf[y * bxsize + x];
      }
}


void intHandlerFromC(char* esp) {
    io_out8(PIC_OCW2, 0x20);		/*开启芯片中断*/
    unsigned char data = 0;
    data = io_in8(PORT_KEYDAT);		/*从键盘端口中读取数据*/
    fifo8_put(&keyinfo, data);		/*将该数据放入键盘消息队列中*/
    return;
}

char   charToHexVal(char c) {
    if (c >= 10) {
        return 'A' + c - 10;
    } 

    return '0' + c;
}

char*  charToHexStr(unsigned char c) {
    int i = 0;
    char mod = c % 16;
    keyval[3] = charToHexVal(mod);
    c = c / 16;
    keyval[2] = charToHexVal(c);
  
    return keyval;
}

char*  intToHexStr(unsigned int d) {
    static char str[11];
    str[0] = '0';
    str[1] = 'X';
    str[10] = 0;

    int i = 2;
    for(; i < 10; i++) {
        str[i] = '0';
    }

    int p = 9;
    while (p > 1 && d > 0) {
        int e = d % 16;
        d /= 16;
        if (e >= 10) {
           str[p] = 'A' + e - 10;
        } else {
            str[p] = '0' + e;
        }         
        p--;
    } 

    return str;
}

#define  PORT_KEYDAT  0x0060
#define  PORT_KEYSTA  0x0064
#define  PORT_KEYCMD  0x0064
#define  KEYSTA_SEND_NOTREADY  0x02
#define  KEYCMD_WRITE_MODE  0x60
#define  KBC_MODE     0x47

void  wait_KBC_sendready() {
    for(;;) {
        if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0) {
            break;
        }
    }
}

void init_keyboard(void) {
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, KBC_MODE);
    return;
}

#define KEYCMD_SENDTO_MOUSE 0xd4
#define MOUSECMD_ENABLE 0xf4

void enable_mouse(struct MOUSE_DEC* mdec) {
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);

    mdec->phase = 0;
    return;
}

void intHandlerForMouse(char* esp) {
    unsigned char data;
    io_out8(PIC1_OCW2, 0x20);
    io_out8(PIC_OCW2, 0x20);
    
    data = io_in8(PORT_KEYDAT);
    fifo8_put(&mouseinfo, data);
}


int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat) {
    if (mdec->phase == 0) {
        if (dat == 0xfa) {
           mdec->phase = 1;
        }

       return 0;
    }

    if (mdec->phase == 1) {
        if ((dat & 0xc8) == 0x08) {
            mdec->buf[0] = dat;
            mdec->phase = 2;
        }

        return 0;
    }

    if (mdec->phase == 2) {
        mdec->buf[1] = dat;
        mdec->phase = 3;
        return 0;
    }

    if (mdec->phase == 3) {
        mdec->buf[2] = dat;
        mdec->phase = 1;
        mdec->btn = mdec->buf[0] & 0x07;
        mdec->x = mdec->buf[1];
        mdec->y = mdec->buf[2];
        if ((mdec->buf[0] & 0x10) != 0) {
           mdec->x |= 0xffffff00;
        }

        if ((mdec->buf[0] & 0x20) != 0) {
           mdec->y |= 0xffffff00;
        }

        mdec->y = -mdec->y;
        return 1;
    }

    return -1;
}

void  showMemoryInfo(struct SHTCTL *shtctl, struct SHEET *sht,struct AddrRangeDesc* desc, char* vram, int page,int xsize, int color) {
    int x = 0, y = 0, gap = 13*8,  strLen = 10* 8;

    init_screen8(sht->buf, xsize, ysize);

    showString(shtctl, sht, x, y, color, "page is: ");
    char* pPageCnt = intToHexStr(page);
    showString(shtctl, sht, gap, y, color, pPageCnt);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrL: ");
    char* pBaseAddrL = intToHexStr(desc->baseAddrLow);
    showString(shtctl, sht, gap, y, color, pBaseAddrL);
    y += 16;

    showString(shtctl, sht, x, y, color, "BaseAddrH: ");
    char* pBaseAddrH = intToHexStr(desc->baseAddrHigh);
    showString(shtctl, sht, gap, y, color, pBaseAddrH);
 
    y += 16;
    showString(shtctl, sht, x, y, color, "lengthLow: ");
    char* pLengthLow = intToHexStr(desc->lengthLow);
    showString(shtctl, sht, gap, y, color, pLengthLow);
/*
    y+= 16;
    showString(shtctl, sht, x, y, color, "lengthHigh: ");
    char* pLengthHigh = intToHexStr(desc->lengthHigh);
    showString(shtctl, sht, gap, y, color, pLengthHigh);

    y+= 16;
    showString(shtctl, sht, x, y, color, "type: ");
    char* pType = intToHexStr(desc->type);
    showString(shtctl, sht, gap, y, color, pType);
*/
}

struct SHEET*  message_box(struct SHTCTL *shtctl,  char *title) {
    struct SHEET *sht_win;
    unsigned char *buf_win;
    
    sht_win = sheet_alloc(shtctl);
    buf_win = (unsigned char *)memman_alloc_4k(memman, 160 * 68);
    sheet_setbuf(sht_win, buf_win, 160, 68, -1);

    make_window8(shtctl, sht_win, title, 1);
    make_textbox8(sht_win, 8, 28, 144, 16, COL8_FFFFFF);    
    
    sheet_slide(shtctl, sht_win, 260, 172);
    sheet_updown(shtctl, sht_win, 2);

    return sht_win;
}

void make_window8(struct SHTCTL *shtctl, struct SHEET *sht,  char *title, char act) {
    int bxsize = sht->bxsize;
    int bysize = sht->bysize;
                
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, bxsize - 1, 0);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, bxsize - 2, 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 0, 0, 0,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_FFFFFF, 1, 1, 1,         bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_848484, bxsize - 2, 1, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, bxsize - 1, 0, bxsize - 1, bysize - 1);
    boxfill8(sht->buf, bxsize, COL8_C6C6C6, 2, 2, bxsize - 3, bysize - 3);
    boxfill8(sht->buf, bxsize, COL8_000084, 3, 3, bxsize - 4, 20);
    boxfill8(sht->buf, bxsize, COL8_848484, 1, bysize - 2, bxsize - 2, bysize - 2);
    boxfill8(sht->buf, bxsize, COL8_000000, 0, bysize - 1, bxsize - 1, bysize - 1);

    make_wtitle8(shtctl, sht, title, act);

    return;
}

void make_wtitle8(struct SHTCTL *shtctl, struct SHEET * sht,  char *title, char act) {
    static char closebtn[14][16] = {
                "OOOOOOOOOOOOOOO@",
                "OQQQQQQQQQQQQQ$@",
                "OQQQQQQQQQQQQQ$@",
                "OQQQ@@QQQQ@@QQ$@",
                "OQQQQ@@QQ@@QQQ$@",
                "OQQQQQ@@@@QQQQ$@",
                "OQQQQQQ@@QQQQQ$@",
                "OQQQQQ@@@@QQQQ$@",
                "OQQQQ@@QQ@@QQQ$@",
                "OQQQ@@QQQQ@@QQ$@",
                "OQQQQQQQQQQQQQ$@",
                "OQQQQQQQQQQQQQ$@",
                "O$$$$$$$$$$$$$$@",
                "@@@@@@@@@@@@@@@@"
        };

    int x, y;
    char c, tc, tbc;
    if (act != 0) {
        tc = COL8_FFFFFF;
        tbc = COL8_000084;
    } else {
        tc = COL8_C6C6C6;
        tbc = COL8_848484;
    }

    boxfill8(sht->buf, sht->bxsize, tbc, 3, 3, sht->bxsize - 4, 20);
    showString(shtctl, sht, 24, 4, tc, title);
 
     for (y = 0; y < 14; y++) {
         for (x = 0; x < 16; x++) {
             c = closebtn[y][x];
             if (c == '@') {
                 c = COL8_000000;
             } else if (c == '$') {
                 c = COL8_848484;
             } else if (c == 'Q') {
                 c = COL8_C6C6C6;
             }
             else {
                 c = COL8_FFFFFF;
             }
 
             sht->buf[(5+y) * sht->bxsize + (sht->bxsize - 21 + x)] = c;
         }
 
     }

}

void make_textbox8(struct SHEET *sht, int x0, int y0, int sx, int sy, int c) {
    int x1 = x0 + sx, y1 = y0 + sy;
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 2, y0 - 3, x1 + 1, y0 - 3);
    boxfill8(sht->buf, sht->bxsize, COL8_848484, x0 - 3, y0 - 3, x0 - 3, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x0 - 3, y1 + 2, x1 + 1, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_FFFFFF, x1 + 2, y0 - 3, x1 + 2, y1 + 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 1, y0 - 2, x1 + 0, y0 - 2);
    boxfill8(sht->buf, sht->bxsize, COL8_000000, x0 - 2, y0 - 2, x0 - 2, y1 + 0);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x0 - 2, y1 + 1, x1 + 0, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, COL8_C6C6C6, x1 + 1, y0 - 2, x1 + 1, y1 + 1);
    boxfill8(sht->buf, sht->bxsize, c, x0 - 1, y0 - 1, x1 + 0, y1 + 0); 
}


/*加载应用程序数据到内存中, 并对应修改内存描述结构的内容*/
void file_loadfile(char *name, struct Buffer *buffer) {
	/*获取文件头信息*/
     struct FILEINFO *finfo = (struct FILEINFO*)(ADR_DISKIMG);

	/*文件头所指示的文件名*/
     char *s = (char *) memman_alloc(memman, 13);

     while (finfo->name[0] != 0) {
         int k;
         for (k = 0; k < 12; k++) {
             s[k] = 0;
         }

         for (k = 0; k < 8; k++) {
             if (finfo->name[k] != 0) {
                 s[k] = finfo->name[k];
             }else {
                 break;
             }
         }

         int t = 0;
         s[k] = '.';
         k++;
         for (t = 0; t < 3; t++) {
             s[k] = finfo->ext[t];
             k++;
         }

         /*该文件头所指示的文件名和目标文件名匹配*/
         if (strcmp(name, s) == 1) {
			 /*分配一块代码段*/
             buffer->pBuffer =  (char*)memman_alloc_4k(memman, finfo->size);
             buffer->length = finfo->size;

             char *p =  (char*) FILE_CONTENT_HEAD_ADDR;
             p += finfo->clustno * DISK_SECTOR_SIZE;
             int sz = finfo->size;
             int t = 0;
             for (t = 0; t < sz; t++) {
                 buffer->pBuffer[t] = p[t];
             }
             break;             
         }/* end of if (strcmp(name, s) == 1)*/
         finfo++;
    }/*end of while (finfo->name[0] != 0)*/
    memman_free(memman,(unsigned int) s, 13);
}

int* intHandlerForStackOverFlow(int* esp) {
    struct TASK* task = task_now();
    task->console.cur_x = 8;
    cons_putstr("INT OC");
    task->console.cur_x = 8;
    task->console.cur_y += 16;
    cons_putstr("Stack Exception");
    task->console.cur_x = 8;
    task->console.cur_y += 16;
    char *p = intToHexStr(esp[11]);
    cons_putstr("EIP = ");
    cons_putstr(p);
    task->console.cur_x = 8;
    task->console.cur_y += 16;
    return &(task->tss.esp0);
}

int* intHandlerForException(int *esp) {
    struct TASK *task = task_now();

    task->console.cur_x = 8;
    cons_putstr("INT 0D ");
    task->console.cur_x = 8;
    task->console.cur_y += 16;
    cons_putstr("General Protected Exception");         
    task->console.cur_y += 16;
    task->console.cur_x = 8;
    
    return &(task->tss.esp0);
}

