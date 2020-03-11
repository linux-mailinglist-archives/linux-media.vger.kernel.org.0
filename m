Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6FE181906
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 14:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgCKNBy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 09:01:54 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58248 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729354AbgCKNBy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 09:01:54 -0400
X-UUID: 530e16f6b4c34eda8033d39dc1f66c97-20200311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=/WVVWBfJZWBTP9PrYKh6PTL6LhgD9CaRZwh9r2ttw8o=;
        b=FeHfmLXP6lg2ahvRdk64ty2LUW5cF4x0VuXOaLEeKE7Z284kDlDMEsrfRiSzGi7cqFtGAdKfpYCAPgpsSFHhPQSjsWOb8ReDdaoaPafwkK6FvSZG0VTPZvr0ykk5oDs3eP14P+zvxpb+jpS6X+mXXC25WmhCxpmgKIW8aDo4grQ=;
X-UUID: 530e16f6b4c34eda8033d39dc1f66c97-20200311
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1205752028; Wed, 11 Mar 2020 21:01:47 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 21:01:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Mar 2020 21:00:54 +0800
Message-ID: <1583931705.29614.3.camel@mtksdaap41>
Subject: Re: [PATCH v11 0/5] arm/arm64: mediatek: Fix mt8173 mmsys device
 probing
From:   CK Hu <ck.hu@mediatek.com>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC:     <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>,
        "Allison Randal" <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-mediatek@lists.infradead.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        <dri-devel@lists.freedesktop.org>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-kernel@vger.kernel.org>, <wens@csie.org>,
        Daniel Vetter <daniel@ffwll.ch>, <linux-clk@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        <devicetree@vger.kernel.org>,
        "Matthias Brugger" <mbrugger@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        <frank-w@public-files.de>, <linux-arm-kernel@lists.infradead.org>,
        <hsinyi@chromium.org>, Richard Fontana <rfontana@redhat.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>, <sean.wang@mediatek.com>,
        <rdunlap@infradead.org>, <matthias.bgg@kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Owen Chen <owen.chen@mediatek.com>
Date:   Wed, 11 Mar 2020 21:01:45 +0800
In-Reply-To: <20200311115614.1425528-1-enric.balletbo@collabora.com>
References: <20200311115614.1425528-1-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D0C530029DFB3D1C48B2A2ED83E49AE8D5F42442F09CD39392B33A38427356E82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpJJ20gY29uZnVzZWQgdGhpcyBpcyB2MTEgb3IgdjEyLg0KRm9yIHYxMiwg
eW91J3ZlIGxvc3Qgc29tZSAnQWNrZWQtYnknIGFuZCAnUmV2aWV3ZWQtYnknIHRhZy4NCg0KUmVn
YXJkcywNCkNLDQoNCk9uIFdlZCwgMjAyMC0wMy0xMSBhdCAxMjo1NiArMDEwMCwgRW5yaWMgQmFs
bGV0Ym8gaSBTZXJyYSB3cm90ZToNCj4gRGVhciBhbGwsDQo+IA0KPiBUaGVzZSBwYXRjaGVzIGFy
ZSBpbnRlbmRlZCB0byBzb2x2ZSBhbiBvbGQgc3RhbmRpbmcgaXNzdWUgb24gc29tZQ0KPiBNZWRp
YXRlayBkZXZpY2VzIChtdDgxNzMsIG10MjcwMSBhbmQgbXQyNzEyIGFyZSBhZmZlY3RlZCBieSB0
aGlzIGlzc3VlKS4NCj4gDQo+IFVwIHRvIG5vdyBib3RoIGRyaXZlcnMsIGNsb2NrIGFuZCBkcm0g
YXJlIHByb2JlZCB3aXRoIHRoZSBzYW1lIGRldmljZSB0cmVlDQo+IGNvbXBhdGlibGUuIEJ1dCBv
bmx5IHRoZSBmaXJzdCBkcml2ZXIgZ2V0cyBwcm9iZWQsIHdoaWNoIGluIGVmZmVjdCBicmVha3MN
Cj4gZ3JhcGhpY3Mgb24gdGhvc2UgZGV2aWNlcy4NCj4gDQo+IFRoZSBNTVNZUyAoTXVsdGltZWRp
YSBzdWJzeXN0ZW0pIGluIE1lZGlhdGVrIFNvQ3MgaGFzIHNvbWUgcmVnaXN0ZXJzIHRvDQo+IGNv
bnRyb2wgY2xvY2sgZ2F0ZXMgKHdoaWNoIGlzIHVzZWQgaW4gdGhlIGNsayBkcml2ZXIpIGFuZCBz
b21lIHJlZ2lzdGVycw0KPiB0byBzZXQgdGhlIHJvdXRpbmcgYW5kIGVuYWJsZSB0aGUgZGlmZmVy
bmV0IGJsb2NrcyBvZiB0aGUgZGlzcGxheQ0KPiBhbmQgTURQIChNZWRpYSBEYXRhIFBhdGgpIHN1
YnN5c3RlbS4gT24gdGhpcyBzZXJpZXMgdGhlIGNsayBkcml2ZXIgaXMNCj4gbm90IGEgcHVyZSBj
bG9jayBjb250cm9sbGVyIGJ1dCBhIHN5c3RlbSBjb250cm9sbGVyIHRoYXQgY2FuIHByb3ZpZGUN
Cj4gYWNjZXNzIHRvIHRoZSBzaGFyZWQgcmVnaXN0ZXJzIGJldHdlZW4gdGhlIGRpZmZlcmVudCBk
cml2ZXJzIHRoYXQgbmVlZA0KPiBpdCAobWVkaWF0ZWstZHJtIGFuZCBtZWRpYXRlay1tZHApLiBI
ZW5jZSB0aGUgTU1TWVMgY2xrIGRyaXZlciB3YXMgbW92ZWQNCj4gdG8gZHJpdmVycy9zb2MvbWVk
aWF0ZWsgYW5kIGlzIHRoZSBlbnRyeSBwb2ludCAocGFyZW50KSB3aGljaCB3aWxsIHRyaWdnZXIN
Cj4gdGhlIHByb2JlIG9mIHRoZSBjb3JyZXNwb25kaW5nIG1lZGlhdGVrLWRybSBkcml2ZXIuDQo+
IA0KPiAqKklNUE9SVEFOVCoqIFRoaXMgc2VyaWVzIG9ubHkgZml4ZXMgdGhlIGlzc3VlIG9uIG10
ODE3MyB0byBtYWtlIGl0DQo+IHNpbXBsZSBhbmQgYXMgaXMgdGhlIG9ubHkgcGxhdGZvcm0gSSBj
YW4gdGVzdC4gU2ltaWxhciBjaGFuZ2VzIHNob3VsZCBiZQ0KPiBhcHBsaWVkIGZvciBtdDI3MDEg
YW5kIG10MjcxMiB0byBoYXZlIGRpc3BsYXkgd29ya2luZy4NCj4gDQo+IFRoZXNlIHBhdGNoZXMg
YXBwbHkgb24gdG9wIG9mIGxpbnV4LW5leHQuDQo+IA0KPiBGb3IgcmVmZXJlbmNlLCBoZXJlIGFy
ZSB0aGUgbGlua3MgdG8gdGhlIG9sZCBkaXNjdXNzaW9uczoNCj4gKiB2MTA6IGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9MjQ4
NTA1DQo+ICogdjk6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1j
bGsvbGlzdC8/c2VyaWVzPTI0NzU5MQ0KPiAqIHY4OiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTI0NDg5MQ0KPiAqIHY3OiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/
c2VyaWVzPTI0MTIxNw0KPiAqIHY2OiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTIxMzIxOQ0KPiAqIHY1OiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTQ0
MDYzDQo+ICogdjQ6DQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEw
NTMwODcxLw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDUzMDg4
My8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA1MzA4ODUvDQo+
ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNTMwOTExLw0KPiAgICog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDUzMDkxMy8NCj4gKiB2MzoNCj4g
ICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NTcvDQo+ICAgKiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODYxLw0KPiAgICogaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDM2Nzg3Ny8NCj4gICAqIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc4NzUvDQo+ICAgKiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwMzY3ODg1Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDM2Nzg4My8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTAzNjc4ODkvDQo+ICAgKiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzEwMzY3OTA3Lw0KPiAgICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8x
MDM2NzkwOS8NCj4gICAqIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAzNjc5
MDUvDQo+ICogdjI6IE5vIHJlbGV2YW50IGRpc2N1c3Npb24sIHNlZSB2Mw0KPiAqIHYxOg0KPiAg
ICogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDAxNjQ5Ny8NCj4gICAqIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTAwMTY0OTkvDQo+ICAgKiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwMDE2NTA1Lw0KPiAgICogaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDAxNjUwNy8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4g
IEVucmljDQo+IA0KPiBDaGFuZ2VzIGluIHYxMToNCj4gLSBMZWF2ZSB0aGUgY2xvY2tzIHBhcnQg
aW4gZHJpdmVycy9jbGsgKGNsay1tdDgxNzMtbW0pDQo+IC0gSW5zdGFudGlhdGUgdGhlIGNsb2Nr
IGRyaXZlciBmcm9tIHRoZSBtdGstbW1zeXMgZHJpdmVyLg0KPiAtIEFkZCBkZWZhdWx0IGNvbmZp
ZyBvcHRpb24gdG8gbm90IGJyZWFrIGFueXRoaW5nLg0KPiAtIFJlbW92ZWQgdGhlIFJldmlld2Vk
LWJ5IENLIHRhZyBhcyBjaGFuZ2VkIHRoZSBvcmdhbml6YXRpb24uDQo+IA0KPiBDaGFuZ2VzIGlu
IHYxMDoNCj4gLSBVcGRhdGUgdGhlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG1tc3lz
IHN5c3RlbSBjb250cm9sbGVyLg0KPiAtIFJlbmFtZWQgdG8gYmUgZ2VuZXJpYyBtdGstbW1zeXMN
Cj4gLSBBZGQgZHJpdmVyIGRhdGEgc3VwcG9ydCB0byBiZSBhYmxlIHRvIHN1cHBvcnQgZGlmZXJl
bnQgU29Dcw0KPiAtIFNlbGVjdCBDT05GSUdfTVRLX01NU1lTIChDSykNCj4gLSBQYXNzIGRldmlj
ZSBwb2ludGVyIG9mIG1tc3lzIGRldmljZSBpbnN0ZWFkIG9mIGNvbmZpZyByZWdzIChDSykNCj4g
LSBNYXRjaCBkcml2ZXIgZGF0YSB0byBnZXQgZGlzcGxheSByb3V0aW5nLg0KPiANCj4gQ2hhbmdl
cyBpbiB2OToNCj4gLSBNb3ZlIG1tc3lzIHRvIGRyaXZlcnMvc29jL21lZGlhdGVrIChDSykNCj4g
LSBJbnRyb2R1Y2VkIGEgbmV3IHBhdGNoIHRvIG1vdmUgcm91dGluZyBjb250cm9sIGludG8gbW1z
eXMgZHJpdmVyLg0KPiAtIFJlbW92ZWQgdGhlIHBhdGNoIHRvIHVzZSByZWdtYXAgYXMgaXMgbm90
IG5lZWRlZCBhbnltb3JlLg0KPiAtIERvIG5vdCBtb3ZlIHRoZSBkaXNwbGF5IHJvdXRpbmcgZnJv
bSB0aGUgZHJtIGRyaXZlciAoQ0spDQo+IA0KPiBDaGFuZ2VzIGluIHY4Og0KPiAtIEJlIGEgYnVp
bHRpbl9wbGF0Zm9ybV9kcml2ZXIgbGlrZSBvdGhlciBtZWRpYXRlayBtbXN5cyBkcml2ZXJzLg0K
PiAtIE5ldyBwYXRjaCBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0KPiANCj4gQ2hhbmdlcyBp
biB2NzoNCj4gLSBGcmVlIGNsa19kYXRhLT5jbGtzIGFzIHdlbGwNCj4gLSBHZXQgcmlkIG9mIHBy
aXZhdGUgZGF0YSBzdHJ1Y3R1cmUNCj4gDQo+IEVucmljIEJhbGxldGJvIGkgU2VycmEgKDMpOg0K
PiAgIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogVXBkYXRlIG1tc3lzIGJpbmRpbmcgdG8gcmVmbGVj
dCBpdCBpcyBhIHN5c3RlbQ0KPiAgICAgY29udHJvbGxlcg0KPiAgIHNvYyAvIGRybTogbWVkaWF0
ZWs6IE1vdmUgcm91dGluZyBjb250cm9sIHRvIG1tc3lzIGRldmljZQ0KPiAgIHNvYyAvIGRybTog
bWVkaWF0ZWs6IEZpeCBtZWRpYXRlay1kcm0gZGV2aWNlIHByb2JpbmcNCj4gDQo+IE1hdHRoaWFz
IEJydWdnZXIgKDIpOg0KPiAgIGRybS9tZWRpYXRlazogT21pdCB3YXJuaW5nIG9uIHByb2JlIGRl
ZmVycw0KPiAgIGNsayAvIHNvYzogbWVkaWF0ZWs6IE1vdmUgbXQ4MTczIE1NU1lTIHRvIHBsYXRm
b3JtIGRyaXZlcg0KPiANCj4gIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1z
eXMudHh0ICB8ICAgNyArLQ0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgIHwgICA3ICsNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL01ha2VmaWxlICAgICAg
ICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLW1t
LmMgICAgICAgICAgfCAxNDYgKysrKysrKysNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1t
dDgxNzMuYyAgICAgICAgICAgICB8IDEwNCAtLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9LY29uZmlnICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfY29sb3IuYyAgICAgfCAgIDUgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9vdmwuYyAgICAgICB8ICAgNSArLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAgIHwgICA1ICstDQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jICAgICAgICAgICAgfCAgMTIgKy0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgICB8ICAxOSArLQ0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgICAgICAgIHwgMjU5ICstLS0tLS0tLS0tLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuaCAgICAgICAgfCAgIDcg
LQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgIDQ1
ICstLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggICAgICAgIHwg
ICAyICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICAgICAgICAgICAg
fCAgIDggKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jICAgICAgICAg
ICB8ICAgNCArLQ0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgIHwgICA4ICsNCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICAg
ICAgICAgfCAzMzUgKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaCAgICAgICAgfCAgMjAgKysNCj4gIDIxIGZpbGVzIGNoYW5nZWQsIDU5
MCBpbnNlcnRpb25zKCspLCA0MTEgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE3My1tbS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaA0KPiANCg0K

