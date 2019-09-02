Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86511A5A88
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 17:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfIBP0g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 11:26:36 -0400
Received: from mail-oln040092068044.outbound.protection.outlook.com ([40.92.68.44]:61595
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726027AbfIBP0f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 11:26:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtFz6ehMLNiZLHG2Q+Y6hDddhstXhepzMOU2OikEZUxvvk7K5kM3+zHMc/llbxWl20VBoVjRT0ZqZVpUADB0oIbDRBn/p3UQGbRj4EFWyM8C/0Dpnnv9b1mk7gWvkZTTnqQP7wTTSkM3Et4HI/7c6ybMjPWnEwq4eOFCKBsxAKvwPzyeQDheeBy6fr77NpYBjbY4ZKMeAUKseQLrwiP10kPKHkYNeuu7aoy90282VQb5N9/tXHKAGE9Xc94/btaefeXGviDtmHFaUy2I8zovVb2Vp0ekKI2U3tzzMwaEtG+7BQa0I687KYHg15wcX9Q8rid5CqC+QE1g2DqufqjLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skmXnPLYo60PpAbjwZFEbS2HY89E+h5uAdix69GZRG8=;
 b=fwGAHt4UHAWAcxiS+H1bhMh/7WA0XEfa8McuoPfoYUvIhVRhfegqMInA2kMWbSkz3SGXTzxQykgaW7Z2oKqeC/Uu4h6EzAtoO09oUP2+YQPy84mUEpldwxyEK4b/u3W1kpfAND6CVD7R9ZwvYZlE9A41u39Iddv18+q1p+V2wTc6UqJftIEIMeutsFAWdqUdplufkq1vylWFXONsz1wfi/iFRNZTKYZuGocos8V1Z8egB56a2381oMTpk/2TyLog1ej7+W8PaF1gLlNR31yycg1f702OYpwem3+Mq+522eJJLQ8kkXQVrjw7WbziGKfkfEeLveShwDBbBC1faxPkXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR02FT062.eop-EUR02.prod.protection.outlook.com
 (10.152.10.58) by HE1EUR02HT225.eop-EUR02.prod.protection.outlook.com
 (10.152.11.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Mon, 2 Sep
 2019 15:25:29 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.10.55) by
 HE1EUR02FT062.mail.protection.outlook.com (10.152.11.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.16 via Frontend Transport; Mon, 2 Sep 2019 15:25:29 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 15:25:29 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 10/12] media: hantro: Add support for H264 decoding on
 RK3399
Thread-Topic: [RFC 10/12] media: hantro: Add support for H264 decoding on
 RK3399
Thread-Index: AQHVYMMtg5M5ndr2ZkScDZ0tFJAWD6cYRqiAgAA9GoA=
Date:   Mon, 2 Sep 2019 15:25:29 +0000
Message-ID: <HE1PR06MB401131344C5E1FC6D66390A2ACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <20190901124531.23645-1-jonas@kwiboo.se>
 <HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <99943cdf-7e3b-f819-5d81-2e007e788682@xs4all.nl>
In-Reply-To: <99943cdf-7e3b-f819-5d81-2e007e788682@xs4all.nl>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:7:67::26) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:FFC3E9FB77B4E854BB1D2AB83C0E40833255059E57F951BE55B601707C6A42A8;UpperCasedChecksum:4D72F63F482C84E415125326B24FC1CE1B4B894F53DB5AFBEF636B8DA7FA9E50;SizeAsReceived:7995;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [1k7RFZaT57aQKPycM83ssG1C0Iwu0WK7]
x-microsoft-original-message-id: <f684b319-8953-57c9-1a00-cb9b172185eb@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR02HT225;
x-ms-traffictypediagnostic: HE1EUR02HT225:
x-microsoft-antispam-message-info: G72migdQMrt6W85hgcbL5xc5wy92hz21qbOEvf2zM8zYaAVHvf7Sc0bRIX2j7HnO9XrjDToFB6g/9qtG8iOcl1fOGpybWYlW76Di6R1xHMQ+enIASFKvdcAc8dLvhlgwHKU+HhtpetDwHqcJBDUpBBP51R7YvkNVNszTZOphhB/+/qtXn900IaEtZWpDs7s2
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E6FC17CD8EF784AB03CE3039EA92438@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c964913-cb0d-4c4a-7238-08d72fb9c961
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 15:25:29.4943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT225
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wOS0wMiAxMzo0NiwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBPbiA5LzEvMTkgMjo0
NSBQTSwgSm9uYXMgS2FybG1hbiB3cm90ZToNCj4+IFJvY2tjaGlwIFJLMzM5OSBTb0MgaGFzIHRo
ZSBzYW1lIEhhbnRybyBHMSBJUCBibG9jaw0KPj4gYXMgUkszMjg4LCBidXQgdGhlIHJlZ2lzdGVy
cyBhcmUgZW50aXJlbHkgZGlmZmVyZW50Lg0KPj4NCj4+IEluIGEgc2ltaWxhciBmYXNoaW9uIGFz
IE1QRUctMiBhbmQgVlA4IGRlY29kaW5nLA0KPj4gaXQncyBzaW1wbGVyIHRvIGp1c3QgYWRkIGEg
c2VwYXJhdGUgaW1wbGVtZW50YXRpb24uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2Fy
bG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9zdGFnaW5nL21lZGlh
L2hhbnRyby9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4+ICAuLi4vc3RhZ2luZy9tZWRpYS9o
YW50cm8vaGFudHJvX2cxX2gyNjRfZGVjLmMgfCAgIDEgLQ0KPj4gIGRyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9oYW50cm8vaGFudHJvX2h3LmggICAgICB8ICAgMSArDQo+PiAgLi4uL21lZGlhL2hhbnRy
by9yazMzOTlfdnB1X2h3X2gyNjRfZGVjLmMgICAgIHwgNDg2ICsrKysrKysrKysrKysrKysrKw0K
Pj4gIDQgZmlsZXMgY2hhbmdlZCwgNDg4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9yazMzOTlf
dnB1X2h3X2gyNjRfZGVjLmMNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2hhbnRyby9NYWtlZmlsZSBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50cm8vTWFrZWZp
bGUNCj4+IGluZGV4IDVkNmIwMzgzZDI4MC4uOGQzM2IwZThhYTZjIDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9NYWtlZmlsZQ0KPj4gKysrIGIvZHJpdmVycy9z
dGFnaW5nL21lZGlhL2hhbnRyby9NYWtlZmlsZQ0KPj4gQEAgLTgsNiArOCw3IEBAIGhhbnRyby12
cHUteSArPSBcDQo+PiAgCQloYW50cm9fZzFfbXBlZzJfZGVjLm8gXA0KPj4gIAkJaGFudHJvX2cx
X3ZwOF9kZWMubyBcDQo+PiAgCQlyazMzOTlfdnB1X2h3X2pwZWdfZW5jLm8gXA0KPj4gKwkJcmsz
Mzk5X3ZwdV9od19oMjY0X2RlYy5vIFwNCj4+ICAJCXJrMzM5OV92cHVfaHdfbXBlZzJfZGVjLm8g
XA0KPj4gIAkJcmszMzk5X3ZwdV9od192cDhfZGVjLm8gXA0KPj4gIAkJaGFudHJvX2pwZWcubyBc
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFf
aDI2NF9kZWMuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50cm8vaGFudHJvX2cxX2gyNjRf
ZGVjLmMNCj4+IGluZGV4IDRiODJiOWZkNTI1Mi4uZWMyNzM2ZmI0NzNkIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYw0KPj4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYw0K
Pj4gQEAgLTIwMiw3ICsyMDIsNiBAQA0KPj4gICNkZWZpbmUgRzFfUkVHX1JFRkJVX0UodikJCSgo
dikgPyBCSVQoMzEpIDogMCkNCj4+ICANCj4+ICAjZGVmaW5lIEcxX1JFR19BUEZfVEhSRVNIT0xE
KHYpCQkoKCh2KSA8PCAwKSAmIEdFTk1BU0soMTMsIDApKQ0KPj4gLT4+Pj4+Pj4gYjIyNzM0ZmI1
ZTJjLi4uIFltZWRpYTogaGFudHJvOiBSZWZhY3RvciBHMSBIMjY0IGNvZGUNCj4gXl5eXl5eXl5e
Xl5eXl5eDQo+DQo+IFNlZW1zIHRvIGJlIGEgbGVmdC1vdmVyIGZyb20gcGF0Y2ggOT8NCg0KWWVz
LCB0aGFua3MgZm9yIG5vdGljaW5nLCBsb29rcyBsaWtlIHRoZXJlIHdhcyBhIHNtYWxsIHJlYmFz
ZSBpc3N1ZSwgdGhlIGxpbmUgZ290IGFkZGVkDQppbiBvbmUgcGF0Y2ggYW5kIHJlbW92ZWQgaW4g
dGhlIG5leHQuIFdpbGwgZml4IGluIG5leHQgc3Bpbi4NCg0KUmVnYXJkcywNCkpvbmFzDQoNCj4N
Cj4gUmVnYXJkcywNCj4NCj4gCUhhbnMNCj4NCj4+ICANCj4+ICB2b2lkIGhhbnRyb19nMV9oMjY0
X2RlY19ydW4oc3RydWN0IGhhbnRyb19jdHggKmN0eCkNCj4+ICB7DQoNCg==
