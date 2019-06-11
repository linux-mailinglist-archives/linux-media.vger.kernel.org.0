Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48853C70B
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404156AbfFKJJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:09:51 -0400
Received: from mail-eopbgr30052.outbound.protection.outlook.com ([40.107.3.52]:26046
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728846AbfFKJJv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+JXTWW0NJ4f4LMEyqtop8LQDP6jn+qtN6jseNlpFUs=;
 b=C26KU+sx4Ppq9ZSfOnaYsmBjH2yFC2xlYKhe3CYrjQ5EpdCzoMpSMlWsQ9VtmYnOiqqfgz5StN7qxAatAQ9BmAQCeAy7kwoFujPrc8C33HlobvOEL1YPks5MhX5JrwCjR4R/RlEEmd4XC9J22uBuelIiCwCKCgNJwgBLebvzCN0=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6702.eurprd04.prod.outlook.com (20.179.235.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 09:09:47 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7%7]) with mapi id 15.20.1943.026; Tue, 11 Jun 2019
 09:09:47 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
CC:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: RE: [v8] media: imx: add mem2mem device
Thread-Topic: [v8] media: imx: add mem2mem device
Thread-Index: AQHVFzWVi6WPXAEL2EqP2Yi5fqgD66aEYCyggAFpcACABWnKkIAAnBwAgAELFlCAAEKWAIAA0KFAgAC9AACABf084IAAcPIAgAEalRA=
Date:   Tue, 11 Jun 2019 09:09:46 +0000
Message-ID: <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com>
 <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
 <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiW9vqHXVt771P7tQvHwJ1ifr2qbtmxnVm7Ff6vY=DjKwg@mail.gmail.com>
 <VE1PR04MB663800AFCE7FF016DBE9EB7689160@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWJ3u0NpP8Tji0oOJ4-9MFm1Ac1mzur_gL9+e8Jsj4EdA@mail.gmail.com>
 <VE1PR04MB66382A33B135E7A724D13C2F89170@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWiQ1XRWSsgE5DbMZTiy9HkSvhvWNn3cPPw9p6HZZaBEw@mail.gmail.com>
 <VE1PR04MB6638ECD904CC0F9A6F95302F89130@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiWa8o4hEFTZauTtb0mWnzusVcYakvMn84eg_Q=CugKUKg@mail.gmail.com>
In-Reply-To: <CAGngYiWa8o4hEFTZauTtb0mWnzusVcYakvMn84eg_Q=CugKUKg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35bdd2bc-c7d3-4cb6-930d-08d6ee4c8d0b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6702;
x-ms-traffictypediagnostic: VE1PR04MB6702:
x-microsoft-antispam-prvs: <VE1PR04MB6702B9B3AE7AB05ABC23707589ED0@VE1PR04MB6702.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(396003)(39860400002)(136003)(376002)(366004)(13464003)(199004)(189003)(14444005)(74316002)(55016002)(256004)(26005)(52536014)(186003)(5660300002)(4326008)(3846002)(6116002)(9686003)(86362001)(71190400001)(71200400001)(33656002)(6436002)(229853002)(6916009)(25786009)(1411001)(478600001)(7736002)(64756008)(8676002)(68736007)(8936002)(53936002)(81156014)(66946007)(6506007)(7696005)(66446008)(446003)(81166006)(66476007)(53546011)(66556008)(66066001)(316002)(11346002)(102836004)(2906002)(99286004)(14454004)(76116006)(54906003)(486006)(476003)(73956011)(6246003)(76176011)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6702;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UYq7o6/HNCPQdBqHTzGjo2NIqInsWzlJLXWbJDSaHJKqhsPWgylTg3DWessxSU6PLCqncd6FRuK6fTA6TnCc9Abv+RUGEo7QZS+VZTBYlhCvgpDSfKn+hLValQug7bKbx8kcg5KDvDDDz4SDAsOgX2im/K/aFAR5gKSgRyDAktLQI45XtGbrjDA1ivIy0kGWt2DlN6C+15Hkt1PvQhnAgmc7rtJ84n3e0OLXvbJbx7Xi7PLWJOlE2G6UBSpej3cc5hXn08fdqN7V8Ao2tgD4xOuobzYnOlnTjcMxVgl4rvXnGVeNt6rJEAiuJfDiTMO9ZCl0gVfR5K8QiosOUqxRncEzGRWW4XnMUTPo2+LgWhFFa9KotnEOUdOTSxVQb7z1Z0J0aD935Ut3WbmfPkF6Utg8+9yKKD9mYY/jTLWbTDw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35bdd2bc-c7d3-4cb6-930d-08d6ee4c8d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 09:09:46.9725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yibin.gong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6702
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdmVuIFZhbiBBc2Jyb2VjayA8
dGhlc3ZlbjczQGdtYWlsLmNvbT4NCj4gU2VudDogMjAxOeW5tDbmnIgxMOaXpSAyMzo0Nw0KPiBU
bzogUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW3Y4XSBt
ZWRpYTogaW14OiBhZGQgbWVtMm1lbSBkZXZpY2UNCj4gT24gTW9uLCBKdW4gMTAsIDIwMTkgYXQg
NTowOSBBTSBSb2JpbiBHb25nIDx5aWJpbi5nb25nQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
SSBjYW4gcmVwcm9kdWNlIG9uY2UgZW5hYmxlIHlvdXIgY29uZmlnIHRvIGJ1aWxkIGZpcm13YXJl
IGluIGtlcm5lbCwNCj4gPiBidXQgbm8gc3VjaCBpc3N1ZSBpZiBsb2FkIHNkbWEgZmlybXdhcmUg
ZnJvbSByb290ZnMgYXMNCj4gPiBpbXhfdjZfdjdfZGVmY29uZmlnLiBNYXliZSBmaXJtd2FyZSBi
dWlsdCBpbiBmdW5jdGlvbiBicm9rZW4gYnkgc29tZQ0KPiA+IHBhdGNoZXMuIENvdWxkIHlvdSB0
cnkgd2l0aCB0aGUgZGVmYXVsdCBmaXJtd2FyZSBsb2FkaW5nIHdheSB3aGljaCBpcyBmcm9tDQo+
IHJvb3RmcygvbGliL2Zpcm13YXJlL2lteC9zZG1hL3NkbWEtaW14NnEuYmluKT8NCj4gDQo+IFRo
aXMgaXMgaXQgISBJZiBJIGFkZCB0aGUgZmlybXdhcmUgdG8gdGhlIGtlcm5lbCBkaXJlY3RseSwg
SSBzZWUgdGhlIGNyYXNoLg0KPiBCdXQgaWYgSSB1c2UgdGhlIGZpcm13YXJlIGZhbGwtYmFjayBt
ZWNoYW5pc20sIHRoZXJlIGlzIG5vIGNyYXNoLg0KPiBBbmQgaWYgSSBidWlsZCBpbXgtc2RtYSBh
cyBhIG1vZHVsZSwgYW5kIGluc21vZCBpdCBsYXRlciwgdGhlcmUgaXMgYWxzbyBubyBjcmFzaC4N
Cj4gDQo+IEkgcGF0Y2hlZCBpbXgtc2RtYSBzbyBpdCBsb2dzIHRoZSBhZGxlcjMyIGNoZWNrc3Vt
IG9mIHRoZSBmaXJtd2FyZSBpdCdzDQo+IGxvYWRpbmcgKEkgdHJpZWQgdXNpbmcgdGhlIGtlcm5l
bCBjcnlwdG8gQVBJLCBidXQgaXQgZG9lc24ndCB3b3JrIHRoaXMgZWFybHkgaW4gdGhlDQo+IGJv
b3QpLiBJIG5vdGljZSB0aGF0IHRoZSBmaXJtd2FyZSBpcyBhbHdheXMgdGhlIHNhbWUsIGNyYXNo
IG9yIG5vDQo+IGNyYXNoOg0KPiANCj4gZmlybXdhcmUgaW4ta2VybmVsIChjcmFzaCk6DQo+IFsg
ICAgMS4zNzA0MjRdIGlteC1zZG1hIDIwZWMwMDAuc2RtYTogZmlybXdhcmUgaGFzaDogNjlCQzBG
MDkNCj4gZmlybXdhcmUgZmFsbGJhY2sgKG5vIGNyYXNoKToNCj4gWyAgICA2LjQ2NjM5NF0gaW14
LXNkbWEgMjBlYzAwMC5zZG1hOiBmaXJtd2FyZSBoYXNoOiA2OUJDMEYwOQ0KPiANCj4gTXkgZ3Vl
c3M6IHRoaXMgY291bGQgYmUgYSB0aW1pbmcgaXNzdWUuIElmIHRoZSBzZG1hIGRyaXZlciBsb2Fk
cyAndG9vIGVhcmx5JywgdGhlDQo+IGJvb3QgY3Jhc2ggd2lsbCBoYXBwZW4uIE1heWJlIHRoZSBk
cml2ZXIgbmVlZHMgdG8gY2hlY2sgZm9yIGEgbWlzc2luZw0KPiBkZXBlbmRlbmN5IG9uIGJvb3Qs
IGFuZCAtRVBST0JFX0RFRkVSID8NCj4gDQo+IFJvYmluLCBzaG91bGQgSSBtYWtlIGEgYnVnIHJl
cG9ydD8gSWYgc28sIHdobyBkbyBJIHNlbmQgdGhpcyB0bz8NCj4gDQpTdmVuLCBubyBhbnkgZGVw
ZW5kZW5jeSBmcm9tIHNkbWEgZHJpdmVyIHZpZXcuIFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2Vl
biBkaXJlY3RseSBsb2FkaW5nIGZpcm13YXJlDQpmcm9tIGtlcm5lbCBhbmQgcm9vdGZzIGlzIHRo
ZSBmb3JtZXIgc3BlbmQgbW9yZSB0aW1lIGR1cmluZyBrZXJuZWwgYm9vdCBhbmQgc3VjaCB0aW1p
bmcgbWF5IGNhdXNlDQp0aGUgY3Jhc2guIFRoZSBpc3N1ZSBpcyBub3QgMTAwJSBpbiBteSBzaWRl
LCBhYm91dCAyMCUgcG9zc2liaWxpdHksIHdoaWNoIGxvb2tzIGxpa2UgJ3RpbWluZyBpc3N1ZScg
LiBBbm90aGVyDQppbnRlcmVzdGluZyB0aGluZyBpcyB0aGF0IGV2ZXJ5IHRpbWUgdGhlIGNyYXNo
IHN0b3AgYXQgc29tZXdoZXJlIGRybSwgYW5kIEFmdGVyIEkgZGlzYWJsZSBpcHUgYW5kIGRpc3Bs
YXkNCndoaWNoIHVzZSBkcm0gaW4gaS5teDZxLmR0c2ksIHRoZSBpc3N1ZSBpcyBnb25lIG9uIG15
IGkubXg2cS1zYWJyZWF1dG8gYm9hcmQuDQpDb3VsZCB5b3UgaGF2ZSBhIHRyeSB3aXRoIGJlbG93
IHBhdGNoIGFzIG1pbmU/IElmIHRoZSBpc3N1ZSBpcyBnb25lIG9uIHlvdXIgc2lkZSwgd2UgY291
bGQgaW52b2x2ZSBkcm0gZ3V5cyB0bw0KbG9vayBpbnRvIGl0Lg0KDQpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvaW14NnEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxLmR0c2kN
CmluZGV4IDcxNzU4OTguLjViMjFiM2YgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9p
bXg2cS5kdHNpDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cS5kdHNpDQpAQCAtMjE3LDYg
KzIxNyw3IEBADQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa3MgSU1YNlFE
TF9DTEtfSVBVMl9ESTE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAi
YnVzIiwgImRpMCIsICJkaTEiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZz
cmMgND47DQorICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KDQog
ICAgICAgICAgICAgICAgICAgICAgICBpcHUyX2NzaTA6IHBvcnRAMCB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsNCkBAIC0zMDAsNiArMzAxLDcgQEANCiAgICAg
ICAgZGlzcGxheS1zdWJzeXN0ZW0gew0KICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNs
LGlteC1kaXNwbGF5LXN1YnN5c3RlbSI7DQogICAgICAgICAgICAgICAgcG9ydHMgPSA8JmlwdTFf
ZGkwPiwgPCZpcHUxX2RpMT4sIDwmaXB1Ml9kaTA+LCA8JmlwdTJfZGkxPjsNCisgICAgICAgICAg
ICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KICAgICAgICB9Ow0KIH07DQoNCg==
