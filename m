Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE30D3DD246
	for <lists+linux-media@lfdr.de>; Mon,  2 Aug 2021 10:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbhHBIuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Aug 2021 04:50:16 -0400
Received: from mx21.baidu.com ([220.181.3.85]:48034 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232670AbhHBIuP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Aug 2021 04:50:15 -0400
Received: from BJHW-Mail-Ex15.internal.baidu.com (unknown [10.127.64.38])
        by Forcepoint Email with ESMTPS id BA9626086EB51F782897;
        Mon,  2 Aug 2021 16:50:04 +0800 (CST)
Received: from BJHW-MAIL-EX25.internal.baidu.com (10.127.64.40) by
 BJHW-Mail-Ex15.internal.baidu.com (10.127.64.38) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 16:50:04 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-MAIL-EX25.internal.baidu.com (10.127.64.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 16:50:04 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Mon, 2 Aug 2021 16:50:04 +0800
From:   "Cai,Huoqing" <caihuoqing@baidu.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "gustavoars@kernel.org" <gustavoars@kernel.org>,
        "salah.triki@gmail.com" <salah.triki@gmail.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH] media: smsusb: Use usb_get_dev() for the reference count
 of udev
Thread-Topic: [PATCH] media: smsusb: Use usb_get_dev() for the reference count
 of udev
Thread-Index: AQHXh2vxQuwZF2ZGmEOIGukWTKGuOatf50Tg
Date:   Mon, 2 Aug 2021 08:50:04 +0000
Message-ID: <5c1d01a6a19c409091b224d3aea34d89@baidu.com>
References: <20210802065924.1163-1-caihuoqing@baidu.com>
In-Reply-To: <20210802065924.1163-1-caihuoqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.18.60]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex15_2021-08-02 16:50:04:727
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sIFNhbGFoDQp0aGUgc2FtZQ0KbWF5IEkgYWRkICJSZXBvcnRlZC1ieTogU2FsYWggVHJp
a2kgPHNhbGFoLnRyaWtpQGdtYWlsLmNvbT4iDQphc2sgZm9yIHlvdXIgY29tZmlybWF0aW9uDQpp
ZiBub3QsIEkgd2lsbCByZW1vdmUgaXQuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQ2FpLEh1b3FpbmcgPGNhaWh1b3FpbmdAYmFpZHUuY29tPg0KPiBTZW50OiAyMDIx
xOo41MIyyNUgMTQ6NTkNCj4gVG86IG1jaGVoYWJAa2VybmVsLm9yZzsgaHZlcmt1aWwtY2lzY29A
eHM0YWxsLm5sOyBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOw0KPiBndXN0YXZvYXJzQGtl
cm5lbC5vcmcNCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgQ2FpLEh1b3Fpbmcg
PGNhaWh1b3FpbmdAYmFpZHUuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0hdIG1lZGlhOiBzbXN1c2I6
IFVzZSB1c2JfZ2V0X2RldigpIGZvciB0aGUgcmVmZXJlbmNlIGNvdW50IG9mDQo+IHVkZXYNCj4g
DQo+IFVzZSB1c2JfZ2V0X2RldigpIHRvIGluY3JlbWVudCB0aGUgcmVmZXJlbmNlIGNvdW50IG9m
IHRoZSB1c2IgZGV2aWNlIHN0cnVjdHVyZQ0KPiBpbiBvcmRlciB0byBhdm9pZCByZWxlYXNpbmcg
dGhlIHN0cnVjdHVyZSB3aGlsZSBpdCBpcyBzdGlsbCBpbiB1c2UuIEFuZCB1c2UNCj4gdXNiX3B1
dF9kZXYoKSB0byBkZWNyZW1lbnQgdGhlIHJlZmVyZW5jZSBjb3VudCBhbmQgdGh1cywgd2hlbiBp
dCB3aWxsIGJlIGVxdWFsDQo+IHRvIDAgdGhlIHN0cnVjdHVyZSB3aWxsIGJlIHJlbGVhc2VkLg0K
PiANCj4gUmVwb3J0ZWQtYnk6IFNhbGFoIFRyaWtpIDxzYWxhaC50cmlraUBnbWFpbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IENhaSBIdW9xaW5nIDxjYWlodW9xaW5nQGJhaWR1LmNvbT4NCj4gLS0t
DQo+ICBkcml2ZXJzL21lZGlhL3VzYi9zaWFuby9zbXN1c2IuYyB8IDMgKystDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS91c2Ivc2lhbm8vc21zdXNiLmMNCj4gYi9kcml2ZXJzL21lZGlhL3Vz
Yi9zaWFuby9zbXN1c2IuYw0KPiBpbmRleCBkZjRjNWRjYmEzOWMuLjg2ZTBhMjVmOGRiYSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS91c2Ivc2lhbm8vc21zdXNiLmMNCj4gKysrIGIvZHJp
dmVycy9tZWRpYS91c2Ivc2lhbm8vc21zdXNiLmMNCj4gQEAgLTM1MSw2ICszNTEsNyBAQCBzdGF0
aWMgdm9pZCBzbXN1c2JfdGVybV9kZXZpY2Uoc3RydWN0IHVzYl9pbnRlcmZhY2UNCj4gKmludGYp
DQo+ICAJfQ0KPiANCj4gIAl1c2Jfc2V0X2ludGZkYXRhKGludGYsIE5VTEwpOw0KPiArCXVzYl9w
dXRfZGV2KGRldi0+dWRldik7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgKnNpYW5vX21lZGlh
X2RldmljZV9yZWdpc3RlcihzdHJ1Y3Qgc21zdXNiX2RldmljZV90ICpkZXYsIEBAIC0NCj4gMzk4
LDcgKzM5OSw3IEBAIHN0YXRpYyBpbnQgc21zdXNiX2luaXRfZGV2aWNlKHN0cnVjdCB1c2JfaW50
ZXJmYWNlICppbnRmLCBpbnQNCj4gYm9hcmRfaWQpDQo+IA0KPiAgCW1lbXNldCgmcGFyYW1zLCAw
LCBzaXplb2YocGFyYW1zKSk7DQo+ICAJdXNiX3NldF9pbnRmZGF0YShpbnRmLCBkZXYpOw0KPiAt
CWRldi0+dWRldiA9IGludGVyZmFjZV90b191c2JkZXYoaW50Zik7DQo+ICsJZGV2LT51ZGV2ID0g
dXNiX2dldF9kZXYoaW50ZXJmYWNlX3RvX3VzYmRldihpbnRmKSk7DQo+ICAJZGV2LT5zdGF0ZSA9
IFNNU1VTQl9ESVNDT05ORUNURUQ7DQo+IA0KPiAgCWZvciAoaSA9IDA7IGkgPCBpbnRmLT5jdXJf
YWx0c2V0dGluZy0+ZGVzYy5iTnVtRW5kcG9pbnRzOyBpKyspIHsNCj4gLS0NCj4gMi4yNS4xDQoN
Cg==
