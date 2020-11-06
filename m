Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A33B2A8BC7
	for <lists+linux-media@lfdr.de>; Fri,  6 Nov 2020 02:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732396AbgKFBEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 20:04:50 -0500
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:44928
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730895AbgKFBEt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 20:04:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmym6fzavml1SKVzHsrJEVJWT75BVbbm+aocwF979syNRrIxy54J5ZM9PWyck4S41XAoHHacNV05+6zixuFHMleIAXpT5W7WiVMVgrSmI7xS9mXE+42w0XMFR5EoUFCttZQPkB27p6AQ/9oRjN8seZHh/tBFSMLFKf2sM2GHVaHzQY6sIOjKUdKZn4lFRHi/qDE3m0tqN9Cr4nsmcSo9tDuj838kOYIHe2bXjzyAwkGfdtMMsIxikJM9UZ75Vgi2D0o0Mb5yvst7eUyH6uQGowgzGdfrD3IMRw/F3UwyDfZULkjAuBVyAdArLuWY6uoH4Vsv8d7lFlLzg+h3mEJ7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiCC1qvZuTb4uM268hSXpedkkAUQba+j36S6fC+/DNc=;
 b=fuUvnNpEzdx7T6qazG1wFMV0JQ+MtY3GlVP1VxqQMRaVJNZI1p3HKyBhKA7r0l+cqk7LVluIxPYn2iXLPKM50DgWFA8FcKwbUzl7jfX+302nbBWsp1niPcvBlW2h1LXtrJ80DbJofKM9n00bjhPmyP339CO+HA6N/dOZQdTw58W0rCQ13aNyJ1GxkDB7ZTWzZmPzOJVc8OLAfgzLGXGDMo+i6/MsCesLWpOOqI2lEdR54haBPlePjtUBCOk5Mx4usxDReKnOoV2/MZC7J5a2rgieXO1LqGRZnpBxmvwPZPw2/nKQwpIHzcmkEQCf4R0VOZLxam/2W/6sJeiY3x/BrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiCC1qvZuTb4uM268hSXpedkkAUQba+j36S6fC+/DNc=;
 b=mNDrxiIENV/GX3uX8kybRPKC1OQBJi91R7dgtpVmO0gQ1TSvz48+t+rEkZUmY1eL/4xgqRRBiiKpUAHOFe2GFoDqoSOe5mGLyqlKlJo+hDQRSxtR3HpnYw8bGgvW0WOCNXzMVUFi/KR5JGNDnL8z6MAzMe545PLxUOs+xiVlC+k=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5606.eurprd04.prod.outlook.com (2603:10a6:20b:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Fri, 6 Nov
 2020 01:04:46 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.021; Fri, 6 Nov 2020
 01:04:46 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v4 00/11] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH v4 00/11] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHWsMWkv7WhjUz/NUWFyddbmpRRQ6m34FqAgAAA2YCAABnagIAAC0qAgAJJtAA=
Date:   Fri, 6 Nov 2020 01:04:45 +0000
Message-ID: <6332a0d29721c8cef39c99ef7fd358464d492da1.camel@nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
         <9c6cf9bf-f6d8-78f5-5f31-d7ea9e25da0d@xs4all.nl>
         <ca7a395a-68ea-33a3-1216-0adf225fce7b@xs4all.nl>
         <982d940c4809b843fdc177daf4db349a0e667924.camel@nxp.com>
         <eec89e90-f414-121d-fbe4-ced23b44f6cc@xs4all.nl>
In-Reply-To: <eec89e90-f414-121d-fbe4-ced23b44f6cc@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.170.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 36796082-7748-4dc3-137e-08d881eff3d9
x-ms-traffictypediagnostic: AM6PR04MB5606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB56069604BB1A2B623C9143A18FED0@AM6PR04MB5606.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJ2isHj3WbF0yX4tgzk+nu9u1zKRvgd4IVt2mbXJE8951oC0zzTr/Y4CCGc2EeodkKebSX3gb+Hz/AJXzwk5xETVeafk5a5/7SeVjZnHKhZ8IHDkzpqmR8JMVNZj0fyz+n4x7EpiCE/s+D3/V6V2bpsOx0CE2Xo8zK6WjI/keTsnSMDhztweVkf3eHLkgh781w80KJIVo3BUvJxVG/PTjeQGwTbbwYAnxsMKvET3EZ5VgpB5AwoKHFRPGzoiULRU6djK3WE4Cz+OXANC9BNwiatLv38+gqUlbl6Ucu5opvLaWsElzaQlNX3e7nD8vngyJ9Q852AaT2ktw6feeKmyKRxUZIARiYD57xJObtbo6wJ0wicxDSrVu//SaUGO4Fgp
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(478600001)(71200400001)(316002)(8676002)(6506007)(36756003)(54906003)(110136005)(7416002)(2906002)(44832011)(86362001)(6486002)(66946007)(66446008)(66476007)(186003)(6512007)(66556008)(4326008)(64756008)(26005)(76116006)(91956017)(2616005)(8936002)(5660300002)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: q3H/LrpU8oSBrCeMO/sjARz5ZW+V2ZQ+qYxZ2R7Ch+k9t7Zm/qmj1CmJelkU2nhNBG32Kc4bxXVUo/7q8UXM3vIaaLWJduJLSRcBC8WdpX9ssvEp9u2YDDePvOInS/iIT2gDPKxCyCL6grQsNwUvpdMVhC2a+dxULZtVIEtvDwkIMIuZbfwqdGGNMPpehsaJVCeaVcduKbGSLJdDQl+7PSUH6nGSWFqIiVF+HPIP9KdraZLVSzSwyFftYJE0AqUjTBf7uNSiOboM3uu8AvAGzpMr+QSb+/8dhihLjAJUs3lXFoPoKJY0rhCRy/LNQu0J6LnCzzS0CO+arW8AWk9MnXcRT6ONKHv1soqNv8XKWsxqryIK2IM/NRm/9ex3YYhLA07rFn9CJ/ezv/htt4Vlr8iNN3t/hx3PB+SEH7r05+IX/7a9LDyXNat0eJOpARBJpKQ0PzS23ZYcaRAtYixx1rKGeAc5pdy9kUEhmOau0Oa9eC+WTfpblDU7STqPgmUT77zsBiXCeoJER4xtKp7vZw6j/JLJJQiuhvmI/eUsdZKMH36Dfumpi+HXbqdxetmD9PSa98fn1mS4PYFiZVDcK3NOfWxzVCUq3PlOqLIwYsJJf4+WfcgsBlC76JsOXvP1OQNILltYYUVyxFTNpU9oLA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <48720E65F20D884C930ADD91AAC00C78@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36796082-7748-4dc3-137e-08d881eff3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 01:04:45.9472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLC5XNQp4PXCMVeYt++y3dDadpFRMtPjL11Mtba3aVY0MEhlhIyQRj4e8r2PgM3T7TxjqY1HLzhW05Kn2ppExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5606
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gV2VkLCAyMDIwLTExLTA0IGF0IDE1OjA4ICswMTAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IA0KPiBUaGlzIHdhcyBuZXZlciByZWFsbHkgd2VsbCBkZWZpbmVkLiBCYXNpY2FsbHkgdGhlIEpQ
RUcgc3RhbmRhcmQNCj4gZG9lc24ndA0KPiBzdG9yZSBjb2xvcmltZXRyeSBhcyBtZXRhZGF0YSwg
aW5zdGVhZCBpdCBpcyB1bmRlcnN0b29kIHRvIGJlIHNSR0INCj4gY29sb3JpbWV0cnkuDQo+IA0K
PiBTbyBpZiB5b3UgdGFrZSB3aGF0IGEgSFcgSlBFRyBlbmNvZGVyIGNyZWF0ZXMgYW5kIHdhbnQg
dG8gc2hvdyBpdCBvbg0KPiBhbm90aGVyDQo+IGRldmljZSwgdGhlbiBpdCB3aWxsIGJlIGludGVy
cHJldGVkIGFzIHNSR0IuIE5vdyBpZiB1c2Vyc3BhY2UgYWRkcw0KPiBzb21lIEpQRUcNCj4gZXh0
ZW5zaW9uIHdoZXJlIGl0IGRlY2xhcmVzIHRoZSBjb2xvcmltZXRyeSB0byBiZSBzb21ldGhpbmcg
ZWxzZSwNCj4gdGhlbiB0aGF0DQo+IGlzIGZpbmUsIGJ1dCB0aGF0J3Mgb3V0IG9mIHNjb3BlIG9m
IGEgSFcgSlBFRyBlbmNvZGVyIGRyaXZlciwgSU1ITy4NCj4gDQo+IEkgc3VzcGVjdCB0aGF0IHRo
ZSBjb2RhIHBhdGNoIHdhcyBhY3R1YWxseSB0cnlpbmcgdG8gbWFrZSBjb2RhIGJlaGF2ZQ0KPiB3
aXRoDQo+IGFuIG9sZGVyIHZlcnNpb24gb2YgdjRsMi1jb21wbGlhbmNlIHdoZXJlIGEgSlBFRyBj
b2RlYyB3YXMgdGVzdGVkIGluDQo+IHRoZQ0KPiBzYW1lIHdheSBhcyBhIEgyNjQgY29kZWMuIExh
dGVyIHdlIHJlYWxpemVkIHRoYXQgdGhhdCBkaWRuJ3QgbWFrZQ0KPiBzZW5zZSBmb3INCj4gSlBF
RyBjb2RlY3MgYW5kIHRoZSB0ZXN0IHdhcyBjaGFuZ2VkLiBCdXQgbm93IGNvZGEgZmFpbHMgb24g
dGhhdA0KPiB0ZXN0Lg0KPiANCj4gPiBPbmNlIEkgY2xhcmlmeSBvbiB0aGlzLCBJJ2xsIGluY2x1
ZGUgYSBmaXggaW4gdjUuDQo+IA0KPiBJIGhvcGUgdGhpcyBoZWxwcy4NCj4gDQo+ICAgICAgICAg
SGFucw0KPiANCg0KVGhhbmtzIGZvciBjbGFyaWZ5aW5nLCBJIGZpeGVkIHRoZSBjb2xvcnNwYWNl
IGluZm9ybWF0aW9uIHRvIHNSR0IsIGZvcg0KYm90aCBjYXB0dXJlICYgb3V0cHV0IChWNEwyX0NP
TE9SU1BBQ0VfU1JHQiwgVjRMMl9ZQ0JDUl9FTkNfNjAxIGFuZA0KVjRMMl9RVUFOVElaQVRJT05f
RlVMTF9SQU5HRSkuIEFsbCBwYXNzIG5vdy4gSXQgd2lsbCBiZSBpbiB0aGUgbmV4dA0KdmVyc2lv
bi4NCg0K
