Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198D5333FBF
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 14:57:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhCJN5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 08:57:18 -0500
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:18239
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232758AbhCJN47 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 08:56:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLjvn5SVW1OOfO3otrmjW0n1+JKTkGsEKnbNsK442WbmXa4o1zSQikpGLJVYAo4PVLTarz9dBNSHooc23EQRmBDV8gAqjS4f/me2OCHSiOj00x3JyIqAlsLqpZM+7iOmDJHAcDeksUrrH0bJt1pTKxoRQNAukMA87C3t4ooxCqSCpfdVHZrZFB/34mGLFuAhEnN9JHyCU0sNljv7O0JYLLPA9Bk3EmKV78pPJTp1RZSwn62xwl9I+vo0SaBogJj57lAuJeYkaHn44LP173nFlp+eSCgwa/weyYpdpDP7ZlkQ6g/h9+vYHoqwKKZKX9uQk8qWUnET3CEedl7IABaqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73cY+vfF59JdRhYNwT6Tf7NJ9jVCHqZB/WycO6u0kg4=;
 b=gzOwxOrQZb0tHThEW/vsjl3RcBDmwCtmuLZuSpzD99gRsbakuWVxgCdhHOIsGkhglKO1h+Ivldh6aAVxGOqckWcYFIPoRXuyJQmrvXOG9+P1MAnfMnpTKJuD544047BuNxKNhza16sx9bZuyw27nkvgCRkjRx7lQMGDNwiOPndrMCR8ymLMzVt33uTQxG8v1wiIZZ0SyfQxQuvZjuZ0XswXXbxu6hYeito64LmTP9ATwtD6/cQXCDF4ciXW8wasU8fLAgK02jTkhACYzjKkydR21U1QygDtsgAucLQbF80MiRzvI8CnsWqMTwtTgaDzSA9JaFl9zRe/4uuMlpJ2Ogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73cY+vfF59JdRhYNwT6Tf7NJ9jVCHqZB/WycO6u0kg4=;
 b=aOz3lMaBl7YSHJvS63uV6tzHkd2WvY8yA8jWP/8QXEKk6jrEgm42UjUGvjht1K4y+q1QdZ9rFCb7QC0rjlRWaVnJy2HxPUGMqP6PQMBECMTSLs5ZXNOWVV/lVADRh6mLH8LU8vt7nIXzsakkL8osLDM46VwrYB4LSEH3aXO2DZM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3297.jpnprd01.prod.outlook.com (2603:1096:604:5c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 13:56:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3%4]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 13:56:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: RE: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Topic: [PATCH 2/2] media: v4l: vsp1: Fix uif null pointer access
Thread-Index: AQHXDpOdmMw2sSB0m0arhJWcvCVJPKp6wHQAgAKKpxA=
Date:   Wed, 10 Mar 2021 13:56:55 +0000
Message-ID: <OS0PR01MB5922BE9F9D151623773CF53286919@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-3-biju.das.jz@bp.renesas.com>
 <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
In-Reply-To: <133f8b63-3b84-c60a-725d-30b8d6df35dd@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5599f338-4fd1-448d-1463-08d8e3cc5dc0
x-ms-traffictypediagnostic: OSAPR01MB3297:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB32978E0D5A6DB5E5481D5A2E86919@OSAPR01MB3297.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t22Cj/HnYzN0DWaHIrwlrJPZ88XWhdkJT1mTSHTtLtdVpBYxWv3ZLq5mtecVc7RmC5zrfDaLQK32XM5m7jfO64hxGtWoADZNURbOrKZRDzgXwSfVRgg9UxX/l4rIagLT4IYax1aIHyPArDb3WZnQxezk+Zmoq9mZZzwloUcxakDDZ4YIEwhe/rY7JEj3rPAPN2OJT3x1YHR0i4ksHxYJlAIm7dDfATm8R5ZnX4qYe0nYElxSH2SjBd3jN+WqNEotyfEpB3L53OJYUAY0Foh988gOMgDlUddmgXnyoUvyaQeqF/OA5AlhvkHCvhsyZgVva8whDhNGBHoacHTjTeaVsz32Dtuj8vRwN2V9pwXzylIwftCsJeFWx7QaSMxos2r9MPt87dr+mmF7mX1fN3TO+F89GsR7ju4gwIMJYgG9TK7K/txHaMtiGhn/ObnZFWb492hrCkn8IsSqVMautK21djML5yuqOMwFG4FxSTJQlH1r22T1pvFDKeuq24wZGGyeqJ0mGn4F8A3/5XSu8UhNBXns2AFmpmLZ6aoez93pfViY+0B2ghHg7oCWyvgKbUbdt69b5A3J+imptZ3jEGbWuYiCcx1cT/g4QrZtNsLPcj8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(76116006)(66476007)(66556008)(64756008)(86362001)(53546011)(7696005)(26005)(4326008)(66446008)(186003)(6506007)(498600001)(52536014)(5660300002)(966005)(2906002)(8936002)(55016002)(66946007)(110136005)(8676002)(33656002)(83380400001)(54906003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OWdtQmIrRXpZQTJ0ekxxTjZtWTdRWnhCcWt3V2pQZXRPb3RMTFREREhzMW9w?=
 =?utf-8?B?c1Q4NGkrcXA1UnJHTytrZ1B0MTBvc1d0RnY3eFZncVZGRnZmZFN2VGY2MVlO?=
 =?utf-8?B?NjByOFZNR3Z1Z0pkNHFJVnNqQWp0Z0lpbzN4K0lndEQ5SHU1dlFhaGxRWEs1?=
 =?utf-8?B?UGFFTmpmeHlhSStyQkRNQlQ2byt6VmJ0VDZ2SGt3ekZZa29CUlcxbDcyVkRC?=
 =?utf-8?B?MXRLRExTOUovOTFrZG1GU2pJT2ZqdmoyWHdjc1JKVHVKTm1WYW1jSnR1eUFz?=
 =?utf-8?B?a1lBQ2tsYTlnTHQrL1JjUEhWcGk4SCtQWUNpS1VGMmxLTE1LNHhRQ1UxRlBP?=
 =?utf-8?B?a21YRTlMTGxBdXFoMFpjWmxOUDlKVFllM3lFTHJMZVd4TldOVnhNbGsvOWJE?=
 =?utf-8?B?OTZ4TnpnTHBvaTgrTmdiSURYZ01vUUhpUzdsVlFDVmM1b3JZazRUdk1aMGZk?=
 =?utf-8?B?L0hyQ21ERDE4VGpRbkFvVE5kUmtobmNMWW5NL0tCSXl1SWRRMzN5eFpnOTZn?=
 =?utf-8?B?bDZDb0EyU1hIeVEwL2R3eEVpYUY4OGl1QVI0dzZnKzg2a2R5emJmMStMZGJO?=
 =?utf-8?B?OEQ1NitWNDY4aDVmQ1lkcmNTcjdlMURpamxlQW5VSm1tbGNGZzI3b2h3Sk83?=
 =?utf-8?B?OFNNRm90VlQ3M1A4eHUvbDd4VExZanFQRmdzTDF3aUtqeTlGOVlNMytGV0pO?=
 =?utf-8?B?TldLNkpCQWNkU3hCUDhnZUt6TWMrNHBQL0lrNTBuTHVlSVJqMXdPb1BiUU9T?=
 =?utf-8?B?UFRVdDBGMWtieWZGeGtEcWdhRmJCOUtuRnJ3ZUNUQnBZZ2J2ZnlaQ0FUQjVh?=
 =?utf-8?B?WlVUS1lVL3hubk92d0tLZTFjSTE1RkFabjVnZm01ZjdwNERsNG12cHVOTVVQ?=
 =?utf-8?B?b0tobWpWUzcwS3ZpQjZFb3hUa3E3cEQ0ZDZvNFBUd3c0Lzk2bzEyMTZxWHlr?=
 =?utf-8?B?OG10THpKZ0F4VjNucE54OHhoZFlHZC9UL043bjl6bUptSi9zVHBpV0U4MVZv?=
 =?utf-8?B?SWdlTmNZNi80OWw3VzNBRU90STJIOWJkaE4xbUJjditXaWdjYjU4Ylc3NDFL?=
 =?utf-8?B?NCtTTXN4cGlUUGxTKzFQaG5lRWREWk85djVpTk9ObFZKaXRxelpxZHBmQ2ht?=
 =?utf-8?B?cFdkNHpUZkxPalg1WllPMHN2TXNqVHZrYzFSUVhMYWxHRkxWUTY5WnVFbkJG?=
 =?utf-8?B?ZlVwTGswQlNPNkV5YlBNeHkyeHBPalM4Nzd4ZEtJYjVKKzFlTDhqMVc2VGZq?=
 =?utf-8?B?TUJ3T0RKdVNveXl4SkFJZjhSUFRUUURCYzVtZ2Q5azYzMXlmdG5sZHExbGdQ?=
 =?utf-8?B?SWVsMGNka2Z0RitGTnU0ZlFIRVprUGVoTXBWV0VldjI0T1BEK092ZkpiY1hi?=
 =?utf-8?B?cTd5bm5qNlNtZVo1R0k1Ung3THhGNUZ6UGJJa3VremlVWDhrVHF0M1dycEhw?=
 =?utf-8?B?dEM0cUZQY0VJait5ZnBXYjhvdWNHTDZlL3VVVHJsYStuUFBlUXBDSkdGWUky?=
 =?utf-8?B?bEhMYnJ6b3RPdGJyM0NPNE11TUhHWFFpYXkrTkdwU1V0b0hnQmVzNTV5WTEx?=
 =?utf-8?B?K3lCS2g3M3VNeEk2VGkxSmJjUmJIaGUvbVVZZ2RrUEJQV3ljako3eGRoejBx?=
 =?utf-8?B?M2o3RFZ2V2VRZmZPaEJVTHVwM01ZeHRCTVNOakpXdHFMY2ttdGx1L1ZndTVR?=
 =?utf-8?B?WjN5MDh5a2pTZHlDQ04wSWFyOHFDcHJhV1lURFN4aWF3cXl3S3VKWnFnSjFR?=
 =?utf-8?Q?28PYb6WI0F0jD3+2CuS3pyc1fuN10DitAwko2d9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5599f338-4fd1-448d-1463-08d8e3cc5dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 13:56:55.4635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bXaD3ehpPfM0AyVut8UwC5LWcodjWKYf+wgVAO0zdBwX4nEcOECIJ8o9xu4o37PUypKr4vnMLxbnfTDcjaL96tMB7XJwripcOIFk/1jeJ0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3297
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS2llcmFuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBtZWRpYTogdjRsOiB2c3AxOiBGaXggdWlmIG51bGwgcG9pbnRlciBhY2Nl
c3MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiAwMS8wMy8yMDIxIDEyOjA4LCBCaWp1IERhcyB3
cm90ZToNCj4gPiBSWi9HMkwgU29DIGhhcyBubyBVSUYuIFRoaXMgcGF0Y2ggZml4ZXMgbnVsbCBw
b2ludGVyIGFjY2Vzcywgd2hlbiBVSUYNCj4gPiBtb2R1bGUgaXMgbm90IHVzZWQuDQo+ID4NCj4g
PiBGaXhlczogNWU4MjRmOTg5ZTZlOCgibWVkaWE6IHY0bDogdnNwMTogSW50ZWdyYXRlIERJU0NP
TSBpbiBkaXNwbGF5DQo+ID4gcGlwZWxpbmUiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYw0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMNCj4gPiBpbmRleCBmNmQyZjQ3YTQwNTguLjA2Zjc0
ZDQxMDk3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNw
MV9kcm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5j
DQo+ID4gQEAgLTQ2Miw5ICs0NjIsOSBAQCBzdGF0aWMgaW50IHZzcDFfZHVfcGlwZWxpbmVfc2V0
dXBfaW5wdXRzKHN0cnVjdA0KPiA+IHZzcDFfZGV2aWNlICp2c3AxLA0KPiANCj4gDQo+IFRoaXMg
bG9va3MgbGlrZSBpdCBjb21wbGljYXRlcyB0aGVzZSBjb25kaXRpb25hbHMgbW9yZSB0aGFuIHdl
IHBlcmhhcHMNCj4gbmVlZCB0by4NCj4gDQo+IFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGFkZGlu
ZyBzb21ldGhpbmcgYWJvdmUgdGhlIGJsb2NrIGNvbW1lbnQgaGVyZT86DQoNCkl0IGlzIG11Y2gg
YmV0dGVyLiANCg0KVGhpcyBwYXRjaCBpcyBhY2NlcHRlZCBpbiBtZWRpYSB0cmVlWzFdLiBTbyBu
b3Qgc3VyZSwNCnNob3VsZCBJIHNlbmQgYSBmb2xsb3cgdXAgcGF0Y2ggYXMgb3B0aW1pemF0aW9u
IG9yIGRyb3AgdGhpcyBwYXRjaCBhbmQgc2VuZCBuZXcgb25lLg0KDQpQbGVhc2Ugc3VnZ2VzdC4N
Cg0KWzFdIGh0dHBzOi8vZ2l0LmxpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0L2NvbW1pdC8/aD1m
aXhlcyZpZD1jNGYyNzAwM2VjM2Q4NGVmMGMzMzNjNzRhZTJhZmYzMjY1MzdlNTgzDQoNCkNoZWVy
cywNCkJpanUNCg0KPiAJaWYgKCFkcm1fcGlwZS0+dWlmKQ0KPiAJCXJldHVybiAwOw0KPiANCj4g
DQo+ID4gIAkgKiBtYWtlIHN1cmUgaXQgaXMgcHJlc2VudCBpbiB0aGUgcGlwZWxpbmUncyBsaXN0
IG9mIGVudGl0aWVzIGlmIGl0DQo+ID4gIAkgKiB3YXNuJ3QgYWxyZWFkeS4NCj4gPiAgCSAqLw0K
PiA+IC0JaWYgKCF1c2VfdWlmKSB7DQo+ID4gKwlpZiAoZHJtX3BpcGUtPnVpZiAmJiAhdXNlX3Vp
Zikgew0KPiA+ICAJCWRybV9waXBlLT51aWYtPnBpcGUgPSBOVUxMOw0KPiA+IC0JfSBlbHNlIGlm
ICghZHJtX3BpcGUtPnVpZi0+cGlwZSkgew0KPiA+ICsJfSBlbHNlIGlmIChkcm1fcGlwZS0+dWlm
ICYmICFkcm1fcGlwZS0+dWlmLT5waXBlKSB7Pg0KPiAJZHJtX3BpcGUtPnVpZi0+cGlwZSA9IHBp
cGU7DQo+ID4gIAkJbGlzdF9hZGRfdGFpbCgmZHJtX3BpcGUtPnVpZi0+bGlzdF9waXBlLCAmcGlw
ZS0+ZW50aXRpZXMpOw0KPiA+ICAJfQ0KPiA+DQoNCg==
