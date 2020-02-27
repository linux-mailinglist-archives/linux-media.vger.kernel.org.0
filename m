Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99176170E5C
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 03:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728298AbgB0CT6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 21:19:58 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:63792 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728178AbgB0CT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 21:19:57 -0500
X-UUID: 23464d44001a40d2a641030f2d998ab9-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=K4gGve8y0GjmB4JegJVgO+MM4WVhEqGsHCW/PaLyMBE=;
        b=NmTxK+hDuJjB44uoqb2qj3OW6lWT6qKXjcslPrTxOlIjF0M6JmpTjx6/+1GSZcRWXz2ieI61kB8O2o3jmaM2Xhl7yJkCPBZq3evrfs8aXvNYGaJelcUFHPCpWDL4WtaOyIiQj0StsM5tyJBAdSWjb1An2aFmO9KplErdHO3WmFo=;
X-UUID: 23464d44001a40d2a641030f2d998ab9-20200227
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 141035688; Thu, 27 Feb 2020 10:19:47 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 10:18:53 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 10:19:51 +0800
Message-ID: <1582769985.20746.10.camel@mtksdaap41>
Subject: Re: [PATCH v9 0/4] arm64: mediatek: Fix mt8173 mmsys device probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Kate Stewart" <kstewart@linuxfoundation.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        <linux-clk@vger.kernel.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
        <wens@csie.org>, <linux-arm-kernel@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <frank-w@public-files.de>, Seiya Wang <seiya.wang@mediatek.com>,
        <sean.wang@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, <matthias.bgg@kernel.org>
Date:   Thu, 27 Feb 2020 10:19:45 +0800
In-Reply-To: <20200226105419.632771-1-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpJIHdvdWxkIGxpa2UgeW91IHRvIG1vZGlmeSBtbXN5cyBiaW5kaW5nIGRv
Y3VtZW50LiBJbiBjdXJyZW50IGRvY3VtZW50LA0KbW1zeXMgaXMgYSBjbG9jayBjb250cm9sbGVy
LCBidXQgSSB0aGluayBpdCdzIGEgc3lzdGVtIGNvbnRyb2xsZXINCmluY2x1ZGluZyBjbG9jayBj
b250cm9sLCByb3V0aW5nIGNvbnRyb2wsIGFuZCBtaXNjZWxsYW5lb3VzIGNvbnRyb2wgaW4NCm1t
c3lzIHBhcnRpdGlvbi4NCg0KUmVnYXJkcywNCkNLDQoNCk9uIFdlZCwgMjAyMC0wMi0yNiBhdCAx
MTo1NCArMDEwMCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gRGVhciBhbGwsDQo+
IA0KPiBUaG9zZSBwYXRjaGVzIGFyZSBpbnRlbmRlZCB0byBzb2x2ZSBhbiBvbGQgc3RhbmRpbmcg
aXNzdWUgb24gc29tZQ0KPiBNZWRpYXRlayBkZXZpY2VzIChtdDgxNzMsIG10MjcwMSBhbmQgbXQy
NzEyKS4NCj4gDQo+IFVwIHRvIG5vdyBib3RoIGRyaXZlcnMsIGNsb2NrIGFuZCBkcm0gYXJlIHBy
b2JlZCB3aXRoIHRoZSBzYW1lIGRldmljZSB0cmVlDQo+IGNvbXBhdGlibGUuIEJ1dCBvbmx5IHRo
ZSBmaXJzdCBkcml2ZXIgZ2V0cyBwcm9iZWQsIHdoaWNoIGluIGVmZmVjdCBicmVha3MNCj4gZ3Jh
cGhpY3Mgb24gdGhvc2UgZGV2aWNlcy4NCj4gDQo+IFRoZSBNTVNZUyAoTXVsdGltZWRpYSBzdWJz
eXN0ZW0pIGluIE1lZGlhdGVrIFNvQ3MgaGFzIHNvbWUgcmVnaXN0ZXJzIHRvDQo+IGNvbnRyb2wg
Y2xvY2sgZ2F0ZXMgKHdoaWNoIGlzIHVzZWQgaW4gdGhlIGNsayBkcml2ZXIpIGFuZCBzb21lIHJl
Z2lzdGVycw0KPiB0byBzZXQgdGhlIHJvdXRpbmcgYW5kIGVuYWJsZSB0aGUgZGlmZmVybmV0IGJs
b2NrcyBvZiB0aGUgZGlzcGxheQ0KPiBhbmQgTURQIChNZWRpYSBEYXRhIFBhdGgpIHN1YnN5c3Rl
bS4gT24gdGhpcyBzZXJpZXMgdGhlIGNsayBkcml2ZXIgaXMNCj4gbm90IGEgcHVyZSBjbG9jayBj
b250cm9sbGVyIGJ1dCBhIHN5c3RlbSBjb250cm9sbGVyIHRoYXQgY2FuIHByb3ZpZGUNCj4gYWNj
ZXNzIHRvIHRoZSBzaGFyZWQgcmVnaXN0ZXJzIGJldHdlZW4gdGhlIGRpZmZlcmVudCBkcml2ZXJz
IHRoYXQgbmVlZA0KPiBpdCAobWVkaWF0ZWstZHJtIGFuZCBtZWRpYXRlay1tZHApLiBIZW5jZSB0
aGUgTU1TWVMgY2xrIGRyaXZlciB3YXMgbW92ZWQNCj4gdG8gZHJpdmVycy9zb2MvbWVkaWF0ZWsg
YW5kIGlzIHRoZSBlbnRyeSBwb2ludCAocGFyZW50KSB3aGljaCB3aWxsIHRyaWdnZXINCj4gdGhl
IHByb2JlIG9mIHRoZSBjb3JyZXNwb25kaW5nIG1lZGlhdGVrLWRybSBkcml2ZXIuDQo+IA0KPiAq
KklNUE9SVEFOVCoqIFRoaXMgc2VyaWVzIG9ubHkgZml4ZXMgdGhlIGlzc3VlIG9uIG10ODE3MyB0
byBtYWtlIGl0DQo+IHNpbXBsZSBhbmQgYXMgaXMgdGhlIG9ubHkgcGxhdGZvcm0gSSBjYW4gdGVz
dC4gU2ltaWxhciBjaGFuZ2VzIHNob3VsZCBiZQ0KPiBhcHBsaWVkIGZvciBtdDI3MDEgYW5kIG10
MjcxMiB0byBoYXZlIGRpc3BsYXkgd29ya2luZy4NCj4gDQo+IEZvciByZWZlcmVuY2UsIGhlcmUg
YXJlIHRoZSBsaW5rcyB0byB0aGUgb2xkIGRpc2N1c3Npb25zOg0KPiAqIHY4OiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTI0
NDg5MQ0KPiAqIHY3OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgt
bWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTI0MTIxNw0KPiAqIHY2OiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTIxMzIxOQ0KPiAq
IHY1OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsv
bGlzdC8/c2VyaWVzPTQ0MDYzDQo+ICogdjQ6DQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3BhdGNoLzEwNTMwODcxLw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMDUzMDg4My8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTA1MzA4ODUvDQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEw
NTMwOTExLw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDUzMDkx
My8NCj4gKiB2MzoNCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAz
Njc4NTcvDQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODYx
Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg3Ny8NCj4g
ICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NzUvDQo+ICAgKiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODg1Lw0KPiAgICogaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg4My8NCj4gICAqIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4ODkvDQo+ICAgKiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3OTA3Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDM2NzkwOS8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTAzNjc5MDUvDQo+ICogdjI6IE5vIHJlbGV2YW50IGRpc2N1c3Npb24sIHNlZSB2
Mw0KPiAqIHYxOg0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDAx
NjQ5Ny8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAwMTY0OTkv
DQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NTA1Lw0KPiAg
ICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDAxNjUwNy8NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gIEVucmljDQo+IA0KPiBDaGFuZ2VzIGluIHY5Og0KPiAtIE1vdmUgbW1z
eXMgdG8gZHJpdmVycy9zb2MvbWVkaWF0ZWsgKENLKQ0KPiAtIERvIG5vdCBtb3ZlIHRoZSBkaXNw
bGF5IHJvdXRpbmcgZnJvbSB0aGUgZHJtIGRyaXZlciAoQ0spDQo+IC0gUmVtb3ZlZCBmcm9tIHRo
aXMgc2VyaWVzIGJlY2F1c2UgYXJlIG5vdCBuZWVkZWQ6DQo+ICAgKiBbUEFUQ0ggdjggNS82XSBk
cm0vbWVkaWF0ZWs6IE1vdmUgTU1TWVMgY29uZmlndXJhdGlvbiB0byBpbmNsdWRlL2xpbnV4L3Bs
YXRmb3JtX2RhdGENCj4gLSBSZW1vdmVkIGZyb20gdGhpcyBzZXJpZXMgYmVjYXVzZSBhcmUgYXBw
bGllZDoNCj4gICAqIFtQQVRDSCB2OCAzLzZdIG1lZGlhOiBtdGstbWRwOiBDaGVjayByZXR1cm4g
dmFsdWUgb2Ygb2ZfY2xrX2dldC4NCj4gDQo+IENoYW5nZXMgaW4gdjg6DQo+IC0gU2VsZWN0IFJF
R01BUCBhbmQgTUZEX1NZU0NPTiAoUmFuZHkgRHVubGFwKQ0KPiAtIEJlIGEgYnVpbHRpbl9wbGF0
Zm9ybV9kcml2ZXIgbGlrZSBvdGhlciBtZWRpYXRlayBtbXN5cyBkcml2ZXJzLg0KPiAtIE5ldyBw
YXRjaCBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0KPiANCj4gQ2hhbmdlcyBpbiB2NzoNCj4g
LSBBZGQgUi1ieSBmcm9tIENLDQo+IC0gRnJlZSBjbGtfZGF0YS0+Y2xrcyBhcyB3ZWxsDQo+IC0g
R2V0IHJpZCBvZiBwcml2YXRlIGRhdGEgc3RydWN0dXJlDQo+IA0KPiBFbnJpYyBCYWxsZXRibyBp
IFNlcnJhICgxKToNCj4gICBkcm0vbWVkaWF0ZWs6IEZpeCBtZWRpYXRlay1kcm0gZGV2aWNlIHBy
b2JpbmcNCj4gDQo+IE1hdHRoaWFzIEJydWdnZXIgKDMpOg0KPiAgIGRybS9tZWRpYXRlazogVXNl
IHJlZ21hcCBmb3IgcmVnaXN0ZXIgYWNjZXNzDQo+ICAgZHJtL21lZGlhdGVrOiBPbWl0IHdhcm5p
bmcgb24gcHJvYmUgZGVmZXJzDQo+ICAgc29jOiBtZWRpYXRlazogTW92ZSBtdDgxNzMgTU1TWVMg
dG8gcGxhdGZvcm0gZHJpdmVyDQo+IA0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3
My5jICAgICAgICAgfCAxMDQgLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL0tjb25maWcgICAgICAgICAgfCAgIDIgKw0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX2NvbG9yLmMgfCAgIDUgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYyAgIHwgICA1ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfcmRtYS5jICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYyAgICAgICAgfCAgMTIgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2NydGMuYyAgIHwgICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuYyAgICB8ICA1MyArKysrLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwLmggICAgfCAgIDQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jICAgIHwgIDQ1ICsrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5oICAgIHwgICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RzaS5jICAgICAgICB8ICAgOCArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgICAgICAgfCAgIDQgKy0NCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL0tjb25maWcgICAg
ICAgICAgICAgIHwgICA3ICsrDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxNzMtbW1zeXMuYyAg
ICAgICB8IDE0MyArKysrKysrKysrKysrKysrKysrKysrDQo+ICAxNiBmaWxlcyBjaGFuZ2VkLCAy
MzMgaW5zZXJ0aW9ucygrKSwgMTcxIGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE3My1tbXN5cy5jDQo+IA0KDQo=

