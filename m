Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E1A43F557
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 05:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhJ2D2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 23:28:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:52842 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231617AbhJ2D1s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 23:27:48 -0400
X-UUID: 89590e3dd02041abade32d94539f5899-20211029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xAZ3nAnsOrl8Ct8D2Vi4hu3IaxpDjpE6ODDFPn66SOM=;
        b=NuouUxrbI7ngrTBRUGkMvAZ6GV17ls9AQH/NYdPPHWs24q5ZjVozKS4b8b+c3S7qItB+M1u7UNeQUSgFQ0VkzNOk+NRetVcBN7dz52NoPiOEWtYZNc+rNgIVCTTU2ZiiAXAOqESj3Js2+fTwPtrQ5ocHrn8/+C2XF9ld0wiI+qk=;
X-UUID: 89590e3dd02041abade32d94539f5899-20211029
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 606793645; Fri, 29 Oct 2021 11:25:15 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 29 Oct 2021 11:25:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Oct 2021 11:25:12 +0800
Message-ID: <31ec034a50949e5859fc10bf8e0dfacdb0b6bd50.camel@mediatek.com>
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Fri, 29 Oct 2021 11:25:12 +0800
In-Reply-To: <YWgitrqT9sWyELpr@fedora>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
         <20211011070247.792-12-yunfei.dong@mediatek.com> <YWgitrqT9sWyELpr@fedora>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCiAgIDEuIFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gVGh1
LCAyMDIxLTEwLTE0IGF0IDA5OjI5IC0wMzAwLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6DQo+IEhp
IFl1bmZlaSwNCj4gDQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDAzOjAyOjQzUE0gKzA4MDAs
IFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+IENvcmUgdGhyZWFkOg0KPiA+IDEuIEdldHMgbGF0X2J1
ZiBmcm9tIGNvcmUgbXNnIHF1ZXVlLg0KPiA+IDIuIFByb2NlZWRzIGNvcmUgZGVjb2RlLg0KPiA+
IDMuIFB1dHMgdGhlIGxhdF9idWYgYmFjayB0byBsYXQgbXNnIHF1ZXVlLg0KPiA+IA0KPiA+IEJv
dGggSDI2NCBhbmQgVlA5IHJlbHkgb24gdGhlIGNvcmUgdGhyZWFkLg0KPiA+IA0KPiANCj4gQXZv
aWQgdGhlIGt0aHJlYWQgQVBJIGFuZCBpbnN0ZWFkIGdvIHdpdGggdGhlIHdvcmtxdWV1ZSBBUEku
DQo+IA0KPiBTZWUgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS93b3JrcXVldWUucnN0IGFuZA0KPiBp
bmNsdWRlL2xpbnV4L3dvcmtxdWV1ZS5oLg0KPiANCkZpeCBpdCBpbiBwYXRjaCB2OC4NCj4gVGhh
bmtzIQ0KPiBFemVxdWllbA0KPiANClRoYW5rcw0KWXVuZmVpIERvbmcNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+
ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyAgfCAxMiArKysr
KysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmggICAgICB8
ICA3ICsrKysNCj4gPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvdmRlY19tc2dfcXVldWUuYyAg
ICAgIHwgMzINCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9wbGF0Zm9ybS9tdGst
dmNvZGVjL3ZkZWNfbXNnX3F1ZXVlLmggICAgICB8ICA2ICsrKysNCj4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCA1NyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYyANCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+IGlu
ZGV4IGUyMWUwYzRiY2Q4Ni4uZGU4M2UzYjgyMWI0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19kcnYuYw0K
PiA+IEBAIC0zNjQsNiArMzY0LDE4IEBAIHN0YXRpYyBpbnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1
Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAkJZ290byBlcnJfZGVjX3BtOw0K
PiA+ICAJfQ0KPiA+ICANCj4gPiArCWlmIChWREVDX0xBVF9BUkNIKGRldi0+dmRlY19wZGF0YS0+
aHdfYXJjaCkpIHsNCj4gPiArCQl2ZGVjX21zZ19xdWV1ZV9pbml0X2N0eCgmZGV2LT5tc2dfcXVl
dWVfY29yZV9jdHgsDQo+ID4gKwkJCU1US19WREVDX0NPUkUpOw0KPiA+ICsJCWRldi0+a3RocmVh
ZF9jb3JlID0NCj4gPiBrdGhyZWFkX3J1bih2ZGVjX21zZ19xdWV1ZV9jb3JlX3RoZWFkLCBkZXYs
DQo+ID4gKwkJCSJtdGstJXMiLCAiY29yZSIpOw0KPiA+ICsJCWlmIChJU19FUlIoZGV2LT5rdGhy
ZWFkX2NvcmUpKSB7DQo+ID4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBjcmVh
dGUgY29yZQ0KPiA+IHRocmVhZCIpOw0KPiA+ICsJCQlyZXQgPSBQVFJfRVJSKGRldi0+a3RocmVh
ZF9jb3JlKTsNCj4gPiArCQkJZ290byBlcnJfcmVzOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiAr
DQo+ID4gIAlmb3IgKGkgPSAwOyBpIDwgTVRLX1ZERUNfSFdfTUFYOyBpKyspDQo+ID4gIAkJbXV0
ZXhfaW5pdCgmZGV2LT5kZWNfbXV0ZXhbaV0pOw0KPiA+ICAJc3Bpbl9sb2NrX2luaXQoJmRldi0+
aXJxbG9jayk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiA+IGluZGV4IDlkMDcyYzA4MmY3My4uNjhhOWIxYTJk
M2IzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9t
dGtfdmNvZGVjX2Rydi5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL210a192Y29kZWNfZHJ2LmgNCj4gPiBAQCAtMjcsNiArMjcsNyBAQA0KPiA+ICAjZGVmaW5l
IE1US19WQ09ERUNfTUFYX1BMQU5FUwkzDQo+ID4gICNkZWZpbmUgTVRLX1Y0TDJfQkVOQ0hNQVJL
CTANCj4gPiAgI2RlZmluZSBXQUlUX0lOVFJfVElNRU9VVF9NUwkxMDAwDQo+ID4gKyNkZWZpbmUg
VkRFQ19MQVRfQVJDSChod19hcmNoKSAoKGh3X2FyY2gpID49DQo+ID4gTVRLX1ZERUNfTEFUX1NJ
TkdMRV9DT1JFKQ0KPiA+ICANCj4gPiAgLyoNCj4gPiAgICogZW51bSBtdGtfaHdfcmVnX2lkeCAt
IE1USyBodyByZWdpc3RlciBiYXNlIGluZGV4DQo+ID4gQEAgLTQ2Niw2ICs0NjcsOSBAQCBzdHJ1
Y3QgbXRrX3Zjb2RlY19lbmNfcGRhdGEgew0KPiA+ICAgKiBAY29tcF9kZXY6IGNvbXBvbmVudCBo
YXJkd2FyZSBkZXZpY2UNCj4gPiAgICogQGNvbXBvbmVudF9ub2RlOiBjb21wb25lbnQgbm9kZQ0K
PiA+ICAgKg0KPiA+ICsgKiBAa3RocmVhZF9jb3JlOiB0aHJlYWQgdXNlZCBmb3IgY29yZSBoYXJk
d2FyZSBkZWNvZGUNCj4gPiArICogQG1zZ19xdWV1ZV9jb3JlX2N0eDogbXNnIHF1ZXVlIGNvbnRl
eHQgdXNlZCBmb3IgY29yZSB0aHJlYWQNCj4gPiArICoNCj4gPiAgICogQGhhcmR3YXJlX2JpdG1h
cDogdXNlZCB0byByZWNvcmQgaGFyZHdhcmUgaXMgcmVhZHkgb3Igbm90DQo+ID4gICAqLw0KPiA+
ICBzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgew0KPiA+IEBAIC01MDgsNiArNTEyLDkgQEAgc3RydWN0
IG10a192Y29kZWNfZGV2IHsNCj4gPiAgCXZvaWQgKmNvbXBfZGV2W01US19WREVDX0hXX01BWF07
DQo+ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNvbXBvbmVudF9ub2RlW01US19WREVDX0hXX01B
WF07DQo+ID4gIA0KPiA+ICsJc3RydWN0IHRhc2tfc3RydWN0ICprdGhyZWFkX2NvcmU7DQo+ID4g
KwlzdHJ1Y3QgdmRlY19tc2dfcXVldWVfY3R4IG1zZ19xdWV1ZV9jb3JlX2N0eDsNCj4gPiArDQo+
ID4gIAlERUNMQVJFX0JJVE1BUChoYXJkd2FyZV9iaXRtYXAsIE1US19WREVDX0hXX01BWCk7DQo+
ID4gIH07DQo+ID4gIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvdmRlY19tc2dfcXVldWUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL3ZkZWNfbXNnX3F1ZXVlLmMNCj4gPiBpbmRleCBkNjZlZDk4Yzc5YTkuLjY2NWY1
NzFlYWI0YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvdmRlY19tc2dfcXVldWUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy92ZGVjX21zZ19xdWV1ZS5jDQo+ID4gQEAgLTI1NiwzICsyNTYsMzUgQEAgdm9pZCB2
ZGVjX21zZ19xdWV1ZV9kZWluaXQoDQo+ID4gIAkJCWtmcmVlKGxhdF9idWYtPnByaXZhdGVfZGF0
YSk7DQo+ID4gIAl9DQo+ID4gIH0NCj4gPiArDQo+ID4gK2ludCB2ZGVjX21zZ19xdWV1ZV9jb3Jl
X3RoZWFkKHZvaWQgKmRhdGEpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfdmNvZGVjX2RldiAq
ZGV2ID0gZGF0YTsNCj4gPiArCXN0cnVjdCB2ZGVjX2xhdF9idWYgKmxhdF9idWY7DQo+ID4gKwlz
dHJ1Y3QgbXRrX3Zjb2RlY19jdHggKmN0eDsNCj4gPiArDQo+ID4gKwlzZXRfZnJlZXphYmxlKCk7
DQo+ID4gKwlmb3IgKDs7KSB7DQo+ID4gKwkJdHJ5X3RvX2ZyZWV6ZSgpOw0KPiA+ICsJCWlmIChr
dGhyZWFkX3Nob3VsZF9zdG9wKCkpDQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQlsYXRf
YnVmID0gdmRlY19tc2dfcXVldWVfZHFidWYoJmRldi0NCj4gPiA+bXNnX3F1ZXVlX2NvcmVfY3R4
KTsNCj4gPiArCQlpZiAoIWxhdF9idWYpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsNCj4gPiAr
CQljdHggPSBsYXRfYnVmLT5jdHg7DQo+ID4gKwkJbXRrX3Zjb2RlY19zZXRfY3Vycl9jdHgoZGV2
LCBjdHgsIE1US19WREVDX0NPUkUpOw0KPiA+ICsNCj4gPiArCQlpZiAoIWxhdF9idWYtPmNvcmVf
ZGVjb2RlKQ0KPiA+ICsJCQltdGtfdjRsMl9lcnIoIkNvcmUgZGVjb2RlIGNhbGxiYWNrIGZ1bmMg
aXMNCj4gPiBOVUxMIik7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQlsYXRfYnVmLT5jb3JlX2RlY29k
ZShsYXRfYnVmKTsNCj4gPiArDQo+ID4gKwkJbXRrX3Zjb2RlY19zZXRfY3Vycl9jdHgoZGV2LCBO
VUxMLCBNVEtfVkRFQ19DT1JFKTsNCj4gPiArCQl2ZGVjX21zZ19xdWV1ZV9xYnVmKCZjdHgtPm1z
Z19xdWV1ZS5sYXRfY3R4LCBsYXRfYnVmKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwltdGtfdjRs
Ml9kZWJ1ZygzLCAiVmlkZW8gQ2FwdHVyZSBUaHJlYWQgRW5kIik7DQo+ID4gKwlyZXR1cm4gMDsN
Cj4gPiArfQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvdmRlY19tc2dfcXVldWUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL3ZkZWNfbXNnX3F1ZXVlLmgNCj4gPiBpbmRleCAxOTA1Y2U3MTM1OTIuLmI1NzQ1YjE0NDE0
MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRl
Y19tc2dfcXVldWUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy92ZGVjX21zZ19xdWV1ZS5oDQo+ID4gQEAgLTE0OCw0ICsxNDgsMTAgQEAgdm9pZCB2ZGVjX21z
Z19xdWV1ZV9kZWluaXQoDQo+ID4gIAlzdHJ1Y3QgdmRlY19tc2dfcXVldWUgKm1zZ19xdWV1ZSwN
Cj4gPiAgCXN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4KTsNCj4gPiAgDQo+ID4gKy8qKg0KPiA+
ICsgKiB2ZGVjX21zZ19xdWV1ZV9jb3JlX3RoZWFkIC0gdXNlZCBmb3IgY29yZSBkZWNvZGVyLg0K
PiA+ICsgKiBAZGF0YTogcHJpdmF0ZSBkYXRhIHVzZWQgZm9yIGVhY2ggY29kZWMNCj4gPiArICov
DQo+ID4gK2ludCB2ZGVjX21zZ19xdWV1ZV9jb3JlX3RoZWFkKHZvaWQgKmRhdGEpOw0KPiA+ICsN
Cj4gPiAgI2VuZGlmDQo+ID4gLS0gDQo+ID4gMi4yNS4xDQo+ID4gDQo=

