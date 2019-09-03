Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53272A73F5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 21:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfICTrZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 15:47:25 -0400
Received: from mail-oln040092068043.outbound.protection.outlook.com ([40.92.68.43]:3531
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725994AbfICTrZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Sep 2019 15:47:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9+dZxpAw8V2ttg8idaWBKcM2L30pPBM6Y/aaNqZoNm+beC/iXKOflNAfu36csPFJQV1uUu2dzP+YeE9w+qM22y8eHPLWqkdP/+pb0Azps3ocuzEOXRH8a9qWn1EwYhwnn/CsUi3F1kZXNv2I+kL8F9XBkSis+ReJmjuKg0u5viUerC8vQQMOUinAEKP/6gm6z+oLJuq80x9xn05Zjp2KpJbAID2PRIb/0YwCrvG0vQGmGybiHjFbzFbR1AFnsR4eo9B5v9Daap62FIH8LumFyexjMGw0o2lDAzE2aYvcDmG3A0wLatUIPh5GaHqf4tc/9jpruWMOFD2bllwLTwD+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl1OXlmmrsJ2YDkl5Z0ssofFqBYMWQdd8Lkby8mKeMA=;
 b=B/SOMva7aMKQhh381QL/FUrf5kaxgY5Gc3OpxMSNmmX+a3nRDSDJUW/VkX9772mb6C1fhecTdR4fsZa9rDDJMEMx8sxO2V85W7vY0ay/SlXliJ7pbckU7sveehE8tS5u5jnvz7sFM8AcPLVEOFXHlpvCiojmKDP/yV1ckSWqr1EWXCGqZoTQwNvXh4VQE4zjUO2fpjM1Ax1IJmOXYKE91Z0jViEse2KZGYin+7xoQxx2RB8duP9kddRg0JC97IfVT73qt4BNRJU9/zXFqrO/UOHUq8UEFA2WuhcFEERWbPsIZJarYBiJP0yFs4k6aWSiOJCbB3DMseT7L5aOaXe/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
 (10.152.12.59) by VE1EUR02HT179.eop-EUR02.prod.protection.outlook.com
 (10.152.13.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Tue, 3 Sep
 2019 19:47:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT042.mail.protection.outlook.com (10.152.13.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Tue, 3 Sep 2019 19:47:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::59e6:329d:5fc7:5181%5]) with mapi id 15.20.2241.014; Tue, 3 Sep 2019
 19:47:20 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 08/12] media: hantro: Fix H264 decoding of field encoded
 content
Thread-Topic: [RFC 08/12] media: hantro: Fix H264 decoding of field encoded
 content
Thread-Index: AQHVYMMtmxM+aDjHykiwJVJ++y1ATacZ840AgAALdwCAABCDAIAAT7qA
Date:   Tue, 3 Sep 2019 19:47:20 +0000
Message-ID: <HE1PR06MB4011B532327D629753FDDAC1ACB90@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
 <HE1PR06MB4011EA39133818A85768B91FACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <1567516908.5229.7.camel@pengutronix.de>
 <DB6PR06MB4007C0F89BAEC6F9F1F2AA18ACB90@DB6PR06MB4007.eurprd06.prod.outlook.com>
 <1567522916.5229.11.camel@pengutronix.de>
In-Reply-To: <1567522916.5229.11.camel@pengutronix.de>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0701CA0076.eurprd07.prod.outlook.com
 (2603:10a6:3:64::20) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:D53387E6826E5AF0FA56790C2CBA3BACE09CE5526C135CD1E4C55E3AA1665949;UpperCasedChecksum:AB48C5586087F8077F1CEC97158477431274A375D420079B40355BEDBF107EED;SizeAsReceived:8134;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [2gyRvBEhlEh4hznG3I6TgOsrpeZcnVXD]
x-microsoft-original-message-id: <b009afbc-a744-91de-831e-05f564169977@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR02HT179;
x-ms-traffictypediagnostic: VE1EUR02HT179:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-message-info: GG6H0U3iXZf21heWY7qLMoYZAR3PZFI+XKs8rQh/W35f5huy4jR/o306pwYFqwOohVZ4buvwxi8LPfI/It7b2p9/VBsAieyOgfAxiFBn0q8qESKbvlj1q4pqIPQRzJQ8xRu7vnwwOzsf6sQpYlE+CmR9m1DnXboZ5O+ytSQoKDaA+rvgoiz7BLmD5eMzFhK/
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B9B4FC940397F45B2963825C07C19B1@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ae754e25-ee48-46b0-493e-08d730a7881a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 19:47:20.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT179
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wOS0wMyAxNzowMSwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4gT24gVHVlLCAyMDE5
LTA5LTAzIGF0IDE0OjAyICswMDAwLCBKb25hcyBLYXJsbWFuIHdyb3RlOg0KPj4gT24gMjAxOS0w
OS0wMyAxNToyMSwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4+PiBPbiBTdW4sIDIwMTktMDktMDEg
YXQgMTI6NDUgKzAwMDAsIEpvbmFzIEthcmxtYW4gd3JvdGU6DQo+Pj4+IFRoaXMgbmVlZCBjb2Rl
IGNsZWFudXAgYW5kIGZvcm1hdHRpbmcNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSm9uYXMg
S2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KPj4+IFRoZSBwcmV2aW91cyBwYXRjaGVzIGFsbCB3
b3JrLCBidXQgdGhpcyBwYXRjaCBicmVha3MgZGVjb2Rpbmcgb2YNCj4+PiBwcm9ncmVzc2l2ZSBj
b250ZW50IGZvciBtZSAoaS5NWDhNUSB3aXRoIEZGbXBlZyBiYXNlZCBvbiBFemVxdWllbCdzDQo+
Pj4gYnJhbmNoKS4NCj4+IFBsZWFzZSB0cnkgd2l0aCBmZm1wZWcgYmFzZWQgb24gbXkgdjRsMi1y
ZXF1ZXN0LWh3YWNjZWwtNC4wLjQtaGFudHJvIGJyYW5jaCBhdCBbMV0sDQo+PiB1cCB0byBhbmQg
aW5jbHVkaW5nIHRoZSBjb21taXQgIkhBQ0s6IGFkZCBkcGIgZmxhZ3MgZm9yIHJlZmVyZW5jZSB1
c2FnZSBhbmQgZmllbGQgcGljdHVyZSIuDQo+PiBUaGF0IGNvbW1pdCBhZGRzIGNvZGUgdG8gc2V0
IHJlZmVyZW5jZSBmbGFncyBuZWVkZWQgYnkgdGhlIGNoYW5nZXMgaW4gdGhpcyBwYXRjaC4NCj4+
DQo+PiBUaGVyZSBpcyBwcm9iYWJseSBhbHNvIHNvbWUgb3RoZXIgbWlub3IgZGlmZmVyZW5jZSBi
ZXR3ZWVuIG91ciB0d28gZmZtcGVnIGJyYW5jaGVzLg0KPj4gSSBoYXZlIG5vdCBvYnNlcnZlZCBh
bnkgaXNzdWVzIHdpdGggcHJvZ3Jlc3NpdmUgY29udGVudCB3aXRoIHRoaXMgcGF0Y2ggYW5kIG15
IGZmbXBlZyBicmFuY2ggKG9uIGEgUkszMjg4IGRldmljZSkuDQo+PiBTb21lIEgyNjQgcmVmZXJl
bmNlIHNhbXBsZXMgZG8gaGF2ZSB2aXN1YWwgaXNzdWVzIGFmdGVyIHRoaXMgcGF0Y2gsIGhvd2V2
ZXIgYWxsIG15IHJlYWwgd29ybGQgc2FtcGxlcyBkb2VzIHNlZW0gdG8gd29yay4NCj4+DQo+PiBN
eSBicmFuY2ggdXNlIGxpYnVkZXYgdG8gcHJvYmUgbWVkaWEvdmlkZW8gZGV2aWNlcyBhbmQgbmVl
ZHMgdG8gYmUgY29uZmlndXJlZCB3aXRoOg0KPj4gLS1lbmFibGUtdjRsMi1yZXF1ZXN0IC0tZW5h
YmxlLWxpYnVkZXYgLS1lbmFibGUtbGliZHJtDQo+Pg0KPj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNv
bS9Ld2lib28vRkZtcGVnL2NvbW1pdHMvdjRsMi1yZXF1ZXN0LWh3YWNjZWwtNC4wLjQtaGFudHJv
DQo+IEkgaGFkbid0IHJlYWxpemVkIHRoYXQgdGhpcyBpcyBhIGJhY2t3YXJkcyBpbmNvbXBhdGli
bGUgY2hhbmdlLiBXaXRoDQo+IHlvdXIgYnJhbmNoIHJlYmFzZWQgb250byBuNC4yLCBhbmQgdGhp
cyBwYXRjaCBhcHBsaWVkLCBkZWNvZGluZyBzZWVtcyB0bw0KPiB3b3JrLg0KDQpOb3IgZGlkIEks
IHRoYW5rcyBmb3IgdGVzdGluZyBhbmQgdmVyaWZ5aW5nLCBJIHdpbGwgdHJ5IHRvIHJlZHVjZSBi
cmVha2luZyBjaGFuZ2VzIGluIGEgdjIuDQoNClJlZ2FyZHMsDQpKb25hcw0KDQo+DQo+IHJlZ2Fy
ZHMNCj4gUGhpbGlwcA0KDQo=
