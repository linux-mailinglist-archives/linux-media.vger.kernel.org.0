Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2711FE98E
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 05:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgFRDmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 23:42:54 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:28455 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726853AbgFRDmx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 23:42:53 -0400
X-UUID: 9c0c628e6d1147de9a55d7b9b2d44b79-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=i4jSTDSTh0GaOSOIPc+y2DdxkaaCQiUZ9e4P/5TV8Tc=;
        b=uwL64kzbKtCqafMZJaBJO8Dg+HDeUyDHDTrUpi6lT6q0IVvr9OXI2lFFS+87Ms+NfaOvfTD6ZIS0l4p90+mQv8+bKJrxXYuHg/3fTcT0eYmJ1DoeRgU7VcxLDxThlK/r6K3Sii1s9H4FZ3p4wBfGeEr4rwPYNm2enP7Tz4tuwkI=;
X-UUID: 9c0c628e6d1147de9a55d7b9b2d44b79-20200618
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 37253424; Thu, 18 Jun 2020 11:42:48 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Jun
 2020 11:42:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Jun 2020 11:42:45 +0800
Message-ID: <1592451616.15355.25.camel@mhfsdcap03>
Subject: Re: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree
 node document
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>,
        <yong.wu@mediatek.com>
Date:   Thu, 18 Jun 2020 11:40:16 +0800
In-Reply-To: <20200521160046.GJ209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-12-xia.jiang@mediatek.com>
         <20200521160046.GJ209565@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E100C0680B0A813F09A9DC10EAB829B13E2B394890EB73037F1C971D096F1A762000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE2OjAwICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gRnJpLCBBcHIgMDMsIDIwMjAgYXQgMDU6NDA6MzBQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IEFkZCBqcGVnIGVuYyBkZXZpY2UgdHJlZSBub2RlIGRvY3Vt
ZW50DQo+ID4gDQo+ID4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0K
PiA+IC0tLQ0KPiA+IHY4OiBubyBjaGFuZ2VzDQo+ID4gDQo+ID4gdjc6IG5vIGNoYW5nZXMNCj4g
PiANCj4gPiB2Njogbm8gY2hhbmdlcw0KPiA+IA0KPiA+IHY1OiBubyBjaGFuZ2VzDQo+ID4gDQo+
ID4gdjQ6IG5vIGNoYW5nZXMNCj4gPiANCj4gPiB2MzogY2hhbmdlIGNvbXBhdGlibGUgdG8gU29D
IHNwZWNpZmljIGNvbXBhdGlibGUNCj4gPiANCj4gPiB2Mjogbm8gY2hhbmdlcw0KPiA+IC0tLQ0K
PiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dCAgfCAzNyAr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dA0KPiA+IA0KPiANCj4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KRGVhciBUb21h
c3osDQoNClNvcnJ5IGZvciBtaXNzaW5nIHRoaXMgbWVzc2FnZS4gUmVwbGllZCBiZWxvdy4NCj4g
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmE4ZGE2OTk0OTNiDQo+ID4gLS0tIC9k
ZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQo+ID4gQEAgLTAsMCArMSwzNyBAQA0KPiA+ICsq
IE1lZGlhVGVrIEpQRUcgRW5jb2Rlcg0KPiA+ICsNCj4gPiArTWVkaWFUZWsgSlBFRyBFbmNvZGVy
IGlzIHRoZSBKUEVHIGVuY29kZSBoYXJkd2FyZSBwcmVzZW50IGluIE1lZGlhVGVrIFNvQ3MNCj4g
PiArDQo+ID4gK1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gKy0gY29tcGF0aWJsZSA6IHNob3Vs
ZCBiZSBvbmUgb2Y6DQo+ID4gKyAgICAgICAgICAgICAgICJtZWRpYXRlayxtdDI3MDEtanBnZW5j
Ig0KPiA+ICsgICAgICAgICAgICAgICAuLi4NCj4gDQo+IFdoYXQgZG9lcyB0aGlzICIuLi4iIG1l
YW4/DQoiLi4uIiBtZWFucyB0aGF0IGNvbXBhdGlibGUgbmFtZSBpcyBub3QganVzdCAibWVkaWF0
ZWssbXQyNzAxLWpwZ2VuYyIsDQpkaWZmZXJlbnQgcHJvamVjdCBoYXMgZGlmZmVyZW50IGNvbXBh
dGlibGUgbmFtZShmb3IgZXhhbXBsZSB0aGUgTVQ4MTczJ3MNCmNvbXBhdGlibGUgbmFtZSBtYXkg
YmUgIm1lZGlhdGVrLG10ODE3My1qcGdlbmMiKS4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgIGZv
bGxvd2VkIGJ5ICJtZWRpYXRlayxtdGstanBnZW5jIg0KPiA+ICstIHJlZyA6IHBoeXNpY2FsIGJh
c2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBlbmNvZGVyIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mDQo+
ID4gKyAgbWVtb3J5IG1hcHBlZCByZWdpb24uDQo+ID4gKy0gaW50ZXJydXB0cyA6IGludGVycnVw
dCBudW1iZXIgdG8gdGhlIGludGVycnVwdCBjb250cm9sbGVyLg0KPiA+ICstIGNsb2NrczogZGV2
aWNlIGNsb2Nrcywgc2VlDQo+ID4gKyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dCBmb3IgZGV0YWlscy4NCj4gPiArLSBjbG9jay1uYW1l
czogbXVzdCBjb250YWluICJqcGdlbmMiLiBJdCBpcyB0aGUgY2xvY2sgb2YgSlBFRyBlbmNvZGVy
Lg0KPiANCj4gbml0OiBJbiBwcmluY2lwbGUgdGhlIGNsb2NrcyBzaG91bGQgYmUgbmFtZWQgYWZ0
ZXIgdGhlIGZ1bmN0aW9uIHRoZSBjbG9jaw0KPiBwZXJmb3JtcyBvbiB0aGUgY29uc3VtZXIgc2lk
ZSwgaS5lLiB0aGUgSlBFRyBibG9jayBpbiB0aGlzIGNhc2UsIEkgZ3Vlc3MNCj4gaGVyZSBpdCdz
IGp1c3QgYSBnZW5lcmljIGNsb2NrIHRoYXQgZG9lcyBldmVyeXRoaW5nLCBidXQgSSBndWVzcyBp
dCBjb21lcw0KPiBmcm9tIHNvbWV3aGVyZS4gSXMgaXQgdGhlIEFIQiBjbG9jayBvciBzb21ldGhp
bmc/IEluIHRoYXQgY2FzZSBpdCB3b3VsZA0KPiBub3JtYWxseSBiZSBjYWxsZWQgImFoYiIuDQpJ
IGhhdmUgY29uZmlybWVkIHdpdGggaGFyZHdhcmUgZGVzaWduZXIgdGhhdCB0aGUganBlZyBjbG9j
ayBpcyBub3QgQUhCDQpjbG9jayxpdCBmb2xsb3dzIHN1YnN5cyBjbG9jayhiZWNhdXNlIDI3MDEg
aXMgdGhlIG9sZCBJQyxJIGRpZG4ndCBnZXQNCnRoZSBzb3VyY2UgbmFtZSkuSXQgaGFzIHRoZSBz
YW1lIHNvdXJjZSB3aXRoIHZlbmMgY2xvY2suV2UgY2FuIHNlZSB0aGF0DQp0aGUgY2xvY2tzID0g
PGltZ3N5cyBDTEtfSU1HX1ZFTkM+LCBTaG91bGQgSSBuYW1lIGl0ICJ2ZW5jIiBvciB0aGUNCm9y
aWduYWwgImpwZ2VuYyI/DQo+IA0KPiA+ICstIHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0
aGUgcG93ZXIgZG9tYWluLCBzZWUNCj4gPiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcG93ZXJfZG9tYWluLnR4dCBmb3IgZGV0YWlscy4NCj4gPiArLSBtZWRpYXRl
ayxsYXJiOiBtdXN0IGNvbnRhaW4gdGhlIGxvY2FsIGFyYml0ZXJzIGluIHRoZSBjdXJyZW50IFNv
Q3MsIHNlZQ0KPiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnkt
Y29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIudHh0DQo+ID4gKyAgZm9yIGRldGFpbHMuDQo+
IA0KPiBJIGJlbGlldmUgdGhpcyBpc24ndCBuZWNlc3NhcnkgYW55bW9yZSwgYmVjYXVzZSBsYXJi
cyBhcmUgYWRkZWQNCj4gYXV0b21hdGljYWxseSBieSB0aGUgTVRLIElPTU1VIGRyaXZlciB1c2lu
ZyBkZXZpY2UgbGlua3MuICtDQyBZb25nIHdobw0KPiB3b3JrZWQgb24gdGhhdC4NClllcyxJIGhh
dmUgY29uZmlybWVkIHdpdGggWW9uZyB0aGF0IGhlIHdpbGwgaGVscCBtZSB0byBtb2RpZnkgdGhp
cy5JcyBpdA0Kb2sgdGhhdCBJIGtlZXAgdGhlIG9yaWduYWwgbGFyYiBjb2RlPw0KDQpCZXN0IFJl
Z2FyZHMsDQpYaWEgSmlhbmcNCj4gDQo+ID4gKy0gaW9tbXVzOiBzaG91bGQgcG9pbnQgdG8gdGhl
IHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0aCBtYXN0ZXIgcG9ydCBhcw0KPiA+ICsgIGFyZ3Vt
ZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVr
LGlvbW11LnR4dA0KPiA+ICsgIGZvciBkZXRhaWxzLg0KPiA+ICsNCj4gPiArRXhhbXBsZToNCj4g
PiArCWpwZWdlbmM6IGpwZWdlbmNAMTUwMGEwMDAgew0KPiA+ICsJCWNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQyNzAxLWpwZ2VuYyIsDQo+ID4gKwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMi
Ow0KPiA+ICsJCXJlZyA9IDwwIDB4MTUwMGEwMDAgMCAweDEwMDA+Ow0KPiA+ICsJCWludGVycnVw
dHMgPSA8R0lDX1NQSSAxNDEgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCj4gPiArCQljbG9ja3MgPSAg
PCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCj4gPiArCQljbG9jay1uYW1lcyA9ICJqcGdlbmMiOw0K
PiA+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDI3MDFfUE9XRVJfRE9NQUlOX0lTUD47
DQo+ID4gKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KPiANCj4gRGl0dG8uDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQo=

