Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C801F055C
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 08:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgFFG00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 02:26:26 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:53793 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725765AbgFFG00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 02:26:26 -0400
X-UUID: 57578fce974149e88b60b64395ef083d-20200606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=8YaqCRtr6t04Pgcsa7rHWNWRrI7JnwIs3OrBZi9nFCA=;
        b=n0JtMNETz+ZFxQ/8o87sxPtmLwh5Z/g0mxBt92EmbVV87hyWFBiNWy6EKphePH7b/SlF65NEQ4JEmBU81Kfc+Cw49vuD0jeszGwY4MggTiiuZAo6zvu4xFEAtr9kJW8brTc3ttw8zavr0d1gyd1qtpboHWEa//xgxhfboZCn4fI=;
X-UUID: 57578fce974149e88b60b64395ef083d-20200606
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1987694961; Sat, 06 Jun 2020 14:26:19 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 6 Jun
 2020 14:26:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Jun 2020 14:26:17 +0800
Message-ID: <1591424652.8804.603.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Sat, 6 Jun 2020 14:24:12 +0800
In-Reply-To: <20200605121459.GS16711@paasikivi.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
         <20200605105412.18813-3-dongchun.zhu@mediatek.com>
         <20200605121459.GS16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 360CD1EF4D21478AF26A82D6FCE3FA9A3A1CFBDD2931EBABAF5492227401BB2F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHRoZSB0aW1lbHkgcmV2aWV3Lg0KDQpPbiBGcmksIDIw
MjAtMDYtMDUgYXQgMTU6MTQgKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gSGkgRG9uZ2No
dW4sDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSB1cGRhdGUuDQo+IA0KPiBPbiBGcmksIEp1biAw
NSwgMjAyMCBhdCAwNjo1NDoxMlBNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gQWRk
IGEgVjRMMiBzdWItZGV2aWNlIGRyaXZlciBmb3IgRFc5NzY4IHZvaWNlIGNvaWwgbW90b3IsIHBy
b3ZpZGluZw0KPiA+IGNvbnRyb2wgdG8gc2V0IHRoZSBkZXNpcmVkIGZvY3VzIHZpYSBJSUMgc2Vy
aWFsIGludGVyZmFjZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRv
bmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgfCAgMTMg
KysNCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgfCAgIDEgKw0KPiA+ICBkcml2ZXJz
L21lZGlhL2kyYy9kdzk3NjguYyB8IDU2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1ODEgaW5zZXJ0aW9ucygrKQ0K
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gPiAN
Cg0KW3NuaXBdLi4uDQoNCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgZHc5NzY4X3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZjbGllbnQtPmRldjsNCj4gPiArCXN0cnVjdCBkdzk3NjggKmR3OTc2ODsNCj4gPiArCXUzMiBh
YWNfbW9kZV9zZWxlY3Q7DQo+ID4gKwl1MzIgYWFjX3RpbWluZ19zZWxlY3Q7DQo+ID4gKwl1MzIg
Y2xvY2tfcHJlc2Nfc2VsZWN0Ow0KPiA+ICsJdW5zaWduZWQgaW50IGk7DQo+ID4gKwlpbnQgcmV0
Ow0KPiA+ICsNCj4gPiArCWR3OTc2OCA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZHc5NzY4
KSwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIWR3OTc2OCkNCj4gPiArCQlyZXR1cm4gLUVOT01F
TTsNCj4gPiArDQo+ID4gKwkvKiBJbml0aWFsaXplIHN1YmRldiAqLw0KPiA+ICsJdjRsMl9pMmNf
c3ViZGV2X2luaXQoJmR3OTc2OC0+c2QsIGNsaWVudCwgJmR3OTc2OF9vcHMpOw0KPiA+ICsNCj4g
PiArCWR3OTc2OC0+YWFjX21vZGUgPSBEVzk3NjhfQUFDX01PREVfREVGQVVMVDsNCj4gPiArCWR3
OTc2OC0+YWFjX3RpbWluZyA9IERXOTc2OF9BQUNfVElNRV9ERUZBVUxUOw0KPiA+ICsJZHc5NzY4
LT5jbG9ja19wcmVzYyA9IERXOTc2OF9DTE9DS19QUkVfU0NBTEVfREVGQVVMVDsNCj4gPiArDQo+
ID4gKwkvKiBPcHRpb25hbCBpbmRpY2F0aW9uIG9mIEFBQyBtb2RlIHNlbGVjdCAqLw0KPiA+ICsJ
cmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyKGRldl9md25vZGUoZGV2KSwgImRvbmd3b29u
LGFhYy1tb2RlIiwNCj4gPiArCQkJCSAgICAgICAmYWFjX21vZGVfc2VsZWN0KTsNCj4gPiArDQo+
ID4gKwlpZiAoIXJldCkNCj4gPiArCQlkdzk3NjgtPmFhY19tb2RlID0gYWFjX21vZGVfc2VsZWN0
Ow0KPiA+ICsNCj4gPiArCS8qIE9wdGlvbmFsIGluZGljYXRpb24gb2YgY2xvY2sgcHJlLXNjYWxl
IHNlbGVjdCAqLw0KPiA+ICsJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyKGRldl9md25v
ZGUoZGV2KSwgImRvbmd3b29uLGNsb2NrLXByZXNjIiwNCj4gPiArCQkJCSAgICAgICAmY2xvY2tf
cHJlc2Nfc2VsZWN0KTsNCj4gPiArDQo+ID4gKwlpZiAoIXJldCkNCj4gPiArCQlkdzk3NjgtPmNs
b2NrX3ByZXNjID0gY2xvY2tfcHJlc2Nfc2VsZWN0Ow0KPiA+ICsNCj4gPiArCS8qIE9wdGlvbmFs
IGluZGljYXRpb24gb2YgQUFDIFRpbWluZyAqLw0KPiA+ICsJcmV0ID0gZndub2RlX3Byb3BlcnR5
X3JlYWRfdTMyKGRldl9md25vZGUoZGV2KSwgImRvbmd3b29uLGFhYy10aW1pbmciLA0KPiA+ICsJ
CQkJICAgICAgICZhYWNfdGltaW5nX3NlbGVjdCk7DQo+ID4gKw0KPiA+ICsJaWYgKCFyZXQpDQo+
ID4gKwkJZHc5NzY4LT5hYWNfdGltaW5nID0gYWFjX3RpbWluZ19zZWxlY3Q7DQo+IA0KPiBZb3Ug
Y2FuIGFzc2lnbiB0aGUgZGVmYXVsdHMgdG8gdGhlIGR3OTc2OCBzdHJ1Y3QgYW5kIHVzZSB0aGUg
Zndub2RlDQo+IHByb3BlcnR5IEFQSSB0byByZWFkIHRoZSBwcm9wZXJ0aWVzIGludG8gdGhlIHNh
bWUgZmllbGRzLiBObyByZXR1cm4gdmFsdWVzDQo+IG5lZWQgdG8gYmUgY2hlY2tlZC4NCj4gDQoN
Ckdvb2QgaWRlYSA6LSkNCg0KPiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KGR3OTc2OF9zdXBwbHlfbmFtZXMpOyBpKyspDQo+ID4gKwkJZHc5NzY4LT5zdXBwbGllc1tpXS5z
dXBwbHkgPSBkdzk3Njhfc3VwcGx5X25hbWVzW2ldOw0KPiA+ICsNCj4gPiArCXJldCA9IGRldm1f
cmVndWxhdG9yX2J1bGtfZ2V0KGRldiwgQVJSQVlfU0laRShkdzk3Njhfc3VwcGx5X25hbWVzKSwN
Cj4gPiArCQkJCSAgICAgIGR3OTc2OC0+c3VwcGxpZXMpOw0KPiA+ICsJaWYgKHJldCkgew0KPiA+
ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCByZWd1bGF0b3JzXG4iKTsNCj4gPiArCQly
ZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCS8qIEluaXRpYWxpemUgY29udHJvbHMg
Ki8NCj4gPiArCXJldCA9IGR3OTc2OF9pbml0X2NvbnRyb2xzKGR3OTc2OCk7DQo+ID4gKwlpZiAo
cmV0KQ0KPiA+ICsJCWdvdG8gZXJyX2ZyZWVfaGFuZGxlcjsNCj4gPiArDQo+ID4gKwkvKiBJbml0
aWFsaXplIHN1YmRldiAqLw0KPiA+ICsJZHc5NzY4LT5zZC5mbGFncyB8PSBWNEwyX1NVQkRFVl9G
TF9IQVNfREVWTk9ERTsNCj4gPiArCWR3OTc2OC0+c2QuaW50ZXJuYWxfb3BzID0gJmR3OTc2OF9p
bnRfb3BzOw0KPiA+ICsNCj4gPiArCXJldCA9IG1lZGlhX2VudGl0eV9wYWRzX2luaXQoJmR3OTc2
OC0+c2QuZW50aXR5LCAwLCBOVUxMKTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCWdvdG8g
ZXJyX2ZyZWVfaGFuZGxlcjsNCj4gPiArDQo+ID4gKwlkdzk3NjgtPnNkLmVudGl0eS5mdW5jdGlv
biA9IE1FRElBX0VOVF9GX0xFTlM7DQo+ID4gKw0KPiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2
KTsNCj4gPiArCWlmICghcG1fcnVudGltZV9lbmFibGVkKGRldikpIHsNCj4gPiArCQlyZXQgPSBk
dzk3NjhfcnVudGltZV9yZXN1bWUoZGV2KTsNCj4gPiArCQlpZiAocmV0IDwgMCkgew0KPiA+ICsJ
CQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBwb3dlciBvbjogJWRcbiIsIHJldCk7DQo+ID4gKwkJ
CWdvdG8gZXJyX2NsZWFuX2VudGl0eTsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJ
cmV0ID0gdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoJmR3OTc2OC0+c2QpOw0KPiA+ICsJaWYg
KHJldCA8IDApIHsNCj4gPiArCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBWNEwy
IHN1YmRldjogJWQiLCByZXQpOw0KPiA+ICsJCWdvdG8gZXJyb3JfYXN5bmNfcmVnaXN0ZXI7DQo+
ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICtlcnJvcl9hc3luY19y
ZWdpc3RlcjoNCj4gPiArCWlmICghcG1fcnVudGltZV9lbmFibGVkKGRldikpDQo+ID4gKwkJZHc5
NzY4X3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KPiA+ICtlcnJfY2xlYW5fZW50aXR5Og0KPiA+ICsJ
bWVkaWFfZW50aXR5X2NsZWFudXAoJmR3OTc2OC0+c2QuZW50aXR5KTsNCj4gPiArZXJyX2ZyZWVf
aGFuZGxlcjoNCj4gPiArCXY0bDJfY3RybF9oYW5kbGVyX2ZyZWUoJmR3OTc2OC0+Y3RybHMpOw0K
PiA+ICsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArDQoNCltzbmlwXS4uLg0KDQo=

