Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45DF28CA6E
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 10:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403951AbgJMIp0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 04:45:26 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:63066 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403912AbgJMIp0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 04:45:26 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09D8gwHl007224;
        Tue, 13 Oct 2020 10:45:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=egbw1jKGOZA61qUoiejs3HBbyoCJjQOufVAk2JzGx3I=;
 b=b2OhrHRh3Exzk9blVpSYQF9UMWVeSZjTMpzDYFJe/MckZe5uaCC2WnqSEuTxwfQH+ss7
 ccgg10B91gX2BgONF6CYEIT29LhNugURF5oZjoL4nyfXXfqtPPmlyObGzzwH77oc+9xa
 3XyGwUwN5CVwOj1/xY9ZQONtiQE1A3KMgZi8oXebBbhyTOSdOM17RshCEP5LiVcW9HGA
 qfPj1s29vYTaAjHI/wuESksFaxjsFxpnFjk7mImQ5JWYPgHR87KfAKOk3Bap653j+dnH
 pMUFJDxcTwaZa+0RbXThTtLgJ7TXKt22X2+LuV7Sfft1GeGAq0FPGplh/bjRjLJAUij8 Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34356e5m2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Oct 2020 10:45:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5C70210002A;
        Tue, 13 Oct 2020 10:45:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09E0C2A9F5E;
        Tue, 13 Oct 2020 10:45:05 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 10:45:04 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 10:45:04 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Hans Verkuil" <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Thread-Topic: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Thread-Index: AQHWoKc05b6XwNbbukilsBYWkG/VOqmT+2kAgAEcCoA=
Date:   Tue, 13 Oct 2020 08:45:04 +0000
Message-ID: <0b53e8be-a7d2-926e-3763-675dd18cdb36@st.com>
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
 <20201012154826.yeowe5dheyedkqen@uno.localdomain>
In-Reply-To: <20201012154826.yeowe5dheyedkqen@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B211CB63C98594EB0C10CA12AC7BE42@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-13_02:2020-10-13,2020-10-13 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQpPbiAxMC8xMi8yMCA1OjQ4IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+
IEhpIEh1Z3VlcywNCj4gDQo+IE9uIE1vbiwgT2N0IDEyLCAyMDIwIGF0IDA0OjUxOjQzUE0gKzAy
MDAsIEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gRml4IFBDTEsgcG9sYXJpdHkgbm90IGJlaW5n
IHRha2VuIGludG8gYWNjb3VudC4NCj4+IEFkZCBjb21tZW50cyBhYm91dCBCVDY1NiByZWdpc3Rl
ciBjb250cm9sLg0KPj4gUmVtb3ZlIHVzZWxlc3Mgb3Y1NjQwX3NldF9zdHJlYW1fYnQ2NTYoKSBm
dW5jdGlvbi4NCj4+IFJlZmluZSBjb21tZW50cyBhYm91dCBNSVBJIElPIHJlZ2lzdGVyIGNvbnRy
b2wuDQo+Pg0KPj4gRml4ZXM6IDQwMzliMDM3MjBmNyAoIm1lZGlhOiBpMmM6IG92NTY0MDogQWRk
IHN1cHBvcnQgZm9yIEJUNjU2IG1vZGUiKQ0KPj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNo
ZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYyB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+PiBpbmRleCA4ZDAyNTRkLi5jMGViZjRjIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvaTJjL292NTY0MC5jDQo+PiBAQCAtMTIxNiwyMCArMTIxNiw2IEBAIHN0YXRpYyBpbnQg
b3Y1NjQwX3NldF9hdXRvZ2FpbihzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0K
Pj4gICAJCQkgICAgICBCSVQoMSksIG9uID8gMCA6IEJJVCgxKSk7DQo+PiAgIH0NCj4+DQo+PiAt
c3RhdGljIGludCBvdjU2NDBfc2V0X3N0cmVhbV9idDY1NihzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vu
c29yLCBib29sIG9uKQ0KPj4gLXsNCj4+IC0JaW50IHJldDsNCj4+IC0NCj4+IC0JcmV0ID0gb3Y1
NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfQ0NJUjY1Nl9DVFJMMDAsDQo+PiAtCQkJ
ICAgICAgIG9uID8gMHgxIDogMHgwMCk7DQo+PiAtCWlmIChyZXQpDQo+PiAtCQlyZXR1cm4gcmV0
Ow0KPj4gLQ0KPj4gLQlyZXR1cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdf
U1lTX0NUUkwwLCBvbiA/DQo+PiAtCQkJCU9WNTY0MF9SRUdfU1lTX0NUUkwwX1NXX1BXVVAgOg0K
Pj4gLQkJCQlPVjU2NDBfUkVHX1NZU19DVFJMMF9TV19QV0ROKTsNCj4+IC19DQo+PiAtDQo+PiAg
IHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9zdHJlYW1fZHZwKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5z
b3IsIGJvb2wgb24pDQo+PiAgIHsNCj4+ICAgCXJldHVybiBvdjU2NDBfd3JpdGVfcmVnKHNlbnNv
ciwgT1Y1NjQwX1JFR19TWVNfQ1RSTDAsIG9uID8NCj4+IEBAIC0xOTk0LDYgKzE5ODAsNyBAQCBz
dGF0aWMgaW50IG92NTY0MF9zZXRfcG93ZXJfbWlwaShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29y
LCBib29sIG9uKQ0KPj4gICBzdGF0aWMgaW50IG92NTY0MF9zZXRfcG93ZXJfZHZwKHN0cnVjdCBv
djU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+PiAgIHsNCj4+ICAgCXVuc2lnbmVkIGludCBm
bGFncyA9IHNlbnNvci0+ZXAuYnVzLnBhcmFsbGVsLmZsYWdzOw0KPj4gKwlib29sIGJ0NjU2ID0g
c2Vuc29yLT5lcC5idXNfdHlwZSA9PSBWNEwyX01CVVNfQlQ2NTY7DQo+PiAgIAl1OCBwY2xrX3Bv
bCA9IDA7DQo+PiAgIAl1OCBoc3luY19wb2wgPSAwOw0KPj4gICAJdTggdnN5bmNfcG9sID0gMDsN
Cj4+IEBAIC0yMDAxLDYgKzE5ODgsNyBAQCBzdGF0aWMgaW50IG92NTY0MF9zZXRfcG93ZXJfZHZw
KHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+Pg0KPj4gICAJaWYgKCFvbikg
ew0KPj4gICAJCS8qIFJlc2V0IHNldHRpbmdzIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzLiAqLw0K
Pj4gKwkJb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfQ0NJUjY1Nl9DVFJMMDAs
IDB4MDApOw0KPj4gICAJCW92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0lPX01J
UElfQ1RSTDAwLCAweDU4KTsNCj4+ICAgCQlvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQw
X1JFR19QT0xBUklUWV9DVFJMMDAsIDB4MjApOw0KPj4gICAJCW92NTY0MF93cml0ZV9yZWcoc2Vu
c29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxFMDEsIDB4MDApOw0KPj4gQEAgLTIwMjQs
MjMgKzIwMTIsNTEgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1
NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4gICAJICogLSBWU1lOQzoJYWN0aXZlIGhpZ2gN
Cj4+ICAgCSAqIC0gSFJFRjoJYWN0aXZlIGxvdw0KPj4gICAJICogLSBQQ0xLOglhY3RpdmUgbG93
DQo+PiArCSAqDQo+PiArCSAqIFZTWU5DICYgSFJFRiBhcmUgbm90IGNvbmZpZ3VyZWQgaWYgQlQ2
NTYgYnVzIG1vZGUgaXMgc2VsZWN0ZWQNCj4+ICAgCSAqLw0KPj4gKw0KPj4gICAJLyoNCj4+IC0J
ICogY29uZmlndXJlIHBhcmFsbGVsIHBvcnQgY29udHJvbCBsaW5lcyBwb2xhcml0eQ0KPj4gKwkg
KiBCVDY1NiBlbWJlZGRlZCBzeW5jaHJvbml6YXRpb24gY29uZmlndXJhdGlvbg0KPj4gICAJICoN
Cj4+IC0JICogUE9MQVJJVFkgQ1RSTDANCj4+IC0JICogLSBbNV06CVBDTEsgcG9sYXJpdHkgKDA6
IGFjdGl2ZSBsb3csIDE6IGFjdGl2ZSBoaWdoKQ0KPj4gLQkgKiAtIFsxXToJSFJFRiBwb2xhcml0
eSAoMDogYWN0aXZlIGxvdywgMTogYWN0aXZlIGhpZ2gpDQo+PiAtCSAqIC0gWzBdOglWU1lOQyBw
b2xhcml0eSAobWlzbWF0Y2ggaGVyZSBiZXR3ZWVuDQo+PiAtCSAqCQlkYXRhc2hlZXQgYW5kIGhh
cmR3YXJlLCAwIGlzIGFjdGl2ZSBoaWdoDQo+PiAtCSAqCQlhbmQgMSBpcyBhY3RpdmUgbG93Li4u
KQ0KPj4gKwkgKiBDQ0lSNjU2IENUUkwwMA0KPj4gKwkgKiAtIFs3XToJU1lOQyBjb2RlIHNlbGVj
dGlvbiAoMDogYXV0byBnZW5lcmF0ZSBzeW5jIGNvZGUsDQo+PiArCSAqCQkxOiBzeW5jIGNvZGUg
ZnJvbSByZWdzIDB4NDczMi0weDQ3MzUpDQo+PiArCSAqIC0gWzZdOglmIHZhbHVlIGluIENDSVI2
NTYgU1lOQyBjb2RlIHdoZW4gZml4ZWQgZiB2YWx1ZQ0KPj4gKwkgKiAtIFs1XToJRml4ZWQgZiB2
YWx1ZQ0KPj4gKwkgKiAtIFs0OjNdOglCbGFuayB0b2dnbGUgZGF0YSBvcHRpb25zICgwMDogZGF0
YT0xJ2gwNDAvMSdoMjAwLA0KPj4gKwkgKgkJMDE6IGRhdGEgZnJvbSByZWdzIDB4NDczNi0weDQ3
MzgsIDEwOiBhbHdheXMga2VlcCAwKQ0KPj4gKwkgKiAtIFsxXToJQ2xpcCBkYXRhIGRpc2FibGUN
Cj4+ICsJICogLSBbMF06CUNDSVI2NTYgbW9kZSBlbmFibGUNCj4+ICsJICoNCj4+ICsJICogRGVm
YXVsdCBDQ0lSNjU2IFNBVi9FQVYgbW9kZSB3aXRoIGRlZmF1bHQgY29kZXMNCj4+ICsJICogU0FW
PTB4ZmYwMDAwODAgJiBFQVY9MHhmZjAwMDA5ZCBpcyBlbmFibGVkIGhlcmUgd2l0aCBzZXR0aW5n
czoNCj4+ICsJICogLSBDQ0lSNjU2IG1vZGUgZW5hYmxlDQo+PiArCSAqIC0gYXV0byBnZW5lcmF0
aW9uIG9mIHN5bmMgY29kZXMNCj4+ICsJICogLSBibGFuayB0b2dnbGUgZGF0YSAxJ2gwNDAvMSdo
MjAwDQo+PiArCSAqIC0gY2xpcCByZXNlcnZlZCBkYXRhICgweDAwICYgMHhmZiBjaGFuZ2VkIHRv
IDB4MDEgJiAweGZlKQ0KPj4gICAJICovDQo+PiAtCWlmIChzZW5zb3ItPmVwLmJ1c190eXBlID09
IFY0TDJfTUJVU19QQVJBTExFTCkgew0KPj4gKwlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNv
ciwgT1Y1NjQwX1JFR19DQ0lSNjU2X0NUUkwwMCwNCj4+ICsJCQkgICAgICAgYnQ2NTYgPyAweDAx
IDogMHgwMCk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gQWxsIGdv
b2Qgc28gZmFyDQo+IA0KPj4gKw0KPj4gKwlpZiAob24pIHsNCj4gDQo+IEJ1dCBkb24ndCB5b3Ug
aGF2ZSByZXRhaW5lZA0KPiAgICAgICAgICBpZiAoIW9uKQ0KPiBhdCB0aGUgYmVnaW5uaW5nIG9m
IHRoZSBmdW5jdGlvbiA/DQo+IA0KPiBJIHdvdWxkIHJlZmxvdyB0aGlzIGFzOg0KPiANCj4gc3Rh
dGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBi
b29sIG9uKSB7DQo+ICAgICAgICAgIGlmICghb24pIHsNCj4gICAgICAgICAgICAgICAgICAuLi4N
Cj4gICAgICAgICAgfQ0KPiANCj4gICAgICAgICAgdWludDhfdCBwb2xhcml0aWVzID0gMDsNCj4g
ICAgICAgICAgaWYgKCFidDY1Nikgew0KPiAgICAgICAgICAgICAgICAgIGlmIChmbGFncyAmIFY0
TDJfTUJVU19IU1lOQ19BQ1RJVkVfSElHSCkNCj4gICAgICAgICAgCSAgICAgICAgcG9sYXJpdGll
cyB8PSBCSVQoMSk7DQo+ICAgICAgICAgICAgICAgICAgaWYgKGZsYWdzICYgVjRMMl9NQlVTX1ZT
WU5DX0FDVElWRV9MT1cpDQo+IAkgICAgICAgICAgICAgICAgcG9sYXJpdGllcyB8PSBCSVQoMCk7
DQo+ICAgICAgICAgIH0NCj4gICAgICAgICAgaWYgKGZsYWdzICYgVjRMMl9NQlVTX1BDTEtfU0FN
UExFX1JJU0lORykNCj4gCSAgICAgICAgcG9sYXJpdGllcyB8PSBCSVQoNSk7DQo+IA0KPiAJcmV0
ID0gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfUE9MQVJJVFlfQ1RSTDAwLA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvbGFyaXRpZXMpOw0KPiAgICAgICAg
ICBpZiAocmV0KQ0KPiAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+IA0KPiAgICAgICAg
ICBpZiAoYnQ2NTYpIHsNCj4gICAgICAgICAgICAgICAgICB3cml0ZV9yZWcoQ0NJUjY1Nik7DQo+
ICAgICAgICAgIH0NCj4gDQo+ICAgICAgICAgIC4uLi4NCj4gDQo+IFRvIG1ha2UgaXQgbW9yZSBy
ZWFkYWJsZS4gV2hhdCBkbyB5b3UgdGhpbmsgPw0KDQpGdWxseSBhZ3JlZS4NCg0KPiANCj4+ICsJ
CS8qDQo+PiArCQkgKiBjb25maWd1cmUgcGFyYWxsZWwgcG9ydCBjb250cm9sIGxpbmVzIHBvbGFy
aXR5DQo+PiArCQkgKg0KPj4gKwkJICogUE9MQVJJVFkgQ1RSTDANCj4+ICsJCSAqIC0gWzVdOglQ
Q0xLIHBvbGFyaXR5ICgwOiBhY3RpdmUgbG93LCAxOiBhY3RpdmUgaGlnaCkNCj4+ICsJCSAqIC0g
WzFdOglIUkVGIHBvbGFyaXR5ICgwOiBhY3RpdmUgbG93LCAxOiBhY3RpdmUgaGlnaCkNCj4+ICsJ
CSAqIC0gWzBdOglWU1lOQyBwb2xhcml0eSAobWlzbWF0Y2ggaGVyZSBiZXR3ZWVuDQo+PiArCQkg
KgkJZGF0YXNoZWV0IGFuZCBoYXJkd2FyZSwgMCBpcyBhY3RpdmUgaGlnaA0KPj4gKwkJICoJCWFu
ZCAxIGlzIGFjdGl2ZSBsb3cuLi4pDQo+PiArCQkgKi8NCj4+ICAgCQlpZiAoZmxhZ3MgJiBWNEwy
X01CVVNfUENMS19TQU1QTEVfUklTSU5HKQ0KPj4gICAJCQlwY2xrX3BvbCA9IDE7DQo+PiAtCQlp
ZiAoZmxhZ3MgJiBWNEwyX01CVVNfSFNZTkNfQUNUSVZFX0hJR0gpDQo+PiArCQlpZiAoIWJ0NjU2
ICYmIGZsYWdzICYgVjRMMl9NQlVTX0hTWU5DX0FDVElWRV9ISUdIKQ0KPj4gICAJCQloc3luY19w
b2wgPSAxOw0KPj4gLQkJaWYgKGZsYWdzICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9MT1cpDQo+
PiArCQlpZiAoIWJ0NjU2ICYmIGZsYWdzICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9MT1cpDQo+
PiAgIAkJCXZzeW5jX3BvbCA9IDE7DQo+Pg0KPj4gICAJCXJldCA9IG92NTY0MF93cml0ZV9yZWco
c2Vuc29yLCBPVjU2NDBfUkVHX1BPTEFSSVRZX0NUUkwwMCwNCj4+IEBAIC0yMDUyLDEyICsyMDY4
LDEyIEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9wb3dlcl9kdnAoc3RydWN0IG92NTY0MF9kZXYg
KnNlbnNvciwgYm9vbCBvbikNCj4+ICAgCX0NCj4+DQo+IA0KPiBUaGUgcGFydCBoZXJlIGJlbG93
IGxvb2tzIGdvb2QhDQo+IA0KPj4gICAJLyoNCj4+IC0JICogcG93ZXJkb3duIE1JUEkgVFgvUlgg
UEhZICYgZGlzYWJsZSBNSVBJDQo+PiArCSAqIHBvd2VyZG93biBNSVBJIFRYL1JYIFBIWSAmIGVu
YWJsZSBEVlANCj4+ICAgCSAqDQo+PiAgIAkgKiBNSVBJIENPTlRST0wgMDANCj4+IC0JICogNDoJ
IFBXRE4gUEhZIFRYDQo+PiAtCSAqIDM6CSBQV0ROIFBIWSBSWA0KPj4gLQkgKiAyOgkgTUlQSSBl
bmFibGUNCj4+ICsJICogWzRdID0gMQk6IFBvd2VyIGRvd24gTUlQSSBIUyBUeA0KPj4gKwkgKiBb
M10gPSAxCTogUG93ZXIgZG93biBNSVBJIExTIFJ4DQo+PiArCSAqIFsyXSA9IDAJOiBEVlAgZW5h
YmxlIChNSVBJIGRpc2FibGUpDQo+PiAgIAkgKi8NCj4+ICAgCXJldCA9IG92NTY0MF93cml0ZV9y
ZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0lPX01JUElfQ1RSTDAwLCAweDE4KTsNCj4+ICAgCWlmIChy
ZXQpDQo+PiBAQCAtMjA3NCw4ICsyMDkwLDcgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2Vy
X2R2cChzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4gICAJICogLSBbMzow
XToJRFs5OjZdIG91dHB1dCBlbmFibGUNCj4+ICAgCSAqLw0KPj4gICAJcmV0ID0gb3Y1NjQwX3dy
aXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfUEFEX09VVFBVVF9FTkFCTEUwMSwNCj4+IC0JCQkg
ICAgICAgc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBWNEwyX01CVVNfUEFSQUxMRUwgPw0KPj4gLQkJ
CSAgICAgICAweDdmIDogMHgxZik7DQo+PiArCQkJICAgICAgIGJ0NjU2ID8gMHgxZiA6IDB4N2Yp
Ow0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4NCj4+IEBAIC0yOTI1LDgg
KzI5NDAsNiBAQCBzdGF0aWMgaW50IG92NTY0MF9zX3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYg
KnNkLCBpbnQgZW5hYmxlKQ0KPj4NCj4+ICAgCQlpZiAoc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBW
NEwyX01CVVNfQ1NJMl9EUEhZKQ0KPj4gICAJCQlyZXQgPSBvdjU2NDBfc2V0X3N0cmVhbV9taXBp
KHNlbnNvciwgZW5hYmxlKTsNCj4+IC0JCWVsc2UgaWYgKHNlbnNvci0+ZXAuYnVzX3R5cGUgPT0g
VjRMMl9NQlVTX0JUNjU2KQ0KPj4gLQkJCXJldCA9IG92NTY0MF9zZXRfc3RyZWFtX2J0NjU2KHNl
bnNvciwgZW5hYmxlKTsNCj4+ICAgCQllbHNlDQo+PiAgIAkJCXJldCA9IG92NTY0MF9zZXRfc3Ry
ZWFtX2R2cChzZW5zb3IsIGVuYWJsZSk7DQo+Pg0KPj4gLS0NCj4+IDIuNy40DQo+Pg0KDQpCUiwN
Ckh1Z3Vlcy4=
