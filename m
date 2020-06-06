Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF7E1F0555
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 08:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgFFGVm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 02:21:42 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:23218 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725765AbgFFGVl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 02:21:41 -0400
X-UUID: cd49d117a86f4e93ab92af78f5604b0b-20200606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RAIUVuLYgVuH/CCeUhIwCgt+EzgNoHQKrfHndQk9RvY=;
        b=d8vF+8q3RA1y7ZPvnWi0P0LncAXT02q4+IoYIgo58GNQ5xhxz5ny1cPoIW1kJpqDojkACkM6A6qdQqSxD/MXW4nXuK907NuT/eYOHRJxAdeuPke3/9L5JE2AmZR5ToZjtROknc3Es4/2pP2tSlOuCEytggIV7zx5liNuzJx3DlE=;
X-UUID: cd49d117a86f4e93ab92af78f5604b0b-20200606
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1469761171; Sat, 06 Jun 2020 14:21:29 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 6 Jun
 2020 14:21:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Jun 2020 14:21:23 +0800
Message-ID: <1591424358.8804.599.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Sat, 6 Jun 2020 14:19:18 +0800
In-Reply-To: <20200605124643.GG2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
         <20200605105412.18813-3-dongchun.zhu@mediatek.com>
         <20200605124643.GG2428291@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 935CFC8C3612F8EF46331B0CFDC7ACBCD9C86D19164ACD1A99FF20AA7B28C4202000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBNeSByZXBsaWVzIGFyZSBhcyBiZWxv
dy4NCg0KT24gRnJpLCAyMDIwLTA2LTA1IGF0IDE1OjQ2ICswMzAwLCBBbmR5IFNoZXZjaGVua28g
d3JvdGU6DQo+IE9uIEZyaSwgSnVuIDA1LCAyMDIwIGF0IDA2OjU0OjEyUE0gKzA4MDAsIERvbmdj
aHVuIFpodSB3cm90ZToNCj4gPiBBZGQgYSBWNEwyIHN1Yi1kZXZpY2UgZHJpdmVyIGZvciBEVzk3
Njggdm9pY2UgY29pbCBtb3RvciwgcHJvdmlkaW5nDQo+ID4gY29udHJvbCB0byBzZXQgdGhlIGRl
c2lyZWQgZm9jdXMgdmlhIElJQyBzZXJpYWwgaW50ZXJmYWNlLg0KPiANCj4gLi4uDQo+IA0KPiA+
ICtjb25maWcgVklERU9fRFc5NzY4DQo+ID4gKwl0cmlzdGF0ZSAiRFc5NzY4IGxlbnMgdm9pY2Ug
Y29pbCBzdXBwb3J0Ig0KPiA+ICsJZGVwZW5kcyBvbiBJMkMgJiYgVklERU9fVjRMMg0KPiANCj4g
Tm8gY29tcGlsZSB0ZXN0Pw0KPiANCg0KU29ycnk/DQpLY29uZmlnIGhlcmUgaXMgYmFzZWQgb24g
dGhlIGN1cnJlbnQgbWVkaWEgdHJlZSBtYXN0ZXIgYnJhbmNoLg0KSXQgaXMgYWxzbyB3aGF0IHRo
ZSBvdGhlciBzaW1pbGFyIGRyaXZlcnMgZnJvbSBEb25nd29vbiBkby4gDQoNCj4gPiArCWRlcGVu
ZHMgb24gUE0NCj4gDQo+IFRoaXMgaXMgdmVyeSBzdHJhbmdlIGRlcGVuZGVuY3kgZm9yIG9yZGlu
YXJ5IGRyaXZlci4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLg0KVGhpcyB3b3VsZCBi
ZSByZW1vdmVkIGluIG5leHQgcmVsZWFzZS4NCkFzIGR3OTc2OF9ydW50aW1lX3Jlc3VtZS9zdXNw
ZW5kIHdvdWxkIGJlIGNhbGxlZCBpZiBydW50aW1lIFBNIGlzDQpkaXNhYmxlZC4NCg0KPiA+ICsJ
c2VsZWN0IE1FRElBX0NPTlRST0xMRVINCj4gPiArCXNlbGVjdCBWSURFT19WNEwyX1NVQkRFVl9B
UEkNCj4gPiArCXNlbGVjdCBWNEwyX0ZXTk9ERQ0KPiANCj4gLi4uDQo+IA0KPiA+ICsvKg0KPiA+
ICsgKiBEVzk3NjggcmVxdWlyZXMgd2FpdGluZyB0aW1lIChkZWxheSB0aW1lKSBvZiB0X09QUiBh
ZnRlciBwb3dlci11cCwNCj4gPiArICogb3IgaW4gdGhlIGNhc2Ugb2YgUEQgcmVzZXQgdGFraW5n
IHBsYWNlLg0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBEVzk3NjhfVF9PUFJfVVMJCQkJMTAwMA0K
PiA+ICsjZGVmaW5lIERXOTc2OF9UdmliX01TX0JBU0UxMAkJCSg2NCAtIDEpDQo+ID4gKyNkZWZp
bmUgRFc5NzY4X0FBQ19NT0RFX0RFRkFVTFQJCQkyDQo+IA0KPiA+ICsjZGVmaW5lIERXOTc2OF9B
QUNfVElNRV9ERUZBVUxUCQkJMHgyMA0KPiANCj4gSGV4PyBXaHkgbm90IGRlY2ltYWw/DQo+IA0K
DQpUaGVyZSBpcyBvbmUgb3B0aW9uYWwgcHJvcGVydHkgJ2Rvbmd3b29uLGFhYy10aW1pbmcnIGRl
ZmluZWQgaW4gRFQuDQpJIGRvbid0IGtub3cgd2hldGhlciB5b3UgaGF2ZSBub3RpY2VkIHRoYXQu
DQoNCidEVzk3NjhfQUFDX1RJTUVfREVGQVVMVCcgaXMgdGhlIHZhbHVlIHNldCB0byBBQUNUWzU6
MF0gcmVnaXN0ZXIuDQpJIHRob3VnaHQgdGhlIEhleCB1bml0IHNob3VsZCBiZSBwcm9wZXIgYXMg
aXQgaXMgZGlyZWN0bHkgd3JpdHRlbiB0byB0aGUNCkhleCByZWdpc3Rlci4NCg0KPiA+ICsjZGVm
aW5lIERXOTc2OF9DTE9DS19QUkVfU0NBTEVfREVGQVVMVAkJMQ0KPiANCj4gLi4uDQo+IA0KPiA+
ICtzdGF0aWMgaW50IGR3OTc2OF9tb2RfcmVnKHN0cnVjdCBkdzk3NjggKmR3OTc2OCwgdTggcmVn
LCB1OCBtYXNrLCB1OCB2YWwpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQgPSB2NGwyX2dldF9zdWJkZXZkYXRhKCZkdzk3NjgtPnNkKTsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgcmVnKTsN
Cj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiANCj4gPiAr
CXZhbCA9ICgodW5zaWduZWQgY2hhcilyZXQgJiB+bWFzaykgfCAodmFsICYgbWFzayk7DQo+IA0K
PiBUaGlzIGNhc3QgaXMgd2VpcmQuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcsIGJ1dCB0
aGlzIGNhc3QgaXMgdXNpbmcgY2xhc3NpY2FsIHBhdHRlcm4gZnJvbQ0KeW91ciBzdWdnZXN0aW9u
IG9uIE9WMDJBMTAgdjU6DQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRjaC81OTc4
OC8NCg0KU28gSSB3b25kZXIgd2hldGhlciBpdCBpcyBzdGlsbCByZXF1aXJlZCB0byBiZSByZWZp
bmVkIGN1cnJlbnRseS4NCk9yIHdoYXQgd291bGQgaXQgYmUgc3VwcG9zZWQgdG8gZG8gZm9yIHRo
ZSBjYXN0Pw0KDQo+ID4gKw0KPiA+ICsJcmV0dXJuIGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEo
Y2xpZW50LCByZWcsIHZhbCk7DQo+ID4gK30NCj4gDQo+IC4uLg0KPiANCj4gPiArCQkJZGV2X2Vy
cigmY2xpZW50LT5kZXYsICIlcyBJMkMgZmFpbHVyZTogJWQiLA0KPiA+ICsJCQkJX19mdW5jX18s
IHJldCk7DQo+IA0KPiBPbmUgbGluZT8NCj4gDQoNClNwbGl0dGluZyB0aGUgc2VudGVuY2UgaW50
byB0d28gbGluZXMgb3Igbm90IHNob3VsZCBib3RoIGJlIG9rYXkuDQpPZiBjb3Vyc2UsIEkgY291
bGQgcHV0IHRoZW0gaW4gb25lIGxpbmUgaW4gbmV4dCByZWxlYXNlLg0KDQo+IC4uLg0KPiANCj4g
PiArc3RhdGljIGludCBkdzk3NjhfcmVsZWFzZShzdHJ1Y3QgZHc5NzY4ICpkdzk3NjgpDQo+ID4g
K3sNCj4gPiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJkZXZkYXRh
KCZkdzk3NjgtPnNkKTsNCj4gPiArCXUzMiBtb3ZlX2RlbGF5X3VzID0gZHc5NzY4X2NhbF9tb3Zl
X2RlbGF5KGR3OTc2OC0+YWFjX21vZGUsDQo+ID4gKwkJCQkJCSAgZHc5NzY4LT5jbG9ja19wcmVz
YywNCj4gPiArCQkJCQkJICBkdzk3NjgtPmFhY190aW1pbmcpIC8gMTAwOw0KPiA+ICsJaW50IHJl
dCwgdmFsOw0KPiA+ICsNCj4gPiArCXZhbCA9IHJvdW5kX2Rvd24oZHc5NzY4LT5mb2N1cy0+dmFs
LCBEVzk3NjhfTU9WRV9TVEVQUyk7DQo+ID4gKwlmb3IgKCA7IHZhbCA+PSAwOyB2YWwgLT0gRFc5
NzY4X01PVkVfU1RFUFMpIHsNCj4gPiArCQlyZXQgPSBkdzk3Njhfc2V0X2RhYyhkdzk3NjgsIHZh
bCk7DQo+ID4gKwkJaWYgKHJldCkgew0KPiA+ICsJCQlkZXZfZXJyKCZjbGllbnQtPmRldiwgIkky
QyB3cml0ZSBmYWlsOiAlZCIsIHJldCk7DQo+ID4gKwkJCXJldHVybiByZXQ7DQo+ID4gKwkJfQ0K
PiA+ICsJCXVzbGVlcF9yYW5nZShtb3ZlX2RlbGF5X3VzLCBtb3ZlX2RlbGF5X3VzICsgMTAwMCk7
DQo+ID4gKwl9DQo+IA0KPiANCj4gSXQgd2lsbCBsb29rIG1vcmUgbmF0dXJhbGx5IGluIHRoZSBt
dWx0aXBsaWVyIGtpbmQgb2YgdmFsdWUuDQo+IA0KPiAJdW5zaWduZWQgaW50IHN0ZXBzID0gRElW
X1JPVU5EX1VQKC4uLik7DQo+IA0KPiAJd2hpbGUgKHN0ZXBzLS0pIHsNCj4gCQkuLi4oLi4uLCBz
dGVwcyAqIC4uLl9NT1ZFX1NURVBTKTsNCj4gCQkuLi4NCj4gCX0NCj4gDQo+IGJ1dCBkb3VibGUg
Y2hlY2sgYXJpdGhtZXRpY3MuDQo+IA0KDQpUaGUgY3VycmVudCBjb2Rpbmcgc3R5bGUgaXMgYWN0
dWFsbHkgdXBkYXRlZCB3aXRoIHJlZmVyZW5jZSB0byB5b3VyDQpwcmV2aW91cyBjb21tZW50cyBv
biBEVzk3NjggdjM6DQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRjaC82MTg1Ni8N
Cg0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+IA0KPiBBbHNvIGl0IHNlZW1zIHdlIG5l
ZWQgdG8gaGF2ZSB3cml0ZXhfcG9sbF90aW1lb3V0KCkgaW1wbGVtZW50YXRpb24gKHNlZQ0KPiBp
b3BvbGwuaCkuDQo+IA0KDQo=

