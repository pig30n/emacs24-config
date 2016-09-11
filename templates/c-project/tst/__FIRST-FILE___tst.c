/**
 *
 * @file tst/__FIRST-FILE___tst.c
 * @modified 2016-09-11 16:39:34 (CEST)
 * @author __USER-NAME__
 * @brief  *** Description ***
 *
 */

#include "../src/__FIRST-FILE__.h"
#include <glib-2.0/glib.h>

int main(int argc, char *argv[])
{
     g_test_init(&argc, &argv, NULL);
     /*
       void g_test_add_func (const char *testpath, GTestFunc test_func);
       void g_test_add_data_func (const char *testpath, gconstpointer test_data, GTestDataFunc test_func);
     */
     return g_test_run();
}
