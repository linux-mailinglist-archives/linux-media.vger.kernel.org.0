Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF67A2FD984
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 20:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391916AbhATTYK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 14:24:10 -0500
Received: from mail-eopbgr1410094.outbound.protection.outlook.com ([40.107.141.94]:55529
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388528AbhATSps (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 13:45:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5eB3q9nZ4j/CH/U4vDZsTjcXmTZPH2mhaatLGjgBoNudr/NcJIXmYaIJ6mgY/AkSLiMaVEL3hOk7xpKMH7SfimTkdZRpEvi1OW9nlTskoh7HB4SZaSNZolC+zBpUEQK4Az4aL56g7L1FzAmQmMGLTd6s51qU4rwA6GYbEJb+7SeknaMydyeWUihHiE1JMI6GBpoY4C0n5Z0A6UFZkeo7zd8vS8QYJAh4WficUGcvMs++xCNIHS0Qfqx/qjhw7mqQxclCGQLWapG7CGbgLjXC12Xvgvw87b89P2fTTREm+S+NUlVbYcCBUxrDBS2282Odp1Xlx2DVeqHyus5il4QSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLF6UR23QXA8JVFplhiVnZMNTP43WZCFdggG9U1weBA=;
 b=T4oOj58unBSUCkI6wSAFddAEnpiTYT1tbbfEIJWWCuc1SipjDL3oj8SgABCLA43UvVtdsOr2LQaTlQ3gw7OiPCo+yey5cHcDI9ixgBi8UhEmdDvNtY+sjb8zv16T2nYnn3vxfy0vdxx7rwBVUU8qDAl7lLSQeURNSdVa/kSVbOUWMV15zGGGcgj4ZSCHA+ppu+4XWaJJcbXVBLuXvcmyfYUMu9axnFSBU+Co/c5EfxqwsDji/x+vN44CnK0B12xvoyO+52gkLdqPc8ZUdmU3eTZSt3cHP0MN9RMaQs2Y+Pp74nED18ohUZK11WVo0QEe8YyXdcZP6jFF676bGEte5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLF6UR23QXA8JVFplhiVnZMNTP43WZCFdggG9U1weBA=;
 b=CMISFlXotYXxoIBV84IafL/d7Js85pw6/RCfeNtdHz3NX7p55eQfEjUDW+/IkHJby+C0nU3RqjeW3USruGT/s2JWsqsydPiGTPqDpDHySLFVIhMTSieCYoNvImuW/f17WE1bM/5JlVnUfsSS97wxuufbAbTEmVXuFxJyUTCyjEE=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OS3PR01MB5605.jpnprd01.prod.outlook.com (2603:1096:604:b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 20 Jan
 2021 18:44:40 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4931:7b90:b8ae:f48b]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4931:7b90:b8ae:f48b%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 18:44:40 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWp7GZa1JNKQqPtk+I2E/mnD2fUaonm7MAgAnB2YCAAAsg4A==
Date:   Wed, 20 Jan 2021 18:44:40 +0000
Message-ID: <OSAPR01MB273719F67F6E438D85FF08CFC2A20@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021135332.4928-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
 <OSAPR01MB2737EFE39D62F99A7FB8B344C2A20@OSAPR01MB2737.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2737EFE39D62F99A7FB8B344C2A20@OSAPR01MB2737.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.29.91.232]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9766397c-f2b2-42c5-72f7-08d8bd7371ee
x-ms-traffictypediagnostic: OS3PR01MB5605:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB56058F162408D65CCCC2BDD2C2A20@OS3PR01MB5605.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EbeWUE+NT/Y4qLMZSEPZC8ISCwmdw47fmRTEY+2TzSHCx6TjF6O7qYlDLWQixUGS3xvK4qgcqqgKF/h0R79gVJjuHWZIqTXPfc6KVPhYsX8DngoQLeGnKPFM+SsgFwP60g6X/55X3ifpimXeAfOGIcamHt5kd3QhQXaZS/JgBw/8AdEnnZvRHQwP7j497hrxI31m6TWdxwtnovVKY0HstZYTAKehEMBSPs5GAIiyabHNMBwMaUSikXGzGX3TOay4ViKFRXK97oRTYjRfn2p+AtZF+kaW1W+3kAeI1IBKHmlYVd8qd2GBWgnkefVN8AJfH+cNqVC1JIW5cVgHuxVLbme4vwPstdsBpCavkfxdx5x7FBjtPh3+9joyvdKOE1PPpgs4VFZMftqH2AeXXQkaIw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(66946007)(26005)(8676002)(76116006)(2906002)(186003)(6506007)(53546011)(7416002)(86362001)(2940100002)(8936002)(71200400001)(55016002)(83380400001)(110136005)(9686003)(478600001)(66476007)(5660300002)(33656002)(66446008)(316002)(64756008)(52536014)(7696005)(54906003)(66556008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Z1hpZXF1bnJmZkxsanFnUkd5a2pBT29UQlN0MFZaRmc0d2dUYTcwU3NSSDdV?=
 =?utf-8?B?Z1ZST2hVb21kKzFHSnBNWVBVWnJyN1J4U2ZaMkhRMmd0S3RLeTlTZ2FYNDd3?=
 =?utf-8?B?WEFxQys4V2plV0N5OWVoNy95YnQwL3cxSkhVOGo3MXdzM0tDM1YyWVFsWmV0?=
 =?utf-8?B?NUgwVXlpazRzSlBtQ1FGaGZHZklaZzJId1hOcTVMTDQyZXpnWlowZmsrcnFy?=
 =?utf-8?B?VUkxVlVRd0tGQ1pIcmJKakVqR0Z1N3pIMXdaSkZEdmRnWkM2MDJXRGFZVjV5?=
 =?utf-8?B?UDRQNXFkMUV0ZVRkS1h6OVRoVnZ2Nk1LQS9ROHJZVzBqeTUvVldyQUxkV2dL?=
 =?utf-8?B?dGNDczBXSzNuMG0vME02TEJJOE9zVkRXUUNVc09PaGRtS2I2WVNVT3BTZjEw?=
 =?utf-8?B?TTZoZzd3djlxa1BBTE9tSEw0L2lWdDRLMjFxbnZ1Y3QzcU80MVAvU1NPWmFN?=
 =?utf-8?B?Z3BuMm1reGdLeWpzSnlBclRkaExmb2gxbWtGUjJqRzd4WTh5U2NDNC9VZVpo?=
 =?utf-8?B?M0pUdDJVSXBLcWtuZFBZVWx3T1hIUmU2Y0ZhZUhENFBWaFJLSUVZb25XV2s3?=
 =?utf-8?B?Z0FOZEpwREU2bGR1QmlzM1VORUtHZ05QNHRyQXlqSUlTY1JlV0F4L3lmeGgr?=
 =?utf-8?B?aWNQbTFUMmcyMDVCRWMwV1dSSnJ2MTN4TFluWjJaTXZST3dNbkduSzRFVUxn?=
 =?utf-8?B?aWswZ3MwRlNsOGNxYjFkNTNpSHM2L3djRG4zbE45RkpJMFF6WkFFdTZiR0pv?=
 =?utf-8?B?WUNUbGpQK2UrclhiZjBUNUxxandJczZVT29rOUt4Z1R2ZHBuQ0VpYXdmN1lw?=
 =?utf-8?B?YzhkTEVhSEVWUndxQVBtTWQ3dmI5cXRwUjlJT3lmSVJtN3plaHlaM0xDeWhL?=
 =?utf-8?B?WXpwMUt2RVJMMUlKV0UzRWptMlgvY1NUSFNzUllMWmQ4QzcxSTVNeS9OUXhj?=
 =?utf-8?B?ME0wVXBxR2xEOVBFRFZaQ3BWUFU4TE5wTytGL20yOFRLRWNIUUx3TWYyejZP?=
 =?utf-8?B?b0VNNysrd2g5SDk3Z0NLNUdxT01BQ29meDQydGZDVWJtSmpVQ0pua0xpUGpR?=
 =?utf-8?B?WVI3QWtZY3NnWmt5NzhvSlpTelEvMVNyRHFQQndQeXN1Z2hOM29rTnJrb1FW?=
 =?utf-8?B?QUpMSno5bG90b3hUU1R3ZDhrbDZLSG5jc0RGRHhybjl2ZkRPa2lCNnhveHJP?=
 =?utf-8?B?V0U3NDQwU0VJRC9tVzRGanZNMkdQSm9pTlJQc2FQam9tQ2NoMXJGTHMvOStV?=
 =?utf-8?B?RVNQTzduSjJKMnlCUlJ4eEMzZUZWcCtIcnkweVQ5azdhQ2EwL25MSmJHd3dp?=
 =?utf-8?Q?8ElrVnd7KdOtc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9766397c-f2b2-42c5-72f7-08d8bd7371ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 18:44:40.0667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1EiOY9s36TzeEz3NLS0mWcOcXTSZ/HIghAANtdsPaHR4V4qWQpKQL3/HnPPXnDHTwt4KOP0/PKPzRHdxVFEyVGNdbGcQ/lLD/i4ppmGP0Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5605
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNCg0KPiBGcm9tOiBGYWJyaXppbyBDYXN0cm8NCj4gU2VudDogMjAgSmFudWFy
eSAyMDIxIDE4OjE5DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMi81XSBtZWRpYTogZHQtYmlu
ZGluZ3M6IG1lZGlhOiByZW5lc2FzLGRyaWY6DQo+IENvbnZlcnQgdG8ganNvbi1zY2hlbWENCj4g
DQo+IEhpIEdlZXJ0LA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrLg0KPiANCj4g
PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+IFNl
bnQ6IDE0IEphbnVhcnkgMjAyMSAxMzowMw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMi81
XSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLGRyaWY6DQo+ID4gQ29udmVydCB0
byBqc29uLXNjaGVtYQ0KPiA+DQo+ID4gSGkgRmFicml6aW8sIFJvYiwNCj4gPg0KPiA+IE9uIFdl
ZCwgT2N0IDIxLCAyMDIwIGF0IDM6NTMgUE0gRmFicml6aW8gQ2FzdHJvDQo+ID4gPGZhYnJpemlv
LmNhc3Ryby5qekByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBDb252ZXJ0IHRoZSBSZW5lc2Fz
IERSSUYgYmluZGluZ3MgdG8gRFQgc2NoZW1hIGFuZCB1cGRhdGUNCj4gPiA+IE1BSU5UQUlORVJT
IGFjY29yZGluZ2x5Lg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3Ry
byA8ZmFicml6aW8uY2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+ID4gUmV2aWV3ZWQtYnk6IExh
ZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4g
PiA+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPg0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+DQo+ID4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvcmVuZXNhcyxkcmlmLnlhbWwNCj4gPg0KPiA+ID4gKyAgY2xvY2stbmFtZXM6
DQo+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAg
IC0gY29uc3Q6IGZjaw0KPiA+DQo+ID4gV2l0aCBsYXRlc3QgZHQtc2NoZW1hLCAibWFrZSBkdF9i
aW5kaW5nX2NoZWNrIiBjb21wbGFpbnM6DQo+ID4NCj4gPiAgICAgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sOg0KPiA+IHByb3BlcnRpZXM6
Y2xvY2stbmFtZXM6bWF4SXRlbXM6IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyAxDQo+ID4g
ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYu
eWFtbDoNCj4gPiBpZ25vcmluZywgZXJyb3IgaW4gc2NoZW1hOiBwcm9wZXJ0aWVzOiBjbG9jay1u
YW1lczogbWF4SXRlbXMNCj4gPg0KPiA+IFVzaW5nDQo+ID4NCj4gPiAgICAgICAgY2xvY2stbmFt
ZXM6DQo+ID4gICAgICAgICAgY29uc3Q6IGZjaw0KPiA+DQo+ID4gRml4ZXMgdGhhdC4NCj4gDQo+
IERvIHlvdSBuZWVkIG1lIHRvIHNlbmQgYSBuZXcgdmVyc2lvbiBvciBhcmUgeW91IGdvaW5nIHRv
IGFtZW5kDQo+IHRoaXMgb24geW91ciBlbmQ/DQoNClNvcnJ5LCBJIGhhdmUganVzdCByZWFsaXNl
ZCBMYXVyZW50IGhhbmRsZWQgdGhpcyBvbmUuDQoNCg0KVGhhbmtzLA0KRmFiDQoNCj4gDQo+ID4N
Cj4gPiBIb3dldmVyLCBJJ20gd29uZGVyaW5nIHdoeSBJIGRvIG5vdCBnZXQgYSBjb21wbGFpbnQg
YWJvdXQgdGhlIHNpbWlsYXINCj4gPiBjbG9jay9jbG9jay1uYW1lcyBpbg0KPiA+IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMueWFt
bC4NCj4gPiBCZWNhdXNlIHRoZXkncmUgcGFydCBvZiBhbiBlbHNlIGJyYW5jaD8NCj4gDQo+IElu
dGVyZXN0aW5nLCByZW5lc2FzLGx2ZHMueWFtbCBkb2Vzbid0IHNlZW0gdG8gdHJpZ2dlciB0aGUg
cHJvYmxlbQ0KPiBmcm9tIHdpdGhpbiB0aGUgInRoZW4iIGJyYW5jaCBlaXRoZXIgaWYgSSBoYWNr
IGl0LCBpdCBvbmx5IHNlZW1zIHRvDQo+IHRyaWdnZXIgdGhlIHByb2JsZW0gd2hlbiBvdXRzaWRl
IHRoZSBpZiBzdGF0ZW1lbnQuDQo+IA0KPiBXZSBwcm9iYWJseSBuZWVkIHRvIHJlbW92ZSAibWF4
SXRlbXM6IDEiIGZyb20gcmVuZXNhcyxsdmRzLnlhbWwgYXMNCj4gd2VsbCB0aG91Z2gsIHdoYXQg
ZG8geW91IHRoaW5rPw0KPiANCj4gVGhhbmtzLA0KPiBGYWINCj4gDQo+ID4NCj4gPiBUaGFua3Mh
DQo+ID4NCj4gPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gPg0KPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+ID4NCj4gPiAtLQ0KPiA+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+ID4gbTY4ay5v
cmcNCj4gPg0KPiA+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiA+IEJ1dA0KPiA+IHdoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nDQo+
IGxpa2UNCj4gPiB0aGF0Lg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
