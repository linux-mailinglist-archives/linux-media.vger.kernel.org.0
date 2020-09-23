Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84C827578C
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 13:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbgIWLzS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 07:55:18 -0400
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:36016
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726332AbgIWLzS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 07:55:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZNS8U7s6eNVQMbfsm7s3FNYVzoHovT8IDohBm8XVWbkxA/dF+gfKykHh+0DZrwf8cxtqGS0ik0vLPlWdh6206P1gZyWpOkjRF6ya6uS3m3EAlT/j2BLpSfQ7siAFTufqhMx0I6Fopq/pcT/3R6SXmJxWlD9TmWAjPR0DlDCh549TtaEQcq2acSIAch6R9ytHXE+fwVxpn4A+oKmsK/U+gRSTdThrqR6yXOqByeZBhh57alCywm/Uaanmvrxp9pwsrAi25RdpVldUNHzT+zTJxJF5n6CVk4DIZR6sFM0z9hn4JEwT0ct6SiQotCfQBfDRFOo6Pg79rugNbYKC4hnkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk7VfVGxXFbcVFjwKtLsu+AFfnGMXuAdS9cifUpNDbk=;
 b=SUb6PhETY9TWisUiAjwvns4cR+kq/TUpxLnDLry0rmWn4vkV/sXnlxNbFT8lcCsRymB943CmFNw8UZmizPeSkV6lHOR3cW3Kk8a6ZSwVOAbleBqIya1fnKm1p4KP7AlOgAX++0AF8wlrngnqkgrlWv+5nFUKVq47u0tya7IYYC5v/pfaQvYSMjB79NwhAJW7sT3OxiiovD236OmM+u1HVC3VmfvxhAXL1K9mITSxcdfGGldkWtDU1r+J5WBTTz9Vvj7XUvYBlIVW1hLkV6PpIHR5cECm9qtVM//EyaQWi7lLJjXFkAbRG/JIkJgmGrGBuTsB4nCBQHMvHBEZqsA2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sk7VfVGxXFbcVFjwKtLsu+AFfnGMXuAdS9cifUpNDbk=;
 b=ATzJN9oazs1a6isz3H0Xa6mYBXqCgS7lV2Z/yBZEsjtlUSADuMwgurAxskqQ+TFZ6zq4Y2jD04X+j3vgqaK2txKo4lYRLuw3ZAdRCN4ijMt0SB5SKIFEsWp1jkuCvWGLT379zx7UBLlW10mVxKmhcNkELRc4ABdbgQYu3LjAO1I=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSBPR01MB3575.jpnprd01.prod.outlook.com (2603:1096:604:43::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Wed, 23 Sep
 2020 11:55:13 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 11:55:12 +0000
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
Subject: RE: [PATCH v2 2/3] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Topic: [PATCH v2 2/3] media: dt-bindings: media: renesas,drif: Convert
 to json-schema
Thread-Index: AQHWjBiHuCDfhlkkf0yKohrKtJP4Gal2CnGAgAAYv6A=
Date:   Wed, 23 Sep 2020 11:55:12 +0000
Message-ID: <OSAPR01MB2740DB23267470CF995978E5C2380@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdU-DSqUmch3OR1pSbDkVNGDKx_YGT_432uYpoPDh_nS1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdU-DSqUmch3OR1pSbDkVNGDKx_YGT_432uYpoPDh_nS1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 39b870be-5c18-4e24-f074-08d85fb78778
x-ms-traffictypediagnostic: OSBPR01MB3575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3575142245D34B0C0CAD0C6FC2380@OSBPR01MB3575.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UtZRqiABWUQARYF16F2/T5P5RSfkrwwnUbw8yP92KcV7ezdfB9zPehlvFAeowFKVCTMvaJ3Y9JoP62jYizd94cl9KEwgTCqVSqkS/Jji0SD0bcqu6IFM3b+lQuG6+ik2mcIXSfbs4T9/gtFUnvRz/u8uE2vRhYnAdgozk5Jyr3w9tOh3qMd96OLrQDI8cwz/j+dN0Qyf1VXkfUYGu3fKcwsoj6k4+79NhUVahkSYe7fcv38Z0RYLKNXg4CMWBp33fQ+yLpbYFpBHXMsJeTTFTnSXQZQW8lQY0wIJM1uB+99Iv8zyuE1aWnjzAiy8G/2BJ03xMSuOyzmCnppuSGDSD8fs3wvtXwqHGYCq2xLxU7Q3k7ms0Wwv0mbMqyw1qlT5utYyAHGEVbPbwgIbLLiSXBBzKg6eIXD7AiTkOYWAfic=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(66446008)(66476007)(76116006)(66556008)(83380400001)(8676002)(86362001)(71200400001)(6916009)(66946007)(9686003)(52536014)(54906003)(5660300002)(26005)(2906002)(8936002)(55016002)(64756008)(6506007)(53546011)(186003)(33656002)(316002)(478600001)(7696005)(4326008)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NRtgTpmdG0w/GbHUDuCj0JZrs7vR4/uAdTY0xQIQtEFt/BUcgDvvfx1taBqmGhIMQRgy5h3ZUv5gAccXP67v4t0DbqWWCJIDTqdDtdcG5Vaz23HBEq4FvWtK0fPmAbxtkyGa1ZTxXdtDC6EzCul+ICuValFWSpAIvw+WKJB0CLtwN1cw3X9KAaAy4PR+5FgOQMRthJpFgbCc19zFrhkLW8Sq3x6vBX2020qvBhoYm6QfPDHkOgPtO4fX/m7A+Si2UNx9CNkkzs7nXMpnU3MT6fSROvidwqMMfvJaGFZXuCI8JmbTfoA0VA/D1XPuxiiP7rgHUMteg2yN0YM+N/zp0JEOeh2WPnEF+DqOz8o/va4Oi8nk1eHzwuGO0Mv6NTFq/wciWEswsUf7cm7Mgc+vJ6cpr54OYzZ2/obrtx1tRM13ESUQRHDEU+MFn4mONI6oVO9h3Wtu9mMIQDcVgguPCDJfoMoNyojhJCzZV2ejqZsyJ//IwzkZ914disJRvINi5ME07oswadjtOQRiPwbByZYGeKZCtqZNhsbwk1+lNMAYkRvWiRHva4QTtSGujn87fCKqEGRO2GiD8IZQNbE/iXcJjmRcYjKCLtxPYbhwWKFnPEayHceezhU9m06UHZ5qyNPBt7KSBlNEHoNgTT6pUA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b870be-5c18-4e24-f074-08d85fb78778
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 11:55:12.8089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6JirAbMgH3x7R+/DlrGml3IqG0R6woHa03LgytmC+8oNImoQEUcOhjhbQcVL311jzSafox+NPYyOcNshxVObHU1MDCFeHwnEMlB5e+xulhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3575
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAyMyBTZXB0ZW1i
ZXIgMjAyMCAxMTowNw0KPg0KPiBIaSBGYWJyaXppbywNCj4NCj4gT24gV2VkLCBTZXAgMTYsIDIw
MjAgYXQgMTowMCBQTSBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5l
c2FzLmNvbT4gd3JvdGU6DQo+ID4gQ29udmVydCB0aGUgUmVuZXNhcyBEUklGIGJpbmRpbmdzIHRv
IERUIHNjaGVtYSBhbmQgdXBkYXRlDQo+ID4gTUFJTlRBSU5FUlMgYWNjb3JkaW5nbHkuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryby5qekBy
ZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtDQo+IGxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPg0KPiBUaGFu
a3MgZm9yIHlvdXIgcGF0Y2ghDQo+DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLGRyaWYueWFtbA0KPg0K
PiA+ICtwcm9wZXJ0aWVzOg0KPg0KPiA+ICsgIHBpbmN0cmwtMDoNCj4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gKw0KPiA+ICsgIHBpbmN0cmwtbmFtZXM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0K
PiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IGRlZmF1bHQNCj4NCj4gSSB0aGlu
ayB0aGVzZSBhcmUgYWRkZWQgYXV0b21hdGljYWxseSBieSB0aGUgdG9vbGluZywgc28gdGhlcmUg
aXMgbm8NCj4gbmVlZCB0byBsaXN0IHRoZW0gZXhwbGljaXRseS4NCj4gT3IgZG8geW91IG5lZWQg
dG8gbGlzdCB0aGVtIGhlcmUgYmVjYXVzZSBvZiB0aGUgcmVxdWlyZWQgbG9naWMgYmVsb3c/DQoN
CkkgaGF2ZSBub3cgdHJpZWQgdGFraW5nIHBpbmN0cmwtMCBhbmQgcGluY3RybC1uYW1lcyBwcm9w
ZXJ0aWVzIG91dCwgYW5kIHRoaW5ncyBzZWVtIHRvIGJlIG9rYXksIEknbGwgdGFrZSB0aGVtIG91
dCBpbiB2My4NCg0KPg0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiAr
ICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBj
bG9jay1uYW1lcw0KPiA+ICsgIC0gcmVzZXRzDQo+ID4gKyAgLSBkbWFzDQo+ID4gKyAgLSBkbWEt
bmFtZXMNCj4gPiArICAtIHJlbmVzYXMsYm9uZGluZw0KPg0KPiBNaXNzaW5nICJwb3dlci1kb21h
aW5zIi4NCg0KSSdsbCBhZGQgaXQgaW4gdjMNCg0KPg0KPiA+ICsNCj4gPiAraWY6DQo+ID4gKyAg
cmVxdWlyZWQ6DQo+ID4gKyAgICAtIHJlbmVzYXMscHJpbWFyeS1ib25kDQo+ID4gK3RoZW46DQo+
ID4gKyAgcmVxdWlyZWQ6DQo+ID4gKyAgICAtIHBpbmN0cmwtMA0KPiA+ICsgICAgLSBwaW5jdHJs
LW5hbWVzDQo+ID4gKyAgICAtIHBvcnQNCj4NCj4gVGhlIGxhc3QgMyBwcm9wZXJ0aWVzIG11c3Qg
bm90IGJlIHByZXNlbnQgZm9yIGEgc2Vjb25kYXJ5IGludGVyZmFjZSwNCj4gcmlnaHQ/DQoNCklm
IHlvdSBoYXZlIGJvdGggY2hhbm5lbHMgZW5hYmxlZCwgdGhlbiBvbmUgb2YgdGhlIHR3byBoYXMg
dG8gZGVmaW5lIHByb3BlcnRpZXM6DQoqIHJlbmVzYXMscHJpbWFyeS1ib25kLCBwaW5jdHJsLTAs
IHBpbmN0cmwtbmFtZXMsIGFuZCBwb3J0Lg0KDQpJZiBvbmx5IG9uZSBjaGFubmVsIGlzIGVuYWJs
ZWQsIHRoZW4gdGhlIHByaW1hcnkgYm9uZCBjb25jZXB0IGxvc2VzIGl0cyB2YWx1ZSwNCndoZXRo
ZXIgcmVuZXNhcyxwcmltYXJ5LWJvbmQgaXMgc3BlY2lmaWVkIG9yIG5vdCBkb2VzbuKAmXQgbWF0
dGVyIGFueW1vcmUsIGJ1dCB0aGUNCmVuYWJsZWQgbm9kZSBoYXMgdG8gc3BlY2lmeSB0aGUgcGlu
Y3RybCByZWxhdGVkIHByb3BlcnRpZXMgYW5kIHRoZSBwb3J0Lg0KDQo+IFRvIGV4cHJlc3MgdGhh
dCwgSSB0aGluayB5b3UgbmVlZCB0byBhZGQ6DQo+DQo+ICAgICBlbHNlOg0KPiAgICAgICBwcm9w
ZXJ0aWVzOg0KPiAgICAgICAgIC0gcGluY3RybC0wOiBmYWxzZQ0KPiAgICAgICAgIC0gcGluY3Ry
bC1uYW1lczogZmFsc2UNCj4gICAgICAgICAtIHBvcnQ6IGZhbHNlDQoNCklmIEkgd2VudCB3aXRo
IHRoaXMsIHdlIHdvdWxkIG5vdCBiZSBhYmxlIHRvIGFsbG93IHRob3NlIHByb3BlcnRpZXMgdG8g
YmUgc3BlY2lmaWVkIGluIHRoZQ0Kb25seSBlbmFibGVkIG5vZGUgZm9yIHNpbmdsZSBjaGFubmVs
cyBjb25maWd1cmF0aW9ucy4NCg0KSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGFwcHJvYWNoIHRo
aXM/DQoNCkknbGwgd2FpdCBmb3IgdGhpcyBwb2ludCB0byBnZXQgc29ydGVkIGJlZm9yZSBzZW5k
aW5nIHYzIG91dC4NCg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtDQo+IG02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzDQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1
ZWhyZXIvUHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVn
aXN0ZXJlZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVl
c3NlbGRvcmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBE
dWVzc2VsZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERF
IDExOTM1MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
