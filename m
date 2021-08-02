Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717E83DD23D
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 10:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhHBIr7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 04:47:59 -0400
Received: from mx21.baidu.com ([220.181.3.85]:33894 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232600AbhHBIr6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 04:47:58 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
        by Forcepoint Email with ESMTPS id C56FB8A6C622369E2115;
        Mon,  2 Aug 2021 16:47:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 2 Aug 2021 16:47:32 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Mon, 2 Aug 2021 16:47:32 +0800
From:   "Cai,Huoqing" <caihuoqing@baidu.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "paskripkin@gmail.com" <paskripkin@gmail.com>,
        "salah.triki@gmail.com" <salah.triki@gmail.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH] media: stkwebcam: Use usb_get_dev() for the reference
 count of udev
Thread-Topic: [PATCH] media: stkwebcam: Use usb_get_dev() for the reference
 count of udev
Thread-Index: AQHXh2l0fRf5P3EZi0Oj5A4uI495F6tf5Vkg
Date:   Mon, 2 Aug 2021 08:47:32 +0000
Message-ID: <71a304acace34a6d978d3dbef0557c68@baidu.com>
References: <20210802064134.1068-1-caihuoqing@baidu.com>
In-Reply-To: <20210802064134.1068-1-caihuoqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.18.60]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sIFNhbGFoDQpJICBoYXZlIHJlYWQgIHlvdXIgcGF0Y2gNCmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3BhdGNod29yay9wYXRjaC8xNDY2NzgyLw0Kc28gSSB0cnkgdG8gZml4IHRoZSBzYW1l
IGlzc3VlIGluIHN0a3dlYmNhbToNCm1heSBJIGFkZCAiUmVwb3J0ZWQtYnk6IFNhbGFoIFRyaWtp
IDxzYWxhaC50cmlraUBnbWFpbC5jb20+Ig0KYXNrIGZvciB5b3VyIGNvbWZpcm1hdGlvbg0KaWYg
bm90LCBJIHdpbGwgcmVtb3ZlIGl0Lg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IENhaSxIdW9xaW5nIDxjYWlodW9xaW5nQGJhaWR1LmNvbT4NCj4gU2VudDogMjAyMcTq
ONTCMsjVIDE0OjQyDQo+IFRvOiBtY2hlaGFiQGtlcm5lbC5vcmc7IGh2ZXJrdWlsLWNpc2NvQHhz
NGFsbC5ubDsgcGFza3JpcGtpbkBnbWFpbC5jb20NCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsgQ2FpLEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPg0KPiBTdWJqZWN0OiBb
UEFUQ0hdIG1lZGlhOiBzdGt3ZWJjYW06IFVzZSB1c2JfZ2V0X2RldigpIGZvciB0aGUgcmVmZXJl
bmNlIGNvdW50DQo+IG9mIHVkZXYNCj4gDQo+IFVzZSB1c2JfZ2V0X2RldigpIHRvIGluY3JlbWVu
dCB0aGUgcmVmZXJlbmNlIGNvdW50IG9mIHRoZSB1c2IgZGV2aWNlIHN0cnVjdHVyZQ0KPiBpbiBv
cmRlciB0byBhdm9pZCByZWxlYXNpbmcgdGhlIHN0cnVjdHVyZSB3aGlsZSBpdCBpcyBzdGlsbCBp
biB1c2UuIEFuZCB1c2UNCj4gdXNiX3B1dF9kZXYoKSB0byBkZWNyZW1lbnQgdGhlIHJlZmVyZW5j
ZSBjb3VudCBhbmQgdGh1cywgd2hlbiBpdCB3aWxsIGJlIGVxdWFsDQo+IHRvIDAgdGhlIHN0cnVj
dHVyZSB3aWxsIGJlIHJlbGVhc2VkLg0KPiANCj4gUmVwb3J0ZWQtYnk6IFNhbGFoIFRyaWtpIDxz
YWxhaC50cmlraUBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IENhaSBIdW9xaW5nIDxjYWlo
dW9xaW5nQGJhaWR1LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3VzYi9zdGt3ZWJjYW0v
c3RrLXdlYmNhbS5jIHwgMyArKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3VzYi9zdGt3
ZWJjYW0vc3RrLXdlYmNhbS5jDQo+IGIvZHJpdmVycy9tZWRpYS91c2Ivc3Rrd2ViY2FtL3N0ay13
ZWJjYW0uYw0KPiBpbmRleCAwZTIzMWU1NzZkYzMuLmI1NGEyM2M2ODQyZSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9tZWRpYS91c2Ivc3Rrd2ViY2FtL3N0ay13ZWJjYW0uYw0KPiArKysgYi9kcml2
ZXJzL21lZGlhL3VzYi9zdGt3ZWJjYW0vc3RrLXdlYmNhbS5jDQo+IEBAIC0xMjM0LDYgKzEyMzQs
NyBAQCBzdGF0aWMgdm9pZCBzdGtfdjRsX2Rldl9yZWxlYXNlKHN0cnVjdCB2aWRlb19kZXZpY2UN
Cj4gKnZkKQ0KPiAgCWlmIChkZXYtPnNpb19idWZzICE9IE5VTEwgfHwgZGV2LT5pc29idWZzICE9
IE5VTEwpDQo+ICAJCXByX2VycigiV2UgYXJlIGxlYWtpbmcgbWVtb3J5XG4iKTsNCj4gIAl1c2Jf
cHV0X2ludGYoZGV2LT5pbnRlcmZhY2UpOw0KPiArCXVzYl9wdXRfZGV2KGRldi0+dWRldik7DQo+
ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCB2aWRlb19kZXZpY2Ugc3RrX3Y0bF9kYXRh
ID0geyBAQCAtMTMwOSw3ICsxMzEwLDcgQEANCj4gc3RhdGljIGludCBzdGtfY2FtZXJhX3Byb2Jl
KHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UsDQo+ICAJaW5pdF93YWl0cXVldWVfaGVh
ZCgmZGV2LT53YWl0X2ZyYW1lKTsNCj4gIAlkZXYtPmZpcnN0X2luaXQgPSAxOyAvKiB3ZWJjYW0g
TEVEIG1hbmFnZW1lbnQgKi8NCj4gDQo+IC0JZGV2LT51ZGV2ID0gdWRldjsNCj4gKwlkZXYtPnVk
ZXYgPSB1c2JfZ2V0X2Rldih1ZGV2KTsNCj4gIAlkZXYtPmludGVyZmFjZSA9IGludGVyZmFjZTsN
Cj4gIAl1c2JfZ2V0X2ludGYoaW50ZXJmYWNlKTsNCj4gDQo+IC0tDQo+IDIuMjUuMQ0KDQo=
