Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76D831734FD
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 11:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgB1KHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 05:07:53 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:49546 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726400AbgB1KHx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 05:07:53 -0500
X-UUID: 0ec4a2220662443b863fd358cded835e-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=1DhT26Nw0ev4Fr8ahrt98NxVPN2Jg/ECXsapb7EkmRI=;
        b=HtrLp0Fn/52njlsl7gP4qX/rtdjoWM3Yx5sAZb02xfx13B6XMjhW2GRxxZ1QEn5fRsNCeJ1dIXrb1LeGxJqkuBUieJpcVZvnWdYZ+nUcqKo/fcC/CfQNoZKj82PlQKj4vPBihy3rEzou/j8HSQupuH3lJdKG9VAOCF+v+jzFRtU=;
X-UUID: 0ec4a2220662443b863fd358cded835e-20200228
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1660331952; Fri, 28 Feb 2020 18:07:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 18:06:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 18:07:36 +0800
Message-ID: <1582884456.25698.0.camel@mtksdaap41>
Subject: Re: [PATCH v10 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
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
Date:   Fri, 28 Feb 2020 18:07:36 +0800
In-Reply-To: <20200227180858.1514157-6-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
         <20200227180858.1514157-6-enric.balletbo@collabora.com>
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
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IEluIHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24gdGhl
IHNhbWUgY29tcGF0aWJsZSBzdHJpbmcNCj4gIm1lZGlhdGVrLDxjaGlwPi1tbXN5cyIgaXMgdXNl
ZCB0byBiaW5kIHRoZSBjbG9jayBkcml2ZXJzDQo+IChkcml2ZXJzL3NvYy9tZWRpYXRlaykgYXMg
d2VsbCBhcyB0byB0aGUgZ3B1IGRyaXZlcg0KPiAoZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMpLiBUaGlzIGVuZHMgd2l0aCB0aGUgcHJvYmxlbQ0KPiB0aGF0IHRoZSBvbmx5
IHByb2JlZCBkcml2ZXIgaXMgdGhlIGNsb2NrIGRyaXZlciBhbmQgdGhlcmUgaXMgbm8gZGlzcGxh
eQ0KPiBhdCBhbGwuDQo+IA0KPiBJbiBhbnkgY2FzZSBoYXZpbmcgdGhlIHNhbWUgY29tcGF0aWJs
ZSBzdHJpbmcgZm9yIHR3byBkcml2ZXJzIGlzIG5vdA0KPiBjb3JyZWN0IGFuZCBzaG91bGQgYmUg
Zml4ZWQuIFRvIGZpeCB0aGlzLCBhbmQgbWFpbnRhaW4gYmFja3dhcmQNCj4gY29tcGF0aWJpbGl0
eSwgd2UgY2FuIGNvbnNpZGVyIHRoYXQgdGhlIG1tc3lzIGRyaXZlciBpcyB0aGUgdG9wLWxldmVs
DQo+IGVudHJ5IHBvaW50IGZvciB0aGUgbXVsdGltZWRpYSBzdWJzeXN0ZW0sIHNvIGlzIG5vdCBh
IHB1cmUgY2xvY2sNCj4gY29udHJvbGxlciBidXQgYSBzeXN0ZW0gY29udHJvbGxlciwgYW5kIHRo
ZSBkcm0gZHJpdmVyIGlzIGluc3RhbnRpYXRlZA0KPiBieSB0aGF0IE1NU1lTIGRyaXZlci4NCg0K
UmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29t
Pg0KPiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjEwOg0KPiAtIE1hdGNoIGRyaXZlciBkYXRhIHRv
IGdldCBkaXNwbGF5IHJvdXRpbmcuDQo+IA0KPiBDaGFuZ2VzIGluIHY5Og0KPiAtIERvIG5vdCBt
b3ZlIHRoZSBkaXNwbGF5IHJvdXRpbmcgZnJvbSB0aGUgZHJtIGRyaXZlciAoQ0spDQo+IA0KPiBD
aGFuZ2VzIGluIHY4Og0KPiAtIE5ldyBwYXRjaCBpbnRyb2R1Y2VkIGluIHRoaXMgc2VyaWVzLg0K
PiANCj4gQ2hhbmdlcyBpbiB2NzogTm9uZQ0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jIHwgMzEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gIGRyaXZl
cnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICAgICAgIHwgIDYgKysrKysNCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCAwMjAxMWQzMTY4ZGYuLjI5MjUy
ZmMwYWFiNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
QEAgLTQyMiw5ICs0MjIsMjEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRr
X2RkcF9jb21wX2R0X2lkc1tdID0gew0KPiAgCXsgfQ0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RybV9vZl9pZHNbXSA9IHsNCj4gKwl7IC5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1tbXN5cyIsDQo+ICsJICAuZGF0YSA9ICZtdDI3MDFf
bW1zeXNfZHJpdmVyX2RhdGF9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEy
LW1tc3lzIiwNCj4gKwkgIC5kYXRhID0gJm10MjcxMl9tbXN5c19kcml2ZXJfZGF0YX0sDQo+ICsJ
eyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtbW1zeXMiLA0KPiArCSAgLmRhdGEgPSAm
bXQ4MTczX21tc3lzX2RyaXZlcl9kYXRhfSwNCj4gKwl7IH0NCj4gK307DQo+ICsNCj4gIHN0YXRp
YyBpbnQgbXRrX2RybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0K
PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IGRldmljZV9u
b2RlICpwaGFuZGxlID0gZGV2LT5wYXJlbnQtPm9mX25vZGU7DQo+ICsJY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCAqb2ZfaWQ7DQo+ICAJc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZTsN
Cj4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+ICAJc3RydWN0IGNvbXBvbmVudF9tYXRj
aCAqbWF0Y2ggPSBOVUxMOw0KPiBAQCAtNDQzLDggKzQ1NSwxNCBAQCBzdGF0aWMgaW50IG10a19k
cm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJcmV0dXJuIC1FTk9E
RVY7DQo+ICAJfQ0KPiAgDQo+ICsJb2ZfaWQgPSBvZl9tYXRjaF9ub2RlKG10a19kcm1fb2ZfaWRz
LCBwaGFuZGxlKTsNCj4gKwlpZiAoIW9mX2lkKQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0K
PiArCXByaXZhdGUtPmRhdGEgPSBvZl9pZC0+ZGF0YTsNCj4gKw0KPiAgCS8qIEl0ZXJhdGUgb3Zl
ciBzaWJsaW5nIERJU1AgZnVuY3Rpb24gYmxvY2tzICovDQo+IC0JZm9yX2VhY2hfY2hpbGRfb2Zf
bm9kZShkZXYtPm9mX25vZGUtPnBhcmVudCwgbm9kZSkgew0KPiArCWZvcl9lYWNoX2NoaWxkX29m
X25vZGUocGhhbmRsZS0+cGFyZW50LCBub2RlKSB7DQo+ICAJCWNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgKm9mX2lkOw0KPiAgCQllbnVtIG10a19kZHBfY29tcF90eXBlIGNvbXBfdHlwZTsNCj4g
IAkJaW50IGNvbXBfaWQ7DQo+IEBAIC01NzYsMjIgKzU5NCwxMSBAQCBzdGF0aWMgaW50IG10a19k
cm1fc3lzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICBzdGF0aWMgU0lNUExFX0RFVl9Q
TV9PUFMobXRrX2RybV9wbV9vcHMsIG10a19kcm1fc3lzX3N1c3BlbmQsDQo+ICAJCQkgbXRrX2Ry
bV9zeXNfcmVzdW1lKTsNCj4gIA0KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
bXRrX2RybV9vZl9pZHNbXSA9IHsNCj4gLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Mjcw
MS1tbXN5cyIsDQo+IC0JICAuZGF0YSA9ICZtdDI3MDFfbW1zeXNfZHJpdmVyX2RhdGF9LA0KPiAt
CXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzEyLW1tc3lzIiwNCj4gLQkgIC5kYXRhID0g
Jm10MjcxMl9tbXN5c19kcml2ZXJfZGF0YX0sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxNzMtbW1zeXMiLA0KPiAtCSAgLmRhdGEgPSAmbXQ4MTczX21tc3lzX2RyaXZlcl9kYXRh
fSwNCj4gLQl7IH0NCj4gLX07DQo+IC0NCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IG10a19kcm1fcGxhdGZvcm1fZHJpdmVyID0gew0KPiAgCS5wcm9iZQk9IG10a19kcm1fcHJvYmUs
DQo+ICAJLnJlbW92ZQk9IG10a19kcm1fcmVtb3ZlLA0KPiAgCS5kcml2ZXIJPSB7DQo+ICAJCS5u
YW1lCT0gIm1lZGlhdGVrLWRybSIsDQo+IC0JCS5vZl9tYXRjaF90YWJsZSA9IG10a19kcm1fb2Zf
aWRzLA0KPiAgCQkucG0gICAgID0gJm10a19kcm1fcG1fb3BzLA0KPiAgCX0sDQo+ICB9Ow0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgYi9kcml2ZXJzL3Nv
Yy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiBpbmRleCBhOGE5ODc3NzA2NGUuLmQ5OWM4YmViMmVk
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gKysr
IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMNCj4gQEAgLTM3Nyw2ICszNzcsNyBA
QCBzdGF0aWMgaW50IG10a19tbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiAgCWNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEgKmRhdGE7DQo+ICAJc3Ry
dWN0IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOw0KPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7DQo+ICsJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZHJtOw0KPiAgCXZvaWQg
X19pb21lbSAqY29uZmlnX3JlZ3M7DQo+ICAJc3RydWN0IHJlc291cmNlICptZW07DQo+ICAJaW50
IHJldDsNCj4gQEAgLTQwNyw2ICs0MDgsMTEgQEAgc3RhdGljIGludCBtdGtfbW1zeXNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1cm4g
cmV0Ow0KPiAgDQo+ICsJZHJtID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoJnBkZXYt
PmRldiwgIm1lZGlhdGVrLWRybSIsDQo+ICsJCQkJCSAgICBQTEFURk9STV9ERVZJRF9OT05FLCBO
VUxMLCAwKTsNCj4gKwlpZiAoSVNfRVJSKGRybSkpDQo+ICsJCXJldHVybiBQVFJfRVJSKGRybSk7
DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KDQo=

