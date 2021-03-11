Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04438336E8E
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 10:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhCKJMq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 04:12:46 -0500
Received: from mail-eopbgr30063.outbound.protection.outlook.com ([40.107.3.63]:16739
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231394AbhCKJMf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 04:12:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4D11P5ZOrq4QahnbLJbXf21CS2hZ0Pw+4i5kDg6IjNwRtmFB3oVwptf7rB8N4/v1glk5j8DrNCnaXFhqMYtTZ9NeqCkE3+Frlh2IQ+mAN18G4kZEAC+rjiuJDo1BA/8/CR+8sob2ehhvjzU99k3KovJux8oHdqbjQv/+xuM7PQM6kjazZAthJs/+YkWI53EGxtw1z4EV3LHYlDC1f8ofCW/fIfojH1XLNhk7NzlDyaOkOIQKHHW+u5JcPSo6dfptq5ZxGYn0v0YUI+MxHDdJOAKWzhUr0l+v/5XGrQw3Y57omt5a3UHg8F4g0GKyWQ/ZxNno6tLDS+NXarqYo7R1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTx1rchpnlmNl0cb6V1xP40nd648qm7PPH6Rsc1h/vs=;
 b=db9XcdU+BrNCRgzfMMQh8JhouHWKDKgv8UxA2dwjwYAfhniJfkINKrGRvE6b8Q1G5R95S3EQCpPg3ppV4rEnNu89mVtgpq87eqMK/CMDDvi+er7LdIrTEi2iSVmF5rz1GdqY61orqFRrbMN/OP0bGW9a/PINqLE3TfeQ3NtdXRbqVj77/TsMHAvLOknNSV2p6O0eRwpT2zQIm5hUlt5hjhSUV8ekpKd4rD9NYNnW572BlRjjEpyhOW33Shxo/rxTz9b68uV18W/0H+TPVAuHn6I0ZwJK2SV3qsRNS4X2Qi2VJRc0k1OLzgofllIEOSA2BUQL/hjvUIBdZNuCEfkTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTx1rchpnlmNl0cb6V1xP40nd648qm7PPH6Rsc1h/vs=;
 b=h8ou4vRsNiVBEazhs3PvUt+acyyPx1ROeciDCSPB+pdtyWXBiQkGVwN09s1cfGWT7Cl0PN76q/qqVLdNvhztetIsIR8DUhkLHpC1V4eqnO4uHafNyY6tCmRT3d1Itm5y9pDqFeI+uelSwHk44qR9fZThDVDT+5vRS07b5dc6NvM=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5365.eurprd04.prod.outlook.com (2603:10a6:20b:99::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 11 Mar
 2021 09:12:31 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::618c:8b68:e3d9:a8c6%7]) with mapi id 15.20.3912.029; Thu, 11 Mar 2021
 09:12:31 +0000
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
Subject: Re: [EXT] Re: [PATCH v9 6/8] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
Thread-Topic: [EXT] Re: [PATCH v9 6/8] media: imx-jpeg: Add V4L2 driver for
 i.MX8 JPEG Encoder/Decoder
Thread-Index: AQHXFg3GXP1IPhO4V0muJykbof5o1qp+Y9MAgAAdZAA=
Date:   Thu, 11 Mar 2021 09:12:31 +0000
Message-ID: <7ff5f190c66159773c67a1b4fc73e00751fb9c28.camel@nxp.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
         <20210311002854.13687-7-mirela.rabulea@oss.nxp.com>
         <58f6d308-c5c7-f2a0-9c64-b729282c9b71@xs4all.nl>
In-Reply-To: <58f6d308-c5c7-f2a0-9c64-b729282c9b71@xs4all.nl>
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
x-ms-office365-filtering-correlation-id: 406ac20d-ee21-4498-d14b-08d8e46dcd1c
x-ms-traffictypediagnostic: AM6PR04MB5365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5365250652CE08F3B1CEF0BF8F909@AM6PR04MB5365.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pc3NpC/PbqFXmXxoD+msCQjC50crE2w8g7utATvIURkJRd5AnJD46iyGcrElzARcZmRZQ56WtWmJt3Auun+OXZV1Vy0nHlrHXZl16ypxqYjYvVowolAdgpKKcMuhOUInOULYYUovFcW3BS9vnoZ1ZGfLL8NekpUFmejYm/kSPhMejrjuqHepx+41+qfYMGZfuSu0gNL0+vftI1IxDhHelxQspnm4t32F0Bmqqbs7Z8aKJylX5Ta5j1qMQu5r/d9Z0o+L7DqyMe243TwfDnfNQPqAuEb4nkc7qYxh3h2B9hYVXuV9G+nJ6PVJBze48xq2wjRUJPwnPBv6XVQk4dlK53yTCTwBt5zNTFOpN74BlZcLKK5TNiBFwC/Cs+s7TI6sBDgtdCipLQmVXKJ6YVbU+U7zbaa/wshoa8ZYpXeoz6AAzHcI12qVBKXyIVYt1SrS7dbZd8vAN4PvqDMJj7M8N8uIsh8C8BXgFwn90yw6RFAJPdco1jyjsEW+BUKRDqlz+iQcUvLzbq5Sp0+AA7OH2WhWrI5azF/Rc/0VFsE5MmsRO95C5huRISzM851yVMge
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(8936002)(6512007)(26005)(2906002)(86362001)(4326008)(7416002)(2616005)(71200400001)(44832011)(83380400001)(36756003)(76116006)(316002)(5660300002)(66556008)(91956017)(6486002)(66446008)(53546011)(186003)(64756008)(8676002)(66476007)(6506007)(478600001)(54906003)(110136005)(66946007)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?VTN5OFhDS0JIdk9xc1lFSVZxTTVPUEFCUTY4ZEN5Ti9kWGVHNDNTK1ozaFpy?=
 =?utf-8?B?QTFWM0FPNDF4cUN4QVR5U25OTE5CR0didTNpUlM3andLREtXQmM1Sm1Nbnk3?=
 =?utf-8?B?NXNpcXNvdXQxY3pKRWxxQlgwVlVIN3lUTXd0aXA2QU8xbi9MZ1EyUW1xOXFU?=
 =?utf-8?B?c0RNRGYwZGQyVVhrYU5nZzg5ZmVGMXVDTXFkLzk0emcweEY5Zlk0VnJucThy?=
 =?utf-8?B?VFJzdWk5L1AyNU53bDVuczMwdm16Z0xnVUtSeWd5N3IvZ0lJdlVKSldEaGhN?=
 =?utf-8?B?OWJSWHR5V0twVDFFNFdnbGw3Q05pZGR3cEk5OGJkUHlOSEJIaEJyUHRFODF4?=
 =?utf-8?B?dDMrS2dDc1JHMytmbUlsc2JOTzl4cEhkS29mVTZYYWExTHJUZzZmMjR3Z3hQ?=
 =?utf-8?B?Y1N4c2huZWlNS0puQ0dQR2h6WXNwdlhnNnRrbGRWRlBOdnRsbTdUOWJDd1p0?=
 =?utf-8?B?UmpVYTRwY2p6MmNXWnNtWFFsQ1BGZXRGcE1sbVBwWitab1QyZmFtN25yNFFi?=
 =?utf-8?B?SVgyVDloS1JQQnNLRDFRTDlSZ3hqRDBlcDRwc2dYZld5TFRLTEVtRW5sVEND?=
 =?utf-8?B?MkJhSmdVd3lqU2ZoTVRHTWRHMlRQTXMxQUt2YmJhcS9CUlljMllBM1VWZHZa?=
 =?utf-8?B?d1hZcUlndGNuWFluVWxGa0tlRDVMYlZma3Q0RGlXOVNBYStjL01MdnozWmJQ?=
 =?utf-8?B?MlhJMjBVSCtWdTBSNVpMMDJ0cFBNRk9lZGVBZ1JsNW1sNFpOekljSDc5Smly?=
 =?utf-8?B?YWVRMG5FUWs3N3F3aEdiWTc4TytEYWowWnFRSjFNSXBhNzlNSGtFb01zWXFR?=
 =?utf-8?B?ZmNjYnIvRFpoUWxVeXdUOWJuK2ZvK3E3WG9keU1DS1lYaHFYMnRzL1c3dldX?=
 =?utf-8?B?bFVjR1ZRajMxY0xaUUQrY21JeGk1MWppbndOUEVKTno1bkZXRU5jNUpwZlN6?=
 =?utf-8?B?cE8xZ3lvRjZRb3Zwclo3NmlxN1VmdzcyMGV5dWYxSHNXRmhsYTZwUyt0MEsx?=
 =?utf-8?B?RkQzOGdnekJuczVzUzZDQms1M2ZKNDFhbTdSRTUwREEvZEYwMFM4bzlya0Vv?=
 =?utf-8?B?bUQ1WjZSci9XZE41ZE1ManpDNStOS2V6aStxV3BOc08wQXp4UjRpdEg1ZUZl?=
 =?utf-8?B?ZXZnUWhOUnNqc0tGOUtRd0J4SE1aV0paakhwZ1dMMVU2MVBSSmFUOEoxQVc2?=
 =?utf-8?B?bmlHcDY5MGRvS2hJUHRCZzE2N1ZEd1JqNlBFQVRCZ3I1Mjc0aHJDeTJ4bGQw?=
 =?utf-8?B?ZmltLzlpbm1acWtuWUhkVm5taGI4RGZLYUtqSGxhRFB1WUdMUnZkRUlrVmE4?=
 =?utf-8?B?MjduRmIxVGsrV2MwYWllWlJLWm11UDFPUE1Udzh6N1N2d00vQ3RFaS9uaXg2?=
 =?utf-8?B?TVlQVzR0U0tOK3VDZER6c25FSkxoUklQd2wrU2ZYb0hwM2laYW5hdlprMncx?=
 =?utf-8?B?OVIvVVphQ0J6ZVFOcVk0bisxdnlyaDkwaUt6am1JN1lCWXhORERBaENpUFhn?=
 =?utf-8?B?TVJpM2gxT0dZVHFHdkFnREUwTUVXN1I0K0NsSDIvZ2RqeUNtWlBUeWVzTDkw?=
 =?utf-8?B?bWZZZ1FYUmxucUNVeHV0UlpzeWZQZENudmNMUUJCMEpkK2todEtJeWt3RFRp?=
 =?utf-8?B?ZHZnc1pqSkh5MUl2eVh4bGs4c2lISkwvVCtKdEZ1U0NpNlFRSjN1YXdNZmMx?=
 =?utf-8?B?UXhPMm1oc0VnbjNTRHV0b04rNklnc0loNFdNbS8rZU9CYW1aSWIwYzNobXdD?=
 =?utf-8?Q?gkCkl1Neu/86IfbsF6FduUHE/P+KXwFQ/IVr0hK?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <364527E2826A7A4798ACACBFBF58FA65@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406ac20d-ee21-4498-d14b-08d8e46dcd1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 09:12:31.5152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RDvRTbfm2LfIN+4vgNfr9ImR493KOVcXmRSf51/UtvVNerkWwZtA0O2iY++DRb69UHQQNmnhVfQ0LXwk4lXJgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5365
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIxLTAzLTExIGF0IDA4OjI3ICswMTAwLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+
IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gSGkgTWlyZWxhLA0KPiANCj4gT24gMTEvMDMvMjAy
MSAwMToyOCwgTWlyZWxhIFJhYnVsZWEgKE9TUykgd3JvdGU6DQo+IA0KPiA8c25pcD4NCj4gDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG14Y19qcGVnX21hdGNoW10gPSB7
DQo+ID4gKyAgICAgew0KPiA+ICsgICAgICAgICAgICAgLmNvbXBhdGlibGUgPSAibnhwLGlteDhx
eHAtanBnZGVjIiwNCj4gPiArICAgICAgICAgICAgIC5kYXRhICAgICAgID0gKHZvaWQgKilNWENf
SlBFR19ERUNPREUsDQo+IA0KPiBEb24ndCBkbyB0aGlzLCBqdXN0IHNheToNCj4gDQo+IHN0YXRp
YyBjb25zdCBpbnQgbXhjX2RlY29kZV9tb2RlID0gTVhDX0pQRUdfREVDT0RFOw0KPiBzdGF0aWMg
Y29uc3QgaW50IG14Y19lbmNvZGVfbW9kZSA9IE1YQ19KUEVHX0VOQ09ERTsNCj4gDQo+IGFuZCBw
b2ludCB0byB0aGF0Og0KPiANCj4gICAgICAgICAgICAgICAgIC5kYXRhID0gJm14Y19kZWNvZGVf
bW9kZTsNCj4gDQo+ID4gKyAgICAgfSwNCj4gPiArICAgICB7DQo+ID4gKyAgICAgICAgICAgICAu
Y29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdlbmMiLA0KPiA+ICsgICAgICAgICAgICAgLmRh
dGEgICAgICAgPSAodm9pZCAqKU1YQ19KUEVHX0VOQ09ERSwNCj4gDQo+ICAgICAgICAgICAgICAg
ICAuZGF0YSA9ICZteGNfZW5jb2RlX21vZGU7DQo+IA0KPiA+ICsgICAgIH0sDQo+ID4gKyAgICAg
eyB9LA0KPiA+ICt9Ow0KPiANCj4gPHNuaXA+DQo+IA0KPiA+ICtzdGF0aWMgaW50IG14Y19qcGVn
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gK3sNCj4gPiArICAgICBz
dHJ1Y3QgbXhjX2pwZWdfZGV2ICpqcGVnOw0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7DQo+ID4gKyAgICAgc3RydWN0IHJlc291cmNlICpyZXM7DQo+ID4gKyAgICAg
aW50IGRlY19pcnE7DQo+ID4gKyAgICAgaW50IHJldDsNCj4gPiArICAgICBpbnQgbW9kZTsNCj4g
PiArICAgICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpvZl9pZDsNCj4gPiArICAgICB1bnNp
Z25lZCBpbnQgc2xvdDsNCj4gPiArDQo+ID4gKyAgICAgb2ZfaWQgPSBvZl9tYXRjaF9ub2RlKG14
Y19qcGVnX21hdGNoLCBkZXYtPm9mX25vZGUpOw0KPiA+ICsgICAgIG1vZGUgPSAoaW50KSh1NjQp
b2ZfaWQtPmRhdGE7DQo+IA0KPiBhbmQgdGhpcyBiZWNvbWVzOg0KPiANCj4gICAgICAgICBtb2Rl
ID0gKihjb25zdCBpbnQgKilvZl9pZC0+ZGF0YTsNCj4gDQo+IFRoaXMgd2lsbCBzb2x2ZSB0aGUg
a2VybmVsIHRlc3Qgcm9ib3Qgd2FybmluZywgYW5kIGZvciB0aGF0IG1hdHRlcg0KPiB0aGUgc2Ft
ZSBnY2Mgd2FybmluZ3MgSSBnZXQgd2hlbiBJIGNvbXBpbGUuDQoNCkhpIEhhbnMsDQp0aGFua3Mg
Zm9yIHRoZSBzdWdnZXN0aW9uLCBJIG1pc3NlZCB0aGF0IHdhcm5pbmcgYW1vbmcgdGhlIHZlcmJv
c2l0eQ0KZnJvbSB0aGUgb3RoZXIgb25lcy4gUGVyaGFwcyBmb3IgdGhlIGZ1dHVyZSBpdCB3b3Vs
ZCBiZSB1c2VmdWxsIGZvciBtZQ0KdG8gdHJ5IGFuZCByZXBsaWNhdGUgdGhlIGtlcm5lbCB0ZXN0
IHJvYm90IGVudmlyb25tZW50Lg0KIA0KSSBzZW50IHY5LjEganVzdCBmb3IgdGhpcyBwYXRjaC4N
Cg0KUmVnYXJkcywNCk1pcmVsYQ0KDQo+IA0KPiBKdXN0IHBvc3QgYSB2OS4xIGZvciB0aGlzIHBh
dGNoLCBldmVyeXRoaW5nIGVsc2UgbG9va3MgZ29vZC4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiAg
ICAgICAgIEhhbnMNCg==
