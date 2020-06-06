Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4439A1F0578
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 08:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgFFGpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 02:45:33 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:34087 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726384AbgFFGpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 02:45:33 -0400
X-UUID: 13effad57da045689b55f0573e9320fa-20200606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gfA1g5/tH05MT05A2pVcmlsW9osyUE+e/sPO14ohiIc=;
        b=FdbHIASZI58luSV5uFQG/XI6f4Mo/Zt52ojxLxcgoI3pP2pCk8Ig8bsqhw/fjvrXultVWX6FA6TePA1HnJr6eUBw8llRjKeVjRbwjCPC2/Lz9zFxZZOI6+9qxCUDDbIUelnvtj4ovyEZRKhotSATXA2oSWA+ZrYqPW7lbeanLH4=;
X-UUID: 13effad57da045689b55f0573e9320fa-20200606
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 173693118; Sat, 06 Jun 2020 14:45:05 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Sat, 6 Jun
 2020 14:45:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Jun 2020 14:45:02 +0800
Message-ID: <1591425778.8804.614.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
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
Date:   Sat, 6 Jun 2020 14:42:58 +0800
In-Reply-To: <20200605134440.GA20379@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
         <20200605105412.18813-3-dongchun.zhu@mediatek.com>
         <20200605134440.GA20379@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 718D582639BC52F66AD8ADFFD42A73B5B3AEAE45CD98840B3A40295878A177332000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIEZyaSwgMjAyMC0wNi0w
NSBhdCAxMzo0NCArMDAwMCwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IEhpIERvbmdjaHVuLA0KPiAN
Cj4gT24gRnJpLCBKdW4gMDUsIDIwMjAgYXQgMDY6NTQ6MTJQTSArMDgwMCwgRG9uZ2NodW4gWmh1
IHdyb3RlOg0KPiA+IEFkZCBhIFY0TDIgc3ViLWRldmljZSBkcml2ZXIgZm9yIERXOTc2OCB2b2lj
ZSBjb2lsIG1vdG9yLCBwcm92aWRpbmcNCj4gPiBjb250cm9sIHRvIHNldCB0aGUgZGVzaXJlZCBm
b2N1cyB2aWEgSUlDIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
RG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBN
QUlOVEFJTkVSUyAgICAgICAgICAgICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJj
L0tjb25maWcgIHwgIDEzICsrDQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIHwgICAx
ICsNCj4gPiAgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMgfCA1NjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNTgx
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJj
L2R3OTc2OC5jDQo+ID4gDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4gUGxlYXNlIHNl
ZSBteSBjb21tZW50cyBpbmxpbmUuDQo+IA0KPiBbc25pcF0NCj4gPiArLyoNCj4gPiArICogRFc5
NzY4IHJlcXVpcmVzIHdhaXRpbmcgdGltZSAoZGVsYXkgdGltZSkgb2YgdF9PUFIgYWZ0ZXIgcG93
ZXItdXAsDQo+ID4gKyAqIG9yIGluIHRoZSBjYXNlIG9mIFBEIHJlc2V0IHRha2luZyBwbGFjZS4N
Cj4gPiArICovDQo+ID4gKyNkZWZpbmUgRFc5NzY4X1RfT1BSX1VTCQkJCTEwMDANCj4gPiArI2Rl
ZmluZSBEVzk3NjhfVHZpYl9NU19CQVNFMTAJCQkoNjQgLSAxKQ0KPiANCj4gS2VybmVsIG1hY3Jv
IG5hbWVzIGFyZSB1cHBlcmNhc2Ugb25seS4NCj4gDQoNCkFoYS4uLiBUaGlzIGlzIGNhdXNlZCBi
eSBteSBjYXJlbGVzc25lc3MuDQpGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gW3NuaXBdDQo+
ID4gKwkvKiBTZXQgQUFDIFRpbWluZyAqLw0KPiA+ICsJaWYgKGR3OTc2OC0+YWFjX3RpbWluZyAh
PSBEVzk3NjhfQUFDX1RJTUVfREVGQVVMVCkgew0KPiA+ICsJCXJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEoY2xpZW50LCBEVzk3NjhfQUFDX1RJTUVfUkVHLA0KPiA+ICsJCQkJCQlkdzk3
NjgtPmFhY190aW1pbmcpOw0KPiA+ICsJCWlmIChyZXQgPCAwKQ0KPiA+ICsJCQlyZXR1cm4gcmV0
Ow0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCW1vdmVfZGVsYXlfdXMgPSBkdzk3NjhfY2FsX21vdmVf
ZGVsYXkoZHc5NzY4LT5hYWNfbW9kZSwNCj4gPiArCQkJCQkgICAgICBkdzk3NjgtPmNsb2NrX3By
ZXNjLA0KPiA+ICsJCQkJCSAgICAgIGR3OTc2OC0+YWFjX3RpbWluZykgLyAxMDA7DQo+IA0KPiBX
ZSBjb3VsZCBjYWxjdWxhdGUgdGhpcyBvbmNlIGluIHByb2JlKCkgYW5kIHN0b3JlIHRoZSByZWFk
eSB1cyB2YWx1ZSBpbg0KPiB0aGUgZHc5NzY4IHN0cnVjdC4NCj4gDQoNCkdyZWF0IGlkZWEgOi0p
DQpGcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZiAnbW92ZV9kZWxheV91cycgaXRzZWxmLCBpdCBkZWZp
bmVzIFZDTSBPcGVyYXRpb24NClRpbWUsIHdoaWNoIGlzIGluZGVlZCBhbiBpbnRyaW5zaWMgcGFy
YW1ldGVyIHRoYXQgYmVsb25ncyB0byBEVzk3NjgNCnByaXZhdGUgc3RydWN0dXJlLg0KDQo+ID4g
Kw0KPiA+ICsJZm9yICh2YWwgPSBkdzk3NjgtPmZvY3VzLT52YWwgJSBEVzk3NjhfTU9WRV9TVEVQ
UzsNCj4gPiArCSAgICAgdmFsIDw9IGR3OTc2OC0+Zm9jdXMtPnZhbDsNCj4gPiArCSAgICAgdmFs
ICs9IERXOTc2OF9NT1ZFX1NURVBTKSB7DQo+ID4gKwkJcmV0ID0gZHc5NzY4X3NldF9kYWMoZHc5
NzY4LCB2YWwpOw0KPiA+ICsJCWlmIChyZXQpIHsNCj4gPiArCQkJZGV2X2VycigmY2xpZW50LT5k
ZXYsICIlcyBJMkMgZmFpbHVyZTogJWQiLA0KPiA+ICsJCQkJX19mdW5jX18sIHJldCk7DQo+ID4g
KwkJCXJldHVybiByZXQ7DQo+ID4gKwkJfQ0KPiA+ICsJCXVzbGVlcF9yYW5nZShtb3ZlX2RlbGF5
X3VzLCBtb3ZlX2RlbGF5X3VzICsgMTAwMCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IDA7DQo+ID4gK30NCj4gW3NuaXBdDQo+ID4gKwlwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+
ICsJaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkgew0KPiA+ICsJCXJldCA9IGR3OTc2OF9y
dW50aW1lX3Jlc3VtZShkZXYpOw0KPiA+ICsJCWlmIChyZXQgPCAwKSB7DQo+ID4gKwkJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHBvd2VyIG9uOiAlZFxuIiwgcmV0KTsNCj4gPiArCQkJZ290byBl
cnJfY2xlYW5fZW50aXR5Ow0KPiA+ICsJCX0NCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXQgPSB2
NGwyX2FzeW5jX3JlZ2lzdGVyX3N1YmRldigmZHc5NzY4LT5zZCk7DQo+ID4gKwlpZiAocmV0IDwg
MCkgew0KPiA+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIFY0TDIgc3ViZGV2
OiAlZCIsIHJldCk7DQo+ID4gKwkJZ290byBlcnJvcl9hc3luY19yZWdpc3RlcjsNCj4gPiArCX0N
Cj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK2Vycm9yX2FzeW5jX3JlZ2lzdGVy
Og0KPiANCj4gVGhlIHJlY29tbWVuZGF0aW9uIGlzIHRvIG5hbWUgdGhlIGxhYmVscyBhZnRlciB0
aGUgY2xlYW4tdXAgdGFzayB0aGF0IG5lZWRzDQo+IHRvIGJlIGRvbmUuIFNob3VsZCB0aGlzIG9u
ZSBiZSBjYWxsZWQgZXJyb3JfcG93ZXJfb2ZmPw0KPiANCg0KVW5kZXJzdG9vZC4NCidlcnJvcl9h
c3luY19yZWdpc3Rlcicgd291bGQgYmUgcmVwbGFjZWQgb2YgJ2Vycl9wb3dlcl9vZmYnIGluIG5l
eHQNCnJlbGVhc2UuDQoNCj4gPiArCWlmICghcG1fcnVudGltZV9lbmFibGVkKGRldikpDQo+ID4g
KwkJZHc5NzY4X3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KPiANCj4gU2hvdWxkbid0IHdlIGFsc28g
Y2FsbCBwbV9ydW50aW1lX2Rpc2FibGUoKSBoZXJlPw0KPiANCg0KVGhhbmtzIGZvciB0aGUgcmVt
aW5kZXIuDQpXZSB3b3VsZCBhZGQgcG1fcnVudGltZV9kaXNhYmxlKCkgaW4gbmV4dCByZWxlYXNl
Lg0KSnVzdCBsaWtlOg0KZXJyX3Bvd2VyX29mZjoNCglwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsN
CglpZiAoIXBtX3J1bnRpbWVfZW5hYmxlZChkZXYpKQ0KCQlkdzk3NjhfcnVudGltZV9zdXNwZW5k
KGRldik7DQoNCj4gPiArZXJyX2NsZWFuX2VudGl0eToNCj4gPiArCW1lZGlhX2VudGl0eV9jbGVh
bnVwKCZkdzk3NjgtPnNkLmVudGl0eSk7DQo+ID4gK2Vycl9mcmVlX2hhbmRsZXI6DQo+ID4gKwl2
NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCZkdzk3NjgtPmN0cmxzKTsNCj4gPiArDQo+ID4gKwlyZXR1
cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IGR3OTc2OF9yZW1vdmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiArew0KPiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2
ICpzZCA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KPiA+ICsJc3RydWN0IGR3OTc2OCAq
ZHc5NzY4ID0gc2RfdG9fZHc5NzY4KHNkKTsNCj4gPiArDQo+ID4gKwl2NGwyX2FzeW5jX3VucmVn
aXN0ZXJfc3ViZGV2KCZkdzk3NjgtPnNkKTsNCj4gPiArCXY0bDJfY3RybF9oYW5kbGVyX2ZyZWUo
JmR3OTc2OC0+Y3RybHMpOw0KPiA+ICsJbWVkaWFfZW50aXR5X2NsZWFudXAoJmR3OTc2OC0+c2Qu
ZW50aXR5KTsNCj4gPiArCXBtX3J1bnRpbWVfZGlzYWJsZSgmY2xpZW50LT5kZXYpOw0KPiA+ICsJ
aWYgKCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KSkNCj4gDQo+IHBt
X3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgpIGRvZXNuJ3QgY29uc2lkZXIgdGhlIHJ1bnRpbWUg
UE0gZGlzYWJsZQ0KPiBzdGF0ZS4gVGhlcmUgaXMgYWxzbyBwbV9ydW50aW1lX3N1c3BlbmRlZCgp
IGFuZCB0aGF0IHNob3VsZCBiZSBjb3JyZWN0DQo+IGhlcmUuDQo+IA0KDQpGaXhlZCBpbiBuZXh0
IHJlbGVhc2UuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

