-- hangi ürünler hangi tedarikçiler tarafından üretiliyor?
select p.name,ps.supplier_id,s.supplier_number from products p 
inner join product_suppliers ps on p.id = ps.product_id 
inner join suppliers s on s.id = ps.supplier_id
group by p.name,ps.supplier_id,s.supplier_number

-- bir ürünün birden fazla tedarikçisi varsa getir ve kaç tedarikçisi
-- olduğunu göster.

select p.name, count(ps.supplier_id) as "URETICI SAYISI" from products p 
inner join product_suppliers ps on p.id = ps.product_id group by p.name
having count(ps.supplier_id) > 1

-- tedarikçisi olmayan(bir nevi artık üretilmeyen) ürünleri getir.

select * from products p 
left join product_suppliers ps
on p.id = ps.product_id where ps.supplier_id is null

-- Adresi veya telefon numarası olmayan kullanıcıları getir.

select * from addresses ad full outer join users us
on ad.user_id = us.id where street_id is null or phone_number is null

--Fiyatı 200 - 500  arasında olan ürünleri listele.
select * from products where cast(unit_price as numeric) between 100 and 400

--İsmi Mert olan kullanıcıları listele.
select * from users where lower(name) in('mert')

--

