Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68E63CF2C1
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 08:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbfJHGcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 02:32:20 -0400
Received: from mail-oln040092065019.outbound.protection.outlook.com ([40.92.65.19]:47141
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729693AbfJHGcU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 02:32:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe9w1z2MReSrkD3k+eVAbiVsRmD5RmFQmLVqxu9rug0JdxwJa9dMD+4BvpMBA9n5fSyDIQv7RdeNtZWQa+dJJtm9+WNJwxH1NoUQ6AeDcSJOFu3GXaKvH3YtkCDHpNXW6F/mkxKp1gIc77KV4ZelV6IedVEgDqrwE+/1w0MlE6unbk28vWO4OE5c+lV6pJYy2ON/CkDRoeNpnDVNZrRxkj2fF/+2vvJHcIHM6WaZ3BEY3sHbig28fsP9Cmevj4dmH4s+9v9WOl7Wxo/JysfyspJRRN6D+2pABvwXG6a3Z+qFFLAH5HIswWzEPf6LUMWS0FJQdj4537eBeiZtaMCjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gqdEB80K9SoY3kDFPxpeKqjNS4mjj8KPbgJPb7lotU=;
 b=m9bejfKdpqUegC7XqcBZfLrs+rp7jGDzirjd2TZpOCcwIw+UYAYqe0uJdb4n3cWzGgDwYkvBb+6P/O9CofG1YiOBn6fXmmNsL5LGbQS4+TH1K1KakZOfrgG+uX/ClNmH+tBYHvZy36PgN0lgBwkWkWHcBLTX/Dnjzj9bgDEVwOk5IZpz7ISMBee+q2u3bN1X8aAD2xkPCxSojOj5PSx9ERMAf6jZo9pK7rQVXd4lKLfseX/2vRaAiAWQ7QzQ4suUz6nolcKzT/y1PpVqHvDtDdtLjrJExM06iq8L14rQc7Z1UB6l53XDC48L8LqEA/ZQv13OigloielH+GlwulQ/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR01FT008.eop-EUR01.prod.protection.outlook.com
 (10.152.2.54) by VE1EUR01HT037.eop-EUR01.prod.protection.outlook.com
 (10.152.3.128) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Tue, 8 Oct
 2019 06:31:34 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.2.51) by
 VE1EUR01FT008.mail.protection.outlook.com (10.152.2.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Tue, 8 Oct 2019 06:31:34 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 06:31:34 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Topic: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Index: AQHVfTc2RvTWvQQ6Z06gn22kTgvMXqdQN9WAgAARyQA=
Date:   Tue, 8 Oct 2019 06:31:34 +0000
Message-ID: <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com>
 <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
In-Reply-To: <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0059.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::36) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:281F0C36E430B8F36F04439000A3DBC16333D9CC187911F94A78B18B22AD256B;UpperCasedChecksum:C1A417F2D729E2DCD15B2C0D6BA3B5B330B226231AFD8AD3B0733E810954AA92;SizeAsReceived:8242;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [lvFo+0uTl8sYwypXXBa2TCKeqijFnHGw]
x-microsoft-original-message-id: <1489a28d-66d8-7ef5-538a-578f47991801@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR01HT037:
x-ms-exchange-purlcount: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vx6jkpNRG82vqj8k7nXsxg9kNuWK2eNTRoXBV5gVT7SP8OJ1vSLgnmZVs+gbYNeDJUo0DnFLYNcQy97Z4FfteR48lE+vCW3pFRRjq4QUTAG5Y/VlP9r2bHqOR/LQKDYFXM7kA2/XpoIQGe0keP3YvRopCWhpkFa0hDKDhyC6FtdD/0F53ur8w38q+V91yxocDgkjxZKunetW+hPfx0DGdLRoYxBDiOsc/YIFoPi0eoA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <10B199680F83BE4F8A7AF0D78CC0BF51@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c415ce-de24-44a9-8a39-08d74bb929e3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 06:31:34.2993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT037
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0xMC0wOCAwNzoyNywgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IEhpIEV6ZXF1aWVsLCBK
b25hcywNCj4NCj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCAyOjQ2IEFNIEV6ZXF1aWVsIEdhcmNp
YSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4gd3JvdGU6DQo+PiBGcm9tOiBKb25hcyBLYXJsbWFu
IDxqb25hc0Brd2lib28uc2U+DQo+Pg0KPj4gVFJNIHNwZWNpZnkgc3VwcG9ydGVkIGltYWdlIHNp
emUgNDh4NDggdG8gNDA5NngyMzA0IGF0IHN0ZXAgc2l6ZSAxNiBwaXhlbHMsDQo+PiBjaGFuZ2Ug
ZnJtc2l6ZSBtYXhfd2lkdGgvbWF4X2hlaWdodCB0byBtYXRjaCBUUk0uDQo+Pg0KPj4gRml4ZXM6
IDc2MDMyNzkzMGUxMCAoIm1lZGlhOiBoYW50cm86IEVuYWJsZSBIMjY0IGRlY29kaW5nIG9uIHJr
MzI4OCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+
DQo+PiAtLS0NCj4+IHYyOg0KPj4gKiBObyBjaGFuZ2VzLg0KPj4NCj4+ICBkcml2ZXJzL3N0YWdp
bmcvbWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYyB8IDQgKystLQ0KPj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50cm8vcmszMjg4X3ZwdV9ody5jIGIvZHJpdmVycy9z
dGFnaW5nL21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMNCj4+IGluZGV4IDZiZmNjNDdkMWU1
OC4uZWJiMDE3YjhhMzM0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2hh
bnRyby9yazMyODhfdnB1X2h3LmMNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9oYW50
cm8vcmszMjg4X3ZwdV9ody5jDQo+PiBAQCAtNjcsMTAgKzY3LDEwIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaGFudHJvX2ZtdCByazMyODhfdnB1X2RlY19mbXRzW10gPSB7DQo+PiAgICAgICAgICAg
ICAgICAgLm1heF9kZXB0aCA9IDIsDQo+PiAgICAgICAgICAgICAgICAgLmZybXNpemUgPSB7DQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAubWluX3dpZHRoID0gNDgsDQo+PiAtICAgICAgICAg
ICAgICAgICAgICAgICAubWF4X3dpZHRoID0gMzg0MCwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIC5tYXhfd2lkdGggPSA0MDk2LA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgLnN0ZXBf
d2lkdGggPSBIMjY0X01CX0RJTSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC5taW5faGVp
Z2h0ID0gNDgsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAubWF4X2hlaWdodCA9IDIxNjAs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAubWF4X2hlaWdodCA9IDIzMDQsDQo+IFRoaXMg
ZG9lc24ndCBtYXRjaCB0aGUgZGF0YXNoZWV0IEkgaGF2ZSwgd2hpY2ggaXMgUkszMjg4IERhdGFz
aGVldCBSZXYNCj4gMS40IGFuZCB3aGljaCBoYXMgdGhlIHZhbHVlcyBhcyBpbiBjdXJyZW50IGNv
ZGUuIFdoYXQncyB0aGUgb25lIHlvdQ0KPiBnb3QgdGhlIHZhbHVlcyBmcm9tPw0KDQpUaGUgUksz
Mjg4IFRSTSB2Y29kZWMgY2hhcHRlciBmcm9tIFsxXSwgdW5rbm93biByZXZpc2lvbiBhbmQgZGF0
ZSwgbGlzdHMgNDh4NDggdG8gNDA5NngyMzA0IHN0ZXAgc2l6ZSAxNiBwaXhlbHMgdW5kZXIgMjUu
NS4xIEguMjY0IGRlY29kZXIuDQoNCkkgY2FuIGFsc28gY29uZmlybSB0aGF0IG9uZSBvZiBteSB0
ZXN0IHNhbXBsZXMgKFBVUFBJRVMgQkFUSCBJTiA0SykgaXMgNDA5NngyMzA0IGFuZCBjYW4gYmUg
ZGVjb2RlZCBhZnRlciB0aGlzIHBhdGNoLg0KSG93ZXZlciB0aGUgZGVjb2Rpbmcgc3BlZWQgaXMg
bm90IG9wdGltYWwgYXQgNDAwTWh6LCBpZiBJIHJlY2FsbCBjb3JyZWN0bHkgeW91IG5lZWQgdG8g
c2V0IHRoZSBWUFUxIGNsb2NrIHRvIDYwME1oeiBmb3IgNEsgZGVjb2Rpbmcgb24gUkszMjg4Lg0K
DQpJIGFtIG5vdCBzdXJlIGlmIEkgc2hvdWxkIGluY2x1ZGUgYSB2MiBvZiB0aGlzIHBhdGNoIGlu
IG15IHYyIHNlcmllcywgYXMtaXMgdGhpcyBwYXRjaCBkbyBub3QgYXBwbHkgb24gbWFzdGVyIChI
MjY0X01CX0RJTSBoYXMgY2hhbmdlZCB0byBNQl9ESU0gaW4gbWFzdGVyKS4NCg0KWzFdIGh0dHA6
Ly93d3cudC1maXJlZmx5LmNvbS9kb3dubG9hZC9maXJlZmx5LXJrMzI4OC9kb2NzL1RSTS9yazMy
ODgtY2hhcHRlci0yNS12aWRlby1lbmNvZGVyLWRlY29kZXItdW5pdC0odmNvZGVjKS5wZGYNCg0K
UmVnYXJkcywNCkpvbmFzDQoNCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K
