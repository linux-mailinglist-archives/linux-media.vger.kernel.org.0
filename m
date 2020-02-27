Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1CF170DA8
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 02:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgB0BLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 20:11:11 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:58973 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727964AbgB0BLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 20:11:10 -0500
X-UUID: 72d4123620a5411cb0392343bcf528b4-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=g7uCumPTcKLDEaH//G3AL+2SvkEBkLiF4hfq4malq4M=;
        b=ul3vZYUFyn5UbPg6XAcaJReam8NeZiS5JM+vuu46k+I+dtrsEUZWKGIrFUXuYS2xDF3qwsi2Wdgt9dxCtI5Sbdj1iK2+vA4mt0b4PLiZzAKZ+WPJtJF9ex3a0f9dkQYRCJ6hvTwM7GSVqVQgUudPD+TYowxzt2g0s/ZAmFFzjeI=;
X-UUID: 72d4123620a5411cb0392343bcf528b4-20200227
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1807888717; Thu, 27 Feb 2020 09:11:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 09:10:04 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 09:10:48 +0800
Message-ID: <1582765858.20746.2.camel@mtksdaap41>
Subject: Re: [PATCH v9 1/4] drm/mediatek: Use regmap for register access
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
Date:   Thu, 27 Feb 2020 09:10:58 +0800
In-Reply-To: <20200226105419.632771-2-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
         <20200226105419.632771-2-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D30F497065135211C6216342C86114129F1F30BEA135DFA590346BD2746D5C1F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBXZWQsIDIwMjAtMDItMjYgYXQgMTE6NTQgKzAxMDAsIEVucmljIEJh
bGxldGJvIGkgU2VycmEgd3JvdGU6DQo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2Vy
QHN1c2UuY29tPg0KPiANCj4gVGhlIG1tc3lzIG1lbW9yeSBzcGFjZSBpcyBzaGFyZWQgYmV0d2Vl
biB0aGUgZHJtIGFuZCB0aGUNCj4gY2xrIGRyaXZlci4gVXNlIHJlZ21hcCB0byBhY2Nlc3MgaXQu
DQoNCk9uY2UgdGhlcmUgaXMgYSBtbXN5cyBkcml2ZXIgYW5kIGNsb2NrIGNvbnRyb2wgaXMgbW92
ZWQgaW50byBtbXN5cw0KZHJpdmVyLCBJIHRoaW5rIHdlIHNob3VsZCBhbHNvIG1vdmUgcm91dGlu
ZyBjb250cm9sIGludG8gbW1zeXMgZHJpdmVyDQphbmQgd2UgY291bGQgZHJvcCB0aGlzIHBhdGNo
Lg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWJydWdnZXJAc3VzZS5jb20+DQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnph
YmVsQHBlbmd1dHJvbml4LmRlPg0KPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFs
bGV0Ym9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY5OiBOb25lDQo+
IENoYW5nZXMgaW4gdjg6DQo+IC0gU2VsZWN0IFJFR01BUCBhbmQgTUZEX1NZU0NPTiAoUmFuZHkg
RHVubGFwKQ0KPiANCj4gQ2hhbmdlcyBpbiB2NzoNCj4gLSBBZGQgUi1ieSBmcm9tIENLDQo+IA0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcgICAgICAgIHwgIDIgKw0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jIHwgIDQgKy0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jICB8IDUwICsrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oICB8ICA0ICst
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgfCAxMyArKy0tLS0t
DQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCAgfCAgMiArLQ0KPiAg
NiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9LY29uZmlnDQo+IGluZGV4IGZhNWZmYzRmZTgyMy4uODllMThhNDcz
Y2I1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvS2NvbmZpZw0KPiBAQCAtMTAsOCArMTAsMTAg
QEAgY29uZmlnIERSTV9NRURJQVRFSw0KPiAgCXNlbGVjdCBEUk1fS01TX0hFTFBFUg0KPiAgCXNl
bGVjdCBEUk1fTUlQSV9EU0kNCj4gIAlzZWxlY3QgRFJNX1BBTkVMDQo+ICsJc2VsZWN0IE1GRF9T
WVNDT04NCj4gIAlzZWxlY3QgTUVNT1JZDQo+ICAJc2VsZWN0IE1US19TTUkNCj4gKwlzZWxlY3Qg
UkVHTUFQDQo+ICAJc2VsZWN0IFZJREVPTU9ERV9IRUxQRVJTDQo+ICAJaGVscA0KPiAgCSAgQ2hv
b3NlIHRoaXMgb3B0aW9uIGlmIHlvdSBoYXZlIGEgTWVkaWF0ZWsgU29Dcy4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0KPiBpbmRleCA1ZWU3NGQ3Y2UzNWMuLmEyMzY0
OTkxMjNhYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
Y3J0Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYw0K
PiBAQCAtMjgsNyArMjgsNyBAQA0KPiAgICogQGVuYWJsZWQ6IHJlY29yZHMgd2hldGhlciBjcnRj
X2VuYWJsZSBzdWNjZWVkZWQNCj4gICAqIEBwbGFuZXM6IGFycmF5IG9mIDQgZHJtX3BsYW5lIHN0
cnVjdHVyZXMsIG9uZSBmb3IgZWFjaCBvdmVybGF5IHBsYW5lDQo+ICAgKiBAcGVuZGluZ19wbGFu
ZXM6IHdoZXRoZXIgYW55IHBsYW5lIGhhcyBwZW5kaW5nIGNoYW5nZXMgdG8gYmUgYXBwbGllZA0K
PiAtICogQGNvbmZpZ19yZWdzOiBtZW1vcnkgbWFwcGVkIG1tc3lzIGNvbmZpZ3VyYXRpb24gcmVn
aXN0ZXIgc3BhY2UNCj4gKyAqIEBjb25maWdfcmVnczogcmVnbWFwIG1hcHBlZCBtbXN5cyBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVyIHNwYWNlDQo+ICAgKiBAbXV0ZXg6IGhhbmRsZSB0byBvbmUgb2Yg
dGhlIHRlbiBkaXNwX211dGV4IHN0cmVhbXMNCj4gICAqIEBkZHBfY29tcF9ucjogbnVtYmVyIG9m
IGNvbXBvbmVudHMgaW4gZGRwX2NvbXANCj4gICAqIEBkZHBfY29tcDogYXJyYXkgb2YgcG9pbnRl
cnMgdGhlIG10a19kZHBfY29tcCBzdHJ1Y3R1cmVzIHVzZWQgYnkgdGhpcyBjcnRjDQo+IEBAIC01
MCw3ICs1MCw3IEBAIHN0cnVjdCBtdGtfZHJtX2NydGMgew0KPiAgCXUzMgkJCQljbWRxX2V2ZW50
Ow0KPiAgI2VuZGlmDQo+ICANCj4gLQl2b2lkIF9faW9tZW0JCQkqY29uZmlnX3JlZ3M7DQo+ICsJ
c3RydWN0IHJlZ21hcAkJCSpjb25maWdfcmVnczsNCj4gIAlzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXgJ
CSptdXRleDsNCj4gIAl1bnNpZ25lZCBpbnQJCQlkZHBfY29tcF9ucjsNCj4gIAlzdHJ1Y3QgbXRr
X2RkcF9jb21wCQkqKmRkcF9jb21wOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHAuYw0KPiBpbmRleCAxMzAzNWM5MDYwMzUuLjMwMjc1Mzc0NGNjNiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMNCj4gQEAgLTM4Myw2MSArMzgzLDUzIEBAIHN0
YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9zZWxfaW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3Vy
LA0KPiAgCXJldHVybiB2YWx1ZTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgbXRrX2RkcF9z
b3V0X3NlbCh2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzLA0KPiArc3RhdGljIHZvaWQgbXRrX2Rk
cF9zb3V0X3NlbChzdHJ1Y3QgcmVnbWFwICpjb25maWdfcmVncywNCj4gIAkJCSAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgY3VyLA0KPiAgCQkJICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0
KQ0KPiAgew0KPiAgCWlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9CTFMgJiYgbmV4dCA9PSBERFBf
Q09NUE9ORU5UX0RTSTApIHsNCj4gLQkJd3JpdGVsX3JlbGF4ZWQoQkxTX1RPX0RTSV9SRE1BMV9U
T19EUEkxLA0KPiAtCQkJICAgICAgIGNvbmZpZ19yZWdzICsgRElTUF9SRUdfQ09ORklHX09VVF9T
RUwpOw0KPiArCQlyZWdtYXBfd3JpdGUoY29uZmlnX3JlZ3MsIERJU1BfUkVHX0NPTkZJR19PVVRf
U0VMLA0KPiArCQkJCUJMU19UT19EU0lfUkRNQTFfVE9fRFBJMSk7DQo+ICAJfSBlbHNlIGlmIChj
dXIgPT0gRERQX0NPTVBPTkVOVF9CTFMgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsN
Cj4gLQkJd3JpdGVsX3JlbGF4ZWQoQkxTX1RPX0RQSV9SRE1BMV9UT19EU0ksDQo+IC0JCQkgICAg
ICAgY29uZmlnX3JlZ3MgKyBESVNQX1JFR19DT05GSUdfT1VUX1NFTCk7DQo+IC0JCXdyaXRlbF9y
ZWxheGVkKERTSV9TRUxfSU5fUkRNQSwNCj4gLQkJCSAgICAgICBjb25maWdfcmVncyArIERJU1Bf
UkVHX0NPTkZJR19EU0lfU0VMKTsNCj4gLQkJd3JpdGVsX3JlbGF4ZWQoRFBJX1NFTF9JTl9CTFMs
DQo+IC0JCQkgICAgICAgY29uZmlnX3JlZ3MgKyBESVNQX1JFR19DT05GSUdfRFBJX1NFTCk7DQo+
ICsJCXJlZ21hcF93cml0ZShjb25maWdfcmVncywgRElTUF9SRUdfQ09ORklHX09VVF9TRUwsDQo+
ICsJCQkJQkxTX1RPX0RQSV9SRE1BMV9UT19EU0kpOw0KPiArCQlyZWdtYXBfd3JpdGUoY29uZmln
X3JlZ3MsIERJU1BfUkVHX0NPTkZJR19EU0lfU0VMLA0KPiArCQkJCURTSV9TRUxfSU5fUkRNQSk7
DQo+ICsJCXJlZ21hcF93cml0ZShjb25maWdfcmVncywgRElTUF9SRUdfQ09ORklHX0RQSV9TRUws
DQo+ICsJCQkJRFBJX1NFTF9JTl9CTFMpOw0KPiAgCX0NCj4gIH0NCj4gIA0KPiAtdm9pZCBtdGtf
ZGRwX2FkZF9jb21wX3RvX3BhdGgodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywNCj4gK3ZvaWQg
bXRrX2RkcF9hZGRfY29tcF90b19wYXRoKHN0cnVjdCByZWdtYXAgKmNvbmZpZ19yZWdzLA0KPiAg
CQkJICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLA0KPiAgCQkJICAgICAgZW51bSBtdGtf
ZGRwX2NvbXBfaWQgbmV4dCkNCj4gIHsNCj4gLQl1bnNpZ25lZCBpbnQgYWRkciwgdmFsdWUsIHJl
ZzsNCj4gKwl1bnNpZ25lZCBpbnQgYWRkciwgdmFsdWU7DQo+ICANCj4gIAl2YWx1ZSA9IG10a19k
ZHBfbW91dF9lbihjdXIsIG5leHQsICZhZGRyKTsNCj4gLQlpZiAodmFsdWUpIHsNCj4gLQkJcmVn
ID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwgdmFsdWU7DQo+IC0JCXdyaXRl
bF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3MgKyBhZGRyKTsNCj4gLQl9DQo+ICsJaWYgKHZhbHVl
KQ0KPiArCQlyZWdtYXBfdXBkYXRlX2JpdHMoY29uZmlnX3JlZ3MsIGFkZHIsIHZhbHVlLCB2YWx1
ZSk7DQo+ICANCj4gIAltdGtfZGRwX3NvdXRfc2VsKGNvbmZpZ19yZWdzLCBjdXIsIG5leHQpOw0K
PiAgDQo+ICAJdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihjdXIsIG5leHQsICZhZGRyKTsNCj4gLQlp
ZiAodmFsdWUpIHsNCj4gLQkJcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIp
IHwgdmFsdWU7DQo+IC0JCXdyaXRlbF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3MgKyBhZGRyKTsN
Cj4gLQl9DQo+ICsJaWYgKHZhbHVlKQ0KPiArCQlyZWdtYXBfdXBkYXRlX2JpdHMoY29uZmlnX3Jl
Z3MsIGFkZHIsIHZhbHVlLCB2YWx1ZSk7DQo+ICB9DQo+ICANCj4gLXZvaWQgbXRrX2RkcF9yZW1v
dmVfY29tcF9mcm9tX3BhdGgodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywNCj4gK3ZvaWQgbXRr
X2RkcF9yZW1vdmVfY29tcF9mcm9tX3BhdGgoc3RydWN0IHJlZ21hcCAqY29uZmlnX3JlZ3MsDQo+
ICAJCQkJICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLA0KPiAgCQkJCSAgIGVudW0gbXRrX2Rk
cF9jb21wX2lkIG5leHQpDQo+ICB7DQo+IC0JdW5zaWduZWQgaW50IGFkZHIsIHZhbHVlLCByZWc7
DQo+ICsJdW5zaWduZWQgaW50IGFkZHIsIHZhbHVlOw0KPiAgDQo+ICAJdmFsdWUgPSBtdGtfZGRw
X21vdXRfZW4oY3VyLCBuZXh0LCAmYWRkcik7DQo+IC0JaWYgKHZhbHVlKSB7DQo+IC0JCXJlZyA9
IHJlYWRsX3JlbGF4ZWQoY29uZmlnX3JlZ3MgKyBhZGRyKSAmIH52YWx1ZTsNCj4gLQkJd3JpdGVs
X3JlbGF4ZWQocmVnLCBjb25maWdfcmVncyArIGFkZHIpOw0KPiAtCX0NCj4gKwlpZiAodmFsdWUp
DQo+ICsJCXJlZ21hcF91cGRhdGVfYml0cyhjb25maWdfcmVncywgYWRkciwgdmFsdWUsIDApOw0K
PiAgDQo+ICAJdmFsdWUgPSBtdGtfZGRwX3NlbF9pbihjdXIsIG5leHQsICZhZGRyKTsNCj4gLQlp
ZiAodmFsdWUpIHsNCj4gLQkJcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIp
ICYgfnZhbHVlOw0KPiAtCQl3cml0ZWxfcmVsYXhlZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7
DQo+IC0JfQ0KPiArCWlmICh2YWx1ZSkNCj4gKwkJcmVnbWFwX3VwZGF0ZV9iaXRzKGNvbmZpZ19y
ZWdzLCBhZGRyLCB2YWx1ZSwgMCk7DQo+ICB9DQo+ICANCj4gIHN0cnVjdCBtdGtfZGlzcF9tdXRl
eCAqbXRrX2Rpc3BfbXV0ZXhfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGlk
KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmgg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuaA0KPiBpbmRleCA4MjdiZTQy
NGExNDguLjAxZmY4YjY4ODgxZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmgNCj4gQEAgLTEyLDEwICsxMiwxMCBAQCBzdHJ1Y3QgcmVnbWFwOw0KPiAgc3RydWN0
IGRldmljZTsNCj4gIHN0cnVjdCBtdGtfZGlzcF9tdXRleDsNCj4gIA0KPiAtdm9pZCBtdGtfZGRw
X2FkZF9jb21wX3RvX3BhdGgodm9pZCBfX2lvbWVtICpjb25maWdfcmVncywNCj4gK3ZvaWQgbXRr
X2RkcF9hZGRfY29tcF90b19wYXRoKHN0cnVjdCByZWdtYXAgKmNvbmZpZ19yZWdzLA0KPiAgCQkJ
ICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLA0KPiAgCQkJICAgICAgZW51bSBtdGtfZGRw
X2NvbXBfaWQgbmV4dCk7DQo+IC12b2lkIG10a19kZHBfcmVtb3ZlX2NvbXBfZnJvbV9wYXRoKHZv
aWQgX19pb21lbSAqY29uZmlnX3JlZ3MsDQo+ICt2b2lkIG10a19kZHBfcmVtb3ZlX2NvbXBfZnJv
bV9wYXRoKHN0cnVjdCByZWdtYXAgKmNvbmZpZ19yZWdzLA0KPiAgCQkJCSAgIGVudW0gbXRrX2Rk
cF9jb21wX2lkIGN1ciwNCj4gIAkJCQkgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KTsNCj4g
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCAwNTYzYzY4
MTMzMzMuLmI2ODgzN2VhMDJiMyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMNCj4gQEAgLTYsNiArNiw3IEBADQo+ICANCj4gICNpbmNsdWRlIDxsaW51eC9jb21w
b25lbnQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPg0KPiArI2luY2x1ZGUgPGxpbnV4
L21mZC9zeXNjb24uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICNpbmNsdWRl
IDxsaW51eC9vZl9hZGRyZXNzLmg+DQo+ICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4N
Cj4gQEAgLTQyNSw3ICs0MjYsNiBAQCBzdGF0aWMgaW50IG10a19kcm1fcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRl
di0+ZGV2Ow0KPiAgCXN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGU7DQo+IC0Jc3RydWN0
IHJlc291cmNlICptZW07DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiAgCXN0cnVj
dCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsNCj4gIAlpbnQgcmV0Ow0KPiBAQCAtNDM3
LDE0ICs0MzcsOSBAQCBzdGF0aWMgaW50IG10a19kcm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gIA0KPiAgCXByaXZhdGUtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNo
X2RhdGEoZGV2KTsNCj4gIA0KPiAtCW1lbSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJ
T1JFU09VUkNFX01FTSwgMCk7DQo+IC0JcHJpdmF0ZS0+Y29uZmlnX3JlZ3MgPSBkZXZtX2lvcmVt
YXBfcmVzb3VyY2UoZGV2LCBtZW0pOw0KPiAtCWlmIChJU19FUlIocHJpdmF0ZS0+Y29uZmlnX3Jl
Z3MpKSB7DQo+IC0JCXJldCA9IFBUUl9FUlIocHJpdmF0ZS0+Y29uZmlnX3JlZ3MpOw0KPiAtCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpb3JlbWFwIG1tc3lzLWNvbmZpZyByZXNvdXJjZTogJWRc
biIsDQo+IC0JCQlyZXQpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4gKwlwcml2YXRlLT5j
b25maWdfcmVncyA9IHN5c2Nvbl9ub2RlX3RvX3JlZ21hcChkZXYtPm9mX25vZGUpOw0KPiArCWlm
IChJU19FUlIocHJpdmF0ZS0+Y29uZmlnX3JlZ3MpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihwcml2
YXRlLT5jb25maWdfcmVncyk7DQo+ICANCj4gIAkvKiBJdGVyYXRlIG92ZXIgc2libGluZyBESVNQ
IGZ1bmN0aW9uIGJsb2NrcyAqLw0KPiAgCWZvcl9lYWNoX2NoaWxkX29mX25vZGUoZGV2LT5vZl9u
b2RlLT5wYXJlbnQsIG5vZGUpIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2
LmgNCj4gaW5kZXggMTdiYzk5YjlmNWQ0Li4wMzIwMTA4MDY4OGQgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oDQo+IEBAIC0zOSw3ICszOSw3IEBAIHN0cnVjdCBt
dGtfZHJtX3ByaXZhdGUgew0KPiAgDQo+ICAJc3RydWN0IGRldmljZV9ub2RlICptdXRleF9ub2Rl
Ow0KPiAgCXN0cnVjdCBkZXZpY2UgKm11dGV4X2RldjsNCj4gLQl2b2lkIF9faW9tZW0gKmNvbmZp
Z19yZWdzOw0KPiArCXN0cnVjdCByZWdtYXAgKmNvbmZpZ19yZWdzOw0KPiAgCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqY29tcF9ub2RlW0REUF9DT01QT05FTlRfSURfTUFYXTsNCj4gIAlzdHJ1Y3QgbXRr
X2RkcF9jb21wICpkZHBfY29tcFtERFBfQ09NUE9ORU5UX0lEX01BWF07DQo+ICAJY29uc3Qgc3Ry
dWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSAqZGF0YTsNCg0K

