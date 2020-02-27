Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA5D4170DE9
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 02:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgB0BdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 20:33:11 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:37183 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727964AbgB0BdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 20:33:10 -0500
X-UUID: 25dbe4fbec83480ba6777e7c0a56384b-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=CIR9EL5zBnoh8nvfq5nySdNJ6R1FKWqVgskka9d0zdg=;
        b=hVlI8Q9IQDCf1XeDabUC2Krh4oj6ec4N7a4HdlUrwEzDs2t+N0yPl+z0BSsjXftSiF/kLRJlRqMAm1SPlAoaQhDhTT4tchWiG+9tBYIkKYQ+3SqcHqaJgWdUutMn0CcbTeggntXOv0q1Nxh/lzQHcXO8pTrpGaQ3muFFeW7l4JQ=;
X-UUID: 25dbe4fbec83480ba6777e7c0a56384b-20200227
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 25294029; Thu, 27 Feb 2020 09:33:05 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 09:32:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 09:30:45 +0800
Message-ID: <1582767184.20746.6.camel@mtksdaap41>
Subject: Re: [PATCH v9 4/4] drm/mediatek: Fix mediatek-drm device probing
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
Date:   Thu, 27 Feb 2020 09:33:04 +0800
In-Reply-To: <20200226105419.632771-5-enric.balletbo@collabora.com>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
         <20200226105419.632771-5-enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEVucmljOg0KDQpPbiBXZWQsIDIwMjAtMDItMjYgYXQgMTE6NTQgKzAxMDAsIEVucmljIEJh
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
ZSBkcm0gZHJpdmVyIGlzIGluc3RhbnRpYXRlZA0KPiBieSB0aGF0IE1NU1lTIGRyaXZlci4NCj4g
DQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IFNpZ25lZC1v
ZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5j
b20+DQo+IC0tLQ0KPiANCj4gQ2hhbmdlcyBpbiB2OToNCj4gLSBEbyBub3QgbW92ZSB0aGUgZGlz
cGxheSByb3V0aW5nIGZyb20gdGhlIGRybSBkcml2ZXIgKENLKQ0KPiANCj4gQ2hhbmdlcyBpbiB2
ODoNCj4gLSBOZXcgcGF0Y2ggaW50cm9kdWNlZCBpbiB0aGlzIHNlcmllcy4NCj4gDQo+IENoYW5n
ZXMgaW4gdjc6IE5vbmUNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYyB8IDM0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL3NvYy9tZWRp
YXRlay9tdDgxNzMtbW1zeXMuYyAgICB8ICA2ICsrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gaW5kZXggYjY4ODM3ZWEwMmIzLi4xN2YxMThlZTBlNTcgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IEBAIC00MjIsOSAr
NDIyLDIxIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kZHBfY29tcF9k
dF9pZHNbXSA9IHsNCj4gIAl7IH0NCj4gIH07DQo+ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG10a19kcm1fb2ZfaWRzW10gPSB7DQo+ICsJeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDI3MDEtbW1zeXMiLA0KPiArCSAgLmRhdGEgPSAmbXQyNzAxX21tc3lzX2RyaXZl
cl9kYXRhfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcxMi1tbXN5cyIsDQo+
ICsJICAuZGF0YSA9ICZtdDI3MTJfbW1zeXNfZHJpdmVyX2RhdGF9LA0KPiArCXsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiwNCj4gKwkgIC5kYXRhID0gJm10ODE3M19tbXN5
c19kcml2ZXJfZGF0YX0sDQo+ICsJeyB9DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW50IG10a19k
cm1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGhhbmRs
ZSA9IGRldi0+cGFyZW50LT5vZl9ub2RlOw0KPiArCWNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
Km9mX2lkOw0KPiAgCXN0cnVjdCBtdGtfZHJtX3ByaXZhdGUgKnByaXZhdGU7DQo+ICAJc3RydWN0
IGRldmljZV9ub2RlICpub2RlOw0KPiAgCXN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0g
TlVMTDsNCj4gQEAgLTQzNSwxNSArNDQ3LDE4IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmICghcHJpdmF0ZSkNCj4gIAkJcmV0
dXJuIC1FTk9NRU07DQo+ICANCj4gLQlwcml2YXRlLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKGRldik7DQo+ICsJb2ZfaWQgPSBvZl9tYXRjaF9ub2RlKG10a19kcm1fb2ZfaWRzLCBw
aGFuZGxlKTsNCj4gKwlpZiAoIW9mX2lkKQ0KPiArCQlyZXR1cm4gLUVOT0RFVjsNCj4gKw0KPiAr
CXByaXZhdGUtPmRhdGEgPSBvZl9pZC0+ZGF0YTsNCj4gIA0KPiAtCXByaXZhdGUtPmNvbmZpZ19y
ZWdzID0gc3lzY29uX25vZGVfdG9fcmVnbWFwKGRldi0+b2Zfbm9kZSk7DQo+ICsJcHJpdmF0ZS0+
Y29uZmlnX3JlZ3MgPSBzeXNjb25fbm9kZV90b19yZWdtYXAocGhhbmRsZSk7DQo+ICAJaWYgKElT
X0VSUihwcml2YXRlLT5jb25maWdfcmVncykpDQo+ICAJCXJldHVybiBQVFJfRVJSKHByaXZhdGUt
PmNvbmZpZ19yZWdzKTsNCj4gIA0KPiAgCS8qIEl0ZXJhdGUgb3ZlciBzaWJsaW5nIERJU1AgZnVu
Y3Rpb24gYmxvY2tzICovDQo+IC0JZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShkZXYtPm9mX25vZGUt
PnBhcmVudCwgbm9kZSkgew0KPiAtCQljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZDsN
Cj4gKwlmb3JfZWFjaF9jaGlsZF9vZl9ub2RlKHBoYW5kbGUtPnBhcmVudCwgbm9kZSkgew0KPiAg
CQllbnVtIG10a19kZHBfY29tcF90eXBlIGNvbXBfdHlwZTsNCj4gIAkJaW50IGNvbXBfaWQ7DQo+
ICANCj4gQEAgLTU3NiwyMiArNTkxLDExIEBAIHN0YXRpYyBpbnQgbXRrX2RybV9zeXNfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIHN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhtdGtfZHJt
X3BtX29wcywgbXRrX2RybV9zeXNfc3VzcGVuZCwNCj4gIAkJCSBtdGtfZHJtX3N5c19yZXN1bWUp
Ow0KPiAgDQo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZHJtX29mX2lk
c1tdID0gew0KPiAtCXsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIiwNCj4g
LQkgIC5kYXRhID0gJm10MjcwMV9tbXN5c19kcml2ZXJfZGF0YX0sDQo+IC0JeyAuY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDI3MTItbW1zeXMiLA0KPiAtCSAgLmRhdGEgPSAmbXQyNzEyX21tc3lz
X2RyaXZlcl9kYXRhfSwNCj4gLQl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1tbXN5
cyIsDQo+IC0JICAuZGF0YSA9ICZtdDgxNzNfbW1zeXNfZHJpdmVyX2RhdGF9LA0KPiAtCXsgfQ0K
PiAtfTsNCj4gLQ0KPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2RybV9wbGF0
Zm9ybV9kcml2ZXIgPSB7DQo+ICAJLnByb2JlCT0gbXRrX2RybV9wcm9iZSwNCj4gIAkucmVtb3Zl
CT0gbXRrX2RybV9yZW1vdmUsDQo+ICAJLmRyaXZlcgk9IHsNCj4gIAkJLm5hbWUJPSAibWVkaWF0
ZWstZHJtIiwNCj4gLQkJLm9mX21hdGNoX3RhYmxlID0gbXRrX2RybV9vZl9pZHMsDQo+ICAJCS5w
bSAgICAgPSAmbXRrX2RybV9wbV9vcHMsDQo+ICAJfSwNCj4gIH07DQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxNzMtbW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ODE3My1tbXN5cy5jDQo+IGluZGV4IDQ4ZTZjMTU3ZDI4ZS4uYzg5NGRiNWI2Y2E5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxNzMtbW1zeXMuYw0KPiArKysgYi9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdDgxNzMtbW1zeXMuYw0KPiBAQCAtMTAzLDYgKzEwMyw3IEBA
IHN0YXRpYyBpbnQgbXQ4MTczX21tc3lzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25v
ZGU7DQo+ICAJc3RydWN0IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOw0KPiArCXN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKmRybTsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+ICAJY2xrX2RhdGEgPSBt
dGtfYWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NMSyk7DQo+IEBAIC0xMTgsNiArMTE5LDExIEBA
IHN0YXRpYyBpbnQgbXQ4MTczX21tc3lzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAJaWYgKHJldCkNCj4gIAkJcmV0dXJuIHJldDsNCj4gIA0KPiArCWRybSA9IHBsYXRm
b3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKCZwZGV2LT5kZXYsICJtZWRpYXRlay1kcm0iLA0KPiAr
CQkJCQkgICAgUExBVEZPUk1fREVWSURfTk9ORSwgTlVMTCwgMCk7DQo+ICsJaWYgKElTX0VSUihk
cm0pKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihkcm0pOw0KPiArDQo+ICAJcmV0dXJuIDA7DQo+ICB9
DQo+ICANCg0K

