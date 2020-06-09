Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F541F32C5
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 05:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbgFIDsI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 23:48:08 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:44086 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727088AbgFIDsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Jun 2020 23:48:07 -0400
X-UUID: e43f4377fad742a1a8c541d0b5730a20-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=40bvsHbdvRwM9Lgi+QQEZZMxTMobgTcPYCKNo+R6gBM=;
        b=OMW37jJJKadCQAdW+GKVWwY3XoA5m1aWfD9XDMSCmM0zMGrWkvWXD6BJn/G2NT/cKnCGLP+U7DMBHoYC86Gx0iSkMs06roOgoApOOrfIDXvoS41DxA5kMlUVuMgZ0ip6xnwnw+LyuaToGyFWMby8CWkSUZlJnR2Pvf0Sogcq+PU=;
X-UUID: e43f4377fad742a1a8c541d0b5730a20-20200609
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 988240142; Tue, 09 Jun 2020 11:47:59 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Jun
 2020 11:47:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 9 Jun 2020 11:47:52 +0800
Message-ID: <1591674341.8804.628.camel@mhfsdcap03>
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
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Tue, 9 Jun 2020 11:45:41 +0800
In-Reply-To: <20200608132720.GS2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
         <20200605105412.18813-3-dongchun.zhu@mediatek.com>
         <20200605124643.GG2428291@smile.fi.intel.com>
         <1591424358.8804.599.camel@mhfsdcap03>
         <20200608132720.GS2428291@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 831D5E9863D577205AEB68EF6132BEFD4D39F2DA95B875E27B49D7640377CC602000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KT24gTW9uLCAyMDIwLTA2LTA4IGF0IDE2OjI3ICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFNhdCwgSnVuIDA2LCAyMDIwIGF0IDAyOjE5OjE4UE0gKzA4MDAs
IERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjAtMDYtMDUgYXQgMTU6NDYgKzAz
MDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSnVuIDA1LCAyMDIwIGF0
IDA2OjU0OjEyUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4g
PiA+ID4gKwlkZXBlbmRzIG9uIEkyQyAmJiBWSURFT19WNEwyDQo+ID4gPiANCj4gPiA+IE5vIGNv
bXBpbGUgdGVzdD8NCj4gPiA+IA0KPiA+IA0KPiA+IFNvcnJ5Pw0KPiA+IEtjb25maWcgaGVyZSBp
cyBiYXNlZCBvbiB0aGUgY3VycmVudCBtZWRpYSB0cmVlIG1hc3RlciBicmFuY2guDQo+ID4gSXQg
aXMgYWxzbyB3aGF0IHRoZSBvdGhlciBzaW1pbGFyIGRyaXZlcnMgZnJvbSBEb25nd29vbiBkby4g
DQo+IA0KPiBDT01QSUxFX1RFU1QuDQo+IEkgZHVubm8gaWYgaXQncyBlc3RhYmxpc2hlZCBvciBu
b3QgcHJhY3RpY2UgaW4gbWVkaWEgc3Vic3lzdGVtLg0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiAr
LyoNCj4gPiA+ID4gKyAqIERXOTc2OCByZXF1aXJlcyB3YWl0aW5nIHRpbWUgKGRlbGF5IHRpbWUp
IG9mIHRfT1BSIGFmdGVyIHBvd2VyLXVwLA0KPiA+ID4gPiArICogb3IgaW4gdGhlIGNhc2Ugb2Yg
UEQgcmVzZXQgdGFraW5nIHBsYWNlLg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICsjZGVmaW5lIERX
OTc2OF9UX09QUl9VUwkJCQkxMDAwDQo+ID4gPiA+ICsjZGVmaW5lIERXOTc2OF9UdmliX01TX0JB
U0UxMAkJCSg2NCAtIDEpDQo+ID4gPiA+ICsjZGVmaW5lIERXOTc2OF9BQUNfTU9ERV9ERUZBVUxU
CQkJMg0KPiA+ID4gDQo+ID4gPiA+ICsjZGVmaW5lIERXOTc2OF9BQUNfVElNRV9ERUZBVUxUCQkJ
MHgyMA0KPiA+ID4gDQo+ID4gPiBIZXg/IFdoeSBub3QgZGVjaW1hbD8NCj4gPiA+IA0KPiA+IA0K
PiA+IFRoZXJlIGlzIG9uZSBvcHRpb25hbCBwcm9wZXJ0eSAnZG9uZ3dvb24sYWFjLXRpbWluZycg
ZGVmaW5lZCBpbiBEVC4NCj4gPiBJIGRvbid0IGtub3cgd2hldGhlciB5b3UgaGF2ZSBub3RpY2Vk
IHRoYXQuDQo+ID4gDQo+ID4gJ0RXOTc2OF9BQUNfVElNRV9ERUZBVUxUJyBpcyB0aGUgdmFsdWUg
c2V0IHRvIEFBQ1RbNTowXSByZWdpc3Rlci4NCj4gPiBJIHRob3VnaHQgdGhlIEhleCB1bml0IHNo
b3VsZCBiZSBwcm9wZXIgYXMgaXQgaXMgZGlyZWN0bHkgd3JpdHRlbiB0byB0aGUNCj4gPiBIZXgg
cmVnaXN0ZXIuDQo+IA0KPiBJIHNlZS4gSSB3b3VsZCByYXRoZXIgcHV0IGl0IGxpa2UgKEJJVCg2
KSAvIDIpIHRvIHNob3cgZXhwbGljaXRseSB0aGF0IHdlDQo+IGNob29zZSBoYWxmIG9mIHRoZSBy
ZXNvbHV0aW9uLg0KPiANCg0KSSBrbmV3IHlvdXIgaWRlYS4NCicoQklUKDYpIC8gMiknIG1heSBz
b21ld2hhdCBzaG93IHRoZSBtZWFuaW5nIG9mICdtZWRpYW4gb2YgdGhlIHRvdGFsDQpyYW5nZSBv
ZiBBQUNUWzU6MF0nLg0KDQpCdXQgdGhpcyB2YWx1ZSBpcyBzdGlsbCB2ZXJ5IG9ic2N1cmUgcmVs
YXRpdmUgdG8gJzB4MjAnLg0KQXMgSSB0aG91Z2h0IHRoYXQgc2ltcGxlIGlzIHRoZSBiZXN0LCBl
c3BlY2lhbGx5IGZvciBrZXJuZWwgdXBzdHJlYW0NCnBhdGNoLg0KDQo+IC4uLg0KPiANCj4gPiA+
ID4gKwl2YWwgPSAoKHVuc2lnbmVkIGNoYXIpcmV0ICYgfm1hc2spIHwgKHZhbCAmIG1hc2spOw0K
PiA+ID4gDQo+ID4gPiBUaGlzIGNhc3QgaXMgd2VpcmQuDQo+ID4gPiANCj4gPiANCj4gPiBUaGFu
a3MgZm9yIHRoZSByZXZpZXcsIGJ1dCB0aGlzIGNhc3QgaXMgdXNpbmcgY2xhc3NpY2FsIHBhdHRl
cm4gZnJvbQ0KPiA+IHlvdXIgc3VnZ2VzdGlvbiBvbiBPVjAyQTEwIHY1Og0KPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmxpbnV4dHYub3JnL3BhdGNoLzU5Nzg4Lw0KPiA+IA0KPiA+IFNvIEkgd29uZGVy
IHdoZXRoZXIgaXQgaXMgc3RpbGwgcmVxdWlyZWQgdG8gYmUgcmVmaW5lZCBjdXJyZW50bHkuDQo+
ID4gT3Igd2hhdCB3b3VsZCBpdCBiZSBzdXBwb3NlZCB0byBkbyBmb3IgdGhlIGNhc3Q/DQo+IA0K
PiBPa2F5LCBkb2VzIGl0IHByb2R1Y2UgYSB3YXJuaW5nIHcvbyBjYXN0Pw0KPiBJZiB5ZXMsIHJl
cGxhY2UgaXQgYXQgbGVhc3QgdG8gYmUgdGhlIHNhbWUgdHlwZSBhcyBtYXNrIGFuZCB2YWwuDQo+
IA0KDQpOby4NCg0KPiAuLi4NCj4gDQo+ID4gPiA+ICsJZm9yICggOyB2YWwgPj0gMDsgdmFsIC09
IERXOTc2OF9NT1ZFX1NURVBTKSB7DQo+ID4gPiA+ICsJCXJldCA9IGR3OTc2OF9zZXRfZGFjKGR3
OTc2OCwgdmFsKTsNCj4gPiA+ID4gKwkJaWYgKHJldCkgew0KPiA+ID4gPiArCQkJZGV2X2Vycigm
Y2xpZW50LT5kZXYsICJJMkMgd3JpdGUgZmFpbDogJWQiLCByZXQpOw0KPiA+ID4gPiArCQkJcmV0
dXJuIHJldDsNCj4gPiA+ID4gKwkJfQ0KPiA+ID4gPiArCQl1c2xlZXBfcmFuZ2UobW92ZV9kZWxh
eV91cywgbW92ZV9kZWxheV91cyArIDEwMDApOw0KPiA+ID4gPiArCX0NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBJdCB3aWxsIGxvb2sgbW9yZSBuYXR1cmFsbHkgaW4gdGhlIG11bHRpcGxpZXIga2lu
ZCBvZiB2YWx1ZS4NCj4gPiA+IA0KPiA+ID4gCXVuc2lnbmVkIGludCBzdGVwcyA9IERJVl9ST1VO
RF9VUCguLi4pOw0KPiA+ID4gDQo+ID4gPiAJd2hpbGUgKHN0ZXBzLS0pIHsNCj4gPiA+IAkJLi4u
KC4uLiwgc3RlcHMgKiAuLi5fTU9WRV9TVEVQUyk7DQo+ID4gPiAJCS4uLg0KPiA+ID4gCX0NCj4g
PiA+IA0KPiA+ID4gYnV0IGRvdWJsZSBjaGVjayBhcml0aG1ldGljcy4NCj4gPiANCj4gPiBUaGUg
Y3VycmVudCBjb2Rpbmcgc3R5bGUgaXMgYWN0dWFsbHkgdXBkYXRlZCB3aXRoIHJlZmVyZW5jZSB0
byB5b3VyDQo+ID4gcHJldmlvdXMgY29tbWVudHMgb24gRFc5NzY4IHYzOg0KPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmxpbnV4dHYub3JnL3BhdGNoLzYxODU2Lw0KPiANCj4gSSB1bmRlcnN0YW5kLCBi
dXQgY2FuIHlvdSBjb25zaWRlciB0byBnbyBmdXJ0aGVyIGFuZCBzZWUgaWYgdGhlIHByb3Bvc2Fs
IHdvcmtzPw0KPiANCg0KSW4gZmFjdCwgeW91ciBzdWdnZXN0aW9uIGlzIHNvbWV0aGluZyBsaWtl
IG9uZSBhbm90aGVyIG1ldGhvZCB0byBzZXQgREFDDQp2YWx1ZSB0byBhY3R1YXRvci4NCkl0IGlz
IGxpa2UgdGhlcmUgbWF5IGJlIHNldmVyYWwgc29sdXRpb25zIHRvIGEgcXVlc3Rpb24uDQoNClll
cy4gSSBqdXN0IHRyaWVkIHRoZSBuZXcgbWV0aG9kIGFuZCBpdCB3b3JrcyBhcyBleHBlY3RlZC4N
CnUzMiBzdGVwcyA9IERJVl9ST1VORF9VUChkdzk3NjgtPmZvY3VzLT52YWwsIERXOTc2OF9NT1ZF
X1NURVBTKTsNCndoaWxlIChzdGVwcy0tKSB7DQoJcmV0ID0gZHc5NzY4X3NldF9kYWMoZHc5NzY4
LCBzdGVwcyAqIERXOTc2OF9NT1ZFX1NURVBTKTsNCglpZiAocmV0KQ0KCQlyZXR1cm4gcmV0Ow0K
CXVzbGVlcF9yYW5nZShtb3ZlX2RlbGF5X3VzLCBtb3ZlX2RlbGF5X3VzICsgMTAwMCk7DQp9DQoN
CkJ1dCBmcm9tIG15IHBlcnNwZWN0aXZlLCBJIG1heSBwcmVmZXIgdG8gdGhlIG9yaWdpbmFsIG1l
dGhvZC4NCkFzIGhlcmUgd2hhdCB3ZSByZWFsbHkgY2FyZSBpcyB0aGUgREFDIHZhbHVlLA0KJ2R3
OTc2OF9zZXRfZGFjKGR3OTc2OCwgdmFsKScgc2VlbXMgbW9yZSBzaW1wbGUuDQoNCg==

