Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1DD26491B
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 17:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731286AbgIJPyQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 11:54:16 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:12907
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731493AbgIJPxo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 11:53:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ/+5iD7I4Sigk4YVTfuGhF9JyH3UvBodQM7u8PZk6EKWhzVQdiR/w7Mnte0oP1yyOaG4buW1IPUSQi5kbvIjBOEMFuzn4HFFSfM9/jGsG1Povt8jyJjVYCH63ATDrk5HbEKxM8Q0Sc/lSNDyYwDGboESVPW6rq+jaSdZ6vakDCrBrtnJ90qjVVHdvRWi3VHju8XrUWp+j3zr9o94YkAyiIvZ1n/aYaSk1UTfI3StO54AMpnPjEmrbcEmxsXcQGqfHzsBWPvDakVegR9DuHHZtAi4TyMkmxkdJW0NVf2gBj5M88kLii8bfE6EewS0oaFgeLXs/NmJu7Wsb2Bo6+YlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dmxCvU49hlKBo3N5+d7IljZhttrqrcbEm1jB3bw0TM=;
 b=aIgQULyCMpDr4g1UnjMnHrqkllWkDQB7Nrp8lnrSbfTNgGeT15YSLc4QXzkFOXkPP5qbFfOnN9nvUUVQlCTu2GfEK5M38mOOGdFjIa9GzpXTIdafL8uphjBo5IgaLqCZdJ3HRY8eY2+8B2vkiOIOZDvndXVdBkKAuB/jcj32PQGYuoCQPfkZL8FP0iO66zlvCptZnmmKAgkSVwWYk9ieapRnWA1HWAm9ImrAsxkgXxjfdw5SAE7rFTyHDHJVb94lcazQMsSYX4MYJ56Sg++/mbtpRWEyZk/99bucSZTloW9GRR9Fi//evHGxDsk0cIgDyWaOwM7RLIIXoBdScUSpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dmxCvU49hlKBo3N5+d7IljZhttrqrcbEm1jB3bw0TM=;
 b=qdPVmjXfnNw/Yif1nfJ0JG2hRi33FFGUT2HisspIxO7n53jUEU5UVyNoVxaZ/hwnJKsda8MLSWIVJuBWvdy78inicfsP7zp37XuCgi8gJNkCfRzvhYJ7slmZVdNncMzU+ICRmur26rODGozLbjYiPwu0fmKqw1xtI5g0FN2e21Y=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB5156.jpnprd01.prod.outlook.com (2603:1096:604:6e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 15:53:40 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 15:53:40 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: RE: [PATCH 0/5] media: Fix asd dynamic allocation
Thread-Topic: [PATCH 0/5] media: Fix asd dynamic allocation
Thread-Index: AQHWgE0ZQxsk7tRkQUusIc2xYjmvK6liEytA
Date:   Thu, 10 Sep 2020 15:53:39 +0000
Message-ID: <OSAPR01MB2740E0F8ED4FA3AE2B431CB0C2270@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAJWpUEe4VwOL_TQ1WwjG1WT17_GPFpNO+-h92dRfj0jW8pb5wg@mail.gmail.com>
 <OSAPR01MB2385DABC0957AE1A7B8F6622B72E0@OSAPR01MB2385.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2385DABC0957AE1A7B8F6622B72E0@OSAPR01MB2385.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c2685d85-c1b9-4955-39c7-08d855a1afdf
x-ms-traffictypediagnostic: OSAPR01MB5156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB51568799E5D1B007C460E8B2C2270@OSAPR01MB5156.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+Fx1sBDCtBtD+pp8iTX5aWVI0/JF3OVwD11Foqkkdh4JbFbp3P0hGyTnBSP5pbYJhjUvE8LmBjiKgGEUMO857P4Rdv4/LTB3TI97Uvh8+kBhqUGcdI7gg/A3X7V/KFS2KOPapzv+ZZz1lfwgRFUJ3npVBDw30J7UXw1wx0vqrBu2FHT4mbVNjTlIkanrMQaLS9IUCQM4quC+ab2hHgWyne5av6JqP/bV7JPK2JCD5rQr3utyvu6RF91SsaVMeRWDdBSLqT0xlWCwMEtr5FBHR42LAbUMSqJugD4SvzvJpXvkddvaw3yv57R51er66/7PVA9aHCs6L+WRAtYerk0mQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(33656002)(9686003)(2906002)(54906003)(7696005)(478600001)(52536014)(83380400001)(5660300002)(8936002)(8676002)(6506007)(86362001)(55016002)(110136005)(64756008)(66946007)(66556008)(66476007)(71200400001)(76116006)(66446008)(186003)(4326008)(26005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: pyvKYCJuTZ+KDoaPGpaP6IIyN8NJDMIb4mFycEerFrkxcVth1ENwVSxSfMecvSwpDV3hY3twdO8rBv0cC0lgIVChCgkxXn5wCzsu326Fd+tPM6j9x10mad5Lxd2eQ/H8Jm2HbDyVGahmnkVujEFLYCe+Is9ecFKZNm6yJ3cU8ZDpicbYuWH4tj3sgMgyuMZ41zBtdneCR2sqRgsOljrWqLo6S7xhQNmPJVRmXnm3Ly/6+EoNYeoIsLGtkg6CeXhTx1K9MQfx+vhUojyW0P9Z1SBf7vr/pULaiH12xTm923V8Qj2GkqQTfrgkghsbTDzd92VyNWgfRf3DlOtyUQct0sKdW4hhcA9rhlmDddwDeg7tPY1hqSfylr6QmbtRx5TqVjwz2CG3eH+IDGMnsq1/wR9CIpgC6a56Y26Mz1kkgEAmxtTakEO4b7Up+aTuY31C4Wl1I7dZiMEqnAzxAtymXinkDV9mtYzXsx+Z+DpmyLNQ4FP2vEI3qziesiMacGY6H1b2qbLLQ8Fa7//6TOpPJqrYSjnXhtHxOAF1GHCky3DUoon2Fnx201aKY5Qi31vBwb2efGVYCQkINGaeWN5YPSYlcHF0EGLybi7oXgCe+s/d6b5AtbXMx8q6QiqlQlRi1929SzKLWA/QwAeZQFNF/g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2685d85-c1b9-4955-39c7-08d855a1afdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2020 15:53:39.9674
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vA6YyERNIQJj2F0SynCKRjHB1JkSlH+sI0qe7lh2rPvIHKwDh1pUJKwm2uG3euppIG6By34N4Iibf98eF8vscAbnoKFmdWMmcsTafJc4ChU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5156
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIHdvcmsuDQoNCkkgaGF2ZSB0ZXN0
ZWQgeW91ciBwYXRjaGVzIHJlbGF0ZWQgdG8gdGhlIERSSUYgZHJpdmVyLCBhbmQgdGhleSBsb29r
IG9rIHRvIG1lLg0KDQpUZXN0ZWQtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJv
Lmp6QHJlbmVzYXMuY29tPg0KDQpUaGFua3MsDQpGYWINCg0KPiBGcm9tOiBDaHJpcyBQYXRlcnNv
biA8Q2hyaXMuUGF0ZXJzb24yQHJlbmVzYXMuY29tPg0KPiBTZW50OiAwMSBTZXB0ZW1iZXIgMjAy
MCAxMTo0Ng0KPg0KPiBIZWxsbywNCj4NCj4gPiBGcm9tOiBSYW1lc2ggU2hhbm11Z2FzdW5kYXJh
bSA8cmFzaGFubXVAZ21haWwuY29tPg0KPiA+IFNlbnQ6IDMxIEF1Z3VzdCAyMDIwIDIwOjQ1DQo+
ID4NCj4gPiBIaSBMYXVyZW50LA0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgZml4LiBTb3Jy
eSBhYm91dCB0aGUgbGF0ZSByZXBseS4NCj4gPg0KPiA+ID4gVGhpcyBzbWFsbCBwYXRjaCBzZXJp
ZXMgYWRkcmVzc2VzIGEgYnVnIHJlbGF0ZWQgdG8gdGhlIHVzYWdlIG9mDQo+ID4gPiB2NGwyX2Fz
eW5jX25vdGlmaWVyX2FkZF9zdWJkZXYoKSB0aGF0IGlzIHdpZGVzcHJlYWQgYW1vbmcgZHJpdmVy
cy4NCj4gPiA+DQo+ID4gPiBUaGUgaXNzdWUgaXMgZXhwbGFpbmVkIGluIDEvNCwgd2hpY2ggaW1w
cm92ZXMgdGhlIGRvY3VtZW50YXRpb24gb2YgdGhlDQo+ID4gPiB2NGwyX2FzeW5jX25vdGlmaWVy
X2FkZF9zdWJkZXYoKSBmdW5jdGlvbiBieSBzdGF0aW5nIGV4cGxpY2l0bHkgdGhhdCB0aGUNCj4g
PiA+IGFzZCBhcmd1bWVudCBuZWVkcyB0byBiZSBhbGxvY2F0ZWQgZHluYW1pY2FsbHkuIEFtb25n
IHRoZSAxMyBkcml2ZXJzDQo+ID4gPiB0aGF0IHVzZSB0aGF0IGZ1bmN0aW9uLCBvbmx5IG9uZSBn
ZXRzIGl0IHJpZ2h0Lg0KPiA+ID4NCj4gPiA+IFRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGZpeCB0
aGUgcHJvYmxlbSBpbiBzZXZlcmFsIFJlbmVzYXMtcmVsYXRlZA0KPiA+ID4gZHJpdmVycywgd2l0
aCBhbiB1bnJlbGF0ZWQgZndub2RlIHJlZmVyZW5jZSBsZWFrIGZpeCBmb3IgdGhlIHJjYXItZHJp
Zg0KPiA+ID4gZHJpdmVyIGluIDIvNSB0aGF0IG1hZGUgdGhlIHY0bDJfYXN5bmNfbm90aWZpZXJf
YWRkX3N1YmRldigpIGZpeCBlYXNpZXINCj4gPiA+IHRvIGltcGxlbWVudCBpbiB0aGF0IGRyaXZl
ci4NCj4gPiA+DQo+ID4gPiBJJ20gbGFja2luZyBoYXJkd2FyZSB0byB0ZXN0IDIvNSBhbmQgMy81
LiBSYW1lc2gsIHdvdWxkIHlvdSBiZSBhYmxlIHRvDQo+ID4gPiB0ZXN0IHRoYXQgPyBXaGF0IGRl
dmVsb3BtZW50IGJvYXJkIGRvIHlvdSB1c2UgdG8gdGVzdCB0aGUgRFJJRiBkcml2ZXIgPw0KPiA+
ID4gSSBkb24ndCBzZWUgYW55IERUIGludGVncmF0aW9uIHVwc3RyZWFtLg0KPiA+DQo+ID4gSSdt
IGFmcmFpZCBJIG1heSBub3QgYmUgYWJsZSB0byB0ZXN0IGl0IGFzIEkgZG8gbm90IGhhdmUgdGhl
IGhhcmR3YXJlLg0KPiA+IEkgaGF2ZSBjb3BpZWQgQ2hyaXMgUCBpZiBoZSBjYW4gaGVscCBvdXQu
DQo+DQo+IFRoYW5rcyBSYW1lc2guDQo+DQo+IEZhYnJpemlvIHdpbGwgdGFrZSBhIGxvb2sgYXMg
aGUncyB3b3JraW5nIG9uIERSSUYgY3VycmVudGx5Lg0KPiBXZSdsbCBhbHNvIGdldCBoaW0gYWRk
ZWQgdG8gdGhlIG1haW50YWluZXJzIGZpbGUuDQo+DQo+IEtpbmQgcmVnYXJkcywgQ2hyaXMNCj4N
Cj4gPg0KPiA+IEkgaGF2ZSB0ZXN0ZWQgRFJJRiBkcml2ZXIgb24gYSBIMy9NMyBTYWx2YXRvci1Y
L1Mgd2l0aCBhIGFkZC1vbiBib2FyZA0KPiA+IGZyb20gTWF4aW0gaGF2aW5nIHR3byBNQVgyMTc1
IHR1bmVycyAoTUFYMjE3NSBldmFsdWF0aW9uIGtpdCkuIFRoaXMNCj4gPiBhZGQtb24gYm9hcmQg
d2FzIGEgcHJvdG90eXBlIGF0IHRoYXQgdGltZS4gSGVuY2UsIHRoZSBEVCB1cGRhdGVzIHdlcmUN
Cj4gPiBtYWludGFpbmVkIGludGVybmFsbHkuDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gUmFtZXNo
DQo+ID4NCj4gPiA+IEkgYWxzbyBoYXZlbid0IGR1ZyB1cCBteSBNQVg5Mjg2IGRldmVsb3BtZW50
IGtpdCB0byB0ZXN0IDUvNS4gSSB3b3VsZA0KPiA+ID4gdGh1cyBhcHByZWNpYXRlIGlmIHNvbWVv
bmUgY291bGQgdGVzdCBpdCwgYnV0IHdvcnN0IGNhc2UgSSBjYW4gZG8gc28NCj4gPiA+IG15c2Vs
Zi4NCj4gPiA+DQo+ID4gPiBMYXVyZW50IFBpbmNoYXJ0ICg1KToNCj4gPiA+ICAgbWVkaWE6IHY0
bDItYXN5bmM6IERvY3VtZW50IGFzZCBhbGxvY2F0aW9uIHJlcXVpcmVtZW50cw0KPiA+ID4gICBt
ZWRpYTogcmNhcl9kcmlmOiBGaXggZndub2RlIHJlZmVyZW5jZSBsZWFrIHdoZW4gcGFyc2luZyBE
VA0KPiA+ID4gICBtZWRpYTogcmNhcl9kcmlmOiBBbGxvY2F0ZSB2NGwyX2FzeW5jX3N1YmRldiBk
eW5hbWljYWxseQ0KPiA+ID4gICBtZWRpYTogcmNhci1jc2kyOiBBbGxvY2F0ZSB2NGwyX2FzeW5j
X3N1YmRldiBkeW5hbWljYWxseQ0KPiA+ID4gICBtZWRpYTogaTJjOiBtYXg5Mjg2OiBBbGxvY2F0
ZSB2NGwyX2FzeW5jX3N1YmRldiBkeW5hbWljYWxseQ0KPiA+ID4NCj4gPiA+ICBkcml2ZXJzL21l
ZGlhL2kyYy9tYXg5Mjg2LmMgICAgICAgICAgICAgICAgIHwgMzggKysrKysrKysrKystLS0tLS0t
LS0tDQo+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNzaTIuYyB8
IDI0ICsrKysrKy0tLS0tLS0NCj4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JjYXJfZHJp
Zi5jICAgICAgICAgIHwgMzAgKysrKystLS0tLS0tLS0tLQ0KPiA+ID4gIGluY2x1ZGUvbWVkaWEv
djRsMi1hc3luYy5oICAgICAgICAgICAgICAgICAgfCAgNSArLS0NCj4gPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IC0t
DQo+ID4gPiBSZWdhcmRzLA0KPiA+ID4NCj4gPiA+IExhdXJlbnQgUGluY2hhcnQNCj4gPiA+DQoN
Cg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIvUHJl
c2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBv
ZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYs
IEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9y
ZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQw
NiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
