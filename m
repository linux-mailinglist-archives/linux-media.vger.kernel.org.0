Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B564817343D
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 10:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbgB1Jht (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 04:37:49 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:15222 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726642AbgB1Jht (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 04:37:49 -0500
X-UUID: f3b7790cce4e46a48dd3fb5a2e6e76ae-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wbDyMawynlrwHWkUP0rf/CmT5tZ9aeV3JKqgN+jnUl8=;
        b=ZRx8M3Wnifgb+h9tl0gfO6h5jaIQLReCZBPxWaOoSwovd/QlrWYu7DNqjAV7NACZooSZvcV1UjGyrTZFHhGlelpTLEpVpDaTzAsdymzfuVlK1mzucRwLmXvIUAEG4Lg9dM29X9j1G1KMI2s9myAZmEISNLp5h5GGR4IRTf7Lc8I=;
X-UUID: f3b7790cce4e46a48dd3fb5a2e6e76ae-20200228
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1750308215; Fri, 28 Feb 2020 17:37:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 17:36:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 17:37:27 +0800
Message-ID: <1582882664.22475.6.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
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
        Daniel Vetter <daniel@ffwll.ch>
Date:   Fri, 28 Feb 2020 17:37:44 +0800
In-Reply-To: <20200227180858.1514157-5-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
         <20200227180858.1514157-5-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBUaHUsIDIwMjAtMDItMjcgYXQgMTk6MDggKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IFByb3ZpZGUgYSBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qo
KSBhbmQgbXRrX21tc3lzX2Rpc2Nvbm5lY3QoKSBmdW5jdGlvbnMgdG8NCj4gcmVwbGFjZSBtdGtf
ZGRwX2FkZF9jb21wX3RvX3BhdGgoKSBhbmQgbXRrX2RkcF9yZW1vdmVfY29tcF9mcm9tX3BhdGgo
KS4NCj4gVGhvc2UgZnVuY3Rpb25zIHdpbGwgYWxsb3cgRFJNIGRyaXZlciBhbmQgb3RoZXJzIHRv
IGNvbnRyb2wgdGhlIGRhdGENCj4gcGF0aCByb3V0aW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
RW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4g
LS0tDQo+IA0KPiBDaGFuZ2VzIGluIHYxMDoNCj4gLSBJbnRyb2R1Y2VkIGEgbmV3IHBhdGNoIHRv
IG1vdmUgcm91dGluZyBjb250cm9sIGludG8gbW1zeXMgZHJpdmVyLg0KPiAtIFJlbW92ZWQgdGhl
IHBhdGNoIHRvIHVzZSByZWdtYXAgYXMgaXMgbm90IG5lZWRlZCBhbnltb3JlLg0KPiANCj4gQ2hh
bmdlcyBpbiB2OTogTm9uZQ0KPiBDaGFuZ2VzIGluIHY4OiBOb25lDQo+IENoYW5nZXMgaW4gdjc6
IE5vbmUNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAg
MTMgKy0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jICB8IDI1NiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHAuaCAgfCAgIDcgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmMgIHwgIDEzICstDQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICAg
fCAyNzUgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaCAgfCAgMTkgKysNCj4gIDYgZmlsZXMgY2hhbmdlZCwgMzA2IGluc2Vy
dGlvbnMoKyksIDI3NyBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuYw0KPiBpbmRleCBmZDQwNDJkZTEyZjIuLjNjODk0NDliZWE2ZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBAQCAtNiw2
ICs2LDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9w
bV9ydW50aW1lLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+
DQo+ICsjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oPg0KPiAgDQo+ICAj
aW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4NCj4gICNpbmNsdWRlIDxzb2MvbWVkaWF0ZWsvc21pLmg+
DQo+IEBAIC0yOTYsOSArMjk3LDkgQEAgc3RhdGljIGludCBtdGtfY3J0Y19kZHBfaHdfaW5pdChz
dHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykNCj4gIAl9DQo+ICANCj4gIAlmb3IgKGkgPSAw
OyBpIDwgbXRrX2NydGMtPmRkcF9jb21wX25yIC0gMTsgaSsrKSB7DQo+IC0JCW10a19kZHBfYWRk
X2NvbXBfdG9fcGF0aChtdGtfY3J0Yy0+Y29uZmlnX3JlZ3MsDQo+IC0JCQkJCSBtdGtfY3J0Yy0+
ZGRwX2NvbXBbaV0tPmlkLA0KPiAtCQkJCQkgbXRrX2NydGMtPmRkcF9jb21wW2kgKyAxXS0+aWQp
Ow0KPiArCQltdGtfbW1zeXNfZGRwX2Nvbm5lY3QobXRrX2NydGMtPmNvbmZpZ19yZWdzLA0KPiAr
CQkJCSAgICAgIG10a19jcnRjLT5kZHBfY29tcFtpXS0+aWQsDQo+ICsJCQkJICAgICAgbXRrX2Ny
dGMtPmRkcF9jb21wW2kgKyAxXS0+aWQpOw0KDQpXaGVuIENPTkZJR19NVEtfTU1TWVMgaXMgbm90
IGVuYWJsZSwgdGhpcyB3b3VsZCBidWlsdCBmYWlsLiBTbyBtYWtlIHNvbWUNCm1vZGlmaWNhdGlv
biBpbiBLY29uZmlnLg0KDQo+ICAJCW10a19kaXNwX211dGV4X2FkZF9jb21wKG10a19jcnRjLT5t
dXRleCwNCj4gIAkJCQkJbXRrX2NydGMtPmRkcF9jb21wW2ldLT5pZCk7DQo+ICAJfQ0KPiBAQCAt
MzU1LDkgKzM1Niw5IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9od19maW5pKHN0cnVjdCBt
dGtfZHJtX2NydGMgKm10a19jcnRjKQ0KPiAgCQkJCQkgICBtdGtfY3J0Yy0+ZGRwX2NvbXBbaV0t
PmlkKTsNCj4gIAltdGtfZGlzcF9tdXRleF9kaXNhYmxlKG10a19jcnRjLT5tdXRleCk7DQo+ICAJ
Zm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9uciAtIDE7IGkrKykgew0KPiAtCQlt
dGtfZGRwX3JlbW92ZV9jb21wX2Zyb21fcGF0aChtdGtfY3J0Yy0+Y29uZmlnX3JlZ3MsDQo+IC0J
CQkJCSAgICAgIG10a19jcnRjLT5kZHBfY29tcFtpXS0+aWQsDQo+IC0JCQkJCSAgICAgIG10a19j
cnRjLT5kZHBfY29tcFtpICsgMV0tPmlkKTsNCj4gKwkJbXRrX21tc3lzX2RkcF9kaXNjb25uZWN0
KG10a19jcnRjLT5jb25maWdfcmVncywNCj4gKwkJCQkJIG10a19jcnRjLT5kZHBfY29tcFtpXS0+
aWQsDQo+ICsJCQkJCSBtdGtfY3J0Yy0+ZGRwX2NvbXBbaSArIDFdLT5pZCk7DQo+ICAJCW10a19k
aXNwX211dGV4X3JlbW92ZV9jb21wKG10a19jcnRjLT5tdXRleCwNCj4gIAkJCQkJICAgbXRrX2Ny
dGMtPmRkcF9jb21wW2ldLT5pZCk7DQo+ICAJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYw0KPiBpbmRleCBiODg1ZjYwZjQ3NGMuLjAxNGMxYmJlMWRmMiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMNCj4gQEAgLTEzLDI2ICsxMyw2IEBA
DQo+ICAjaW5jbHVkZSAibXRrX2RybV9kZHAuaCINCj4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9j
b21wLmgiDQo+ICANCg0KW3NuaXBdDQoNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29j
L21lZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1t
c3lzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMmZk
ODZlNjJhOGQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaA0KPiBAQCAtMCwwICsxLDE5IEBADQo+ICsvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IChjKSAy
MDE1IE1lZGlhVGVrIEluYy4NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9fTVRLX01NU1lTX0gN
Cj4gKyNkZWZpbmUgX19NVEtfTU1TWVNfSA0KPiArDQo+ICtlbnVtIG10a19kZHBfY29tcF9pZDsN
Cj4gKw0KPiArdm9pZCBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qodm9pZCBfX2lvbWVtICpjb25maWdf
cmVncywNCg0KSSBwcmVmZXIgdGhlIGZpcnN0IHBhcmFtZXRlciB0byBiZSAnc3RydWN0IGRldmlj
ZSAqZGV2JyB3aGljaCBpcyB0aGUNCmRldmljZSBwb2ludGVyIG9mIG1tc3lzIGRldmljZS4gYW5k
IG1tc3lzIGRyaXZlciBjb3VsZCB1c2UgdGhpcyBwb2ludGVyDQp0byBnZXQgaXRzIHJlZ2lzdGVy
IGFkZHJlc3MuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCQkgICBlbnVtIG10a19kZHBfY29tcF9p
ZCBjdXIsDQo+ICsJCQkgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KTsNCj4gKw0KPiArdm9p
ZCBtdGtfbW1zeXNfZGRwX2Rpc2Nvbm5lY3Qodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywNCj4g
KwkJCSAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gKwkJCSAgICAgIGVudW0gbXRr
X2RkcF9jb21wX2lkIG5leHQpOw0KPiArDQo+ICsjZW5kaWYgLyogX19NVEtfTU1TWVNfSCAqLw0K
DQo=

