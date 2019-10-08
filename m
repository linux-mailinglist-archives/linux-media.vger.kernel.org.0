Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8263BD0242
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 22:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730787AbfJHUj7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 16:39:59 -0400
Received: from mail-oln040092070040.outbound.protection.outlook.com ([40.92.70.40]:64237
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730523AbfJHUj7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 16:39:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWcoNPcJmSUCYYA2axgg2QcNu+Bt664lhI+m3XkxntyIK9Eq5a4JWYYmXyM2vC/Ck0mNA+fAoxsIS+JD8+QymASGJ0B/9zQIMIX+/24WLKA7G3xAp4TnSN7EiB5LiVEfnRuHH/UEvUuV8Hfp3KwHNhalJZXdi/g3HstgnaDXFnl3ISmL5s2SBGfWXhHIJ+6R1QrMJPx1NHChEFzLOd6sRdk8JAVoLbG/a2sm1t9ibGXCccMFK/M43zZDOrJGUW8qqQfGl5F7k7ftag8Msnuin3gnA1SJNECP6vzi9G+Gi5rblkp4y8VDp8lAn1iTiRbIZaOm1Vo8a/7JeJzKHn+4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiqIDkLQmS/oQjDPpinIq0CYwvEgeVVqQ0THHUZzIQk=;
 b=mSLxLzFaTvfPAgcLZinA7XY6TTIrzgeu0KixjYjU8FOpA5CAcwRTjP+ycVhtGIzGZhF3TXJb0OSAlchqpkUlxalABCsrNR5Uq/QDR/gni2eZ0g8cTtpj1mb2H4Vgtdp+YlVRsoWtgtDvyVpmIUExhQuNiUOQVm7FeUoEw3lMWkzXJP6FCGHtmYbA/oIF0EoPcrBkysPQTxVcjWiuLKDz9+/fta/6qcPq7kOegmsA0X8n3fZfksppaU274XvFxVSay7XMdqkMPvaPifCk2vCSJ07nal1mTs8BZCV96j2LC5f0ZkNmr2txWrKbqQBVFHOmW4f9du750A+vXziyVU42mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (10.152.20.56) by DB5EUR03HT220.eop-EUR03.prod.protection.outlook.com
 (10.152.21.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Tue, 8 Oct
 2019 20:39:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.59) by
 DB5EUR03FT008.mail.protection.outlook.com (10.152.20.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 20:39:51 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 20:39:51 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Topic: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Index: AQHVfTc2RvTWvQQ6Z06gn22kTgvMXqdQN9WAgAARyQCAAEYFgIAAMH0AgAAFHICAAAUdgIAAbDGA
Date:   Tue, 8 Oct 2019 20:39:51 +0000
Message-ID: <HE1PR06MB4011D0189027292BD1107CAFAC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com>
 <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
 <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
 <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
 <CAAFQd5AQXGX_2gmKLfymH5mLG-uVh-v+XXtGXzbfzYzVVV42mA@mail.gmail.com>
 <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P190CA0032.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::21)
 To HE1PR06MB4011.eurprd06.prod.outlook.com (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:ED8B3481303949AA163365B91C15FD17DBC1761FEC0479E3079B77E0A731F3B0;UpperCasedChecksum:D1A65F5A43858122FCF83CC051B16525250AC2A980C2B11E78D54F045E5F3F42;SizeAsReceived:8639;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [7OxvuIB9ZwPzpkN3hiTDty5cOu7FlsKk]
x-microsoft-original-message-id: <d4dfec7b-dc8d-3087-54c4-77bc41443868@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR03HT220:
x-ms-exchange-purlcount: 3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POCvFKbip1UvZg0tIJOLmSuVdPCMBvpSsTMgRPw+wIHVuOmZrnzWERy4fZDPwzUyYdd9mMEXmYPpv55t6yNVL60njEPInoMeQjpHrmBK9Yi08kzbgcDN8pW0GrHt7sQritu6quyRwa/OtQwiH67vVnTD1+/7eZ5WJiox7OazIQ4hSq4JvL78iH54V4Hd5ljHL6uyffnJ6BF8/d6AQWgDzZZ7KXnYfwbNVwHH7sO2u9k=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <81210C9C23B978499F116EE89FCEBF48@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ff357a31-bcf9-4bc6-efc7-08d74c2faaec
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 20:39:51.5410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT220
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0xMC0wOCAxNjoxMiwgSm9uYXMgS2FybG1hbiB3cm90ZToNCj4gT24gMjAxOS0xMC0w
OCAxNTo1MywgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDEw
OjM1IFBNIFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+IHdyb3RlOg0KPj4+IE9uIFR1
ZSwgT2N0IDgsIDIwMTkgYXQgNzo0MiBQTSBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3Jn
PiB3cm90ZToNCj4+Pj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCAzOjMxIFBNIEpvbmFzIEthcmxt
YW4gPGpvbmFzQGt3aWJvby5zZT4gd3JvdGU6DQo+Pj4+PiBPbiAyMDE5LTEwLTA4IDA3OjI3LCBU
b21hc3ogRmlnYSB3cm90ZToNCj4+Pj4+PiBIaSBFemVxdWllbCwgSm9uYXMsDQo+Pj4+Pj4NCj4+
Pj4+PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDI6NDYgQU0gRXplcXVpZWwgR2FyY2lhIDxlemVx
dWllbEBjb2xsYWJvcmEuY29tPiB3cm90ZToNCj4+Pj4+Pj4gRnJvbTogSm9uYXMgS2FybG1hbiA8
am9uYXNAa3dpYm9vLnNlPg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUUk0gc3BlY2lmeSBzdXBwb3J0ZWQg
aW1hZ2Ugc2l6ZSA0OHg0OCB0byA0MDk2eDIzMDQgYXQgc3RlcCBzaXplIDE2IHBpeGVscywNCj4+
Pj4+Pj4gY2hhbmdlIGZybXNpemUgbWF4X3dpZHRoL21heF9oZWlnaHQgdG8gbWF0Y2ggVFJNLg0K
Pj4+Pj4+Pg0KPj4+Pj4+PiBGaXhlczogNzYwMzI3OTMwZTEwICgibWVkaWE6IGhhbnRybzogRW5h
YmxlIEgyNjQgZGVjb2Rpbmcgb24gcmszMjg4IikNCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9u
YXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gdjI6DQo+
Pj4+Pj4+ICogTm8gY2hhbmdlcy4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gIGRyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9oYW50cm8vcmszMjg4X3ZwdV9ody5jIHwgNCArKy0tDQo+Pj4+Pj4+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMg
Yi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYw0KPj4+Pj4+PiBp
bmRleCA2YmZjYzQ3ZDFlNTguLmViYjAxN2I4YTMzNCAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMNCj4+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMNCj4+Pj4+Pj4gQEAg
LTY3LDEwICs2NywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhhbnRyb19mbXQgcmszMjg4X3Zw
dV9kZWNfZm10c1tdID0gew0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgLm1heF9kZXB0aCA9IDIs
DQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAuZnJtc2l6ZSA9IHsNCj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgLm1pbl93aWR0aCA9IDQ4LA0KPj4+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICAubWF4X3dpZHRoID0gMzg0MCwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgLm1heF93aWR0aCA9IDQwOTYsDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC5z
dGVwX3dpZHRoID0gSDI2NF9NQl9ESU0sDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
IC5taW5faGVpZ2h0ID0gNDgsDQo+Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIC5tYXhf
aGVpZ2h0ID0gMjE2MCwNCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgLm1heF9oZWln
aHQgPSAyMzA0LA0KPj4+Pj4+IFRoaXMgZG9lc24ndCBtYXRjaCB0aGUgZGF0YXNoZWV0IEkgaGF2
ZSwgd2hpY2ggaXMgUkszMjg4IERhdGFzaGVldCBSZXYNCj4+Pj4+PiAxLjQgYW5kIHdoaWNoIGhh
cyB0aGUgdmFsdWVzIGFzIGluIGN1cnJlbnQgY29kZS4gV2hhdCdzIHRoZSBvbmUgeW91DQo+Pj4+
Pj4gZ290IHRoZSB2YWx1ZXMgZnJvbT8NCj4+Pj4+IFRoZSBSSzMyODggVFJNIHZjb2RlYyBjaGFw
dGVyIGZyb20gWzFdLCB1bmtub3duIHJldmlzaW9uIGFuZCBkYXRlLCBsaXN0cyA0OHg0OCB0byA0
MDk2eDIzMDQgc3RlcCBzaXplIDE2IHBpeGVscyB1bmRlciAyNS41LjEgSC4yNjQgZGVjb2Rlci4N
Cj4+Pj4+DQo+Pj4+PiBJIGNhbiBhbHNvIGNvbmZpcm0gdGhhdCBvbmUgb2YgbXkgdGVzdCBzYW1w
bGVzIChQVVBQSUVTIEJBVEggSU4gNEspIGlzIDQwOTZ4MjMwNCBhbmQgY2FuIGJlIGRlY29kZWQg
YWZ0ZXIgdGhpcyBwYXRjaC4NCj4+Pj4+IEhvd2V2ZXIgdGhlIGRlY29kaW5nIHNwZWVkIGlzIG5v
dCBvcHRpbWFsIGF0IDQwME1oeiwgaWYgSSByZWNhbGwgY29ycmVjdGx5IHlvdSBuZWVkIHRvIHNl
dCB0aGUgVlBVMSBjbG9jayB0byA2MDBNaHogZm9yIDRLIGRlY29kaW5nIG9uIFJLMzI4OC4NCj4+
Pj4+DQo+Pj4+PiBJIGFtIG5vdCBzdXJlIGlmIEkgc2hvdWxkIGluY2x1ZGUgYSB2MiBvZiB0aGlz
IHBhdGNoIGluIG15IHYyIHNlcmllcywgYXMtaXMgdGhpcyBwYXRjaCBkbyBub3QgYXBwbHkgb24g
bWFzdGVyIChIMjY0X01CX0RJTSBoYXMgY2hhbmdlZCB0byBNQl9ESU0gaW4gbWFzdGVyKS4NCj4+
Pj4+DQo+Pj4+PiBbMV0gaHR0cDovL3d3dy50LWZpcmVmbHkuY29tL2Rvd25sb2FkL2ZpcmVmbHkt
cmszMjg4L2RvY3MvVFJNL3JrMzI4OC1jaGFwdGVyLTI1LXZpZGVvLWVuY29kZXItZGVjb2Rlci11
bml0LSh2Y29kZWMpLnBkZg0KPj4+PiBJIGNoZWNrZWQgdGhlIFJLMzI4OCBUUk0gVjEuMSB0b28g
YW5kIGl0IHJlZmVycyB0byAzODQweDIxNjBAMjRmcHMgYXMNCj4+Pj4gdGhlIG1heGltdW0uDQo+
Pj4+DQo+Pj4+IEFzIGZvciBwZXJmb3JtYW5jZSwgd2UndmUgYWN0dWFsbHkgYmVlbiBnZXR0aW5n
IGFyb3VuZCAzMyBmcHMgYXQgNDAwDQo+Pj4+IE1IeiB3aXRoIDM4NDB4MjE2MCBvbiBvdXIgZGV2
aWNlcyAodGhlIG9sZCBSSzMyODggQXN1cyBDaHJvbWVib29rDQo+Pj4+IEZsaXApLg0KPj4+Pg0K
Pj4+PiBJIGd1ZXNzIHdlIG1pZ2h0IHdhbnQgdG8gY2hlY2sgdGhhdCB3aXRoIEhhbnRyby4NCj4+
PiBDb3VsZCB5b3UgY2hlY2sgdGhlIHZhbHVlIG9mIGJpdHMgMTA6MCBpbiByZWdpc3RlciBhdCAw
eDBjOD8gVGhhdA0KPj4+IHNob3VsZCBiZSB0aGUgbWF4aW11bSBzdXBwb3J0ZWQgc3RyZWFtIHdp
ZHRoIGluIHRoZSB1bml0cyBvZiAxNg0KPj4+IHBpeGVscy4NCj4+IENvcnJlY3Rpb246IFRoZSB1
bml0IGlzIDEgcGl4ZWwgYW5kIHRoZXJlIGFyZSBhZGRpdGlvbmFsIDIgbW9zdA0KPj4gc2lnbmlm
aWNhbnQgYml0cyBhdCAweDBkOCwgMTU6MTQuDQo+IEkgd2lsbCBjaGVjayB0aGlzIGxhdGVyIHRv
bmlnaHQgd2hlbiBJIGhhdmUgYWNjZXNzIHRvIG15IGRldmljZXMuDQoNCk15IEFzdXMgVGlua2Vy
IEJvYXJkIFMgKFJLMzI4OC1DKSBpcyByZXBvcnRpbmcgc3VwcG9ydCBmb3IgMHg3ODAgLyAxOTIw
IHBpeGVsczoNCg0KMHgwMDDCoCAoMCkgPSAweDY3MzEzNjg4DQoweDBjOCAoNTApID0gMHhmYmI1
NmY4MA0KMHgwZDggKDU0KSA9IDB4ZTVkYTAwMDANCg0KPiBUaGUgUFVQUElFUyBCQVRIIElOIDRL
ICg0MDk2eDIzMDQpIHNhbXBsZSBkZWNvZGVkIHdpdGhvdXQgaXNzdWUgdXNpbmcgcm9ja2NoaXAg
NC40IEJTUCBrZXJuZWwgYW5kIG1wcCBsYXN0IHRpbWUgSSB0ZXN0ZWQuDQo+DQo+IFRoZSB2Y29k
ZWMgZHJpdmVyIGluIDQuNCBCU1Aga2VybmVsIHVzZSAzMDAvNDAwIE1oeiBhcyBkZWZhdWx0IGNs
b2NrIHJhdGUgYW5kIHdpbGwgY2hhbmdlIHRvIDYwMCBNaHogd2hlbiB3aWR0aCBpcyBvdmVyIDI1
NjAsIHNlZSBbMV06DQo+IMKgIHJhaXNlIGZyZXF1ZW5jeSBmb3IgcmVzb2x1dGlvbiBsYXJnZXIg
dGhhbiAxNDQwcCBhdmMNCj4NCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yb2NrY2hpcC1saW51
eC9rZXJuZWwvYmxvYi9kZXZlbG9wLTQuNC9kcml2ZXJzL3ZpZGVvL3JvY2tjaGlwL3Zjb2RlYy92
Y29kZWNfc2VydmljZS5jI0wyNTUxLUwyNTcwDQo+DQo+IFJlZ2FyZHMsDQo+IEpvbmFzDQo+DQo+
PiBCZXN0IHJlZ2FyZHMsDQo+PiBUb21hc3oNCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gTGludXgtcm9ja2NoaXAgbWFpbGluZyBsaXN0DQo+IExp
bnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcA0KDQo=
