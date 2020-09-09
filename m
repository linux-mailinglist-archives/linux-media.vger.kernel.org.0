Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635D1263265
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 18:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730964AbgIIQmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 12:42:03 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:30590 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730807AbgIIQQ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 12:16:58 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 089GEmH0019711;
        Wed, 9 Sep 2020 18:16:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pX2B7fReKwvkHQysboPcLDLrH1m3FCE4w8zrrewK33E=;
 b=QYiLxdPjc5qlg86Hyi/HVbm9yiRi38vLWdASByT+wFeaEkRY6ZDSaskLeEP2/61pvKmN
 zrdJ10wLVeMug/QMxvTy/tcJ/9YAwXBa6UXax8zPrFwGWm//nD+0ioTBr1kGNJJfVSbP
 aLUYDFtkV3KqTB9mYVX9JQSohNW+NWkWMIfBOPDJg1i5+T3jmEIbb/51LxY8Q7P+qAVS
 NE7wLfvyYsuMc/cJeb1XlTlzbHK1AEuyjiDAhrprSAMA9CIGAvShzLI7m7ZbnQTHiOV+
 Nl2d+8m7ZSX+YoKvDegOeUMuPUYNEonduG50ud2nyEKMeD7Ylungq/fyDa1fuyp8iQlU UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c0eux4ny-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 18:16:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1E01310002A;
        Wed,  9 Sep 2020 18:16:02 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag5node6.st.com [10.75.127.79])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 067C12BF9D0;
        Wed,  9 Sep 2020 18:16:02 +0200 (CEST)
Received: from GPXDAG5NODE4.st.com (10.75.127.77) by GPXDAG5NODE6.st.com
 (10.75.127.79) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 18:16:01 +0200
Received: from GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a]) by
 GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a%19]) with mapi id
 15.00.1473.003; Wed, 9 Sep 2020 18:16:01 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Paul <paul.kocialkowski@bootlin.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "Biju Das" <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v4 1/6] media: i2c: ov5640: Remain in power down for DVP
 mode unless streaming
Thread-Topic: [PATCH v4 1/6] media: i2c: ov5640: Remain in power down for DVP
 mode unless streaming
Thread-Index: AQHWhPjOKshFnubx50WwoCdor2jh8KlgXYuA
Date:   Wed, 9 Sep 2020 16:16:01 +0000
Message-ID: <8b5d4928-2921-b876-7d1e-04bb42eff4fa@st.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904201835.5958-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200904201835.5958-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C1BB566B1FBDB46B15502D69C582AA4@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_09:2020-09-09,2020-09-09 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUHJhYmhha2FyLA0KDQpBcyBkaXNjdXNzZWQgc2VwYXJhdGVseSBJIHdvdWxkIHByZWZlciB0
byBiZXR0ZXIgdW5kZXJzdGFuZCBpc3N1ZSBiZWZvcmUgDQpnb2luZyB0byB0aGlzIHBhdGNoLg0K
TmV2ZXJ0aGVsZXNzIEkgaGF2ZSBzb21lIHJlbWFya3MgaW4gY29kZSBpbiBjYXNlIHdlJ2xsIG5l
ZWQgaXQgYXQgdGhlIGVuZC4NCg0KT24gOS80LzIwIDEwOjE4IFBNLCBMYWQgUHJhYmhha2FyIHdy
b3RlOg0KPiBLZWVwIHRoZSBzZW5zb3IgaW4gc29mdHdhcmUgcG93ZXIgZG93biBtb2RlIGFuZCB3
YWtlIHVwIG9ubHkgaW4NCj4gb3Y1NjQwX3NldF9zdHJlYW1fZHZwKCkgY2FsbGJhY2suDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpA
YnAucmVuZXNhcy5jb20+DQo+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IFRlc3RlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRpLm9y
Zz4NCj4gLS0tDQo+ICAgZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxOSArKysrKysrKysr
KysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgYi9k
cml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiBpbmRleCAyZmU0YTdhYzA1OTIuLjg4MGZkZTcz
YTAzMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gQEAgLTM0LDYgKzM0LDggQEANCj4gICAjZGVm
aW5lIE9WNTY0MF9SRUdfU1lTX1JFU0VUMDIJCTB4MzAwMg0KPiAgICNkZWZpbmUgT1Y1NjQwX1JF
R19TWVNfQ0xPQ0tfRU5BQkxFMDIJMHgzMDA2DQo+ICAgI2RlZmluZSBPVjU2NDBfUkVHX1NZU19D
VFJMMAkJMHgzMDA4DQo+ICsjZGVmaW5lIE9WNTY0MF9SRUdfU1lTX0NUUkwwX1NXX1BXRE4JMHg0
Mg0KPiArI2RlZmluZSBPVjU2NDBfUkVHX1NZU19DVFJMMF9TV19QV1VQCTB4MDINCg0KRm9yIHRo
ZSB0aW1lIGJlaW5nIHRoaXMgc2VjdGlvbiB3YXMgb25seSByZWZlcnJpbmcgdG8gcmVnaXN0ZXJz
IA0KYWRkcmVzc2VzIGFuZCBiaXQgZGV0YWlscyB3YXMgZXhwbGFpbmVkIGludG8gYSBjb21tZW50
IHJpZ2h0IGJlZm9yZSANCmFmZmVjdGF0aW9uLCBzZWUgT1Y1NjQwX1JFR19JT19NSVBJX0NUUkww
MCBmb3IgZXhhbXBsZS4NCg0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19DSElQX0lECQkweDMwMGEN
Cj4gICAjZGVmaW5lIE9WNTY0MF9SRUdfSU9fTUlQSV9DVFJMMDAJMHgzMDBlDQo+ICAgI2RlZmlu
ZSBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxFMDEJMHgzMDE3DQo+IEBAIC0xMTIwLDYgKzEx
MjIsMTIgQEAgc3RhdGljIGludCBvdjU2NDBfbG9hZF9yZWdzKHN0cnVjdCBvdjU2NDBfZGV2ICpz
ZW5zb3IsDQo+ICAgCQl2YWwgPSByZWdzLT52YWw7DQo+ICAgCQltYXNrID0gcmVncy0+bWFzazsN
Cj4gICANCj4gKwkJLyogcmVtYWluIGluIHBvd2VyIGRvd24gbW9kZSBmb3IgRFZQICovDQo+ICsJ
CWlmIChyZWdzLT5yZWdfYWRkciA9PSBPVjU2NDBfUkVHX1NZU19DVFJMMCAmJg0KPiArCQkgICAg
dmFsID09IE9WNTY0MF9SRUdfU1lTX0NUUkwwX1NXX1BXVVAgJiYNCj4gKwkJICAgIHNlbnNvci0+
ZXAuYnVzX3R5cGUgIT0gVjRMMl9NQlVTX0NTSTJfRFBIWSkNCj4gKwkJCWNvbnRpbnVlOw0KPiAr
DQoNCkkgdW5kZXJzdGFuZCB0aGF0IG1vcmUgb3IgbGVzcyByZWdpc3RlciBPVjU2NDBfUkVHX1NZ
U19DVFJMMCAoMHgzMDA4KSANCmhhcyBiZWVuIHBhcnRpYWxseSByZW1vdmVkIGZyb20gYmlnIGlu
aXQgc2VxdWVuY2U6IGZvciBwb3dlci11cCBwYXJ0LCANCmJ1dCBwb3dlci1kd24gcmVtYWlucyBh
dCB2ZXJ5IGJlZ2lubmluZyBvZiBzZXF1ZW5jZS4NCldlIHNob3VsZCBjb21wbGV0ZWx5IHJlbW92
ZSAweDMwMDggZnJvbSBpbml0IHNlcXVlbmNlLCBpbmNsdWRpbmcgDQpwb3dlci1kd24sIGFuZCBp
bnRyb2R1Y2UgYSBuZXcgZnVuY3Rpb24gb3Y1NjQwX3N3X3Bvd2VyZG93bihvbi9vZmYpIHRoYXQg
DQpzaG91bGQgYmUgY2FsbGVkIGF0IHRoZSByaWdodCBwbGFjZSBpbnN0ZWFkLg0KDQoNCj4gICAJ
CWlmIChtYXNrKQ0KPiAgIAkJCXJldCA9IG92NTY0MF9tb2RfcmVnKHNlbnNvciwgcmVnX2FkZHIs
IG1hc2ssIHZhbCk7DQo+ICAgCQllbHNlDQo+IEBAIC0xMjk3LDkgKzEzMDUsMTQgQEAgc3RhdGlj
IGludCBvdjU2NDBfc2V0X3N0cmVhbV9kdnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9v
bCBvbikNCj4gICAJICogUEFEIE9VVFBVVCBFTkFCTEUgMDINCj4gICAJICogLSBbNzoyXToJRFs1
OjBdIG91dHB1dCBlbmFibGUNCj4gICAJICovDQo+IC0JcmV0dXJuIG92NTY0MF93cml0ZV9yZWco
c2Vuc29yLA0KPiAtCQkJCU9WNTY0MF9SRUdfUEFEX09VVFBVVF9FTkFCTEUwMiwNCj4gLQkJCQlv
biA/IDB4ZmMgOiAwKTsNCj4gKwlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQw
X1JFR19QQURfT1VUUFVUX0VOQUJMRTAyLA0KPiArCQkJICAgICAgIG9uID8gMHhmYyA6IDApOw0K
PiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwlyZXR1cm4gb3Y1NjQwX3dy
aXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfU1lTX0NUUkwwLCBvbiA/DQo+ICsJCQkJT1Y1NjQw
X1JFR19TWVNfQ1RSTDBfU1dfUFdVUCA6DQo+ICsJCQkJT1Y1NjQwX1JFR19TWVNfQ1RSTDBfU1df
UFdETik7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9zdHJlYW1fbWlw
aShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPiANCg0KDQpCUiwNCkh1Z3Vl
cy4=
