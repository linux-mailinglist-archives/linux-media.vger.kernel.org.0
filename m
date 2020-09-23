Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE9B275970
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 16:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgIWOIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 10:08:46 -0400
Received: from mail-eopbgr1410093.outbound.protection.outlook.com ([40.107.141.93]:26240
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726156AbgIWOIq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 10:08:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vd8EnogsQRGwnPaj5aEguc4dgKOcGax3N4642n0yk4Mfs/liyg524T9GZ2TIULz7i7BFaiGc6KqMjtDLmK++hJ844qllyL+vIiCG8thiivwhO+WWZj1aVItp66GYfDrYMWA4hr1RSWU8/IJsN1K/gZWqE/c+mysq1YOqhnMdstn0pjil1smqVkem9klmjHIT7pwaSUc0W0Gks16wrT+3MYI2lEy48dvOFe0hE1iWB74Nu35EsB5Q1vBk2juFxvN0JtmV1SDcR1omW0hdM108FqH0UtA/ZL5YzvNANO7m4gny1i4uy/3G0ddAf7G/w5fYgJMqb6583Q2nCe8KYdjusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2B8HIMv+/dhOe5Y9R/4xrD8Qk2YsEENWOZgAKPp/c=;
 b=aer8i07MN3vIQrQUUY/USiOZ+TsMxYFMdlLwVq9gZlwgpTY+z3rHGlb/NEB0sa2UeruWcog5/51Q1dyGfk3eJsXeeT/E1SXiPwXfHH12AslY389M7672jzEf5v7e3+zER6kusbSNdIluJP4X9FELvb6TG2bKoa8zf0hWfHR1uCSENHsE9mEjgi/Pm+t8EYa3ExWzMpo8DAI3CJngY0ZHyOoLi4Kn6U9Ds5pYwZ3kb6uZFvR37vDmPiGMJ3JOElNfNJCMuM71erDdW4U6EEPfg9FF+kgcFI+kKXEk2BEsgIujB+Azq97xBF0bJdHdnU/dC/lgtjTqiUCmoR4EjWWp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ma2B8HIMv+/dhOe5Y9R/4xrD8Qk2YsEENWOZgAKPp/c=;
 b=PvJZ4CBlBUXHXfufsytA62uoRGgcr+iqE+aJoRnIDv4Lce6rODEoGo0m1gthFRWfwTCQ/ofhJstIlJi4h2RmN/7ETcWNZAsxzSG4Xje5fBMZoCIorlr30jrE2W3xHRzNGs6s7F0Jf6TcIoHaeuz6PTTL9TOZC9X98IxoGmlOJUs=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSBPR01MB3079.jpnprd01.prod.outlook.com (2603:1096:604:13::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Wed, 23 Sep
 2020 14:08:41 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3391.027; Wed, 23 Sep 2020
 14:08:41 +0000
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
Thread-Index: AQHWjBiHuCDfhlkkf0yKohrKtJP4Gal2CnGAgAAYv6CAACDaAIAACN2Q
Date:   Wed, 23 Sep 2020 14:08:41 +0000
Message-ID: <OSAPR01MB27407BFEBF870A5F3DB40D15C2380@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200916105949.24858-1-fabrizio.castro.jz@renesas.com>
 <20200916105949.24858-3-fabrizio.castro.jz@renesas.com>
 <CAMuHMdU-DSqUmch3OR1pSbDkVNGDKx_YGT_432uYpoPDh_nS1Q@mail.gmail.com>
 <OSAPR01MB2740DB23267470CF995978E5C2380@OSAPR01MB2740.jpnprd01.prod.outlook.com>
 <CAMuHMdXbhqYPrFDa4rY4xM_wQcVRCr3Lh=EQHbS+jAQvLADvhg@mail.gmail.com>
In-Reply-To: <CAMuHMdXbhqYPrFDa4rY4xM_wQcVRCr3Lh=EQHbS+jAQvLADvhg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af4a4252-6a86-4b95-f6f9-08d85fca2cdc
x-ms-traffictypediagnostic: OSBPR01MB3079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB3079532936E6A8DD007A8491C2380@OSBPR01MB3079.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3pyasofjE76mAf8pslNW/AmG++3736oJkxtQhh7w/rqapCAcMz8Ziq1AiUL95r72yXeOEqDxxdl1rwv6aX+hYcS/dtmT2ygokCipM3n6b6tHC0DSW9UeVgdLwHwKrWMbl710cLPUlH+CW66GYgLq9xK/0cX+xDGHcR2RThLe6eNMpvW5SSDnRzwefy0ztBHLr29fUnCO+eHQ5ysBtOwgMPFcU7QI6HSN0ExDKISZN8wFAQd5YlgzgvKRRkTbqwkf3KEPYTNCb6ZROtDpBKf0YTpcsEcPVbdIirgn3M3Xdh38bhty3JxlcaNXMIEMZiKTC+Klc3Q3khEIVrTCjUeuIwgD0hpruxGtC/pEAB0PImQMAd1tMbmn5huhIPV2X4Eh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(8936002)(6916009)(9686003)(64756008)(4326008)(33656002)(5660300002)(83380400001)(66556008)(66446008)(66946007)(66476007)(76116006)(478600001)(53546011)(6506007)(7696005)(8676002)(55016002)(54906003)(2906002)(26005)(316002)(52536014)(86362001)(186003)(71200400001)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 3UcWBQaj52g7qIBdytDwKm81mr+08dlueulJPkMrJOaVjd0F4AdDuRRaELnUvdjTROw05z2E9LhLiVk/reb6ZUXlTWbWeCi1LTVGqXG/qIqbmdWrS5Wa0xVXYQtRvXkuckYbAFL3lGE1gZ1OuEJJJF9hM9imgo0B2p0mN8TQ/yK1SnYUtnRewZkTlJBcxll1V3GTwADmPHLz17KzpbHMblPNNbKB5rgHNUgXitGjbvh29JJUasVPfJVF4g4Uhkp/D+YKoUp3Pgi3lK66Tx4OSD9VHeH103a9Zwozgvv2nk4Ga0GDs1shcQ+yLPXp/fLFQAN8Tka6G1l0OijkZhV/vD2wYGeY7Xn6PK/NAm6RPYvJUTa3eFwhbX8NLcrjqDpzOBaJh01b8UUOIthnH8+JkVNH4TJF2o4WtkH//n+cx9P8BVy9Pw5pP1uDtiCVvk3j7oUvd0fT0FLdJ8efxDrB/mJ08MdrEN1NdzXK7VMJ5Jojg2KDrQPCJdpA8+HUM+BgLe5JkIzE9caz9mESw7+ka/q9J12geKfHqOyP3G7WORLc2yU76PBukVO/kilmJypL/1OrsaXFegfd/3cj9VgMKgEdAtAQA4b+TKcbFjZOGCEKWjAtq+jvrXgc/Ww2Fu+C0y3qoVDorrrpe9q+hmQCrw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4a4252-6a86-4b95-f6f9-08d85fca2cdc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 14:08:41.1937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /rzf+Km/tMrev4PV6hP268J9VBwIteI3OIFW9yoDExsLh+tFoif+KGGKhauKhWJdpKQ+2HhzjG46/+Gxtne3YYtJn31VNkmB0oRkWZxxP7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3079
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgZ2V0dGluZyBiYWNrIHRvIG1lLg0KDQo+IEZyb206
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+DQo+IFNlbnQ6IDIzIFNl
cHRlbWJlciAyMDIwIDE0OjMzDQo+DQo+IEhpIEZhYnJpemlvLA0KPg0KPiBPbiBXZWQsIFNlcCAy
MywgMjAyMCBhdCAxOjU1IFBNIEZhYnJpemlvIENhc3Rybw0KPiA8ZmFicml6aW8uY2FzdHJvLmp6
QHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+DQo+ID4gPiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCAxOjAwIFBN
IEZhYnJpemlvIENhc3Rybw0KPiA+ID4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4g
d3JvdGU6DQo+ID4gPiA+IENvbnZlcnQgdGhlIFJlbmVzYXMgRFJJRiBiaW5kaW5ncyB0byBEVCBz
Y2hlbWEgYW5kIHVwZGF0ZQ0KPiA+ID4gPiBNQUlOVEFJTkVSUyBhY2NvcmRpbmdseS4NCj4gPiA+
ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0
cm8uanpAcmVuZXNhcy5jb20+DQo+DQo+ID4gPiA+ICtpZjoNCj4gPiA+ID4gKyAgcmVxdWlyZWQ6
DQo+ID4gPiA+ICsgICAgLSByZW5lc2FzLHByaW1hcnktYm9uZA0KPiA+ID4gPiArdGhlbjoNCj4g
PiA+ID4gKyAgcmVxdWlyZWQ6DQo+ID4gPiA+ICsgICAgLSBwaW5jdHJsLTANCj4gPiA+ID4gKyAg
ICAtIHBpbmN0cmwtbmFtZXMNCj4gPiA+ID4gKyAgICAtIHBvcnQNCj4gPiA+DQo+ID4gPiBUaGUg
bGFzdCAzIHByb3BlcnRpZXMgbXVzdCBub3QgYmUgcHJlc2VudCBmb3IgYSBzZWNvbmRhcnkgaW50
ZXJmYWNlLA0KPiA+ID4gcmlnaHQ/DQo+ID4NCj4gPiBJZiB5b3UgaGF2ZSBib3RoIGNoYW5uZWxz
IGVuYWJsZWQsIHRoZW4gb25lIG9mIHRoZSB0d28gaGFzIHRvIGRlZmluZQ0KPiBwcm9wZXJ0aWVz
Og0KPiA+ICogcmVuZXNhcyxwcmltYXJ5LWJvbmQsIHBpbmN0cmwtMCwgcGluY3RybC1uYW1lcywg
YW5kIHBvcnQuDQo+ID4NCj4gPiBJZiBvbmx5IG9uZSBjaGFubmVsIGlzIGVuYWJsZWQsIHRoZW4g
dGhlIHByaW1hcnkgYm9uZCBjb25jZXB0IGxvc2VzIGl0cw0KPiB2YWx1ZSwNCj4gPiB3aGV0aGVy
IHJlbmVzYXMscHJpbWFyeS1ib25kIGlzIHNwZWNpZmllZCBvciBub3QgZG9lc27igJl0IG1hdHRl
ciBhbnltb3JlLA0KPiBidXQgdGhlDQo+ID4gZW5hYmxlZCBub2RlIGhhcyB0byBzcGVjaWZ5IHRo
ZSBwaW5jdHJsIHJlbGF0ZWQgcHJvcGVydGllcyBhbmQgdGhlIHBvcnQuDQo+ID4NCj4gPiA+IFRv
IGV4cHJlc3MgdGhhdCwgSSB0aGluayB5b3UgbmVlZCB0byBhZGQ6DQo+ID4gPg0KPiA+ID4gICAg
IGVsc2U6DQo+ID4gPiAgICAgICBwcm9wZXJ0aWVzOg0KPiA+ID4gICAgICAgICAtIHBpbmN0cmwt
MDogZmFsc2UNCj4gPiA+ICAgICAgICAgLSBwaW5jdHJsLW5hbWVzOiBmYWxzZQ0KPiA+ID4gICAg
ICAgICAtIHBvcnQ6IGZhbHNlDQo+ID4NCj4gPiBJZiBJIHdlbnQgd2l0aCB0aGlzLCB3ZSB3b3Vs
ZCBub3QgYmUgYWJsZSB0byBhbGxvdyB0aG9zZSBwcm9wZXJ0aWVzIHRvIGJlDQo+IHNwZWNpZmll
ZCBpbiB0aGUNCj4gPiBvbmx5IGVuYWJsZWQgbm9kZSBmb3Igc2luZ2xlIGNoYW5uZWxzIGNvbmZp
Z3VyYXRpb25zLg0KPiA+DQo+ID4gSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGFwcHJvYWNoIHRo
aXM/DQo+ID4NCj4gPiBJJ2xsIHdhaXQgZm9yIHRoaXMgcG9pbnQgdG8gZ2V0IHNvcnRlZCBiZWZv
cmUgc2VuZGluZyB2MyBvdXQuDQo+DQo+IFRoZSBvbGQgYmluZGluZyBzYWlkOg0KPg0KPiAgICAg
LVJlcXVpcmVkIHByb3BlcnRpZXMgb2YgYW4gaW50ZXJuYWwgY2hhbm5lbCB3aGVuOg0KPiAgICAg
LSAgICAgICAtIEl0IGlzIHRoZSBvbmx5IGVuYWJsZWQgY2hhbm5lbCBvZiB0aGUgYm9uZCAob3Ip
DQo+ICAgICAtICAgICAgIC0gSWYgaXQgYWN0cyBhcyBwcmltYXJ5IGFtb25nIGVuYWJsZWQgYm9u
ZHMNCj4NCj4gICAgIC0tIHJlbmVzYXMscHJpbWFyeS1ib25kOiBlbXB0eSBwcm9wZXJ0eSBpbmRp
Y2F0aW5nIHRoZSBjaGFubmVsDQo+IGFjdHMgYXMgcHJpbWFyeQ0KPiAgICAgLSAgICAgICAgICAg
ICAgICAgICAgICAgYW1vbmcgdGhlIGJvbmRlZCBjaGFubmVscy4NCj4NCj4gc28gcmVuZXNhcyxw
cmltYXJ5LWJvbmQgaXMgcmVxdWlyZWQgZm9yIHRoZSBvbmx5IGVuYWJsZWQgbm9kZSBmb3INCj4g
c2luZ2xlIGNoYW5uZWxzIGNvbmZpZ3VyYXRpb25zIGFueXdheT8NCg0KVGhlIG9sZCBiaW5kaW5n
IGFsc28gc2FpZDoNCiINCldoZW4gb25seSBvbmUgb2YgdGhlIGJvbmRlZCBjaGFubmVscyBuZWVk
IHRvIGJlIGVuYWJsZWQsIHRoZSBwcm9wZXJ0eQ0KInJlbmVzYXMsYm9uZGluZyIgb3IgInJlbmVz
YXMscHJpbWFyeS1ib25kIiB3aWxsIGhhdmUgbm8gZWZmZWN0LiBUaGF0DQplbmFibGVkIGNoYW5u
ZWwgY2FuIGFjdCBhbG9uZSBhcyBhbnkgb3RoZXIgaW5kZXBlbmRlbnQgZGV2aWNlLg0KIg0KDQpJ
ZiB5b3UgdGhlbiBsb29rIGF0IHRoZSBkcml2ZXIgaW1wbGVtZW50YXRpb24sIHRoZSByZW5lc2Fz
LHByaW1hcnktYm9uZA0KcHJvcGVydHkgZG9lc27igJl0IGdldCBldmFsdWF0ZWQgaWYgeW91IGhh
dmUgb25seSBvbmUgY2hhbm5lbCBlbmFibGVkLg0KDQpUaGFua3MsDQpGYWINCg0KPg0KPiBHcntv
ZXRqZSxlZXRpbmd9cywNCj4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4g
LS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4NCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1t
ZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQpSZW5lc2FzIEVsZWN0cm9uaWNzIEV1cm9wZSBH
bWJILCBHZXNjaGFlZnRzZnVlaHJlci9QcmVzaWRlbnQ6IENhcnN0ZW4gSmF1Y2gsIFNpdHogZGVy
IEdlc2VsbHNjaGFmdC9SZWdpc3RlcmVkIG9mZmljZTogRHVlc3NlbGRvcmYsIEFyY2FkaWFzdHJh
c3NlIDEwLCA0MDQ3MiBEdWVzc2VsZG9yZiwgR2VybWFueSwgSGFuZGVsc3JlZ2lzdGVyL0NvbW1l
cmNpYWwgUmVnaXN0ZXI6IER1ZXNzZWxkb3JmLCBIUkIgMzcwOCBVU3QtSUROci4vVGF4IGlkZW50
aWZpY2F0aW9uIG5vLjogREUgMTE5MzUzNDA2IFdFRUUtUmVnLi1Oci4vV0VFRSByZWcuIG5vLjog
REUgMTQ5Nzg2NDcNCg==
