-- Task 1
SELECT st.first_name '��� ����������',
st.last_name '������� ����������',
c.city '�����', cus.store_id '����� ��������',
count(cus.store_id) '���������� �����������'
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city c ON c.city_id = a.city_id
JOIN customer cus ON cus.store_id = s.store_id
JOIN staff st ON s.manager_staff_id = st.staff_id 
GROUP BY cus.store_id
HAVING count(cus.store_id) > 300;

-- Task 2
SELECT count(f.`length`) '���������� ������� >AVG' FROM film f
WHERE f.`length` > (SELECT avg(f2.`length`) FROM film f2);

-- Task 3
SELECT MONTH(p.payment_date) '�����',
sum(p.amount) '���������� �����',
count(p.payment_id) '���������� �����'
FROM payment p
GROUP BY MONTH(p.payment_date)
ORDER BY sum(p.amount) DESC
LIMIT 1;
