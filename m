Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D86728E3D7
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbgJNQB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:01:27 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:36352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727034AbgJNQB0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:01:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIxIEsaRBMNS8dPYhjcZmrD+mLwkOQNfhw4fEjBoELHPsnoSU496ZNgYXpE3AeLyI5jvOX3Njq6NkIQ3WE3aefAOryExj3e7+62hkVAeekykqLJYrRqh9WZXPzUy1uSFwlXgENmga+X3QNU62JjHtDBSwB6LJ0L3SEaSGLnZXbWkZC8Ku3m5sdQvAOqPnmHMiqdVOw2E1Vm9GGteT+LfTWgpOUzHswDdOpeNPmDjHqkkjEu7u70lkTt5G5cMIQ7S8qV6+lLT6LK7RlDahCgS/JUMfsw8S96SSWX3UppL18v4I1zrmL6TRYyxPOmHqsxcAqgt3/hLPl1eP3x7Oq5tPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7WpUZtllHCy2ddBKzNQBFdKmfzvSLqOmfXmWX5w8mU=;
 b=FMXuoiCic6gLVgmiV9gHRFeC8VWkFEj3cRvGVpUuNsC9KqwKMEsEOhEG7pmdbeaxZoqLYYoVzRhqFcFtDZNyuP+Q9fRC+VUwhqsbXKoOhL3Zwij+tTOdJIouq/A8OHckd2kGBLtz6bGOow8WkgERBTLeb935m6v7B+OfDIaK6qH7Z42HocL0kjHK8klM09bvK5UghP93GL9++nVGEiJLqErlVCFYJzEniwYT8r4IQX66CJhK4YnVZNgqPNcKI5HD/GQ+2wzSneZxrA8zksxEy52LwJ1gZJHk97grN9X4T46WG7zzRtwMV709acI2kxFRuK7kAYK+grhOAmwOu2hFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7WpUZtllHCy2ddBKzNQBFdKmfzvSLqOmfXmWX5w8mU=;
 b=WLUPhWEvbnCfqAKbchKpAexCKLKBkQaVdustFMwo9ksaiPskSzooR7ndal9hd6wGRXm9wlNX/tILXZy+U3OkFzmdRA4vmW4jQf7ZD+cAsXFo0/GJl0NXUbFNy1MPnRN5gomzSMrDtaM+KkD1t2+7y/jcGqDV6JzT0yCRFvoK/Hc=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB2995.jpnprd01.prod.outlook.com (2603:1096:604:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 14 Oct
 2020 16:01:22 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 16:01:21 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
Thread-Topic: [PATCH v3 4/5] media: dt-bindings: media: renesas,drif: Add
 r8a77965 support
Thread-Index: AQHWoXHYI2L0behCIU2BKIZWRSjl+amXG3WAgAAPSWCAAAV3gIAAExNA
Date:   Wed, 14 Oct 2020 16:01:20 +0000
Message-ID: <OSAPR01MB274047DC61C63A8B869021CCC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
 <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
 <CAMuHMdUxCiwjsFRYpVND-FLajaceUf+jWK0ZBR5Rp5xJ+MPDgA@mail.gmail.com>
 <OSAPR01MB274089EA87D5280E83E81C7DC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
 <CAMuHMdUPb=Sy1R1pOXCAbDcCiMgWa27tVMvvTWn2rnotanM8cw@mail.gmail.com>
In-Reply-To: <CAMuHMdUPb=Sy1R1pOXCAbDcCiMgWa27tVMvvTWn2rnotanM8cw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1cb48031-17d2-4317-22bf-08d8705a64e3
x-ms-traffictypediagnostic: OSAPR01MB2995:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2995591BB3BCE2DFA5B6D4BFC2050@OSAPR01MB2995.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bxh4J2FAFQxxMSVKW2OjkEMb2fDMY8p/GAsU64/z86YyzswbpE7ju32TT+vnRY1QBQVfIvi1Hqkh4BjEKHja/rCBbez0eavjxihaEt+lVI6QEuodzqy7w5XByjgO/zFH1Ewt6pLPp1D5GwPEk37Ovty5zOzRAKtz9q3PZ29YE9qfk8kt0Vi60+Bhow8aDJGdprTr+F/pYikpLfUQW3M+nu8zsLe/R2yk/VuoMntAjDLpBHSwKg2KO7wkL2uaZI+/CrdTBEoomOUE6dITEunoymj3M3nGusXE8/UwW68REY8ghFbhJShtoDJFoKQP9JplDWkqD5xnwDbtuS9IE2S90g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(66556008)(66476007)(71200400001)(66446008)(5660300002)(7696005)(64756008)(26005)(52536014)(186003)(76116006)(2906002)(8676002)(8936002)(53546011)(6506007)(4326008)(9686003)(55016002)(33656002)(478600001)(66946007)(86362001)(54906003)(316002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zv/StDpmpGVMo6dyzX/D4mZxX2AR6OX3fdb3rktQvKc6sIDDNZuDRZhsITxWD5vdoA1lfiVaACvNL+y4sd/VmL7dRWHShrIGLA+tzWoWQlZXIMVfm4V/ttnnn8XWPTy/QoROayt2+pCBaPgJsKKCKGqmVvpSjszMkoIN85yGWO0FR93R4m/3eRXZCoDUeJmpIVpMJDM6RUzqVJ+kGq89Aq0XcDAIXcxdSPW/puRk9GLgG4qd83jHbv+xdaDBN0p2pmsjI/zKwuHeAIruPG7TNM9Zo+YCAGfFfkJwWC5f1PCNddd4EI4Nc63uYab/ehH8r+OKEp0WTbYRXb2mKw+bP8MC/f6YgebNr+BXlOcJRyUfY5EF74DrilyDyTIVdZ4h3f6y3XU6dxZHfRY0UFOvfLu4EngkyMmue6Onvtg5mN6MDkhAtdHWnsacr5+v2U6xnHYcz5ImanpmzFuXynNEaOYEug+fKbWxtSFFGf3fag/juHY/3zDQKo//Gu8Eosro3ijTQ9i8val5YOeRjbjoLfnTQ8kBl+34pU5RokIveX/8CN5gPcT+yVkLZRlkU9sRVv7s/l2CK886q2J9oU2g6GBbitBh+g72MKdULTLCfvIvNCtgjb8FD1c2uCcUxGPvweBGWimhTGclbHVMDy4IeQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb48031-17d2-4317-22bf-08d8705a64e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 16:01:20.9363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RRLBI86C2JCMZk/yFRJNC62Mt2WbkCD20NCNnBKsHbrirproJtUm1mxBfjPUTn5yBbc7b3Ab48Dn3qFGkddagmYFFHsdIjDGZuqqoB+YQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2995
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMTQgT2N0b2JlciAyMDIwIDE1OjUyDQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjMgNC81XSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLGRyaWY6IEFkZA0K
PiByOGE3Nzk2NSBzdXBwb3J0DQo+DQo+IEhpIEZhYnJpemlvLA0KPg0KPiBPbiBXZWQsIE9jdCAx
NCwgMjAyMCBhdCA0OjM1IFBNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBPbiBUdWUsIE9jdCAxMywgMjAyMCBhdCA1OjAyIFBN
IEZhYnJpemlvIENhc3Rybw0KPiA+ID4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiA+IFRoZSByOGE3Nzk2NSAoYS5rLmEuIFItQ2FyIE0zLU4pIGRldmljZSB0
cmVlIHNjaGVtYSBpcw0KPiA+ID4gPiBjb21wYXRpYmxlIHdpdGggdGhlIGFscmVhZHkgZG9jdW1l
bnRlZCBSLUNhciBHZW4zIGRldmljZXMuDQo+ID4gPiA+DQo+ID4gPiA+IERvY3VtZW50IHI4YTc3
OTY1IHN1cHBvcnQgd2l0aGluIHJlbmVzYXMsZHJpZi55YW1sLg0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2Fz
LmNvbT4NCj4gPiA+DQo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4g
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
DQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvcmVuZXNhcyxkcmlmLnlhbWwNCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sDQo+ID4gPiA+IEBAIC01Myw2
ICs1Myw3IEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+ICAgICAgICAtIGVudW06DQo+ID4gPiA+ICAg
ICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk1LWRyaWYgICAgICAgICMgUi1DYXIgSDMNCj4gPiA+ID4g
ICAgICAgICAgLSByZW5lc2FzLHI4YTc3OTYtZHJpZiAgICAgICAgIyBSLUNhciBNMy1XDQo+ID4g
PiA+ICsgICAgICAgIC0gcmVuZXNhcyxyOGE3Nzk2NS1kcmlmICAgICAgICMgUi1DYXIgTTMtTg0K
PiA+ID4gPiAgICAgICAgICAtIHJlbmVzYXMscjhhNzc5OTAtZHJpZiAgICAgICAjIFItQ2FyIEUz
DQo+ID4gPiA+ICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJjYXItZ2VuMy1kcmlmICMgR2VuZXJp
YyBSLUNhciBHZW4zIGNvbXBhdGlibGUNCj4gZGV2aWNlDQo+ID4gPg0KPiA+ID4gSSBndWVzcyB5
b3UncmUgYXdhcmUgTTMtTiAoYW5kIEUzKSBoYXZlIGFuIGV4dHJhIHJlZ2lzdGVyPw0KPiA+ID4g
UHJvYmFibHkgdGhlIGRyaXZlciBqdXN0IHJlbGllcyBvbiBpdHMgaW5pdGlhbCB2YWx1ZSwgYnV0
IGl0IG5ldmVyIGh1cnRzIHRvIGJlDQo+ID4gPiBleHBsaWNpdCBhbmQgaW5pdGlhbGl6ZSBpdCBw
cm9wZXJseS4NCj4gPg0KPiA+IFllcywgSSBhbSBhd2FyZSBvZiB0aGUgZXh0cmEgcmVnaXN0ZXIs
IGFuZCB0aGF0J3MgcmVmbGVjdGVkIGluIHRoZSBEUklGIG5vZGVzDQo+ID4gZGVmaW5pdGlvbiB3
aXRoaW4gdGhlIFNvQyBzcGVjaWZpYyBkZXZpY2UgdHJlZXMuDQo+ID4gSSdsbCB0YWNrbGUgaW5p
dGlhbGl6YXRpb24gYW5kIGNvbmZpZ3VyYXRpb24gb2YgdGhlIGV4dHJhIHJlZ2lzdGVyIGF0IHNv
bWUgcG9pbnQsDQo+ID4gZG8geW91IHRoaW5rIHdlIGNvdWxkIHVzZSB0aGUgZGVmYXVsdCB2YWx1
ZSBmb3Igbm93Pw0KPg0KPiBZZXMsIHRoYXQncyBmaW5lIGZvciBtZSwgaWYgaXQgd29ya3Mgd2l0
aCB0aGUgY3VycmVudCBkcml2ZXIuDQoNClllcywgYW5kIHRoYW5rIHlvdS4NCg0KQ2hlZXJzLA0K
RmFiDQoNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+DQo+IElu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1
c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg0KUmVuZXNhcyBFbGVj
dHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVu
IEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxk
b3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRvcmYsIEdlcm1hbnksIEhhbmRl
bHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0
LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1MzQwNiBXRUVFLVJlZy4tTnIu
L1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
