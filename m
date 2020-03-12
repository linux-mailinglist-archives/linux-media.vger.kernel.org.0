Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F7C183BC4
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 22:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCLVwp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 17:52:45 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:9568
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726246AbgCLVwp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 17:52:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9cjXGCAB3/p/hSmywiPoRVib28S3L+tk5mPIqg0EUSSIwYVh21nGC4Zjuh2GQpXU4hSf4zTp0Icv9woD9g53WU69miv0+3u7eohcinCUDt6xR4SIpL3wWmlnph+CPWFbfZRjJwuaD/SYLUxeJsPHbku5HQaR1GA6tq4i7q0ek3aZ/L89e934Yd12n/A9RJqF+MeOQEjwhzRX4KnHpPFHUY38rVVlc8yjaWD3wd3YYeemVmNSBPCeheBv2IJjd6RZFb997lM2QatHbSbyS9irQVi2L7hhuwH6DH+M9sMMCJxiagF8A5cykqVPJmIk8BIDtHogWrJHsujUg4BEjimzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfQ78igUNeotD8hWxHNWXdmcPmyHb/QIAHDKwYIVw6I=;
 b=gTs2mQKK+bXg9op6yZtDYAekgu+/HSADqc4dLlhODxwr8Vh1flJtiAEtgemBn3MN3gk0mL6TLBQN2RrPMzhwadrnUzlRoBXS639bAkd5f6Q/bE9URYsKm+8MDP0q6XOFvXLb9ZgwSMN8Z+lBxcvRhVSFZhVnkIpmul3QFmVRgS7nQ+33lGlOzEzBsuk0PhI97uPNzJR6RxUJ6Gr8eZAXh7mEShJVVQkeIKkCaumvnStrgOi3gvJ0LT98smwkDVoxLnXM1BzPnXjF+IBhCe+sM0SNhqSm4m3j8oIGsrlkXjEkk/q0M7G/AoZ9cXb2ePaFyJub2AoPilyve44CRLO2iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfQ78igUNeotD8hWxHNWXdmcPmyHb/QIAHDKwYIVw6I=;
 b=BSFuDGiA83X/YWFwb4ddC0gQW3/bhXTd/93JK+JDvlsaqGUpNSytIJd5etGNccoLVsOuDDP9vJV8OjfqRtgrhPse+yWXlzLJkmbrlICPCsMN/0RoRJonhgsscLNByEwNMyed0t3k323E7qV62X1JkqfeyLim/njLd1U5rQGr/TA=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB4311.jpnprd01.prod.outlook.com (20.179.181.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13; Thu, 12 Mar 2020 21:52:38 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Thu, 12 Mar 2020
 21:52:38 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] media: i2c: ov5645: Switch to assigned-clock-rates
Thread-Topic: [PATCH v2 2/3] media: i2c: ov5645: Switch to
 assigned-clock-rates
Thread-Index: AQHV+LMHriTg1O9fLki5YHCWHclgDahFfJwAgAABE5A=
Date:   Thu, 12 Mar 2020 21:52:38 +0000
Message-ID: <OSBPR01MB3590906C6121D1DFFF4ABF0DAAFD0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUgMHjU_ZANzJbxQji6K7Pdc-jD4C7JatQc-OtN=jJt_w@mail.gmail.com>
In-Reply-To: <CAMuHMdUgMHjU_ZANzJbxQji6K7Pdc-jD4C7JatQc-OtN=jJt_w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98f0e848-2158-42ed-f487-08d7c6cfaeb3
x-ms-traffictypediagnostic: OSBPR01MB4311:
x-microsoft-antispam-prvs: <OSBPR01MB4311E4575F484661DA876AF2AAFD0@OSBPR01MB4311.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0340850FCD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(52536014)(71200400001)(54906003)(478600001)(2906002)(7696005)(6916009)(4326008)(81156014)(966005)(86362001)(81166006)(6506007)(8676002)(26005)(186003)(5660300002)(66556008)(66476007)(64756008)(66446008)(53546011)(7416002)(8936002)(316002)(33656002)(76116006)(55016002)(9686003)(66946007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4311;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nV2u5k2zErab0XQ5x6xbF/r7m3Dq2FIWBjXzNiiAXqw2NZ0qkozvJD7w26BUyQeemelGNHRCMVGgZ9Bw1Iw9mPaFB4dOrH/IfMozrqCnzguNIuVodI0vQROzq+YxP2ql0CsUKKITAKS3STFwGKw/Qcji4SlPE9suDhTU0yaJl562fNqkfCp13Yw3oFT25SggJKt/mZZQ54S21F+aQFZBtq7Ap9xP839uWsnNnihi8EFBLeLJY/+0qeb2xsZBxOT/o4FfoJYrquQXs7O0ZnA+IA4ihkhHI9eXWkSznFmGhefIxiCCrlPxVevwhqyMpm0njMm5Cr4YQNVWIbVPM2NI6msPInos1iwxccNFFLV4j8zWTQwbODSNcLNihW8a3KuXtwCWZQpY8p7omJB/7RHKtG061QfHa1yRwRDZpKToQpfGj6MmE0zVs6SaknJKW12I//T/6qqorkhqcOHZy40wYIDcqrnlwsU2wfrCo0hxRxWSmszgFf3xyA3ho+WNwFLlPAbaSctJXtsnkzLWaM2cpA==
x-ms-exchange-antispam-messagedata: flsNdWR17UCS7gNR8tB2PBvE5hORFfAIN6doAlo+Opx8GoLxAyWT6gEHYmmTvDG7y3miGg58/10TToeYwCjk8cfK0jgLDp6wGyc7F2d8qD21a5/fxnWlXVnUGqhrLzmjSCdgQo3Y/LP2UhN6cIatQw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f0e848-2158-42ed-f487-08d7c6cfaeb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2020 21:52:38.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZ4gvB8xrBKpoMhRoiL2a1G9h7Nkc1gnPsFFME1Z1mDu+jtCGRVk53f12BwCvBZs6eu4fWHaBY0yAmCT6qKXzZWTIwGFeGWzXhBoPdKxhkhfJyjCL+Iy0XPK0TpF4Q1l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4311
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHF1aWNrIHJldmlldy4NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPg0KPiBTZW50OiAxMiBNYXJjaCAyMDIwIDIxOjQyDQo+IFRvOiBQcmFiaGFr
YXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4N
Cj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgU2hhd24g
R3VvDQo+IDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsNCj4gUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNYXJrIFJ1dGxhbmQg
PG1hcmsucnV0bGFuZEBhcm0uY29tPjsgU2FrYXJpDQo+IEFpbHVzIDxzYWthcmkuYWlsdXNAbGlu
dXguaW50ZWwuY29tPjsgTlhQIExpbnV4IFRlYW0gPGxpbnV4LWlteEBueHAuY29tPjsNCj4gTWFn
bnVzIERhbW0gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IEV6ZXF1aWVsIEdhcmNpYQ0KPiA8ZXpl
cXVpZWxAY29sbGFib3JhLmNvbT47IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVO
RUQNCj4gREVWSUNFIFRSRUUgQklORElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsg
TGludXggS2VybmVsIE1haWxpbmcNCj4gTGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
Zz47IExpbnV4LVJlbmVzYXMgPGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc+
OyBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBMaW51eCBBUk0NCj4gPGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IExpbnV4IE1lZGlhIE1haWxpbmcgTGlz
dCA8bGludXgtDQo+IG1lZGlhQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MiAyLzNdIG1lZGlhOiBpMmM6IG92NTY0NTogU3dpdGNoIHRvIGFzc2lnbmVkLWNsb2NrLQ0K
PiByYXRlcw0KPg0KPiBIaSBQcmFiaGFrYXIsDQo+DQo+IE9uIFRodSwgTWFyIDEyLCAyMDIwIGF0
IDEwOjEzIFBNIExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAu
cmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc3dpdGNoZXMgdG8gYXNzaWduZWQt
Y2xvY2stcmF0ZXMgZm9yIHNwZWNpZnlpbmcgdGhlIGNsb2NrIHJhdGUuDQo+ID4gVGhlIGNsay1j
b25mLmMgaW50ZXJuYWxseSBoYW5kbGVzIHNldHRpbmcgdGhlIGNsb2NrIHJhdGUgd2hlbg0KPiA+
IGFzc2lnbmVkLWNsb2NrLXJhdGVzIGlzIHBhc3NlZC4NCj4gPg0KPiA+IFRoZSBkcml2ZXIgbm93
IHNldHMgdGhlIGNsb2NrIGZyZXF1ZW5jeSBvbmx5IGlmIHRoZSBkZXByZWNhdGVkDQo+ID4gcHJv
cGVydHkgY2xvY2stZnJlcXVlbmN5IGlzIGRlZmluZWQgaW5zdGVhZCBhc3NpZ25lZC1jbG9jay1y
YXRlcywgdGhpcw0KPiA+IGlzIHRvIGF2b2lkIGJyZWFrYWdlIHdpdGggZXhpc3RpbmcgRFQgYmlu
YXJpZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIu
bWFoYWRldi0NCj4gbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPg0KPiBUaGFua3MgZm9yIHlvdXIg
cGF0Y2ghDQo+DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQ1LmMNCj4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDUuYw0KPiA+IEBAIC0xMDU1LDYgKzEwNTUsNyBAQCBz
dGF0aWMgaW50IG92NTY0NV9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+ICAg
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICplbmRwb2ludDsNCj4gPiAgICAgICAgIHN0cnVjdCBv
djU2NDUgKm92NTY0NTsNCj4gPiAgICAgICAgIHU4IGNoaXBfaWRfaGlnaCwgY2hpcF9pZF9sb3c7
DQo+ID4gKyAgICAgICBib29sIHNldF9jbGsgPSBmYWxzZTsNCj4gPiAgICAgICAgIHVuc2lnbmVk
IGludCBpOw0KPiA+ICAgICAgICAgdTMyIHhjbGtfZnJlcTsNCj4gPiAgICAgICAgIGludCByZXQ7
DQo+ID4gQEAgLTEwOTQsMTAgKzEwOTUsMTcgQEAgc3RhdGljIGludCBvdjU2NDVfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCkNCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBU
Ul9FUlIob3Y1NjQ1LT54Y2xrKTsNCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+IC0gICAgICAgcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAiY2xvY2stZnJlcXVlbmN5IiwN
Cj4gJnhjbGtfZnJlcSk7DQo+ID4gKyAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihk
ZXYtPm9mX25vZGUsICJhc3NpZ25lZC1jbG9jay1yYXRlcyIsDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmeGNsa19mcmVxKTsNCj4gPiAgICAgICAgIGlmIChyZXQpIHsN
Cj4NCj4gSSB0aGluayB5b3UgY2FuIGp1c3QgbGVhdmUgb3V0IHRoZSBhYm92ZSBjaGVjay4uLg0K
Pg0KPiA+IC0gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNvdWxkIG5vdCBnZXQgeGNsayBm
cmVxdWVuY3lcbiIpOw0KPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAg
ICAgICAgICAgICAvKiBjaGVjayBpZiBkZXByZWNhdGVkIHByb3BlcnR5IGNsb2NrLWZyZXF1ZW5j
eSBpcyBkZWZpbmVkICovDQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKGRldi0+b2Zfbm9kZSwgImNsb2NrLWZyZXF1ZW5jeSIsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ4Y2xrX2ZyZXEpOw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KSB7DQo+DQo+IC4uLiBhbmQgaWdub3JlIHRoZSBhYnNlbmNlIG9mIHRo
ZSBkZXByZWNhdGVkIHByb3BlcnR5Lg0KPg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiY291bGQgbm90IGdldCB4Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+
ICsgICAgICAgICAgICAgICBzZXRfY2xrID0gdHJ1ZTsNCj4NCj4gSS5lLiBqdXN0DQo+DQo+ICAg
ICAgICAgLyogY2hlY2sgaWYgZGVwcmVjYXRlZCBwcm9wZXJ0eSBjbG9jay1mcmVxdWVuY3kgaXMg
ZGVmaW5lZCAqLw0KPiAgICAgICAgIHhjbGtfZnJlcSA9IDA7DQo+ICAgICAgICAgb2ZfcHJvcGVy
dHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAiY2xvY2stZnJlcXVlbmN5IiwgJnhjbGtfZnJlcSk7
DQo+ICAgICAgICAgaWYgKHhjbGtfZnJlcSkgew0KPiAgICAgICAgICAgICAgICAgcmV0ID0gY2xr
X3NldF9yYXRlKG92NTY0NS0+eGNsaywgeGNsa19mcmVxKTsNCj4gICAgICAgICAgICAgICAgIGlm
IChyZXQpIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJjb3VsZCBu
b3Qgc2V0IHhjbGsgZnJlcXVlbmN5XG4iKTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsNCj4gICAgICAgICAgICAgICAgIH0NCj4gICAgICAgICB9IGVsc2Ugew0KPiAgICAg
ICAgICAgICAgICAgeGNsa19mcmVxID0gY2xrX2dldF9yYXRlKG92NTY0NS0+eGNsaywgeGNsa19m
cmVxKTsNCj4gICAgICAgICB9DQo+DQpJIGRpZCB0aGluayBhYm91dCBpdCBpbml0aWFsbHksIGJ1
dCByZWFsaXplZCB0aGUgY2xrX2dldF9yYXRlIG1heSB2YXJ5IHBsYXRmb3JtIHRvIHBsYXRmb3Jt
DQpmb3IgZXhhbXBsZSBpbiBHMkUgY2xrX2dldF9yYXRlKCkgcmV0dXJucyBhIGZyZXF1ZW5jeSBv
ZiAyNDI0MjQyNCB3aXRoDQphc3NpZ25lZC1jbG9jay1yYXRlcyBzZXQgdG8gIDI0MDAwMDAwIGFu
ZCBwcm9iZSB3b3VsZCBmYWlsIGR1ZSB0byBhIGNoZWNrIGZvcg0KZXh0ZXJuYWwgY2xvY2sgbXVz
dCBiZSAyNE1Ieiwgd2l0aCAxJSB0b2xlcmFuY2UuDQoNCkNoZWVycywNCi0tUHJhYmhha2FyDQoN
Cj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgLyogZXh0ZXJuYWwgY2xvY2sgbXVzdCBi
ZSAyNE1IeiwgYWxsb3cgMSUgdG9sZXJhbmNlICovIEBADQo+ID4gLTExMDcsMTAgKzExMTUsMTIg
QEAgc3RhdGljIGludCBvdjU2NDVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4g
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gICAgICAgICB9DQo+ID4NCj4g
PiAtICAgICAgIHJldCA9IGNsa19zZXRfcmF0ZShvdjU2NDUtPnhjbGssIHhjbGtfZnJlcSk7DQo+
ID4gLSAgICAgICBpZiAocmV0KSB7DQo+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAi
Y291bGQgbm90IHNldCB4Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gLSAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7DQo+ID4gKyAgICAgICBpZiAoc2V0X2Nsaykgew0KPiA+ICsgICAgICAgICAgICAg
ICByZXQgPSBjbGtfc2V0X3JhdGUob3Y1NjQ1LT54Y2xrLCB4Y2xrX2ZyZXEpOw0KPiA+ICsgICAg
ICAgICAgICAgICBpZiAocmV0KSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJjb3VsZCBub3Qgc2V0IHhjbGsgZnJlcXVlbmN5XG4iKTsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgICAgICAgICAgICB9DQo+DQo+ID4g
ICAgICAgICB9DQo+ID4NCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBPVjU2NDVfTlVNX1NV
UFBMSUVTOyBpKyspDQo+ID4gLS0NCj4gPiAyLjcuNA0KPiA+DQo+ID4NCj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IGxpbnV4LWFybS1rZXJu
ZWwgbWFpbGluZyBsaXN0DQo+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
DQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
cm0ta2VybmVsDQo+DQo+DQo+DQo+IC0tDQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydA0KPg0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBt
NjhrLm9yZw0KPg0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
DQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVocmVyL1By
ZXNpZGVudDogQ2Fyc3RlbiBKYXVjaCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lzdGVyZWQg
b2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNzZWxkb3Jm
LCBHZXJtYW55LCBIYW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVlc3NlbGRv
cmYsIEhSQiAzNzA4IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAxMTkzNTM0
MDYgV0VFRS1SZWcuLU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
