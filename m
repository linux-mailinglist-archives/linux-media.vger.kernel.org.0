Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8FC16795C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 10:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgBUJ1U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 04:27:20 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:19675 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726853AbgBUJ1T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 04:27:19 -0500
X-UUID: 38f491a289a34d71a6578ab7c82cb42a-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xtQVmXJH4GNtdqJc6//nA3nfWidVuWpS9hv2OZGn7I4=;
        b=Z22Ylokvgnb5mQAbC5uzOOjkFyVjnRLONGCj/MjLm5uE7uNgxKkcidqA5JFqr9//3uDFJitPn211/tgiB4jDIgJJMLX2nK3hqJqyTqXFtU6XaljmnL70/HBSKyyHAHQKDzh31AcfSce2PaNbeOR5CEAQfo6xl0Cn/hwbO3cndWQ=;
X-UUID: 38f491a289a34d71a6578ab7c82cb42a-20200221
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1067637433; Fri, 21 Feb 2020 17:27:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 17:25:22 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 21 Feb 2020 17:27:39 +0800
Message-ID: <1582277229.25992.9.camel@mtksdaap41>
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <mark.rutland@arm.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
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
        <linux-arm-kernel@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, <frank-w@public-files.de>,
        Seiya Wang <seiya.wang@mediatek.com>, <sean.wang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Thomas Gleixner" <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Fabien Parent <fparent@baylibre.com>, <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <matthias.bgg@kernel.org>
Date:   Fri, 21 Feb 2020 17:27:09 +0800
In-Reply-To: <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
         <1582259996.1846.7.camel@mtksdaap41>
         <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBGcmksIDIwMjAtMDItMjEgYXQgMDk6NTYgKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IEhpIENLLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHF1
aWNrIGFuc3dlci4NCj4gDQo+IE9uIDIxLzIvMjAgNTozOSwgQ0sgSHUgd3JvdGU6DQo+ID4gSGks
IEVucmljOg0KPiA+IA0KPiA+IE9uIFRodSwgMjAyMC0wMi0yMCBhdCAxODoyMSArMDEwMCwgRW5y
aWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gPj4gRGVhciBhbGwsDQo+ID4+DQo+ID4+IFRo
b3NlIHBhdGNoZXMgYXJlIGludGVuZGVkIHRvIHNvbHZlIGFuIG9sZCBzdGFuZGluZyBpc3N1ZSBv
biBzb21lDQo+ID4+IE1lZGlhdGVrIGRldmljZXMgKG10ODE3MywgbXQyNzAxIGFuZCBtdDI3MTIp
IGluIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHdheQ0KPiA+PiB0byB0aGUgcHJlY2VkZW50IHNlcmll
cy4NCj4gPj4NCj4gPj4gVXAgdG8gbm93IGJvdGggZHJpdmVycywgY2xvY2sgYW5kIGRybSBhcmUg
cHJvYmVkIHdpdGggdGhlIHNhbWUgZGV2aWNlIHRyZWUNCj4gPj4gY29tcGF0aWJsZS4gQnV0IG9u
bHkgdGhlIGZpcnN0IGRyaXZlciBnZXQgcHJvYmVkLCB3aGljaCBpbiBlZmZlY3QgYnJlYWtzDQo+
ID4+IGdyYXBoaWNzIG9uIHRob3NlIGRldmljZXMuDQo+ID4+DQo+ID4+IFRoZSB2ZXJzaW9uIGVp
Z2h0IG9mIHRoZSBzZXJpZXMgdHJpZXMgdG8gc29sdmUgdGhlIHByb2JsZW0gd2l0aCBhDQo+ID4+
IGRpZmZlcmVudCBhcHByb2FjaCB0aGFuIHRoZSBwcmV2aW91cyBzZXJpZXMgYnV0IHNpbWlsYXIg
dG8gaG93IGlzIHNvbHZlZA0KPiA+PiBvbiBvdGhlciBNZWRpYXRlayBkZXZpY2VzLg0KPiA+Pg0K
PiA+PiBUaGUgTU1TWVMgKE11bHRpbWVkaWEgc3Vic3lzdGVtKSBpbiBNZWRpYXRlayBTb0NzIGhh
cyBzb21lIHJlZ2lzdGVycyB0bw0KPiA+PiBjb250cm9sIGNsb2NrIGdhdGVzICh3aGljaCBpcyB1
c2VkIGluIHRoZSBjbGsgZHJpdmVyKSBhbmQgc29tZSByZWdpc3RlcnMNCj4gPj4gdG8gc2V0IHRo
ZSByb3V0aW5nIGFuZCBlbmFibGUgdGhlIGRpZmZlcm5ldCBibG9ja3Mgb2YgdGhlIGRpc3BsYXkN
Cj4gPj4gYW5kIE1EUCAoTWVkaWEgRGF0YSBQYXRoKSBzdWJzeXN0ZW0uIE9uIHRoaXMgc2VyaWVz
IHRoZSBjbGsgZHJpdmVyIGlzDQo+ID4+IG5vdCBhIHB1cmUgY2xvY2sgY29udHJvbGxlciBidXQg
YSBzeXN0ZW0gY29udHJvbGxlciB0aGF0IGNhbiBwcm92aWRlDQo+ID4+IGFjY2VzcyB0byB0aGUg
c2hhcmVkIHJlZ2lzdGVycyBiZXR3ZWVuIHRoZSBkaWZmZXJlbnQgZHJpdmVycyB0aGF0IG5lZWQN
Cj4gPj4gaXQgKG1lZGlhdGVrLWRybSBhbmQgbWVkaWF0ZWstbWRwKS4gQW5kIHRoZSBiaWdnZXN0
IGNoYW5nZSBpcywgdGhhdCBpbg0KPiA+PiB0aGlzIHZlcnNpb24sIGNsayBkcml2ZXIgaXMgdGhl
IGVudHJ5IHBvaW50IChwYXJlbnQpIHdoaWNoIHdpbGwgdHJpZ2dlcg0KPiA+PiB0aGUgcHJvYmUg
b2YgdGhlIGNvcnJlc3BvbmRpbmcgbWVkaWF0ZWstZHJtIGRyaXZlciBhbmQgcGFzcyBpdHMgTU1T
WVMNCj4gPj4gcGxhdGZvcm0gZGF0YSBmb3IgZGlzcGxheSBjb25maWd1cmF0aW9uLg0KPiA+IA0K
PiA+IFdoZW4gbW1zeXMgaXMgYSBzeXN0ZW0gY29udHJvbGxlciwgSSBwcmVmZXIgdG8gcGxhY2Ug
bW1zeXMgaW4NCj4gPiBkcml2ZXJzL3NvYy9tZWRpYXRlaywgYW5kIGl0IHNoYXJlIHJlZ2lzdGVy
cyBmb3IgY2xvY2ssIGRpc3BsYXksIGFuZCBtZHANCj4gPiBkcml2ZXIuIFRoaXMgbWVhbnMgdGhl
IHByb2JlIGZ1bmN0aW9uIGlzIHBsYWNlZCBpbg0KPiA+IGRyaXZlcnMvc29jL21lZGlhdGVrICxp
dHMgZGlzcGxheSBjbG9jayBmdW5jdGlvbiwgbWRwIGNsb2NrIGZ1bmN0aW9uIGFyZQ0KPiA+IHBs
YWNlZCBpbiBkcml2ZXJzL2NsaywgZGlzcGxheSByb3V0aW5nIGFyZSBwbGFjZWQgaW4gZHJpdmVy
cy9ncHUvZHJtLA0KPiA+IGFuZCBtZHAgcm91dGluZyBhcmUgcGxhY2VkIGluIGRpcnZlcnMvdmlk
ZW8uDQo+ID4gDQo+IA0KPiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBidXQgSSBhbSBub3Qg
c3VyZSB0aGlzIG1ha2VzIHRoZSBjb2RlIGNsZWFyZXIgYW5kDQo+IHVzZWZ1bC4gVGhlIGRyaXZl
ciBpbiBkcml2ZXJzL3NvYy9tZWRpYXRlayB3aWxsIGJlIGEgc2ltcGxlIGR1bW15IGltcGxlbWVu
dGF0aW9uDQo+IG9mIGEgInNpbXBsZS1tZmQiIGRldmljZSAoYSBkcml2ZXIgdGhhdCBzaW1wbHkg
bWF0Y2hlcyB3aXRoDQo+ICJtZWRpYXRlayxtdDgxNzMtbW1zeXMiIGFuZCBpbnN0YW50aWF0ZXMg
dGhlICJjbGstbXQ4MTczLW1tIiBhbmQgdGhlDQo+ICJtZWRpYXRlay1kcm0iIGRyaXZlciAobm90
ZSB0aGF0IG1lZGlhdGVrLW1kcCIgaXMgYWxyZWFkeSBpbnN0YW50aWF0ZWQgdmlhDQo+IGRldmlj
ZS10cmVlKS4NCj4gDQoNCkl0J3MgY2xlYXIgdGhhdCBtbXN5cyBpcyBuZWl0aGVyIGEgcHVyZSBj
bG9jayBjb250cm9sbGVyIG5vciBhIHB1cmUNCnJvdXRpbmcgY29udHJvbGxlciBmb3IgZGlzcGxh
eSBhbmQgbWRwLiANCg0KPiBJdCdkIGJlIG5pY2UgaGFkIGEgcHJvcGVyIGRldmljZS10cmVlIHdp
dGggYSAic2ltcGxlLW1mZCIgZm9yIG1tc3lzIGZyb20gdGhlDQo+IGJlZ2lubmluZyByZXByZXNl
bnRpbmcgaG93IHJlYWxseSBoYXJkd3dhcmUgaXMsIGJ1dCBJIHRoaW5rIHRoYXQsIGNoYW5nZSB0
aGlzDQo+IG5vdywgd2lsbCBicmVhayBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KDQpNYXliZSB0
aGlzIGlzIGEgc29sdXRpb24uIEN1cnJlbnQgZGV2aWNlIHRyZWUgd291bGQgd29yayBvbmx5IG9u
IG9sZA0Ka2VybmVsIHZlcnNpb24gd2l0aCBhIGJ1Zywgc28gdGhpcyBtZWFuIHRoZXJlIGlzIG5v
IGFueSBkZXZpY2UgdHJlZQ0Kd29ya3Mgb24ga2VybmVsIHZlcnNpb24gd2l0aG91dCBidWcuIFdo
eSBkbyB3ZSBjb21wYXRpYmxlIHdpdGggc3VjaA0KZGV2aWNlIHRyZWU/DQoNClJlZ2FyZHMsDQpD
Sw0KDQo+IA0KPiBJTUhPIEkgdGhpbmsgdGhhdCBjb25zaWRlcmluZyB0aGUgY2xrIGRyaXZlciBh
cyBlbnRyeSBwb2ludCBpcyBmaW5lLCBidXQgdGhpcyBpcw0KPiBzb21ldGhpbmcgdGhhdCB0aGUg
Y2xvY2sgbWFpbnRhaW5lcnMgc2hvdWxkIGRlY2lkZS4NCj4gDQo+IEFsc28gbm90ZSB0aGF0IHRo
aXMgaXMgbm90IG9ubHkgYSBNVDgxNzMgcHJvYmxlbSBJIGFtIHNlZWluZyB0aGUgc2FtZSBwcm9i
bGVtIG9uDQo+IGFsbCBvdGhlciBNZWRpYXRlayBTb0NzLg0KPiANCj4gVGhhbmtzLg0KPiANCj4g
PiBSZWdhcmRzLA0KPiA+IENLDQo+ID4gDQo+ID4+DQo+ID4+IEFsbCB0aGlzIHNlcmllcyB3YXMg
dGVzdGVkIG9uIHRoZSBBY2VyIFIxMyBDaHJvbWVib29rIG9ubHkuDQo+ID4+DQo+ID4+IEZvciBy
ZWZlcmVuY2UsIGhlcmUgYXJlIHRoZSBsaW5rcyB0byB0aGUgb2xkIGRpc2N1c3Npb25zOg0KPiA+
Pg0KPiA+PiAqIHY3OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTI0MTIxNw0KPiA+PiAqIHY2OiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTIxMzIxOQ0K
PiA+PiAqIHY1OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvbGlzdC8/c2VyaWVzPTQ0MDYzDQo+ID4+ICogdjQ6DQo+ID4+ICAgKiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNTMwODcxLw0KPiA+PiAgICogaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDUzMDg4My8NCj4gPj4gICAqIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA4ODUvDQo+ID4+ICAgKiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwNTMwOTExLw0KPiA+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDUzMDkxMy8NCj4gPj4gKiB2MzoNCj4gPj4gICAqIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NTcvDQo+ID4+ICAgKiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODYxLw0KPiA+PiAgICogaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg3Ny8NCj4gPj4gICAqIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NzUvDQo+ID4+ICAgKiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODg1Lw0KPiA+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4My8NCj4gPj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTAzNjc4ODkvDQo+ID4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzEwMzY3OTA3Lw0KPiA+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wYXRjaC8xMDM2NzkwOS8NCj4gPj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTAzNjc5MDUvDQo+ID4+ICogdjI6IE5vIHJlbGV2YW50IGRpc2N1c3Npb24sIHNl
ZSB2Mw0KPiA+PiAqIHYxOg0KPiA+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
YXRjaC8xMDAxNjQ5Ny8NCj4gPj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTAwMTY0OTkvDQo+ID4+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNo
LzEwMDE2NTA1Lw0KPiA+PiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MDAxNjUwNy8NCj4gPj4NCj4gPj4gQmVzdCByZWdhcmRzLA0KPiA+PiAgRW5yaWMNCj4gPj4NCj4g
Pj4gQ2hhbmdlcyBpbiB2ODoNCj4gPj4gLSBCZSBhIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGxp
a2Ugb3RoZXIgbWVkaWF0ZWsgbW1zeXMgZHJpdmVycy4NCj4gPj4gLSBOZXcgcGF0Y2hlcyBpbnRy
b2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0KPiA+Pg0KPiA+PiBDaGFuZ2VzIGluIHY3Og0KPiA+PiAt
IEFkZCBSLWJ5IGZyb20gQ0sNCj4gPj4gLSBBZGQgUi1ieSBmcm9tIENLDQo+ID4+IC0gRml4IGNo
ZWNrIG9mIHJldHVybiB2YWx1ZSBvZiBvZl9jbGtfZ2V0DQo+ID4+IC0gRml4IGlkZW50YXRpb24N
Cj4gPj4gLSBGcmVlIGNsa19kYXRhLT5jbGtzIGFzIHdlbGwNCj4gPj4gLSBHZXQgcmlkIG9mIHBy
aXZhdGUgZGF0YSBzdHJ1Y3R1cmUNCj4gPj4NCj4gPj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSAo
Mik6DQo+ID4+ICAgZHJtL21lZGlhdGVrOiBNb3ZlIE1NU1lTIGNvbmZpZ3VyYXRpb24gdG8gaW5j
bHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhDQo+ID4+ICAgY2xrL2RybTogbWVkaWF0ZWs6IEZpeCBt
ZWRpYXRlay1kcm0gZGV2aWNlIHByb2JpbmcNCj4gPj4NCj4gPj4gTWF0dGhpYXMgQnJ1Z2dlciAo
NCk6DQo+ID4+ICAgZHJtL21lZGlhdGVrOiBVc2UgcmVnbWFwIGZvciByZWdpc3RlciBhY2Nlc3MN
Cj4gPj4gICBkcm0vbWVkaWF0ZWs6IE9taXQgd2FybmluZyBvbiBwcm9iZSBkZWZlcnMNCj4gPj4g
ICBtZWRpYTogbXRrLW1kcDogQ2hlY2sgcmV0dXJuIHZhbHVlIG9mIG9mX2Nsa19nZXQNCj4gPj4g
ICBjbGs6IG1lZGlhdGVrOiBtdDgxNzM6IFN3aXRjaCBNTVNZUyB0byBwbGF0Zm9ybSBkcml2ZXIN
Cj4gPj4NCj4gPj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAg
ICB8ICAgNiArDQo+ID4+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgfCAgIDEgKw0KPiA+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS1tbS5j
ICAgICAgICAgIHwgIDMwICsrKw0KPiA+PiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Mjcx
Mi1tbS5jICAgICAgICAgIHwgIDQ0ICsrKysrDQo+ID4+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ4MTczLW1tLmMgICAgICAgICAgfCAxNzIgKysrKysrKysrKysrKysrKysrDQo+ID4+ICBk
cml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgICAgICAgICAgICAgfCAxMDQgLS0tLS0t
LS0tLS0NCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9jb2xvci5jICAg
ICB8ICAgNSArLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
ICAgICAgIHwgICA1ICstDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
cmRtYS5jICAgICAgfCAgIDUgKy0NCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMgICAgICAgICAgICB8ICAxMiArLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jICAgICAgIHwgICA0ICstDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYyAgICAgICAgfCAgNTMgKysrLS0tDQo+ID4+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgICAgICAgfCAgIDQgKy0NCj4gPj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggICB8ICA1NiArLS0tLS0NCj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAgICAgICB8IDExMyAr
LS0tLS0tLS0tLS0NCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5o
ICAgICAgICB8ICAxMyArLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YyAgICAgICAgICAgIHwgICA4ICstDQo+ID4+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYyAgICAgICAgICAgfCAgIDQgKy0NCj4gPj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLW1kcC9tdGtfbWRwX2NvbXAuYyB8ICAgNiArDQo+ID4+ICBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RhdGEvbXRrX21tc3lzLmggICAgICAgfCAgNzMgKysrKysrKysNCj4gPj4gIDIwIGZpbGVz
IGNoYW5nZWQsIDQwMSBpbnNlcnRpb25zKCspLCAzMTcgZGVsZXRpb25zKC0pDQo+ID4+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My1tbS5jDQo+ID4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL210a19tbXN5
cy5oDQo+ID4+DQo+ID4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

