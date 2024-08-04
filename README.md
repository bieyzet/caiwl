# CI/CD Süreci
Merhaba, PHP tabanlı hazır olarak aldığım projemin CI/CD süreçlerini anlatacağım. Bu proje, Visual Studio'da geliştirildi ve Docker kullanılarak konteynerize edildi. Sürecin her aşamasında kullanılan araçlar ve yapılan adımları detaylı olarak açıklayacağım.
Projeyi Visual Studio'da geliştiriyorum ve kodlarımı Git ile Azure DevOps'a push ediyorum. Bu sayede değişikliklerim merkezi bir repo üzerinde saklanıyor ve sürüm kontrolü sağlanıyor.

## Kullanılan Araçlar ve Teknolojiler

Visual Studio: Proje geliştirme ortamı olarak kullandım.

Docker: Uygulama konteynerizasyonu için kullandım.

VMware & Ubuntu: Self-hosted agent olarak kullanmak üzere sanal makine oluşturmak için kullandım.

Azure DevOps: CI/CD süreçlerini yönetmek için kullandım.

Azure Portal: Azure servisleri yönetimi için kullandım.

Azure Kubernetes Service (AKS): Uygulama dağıtımı için kullandım.

Azure Container Registry: Docker imajlarını depolamak için kullandım.

Azure Database for MySQL: Veritabanı servisi olarak kullandım.

MySQL Workbench: Veritabanı yönetimi için kullandım.


## Adım Adım Süreç

### 1. Proje Geliştirme ve Dockerfile Oluşturma

Projemi Visual Studio'da geliştirdim. Projeme Dockerfile ekledim ve aşağıdaki gibi yapılandırdım:

![caiwl- dockerfile](https://github.com/user-attachments/assets/38f48c03-2440-44ac-982b-4aeacee5c05a)

## 2. Proje Geliştirme Sürecini Azure DevOps'a Aktarma

Projemi geliştirme sürecini Visual Studio'dan Azure DevOps ortamına aktarıyorum, bu sayede sürekli entegrasyon ve dağıtım işlemlerini daha etkin yönetebiliyorum.

![azure-repos](https://github.com/user-attachments/assets/d8c38338-5ca5-49a8-a7a9-808ad162f1c1)

## 3. Self-Agent Kullanımı

CI/CD sürecinde Azure DevOps'un build işlemlerini kendi sanal makinem üzerinde gerçekleştirebilmek için VMware üzerinde bir Ubuntu sanal makinesi kuruyorum. Bu sanal makineyi self-agent olarak kullanarak build pipeline'larımı çalıştırıyorum. Ubuntu üzerindeki bu self-agent, kodun derlenmesi ve testlerin yapılması gibi işlemleri gerçekleştirmek için gerekli tüm araçları ve yapılandırmaları içeriyor.

Azure DevOps'tan agent paketini indirip, gerekli ayarları yaptım ve çalıştırdım.

![agent-azure](https://github.com/user-attachments/assets/f9505c9d-7ebe-4680-b524-450fcaa053d9)


Azure DevOps'ta oluşturduğum 'mypool' adlı agent havuzuna self-agent ekliyorum.

![agent-1](https://github.com/user-attachments/assets/ef556efd-c0af-4e11-b3df-a78c83a7a948)


## 4. Azure DevOps Pipeline Oluşturma


Azure DevOps üzerinde CI/CD pipeline'ını oluşturmak için şu adımları izledim:

### 1. CI (Continuous Integration):

Pipeline tanımı (azure-pipelines.yml) ile tüm build ve test adımlarını tanımladım.

![pipeline](https://github.com/user-attachments/assets/211cbe8b-37e9-42ab-b876-06378c16d597)


![agent-work](https://github.com/user-attachments/assets/fe3a3843-10d7-481b-b6c6-39eb5264b175)



Kod değişiklikleri yapıldığında otomatik olarak Docker imajları oluşturulup Azure Container Registry'ye gönderiliyor.


![azure-registry](https://github.com/user-attachments/assets/9a090525-9983-407e-924b-c62915a9e5c5)



![azure devops- image push](https://github.com/user-attachments/assets/42094523-e0ee-4fda-b782-e927d664bf14)


### 2. CD (Continuous Deployment)

Kodun test edilip onaylanmasının ardından, otomatik olarak canlı ortama dağıtılması sağlanıyor. Bu projede, Azure Kubernetes Service (AKS) yerine Azure Web Apps servisini kullanarak dağıtım gerçekleştirdim. Azure Web Apps, web uygulamalarını hızlı bir şekilde barındırmak ve yönetmek için kullanılan bir PaaS (Platform as a Service) çözümüdür.

CI sürecinde üretilen Docker imajları Azure Container Registry'ye gönderildikten sonra,  Azure Web Apps'e yeni bir sürüm dağıtımı yapıyor.


![depcent](https://github.com/user-attachments/assets/469cec16-a744-4ce7-9ba5-2bcadd9d9c13)


Bu adımlar, Docker imajlarının Azure Container Registry'den çekilmesini ve Azure Web Apps'e dağıtılmasını içeriyor. Ayrıca, uygulamanın çalıştırılacağı App Service planı ve diğer yapılandırmalar da bu süreçte otomatik olarak yönetiliyor. Azure Web Apps'in sağladığı otomatik ölçekleme, güvenlik ve yüksek erişilebilirlik gibi özellikler sayesinde uygulama kesintisiz ve sorunsuz bir şekilde yayına alındı.


![azure-caiwlDeploy](https://github.com/user-attachments/assets/d1024ec9-cb17-4fd5-9008-9eb2fda79826)


![azure-deployCaiwl](https://github.com/user-attachments/assets/a3237ef9-ca08-4d60-8457-4e9c3577e9a3)



### 3. Veritabanı Yönetimi

Azure Database for MySQL servisini kullanarak veritabanını oluşturdum. Bu servis, yüksek performanslı ve güvenli bir şekilde veritabanı yönetimini sağlıyor. 



Veritabanı yönetimi için MySQL Workbench aracını kullandım. Bu araç ile veritabanı şemalarını oluşturup yönetim işlemlerini gerçekleştirdim. Aşağıdaki adımları izledim:

Azure Portal'da MySQL Veritabanı Oluşturma: Azure Portal'da yeni bir MySQL veritabanı oluşturdum ve bağlantı bilgilerini yapılandırdım.


![ddddd](https://github.com/user-attachments/assets/3051ded1-1f32-46da-945d-be2baadbd08a)



Veritabanı Bağlantı Ayarları: Uygulamanın bağlantı dizesini yapılandırarak veritabanına bağlanmasını sağladım.

![caiwl-db](https://github.com/user-attachments/assets/eb69b501-f7f7-4bb5-a12b-f572378eab3b)


Veritabanı Yönetimi: MySQL Workbench aracılığıyla veritabanı tablolarını, sorgularını ve diğer veritabanı işlemlerini yönettim.

![mysql-workbench](https://github.com/user-attachments/assets/5e416efe-e1b0-40af-b4aa-b84229bd797a)


### 4. Uygulama Dağıtımı ve Yönetimi

Docker imajları Azure Container Registry'ye yüklendikten sonra, Azure Web Apps üzerinden uygulamayı dağıttım. 

![azure-caiwlDeployWeb](https://github.com/user-attachments/assets/c25e162c-bb4c-4aad-88e5-887bac16fabd)


Bu süreçte aşağıdaki adımları izledim:

#### 1. Azure Web Apps Oluşturma: Azure Portal üzerinden yeni bir Web App oluşturdum. Bu işlem, uygulamanın barındırılacağı sunucu ortamını ve gerekli yapılandırmaları sağlar.

#### 2. Docker İmajı Kullanımı: Azure Web Apps ayarlarında Docker imajı olarak, Azure Container Registry'deki ilgili imajı tanımladım. Böylece Web App, belirtilen Docker imajını kullanarak uygulamayı çalıştırır.

#### 3. Ortam Değişkenleri: Uygulamanın ihtiyacı olan ortam değişkenlerini (örneğin, veritabanı bağlantı bilgileri) Azure Web Apps ayarlarından yapılandırdım.

#### 4. Uygulama İzleme ve Loglama: Azure Application Insights ve Azure Monitor gibi hizmetlerle uygulama performansını ve hataları izledim. Logları inceleyerek olası sorunları tespit ettim ve çözdüm.

#### 5. Otomatik Ölçekleme ve Yük Dengeleme
Azure Web Apps, yüksek trafik altında uygulamanın performansını artırmak için otomatik ölçekleme özelliğine sahiptir. Bu özellik, trafik arttığında ek kaynaklar ekleyerek uygulamanın yanıt verme süresini kısaltır ve kullanıcı deneyimini iyileştirir. Yük dengeleme, gelen isteklerin sunucular arasında eşit olarak dağıtılmasını sağlayarak tek bir sunucunun aşırı yüklenmesini önler.

#### 6. Güvenlik ve Erişim Kontrolleri
Azure Web Apps, SSL/TLS şifreleme desteği ve diğer güvenlik özellikleri ile verilerin güvenliğini sağlar. Uygulama ve veritabanı erişimlerini kontrol etmek için Azure Active Directory ve diğer erişim yönetimi araçlarını kullandım. Ayrıca, Azure Firewall ve diğer güvenlik önlemleri ile uygulamanın güvenliğini artırdım.


## Sonuç
Bu süreçte, PHP tabanlı projemi geliştirme aşamasından canlıya geçiş aşamasına kadar olan tüm adımları başarıyla tamamladım. Azure DevOps ve Azure servislerini kullanarak, uygulamanın CI/CD süreçlerini etkin bir şekilde yönettim ve uygulamayı Azure Web Apps üzerinde yayına aldım. Bu süreçte edindiğim deneyimler ve kullandığım araçlar, gelecekteki projelerimde de kullanabileceğim değerli bir bilgi birikimi oluşturdu.
