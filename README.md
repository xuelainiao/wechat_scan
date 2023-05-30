# 仿微信扫一扫

#### 实现功能:

##### 扫一扫:

扫描单个二维码

开关手电筒

相册选择

双击放大缩小

双指捏合放大缩小

##### 我的二维码:

二维码生成

二维码保存图片

##### 翻译:

图片翻译

相册选择

![076f07728091f9219ca99af55ec3c2b](https://img.subrecovery.top/076f07728091f9219ca99af55ec3c2b.jpg)![f7a0bfe9739b9c27a0554cb973ecf12](https://img.subrecovery.top/f7a0bfe9739b9c27a0554cb973ecf12.jpg)![d6b95603a42e91f6f24cf72ac03ba27](https://img.subrecovery.top/d6b95603a42e91f6f24cf72ac03ba27.jpg)

##### 第三方库:

 get: ^4.6.5 路由管理,简化弹窗,底部抽屉,验证URL

 url_launcher: ^6.1.8 打开浏览器访问网站

 wechat_assets_picker: ^8.5.0 微信资源选择器

 qrscan: ^0.3.3 扫描相册二维码

 mobile_scanner: ^3.2.0 扫描相机二维码

 vibration: ^1.7.7 震动

 qr_flutter: ^4.1.0 生成二维码

 image_gallery_saver_v3: ^1.0.0 保存图片

 flutter_easyloading: ^3.0.5 弹窗提示

 camera: ^0.10.5+2 相机

 http: ^0.13.6 网络请求

 crypto: ^3.0.3 md5转换

 connectivity_plus: ^4.0.1 检查网络连接

 image: ^4.0.17 压缩图片

#### 未实现功能:

扫描多二维码(其实mobile_scanner可以检测多二维码但没有微信的准确)

添加桌面扫一扫小组件

快捷方式

我的二维码换个样式

扫一扫音效

#### 其他:

图片翻译用的是有道云的接口,需要自行申请,有免费的10块用量,不建议用百度的,图片传输不了给接口,它要File进行MD5加密,但flutter只能先Image转base64才能进行MD5加密

https://ai.youdao.com/console/#/service-singleton/image-translation

wechat在opencv开源过早期的多二维码检测模型,但调用好麻烦,懒得搞