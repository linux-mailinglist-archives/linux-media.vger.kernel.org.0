Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5013C8391
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbhGNLTX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:19:23 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:34975 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232161AbhGNLTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:19:23 -0400
X-UUID: 278399093b1c47ff99b8fa073b4ed77b-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=I1AIYOviiCLaz5bYm8DUlQalApcOd6QrzCO//5CMBTY=;
        b=ADHw3ajNtu6FHv6+8fzGn58ykua4BCJSnSeVfH6yYIL2tAzFlw0XO9ClzNBfAD3TYzC/8S2rom3QYUzHG2Siwz1zKbU0uQi4P1BEmXC/gct44uNDu+Bef3Ls/LS5knhoNxBJw/qHS1+nO5UOba1Jsx1aVqx0j0/vItJrFHpsIsQ=;
X-UUID: 278399093b1c47ff99b8fa073b4ed77b-20210714
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2053316303; Wed, 14 Jul 2021 19:16:28 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Jul
 2021 19:16:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:16:24 +0800
Message-ID: <1626261384.14352.13.camel@mhfsdcap03>
Subject: Re: [PATCH v6 03/11] iommu/mediatek: Add device_link between the
 consumer and the larb devices
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
Date:   Wed, 14 Jul 2021 19:16:24 +0800
In-Reply-To: <f7b2c5e5-f540-b885-f063-9611031035bc@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
         <20210714025626.5528-4-yong.wu@mediatek.com>
         <f7b2c5e5-f540-b885-f063-9611031035bc@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0F41A4D2E10A0920DEDC22C00094324303009B46911208F4D64AC685FD3491552000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDEwOjI2ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMTQuMDcuMjEgMDQ6NTYsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gTWVkaWFUZWsg
SU9NTVUtU01JIGRpYWdyYW0gaXMgbGlrZSBiZWxvdy4gYWxsIHRoZSBjb25zdW1lciBjb25uZWN0
IHdpdGgNCj4gPiBzbWktbGFyYiwgdGhlbiBjb25uZWN0IHdpdGggc21pLWNvbW1vbi4NCj4gPiAN
Cj4gPiAgICAgICAgICBNNFUNCj4gPiAgICAgICAgICAgfA0KPiA+ICAgICAgc21pLWNvbW1vbg0K
PiA+ICAgICAgICAgICB8DQo+ID4gICAgLS0tLS0tLS0tLS0tLQ0KPiA+ICAgIHwgICAgICAgICB8
ICAgIC4uLg0KPiA+ICAgIHwgICAgICAgICB8DQo+ID4gbGFyYjEgICAgIGxhcmIyDQo+ID4gICAg
fCAgICAgICAgIHwNCj4gPiB2ZGVjICAgICAgIHZlbmMNCj4gPiANCj4gPiBXaGVuIHRoZSBjb25z
dW1lciB3b3JrcywgaXQgc2hvdWxkIGVuYWJsZSB0aGUgc21pLWxhcmIncyBwb3dlciB3aGljaA0K
PiA+IGFsc28gbmVlZCBlbmFibGUgdGhlIHNtaS1jb21tb24ncyBwb3dlciBmaXJzdGx5Lg0KPiA+
IA0KPiA+IFRodXMsIEZpcnN0IG9mIGFsbCwgdXNlIHRoZSBkZXZpY2UgbGluayBjb25uZWN0IHRo
ZSBjb25zdW1lciBhbmQgdGhlDQo+ID4gc21pLWxhcmJzLiB0aGVuIGFkZCBkZXZpY2UgbGluayBi
ZXR3ZWVuIHRoZSBzbWktbGFyYiBhbmQgc21pLWNvbW1vbi4NCj4gPiANCj4gPiBUaGlzIHBhdGNo
IGFkZHMgZGV2aWNlX2xpbmsgYmV0d2VlbiB0aGUgY29uc3VtZXIgYW5kIHRoZSBsYXJicy4NCj4g
PiANCj4gPiBXaGVuIGRldmljZV9saW5rX2FkZCwgSSBhZGQgdGhlIGZsYWcgRExfRkxBR19TVEFU
RUxFU1MgdG8gYXZvaWQgY2FsbGluZw0KPiA+IHBtX3J1bnRpbWVfeHggdG8ga2VlcCB0aGUgb3Jp
Z2luYWwgc3RhdHVzIG9mIGNsb2Nrcy4gSXQgY2FuIGF2b2lkIHR3bw0KPiA+IGlzc3VlczoNCj4g
PiAxKSBEaXNwbGF5IEhXIHNob3cgZmFzdGxvZ28gYWJub3JtYWxseSByZXBvcnRlZCBpbiBbMV0u
IEF0IHRoZSBiZWdnaW5pbmcsDQo+ID4gYWxsIHRoZSBjbG9ja3MgYXJlIGVuYWJsZWQgYmVmb3Jl
IGVudGVyaW5nIGtlcm5lbCwgYnV0IHRoZSBjbG9ja3MgZm9yDQo+ID4gZGlzcGxheSBIVyhhbHdh
eXMgaW4gbGFyYjApIHdpbGwgYmUgZ2F0ZWQgYWZ0ZXIgY2xrX2VuYWJsZSBhbmQgY2xrX2Rpc2Fi
bGUNCj4gPiBjYWxsZWQgZnJvbSBkZXZpY2VfbGlua19hZGQoLT5wbV9ydW50aW1lX3Jlc3VtZSkg
YW5kIHJwbV9pZGxlLiBUaGUgY2xvY2sNCj4gPiBvcGVyYXRpb24gaGFwcGVuZWQgYmVmb3JlIGRp
c3BsYXkgZHJpdmVyIHByb2JlLiBBdCB0aGF0IHRpbWUsIHRoZSBkaXNwbGF5DQo+ID4gSFcgd2ls
bCBiZSBhYm5vcm1hbC4NCj4gPiANCj4gPiAyKSBBIGRlYWRsb2NrIGlzc3VlIHJlcG9ydGVkIGlu
IFsyXS4gVXNlIERMX0ZMQUdfU1RBVEVMRVNTIHRvIHNraXANCj4gPiBwbV9ydW50aW1lX3h4IHRv
IGF2b2lkIHRoZSBkZWFkbG9jay4NCj4gPiANCj4gPiBDb3JyZXNwb25kaW5nLCBETF9GTEFHX0FV
VE9SRU1PVkVfQ09OU1VNRVIgY2FuJ3QgYmUgYWRkZWQsIHRoZW4NCj4gPiBkZXZpY2VfbGlua19y
ZW1vdmVkIHNob3VsZCBiZSBhZGRlZCBleHBsaWNpdGx5Lg0KPiA+IA0KPiA+IFsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYXRlay8xNTY0MjEzODg4LjIyOTA4LjQuY2FtZWxA
bWhmc2RjYXAwMy8NCj4gPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Bh
dGNoLzEwODY1NjkvDQo+ID4gDQo+ID4gU3VnZ2VzdGVkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FA
Y2hyb21pdW0ub3JnPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYyAgICB8IDIy
ICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3Yx
LmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaW9tbXUvbXRrX2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gaW5k
ZXggYTAyZGRlMDk0Nzg4Li5lZTc0MjkwMGNmNGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9p
b21tdS9tdGtfaW9tbXUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4g
PiBAQCAtNTcxLDIyICs1NzEsNDQgQEAgc3RhdGljIHN0cnVjdCBpb21tdV9kZXZpY2UgKm10a19p
b21tdV9wcm9iZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgew0KPiA+ICAgCXN0
cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7DQo+
ID4gICAJc3RydWN0IG10a19pb21tdV9kYXRhICpkYXRhOw0KPiA+ICsJc3RydWN0IGRldmljZV9s
aW5rICpsaW5rOw0KPiA+ICsJc3RydWN0IGRldmljZSAqbGFyYmRldjsNCj4gPiArCXVuc2lnbmVk
IGludCBsYXJiaWQ7DQo+ID4gICANCj4gPiAgIAlpZiAoIWZ3c3BlYyB8fCBmd3NwZWMtPm9wcyAh
PSAmbXRrX2lvbW11X29wcykNCj4gPiAgIAkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7IC8qIE5v
dCBhIGlvbW11IGNsaWVudCBkZXZpY2UgKi8NCj4gPiAgIA0KPiA+ICAgCWRhdGEgPSBkZXZfaW9t
bXVfcHJpdl9nZXQoZGV2KTsNCj4gPiAgIA0KPiA+ICsJLyoNCj4gPiArCSAqIExpbmsgdGhlIGNv
bnN1bWVyIGRldmljZSB3aXRoIHRoZSBzbWktbGFyYiBkZXZpY2Uoc3VwcGxpZXIpDQo+ID4gKwkg
KiBUaGUgZGV2aWNlIGluIGVhY2ggYSBsYXJiIGlzIGEgaW5kZXBlbmRlbnQgSFcuIHRodXMgb25s
eSBsaW5rDQo+ID4gKwkgKiBvbmUgbGFyYiBoZXJlLg0KPiA+ICsJICovDQo+ID4gKwlsYXJiaWQg
PSBNVEtfTTRVX1RPX0xBUkIoZndzcGVjLT5pZHNbMF0pOw0KPiA+ICsJbGFyYmRldiA9IGRhdGEt
PmxhcmJfaW11W2xhcmJpZF0uZGV2Ow0KPiA+ICsJbGluayA9IGRldmljZV9saW5rX2FkZChkZXYs
IGxhcmJkZXYsDQo+ID4gKwkJCSAgICAgICBETF9GTEFHX1BNX1JVTlRJTUUgfCBETF9GTEFHX1NU
QVRFTEVTUyk7DQo+ID4gKwlpZiAoIWxpbmspDQo+ID4gKwkJZGV2X2VycihkZXYsICJVbmFibGUg
dG8gbGluayAlc1xuIiwgZGV2X25hbWUobGFyYmRldikpOw0KPiBzaG91ZG4ndCBFUlJfUFRSIGJl
IHJldHVybmVkIGluIGNhc2Ugb2YgZmFpbHVyZT8NCg0KSW4gdGhlIHByZXZpb3VzIGRlc2lnbiwg
dGhpcyBpcyBub3QgYSBmYXRhbCBlcnJvci4gdGhlIGNvbnN1bWVyIGRldmljZQ0KY291bGQgcHJv
YmUgY29udGludW91c2x5IGV2ZW4gdGhvdWdoIGl0IGZhaWwgaGVyZS4uUmV0dXJuaW5nIGhlcmUg
bWF5DQpsZXQgdGhlIGlzc3VlIGJlIGNhdWdodCBlYXJsaWVyLCBJIHdpbGwgYWRkIHRoaXMgaW4g
bmV4dCB2ZXJzaW9uLg0KDQogaWYgKCFsaW5rKSB7DQogICAgICAuLi4NCiAgICAgIHJldHVybiBF
UlJfUFRSKEVJTlZBTCk7DQogIH0NCg0KPiANCj4gVGhhbmtzLA0KPiBEYWZuYQ0KPiANCj4gPiAg
IAlyZXR1cm4gJmRhdGEtPmlvbW11Ow0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBzdGF0aWMgdm9p
ZCBtdGtfaW9tbXVfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICAgew0K
PiA+ICAgCXN0cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0
KGRldik7DQo+ID4gKwlzdHJ1Y3QgbXRrX2lvbW11X2RhdGEgKmRhdGE7DQo+ID4gKwlzdHJ1Y3Qg
ZGV2aWNlICpsYXJiZGV2Ow0KPiA+ICsJdW5zaWduZWQgaW50IGxhcmJpZDsNCj4gPiAgIA0KPiA+
ICAgCWlmICghZndzcGVjIHx8IGZ3c3BlYy0+b3BzICE9ICZtdGtfaW9tbXVfb3BzKQ0KPiA+ICAg
CQlyZXR1cm47DQo+ID4gICANCj4gPiArCWRhdGEgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsN
Cj4gPiArCWxhcmJpZCA9IE1US19NNFVfVE9fTEFSQihmd3NwZWMtPmlkc1swXSk7DQo+ID4gKwls
YXJiZGV2ID0gZGF0YS0+bGFyYl9pbXVbbGFyYmlkXS5kZXY7DQo+ID4gKwlkZXZpY2VfbGlua19y
ZW1vdmUoZGV2LCBsYXJiZGV2KTsNCj4gPiArDQo+ID4gICAJaW9tbXVfZndzcGVjX2ZyZWUoZGV2
KTsNCj4gPiAgIH0NCj4gPiAgIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L210a19p
b21tdV92MS5jIGIvZHJpdmVycy9pb21tdS9tdGtfaW9tbXVfdjEuYw0KPiA+IGluZGV4IGQ5MzY1
YTNkOGRjOS4uZDJhN2M2NmI4MjM5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvbXRr
X2lvbW11X3YxLmMNCj4gPiArKysgYi9kcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jDQo+ID4g
QEAgLTQyNCw3ICs0MjQsOSBAQCBzdGF0aWMgc3RydWN0IGlvbW11X2RldmljZSAqbXRrX2lvbW11
X3Byb2JlX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICAJc3RydWN0IGlvbW11X2Z3
c3BlYyAqZndzcGVjID0gZGV2X2lvbW11X2Z3c3BlY19nZXQoZGV2KTsNCj4gPiAgIAlzdHJ1Y3Qg
b2ZfcGhhbmRsZV9hcmdzIGlvbW11X3NwZWM7DQo+ID4gICAJc3RydWN0IG10a19pb21tdV9kYXRh
ICpkYXRhOw0KPiA+IC0JaW50IGVyciwgaWR4ID0gMDsNCj4gPiArCWludCBlcnIsIGlkeCA9IDAs
IGxhcmJpZDsNCj4gPiArCXN0cnVjdCBkZXZpY2VfbGluayAqbGluazsNCj4gPiArCXN0cnVjdCBk
ZXZpY2UgKmxhcmJkZXY7DQo+ID4gICANCj4gPiAgIAl3aGlsZSAoIW9mX3BhcnNlX3BoYW5kbGVf
d2l0aF9hcmdzKGRldi0+b2Zfbm9kZSwgImlvbW11cyIsDQo+ID4gICAJCQkJCSAgICIjaW9tbXUt
Y2VsbHMiLA0KPiA+IEBAIC00NDUsNiArNDQ3LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgaW9tbXVfZGV2
aWNlICptdGtfaW9tbXVfcHJvYmVfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIA0K
PiA+ICAgCWRhdGEgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsNCj4gPiAgIA0KPiA+ICsJLyog
TGluayB0aGUgY29uc3VtZXIgZGV2aWNlIHdpdGggdGhlIHNtaS1sYXJiIGRldmljZShzdXBwbGll
cikgKi8NCj4gPiArCWxhcmJpZCA9IG10MjcwMV9tNHVfdG9fbGFyYihmd3NwZWMtPmlkc1swXSk7
DQo+ID4gKwlsYXJiZGV2ID0gZGF0YS0+bGFyYl9pbXVbbGFyYmlkXS5kZXY7DQo+ID4gKwlsaW5r
ID0gZGV2aWNlX2xpbmtfYWRkKGRldiwgbGFyYmRldiwNCj4gPiArCQkJICAgICAgIERMX0ZMQUdf
UE1fUlVOVElNRSB8IERMX0ZMQUdfU1RBVEVMRVNTKTsNCj4gPiArCWlmICghbGluaykNCj4gPiAr
CQlkZXZfZXJyKGRldiwgIlVuYWJsZSB0byBsaW5rICVzXG4iLCBkZXZfbmFtZShsYXJiZGV2KSk7
DQo+ID4gKw0KPiA+ICAgCXJldHVybiAmZGF0YS0+aW9tbXU7DQo+ID4gICB9DQo+ID4gICANCj4g
PiBAQCAtNDY1LDEwICs0NzUsMTggQEAgc3RhdGljIHZvaWQgbXRrX2lvbW11X3Byb2JlX2ZpbmFs
aXplKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIHN0YXRpYyB2b2lkIG10a19pb21tdV9yZWxl
YXNlX2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IGlv
bW11X2Z3c3BlYyAqZndzcGVjID0gZGV2X2lvbW11X2Z3c3BlY19nZXQoZGV2KTsNCj4gPiArCXN0
cnVjdCBtdGtfaW9tbXVfZGF0YSAqZGF0YTsNCj4gPiArCXN0cnVjdCBkZXZpY2UgKmxhcmJkZXY7
DQo+ID4gKwl1bnNpZ25lZCBpbnQgbGFyYmlkOw0KPiA+ICAgDQo+ID4gICAJaWYgKCFmd3NwZWMg
fHwgZndzcGVjLT5vcHMgIT0gJm10a19pb21tdV9vcHMpDQo+ID4gICAJCXJldHVybjsNCj4gPiAg
IA0KPiA+ICsJZGF0YSA9IGRldl9pb21tdV9wcml2X2dldChkZXYpOw0KPiA+ICsJbGFyYmlkID0g
bXQyNzAxX200dV90b19sYXJiKGZ3c3BlYy0+aWRzWzBdKTsNCj4gPiArCWxhcmJkZXYgPSBkYXRh
LT5sYXJiX2ltdVtsYXJiaWRdLmRldjsNCj4gPiArCWRldmljZV9saW5rX3JlbW92ZShkZXYsIGxh
cmJkZXYpOw0KPiA+ICsNCj4gPiAgIAlpb21tdV9md3NwZWNfZnJlZShkZXYpOw0KPiA+ICAgfQ0K
PiA+ICAgDQo+ID4gDQoNCg==

