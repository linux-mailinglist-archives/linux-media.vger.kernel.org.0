Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAFD1F7601
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgFLJdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 05:33:35 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:19383 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726302AbgFLJdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 05:33:35 -0400
X-UUID: 27ebc8bef3cb4d3fa583f2a97f5f6f36-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BaLcuqfyqtgeka1QHj6hfdc3DlQV6DK0+EkHYH3N9E4=;
        b=gOwIYaHePzXcPux/R9Q9VBLs8dw4CX5n6FAPbwrcuzFvAVLoPCEOpJZN82SkEv1aVe4VyninPOFcF7O64hGq6R24ZcYl8DL0hKBaozEJ8jMa6pSioLHGMU1YIrUrh5/5mcQ9P+mY2cNEfIzXklAu4dxgNt/Fm0SDPVYF5Cl25jU=;
X-UUID: 27ebc8bef3cb4d3fa583f2a97f5f6f36-20200612
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1386208769; Fri, 12 Jun 2020 17:33:25 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Jun
 2020 17:33:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 17:33:22 +0800
Message-ID: <1591954266.8804.646.camel@mhfsdcap03>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
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
Date:   Fri, 12 Jun 2020 17:31:06 +0800
In-Reply-To: <20200610183600.GI201868@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
         <20200509080627.23222-3-dongchun.zhu@mediatek.com>
         <20200521193204.GA14214@chromium.org>
         <1590209415.8804.431.camel@mhfsdcap03>
         <20200610183600.GI201868@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D560A70DAB39B39E17459FE12DB960DD38080384D408DDDBB17C727BB4A53AF72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBXZWQsIDIwMjAtMDYtMTAgYXQgMTg6MzYgKzAwMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBTYXQsIE1heSAyMywgMjAyMCBhdCAxMjo1MDoxNVBNICswODAwLCBE
b25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgVG9tYXN6LA0KPiA+IA0KPiA+IFRoYW5rcyBmb3Ig
dGhlIHJldmlldy4gTXkgcmVwbGllcyBhcmUgYXMgYmVsb3cuDQo+ID4gDQo+ID4gT24gVGh1LCAy
MDIwLTA1LTIxIGF0IDE5OjMyICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+IEhpIERv
bmdjaHVuLA0KPiA+ID4gDQo+ID4gPiBPbiBTYXQsIE1heSAwOSwgMjAyMCBhdCAwNDowNjoyN1BN
ICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+IFtzbmlwXQ0KPiA+ID4gPiArew0KPiA+ID4g
PiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7DQo+ID4g
PiA+ICsJc3RydWN0IHY0bDJfc3ViZGV2ICpzZCA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQp
Ow0KPiA+ID4gPiArCXN0cnVjdCBvdjAyYTEwICpvdjAyYTEwID0gdG9fb3YwMmExMChzZCk7DQo+
ID4gPiA+ICsJaW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWdwaW9kX3NldF92YWx1ZV9j
YW5zbGVlcChvdjAyYTEwLT5uX3JzdF9ncGlvLCAwKTsNCj4gPiA+ID4gKwlncGlvZF9zZXRfdmFs
dWVfY2Fuc2xlZXAob3YwMmExMC0+cGRfZ3BpbywgMCk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwly
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUob3YwMmExMC0+ZWNsayk7DQo+ID4gPiA+ICsJaWYgKHJl
dCA8IDApIHsNCj4gPiA+ID4gKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIGVjbGtc
biIpOw0KPiA+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArCX0NCj4gPiA+ID4gKw0KPiA+
ID4gPiArCXJldCA9IHJlZ3VsYXRvcl9idWxrX2VuYWJsZShPVjAyQTEwX05VTV9TVVBQTElFUywg
b3YwMmExMC0+c3VwcGxpZXMpOw0KPiA+ID4gPiArCWlmIChyZXQgPCAwKSB7DQo+ID4gPiA+ICsJ
CWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSByZWd1bGF0b3JzXG4iKTsNCj4gPiA+ID4g
KwkJZ290byBkaXNhYmxlX2NsazsNCj4gPiA+ID4gKwl9DQo+ID4gPiA+ICsJdXNsZWVwX3Jhbmdl
KDUwMDAsIDYwMDApOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNs
ZWVwKG92MDJhMTAtPnBkX2dwaW8sIDEpOw0KPiA+ID4gDQo+ID4gPiBUaGlzIGlzIGEgInBvd2Vy
ZG93biIgR1BJTy4gSXQgbXVzdCBiZSBzZXQgdG8gMCBpZiB0aGUgc2Vuc29yIGlzIHRvIGJlDQo+
ID4gPiBwb3dlcmVkIG9uLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIHZhbHVlIHNldCBieSBncGlv
ZF9zZXRfdmFsdWVfY2Fuc2xlZXAoKSBBUEkgYWN0dWFsbHkgZGVwZW5kcyB1cG9uDQo+ID4gR1BJ
TyBwb2xhcml0eSBkZWZpbmVkIGluIERULg0KPiA+IFNpbmNlIEkgc2V0IEdQSU9fQUNUSVZFX0xP
VyB0byBwb3dlcmRvd24sDQo+ID4gZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGdwaW9fZGVzYywg
dmFsdWUpIHdvdWxkIHNldCAhdmFsdWUgdG8NCj4gPiBncGlvX2Rlc2MuDQo+ID4gVGh1cyBoZXJl
IHBvd2VyZG93biB3b3VsZCBiZSBsb3ctc3RhdGUgd2hlbiBzZW5zb3IgaXMgcG93ZXJlZCBvbi4N
Cj4gPiBGb3IgR1BJTyBwb2xhcml0eSwgSSBhbHNvIHBvc3QgYSBjb21tZW50IHRvIHRoZSBiaW5k
aW5nIHBhdGNoLg0KPiA+DQo+IA0KPiBUaGF0J3MgdHJ1ZS4gSG93ZXZlciwgdGhpcyBtYWtlcyB0
aGUgZHJpdmVyIHJlYWxseSBjb25mdXNpbmcuIElmIHNvbWVvbmUNCj4gcmVhZHMgdGhpcyBjb2Rl
IGFuZCBjb21wYXJlcyB3aXRoIHRoZSBkYXRhc2hlZXQsIGl0IGxvb2tzIGluY29ycmVjdCwNCj4g
YmVjYXVzZSBpbiB0aGUgZGF0YXNoZWV0IHRoZSBwb3dlcmRvd24gR1BJTyBuZWVkcyB0byBiZSBj
b25maWd1cmVkIGxvdw0KPiBmb3IgdGhlIHNlbnNvciB0byBvcGVyYXRlLg0KPiANCj4gSSdkIHJl
Y29tbWVuZCBkZWZpbmluZyB0aGUgYmluZGluZyBpbiBhIHdheSB0aGF0IG1ha2VzIGl0IGNsZWFy
IGluIHRoZSBkcml2ZXIgY29kZQ0KPiB0aGF0IGl0IGltcGxlbWVudGVzIHRoZSBwb3dlciBzZXF1
ZW5jaW5nIGFzIHBlciB0aGUgZGF0YXNoZWV0Lg0KPiANCg0KVWgtaHVoLi4uDQpCdXQgaXQgYWxs
IGRlcGVuZHMgb24gaG93IHdlIGxvb2sgYXQgdGhlIHBvd2VyZG93biBHUElPLg0KT3Igd2hlcmUg
c2hvdWxkIHdlIGRlZmluZSB0aGUgYWN0aXZlIGxvdyBvciBhY3RpdmUgaGlnaCwgdGhlIGRyaXZl
ciBvcg0KRFQ/DQoNCk15IGluaXRpYWwgaWRlYSBpcyB1c2luZyBEVCBHUElPIHBvbGFyaXR5IHRv
IGRlc2NyaWJlIHNlbnNvciBhY3RpdmUNCnBvbGFyaXR5IGFjY29yZGluZyB0byB0aGUgZGF0YXNo
ZWV0Lg0KQXMgYW4gYWN0aXZlIGxvdyBzaHV0ZG93biBzaWduYWwgaXMgZXF1aXZhbGVudCB0byBh
biBhY3RpdmUgaGlnaCBlbmFibGUNCnNpZ25hbC4NCg0KPiBbc25pcF0NCj4gPiA+ID4gKy8qDQo+
ID4gPiA+ICsgKiBvdjAyYTEwX3NldF9leHBvc3VyZSAtIEZ1bmN0aW9uIGNhbGxlZCB3aGVuIHNl
dHRpbmcgZXhwb3N1cmUgdGltZQ0KPiA+ID4gPiArICogQHByaXY6IFBvaW50ZXIgdG8gZGV2aWNl
IHN0cnVjdHVyZQ0KPiA+ID4gPiArICogQHZhbDogVmFyaWFibGUgZm9yIGV4cG9zdXJlIHRpbWUs
IGluIHRoZSB1bml0IG9mIG1pY3JvLXNlY29uZA0KPiA+ID4gPiArICoNCj4gPiA+ID4gKyAqIFNl
dCBleHBvc3VyZSB0aW1lIGJhc2VkIG9uIGlucHV0IHZhbHVlLg0KPiA+ID4gPiArICoNCj4gPiA+
ID4gKyAqIFJldHVybjogMCBvbiBzdWNjZXNzDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gK3N0YXRp
YyBpbnQgb3YwMmExMF9zZXRfZXhwb3N1cmUoc3RydWN0IG92MDJhMTAgKm92MDJhMTAsIGludCB2
YWwpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IHY0
bDJfZ2V0X3N1YmRldmRhdGEoJm92MDJhMTAtPnN1YmRldik7DQo+ID4gPiA+ICsJaW50IHJldDsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xp
ZW50LCBSRUdfUEFHRV9TV0lUQ0gsIFJFR19FTkFCTEUpOw0KPiA+ID4gPiArCWlmIChyZXQgPCAw
KQ0KPiA+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gDQo+ID4gPiBIb3cgZG9lcyB0aGlzIHBh
Z2Ugc3dpdGNoIHdvcms/IEFjY29yZGluZyB0byB0aGUgZG9jdW1lbnRhdGlvbiBJIGhhdmUsIHRo
ZQ0KPiA+ID4gcmVnaXN0ZXIgYWxsb3dzIHNlbGVjdGluZyBiZXR3ZWVuIGEgZmV3IGRpZmZlcmVu
dCBwYWdlcy4gSG93ZXZlciwgdGhlcmUNCj4gPiA+IHNob3VsZCBiZSB0d28gcGFnZSBwb2ludGVy
cyAtIG9uZSBmb3IgdGhlIEFQIGFuZCB0aGUgb3RoZXIgZm9yIHRoZSBzZW5zb3IsDQo+ID4gPiBz
byB0aGF0IHdoZW4gdGhlIEFQIGlzIHByb2dyYW1taW5nIHBhZ2UgWCwgdGhlIHNlbnNvciBjYW4g
aGF2ZSBjb25zaXN0ZW50DQo+ID4gPiBzZXR0aW5ncyBmcm9tIHBhZ2UgWS4gQnV0IGhlcmUgd2Ug
b25seSBzZXQgb25lIHJlZ2lzdGVyIGFuZCBhbHdheXMgd2l0aA0KPiA+ID4gcGFnZSAxLg0KPiA+
ID4gDQo+ID4gDQo+ID4gVGhhbmtzIGZvciB0aGUgY2FyZWZ1bGx5IG9ic2VydmF0aW9uLg0KPiA+
IFRoZSBzdHlsZSBvciByZXF1aXJlbWVudCBvZiByZWdpc3RlciBzZXR0aW5nIGhlcmUgaXMgc3Vn
Z2VzdGVkIGJ5IE9WDQo+ID4gdmVuZG9yLg0KPiA+IEZyb20gaGFyZHdhcmUgc2lnbmFsIGJlaGF2
aW9yIGFuZCBlZmZlY3QtdGVzdCwgdGhpcyBzZXR0aW5nIHNob3VsZCBiZQ0KPiA+IHJpZ2h0Lg0K
PiA+IEJ1dCBmb3IgeW91ciBjb25jZXJuLCB3ZSBjYW4gYWxzbyBkaWcgaW50byBpdCB3aXRoIE9W
Lg0KPiA+IExldCdzIGhhdmUgdGltZSB0byB0YWxrIHdpdGggT1YuDQo+ID4gDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgT1YwMkEx
MF9SRUdfRVhQT1NVUkVfSCwNCj4gPiA+ID4gKwkJCQkJdmFsID4+IE9WMDJBMTBfRVhQX1NISUZU
KTsNCj4gPiA+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBP
VjAyQTEwX1JFR19FWFBPU1VSRV9MLCB2YWwpOw0KPiA+ID4gPiArCWlmIChyZXQgPCAwKQ0KPiA+
ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIGkyY19zbWJ1
c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBSRUdfR0xPQkFMX0VGRkVDVElWRSwNCj4gPiA+ID4g
KwkJCQkJIFJFR19FTkFCTEUpOw0KPiA+ID4gDQo+ID4gPiBUaGlzIHBhdGNoIGRlZmluZXMgUkVH
X0dMT0JBTF9FRkZFQ1RJVkUgdG8gMHgwMS4gSSBkb24ndCBzZWUgc3VjaCByZWdpc3Rlcg0KPiA+
ID4gbWVudGlvbmVkIGluIHRoZSBkb2N1bWVudGF0aW9uLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhl
cmUgbWF5IGJlIHNldmVyYWwgZWRpdGlvbnMgb2Ygc2Vuc29yIGRvY3VtZW50YXRpb24uDQo+ID4g
RnJvbSBPViwgMHgwMSBpcyBvbmUgcmVnaXN0ZXIgc2hhbGwgYmUgdXBkYXRlZCB0byBrZWVwDQo+
ID4gZXhwb3N1cmUvZ2Fpbi90ZXN0IHBhdHRlcm4uLi4gcmVnaXN0ZXIgc2V0dGluZ3MgZWZmZWN0
aXZlLg0KPiA+DQo+IA0KPiBPa2F5LCBsZXQncyB0cnkgdG8gZ2V0IHNvbWUgZXhwbGFuYXRpb24g
b2YgdGhpcyBvZmZsaW5lLg0KPiANCg0KRmluZS4NCg0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+
ID4gPiA+ICtzdGF0aWMgaW50IG92MDJhMTBfc2V0X2dhaW4oc3RydWN0IG92MDJhMTAgKm92MDJh
MTAsIGludCB2YWwpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IHY0bDJfZ2V0X3N1YmRldmRhdGEoJm92MDJhMTAtPnN1YmRldik7DQo+ID4gPiA+ICsJ
aW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRl
X2RhdGEoY2xpZW50LCBSRUdfUEFHRV9TV0lUQ0gsIFJFR19FTkFCTEUpOw0KPiA+ID4gPiArCWlm
IChyZXQgPCAwKQ0KPiA+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICsJ
cmV0ID0gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGllbnQsIE9WMDJBMTBfUkVHX0dBSU4s
IHZhbCk7DQo+ID4gPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gPiA+ICsJCXJldHVybiByZXQ7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwlyZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YShjbGll
bnQsIFJFR19HTE9CQUxfRUZGRUNUSVZFLA0KPiA+ID4gPiArCQkJCQkgUkVHX0VOQUJMRSk7DQo+
ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0YXRpYyBpbnQgb3YwMmExMF9zZXRfdmJs
YW5rKHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwLCBpbnQgdmFsKQ0KPiA+ID4gPiArew0KPiA+ID4g
PiArCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJkZXZkYXRhKCZvdjAy
YTEwLT5zdWJkZXYpOw0KPiA+ID4gPiArCXUzMiB2dHMgPSB2YWwgKyBvdjAyYTEwLT5jdXJfbW9k
ZS0+aGVpZ2h0IC0gT1YwMkExMF9CQVNJQ19MSU5FOw0KPiA+ID4gPiArCWludCByZXQ7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwg
UkVHX1BBR0VfU1dJVENILCBSRUdfRU5BQkxFKTsNCj4gPiA+ID4gKwlpZiAocmV0IDwgMCkNCj4g
PiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1
c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBPVjAyQTEwX1JFR19WVFNfSCwNCj4gPiA+ID4gKwkJ
CQkJdnRzID4+IE9WMDJBMTBfVlRTX1NISUZUKTsNCj4gPiA+ID4gKwlpZiAocmV0IDwgMCkNCj4g
PiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldCA9IGkyY19zbWJ1
c193cml0ZV9ieXRlX2RhdGEoY2xpZW50LCBPVjAyQTEwX1JFR19WVFNfTCwgdnRzKTsNCj4gPiA+
ID4gKwlpZiAocmV0IDwgMCkNCj4gPiA+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArCXJldHVybiBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgUkVHX0dMT0JB
TF9FRkZFQ1RJVkUsDQo+ID4gPiA+ICsJCQkJCSBSRUdfRU5BQkxFKTsNCj4gPiA+ID4gK30NCj4g
PiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGludCBvdjAyYTEwX3NldF90ZXN0X3BhdHRlcm4oc3Ry
dWN0IG92MDJhMTAgKm92MDJhMTAsIGludCBwYXR0ZXJuKQ0KPiA+ID4gPiArew0KPiA+ID4gPiAr
CXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJkZXZkYXRhKCZvdjAyYTEw
LT5zdWJkZXYpOw0KPiA+ID4gPiArCWludCByZXQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpZiAo
cGF0dGVybikNCj4gPiA+ID4gKwkJcGF0dGVybiA9IE9WMDJBMTBfVEVTVF9QQVRURVJOX0VOQUJM
RTsNCj4gPiA+IA0KPiA+ID4gSXMgdGhpcyBuZWNlc3Nhcnk/IE91ciBjb250cm9sIGNhbiBiZSAw
IGZvciBkaXNhYmxlZCBhbmQgMSBmb3IgY29sb3IgYmFycy4NCj4gPiA+IFRoZSBsYXR0ZXIgaXMg
dGhlIHNhbWUgYXMgdGhlIGFib3ZlIG1hY3JvLg0KPiA+ID4gDQo+ID4gDQo+ID4gWWVzLiBJdCBs
b29rcyByZWR1bmRhbnQgaGVyZS4NCj4gPiBGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQo+ID4gDQo+
ID4gPiBbc25pcF0NCj4gPiA+ID4gK3N0YXRpYyBpbnQgb3YwMmExMF9pbml0aWFsaXplX2NvbnRy
b2xzKHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArCXN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJkZXZkYXRhKCZvdjAyYTEwLT5zdWJk
ZXYpOw0KPiA+ID4gPiArCWNvbnN0IHN0cnVjdCBvdjAyYTEwX21vZGUgKm1vZGU7DQo+ID4gPiA+
ICsJc3RydWN0IHY0bDJfY3RybF9oYW5kbGVyICpoYW5kbGVyOw0KPiA+ID4gPiArCXN0cnVjdCB2
NGwyX2N0cmwgKmN0cmw7DQo+ID4gPiA+ICsJdTY0IGV4cG9zdXJlX21heDsNCj4gPiA+ID4gKwl1
MzIgcGl4ZWxfcmF0ZSwgaF9ibGFuazsNCj4gPiA+ID4gKwlpbnQgcmV0Ow0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJaGFuZGxlciA9ICZvdjAyYTEwLT5jdHJsX2hhbmRsZXI7DQo+ID4gPiA+ICsJbW9k
ZSA9IG92MDJhMTAtPmN1cl9tb2RlOw0KPiA+ID4gPiArCXJldCA9IHY0bDJfY3RybF9oYW5kbGVy
X2luaXQoaGFuZGxlciwgNyk7DQo+ID4gPiA+ICsJaWYgKHJldCkNCj4gPiA+ID4gKwkJcmV0dXJu
IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCWhhbmRsZXItPmxvY2sgPSAmb3YwMmExMC0+bXV0
ZXg7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwljdHJsID0gdjRsMl9jdHJsX25ld19pbnRfbWVudSho
YW5kbGVyLCBOVUxMLCBWNEwyX0NJRF9MSU5LX0ZSRVEsIDAsIDAsDQo+ID4gPiA+ICsJCQkJICAg
ICAgbGlua19mcmVxX21lbnVfaXRlbXMpOw0KPiA+ID4gPiArCWlmIChjdHJsKQ0KPiA+ID4gPiAr
CQljdHJsLT5mbGFncyB8PSBWNEwyX0NUUkxfRkxBR19SRUFEX09OTFk7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwlwaXhlbF9yYXRlID0gdG9fcGl4ZWxfcmF0ZSgwKTsNCj4gPiA+ID4gKwl2NGwyX2N0
cmxfbmV3X3N0ZChoYW5kbGVyLCBOVUxMLCBWNEwyX0NJRF9QSVhFTF9SQVRFLCAwLCBwaXhlbF9y
YXRlLCAxLA0KPiA+ID4gPiArCQkJICBwaXhlbF9yYXRlKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAr
CWhfYmxhbmsgPSBtb2RlLT5odHNfZGVmIC0gbW9kZS0+d2lkdGg7DQo+ID4gPiA+ICsJb3YwMmEx
MC0+aGJsYW5rID0gdjRsMl9jdHJsX25ld19zdGQoaGFuZGxlciwgTlVMTCwgVjRMMl9DSURfSEJM
QU5LLA0KPiA+ID4gPiArCQkJCQkgICAgaF9ibGFuaywgaF9ibGFuaywgMSwgaF9ibGFuayk7DQo+
ID4gPiA+ICsJaWYgKG92MDJhMTAtPmhibGFuaykNCj4gPiA+ID4gKwkJb3YwMmExMC0+aGJsYW5r
LT5mbGFncyB8PSBWNEwyX0NUUkxfRkxBR19SRUFEX09OTFk7DQo+ID4gPiA+ICsNCj4gPiA+IA0K
PiA+ID4gRG8gd2UgbmVlZCB0byBob2xkIGEgcG9pbnRlciB0byB0aGlzIGNvbnRyb2w/IFdlIGRv
bid0IHNlZW0gdG8gZXZlciBhY2Nlc3MNCj4gPiA+IGl0IGFueXdoZXJlIGVsc2UgaW4gdGhlIGRy
aXZlci4NCj4gPiA+IA0KPiA+IA0KPiA+IE5vLg0KPiA+IFRoZXNlIGxpbmVzIHdvdWxkIGJlIHJl
bW92ZWQgaW4gbmV4dCByZWxlYXNlLg0KPiA+IA0KPiA+ID4gPiArCW92MDJhMTAtPnZibGFuayA9
IHY0bDJfY3RybF9uZXdfc3RkKGhhbmRsZXIsICZvdjAyYTEwX2N0cmxfb3BzLA0KPiA+ID4gPiAr
CQkJCQkgICAgVjRMMl9DSURfVkJMQU5LLCBtb2RlLT52dHNfZGVmIC0NCj4gPiA+ID4gKwkJCQkJ
ICAgIG1vZGUtPmhlaWdodCwNCj4gPiA+ID4gKwkJCQkJICAgIE9WMDJBMTBfVlRTX01BWCAtIG1v
ZGUtPmhlaWdodCwgMSwNCj4gPiA+ID4gKwkJCQkJICAgIG1vZGUtPnZ0c19kZWYgLSBtb2RlLT5o
ZWlnaHQpOw0KPiA+ID4gPiArDQo+ID4gPiANCj4gPiA+IERpdHRvLg0KPiA+ID4gDQo+ID4gDQo+
ID4gVGhlc2UgbGluZXMgd291bGQgYmUgcmVtb3ZlZCBpbiBuZXh0IHJlbGVhc2UuDQo+ID4gDQoN
ClNvcnJ5IHRoYXQgSSBtYWRlIGEgbWlzdGFrZS4NCkhlcmUgd2UgbmVlZCB0byByZXNlcnZlIFY0
TDJfQ0lEX1ZCTEFOSyBjb250cm9sLg0KDQo+ID4gPiA+ICsJZXhwb3N1cmVfbWF4ID0gbW9kZS0+
dnRzX2RlZiAtIDQ7DQo+ID4gPiA+ICsJb3YwMmExMC0+ZXhwb3N1cmUgPSB2NGwyX2N0cmxfbmV3
X3N0ZChoYW5kbGVyLCAmb3YwMmExMF9jdHJsX29wcywNCj4gPiA+ID4gKwkJCQkJICAgICAgVjRM
Ml9DSURfRVhQT1NVUkUsDQo+ID4gPiA+ICsJCQkJCSAgICAgIE9WMDJBMTBfRVhQT1NVUkVfTUlO
LA0KPiA+ID4gPiArCQkJCQkgICAgICBleHBvc3VyZV9tYXgsDQo+ID4gPiA+ICsJCQkJCSAgICAg
IE9WMDJBMTBfRVhQT1NVUkVfU1RFUCwNCj4gPiA+ID4gKwkJCQkJICAgICAgbW9kZS0+ZXhwX2Rl
Zik7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlvdjAyYTEwLT5hbmFsX2dhaW4gPSB2NGwyX2N0cmxf
bmV3X3N0ZChoYW5kbGVyLCAmb3YwMmExMF9jdHJsX29wcywNCj4gPiA+ID4gKwkJCQkJICAgICAg
IFY0TDJfQ0lEX0FOQUxPR1VFX0dBSU4sDQo+ID4gPiA+ICsJCQkJCSAgICAgICBPVjAyQTEwX0dB
SU5fTUlOLA0KPiA+ID4gPiArCQkJCQkgICAgICAgT1YwMkExMF9HQUlOX01BWCwNCj4gPiA+ID4g
KwkJCQkJICAgICAgIE9WMDJBMTBfR0FJTl9TVEVQLA0KPiA+ID4gPiArCQkJCQkgICAgICAgT1Yw
MkExMF9HQUlOX0RFRkFVTFQpOw0KPiA+ID4gDQo+ID4gPiBEaXR0by4NCj4gPiA+IA0KPiA+IA0K
PiA+IEZpZWxkczogZXhwb3N1cmUgYW5kIGFuYWxfZ2FpbiB3b3VsZCBiZSByZW1vdmVkIGluIG5l
eHQgcmVsZWFzZS4NCj4gPiBCdXQgdjRsMl9jdHJsX25ld19zdGQgcmVtYWlucywgYXMgdXNlciBt
YXkgc2V0IGV4cC9nYWluLiANCj4gPiANCj4gDQo+IEkgZG9uJ3QgbWVhbiByZW1vdmluZyB0aGUg
Y29udHJvbHMsIGJ1dCBqdXN0IG5vdCBzdG9yaW5nIHRoZSByZXR1cm5lZA0KPiBwb2ludGVycyBp
bnNpZGUgZHJpdmVyIGRhdGEuDQo+IA0KDQpHb3QgaXQgOiAtKSANCg0KPiBCZXN0IHJlZ2FyZHMs
DQo+IFRvbWFzeg0KDQo=

