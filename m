Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4037811E24D
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2019 11:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfLMKu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Dec 2019 05:50:27 -0500
Received: from mail-eopbgr00075.outbound.protection.outlook.com ([40.107.0.75]:4757
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725747AbfLMKu1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Dec 2019 05:50:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNKTPoygfA7Q/fkLCGSja+EIau093LP8/EBj9qyT6GcD0aVswYE5vqpPuDveHNQwkmpuvJthmhJIJxTydbA08YaUD0+lYo054olkW/++g2pYAd9dpT6vQ9+WFYow88hL4QYYul7+9zeHlqf4IARTHp0Nt9fp/mp6Zy9JD8DJ2065PZU1bK7IUU0Ja9NF1LqqJ4WB4l2hubd1pxTyBgA6IxMlgNszMmtO+NETaT9/Pc1TlBjVHSlvI9zg5Cs28doa4DHOlby4ZUjA3JIZKXX3tIM8pmvP0BHzL/NYSmAkbDishrEfYu/O4+VVtzSYulaEbPkz9mpXI+dIgH1TRmDyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tliwXJ4z++t3MLSWu7/ZJIlKqr6UUKsRiJlDy0oSkKg=;
 b=g3IfUd4dXOOE2iqyFuZbFG64TtjClzBBra939qM+l1U6o7fOJq8ZbbjIIYF1o6gkHPld8DUkBjsJsx3u8yCjWSiITuPJkplm6LcdemPKGYOOuDORHPI40OUd3jxYM/tlPBBJdWApg2f+hlhCvAy2cbiCBJAmFm8+a5RBtwHZcLhCLnwiE7gessXAi3+OWGO7tX6MFV/FAaN4Xjb63ZGno8bjaubOtnunOB9TlPDuhAFDoXUYKzvuzKo/P83nN76oYWu+m7ldJs32IbK4wYAF3bxwWesAQSmX1AKRYWKcx5z4BxWXEgSDBTb/JmdFQ0XC5lSDoyR3vwoYJY+k6nBNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tliwXJ4z++t3MLSWu7/ZJIlKqr6UUKsRiJlDy0oSkKg=;
 b=YkA4rtOSdZi25SjuXgPOHPEuLRHYIYomyR5mR5FnXIkiv5fCn3GkAox/wI/VyT6aVNLIG7fftNPPbDW12RM70+4CWSGQJbLbJ8qvI2G8v/tRlEwROcKbVdMl4SRCpcbGkCvxkAfwSi7ghOiOPleQT8Dm45mMW0le9N9DkdWj+Fw=
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com (52.134.16.147) by
 VI1SPR01MB0372.eurprd04.prod.outlook.com (20.179.28.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Fri, 13 Dec 2019 10:49:42 +0000
Received: from VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad]) by VI1PR0402MB3839.eurprd04.prod.outlook.com
 ([fe80::453:3c87:9a9:d1ad%4]) with mapi id 15.20.2516.018; Fri, 13 Dec 2019
 10:49:42 +0000
From:   Daniel Baluta <daniel.baluta@nxp.com>
To:     Mirela Rabulea <mirela.rabulea@nxp.com>,
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
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 2/5] firmware: imx: scu-pd: Add power domains for imx-jpeg
Thread-Topic: [PATCH 2/5] firmware: imx: scu-pd: Add power domains for
 imx-jpeg
Thread-Index: AQHVlLXR59MDEepsUUG8Ys9bLL0Zu6e4C66AgAAQ8YA=
Date:   Fri, 13 Dec 2019 10:49:42 +0000
Message-ID: <85f114ce723d7ec27f8300243700d3a72c4150da.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <1573053633-21437-3-git-send-email-mirela.rabulea@nxp.com>
         <64ac7dca-9834-6a33-aa3e-9b7e2156dedc@xs4all.nl>
In-Reply-To: <64ac7dca-9834-6a33-aa3e-9b7e2156dedc@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9accf10d-53d0-4052-e8fa-08d77fba292d
x-ms-traffictypediagnostic: VI1SPR01MB0372:|VI1SPR01MB0372:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1SPR01MB037225B387C66CA37FF58EC6F9540@VI1SPR01MB0372.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(8936002)(76116006)(66446008)(64756008)(66556008)(66476007)(5660300002)(7416002)(8676002)(91956017)(4001150100001)(81166006)(478600001)(81156014)(2906002)(66946007)(316002)(71200400001)(6506007)(4326008)(54906003)(36756003)(186003)(6512007)(86362001)(26005)(110136005)(53546011)(2616005)(6486002)(44832011)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1SPR01MB0372;H:VI1PR0402MB3839.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6+htQzdwRYwG/xuWFxRcE9j4IYD4h0SE+i+MRp+bWWDgF9Fi/dgxgP8S2dwLT5/EJvN01MKzJT0rYeXBdympk9lnJ0SQV0aYIV2j3QRPsU+L1tJgMpsXbJCBSi2GQdISAt6UOfrymgVM4rW2QRsSTBmi1szneTSwNPT9d41ZMZAZ7aDldK9Ncci08OVOt01wU177nK2O27PWdMJPHrxP05dl8+yd/AJXU5U+NCTLiJKZt44YTLCjyDVNzbvF+UCzpfEIjx3Q70KnipYtL+ByNKjluX3jPK9vMWFXwKMARAo9hXRLWzLZagnfEf2k1rQl77ZgBh4IqeYFz0fmBVVSworUsVDpaMfg0O1y6cTsmuJAlF5MrKRz3hiumKpM732tEUagBgT+numqe8zqqUesjegfOoXqzhaq6tg/wG6UVYGOZrixnZPx/AkEjUT+GbQBX1+V/J8XdF28CONzV0OfENt3DU/ZqHfumGmu+sM2Y+bMFBNtZ1fmgP7Le2/J8b9w
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3D07B39A3D0424BB8DA1923B08BCD16@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9accf10d-53d0-4052-e8fa-08d77fba292d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 10:49:42.6904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8VbEo+9Kod5wP0DmqXQ0xlV3ntTEXOuvaE9bfTohFrqP3NcEU4NvB3QdTlca7kt+AoT8tyNr8btlhlSYU4eOXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR01MB0372
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDE5LTEyLTEzIGF0IDEwOjQ5ICswMTAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IE9uIDExLzYvMTkgNDoyMCBQTSwgTWlyZWxhIFJhYnVsZWEgd3JvdGU6DQo+ID4gVGhlIHBvd2Vy
IGRvbWFpbnMgYXJlIGZvciBpbXg4cXhwL2lteDhxbSBKUEVHIGVuY29kZXIgJiBkZWNvZGVyLg0K
PiA+IEVhY2ggaGFzIDQgc2xvdHMgYW5kIGEgd3JhcHBlci4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gDQo+IFNoYXdu
LCBEYW5pZWwsIGNhbiBJIGhhdmUgYW4gQWNrIGZyb20geW91PyBJdCBwcm9iYWJseSBtYWtlcyBz
ZW5zZQ0KPiB0aGF0DQo+IHRoaXMgcGF0Y2ggZ2V0cyBtZXJnZWQgdmlhIHRoZSBtZWRpYSBzdWJz
eXN0ZW0uDQoNCkkgaG9wZSBJJ20gdGhlIERhbmllbCB5b3UgYXJlIHJlZmVycmluZyB0by4gSXQg
bG9va3MgZ29vZCB0byAgbWUuDQoNCkFja2VkLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFs
dXRhQG54cC5jb20+DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCj4gPiAtLS0N
Cj4gPiAgZHJpdmVycy9maXJtd2FyZS9pbXgvc2N1LXBkLmMgfCA2ICsrKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZmlybXdhcmUvaW14L3NjdS1wZC5jDQo+ID4gYi9kcml2ZXJzL2Zpcm13YXJlL2lteC9zY3Ut
cGQuYw0KPiA+IGluZGV4IGI1NTY2MTIuLmU3YmY0OGEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9maXJtd2FyZS9pbXgvc2N1LXBkLmMNCj4gPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL2lteC9z
Y3UtcGQuYw0KPiA+IEBAIC0xNTgsNiArMTU4LDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14
X3NjX3BkX3JhbmdlDQo+ID4gaW14OHF4cF9zY3VfcGRfcmFuZ2VzW10gPSB7DQo+ID4gIAkvKiBE
QyBTUyAqLw0KPiA+ICAJeyAiZGMwIiwgSU1YX1NDX1JfRENfMCwgMSwgZmFsc2UsIDAgfSwNCj4g
PiAgCXsgImRjMC1wbGwiLCBJTVhfU0NfUl9EQ18wX1BMTF8wLCAyLCB0cnVlLCAwIH0sDQo+ID4g
Kw0KPiA+ICsJLyogSU1BR0UgU1MgKi8NCj4gPiArCXsgImltZy1qcGVnZGVjLW1wIiwgSU1YX1ND
X1JfTUpQRUdfREVDX01QLCAxLCBmYWxzZSwgMCB9LA0KPiA+ICsJeyAiaW1nLWpwZWdkZWMtczAi
LCBJTVhfU0NfUl9NSlBFR19ERUNfUzAsIDQsIHRydWUsIDAgfSwNCj4gPiArCXsgImltZy1qcGVn
ZW5jLW1wIiwgSU1YX1NDX1JfTUpQRUdfRU5DX01QLCAxLCBmYWxzZSwgMCB9LA0KPiA+ICsJeyAi
aW1nLWpwZWdlbmMtczAiLCBJTVhfU0NfUl9NSlBFR19FTkNfUzAsIDQsIHRydWUsIDAgfSwNCj4g
PiAgfTsNCj4gPiAgDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14X3NjX3BkX3NvYyBpbXg4
cXhwX3NjdV9wZCA9IHsNCj4gPiANCj4gDQo+IA0K
