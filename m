Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95314166E96
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 05:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbgBUEkH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 23:40:07 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:54134 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729229AbgBUEkH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 23:40:07 -0500
X-UUID: e13c9e81f83840d8976ee203bb4026c7-20200221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=c6LxKOrtf7zqmWMQ6HOJ1i4yDenxu3IQklK++RZdHNY=;
        b=rATm3auciYfKwqBo300ayxZ+epaBIPidFLEOlYR9R+lDw3Sp+wVUGJfQ/SnMCJj2IlLlRrnfPhygOlPO76AN/7FP6irXcAVyfhVWuWJj5+EoGJyr4O+QUJUqF41kXVEViY6blmVtLf130JmWPN0aA6yAcj65lUJZjI08MHLM4xs=;
X-UUID: e13c9e81f83840d8976ee203bb4026c7-20200221
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1525354134; Fri, 21 Feb 2020 12:39:57 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 21 Feb 2020 12:39:09 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 21 Feb 2020 12:40:26 +0800
Message-ID: <1582259996.1846.7.camel@mtksdaap41>
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <rdunlap@infradead.org>, <dri-devel@lists.freedesktop.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-clk@vger.kernel.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, <wens@csie.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <sean.wang@mediatek.com>, <frank-w@public-files.de>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <mbrugger@suse.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Richard Fontana <rfontana@redhat.com>,
        <linux-kernel@vger.kernel.org>, <matthias.bgg@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Fabien Parent <fparent@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Nicolas Boichat" <drinkcat@chromium.org>,
        Owen Chen <owen.chen@mediatek.com>
Date:   Fri, 21 Feb 2020 12:39:56 +0800
In-Reply-To: <20200220172147.919996-1-enric.balletbo@collabora.com>
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBUaHUsIDIwMjAtMDItMjAgYXQgMTg6MjEgKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IERlYXIgYWxsLA0KPiANCj4gVGhvc2UgcGF0Y2hlcyBh
cmUgaW50ZW5kZWQgdG8gc29sdmUgYW4gb2xkIHN0YW5kaW5nIGlzc3VlIG9uIHNvbWUNCj4gTWVk
aWF0ZWsgZGV2aWNlcyAobXQ4MTczLCBtdDI3MDEgYW5kIG10MjcxMikgaW4gYSBzbGlnaHRseSBk
aWZmZXJlbnQgd2F5DQo+IHRvIHRoZSBwcmVjZWRlbnQgc2VyaWVzLg0KPiANCj4gVXAgdG8gbm93
IGJvdGggZHJpdmVycywgY2xvY2sgYW5kIGRybSBhcmUgcHJvYmVkIHdpdGggdGhlIHNhbWUgZGV2
aWNlIHRyZWUNCj4gY29tcGF0aWJsZS4gQnV0IG9ubHkgdGhlIGZpcnN0IGRyaXZlciBnZXQgcHJv
YmVkLCB3aGljaCBpbiBlZmZlY3QgYnJlYWtzDQo+IGdyYXBoaWNzIG9uIHRob3NlIGRldmljZXMu
DQo+IA0KPiBUaGUgdmVyc2lvbiBlaWdodCBvZiB0aGUgc2VyaWVzIHRyaWVzIHRvIHNvbHZlIHRo
ZSBwcm9ibGVtIHdpdGggYQ0KPiBkaWZmZXJlbnQgYXBwcm9hY2ggdGhhbiB0aGUgcHJldmlvdXMg
c2VyaWVzIGJ1dCBzaW1pbGFyIHRvIGhvdyBpcyBzb2x2ZWQNCj4gb24gb3RoZXIgTWVkaWF0ZWsg
ZGV2aWNlcy4NCj4gDQo+IFRoZSBNTVNZUyAoTXVsdGltZWRpYSBzdWJzeXN0ZW0pIGluIE1lZGlh
dGVrIFNvQ3MgaGFzIHNvbWUgcmVnaXN0ZXJzIHRvDQo+IGNvbnRyb2wgY2xvY2sgZ2F0ZXMgKHdo
aWNoIGlzIHVzZWQgaW4gdGhlIGNsayBkcml2ZXIpIGFuZCBzb21lIHJlZ2lzdGVycw0KPiB0byBz
ZXQgdGhlIHJvdXRpbmcgYW5kIGVuYWJsZSB0aGUgZGlmZmVybmV0IGJsb2NrcyBvZiB0aGUgZGlz
cGxheQ0KPiBhbmQgTURQIChNZWRpYSBEYXRhIFBhdGgpIHN1YnN5c3RlbS4gT24gdGhpcyBzZXJp
ZXMgdGhlIGNsayBkcml2ZXIgaXMNCj4gbm90IGEgcHVyZSBjbG9jayBjb250cm9sbGVyIGJ1dCBh
IHN5c3RlbSBjb250cm9sbGVyIHRoYXQgY2FuIHByb3ZpZGUNCj4gYWNjZXNzIHRvIHRoZSBzaGFy
ZWQgcmVnaXN0ZXJzIGJldHdlZW4gdGhlIGRpZmZlcmVudCBkcml2ZXJzIHRoYXQgbmVlZA0KPiBp
dCAobWVkaWF0ZWstZHJtIGFuZCBtZWRpYXRlay1tZHApLiBBbmQgdGhlIGJpZ2dlc3QgY2hhbmdl
IGlzLCB0aGF0IGluDQo+IHRoaXMgdmVyc2lvbiwgY2xrIGRyaXZlciBpcyB0aGUgZW50cnkgcG9p
bnQgKHBhcmVudCkgd2hpY2ggd2lsbCB0cmlnZ2VyDQo+IHRoZSBwcm9iZSBvZiB0aGUgY29ycmVz
cG9uZGluZyBtZWRpYXRlay1kcm0gZHJpdmVyIGFuZCBwYXNzIGl0cyBNTVNZUw0KPiBwbGF0Zm9y
bSBkYXRhIGZvciBkaXNwbGF5IGNvbmZpZ3VyYXRpb24uDQoNCldoZW4gbW1zeXMgaXMgYSBzeXN0
ZW0gY29udHJvbGxlciwgSSBwcmVmZXIgdG8gcGxhY2UgbW1zeXMgaW4NCmRyaXZlcnMvc29jL21l
ZGlhdGVrLCBhbmQgaXQgc2hhcmUgcmVnaXN0ZXJzIGZvciBjbG9jaywgZGlzcGxheSwgYW5kIG1k
cA0KZHJpdmVyLiBUaGlzIG1lYW5zIHRoZSBwcm9iZSBmdW5jdGlvbiBpcyBwbGFjZWQgaW4NCmRy
aXZlcnMvc29jL21lZGlhdGVrICxpdHMgZGlzcGxheSBjbG9jayBmdW5jdGlvbiwgbWRwIGNsb2Nr
IGZ1bmN0aW9uIGFyZQ0KcGxhY2VkIGluIGRyaXZlcnMvY2xrLCBkaXNwbGF5IHJvdXRpbmcgYXJl
IHBsYWNlZCBpbiBkcml2ZXJzL2dwdS9kcm0sDQphbmQgbWRwIHJvdXRpbmcgYXJlIHBsYWNlZCBp
biBkaXJ2ZXJzL3ZpZGVvLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gQWxsIHRoaXMgc2VyaWVz
IHdhcyB0ZXN0ZWQgb24gdGhlIEFjZXIgUjEzIENocm9tZWJvb2sgb25seS4NCj4gDQo+IEZvciBy
ZWZlcmVuY2UsIGhlcmUgYXJlIHRoZSBsaW5rcyB0byB0aGUgb2xkIGRpc2N1c3Npb25zOg0KPiAN
Cj4gKiB2NzogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL2xpc3QvP3Nlcmllcz0yNDEyMTcNCj4gKiB2NjogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz0yMTMyMTkNCj4gKiB2NTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3Qv
P3Nlcmllcz00NDA2Mw0KPiAqIHY0Og0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMDUzMDg3MS8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTA1MzA4ODMvDQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEw
NTMwODg1Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDUzMDkx
MS8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA5MTMvDQo+
ICogdjM6DQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODU3
Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg2MS8NCj4g
ICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NzcvDQo+ICAgKiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODc1Lw0KPiAgICogaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4NS8NCj4gICAqIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4ODMvDQo+ICAgKiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODg5Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDM2NzkwNy8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTAzNjc5MDkvDQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzEwMzY3OTA1Lw0KPiAqIHYyOiBObyByZWxldmFudCBkaXNjdXNzaW9uLCBzZWUgdjMNCj4g
KiB2MToNCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAwMTY0OTcv
DQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NDk5Lw0KPiAg
ICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDAxNjUwNS8NCj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAwMTY1MDcvDQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+ICBFbnJpYw0KPiANCj4gQ2hhbmdlcyBpbiB2ODoNCj4gLSBCZSBhIGJ1aWx0aW5f
cGxhdGZvcm1fZHJpdmVyIGxpa2Ugb3RoZXIgbWVkaWF0ZWsgbW1zeXMgZHJpdmVycy4NCj4gLSBO
ZXcgcGF0Y2hlcyBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0KPiANCj4gQ2hhbmdlcyBpbiB2
NzoNCj4gLSBBZGQgUi1ieSBmcm9tIENLDQo+IC0gQWRkIFItYnkgZnJvbSBDSw0KPiAtIEZpeCBj
aGVjayBvZiByZXR1cm4gdmFsdWUgb2Ygb2ZfY2xrX2dldA0KPiAtIEZpeCBpZGVudGF0aW9uDQo+
IC0gRnJlZSBjbGtfZGF0YS0+Y2xrcyBhcyB3ZWxsDQo+IC0gR2V0IHJpZCBvZiBwcml2YXRlIGRh
dGEgc3RydWN0dXJlDQo+IA0KPiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhICgyKToNCj4gICBkcm0v
bWVkaWF0ZWs6IE1vdmUgTU1TWVMgY29uZmlndXJhdGlvbiB0byBpbmNsdWRlL2xpbnV4L3BsYXRm
b3JtX2RhdGENCj4gICBjbGsvZHJtOiBtZWRpYXRlazogRml4IG1lZGlhdGVrLWRybSBkZXZpY2Ug
cHJvYmluZw0KPiANCj4gTWF0dGhpYXMgQnJ1Z2dlciAoNCk6DQo+ICAgZHJtL21lZGlhdGVrOiBV
c2UgcmVnbWFwIGZvciByZWdpc3RlciBhY2Nlc3MNCj4gICBkcm0vbWVkaWF0ZWs6IE9taXQgd2Fy
bmluZyBvbiBwcm9iZSBkZWZlcnMNCj4gICBtZWRpYTogbXRrLW1kcDogQ2hlY2sgcmV0dXJuIHZh
bHVlIG9mIG9mX2Nsa19nZXQNCj4gICBjbGs6IG1lZGlhdGVrOiBtdDgxNzM6IFN3aXRjaCBNTVNZ
UyB0byBwbGF0Zm9ybSBkcml2ZXINCj4gDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmln
ICAgICAgICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvTWFrZWZp
bGUgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDI3MDEtbW0uYyAgICAgICAgICB8ICAzMCArKysNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Ns
ay1tdDI3MTItbW0uYyAgICAgICAgICB8ICA0NCArKysrKw0KPiAgZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLW10ODE3My1tbS5jICAgICAgICAgIHwgMTcyICsrKysrKysrKysrKysrKysrKw0KPiAg
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My5jICAgICAgICAgICAgIHwgMTA0IC0tLS0t
LS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgICAg
fCAgIDUgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAg
ICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAg
ICAgIHwgICA1ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jICAgICAg
ICAgICAgfCAgMTIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
YyAgICAgICB8ICAgNCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMgICAgICAgIHwgIDUzICsrKy0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmggICAgICAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oICAgfCAgNTYgKy0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYyAgICAgICAgfCAxMTMgKy0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgICAgICAgfCAgMTMgKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgICAgICAgICAgICB8ICAgOCArLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgICAgICAgICAgIHwgICA0ICstDQo+ICBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMgfCAgIDYgKw0KPiAgaW5j
bHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL210a19tbXN5cy5oICAgICAgIHwgIDczICsrKysrKysr
DQo+ICAyMCBmaWxlcyBjaGFuZ2VkLCA0MDEgaW5zZXJ0aW9ucygrKSwgMzE3IGRlbGV0aW9ucygt
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMt
bW0uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGF0YS9t
dGtfbW1zeXMuaA0KPiANCg0K

