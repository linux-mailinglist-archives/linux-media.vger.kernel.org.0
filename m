Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F81F202203
	for <lists+linux-media@lfdr.de>; Sat, 20 Jun 2020 09:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726854AbgFTHBM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 03:01:12 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:18506 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726533AbgFTHAz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 03:00:55 -0400
X-UUID: 4652e3c20de84c2dbdd9016e81d1730b-20200620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=GOQerDuDZZDolfkbE0aS87YaUPdoD/4rFLApBq5bAw4=;
        b=BrGsL2HUAaM1YxtrLXADPGxEpyvaEEXzbysFn0FVD9m/bQS5l0yaivf54X9svOMa5xn1Tm13LUmYiMopODze3YE++28YJ/j996ZrH2uWEZ2A4z9giU5w1TQk6zraxi5uEWZBa4Y/NpwIqBJc2SAGU1A+c1ybsIJG4/PQL70Mx4E=;
X-UUID: 4652e3c20de84c2dbdd9016e81d1730b-20200620
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1470060894; Sat, 20 Jun 2020 15:00:39 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 20 Jun
 2020 15:00:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Jun 2020 15:00:37 +0800
Message-ID: <1592636284.8804.697.camel@mhfsdcap03>
Subject: Re: [PATCH V8 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Sat, 20 Jun 2020 14:58:04 +0800
In-Reply-To: <20200618184554.GA68039@chromium.org>
References: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
         <20200616125531.31671-3-dongchun.zhu@mediatek.com>
         <20200618184554.GA68039@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E669BBACD0C8838498D42BD62F02F8C4F0F2CA5202DE503DB6FD38ADB735C7BC2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gVG9tYXN6LA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMC0w
Ni0xOCBhdCAxODo0NSArMDAwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDE2
LCAyMDIwIGF0IDA4OjU1OjMxUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBBZGQg
YSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZvciBEVzk3Njggdm9pY2UgY29pbCBtb3RvciwNCj4g
PiBwcm92aWRpbmcgY29udHJvbCB0byBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgdmlhIElJQyBzZXJp
YWwgaW50ZXJmYWNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9u
Z2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICB8ICAxMiAr
DQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIHwgICAxICsNCj4gPiAgZHJpdmVycy9t
ZWRpYS9pMmMvZHc5NzY4LmMgfCA1NTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNTY3IGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+IFtzbmlw
XQ0KPiA+ICtzdGF0aWMgaW50IGR3OTc2OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQo+ID4g
KwlzdHJ1Y3QgZHc5NzY4ICpkdzk3Njg7DQo+ID4gKwl1bnNpZ25lZCBpbnQgaTsNCj4gPiArCWlu
dCByZXQ7DQo+ID4gKw0KPiA+ICsJZHc5NzY4ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpk
dzk3NjgpLCBHRlBfS0VSTkVMKTsNCj4gPiArCWlmICghZHc5NzY4KQ0KPiA+ICsJCXJldHVybiAt
RU5PTUVNOw0KPiA+ICsNCj4gPiArCS8qIEluaXRpYWxpemUgc3ViZGV2ICovDQo+ID4gKwl2NGwy
X2kyY19zdWJkZXZfaW5pdCgmZHc5NzY4LT5zZCwgY2xpZW50LCAmZHc5NzY4X29wcyk7DQo+ID4g
Kw0KPiA+ICsJZHc5NzY4LT5hYWNfbW9kZSA9IERXOTc2OF9BQUNfTU9ERV9ERUZBVUxUOw0KPiA+
ICsJZHc5NzY4LT5hYWNfdGltaW5nID0gRFc5NzY4X0FBQ19USU1FX0RFRkFVTFQ7DQo+ID4gKwlk
dzk3NjgtPmNsb2NrX3ByZXNjID0gRFc5NzY4X0NMT0NLX1BSRV9TQ0FMRV9ERUZBVUxUOw0KPiA+
ICsNCj4gPiArCS8qIE9wdGlvbmFsIGluZGljYXRpb24gb2YgQUFDIG1vZGUgc2VsZWN0ICovDQo+
ID4gKwlmd25vZGVfcHJvcGVydHlfcmVhZF91MzIoZGV2X2Z3bm9kZShkZXYpLCAiZG9uZ3dvb24s
YWFjLW1vZGUiLA0KPiA+ICsJCQkJICZkdzk3NjgtPmFhY19tb2RlKTsNCj4gPiArDQo+ID4gKwkv
KiBPcHRpb25hbCBpbmRpY2F0aW9uIG9mIGNsb2NrIHByZS1zY2FsZSBzZWxlY3QgKi8NCj4gPiAr
CWZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXZfZndub2RlKGRldiksICJkb25nd29vbixjbG9j
ay1wcmVzYyIsDQo+ID4gKwkJCQkgJmR3OTc2OC0+Y2xvY2tfcHJlc2MpOw0KPiA+ICsNCj4gPiAr
CS8qIE9wdGlvbmFsIGluZGljYXRpb24gb2YgQUFDIFRpbWluZyAqLw0KPiA+ICsJZndub2RlX3By
b3BlcnR5X3JlYWRfdTMyKGRldl9md25vZGUoZGV2KSwgImRvbmd3b29uLGFhYy10aW1pbmciLA0K
PiA+ICsJCQkJICZkdzk3NjgtPmFhY190aW1pbmcpOw0KPiA+ICsNCj4gPiArCWR3OTc2OC0+bW92
ZV9kZWxheV91cyA9IGR3OTc2OF9jYWxfbW92ZV9kZWxheShkdzk3NjgtPmFhY19tb2RlLA0KPiA+
ICsJCQkJCQkgICAgICBkdzk3NjgtPmNsb2NrX3ByZXNjLA0KPiA+ICsJCQkJCQkgICAgICBkdzk3
NjgtPmFhY190aW1pbmcpIC8gMTAwOw0KPiANCj4gbml0OiBDb3VsZCB3ZSBtYWtlIHRoZSBmdW5j
dGlvbiByZXR1cm4gdGhlIHZhbHVlIGluIHVzIGFscmVhZHk/IE9uZSB3b3VsZA0KPiBleHBlY3Qg
dGhlIGZ1bmN0aW9uIHRvIHJldHVybiB0aGUgdmFsdWUgaW4gYSBzdGFuZGFyZCB1bml0LCBzbyB0
aGlzDQo+IGRpdmlzaW9uIGJ5IDEwMCBoZXJlIGlzIGNvbmZ1c2luZy4NCj4gDQoNCkdvb2QgaWRl
YS4NCg0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGR3OTc2OF9zdXBw
bHlfbmFtZXMpOyBpKyspDQo+ID4gKwkJZHc5NzY4LT5zdXBwbGllc1tpXS5zdXBwbHkgPSBkdzk3
Njhfc3VwcGx5X25hbWVzW2ldOw0KPiA+ICsNCj4gPiArCXJldCA9IGRldm1fcmVndWxhdG9yX2J1
bGtfZ2V0KGRldiwgQVJSQVlfU0laRShkdzk3Njhfc3VwcGx5X25hbWVzKSwNCj4gPiArCQkJCSAg
ICAgIGR3OTc2OC0+c3VwcGxpZXMpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+ICsJCWRldl9lcnIo
ZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3JzXG4iKTsNCj4gPiArCQlyZXR1cm4gcmV0Ow0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qIEluaXRpYWxpemUgY29udHJvbHMgKi8NCj4gPiArCXJl
dCA9IGR3OTc2OF9pbml0X2NvbnRyb2xzKGR3OTc2OCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJ
CWdvdG8gZXJyX2ZyZWVfaGFuZGxlcjsNCj4gPiArDQo+ID4gKwkvKiBJbml0aWFsaXplIHN1YmRl
diAqLw0KPiA+ICsJZHc5NzY4LT5zZC5mbGFncyB8PSBWNEwyX1NVQkRFVl9GTF9IQVNfREVWTk9E
RTsNCj4gPiArCWR3OTc2OC0+c2QuaW50ZXJuYWxfb3BzID0gJmR3OTc2OF9pbnRfb3BzOw0KPiA+
ICsNCj4gPiArCXJldCA9IG1lZGlhX2VudGl0eV9wYWRzX2luaXQoJmR3OTc2OC0+c2QuZW50aXR5
LCAwLCBOVUxMKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCWdvdG8gZXJyX2ZyZWVfaGFu
ZGxlcjsNCj4gPiArDQo+ID4gKwlkdzk3NjgtPnNkLmVudGl0eS5mdW5jdGlvbiA9IE1FRElBX0VO
VF9GX0xFTlM7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiArCWlm
ICghcG1fcnVudGltZV9lbmFibGVkKGRldikpIHsNCj4gPiArCQlyZXQgPSBkdzk3NjhfcnVudGlt
ZV9yZXN1bWUoZGV2KTsNCj4gPiArCQlpZiAocmV0IDwgMCkgew0KPiA+ICsJCQlkZXZfZXJyKGRl
diwgImZhaWxlZCB0byBwb3dlciBvbjogJWRcbiIsIHJldCk7DQo+ID4gKwkJCWdvdG8gZXJyX2Ns
ZWFuX2VudGl0eTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0ID0gdjRsMl9h
c3luY19yZWdpc3Rlcl9zdWJkZXYoJmR3OTc2OC0+c2QpOw0KPiA+ICsJaWYgKHJldCA8IDApIHsN
Cj4gPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBWNEwyIHN1YmRldjogJWQi
LCByZXQpOw0KPiA+ICsJCWdvdG8gZXJyX3Bvd2VyX29mZjsNCj4gPiArCX0NCj4gPiArDQo+ID4g
KwlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vycl9wb3dlcl9vZmY6DQo+ID4gKwlwbV9ydW50aW1l
X2Rpc2FibGUoZGV2KTsNCj4gPiArCWlmICghcG1fcnVudGltZV9lbmFibGVkKGRldikpDQo+IA0K
PiBXZSBqdXN0IGRpc2FibGVkIHJ1bnRpbWUgUE0gaW4gdGhlIGxpbmUgYWJvdmUsIHNvIHRoaXMg
Y2hlY2sgd291bGQgYmUNCj4gYWx3YXlzIHRydWUuIE5lZWQgdG8gY2FsbCBwbV9ydW50aW1lX2Rp
c2FibGUoKSBhZnRlciB0aGlzIGlmLg0KPiANCg0KU29ycnkgdG8gbWFrZSBzdWNoIGEgbWlzdGFr
ZS4NCg0KPiA+ICsJCWR3OTc2OF9ydW50aW1lX3N1c3BlbmQoZGV2KTsNCj4gPiArZXJyX2NsZWFu
X2VudGl0eToNCj4gPiArCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZkdzk3NjgtPnNkLmVudGl0eSk7
DQo+ID4gK2Vycl9mcmVlX2hhbmRsZXI6DQo+ID4gKwl2NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCZk
dzk3NjgtPmN0cmxzKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0K
PiA+ICtzdGF0aWMgaW50IGR3OTc2OF9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkN
Cj4gPiArew0KPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IGkyY19nZXRfY2xpZW50ZGF0
YShjbGllbnQpOw0KPiA+ICsJc3RydWN0IGR3OTc2OCAqZHc5NzY4ID0gc2RfdG9fZHc5NzY4KHNk
KTsNCj4gPiArDQo+ID4gKwl2NGwyX2FzeW5jX3VucmVnaXN0ZXJfc3ViZGV2KCZkdzk3NjgtPnNk
KTsNCj4gPiArCXY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoJmR3OTc2OC0+Y3RybHMpOw0KPiA+ICsJ
bWVkaWFfZW50aXR5X2NsZWFudXAoJmR3OTc2OC0+c2QuZW50aXR5KTsNCj4gPiArCXBtX3J1bnRp
bWVfZGlzYWJsZSgmY2xpZW50LT5kZXYpOw0KPiA+ICsJaWYgKCFwbV9ydW50aW1lX3N1c3BlbmRl
ZCgmY2xpZW50LT5kZXYpKQ0KPiANCj4gT29wcywgSSBqdXN0IHJlYWxpemVkIHRoYXQgbXkgc3Vn
Z2VzdGlvbiBhYm91dCB0aGUgZnVuY3Rpb24gdG8gdXNlIGhlcmUNCj4gd2FzIGluY29ycmVjdC4g
cG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCkgc2hvdWxkIGJlIHRoZSBjb3JyZWN0IGZ1bmN0
aW9uDQo+IGhlcmUuIFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLg0KPiANCj4gVGhpcyBpcyBiZWNh
dXNlIHdlIG9ubHkgaGF2ZSAyIGNhc2VzIGhlcmU6DQo+ICAtIHJ1bnRpbWUgUE0gY29tcGlsZWQg
b3V0IC0gdGhlIHN0dWJzIGZ1bmN0aW9uIGlzIHVzZWQsIHdoaWNoIHJldHVybnMNCj4gICAgZmFs
c2UsIHNvIHRoZSBjb25kaXRpb24gaXMgdHJ1ZSwNCj4gIC0gcnVudGltZSBQTSBjb21waWxlZCBp
biAtIHdlIGVuYWJsZWQgcnVudGltZSBQTSBpbiBwcm9iZSwgc28gaGVyZSB3ZQ0KPiAgICBkb24n
dCBuZWVkIHRvIGNvbnNpZGVyIHRoZSBlbmFibGUgc3RhdGUuDQo+IA0KDQpVaC1odWguLi4NClRo
YW5rcyBmb3IgdGhlIGV4cGxhaW5pbmcuDQpJdCBzZWVtcyBPVjg4NTYsIE9WNTY5NSBhbmQgT1Yy
Njg1IGFsc28gdXNlIHRoZSBBUEkNCidwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQnLg0KDQo+
IEJlc3QgcmVnYXJkcywNCj4gVG9tYXN6DQoNCg==

