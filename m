Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B560185130
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 22:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbgCMVbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 17:31:36 -0400
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:17739
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726526AbgCMVbg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 17:31:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4u0To51Tf19sD3IF9sCozzoj4WH6wYBb/UMTEUV7JC6HWMi2G0M+rSz9s5qkeiLcsgcfUuvTk5pHjCBRHu4rrVC/L1Zin7LxXbOY/frjxdKv5OfDQBcjojkDsKJzTnMVAVT13RqGR/SY7WLsLz+h3Mbs58s6/roHwo58z9hezP3DRwyCZpvor4ZU1v543FAteTno7SOLOojmJSild/8h07jfxPwtrJyVd71G5xAjB+nYGI+AGj1LG+dRcvBsvpaxfgS9zjKW/R7Hcx/iz4b44zSf/0wtgQPfCRdnXUgGyLiL0xa/YnDc1r1m7GbiSbxWccwdURCsQTP1ORmfwGvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV2QmqIooT0Wmx0w6qL2kYJsrRy8ZQ0IaXs+/XWX+ag=;
 b=MUqYjCC8NgG6XDJvyvlrZ8VJ7InBZAm8wDxOD7LnsTDIo6vkjYlblwjucfMWow72u40TDH1Ijd5nMTHi/KFxL+C6eP+hDA/rQ5Ggd0D1xopdxKBQWMokZjKXcx7nI0aDjVNEHcBoC/1EoQj4zn1WAcpQMeUSBTP93vVrCyWpvC92TDZyBktxMeqqVYAXNiyz9a1gLB3PYwZFMITgRgJQw9vhn5+Das+NECxy5RViFjw/YJo7FeymCjHUkewbgBWuc11IfQjagPkYWhWODd1FMEPF6yupciWIw7TAQgyNNz7meiTqG7rjWZwDjsu4tp7hY72xDTCHQf3goRI5+WNXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vV2QmqIooT0Wmx0w6qL2kYJsrRy8ZQ0IaXs+/XWX+ag=;
 b=seULNl1uWF7QQKqajHYadrGnujS2agfpWw9uKxz0LzILkZpWFoR6j9VLAkN9hYclBQpo8BpawPgTRyeBzmOk8CTIt63/9nxiYB/5H3n+MSkTwGAxGWC8AxdQk0f+Zm9zpyVjwbviGh/tRccY955eo5qvDD7pqqiqJN/RPUV9+0s=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB1781.jpnprd01.prod.outlook.com (52.134.226.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Fri, 13 Mar 2020 21:31:26 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 21:31:25 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
Thread-Topic: [PATCH v3 3/4] media: i2c: ov5645: Set maximum leverage of
 external clock frequency to 24480000
Thread-Index: AQHV+XwslyzFUyDDwkSkajiEN3hGNKhHCGKAgAAA6iA=
Date:   Fri, 13 Mar 2020 21:31:25 +0000
Message-ID: <OSBPR01MB359079EAA32E0DCBF63C6886AAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1584133954-6953-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584133954-6953-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200313212345.GM4751@pendragon.ideasonboard.com>
In-Reply-To: <20200313212345.GM4751@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6b91b17-44e5-4599-c62c-08d7c795e26b
x-ms-traffictypediagnostic: OSBPR01MB1781:
x-microsoft-antispam-prvs: <OSBPR01MB17816026777D095FADAD3F81AAFA0@OSBPR01MB1781.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(199004)(86362001)(8936002)(66476007)(52536014)(5660300002)(6506007)(81156014)(33656002)(186003)(66556008)(81166006)(8676002)(66446008)(26005)(64756008)(2906002)(66946007)(71200400001)(53546011)(76116006)(54906003)(7696005)(55016002)(6916009)(7416002)(9686003)(498600001)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB1781;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cjvx6wa6/fS6/vfLZMlPnyGjoX2lw39AfflI1rllFdcFIwd677bPplM4ZpxyAK1Bm/pJ0tFk6HKT4KE+kp65pLrfYYmTOtVn1rY/sToo+XERJtSqUK2MFBFyd9WA8mvt1tW/wL7SaHzrbw1x1LufiBMP9zqh5OXLiWag9Ayfb70/yD+guaVONlyl2WtWLgsbozG61M+ucB3kFqem+UJgFAk8G6X0d2bC6w+evupSMd9ajzG9aZxDvcV/HPpZ9TkfpaanXeCBAgsGG5HgddDx9NU8WSuqcbmJrWsCn2Sw1usLC60tCyZBGFkQCZAXP7kcU10hcMrniUljWIDTt6P5mW6ANa6JFnTpLzoyNNSL/wwAcQmxZJwIcTizojTo23iF9cCyPHw8dKKIXlutsP+qC5NjTLSItyJCgLBDo7up4yFoz2Vpm+KLY3pnl8Rh7Ajy
x-ms-exchange-antispam-messagedata: LJBHEOY9wgBNwCnQXU2qF0ZDcYwfbC//p3p+V6uI1kZm+oiODFzzst0ZYCYLY4HzfpV35yMJLv0qW02FCk26tPF55IfgKZwOR1+xPXS8CwfEcv5LHa4e7RE5VP0TE7wfSydFxQmUhgtakasqbOkCzQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b91b17-44e5-4599-c62c-08d7c795e26b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 21:31:25.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McSjNVSAdl4MyvggEmhPPAmGRp8hKv/rCQzvKFU0QcSgaZY2p5CgfL3oKa/Cwr23Ad/Uq0wB2g/4OQRgtXaX8N8AHPMYvm7Nqy5gCo0Vz0xs7zbaqv7P2CLUhKoMgSSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1781
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMTMgTWFyY2ggMjAyMCAyMToyNA0KPiBUbzog
UHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47
IFNoYXduIEd1bw0KPiA8c2hhd25ndW9Aa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlciA8cy5oYXVl
ckBwZW5ndXRyb25peC5kZT47DQo+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVu
Z3V0cm9uaXguZGU+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWFyayBS
dXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFNha2FyaQ0KPiBBaWx1cyA8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT47IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT47
DQo+IE1hZ251cyBEYW1tIDxtYWdudXMuZGFtbUBnbWFpbC5jb20+OyBFemVxdWllbCBHYXJjaWEN
Cj4gPGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJlbmVzYXMtDQo+IHNvY0B2Z2VyLmtlcm5lbC5vcmc7
IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IGxpbnV4LQ0KPiBtZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzIDMvNF0gbWVkaWE6IGkyYzogb3Y1NjQ1OiBTZXQgbWF4aW11bSBs
ZXZlcmFnZSBvZg0KPiBleHRlcm5hbCBjbG9jayBmcmVxdWVuY3kgdG8gMjQ0ODAwMDANCj4NCj4g
SGkgUHJhYmhha2FyLA0KPg0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4NCj4gT24gRnJp
LCBNYXIgMTMsIDIwMjAgYXQgMDk6MTI6MzNQTSArMDAwMCwgTGFkIFByYWJoYWthciB3cm90ZToN
Cj4gPiBXaGlsZSB0ZXN0aW5nIG9uIFJlbmVzYXMgUlovRzJFIHBsYXRmb3JtLCBub3RpY2VkIHRo
ZSBjbG9jayBmcmVxdWVuY3kNCj4gPiB0byBiZSAyNDI0MjQyNCBhcyBhIHJlc3VsdCB0aGUgcHJv
YmUgZmFpbGVkLiBIb3dldmVyIGluY3JlYXNpbmcgdGhlDQo+ID4gbWF4aW11bSBsZXZlcmFnZSBv
ZiBleHRlcm5hbCBjbG9jayBmcmVxdWVuY3kgdG8gMjQ0ODAwMDAgZml4ZXMgdGhpcw0KPiA+IGlz
c3VlLiBTaW5jZSB0aGlzIGRpZmZlcmVuY2UgaXMgc21hbGwgZW5vdWdoIGFuZCBpcyBpbnNpZ25p
ZmljYW50IHNldA0KPiA+IHRoZSBzYW1lIGluIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi0NCj4gbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjU2NDUuYyB8IDYg
KysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQ1LmMgYi9k
cml2ZXJzL21lZGlhL2kyYy9vdjU2NDUuYw0KPiA+IGluZGV4IDRmYmFiZjMuLmI0OTM1OWIgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQ1LmMNCj4gPiArKysgYi9kcml2
ZXJzL21lZGlhL2kyYy9vdjU2NDUuYw0KPiA+IEBAIC0xMTA3LDggKzExMDcsMTAgQEAgc3RhdGlj
IGludCBvdjU2NDVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiAgfQ0KPiA+
DQo+ID4gIHhjbGtfZnJlcSA9IGNsa19nZXRfcmF0ZShvdjU2NDUtPnhjbGspOw0KPiA+IC0vKiBl
eHRlcm5hbCBjbG9jayBtdXN0IGJlIDI0TUh6LCBhbGxvdyAxJSB0b2xlcmFuY2UgKi8NCj4gPiAt
aWYgKHhjbGtfZnJlcSA8IDIzNzYwMDAwIHx8IHhjbGtfZnJlcSA+IDI0MjQwMDAwKSB7DQo+ID4g
Ky8qIGV4dGVybmFsIGNsb2NrIG11c3QgYmUgMjRNSHosIGFsbG93IGEgbWluaW11bSAxJSBhbmQg
YQ0KPiBtYXhpbXVtIG9mIDIlDQo+ID4gKyAqIHRvbGVyYW5jZQ0KPg0KPiBTbyB3aGVyZSBkbyB0
aGVzZSBudW1iZXJzIGNvbWUgZnJvbSA/IEkgdW5kZXJzdGFuZCB0aGF0IDIlIGlzIHdoYXQgeW91
DQo+IG5lZWQgdG8gbWFrZSB5b3VyIGNsb2NrIGZpdCBpbiB0aGUgcmFuZ2UsIGJ1dCB3aHkgLTEl
LysyJSBpbnN0ZWFkIG9mIC0NCj4gMiUvKzIlID8gQW5kIHdoeSBub3QgMi41IG9yIDMlID8gVGhl
IHNlbnNvciBkYXRhc2hlZXQgZG9jdW1lbnRzIHRoZQ0KPiByYW5nZSBvZiBzdXBwb3J0ZWQgeHZj
bGsgZnJlcXVlbmNpZXMgdG8gYmUgNk1IeiB0byA1NE1Iei4gSSB1bmRlcnN0YW5kDQo+IHRoYXQg
UExMIHBhcmFtZXRlcnMgZGVwZW5kIG9uIHRoZSBjbG9jayBmcmVxdWVuY3ksIGJ1dCBjb3VsZCB0
aGV5IGJlDQo+IGNhbGN1bGF0ZWQgaW5zdGVhZCBvZiBoYXJkY29kZWQsIHRvIGF2b2lkIHJlcXVp
cmluZyBhbiBleGFjdCAyNE1IeiBpbnB1dA0KPiBmcmVxdWVuY3kgPw0KPg0KVG8gYmUgaG9uZXN0
IEkgZG9uJ3QgaGF2ZSB0aGUgZGF0YXNoZWV0IGZvciBvdjU2NDUsIHRoZSBmbHllciBzYXlzIDYt
NTRNaHogYnV0IHRoZQ0KbG9ncy9jb21tZW50IHNheXMgMjRNaHouDQoNCkNoZWVycywNCi0tUHJh
Ymhha2FyDQoNCj4gPiArICovDQo+ID4gK2lmICh4Y2xrX2ZyZXEgPCAyMzc2MDAwMCB8fCB4Y2xr
X2ZyZXEgPiAyNDQ4MDAwMCkgew0KPiA+ICBkZXZfZXJyKGRldiwgImV4dGVybmFsIGNsb2NrIGZy
ZXF1ZW5jeSAldSBpcyBub3QNCj4gc3VwcG9ydGVkXG4iLA0KPiA+ICB4Y2xrX2ZyZXEpOw0KPiA+
ICByZXR1cm4gLUVJTlZBTDsNCj4NCj4gLS0NCj4gUmVnYXJkcywNCj4NCj4gTGF1cmVudCBQaW5j
aGFydA0KDQoNClJlbmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEdtYkgsIEdlc2NoYWVmdHNmdWVo
cmVyL1ByZXNpZGVudDogQ2Fyc3RlbiBKYXVjaCwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0L1JlZ2lz
dGVyZWQgb2ZmaWNlOiBEdWVzc2VsZG9yZiwgQXJjYWRpYXN0cmFzc2UgMTAsIDQwNDcyIER1ZXNz
ZWxkb3JmLCBHZXJtYW55LCBIYW5kZWxzcmVnaXN0ZXIvQ29tbWVyY2lhbCBSZWdpc3RlcjogRHVl
c3NlbGRvcmYsIEhSQiAzNzA4IFVTdC1JRE5yLi9UYXggaWRlbnRpZmljYXRpb24gbm8uOiBERSAx
MTkzNTM0MDYgV0VFRS1SZWcuLU5yLi9XRUVFIHJlZy4gbm8uOiBERSAxNDk3ODY0Nw0K
