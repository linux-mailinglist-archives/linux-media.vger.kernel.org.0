Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D0A2B1FC4
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 17:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgKMQMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 11:12:37 -0500
Received: from mail-vi1eur05on2053.outbound.protection.outlook.com ([40.107.21.53]:25248
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726973AbgKMQMg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 11:12:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWZT2Oxowrt8ufxf63ODnAl9PpmHwGx++XFkTLsk8ugl1cvOAjTwMni2/N5bgi0YACsJViZbJheTLCcLncY7fA/J1qa6iq/TGN2LbGaKT1wQgeCKbdx0xp5IY3naOG90mcewmMT60fu5LcjBBbgCChyl26kHUay8vzSmDnUznoIn6KFxet/UNfQwOZUJ6B8rumw6HCspbCt5tfnLG/MnO0gGpwbcA1XYY/t28+QR7VLlynOE3gsWxQ3jNpgAuYP/Bwljt3JOIXKgJRwPG8pf12CUUaeo7E0IT95+SvdQuzsytC95oKwatnGJxwYjZUkX0wALPC9AW+h8pBbIQbdbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1fOyL6A2vtBsqkgeCyevu89sZQSEob6NekZiNJ/QLA=;
 b=GB0NSmKRf0Yi+YyIl9V4rlt96OXsJ3qm/ROuHpTTUDJ+YSGJWfosMa1g83C8WmXWEAN1cAoi6zsCtEsQcRN3zxAPElqWZGS2foZ8ncYjC1VJloK1L3x4mpGIi9+CPx6vApiuDL/9yz6Vmw9Fzq1i4rLAlvorPrvELwaGvmNzsr3LJbb1IlzbGhUNmG7awIAKIX0qrNykw6Shd8XNQD7RvfHZL0Ts6mG1eI+56va3b1BXi8Y1Zz2GEevw8Hpd3mGevooepZYvOeg9sLZzK35c/YoyPlW78faMdDYj6giUP5hpiJv+e+aSl+dkaJeLcIDdVj5TgfwJIRan0c1u0yeryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1fOyL6A2vtBsqkgeCyevu89sZQSEob6NekZiNJ/QLA=;
 b=CZMYUT8fn49XeTyxxI7fmXRxxrUpgXKjo4IGdbYMWiB8oSzg0Dvg23wPsGmvHddFaSMTBYVL5eIqIbU1O3bPJ1Rd4oYTPkKPYPqzPl443EgAThIjnbxeXC9ZeQdCpRVLIKCL4WI/EdEK1a9IonCt2mpYTG70v/KNpDQTytCukMo=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5319.eurprd04.prod.outlook.com (2603:10a6:20b:c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 16:12:24 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 16:12:24 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v5 05/10] arm64: dts: imx8qxp: Add jpeg
 encoder/decoder nodes
Thread-Topic: [EXT] Re: [PATCH v5 05/10] arm64: dts: imx8qxp: Add jpeg
 encoder/decoder nodes
Thread-Index: AQHWuKDmORdotcqm906FipwjB7i98anELKGAgAIQ+AA=
Date:   Fri, 13 Nov 2020 16:12:24 +0000
Message-ID: <e343e674b87a0b5a0d5fc74adda2f3515f0be895.camel@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-6-mirela.rabulea@oss.nxp.com>
         <a4760dc55d8122798c42b62d16bfde01a855769f.camel@collabora.com>
In-Reply-To: <a4760dc55d8122798c42b62d16bfde01a855769f.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.124.171.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b57f1ef1-02db-44b3-5328-08d887eee8aa
x-ms-traffictypediagnostic: AM6PR04MB5319:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB53192EB402AE0448217FAEDBCEE60@AM6PR04MB5319.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dvCwHGS5gyAWh0g8s2mHbK2fORJdvwP00YKThlrq3hQwHnfDQ85FgenTBukaPnYl+hIVuklF2kgM+Vx0WvVL6JdrcCmhtJD9iPN5cWssi+YLBjzTCB9FF+6I+WYo5P/unruhKNTqAi0+jEG7d/yvVYKSRzoZpNW5WF1AOEL4cZS/u9JEF1Df2tL/oMNlQE4YiGCf4oh307/U3unCsKq2NuZo6NYppCfQAsfLS+dji6GclB/rY3C7HV7bLXjSdBGvRnJ6WgIPSbVsKQ85jQmJP483EDcjBawg3xr17ISDHfShf991a7Ls6vEzNtSGbd776B+Tz82GEQyhBcauNcF13k+TDeUzyak86QjoJ3bj1HCvZIh9pvfDVVzvec8D+ck5Y+484U0rntwQXFLYEgw6sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(26005)(4326008)(6486002)(8676002)(71200400001)(2616005)(2906002)(6512007)(316002)(86362001)(110136005)(478600001)(66446008)(83380400001)(6506007)(4001150100001)(7416002)(186003)(91956017)(66476007)(66556008)(64756008)(76116006)(5660300002)(8936002)(66946007)(54906003)(99106002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SPS3xiZmBeTdgDHuji18wQmPRWQ4yUIhcGTrYUm5Q/MlVj67Cr0AZGhFwi83tE291MCM9zlDsdTWHXGuUmWI4OXWtlY+dwwl+7u7CGG11iYMtyHle0UD+K5URJ79GurB22ugu9BjCKd508SHxNCxvqpl4E9XqLvB/y/5xNPMkzJxJGl9OMgv3UI2rbTCRUu5HPzMNSVQVOJnhVpCrvuyMiwQPkjMbYvLcTNJMPXHpT+gI1Q7Ul1XgRnL2HXzIVhbCNdglUeG6EHIPYICQl2sQ4TXw+vWHXLgHVfR9BZdkkwom9lYujYd6c+TDkVi9UQEa3ffwydtxmrW5SLa8wWTJFrz2lhvG2gB+EzXnW8ij/yV7SiZYcbzSZtP9Ek44Y6CvcO2mNrJijAOyBWYROAKaT7BEMgOStloe5gYAnCGPZQ/5pudLlPT2UGSXdtgomPlKGu5wW/1oWDRpbJdYsXWySchM09C8AMudMDBabM8Yb534oQJlj74uBT34krG/GfB1s4LSdutveBfqYpjqQKwMZ9DeK0ixNAb0PJ8jZKuwtdGnhiBiFxP6tDjPyvwrhd26IieyjUSLRTOtCFu+RwWsln127XBxK4Y8KGtOfUuUljnRNVoG6m0X8lN5SVQmZxSwUHQV1Qex8oJt3MvyG0nQFgp3QFOjGjrtgwrMCgVXCog5Z2aWFhaN43xti4sZIic4l5DCYhnNuLyLn1Z+76sxqhasJ4DeY4LA/LVslr+Ltss6kQCATxfADLWho2NyRVBtRQb3ABVTwAfXnCjR9zZwR/JbJPJfg4+i3U/689okGvzae3khdmOimY6SEmmVuodoXT+XXeKyurvOcicjI35iFaBmWAG8E3da2OfxC7+C89lDzXNJ4ZDSL2exrDHa1pm5q/FSirClGcsc+svuC1Oqw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4C24D0CE3A37141BBDB09B644B1E458@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f1ef1-02db-44b3-5328-08d887eee8aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 16:12:24.6518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 66zFQ0CmggMYLuWXWNYGI7urFs20ni9/5REx1rDbB5Pj4SmK+nGoMIt+6Dhur3PuHKlnPVkVb1at5mGFvZcJPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5319
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCk9uIFRodSwgMjAyMC0xMS0xMiBhdCAwNTozNiAtMDMwMCwgRXplcXVp
ZWwgR2FyY2lhIHdyb3RlOg0KPiANCj4gSGkgTWlyZWxhLA0KPiANCj4gT24gVGh1LCAyMDIwLTEx
LTEyIGF0IDA1OjA1ICswMjAwLCBNaXJlbGEgUmFidWxlYSAoT1NTKSB3cm90ZToNCj4gPiBGcm9t
OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiANCj4gPiBBZGQg
anBlZyBkZWNvZGVyL2VuY29kZXIgbm9kZXMsIGZvciBub3cgb24gaW14OHF4cCBvbmx5Lg0KPiA+
IFRoZSBzYW1lIHNob3VsZCB3b3JrIG9uIGlteDhxbSwgYnV0IGl0IHdhcyBub3QgdGVzdGVkLg0K
PiA+IA0KPiANCj4gRG9lcyBpbXg4cW0gbmVlZCBjaGFuZ2VzIGluIHRoZSBkdCBiaW5kaW5ncz8N
Cj4gDQo+IFVubGVzcyB5b3UgYXJlIGF3YXJlIG9mIHJlYXNvbnMgcHJldmVudGluZyB1cyBmcm9t
IGVuYWJsaW5nDQo+IGl0IG9uIGlteDhxbSwgdGhlbiB3ZSBjb3VsZCBnbyBmb3IgaW14OHFtIGFz
IHdlbGwgKHJldXNpbmcNCj4gaW14OHF4cC0gY29tcGF0aWJsZSkuDQoNCkkgdGhpbmsgaXQgd2ls
bCBiZSBwb3NzaWJsZSB0byByZXVzZSB0aGUgc2FtZSBjb21wYXRpbGUgZm9yIDhxbSwgdG9vLg0K
VGhlcmUgaXMgbm8gZHRzIGZvciA4cW0gdXBzdHJlYW0gZm9yIG5vdywgSSB1bmRlcnN0YW5kIEFp
c2hlbmcgaGFzDQpzb21ldGhpbmcgc3RhcnRlZCBvbiB0aGF0LiBXZSdsbCBzZWUgaG93IGl0IGdv
ZXMuDQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1
bGVhQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhxeHAtbWVrLmR0cyB8ICA4ICsrKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OHF4cC5kdHNpICAgIHwgMzcNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4g
IDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLW1lay5kdHMNCj4gPiBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtbWVrLmR0cw0KPiA+IGluZGV4IDQ2
NDM3ZDNjN2EwNC4uYTBhZDk3ODllOWI4IDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtbWVrLmR0cw0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtbWVrLmR0cw0KPiA+IEBAIC0yNzAsMyArMjcwLDExIEBA
DQo+ID4gICAgICAgICAgICAgICA+Ow0KPiA+ICAgICAgIH07DQo+ID4gIH07DQo+ID4gKw0KPiA+
ICsmanBlZ2RlYyB7DQo+ID4gKyAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9Ow0KPiA+ICsN
Cj4gPiArJmpwZWdlbmMgew0KPiA+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPiArfTsNCj4g
DQo+IFBsZWFzZSBkcm9wIHRoaXMuIFNlZSBiZWxvdy4NCg0KRG9uZSBmb3IgdGhlIG5leHQgdmVy
c2lvbi4NCg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
cXhwLmR0c2kNCj4gPiBpbmRleCBlNDZmYWFjMWZlNzEuLjFkOWExNjM4OGZhOCAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiBAQCAt
NjI5LDQgKzYyOSw0MSBAQA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPiA+ICAgICAg
ICAgICAgICAgfTsNCj4gPiAgICAgICB9Ow0KPiA+ICsNCj4gPiArICAgICBpbWdfc3Vic3lzOiBi
dXNANTgwMDAwMDAgew0KPiA+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVz
IjsNCj4gPiArICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAg
ICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgICAgICByYW5nZXMgPSA8MHg1
ODAwMDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICAg
ICAgIGpwZWdkZWM6IGpwZWdkZWNANTg0MDAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2RlYyI7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAwMDAgPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwOQ0KPiA+IElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMzEw
DQo+ID4gSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8R0lDX1NQSSAzMTENCj4gPiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMxMg0KPiA+IElSUV9U
WVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBwb3dlci1kb21haW5z
ID0gPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfTVA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzA+LA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
UzE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwZCBJTVhf
U0NfUl9NSlBFR19ERUNfUzI+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzM+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiANCj4gUHVyZSBtZW1vcnktdG8tbWVtb3J5IGFy
ZSB0eXBpY2FsbHkgbm90IGVuYWJsZWQgcGVyLWJvYXJkLA0KPiBidXQganVzdCBwZXItcGxhdGZv
cm0uDQo+IA0KPiBTbyB5b3UgY2FuIGRyb3AgdGhlIGRpc2FibGVkIHN0YXR1cyBoZXJlLg0KDQpE
b25lIGZvciB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3MsDQpNaXJlbGENCg0KPiANCj4gVGhh
bmtzLA0KPiBFemVxdWllbA0KPiANCj4gPiArICAgICAgICAgICAgIH07DQo+ID4gKw0KPiA+ICsg
ICAgICAgICAgICAganBlZ2VuYzoganBlZ2VuY0A1ODQ1MDAwMCB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLGlteDhxeHAtanBnZW5jIjsNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4NTg0NTAwMDAgMHgwMDA1MDAwMCA+Ow0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA1DQo+ID4gSVJRX1RZUEVf
TEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8R0lD
X1NQSSAzMDYNCj4gPiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMwNw0KPiA+IElSUV9UWVBFX0xFVkVMX0hJR0g+
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMzA4DQo+
ID4gSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBkIElNWF9TQ19SX01K
UEVHX0VOQ19TMT4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMz47DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICB9Ow0K
PiA+ICsgICAgIH07DQo+ID4gIH07DQo+IA0KPiANCg==
