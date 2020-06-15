Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6EE1F8F8A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 09:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728622AbgFOH1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 03:27:10 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:6834 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728380AbgFOH1J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 03:27:09 -0400
X-UUID: 2666c78addd64c669bb9616387d2124c-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=m/v3E4p1m/OZyPE8uUXIhT+TD6yH0vQGAescG6WMe18=;
        b=GcSraQTy7mQuCj1GiotVFbBU92YScetN/KT9Jr41BGjeUuPyIwgv6Dc2kKq4E0mU98Of1nvuEvIxaLGK8acWBvTP5Nw52FQXHf8SxreUy9fifUHdF/QN6OvCB4SJ7gbfFAGt6GlQ+rnKPzr6BF0il9WiTec/rY8Lym0e70OP7DA=;
X-UUID: 2666c78addd64c669bb9616387d2124c-20200615
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1671516636; Mon, 15 Jun 2020 15:26:57 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Jun
 2020 15:26:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 15:26:49 +0800
Message-ID: <1592205866.8804.686.camel@mhfsdcap03>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Mon, 15 Jun 2020 15:24:26 +0800
In-Reply-To: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
         <20200509080627.23222-3-dongchun.zhu@mediatek.com>
         <20200521193204.GA14214@chromium.org>
         <1590209415.8804.431.camel@mhfsdcap03>
         <20200610183600.GI201868@chromium.org>
         <1591954266.8804.646.camel@mhfsdcap03>
         <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F48042F2A1F78F21A0AF70589031EBB7AAF552C4E8B9EC0D9A43D09539458DD92000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBGcmksIDIwMjAtMDYtMTIgYXQgMjA6NDkgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBGcmksIEp1biAxMiwgMjAyMCBhdCAxMTozMyBBTSBEb25nY2h1biBa
aHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgVG9tYXN6
LA0KPiA+DQo+ID4gT24gV2VkLCAyMDIwLTA2LTEwIGF0IDE4OjM2ICswMDAwLCBUb21hc3ogRmln
YSB3cm90ZToNCj4gPiA+IE9uIFNhdCwgTWF5IDIzLCAyMDIwIGF0IDEyOjUwOjE1UE0gKzA4MDAs
IERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+ID4gPg0KPiA+ID4g
PiBUaGFua3MgZm9yIHRoZSByZXZpZXcuIE15IHJlcGxpZXMgYXJlIGFzIGJlbG93Lg0KPiA+ID4g
Pg0KPiA+ID4gPiBPbiBUaHUsIDIwMjAtMDUtMjEgYXQgMTk6MzIgKzAwMDAsIFRvbWFzeiBGaWdh
IHdyb3RlOg0KPiA+ID4gPiA+IEhpIERvbmdjaHVuLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24g
U2F0LCBNYXkgMDksIDIwMjAgYXQgMDQ6MDY6MjdQTSArMDgwMCwgRG9uZ2NodW4gWmh1IHdyb3Rl
Og0KPiA+ID4gW3NuaXBdDQo+ID4gPiA+ID4gPiArew0KPiA+ID4gPiA+ID4gKyAgICAgICBzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOw0KPiA+ID4gPiA+ID4g
KyAgICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVu
dCk7DQo+ID4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwID0gdG9fb3Yw
MmExMChzZCk7DQo+ID4gPiA+ID4gPiArICAgICAgIGludCByZXQ7DQo+ID4gPiA+ID4gPiArDQo+
ID4gPiA+ID4gPiArICAgICAgIGdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChvdjAyYTEwLT5uX3Jz
dF9ncGlvLCAwKTsNCj4gPiA+ID4gPiA+ICsgICAgICAgZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVw
KG92MDJhMTAtPnBkX2dwaW8sIDApOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyAgICAg
ICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUob3YwMmExMC0+ZWNsayk7DQo+ID4gPiA+ID4gPiAr
ICAgICAgIGlmIChyZXQgPCAwKSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIGVjbGtcbiIpOw0KPiA+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiA+ID4gPiArICAgICAgIH0NCj4gPiA+ID4gPiA+ICsN
Cj4gPiA+ID4gPiA+ICsgICAgICAgcmV0ID0gcmVndWxhdG9yX2J1bGtfZW5hYmxlKE9WMDJBMTBf
TlVNX1NVUFBMSUVTLCBvdjAyYTEwLT5zdXBwbGllcyk7DQo+ID4gPiA+ID4gPiArICAgICAgIGlm
IChyZXQgPCAwKSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJm
YWlsZWQgdG8gZW5hYmxlIHJlZ3VsYXRvcnNcbiIpOw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGdvdG8gZGlzYWJsZV9jbGs7DQo+ID4gPiA+ID4gPiArICAgICAgIH0NCj4gPiA+ID4gPiA+
ICsgICAgICAgdXNsZWVwX3JhbmdlKDUwMDAsIDYwMDApOw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gKyAgICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAob3YwMmExMC0+cGRfZ3Bpbywg
MSk7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlzIGlzIGEgInBvd2VyZG93biIgR1BJTy4gSXQg
bXVzdCBiZSBzZXQgdG8gMCBpZiB0aGUgc2Vuc29yIGlzIHRvIGJlDQo+ID4gPiA+ID4gcG93ZXJl
ZCBvbi4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgdmFsdWUgc2V0IGJ5IGdwaW9k
X3NldF92YWx1ZV9jYW5zbGVlcCgpIEFQSSBhY3R1YWxseSBkZXBlbmRzIHVwb24NCj4gPiA+ID4g
R1BJTyBwb2xhcml0eSBkZWZpbmVkIGluIERULg0KPiA+ID4gPiBTaW5jZSBJIHNldCBHUElPX0FD
VElWRV9MT1cgdG8gcG93ZXJkb3duLA0KPiA+ID4gPiBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAo
Z3Bpb19kZXNjLCB2YWx1ZSkgd291bGQgc2V0ICF2YWx1ZSB0bw0KPiA+ID4gPiBncGlvX2Rlc2Mu
DQo+ID4gPiA+IFRodXMgaGVyZSBwb3dlcmRvd24gd291bGQgYmUgbG93LXN0YXRlIHdoZW4gc2Vu
c29yIGlzIHBvd2VyZWQgb24uDQo+ID4gPiA+IEZvciBHUElPIHBvbGFyaXR5LCBJIGFsc28gcG9z
dCBhIGNvbW1lbnQgdG8gdGhlIGJpbmRpbmcgcGF0Y2guDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4g
VGhhdCdzIHRydWUuIEhvd2V2ZXIsIHRoaXMgbWFrZXMgdGhlIGRyaXZlciByZWFsbHkgY29uZnVz
aW5nLiBJZiBzb21lb25lDQo+ID4gPiByZWFkcyB0aGlzIGNvZGUgYW5kIGNvbXBhcmVzIHdpdGgg
dGhlIGRhdGFzaGVldCwgaXQgbG9va3MgaW5jb3JyZWN0LA0KPiA+ID4gYmVjYXVzZSBpbiB0aGUg
ZGF0YXNoZWV0IHRoZSBwb3dlcmRvd24gR1BJTyBuZWVkcyB0byBiZSBjb25maWd1cmVkIGxvdw0K
PiA+ID4gZm9yIHRoZSBzZW5zb3IgdG8gb3BlcmF0ZS4NCj4gPiA+DQo+ID4gPiBJJ2QgcmVjb21t
ZW5kIGRlZmluaW5nIHRoZSBiaW5kaW5nIGluIGEgd2F5IHRoYXQgbWFrZXMgaXQgY2xlYXIgaW4g
dGhlIGRyaXZlciBjb2RlDQo+ID4gPiB0aGF0IGl0IGltcGxlbWVudGVzIHRoZSBwb3dlciBzZXF1
ZW5jaW5nIGFzIHBlciB0aGUgZGF0YXNoZWV0Lg0KPiA+ID4NCj4gPg0KPiA+IFVoLWh1aC4uLg0K
PiA+IEJ1dCBpdCBhbGwgZGVwZW5kcyBvbiBob3cgd2UgbG9vayBhdCB0aGUgcG93ZXJkb3duIEdQ
SU8uDQo+ID4gT3Igd2hlcmUgc2hvdWxkIHdlIGRlZmluZSB0aGUgYWN0aXZlIGxvdyBvciBhY3Rp
dmUgaGlnaCwgdGhlIGRyaXZlciBvcg0KPiA+IERUPw0KPiA+DQo+ID4gTXkgaW5pdGlhbCBpZGVh
IGlzIHVzaW5nIERUIEdQSU8gcG9sYXJpdHkgdG8gZGVzY3JpYmUgc2Vuc29yIGFjdGl2ZQ0KPiA+
IHBvbGFyaXR5IGFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0Lg0KPiA+IEFzIGFuIGFjdGl2ZSBs
b3cgc2h1dGRvd24gc2lnbmFsIGlzIGVxdWl2YWxlbnQgdG8gYW4gYWN0aXZlIGhpZ2ggZW5hYmxl
DQo+ID4gc2lnbmFsLg0KPiA+DQo+IA0KPiBPa2F5LCBJIGRpc2N1c3NlZCB0aGlzIG9mZmxpbmUg
d2l0aCBMYXVyZW50IGFuZCBTYWthcmkgYW5kIHdlIGFsc28NCj4gZm91bmQgdGhlIGd1aWRlbGlu
ZXMgb2YgdGhlIExpbnV4IEdQSU8gc3Vic3lzdGVtIG9uIHRoaXMgWzFdLg0KPiANCj4gVGhlIGNv
bmNsdXNpb24gaXMgdGhhdCB0aGUgcGluIG5hbWVzIGluIHRoZSBkcml2ZXIgb3IgRFQgbXVzdCBu
b3QNCj4gY29udGFpbiBhbnkgbmVnYXRpb24gcHJlZml4ZXMgYW5kIHRoZSBkcml2ZXIgbmVlZHMg
dG8gY2FyZSBvbmx5IGFib3V0DQo+IHRoZSBsb2dpY2FsIGZ1bmN0aW9uIG9mIHRoZSBwaW4sIHN1
Y2ggYXMgInBvd2VyZG93biIgb3IgInJlc2V0Ii4gSW4NCj4gY2FzZSBvZiB0aGlzIGRyaXZlciwg
d2Ugc2hvdWxkIGNhbGwgdGhlIHBpbnMgInJzdCIgYW5kICJwZCIgYW5kDQo+IHNldHRpbmcgdGhl
bSB0byAxIHdvdWxkIHRyaWdnZXIgdGhlIHJlc2V0IGFuZCBwb3dlciBkb3duIHJlc3BlY3RpdmVs
eS4NCj4gVGhlIHBoeXNpY2FsIHNpZ25hbCBwb2xhcml0eSBtdXN0IGJlIGNvbmZpZ3VyZWQgaW4g
RFQgdXNpbmcgdGhlDQo+IHBvbGFyaXR5IGZsYWdzLg0KPiANCj4gWzFdIGh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2RyaXZlci1hcGkvZ3Bpby9jb25zdW1lci5odG1sI3Ro
ZS1hY3RpdmUtbG93LWFuZC1vcGVuLWRyYWluLXNlbWFudGljcw0KPiANCg0KVGhhbmsgeW91IGZv
ciB0aGUgc2hhcmluZy4NCklmIGRyaXZlciBvbmx5IGZvY3VzIG9uIHRoZSBsb2dpY2FsIGZ1bmN0
aW9uIG9mIEdQSU8gcGlucywNCiduX3JzdF9ncGlvJyBtYXkgbmVlZCB0byBiZSByZW5hbWVkIGJh
Y2sgdG8gdGhlIDFzdCB2ZXJzaW9uICdyc3RfZ3BpbycuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBU
b21hc3oNCg0K

