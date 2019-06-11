Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E868E3C717
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 11:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404282AbfFKJRY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 05:17:24 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:37761
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727642AbfFKJRX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 05:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz9pCRQ01idFb4/Nc+VtP2CnDNNFD9ZOixsPYCn5ADM=;
 b=PDe9q2NAKdXdurzu+w08rkhx7J5Ss0O+8BWjsoIacDRE/2euXFTjPZ0128xYQyzgSdWtn0W/8Z4k0rHutL3dVAPRPizw7Dze4KlkD9bX229M6xtFvlSsKCJgHVOG/NOa4K89L1tnxkFpWpwEcQp1AsE6/VTuh3S5xnJhczPYlhs=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6447.eurprd04.prod.outlook.com (20.179.232.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Tue, 11 Jun 2019 09:17:19 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7%7]) with mapi id 15.20.1943.026; Tue, 11 Jun 2019
 09:17:19 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
CC:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: RE: [v8] media: imx: add mem2mem device
Thread-Topic: [v8] media: imx: add mem2mem device
Thread-Index: AQHVFzWVi6WPXAEL2EqP2Yi5fqgD66aEYCyggAFpcACABWnKkIAAnBwAgAELFlCAAEKWAIAA0KFAgAC9AACABf084IAAcPIAgAEalRCAAAq3UA==
Date:   Tue, 11 Jun 2019 09:17:19 +0000
Message-ID: <VE1PR04MB6638EE24DC7A9297F40B1CDD89ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
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
 <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6638B3BA8B924C327D0368E089ED0@VE1PR04MB6638.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecc176b6-9121-4d19-fd67-08d6ee4d9acf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6447;
x-ms-traffictypediagnostic: VE1PR04MB6447:
x-microsoft-antispam-prvs: <VE1PR04MB644751735BFD6467FFA2D52689ED0@VE1PR04MB6447.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(13464003)(102836004)(33656002)(74316002)(6246003)(6506007)(5660300002)(6116002)(86362001)(53546011)(7696005)(2906002)(14454004)(76176011)(3846002)(99286004)(305945005)(26005)(66446008)(478600001)(11346002)(446003)(81166006)(1411001)(81156014)(8936002)(486006)(476003)(66946007)(8676002)(66556008)(73956011)(186003)(66476007)(64756008)(76116006)(25786009)(52536014)(53936002)(7736002)(6916009)(54906003)(14444005)(66066001)(256004)(6436002)(9686003)(2940100002)(71200400001)(229853002)(4326008)(71190400001)(55016002)(316002)(68736007);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6447;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jSGv85+g7oAxMQEfwIo1Cu4rzroVKxJYZ/tBMNWJG28yDKFFui9SU/6i9+wf43qRXe8Tkqw2mQ9Pjn5hvJ25kniALjVzwPPE7W4mJ/WbXpd7GobejrSH8SqUkDzM2i5voQjEV8KE1nul62ZjJzC9J/Ly2bz8sXF2luxj4dDuom3Kz/W7I3L1zzhFw1rjQxTMNi3PwMhxBQauoq+m1d2jM34kcdJXJGiWnS5piTGbIooBrcidnUuWfetCDckIicErZWYVmC6NhSwxdhVeHZbFxQLTYp3Gql+u+FsphIV1JYnjiFLX9ZNcefpnNGjKH4WusBhzVc+t6MLU/cMBzhxCnd+/pvIBxUhWoMzBN/2tppLpCAWAQPTc0IYtBXnSmznMfhp7U5p3+vo76x29+Q1G5bsJ0C5eqAXZkP7X3coYrPU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc176b6-9121-4d19-fd67-08d6ee4d9acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 09:17:19.5289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yibin.gong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6447
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U29ycnksIGZvcmdvdCBkaXNhYmxlIGlwdTE6DQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9pbXg2cWRsLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRsLmR0c2kNCmluZGV4
IGIzNTJlYTIuLmI4ODQ0OTAgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cWRs
LmR0c2kNCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZxZGwuZHRzaQ0KQEAgLTEyOTEsNyAr
MTI5MSw3IEBADQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa3MgSU1YNlFE
TF9DTEtfSVBVMV9ESTE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAi
YnVzIiwgImRpMCIsICJkaTEiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZz
cmMgMj47DQotDQorICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgaXB1MV9jc2kwOiBwb3J0QDAgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MD47DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBSb2JpbiBHb25nDQo+IFNlbnQ6IDIwMTnlubQ25pyIMTHml6UgMTc6
MTANCj4gVG86ICdTdmVuIFZhbiBBc2Jyb2VjaycgPHRoZXN2ZW43M0BnbWFpbC5jb20+DQo+IENj
OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+OyBsaW51eC1tZWRpYQ0KPiA8bGlu
dXgtbWVkaWFAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSRTogW3Y4XSBtZWRpYTogaW14
OiBhZGQgbWVtMm1lbSBkZXZpY2UNCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiBGcm9tOiBTdmVuIFZhbiBBc2Jyb2VjayA8dGhlc3ZlbjczQGdtYWlsLmNvbT4NCj4gPiBT
ZW50OiAyMDE55bm0NuaciDEw5pelIDIzOjQ3DQo+ID4gVG86IFJvYmluIEdvbmcgPHlpYmluLmdv
bmdAbnhwLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW3Y4XSBtZWRpYTogaW14OiBhZGQgbWVtMm1l
bSBkZXZpY2UgT24gTW9uLCBKdW4gMTAsIDIwMTkNCj4gPiBhdCA1OjA5IEFNIFJvYmluIEdvbmcg
PHlpYmluLmdvbmdAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gSSBjYW4gcmVwcm9kdWNl
IG9uY2UgZW5hYmxlIHlvdXIgY29uZmlnIHRvIGJ1aWxkIGZpcm13YXJlIGluIGtlcm5lbCwNCj4g
PiA+IGJ1dCBubyBzdWNoIGlzc3VlIGlmIGxvYWQgc2RtYSBmaXJtd2FyZSBmcm9tIHJvb3RmcyBh
cw0KPiA+ID4gaW14X3Y2X3Y3X2RlZmNvbmZpZy4gTWF5YmUgZmlybXdhcmUgYnVpbHQgaW4gZnVu
Y3Rpb24gYnJva2VuIGJ5IHNvbWUNCj4gPiA+IHBhdGNoZXMuIENvdWxkIHlvdSB0cnkgd2l0aCB0
aGUgZGVmYXVsdCBmaXJtd2FyZSBsb2FkaW5nIHdheSB3aGljaA0KPiA+ID4gaXMgZnJvbQ0KPiA+
IHJvb3RmcygvbGliL2Zpcm13YXJlL2lteC9zZG1hL3NkbWEtaW14NnEuYmluKT8NCj4gPg0KPiA+
IFRoaXMgaXMgaXQgISBJZiBJIGFkZCB0aGUgZmlybXdhcmUgdG8gdGhlIGtlcm5lbCBkaXJlY3Rs
eSwgSSBzZWUgdGhlIGNyYXNoLg0KPiA+IEJ1dCBpZiBJIHVzZSB0aGUgZmlybXdhcmUgZmFsbC1i
YWNrIG1lY2hhbmlzbSwgdGhlcmUgaXMgbm8gY3Jhc2guDQo+ID4gQW5kIGlmIEkgYnVpbGQgaW14
LXNkbWEgYXMgYSBtb2R1bGUsIGFuZCBpbnNtb2QgaXQgbGF0ZXIsIHRoZXJlIGlzIGFsc28gbm8N
Cj4gY3Jhc2guDQo+ID4NCj4gPiBJIHBhdGNoZWQgaW14LXNkbWEgc28gaXQgbG9ncyB0aGUgYWRs
ZXIzMiBjaGVja3N1bSBvZiB0aGUgZmlybXdhcmUNCj4gPiBpdCdzIGxvYWRpbmcgKEkgdHJpZWQg
dXNpbmcgdGhlIGtlcm5lbCBjcnlwdG8gQVBJLCBidXQgaXQgZG9lc24ndCB3b3JrDQo+ID4gdGhp
cyBlYXJseSBpbiB0aGUgYm9vdCkuIEkgbm90aWNlIHRoYXQgdGhlIGZpcm13YXJlIGlzIGFsd2F5
cyB0aGUNCj4gPiBzYW1lLCBjcmFzaCBvciBubw0KPiA+IGNyYXNoOg0KPiA+DQo+ID4gZmlybXdh
cmUgaW4ta2VybmVsIChjcmFzaCk6DQo+ID4gWyAgICAxLjM3MDQyNF0gaW14LXNkbWEgMjBlYzAw
MC5zZG1hOiBmaXJtd2FyZSBoYXNoOiA2OUJDMEYwOQ0KPiA+IGZpcm13YXJlIGZhbGxiYWNrIChu
byBjcmFzaCk6DQo+ID4gWyAgICA2LjQ2NjM5NF0gaW14LXNkbWEgMjBlYzAwMC5zZG1hOiBmaXJt
d2FyZSBoYXNoOiA2OUJDMEYwOQ0KPiA+DQo+ID4gTXkgZ3Vlc3M6IHRoaXMgY291bGQgYmUgYSB0
aW1pbmcgaXNzdWUuIElmIHRoZSBzZG1hIGRyaXZlciBsb2FkcyAndG9vDQo+ID4gZWFybHknLCB0
aGUgYm9vdCBjcmFzaCB3aWxsIGhhcHBlbi4gTWF5YmUgdGhlIGRyaXZlciBuZWVkcyB0byBjaGVj
aw0KPiA+IGZvciBhIG1pc3NpbmcgZGVwZW5kZW5jeSBvbiBib290LCBhbmQgLUVQUk9CRV9ERUZF
UiA/DQo+ID4NCj4gPiBSb2Jpbiwgc2hvdWxkIEkgbWFrZSBhIGJ1ZyByZXBvcnQ/IElmIHNvLCB3
aG8gZG8gSSBzZW5kIHRoaXMgdG8/DQo+ID4NCj4gU3Zlbiwgbm8gYW55IGRlcGVuZGVuY3kgZnJv
bSBzZG1hIGRyaXZlciB2aWV3LiBUaGUgb25seSBkaWZmZXJlbmNlIGJldHdlZW4NCj4gZGlyZWN0
bHkgbG9hZGluZyBmaXJtd2FyZSBmcm9tIGtlcm5lbCBhbmQgcm9vdGZzIGlzIHRoZSBmb3JtZXIg
c3BlbmQgbW9yZSB0aW1lDQo+IGR1cmluZyBrZXJuZWwgYm9vdCBhbmQgc3VjaCB0aW1pbmcgbWF5
IGNhdXNlIHRoZSBjcmFzaC4gVGhlIGlzc3VlIGlzIG5vdCAxMDAlDQo+IGluIG15IHNpZGUsIGFi
b3V0IDIwJSBwb3NzaWJpbGl0eSwgd2hpY2ggbG9va3MgbGlrZSAndGltaW5nIGlzc3VlJyAuIEFu
b3RoZXINCj4gaW50ZXJlc3RpbmcgdGhpbmcgaXMgdGhhdCBldmVyeSB0aW1lIHRoZSBjcmFzaCBz
dG9wIGF0IHNvbWV3aGVyZSBkcm0sIGFuZCBBZnRlcg0KPiBJIGRpc2FibGUgaXB1IGFuZCBkaXNw
bGF5IHdoaWNoIHVzZSBkcm0gaW4gaS5teDZxLmR0c2ksIHRoZSBpc3N1ZSBpcyBnb25lIG9uIG15
DQo+IGkubXg2cS1zYWJyZWF1dG8gYm9hcmQuDQo+IENvdWxkIHlvdSBoYXZlIGEgdHJ5IHdpdGgg
YmVsb3cgcGF0Y2ggYXMgbWluZT8gSWYgdGhlIGlzc3VlIGlzIGdvbmUgb24geW91cg0KPiBzaWRl
LCB3ZSBjb3VsZCBpbnZvbHZlIGRybSBndXlzIHRvIGxvb2sgaW50byBpdC4NCj4gDQo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9pbXg2cS5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
aW14NnEuZHRzaQ0KPiBpbmRleCA3MTc1ODk4Li41YjIxYjNmIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9pbXg2cS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL2lteDZx
LmR0c2kNCj4gQEAgLTIxNyw2ICsyMTcsNyBAQA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JmNsa3MgSU1YNlFETF9DTEtfSVBVMl9ESTE+Ow0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjbG9jay1uYW1lcyA9ICJidXMiLCAiZGkwIiwgImRpMSI7DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlc2V0cyA9IDwmc3JjIDQ+Ow0KPiArICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgaXB1
Ml9jc2kwOiBwb3J0QDAgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwwPjsgQEAgLTMwMCw2ICszMDEsNyBAQA0KPiAgICAgICAgIGRpc3BsYXktc3Vic3lzdGVtIHsN
Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGlteC1kaXNwbGF5LXN1YnN5c3Rl
bSI7DQo+ICAgICAgICAgICAgICAgICBwb3J0cyA9IDwmaXB1MV9kaTA+LCA8JmlwdTFfZGkxPiwg
PCZpcHUyX2RpMD4sDQo+IDwmaXB1Ml9kaTE+Ow0KPiArICAgICAgICAgICAgICAgc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gICAgICAgICB9Ow0KPiAgfTsNCg0K
