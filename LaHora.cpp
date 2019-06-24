#include <stdlib.h>
#include <iostream>
using namespace std;
int main(void)
{
   int hora;
   cout << "\nIntroduzca una hora (entre 0 y 24): ";
   cin >> hora;
   if ((hora >= 0) and (hora < 12))
        cout << "\n---- Buenos dias ----\n";
   else if ((hora >= 12) and (hora < 18))
             cout << "\n---- Buenas tardes ----\n";
        else if ((hora >= 18) and (hora < 24))
                  cout << "\n---- Buenas noches ----\n";
             else if((hora >=25))
                  cout << "\n-- LEE LAS INSTRUCCIONES --\n";
   system("pause");
}
