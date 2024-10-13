using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Work.Pages
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        public Login()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if(string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errors.AppendLine("Введите логин");
                }
                if(string.IsNullOrEmpty(PasswordBox.Password))
                {
                    errors.AppendLine("Введите пароль");
                }
                if(errors.Length >0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                if(Data.HomeEntities.GetContext().User.Any(d => d.Login == LoginTextBox.Text && d.Password == PasswordBox.Password))
                {
                    MessageBox.Show("Успех","Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    Clases.Manager.MainFrame.Navigate(new Pages.UserPage());
                }
                else
                {
                    MessageBox.Show("Неверный логин или пароль", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
       
        }
    }
}
