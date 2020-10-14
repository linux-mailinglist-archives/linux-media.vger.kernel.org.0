Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E2F28E245
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgJNOf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:35:29 -0400
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:26256
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726942AbgJNOf3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:35:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gV2p+bogk9r5xsL9I5NzGqFW0hHop4bMiD/cYl5tAIsn3bzShawKMxIxh480m3fKQom/mJ4YQB9RIlEO3Yd1p/flDeuUcw6ZrjDYvw9MYNCbPYzfB7bqqQou80T8yIeUcaHhZ4kS3b5Nama61nzGpp8d9xmQwBti+JyW0xrjzvSljCjmYYVa6GZ5RkOwID2xgUbEitXlkwKeEGs9wgU15LBWSPQQ/7oh/DRjnRXnnu4JyI65BpMCosuHYojdNij+2qVJ+tnqzW7St12v/D8a07uZYDPahfR2TgloGv45hUf8gCZewinN8b87fqdtAH2tVoxwBzDAy7cqCIyw4LDnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKJr0UbMYdBGFKfmNSXYeHNmnTkRdeNYIn8O8LXbvhA=;
 b=lhUgqHKlu1+5knQVUxG7UuUelPl9pQsjoJId3DBQ22cqlrq+h9Yvg9GegnX0Q26AipuR+zsNgH/MxuFGUAx4mytgjDfZnup7HoQTdue0D5uNkqI0EMzf2TOXxt4vVclU34ljtBEIr9kKHTaaVFNqft8gwFIbSY6IfxyndUvUoGl+UZEvrJFR3K9gxCXbvCm+zxf9I6KnCTFE3feHouXkj10DIuGt7kDetdhtTSu6zxvADEbk1lgMvjBsSOcmOZWkbYQHnC3B+T2U5EfxVd3L0Jd+j1WgFKxRp+PJVSxByPRPsfyIZf2KbbQ1QS3FPWFSxAXB3wj0Me76grHlPnmtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKJr0UbMYdBGFKfmNSXYeHNmnTkRdeNYIn8O8LXbvhA=;
 b=q3o/OFaBCQVpGYU49BkCM58DPWCy5z91ecI7qTC4VhZgvVpihmsA5VPNq1P6IYGaubLdJ862psAWIdPc686XOc9rkT1L5Cq4vOArLxClwLm97234XYD4UCgYrIYvJMuOJUYYuvD6tVc4t5SFiA/4B7Cmn6AtO2xVEQcn4iUgdq8=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB1699.jpnprd01.prod.outlook.com (2603:1096:603:2b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 14 Oct
 2020 14:35:24 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3477.021; Wed, 14 Oct 2020
 14:35:24 +0000
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
Thread-Index: AQHWoXHYI2L0behCIU2BKIZWRSjl+amXG3WAgAAPSWA=
Date:   Wed, 14 Oct 2020 14:35:24 +0000
Message-ID: <OSAPR01MB274089EA87D5280E83E81C7DC2050@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20201013150150.14801-1-fabrizio.castro.jz@renesas.com>
 <20201013150150.14801-5-fabrizio.castro.jz@renesas.com>
 <CAMuHMdUxCiwjsFRYpVND-FLajaceUf+jWK0ZBR5Rp5xJ+MPDgA@mail.gmail.com>
In-Reply-To: <CAMuHMdUxCiwjsFRYpVND-FLajaceUf+jWK0ZBR5Rp5xJ+MPDgA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 569b49c7-4a93-4afc-ac26-08d8704e6343
x-ms-traffictypediagnostic: OSAPR01MB1699:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB1699A3819C2795078E1B6736C2050@OSAPR01MB1699.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H0AnPeyTNEC1RDaf+1xatGgCGljHCZ8dJctsw3sPzKClgoVoi37VvdRpEI38HeU2Al77JKuq2Gnk96Sz5w/tI4BSvtIU3wz6wELNPyS2y90L4u8YIkCCcw12L0Qg9HcSVbxfj3P02+5CSucXi4me4FgV2UIpO6Q7spbQ0kGoVW7xw53tP3zXWZyXgDw67ISUllvpZ0mQfdbF1WTDWvFkjxflQ4dz/S2kpRvjfCi6D7NdReLvlCpQ34AJvr3xlN/DlzMafWWZlOgmxKxURKM+/qtM7JKI1ikvFNthOP4VEQyaeyZet5yZU+KZl49sFxqlrDMwXy5fs2t9guz39d5YNQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(8676002)(478600001)(71200400001)(4326008)(76116006)(8936002)(64756008)(66556008)(9686003)(66476007)(2906002)(66446008)(66946007)(52536014)(86362001)(54906003)(5660300002)(33656002)(53546011)(7696005)(26005)(316002)(186003)(55016002)(6506007)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Wu5KR8rKnuCezxqokAOuz+p9OPiCBVx/mu64o8FLF1F49bAHBowRSolcqABoAvtHJ9xkbhVBjaqpmP7y5PDY89R5ppX6Fi9/vW2H999SbYsoPbv9wM0RdDixk0IbchfejY0PYq8vmI8QTcmqg+JHBn810V85nZpgzkMmNNEIwEECO8wVI3+PTfIanlQuyAYmUusCuwtfITCW3g0wxH0Ivlx9ue6kYCIATixcBlIy389GmaLCZl5dyknLO5rz8pSCg5iswyDCAmpYMHg+qaeQ2/80wpczADyLoQzOBMnMujQJj7UKXyDsZXfxxoEKf1oI/MLLcavaYWorzQzYYabKS5vmaDUemAc99xP0FKf/ZeCIaxoJN1eb36Lji8+GsOHCtjUV/UwNFatOpA+bT5llaoBt/gniz/iu8bHWYZ3xWWVvauL70wTmtIIf1U6kyvnpQWvdXNy6aruoBFVQVlgOo9sJcPQgkLHRIBQqtkSdexM8+Kv+eg+N1ytcEIsCvBhfzNJ6o/LKnWyrs/D8WIF+HjUGURVkGXKAJ98YeEcXNrnfipc3B/CaXeXd07J2OcP539cE5qQhwcPRKTDW3112BdXvS1BtABDCGb7m1L5oZoQDBAt6yXlPCoC2j1WtfbZH/UjtD/YIaZ5e3o1EesEVSA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569b49c7-4a93-4afc-ac26-08d8704e6343
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 14:35:24.5965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCGQcpZlTcgfHI0YGm9T+p14JVhwRgRzKC8SKjeF6WUpgbTD276LTT0clzyBeiieFcCs0sZN/lvbwP4u8BUoTSEGe2rNjitxx+2j1oCVDBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1699
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayENCg0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxNCBPY3RvYmVy
IDIwMjAgMTQ6MzgNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzVdIG1lZGlhOiBkdC1iaW5k
aW5nczogbWVkaWE6IHJlbmVzYXMsZHJpZjogQWRkDQo+IHI4YTc3OTY1IHN1cHBvcnQNCj4NCj4g
SGkgRmFicml6aW8sDQo+DQo+IE9uIFR1ZSwgT2N0IDEzLCAyMDIwIGF0IDU6MDIgUE0gRmFicml6
aW8gQ2FzdHJvDQo+IDxmYWJyaXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
IFRoZSByOGE3Nzk2NSAoYS5rLmEuIFItQ2FyIE0zLU4pIGRldmljZSB0cmVlIHNjaGVtYSBpcw0K
PiA+IGNvbXBhdGlibGUgd2l0aCB0aGUgYWxyZWFkeSBkb2N1bWVudGVkIFItQ2FyIEdlbjMgZGV2
aWNlcy4NCj4gPg0KPiA+IERvY3VtZW50IHI4YTc3OTY1IHN1cHBvcnQgd2l0aGluIHJlbmVzYXMs
ZHJpZi55YW1sLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJy
aXppby5jYXN0cm8uanpAcmVuZXNhcy5jb20+DQo+DQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4NCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlk
ZXIuYmU+DQo+DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3JlbmVzYXMsZHJpZi55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsZHJpZi55YW1sDQo+ID4gQEAgLTUzLDYgKzUzLDcgQEAg
cHJvcGVydGllczoNCj4gPiAgICAgICAgLSBlbnVtOg0KPiA+ICAgICAgICAgIC0gcmVuZXNhcyxy
OGE3Nzk1LWRyaWYgICAgICAgICMgUi1DYXIgSDMNCj4gPiAgICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5Ni1kcmlmICAgICAgICAjIFItQ2FyIE0zLVcNCj4gPiArICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5NjUtZHJpZiAgICAgICAjIFItQ2FyIE0zLU4NCj4gPiAgICAgICAgICAtIHJlbmVzYXMscjhh
Nzc5OTAtZHJpZiAgICAgICAjIFItQ2FyIEUzDQo+ID4gICAgICAgIC0gY29uc3Q6IHJlbmVzYXMs
cmNhci1nZW4zLWRyaWYgIyBHZW5lcmljIFItQ2FyIEdlbjMgY29tcGF0aWJsZSBkZXZpY2UNCj4N
Cj4gSSBndWVzcyB5b3UncmUgYXdhcmUgTTMtTiAoYW5kIEUzKSBoYXZlIGFuIGV4dHJhIHJlZ2lz
dGVyPw0KPiBQcm9iYWJseSB0aGUgZHJpdmVyIGp1c3QgcmVsaWVzIG9uIGl0cyBpbml0aWFsIHZh
bHVlLCBidXQgaXQgbmV2ZXIgaHVydHMgdG8gYmUNCj4gZXhwbGljaXQgYW5kIGluaXRpYWxpemUg
aXQgcHJvcGVybHkuDQoNClllcywgSSBhbSBhd2FyZSBvZiB0aGUgZXh0cmEgcmVnaXN0ZXIsIGFu
ZCB0aGF0J3MgcmVmbGVjdGVkIGluIHRoZSBEUklGIG5vZGVzDQpkZWZpbml0aW9uIHdpdGhpbiB0
aGUgU29DIHNwZWNpZmljIGRldmljZSB0cmVlcy4NCkknbGwgdGFja2xlIGluaXRpYWxpemF0aW9u
IGFuZCBjb25maWd1cmF0aW9uIG9mIHRoZSBleHRyYSByZWdpc3RlciBhdCBzb21lIHBvaW50LA0K
ZG8geW91IHRoaW5rIHdlIGNvdWxkIHVzZSB0aGUgZGVmYXVsdCB2YWx1ZSBmb3Igbm93Pw0KDQo+
DQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dA0KPg0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPg0KPiBJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0KDQoNClJlbmVzYXMgRWxlY3Ryb25p
Y3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVocmVyL1ByZXNpZGVudDogQ2Fyc3RlbiBKYXVj
aCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwg
QXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3JmLCBHZXJtYW55LCBIYW5kZWxzcmVn
aXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVlc3NlbGRvcmYsIEhSQiAzNzA4IFVTdC1JRE5y
Li9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAxMTkzNTM0MDYgV0VFRS1SZWcuLU5yLi9XRUVF
IHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
