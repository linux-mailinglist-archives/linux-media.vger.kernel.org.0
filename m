Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F9D25F6C9
	for <lists+linux-media@lfdr.de>; Mon,  7 Sep 2020 11:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728349AbgIGJop (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Sep 2020 05:44:45 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:32238 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726301AbgIGJom (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Sep 2020 05:44:42 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0879hMjc018379;
        Mon, 7 Sep 2020 11:44:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=2aBPmPDGv2gwIudLjsFMYho8srXan5xdW63WpvcSbe0=;
 b=FJTBFfMbOyP92Y8pUDqMFZZkUlmsVj3SaXUQCQc1c+yBV6pkVpg+UMRxRuLOjckguprm
 QDxRRLT8V85lx+S4gb+bGERUcmOewKvNy5w7bqprnanWrpbw26MJ25zfnMuTlxTXmoD+
 NxDwc1KHl1Y8wDXzMKahkrVjOGXW+YwmzGZgvtIQqrBw3Vl0npHErx307E5OLGy2m0JE
 w+k5JiEmY0Dvs0C8LuOwQrpNz7+lykcxJg/oGB5BFM73e/KCGs4VAJTsP5VilfHuCckO
 CnfTdHCtHLckZWEFNcEuBF3/5gWnNImN3kWn0/KdpUFuKzf//85SQUdaY+8guPnUg803 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33byt7ht9s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Sep 2020 11:44:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17730100034;
        Mon,  7 Sep 2020 11:44:18 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag5node5.st.com [10.75.127.78])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E89CF2ADA12;
        Mon,  7 Sep 2020 11:44:17 +0200 (CEST)
Received: from GPXDAG5NODE4.st.com (10.75.127.77) by GPXDAG5NODE5.st.com
 (10.75.127.78) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 7 Sep
 2020 11:44:17 +0200
Received: from GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a]) by
 GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a%19]) with mapi id
 15.00.1473.003; Mon, 7 Sep 2020 11:44:17 +0200
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
Subject: Re: [PATCH v4 3/6] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
Thread-Topic: [PATCH v4 3/6] media: i2c: ov5640: Enable data pins on poweron
 for DVP mode
Thread-Index: AQHWhPjOmOR5K91yy0yQMTB0FGcxC6lcy3OA
Date:   Mon, 7 Sep 2020 09:44:17 +0000
Message-ID: <5fd9865f-4c4d-66c7-1fb4-ec3e65ab0d28@st.com>
References: <20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200904201835.5958-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200904201835.5958-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D87E633ACAC24F47B38E9EDA5F559B93@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-07_04:2020-09-07,2020-09-07 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUHJhYmhha2FyLA0KDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2hlcywgZ29vZCB0byBzZWUgb25l
IG1vcmUgT1Y1NjQwIHN0YWtlaG9sZGVyIA0KdXBzdHJlYW1pbmcgc29tZSBmaXhlcy9mZWF0dXJl
cy4NCg0KSSdtIGFsc28gdXNpbmcgYSBwYXJhbGxlbCBzZXR1cCB3aXRoIE9WNTY0MCBjb25uZWN0
ZWQgb24gU1RNMzIgRENNSSANCmNhbWVyYSBpbnRlcmZhY2UuDQpGaXJzdCBiYXNpYyB0ZXN0cyBo
YXZlIG5vdCBzaG93biBhbnkgcmVncmVzc2lvbnMgb24gbXkgc2lkZSBidXQgSSB3b3VsZCANCmxp
a2UgdG8gYmV0dGVyIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0geW91IGVuY291bnRlcmVkIGFuZCB0
aGUgd2F5IHlvdSANCnNvbHZlIGl0LCBzZWUgYmVsb3cgbXkgY29tbWVudHMuDQoNCg0KT24gOS80
LzIwIDEwOjE4IFBNLCBMYWQgUHJhYmhha2FyIHdyb3RlOg0KPiBEdXJpbmcgdGVzdGluZyB0aGlz
IHNlbnNvciBvbiBpVy1SYWluYm9XLUcyMUQtUXNldmVuIHBsYXRmb3JtIGluIDgtYml0IERWUA0K
PiBtb2RlIHdpdGggcmNhci12aW4gYnJpZGdlIG5vdGljZWQgdGhlIGNhcHR1cmUgd29ya2VkIGZp
bmUgZm9yIHRoZSBmaXJzdCBydW4NCj4gKHdpdGggeWF2dGEpLCBidXQgZm9yIHN1YnNlcXVlbnQg
cnVucyB0aGUgYnJpZGdlIGRyaXZlciB3YWl0ZWQgZm9yIHRoZQ0KPiBmcmFtZSB0byBiZSBjYXB0
dXJlZC4gRGVidWdnaW5nIGZ1cnRoZXIgbm90aWNlZCB0aGUgZGF0YSBsaW5lcyB3ZXJlDQo+IGVu
YWJsZWQvZGlzYWJsZWQgaW4gc3RyZWFtIG9uL29mZiBjYWxsYmFjayBhbmQgZHVtcGluZyB0aGUg
cmVnaXN0ZXINCj4gY29udGVudHMgMHgzMDE3LzB4MzAxOCBpbiBvdjU2NDBfc2V0X3N0cmVhbV9k
dnAoKSByZXBvcnRlZCB0aGUgY29ycmVjdA0KPiB2YWx1ZXMsIGJ1dCB5ZXQgZnJhbWUgY2FwdHVy
aW5nIGZhaWxlZC4NCg0KQ291bGQgeW91IHNob3cgdGhlIHNlcXVlbmNlIG9mIFY0TDIgY2FsbHMg
d2hpY2ggbGVhZCB0byBmcmVlemUgPw0KDQpSZWFkaW5nIHRoZSBwYXRjaCB5b3UgcHJvcG9zZWQs
IG15IGd1ZXNzIGlzIHRoYXQgaXNzdWUgaXMgY29taW5nIHdoZW4gDQptdWx0aXBsZSBTX1NUUkVB
TShvbikvU19TVFJFQU0ob2ZmKSBhcmUgbWFkZSB3aGlsZSBwb3dlciByZW1haW5zLCBpcyANCnRo
YXQgdHJ1ZSA/DQpJIGhhdmUgYWRkZWQgc29tZSB0cmFjZXMgaW4gY29kZSBhbmQgdHJpZWQgdG8g
cmVwcm9kdWNlIHdpdGggeWF2dGEsIA0KdjRsMi1jdGwgYW5kIEdTdHJlYW1lciBidXQgSSdtIG5v
dCBhYmxlIHRvIGdlbmVyYXRlIHN1Y2ggc2VxdWVuY2UsIGhlcmUgDQppcyB3aGF0IEkgZ290IGV2
ZXJ5dGltZToNCg0KWyAgODA5LjExMzc5MF0gb3Y1NjQwIDAtMDAzYzogb3Y1NjQwX3NfcG93ZXI+
DQpbICA4MDkuMTE2NDMxXSBvdjU2NDAgMC0wMDNjOiBvdjU2NDBfc2V0X3Bvd2VyPg0KWyAgODA5
LjEyMDc4OF0gb3Y1NjQwIDAtMDAzYzogb3Y1NjQwX3NldF9wb3dlcl9vbj4NClsgIDgwOS42MjIw
NDddIG92NTY0MCAwLTAwM2M6IG92NTY0MF9zZXRfcG93ZXJfZHZwPg0KWyAgODA5Ljg2MjczNF0g
b3Y1NjQwIDAtMDAzYzogb3Y1NjQwX3Nfc3RyZWFtPg0KWyAgODA5Ljg2NTQ2Ml0gb3Y1NjQwIDAt
MDAzYzogb3Y1NjQwX3NldF9zdHJlYW1fZHZwIG9uPg0KPGNhcHR1cmluZyBoZXJlPg0KWyAgODI4
LjU0OTUzMV0gb3Y1NjQwIDAtMDAzYzogb3Y1NjQwX3Nfc3RyZWFtPg0KWyAgODI4LjU1MjI2NV0g
b3Y1NjQwIDAtMDAzYzogb3Y1NjQwX3NldF9zdHJlYW1fZHZwIG9mZj4NClsgIDgyOC41ODA5NzBd
IG92NTY0MCAwLTAwM2M6IG92NTY0MF9zX3Bvd2VyPg0KWyAgODI4LjU4MzYxM10gb3Y1NjQwIDAt
MDAzYzogb3Y1NjQwX3NldF9wb3dlcj4NClsgIDgyOC41ODc5MjFdIG92NTY0MCAwLTAwM2M6IG92
NTY0MF9zZXRfcG93ZXJfZHZwPg0KWyAgODI4LjYyMDM0Nl0gb3Y1NjQwIDAtMDAzYzogb3Y1NjQw
X3NldF9wb3dlcl9vZmY+DQoNCldoaWNoIGFwcGxpY2F0aW9uL2NvbW1hbmQgbGluZSBhcmUgeW91
IHVzaW5nIHRvIHJlcHJvZHVjZSB5b3VyIHByb2JsZW0gPw0KDQoNCj4gDQo+IFRvIGdldCBhcm91
bmQgdGhpcyBpc3N1ZSBkYXRhIGxpbmVzIGFyZSBlbmFibGVkIGluIHNfcG93ZXIgY2FsbGJhY2su
DQo+IChBbHNvIHRoZSBzZW5zb3IgcmVtYWlucyBpbiBwb3dlciBkb3duIG1vZGUgaWYgbm90IHN0
cmVhbWluZyBzbyBwb3dlcg0KPiBjb25zdW1wdGlvbiBzaG91bGRuJ3QgYmUgYWZmZWN0ZWQpDQoN
CkZvciB0aGUgdGltZSBiZWluZywgSSByZWFsbHkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBw
YXRjaCBpcyBmaXhpbmcgDQpjYXB0dXJlIGZyZWV6ZS4NCg0KPiANCj4gRml4ZXM6IGYyMjk5NmRi
NDRlMmQgKCJtZWRpYTogb3Y1NjQwOiBhZGQgc3VwcG9ydCBvZiBEVlAgcGFyYWxsZWwgaW50ZXJm
YWNlIikNCj4gU2lnbmVkLW9mZi1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvQGpt
b25kaS5vcmc+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIHwgNzMgKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiBp
bmRleCA4YWYxMWQ1MzI2OTkuLjgyODg3MjhkODcwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9pMmMvb3Y1NjQwLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4g
QEAgLTI3Niw4ICsyNzYsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCB2NGwyX3N1YmRldiAqY3Ry
bF90b19zZChzdHJ1Y3QgdjRsMl9jdHJsICpjdHJsKQ0KPiAgIC8qIFlVVjQyMiBVWVZZIFZHQUAz
MGZwcyAqLw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX3ZhbHVlIG92NTY0MF9pbml0X3Nl
dHRpbmdfMzBmcHNfVkdBW10gPSB7DQo+ICAgCXsweDMxMDMsIDB4MTEsIDAsIDB9LCB7MHgzMDA4
LCAweDgyLCAwLCA1fSwgezB4MzAwOCwgMHg0MiwgMCwgMH0sDQo+IC0JezB4MzEwMywgMHgwMywg
MCwgMH0sIHsweDMwMTcsIDB4MDAsIDAsIDB9LCB7MHgzMDE4LCAweDAwLCAwLCAwfSwNCj4gLQl7
MHgzNjMwLCAweDM2LCAwLCAwfSwNCj4gKwl7MHgzMTAzLCAweDAzLCAwLCAwfSwgezB4MzYzMCwg
MHgzNiwgMCwgMH0sDQo+ICAgCXsweDM2MzEsIDB4MGUsIDAsIDB9LCB7MHgzNjMyLCAweGUyLCAw
LCAwfSwgezB4MzYzMywgMHgxMiwgMCwgMH0sDQo+ICAgCXsweDM2MjEsIDB4ZTAsIDAsIDB9LCB7
MHgzNzA0LCAweGEwLCAwLCAwfSwgezB4MzcwMywgMHg1YSwgMCwgMH0sDQo+ICAgCXsweDM3MTUs
IDB4NzgsIDAsIDB9LCB7MHgzNzE3LCAweDAxLCAwLCAwfSwgezB4MzcwYiwgMHg2MCwgMCwgMH0s
DQo+IEBAIC0xMjgzLDMzICsxMjgyLDYgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3N0cmVhbV9k
dnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICAJaWYgKHJldCkNCj4g
ICAJCXJldHVybiByZXQ7DQo+ICAgDQo+IC0JLyoNCj4gLQkgKiBlbmFibGUgVlNZTkMvSFJFRi9Q
Q0xLIERWUCBjb250cm9sIGxpbmVzDQo+IC0JICogJiBEWzk6Nl0gRFZQIGRhdGEgbGluZXMNCj4g
LQkgKg0KPiAtCSAqIFBBRCBPVVRQVVQgRU5BQkxFIDAxDQo+IC0JICogLSA2OgkJVlNZTkMgb3V0
cHV0IGVuYWJsZQ0KPiAtCSAqIC0gNToJCUhSRUYgb3V0cHV0IGVuYWJsZQ0KPiAtCSAqIC0gNDoJ
CVBDTEsgb3V0cHV0IGVuYWJsZQ0KPiAtCSAqIC0gWzM6MF06CURbOTo2XSBvdXRwdXQgZW5hYmxl
DQo+IC0JICovDQo+IC0JcmV0ID0gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsDQo+IC0JCQkgICAg
ICAgT1Y1NjQwX1JFR19QQURfT1VUUFVUX0VOQUJMRTAxLA0KPiAtCQkJICAgICAgIG9uID8gMHg3
ZiA6IDApOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+IC0NCj4gLQkvKg0KPiAt
CSAqIGVuYWJsZSBEWzU6MF0gRFZQIGRhdGEgbGluZXMNCj4gLQkgKg0KPiAtCSAqIFBBRCBPVVRQ
VVQgRU5BQkxFIDAyDQo+IC0JICogLSBbNzoyXToJRFs1OjBdIG91dHB1dCBlbmFibGUNCj4gLQkg
Ki8NCj4gLQlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QQURfT1VU
UFVUX0VOQUJMRTAyLA0KPiAtCQkJICAgICAgIG9uID8gMHhmYyA6IDApOw0KPiAtCWlmIChyZXQp
DQo+IC0JCXJldHVybiByZXQ7DQo+IC0NCj4gICAJcmV0dXJuIG92NTY0MF93cml0ZV9yZWcoc2Vu
c29yLCBPVjU2NDBfUkVHX1NZU19DVFJMMCwgb24gPw0KPiAgIAkJCQlPVjU2NDBfUkVHX1NZU19D
VFJMMF9TV19QV1VQIDoNCj4gICAJCQkJT1Y1NjQwX1JFR19TWVNfQ1RSTDBfU1dfUFdETik7DQo+
IEBAIC0yMDY5LDYgKzIwNDEsNDAgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX21pcGko
c3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICAJcmV0dXJuIDA7DQo+ICAg
fQ0KPiAgIA0KPiArc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1NjQw
X2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlpZiAo
IW9uKSB7DQo+ICsJCS8qIFJlc2V0IHNldHRpbmdzIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzLiAq
Lw0KPiArCQlvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QQURfT1VUUFVUX0VO
QUJMRTAxLCAweDAwKTsNCj4gKwkJb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdf
UEFEX09VVFBVVF9FTkFCTEUwMiwgMHgwMCk7DQo+ICsJCXJldHVybiAwOw0KPiArCX0NCj4gKw0K
PiArCS8qDQo+ICsJICogZW5hYmxlIFZTWU5DL0hSRUYvUENMSyBEVlAgY29udHJvbCBsaW5lcw0K
PiArCSAqICYgRFs5OjZdIERWUCBkYXRhIGxpbmVzDQo+ICsJICoNCj4gKwkgKiBQQUQgT1VUUFVU
IEVOQUJMRSAwMQ0KPiArCSAqIC0gNjoJCVZTWU5DIG91dHB1dCBlbmFibGUNCj4gKwkgKiAtIDU6
CQlIUkVGIG91dHB1dCBlbmFibGUNCj4gKwkgKiAtIDQ6CQlQQ0xLIG91dHB1dCBlbmFibGUNCj4g
KwkgKiAtIFszOjBdOglEWzk6Nl0gb3V0cHV0IGVuYWJsZQ0KPiArCSAqLw0KPiArCXJldCA9IG92
NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxFMDEsIDB4
N2YpOw0KPiArCWlmIChyZXQpDQo+ICsJCXJldHVybiByZXQ7DQo+ICsNCj4gKwkvKg0KPiArCSAq
IGVuYWJsZSBEWzU6MF0gRFZQIGRhdGEgbGluZXMNCj4gKwkgKg0KPiArCSAqIFBBRCBPVVRQVVQg
RU5BQkxFIDAyDQo+ICsJICogLSBbNzoyXToJRFs1OjBdIG91dHB1dCBlbmFibGUNCj4gKwkgKi8N
Cj4gKwlyZXR1cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfUEFEX09VVFBV
VF9FTkFCTEUwMiwgMHhmYyk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IG92NTY0MF9zZXRf
cG93ZXIoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICB7DQo+ICAgCWlu
dCByZXQgPSAwOw0KPiBAQCAtMjA4MywxMSArMjA4OSwxMiBAQCBzdGF0aWMgaW50IG92NTY0MF9z
ZXRfcG93ZXIoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICAJCQlnb3Rv
IHBvd2VyX29mZjsNCj4gICAJfQ0KPiAgIA0KPiAtCWlmIChzZW5zb3ItPmVwLmJ1c190eXBlID09
IFY0TDJfTUJVU19DU0kyX0RQSFkpIHsNCj4gKwlpZiAoc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBW
NEwyX01CVVNfQ1NJMl9EUEhZKQ0KPiAgIAkJcmV0ID0gb3Y1NjQwX3NldF9wb3dlcl9taXBpKHNl
bnNvciwgb24pOw0KPiAtCQlpZiAocmV0KQ0KPiAtCQkJZ290byBwb3dlcl9vZmY7DQo+IC0JfQ0K
PiArCWVsc2UNCj4gKwkJcmV0ID0gb3Y1NjQwX3NldF9wb3dlcl9kdnAoc2Vuc29yLCBvbik7DQo+
ICsJaWYgKHJldCkNCj4gKwkJZ290byBwb3dlcl9vZmY7DQo+ICAgDQo+ICAgCWlmICghb24pDQo+
ICAgCQlvdjU2NDBfc2V0X3Bvd2VyX29mZihzZW5zb3IpOw0KPiANCg0KQmVzdCByZWdhcmRzLA0K
SHVndWVzLg==
