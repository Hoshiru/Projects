import java.util.*;
 2.
 3. /**
 4.  * This program demonstrates inheritance.
 5.  * @version 1.21 2004-02-21
 6.  * @author Cay Horstmann
 7.  */
 8. public class ManagerTest
 9. {
10.    public static void main(String[] args)
11.    {
12.       // construct a Manager object
13.       Manager boss = new Manager("Carl Cracker", 80000, 1987, 12, 15);
14.       boss.setBonus(5000);
15.
16.       Employee[] staff = new Employee[3];
17.
18.       // fill the staff array with Manager and Employee objects
19.
20.       staff[0] = boss;
21.       staff[1] = new Employee("Harry Hacker", 50000, 1989, 10, 1);
22.       staff[2] = new Employee("Tommy Tester", 40000, 1990, 3, 15);
23.
24.       // print out information about all Employee objects
25.       for (Employee e : staff)
26.          System.out.println("name=" + e.getName() + ",salary=" + e.getSalary());
27.    }
28. }
29.
30. class Employee
31. {
32.    public Employee(String n, double s, int year, int month, int day)
33.    {
34.       name = n;
35.       salary = s;
36.       GregorianCalendar calendar = new GregorianCalendar(year, month - 1, day);
37.       hireDay = calendar.getTime();
38.    }
39.
40.    public String getName()
41.    {
42.       return name;
43.    }
44.
45.    public double getSalary()
46.    {
47.       return salary;
48.    }
49.
50.    public Date getHireDay()
51.    {
52.       return hireDay;
53.    }
54.
55.    public void raiseSalary(double byPercent)
56.    {
57.       double raise = salary * byPercent / 100;
58.       salary += raise;
59.    }
60.
61.    private String name;
62.    private double salary;
63.    private Date hireDay;
64. }
65.
66. class Manager extends Employee
67. {
68.    /**
69.     * @param n the employee's name
70.     * @param s the salary
71.     * @param year the hire year
72.     * @param month the hire month
73.     * @param day the hire day
74.     */
75.    public Manager(String n, double s, int year, int month, int day)
76.    {
77.       super(n, s, year, month, day);
78.       bonus = 0;
79.    }
80.
81.    public double getSalary()
82.    {
83.       double baseSalary = super.getSalary();
84.       return baseSalary + bonus;
85.    }
86.
87.    public void setBonus(double b)
88.    {
89.       bonus = b;
90.    }
91.
92.    private double bonus;
93. }