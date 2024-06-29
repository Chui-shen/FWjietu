import ctypes
import ctypes.wintypes
import os
import pyhk
import sys
import time
import win32clipboard
import win32gui
import winreg
from io import BytesIO

from PIL import ImageGrab
from sheen import Str


def get_desktop():
    key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, r'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders')
    return winreg.QueryValueEx(key, "Desktop")[0]
    # 通过注册表获取桌面位置


def capture_fullscreen():
    pic = ImageGrab.grab()  # 获取截图
    a = get_desktop() + "\\" + "temp-%s.jpg" % (time.time())
    pic.save(a, "PNG")  # 保存至系统桌面
    yn = input("""Would you like to send it to mspaint. 
    if you're sure, please press 'y' and [Enter], if you're not, please press 'n' and [Enter]""").lower()
    if yn == "y":
        os.system("mspaint " + a)
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

    rect = RECT()  # 这是一个锁定窗口位置的对象，具体原理自己看百度。
    hwnd = win32gui.GetForegroundWindow()  # 获取窗口对象导入前面的对象中就可以锁定笛卡尔坐标
    ctypes.windll.user32.GetWindowRect(hwnd, ctypes.byref(rect))  # 获得 长方形 x,y 坐标
    rangle = (rect.left + 2, rect.top + 2, rect.right - 2, rect.bottom - 2)  # 规定范围
    pic = ImageGrab.grab(rangle)  # 获取范围
    a = getdesktop() + "\\" + "temp-%s.jpg" % (time.time())
    pic.save(a, "PNG")  # 保存至桌面
    yn = input("""Would you like to edit it in mspaint (also known as 画图)[y/n] """).lower()
    if yn == "y":
        os.system("mspaint " + a)
    elif yn == "n":
        return
    # elif yn[:3] == 'CLI-':
    #     os.system(yn[4:])
    # else:
    #     print("ERROR! NO SUCH THING!")


def paste_into_clipboard_full():
    pic = ImageGrab.grab()  # 同第13行
    image_byte = BytesIO()  # 创建BytesIO数据块
    pic.save(image_byte, format="PNG")  # 保存入数据块
    image_byte = image_byte.getvalue()[14:]  # 获得合法DIB截图数据
    win32clipboard.OpenClipboard()  # 打开剪贴板
    win32clipboard.EmptyClipboard()  # 清空剪贴板
    win32clipboard.SetClipboardData(win32clipboard.CF_DIB, image_byte)  # 设置剪贴板格式
    win32clipboard.CloseClipboard()  # 关闭剪贴版


def paste_into_clipboard_window():
    class RECT(ctypes.Structure):
        _fields_ = [('left', ctypes.c_long),
                    ('top', ctypes.c_long),
                    ('right', ctypes.c_long),
                    ('bottom', ctypes.c_long)]

        def __str__(self):
            return str((self.left, self.top, self.right, self.bottom))

    rect = RECT()
    hwnd = win32gui.GetForegroundWindow()
    ctypes.windll.user32.GetWindowRect(hwnd, ctypes.byref(rect))
    rangle = (rect.left + 2, rect.top + 2, rect.right - 2, rect.bottom - 2)
    pic = ImageGrab.grab(rangle)
    image_byte = BytesIO()
    pic.save(image_byte, format="PNG")
    image_byte = image_byte.getvalue()[14:]
    win32clipboard.OpenClipboard()
    win32clipboard.EmptyClipboard()
    win32clipboard.SetClipboardData(win32clipboard.CF_DIB, image_byte)
    win32clipboard.CloseClipboard()


# def shutdown():
# 	os.system("shutdown -s -t 0")


def main():
    print(Str.cyan.Twinkle("""Ctrl+F1 -> capture and save the fullscreen.
Ctrl+F2 -> capture the current window and save to Desktop.
Ctrl+F3 -> capture and copy the fullscreen.
Ctrl+F4 -> capture the image and paste into Clipboard with current window."""))
    print(Str.cyan.Twinkle("Press 'Q' -> escape the PROGRAM."))
    hot_handle = pyhk.pyhk()
    hot_handle.addHotkey(['Ctrl', 'F1'], capture_fullscreen)
    hot_handle.addHotkey(['Ctrl', 'F2'], capture_current_windows)
    hot_handle.addHotkey(['Ctrl', 'F3'], paste_into_clipboard_full)
    hot_handle.addHotkey(['Ctrl', 'F4'], paste_into_clipboard_window)
    hot_handle.addHotkey(["Q"], sys.exit)
    hot_handle.start()


if __name__ == "__main__":
    main()
