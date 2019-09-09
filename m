Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E00ADF66
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 21:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387744AbfIITZK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 15:25:10 -0400
Received: from mail-oln040092069108.outbound.protection.outlook.com ([40.92.69.108]:17063
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729060AbfIITZK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Sep 2019 15:25:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKwVkGVWtevmpsnX5SgOMsyKT6LLRAQ1mvA9V/5SiwrhtloLT1My2Ocue5xVfUEdju8iAhhEB5qfDSaZUbesWDV/OarnFhmS8JMpkczodEjGaVrWGvhOn96HiCQHQpR2PTupI5Xh14rTMYBdB5yg4AIV3Q/v4PH7C0CZREkrHje5GfvAt7AJXAzg8bUu9R3kEfVTIJQ+eZI5CXCpyNqXlPPuZYnPSXoSR0P670B0DM14QYkLBqbKIthQoPvWRrEpAXSRnObwHGcNuDQIC7CntZ5Ez5pHel0Xp/EDxBmHMKi6oO1Rouv7g4SXhO9wNYoPU4SqVtJO2W/rzpuqiNyJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3mmmWnTghCdUdvX37iI468w4pV1YIs13Ww5+8dNxus=;
 b=nnzxw9rKC93rUA6vGv3rKajhWWFFQguudHceuloVd+dTU8AANaTaUntBE5teVOSNm5IJhJymPWZc48AucoeMELITh3veRZRG3SD0zCAJwI/jLsOIa91NNtM9iyXH0KXvEw5G4fVt6JXc4+aAzJvFhY472JtChg++3+4h+8WpctJA5aI4pq06g4lfzVPyRs/RSdnjrI+OtoPn/DhCxfyH1sNWtkmA6TUmPJb/DSSPp5SqLYVuY25MOZy/A8RkXkRjREPHXfFpt7eHkU8lavH50N+5kajkwRrEH5dMEoc28ynpWVhzFmfZGB1eVWEy827ippByMrRwZ2O4rRI0D4y/Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT003.eop-EUR02.prod.protection.outlook.com
 (10.152.12.55) by VE1EUR02HT045.eop-EUR02.prod.protection.outlook.com
 (10.152.13.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.14; Mon, 9 Sep
 2019 19:25:06 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT003.mail.protection.outlook.com (10.152.12.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 19:25:06 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181%5]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 19:25:06 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/12] media: hantro: Fix H264 max frmsize supported on
 RK3288
Thread-Topic: [PATCH 01/12] media: hantro: Fix H264 max frmsize supported on
 RK3288
Thread-Index: AQHVYMMqh0O1621DYkuOLEeadywFI6cbgeoAgAhFHwA=
Date:   Mon, 9 Sep 2019 19:25:06 +0000
Message-ID: <HE1PR06MB401159D9A49FE4864CEF30F5ACB70@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <HE1PR06MB4011EAB6F0965D47A20AF805ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <b7a43c96fa861de1dbbe969e3aaa4220e7e96793.camel@collabora.com>
In-Reply-To: <b7a43c96fa861de1dbbe969e3aaa4220e7e96793.camel@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:14::40) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:C8BC4683345164D72083381983992A7B0E332B9B35DEFCFF7DE47E0954472DE0;UpperCasedChecksum:DE3B56E668BDC3905B551E22FDD7633CA327E09FF0B1F2D14B2BD0B24354B99C;SizeAsReceived:7998;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [AT1tQaLXTq7HP+DF/epjReN1x0Ft5xAY]
x-microsoft-original-message-id: <2376bce6-066f-1184-2a71-f79c02f5cb50@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR02HT045;
x-ms-traffictypediagnostic: VE1EUR02HT045:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: oEDTeNLi3aL6WMwNZV5buoiS+6H8ku4dOaopQTSozD02JTxNrI7E4g5eckgqjsbS9iYcS+CHhtSZM0sPJqXCqtIGM9fAzMYTxCAoTQZ5m5/HbHdFvakynbhjhrn32r2F90EEt7pY5mTZtCmtdycdPEMCNrJQVjnDnBr8olJJTwr8ZuGmTlORIp20mHZ8x8Oa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5F5A2A879876A45ADFDACE62684BCF4@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e58e504-290e-444b-b89a-08d7355b6ba7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 19:25:06.4962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT045
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wOS0wNCAxNTowNywgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiBIZWxsbyBKb25h
cywNCj4NCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+DQo+IE9uIFN1biwgMjAxOS0wOS0w
MSBhdCAxMjo0NSArMDAwMCwgSm9uYXMgS2FybG1hbiB3cm90ZToNCj4+IFRSTSBzcGVjaWZ5IHN1
cHBvcnRlZCBpbWFnZSBzaXplIDQ4eDQ4IHRvIDQwOTZ4MjMwNCBhdCBzdGVwIHNpemUgMTYgcGl4
ZWxzLA0KPj4gY2hhbmdlIGZybXNpemUgbWF4X3dpZHRoL21heF9oZWlnaHQgdG8gbWF0Y2ggVFJN
Lg0KPj4NCj4gVGhlIFJLMzI4OCBUUk0gdjEuMSAoMjAxNS04LTIwKSBJIGhhdmUgaGVyZSBtZW50
aW9ucyBhIG1heGltdW0NCj4gb2YgMzg0MHgyMTYwLg0KPg0KPiBJIG11c3QgYWRtaXQgSSBoYXZl
bid0IHRlc3RlZCB3aXRoIGFjdHVhbCBjb250ZW50IHRoaXMgc2l6ZQ0KPiB0byB2ZXJpZnkgaXQs
IGhhdmUgeW91IGNoZWNrZWQgaXQ/DQoNCkkgY2FuIGNvbmZpcm0gdGhhdCBvbmUgb2YgbXkgdGVz
dCBzYW1wbGVzIChQVVBQSUVTIEJBVEggSU4gNEspIGlzIDQwOTZ4MjMwNCBhbmQgY2FuIGJlIGRl
Y29kZWQgYWZ0ZXIgdGhpcyBwYXRjaC4NCkhvd2V2ZXIgdGhlIGRlY29kaW5nIHNwZWVkIGlzIG5v
dCBvcHRpbWFsIGF0IDQwME1oeiwgaWYgSSByZWNhbGwgY29ycmVjdGx5IHlvdSBuZWVkIHRvIHNl
dCB0aGUgVlBVMSBjbG9jayB0byA2MDBNaHogZm9yIDRLIGRlY29kaW5nIG9uIFJLMzI4OC4NCg0K
VGhlIFJLMzI4OCBUUk0gdmNvZGVjIGNoYXB0ZXIgZnJvbSBbMV0sIHVua25vd24gcmV2aXNpb24g
YW5kIGRhdGUsIGxpc3RzIDQ4eDQ4IHRvIDQwOTZ4MjMwNCBzdGVwIHNpemUgMTYgcGl4ZWxzIHVu
ZGVyIDI1LjUuMSBILjI2NCBkZWNvZGVyLg0KDQpbMV0gaHR0cDovL3d3dy50LWZpcmVmbHkuY29t
L2Rvd25sb2FkL2ZpcmVmbHktcmszMjg4L2RvY3MvVFJNL3JrMzI4OC1jaGFwdGVyLTI1LXZpZGVv
LWVuY29kZXItZGVjb2Rlci11bml0LSh2Y29kZWMpLnBkZg0KDQpSZWdhcmRzLA0KSm9uYXMNCg0K
Pg0KPiBUaGFua3MsDQo+IEV6ZXF1aWVsDQo+ICANCj4+IEZpeGVzOiA3NjAzMjc5MzBlMTAgKCJt
ZWRpYTogaGFudHJvOiBFbmFibGUgSDI2NCBkZWNvZGluZyBvbiByazMyODgiKQ0KPj4gU2lnbmVk
LW9mZi1ieTogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KPj4gLS0tDQo+PiAgZHJp
dmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMgfCA0ICsrLS0NCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYyBi
L2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50cm8vcmszMjg4X3ZwdV9ody5jDQo+PiBpbmRleCA2
YmZjYzQ3ZDFlNTguLmViYjAxN2I4YTMzNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9oYW50cm8vcmszMjg4X3ZwdV9ody5jDQo+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
bWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYw0KPj4gQEAgLTY3LDEwICs2NywxMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGhhbnRyb19mbXQgcmszMjg4X3ZwdV9kZWNfZm10c1tdID0gew0KPj4g
IAkJLm1heF9kZXB0aCA9IDIsDQo+PiAgCQkuZnJtc2l6ZSA9IHsNCj4+ICAJCQkubWluX3dpZHRo
ID0gNDgsDQo+PiAtCQkJLm1heF93aWR0aCA9IDM4NDAsDQo+PiArCQkJLm1heF93aWR0aCA9IDQw
OTYsDQo+PiAgCQkJLnN0ZXBfd2lkdGggPSBIMjY0X01CX0RJTSwNCj4+ICAJCQkubWluX2hlaWdo
dCA9IDQ4LA0KPj4gLQkJCS5tYXhfaGVpZ2h0ID0gMjE2MCwNCj4+ICsJCQkubWF4X2hlaWdodCA9
IDIzMDQsDQo+PiAgCQkJLnN0ZXBfaGVpZ2h0ID0gSDI2NF9NQl9ESU0sDQo+PiAgCQl9LA0KPj4g
IAl9LA0KPg0KDQo=
