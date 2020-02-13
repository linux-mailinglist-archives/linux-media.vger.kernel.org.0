Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE39915B78D
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 04:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbgBMDKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 22:10:51 -0500
Received: from mailgw01.mediatek.com ([216.200.240.184]:53539 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbgBMDKv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 22:10:51 -0500
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 22:10:51 EST
X-UUID: a726eaddffad4e0e8a84623cf2e77221-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0HPDjdt74T111dUFssEsZJlHvxvLqFiiV5OgaDl5UMI=;
        b=leVPUigmIgi+5lYDpuX29RQSRcbEv8Hm0/47jlB8vwQJ0pTQDGP3gf+0/gGpu4/f8CfzzrdOkesbjHHCf1ijfEGpQhbqPyP9ltKQ6inV2tBm1eGIw6fEZ9Hbsd1Hr/087GcW7Nl/uIu9k3rMFELZYqayoY0VEkIDzyV2Es+EyXY=;
X-UUID: a726eaddffad4e0e8a84623cf2e77221-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (musrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 27702398; Wed, 12 Feb 2020 19:05:43 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 18:58:05 -0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 10:56:49 +0800
Message-ID: <1581562673.24120.3.camel@mtksdaap41>
Subject: Re: [resend PATCH v6 00/12] arm/arm64: mediatek: Fix mmsys device
 probing
From:   CK Hu <ck.hu@mediatek.com>
To:     <matthias.bgg@kernel.org>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        <enric.balletbo@collabora.com>, <devicetree@vger.kernel.org>,
        <rdunlap@infradead.org>, <frank-w@public-files.de>,
        <sean.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <sean.wang@kernel.org>,
        <wens@csie.org>, <drinkcat@chromium.org>,
        <linux-mediatek@lists.infradead.org>, <mbrugger@suse.com>,
        <hsinyi@chromium.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Thu, 13 Feb 2020 10:57:53 +0800
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzOg0KDQoNCldvdWxkIHlvdSB3b3JrIG9uIHRoaXMgc2VyaWVzIGluIGEgc2hv
cnQgdGltZT8gU29tZSBZb25ncWlhbmcncyBwYXRjaGVzDQpbMV0gYWxzbyBtb2RpZnkgbW1zeXMg
ZHJpdmVyLCBhbmQgbm93IGl0IGRlcGVuZCBvbiB5b3VyIHBhdGNoIHRvIHByZXZlbnQNCmNvbmZs
aWN0cy4gSWYgeW91IHdvdWxkIG5vdCB3b3JrIG9uIHRoaXMgc2VyaWVzIGluIGEgc2hvcnQgdGlt
ZSwgSSB3b3VsZA0KbGlrZSB0byBhcHBseSBZb25ncWlhbmcncyBwYXRjaCB3aXRob3V0IHRoaXMg
c2VyaWVzLg0KDQpbMV0NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51
eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9MjIzMjIxDQoNClJlZ2FyZHMsDQpDSw0KDQpPbiBTYXQs
IDIwMTktMTItMDcgYXQgMjM6NDcgKzAxMDAsIG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnIHdyb3Rl
Og0KPiBGcm9tOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCj4gDQo+IFty
ZXNlZGluZyBkdWUgdG8gd3JvbmcgbWFpbCBvZiBTdGVwaGVuXQ0KPiANCj4gVGhpcyBpcyB2ZXJz
aW9uIGZpdmUgb2YgdGhlIHNlcmllcy4gSXQncyBhIGxvbmcgdGltZSB0aGlzIHdhc24ndCB3b3Jr
ZWQgb24sIHNvDQo+IGFzIGEgcmVtaW5kZXIsIHZlcnNpb24gZm91ciBjYW4gYmUgZm91bmQgaGVy
ZToNCj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMDY4NjI0Ny8NCj4gDQo+
IFRoZSBiaWdnZXN0IGNoYW5nZXMgdGhpcyBuZXcgdmVyc2lvbiBkb2VzLCBpcyB0byBpbXBsZW1l
bnQgdGhlIGNsb2NrIHByb2JpbmcNCj4gdGhyb3VnaCBhIHBsYXRmb3JtIGRyaXZlci4gVGhlIGNv
cnJlc3BvbmRpbmcgcGxhdGZvcm0gZGV2aWNlIGdldCdzIGNyZWF0ZWQgaW4NCj4gdGhlIERSTSBk
cml2ZXIuIEkgY29udmVydGVkIGFsbCB0aGUgY2xvY2sgZHJpdmVycyB0byBwbGF0Zm9ybSBkcml2
ZXJzIGFuZCB0ZXN0ZWQNCj4gdGhlIGFwcHJvYWNoIG9uIHRoZSBBY2VyIENocm9tZWJvb2sgUjEz
IChtdDgxNzMgYmFzZWQpLg0KPiBBcGFydCBmcm9tIHRoYXQgSSByZW9yZGVyZWQgdGhlIHBhdGNo
ZXMgc28gdGhhdCB0aGUgRFQgYmluZGluZ3MgdXBkYXRlIGFyZSB0aGUgZmlyc3QNCj4gcGF0Y2hl
cy4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjU6DQo+IC0gcmUtYXJyYW5nZSB0aGUgcGF0Y2ggb3Jk
ZXINCj4gLSBnZW5lcmF0ZSBwbGF0Zm9ybV9kZXZpY2UgZm9yIG1tc3lzIGNsb2NrIGRyaXZlciBp
bnNpZGUgdGhlIERSTSBkcml2ZXINCj4gLSBmaXggRFRTIGJpbmRpbmcgYWNjb3JkaW5nbHkNCj4g
LSBzd2l0Y2ggYWxsIG1tc3lzIGNsb2NrIGRyaXZlciB0byBwbGF0Zm9ybSBwcm9iaW5nDQo+IC0g
Zml4IG10ODE3MyBwbGF0Zm9ybSBkcml2ZXIgcmVtb3ZlIGZ1bmN0aW9uDQo+IC0gZml4IHByb2Jl
IGRlZmVyIHBhdGggaW4gSERNSSBkcml2ZXINCj4gLSBmaXggcHJvYmUgZGVmZXIgcGF0aCBpbiBt
dGtfbWRwX2NvbXANCj4gLSBmaXggaWRlbnRhdGlvbiBvZiBlcnJvciBtZXNzYWdlcw0KPiANCj4g
Q2hhbmdlcyBzaW5jZSB2NDoNCj4gLSBmaXggbWlzc2luZyByZWdtYXAgYWNjZXNzb3JzIGluIGRy
bSBkaXZlciAocGF0Y2ggMSkNCj4gLSBvbWl0IHByb2JlIGRlZmZlcmVkIHdhcm5pbmcgb24gYWxs
IGRyaXZlcnMgKHBhdGNoIDUpDQo+IC0gdXBkYXRlIGRybSBhbmQgY2xrIGJpbmRpbmdzIChwYXRj
aCA2IGFuZCA3KQ0KPiAtIHB1dCBtbXN5cyBjbG9jayBwYXJ0IGluIGR0cyBjaGlsZCBub2RlIG9m
IG1tc3lzLiBPbmx5IGRvbmUNCj4gZm9yIEhXIHdoZXJlIG5vIGR0cyBiYWNrcG9ydCBjb21wYXRp
YmxlIGJyZWFrYWdlIGlzIGV4cGVjdGVkIA0KPiAoZWl0aGVyIERSTSBkcml2ZXIgbm90IHlldCBp
bXBsZW1lbnRlZCBvciBubyBIVyBhdmFpbGFibGUgdG8NCj4gdGhlIHB1YmxpYykgKHBhdGNoIDkg
dG8gMTIpDQo+IA0KPiBDaGFuZ2VzIHNpbmNlIHYzOg0KPiAtIHVzZSBwbGF0Zm9ybSBkZXZpY2Ug
dG8gcHJvYmUgY2xvY2sgZHJpdmVyDQo+IC0gYWRkIEFja2VkLWJ5IENLIEh1IGZvciB0aGUgcHJv
YmUgZGVmZXJyZWQgcGF0Y2gNCj4gDQo+IENoYW5nZXMgc2luY2UgdjI6DQo+IC0gZml4IGtjb25m
aWcgdHlwbyAoc2hhbWUgb24gbWUpDQo+IC0gZGVsZXRlIF9faW5pdGNvbnN0IGZyb20gbW1fY2xv
Y2tzIGFzIGNvbnZlcnRlZCB0byBhIHBsYXRmb3JtIGRyaXZlcg0KPiAgIA0KPiBDaGFuZ2VzIHNp
bmNlIHYxOg0KPiAtIGFkZCBiaW5kaW5nIGRvY3VtZW50YXRpb24NCj4gLSBkZHA6IHVzZSByZWdt
YXBfdXBkYXRlX2JpdHMNCj4gLSBkZHA6IGlnbm9yZSBFUFJPQkVfREVGRVIgb24gY2xvY2sgcHJv
YmluZw0KPiAtIG1mZDogZGVsZXRlIG1tc3lzX3ByaXZhdGUNCj4gLSBhZGQgUmV2aWV3ZWQtYnkg
YW5kIEFja2VkLWJ5IHRhZ3MNCj4gIA0KPiBNTVNZUyBpbiBNZWRpYXRlayBTb0NzIGhhcyBzb21l
IHJlZ2lzdGVycyB0byBjb250cm9sIGNsb2NrIGdhdGVzICh3aGljaCBpcyANCj4gdXNlZCBpbiB0
aGUgY2xrIGRyaXZlcikgYW5kIHNvbWUgcmVnaXN0ZXJzIHRvIHNldCB0aGUgcm91dGluZyBhbmQg
ZW5hYmxlDQo+IHRoZSBkaWZmZXJuZXQgYmxvY2tzIG9mIHRoZSBkaXNwbGF5IHN1YnN5c3RlbS4N
Cj4gDQo+IFVwIHRvIG5vdyBib3RoIGRyaXZlcnMsIGNsb2NrIGFuZCBkcm0gYXJlIHByb2JlZCB3
aXRoIHRoZSBzYW1lIGRldmljZSB0cmVlDQo+IGNvbXBhdGlibGUuIEJ1dCBvbmx5IHRoZSBmaXJz
dCBkcml2ZXIgZ2V0IHByb2JlZCwgd2hpY2ggaW4gZWZmZWN0IGJyZWFrcw0KPiBncmFwaGljcyBv
biBtdDgxNzMgYW5kIG10MjcwMS4NCj4gDQo+IFRoaXMgcGF0Y2ggdXNlcyBhIHBsYXRmb3JtIGRl
dmljZSByZWdpc3RyYXRpb24gaW4gdGhlIERSTSBkcml2ZXIsIHdoaWNoDQo+IHdpbGwgdHJpZ2dl
ciB0aGUgcHJvYmUgb2YgdGhlIGNvcnJlc3BvbmRpbmcgY2xvY2sgZHJpdmVyLiBJdCB3YXMgdGVz
dGVkIG9uIHRoZQ0KPiBiYW5hbmFwaS1yMiBhbmQgdGhlIEFjZXIgUjEzIENocm9tZWJvb2suDQo+
IA0KPiANCj4gTWF0dGhpYXMgQnJ1Z2dlciAoMTIpOg0KPiAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5
OiBtZWRpYXRlazogQWRkIG1tc3lzIGJpbmRpbmcgZGVzY3JpcHRpb24NCj4gICBkdC1iaW5kaW5n
czogbWVkaWF0ZWs6IEFkZCBjb21wYXRpYmxlIGZvciBtdDc2MjMNCj4gICBkcm0vbWVkaWF0ZWs6
IFVzZSByZWdtYXAgZm9yIHJlZ2lzdGVyIGFjY2Vzcw0KPiAgIGRybTogbWVkaWF0ZWs6IE9taXQg
d2FybmluZyBvbiBwcm9iZSBkZWZlcnMNCj4gICBtZWRpYTogbXRrLW1kcDogQ2hlY2sgcmV0dXJu
IHZhbHVlIG9mIG9mX2Nsa19nZXQNCj4gICBjbGs6IG1lZGlhdGVrOiBtdDI3MDE6IHN3aXRjaCBt
bXN5cyB0byBwbGF0Zm9ybSBkZXZpY2UgcHJvYmluZw0KPiAgIGNsazogbWVkaWF0ZWs6IG10Mjcx
MmU6IHN3aXRjaCB0byBwbGF0Zm9ybSBkZXZpY2UgcHJvYmluZw0KPiAgIGNsazogbWVkaWF0ZWs6
IG10Njc3OTogc3dpdGNoIG1tc3lzIHRvIHBsYXRmb3JtIGRldmljZSBwcm9iaW5nDQo+ICAgY2xr
OiBtZWRpYXRlazogbXQ2Nzk3OiBzd2l0Y2ggdG8gcGxhdGZvcm0gZGV2aWNlIHByb2JpbmcNCj4g
ICBjbGs6IG1lZGlhdGVrOiBtdDgxODM6IHN3aXRjaCBtbXN5cyB0byBwbGF0Zm9ybSBkZXZpY2Ug
cHJvYmluZw0KPiAgIGNsazogbWVkaWF0ZWs6IG10ODE3Mzogc3dpdGNoIG1tc3lzIHRvIHBsYXRm
b3JtIGRldmljZSBwcm9iaW5nDQo+ICAgZHJtL21lZGlhdGVrOiBBZGQgc3VwcG9ydCBmb3IgbW1z
eXMgdGhyb3VnaCBhIHBkZXYNCj4gDQo+ICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxk
aXNwLnR4dCAgICAgICAgfCAzMCArKysrKystLS0tLQ0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10MjcwMS1tbS5jICAgICAgICAgIHwgNDEgKysrKysrKysrLS0tLS0NCj4gIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDI3MTItbW0uYyAgICAgICAgICB8IDM5ICsrKysrKysrKy0tLS0t
DQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ2Nzc5LW1tLmMgICAgICAgICAgfCA0MSAr
KysrKysrKystLS0tLQ0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10Njc5Ny1tbS5jICAg
ICAgICAgIHwgNDMgKysrKysrKysrKy0tLS0tDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGst
bXQ4MTczLmMgICAgICAgICAgICAgfCA1MSArKysrKysrKysrKysrKystLS0NCj4gIGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDgxODMtbW0uYyAgICAgICAgICB8IDM5ICsrKysrKysrKy0tLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgICAgfCAgNSAr
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jICAgICAgIHwgIDUg
Ky0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAgICB8ICA1
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jICAgICAgICAgICAgfCAx
MiArKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICAg
IHwgIDQgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jICAgICAg
ICB8IDU0ICsrKysrKysrKy0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5oICAgICAgICB8ICA0ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYyAgICAgICAgfCAzNSArKysrKysrKystLS0NCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oICAgICAgICB8ICA0ICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICAgICAgICAgfCAgOCArKy0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAgICB8ICA0ICstDQo+ICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMgfCAgNiArKysNCj4gIDE5IGZpbGVz
IGNoYW5nZWQsIDI5NSBpbnNlcnRpb25zKCspLCAxMzUgZGVsZXRpb25zKC0pDQo+IA0KDQo=

