Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2146C2FD82E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 19:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404232AbhATSUj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 13:20:39 -0500
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:22237
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404357AbhATSUO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 13:20:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bqr3RA/m+0GJvY8jAiPi5eJHPNMbSYlO+G30It5uRX+r77zSf3QsCerwYgNdgmDLEPLh9TFfxbxtt4PNYAxqOFJfEpE/gX8cUd+CRTFRfH36Z27XAWPpN1GTYCWMBS7115CHHqrLNztiXH0aVyBJ9yQ0tY+IlkJe6mv3iYRG0xiOxNITlRVzWybeCwr+6gZ34oFEJDXp+BAR4gzDVFwzyGm2ahBKYXY3LEJe7OJQK+8t9m+rBPOmLKW3xbJYRs2vTENOCbs55K6VGP0uK3r5nd3ZCI5pBcBWXup7kzsSNK+oXmSGB8IwKV2uxsvMEYAZSibdvqbun9bC85WdeiwOvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8s+FeeURnyCOb+tgUSklWh99T4Hu9+7pW6GvmUpltw=;
 b=dEWo/keOcUwjqv8sBH4EntkcUzg19MSSCw5+yHZoNzTAot0kxHHLOGh4dK3SDpcBQjlbVb2WOz6rBx/sv9zSBuhIKzpNI1LtcTeeWoPG2taNtGhoNXFlebzS9aK79OKW7WNBS9lMD2+P8hgQ5lVVNfGu6E078oiYrFKlm8EGtAALrrqipKTkw8F+uFDXSqeCI+bSI5YdoQVimbxdPgxuyVT1czX5N8lrFZhcldmr5+QA/0zdXqDUyU3DOcLkNgiwnRki/LcgksFEyLo+f8NRyJxOGDjzuIrxuexOCyjWs5jLC7nCfNqLHbGkG08JPVriBJMQX4klnMP01dvLxIexRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8s+FeeURnyCOb+tgUSklWh99T4Hu9+7pW6GvmUpltw=;
 b=RZ5XVrKPuyPIjO5JmiS/nJxcIHIcVl+zUb4yqlvG1c/MeYYdMesSpKNvlj/y1rqfz5YV+GsbZkNggFvOrHgTbieVCkYoEx5tN4RERx7++oQ4gUnhoOHAbP9d+45zkX93SWkM9Vthvuy6IayoceMvIZwDltlyOtFNa1iUIoqX79U=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OS0PR01MB5346.jpnprd01.prod.outlook.com (2603:1096:604:a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 20 Jan
 2021 18:19:25 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4931:7b90:b8ae:f48b]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::4931:7b90:b8ae:f48b%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 18:19:25 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>
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
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v5 2/5] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWp7GZa1JNKQqPtk+I2E/mnD2fUaonm7MAgAnB2YA=
Date:   Wed, 20 Jan 2021 18:19:24 +0000
Message-ID: <OSAPR01MB2737EFE39D62F99A7FB8B344C2A20@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20201021135332.4928-1-fabrizio.castro.jz@renesas.com>
 <20201021135332.4928-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
In-Reply-To: <CAMuHMdWj_Gm6vwOF9Akz84WakA3KTcNTRHte6ukEF_U5=Q8xFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.29.91.232]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46bc6002-0704-4562-ac92-08d8bd6feac0
x-ms-traffictypediagnostic: OS0PR01MB5346:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5346B5BF06116EEA902A96AAC2A20@OS0PR01MB5346.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2U3tq/NNbXpp2yq5cPNfLXDi+YZVEkoauvj3B4H2XhNABjVBIM1xpgYU/jjy018zAH5YCEaxhDJjxvJ8Re11uF6QnZuIdOaqyODOADAN4ykgVBcatZPT29ascXgArx3Qd9QshHTSsTZE1JT+6Zlag98bdTbHsJ8crRwOMO3PkCN5/UEC+RPHIIxKS4MigfYFIrahcooQfnN/7lhvyFdP9B95PXThmWSogM6fIlVom4Tx6VAe5yorBVc0paU7A7z4aLqP8dO0Rzf5tOZGflC7q7yQEiqeblZUYFzjJfpRoXrI1u7LhsZhoD7m/lwe4AFkE8jSGGNXbG0ZaAiSWdq0MkaPQySaDvIFHP/1HoIRCINofven0dDaB+4qoto/hfD7xvima38PTPhV9RrNKRlZsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(86362001)(6506007)(33656002)(53546011)(64756008)(76116006)(66556008)(66446008)(110136005)(66476007)(52536014)(5660300002)(66946007)(478600001)(8676002)(7696005)(55016002)(26005)(186003)(8936002)(316002)(54906003)(2906002)(7416002)(83380400001)(9686003)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?QUJWWUJPazllOG96bGRLM0c4czJ6OUJHZEFVZ2RlR2llNk1RTTRBYnRXemxP?=
 =?utf-8?B?QTNxRWhBZnM2NVVEOFVVVWo2ZC9qT0JUT0c2UnRGbVI5T3JhMnFlNDV3ZVdw?=
 =?utf-8?B?YWNydTVSUmRUaDNnWEk4MnlSN0xqeGIxMFIzNGh1R0d4RHdJb01FL0N2S2Zl?=
 =?utf-8?B?TkwzMEU3MnV5ZEdBUjh4N1ZEY3FzYktxbXlqWWZ4dFpER1didko3TnhCMVE2?=
 =?utf-8?B?cVRVd3BSWS9WZWx0Ynl2L1k5amJwdTVXdFQzdlk0NkE5VjJNbnY1U1djMWhU?=
 =?utf-8?B?SWdlKzlrNlFOL1BqdUlLWVVQWW1sUGgvRGg1S3VDZlQxYVRDM0ovWDh2d1Bm?=
 =?utf-8?B?Q1FpSVQyRTMzendBS3JtQ2IreXZqcElKMVRMYU4yVlBpUU9ONVRNekpuaTkw?=
 =?utf-8?B?MnNlQWRDRDdxWmMxZEdXMER5OUQ2d3haejBnUnJaT3hLQkNsZkJpa2lvRmlr?=
 =?utf-8?B?UmUzYmpWbmpHenh1cXhkZ0xIUDJiZ2xnb2RkQnZDaDIyelQ4ZUtaWFF2TlB3?=
 =?utf-8?B?bTk1ZXhOQmZYSnppaDgzZmVsKytsMlFqZkFZejFwUlBDNFZYTWxTRU13MlJa?=
 =?utf-8?B?ei8ycDdYUFg2andxNHpuc2RBQmVzcEgvWm5PdTFIS1d4Mm1nSHFHcnRHNDlI?=
 =?utf-8?B?dHVnalZNY29pc291dnFEVmJvVW1SeFM0aGRndlQveFNudnJncTJmNEp5R0sr?=
 =?utf-8?B?NUwwOGRwcWlIM1c2WHJuczc1N0Nac2pSQVo5ZTdVaUgwR2JJK2Ywd2Rya01U?=
 =?utf-8?B?dXpROGV3U09Mci9ZUXNqK0FmRzY0eE1TcnJwenZnL05Ubmx1L1cxMGNFaVVv?=
 =?utf-8?B?SDl4SGNKMWNCZTh6WDdxdjRsaUlpSlVPSW1LVXBwR0VYc1FzMU5Ec0w2ZVpT?=
 =?utf-8?B?VjJJcjVPL3JVd0IvTDREZHNudFBOMXJ4OEhrMkQ1NmZCVlR4bHdLWUVoREpO?=
 =?utf-8?B?cm1GSFNsQUR3QlhreUhLSDdRVUJXZmVIUVZ3RE92bzNVSGJUbTAxU2FwbDQ2?=
 =?utf-8?B?R2xNR0RCWFlIZDB4UnN3KzBMTHllZEtPc3FDMzMzNU5OSGRlbXRicUVmMUoy?=
 =?utf-8?B?a1cyVnZzbUorSWw3aEpoUklEZG1JZzdoWHhTYVh3WjlBNldMQ2FsbzNYL3lF?=
 =?utf-8?B?VTZwZnBZRDFndVRRdGd3YW9YaGkvZE1MMjZwRkpKYU1yRThMV3ZVRFp0S0Qr?=
 =?utf-8?B?elZBazEyTjE4dndNSHVlSTRpM1hMNi8wV0FSWjlsS05la2QzM2h5bWRHaEpj?=
 =?utf-8?B?ZmNyNElSM0dUQmxBWVIzOUtVRmtOVFd4N1g0RGlQTkRnTTBjRXBNWW83TktZ?=
 =?utf-8?Q?Rf+7RthKn5/uY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bc6002-0704-4562-ac92-08d8bd6feac0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 18:19:24.7542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvgE4fF5SVSk6VGOj8EfbwkROsiCu3kQ26AY0fEMrRbVIHRgxPVIJKC/bnmees/5hHehBoKVJOp/R8rSgVSH1TB2OnBwHx6ze0rqANgyBfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5346
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNCBKYW51YXJ5
IDIwMjEgMTM6MDMNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAyLzVdIG1lZGlhOiBkdC1iaW5k
aW5nczogbWVkaWE6IHJlbmVzYXMsZHJpZjoNCj4gQ29udmVydCB0byBqc29uLXNjaGVtYQ0KPiAN
Cj4gSGkgRmFicml6aW8sIFJvYiwNCj4gDQo+IE9uIFdlZCwgT2N0IDIxLCAyMDIwIGF0IDM6NTMg
UE0gRmFicml6aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+IENvbnZlcnQgdGhlIFJlbmVzYXMgRFJJRiBiaW5kaW5ncyB0byBEVCBzY2hlbWEg
YW5kIHVwZGF0ZQ0KPiA+IE1BSU5UQUlORVJTIGFjY29yZGluZ2x5Lg0KPiA+DQo+ID4gU2lnbmVk
LW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sDQo+IA0KPiA+ICsgIGNsb2NrLW5h
bWVzOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAt
IGNvbnN0OiBmY2sNCj4gDQo+IFdpdGggbGF0ZXN0IGR0LXNjaGVtYSwgIm1ha2UgZHRfYmluZGlu
Z19jaGVjayIgY29tcGxhaW5zOg0KPiANCj4gICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYueWFtbDoNCj4gcHJvcGVydGllczpjbG9jay1uYW1l
czptYXhJdGVtczogRmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IDENCj4gICAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYueWFtbDoNCj4gaWdu
b3JpbmcsIGVycm9yIGluIHNjaGVtYTogcHJvcGVydGllczogY2xvY2stbmFtZXM6IG1heEl0ZW1z
DQo+IA0KPiBVc2luZw0KPiANCj4gICAgICAgIGNsb2NrLW5hbWVzOg0KPiAgICAgICAgICBjb25z
dDogZmNrDQo+IA0KPiBGaXhlcyB0aGF0Lg0KDQpEbyB5b3UgbmVlZCBtZSB0byBzZW5kIGEgbmV3
IHZlcnNpb24gb3IgYXJlIHlvdSBnb2luZyB0byBhbWVuZA0KdGhpcyBvbiB5b3VyIGVuZD8NCg0K
PiANCj4gSG93ZXZlciwgSSdtIHdvbmRlcmluZyB3aHkgSSBkbyBub3QgZ2V0IGEgY29tcGxhaW50
IGFib3V0IHRoZSBzaW1pbGFyDQo+IGNsb2NrL2Nsb2NrLW5hbWVzIGluDQo+IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMueWFtbC4N
Cj4gQmVjYXVzZSB0aGV5J3JlIHBhcnQgb2YgYW4gZWxzZSBicmFuY2g/DQoNCkludGVyZXN0aW5n
LCByZW5lc2FzLGx2ZHMueWFtbCBkb2Vzbid0IHNlZW0gdG8gdHJpZ2dlciB0aGUgcHJvYmxlbQ0K
ZnJvbSB3aXRoaW4gdGhlICJ0aGVuIiBicmFuY2ggZWl0aGVyIGlmIEkgaGFjayBpdCwgaXQgb25s
eSBzZWVtcyB0bw0KdHJpZ2dlciB0aGUgcHJvYmxlbSB3aGVuIG91dHNpZGUgdGhlIGlmIHN0YXRl
bWVudC4NCg0KV2UgcHJvYmFibHkgbmVlZCB0byByZW1vdmUgIm1heEl0ZW1zOiAxIiBmcm9tIHJl
bmVzYXMsbHZkcy55YW1sIGFzDQp3ZWxsIHRob3VnaCwgd2hhdCBkbyB5b3UgdGhpbms/DQoNClRo
YW5rcywNCkZhYg0KDQo+IA0KPiBUaGFua3MhDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4g
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRl
Y2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dA0KPiB3aGVuIEkn
bSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0
aGluZyBsaWtlDQo+IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0g
TGludXMgVG9ydmFsZHMNCg==
