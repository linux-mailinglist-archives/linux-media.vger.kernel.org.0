Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35511CFBB4
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 15:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfJHN5f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 09:57:35 -0400
Received: from mail-oln040092071042.outbound.protection.outlook.com ([40.92.71.42]:23685
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725839AbfJHN5f (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 09:57:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVlNN7E45FvGF8WyuUms7MgHarK6vHz5gmvARhzoVyLNHfbbALNMukGE1CMa7CfvoquJKzSxow2DR+8lfyDUJs6OjFaSG0xf9/eN3xCelnik8OE6ST3iY14QhD/xx89FoVeGIKu9Sv+EoRdTq3bcKCNhccRe92/eVEyx81JOiob/MS2aAfIH/c3BVDwugF+DR9Uv2grG9FX0TvfHDa+WS1xwrxtLpYDWVHT0eZxcmn6AbK7Ifin63j1T/J4JsRTFmRMmsGl2icuU/yWTPDSvG1PuEg0Pg08xAdkSBaVzMU71LK+ENxRptg9MbrQrPecPqkEgMk9kloBnjSpHXslC+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BfjDLKJ3fW/BwcHaVvOu/8wqAXKoJkWTq8C/GKchE0=;
 b=bzkH/0r4m6tkKxvjBaax1TDhTfa9vwq7Ay2WquZTPOFnCW6CeYe65+CNgPmBW+kVB4LDmyBfF0KTIFtLZhdtmf+g5BDFNzaE6pTR5l4QSHFwBN+Gvo3u/E4hIgniQ5Tj1IwI8zyvamW33L01H5tonxnvVV+HHQJMolIchtU43orFjjvA0Egu/b10fxJu5DrIeRMSxNVm8VPDv/EPe3ERUbOAMuopcAsHaXtL8VKEOw95kvfSGx9DEyDVt8e38BOEV2/xm/bMnMl3lv8clQQ1fdwYKHcjSFk4lAahgl5tgbwtGdB0Fnn4Q0g8ZLZdiLR97LrtNBG6Qzl4ozjuEYjrMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (10.152.20.55) by DB5EUR03HT044.eop-EUR03.prod.protection.outlook.com
 (10.152.21.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Tue, 8 Oct
 2019 13:57:32 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.53) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 13:57:31 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 13:57:31 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Topic: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Index: AQHVfTc5j58jepLQQEujLcDcYkaduadPgRaAgACVogCAADC1AIAAQ+GAgAA66IA=
Date:   Tue, 8 Oct 2019 13:57:31 +0000
Message-ID: <HE1PR06MB40112032B360DE217C939FB3AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com>
 <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
 <HE1PR06MB40111D7287970183CF6D0DD1AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5AqYsUJeM5tzOY3WNFRZu74k6Yst3TpxcfB61zZtaHJDA@mail.gmail.com>
In-Reply-To: <CAAFQd5AqYsUJeM5tzOY3WNFRZu74k6Yst3TpxcfB61zZtaHJDA@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0164.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::12) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:C7893E16B88365AE674CF6EB43CAB86851968A14CB133498E78D43FF17C0B7AB;UpperCasedChecksum:824575F27E521D9EDB2446C121D11F887505D1EB0B3D172D3F86B3A87CBAC655;SizeAsReceived:8478;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [nRSwxRi9Zm9de2qvhxEpKhgD3SA8wAz2]
x-microsoft-original-message-id: <1fae0aa2-1bad-73a6-ee5b-bc6df63b4ec8@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR03HT044:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8cE69E1a/wuURlvX63elNsu+Skpu8SELCljkeaHnDAghRls/H1p8wnae8xCZOda0d5XbrhHBd7gYip2LPjWZg0uEPbRtjjLMMI2kVQCCgrMVM64QCmrE4aucD79N0/Uy3hltgYF/ZKvfTT16EFzqZvCw6O1Rwz7rBcQsiMS7ToVkwCj1lZ1kvGfSUNWjzcEn
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <847A2C5297D88848A26211DE7C46DBF3@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 36169743-f4ff-4acd-b2f6-08d74bf77682
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 13:57:31.7554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT044
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0xMC0wOCAxMjoyNiwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDgs
IDIwMTkgYXQgMzoyMyBQTSBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+IHdyb3RlOg0K
Pj4gT24gMjAxOS0xMC0wOCAwNToyOSwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+Pj4gSGkgSm9uYXMs
DQo+Pj4NCj4+PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDM6MzMgQU0gSm9uYXMgS2FybG1hbiA8
am9uYXNAa3dpYm9vLnNlPiB3cm90ZToNCj4+Pj4gT24gMjAxOS0xMC0wNyAxOTo0NSwgRXplcXVp
ZWwgR2FyY2lhIHdyb3RlOg0KPj4+Pj4gRnJvbTogRnJhbmNvaXMgQnVlcmdpc3NlciA8ZmJ1ZXJn
aXNzZXJAY2hyb21pdW0ub3JnPg0KPj4+Pj4NCj4+Pj4+IFRoZSBzZXR0aW5nIG9mIHRoZSBtb3Rp
b24gdmVjdG9ycyB1c2FnZSBhbmQgdGhlIHNldHRpbmcgb2YgbW90aW9uDQo+Pj4+PiB2ZWN0b3Jz
IGFkZHJlc3MgYXJlIGN1cnJlbnRseSBkb25lIHVuZGVyIGRpZmZlcmVudCBjb25kaXRpb25zLg0K
Pj4+Pj4NCj4+Pj4+IFdoZW4gZGVjb2RpbmcgcHJlLXJlY29yZGVkIHZpZGVvcywgdGhpcyByZXN1
bHRzIG9mIGxlYXZpbmcgdGhlIG1vdGlvbg0KPj4+Pj4gdmVjdG9ycyBhZGRyZXNzIHVuc2V0LCBy
ZXN1bHRpbmcgaW4gZmF1bHR5IG1lbW9yeSBhY2Nlc3Nlcy4gRml4IGl0DQo+Pj4+PiBieSB1c2lu
ZyB0aGUgc2FtZSBjb25kaXRpb24gZXZlcnl3aGVyZSwgd2hpY2ggbWF0Y2hlcyB0aGUgcHJvZmls
ZXMNCj4+Pj4+IHRoYXQgc3VwcG9ydCBtb3Rpb24gdmVjdG9ycy4NCj4+Pj4gVGhpcyBkb2VzIG5v
dCBmdWxseSBtYXRjaCBoYW50cm8gc2RrOg0KPj4+Pg0KPj4+PiAgIGVuYWJsZSBkaXJlY3QgTVYg
d3JpdGluZyBhbmQgUE9DIHRhYmxlcyBmb3IgaGlnaC9tYWluIHN0cmVhbXMuDQo+Pj4+ICAgZW5h
YmxlIGl0IGFsc28gZm9yIGFueSAiYmFzZWxpbmUiIHN0cmVhbSB3aGljaCBoYXZlIG1haW4vaGln
aCB0b29scyBlbmFibGVkLg0KPj4+Pg0KPj4+PiAgIChzcHMtPnByb2ZpbGVfaWRjID4gNjYgJiYg
c3BzLT5jb25zdHJhaW5lZF9zZXQwX2ZsYWcgPT0gMCkgfHwNCj4+Pj4gICBzcHMtPmZyYW1lX21i
c19vbmx5X2ZsYWcgIT0gMSB8fA0KPj4+PiAgIHNwcy0+Y2hyb21hX2Zvcm1hdF9pZGMgIT0gMSB8
fA0KPj4+PiAgIHNwcy0+c2NhbGluZ19tYXRyaXhfcHJlc2VudF9mbGFnICE9IDAgfHwNCj4+Pj4g
ICBwcHMtPmVudHJvcHlfY29kaW5nX21vZGVfZmxhZyAhPSAwIHx8DQo+Pj4+ICAgcHBzLT53ZWln
aHRlZF9wcmVkX2ZsYWcgIT0gMCB8fA0KPj4+PiAgIHBwcy0+d2VpZ2h0ZWRfYmlfcHJlZF9pZGMg
IT0gMCB8fA0KPj4+PiAgIHBwcy0+dHJhbnNmb3JtOHg4X2ZsYWcgIT0gMCB8fA0KPj4+PiAgIHBw
cy0+c2NhbGluZ19tYXRyaXhfcHJlc2VudF9mbGFnICE9IDANCj4+PiBUaGFua3MgZm9yIGRvdWJs
ZSBjaGVja2luZyB0aGlzLiBJIGNhbiBjb25maXJtIHRoYXQgaXQncyB3aGF0IEhhbnRybw0KPj4+
IFNESyBkb2VzIGluZGVlZC4NCj4+Pg0KPj4+IEhvd2V2ZXIsIHdvdWxkIGEgc3RyZWFtIHdpdGgg
c3BzLT5wcm9maWxlX2lkYyA8PSA2NiBhbmQgdGhvc2Ugb3RoZXINCj4+PiBjb25kaXRpb25zIG1l
dCBiZSBzdGlsbCBhIGNvbXBsaWFudCBzdHJlYW0/DQo+PiBZb3UgYXJlIGNvcnJlY3QsIGlmIGEg
bm9uLWNvbXBsaWFudCB2aWRlbyBpcyBoYXZpbmcgZGVjb2RpbmcgcHJvYmxlbXMgaXQgc2hvdWxk
IHByb2JhYmx5IGJlIGhhbmRsZWQNCj4+IG9uIHVzZXJzcGFjZSBzaWRlIChieSBub3QgcmVwb3J0
aW5nIGJhc2VsaW5lIHByb2ZpbGUpIGFuZCBub3QgaW4ga2VybmVsLg0KPj4gQWxsIG15IHZpZGVv
IHNhbXBsZXMgdGhhdCB3YXMgaGF2aW5nIHRoZSBpc3N1ZSBmaXhlZCBpbiB0aGlzIHBhdGNoIGFy
ZSBub3cgZGVjb2RlZCBjb3JyZWN0bHkuDQo+Pg0KPj4+PiBBYm92ZSBjaGVjayBpcyB1c2VkIHdo
ZW4gRElSX01WX0JBU0Ugc2hvdWxkIGJlIHdyaXR0ZW4uDQo+Pj4+IEFuZCBXUklURV9NVlNfRSBp
cyBzZXQgdG8gbmFsX3JlZl9pZGMgIT0gMCB3aGVuIGFib3ZlIGlzIHRydWUuDQo+Pj4+DQo+Pj4+
IEkgdGhpbmsgaXQgbWF5IGJlIHNhZmVyIHRvIGFsd2F5cyBzZXQgRElSX01WX0JBU0UgYW5kIGtl
ZXAgdGhlIGV4aXN0aW5nIG5hbF9yZWZfaWRjIGNoZWNrIGZvciBXUklURV9NVlNfRS4NCj4+PiBU
aGF0IG1pZ2h0IGhhdmUgYSBwZXJmb3JtYW5jZSBwZW5hbHR5IG9yIHNvbWUgb3RoZXIgc2lkZSBl
ZmZlY3RzLA0KPj4+IHRob3VnaC4gT3RoZXJ3aXNlIEhhbnRybyBTREsgd291bGRuJ3QgaGF2ZSBl
bmFibGUgaXQgY29uZGl0aW9uYWxseS4NCj4+Pg0KPj4+PiAoVGhhdCBpcyB3aGF0IEkgZGlkIGlu
IG15ICJtZWRpYTogaGFudHJvOiBIMjY0IGZpeGVzIGFuZCBpbXByb3ZlbWVudHMiIHNlcmllcywg
djIgaXMgaW5jb21pbmcpDQo+Pj4+IE9yIGhhdmUgeW91IGZvdW5kIGFueSB2aWRlbyB0aGF0IGlz
IGhhdmluZyBpc3N1ZXMgaW4gc3VjaCBjYXNlPw0KPj4+IFdlJ3ZlIGJlZW4gcnVubmluZyB0aGUg
Y29kZSB3aXRoIHNwcy0+cHJvZmlsZV9pZGMgPiA2NiBpbiBwcm9kdWN0aW9uDQo+Pj4gZm9yIDQg
eWVhcnMgYW5kIGhhdmVuJ3Qgc2VlbiBhbnkgcmVwb3J0cyBvZiBhIHN0cmVhbSB0aGF0IHdhc24n
dA0KPj4+IGRlY29kZWQgY29ycmVjdGx5Lg0KPj4+DQo+Pj4gSWYgd2UgZGVjaWRlIHRvIGdvIHdp
dGggYSBkaWZmZXJlbnQgYmVoYXZpb3IsIEknZCBzdWdnZXN0IHRob3JvdWdobHkNCj4+PiB2ZXJp
ZnlpbmcgdGhlIGJlaGF2aW9yIG9uIGEgYmlnIG51bWJlciBvZiBzdHJlYW1zLCBpbmNsdWRpbmcg
c29tZQ0KPj4+IHBlcmZvcm1hbmNlIG1lYXN1cmVtZW50cy4NCj4+IEkgYWdyZWUsIEkgd291bGQg
aG93ZXZlciBzdWdnZXN0IHRvIGNoYW5nZSB0aGUgaWYgc3RhdGVtZW50IHRvIHRoZSBmb2xsb3dp
bmcgKG9yIHNpbWlsYXIpDQo+PiBhcyB0aGF0IHNob3VsZCBiZSB0aGUgb3B0aW1hbCBmb3IgcGVy
Zm9ybWFuY2UgcmVhc29ucyBhbmQgbWF0Y2ggdGhlIGhhbnRybyBzZGsuDQo+Pg0KPj4gaWYgKHNw
cy0+cHJvZmlsZV9pZGMgPiA2NiAmJiBkZWNfcGFyYW0tPm5hbF9yZWZfaWRjKQ0KPiBTb3JyeSBm
b3IgbXkgaWdub3JhbmNlLCBidXQgY291bGQgeW91IGVsYWJvcmF0ZSBvbiB0aGlzPyBXaGF0J3Mg
dGhlDQo+IG1lYW5pbmcgb2YgbmFsX3JlZl9pZGM/IEkgZG9uJ3Qgc2VlIGl0IGJlaW5nIGNoZWNr
ZWQgaW4gdGhlIEhhbnRybyBTREsNCj4gY29uZGl0aW9uIHlvdSBtZW50aW9uZWQgZWFybGllci4N
Cg0KTXkgc29tZXdoYXQgbGltaXRlZCB1bmRlcnN0YW5kaW5nIG9mIGgyNjQgc3BlYyBpcyB0aGF0
IG5hbF9yZWZfaWRjIHNob3VsZCBiZSAwIGZvciBub24tcmVmZXJlbmNlIGZpZWxkL2ZyYW1lL3Bp
Y3R1cmVzDQphbmQgYmVjYXVzZSBvZiB0aGlzIHRoZXJlIHNob3VsZCBub3QgYmUgYW55IG5lZWQg
dG8gd3JpdGUgbW90aW9uIHZlY3RvciBkYXRhIGFzIHRoZSBmaWVsZC9mcmFtZSBzaG91bGQgbm90
IGJlIHJlZmVyZW5jZWQuDQoNCk15IGJhc2UgZm9yIHRoZSBoYW50cm8gc2RrIGNvZGUgaXMgdGhl
IGlteDggaW14LXZwdS1oYW50cm8gcGFja2FnZSBhbmQgaXQgdXNlcyAoc2ltcGxpZmllZCk6DQrC
oCBTZXREZWNSZWdpc3RlcihoMjY0X3JlZ3MsIEhXSUZfV1JJVEVfTVZTX0UsIG5hbF9yZWZfaWRj
ICE9IDApDQpmb3IgTVZDIHRoZXJlIGlzIGFuIGFkZGl0aW9uYWwgY29uZGl0aW9uLg0KDQpSZWdh
cmRzLA0KSm9uYXMNCg0KPg0KPj4gUmVnYXJkcywNCj4+IEpvbmFzDQo+Pg0KPj4+IEJlc3QgcmVn
YXJkcywNCj4+PiBUb21hc3oNCj4+Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiBKb25hcw0KPj4+Pg0K
Pj4+Pj4gRml4ZXM6IGRlYTBhODJmM2QyMiAoIm1lZGlhOiBoYW50cm86IEFkZCBzdXBwb3J0IGZv
ciBIMjY0IGRlY29kaW5nIG9uIEcxIikNCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIEJ1
ZXJnaXNzZXIgPGZidWVyZ2lzc2VyQGNocm9taXVtLm9yZz4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+
Pj4gdjI6DQo+Pj4+PiAqIE5ldyBwYXRjaC4NCj4+Pj4+DQo+Pj4+PiAgZHJpdmVycy9zdGFnaW5n
L21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYyB8IDIgKy0NCj4+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+DQo+Pj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMu
YyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50cm8vaGFudHJvX2cxX2gyNjRfZGVjLmMNCj4+
Pj4+IGluZGV4IDdhYjUzNDkzNjg0My4uYzkyNDYwNDA3NjEzIDEwMDY0NA0KPj4+Pj4gLS0tIGEv
ZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYw0KPj4+Pj4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYw0K
Pj4+Pj4gQEAgLTM1LDcgKzM1LDcgQEAgc3RhdGljIHZvaWQgc2V0X3BhcmFtcyhzdHJ1Y3QgaGFu
dHJvX2N0eCAqY3R4KQ0KPj4+Pj4gICAgICAgaWYgKHNwcy0+ZmxhZ3MgJiBWNEwyX0gyNjRfU1BT
X0ZMQUdfTUJfQURBUFRJVkVfRlJBTUVfRklFTEQpDQo+Pj4+PiAgICAgICAgICAgICAgIHJlZyB8
PSBHMV9SRUdfREVDX0NUUkwwX1NFUV9NQkFGRl9FOw0KPj4+Pj4gICAgICAgcmVnIHw9IEcxX1JF
R19ERUNfQ1RSTDBfUElDT1JEX0NPVU5UX0U7DQo+Pj4+PiAtICAgICBpZiAoZGVjX3BhcmFtLT5u
YWxfcmVmX2lkYykNCj4+Pj4+ICsgICAgIGlmIChzcHMtPnByb2ZpbGVfaWRjID4gNjYpDQo+Pj4+
PiAgICAgICAgICAgICAgIHJlZyB8PSBHMV9SRUdfREVDX0NUUkwwX1dSSVRFX01WU19FOw0KPj4+
Pj4NCj4+Pj4+ICAgICAgIGlmICghKHNwcy0+ZmxhZ3MgJiBWNEwyX0gyNjRfU1BTX0ZMQUdfRlJB
TUVfTUJTX09OTFkpICYmDQoNCg==
