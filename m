Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 750ADA5B65
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbfIBQ3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 12:29:02 -0400
Received: from mail-oln040092066050.outbound.protection.outlook.com ([40.92.66.50]:20019
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726036AbfIBQ3C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 2 Sep 2019 12:29:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et3KGfNOrEa7TjUgYnyKToVgQkVYpqDll4ZWoH9NIE4bp5tMvsoJJSibqghnzIksoUXaD0PKuf2UdlFtcAx8yPQ3t6doDhLT/ZPkv8KoytArZTaot0mciH0GfwRpS+mNYxpUUgHnf7JU7gXceD8QqKVh9qGygzfsMB57ncEvIKId7b6Uuv1RuwX6nJmD3T9nOaT2TKPWhOmgMSVapxyOTJHSx7cC1mKcjlPS6mMeFPkdzRUU7/Jrux7TgVg8+UzY0qQ1uyZv1ZmQPWexhgO2Vnve4By6AVJD/g0t/O5UvcyWc866gEm8qDNUv0vPxH1KvDxStLZasGN1lId3YToEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvJxEjE6Bkg3CIhQhnnMi0uxLlw6nDEohAU3aNopbxA=;
 b=l2iamN6BDm8uYPuvMQAiLJKnu4Qt2aZXplBeKn/rQOnGIoGXqg/1FjFYClqB24DzekpELInB2jgQNLZhwi/khrUciYSXdYjIR8Jm7CONElmw8yFznksd9yttFdcPi3q6jsr8cg6wfRqqQGCO0vELJi5gbINRLbYOPxU4gbkWH/2L+EIiEWOVObiYbPDAxLKTVRaa0wR/Hul/GMelOw39uOZOKm7Qf571jITFPo+QZnmTV5KqEtOgYq7RAEOByyjLVOeED9IJO9Gba5aAjE3ce8/MyKUFixy9mZd4KC7PKwn+8GwIKWMAW+qgJje7Xbhxls7FUDWo5t1iaJPPzC0zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from HE1EUR01FT016.eop-EUR01.prod.protection.outlook.com
 (10.152.0.57) by HE1EUR01HT165.eop-EUR01.prod.protection.outlook.com
 (10.152.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2220.16; Mon, 2 Sep
 2019 16:28:57 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.0.56) by
 HE1EUR01FT016.mail.protection.outlook.com (10.152.0.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Mon, 2 Sep 2019 16:28:57 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::1188:7e7d:69b:a036%5]) with mapi id 15.20.2220.022; Mon, 2 Sep 2019
 16:28:57 +0000
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
Subject: Re: [PATCH RFC 00/12] media: hantro: H264 fixes and improvements
Thread-Topic: [PATCH RFC 00/12] media: hantro: H264 fixes and improvements
Thread-Index: AQHVYMK7ybJvfQx/EkSu6izc1mlMg6cYW8IAgAA5v4A=
Date:   Mon, 2 Sep 2019 16:28:57 +0000
Message-ID: <HE1PR06MB40118B3C30939861DD91113CACBE0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB40117D0EE96E6FA638A04B78ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <f204a408f980f3ae0cfb859acdc765cdc1c0ff01.camel@collabora.com>
In-Reply-To: <f204a408f980f3ae0cfb859acdc765cdc1c0ff01.camel@collabora.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0260.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::12) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:9B0246D1386D857E6FB3E657D94BD2A71FF85C906657F1EC9669500DAECC0EEA;UpperCasedChecksum:6E2F2CE8CCB2E471BB9DC1D15D57F6FD7E9D2FDDEE2C6BD1EEB7AEF22AD403D4;SizeAsReceived:7895;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [3MgcCTV2nq2dcG5UFfssQqaI9OVJeP7r]
x-microsoft-original-message-id: <2c056ed3-1162-5edf-24a0-0cf77c1aca61@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:HE1EUR01HT165;
x-ms-traffictypediagnostic: HE1EUR01HT165:
x-microsoft-antispam-message-info: jf1mmJeLaF42OThnaFOhAJJIrXRVEBS0fOt8QUKi2fOdGNlqCV3R1j8EGFU9s+6zaf0E8KpH4ict01p4B+CVWgXAi7Fm6WFKWtOrPNonI/96Rr7jTzHN6+p+U193Y2t3R8hGvyFultkm9T3cb05ob2/VDDZHlKqwghbH7gaXLBxsM/bLxyLiVgqtcXDNGD1p
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEA1D42DB45AA442864B3E4EAF3C896C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cdebc51b-cb3f-4be8-d5a2-08d72fc2a72e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 16:28:57.4448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT165
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wOS0wMiAxNTowMiwgRXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiBIaSBKb25hcywN
Cj4NCj4gVGhhbmtzIGZvciB0aGUgc2VyaWVzLCBJJ2xsIGJlIHJldmlld2luZyB0aGlzIHNob3J0
bHkuDQo+DQo+IE9uIFN1biwgMjAxOS0wOS0wMSBhdCAxMjo0MiArMDAwMCwgSm9uYXMgS2FybG1h
biB3cm90ZToNCj4+IFRoaXMgc2VyaWVzIGNvbnRhaW5zIGZpeGVzIGFuZCBpbXByb3ZlbWVudHMg
Zm9yIHRoZSBoYW50cm8gSDI2NCBkZWNvZGVyLg0KPj4NCj4+IFBhdGNoIDEtNiBmaXhlcyBpc3N1
ZXMgYW5kIGxpbWl0YXRpb25zIG9ic2VydmVkIHdoZW4gcHJlcGFyaW5nIHN1cHBvcnQNCj4+IGZv
ciBmaWVsZCBlbmNvZGVkIGNvbnRlbnQuDQo+Pg0KPj4gUGF0Y2ggNyBpbnRyb2R1Y2UgbmV3IERQ
QiBlbnRyeSBmbGFncyB0aGF0IGlzIHVzZWQgdG8gc2lnbmFsIGhvdyBhIHJlZmVyZW5jZQ0KPj4g
ZnJhbWUgaXMgcmVmZXJlbmNlZC4gVGhpcyBpbmZvcm1hdGlvbiBpcyBuZWVkZWQgdG8gY29ycmVj
dGx5IGJ1aWxkIGENCj4+IHJlZmVyZW5jZSBsaXN0IGZvciBmaWVsZCBlbmNvZGVkIGNvbnRlbnQu
DQo+Pg0KPj4gUGF0Y2ggOCBhZGRzIGJpdHMgdG8gaGFuZGxlIGZpZWxkIGVuY29kZWQgY29udGVu
dCwgdGhpcyBpcyBhIHJvdWdoIHBhdGNoDQo+PiBhbmQgc2hvdWxkIGJlIHJld29ya2VkIHdpdGgg
cHJvcGVyIGNvZGUgc3R5bGUgYW5kIGZvcm1hdHRpbmcuDQo+PiBQbGVhc2UgZ2V0IGJhY2sgd2l0
aCBmZWVkYmFjayBvbiBob3cgdG8gaW1wcm92ZSB0aGlzLg0KPj4NCj4+IFRoZSBmb2xsb3dpbmcg
c2FtcGxlcyBmcm9tIFsxXSBhcmUgbm93IHBsYXlhYmxlIHdpdGggcGF0Y2ggMS04DQo+PiAtIEgy
NjRfMTA4MGktMjUtaW50ZXJsYWNlX0thZXNlc2NoZWliY2hlbi5ta3YNCj4+IC0gSDI2NF8xMF8x
MDgwaV81MF9BQzMtQXN0cmExOS4yX1Byb1NpZWJlbl9IRC50cw0KPj4gLSBiaWdfYnVja19idW5u
eV8xMDgwcF9IMjY0X0FBQ18yNWZwc183MjAwSy5tcDQNCj4+IC0gaDI2NF90aXZvX3NhbXBsZS50
cw0KPj4NCj4+IFRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIHJlZmFjdG9ycyBHMSBIMjY0IGNvZGUg
dG8gbW9yZSBjbG9zZWx5IG1hdGNoDQo+PiB0aGUgY29kZSBnZW5lcmF0ZWQgYnkgbXkgcm9ja2No
aXAtdnB1LXJlZ3Rvb2wgYXQgWzJdIGFuZCB0aGVuIGFkZHMNCj4+IHN1cHBvcnQgZm9yIEgyNjQg
ZGVjb2Rpbmcgb24gUkszMzk5L1JLMzMyOCB1c2luZyB0aGUgVlBVMiBibG9jay4NCj4+IFRoaXMg
Y29kZSBpcyBlYXJseSB3b3JrIGFuZCBuZWVkcyBwcm9wZXIgY29kZSBzdHlsZSBhbmQgZm9ybWF0
dGluZywNCj4+IEkganVzdCB3YW50ZWQgdG8gc2hhcmUgdGhlIGVhcmx5IHdvcmsgYW5kIGdldCBz
b21lIGluaXRpYWwgZmVlZGJhY2suDQo+Pg0KPj4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVk
IHVzaW5nIGZmbXBlZyB2NGwyIHJlcXVlc3QgaHdhY2NlbCBhdCBbM10gWzRdDQo+Pg0KPiBXaGF0
IGJvYXJkcyBoYXZlIHlvdSB0ZXN0ZWQgdGhpcyBvbj8NCg0KTWFpbiB0ZXN0aW5nIGhhcyBiZWVu
IGRvbmUgb24gYSBUaW5rZXIgQm9hcmQgUyAoUkszMjg4KSBhbmQgYSBSb2NrNjQgKFJLMzMyOCkg
ZGV2aWNlLg0KVmVyeSBsaW1pdGVkIHRlc3Rpbmcgb24gYSBSb2NrIFBpIDQgKFJLMzM5OSkgdXNp
bmcgZWFybGllciB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNldCwNCkkgd2lsbCByZWRvIHNvbWUgUksz
Mzk5IHRlc3RpbmcgdG8gbWFrZSBzdXJlIGl0IGlzIG5vdCBvbmx5IFZQVTIgb24gUkszMzI4IHRo
YXQgd29ya3MuDQoNClJlZ2FyZHMsDQpKb25hcw0KDQo+DQo+IFRoYW5rcywNCj4gRXplcXVpZWwN
Cj4NCg0K
