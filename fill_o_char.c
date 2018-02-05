#include <stdio.h>
#include <windows.h>

void printO();
void printOAt(int x, int y);
void gotoxy(int x, int y);

int width = 80;
int height = 25;
int w, h;
int currentPos = 0;

int main()
{
    int temp = width;
    width = height;
    height = temp;

    for (h = 0; h < height; h++)
    {
        for (w = 0; w < width; w++)
        {
            // printOAt(currentPos, h); //ver1
            // printOAt(width - currentPos - 1, height - h - 1); //ver2
            printOAt(h,width - currentPos -1); //ver3
            // printOAt(height - h - 1,currentPos);
            if (h % 2 == 0)
                currentPos++;
            else
                currentPos--;

            Sleep(2);
        }

        if (h % 2 == 0)
            currentPos -= 1;
        else
            currentPos += 1;
    }

    return 0;
}

void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

void printO()
{
    printf("O");
}

void printOAt(int x, int y)
{
    gotoxy(x, y);
    printO();
}