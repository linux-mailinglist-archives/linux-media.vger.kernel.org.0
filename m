Return-Path: <linux-media+bounces-1665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF918053EB
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 13:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F711F213F4
	for <lists+linux-media@lfdr.de>; Tue,  5 Dec 2023 12:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C79E5B1F1;
	Tue,  5 Dec 2023 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="Z0pGGqFt"
X-Original-To: linux-media@vger.kernel.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7759D7
	for <linux-media@vger.kernel.org>; Tue,  5 Dec 2023 04:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1701778449; x=1704370449;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QlENBpPSGO1Qp8xWtZPIfpTxMeZdTlCuTQQgLIn3kTk=;
	b=Z0pGGqFtjP0wpDhQfpvzNWQaiw7/9jaiK6z4/8a4aaVY9y8gULNsMWbWiRUcDoW0
	6Z/VwXI64c2SSmTu64xFNA9WXeA7zbowBdAJ81iiZMWvr5ngfwWDzAIXEoOUeNMu
	2WOMb6RaApVSo0FiXqTZOjtdYOIggWtgLhDju+gLQR4=;
X-AuditID: ac14000a-94ad62400000290d-5a-656f141188e5
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.25.0.14])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 22.7F.10509.1141F656; Tue,  5 Dec 2023 13:14:09 +0100 (CET)
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 5 Dec 2023
 13:14:09 +0100
Received: from Florix.phytec.de ([fe80::a802:84f9:c56c:4c6d]) by
 florix.phytec.de ([fe80::a802:84f9:c56c:4c6d%5]) with mapi id 15.01.2507.006;
 Tue, 5 Dec 2023 13:14:09 +0100
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "martink@posteo.de"
	<martink@posteo.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-imx@nxp.com" <linux-imx@nxp.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "upstream@phytec.de" <upstream@phytec.de>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "kernel@puri.sm" <kernel@puri.sm>,
	"rmfrfs@gmail.com" <rmfrfs@gmail.com>, "festevam@gmail.com"
	<festevam@gmail.com>
Subject: Re: [Upstream] [PATCH] media: imx: imx7-media-csi: Sync frames to
 start of frame for MIPI
Thread-Topic: [Upstream] [PATCH] media: imx: imx7-media-csi: Sync frames to
 start of frame for MIPI
Thread-Index: AQHaAbkGFvtAMNVMikKKnLlRyYX9ibBQm04AgEo5k4A=
Date: Tue, 5 Dec 2023 12:14:09 +0000
Message-ID: <80b0fcc3740a1bddc7b7325f2b24f4d8ed390644.camel@phytec.de>
References: <20231017150854.270003-1-s.riedmueller@phytec.de>
	 <20231018114819.GE11118@pendragon.ideasonboard.com>
	 <ecac5edfa99e0f41eeba6a6176f5ed1c0da949d9.camel@phytec.de>
In-Reply-To: <ecac5edfa99e0f41eeba6a6176f5ed1c0da949d9.camel@phytec.de>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEA1F9B0B427634887FD9183146FB7CD@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWyRpKBT1dQJD/VYPphfYuHV/0tVk3dyWIx
	v20Gi0XnxCXsFl2/VjJb9GzYympxbcVEVotlm/4wWTQueM9i8Xf7JhaLF1vEHbg9ds66y+4x
	u2Mmq8emVZ1sHhvf7WDy6P9r4PHrsKjHox23GD0+b5IL4IjisklJzcksSy3St0vgynjUPIet
	4JVKxZZ77ewNjB+Uuxg5OSQETCS+7drF2MXIxSEksJZJ4tPia0wQziNGienX+lghnI2MEr92
	PWEEaWETcJH43PaNrYuRg0NEwFvi5xwnkBpmgd/MEg/XXGEHqREWSJFYuWMOmC0ikCoxp3UR
	lG0lsXTlN0aQXhYBFYkjrwxBwrwCbhLN0+9C7drEKLFy2Vqw+ZwC7hITnnOD1DAKyEp0Nrxj
	ArGZBcQlNj37zgrxgYDEkj3nmSFsUYmXj/9BxeUlTtyaxgQyhllAU2L9Ln2IVguJU38PMEPY
	ihJTuh+yQ5wgKHFy5hOWCYzis5BsmIXQPQtJ9ywk3bOQdC9gZF3FKJSbmZydWpSZrVeQUVmS
	mqyXkrqJERTzIgxcOxj75ngcYmTiYDzEKMHBrCTCO+9WdqoQb0piZVVqUX58UWlOavEhRmkO
	FiVx3tUdwalCAumJJanZqakFqUUwWSYOTqkGxpm9bS09s2pzf0QsE20033drn/WnxMw551qW
	ekZ6zZM47Fpq/2Hbo7DOszN+hPetWSQZs3M/66Pb+xdkxf/QNNy3Xjnp9APhfWdFXt1+f4HZ
	Yc6tM0L5hbOeLlQ7F2Qs5DZJ4+EtjuC/kVZHuu539MkG/2N9t/mkvtCJWWezZ9sfmyO9QuHP
	w0olluKMREMt5qLiRABB6x6d5wIAAA==

SGkgTGF1cmVudCwNCg0KT24gVGh1LCAyMDIzLTEwLTE5IGF0IDA3OjQ0ICswMDAwLCBTdGVmYW4g
UmllZG3DvGxsZXIgd3JvdGU6DQo+IEhpIExhdXJhbnQsDQo+IA0KPiBPbiBXZWQsIDIwMjMtMTAt
MTggYXQgMTQ6NDggKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gSGkgU3RlZmFu
LA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+IA0KPiA+IE9uIFR1ZSwg
T2N0IDE3LCAyMDIzIGF0IDA1OjA4OjU0UE0gKzAyMDAsIFN0ZWZhbiBSaWVkbcO8bGxlciB3cm90
ZToNCj4gPiA+IFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciBhIGJhc2UgYWRkcmVzcyBjaGFuZ2Ug
aXMgdG8gZG8gaXQgYXV0b21hdGljYWxseQ0KPiA+ID4gYWZ0ZXIgYSBETUEgY29tcGxldGlvbi4g
VGhpcyBjYW4gbGVhZCB0byB0aGUgc2l0dWF0aW9uLCB3ZXJlIG9uZQ0KPiA+ID4gY29ycnVwdGVk
IGZyYW1lLCB3aXRoIGxlc3MgbGluZXMgdGhhbiBjb25maWd1cmVkLCByZXN1bHRzIGluIGFsbA0K
PiA+ID4gZm9sbG93aW5nIGZyYW1lcyBiZWluZyBjb3JydXB0ZWQgYXMgd2VsbCwgZHVlIHRvIGEg
bWlzc2luZw0KPiA+ID4gcmUtc3luY2hyb25pemF0aW9uIHRvIHRoZSBiZWdpbm5pbmcgb2YgdGhl
IG5leHQgZnJhbWUuDQo+ID4gPiANCj4gPiA+IEZpeCB0aGlzIGJ5IGNvbmZpZ3VyaW5nIHRoZSBi
YXNlIGFkZHJlc3Mgc3dpdGNoIHRvIGJlIHN5bmNlZCB3aXRoIHRoZQ0KPiA+ID4gc3RhcnQgb2Yg
ZnJhbWUgZXZlbnQuDQo+ID4gPiANCj4gPiA+IEN1cnJlbnRseSB0aGlzIGlzIGFscmVhZHkgaW1w
bGVtZW50ZWQgZm9yIHRoZSBwYXJhbGxlbCBpbnRlcmZhY2UuIFRvDQo+ID4gPiBoYXZlIGl0IHdp
dGggTUlQSSBhcyB3ZWxsLCBzaW1wbHkgY29uZmlndXJlIGl0IHVuY29uZGl0aW9uYWxseS4NCj4g
PiA+IA0KPiA+ID4gVGVzdGVkIG9uIGkuTVggOE1NLg0KPiA+IA0KPiA+IEkgcmVjYWxsIG5vdCBk
b2luZyB0aGlzIHVuY29uZGl0aW9uYWxseSBhcyBpdCBkaWRuJ3Qgd29yayBvbiBzb21lIG9mIHRo
ZQ0KPiA+IHBsYXRmb3JtcyBJIHdhcyB0ZXN0aW5nLCBidXQgSSdtIG5vdCBzdXJlIG9mIHRoZSBk
ZXRhaWxzIGFueW1vcmUuIEknbGwNCj4gPiByZXRlc3Qgb24gaS5NWDcuDQo+IA0KPiBUaGFua3Mh
DQoNCkFueSB1cGRhdGUgeWV0IG9uIHRoZSBpLk1YNyB0ZXN0Pw0KDQpSZWdhcmRzLA0KU3RlZmFu
DQoNCj4gDQo+ID4gRG8gd2UgaGF2ZSBhbnkgYnVmZmVyIG92ZXJmbG93IHByb3RlY3Rpb24gaW4g
dGhpcyBtb2RlID8gSWYgdGhlIHNlbnNvcg0KPiA+IGhhcHBlbnMgdG8gc2VuZCBtb3JlIGxpbmVz
IHRoYW4gZXhwZWN0ZWQsIHdpbGwgZXh0cmEgbGluZXMgYmUgZHJvcHBlZCwNCj4gPiBvciBvdmVy
ZmxvdyB0aGUgYnVmZmVyID8NCj4gDQo+IEFzIGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlIGlteDht
bSByZWZlcmVuY2UgbWFudWFsLCBJIHRoaW5rIHRoZXJlIGlzIGENCj4gYnVmZmVyDQo+IG92ZXJm
bG93IHByb3RlY3Rpb24sIGluIHRoZSBmb3JtIHRoYXQgdGhlIERNQSB3aWxsIG9ubHkgd3JpdGUg
dGhlIGFtb3VudCBvZg0KPiBkYXRhIHdoaWNoIHdhcyBjb25maWd1cmVkIGluIENTSV9JTUFHX1BB
UkEuIElmIGFkZGl0aW9uYWwgZGF0YSBhcnJpdmVzIG9uDQo+IHRoZQ0KPiBidXMsIHdpdGhvdXQg
YSBuZXcgc3RhcnQgb2YgZnJhbWUgZXZlbnQsIGEgbmV3IERNQSB0cmFuc2ZlciB3aWxsIGJlDQo+
IHRyaWdnZXJlZA0KPiBldmVudHVhbGx5LiBTaW5jZSB0aGVyZSB3YXMgbm8gYmFzZSBhZGRyZXNz
IGNoYW5nZSwgZHVlIHRvIHRoZSBtaXNzaW5nIHN0YXJ0DQo+IGZyYW1lIGV2ZW50LCB0aGUgbmV3
IERNQSB0cmFuc2ZlciB3aWxsIHVzZSB0aGUgc2FtZSBidWZmZXIgYXMgYmVmb3JlIGFuZA0KPiBj
b3JydXB0IHRoYXQgZGF0YS4gQnV0IGFsbCBzdWJzZXF1ZW50IGZyYW1lcyB3aWxsIGJlIG9rIHNp
bmNlIGEgbmV3IGZyYW1lDQo+IHdpbGwNCj4gdHJpZ2dlciB0aGUgc3RhcnQgb2YgZnJhbWUgZXZl
bnQgYW5kIHRodXMgYSBiYXNlIGFkZHJlc3MgY2hhbmdlLg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+
IFN0ZWZhbsKgIHQNCj4gDQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gUmllZG3D
vGxsZXIgPHMucmllZG11ZWxsZXJAcGh5dGVjLmRlPg0KPiA+ID4gLS0tDQo+ID4gPiDCoGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMgfCA2ICsrKy0tLQ0KPiA+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4g
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14Ny1tZWRp
YS1jc2kuYw0KPiA+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNz
aS5jDQo+ID4gPiBpbmRleCAxNTA0OWM2YWFiMzcuLjBjOWUzZjAxZTk2ZCAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4gPiA+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4gPiA+
IEBAIC01MjksMTMgKzUyOSwxMyBAQCBzdGF0aWMgdm9pZCBpbXg3X2NzaV9jb25maWd1cmUoc3Ry
dWN0IGlteDdfY3NpDQo+ID4gPiAqY3NpLA0KPiA+ID4gwqAJCXN0cmlkZSA9IG91dF9waXgtPndp
ZHRoOw0KPiA+ID4gwqAJfQ0KPiA+ID4gwqANCj4gPiA+ICsJY3IxOCB8PSBCSVRfQkFTRUFERFJf
U1dJVENIX0VOIHwgQklUX0JBU0VBRERSX1NXSVRDSF9TRUwgfA0KPiA+ID4gKwkJQklUX0JBU0VB
RERSX0NIR19FUlJfRU47DQo+ID4gPiArDQo+ID4gPiDCoAlpZiAoIWNzaS0+aXNfY3NpMikgew0K
PiA+ID4gwqAJCWNyMSA9IEJJVF9TT0ZfUE9MIHwgQklUX1JFREdFIHwgQklUX0dDTEtfTU9ERSB8
DQo+ID4gPiBCSVRfSFNZTkNfUE9MDQo+ID4gPiDCoAkJwqDCoMKgIHwgQklUX0ZDQyB8IEJJVF9N
Q0xLRElWKDEpIHwgQklUX01DTEtFTjsNCj4gPiA+IMKgDQo+ID4gPiAtCQljcjE4IHw9IEJJVF9C
QVNFQUREUl9TV0lUQ0hfRU4gfA0KPiA+ID4gQklUX0JBU0VBRERSX1NXSVRDSF9TRUwNCj4gPiA+
ID4gDQo+ID4gPiAtCQkJQklUX0JBU0VBRERSX0NIR19FUlJfRU47DQo+ID4gPiAtDQo+ID4gPiDC
oAkJaWYgKG91dF9waXgtPnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZNVF9VWVZZIHx8DQo+ID4g
PiDCoAkJwqDCoMKgIG91dF9waXgtPnBpeGVsZm9ybWF0ID09IFY0TDJfUElYX0ZNVF9ZVVlWKQ0K
PiA+ID4gwqAJCQl3aWR0aCAqPSAyOw0KPiA+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiB1cHN0cmVhbSBtYWlsaW5nIGxpc3QNCj4gdXBzdHJl
YW1AbGlzdHMucGh5dGVjLmRlDQo+IGh0dHA6Ly9saXN0cy5waHl0ZWMuZGUvY2dpLWJpbi9tYWls
bWFuL2xpc3RpbmZvL3Vwc3RyZWFtDQo=

