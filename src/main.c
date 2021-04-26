#include <gtk/gtk.h>
#include "systray.h"

int main(int argc, char **argv)
{
    gtk_init(&argc, &argv);

    GtkWidget *win = gtk_window_new(GTK_WINDOW_TOPLEVEL);

    gtk_window_resize(win, 100, 20);

    // I dont know why, but doesnt work withot it
    gtk_window_set_decorated(win, FALSE);

    GtkWidget *tray = systray_new();

    gtk_container_add(GTK_CONTAINER(win), tray);
    gtk_widget_show_all(win);

    g_signal_connect(G_OBJECT(win), "delete-event", G_CALLBACK(gtk_main_quit),
                     NULL);
    gtk_main();
    return 0;
}
