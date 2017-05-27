using Gtk;

class Demo.HelloWorld : GLib.Object {
  private static MyWin window;

  public static int main (string[] args) {
    Gtk.init(ref args);
    window = new MyWin("GTK+ 3.0 in Vala!");
    window.show_all();
    Gtk.main();
    return 0;
  }

  private class MyWin : Window {
    private MyBtn button;

    public MyWin (string title) {
      this.title = title;
      border_width = 10;
      window_position = WindowPosition.CENTER;
      set_default_size(357, 70);
      destroy.connect(Gtk.main_quit);

      button = new MyBtn();
      add(button);
    }

    private class MyBtn : Button {
      private const string[] msg = {"Click me, please!", "Thanks. Now please click me again!"};
      private bool state = true;

      public MyBtn () {
        clicked.connect(onclick);
        onclick();
      }

      private void onclick () {
        state = !state;
        label = msg[state ? 1 : 0];
      }
    }
  }
}
