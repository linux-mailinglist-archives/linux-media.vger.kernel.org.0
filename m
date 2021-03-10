Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C798333CAA
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 13:33:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhCJMdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 07:33:13 -0500
Received: from mail-eopbgr80058.outbound.protection.outlook.com ([40.107.8.58]:49666
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232255AbhCJMdK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 07:33:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGesfaXU/QEsKKtrSoTZVAPghHSGT3T7gNXc/Bhfl07+5Om7Xdd3GzpCMq/oHDQqbYl0Oc/3pZoFIT6TcYLAq4xiW4IyPdqxS5WEfujviLwAdHkV59gojtQ7YGR37C/eVloPIk0QLxATjRcG5Lx4CS/CgSDFFjVkpI67mPmvuUwCsI9sfDkKcTX4+4myvPkE0MTENTimNOXv6aTRrTCnHkdJDIMYsZgcfC2x+kG6bPmnFDipHSH+yT6Ljvl8swZvo6YUUgQca+jKv7FDNkDf3UC5Ep3MXXoJgXdmYINy0HKsg+gqXUpF4oRM+QrBiRbAoBOhohX0b4K15rv07D1B9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEdbd9JFRj2jPwHglvK90Q8pCFtUcSPmTxm89HVS3H4=;
 b=SUgY8Xm+lTVOKdpoBw5Wrnv80DUq5mhNf7lk9I51jzBRLPXJYHEGID7H2H93gKumWyAEwQx40OA5q/iXiaaV4Of/0Z+5qrgpEkb4t0CXfs8SCVbyeShSw64DigDidv294VP2Fb4J0c7vY02qDVljU/h1XuqB9MH4JZN2M0ZPrG2yQSBw4K82Q+C/8CUQtKuXz4Fgnfv6MaHbcq4KxUT/u+ds//5bXjHmN3i4MT6n35vD6A4InP8/sDsxaQ/THZC06AhKwoXvBdZ+VK2tcj2mo7qKHP0pXPd73F7QAJ+B0ozook26Aw9iLBISB122nIgHQGaDh2ynu6NGUNLvpqA7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEdbd9JFRj2jPwHglvK90Q8pCFtUcSPmTxm89HVS3H4=;
 b=Z2AbnCVmQZHxtTEVZJB3OrIOTxWzn0vW2TVuE3bcG4nLzqlzPHjhPOlyxczLhaZpSqJPoLzzrJUikmz/BX7OX8cY39HOVQcugg9VeJd65rZIm3QMPS8X8vhKTjt1x+AhBawiSs7C03EqMZ8kvF5kNLsqL8qE+4s17Z0Y2UoMfDY=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 12:33:08 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 12:33:08 +0000
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
Subject: Re: [EXT] Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH v7 3/9] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
Thread-Index: AQHW6E/7msGb4xtlMUO/sDEedUC5Hqouy8aAgDYAGYCAD1DpAIAJY8MA
Date:   Wed, 10 Mar 2021 12:33:07 +0000
Message-ID: <72006a57d2501cf85da181d67ed4727f12528eb9.camel@nxp.com>
References: <20210111192822.12178-1-mirela.rabulea@oss.nxp.com>
         <20210111192822.12178-4-mirela.rabulea@oss.nxp.com>
         <bec844f0-692f-de1e-a52d-a836ff792ef6@xs4all.nl>
         <3518c6c773b2bbd2cf818c1cf3109a9fa06720f7.camel@nxp.com>
         <4f03ecbf-2997-6c56-92c9-16f9e1f0f574@xs4all.nl>
In-Reply-To: <4f03ecbf-2997-6c56-92c9-16f9e1f0f574@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5c0db647-b952-4c4d-7673-08d8e3c0a8f8
x-ms-traffictypediagnostic: AM7PR04MB7160:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71608746E5E95403C66CE25A8F919@AM7PR04MB7160.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D33NUJb2u115cK0PUDcLYD/p9F0M+sDqQ6YWkh0GM1JtZIqGf8HCM4IjJRb4hO0S5SiO9sH4oQleIkd8VxQRWfv8LIKFmquD2+TC5+UjRsvH9wTyBlbRVM0oRKfxXSSsujRmHmQlg4Mi3aAJ03FYLsqVGp956bQicjHArxxflmwpwAk6JHDAWw4aHJOHBKw3TcowMiS6+fjv/BsEVYsD4mCQ/kUdtJiHt22ka8gylgI75VhVQbqW0Eo5LmAqt31Zg3USIIVUIu1mrwbYqxsYTYrY+HWX8Q38SN3s/qqFMD5UaNj6X/mHBC8n/pNayuo4hKuZhmlib9XvBngdurwLJgLzOWBxHIYEYQ+45UPtKSUKlUF/tf3s/YLdgrXdiU8QjXYG0eY9QMT86+t8TlupHHbtkV/uT76kqDVbv2TY65Y0e9LDaMeUEfwTfViIeFUa9abTVqnzmREiQTswvo1goUnZk+DDCDE13Flrl66qqreU2vlFeBRYmp/NYMPTDEmFp2LafW6wh0V8oW5c7NB05xm7AVpG0UgDOZJM4jFDIgOhbGJaaYoqc0p0sf4gUege
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(6512007)(478600001)(6486002)(36756003)(5660300002)(4326008)(7416002)(54906003)(53546011)(110136005)(44832011)(26005)(66476007)(316002)(66946007)(66556008)(2616005)(64756008)(83380400001)(2906002)(186003)(6506007)(8676002)(86362001)(8936002)(91956017)(76116006)(66446008)(71200400001)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QjNRd1Jwcm85VVlMbVhmYVFMRnk2K0tWYjFqS05WSE1TczdiQ1pkZ2dLdStW?=
 =?utf-8?B?UDNwQkVJTW5WemRoY2FUdVJTemZkK0JwbW5qV2MxWnJyd3NCd2dJMjF3dGRq?=
 =?utf-8?B?WmRQQWt6NS9mcXNUSjFmdkhPbGI0N0lyZzVLRXJkVStZS3pqVTQ2cUdUbUtm?=
 =?utf-8?B?ZWMyaGZ1V3N0VFJOUmhOU0hlRzdPbnZMY1BQdFQ4U3htYy9oUHdLamdEZ0dv?=
 =?utf-8?B?c1BDZEY2SzNyT3pqdnVDYVhFMjNTMFo5d2thQmN4cWxJeUhRM21xKzZZSUwv?=
 =?utf-8?B?ZFp3TXVXRnhsM1d6NitWT3pIekFNSkxIZHdyeFQ2WnBBTkk4K21HRVB1R1Bl?=
 =?utf-8?B?V2lVWnNCdE9vWHIvQ3NVQWEyT3MrZzBEWEVoRHJiYU1sRnNkR2xrRG9UTDgv?=
 =?utf-8?B?a0FIS0hQaFdZSnFCYVhWdWdzb3hPdVptSWJadFBlbHBRc3JqRS9iSCs5UExM?=
 =?utf-8?B?aWZ3NHpaWmNDdFo3K09Cd3Bqam5BVTZSaUxWRGJTWlBCeVZFRWVqazFLaW5N?=
 =?utf-8?B?NkFyQ3NUMHRoYncwODFqaG9wcW9pdUJqa0xCcy9KcGVQQjQweXpMbW1lajdI?=
 =?utf-8?B?RTE2aXZlN0t6bzVpZkw4RTZGR0RmWVdseVVFM2swVWtBeCtpY1BWRWxBK2Q1?=
 =?utf-8?B?L2dvZC9LemJkb3hRODROTm5xMTMvTjV4UkVOaW5rVm0zTWJGYytyc3I1ZnJK?=
 =?utf-8?B?U1dQcEVlL0swblJMRW5ZZFlORE45aFlKbFVYdmNMNUV0ZXpBTU90dEtkaU5p?=
 =?utf-8?B?bURndFkzVmlIQ1lDKzZReVRmQlc4QTd0TGZOYUQ0RklqcncrNTVkZUdURlQ3?=
 =?utf-8?B?K1p3OWZFRXpiT0szcGNLc0hsVWRTVGpINDN6b2xmcDNaSzU5Q2ZUYmF2aGxY?=
 =?utf-8?B?Q2I5eTVIWDVYQkhpc2d1WG96K1RlS0RXTVBoSzZxK2tmRFNRMGVTUjZ3U0pS?=
 =?utf-8?B?OHRuTmJVQzU4amJBa01CclJrVnErV3QxM0M5T3RQVEVsZ3JiYkRxempxUllr?=
 =?utf-8?B?eWdLNFNnMHdqNjdONjlhbTRJY0xRZUZBZmdaenk2Q3FaT1d3TEcySFpQMkEw?=
 =?utf-8?B?djhkaVRRUExLUzVGMGIvM1MxNEdhb1dCMkIrdTloRlF5RzNHWWhhZHo0cWlE?=
 =?utf-8?B?c2V4bE8zODdVRFBDeHNKVjhVSmNxNGtSdWNraVNGbFlmMTB1VVEwMHRoMGI1?=
 =?utf-8?B?ZFVPT2orMEpucnBGNDl4ZG1MUXk5Vnl5UWt4bXJCeUh2ZlcrZkVxRXJEU20x?=
 =?utf-8?B?dDF4S05hLzFnZW5XbkZab1d2dGRCd2hPemtYSzdIR1lmN2xTWkxUdUVTTVFH?=
 =?utf-8?B?VUFpRERrWGhSRHBBbGg0SUkrRFI1T01Mam9QUjVUbFMxNzViVGllL0JJRDdV?=
 =?utf-8?B?WGdtcUNwZ1JkZi9FejdsNTg2dmcyZjRJamhKSlpqSWRudGVrV0c1Si8zWXQ1?=
 =?utf-8?B?MlFTQjBKOTJhZnB6N2Frc2l2SmlGQnJsLzhQUGExT2tralJYMUY0a3Q5cWpN?=
 =?utf-8?B?Nkl0L2FnSUlaWDMycG5MTmlaWS9RUExyZXpRSE9CdEdZNmlDUkNkZElETWk5?=
 =?utf-8?B?V3AvS3pJZVVIUkxNN0FSL0pKRUg3ZFpxenhETkdXcWx5UHRLNzBKUGNUTlI2?=
 =?utf-8?B?Ukh4dWk4bzU2c1U3VGJjVDNXSmlwN0tQOU1RMnpOeGczMitZaEs0V2F0M0ts?=
 =?utf-8?B?L3VlVjFLMHlPN1E5cEIwN1QydEhvOTFrdDVQckE2QUVoNngxRFNBbkkrYkdT?=
 =?utf-8?Q?f5PqpDvwGb62YeOADIzQTd1508tkLJK6YC3GyWK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FC8F4C39C93A543BD962FDE8FA62489@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0db647-b952-4c4d-7673-08d8e3c0a8f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 12:33:07.9757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWkGFxtawdDBPMNJ2Eowx6s39vyxiMdCptEbgKUJR8sn+4HAfyrK++UUULjLzjdw+h3aVHDwDeRUUMVG27gIlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KT24gVGh1LCAyMDIxLTAzLTA0IGF0IDE0OjAzICswMTAwLCBIYW5zIFZlcmt1
aWwgd3JvdGU6DQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gT24gMjIvMDIvMjAyMSAyMDow
OSwgTWlyZWxhIFJhYnVsZWEgd3JvdGU6DQo+ID4gSGkgSGFucywNCj4gPiBhcHBvbG9naWVzIGZv
ciBteSBsYXRlIHJlc3BvbnNlLCBwbGVhc2Ugc2VlIGJlbG93IDIgY29tbWVudHMuDQo+IA0KPiBS
ZXBsaWVzIGJlbG93Og0KPiANCj4gPiANCj4gPiBPbiBUdWUsIDIwMjEtMDEtMTkgYXQgMTE6MzEg
KzAxMDAsIEhhbnMgVmVya3VpbCB3cm90ZToNCj4gPiA+IENhdXRpb246IEVYVCBFbWFpbA0KPiA+
ID4gDQo+ID4gPiBPbiAxMS8wMS8yMDIxIDIwOjI4LCBNaXJlbGEgUmFidWxlYSB3cm90ZToNCj4g
PiA+ID4gRnJvbTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+ID4g
PiA+IA0KPiA+ID4gPiBWNEwyIGRyaXZlciBmb3IgdGhlIEpQRUcgZW5jb2Rlci9kZWNvZGVyIGZy
b20gaS5NWDhRWFAvaS5NWDhRTQ0KPiA+ID4gPiBhcHBsaWNhdGlvbg0KPiA+ID4gPiBwcm9jZXNz
b3JzLg0KPiA+ID4gPiBUaGUgbXVsdGktcGxhbmFyIGJ1ZmZlcnMgQVBJIGlzIHVzZWQuDQo+ID4g
PiA+IA0KPiA+ID4gPiBCYXNlbGluZSBhbmQgZXh0ZW5kZWQgc2VxdWVudGlhbCBqcGVnIGRlY29k
aW5nIGlzIHN1cHBvcnRlZC4NCj4gPiA+ID4gUHJvZ3Jlc3NpdmUganBlZyBkZWNvZGluZyBpcyBu
b3Qgc3VwcG9ydGVkIGJ5IHRoZSBJUC4NCj4gPiA+ID4gU3VwcG9ydHMgZW5jb2RlIGFuZCBkZWNv
ZGUgb2YgdmFyaW91cyBmb3JtYXRzOg0KPiA+ID4gPiAgICAgIFlVVjQ0NCwgWVVWNDIyLCBZVVY0
MjAsIFJHQiwgQVJHQiwgR3JheQ0KPiA+ID4gPiBZVVY0MjAgaXMgdGhlIG9ubHkgbXVsdGktcGxh
bmFyIGZvcm1hdCBzdXBwb3J0ZWQuDQo+ID4gPiA+IE1pbmltdW0gcmVzb2x1dGlvbiBpcyA2NCB4
IDY0LCBtYXhpbXVtIDgxOTIgeCA4MTkyLg0KPiA+ID4gPiBUaGUgYWxpZ25tZW50IHJlcXVpcmVt
ZW50cyBmb3IgdGhlIHJlc29sdXRpb24gZGVwZW5kIG9uIHRoZQ0KPiA+ID4gPiBmb3JtYXQsDQo+
ID4gPiA+IG11bHRpcGxlIG9mIDE2IHJlc29sdXRpb25zIHNob3VsZCB3b3JrIGZvciBhbGwgZm9y
bWF0cy4NCj4gPiA+ID4gDQo+ID4gPiA+IHY0bDItY29tcGxpYW5jZSB0ZXN0cyBhcmUgcGFzc2lu
ZywgaW5jbHVkaW5nIHRoZQ0KPiA+ID4gPiBzdHJlYW1pbmcgdGVzdHMsICJ2NGwyLWNvbXBsaWFu
Y2UgLXMiDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgUmFidWxlYSA8
bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IENoYW5nZXMgaW4g
djc6DQo+ID4gPiA+ICAgQWRkIHByaW50X214Y19idWYoKSB0byByZXBsYWNlIHByaW50X2J1Zl9w
cmV2aWV3KCkgYW5kDQo+ID4gPiA+IHByaW50X25idWZfdG9fZW9pKCksDQo+ID4gPiA+ICAgYW5k
IGluc2lkZSwgdXNlIHRoZSBwcmludF9oZXhfZHVtcCgpIGZyb20gcHJpbnRrLmgsIGFsc28sDQo+
ID4gPiA+IHByaW50DQo+ID4gPiA+IGFsbCB0aGUgcGxhbmVzLg0KPiA+ID4gPiANCj4gPiA+ID4g
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAgIDIgKw0K
PiA+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwg
ICAgMSArDQo+ID4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL0tjb25maWcg
ICAgICAgfCAgIDEwICsNCj4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcv
TWFrZWZpbGUgICAgICB8ICAgIDMgKw0KPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9p
bXgtanBlZy9teGMtanBlZy1ody5jIHwgIDE2OCArKw0KPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9pbXgtanBlZy9teGMtanBlZy1ody5oIHwgIDE0MCArDQo+ID4gPiA+ICBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMgICAgfCAyMjg5DQo+ID4gPiA+ICsr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVn
L214Yy1qcGVnLmggICAgfCAgMTg0ICsrDQo+ID4gPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDI3OTcg
aW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vaW14LWpwZWcvS2NvbmZpZw0KPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvTWFrZWZpbGUNCj4gPiA+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLQ0KPiA+
ID4gPiBody5jDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9pbXgtanBlZy9teGMtanBlZy0NCj4gPiA+ID4gaHcuaA0KPiA+ID4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KPiA+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcv
bXhjLWpwZWcuaA0KPiA+ID4gDQo+ID4gPiBPbmUgaGlnaC1sZXZlbCBjb21tZW50OiB3aHkgaW50
cm9kdWNlIHRoZSBkcml2ZXIgaW4gcGF0Y2ggMy85IGFuZA0KPiA+ID4gdGhlbg0KPiA+ID4gY2hh
bmdlIGl0IGFnYWluIGluIDkvOT8gSSB3b3VsZCB2ZXJ5IG11Y2ggcHJlZmVyIHRvIGhhdmUganVz
dCBhDQo+ID4gPiBzaW5nbGUNCj4gPiA+IHBhdGNoIHRoYXQgYWRkcyB0aGlzIGRyaXZlciwgaS5l
LiBtZXJnZSBwYXRjaCAzIGFuZCA5IGludG8gYQ0KPiA+ID4gc2luZ2xlDQo+ID4gPiBwYXRjaC4N
Cj4gPiANCj4gPiBJIGNhbiBzcXVhc2ggcGF0Y2ggOSBpbnRvIHBhdGNoIDMsIGJ1dCBwbGVhc2Ug
bm90ZSB0aGF0IHBhdGNoIDkNCj4gPiBkZXBlbmRzDQo+ID4gb24ganBlZyBoZWxwZXIgcGF0Y2hl
cyA2LDcsOCwgc28gdGhlc2UgcGF0Y2hlcyB3aWxsIGFsc28gaGF2ZSB0bw0KPiA+IG1vdmUNCj4g
PiBiZWZvcmUgcGF0Y2ggMy4gTGV0IG1lIGtub3cgeW91dCB0aG91Z2h0IGFuZCBJJ2xsIGRvIHRo
aXMgaW4gdjksIGluDQo+ID4gdjgNCj4gPiB2ZXJzaW9uIEkgb25seSBhZGRyZXNzZWQgdGhlIHJl
c3Qgb2YgeW91ciBmZWVkYmFjayBhbmQgc29tZSBtb3JlDQo+ID4gZnJvbQ0KPiA+IFBoaWxpcHAu
DQo+IA0KPiBZZXMsIGp1c3QgbW92ZSB0aGUganBlZyBoZWxwZXIgdG8gZWFybGllciBpbiB0aGUg
cGF0Y2ggc2VyaWVzLg0KPiANCj4gPiANCj4gPiA+IA0KPiANCj4gPHNuaXA+DQo+IA0KPiA+ID4g
PiArICAgICAvKiBmaXggY29sb3JzcGFjZSBpbmZvcm1hdGlvbiB0byBzUkdCIGZvciBib3RoIG91
dHB1dCAmDQo+ID4gPiA+IGNhcHR1cmUgKi8NCj4gPiA+ID4gKyAgICAgcGl4X21wLT5jb2xvcnNw
YWNlID0gVjRMMl9DT0xPUlNQQUNFX1NSR0I7DQo+ID4gPiA+ICsgICAgIHBpeF9tcC0+eWNiY3Jf
ZW5jID0gVjRMMl9ZQ0JDUl9FTkNfNjAxOw0KPiA+ID4gPiArICAgICBwaXhfbXAtPnhmZXJfZnVu
YyA9IFY0TDJfWEZFUl9GVU5DX1NSR0I7DQo+ID4gPiA+ICsgICAgIHBpeF9tcC0+cXVhbnRpemF0
aW9uID0gVjRMMl9RVUFOVElaQVRJT05fRlVMTF9SQU5HRTsNCj4gPiA+IA0KPiA+ID4gU28gWVVW
IGZvcm1hdHMgYXJlIGV4cGVjdGVkIHRvIGJlIGZ1bGwgcmFuZ2UgYXMgd2VsbD8gQm90aCB3aGVu
DQo+ID4gPiBlbmNvZGluZw0KPiA+ID4gYW5kIGRlY29kaW5nPw0KPiA+IA0KPiA+IEkgc2V0IHRo
ZSBjb2xvcnNwYWNlIGluZm9ybWF0aW9uIGxpa2UgdGhhdCBiYXNlZCBvbiB0aGlzIGNvbW1lbnQ6
DQo+ID4gICAgICAgLyoNCj4gPiAgICAgICAgKiBFZmZlY3RpdmVseSBzaG9ydGhhbmQgZm9yIFY0
TDJfQ09MT1JTUEFDRV9TUkdCLA0KPiA+IFY0TDJfWUNCQ1JfRU5DXzYwMQ0KPiA+ICAgICAgICAq
IGFuZCBWNEwyX1FVQU5USVpBVElPTl9GVUxMX1JBTkdFLiBUbyBiZSB1c2VkIGZvciAoTW90aW9u
LQ0KPiA+IClKUEVHLg0KPiA+ICAgICAgICAqLw0KPiA+ICAgICAgIFY0TDJfQ09MT1JTUEFDRV9K
UEVHICAgICAgICAgID0gNywNCj4gPiANCj4gDQo+IEluc2lkZSBhIEpQRUcgdGhlIFlVViBxdWFu
dGl6YXRpb24gaXMgdXNpbmcgZnVsbCByYW5nZS4gQnV0IHdoZW4geW91DQo+ICpkZWNvZGUqIGEg
SlBFRyB0aGUgWVVWIHF1YW50aXphdGlvbiBpbiB0aGUgcmF3IGRlY29kZWQgaW1hZ2UgaXMNCj4g
bm9ybWFsbHkgbGltaXRlZCByYW5nZSBhZ2FpbiAodGhlIGRlZmF1bHQgZm9yIFlVVikuDQo+IA0K
PiBJdCBkZXBlbmRzIG9uIHdoYXQgdGhpcyBkZWNvZGVyIGRvZXM6IG1vc3Qgd2lsbCBkZWNvZGUg
dG8gbGltaXRlZA0KPiByYW5nZSBZVVYsIHNvbWUgZGVjb2RlIHRvIGZ1bGwgcmFuZ2UgWVVWIChp
biB3aGljaCBjYXNlIHRoaXMgY29kZQ0KPiB3b3VsZCBiZQ0KPiBjb3JyZWN0KSwgYW5kIHNvbWUg
c3VwcG9ydCBib3RoLg0KDQpFeHBlcmltZW50YWxseSwgSSBzYXcgdGhlIGRlY29kZXIgb3V0cHV0
cyBmdWxsLXJhbmdlIHZhbHVlcywgYnV0IEkgd2FzDQpub3Qgc3VyZSBhYm91dCBsaW1pdGVkLXJh
bmdlIHN1cHBvcnQsIHNvIEkgYXNrZWQgb3VyIElQIG93bmVyLCBhbmQgSQ0KZ290IHRoaXMgYW5z
d2VyOg0KIlRoZSBkZWNvZGVyIGRvZXMgbm90IGFsdGVyIHRoZSByYW5nZSBvZiB0aGUgZGF0YSBp
biBhbnkgd2F5LiANCkl0IG91dHB1dHMgdGhlIHNhbWUgZnVsbCBvciBsaW1pdGVkIHJhbmdlIGRh
dGEgdGhhdCB3YXMgZ2l2ZW4gdG8gdGhlDQplbmNvZGVyLiINCg0KU28sIHN1cmVseSBvdXIgZW5j
b2Rlci9kZWNvZGVyIGNhbm5vdCBjaGFuZ2UgdGhlIHJhbmdlIG9mIHRoZSBzYW1wbGVzLA0KYnV0
IGl0IGNvdWxkIHByb2Nlc3MgYm90aCBmdWxsIG9yIGhhbGYgcmFuZ2UuDQpJIHdhcyB0aGlua2lu
ZyBhYm91dCBhIHBvc3NpYmlsaXR5IHRvIGFsbG93IGEgaGFsZi1yYW5nZSBzdHJlYW1zDQpzY2Vu
YXJpbyAoaGFsZiByYW5nZSByYXcgZm9ybWF0IC0+IGVuY29kZXIgLT4ganBlZyB3aXRoIGhhbGYg
cmFuZ2U/Pz8NCi0+IGRlY29kZXIgLT4gaGFsZiByYW5nZSByYXcgZm9ybWF0KS4NClRoYXQgY291
bGQgYmUgYWNoaWV2ZWQgYnkgYWxsb3dpbmcgdXNlciB0byBjaG9vc2UgKHNwZWNpZnkpIHRoZQ0K
cXVhbnRpemF0aW9uIGZvciB0aGUgb3V0cHV0IHN0cmVhbSwgYW5kIHRoZSBkcml2ZXIgd291bGQg
c2V0IHRoZSBzYW1lDQpmb3IgdGhlIGNhcHR1cmUgc3RyZWFtLCBidXQgdGhpcyB3b3VsZCByZXN1
bHQgaW4gYSBKUEVHIHdpdGggaGFsZiByYW5nZQ0KZm9yIHRoZSBjYXB0dXJlIHN0cmVhbS4NClNv
LCB5b3UgbWVudGlvbmVkIGluc2lkZSBKUEVHIHRoZSBZVVYgcXVhbnRpemF0aW9uIGlzIHVzaW5n
IGZ1bGwgcmFuZ2UsDQpleHBlcmllbmNlIGNvbmZpcm1zIGl0IChJIGRlY29kZWQgYSBqcGVnIHBy
b2R1Y2VkIHdpdGggZ2ltcCBhbmQgb25lDQp3aXRoIG1zLXBhaW50LCBhbmQgSSBzYXcgZnVsbCBy
YW5nZSB2YWx1ZXMpLCBhbmQgdjRsMi1jb21wbGlhbmNlIGZhaWxzDQppZiB0aGUgcGl4ZWwgZm9y
bWF0IGlzIEpQRUcgYW5kIHF1YW50aXphdGlvbiBpcyBub3QgZnVsbC4NCkknbSBub3Qgc3VyZSBp
ZiB0aGUgc3RhbmRhcmQgYWxsb3dzIGhhbGYtcmFuZ2UgSlBFRyAoaXQgd291bGQgYmUgYQ0Kc3Vi
c2V0IG9mIGZ1bGwtcmFuZ2UsIHNvIHRoZW9yZXRpY2FsbHkgcG9zc2libGUpLg0KDQpTbywgSSB3
aWxsIGp1c3QgYWRkIGEgY29tbWVudCB0byBjbGFyaWZ5IHRoZSBteGMtanBlZyBkcml2ZXIgd2ls
bA0KYWx3YXlzIHVzZSBmdWxsLXJhbmdlLg0KDQpUaGUgbXhjLWpwZWcgZHJpdmVyIHdpbGwgbm90
IHN1cHBvcnQgQ1NDLCB0aGVyZWZvciBpdCBpcyBub3Qgc2V0dGluZw0KVjRMMl9GTVRfRkxBR19D
U0NfQ09MT1JTUEFDRSBpbiB2NGwyX2ZtdGRlc2MgZHVyaW5nIGVudW1lcmF0aW9uLg0KU28sIHRo
ZSBhcHBsaWNhdGlvbiBjYW5ub3QgcmVxdWVzdCBhIHNwZWNpZmljIGNvbG9yc3BhY2UgZm9yIHRo
ZQ0KY2FwdHVyZSBzdHJlYW0uIE5vIGNoYW5nZSBuZWVkZWQgaGVyZS4NCg0KTGV0IG1lIGtub3cg
aWYgdGhpcyBzb3VuZHMgb2ssIGFuZCBJJ2xsIHNlbmQgdjkgd2l0aCB0aGUgYWRkZWQgY29tZW50
DQphbmQgdGhlIHNxdWFzaC4NCg0KVGhhbmtzLA0KTWlyZWxhDQoNCj4gDQo+IEluIHRoZSBsYXR0
ZXIgY2FzZSB5b3Ugd2FudCB0byBzdXBwb3J0IHRoZSBWNEwyX1BJWF9GTVRfRkxBR19TRVRfQ1ND
DQo+IGZsYWc6DQo+IA0KPiANCg0K
