Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A329167B94
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 12:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbgBULMO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 06:12:14 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:42343 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726976AbgBULMN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 06:12:13 -0500
X-UUID: 43655fbbeb5b47ce9936405e87d9e8ac-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=474lXUEU1xJMlrPp6cSXgY5ynfizI9c+iTggA6zvt0I=;
        b=FF+kP69hl2qGXcRqmDL/DHOjHLA/yMDLqp+MXUTECu/i2wGisXMZUmv9hMrHvCoSP9efgtgjprreLUhLFKdUi5+wOnIVAw5rEf3lgE07QJwrumnlweWaxN5omGRRpzev/6MNxiLitLqYtv8KdCTNaYNO2Xiz3kGEw38o3EKMLEU=;
X-UUID: 43655fbbeb5b47ce9936405e87d9e8ac-20200221
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1711254631; Fri, 21 Feb 2020 19:12:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 19:07:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 21 Feb 2020 19:12:27 +0800
Message-ID: <1582283518.5889.10.camel@mtksdaap41>
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Matthias Brugger <mbrugger@suse.com>
CC:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Minghsiu Tsai" <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        <airlied@linux.ie>, <mturquette@baylibre.com>,
        <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        <laurent.pinchart@ideasonboard.com>,
        <ulrich.hecht+renesas@gmail.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        <linux-clk@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, <wens@csie.org>,
        Allison Randal <allison@lohutok.net>,
        mtk01761 <wendell.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <frank-w@public-files.de>,
        Seiya Wang <seiya.wang@mediatek.com>, <sean.wang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Fabien Parent <fparent@baylibre.com>, <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, <matthias.bgg@kernel.org>
Date:   Fri, 21 Feb 2020 19:11:58 +0800
In-Reply-To: <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
         <1582259996.1846.7.camel@mtksdaap41>
         <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
         <1582277229.25992.9.camel@mtksdaap41>
         <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6772620AE6DD36B726BB7681ED6A6EEF936C40064BAF8A610006F6B2D6B851C32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzOg0KDQpPbiBGcmksIDIwMjAtMDItMjEgYXQgMTE6MjQgKzAxMDAsIE1hdHRo
aWFzIEJydWdnZXIgd3JvdGU6DQo+IA0KPiBPbiAyMS8wMi8yMDIwIDEwOjI3LCBDSyBIdSB3cm90
ZToNCj4gPiBIaSwgRW5yaWM6DQo+ID4gDQo+ID4gT24gRnJpLCAyMDIwLTAyLTIxIGF0IDA5OjU2
ICswMTAwLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOg0KPiA+PiBIaSBDSywNCj4gPj4N
Cj4gPj4gVGhhbmtzIGZvciB5b3VyIHF1aWNrIGFuc3dlci4NCj4gPj4NCj4gPj4gT24gMjEvMi8y
MCA1OjM5LCBDSyBIdSB3cm90ZToNCj4gPj4+IEhpLCBFbnJpYzoNCj4gPj4+DQo+ID4+PiBPbiBU
aHUsIDIwMjAtMDItMjAgYXQgMTg6MjEgKzAxMDAsIEVucmljIEJhbGxldGJvIGkgU2VycmEgd3Jv
dGU6DQo+ID4+Pj4gRGVhciBhbGwsDQo+ID4+Pj4NCj4gPj4+PiBUaG9zZSBwYXRjaGVzIGFyZSBp
bnRlbmRlZCB0byBzb2x2ZSBhbiBvbGQgc3RhbmRpbmcgaXNzdWUgb24gc29tZQ0KPiA+Pj4+IE1l
ZGlhdGVrIGRldmljZXMgKG10ODE3MywgbXQyNzAxIGFuZCBtdDI3MTIpIGluIGEgc2xpZ2h0bHkg
ZGlmZmVyZW50IHdheQ0KPiA+Pj4+IHRvIHRoZSBwcmVjZWRlbnQgc2VyaWVzLg0KPiA+Pj4+DQo+
ID4+Pj4gVXAgdG8gbm93IGJvdGggZHJpdmVycywgY2xvY2sgYW5kIGRybSBhcmUgcHJvYmVkIHdp
dGggdGhlIHNhbWUgZGV2aWNlIHRyZWUNCj4gPj4+PiBjb21wYXRpYmxlLiBCdXQgb25seSB0aGUg
Zmlyc3QgZHJpdmVyIGdldCBwcm9iZWQsIHdoaWNoIGluIGVmZmVjdCBicmVha3MNCj4gPj4+PiBn
cmFwaGljcyBvbiB0aG9zZSBkZXZpY2VzLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIHZlcnNpb24gZWln
aHQgb2YgdGhlIHNlcmllcyB0cmllcyB0byBzb2x2ZSB0aGUgcHJvYmxlbSB3aXRoIGENCj4gPj4+
PiBkaWZmZXJlbnQgYXBwcm9hY2ggdGhhbiB0aGUgcHJldmlvdXMgc2VyaWVzIGJ1dCBzaW1pbGFy
IHRvIGhvdyBpcyBzb2x2ZWQNCj4gPj4+PiBvbiBvdGhlciBNZWRpYXRlayBkZXZpY2VzLg0KPiA+
Pj4+DQo+ID4+Pj4gVGhlIE1NU1lTIChNdWx0aW1lZGlhIHN1YnN5c3RlbSkgaW4gTWVkaWF0ZWsg
U29DcyBoYXMgc29tZSByZWdpc3RlcnMgdG8NCj4gPj4+PiBjb250cm9sIGNsb2NrIGdhdGVzICh3
aGljaCBpcyB1c2VkIGluIHRoZSBjbGsgZHJpdmVyKSBhbmQgc29tZSByZWdpc3RlcnMNCj4gPj4+
PiB0byBzZXQgdGhlIHJvdXRpbmcgYW5kIGVuYWJsZSB0aGUgZGlmZmVybmV0IGJsb2NrcyBvZiB0
aGUgZGlzcGxheQ0KPiA+Pj4+IGFuZCBNRFAgKE1lZGlhIERhdGEgUGF0aCkgc3Vic3lzdGVtLiBP
biB0aGlzIHNlcmllcyB0aGUgY2xrIGRyaXZlciBpcw0KPiA+Pj4+IG5vdCBhIHB1cmUgY2xvY2sg
Y29udHJvbGxlciBidXQgYSBzeXN0ZW0gY29udHJvbGxlciB0aGF0IGNhbiBwcm92aWRlDQo+ID4+
Pj4gYWNjZXNzIHRvIHRoZSBzaGFyZWQgcmVnaXN0ZXJzIGJldHdlZW4gdGhlIGRpZmZlcmVudCBk
cml2ZXJzIHRoYXQgbmVlZA0KPiA+Pj4+IGl0IChtZWRpYXRlay1kcm0gYW5kIG1lZGlhdGVrLW1k
cCkuIEFuZCB0aGUgYmlnZ2VzdCBjaGFuZ2UgaXMsIHRoYXQgaW4NCj4gPj4+PiB0aGlzIHZlcnNp
b24sIGNsayBkcml2ZXIgaXMgdGhlIGVudHJ5IHBvaW50IChwYXJlbnQpIHdoaWNoIHdpbGwgdHJp
Z2dlcg0KPiA+Pj4+IHRoZSBwcm9iZSBvZiB0aGUgY29ycmVzcG9uZGluZyBtZWRpYXRlay1kcm0g
ZHJpdmVyIGFuZCBwYXNzIGl0cyBNTVNZUw0KPiA+Pj4+IHBsYXRmb3JtIGRhdGEgZm9yIGRpc3Bs
YXkgY29uZmlndXJhdGlvbi4NCj4gPj4+DQo+ID4+PiBXaGVuIG1tc3lzIGlzIGEgc3lzdGVtIGNv
bnRyb2xsZXIsIEkgcHJlZmVyIHRvIHBsYWNlIG1tc3lzIGluDQo+ID4+PiBkcml2ZXJzL3NvYy9t
ZWRpYXRlaywgYW5kIGl0IHNoYXJlIHJlZ2lzdGVycyBmb3IgY2xvY2ssIGRpc3BsYXksIGFuZCBt
ZHANCj4gPj4+IGRyaXZlci4gVGhpcyBtZWFucyB0aGUgcHJvYmUgZnVuY3Rpb24gaXMgcGxhY2Vk
IGluDQo+ID4+PiBkcml2ZXJzL3NvYy9tZWRpYXRlayAsaXRzIGRpc3BsYXkgY2xvY2sgZnVuY3Rp
b24sIG1kcCBjbG9jayBmdW5jdGlvbiBhcmUNCj4gPj4+IHBsYWNlZCBpbiBkcml2ZXJzL2Nsaywg
ZGlzcGxheSByb3V0aW5nIGFyZSBwbGFjZWQgaW4gZHJpdmVycy9ncHUvZHJtLA0KPiA+Pj4gYW5k
IG1kcCByb3V0aW5nIGFyZSBwbGFjZWQgaW4gZGlydmVycy92aWRlby4NCj4gPj4+DQo+ID4+DQo+
ID4+IEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIGJ1dCBJIGFtIG5vdCBzdXJlIHRoaXMgbWFr
ZXMgdGhlIGNvZGUgY2xlYXJlciBhbmQNCj4gPj4gdXNlZnVsLiBUaGUgZHJpdmVyIGluIGRyaXZl
cnMvc29jL21lZGlhdGVrIHdpbGwgYmUgYSBzaW1wbGUgZHVtbXkgaW1wbGVtZW50YXRpb24NCj4g
Pj4gb2YgYSAic2ltcGxlLW1mZCIgZGV2aWNlIChhIGRyaXZlciB0aGF0IHNpbXBseSBtYXRjaGVz
IHdpdGgNCj4gPj4gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIgYW5kIGluc3RhbnRpYXRlcyB0aGUg
ImNsay1tdDgxNzMtbW0iIGFuZCB0aGUNCj4gPj4gIm1lZGlhdGVrLWRybSIgZHJpdmVyIChub3Rl
IHRoYXQgbWVkaWF0ZWstbWRwIiBpcyBhbHJlYWR5IGluc3RhbnRpYXRlZCB2aWENCj4gPj4gZGV2
aWNlLXRyZWUpLg0KPiA+Pg0KPiA+IA0KPiA+IEl0J3MgY2xlYXIgdGhhdCBtbXN5cyBpcyBuZWl0
aGVyIGEgcHVyZSBjbG9jayBjb250cm9sbGVyIG5vciBhIHB1cmUNCj4gPiByb3V0aW5nIGNvbnRy
b2xsZXIgZm9yIGRpc3BsYXkgYW5kIG1kcC4gDQo+ID4gDQo+ID4+IEl0J2QgYmUgbmljZSBoYWQg
YSBwcm9wZXIgZGV2aWNlLXRyZWUgd2l0aCBhICJzaW1wbGUtbWZkIiBmb3IgbW1zeXMgZnJvbSB0
aGUNCj4gPj4gYmVnaW5uaW5nIHJlcHJlc2VudGluZyBob3cgcmVhbGx5IGhhcmR3d2FyZSBpcywg
YnV0IEkgdGhpbmsgdGhhdCwgY2hhbmdlIHRoaXMNCj4gPj4gbm93LCB3aWxsIGJyZWFrIGJhY2t3
YXJkIGNvbXBhdGliaWxpdHkuDQo+ID4gDQo+ID4gTWF5YmUgdGhpcyBpcyBhIHNvbHV0aW9uLiBD
dXJyZW50IGRldmljZSB0cmVlIHdvdWxkIHdvcmsgb25seSBvbiBvbGQNCj4gPiBrZXJuZWwgdmVy
c2lvbiB3aXRoIGEgYnVnLCBzbyB0aGlzIG1lYW4gdGhlcmUgaXMgbm8gYW55IGRldmljZSB0cmVl
DQo+ID4gd29ya3Mgb24ga2VybmVsIHZlcnNpb24gd2l0aG91dCBidWcuIFdoeSBkbyB3ZSBjb21w
YXRpYmxlIHdpdGggc3VjaA0KPiA+IGRldmljZSB0cmVlPw0KPiA+IA0KPiANCj4gVGhlIGlkZWEg
YmVoaW5kIHRoaXMgaXMsIHRoYXQgdGhlIGRldmljZS10cmVlIGNvdWxkIGJlIHBhc3NlZCBieSBz
b21lIGJvb3QNCj4gZmlybXdhcmUsIHNvIHRoYXQgdGhlIE9TIGRvIG5vdCBjYXJlIGFib3V0IGl0
LiBGb3IgdGhpcyB3ZSBuZWVkIGEgc3RhYmxlIERUUyBhcw0KPiBvdGhlcndpc2UgbmV3ZXIga2Vy
bmVsIHdpdGggb2xkZXIgRlcgd291bGQgYnJlYWsuDQo+IA0KPiBEVFMgaXMgc3VwcG9zZWQgdG8g
YmUganVzdCBhIGRpZmZlcmVudCBkZXNjcmlwdGlvbiBvZiB0aGUgSFcgbGlrZSBBQ1BJLiBTbyBp
dA0KPiBoYXMgdG8gYmUgY29tcGF0aWJsZSAobmV3ZXIga2VybmVsIHdpdGggb2xkZXIgRFRTIGFu
ZCBpZiBwb3NzaWJsZSB2aWNlIHZlcnNhKS4NCg0KSW4gbXkgdmlldywgdGhlcmUgaXMgbm8gRlcg
KGV4Y2VwdCBzb21lIGJ1Zy1pbnNpZGUgRlcpIHdoaWNoIHdvcmtzIG9uDQp0aGlzIGR0cywgc28g
dGhpcyBkdHMgaXMgaW4gYSBpbml0aWFsIHN0YXRlLiBJIHRoaW5rIHRoZSBjb21wYXRpYmlsaXR5
DQppcyBiYXNlZCBvbiB0aGF0IGR0cyBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIEhXLiBJZiB3ZSBm
aW5kIHRoaXMgZHRzIGRvZXMNCm5vdCBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIEhXIGFuZCBpdCdz
IGluIGEgaW5pdGlhbCBzdGF0ZSwgc2hvdWxkIHdlDQpzdGlsbCBtYWtlIGl0IGNvbXBhdGlibGU/
DQoNCklmIHlvdSBoYXZlIGJldHRlciBzb2x1dGlvbiwganVzdCBsZXQncyBmb3JnZXQgdGhpcy4N
Cg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hdHRoaWFzDQo+IA0KPiA+IFJl
Z2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gPj4NCj4gPj4gSU1ITyBJIHRoaW5rIHRoYXQgY29uc2lk
ZXJpbmcgdGhlIGNsayBkcml2ZXIgYXMgZW50cnkgcG9pbnQgaXMgZmluZSwgYnV0IHRoaXMgaXMN
Cj4gPj4gc29tZXRoaW5nIHRoYXQgdGhlIGNsb2NrIG1haW50YWluZXJzIHNob3VsZCBkZWNpZGUu
DQo+ID4+DQo+ID4+IEFsc28gbm90ZSB0aGF0IHRoaXMgaXMgbm90IG9ubHkgYSBNVDgxNzMgcHJv
YmxlbSBJIGFtIHNlZWluZyB0aGUgc2FtZSBwcm9ibGVtIG9uDQo+ID4+IGFsbCBvdGhlciBNZWRp
YXRlayBTb0NzLg0KPiA+Pg0KPiA+PiBUaGFua3MuDQo+ID4+DQo+ID4+PiBSZWdhcmRzLA0KPiA+
Pj4gQ0sNCj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBBbGwgdGhpcyBzZXJpZXMgd2FzIHRlc3RlZCBv
biB0aGUgQWNlciBSMTMgQ2hyb21lYm9vayBvbmx5Lg0KPiA+Pj4+DQo+ID4+Pj4gRm9yIHJlZmVy
ZW5jZSwgaGVyZSBhcmUgdGhlIGxpbmtzIHRvIHRoZSBvbGQgZGlzY3Vzc2lvbnM6DQo+ID4+Pj4N
Cj4gPj4+PiAqIHY3OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTI0MTIxNw0KPiA+Pj4+ICogdjY6IGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9MjEzMjE5
DQo+ID4+Pj4gKiB2NTogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz00NDA2Mw0KPiA+Pj4+ICogdjQ6DQo+ID4+Pj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA4NzEvDQo+ID4+Pj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA4ODMvDQo+ID4+Pj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA4ODUvDQo+ID4+Pj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA5MTEvDQo+ID4+Pj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA5MTMvDQo+ID4+Pj4gKiB2MzoN
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg1Ny8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg2MS8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg3Ny8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg3NS8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4NS8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4My8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4OS8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2NzkwNy8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2NzkwOS8N
Cj4gPj4+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2NzkwNS8N
Cj4gPj4+PiAqIHYyOiBObyByZWxldmFudCBkaXNjdXNzaW9uLCBzZWUgdjMNCj4gPj4+PiAqIHYx
Og0KPiA+Pj4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NDk3
Lw0KPiA+Pj4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NDk5
Lw0KPiA+Pj4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NTA1
Lw0KPiA+Pj4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NTA3
Lw0KPiA+Pj4+DQo+ID4+Pj4gQmVzdCByZWdhcmRzLA0KPiA+Pj4+ICBFbnJpYw0KPiA+Pj4+DQo+
ID4+Pj4gQ2hhbmdlcyBpbiB2ODoNCj4gPj4+PiAtIEJlIGEgYnVpbHRpbl9wbGF0Zm9ybV9kcml2
ZXIgbGlrZSBvdGhlciBtZWRpYXRlayBtbXN5cyBkcml2ZXJzLg0KPiA+Pj4+IC0gTmV3IHBhdGNo
ZXMgaW50cm9kdWNlZCBpbiB0aGlzIHNlcmllcy4NCj4gPj4+Pg0KPiA+Pj4+IENoYW5nZXMgaW4g
djc6DQo+ID4+Pj4gLSBBZGQgUi1ieSBmcm9tIENLDQo+ID4+Pj4gLSBBZGQgUi1ieSBmcm9tIENL
DQo+ID4+Pj4gLSBGaXggY2hlY2sgb2YgcmV0dXJuIHZhbHVlIG9mIG9mX2Nsa19nZXQNCj4gPj4+
PiAtIEZpeCBpZGVudGF0aW9uDQo+ID4+Pj4gLSBGcmVlIGNsa19kYXRhLT5jbGtzIGFzIHdlbGwN
Cj4gPj4+PiAtIEdldCByaWQgb2YgcHJpdmF0ZSBkYXRhIHN0cnVjdHVyZQ0KPiA+Pj4+DQo+ID4+
Pj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSAoMik6DQo+ID4+Pj4gICBkcm0vbWVkaWF0ZWs6IE1v
dmUgTU1TWVMgY29uZmlndXJhdGlvbiB0byBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGENCj4g
Pj4+PiAgIGNsay9kcm06IG1lZGlhdGVrOiBGaXggbWVkaWF0ZWstZHJtIGRldmljZSBwcm9iaW5n
DQo+ID4+Pj4NCj4gPj4+PiBNYXR0aGlhcyBCcnVnZ2VyICg0KToNCj4gPj4+PiAgIGRybS9tZWRp
YXRlazogVXNlIHJlZ21hcCBmb3IgcmVnaXN0ZXIgYWNjZXNzDQo+ID4+Pj4gICBkcm0vbWVkaWF0
ZWs6IE9taXQgd2FybmluZyBvbiBwcm9iZSBkZWZlcnMNCj4gPj4+PiAgIG1lZGlhOiBtdGstbWRw
OiBDaGVjayByZXR1cm4gdmFsdWUgb2Ygb2ZfY2xrX2dldA0KPiA+Pj4+ICAgY2xrOiBtZWRpYXRl
azogbXQ4MTczOiBTd2l0Y2ggTU1TWVMgdG8gcGxhdGZvcm0gZHJpdmVyDQo+ID4+Pj4NCj4gPj4+
PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICA2ICsN
Cj4gPj4+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwg
ICAxICsNCj4gPj4+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS1tbS5jICAgICAg
ICAgIHwgIDMwICsrKw0KPiA+Pj4+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQyNzEyLW1t
LmMgICAgICAgICAgfCAgNDQgKysrKysNCj4gPj4+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ODE3My1tbS5jICAgICAgICAgIHwgMTcyICsrKysrKysrKysrKysrKysrKw0KPiA+Pj4+ICBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgICAgICAgICAgICAgfCAxMDQgLS0tLS0t
LS0tLS0NCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2NvbG9yLmMg
ICAgIHwgICA1ICstDQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYyAgICAgICB8ICAgNSArLQ0KPiA+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfcmRtYS5jICAgICAgfCAgIDUgKy0NCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYyAgICAgICAgICAgIHwgIDEyICstDQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAgNCArLQ0KPiA+Pj4+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyAgICAgICAgfCAgNTMgKysrLS0tDQo+ID4+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oICAgICAgICB8ICAgNCAr
LQ0KPiA+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oICAg
fCAgNTYgKy0tLS0tDQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jICAgICAgICB8IDExMyArLS0tLS0tLS0tLS0NCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAgIHwgIDEzICstDQo+ID4+Pj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICAgICAgICB8ICAgOCArLQ0KPiA+Pj4+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyAgICAgICAgICAgfCAgIDQgKy0NCj4gPj4+
PiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29tcC5jIHwgICA2ICsN
Cj4gPj4+PiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL210a19tbXN5cy5oICAgICAgIHwg
IDczICsrKysrKysrDQo+ID4+Pj4gIDIwIGZpbGVzIGNoYW5nZWQsIDQwMSBpbnNlcnRpb25zKCsp
LCAzMTcgZGVsZXRpb25zKC0pDQo+ID4+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ4MTczLW1tLmMNCj4gPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9tdGtfbW1zeXMuaA0KPiA+Pj4+DQo+ID4+Pg0KPiA+
Pg0KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+PiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPj4gTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZw0KPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQo+ID4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QNCj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

