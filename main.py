import os, sys, winreg, ctypes, win32gui, ctypes.wintypes, pyhk, win32clipboard, time

from PIL import ImageGrab
from sheen import Str
from io import BytesIO

def getDesktop():
    key = winreg.OpenKey(winreg.HKEY_CURRENT_USER,r'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders')
    return winreg.QueryValueEx(key, "Desktop")[0]
    # 通过注册表获取桌面位置

def capture_fullscreen():
    pic = ImageGrab.grab() # 获取截图
    a = getDesktop()+"\\"+"temp-%s.jpg" % (time.time())
    pic.save(a, "JPEG") # 保存至系统桌面
    yn = input("""Would you like to edit it in mspaint (also known as 画图). 
    	if you're sure, please press 'y' and [Enter], if you're not, please press 'n' and [Enter]
    	ps. If you're sure that you know how to OPEN your PAINT SOFTWARE by CLI, please press 'CLI-blabla' and [Enter]
    	""").lower()
    if yn == "y":
        os.system("mspaint "+a)
        return
    elif yn == "n":
        return
    elif yn[:3] == 'cli-':
        os.system(yn[4:])
        return
    else:
        print("ERROR!")
        return

def capture_current_windows():
    class RECT(ctypes.Structure):
        _fields_ = [('left', ctypes.c_long),
                ('top', ctypes.c_long),
                ('right', ctypes.c_long),
                ('bottom', ctypes.c_long)]
        def __str__(self):
            return str((self.left, self.top, self.right, self.bottom))
    rect = RECT() # 这是一个锁定窗口位置的对象，具体原理自己看百度。
    HWND = win32gui.GetForegroundWindow() # 获取窗口对象导入前面的对象中就可以锁定笛卡尔坐标
    ctypes.windll.user32.GetWindowRect(HWND,ctypes.byref(rect)) # 获得 长方形 x,y 坐标
    rangle = (rect.left+2,rect.top+2,rect.right-2,rect.bottom-2) # 规定范围
    pic = ImageGrab.grab(rangle) # 获取范围
    a = getDesktop()+"\\"+"temp-%s.jpg" % (time.time())
    pic.save(a, "JPEG") # 保存至桌面
    yn = input("""Would you like to edit it in mspaint (also known as 画图). 
    	if you're sure, please press 'y' and [Enter], if you're not, please press 'n' and [Enter]
    	ps. If you're sure that you know how to OPEN your PAINT SOFTWARE by CLI, please press 'CLI-blabla' and [Enter]
    	""").lower()
    if yn == "y":
        os.system("mspaint "+a)
    elif yn == "n":
        return
    elif yn[:3] == 'CLI-':
        os.system(yn[4:])
    else:
    	print("ERROR! NO SUCH THING!")
def paste_into_clipboard_full():
    pic = ImageGrab.grab() # 同第13行
    ImageByte = BytesIO() # 创建BytesIO数据块
    pic.save(ImageByte, format = "BMP") # 保存入数据块
    ImageByte = ImageByte.getvalue()[14:] # 获得合法DIB截图数据
    win32clipboard.OpenClipboard() # 打开剪贴板
    win32clipboard.EmptyClipboard() # 清空剪贴板
    win32clipboard.SetClipboardData(win32clipboard.CF_DIB, ImageByte) # 设置剪贴板格式
    win32clipboard.CloseClipboard() # 关闭剪贴版

def paste_into_clipboard_window():
    class RECT(ctypes.Structure):
        _fields_ = [('left', ctypes.c_long),
                ('top', ctypes.c_long),
                ('right', ctypes.c_long),
                ('bottom', ctypes.c_long)]
        def __str__(self):
            return str((self.left, self.top, self.right, self.bottom))
    rect = RECT()
    HWND = win32gui.GetForegroundWindow()
    ctypes.windll.user32.GetWindowRect(HWND,ctypes.byref(rect))
    rangle = (rect.left+2,rect.top+2,rect.right-2,rect.bottom-2)
    pic = ImageGrab.grab(rangle)
    ImageByte = BytesIO()
    pic.save(ImageByte, format = "BMP")
    ImageByte = ImageByte.getvalue()[14:]
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardData(win32clipboard.CF_DIB, ImageByte)
    win32clipboard.CloseClipboard()

def shutdown():
	os.system("shutdown -s -t 0")

def music():
	print("PEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")

def main():
    print(Str.cyan.Twinkle("""Please Use Ctrl+F1 to capture the fullscreen and save.
or use Ctrl+F2 to capture the current window and save to Desktop.
or use Ctrl+F3 to capture the image and paste into Clipboard with full screen.
or use Ctrl+F4 to capture the image and paste into Clipboard with current window."""))
    print(Str.cyan.Twinkle("Use the 'q' to escape the PROGRAM. Use Ctrl+Alt+Q to shutdown the fxxking computer."))
    hot_handle = pyhk.pyhk()
    hot_handle.addHotkey(['Ctrl', 'F1'], capture_fullscreen)
    hot_handle.addHotkey(['Ctrl', 'F2'], capture_current_windows)
    hot_handle.addHotkey(['Ctrl', 'F3'], paste_into_clipboard_full)
    hot_handle.addHotkey(['Ctrl', 'F4'], paste_into_clipboard_window)
    hot_handle.addHotkey(["Q"], sys.exit)
    hot_handle.addHotkey(["Ctrl","Alt","Q"], shutdown)
    hot_handle.addHotkey(["Ctrl","Alt","A"], music)
    hot_handle.start()
    
if __name__ == "__main__":
    main()
