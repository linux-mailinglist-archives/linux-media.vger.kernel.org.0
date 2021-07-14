Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891F23C83A1
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238993AbhGNLVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:21:04 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:19730 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237788AbhGNLVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:21:03 -0400
X-UUID: e407e2ac5fec4e0193e6630b3ba88c6a-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=a4Si3eZ7fDNKZHOBuXgUAIl76gjFv4ziTHlX+W08HKg=;
        b=UgGg34EEhZjZ4hiNx67e4QOArgcFOmzpq7SYoy0YOw5bLwG+aLufcZOlMW8zbPA2pRyTi2OiUgMH0UUYYyVZtEA78qCrYeRwoRrWNtGsvdjMJnL831+oWdrkouecIn01D8dwsBcH7cfpRC/dfG0tCEYEbPfm4BxnNGpLCdFdxQU=;
X-UUID: e407e2ac5fec4e0193e6630b3ba88c6a-20210714
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2030586173; Wed, 14 Jul 2021 19:18:07 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Jul
 2021 19:18:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:18:03 +0800
Message-ID: <1626261483.14352.15.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/11] Clean up "mediatek,larb"
From:   Yong Wu <yong.wu@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "Will Deacon" <will.deacon@arm.com>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <anan.sun@mediatek.com>,
        <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
        <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Xia Jiang <xia.jiang@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Eizan Miyamoto" <eizan@chromium.org>, <anthony.huang@mediatek.com>
Date:   Wed, 14 Jul 2021 19:18:03 +0800
In-Reply-To: <672ef386-aa95-da45-0f17-acb398a1f6e0@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
         <672ef386-aa95-da45-0f17-acb398a1f6e0@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 66096B7167E68897C718A8E5F5E93D30A09BFA4E16795181519114E5CFBA39B52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDEwOjU2ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiBIaQ0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2hzZXQuDQo+IA0KPiBJIHRlc3RlZCBp
dCBvbiBtdDgxNzMgKGVsbSkgd2l0aCBjaHJvbWVvcyB1c2Vyc3BhY2UuDQo+IEJlZm9yZSB0aGF0
IHBhdGNoc2V0LCB0aGUgdGVzdDoNCj4gDQo+IHRhc3QgLXZlcmJvc2UgcnVuIC1idWlsZD1mYWxz
ZSAxMC40Mi4wLjE3NSB2aWRlby5EZWNvZGVBY2NlbC5oMjY0DQo+IA0KPiBzb21ldGltZXMgcGFz
c2VkIGFuZCBzb21ldGltZXMgZmFpbGVkIHdpdGggJ2NvbnRleHQgZGVhZGxpbmUgZXhjZWVkZWQn
Lg0KPiBXaXRoIHRoaXMgcGF0Y2hzZXQgaXQgc2VlbXMgdGhhdCB0aGUgdGVzdCBhbHdheXMgcGFz
c2VzIHNvIEkgYWRkZWQgdGVzdGVkLWJ5Og0KPiANCj4gVGVzdGVkLWJ5OiBEYWZuYSBIaXJzY2hm
ZWxkIDxkYWZuYS5oaXJzY2hmZWxkQGNvbGxhYm9yYS5jb20+DQoNClRoYW5rcyB2ZXJ5IG11Y2gg
Zm9yIHlvdXIgcXVpY2sgcmV2aWV3IGFuZCB0ZXN0aW5nOikNCg0KPiANCj4gVGhhbmtzLA0KPiBE
YWZuYQ0KPiANCj4gDQo+IA0KPiANCj4gT24gMTQuMDcuMjEgMDQ6NTYsIFlvbmcgV3Ugd3JvdGU6
DQo+ID4gTWVkaWFUZWsgSU9NTVUgYmxvY2sgZGlhZ3JhbSBhbHdheXMgbGlrZSBiZWxvdzoNCj4g
PiANCj4gPiAgICAgICAgICBNNFUNCj4gPiAgICAgICAgICAgfA0KPiA+ICAgICAgc21pLWNvbW1v
bg0KPiA+ICAgICAgICAgICB8DQo+ID4gICAgLS0tLS0tLS0tLS0tLQ0KPiA+ICAgIHwgICAgICAg
ICB8ICAuLi4NCj4gPiAgICB8ICAgICAgICAgfA0KPiA+IGxhcmIxICAgICBsYXJiMg0KPiA+ICAg
IHwgICAgICAgICB8DQo+ID4gdmRlYyAgICAgICB2ZW5jDQo+ID4gDQo+ID4gQWxsIHRoZSBjb25z
dW1lciBjb25uZWN0IHdpdGggc21pLWxhcmIsIHRoZW4gY29ubmVjdCB3aXRoIHNtaS1jb21tb24u
DQo+ID4gDQo+ID4gV2hlbiB0aGUgY29uc3VtZXIgd29ya3MsIGl0IHNob3VsZCBlbmFibGUgdGhl
IHNtaS1sYXJiJ3MgcG93ZXIgd2hpY2ggYWxzbw0KPiA+IG5lZWQgZW5hYmxlIHRoZSBzbWktY29t
bW9uJ3MgcG93ZXIgZmlyc3RseS4NCj4gPiANCj4gPiBUaHVzLCBGaXJzdGx5LCB1c2UgdGhlIGRl
dmljZSBsaW5rIGNvbm5lY3QgdGhlIGNvbnN1bWVyIGFuZCB0aGUNCj4gPiBzbWktbGFyYnMuIHRo
ZW4gYWRkIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIHNtaS1sYXJiIGFuZCBzbWktY29tbW9uLg0K
PiA+IA0KPiA+IEFmdGVyIGFkZGluZyB0aGUgZGV2aWNlX2xpbmssIHRoZW4gIm1lZGlhdGVrLGxh
cmIiIHByb3BlcnR5IGNhbiBiZSByZW1vdmVkLg0KPiA+IHRoZSBpb21tdSBjb25zdW1lciBkb24n
dCBuZWVkIGNhbGwgdGhlIG10a19zbWlfbGFyYl9nZXQvcHV0IHRvIGVuYWJsZQ0KPiA+IHRoZSBw
b3dlciBhbmQgY2xvY2sgb2Ygc21pLWxhcmIgYW5kIHNtaS1jb21tb24uDQo+ID4gDQo+ID4gQWJv
dXQgdGhlIE1NIGR0LWJpbmRpbmcvZHRzaSBwYXRjaGVzLCBJIGd1ZXNzIHRoZXkgc2hvdWxkIGdv
IHRvZ2V0aGVyLCB0aHVzDQo+ID4gSSBkb24ndCBzcGxpdCB0aGVtIGZvciBlYWNoIGEgTU0gbW9k
dWxlIGFuZCBlYWNoIGEgU29DLg0KPiA+IA0KPiA+IEJhc2Ugb24gdjUuMTQtcmMxLCBhbmQgYSBq
cGVnWzFdIGFuZCBtZHBbMl0gcGF0Y2hzZXQuDQo+ID4gDQo+ID4gWzFdIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjEwNzAyMTAyMzA0LjMzNDY0MjktMS1oc2lueWlA
Y2hyb21pdW0ub3JnLw0KPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRp
YXRlay8yMDIxMDcwOTAyMjMyNC4xNjA3ODg0LTEtZWl6YW5AY2hyb21pdW0ub3JnLw0KPiA+IA0K
PiA+IENoYW5nZSBub3RlczoNCj4gPiB2NjogMSkgcmViYXNlIG9uIHY1LjE0LXJjMS4NCj4gPiAg
ICAgIDIpIEZpeCB0aGUgaXNzdWUgY29tbWVudGVkIGluIHY1IGZyb20gRGFmbmEgYW5kIEhzaW4t
WWkuDQo+ID4gICAgICAzKSBSZW1vdmUgdGhlIHBhdGNoZXMgYWJvdXQgdXNpbmcgcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldCBzaW5jZSB0aGV5IGhhdmUNCj4gPiAgICAgICAgIGFscmVhZHkgYmVl
biBtZXJnZWQgYnkgb3RoZXIgcGF0Y2hlcy4NCj4gPiANCj4gPiB2NTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMTA0MTAwOTExMjguMzE4MjMtMS15b25nLnd1QG1l
ZGlhdGVrLmNvbS8NCj4gPiAgICAgIDEpIEJhc2UgdjUuMTItcmMyLg0KPiA+ICAgICAgMikgUmVt
b3ZlIGNoYW5naW5nIHRoZSBtdGstaW9tbXUgdG8gbW9kdWxlX3BsYXRmb3JtX2RyaXZlciBwYXRj
aCwgSXQgaGF2ZSBhbHJlYWR5IGJlZW4gYQ0KPiA+ICAgICAgaW5kZXBlbmRlbnQgcGF0Y2guDQo+
ID4gDQo+ID4gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzE1OTA4
MjYyMTgtMjM2NTMtMS1naXQtc2VuZC1lbWFpbC15b25nLnd1QG1lZGlhdGVrLmNvbS8NCj4gPiAg
ICAgIGJhc2Ugb24gdjUuNy1yYzEuDQo+ID4gICAgMSkgTW92ZSBkcm0gUE0gcGF0Y2ggYmVmb3Jl
IHNtaSBwYXRjaHMuDQo+ID4gICAgMikgQ2hhbmdlIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIHRv
IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIgc2luY2Ugd2UgbWF5IG5lZWQNCj4gPiAgICAgICBidWls
ZCBhcyBtb2R1bGUuDQo+ID4gICAgMykgUmViYXNlIG1hbnkgcGF0Y2hzZXQgYXMgYWJvdmUuDQo+
ID4gDQo+ID4gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11LzE1Njc1MDM0
NTYtMjQ3MjUtMS1naXQtc2VuZC1lbWFpbC15b25nLnd1QG1lZGlhdGVrLmNvbS8NCj4gPiAgICAg
IDEpIHJlYmFzZSBvbiB2NS4zLXJjMSBhbmQgdGhlIGxhdGVzdCBtdDgxODMgcGF0Y2hzZXQuDQo+
ID4gICAgICAyKSBVc2UgZGV2aWNlX2lzX2JvdW5kIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGRyaXZl
ciBpcyByZWFkeSBmcm9tIE1hdHRoaWFzLg0KPiA+ICAgICAgMykgQWRkIERMX0ZMQUdfU1RBVEVM
RVNTIGZsYWcgd2hlbiBjYWxsaW5nIGRldmljZV9saW5rX2FkZCBhbmQgZXhwbGFpbiB0aGUNCj4g
PiAgICAgcmVhc29uIGluIHRoZSBjb21taXQgbWVzc2FnZVszLzE0XS4NCj4gPiAgICAgIDQpIEFk
ZCBhIGRpc3BsYXkgcGF0Y2hbMTIvMTRdIGludG8gdGhpcyBzZXJpZXMuIG90aGVyd2lzZSBpdCBt
YXkgYWZmZWN0DQo+ID4gICAgIGRpc3BsYXkgSFcgZmFzdGxvZ28gZXZlbiB0aG91Z2ggaXQgZG9u
J3QgaGFwcGVuIGluIG10ODE4My4NCj4gPiAgICAgDQo+ID4gdjI6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LWlvbW11LzE1NjAxNzEzMTMtMjgyOTktMS1naXQtc2VuZC1lbWFpbC15b25n
Lnd1QG1lZGlhdGVrLmNvbS8NCj4gPiAgICAgMSkgcmViYXNlIG9uIHY1LjItcmMxLg0KPiA+ICAg
ICAyKSBNb3ZlIGFkZGluZyBkZXZpY2VfbGluayBiZXR3ZWVuIHRoZSBjb25zdW1lciBhbmQgc21p
LWxhcmIgaW50bw0KPiA+IGlvbW11X2FkZF9kZXZpY2UgZnJvbSBSb2Jpbi4NCj4gPiAgICAgMykg
YWRkIERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUiBldmVuIHRob3VnaCB0aGUgc21pIGlzIGJ1
aWx0LWluIGZyb20gRXZhbi4NCj4gPiAgICAgNCkgUmVtb3ZlIHRoZSBzaHV0ZG93biBjYWxsYmFj
ayBpbiBpb21tdS4NCj4gPiANCj4gPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
aW9tbXUvMTU0NjMxODI3Ni0xODk5My0xLWdpdC1zZW5kLWVtYWlsLXlvbmcud3VAbWVkaWF0ZWsu
Y29tLw0KPiA+IA0KPiA+IFlvbmcgV3UgKDEwKToNCj4gPiAgICBkdC1iaW5kaW5nOiBtZWRpYXRl
azogR2V0IHJpZCBvZiBtZWRpYXRlayxsYXJiIGZvciBtdWx0aW1lZGlhIEhXDQo+ID4gICAgaW9t
bXUvbWVkaWF0ZWs6IEFkZCBwcm9iZV9kZWZlciBmb3Igc21pLWxhcmINCj4gPiAgICBpb21tdS9t
ZWRpYXRlazogQWRkIGRldmljZV9saW5rIGJldHdlZW4gdGhlIGNvbnN1bWVyIGFuZCB0aGUgbGFy
Yg0KPiA+ICAgICAgZGV2aWNlcw0KPiA+ICAgIG1lZGlhOiBtdGstanBlZzogR2V0IHJpZCBvZiBt
dGtfc21pX2xhcmJfZ2V0L3B1dA0KPiA+ICAgIG1lZGlhOiBtdGstbWRwOiBHZXQgcmlkIG9mIG10
a19zbWlfbGFyYl9nZXQvcHV0DQo+ID4gICAgZHJtL21lZGlhdGVrOiBHZXQgcmlkIG9mIG10a19z
bWlfbGFyYl9nZXQvcHV0DQo+ID4gICAgbWVkaWE6IG10ay12Y29kZWM6IEdldCByaWQgb2YgbXRr
X3NtaV9sYXJiX2dldC9wdXQNCj4gPiAgICBtZW1vcnk6IG10ay1zbWk6IEdldCByaWQgb2YgbXRr
X3NtaV9sYXJiX2dldC9wdXQNCj4gPiAgICBhcm06IGR0czogbWVkaWF0ZWs6IEdldCByaWQgb2Yg
bWVkaWF0ZWssbGFyYiBmb3IgTU0gbm9kZXMNCj4gPiAgICBhcm02NDogZHRzOiBtZWRpYXRlazog
R2V0IHJpZCBvZiBtZWRpYXRlayxsYXJiIGZvciBNTSBub2Rlcw0KPiA+IA0KPiA+IFlvbmdxaWFu
ZyBOaXUgKDEpOg0KPiA+ICAgIGRybS9tZWRpYXRlazogQWRkIHBtIHJ1bnRpbWUgc3VwcG9ydCBm
b3Igb3ZsIGFuZCByZG1hDQo+ID4gDQo+ID4gICAuLi4vZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dCAgICAgICAgfCAgOSAtLS0tDQo+ID4gICAuLi4vYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWstanBlZy1kZWNvZGVyLnlhbWwgfCAgOSAtLS0tDQo+ID4gICAuLi4vYmluZGluZ3MvbWVk
aWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnlhbWwgfCAgOSAtLS0tDQo+ID4gICAuLi4vYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWstbWRwLnR4dCAgICAgICAgICAgfCAgOCAtLS0tDQo+ID4gICAuLi4v
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dCAgICAgICAgfCAgNCAtLQ0KPiA+ICAg
YXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kgICAgICAgICAgICAgICAgIHwgIDIgLQ0KPiA+
ICAgYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi5kdHNpICAgICAgICAgICAgICAgIHwgIDUgLS0N
Cj4gPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kgICAgICB8IDE2
IC0tLS0tLS0NCj4gPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kg
ICAgICB8ICA2IC0tLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jICAgICAgIHwgIDkgKysrLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
aXNwX3JkbWEuYyAgICAgIHwgIDkgKysrLQ0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jICAgICAgIHwgMTkgKysrKy0tLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgICB8IDM2ICstLS0tLS0tLS0tLS0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaCAgIHwgIDEgLQ0K
PiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgICAgICAgIHwgIDUg
Ky0NCj4gPiAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgICAgICAgICAgICAgICAgICAgICB8
IDI0ICsrKysrKysrKy0NCj4gPiAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3YxLmMgICAgICAg
ICAgICAgICAgICB8IDIyICsrKysrKysrLQ0KPiA+ICAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYyAgIHwgNDUgKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gICAuLi4v
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oICAgfCAgMiAtDQo+ID4gICBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMgfCA0NiArLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21k
cF9jb21wLmggfCAgMiAtDQo+ID4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRr
X21kcF9jb3JlLmMgfCAgMSAtDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19wbS5jICAgfCAzNyArKy0tLS0tLS0tLS0tLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9t
dGstdmNvZGVjL210a192Y29kZWNfZHJ2LmggICAgICB8ICAzIC0tDQo+ID4gICAuLi4vcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jICAgICAgfCAgMSAtDQo+ID4gICAuLi4vcGxh
dGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19wbS5jICAgfCA0NCArKy0tLS0tLS0tLS0t
LS0tLS0NCj4gPiAgIGRyaXZlcnMvbWVtb3J5L210ay1zbWkuYyAgICAgICAgICAgICAgICAgICAg
ICB8IDE0IC0tLS0tLQ0KPiA+ICAgaW5jbHVkZS9zb2MvbWVkaWF0ZWsvc21pLmggICAgICAgICAg
ICAgICAgICAgIHwgMjAgLS0tLS0tLS0NCj4gPiAgIDI4IGZpbGVzIGNoYW5nZWQsIDg1IGluc2Vy
dGlvbnMoKyksIDMyMyBkZWxldGlvbnMoLSkNCj4gPiANCg0K

