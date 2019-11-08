Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 394D3F4D50
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 14:37:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbfKHNgs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 08:36:48 -0500
Received: from mail-eopbgr70043.outbound.protection.outlook.com ([40.107.7.43]:15046
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726445AbfKHNgs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 08:36:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2fcIlkNlbEnR3xORHSYy9D43sqV3bAxCQAT5hcRoVyAYNgRchSAJDZZmpbEsVQmG9BEZ7R2Zeggo24SSLhSz7t5a34wyeckG/5IIlB5iLdl3dMVzBv4oKP8yF8YOm9L3y+sR0XhjQusoict07qAJNKPSQ3cdAskSm+LjIZinjAAk5NIaoYL/4OYplMOT/WpfHt4U4VJGEnVJpx9hCDJsXwiit6MoqQi2mtlG2+ymz/+JsjJufE7OedKRTmcGWniq4QhrvVkIy70pynP6bFNeBALPHZyBYdil9SKKrSYhLf2+G2tnoIRnMBsNlETvBQvMTW5KPXPlIStNB0xZeC2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ym6sNZ1SaW2QBxnhuEX3XvAtjtBWLRBDBDlYcxyZTY=;
 b=AcGKdQQuYzbQaD8ZvqvbMheyd89JCpWLRWBQpFDdxpHGKn4q4BYN8dDRALrSbnq4mnEArcNdFM7OWjGqRH/C9p7K+5EQIZVgBYKwtlWYCmyV2Nv3rnm+O3JFse0cKdXv+EO9gebb7aPEcTdJtecgKjMZlbGPHd8iL7eSJ9+kGIXb9TwSmBcY5nnCVyJWsjmNTeQQikxlBjtIgLbBiqt+oKyWxLkYenrZJUKbiPCnYe0VKlA7WdiZwd8pCqWpMK5ASrU0akkjXFyY5tM1Ql91Fnnh/1ayVUQjevuWma7u2cpPd5ze8XkCx95knKk/5xh449aHcUhWLl58mnP6OaU16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ym6sNZ1SaW2QBxnhuEX3XvAtjtBWLRBDBDlYcxyZTY=;
 b=hgbSwKvu8oIWOC9js9Q85RKIrcDRwg/3CRR08FHfSyEndVIY7SOTQRsfg64nfWn9vnOpLOyVRUhqy+pA4K8Vtu9ZJRR416/lLn3MPvtn0SveEi/64nc1SGEfppPNw7WvQJfg8gFvwL1mIL8Gi9laNcXP0kbPUXUBwsdPE8oY4D8=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3584.eurprd04.prod.outlook.com (52.134.5.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 8 Nov 2019 13:36:41 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::8997:3705:3f41:1d1b%7]) with mapi id 15.20.2408.028; Fri, 8 Nov 2019
 13:36:41 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH 0/5] Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHVlLXLzR/BR8Qmu0iHDS94ZPyJ2qd+RrWAgAATH4CAAAH2AIAC7eQA
Date:   Fri, 8 Nov 2019 13:36:40 +0000
Message-ID: <1573220200.16477.32.camel@nxp.com>
References: <1573053633-21437-1-git-send-email-mirela.rabulea@nxp.com>
         <87d80882-b032-f332-0808-d669600f844f@xs4all.nl>
         <1573058741.16477.18.camel@nxp.com>
         <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
In-Reply-To: <2ad1718b-2556-ea7c-27e0-9e60445a5b71@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8188e02d-5413-418f-6f51-08d76450b01f
x-ms-traffictypediagnostic: VI1PR0402MB3584:|VI1PR0402MB3584:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3584FB0A885525F952D365068F7B0@VI1PR0402MB3584.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(3846002)(26005)(14444005)(446003)(50226002)(6116002)(229853002)(2906002)(476003)(86362001)(6512007)(4326008)(103116003)(5660300002)(66066001)(44832011)(11346002)(6246003)(6436002)(186003)(6486002)(25786009)(2616005)(256004)(316002)(478600001)(2501003)(7736002)(99286004)(486006)(7416002)(54906003)(14454004)(64756008)(91956017)(66556008)(66446008)(8676002)(110136005)(76176011)(81156014)(36756003)(76116006)(8936002)(102836004)(66946007)(71190400001)(6506007)(81166006)(305945005)(71200400001)(66476007)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3584;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jWN946PA2KPjN1PnIgsaAL49Sx683mb0KgOgAcqcHbXe6yBFUm8lxucxgebBtCusiDFTtIQ9cuk9hWSZvpN1hE0NWMgzGlM9SQ+HZ2S9rKxmgMAE6rSKa+zNE4Dr6/P+PREtdlNYae8pLvqa7tw8igSiq15iSmMqptSzBO0iLK0OUgF9E2Cd5dH4wo/g3LEK1uoJvb82wNuv6YZ8LN437RLqQCFuHsJpx4YuSLEeto/fxzaqPQWPMeRRYIfIbVh243leCOZ+1KIVkO8+D5xXuDZr0TVWbseLQXdiGqJh7c/5w8BUYu+VeP+yFfzmmKgyipQ7VxqnB4OKOtN/85Pw7Fus3KjmAUaiVM0c2jjBgrE5AzjT/ZSsVcMSBJ3/tTOgy/xZQXeuyp4/J3IOwHw52pSzAoz5u2eR3gch+A5gTm0Y+S9n2hejuSJYOhZSUK3h
Content-Type: text/plain; charset="utf-8"
Content-ID: <8490D0E6FF31574AB43620D7EA628ED4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8188e02d-5413-418f-6f51-08d76450b01f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 13:36:40.8967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ii+yNgcLyGVhtBo7C3wPtminNaupLaw0QOvIemQWnk8Twfh7qjH0reXUi9ft3Ryc3TcnFJmpALjVOv+DBSWghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3584
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KT24gTWksIDIwMTktMTEtMDYgYXQgMTc6NTIgKzAxMDAsIEhhbnMgVmVya3Vp
bCB3cm90ZToNCj4gwqAgwqAgwqAgdGVzdCBTY2FsaW5nOiBPSw0KPiBUaGUgcHJlc2VuY2Ugb2Yg
YSBzY2FsZXIgaXMgc3VzcGljaW91czogaXMgdGhlIGVuY29kZXIgaW5kZWVkDQo+IGNhcGFibGUg
b2Ygc2NhbGluZz8gSSBzdXNwZWN0IHRoaXMgaXMgYSBidWcuDQoNCk5vLCBpdCdzIG5vdCBjYXBh
YmxlIG9mIHNjYWxpbmcuIFlvdSBzdXNwZWN0IGEgYnVnIGluIHRoZSBkcml2ZXIgb3IgdGhlDQp0
ZXN0cz8NCg0KPiBDb2RlYyBpb2N0bHM6DQo+ID4gwqDCoMKgwqDCoMKgdGVzdCBWSURJT0NfKFRS
WV8pRU5DT0RFUl9DTUQ6IE9LDQo+IFRoZSBwcmVzZW5jZSBvZiB0aGlzLi4uDQo+IA0KPiA+IA0K
PiA+IMKgwqDCoMKgwqDCoHRlc3QgVklESU9DX0dfRU5DX0lOREVYOiBPSyAoTm90IFN1cHBvcnRl
ZCkNCj4gPiDCoMKgwqDCoMKgwqB0ZXN0IFZJRElPQ18oVFJZXylERUNPREVSX0NNRDogT0sNCj4g
Li4uYW5kIHRoaXMgaXMgYWxzbyBzdHJhbmdlIGZvciBhIEpQRUcgY29kZWMuIFRoZXNlIGlvY3Rs
cyBhcmUNCj4gdHlwaWNhbGx5IG9ubHkNCj4gbmVlZGVkIGZvciBNUEVHL0gyNjQvZXRjLiBjb2Rl
Y3MsIGFuZCBub3QgZm9yIGEgc2ltcGxlIEpQRUcgY29kZWMuDQo+IA0KPiBUaGUgc2FtZSBpc3N1
ZXMgYXJlIGZvdW5kIGZvciB0aGUgSlBFRyBkZWNvZGVyLg0KDQpJIGltcGxlbWVudGVkIHRoZSBD
TURfU1RPUCBmb3IgYm90aCBlbmNvZGVyICYgZGVjb2RlciwgYmVjYXVzZSBpdCB3YXMNCnJlcXVl
c3RlZCBieSBvdXIgZGV2ZWxvcGVyIGZvciBnc3RyZWFtZXIgcGx1Z2luIGZvciB0aGlzIGNvZGVj
Lg0KVGhlIGNvbnRleHQgaW4gd2hpY2ggdGhpcyB3YXMgcmVxdWVzdGVkIHdhcyBmb3IgcGxheWlu
ZyBNSlBFRyB2aWRlb3MgKGENCmNvbmNhdGVuYXRpb24gb2YgSlBFRyBmcmFtZXMpLg0KDQo+IFN0
cmVhbWluZyBpb2N0bHM6DQo+ID4gwqDCoMKgwqDCoMKgdGVzdCByZWFkL3dyaXRlOiBPSyAoTm90
IFN1cHBvcnRlZCkNCj4gPiDCoMKgwqDCoMKgwqB0ZXN0IGJsb2NraW5nIHdhaXQ6IE9LDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZhaWw6IHY0bDItdGVzdC1idWZmZXJzLmNwcCgy
NTQpOiBnX2ZpZWxkKCkgPT0NCj4gPiBWNEwyX0ZJRUxEX0FOWQ0KPiBUaGUgZHJpdmVyIHNoYWxs
IG5ldmVyIHJldHVybiBGSUVMRF9BTlkuIFRoaXMgbmVlZHMgdG8gYmUgRklFTERfTk9ORS4NCg0K
SXMgdGhlcmUgYSAiZ29vZCBleGFtcGxlIiBvZiBhIHY0bCBtMm0gZHJpdmVyIHRoYXQgcGFzc2Vz
IHRoZXNlDQpzdHJlYW1pbmcgdGVzdHM/IFRoYXQgd291bGQgc2F2ZSBzb21lIHRpbWUgb24gbXkg
c2lkZS4NCkZvciB0aGUgRklFTERfQU5ZIGlzc3VlLCBJIGdvdCBpbnNwaXJlZCBmcm9tIHlvdXIg
Y29tbWl0Og0KYWI3YWZhZjMgbWVkaWE6IHZpbTJtOiBhZGQgYnVmX291dF92YWxpZGF0ZSBjYWxs
YmFjaw0KQnV0IHRoZXJlJ3MgYSBsb3QgbW9yZSB0byBnby4uLg0KDQpUaGFua3MsDQpNaXJlbGEN
Cg==
