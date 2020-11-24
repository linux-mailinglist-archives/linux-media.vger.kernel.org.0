Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BAB2C2B46
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 16:29:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389371AbgKXP2B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 10:28:01 -0500
Received: from mail-eopbgr150085.outbound.protection.outlook.com ([40.107.15.85]:47168
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730898AbgKXP2A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 10:28:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkdJ03n00v75yHNSAP5QZax53TwKsrsoVR9x6nVXjU8kZXUIMpmdJviteD76olyqcHBaeOgwSiOaZbnWAJGIF4UuluI2w7D1XLTGTlfLG1hvjCXr7KlAnKYaDT/DKWMyEw4Vwos8qODgQSypOkcsS5L0IA3tvnt5YoLg9ReHU3o9ItLQHvuxzcA2JlT1Wq+gEZRx0FfRpssZvBWpcQEF9Nz5DTrSmdEvJi+uEHL1E6S6IeXRyZysYa1CDekutuIzbcm4lGRVIUtatW3cYzIWLTSCV30ncEsfk5h/ckQMzGAeaQ+KjhWHQrKyxSLBk/jLRkxS5lCmqNqzjFuFIo7LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWeQ148sbs+n4f3NMNmeiQIkPStQpDVvV49KJz/FyJQ=;
 b=JIVnB19ii8Djk1dE9IlZBTlLY6wi0kt3HUJjw4CThO7Xz9uJDy54xVNmheMUYQDtIvXiMsvrrjkkg6lwFaD8ut3tDhRW8ugLm94nkEMlj+/8Zt1qzt+7jaXY5dWwlk8DZ9vwMlu4vxyOML5hmpcR7VVkDzBnV9u7LKJOSm3YDLDO7VBLs5GEZDWibmrtFMNA75KMqI3hb48XPzY9w4Xs/vzyMebTN02eMYei7ZNMBSaVdT0PMViY7vpQw4fUqckG2xkSAiCF/ejN3+eQQPQwOVqGtWMg9aQ6CCPhPWvfVVDMCt98qQiB1BQ92RSNe9x3mzN1kASseU/l8aXvszlQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWeQ148sbs+n4f3NMNmeiQIkPStQpDVvV49KJz/FyJQ=;
 b=KVQ7sDIMO5hE56B5SNwVMPAW89V0/wOmlQY1v8aQ+QOjSFHGydwei4mlFgcLwPHrpbMmiZM9iZAvCks5uO4oxTFcOM5+fYPB5UvngSp9RLevurlDTpBAwskzkwF+vLCR6uj5K3YUEQptpIa2saHXsM9MWk5r8RXqYattZCJWfY4=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 15:27:52 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 15:27:52 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 07/10] media: Add parsing for APP14 data segment in
 jpeg helpers
Thread-Topic: [PATCH v5 07/10] media: Add parsing for APP14 data segment in
 jpeg helpers
Thread-Index: AQHWuKDqyfB9auL2qEC7/KHmF1dk4KnXe3yA
Date:   Tue, 24 Nov 2020 15:27:52 +0000
Message-ID: <2e109a63daca967083eef97abf909bcdcab89107.camel@nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b1b06ff7-2213-4850-95c3-08d8908d8236
x-ms-traffictypediagnostic: AM6PR04MB5623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5623B734FBE1007C29290D248FFB0@AM6PR04MB5623.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fU8wR2xxjJsM7YsNRNRoFCfR1NeZ1nxJmGJrDLW89T5TRTLFL55uQPDvPCHTRxHJEnTVKjFS7FkxKKbvNXMD085TEJN81jk0C6haRcu5VZ5JuFpYh/Jqx1Nf2zHLxO4vNFUz/QDf/yHvf+C7vCHwy9neut8YMzfjJGvkb1EC3rpzDKXYXBD6RmTYA4QsahHGEdRDiEXtAJONMk4k5gRH4natEwhmEAJ2+tnuZWsI3/nint/Edns8a+UOeDsXbJ0WZrlo4lrKw5SZIuxCoG9dh2jm2uY3w+fxz++yCC8XfROe5oBs6uNwxpm/X+AnXZ3YYqd50madGNYTF0CWzU26QbZmeFWLdg+wkZDmdHY1qpFPRmip4iUzoxJAsuzopA8w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(110136005)(498600001)(2906002)(83380400001)(6506007)(186003)(6512007)(4001150100001)(26005)(8936002)(44832011)(54906003)(2616005)(66556008)(66446008)(5660300002)(76116006)(8676002)(64756008)(7416002)(66476007)(66946007)(36756003)(86362001)(4326008)(6486002)(91956017)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Z5Ru0rRNSXyLcXciWgXn5SV2/ikUx036AtRb2K0zbSnX++143+X1pJc2A28F2t4t1yULcPcQTjGvgO0FYmMtUVX95miqD1+/hUdr6az/cylBNvIJdX9hpVivhibAAwKP4PaZ68nwBB1sm7qbOcSYBlkFaeCp/DLp262xM2JEf751ZZEL3cZXQ8dNgBFDRL65w7PhiTIdAm1JS4tpyqYy54xlHIK0T2hWjPqxrHxAzBJY7gO7BpCBS37rG347lmO09YYnoFa6sayrnPvmsphjh63LzLfM5usq5Oul35Q1ehZtVPGkJFFXWJGdoJNLtXo0aB8No8UIOhURHlQFj2XBCmJscpDAl/IPydYSNejXTnu/OE4gQi++OvdkoJVZz2dOlt+VtiKxTbe2knoWwqBjCeI4X8FLrCddXdBNuk4jbrELJ0CPOOh38WryrWgVLD8hsvsW8ONajyQrf3VVmp7lyAJ4o/UWgyKtD8IApf6iM5BbSZjyfXcRkppKIiqnXH/NiiqgTBZKEPbsDoGZnI1ix7EfwtqGEj/PDgRQ66NvXe7RCoxV6NrjDpLvEIwiB4y/gUEyPnId4+hHVVTT4kOfqIhUxar7k/ggcfLtnWiuHer6RGhEr447tl/56Lw6HS2V92eqpkwXDs/D8fU+BHN9zJuW6ifIiPTDjqPiQyIGhIEQzgpGonwQNTCDuhNBna+EKPcnAs0aRHGrBpI4lS24zRGAIHbgKbNm5X8O3OoxHavbZMFbtEYlqeJi9sPtHAH/g1fMPGVZOEYFEHntjSr2ZKjy9qYPo/fr9hd7eOrpd+gAClnO7/8tRL4nQOpyuQ7c5MiyyPU5mJ1LLrba6kJLhh2EztSAr8Dcv4dxRLxEo4C1y84BxVBt8XEen+rECLhyQ3HBKNMrx5zq9Et4VBGv8w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3D54137D12A274CB56E2A7C97C392B1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b06ff7-2213-4850-95c3-08d8908d8236
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 15:27:52.1049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hzxq8mD2ZInYxPMK4TyZqpjDLOQy2NqcS6CheH1YNamqdKT7mi/L4H0UUJBzmBXMcfbu9pUq4cGrDXH6WGsXKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5623
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpbGlwcCwNCmFueSB0aG91Z2h0cyBvbiB0aGUganBlZyBoZWxwZXJzIHJlbGF0ZWQgcGF0
Y2hlcyBmcm9tIHRoaXMgcGF0Y2ggc2V0DQooNyw4LDksMTApPw0KDQpUaGFua3MsDQpNaXJlbGEN
Cg0KT24gVGh1LCAyMDIwLTExLTEyIGF0IDA1OjA1ICswMjAwLCBNaXJlbGEgUmFidWxlYSAoT1NT
KSB3cm90ZToNCj4gRnJvbTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+
DQo+IA0KPiBBY2NvcmRpbmcgdG8gUmVjLiBJVFUtVCBULjg3MiAoMDYvMjAxMikgNi41LjMNCj4g
QVBQMTQgc2VnbWVudCBpcyBmb3IgY29sb3IgZW5jb2RpbmcsIGl0IGNvbnRhaW5zIGEgdHJhbnNm
b3JtIGZsYWcsDQo+IHdoaWNoDQo+IG1heSBoYXZlIHZhbHVlcyBvZiAwLCAxIGFuZCAyIGFuZCBh
cmUgaW50ZXJwcmV0ZWQgYXMgZm9sbG93czoNCj4gMCAtIENNWUsgZm9yIGltYWdlcyB0aGF0IGFy
ZSBlbmNvZGVkIHdpdGggZm91ciBjb21wb25lbnRzDQo+ICAgLSBSR0IgZm9yIGltYWdlcyB0aGF0
IGFyZSBlbmNvZGVkIHdpdGggdGhyZWUgY29tcG9uZW50cw0KPiAxIC0gQW4gaW1hZ2UgZW5jb2Rl
ZCB3aXRoIHRocmVlIGNvbXBvbmVudHMgdXNpbmcgWUNiQ3IgY29sb3VyDQo+IGVuY29kaW5nLg0K
PiAyIC0gQW4gaW1hZ2UgZW5jb2RlZCB3aXRoIGZvdXIgY29tcG9uZW50cyB1c2luZyBZQ0NLIGNv
bG91ciBlbmNvZGluZy4NCj4gDQo+IFRoaXMgaXMgdXNlZCBpbiBpbXgtanBlZyBkZWNvZGVyLCB0
byBkaXN0aW5ndWlzaCBiZXR3ZWVuDQo+IFlVVjQ0NCBhbmQgUkdCMjQuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gLS0tDQo+
IENoYW5nZXMgaW4gdjU6DQo+IFRoaXMgd2FzIHBhdGNoIDggaW4gcHJldmlvdXMgdmVyc2lvbg0K
PiBSZXBsYWNlZCBhIHN0cnVjdCBmb3IgYXBwMTQgZGF0YSB3aXRoIGp1c3QgYW4gaW50LCBzaW5j
ZSB0aGUgDQo+IHRyYW5zZm9ybSBmbGFnIGlzIHRoZSBvbmx5IG1lYW5pbmdmdWxsIGluZm9ybWF0
aW9uIGZyb20gdGhpcyBzZWdtZW50DQo+IA0KPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1qcGVnLmMgfCAzOQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgaW5jbHVk
ZS9tZWRpYS92NGwyLWpwZWcuaCAgICAgICAgICAgfCAgNiArKystLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA0MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItanBlZy5jDQo+IGIvZHJpdmVycy9tZWRpYS92
NGwyLWNvcmUvdjRsMi1qcGVnLmMNCj4gaW5kZXggODk0N2ZkOTVjNmYxLi4zMTgxY2U1NDRmNzkg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItanBlZy5jDQo+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItanBlZy5jDQo+IEBAIC00NSw2ICs0NSw3
IEBAIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gICNkZWZpbmUgREhQCTB4ZmZkZQkvKiBoaWVy
YXJjaGljYWwgcHJvZ3Jlc3Npb24gKi8NCj4gICNkZWZpbmUgRVhQCTB4ZmZkZgkvKiBleHBhbmQg
cmVmZXJlbmNlICovDQo+ICAjZGVmaW5lIEFQUDAJMHhmZmUwCS8qIGFwcGxpY2F0aW9uIGRhdGEg
Ki8NCj4gKyNkZWZpbmUgQVBQMTQJMHhmZmVlCS8qIGFwcGxpY2F0aW9uIGRhdGEgZm9yIGNvbG91
cg0KPiBlbmNvZGluZyAqLw0KPiAgI2RlZmluZSBBUFAxNQkweGZmZWYNCj4gICNkZWZpbmUgSlBH
MAkweGZmZjAJLyogZXh0ZW5zaW9ucyAqLw0KPiAgI2RlZmluZSBKUEcxMwkweGZmZmQNCj4gQEAg
LTQ0NCw4ICs0NDUsMzcgQEAgc3RhdGljIGludCBqcGVnX3NraXBfc2VnbWVudChzdHJ1Y3QganBl
Z19zdHJlYW0NCj4gKnN0cmVhbSkNCj4gIAlyZXR1cm4ganBlZ19za2lwKHN0cmVhbSwgbGVuIC0g
Mik7DQo+ICB9DQo+ICANCj4gKy8qIFJlYy4gSVRVLVQgVC44NzIgKDA2LzIwMTIpIDYuNS4zICov
DQo+ICtzdGF0aWMgaW50IGpwZWdfcGFyc2VfYXBwMTRfZGF0YShzdHJ1Y3QganBlZ19zdHJlYW0g
KnN0cmVhbSkNCj4gK3sNCj4gKwlpbnQgcmV0Ow0KPiArCWludCBMcDsNCj4gKwlpbnQgc2tpcDsN
Cj4gKwlpbnQgdGY7DQo+ICsNCj4gKwlMcCA9IGpwZWdfZ2V0X3dvcmRfYmUoc3RyZWFtKTsNCj4g
KwlpZiAoTHAgPCAwKQ0KPiArCQlyZXR1cm4gTHA7DQo+ICsNCj4gKwkvKiBnZXQgdG8gQXAxMiAq
Lw0KPiArCXJldCA9IGpwZWdfc2tpcChzdHJlYW0sIDExKTsNCj4gKwlpZiAocmV0IDwgMCkNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwl0ZiA9IGpwZWdfZ2V0X2J5dGUoc3RyZWFtKTsN
Cj4gKwlpZiAodGYgPCAwKQ0KPiArCQlyZXR1cm4gdGY7DQo+ICsNCj4gKwlza2lwID0gTHAgLSAy
IC0gMTE7DQo+ICsJcmV0ID0ganBlZ19za2lwKHN0cmVhbSwgc2tpcCk7DQo+ICsJaWYgKHJldCA8
IDApDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCWVsc2UNCj4gKwkJcmV0dXJuIHRmOw0KPiAr
fQ0KPiArDQo+ICAvKioNCj4gLSAqIGpwZWdfcGFyc2VfaGVhZGVyIC0gbG9jYXRlIG1hcmtlciBz
ZWdtZW50cyBhbmQgb3B0aW9uYWxseSBwYXJzZQ0KPiBoZWFkZXJzDQo+ICsgKiB2NGwyX2pwZWdf
cGFyc2VfaGVhZGVyIC0gbG9jYXRlIG1hcmtlciBzZWdtZW50cyBhbmQgb3B0aW9uYWxseQ0KPiBw
YXJzZSBoZWFkZXJzDQo+ICAgKiBAYnVmOiBhZGRyZXNzIG9mIHRoZSBKUEVHIGJ1ZmZlciwgc2hv
dWxkIHN0YXJ0IHdpdGggYSBTT0kgbWFya2VyDQo+ICAgKiBAbGVuOiBsZW5ndGggb2YgdGhlIEpQ
RUcgYnVmZmVyDQo+ICAgKiBAb3V0OiByZXR1cm5zIG1hcmtlciBzZWdtZW50IHBvc2l0aW9ucyBh
bmQgb3B0aW9uYWxseSBwYXJzZWQNCj4gaGVhZGVycw0KPiBAQCAtNDc2LDYgKzUwNiw5IEBAIGlu
dCB2NGwyX2pwZWdfcGFyc2VfaGVhZGVyKHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwNCj4gc3RydWN0
IHY0bDJfanBlZ19oZWFkZXIgKm91dCkNCj4gIAlpZiAobWFya2VyICE9IFNPSSkNCj4gIAkJcmV0
dXJuIC1FSU5WQUw7DQo+ICANCj4gKwkvKiBpbml0IHZhbHVlIHRvIHNpZ25hbCBpZiB0aGlzIG1h
cmtlciBpcyBub3QgcHJlc2VudCAqLw0KPiArCW91dC0+YXBwMTRfdGYgPSAtRUlOVkFMOw0KPiAr
DQo+ICAJLyogbG9vcCB0aHJvdWdoIG1hcmtlciBzZWdtZW50cyAqLw0KPiAgCXdoaWxlICgobWFy
a2VyID0ganBlZ19uZXh0X21hcmtlcigmc3RyZWFtKSkgPj0gMCkgew0KPiAgCQlzd2l0Y2ggKG1h
cmtlcikgew0KPiBAQCAtNTE5LDcgKzU1Miw5IEBAIGludCB2NGwyX2pwZWdfcGFyc2VfaGVhZGVy
KHZvaWQgKmJ1Ziwgc2l6ZV90IGxlbiwNCj4gc3RydWN0IHY0bDJfanBlZ19oZWFkZXIgKm91dCkN
Cj4gIAkJCXJldCA9IGpwZWdfcGFyc2VfcmVzdGFydF9pbnRlcnZhbCgmc3RyZWFtLA0KPiAgCQkJ
CQkJCSZvdXQtDQo+ID5yZXN0YXJ0X2ludGVydmFsKTsNCj4gIAkJCWJyZWFrOw0KPiAtDQo+ICsJ
CWNhc2UgQVBQMTQ6DQo+ICsJCQlvdXQtPmFwcDE0X3RmID0ganBlZ19wYXJzZV9hcHAxNF9kYXRh
KCZzdHJlYW0pOw0KPiArCQkJYnJlYWs7DQo+ICAJCWNhc2UgU09TOg0KPiAgCQkJcmV0ID0ganBl
Z19yZWZlcmVuY2Vfc2VnbWVudCgmc3RyZWFtLCAmb3V0LQ0KPiA+c29zKTsNCj4gIAkJCWlmIChy
ZXQgPCAwKQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9tZWRpYS92NGwyLWpwZWcuaCBiL2luY2x1
ZGUvbWVkaWEvdjRsMi1qcGVnLmgNCj4gaW5kZXggZGRiYTJhNTZjMzIxLi4wMDhlMDQ3NmQ5Mjgg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbWVkaWEvdjRsMi1qcGVnLmgNCj4gKysrIGIvaW5jbHVk
ZS9tZWRpYS92NGwyLWpwZWcuaA0KPiBAQCAtMTAwLDEwICsxMDAsMTEgQEAgc3RydWN0IHY0bDJf
anBlZ19zY2FuX2hlYWRlciB7DQo+ICAgKiAgICAgICAgICAgICAgICAgIG9yZGVyLCBvcHRpb25h
bA0KPiAgICogQHJlc3RhcnRfaW50ZXJ2YWw6IG51bWJlciBvZiBNQ1UgcGVyIHJlc3RhcnQgaW50
ZXJ2YWwsIFJpDQo+ICAgKiBAZWNzX29mZnNldDogYnVmZmVyIG9mZnNldCBpbiBieXRlcyB0byB0
aGUgZW50cm9weSBjb2RlZCBzZWdtZW50DQo+ICsgKiBAYXBwMTRfdGY6IHRyYW5zZm9ybSBmbGFn
IGZyb20gYXBwMTQgZGF0YQ0KPiAgICoNCj4gICAqIFdoZW4gdGhpcyBzdHJ1Y3R1cmUgaXMgcGFz
c2VkIHRvIHY0bDJfanBlZ19wYXJzZV9oZWFkZXIsIHRoZQ0KPiBvcHRpb25hbCBzY2FuLA0KPiAt
ICogcXVhbnRpemF0aW9uX3RhYmxlcywgYW5kIGh1ZmZtYW5fdGFibGVzIHBvaW50ZXJzIG11c3Qg
YmUNCj4gaW5pdGlhbGl6ZWQgdG8gTlVMTA0KPiAtICogb3IgcG9pbnQgYXQgdmFsaWQgbWVtb3J5
Lg0KPiArICogcXVhbnRpemF0aW9uX3RhYmxlcyBhbmQgaHVmZm1hbl90YWJsZXMgcG9pbnRlcnMg
bXVzdCBiZQ0KPiBpbml0aWFsaXplZA0KPiArICogdG8gTlVMTCBvciBwb2ludCBhdCB2YWxpZCBt
ZW1vcnkuDQo+ICAgKi8NCj4gIHN0cnVjdCB2NGwyX2pwZWdfaGVhZGVyIHsNCj4gIAlzdHJ1Y3Qg
djRsMl9qcGVnX3JlZmVyZW5jZSBzb2Y7DQo+IEBAIC0xMTksNiArMTIwLDcgQEAgc3RydWN0IHY0
bDJfanBlZ19oZWFkZXIgew0KPiAgCXN0cnVjdCB2NGwyX2pwZWdfcmVmZXJlbmNlICpodWZmbWFu
X3RhYmxlczsNCj4gIAl1MTYgcmVzdGFydF9pbnRlcnZhbDsNCj4gIAlzaXplX3QgZWNzX29mZnNl
dDsNCj4gKwlpbnQgYXBwMTRfdGY7DQo+ICB9Ow0KPiAgDQo+ICBpbnQgdjRsMl9qcGVnX3BhcnNl
X2hlYWRlcih2b2lkICpidWYsIHNpemVfdCBsZW4sIHN0cnVjdA0KPiB2NGwyX2pwZWdfaGVhZGVy
ICpvdXQpOw0K
