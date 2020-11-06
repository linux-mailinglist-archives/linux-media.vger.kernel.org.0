Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 431BE2A8BCA
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 02:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732744AbgKFBFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 20:05:50 -0500
Received: from mail-eopbgr70055.outbound.protection.outlook.com ([40.107.7.55]:30023
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730895AbgKFBFt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 20:05:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9FhNIWgWWnIs8INH8aCuqZqD7BVDTWn7gchPkjP1UiUhOyhA3gpWZaiZ7l3JG80g8sR9NG2RyPPQwLVJDnS33TTbqnjhanOA/yML0iY7zLuxtSNU47WhSMVVxl+DcMg0mspAVOC9TEeA+QRgURCnG/QUZUJpPxgfBO9Vww3+wQr1p01u5U75zKONifukfCMUO13QRUBtwD9F/Jp0x/bLon4gENtqJu3XzLc0i+Xv5enBCAB628OEWjn57NmvWZO7DoHr1NI9Q1fYtVvMxvHRZ4W31Om0/pTX7dIXX1AP90/kNgfil9yJxCnuyjVF4czXINP58FO2E4J5X/vZw6VbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSdfm7wRfPUhlAgfTuyaLDT2HvHoBstL7wlWV+nMy/0=;
 b=atK1FQVYVWUvTDvYXDT0ij8dhTKbAYELfEmve60HNQ711uur2bDquASxH9Jvx/KCgKkBmkUiSpp5bGOJmnjgkdTn8Xs++CkTzJJh+mT9zY951GKY7KM7nstm4VJozaU4NxGfPBYiFrnCDl0tOCmaHjK2nJcBY83l2vu8lMqhsfxmb9n0I6rHUM/zYHzp1mZ8BC4ZieqE1vWKFJmhlQQ2fI0cCIEqE9IfOq/LMxeBi2hNr5sF43RHUcHUEHK0WtprWAvCQsLMMWohSaqJUoBZQpJ9yLVj50w6m4YsqKutdLW+ukYCXn/3O9fYTWWu8obL0no7MjQuyoA0HC2BDBwu5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSdfm7wRfPUhlAgfTuyaLDT2HvHoBstL7wlWV+nMy/0=;
 b=qUElMSWhfcawAyJetgeVVRfDnZXCXxlILVIoN6IAoEE++KNGYmOXh+9eUoqiKu9WlzOhpw3TK2k09d5OFV9cuga6JMrBh0tStLIY1MkPhXrJhNlDedj9/ocQby41mhVYNzHyWO+wpi84MQs0pWCxAq7NOjMQxZfzQRNWhVbYksI=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5606.eurprd04.prod.outlook.com (2603:10a6:20b:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 01:05:43 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 01:05:43 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 04/11] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [PATCH v4 04/11] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHWsMWnL520UB6oRkOYM7Q9EVILr6m1BpQAgAVJxgA=
Date:   Fri, 6 Nov 2020 01:05:43 +0000
Message-ID: <3a8e31ae6014495791e0a175b3b98463f4622a29.camel@nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
         <20201102030821.3049-5-mirela.rabulea@oss.nxp.com>
         <20201102162022.upkgqipa725fhtce@fsr-ub1864-141>
In-Reply-To: <20201102162022.upkgqipa725fhtce@fsr-ub1864-141>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.170.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 732de9a6-e7c1-41ea-5e59-08d881f01654
x-ms-traffictypediagnostic: AM6PR04MB5606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB560634B1A471E4AF652CE8658FED0@AM6PR04MB5606.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSkBvyL7RNTv+jSjtwXlbYKrz73oo7PnEsgfqp/lV7+pMrPXHmtehtXcCGRqvQS2SR8YHVaAySAf3Dr8wtV12A2/jbKEL2CIgRWaiHCCeHZvJJhE3bOUqJfIu4q2iCifWwsEVIPH1aiYioaDKxdxjmIe7boHaoADKPxHl4W3ERxzWgTbq0LlLtfP0w0cBlJSpqgnXdJDI0L7Gq7T6zk9f/Wft1vcNubV5qaLVdn5PrKqWjNFMg4H57+8lu5Goc94kUpjMnr+taRe1J0HQYsJfbPN1bgyoKDQNP9kOE2BG1k+Ocs8piK094PXomcNwLD/18hp6d7i6Bq6IYtkmI5WSMiR4zTdxLesofR02F+Fc0CdHB4vn/B/OfNXOqsvsKLx
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(478600001)(71200400001)(316002)(8676002)(6506007)(36756003)(54906003)(110136005)(7416002)(2906002)(44832011)(86362001)(6486002)(66946007)(66446008)(83380400001)(66476007)(186003)(6512007)(66556008)(4326008)(64756008)(26005)(76116006)(91956017)(2616005)(8936002)(5660300002)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ltu9JX77UIDEkSjX8Qxj24eVfo1tMXaUQ2x69YY/PE1vBAOp+00qIgnbGc/tXZc8WlPDAs0ydyKq12EopkS//JTijl0lmk45vn4gCd4nulstLXb3HwYlJx+MEJanjp54vs6bdVSjqWrYBRJ9W6oe1h5ITjAvkAJw2h42+U3+nMN/5Q9jrzRAVfn7kP/VRdklsVJeXv+JRotrWASLtCdHytlmLhRHUA320A7GPvhKmlXoqLsJcJh5wT52e8tMtLnKs3UI7Vz5+rOKkYiEW28m9QmeqkUfOz+EXYHGzCfrjdwddpnSrpWviptBBcVUfxThdyGZZ1uQvMiMt4M101Hl38AUHlVBmlu15/J0+W9EocnZ84CtjwBmW9b/obYDW7F1S9sVX9Y8rQrnF3qzK9XtuaffYF5UJIGwyOLNAJ3jGgV1sivjxpAkjnsukzIt/UFciXzTIUDN6X0JrIqGQQscBp/vZpDnicibSwfs3/JXt30nYE3Rz45WhQroPM2ftlbbaKr0fIC4DGVmMBP8tBfOJ393Zhr8X6HPW4Xoum/OlYmzJoKRVV2oqSceJbTa3kTlLk3ZNLnw9MZn0JU96zIY5kMO5yCiIC497g1RVBzqLF9iJFkSclzkgh4yEcVxCiVKLlyYxsC8x4av91oXM1oSbA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <68E81CE27E3FDC4EB643B297405556F6@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732de9a6-e7c1-41ea-5e59-08d881f01654
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 01:05:43.8348
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re8Y0rO4QQCdXkMVrCcjbchka83gf/DrQqi+rJlRK2t0WscO84p/nu/nOfQWFim+ef5BARYMc896vC7vi+QeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5606
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudGl1LA0KDQpPbiBNb24sIDIwMjAtMTEtMDIgYXQgMTg6MjAgKzAyMDAsIExhdXJl
bnRpdSBQYWxjdSB3cm90ZToNCj4gSGkgTWlyZWxhLA0KPiANCj4gSSB3YW50ZWQgdG8gZ2l2ZSBp
dCBhIG1vcmUgaW4tZGVwdGggbG9vayBidXQgSSB0aGVuIHNhdyB0aGF0IHBhdGNoIDExDQo+IGRl
bGV0ZXMgYSBsb3Qgb2YgY29kZSBmcm9tIHRoaXMgZmlsZS4gU28sIHRoZSByZXZpZXcgb24gdGhl
IGRlbGV0ZWQNCj4gcGFydHMgd291bGQgYmUgcG9pbnRsZXNzLi4uIDovDQo+IA0KPiBJIHN1Z2dl
c3QgeW91IHNxdWFzaCA0IGFuZCAxMSB0b2dldGhlci4NCg0KU29ycnkgYWJvdXQgdGhhdCwgSSBy
ZWZyYWluZWQgZnJvbSBzcXVhc2hpbmcgNCAmIDExIGZvciAyIHJlYXNvbnM6DQoNCjEuIE9uIHBh
dGNoIDQgSSBkaWQgbm90IG1ha2Ugc2lnbmlmaWNhbnQgY2hhbmdlcyBzaW5jZSBwcmV2aW91cyB2
ZXJzaW9uDQooanVzdCBlbm91Z2ggdG8ga2VlcCBpdCBjb21waWxpbmcpIEkgaG9wZWQgaXQgd2ls
bCBiZSBlYXNpZXIgdG8gcmV2aWV3DQpsaWtlIHRoaXMsIHRyaWVkIHRvIGV4cGxhaW4gaW4gY292
ZXIgbGV0dGVyLg0KDQoyLiBBZnRlciB1c2luZyB0aGUganBlZyBoZWxwZXJzLCB0aGUgbXhjX2pw
ZWdfcGFyc2UoKSBpcyBzb21ld2hlcmUNCmJldHdlZW4gMi04JSBzbG93ZXIsIGRlcGVuZGluZyBv
biB0aGUgbWVhc3VyaW5nIG1ldGhvZCwgc28gSSB3YXMNCnRoaW5raW5nIGl0IHdvdWxkIGJlIG5p
Y2UgdG8gaGF2ZSB0aGUgcHJldmlvdXMgbWV0aG9kIGluIHRoZSBoaXN0b3J5LA0KYXMgYSByZWZl
cmVuY2UuIE5vdywgSSBoYXZlIGRvbmUgbW9yZSBtZWFzdXJlbWVudHMgb24gdGhlIG92ZXJhbGwN
CmltcGFjdCwgYW4gaXQgaXMgaW5zaWduaWZpY2FudCwgfjAuMDElIGZvciBhIHN0cmVhbWluZyBj
YXNlICgxIDEwODBwDQpSR0IyNCBidWZmZXIgZW5xdWV1ZWQgMTAwMCB0aW1lcykuDQoNCkkgY2Fu
IGRlZmluaXRlbHkgIHNxdWFzaCBwYXRjaCA3IGludG8gNCwgdG9nZXRoZXIgd2l0aCBvdGhlciBj
aGFuZ2VzDQpmcm9tIHRoaXMgdmVyc2lvbiByZXZpZXcuIEknbSB3YWl0aW5nIGZvciBtb3JlIG9w
aW5pb25zIGFib3V0IHNxdWFzaGluZw0KMTEgaW50byA0Lg0KDQo+IA0KPiA+IHY0bDItY29tcGxp
YW5jZSB0ZXN0cyBhcmUgcGFzc2luZywgaW5jbHVkaW5nIHRoZQ0KPiA+IHN0cmVhbWluZyB0ZXN0
cywgInY0bDItY29tcGxpYW5jZSAtcyINCj4gPiANCj4gPiBWMyBSZXBsYWNlZCBHUkFCQkVSDQo+
IA0KPiBXaGF0IGRvZXMgdGhpcyBtZWFuPw0KDQpSZW1vdmVkLCBteSBiYWQsIHRoYXQgaW5mbyB3
YXMgYWRkZWQgaW4gY292ZXIgbGV0dGVyLg0KDQo+ICsgKg0KPiA+ICsgKiBBIG1vZHVsZSBwYXJh
bWV0ZXIgaXMgYXZhaWxhYmxlIGZvciBkZWJ1ZyBwdXJwb3NlDQo+ID4gKGpwZWdfdHJhY2luZyks
IHRvIGVuYWJsZQ0KPiA+ICsgKiBpdCwgZW5hYmxlIGR5bmFtaWMgZGVidWcgZm9yIHRoaXMgbW9k
dWxlIGFuZDoNCj4gPiArICogZWNobyAxID4gL3N5cy9tb2R1bGUvbXhjX2pwZWdfZW5jZGVjL3Bh
cmFtZXRlcnMvanBlZ190cmFjaW5nDQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoaXMgaXQncyB0cnlp
bmcgdG8gYWNoaWV2ZSB0aGUgc2FtZSB0aGluZyB0aGF0J3MNCj4gYWxyZWFkeQ0KPiBvZmZlcmVk
IGJ5IHY0bDJfZGJnKCkgYW5kIHRoZSAnZGVidWcnIG1vZHVsZSBwYXJhbWV0ZXIuIFRoZSBhZHZh
bnRhZ2UNCj4gb2YNCj4gdGhlIGxhdHRlciBpcyB0aGF0IHlvdSBkb24ndCBuZWVkIHRvIHJlY29t
cGlsZSB0aGUga2VybmVsIHRvIGVuYWJsZQ0KPiBkeW5hbWljIGRlYnVnLi4uIE1heWJlIGl0J3Mg
d29ydGggcmV1c2luZyBpdD8NCg0KSSByZXBsYWNlZCBqcGVnX3RyYWNpbmcgbW9kdWxlIHBhcmFt
ZXRlciB3aXRoIGRlYnVnIG1vZHVsZSBwYXJhbWV0ZXIgaW4NCnRoZSBuZXh0IHZlcnNpb24sIHNv
LCBpdCB3aWxsIGJlIHNoYXJlZCB3aXRoIHdoYXQgdjRsMl9kYmcgaXMgdXNpbmcuDQoNCj4gPiAr
MHhCNywgMHhCOCwgMHhCOSwgMHhCQSwgMHhDMiwgMHhDMywgMHhDNCwNCj4gPiArMHhDNSwgMHhD
NiwgMHhDNywgMHhDOCwgMHhDOSwgMHhDQSwgMHhEMiwNCj4gPiArMHhEMywgMHhENCwgMHhENSwg
MHhENiwgMHhENywgMHhEOCwgMHhEOSwNCj4gPiArMHhEQSwgMHhFMiwgMHhFMywgMHhFNCwgMHhF
NSwgMHhFNiwgMHhFNywNCj4gPiArMHhFOCwgMHhFOSwgMHhFQSwgMHhGMiwgMHhGMywgMHhGNCwg
MHhGNSwNCj4gPiArMHhGNiwgMHhGNywgMHhGOCwgMHhGOSwgMHhGQX07DQo+ID4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBjaGFyIGpwZWdfZHJpW10gPSB7MHhGRiwgMHhERCwNCj4gPiArMHgwMCwg
MHgwNCwgMHgwMCwgMHgyMH07DQo+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIGpwZWdf
c29zX21heGltYWxbXSA9IHsweEZGLCAweERBLA0KPiA+ICsweDAwLCAweDBDLCAweDA0LCAweDAx
LCAweDAwLCAweDAyLCAweDExLCAweDAzLA0KPiA+ICsweDExLCAweDA0LCAweDExLCAweDAwLCAw
eDNGLCAweDAwLH07DQo+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIGpwZWdfZW9pW10g
PSB7MHhGRiwgMHhEOX07DQo+IA0KPiBUaGVzZSBkYXRhIGJsb2NrcyBhYm92ZSBzaG91bGQgYmUg
cHJvcGVybHkgaW5kZW50ZWQsIG9uZSB0YWIgdG8gdGhlDQo+IHJpZ2h0Lg0KDQpEb25lLCBmb3Ig
dGhlIG5leHQgdmVyc2lvbi4NCg0KPiA+ICsvKiAgUHJpbnQgRm91ci1jaGFyYWN0ZXItY29kZSAo
Rk9VUkNDKSAqLw0KPiA+ICtzdGF0aWMgY2hhciAqZm91cmNjX3RvX3N0cih1MzIgZm9ybWF0KQ0K
PiA+ICt7DQo+ID4gKwljaGFyICpidWYgPSBrbWFsbG9jKDMyLCBHRlBfS0VSTkVMKTsNCj4gDQo+
IEknbSBub3Qgc3VyZSB0aGlzIGlzIHdvcnRoIGl0LiBFaXRoZXIgeW91IG1ha2UgaXQgYSBzdGF0
aWMgYXJyYXk6DQo+IA0KPiBzdGF0aWMgY2hhciBidWZbNV07DQo+IA0KPiBBbmQgcmV0dXJuIGEg
cG9pbnRlciB0byBpdCwgdW5sZXNzIHRoaXMgaXMgY2FsbGVkIGZyb20gZGlmZmVyZW50DQo+IGNv
bnRleHRzLiBPciB5b3UgY291bGQgbWFrZSB0aGUgY2FsbGVyIHBhc3MgYSBwb2ludGVyIHRvIHRo
ZSBidWZmZXIuDQo+IFVzaW5nIGttYWxsb2MoKSBldmVyeSB0aW1lIHlvdSB3YW50IHRvIHByaW50
IDQgY2hhcmFjdGVycyBtaWdodA0KPiBpbnRyb2R1Y2Ugc29tZSB1bm5lY2Vzc2FyeSBvdmVyaGVh
ZCBpZiB0aGlzIGlzIGNhbGxlZCB0b28gb2Z0ZW4uDQo+IA0KPiBIb3dldmVyLCBteSBzdWdlc3Rp
b24gaXMgdG8gZ2V0IHJpZCBvZiB0aGlzIGZvdXJjY190b19zdHIoKSBoZWxwZXINCj4gY29tcGxl
dGVseSBhbmQgcHJpbnQgdGhlIGZvcm1hdCBkaXJlY3RseSB3aGVyZSB5b3UgbmVlZCBpdC4gSGVy
ZSdzIGENCj4gbGlzdCBvZiBwbGFjZXMgd2hlcmUgdGhpcyBpcyBkb25lLCBpbiBjYXNlIHlvdSBo
YXZlIHNlY29uZCB0aG91Z2h0czoNCj4gDQo+IGdpdCBncmVwICJcKHY0bDJfZGJnXHxwcl9jb250
XHxkZXZfXCkuKiVjJWMlYyVjIg0KPiANCg0KUmVtb3ZlZCBmb3VyY2NfdG9fc3RyKCksIHVzZWQg
JWMlYyVjJWMgaW5zdGVhZCwgdGhlIGFtb3VudCBvZiBsaW5lcyBvZg0KY29kZSBpcyBzaW1pbGFy
LCBzbywgaXQncyBvaywgbm8gbG9zcy4gDQoNCj4gPiArCXN0cnVjdCBteGNfanBlZ19zb2Ygc29m
LCAqcHNvZiA9IDA7DQo+ID4gKwlzdHJ1Y3QgbXhjX2pwZWdfc29zICpwc29zID0gMDsNCj4gPiAr
CXU4IGJ5dGUsICpuZXh0ID0gMDsNCj4gDQo+IERvbid0IHVzZSAwIGZvciBOVUxMIHBvaW50ZXJz
LiBVc2UgTlVMTC4gOikNCg0KRG9uZSwgaXQgd2lsbCBiZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0K
DQo+IA0KPiA+ICsJZW51bSBteGNfanBlZ19pbWFnZV9mb3JtYXQgaW1nX2ZtdDsNCj4gPiArCXUz
MiBmb3VyY2M7DQo+ID4gKw0KPiA+ICsJbWVtc2V0KCZzb2YsIDAsIHNpemVvZihzdHJ1Y3QgbXhj
X2pwZWdfc29mKSk7DQo+ID4gKwlzdHJlYW0uYWRkciA9IHNyY19hZGRyOw0KPiA+ICsJc3RyZWFt
LmVuZCA9IHNpemU7DQo+ID4gKwlzdHJlYW0ubG9jID0gMDsNCj4gPiArCSpkaHRfbmVlZGVkID0g
dHJ1ZTsNCj4gPiArCXdoaWxlIChub3Rmb3VuZCkgew0KPiA+ICsJCWJ5dGUgPSBnZXRfYnl0ZSgm
c3RyZWFtKTsNCj4gPiArCQlpZiAoYnl0ZSA9PSAtMSkNCj4gDQo+IGJ5dGUgaXMgdTguIFRoZSBh
Ym92ZSBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZS4NCg0KVGhpcyBpcyBoYW5kbGVkIGRpZmZlcmVu
dGx5IG5vdyBpbiB0aGUgdXBzdHJlYW0ganBlZyBoZWxwZXJzDQoodjRsMl9qcGVnX3BhcnNlX2hl
YWRlcigpIGFuZCBqcGVnX25leHRfbWFya2VyKCkpLg0KSG93ZXZlciwgaW4gdGhlIGFib3ZlLCB0
aGVyZSBpcyBhIHByb2JsZW0sIHRoZSBlbmQgb2YgdGhlIHN0cmVhbSBpcyBub3QNCmRldGVjdGVk
IHByb3Blcmx5LiBJJ2xsIG1vZGlmeSBnZXRfYnl0ZSB0byByZXR1cm4gaW50LCBub3QgdTgsIGJl
Y2F1c2UNCi0xIGlzIGZvciB0aGUgZW5kIG9mIHN0cmVhbSwgYW5kIDB4RkYgaXMNCmZvciBtYXJr
ZXJzIChpbiB1OCByZXByZXNlbnRhdGlvbiBib3RoIHdlcmUgMHhGRikuIFRoaXMgcGFzc2VkDQp1
bmRldGVjdGVkIGJlY2F1c2UsIGZvciBhIHZhbGlkIGpwZWcgdGhlIHBhcnNpbmcgd2FzIGRvbmUg
b25seSB1cCB0bw0KU09TLiBTbywgYSBwcm9ibGVtYXRpYyBjYXNlIHdvdWxkIGJlIGEgY29ycnVw
dGVkIGpwZWcsIHdpdGggU09JLCBidXQNCndpdGhvdXQgU09TLiBJJ2xsIHRyeSB0byBhZGQgc29t
ZSBjb3JydXB0ZWQganBlZ3MgaW4gbXkgdGVzdHN1aXRlLg0KDQpUaGFua3MsDQpNaXJlbGENCg==
