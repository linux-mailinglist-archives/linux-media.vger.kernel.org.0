Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE1F0F2BAA
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 10:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387933AbfKGJ7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Nov 2019 04:59:01 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:36198 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733271AbfKGJ7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 Nov 2019 04:59:01 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xA79wGNs011951;
        Thu, 7 Nov 2019 10:58:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hbVDWXJ00zmSGkN7uOVCNrHuL1TPN4pH9x85Y3/XZCw=;
 b=fCpAJnXenkQkx5e+gKEYTy5J7ew3c0UrRs2d8pPiknmB3AorZG1sPVDJq5Ll5X9SHDaO
 t78tOySt/RflVWyEbnOQ9l51r6ko/xpBtctpH+4EjttVbSn0zCMX6SNBS9El/D94CvSf
 zNl4XU+88NObspeGUao5fmBhP5ysWmMrl+cHApxCDSYcA4SgupgG0v4+CG22Hmqa8RDL
 Iq3YUX4VEPB+n255e3E/2YZKf9ri0QvYVk+pcO7A/OyKrfQRxUoXn/90Vuwz69Z5nCjg
 3h8hym6taUaMsCJrJSpPm25DmIcNif/josHnx9lgc8qrU5G60pcqSE83PSn/RdK8fGjF /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2w41vgvey9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Nov 2019 10:58:48 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43D4210002A;
        Thu,  7 Nov 2019 10:58:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 326122AA4DB;
        Thu,  7 Nov 2019 10:58:47 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 7 Nov
 2019 10:58:46 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 7 Nov 2019 10:58:46 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: c8sectpfe: no need to check return value of
 debugfs_create functions
Thread-Topic: [PATCH] media: c8sectpfe: no need to check return value of
 debugfs_create functions
Thread-Index: AQHVlUi4fopZoSb/7UygbHVOP1JV06d/aI4A
Date:   Thu, 7 Nov 2019 09:58:46 +0000
Message-ID: <e27c1351-3ca8-ccf3-bcb6-adab33be8889@st.com>
References: <20191107085238.GA1285658@kroah.com>
In-Reply-To: <20191107085238.GA1285658@kroah.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8395E0710B8C84BB8416781D9DD88E0@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-07_02:2019-11-07,2019-11-07 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkNCg0KT24gMTEvNy8xOSA5OjUyIEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+IFdo
ZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNo
ZWNrIHRoZQ0KPiByZXR1cm4gdmFsdWUuICBUaGUgZnVuY3Rpb24gY2FuIHdvcmsgb3Igbm90LCBi
dXQgdGhlIGNvZGUgbG9naWMgc2hvdWxkDQo+IG5ldmVyIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQg
YmFzZWQgb24gdGhpcy4NCj4NCj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJk
QHN0LmNvbT4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3Jn
Pg0KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IENjOiBsaW51
eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcNCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4NCj4gLS0tDQo+ICAuLi4vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZGVidWdm
cy5jICAgICAgICAgfCAyNiArKystLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZGVidWdmcy5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYzhzZWN0cGZlL2M4c2VjdHBmZS1kZWJ1Z2ZzLmMNCj4g
aW5kZXggOGYwZGRjYmVlZDlkLi4zMDFmYTEwZjQxOWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZGVidWdmcy5jDQo+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtZGVidWdmcy5j
DQo+IEBAIC0yMjUsMzYgKzIyNSwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRlYnVnZnNfcmVn
MzIgZmVpX3N5c19yZWdzW10gPSB7DQo+ICANCj4gIHZvaWQgYzhzZWN0cGZlX2RlYnVnZnNfaW5p
dChzdHJ1Y3QgYzhzZWN0cGZlaSAqZmVpKQ0KPiAgew0KPiAtCXN0cnVjdCBkZW50cnkJCSpyb290
Ow0KPiAtCXN0cnVjdCBkZW50cnkJCSpmaWxlOw0KPiAtDQo+IC0Jcm9vdCA9IGRlYnVnZnNfY3Jl
YXRlX2RpcigiYzhzZWN0cGZlIiwgTlVMTCk7DQo+IC0JaWYgKCFyb290KQ0KPiAtCQlnb3RvIGVy
cjsNCj4gLQ0KPiAtCWZlaS0+cm9vdCA9IHJvb3Q7DQo+IC0NCj4gIAlmZWktPnJlZ3NldCA9ICBk
ZXZtX2t6YWxsb2MoZmVpLT5kZXYsIHNpemVvZigqZmVpLT5yZWdzZXQpLCBHRlBfS0VSTkVMKTsN
Cj4gIAlpZiAoIWZlaS0+cmVnc2V0KQ0KPiAtCQlnb3RvIGVycjsNCj4gKwkJcmV0dXJuOw0KPiAg
DQo+ICAJZmVpLT5yZWdzZXQtPnJlZ3MgPSBmZWlfc3lzX3JlZ3M7DQo+ICAJZmVpLT5yZWdzZXQt
Pm5yZWdzID0gQVJSQVlfU0laRShmZWlfc3lzX3JlZ3MpOw0KPiAgCWZlaS0+cmVnc2V0LT5iYXNl
ID0gZmVpLT5pbzsNCj4gIA0KPiAtCWZpbGUgPSBkZWJ1Z2ZzX2NyZWF0ZV9yZWdzZXQzMigicmVn
aXN0ZXJzIiwgU19JUlVHTywgcm9vdCwNCj4gLQkJCQlmZWktPnJlZ3NldCk7DQo+IC0JaWYgKCFm
aWxlKSB7DQo+IC0JCWRldl9lcnIoZmVpLT5kZXYsDQo+IC0JCQkiJXMgbm90IGFibGUgdG8gY3Jl
YXRlICdyZWdpc3RlcnMnIGRlYnVnZnNcbiINCj4gLQkJCSwgX19mdW5jX18pOw0KPiAtCQlnb3Rv
IGVycjsNCj4gLQl9DQo+IC0NCj4gLQlyZXR1cm47DQo+IC0NCj4gLWVycjoNCj4gLQlkZWJ1Z2Zz
X3JlbW92ZV9yZWN1cnNpdmUocm9vdCk7DQo+ICsJZmVpLT5yb290ID0gZGVidWdmc19jcmVhdGVf
ZGlyKCJjOHNlY3RwZmUiLCBOVUxMKTsNCj4gKwlkZWJ1Z2ZzX2NyZWF0ZV9yZWdzZXQzMigicmVn
aXN0ZXJzIiwgU19JUlVHTywgZmVpLT5yb290LCBmZWktPnJlZ3NldCk7DQo+ICB9DQo+ICANCj4g
IHZvaWQgYzhzZWN0cGZlX2RlYnVnZnNfZXhpdChzdHJ1Y3QgYzhzZWN0cGZlaSAqZmVpKQ0KDQpS
ZXZpZXdlZC1ieTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAc3QuY29tPg0KDQpU
aGFua3MNCg0K
