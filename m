Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 096062D839
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 10:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbfE2IuU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 04:50:20 -0400
Received: from mail-oln040092064086.outbound.protection.outlook.com ([40.92.64.86]:11589
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbfE2IuT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 04:50:19 -0400
Received: from VE1EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (10.152.2.53) by VE1EUR01HT068.eop-EUR01.prod.protection.outlook.com
 (10.152.3.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16; Wed, 29 May
 2019 08:50:15 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com (10.152.2.54) by
 VE1EUR01FT061.mail.protection.outlook.com (10.152.3.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 29 May 2019 08:50:15 +0000
Received: from VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0]) by VI1PR03MB4206.eurprd03.prod.outlook.com
 ([fe80::883e:1bd6:cd36:5fb0%4]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 08:50:15 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
CC:     "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v6 16/16] rockchip/vpu: Add support for MPEG-2 decoding on
 RK3328
Thread-Topic: [PATCH v6 16/16] rockchip/vpu: Add support for MPEG-2 decoding
 on RK3328
Thread-Index: AQHVFXdhpRepMa94eEGuSMAzTBHJuKaBwT4AgAAK3gA=
Date:   Wed, 29 May 2019 08:50:15 +0000
Message-ID: <VI1PR03MB42066B8C9F364ACF7CFFF241AC1F0@VI1PR03MB4206.eurprd03.prod.outlook.com>
References: <20190528170232.2091-1-ezequiel@collabora.com>
 <20190528170232.2091-17-ezequiel@collabora.com>
 <2ef056a2-e9dc-52b1-855b-2bef759af9b6@xs4all.nl>
In-Reply-To: <2ef056a2-e9dc-52b1-855b-2bef759af9b6@xs4all.nl>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR05CA0359.eurprd05.prod.outlook.com
 (2603:10a6:7:94::18) To VI1PR03MB4206.eurprd03.prod.outlook.com
 (2603:10a6:803:51::23)
x-incomingtopheadermarker: OriginalChecksum:20A87F0BA1C3D2FB3B744FC7DFCAEB88EE81604F598F3826906A6AF854513679;UpperCasedChecksum:182735A26054809C3C58B62960D6A0A5BC036E699FD56A4DB264A3E87378954E;SizeAsReceived:7981;Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [Xx/JXVj35Kcj/12GZKRSDQfqtdc5X1Hi]
x-microsoft-original-message-id: <7125752d-474a-de74-5433-51070cf8e63f@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);SRVR:VE1EUR01HT068;
x-ms-traffictypediagnostic: VE1EUR01HT068:
x-microsoft-antispam-message-info: w+Q/k/VRgEhFMmueK1zvC8XeGZNxealZjDC0fqeS2z7t43DB7vUhbWY1dfcBhS0GDwdEqVl7kMUkFBVxyQEVGTbQEuZwsJg7QH3T+CdgOE1ussXTn5VTck/8TDIqEAKf2ZfSNjMM3WNYVjhplhBrtOIHQqWc09aywjb8D49U/zorsUaKWsVwMpaOXV/4/yvZ
Content-Type: text/plain; charset="utf-8"
Content-ID: <992634C6FE8AB649B52E07A020C1542B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 57147df8-b5d3-4747-fd26-08d6e412aa9b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 08:50:15.1502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT068
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0wNS0yOSAxMDoxMSwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBPbiA1LzI4LzE5IDc6
MDIgUE0sIEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4+IEZyb206IEpvbmFzIEthcmxtYW4gPGpv
bmFzQGt3aWJvby5zZT4NCj4+DQo+PiBBZGQgbmVjZXNzYXJ5IGJpdHMgdG8gc3VwcG9ydCBNUEVH
MiBkZWNvZGluZyBvbiBSSzMzMjguDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9uYXMgS2FybG1h
biA8am9uYXNAa3dpYm9vLnNlPg0KPj4gU2lnbmVkLW9mZi1ieTogRXplcXVpZWwgR2FyY2lhIDxl
emVxdWllbEBjb2xsYWJvcmEuY29tPg0KPj4gLS0NCj4+IENoYW5nZXMgZnJvbSB2NToNCj4+ICog
TmV3IHBhdGNoLg0KPj4NCj4+ICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvcm9ja2NoaXAvdnB1L3Jr
MzM5OV92cHVfaHcuYyAgIHwgMTIgKysrKysrKysrKysrDQo+PiAgLi4uL3N0YWdpbmcvbWVkaWEv
cm9ja2NoaXAvdnB1L3JvY2tjaGlwX3ZwdV9kcnYuYyAgICB8ICAxICsNCj4+ICBkcml2ZXJzL3N0
YWdpbmcvbWVkaWEvcm9ja2NoaXAvdnB1L3JvY2tjaGlwX3ZwdV9ody5oIHwgIDEgKw0KPj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvbWVkaWEvcm9ja2NoaXAvdnB1L3JrMzM5OV92cHVfaHcuYyBiL2RyaXZlcnMv
c3RhZ2luZy9tZWRpYS9yb2NrY2hpcC92cHUvcmszMzk5X3ZwdV9ody5jDQo+PiBpbmRleCAyYjM2
ODk5NjhlZjQuLjM0MWY4ZDY5YzMzZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9t
ZWRpYS9yb2NrY2hpcC92cHUvcmszMzk5X3ZwdV9ody5jDQo+PiArKysgYi9kcml2ZXJzL3N0YWdp
bmcvbWVkaWEvcm9ja2NoaXAvdnB1L3JrMzM5OV92cHVfaHcuYw0KPj4gQEAgLTE3NSwzICsxNzUs
MTUgQEAgY29uc3Qgc3RydWN0IHJvY2tjaGlwX3ZwdV92YXJpYW50IHJrMzM5OV92cHVfdmFyaWFu
dCA9IHsNCj4+ICAJLmNsa19uYW1lcyA9IHsiYWNsayIsICJoY2xrIn0sDQo+PiAgCS5udW1fY2xv
Y2tzID0gMg0KPj4gIH07DQo+PiArDQo+PiArY29uc3Qgc3RydWN0IHJvY2tjaGlwX3ZwdV92YXJp
YW50IHJrMzMyOF92cHVfdmFyaWFudCA9IHsNCj4+ICsJLmRlY19vZmZzZXQgPSAweDQwMCwNCj4+
ICsJLmRlY19mbXRzID0gcmszMzk5X3ZwdV9kZWNfZm10cywNCj4+ICsJLm51bV9kZWNfZm10cyA9
IEFSUkFZX1NJWkUocmszMzk5X3ZwdV9kZWNfZm10cyksDQo+PiArCS5jb2RlYyA9IFJLX1ZQVV9N
UEVHMl9ERUNPREVSLA0KPj4gKwkuY29kZWNfb3BzID0gcmszMzk5X3ZwdV9jb2RlY19vcHMsDQo+
PiArCS52ZHB1X2lycSA9IHJrMzM5OV92ZHB1X2lycSwNCj4+ICsJLmluaXQgPSByazMzOTlfdnB1
X2h3X2luaXQsDQo+PiArCS5jbGtfbmFtZXMgPSB7ImFjbGsiLCAiaGNsayJ9LA0KPj4gKwkubnVt
X2Nsb2NrcyA9IDINCj4+ICt9Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9yb2NrY2hpcC92cHUvcm9ja2NoaXBfdnB1X2Rydi5jIGIvZHJpdmVycy9zdGFnaW5nL21lZGlh
L3JvY2tjaGlwL3ZwdS9yb2NrY2hpcF92cHVfZHJ2LmMNCj4+IGluZGV4IGI5NGZmOTc0NTFkYi4u
MmUyMjAwOWI2NTgzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3JvY2tj
aGlwL3ZwdS9yb2NrY2hpcF92cHVfZHJ2LmMNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRp
YS9yb2NrY2hpcC92cHUvcm9ja2NoaXBfdnB1X2Rydi5jDQo+PiBAQCAtNDE5LDYgKzQxOSw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9maWxlX29wZXJhdGlvbnMgcm9ja2NoaXBfdnB1X2Zv
cHMgPSB7DQo+PiAgDQo+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2Zfcm9j
a2NoaXBfdnB1X21hdGNoW10gPSB7DQo+PiAgCXsgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscmsz
Mzk5LXZwdSIsIC5kYXRhID0gJnJrMzM5OV92cHVfdmFyaWFudCwgfSwNCj4+ICsJeyAuY29tcGF0
aWJsZSA9ICJyb2NrY2hpcCxyazMzMjgtdnB1IiwgLmRhdGEgPSAmcmszMzI4X3ZwdV92YXJpYW50
LCB9LA0KPiBUaGlzIG5ldyBjb21wYXRpYmxlIHN0cmluZyBzaG91bGQgYmUgZG9jdW1lbnRlZCBp
bg0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvcm9ja2NoaXAtdnB1
LnR4dCBhcyB3ZWxsLg0KPg0KPiBJJ2xsIHRha2UgcGF0Y2hlcyAxLTE1IGFuZCBkcm9wIHRoaXMg
b25lLiBUaGlzIHBhdGNoIGNhbiBiZSBtZXJnZWQgb25jZQ0KPiB0aGUgYmluZGluZ3MgZmlsZSBp
cyB1cGRhdGVkIGFzIHdlbGwuDQoNCkxvb2tzIGxpa2UgdGhlIGJpbmRpbmdzIHBhdGNoIGRpZCBu
b3QgZ2V0IHBpY2tlZCBmb3IgdjYgOi0pDQoNCkkgYW0gYSBiaXQgdW5jbGVhciBvbiBob3cgdG8g
aGFuZGxlIHBhdGNoIHN1Ym1pc3Npb24gdGhhdCBjb3ZlcnMgbXVsdGlwbGUgc3VidHJlZXMuDQpT
aG91bGQgSSBzZW5kIGEgc2luZ2xlIHNlcmllcyBpbmNsdWRpbmcgdGhyZWUgcGF0Y2hlczogYmlu
ZGluZ3MgdXBkYXRlLCB0aGlzIHBhdGNoIGFuZCBkZXZpY2UgdHJlZSB1cGRhdGU/DQpPciBpcyBh
IHNlcmllcyB3aXRoIG9ubHkgYmluZGluZ3MgdXBkYXRlIGFuZCB0aGlzIHBhdGNoIHByZWZlcnJl
ZD8NCg0KUmVnYXJkcywNCkpvbmFzDQoNCj4NCj4gUmVnYXJkcywNCj4NCj4gCUhhbnMNCj4NCj4+
ICAJeyAuY29tcGF0aWJsZSA9ICJyb2NrY2hpcCxyazMyODgtdnB1IiwgLmRhdGEgPSAmcmszMjg4
X3ZwdV92YXJpYW50LCB9LA0KPj4gIAl7IC8qIHNlbnRpbmVsICovIH0NCj4+ICB9Ow0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9yb2NrY2hpcC92cHUvcm9ja2NoaXBfdnB1
X2h3LmggYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvcm9ja2NoaXAvdnB1L3JvY2tjaGlwX3ZwdV9o
dy5oDQo+PiBpbmRleCA2Y2VjYjUyOGY5OTQuLjNkNmI5N2FmOTBmYiAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9yb2NrY2hpcC92cHUvcm9ja2NoaXBfdnB1X2h3LmgNCj4+
ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9yb2NrY2hpcC92cHUvcm9ja2NoaXBfdnB1X2h3
LmgNCj4+IEBAIC03OSw2ICs3OSw3IEBAIGVudW0gcm9ja2NoaXBfdnB1X2VuY19mbXQgew0KPj4g
IH07DQo+PiAgDQo+PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCByb2NrY2hpcF92cHVfdmFyaWFudCBy
azMzOTlfdnB1X3ZhcmlhbnQ7DQo+PiArZXh0ZXJuIGNvbnN0IHN0cnVjdCByb2NrY2hpcF92cHVf
dmFyaWFudCByazMzMjhfdnB1X3ZhcmlhbnQ7DQo+PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCByb2Nr
Y2hpcF92cHVfdmFyaWFudCByazMyODhfdnB1X3ZhcmlhbnQ7DQo+PiAgDQo+PiAgdm9pZCByb2Nr
Y2hpcF92cHVfd2F0Y2hkb2coc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKTsNCj4+DQoNCg==
