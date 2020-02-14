Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4058C15E564
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 17:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405470AbgBNQWc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 11:22:32 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:45247 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405454AbgBNQWa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 11:22:30 -0500
X-UUID: 5c86b13085f6448bb26c2de4c3496cdc-20200215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jz50ovHuZ2AHAX6u5vv4PbRhypnsxyFahZczIki6Y+E=;
        b=YFofNpbvXaSGOcwur6pHAuRri8d4esErOX8+TM0/XglRKiFQiwvWboVD0cVMZbcO4eEg2Bdu3tvLWNbuHdZoNaqJMwcHCdjwAIJky3BCpeSYZXezShWXG87N07MBXE51OUsM5wvD2SrQ7ifnP7mUs3ps5CjZZY0WwXbPVfnDd3Y=;
X-UUID: 5c86b13085f6448bb26c2de4c3496cdc-20200215
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1937256230; Sat, 15 Feb 2020 00:22:25 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 15 Feb 2020 00:21:35 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 15 Feb 2020 00:22:21 +0800
Message-ID: <1581697343.12471.4.camel@mtksdaap41>
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: move mmsys description to
 display
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <matthias.bgg@kernel.org>, <mark.rutland@arm.com>,
        <airlied@linux.ie>, <mturquette@baylibre.com>,
        <dri-devel@lists.freedesktop.org>,
        <laurent.pinchart@ideasonboard.com>,
        <ulrich.hecht+renesas@gmail.com>, <linux-clk@vger.kernel.org>,
        <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
        <wens@csie.org>, mtk01761 <wendell.lin@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <frank-w@public-files.de>,
        <sean.wang@mediatek.com>, <robh+dt@kernel.org>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Matthias Brugger <mbrugger@suse.com>, <sboyd@kernel.org>,
        <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Date:   Sat, 15 Feb 2020 00:22:23 +0800
In-Reply-To: <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
         <20200213201953.15268-2-matthias.bgg@kernel.org>
         <1581662577.17949.3.camel@mtksdaap41>
         <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
         <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzICYgRW5yaWM6DQoNCk9uIEZyaSwgMjAyMC0wMi0xNCBhdCAxMzoxOSArMDEw
MCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gSGkgQ0ssDQo+IA0KPiBPbiAxNC8y
LzIwIDExOjAxLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIDE0
LzAyLzIwMjAgMDc6NDIsIENLIEh1IHdyb3RlOg0KPiA+PiBIaSwgTWF0dGhpYXM6DQo+ID4+DQo+
ID4+IE9uIFRodSwgMjAyMC0wMi0xMyBhdCAyMToxOSArMDEwMCwgbWF0dGhpYXMuYmdnQGtlcm5l
bC5vcmcgd3JvdGU6DQo+ID4+PiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNl
LmNvbT4NCj4gPj4+DQo+ID4+PiBUaGUgbW1zeXMgYmxvY2sgcHJvdmlkZXMgcmVnaXN0ZXJzIGFu
ZCBjbG9ja3MgZm9yIHRoZSBkaXNwbGF5DQo+ID4+PiBzdWJzeXN0ZW0uIFRoZSBiaW5kaW5nIGRl
c2NyaXB0aW9uIHNob3VsZCB0aGVyZWZvcmUgbGl2ZSB0b2dldGhlciB3aXRoDQo+ID4+PiB0aGUg
cmVzdCBvZiB0aGUgZGlzcGxheSBkZXNjcmlwdGlvbnMuIE1vdmUgaXQgdG8gZGlzcGxheS9tZWRp
YXRlay4NCj4gPj4+DQo+ID4+DQo+ID4+IFllcywgZm9yIHRoZSB1cHN0cmVhbWVkIGRyaXZlciwg
b25seSBkaXNwbGF5IChEUk0pIHVzZSBtbXN5cyBjbG9jay4gRm9yDQo+ID4+IHNvbWUgTURQIHBh
dGNoZXMgWzFdIGluIHByb2dyZXNzLCBNRFAgYWxzbyB1c2UgbW1zeXMgY2xvY2suIFNvIHdlIGp1
c3QNCj4gPj4gY29uc2lkZXIgd2hhdCdzIHVwc3RyZWFtZWQgbm93Pw0KPiA+IA0KPiANCj4gTGV0
IG1lIGp1bXAgaW50byB0aGUgZGlzY3Vzc2lvbiwgYW5kIHNvcnJ5IGlmIG15IHF1ZXN0aW9uIGlz
IHNpbGx5IGJlY2F1c2UgSSdtDQo+IGp1c3Qgc3RhcnRpbmcgdG8gbG9vayBhdCB0aGlzIGNvZGUu
DQo+IA0KPiBJTU8gd2Ugc2hvdWxkIGNvbnNpZGVyIGFsbCB0aGUgY2FzZXMgdG8gZmluZCBhIHBy
b3BlciBmaXggb24gYWxsIHRoaXMsIGFuZCBpZg0KPiBNRFAgdXNlcyBhbHNvIG1tc3lzIGNsb2Nr
cyB0aGlzIGFwcHJvYWNoIHdpbGwgbm90IHdvcmsuIEkgdGhpbmsgdGhlIG1haW4gcHJvYmxlbQ0K
PiBoZXJlIGFuZCB0aGUgYmlnIHF1ZXN0aW9uIGlzIHdoYXQgZXhhY3RseSBpcyB0aGUgTU1TWVMg
YmxvY2ssIGlzIGFuIGluZGVwZW5kZW50DQo+IGNsb2NrIGNvbnRyb2xsZXIgdGhhdCBwcm92aWRl
cyBjbG9ja3MgdG8gRFJNIGFuZCBvdGhlciBibG9ja3M/IG9yIGlzIGhhcmRseSB0aWVkDQo+IHRv
IHRoZSBEUk0gYmxvY2sgaW4gc29tZSB3YXk/DQo+IA0KPiBDb3VsZCB5b3UgZ2l2ZSB1cyBhIGJs
b2NrIHNjaGVtYSBvbiBob3cgdGhlIHRoaW5ncyBhcmUgaW50ZXJjb25uZWN0ZWQ/DQo+IA0KPiBJ
ZiBpcyBhbiBpbmRlcGVuZGVudCBjbG9jayBjb250cm9sbGVyIEkgdGhpbmsgdGhlcmUgd2FzIGEg
bWlzdGFrZSB3aGVuIHRoZSBmaXJzdA0KPiBkcm0gZHJpdmVyIHdhcyBwdXNoZWQgYnkgdXNpbmcg
dGhlIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiBhcyBpZA0KPiBmb3IgdGhh
dCBkcml2ZXIuDQo+IA0KDQpJIGNvcnJlY3QgbXkgbWlzdGFrZSBmaXJzdC4gSW4gbXQ4MTczLCBt
ZHAgaGFzIGFscmVhZHkgdXBzdHJlYW1lZCBbMV0uDQoNClRoZXJlIGFyZSBtYW55IHBhcnRpdGlv
bnMgaW4gTWVkaWF0ZWsgU29DLiBtbXN5cyBpcyBvbmUgb2YgdGhlc2UNCnBhcnRpdGlvbi4gVGhl
cmUgYXJlIG1hbnkgZnVuY3Rpb24gYmxvY2tzIGluIG1tc3lzIHN1Y2ggYXMgT1ZMLCBSRE1BLA0K
UlNaLCBXUk9ULCAuLi4uIFNvbWUgZGF0YSByb3V0aW5nIGJldHdlZW4gdGhlc2UgYmxvY2tzIGFy
ZSBmaXhlZCBidXQNCnNvbWUgYXJlIGNoYW5nZWFibGUuIEZvciBhcHBsaWNhdGlvbiwgd2UgZ3Jv
dXAgdGhlbSBpbnRvIGRpc3BsYXkgcGF0aA0KYW5kIG1kcCBwYXRoLiBDbG9jayBnYXRpbmcgcmVn
aXN0ZXIgb2YgdGhlc2UgYmxvY2tzIGFyZSBpbiB0aGUgcmFuZ2Ugb2YNCjB4MTQwMDAwMDAgfiAw
eDE0MDAwZmZmLiBUaGUgcm91dGluZyBjb250cm9sIHJlZ2lzdGVyIG9mIHRoZXNlIGJsb2Nrcw0K
YXJlIGFsc28gaW4gdGhlIHJhbmdlIG9mIDB4MTQwMDAwMDAgfiAweDE0MDAwZmZmLiBTbyB0aGUg
Y29udHJvbA0KZnVuY3Rpb24gYmVsb25nIHRvIG1tc3lzIHBhcnRpdGlvbiBidXQgbm90IGJlbG9u
ZyB0byBzcGVjaWZpYyBmdW5jdGlvbg0KYmxvY2sgd291bGQgaW4gdGhlIHJlZ2lzdGVyIHJhbmdl
IG9mIDB4MTQwMDAwMDAgfiAweDE0MDAwZmZmLiBJIHRoaW5rDQp0aGVyZSBjb3VsZCBiZSB0d28g
ZGVmaW5pdGlvbiBvZiBtbXN5cyBkZXZpY2UuIE9uZSBpcyB0aGF0IG1tc3lzIGRldmljZQ0KaXMg
dGhlIHdob2xlIG1tc3lzIHBhcnRpb3Rpb24sIHNvIE9WTCwgUkRNQSwgLi4uIHdvdWxkIGJlIHN1
YiBkZXZpY2Ugb2YNCml0LiBBbm90aGVyIGlzIHRoYXQgbW1zeXMganVzdCBjb250cm9sIHJlZ2lz
dGVyIG9mIDB4MTQwMDAwMDAgfg0KMHgxNDAwMGZmZiwgc28gaXQncyBwYXJ0IG9mIG1tc3lzIHBh
cnRpdGlvbiBsaWtlIE9WTCwgUkRNQSwgLi4uLi4NCkN1cnJlbnRseSB3ZSBkZWZpbmUgbW1zeXMg
YXMgdGhlIGxhdHRlciBvbmUuIEkndmUgbm8gaWRlYSBob3cgdG8gbWFwDQptbXN5cyBpbnRvIGN1
cnJlbnQgTGludXggaGFyZHdhcmUgY2F0ZWdvcnksIGJ1dCBJIHRoaW5rIGl0IGlzIG5vdCBqdXN0
IGENCmRpc3BsYXkgZGV2aWNlLg0KDQpbMV0NCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2k/aD12NS42LXJjMQ0KDQpSZWdhcmRzLA0KQ0sNCg0K
PiBUaGFua3MsDQo+ICBFbnJpYw0KPiANCj4gDQo+ID4gSSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJz
dGFuZCB5b3UgY29ycmVjdGx5LiBBcmUgeW91IHByb3Bvc2luZyB0byBrZWVwIHRoZQ0KPiA+IGJp
bmRpbmcgZGVzY3JpcHRpb24gaW4gYXJtL21lZGlhdGVrPw0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+
ID4gTWF0dGhpYXMNCj4gPiANCj4gPj4NCj4gPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcGF0Y2gvMTExNDA3NDcvDQo+ID4+DQo+ID4+IFJlZ2FyZHMsDQo+ID4+IENLDQo+ID4+
DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNv
bT4NCj4gPj4+DQo+ID4+PiAtLS0NCj4gPj4+DQo+ID4+PiBDaGFuZ2VzIGluIHY3Og0KPiA+Pj4g
LSBtb3ZlIHRoZSBiaW5kaW5nIGRlc2NyaXB0aW9uDQo+ID4+Pg0KPiA+Pj4gQ2hhbmdlcyBpbiB2
NjogTm9uZQ0KPiA+Pj4gQ2hhbmdlcyBpbiB2NTogTm9uZQ0KPiA+Pj4gQ2hhbmdlcyBpbiB2NDog
Tm9uZQ0KPiA+Pj4gQ2hhbmdlcyBpbiB2MzogTm9uZQ0KPiA+Pj4gQ2hhbmdlcyBpbiB2MjogTm9u
ZQ0KPiA+Pj4NCj4gPj4+ICAuLi4vYmluZGluZ3Mve2FybSA9PiBkaXNwbGF5fS9tZWRpYXRlay9t
ZWRpYXRlayxtbXN5cy50eHQgICAgICAgICB8IDANCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMCBp
bnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQ0KPiA+Pj4gIHJlbmFtZSBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mve2FybSA9PiBkaXNwbGF5fS9tZWRpYXRlay9tZWRpYXRlayxt
bXN5cy50eHQgKDEwMCUpDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
bW1zeXMudHh0DQo+ID4+PiBzaW1pbGFyaXR5IGluZGV4IDEwMCUNCj4gPj4+IHJlbmFtZSBmcm9t
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWss
bW1zeXMudHh0DQo+ID4+PiByZW5hbWUgdG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQo+ID4+DQo+ID4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4+IGxpbnV4LWFy
bS1rZXJuZWwgbWFpbGluZyBsaXN0DQo+ID4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZw0KPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFybS1rZXJuZWwNCj4gPj4NCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0K

