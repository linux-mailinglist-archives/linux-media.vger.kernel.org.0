Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5E111D09B
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 16:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbfLLPMH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 10:12:07 -0500
Received: from mail-eopbgr50066.outbound.protection.outlook.com ([40.107.5.66]:8160
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728883AbfLLPMH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 10:12:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mr2IpCvR7fWDjyY8DmUE1o0G+Gvhq/OfgeY02lFB6Fbg5L9d3H6fFvC5DHTaPDU9/e6cDfhiL/+QriNJcY3fiq7s4BmLRgo8JwHOIiGTXtyGSoH1kTVqrAdxTMXZ8csWpPnrMAdkgRKBRAhPUKUuIg3bM45dlnSnvDX6Ix5EuqU06guiz/Yk6Py0/MJ9DndWZ1SQ2jD4VKIyfi6gnAeN5jSVILxGLIuhT2LVqQDQSd14+mciOBbpcmyt7ta6QcNtD1431x924lWkO7WzSzbvl/YjQwVYXP2bHNdIflFEaTInyEXBudsl5pZpiF3hT/xlLEcOGMHegaI7XcnjSi7idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2je7bdPVoppYRk+mIJA54yYVc3BE0wkBmNj0P7bgQOY=;
 b=Mwq/cy7LES/IhFEM49rkuQCJsmsCzW2FCFLUlLQNuu8qVDK9C+SVe7tTjMGm8qbqykIE5ZzlusIF2whsgPEJQRNIqy8zh1X6G1HzXE0/V68TMk0g8j0RP+jj5IM+6ngWIBIrgnWMoiz3QJqg0QpN6VJT+FP5fgLqdTQQFpXWn6VDf0Ri7KP3IHNu9w001tpqr/cfxOusP054egeqheCwFFQrOk60Ps3+SA0p5MoIbReOMdZqnxxe2ZNzFsMhPBOxTQ9u3LyPuH2OJKURGeRvTU2ShB0+TgNAjk6OmNy4LAQNR7PJGY9H2VpkXrXVfSQ39w3MdeHYgKXVdG9STSW+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2je7bdPVoppYRk+mIJA54yYVc3BE0wkBmNj0P7bgQOY=;
 b=LJi6/y2+FrGbgwmPpd/eM1SflucW7R1cM1jZzZM0SNVZ915pWlINaJ+lsqyMLPlj5MQA5whvF5IdNrvFeLJp0XtqlPCnSV7Ckr4UwUpv3QouJwcZyPosFSi13ZnG9i37tRQlGsSr1zsvmCGQJG20YFZATgtjfJf2GfzE+yM921I=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3678.eurprd04.prod.outlook.com (52.134.12.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Thu, 12 Dec 2019 15:10:21 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::69c1:8385:67ab:cb0f]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::69c1:8385:67ab:cb0f%2]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 15:10:21 +0000
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
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Topic: [PATCH v2 4/5] media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG
 Encoder/Decoder
Thread-Index: AQHVm7EZYainAUrU+0KZ+YmU4QHyZKe2xSiA
Date:   Thu, 12 Dec 2019 15:10:21 +0000
Message-ID: <1576163421.17593.11.camel@nxp.com>
References: <1573821286-26506-1-git-send-email-mirela.rabulea@nxp.com>
In-Reply-To: <1573821286-26506-1-git-send-email-mirela.rabulea@nxp.com>
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
x-ms-office365-filtering-correlation-id: bce362f3-e209-4269-fb2e-08d77f156853
x-ms-traffictypediagnostic: VI1PR0402MB3678:|VI1PR0402MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3678A83CBFFF1348547D3CE48F550@VI1PR0402MB3678.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(189003)(199004)(44832011)(7416002)(26005)(186003)(71200400001)(103116003)(6512007)(6506007)(2616005)(5660300002)(66476007)(66556008)(66446008)(64756008)(66946007)(81156014)(91956017)(76116006)(6486002)(81166006)(4326008)(8676002)(86362001)(4001150100001)(478600001)(2906002)(316002)(8936002)(110136005)(36756003)(54906003)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3678;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: guM5RmcpqdXYXmkHTGRY2LkSWog9A3rUlRTW8a8CM1w+k3TPMLUrT5TTd8eEpSZuVlgP6Ce5FLnraIIRivljFecIBSez9VITUz/OQgJPcfwfsk4fm3rGZY2CPfXvERHen6v0gB1HYLuPFzQC1egy+O4b6R52j9xJvfOoApkoYGmPKVyn5ASIDafWaTwDB5G5+xufG6gtFchYAAia+1Rh8T72T8szwQIRXKMK32NiH9tzvqZUXTYnXaV0kj1mW5rF7IAqrYyIwo1imE9ZrGX5ZFS1EeVbPEaqfcFG15D/MyWsT6uWMXbdylhzfdgiu82569STBKBGXgOQCY3MTsrhBlkaQ4+NwfB9eQsO8nc2rmN8mSMzy0oriYMEA1WQJzXd1Uh14rfMC2y6dD1s7yiE++yWXz54trsC/EylkwmE6TT4oPIJWd3UyTgrwHV4UDwpZFUq1ea8vTLFmYKvQSoZTNWzqEMX/UPWg1ThwcvpE762TX0NGH782VT29EdXJx2y
Content-Type: text/plain; charset="utf-8"
Content-ID: <2455AE94C0535C4B8421177CA2E5E737@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce362f3-e209-4269-fb2e-08d77f156853
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 15:10:21.6590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZMr5dt/vinhT/JH4GyJg8SHoYL+AtWpRkinQO74uRKNdBqmEfNzInaOqYn90pKoDQ9/YLNJok3A8LZyFeZV3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3678
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFZpLCAyMDE5LTExLTE1IGF0IDE0OjM0ICswMjAwLCBNaXJlbGEgUmFidWxlYSB3
cm90ZToNCj4gVjRMMiBkcml2ZXIgZm9yIHRoZSBKUEVHIGVuY29kZXIvZGVjb2RlciBmcm9tIGku
TVg4UVhQL2kuTVg4UU0NCj4gYXBwbGljYXRpb24NCj4gcHJvY2Vzc29ycy4NCj4gVGhlIG11bHRp
LXBsYW5hciBidWZmZXJzIEFQSSBpcyB1c2VkLg0KPiANCj4gQmFzZWxpbmUgYW5kIGV4dGVuZGVk
IHNlcXVlbnRpYWwganBlZyBkZWNvZGluZyBpcyBzdXBwb3J0ZWQuDQo+IFByb2dyZXNzaXZlIGpw
ZWcgZGVjb2RpbmcgaXMgbm90IHN1cHBvcnRlZCBieSB0aGUgSVAuDQo+IFN1cHBvcnRzIGVuY29k
ZSBhbmQgZGVjb2RlIG9mIHZhcmlvdXMgZm9ybWF0czoNCj4gwqDCoMKgwqDCoFlVVjQ0NCwgWVVW
NDIyLCBZVVY0MjAsIFJHQiwgQVJHQiwgR3JheQ0KPiBZVVY0MjAgaXMgdGhlIG9ubHkgbXVsdGkt
cGxhbmFyIGZvcm1hdCBzdXBwb3J0ZWQuDQo+IE1pbmltdW0gcmVzb2x1dGlvbiBpcyA2NCB4IDY0
LCBtYXhpbXVtIDgxOTIgeCA4MTkyLg0KPiBUaGUgYWxpZ25tZW50IHJlcXVpcmVtZW50cyBmb3Ig
dGhlIHJlc29sdXRpb24gZGVwZW5kIG9uIHRoZSBmb3JtYXQsDQo+IG11bHRpcGxlIG9mIDE2IHJl
c29sdXRpb25zIHNob3VsZCB3b3JrIGZvciBhbGwgZm9ybWF0cy4NCj4gDQo+IHY0bDItY29tcGxp
YW5jZSB0ZXN0cyBhcmUgcGFzc2luZywgaW5jbHVkaW5nIHRoZQ0KPiBzdHJlYW1pbmcgdGVzdHMs
ICJ2NGwyLWNvbXBsaWFuY2UgLXMiDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgUmFidWxl
YSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IEZp
eCB2NGwyLWNvbXBsaWFuY2Ugc3RyZWFtaW5nIHRlc3RzLCAidjRsMi1jb21wbGlhbmNlIC1zIg0K
PiArCXJldHVybiAwOw0KPiArfQ0KDQpBbnkgbmV3IGZlZWRiYWNrIGFmdGVyIHRoZSB2MiBmb3Ig
dGhpcyBwYXRjaD8gT3IgZm9yIHRoZSBlbnRpcmUgcGF0Y2gNCnNldD8NCg0KVGhlIHN0YXR1cyBz
byBmYXIgaXM6DQpQYXRjaCAjMSBnb3QgUmV2aWV3ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxw
YXVsLmtvY2lhbGtvd3NraUBib290bGluLg0KY29tPg0KUGF0Y2ggIzIgZ290IG5vIGZlZWRiYWNr
Lg0KUGF0Y2ggIzMgZ290IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
Pg0KUGF0Y2ggIzQgaXMgYXQgdjIsIGFmdGVyIGZpeGluZyB2NGwyLWNvbXBsaWFuY2Ugc3RyZWFt
aW5nIHRlc3RzLCB0aGFua3MNCkhhbnMgVmVya3VpbCBmb3IgZmVlZGJhY2suIFRoZXJlIHdhcyBt
b3JlIGZlZWRiYWNrIGZyb20gRXplcXVpZWwgR2FyY2lhDQpyZWxhdGVkIHRvIGNvbW1vbiBKUEVH
IGNvZGUsIEkgdHJpZWQgdXNpbmcgUGhpbGlwcCBaYWJlbCdzIHY0bDIgSlBFRw0KaGVscGVycyBw
YXRjaCwgYnV0IEkgY2Fubm90IHVzZSBpdCAiYXMtaXMiLCBJJ20gZXhwZWN0aW5nIHRoZSBuZXh0
DQp2ZXJzaW9uLg0KUGF0Y2ggIzUgZ290IG5vIGZlZWRiYWNrDQoNCkZvciB0aGUgcmVmZXJlbmNl
LCB0aGlzIGlzIHRoZSBsYXRlc3Qgb3V0cHV0IGZyb20gdjRsMi1jb21wbGlhbmNlOg0KDQouL3Y0
bDItY29tcGxpYW5jZSAtLWRldmljZSAvZGV2L3ZpZGVvMSAtcw0KdjRsMi1jb21wbGlhbmNlIFNI
QTogNmM0MTVhMTFmY2ViMzIwNjdjZGI1YzJlMzNmOTBkYmYwMTgxODJhNCwgNjQgYml0cw0KDQpD
b21wbGlhbmNlIHRlc3QgZm9yIG14Yy1qcGVnIGRlY29kZSBkZXZpY2UgL2Rldi92aWRlbzE6DQoN
CkRyaXZlciBJbmZvOg0KCURyaXZlciBuYW1lwqDCoMKgwqDCoMKgOiBteGMtanBlZyBkZWNvZGUN
CglDYXJkIHR5cGXCoMKgwqDCoMKgwqDCoMKgOiBteGMtanBlZyBkZWNvZGVyDQoJQnVzIGluZm/C
oMKgwqDCoMKgwqDCoMKgwqA6IHBsYXRmb3JtOjU4NDUwMDAwLmpwZWdlbmMNCglEcml2ZXIgdmVy
c2lvbsKgwqDCoDogNS41LjANCglDYXBhYmlsaXRpZXPCoMKgwqDCoMKgOiAweDg0MjA0MDAwDQoJ
CVZpZGVvIE1lbW9yeS10by1NZW1vcnkgTXVsdGlwbGFuYXINCgkJU3RyZWFtaW5nDQoJCUV4dGVu
ZGVkIFBpeCBGb3JtYXQNCgkJRGV2aWNlIENhcGFiaWxpdGllcw0KCURldmljZSBDYXBzwqDCoMKg
wqDCoMKgOiAweDA0MjA0MDAwDQoJCVZpZGVvIE1lbW9yeS10by1NZW1vcnkgTXVsdGlwbGFuYXIN
CgkJU3RyZWFtaW5nDQoJCUV4dGVuZGVkIFBpeCBGb3JtYXQNCglEZXRlY3RlZCBKUEVHIEVuY29k
ZXINCg0KUmVxdWlyZWQgaW9jdGxzOg0KCXRlc3QgVklESU9DX1FVRVJZQ0FQOiBPSw0KDQpBbGxv
dyBmb3IgbXVsdGlwbGUgb3BlbnM6DQoJdGVzdCBzZWNvbmQgL2Rldi92aWRlbzEgb3BlbjogT0sN
Cgl0ZXN0IFZJRElPQ19RVUVSWUNBUDogT0sNCgl0ZXN0IFZJRElPQ19HL1NfUFJJT1JJVFk6IE9L
DQoJdGVzdCBmb3IgdW5saW1pdGVkIG9wZW5zOiBPSw0KDQpEZWJ1ZyBpb2N0bHM6DQoJdGVzdCBW
SURJT0NfREJHX0cvU19SRUdJU1RFUjogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0Nf
TE9HX1NUQVRVUzogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCklucHV0IGlvY3RsczoNCgl0ZXN0IFZJ
RElPQ19HL1NfVFVORVIvRU5VTV9GUkVRX0JBTkRTOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0
IFZJRElPQ19HL1NfRlJFUVVFTkNZOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19T
X0hXX0ZSRVFfU0VFSzogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfRU5VTUFVRElP
OiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1MvRU5VTUlOUFVUOiBPSyAoTm90
IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1NfQVVESU86IE9LIChOb3QgU3VwcG9ydGVkKQ0K
CUlucHV0czogMCBBdWRpbyBJbnB1dHM6IDAgVHVuZXJzOiAwDQoNCk91dHB1dCBpb2N0bHM6DQoJ
dGVzdCBWSURJT0NfRy9TX01PRFVMQVRPUjogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJ
T0NfRy9TX0ZSRVFVRU5DWTogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfRU5VTUFV
RE9VVDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfRy9TL0VOVU1PVVRQVVQ6IE9L
IChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX0cvU19BVURPVVQ6IE9LIChOb3QgU3VwcG9y
dGVkKQ0KCU91dHB1dHM6IDAgQXVkaW8gT3V0cHV0czogMCBNb2R1bGF0b3JzOiAwDQoNCklucHV0
L091dHB1dCBjb25maWd1cmF0aW9uIGlvY3RsczoNCgl0ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVS
WV9TVEQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX0VOVU0vRy9TL1FVRVJZX0RW
X1RJTUlOR1M6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgVklESU9DX0RWX1RJTUlOR1NfQ0FQ
OiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1NfRURJRDogT0sgKE5vdCBTdXBw
b3J0ZWQpDQoNCkNvbnRyb2wgaW9jdGxzOg0KCXRlc3QgVklESU9DX1FVRVJZX0VYVF9DVFJML1FV
RVJZTUVOVTogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfUVVFUllDVFJMOiBPSyAo
Tm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HL1NfQ1RSTDogT0sgKE5vdCBTdXBwb3J0ZWQp
DQoJdGVzdCBWSURJT0NfRy9TL1RSWV9FWFRfQ1RSTFM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRl
c3QgVklESU9DXyhVTilTVUJTQ1JJQkVfRVZFTlQvRFFFVkVOVDogT0sgKE5vdCBTdXBwb3J0ZWQp
DQoJdGVzdCBWSURJT0NfRy9TX0pQRUdDT01QOiBPSyAoTm90IFN1cHBvcnRlZCkNCglTdGFuZGFy
ZCBDb250cm9sczogMCBQcml2YXRlIENvbnRyb2xzOiAwDQoNCkZvcm1hdCBpb2N0bHM6DQoJdGVz
dCBWSURJT0NfRU5VTV9GTVQvRlJBTUVTSVpFUy9GUkFNRUlOVEVSVkFMUzogT0sNCgl0ZXN0IFZJ
RElPQ19HL1NfUEFSTTogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBWSURJT0NfR19GQlVGOiBP
SyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFZJRElPQ19HX0ZNVDogT0sNCgl0ZXN0IFZJRElPQ19U
UllfRk1UOiBPSw0KCXRlc3QgVklESU9DX1NfRk1UOiBPSw0KCXRlc3QgVklESU9DX0dfU0xJQ0VE
X1ZCSV9DQVA6IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgQ3JvcHBpbmc6IE9LIChOb3QgU3Vw
cG9ydGVkKQ0KCXRlc3QgQ29tcG9zaW5nOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFNjYWxp
bmc6IE9LDQoNCkNvZGVjIGlvY3RsczoNCgl0ZXN0IFZJRElPQ18oVFJZXylFTkNPREVSX0NNRDog
T0sNCgl0ZXN0IFZJRElPQ19HX0VOQ19JTkRFWDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoJdGVzdCBW
SURJT0NfKFRSWV8pREVDT0RFUl9DTUQ6IE9LDQoNCkJ1ZmZlciBpb2N0bHM6DQoJdGVzdCBWSURJ
T0NfUkVRQlVGUy9DUkVBVEVfQlVGUy9RVUVSWUJVRjogT0sNCgl0ZXN0IFZJRElPQ19FWFBCVUY6
IE9LDQoJdGVzdCBSZXF1ZXN0czogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNClRlc3QgaW5wdXQgMDoN
Cg0KU3RyZWFtaW5nIGlvY3RsczoNCgl0ZXN0IHJlYWQvd3JpdGU6IE9LIChOb3QgU3VwcG9ydGVk
KQ0KCXRlc3QgYmxvY2tpbmcgd2FpdDogT0sNCglWaWRlbyBDYXB0dXJlIE11bHRpcGxhbmFyOiBD
YXB0dXJlZCA1OCBidWZmZXJzwqDCoMKgwqANCgl0ZXN0IE1NQVAgKG5vIHBvbGwpOiBPSw0KCVZp
ZGVvIENhcHR1cmUgTXVsdGlwbGFuYXI6IENhcHR1cmVkIDU4IGJ1ZmZlcnPCoMKgwqDCoA0KCXRl
c3QgTU1BUCAoc2VsZWN0KTogT0sNCglWaWRlbyBDYXB0dXJlIE11bHRpcGxhbmFyOiBDYXB0dXJl
ZCA1OCBidWZmZXJzwqDCoMKgwqANCgl0ZXN0IE1NQVAgKGVwb2xsKTogT0sNCgl0ZXN0IFVTRVJQ
VFIgKG5vIHBvbGwpOiBPSyAoTm90IFN1cHBvcnRlZCkNCgl0ZXN0IFVTRVJQVFIgKHNlbGVjdCk6
IE9LIChOb3QgU3VwcG9ydGVkKQ0KCXRlc3QgRE1BQlVGOiBDYW5ub3QgdGVzdCwgc3BlY2lmeSAt
LWV4cGJ1Zi1kZXZpY2UNCg0KVG90YWwgZm9yIG14Yy1qcGVnIGRlY29kZSBkZXZpY2UgL2Rldi92
aWRlbzE6IDUxLCBTdWNjZWVkZWQ6IDUxLA0KRmFpbGVkOiAwLCBXYXJuaW5nczogMA0KDQpUaGFu
a3MsDQpNaXJlbGE=
