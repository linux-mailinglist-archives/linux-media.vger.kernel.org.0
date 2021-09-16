Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB6140D18C
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 04:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233865AbhIPCHv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 22:07:51 -0400
Received: from mx24.baidu.com ([111.206.215.185]:49932 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233809AbhIPCHu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 22:07:50 -0400
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Sep 2021 22:07:50 EDT
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
        by Forcepoint Email with ESMTPS id 2B74F308AEF8BAE180B3;
        Thu, 16 Sep 2021 10:06:29 +0800 (CST)
Received: from BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 10:06:28 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX28.internal.baidu.com (10.127.64.43) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 10:06:28 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Thu, 16 Sep 2021 10:06:28 +0800
From:   "Cai,Huoqing" <caihuoqing@baidu.com>
To:     Sean Young <sean@mess.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: b2c2: flexcop: Convert to SPDX identifier
Thread-Topic: [PATCH v2] media: b2c2: flexcop: Convert to SPDX identifier
Thread-Index: AQHXqp6YKLlLTRa+3UOAGkVQbN03Vaul6XWg
Date:   Thu, 16 Sep 2021 02:06:28 +0000
Message-ID: <de095ae62b4a4e3196ccd96857049870@baidu.com>
References: <20210916020006.8497-1-caihuoqing@baidu.com>
In-Reply-To: <20210916020006.8497-1-caihuoqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.45.132]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQorQ2MgU2VhbiBZb3VuZyA8c2VhbkBtZXNzLm9yZz4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDYWksSHVvcWluZyA8Y2FpaHVvcWluZ0BiYWlkdS5jb20+
DQo+IFNlbnQ6IDIwMjHE6jnUwjE2yNUgMTA6MDANCj4gVG86IENhaSxIdW9xaW5nDQo+IENjOiBN
YXVybyBDYXJ2YWxobyBDaGVoYWI7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgbGludXgt
DQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIHYyXSBtZWRpYTog
YjJjMjogZmxleGNvcDogQ29udmVydCB0byBTUERYIGlkZW50aWZpZXINCj4gDQo+IHVzZSBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllciBpbnN0ZWFkIG9mIGEgdmVyYm9zZSBsaWNlbnNlIHRleHQNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IENhaSBIdW9xaW5nIDxjYWlodW9xaW5nQGJhaWR1LmNvbT4NCj4g
LS0tDQo+IHYxLT52MjogQ2hhbmdlIGxpY2Vuc2UgZnJvbSBHUEwtMi4wKyB0byBMR1BMLTIuMS1v
ci1sYXRlcg0KPiANCj4gIGRyaXZlcnMvbWVkaWEvY29tbW9uL2IyYzIvZmxleGNvcC5jIHwgMTEg
Ky0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTAgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9jb21tb24vYjJjMi9mbGV4
Y29wLmMNCj4gYi9kcml2ZXJzL21lZGlhL2NvbW1vbi9iMmMyL2ZsZXhjb3AuYw0KPiBpbmRleCBj
YmFhNjFmMTBkNWYuLjJlYWZmMTMxNjk1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9j
b21tb24vYjJjMi9mbGV4Y29wLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9jb21tb24vYjJjMi9m
bGV4Y29wLmMNCj4gQEAgLTEsMyArMSw0IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTEdQTC0yLjEtb3ItbGF0ZXINCj4gIC8qDQo+ICAgKiBMaW51eCBkcml2ZXIgZm9yIGRpZ2l0
YWwgVFYgZGV2aWNlcyBlcXVpcHBlZCB3aXRoIEIyQzIgRmxleGNvcElJKGIpL0lJSQ0KPiAgICog
ZmxleGNvcC5jIC0gbWFpbiBtb2R1bGUgcGFydA0KPiBAQCAtMTUsMTYgKzE2LDYgQEANCj4gICAq
ICAgVXdlIEJ1Z2xhLCB1d2UuYnVnbGEgYXQgZ214LmRlIChkb2luZyB0ZXN0cywgcmVzdHlsaW5n
IGNvZGUsIHdyaXRpbmcgZG9jdSkNCj4gICAqICAgTmlrbGFzIFBlaW5lY2tlLCBwZWluZWNrZSBh
dCBnZHYudW5pLWhhbm5vdmVyLmRlIChoYXJkd2FyZSBwaWQvbWFjDQo+ICAgKiAgICAgICAgICAg
ICAgIGZpbHRlcmluZykNCj4gLSAqDQo+IC0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2Fy
ZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yDQo+IC0gKiBtb2RpZnkgaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UNCj4gLSAq
IGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVy
c2lvbiAyLjENCj4gLSAqIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBs
YXRlciB2ZXJzaW9uLg0KPiAtICoNCj4gLSAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBp
biB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPiAtICogYnV0IFdJVEhPVVQgQU5Z
IFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4gLSAqIE1F
UkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUNCj4gLSAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+
ICAgKi8NCj4gDQo+ICAjaW5jbHVkZSAiZmxleGNvcC5oIg0KPiAtLQ0KPiAyLjI1LjENCg0K
