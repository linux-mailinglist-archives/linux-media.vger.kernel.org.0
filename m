Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDB203422F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jun 2019 10:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfFDIwS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jun 2019 04:52:18 -0400
Received: from mail-eopbgr50067.outbound.protection.outlook.com ([40.107.5.67]:16635
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726637AbfFDIwR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 Jun 2019 04:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFVEwBHPvPrD32ECnEzh5M+ZAWaFOo2lgdKQkbUPgzE=;
 b=dfIo4bDwxsPzsskyUd3JRf0m0KnRFO8HbmthGegxpTlX1YlPxXYPn6GLfcX70bYGkVLU5K6BRZEde3SP5QRFh2qIqLuE7SludmZMptwkltibZiQQPxCQ/+ndLBWGeysjvxkOepMvsX7Tyczb4odQ8/26o4n8Cxf1GX8wIdzwmAY=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (20.179.235.81) by
 VE1PR04MB6350.eurprd04.prod.outlook.com (10.255.118.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 08:51:21 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::a13e:6f61:e9e6:16d7%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 08:51:21 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     Sven Van Asbroeck <thesven73@gmail.com>
CC:     Fabio Estevam <festevam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>
Subject: RE: [v8] media: imx: add mem2mem device
Thread-Topic: [v8] media: imx: add mem2mem device
Thread-Index: AQHVFzWVi6WPXAEL2EqP2Yi5fqgD66aEYCyggAFpcACABWnKkA==
Date:   Tue, 4 Jun 2019 08:51:21 +0000
Message-ID: <VE1PR04MB663874C6BDAE5ED7B5A36A3F89150@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com>
 <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
 <CAGngYiWdyzhmsRuAsH_35qdt1SLguh2sUxh=cAK58RWnhm2Y7A@mail.gmail.com>
 <4afffe3822026e23a55c05b7e18b43a2d6d0274e.camel@ndufresne.ca>
 <CAGngYiUZJCwg-VgOafU=gBgDtaSV++UVmNQawn6d5LunBFg1FQ@mail.gmail.com>
 <CAOMZO5AxL6MeOY=Pooq65B-Ly=t41JVp0Y_nXrYUKk03yh0KJQ@mail.gmail.com>
 <VE1PR04MB6638C5E75F797BD3114C467A89190@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
In-Reply-To: <CAGngYiX3xOHYw97VU-buuLLwu7vuMk23HEatDpk6vgieE7ozXg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yibin.gong@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ccb239a-16d0-42b5-4dc3-08d6e8c9d168
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VE1PR04MB6350;
x-ms-traffictypediagnostic: VE1PR04MB6350:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB635088A70F165401D43A08A489150@VE1PR04MB6350.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(366004)(376002)(136003)(39860400002)(396003)(13464003)(189003)(199004)(14444005)(256004)(102836004)(54906003)(66946007)(66446008)(64756008)(73956011)(66476007)(66556008)(76116006)(76176011)(6116002)(3846002)(11346002)(2906002)(186003)(476003)(26005)(25786009)(68736007)(6246003)(66066001)(81166006)(81156014)(446003)(8676002)(305945005)(53936002)(7736002)(71200400001)(1411001)(74316002)(86362001)(4326008)(53946003)(229853002)(9686003)(486006)(7696005)(33656002)(8936002)(6916009)(14454004)(6306002)(55016002)(6436002)(316002)(6506007)(52536014)(99286004)(45080400002)(966005)(478600001)(30864003)(53546011)(5660300002)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6350;H:VE1PR04MB6638.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Mih8oEoeoNuoRplhDa/2NFTqrznVWxGBUGVNO0nfwKPu7BQJonryr9qEIZXFv4Qb2QnkoebNLGtgwN5ThX/K1lzlZjAdy8end9PKI25wNNQuDc/OuTKuWm6/niQwMGsp7CBaY95pXbnyGCzjf8tAoq8IraibbzdBfKgLd/aUW9dDpeoMZw/OgLvv/4fMRldTq42spd1W4/bRWe1JFpbA5bSldI4YZXnKm7/rQEsTyFeBmuQ+2Ja0eSionS8QLF9/L9DRKPyPoKodxzRw03hNvujvC1v/n0ZV8Wj4088vPNL+IsV6Ulj3SL2poo6lClTwyphPW7nhhYgDuIksrBLSbgc2cDbNTHFf/rrFYR7Wl5grWhWhg2GxO9jpSgfD+V0MuUpMbn2SsFPPDaiZeCDZTMNf82fHivjpQYUSRKoWXeM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccb239a-16d0-42b5-4dc3-08d6e8c9d168
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 08:51:21.8018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yibin.gong@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6350
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU3ZlbiwNCglJIHNhdyBzaW1pbGFyIGtlcm5lbCBjcmFzaCBpc3N1ZSBvbiB0aGUgbGF0ZXN0
IGxpbnV4LW5leHQgZHVyaW5nIGtlcm5lbCBib290IHVwLCBidXQgbm90IG9uDQp0aGUgJ0xpbnV4
IDUuMi1yYzEgJyB0YWcuIFdpbGwgZG8gYmlzZWN0IGxhdGVyLiBCdXQgdjUuMCBzaG91bGQgYmUg
b2theSwgY291bGQgeW91IGhlbHAgZG91YmxlIGNoZWNrPw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFN2ZW4gVmFuIEFzYnJvZWNrIDx0aGVzdmVuNzNAZ21haWwuY29t
Pg0KPiBTZW50OiAyMDE55bm0NuaciDHml6UgNTo1OQ0KPiBIaSBSb2JpbiwNCj4gDQo+IE9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDg6MjYgUE0gUm9iaW4gR29uZyA8eWliaW4uZ29uZ0BueHAuY29t
PiB3cm90ZToNCj4gPiAgICAgICAgIFdoYXQncyBzb2MgY2hpcCBhbmQgYm9hcmQgeW91IHVzZWQ/
IENvdWxkIHlvdSBwb3N0IGxvZz8NCj4gDQo+IFRoZSBtYWlubGluZSBrZXJuZWwgd2UndmUgYmVl
biB1c2luZyBkb2VzIG5vdCBoYXZlIGFueSBzZG1hIGZpcm13YXJlLCBhbmQNCj4gYXMgYSByZXN1
bHQgd2UgZ2V0IHRoaXMgaW4gdGhlIGxvZzoNCj4gDQo+ICMgdW5hbWUgLWENCj4gTGludXggQ2hp
bWVyYSA1LjIuMC1yYzItMDAwNDEtZzIyYTE3ODdlOGY0MCAjNjYgU01QIEZyaSBNYXkgMzENCj4g
MTY6MDg6MTUgRURUIDIwMTkgYXJtdjdsIEdOVS9MaW51eA0KPiAjIGRtZXNnIHwgZ3JlcCBzZG1h
DQo+IFsgICAgMS4zNTg0NzJdIGlteC1zZG1hIDIwZWMwMDAuc2RtYTogRGlyZWN0IGZpcm13YXJl
IGxvYWQgZm9yDQo+IGlteC9zZG1hL3NkbWEtaW14NnEuYmluIGZhaWxlZCB3aXRoIGVycm9yIC0y
DQo+IFsgICAgMS4zNTg1NzBdIGlteC1zZG1hIDIwZWMwMDAuc2RtYTogRmFsbGluZyBiYWNrIHRv
IHN5c2ZzIGZhbGxiYWNrDQo+IGZvcjogaW14L3NkbWEvc2RtYS1pbXg2cS5iaW4NCj4gWyAgIDY0
LjQ3Mzc3M10gaW14LXNkbWEgMjBlYzAwMC5zZG1hOiBleHRlcm5hbCBmaXJtd2FyZSBub3QgZm91
bmQsDQo+IHVzaW5nIFJPTSBmaXJtd2FyZQ0KPiANCj4gSSBkb3dubG9hZGVkIHRoZSBsYXRlc3Qg
RnJlZXNjYWxlIHNkbWEgZmlybXdhcmUgKDMuMykgZnJvbQ0KPiBodHRwczovL2V1cjAxLnNhZmVs
aW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmdpdC5rZXJuZQ0K
PiBsLm9yZyUyRnB1YiUyRnNjbSUyRmxpbnV4JTJGa2VybmVsJTJGZ2l0JTJGZmlybXdhcmUlMkZs
aW51eC1maXJtd2FyZQ0KPiAmYW1wO2RhdGE9MDIlN0MwMSU3Q3lpYmluLmdvbmclNDBueHAuY29t
JTdDNDFhMmI2ZTE1NTIzNDYzYmJmYTYNCj4gMDhkNmU2MTMyZTNlJTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNg0KPiA5NDkzNjczODgzMDA3NDAmYW1wO3Nk
YXRhPUMycWIlMkIxM09PYUx5JTJCeHFUNkF5RHVOJTJGbWgwMFINCj4gejZ1SGNZTkp0enQlMkJQ
RVUlM0QmYW1wO3Jlc2VydmVkPTANCj4gKGZpbGU6IGlteC9zZG1hL3NkbWEtaW14NnEuYmluKSBh
bmQgYWRkZWQgdGhpcyB0byB0aGUga2VybmVsLiBUaGlzIG5vdyBnZXRzDQo+IHVwbG9hZGVkIHRv
IHRoZSBpbXg2cSwgd2Ugc2VlIHRoaXMgaW4gdGhlIGxvZzoNCj4gDQo+IFsgICAgMS4zMzg3NDFd
IGlteC1zZG1hIDIwZWMwMDAuc2RtYTogbG9hZGVkIGZpcm13YXJlIDMuMw0KPiANCj4gQnV0Li4u
IHRoZSBrZXJuZWwgbm93IGxvY2tzIHVwIGFuZCBjcmFzaGVzLiBTZWUgdGhlIGRtZXNnIGxvZyBh
dCB0aGUgZW5kIG9mIHRoaXMNCj4gZS1tYWlsLg0KPiANCj4gSSBoYXZlIG5vdCBiZWVuIGFibGUg
dG8gYmlzZWN0IHRoZSBleGFjdCBjb21taXQgd2hlcmUgdGhpcyBjcmFzaCB3YXMNCj4gaW50cm9k
dWNlZC4NCj4gQWxsIEkga25vdyBpczoNCj4gdjQuMjAgZ29vZA0KPiB2NS4wIGJhZA0KPiANCj4g
QWxzbzogaWYgSSByZW1vdmUgQ09ORklHX05GU19WNCBmcm9tIHRoZSBkZWZjb25maWcsIHRoZSBw
cm9ibGVtIGRpc2FwcGVhcnMuDQo+IA0KPiBUaGlzIGlzIG9uIGFuIGlteDZxOg0KPiAjIGNhdCAv
cHJvYy9jcHVpbmZvDQo+IHByb2Nlc3NvciA6IDANCj4gbW9kZWwgbmFtZSA6IEFSTXY3IFByb2Nl
c3NvciByZXYgMTAgKHY3bCkgQm9nb01JUFMgOiA3LjU0IEZlYXR1cmVzIDogaGFsZg0KPiB0aHVt
YiBmYXN0bXVsdCB2ZnAgZWRzcCBuZW9uIHZmcHYzIHRscyB2ZnBkMzIgQ1BVIGltcGxlbWVudGVy
IDogMHg0MSBDUFUNCj4gYXJjaGl0ZWN0dXJlOiA3IENQVSB2YXJpYW50IDogMHgyIENQVSBwYXJ0
IDogMHhjMDkgQ1BVIHJldmlzaW9uIDogMTAgPC4uLj4NCj4gSGFyZHdhcmUgOiBGcmVlc2NhbGUg
aS5NWDYgUXVhZC9EdWFsTGl0ZSAoRGV2aWNlIFRyZWUpIFJldmlzaW9uIDogMDAwMCBTZXJpYWwg
Og0KPiAwMDAwMDAwMDAwMDAwMDAwDQo+IA0KPiBUaGUgYm9hcmQgaXMgYW4gaW4taG91c2UgZGVz
aWduLCBsb29zZWx5IGJhc2VkIG9uIHRoZSBzYWJyZS1zZC4gV2UgaGF2ZSBvdXINCj4gb3duIHNt
YWxsIHBhdGNoIHNldCB3aGljaCBhZGRzIG91ciBkZXZpY2V0cmVlLCBwbHVzIGEgZmV3IHZlcnkg
c3BlY2lmaWMNCj4gcGF0Y2hlcyB3ZSBuZWVkLiBXZSBhcHBseSB0aGlzIG9uIHRvcCBvZiBtYWlu
bGluZS4NCj4gDQo+IFdlIGFsc28gdXNlIGlteF92Nl92N19kZWZjb25maWcuDQo+IA0KPiBIZXJl
IGlzIHRoZSBjcmFzaCBsb2c6DQo+IA0KPiBbICAgIDAuMDAwMDAwXSBCb290aW5nIExpbnV4IG9u
IHBoeXNpY2FsIENQVSAweDANCj4gWyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjIuMC1y
YzItMDAwNDUtZ2M2M2VlM2NiNzEzNA0KPiAoc3ZhQHN2ZW5zLWFzdXMpIChnY2MgdmVyc2lvbiA3
LjMuMSAyMDE4MDQyNSBbbGluYXJvLTcuMy0yMDE4LjA1IHJldmlzaW9uDQo+IGQyOTEyMGE0MjRl
Y2ZiYzE2N2VmOTAwNjVjMGVlYjdmOTE5Nzc3MDFdIChMaW5hcm8gR0NDDQo+IDcuMy0yMDE4LjA1
KSkgIzY3IFNNUCBGcmkgTWF5IDMxIDE3OjI2OjE5IEVEVCAyMDE5DQo+IFsgICAgMC4wMDAwMDBd
IENQVTogQVJNdjcgUHJvY2Vzc29yIFs0MTJmYzA5YV0gcmV2aXNpb24gMTAgKEFSTXY3KSwNCj4g
Y3I9MTBjNTM4N2QNCj4gWyAgICAwLjAwMDAwMF0gQ1BVOiBQSVBUIC8gVklQVCBub25hbGlhc2lu
ZyBkYXRhIGNhY2hlLCBWSVBUIGFsaWFzaW5nDQo+IGluc3RydWN0aW9uIGNhY2hlDQo+IFsgICAg
MC4wMDAwMDBdIE9GOiBmZHQ6IE1hY2hpbmUgbW9kZWw6IEFSQ1ggTWVkdXNhDQo+IFsgICAgMC4w
MDAwMDBdIE1lbW9yeSBwb2xpY3k6IERhdGEgY2FjaGUgd3JpdGVhbGxvYw0KPiBbICAgIDAuMDAw
MDAwXSBjbWE6IFJlc2VydmVkIDI1NiBNaUIgYXQgMHgzMDAwMDAwMA0KPiBbICAgIDAuMDAwMDAw
XSBwZXJjcHU6IEVtYmVkZGVkIDIxIHBhZ2VzL2NwdSBzNTQ4MjQgcjgxOTIgZDIzMDAwDQo+IHU4
NjAxNg0KPiBbICAgIDAuMDAwMDAwXSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3JvdXBp
bmcgb24uICBUb3RhbCBwYWdlczogNTIyNTYwDQo+IFsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21t
YW5kIGxpbmU6IGNvbnNvbGU9dHR5bXhjMCwxMTUyMDANCj4gdmlkZW89bXhjZmIwOmRldj1wZWdh
c3VzLDY0MHg0ODBNQDYwLGlmPVJHQjI0LGJwcD0zMg0KPiB2aWRlbz1teGNmYjE6ZGV2PWhkbWks
NjQweDQ4ME1ANjAsaWY9UkdCMjQsYnBwPTMyIGlwPW5vbmUNCj4gcm9vdD0vZGV2L21tY2JsazBw
MyByb290d2FpdCBybyByb290ZnN0eXBlPWV4dDINCj4gWyAgICAwLjAwMDAwMF0gRGVudHJ5IGNh
Y2hlIGhhc2ggdGFibGUgZW50cmllczogMTMxMDcyIChvcmRlcjogNywgNTI0Mjg4DQo+IGJ5dGVz
KQ0KPiBbICAgIDAuMDAwMDAwXSBJbm9kZS1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2
IChvcmRlcjogNiwgMjYyMTQ0DQo+IGJ5dGVzKQ0KPiBbICAgIDAuMDAwMDAwXSBNZW1vcnk6IDE3
ODgzNjhLLzIwOTcxNTJLIGF2YWlsYWJsZSAoMTIyODhLIGtlcm5lbA0KPiBjb2RlLCA5ODRLIHJ3
ZGF0YSwgNDMwMEsgcm9kYXRhLCAxMDI0SyBpbml0LCA2OTI3SyBic3MsIDQ2NjQwSyByZXNlcnZl
ZCwNCj4gMjYyMTQ0SyBjbWEtcmVzZXJ2ZWQsIDEzMTA3MjBLIGhpZ2htZW0pDQo+IFsgICAgMC4w
MDAwMDBdIFNMVUI6IEhXYWxpZ249NjQsIE9yZGVyPTAtMywgTWluT2JqZWN0cz0wLCBDUFVzPTQs
DQo+IE5vZGVzPTENCj4gWyAgICAwLjAwMDAwMF0gUnVubmluZyBSQ1Ugc2VsZiB0ZXN0cw0KPiBb
ICAgIDAuMDAwMDAwXSByY3U6IEhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24uDQo+IFsg
ICAgMC4wMDAwMDBdIHJjdTogUkNVIGV2ZW50IHRyYWNpbmcgaXMgZW5hYmxlZC4NCj4gWyAgICAw
LjAwMDAwMF0gcmN1OiBSQ1UgbG9ja2RlcCBjaGVja2luZyBpcyBlbmFibGVkLg0KPiBbICAgIDAu
MDAwMDAwXSByY3U6IFJDVSBjYWxjdWxhdGVkIHZhbHVlIG9mIHNjaGVkdWxlci1lbmxpc3RtZW50
IGRlbGF5DQo+IGlzIDEwIGppZmZpZXMuDQo+IFsgICAgMC4wMDAwMDBdIE5SX0lSUVM6IDE2LCBu
cl9pcnFzOiAxNiwgcHJlYWxsb2NhdGVkIGlycXM6IDE2DQo+IFsgICAgMC4wMDAwMDBdIEwyQzog
RFQvcGxhdGZvcm0gbW9kaWZpZXMgYXV4IGNvbnRyb2wgcmVnaXN0ZXI6DQo+IDB4MzIwNzAwMDAg
LT4gMHgzMjQ3MDAwMA0KPiBbICAgIDAuMDAwMDAwXSBMMkMtMzEwIGVycmF0YSA3NTIyNzEgNzY5
NDE5IGVuYWJsZWQNCj4gWyAgICAwLjAwMDAwMF0gTDJDLTMxMCBlbmFibGluZyBlYXJseSBCUkVT
UCBmb3IgQ29ydGV4LUE5DQo+IFsgICAgMC4wMDAwMDBdIEwyQy0zMTAgZnVsbCBsaW5lIG9mIHpl
cm9zIGVuYWJsZWQgZm9yIENvcnRleC1BOQ0KPiBbICAgIDAuMDAwMDAwXSBMMkMtMzEwIElEIHBy
ZWZldGNoIGVuYWJsZWQsIG9mZnNldCAxNiBsaW5lcw0KPiBbICAgIDAuMDAwMDAwXSBMMkMtMzEw
IGR5bmFtaWMgY2xvY2sgZ2F0aW5nIGVuYWJsZWQsIHN0YW5kYnkgbW9kZSBlbmFibGVkDQo+IFsg
ICAgMC4wMDAwMDBdIEwyQy0zMTAgY2FjaGUgY29udHJvbGxlciBlbmFibGVkLCAxNiB3YXlzLCAx
MDI0IGtCDQo+IFsgICAgMC4wMDAwMDBdIEwyQy0zMTA6IENBQ0hFX0lEIDB4NDEwMDAwYzcsIEFV
WF9DVFJMIDB4NzY0NzAwMDENCj4gWyAgICAwLjAwMDAwMF0gcmFuZG9tOiBnZXRfcmFuZG9tX2J5
dGVzIGNhbGxlZCBmcm9tDQo+IHN0YXJ0X2tlcm5lbCsweDJhYy8weDRjMCB3aXRoIGNybmdfaW5p
dD0wDQo+IFsgICAgMC4wMDAwMDBdIFN3aXRjaGluZyB0byB0aW1lci1iYXNlZCBkZWxheSBsb29w
LCByZXNvbHV0aW9uIDMzM25zDQo+IFsgICAgMC4wMDAwMDhdIHNjaGVkX2Nsb2NrOiAzMiBiaXRz
IGF0IDMwMDBrSHosIHJlc29sdXRpb24gMzMzbnMsDQo+IHdyYXBzIGV2ZXJ5IDcxNTgyNzg4Mjg0
MW5zDQo+IFsgICAgMC4wMDAwMzRdIGNsb2Nrc291cmNlOiBteGNfdGltZXIxOiBtYXNrOiAweGZm
ZmZmZmZmIG1heF9jeWNsZXM6DQo+IDB4ZmZmZmZmZmYsIG1heF9pZGxlX25zOiA2MzcwODY4MTU1
OTUgbnMNCj4gWyAgICAwLjAwMjA0MF0gQ29uc29sZTogY29sb3VyIGR1bW15IGRldmljZSA4MHgz
MA0KPiBbICAgIDAuMDAyMDgyXSBMb2NrIGRlcGVuZGVuY3kgdmFsaWRhdG9yOiBDb3B5cmlnaHQg
KGMpIDIwMDYgUmVkIEhhdCwNCj4gSW5jLiwgSW5nbyBNb2xuYXINCj4gWyAgICAwLjAwMjA5OV0g
Li4uIE1BWF9MT0NLREVQX1NVQkNMQVNTRVM6ICA4DQo+IFsgICAgMC4wMDIxMTVdIC4uLiBNQVhf
TE9DS19ERVBUSDogICAgICAgICAgNDgNCj4gWyAgICAwLjAwMjEzMF0gLi4uIE1BWF9MT0NLREVQ
X0tFWVM6ICAgICAgICA4MTkxDQo+IFsgICAgMC4wMDIxNDVdIC4uLiBDTEFTU0hBU0hfU0laRTog
ICAgICAgICAgNDA5Ng0KPiBbICAgIDAuMDAyMTYwXSAuLi4gTUFYX0xPQ0tERVBfRU5UUklFUzog
ICAgIDMyNzY4DQo+IFsgICAgMC4wMDIxNzZdIC4uLiBNQVhfTE9DS0RFUF9DSEFJTlM6ICAgICAg
NjU1MzYNCj4gWyAgICAwLjAwMjE5MV0gLi4uIENIQUlOSEFTSF9TSVpFOiAgICAgICAgICAzMjc2
OA0KPiBbICAgIDAuMDAyMjA2XSAgbWVtb3J5IHVzZWQgYnkgbG9jayBkZXBlbmRlbmN5IGluZm86
IDQ0MTEga0INCj4gWyAgICAwLjAwMjIyMV0gIHBlciB0YXNrLXN0cnVjdCBtZW1vcnkgZm9vdHBy
aW50OiAxNTM2IGJ5dGVzDQo+IFsgICAgMC4wMDIzMTldIENhbGlicmF0aW5nIGRlbGF5IGxvb3Ag
KHNraXBwZWQpLCB2YWx1ZSBjYWxjdWxhdGVkDQo+IHVzaW5nIHRpbWVyIGZyZXF1ZW5jeS4uIDYu
MDAgQm9nb01JUFMgKGxwaj0zMDAwMCkNCj4gWyAgICAwLjAwMjM0Nl0gcGlkX21heDogZGVmYXVs
dDogMzI3NjggbWluaW11bTogMzAxDQo+IFsgICAgMC4wMDI4MDRdIE1vdW50LWNhY2hlIGhhc2gg
dGFibGUgZW50cmllczogMjA0OCAob3JkZXI6IDEsIDgxOTIgYnl0ZXMpDQo+IFsgICAgMC4wMDI4
MzRdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMSwg
ODE5Mg0KPiBieXRlcykNCj4gWyAgICAwLjAwNDk5M10gKioqIFZBTElEQVRFIHByb2MgKioqDQo+
IFsgICAgMC4wMDYyMTddICoqKiBWQUxJREFURSBjZ3JvdXAxICoqKg0KPiBbICAgIDAuMDA2MjQ0
XSAqKiogVkFMSURBVEUgY2dyb3VwMiAqKioNCj4gWyAgICAwLjAwNjI3NF0gQ1BVOiBUZXN0aW5n
IHdyaXRlIGJ1ZmZlciBjb2hlcmVuY3k6IG9rDQo+IFsgICAgMC4wMDYzNjFdIENQVTA6IFNwZWN0
cmUgdjI6IHVzaW5nIEJQSUFMTCB3b3JrYXJvdW5kDQo+IFsgICAgMC4wMDc3MjhdIENQVTA6IHRo
cmVhZCAtMSwgY3B1IDAsIHNvY2tldCAwLCBtcGlkciA4MDAwMDAwMA0KPiBbICAgIDAuMDEwMjI5
XSBTZXR0aW5nIHVwIHN0YXRpYyBpZGVudGl0eSBtYXAgZm9yIDB4MTAxMDAwMDAgLSAweDEwMTAw
MDc4DQo+IFsgICAgMC4wMTA4MDVdIHJjdTogSGllcmFyY2hpY2FsIFNSQ1UgaW1wbGVtZW50YXRp
b24uDQo+IFsgICAgMC4wMTIzMjFdIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQVXMgLi4u
DQo+IFsgICAgMC4wMTQ3MzFdIENQVTE6IHRocmVhZCAtMSwgY3B1IDEsIHNvY2tldCAwLCBtcGlk
ciA4MDAwMDAwMQ0KPiBbICAgIDAuMDE0NzQyXSBDUFUxOiBTcGVjdHJlIHYyOiB1c2luZyBCUElB
TEwgd29ya2Fyb3VuZA0KPiBbICAgIDAuMDE3NDU2XSBDUFUyOiB0aHJlYWQgLTEsIGNwdSAyLCBz
b2NrZXQgMCwgbXBpZHIgODAwMDAwMDINCj4gWyAgICAwLjAxNzQ2N10gQ1BVMjogU3BlY3RyZSB2
MjogdXNpbmcgQlBJQUxMIHdvcmthcm91bmQNCj4gWyAgICAwLjAxOTcwM10gQ1BVMzogdGhyZWFk
IC0xLCBjcHUgMywgc29ja2V0IDAsIG1waWRyIDgwMDAwMDAzDQo+IFsgICAgMC4wMTk3MTRdIENQ
VTM6IFNwZWN0cmUgdjI6IHVzaW5nIEJQSUFMTCB3b3JrYXJvdW5kDQo+IFsgICAgMC4wMjAxNThd
IHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDQgQ1BVcw0KPiBbICAgIDAuMDIwMTgyXSBTTVA6IFRv
dGFsIG9mIDQgcHJvY2Vzc29ycyBhY3RpdmF0ZWQgKDI0LjAwIEJvZ29NSVBTKS4NCj4gWyAgICAw
LjAyMDIwMF0gQ1BVOiBBbGwgQ1BVKHMpIHN0YXJ0ZWQgaW4gU1ZDIG1vZGUuDQo+IFsgICAgMC4w
MjMzODFdIGRldnRtcGZzOiBpbml0aWFsaXplZA0KPiBbICAgIDAuMDU1NzE4XSBWRlAgc3VwcG9y
dCB2MC4zOiBpbXBsZW1lbnRvciA0MSBhcmNoaXRlY3R1cmUgMyBwYXJ0IDMwDQo+IHZhcmlhbnQg
OSByZXYgNA0KPiBbICAgIDAuMDU3OTkwXSBjbG9ja3NvdXJjZTogamlmZmllczogbWFzazogMHhm
ZmZmZmZmZiBtYXhfY3ljbGVzOg0KPiAweGZmZmZmZmZmLCBtYXhfaWRsZV9uczogMTkxMTI2MDQ0
NjI3NTAwMDAgbnMNCj4gWyAgICAwLjA1ODA1M10gZnV0ZXggaGFzaCB0YWJsZSBlbnRyaWVzOiAx
MDI0IChvcmRlcjogNCwgNjU1MzYgYnl0ZXMpDQo+IFsgICAgMC4wNzE5MzFdIHBpbmN0cmwgY29y
ZTogaW5pdGlhbGl6ZWQgcGluY3RybCBzdWJzeXN0ZW0NCj4gWyAgICAwLjA3NjYzM10gTkVUOiBS
ZWdpc3RlcmVkIHByb3RvY29sIGZhbWlseSAxNg0KPiBbICAgIDAuMDk5Mjc4XSBETUE6IHByZWFs
bG9jYXRlZCAyNTYgS2lCIHBvb2wgZm9yIGF0b21pYyBjb2hlcmVudA0KPiBhbGxvY2F0aW9ucw0K
PiBbICAgIDAuMTAyNDk4XSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5vciBtZW51DQo+IFsgICAgMC4x
MDI4MTddIENQVSBpZGVudGlmaWVkIGFzIGkuTVg2USwgc2lsaWNvbiByZXYgMS41DQo+IFsgICAg
MC4xMjE5NTVdIHZkZDFwMTogc3VwcGxpZWQgYnkgcmVndWxhdG9yLWR1bW15DQo+IFsgICAgMC4x
MjM1NjldIHZkZDNwMDogc3VwcGxpZWQgYnkgcmVndWxhdG9yLWR1bW15DQo+IFsgICAgMC4xMjQ3
NjRdIHZkZDJwNTogc3VwcGxpZWQgYnkgcmVndWxhdG9yLWR1bW15DQo+IFsgICAgMC4xMjU5Njhd
IHZkZGFybTogc3VwcGxpZWQgYnkgcmVndWxhdG9yLWR1bW15DQo+IFsgICAgMC4xMjcyODBdIHZk
ZHB1OiBzdXBwbGllZCBieSByZWd1bGF0b3ItZHVtbXkNCj4gWyAgICAwLjEyODQ4MF0gdmRkc29j
OiBzdXBwbGllZCBieSByZWd1bGF0b3ItZHVtbXkNCj4gWyAgICAwLjE1Njg4Ml0gTm8gQVRBR3M/
DQo+IFsgICAgMC4xNTczMzldIGh3LWJyZWFrcG9pbnQ6IGZvdW5kIDUgKCsxIHJlc2VydmVkKSBi
cmVha3BvaW50IGFuZCAxDQo+IHdhdGNocG9pbnQgcmVnaXN0ZXJzLg0KPiBbICAgIDAuMTU3NDQy
XSBody1icmVha3BvaW50OiBtYXhpbXVtIHdhdGNocG9pbnQgc2l6ZSBpcyA0IGJ5dGVzLg0KPiBb
ICAgIDAuMTYxODg2XSBpbXg2cS1waW5jdHJsIDIwZTAwMDAuaW9tdXhjOiBpbml0aWFsaXplZCBJ
TVggcGluY3RybCBkcml2ZXINCj4gWyAgICAwLjI1MTg4OV0gbXhzLWRtYSAxMTAwMDAuZG1hLWFw
Ymg6IGluaXRpYWxpemVkDQo+IFsgICAgMC41NzU3MjNdIHZnYWFyYjogbG9hZGVkDQo+IFsgICAg
MC41NzY3MjRdIFNDU0kgc3Vic3lzdGVtIGluaXRpYWxpemVkDQo+IFsgICAgMC41Nzc5NzZdIHVz
YmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdXNiZnMNCj4gWyAgICAwLjU3
ODE3N10gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBodWINCj4gWyAg
ICAwLjU3ODQyOV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgZGV2aWNlIGRyaXZlciB1c2INCj4g
WyAgICAwLjU3ODczNl0gdXNiX3BoeV9nZW5lcmljIHVzYnBoeW5vcDE6IHVzYnBoeW5vcDEgc3Vw
cGx5IHZjYyBub3QNCj4gZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcg0KPiBbICAgIDAuNTc5
NDIyXSB1c2JfcGh5X2dlbmVyaWMgdXNicGh5bm9wMjogdXNicGh5bm9wMiBzdXBwbHkgdmNjIG5v
dA0KPiBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yDQo+IFsgICAgMC41ODMzMjhdIGkyYyBp
MmMtMDogSU1YIEkyQyBhZGFwdGVyIHJlZ2lzdGVyZWQNCj4gWyAgICAwLjU4NTE0MV0gaTJjIGky
Yy0xOiBJTVggSTJDIGFkYXB0ZXIgcmVnaXN0ZXJlZA0KPiBbICAgIDAuNTg2NDkyXSBpMmMgaTJj
LTI6IElNWCBJMkMgYWRhcHRlciByZWdpc3RlcmVkDQo+IFsgICAgMC41ODY4NTddIG1lZGlhOiBM
aW51eCBtZWRpYSBpbnRlcmZhY2U6IHYwLjEwDQo+IFsgICAgMC41ODY5NjFdIHZpZGVvZGV2OiBM
aW51eCB2aWRlbyBjYXB0dXJlIGludGVyZmFjZTogdjIuMDANCj4gWyAgICAwLjU4NzQwMF0gcHBz
X2NvcmU6IExpbnV4UFBTIEFQSSB2ZXIuIDEgcmVnaXN0ZXJlZA0KPiBbICAgIDAuNTg3NDIxXSBw
cHNfY29yZTogU29mdHdhcmUgdmVyLiA1LjMuNiAtIENvcHlyaWdodCAyMDA1LTIwMDcNCj4gUm9k
b2xmbyBHaW9tZXR0aSA8Z2lvbWV0dGlAbGludXguaXQ+DQo+IFsgICAgMC41ODc0NzZdIFBUUCBj
bG9jayBzdXBwb3J0IHJlZ2lzdGVyZWQNCj4gWyAgICAwLjU4ODM4Ml0gQWR2YW5jZWQgTGludXgg
U291bmQgQXJjaGl0ZWN0dXJlIERyaXZlciBJbml0aWFsaXplZC4NCj4gWyAgICAwLjU5MjEzOF0g
Qmx1ZXRvb3RoOiBDb3JlIHZlciAyLjIyDQo+IFsgICAgMC41OTIyNDNdIE5FVDogUmVnaXN0ZXJl
ZCBwcm90b2NvbCBmYW1pbHkgMzENCj4gWyAgICAwLjU5MjI2M10gQmx1ZXRvb3RoOiBIQ0kgZGV2
aWNlIGFuZCBjb25uZWN0aW9uIG1hbmFnZXIgaW5pdGlhbGl6ZWQNCj4gWyAgICAwLjU5MjM2OV0g
Qmx1ZXRvb3RoOiBIQ0kgc29ja2V0IGxheWVyIGluaXRpYWxpemVkDQo+IFsgICAgMC41OTI0MDJd
IEJsdWV0b290aDogTDJDQVAgc29ja2V0IGxheWVyIGluaXRpYWxpemVkDQo+IFsgICAgMC41OTI1
ODZdIEJsdWV0b290aDogU0NPIHNvY2tldCBsYXllciBpbml0aWFsaXplZA0KPiBbICAgIDAuNTk0
MTk1XSBSZWdpc3RlcmluZyB0aGUgTUlPQjEgZHJpdmVyDQo+IFsgICAgMC41OTQ4NzRdIGNsb2Nr
c291cmNlOiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSBteGNfdGltZXIxDQo+IFsgICAgMS4yNTg5
MzRdIFZGUzogRGlzayBxdW90YXMgZHF1b3RfNi42LjANCj4gWyAgICAxLjI1OTExMV0gVkZTOiBE
cXVvdC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyIDAsIDQwOTYNCj4gYnl0
ZXMpDQo+IFsgICAgMS4yODU3NDddIE5FVDogUmVnaXN0ZXJlZCBwcm90b2NvbCBmYW1pbHkgMg0K
PiBbICAgIDEuMjg4MDMyXSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFzaCB0YWJsZSBlbnRy
aWVzOiA1MTINCj4gKG9yZGVyOiAyLCAyMDQ4MCBieXRlcykNCj4gWyAgICAxLjI4ODE2MV0gVENQ
IGVzdGFibGlzaGVkIGhhc2ggdGFibGUgZW50cmllczogODE5MiAob3JkZXI6IDMsIDMyNzY4DQo+
IGJ5dGVzKQ0KPiBbICAgIDEuMjg4MzI2XSBUQ1AgYmluZCBoYXNoIHRhYmxlIGVudHJpZXM6IDgx
OTIgKG9yZGVyOiA2LCAyOTQ5MTIgYnl0ZXMpDQo+IFsgICAgMS4yODkzMDZdIFRDUDogSGFzaCB0
YWJsZXMgY29uZmlndXJlZCAoZXN0YWJsaXNoZWQgODE5MiBiaW5kIDgxOTIpDQo+IFsgICAgMS4y
ODk4MDNdIFVEUCBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3JkZXI6IDMsIDQwOTYwIGJ5dGVz
KQ0KPiBbICAgIDEuMjg5OTg3XSBVRFAtTGl0ZSBoYXNoIHRhYmxlIGVudHJpZXM6IDUxMiAob3Jk
ZXI6IDMsIDQwOTYwIGJ5dGVzKQ0KPiBbICAgIDEuMjkwNTQ1XSBORVQ6IFJlZ2lzdGVyZWQgcHJv
dG9jb2wgZmFtaWx5IDENCj4gWyAgICAxLjI5MjY1OV0gUlBDOiBSZWdpc3RlcmVkIG5hbWVkIFVO
SVggc29ja2V0IHRyYW5zcG9ydCBtb2R1bGUuDQo+IFsgICAgMS4yOTI3NDJdIFJQQzogUmVnaXN0
ZXJlZCB1ZHAgdHJhbnNwb3J0IG1vZHVsZS4NCj4gWyAgICAxLjI5Mjc2MV0gUlBDOiBSZWdpc3Rl
cmVkIHRjcCB0cmFuc3BvcnQgbW9kdWxlLg0KPiBbICAgIDEuMjkyNzc5XSBSUEM6IFJlZ2lzdGVy
ZWQgdGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNwb3J0IG1vZHVsZS4NCj4gWyAgICAxLjI5
Mzc3OV0gUENJOiBDTFMgMCBieXRlcywgZGVmYXVsdCA2NA0KPiBbICAgIDEuMjk1Nzk3XSBodyBw
ZXJmZXZlbnRzOiBubyBpbnRlcnJ1cHQtYWZmaW5pdHkgcHJvcGVydHkgZm9yIC9wbXUsDQo+IGd1
ZXNzaW5nLg0KPiBbICAgIDEuMjk2NDUxXSBodyBwZXJmZXZlbnRzOiBlbmFibGVkIHdpdGggYXJt
djdfY29ydGV4X2E5IFBNVSBkcml2ZXIsDQo+IDcgY291bnRlcnMgYXZhaWxhYmxlDQo+IFsgICAg
MS4zMDEwOTJdIEluaXRpYWxpc2Ugc3lzdGVtIHRydXN0ZWQga2V5cmluZ3MNCj4gWyAgICAxLjMw
MTgxNV0gd29ya2luZ3NldDogdGltZXN0YW1wX2JpdHM9MTQgbWF4X29yZGVyPTE5DQo+IGJ1Y2tl
dF9vcmRlcj01DQo+IFsgICAgMS4zMjA5OTZdIE5GUzogUmVnaXN0ZXJpbmcgdGhlIGlkX3Jlc29s
dmVyIGtleSB0eXBlDQo+IFsgICAgMS4zMjExNjBdIEtleSB0eXBlIGlkX3Jlc29sdmVyIHJlZ2lz
dGVyZWQNCj4gWyAgICAxLjMyMTI0NF0gS2V5IHR5cGUgaWRfbGVnYWN5IHJlZ2lzdGVyZWQNCj4g
WyAgICAxLjMyMTQyMF0gamZmczI6IHZlcnNpb24gMi4yLiAoTkFORCkgwqkgMjAwMS0yMDA2IFJl
ZCBIYXQsIEluYy4NCj4gWyAgICAxLjMyMjU0Nl0gcm9tZnM6IFJPTUZTIE1URCAoQykgMjAwNyBS
ZWQgSGF0LCBJbmMuDQo+IFsgICAgMS4zMjMxMTZdIGZ1c2U6IGluaXQgKEFQSSB2ZXJzaW9uIDcu
MzApDQo+IFsgICAgMS4zMjQ4NzJdIEtleSB0eXBlIGFzeW1tZXRyaWMgcmVnaXN0ZXJlZA0KPiBb
ICAgIDEuMzI0OTg5XSBBc3ltbWV0cmljIGtleSBwYXJzZXIgJ3g1MDknIHJlZ2lzdGVyZWQNCj4g
WyAgICAxLjMyNTIzNV0gYm91bmNlOiBwb29sIHNpemU6IDY0IHBhZ2VzDQo+IFsgICAgMS4zMjU4
NTBdIGlvIHNjaGVkdWxlciBtcS1kZWFkbGluZSByZWdpc3RlcmVkDQo+IFsgICAgMS4zMjU4NzRd
IGlvIHNjaGVkdWxlciBreWJlciByZWdpc3RlcmVkDQo+IFsgICAgMS4zMjk3MTJdIGlteC13ZWlt
IDIxYjgwMDAud2VpbTogRHJpdmVyIHJlZ2lzdGVyZWQuDQo+IFsgICAgMS4zMzQxNjddIGlteDZx
LXBjaWUgMWZmYzAwMC5wY2llOiBob3N0IGJyaWRnZSAvc29jL3BjaWVAMWZmYzAwMA0KPiByYW5n
ZXM6DQo+IFsgICAgMS4zMzQzNjNdIGlteDZxLXBjaWUgMWZmYzAwMC5wY2llOiAgICBJTyAweDAx
ZjgwMDAwLi4weDAxZjhmZmZmDQo+IC0+IDB4MDAwMDAwMDANCj4gWyAgICAxLjMzNDU2MV0gaW14
NnEtcGNpZSAxZmZjMDAwLnBjaWU6ICAgTUVNIDB4MDEwMDAwMDAuLjB4MDFlZmZmZmYNCj4gLT4g
MHgwMTAwMDAwMA0KPiBbICAgIDEuMzM4NzQxXSBpbXgtc2RtYSAyMGVjMDAwLnNkbWE6IGxvYWRl
ZCBmaXJtd2FyZSAzLjMNCj4gWyAgICAxLjM0MDg0M10gcmFuZG9tOiBmYXN0IGluaXQgZG9uZQ0K
PiBbICAgIDEuMzQ3NDc5XSBpbXgtcGdjLXBkIGlteC1wZ2MtcG93ZXItZG9tYWluLjA6IERNQSBt
YXNrIG5vdCBzZXQNCj4gWyAgICAxLjM0Nzk4MV0gaW14LXBnYy1wZCBpbXgtcGdjLXBvd2VyLWRv
bWFpbi4xOiBETUEgbWFzayBub3Qgc2V0DQo+IFsgICAgMS40Mzk2ODBdIHJhbmRvbTogY3JuZyBp
bml0IGRvbmUNCj4gWyAgICAxLjQ1NDkzM10gcGZ1emUxMDAtcmVndWxhdG9yIDEtMDAwODogdW5y
ZWNvZ25pemVkIHBmdXplIGNoaXAgSUQhDQo+IFsgICAgMS40NTU2NzhdIHBmdXplMTAwLXJlZ3Vs
YXRvcjogcHJvYmUgb2YgMS0wMDA4IGZhaWxlZCB3aXRoIGVycm9yIC0xMTANCj4gWyAgICAxLjQ1
ODY5M10gMjAyMDAwMC5zZXJpYWw6IHR0eW14YzAgYXQgTU1JTyAweDIwMjAwMDAgKGlycSA9IDI3
LA0KPiBiYXNlX2JhdWQgPSA1MDAwMDAwKSBpcyBhIElNWA0KPiBbICAgIDIuMzMyMDc3XSBwcmlu
dGs6IGNvbnNvbGUgW3R0eW14YzBdIGVuYWJsZWQNCj4gWyAgICAyLjMzOTI2NF0gaW14LXVhcnQg
MjFlODAwMC5zZXJpYWw6IGhhcyBhbiBsdGMyODcwIGNvbWJpbmVkDQo+IHJzMjMyL3JzNDg1IHRy
YW5zY2VpdmVyDQo+IFsgICAgMi4zNDc2NDddIDIxZTgwMDAuc2VyaWFsOiB0dHlteGMxIGF0IE1N
SU8gMHgyMWU4MDAwIChpcnEgPSA3MiwNCj4gYmFzZV9iYXVkID0gNTAwMDAwMCkgaXMgYSBJTVgN
Cj4gWyAgICAyLjM1NzY5OV0gMjFlYzAwMC5zZXJpYWw6IHR0eW14YzIgYXQgTU1JTyAweDIxZWMw
MDAgKGlycSA9IDczLA0KPiBiYXNlX2JhdWQgPSA1MDAwMDAwKSBpcyBhIElNWA0KPiBbICAgIDIu
MzY3ODQ0XSAyMWYwMDAwLnNlcmlhbDogdHR5bXhjMyBhdCBNTUlPIDB4MjFmMDAwMCAoaXJxID0g
NzQsDQo+IGJhc2VfYmF1ZCA9IDUwMDAwMDApIGlzIGEgSU1YDQo+IFsgICAgMi40MDAzNzddIGV0
bmF2aXYgZXRuYXZpdjogYm91bmQgMTMwMDAwLmdwdSAob3BzIGdwdV9vcHMpDQo+IFsgICAgMi40
MDY2NDddIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMTM0MDAwLmdwdSAob3BzIGdwdV9vcHMpDQo+
IFsgICAgMi40MTI3MzZdIGV0bmF2aXYgZXRuYXZpdjogYm91bmQgMjIwNDAwMC5ncHUgKG9wcyBn
cHVfb3BzKQ0KPiBbICAgIDIuNDE4NDkxXSBldG5hdml2LWdwdSAxMzAwMDAuZ3B1OiBtb2RlbDog
R0MyMDAwLCByZXZpc2lvbjogNTEwOA0KPiBbICAgIDIuNDM2ODkyXSBldG5hdml2LWdwdSAxMzAw
MDAuZ3B1OiBjb21tYW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkDQo+IG1lbW9yeSB3aW5kb3cNCj4g
WyAgICAyLjQ0NTI3Ml0gZXRuYXZpdi1ncHUgMTM0MDAwLmdwdTogbW9kZWw6IEdDMzIwLCByZXZp
c2lvbjogNTAwNw0KPiBbICAgIDIuNDYyODUyXSBldG5hdml2LWdwdSAxMzQwMDAuZ3B1OiBjb21t
YW5kIGJ1ZmZlciBvdXRzaWRlIHZhbGlkDQo+IG1lbW9yeSB3aW5kb3cNCj4gWyAgICAyLjQ3MTEw
N10gZXRuYXZpdi1ncHUgMjIwNDAwMC5ncHU6IG1vZGVsOiBHQzM1NSwgcmV2aXNpb246IDEyMTUN
Cj4gWyAgICAyLjQ3NzI5OV0gZXRuYXZpdi1ncHUgMjIwNDAwMC5ncHU6IElnbm9yaW5nIEdQVSB3
aXRoIFZHIGFuZCBGRTIuMA0KPiBbICAgIDIuNDg2MjU5XSBbZHJtXSBJbml0aWFsaXplZCBldG5h
dml2IDEuMi4wIDIwMTUxMjE0IGZvciBldG5hdml2IG9uIG1pbm9yDQo+IDANCj4gWyAgICAyLjQ5
Nzg0OF0gaW14LWlwdXYzIDI0MDAwMDAuaXB1OiBJUFV2M0ggcHJvYmVkDQo+IFsgICAgMi41MDUy
MDddIFtkcm1dIFN1cHBvcnRzIHZibGFuayB0aW1lc3RhbXAgY2FjaGluZyBSZXYgMiAoMjEuMTAu
MjAxMykuDQo+IFsgICAgMi41MTE4OTRdIFtkcm1dIE5vIGRyaXZlciBzdXBwb3J0IGZvciB2Ymxh
bmsgdGltZXN0YW1wIHF1ZXJ5Lg0KPiBbICAgIDIuNTE5Mzg1XSBpbXgtZHJtIGRpc3BsYXktc3Vi
c3lzdGVtOiBib3VuZCBpbXgtaXB1djMtY3J0Yy4yIChvcHMNCj4gaXB1X2NydGNfb3BzKQ0KPiBb
ICAgIDIuNTI3MTYxXSBpbXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBib3VuZCBpbXgtaXB1djMt
Y3J0Yy4zIChvcHMNCj4gaXB1X2NydGNfb3BzKQ0KPiBbICAgIDIuNTM0OTQzXSBpbXgtZHJtIGRp
c3BsYXktc3Vic3lzdGVtOiBib3VuZCBpbXgtaXB1djMtY3J0Yy42IChvcHMNCj4gaXB1X2NydGNf
b3BzKQ0KPiBbICAgIDIuNTQyNjY2XSBpbXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBib3VuZCBp
bXgtaXB1djMtY3J0Yy43IChvcHMNCj4gaXB1X2NydGNfb3BzKQ0KPiBbICAgIDIuNTUwNDMxXSBp
bXgtZHJtIGRpc3BsYXktc3Vic3lzdGVtOiBmYWlsZWQgdG8gYmluZCAxMjAwMDAuaGRtaQ0KPiAo
b3BzIGR3X2hkbWlfaW14X29wcyk6IC01MTcNCj4gWyAgICAyLjU2MDQwMV0gaW14LWRybSBkaXNw
bGF5LXN1YnN5c3RlbTogbWFzdGVyIGJpbmQgZmFpbGVkOiAtNTE3DQo+IFsgICAgMi41NjY1MTld
IGlteC1pcHV2MyAyODAwMDAwLmlwdTogSVBVdjNIIHByb2JlZA0KPiBbICAgMjcuNDk0Nzc3XSBy
Y3U6IElORk86IHJjdV9zY2hlZCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90YXNrczoNCj4gWyAg
IDI3LjUwMDc5N10gcmN1OiAwLS4uLi46ICgxIEdQcyBiZWhpbmQpIGlkbGU9YjYyLzAvMHgzIHNv
ZnRpcnE9MzkvMzkNCj4gZnFzPTEzMDENCj4gWyAgIDI3LjUwODIyMl0gKGRldGVjdGVkIGJ5IDEs
IHQ9MjYwMyBqaWZmaWVzLCBnPS0xMTQzLCBxPTIxKQ0KPiBbICAgMjcuNTEzODE2XSBTZW5kaW5n
IE5NSSBmcm9tIENQVSAxIHRvIENQVXMgMDoNCj4gWyAgIDI3LjUxODU2OF0gTk1JIGJhY2t0cmFj
ZSBmb3IgY3B1IDANCj4gWyAgIDI3LjUxODU3Nl0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVy
LzAgTm90IHRhaW50ZWQNCj4gNS4yLjAtcmMyLTAwMDQ1LWdjNjNlZTNjYjcxMzQgIzY3DQo+IFsg
ICAyNy41MTg1ODJdIEhhcmR3YXJlIG5hbWU6IEZyZWVzY2FsZSBpLk1YNiBRdWFkL0R1YWxMaXRl
IChEZXZpY2UgVHJlZSkNCj4gWyAgIDI3LjUxODU4N10gUEMgaXMgYXQgX19kb19zb2Z0aXJxKzB4
YmMvMHg1MjgNCj4gWyAgIDI3LjUxODU5MF0gTFIgaXMgYXQgbG9ja2RlcF9oYXJkaXJxc19vbisw
eGFjLzB4MWU4DQo+IFsgICAyNy41MTg1OTVdIHBjIDogWzxjMDEwMjJkYz5dICAgIGxyIDogWzxj
MDE4OTlmOD5dICAgIHBzcjogNjAwMDAxMTMNCj4gWyAgIDI3LjUxODU5OF0gc3AgOiBjMTMwMWU4
MCAgaXAgOiAwMDAwMDAwMCAgZnAgOiBjMTNmMGE0NA0KPiBbICAgMjcuNTE4NjAyXSByMTA6IDAw
MDAwMjgyICByOSA6IGRjMDE4NDAwICByOCA6IDAwMDAwMDAxDQo+IFsgICAyNy41MTg2MDVdIHI3
IDogMDAwMDAwMDAgIHI2IDogYzEzMDhjZTAgIHI1IDogMDAwMDAwMDAgIHI0IDogZmZmZmUwMDAN
Cj4gWyAgIDI3LjUxODYwOV0gcjMgOiBjMTMwYzYwMCAgcjIgOiAwMDAwMDAwMCAgcjEgOiAwMDAw
MDAwMiAgcjAgOg0KPiAwMDAwMDAwMQ0KPiBbICAgMjcuNTE4NjEzXSBGbGFnczogblpDdiAgSVJR
cyBvbiAgRklRcyBvbiAgTW9kZSBTVkNfMzIgIElTQSBBUk0NCj4gU2VnbWVudCBub25lDQo+IFsg
ICAyNy41MTg2MTddIENvbnRyb2w6IDEwYzUzODdkICBUYWJsZTogMTAwMDQwNGEgIERBQzogMDAw
MDAwNTENCj4gWyAgIDI3LjUxODYyMl0gQ1BVOiAwIFBJRDogMCBDb21tOiBzd2FwcGVyLzAgTm90
IHRhaW50ZWQNCj4gNS4yLjAtcmMyLTAwMDQ1LWdjNjNlZTNjYjcxMzQgIzY3DQo+IFsgICAyNy41
MTg2MjZdIEhhcmR3YXJlIG5hbWU6IEZyZWVzY2FsZSBpLk1YNiBRdWFkL0R1YWxMaXRlIChEZXZp
Y2UgVHJlZSkNCj4gWyAgIDI3LjUxODYzMF0gWzxjMDExMjdlMD5dICh1bndpbmRfYmFja3RyYWNl
KSBmcm9tIFs8YzAxMGNmZDQ+XQ0KPiAoc2hvd19zdGFjaysweDEwLzB4MTQpDQo+IFsgICAyNy41
MTg2MzRdIFs8YzAxMGNmZDQ+XSAoc2hvd19zdGFjaykgZnJvbSBbPGMwYzcwYmFjPl0NCj4gKGR1
bXBfc3RhY2srMHhkOC8weDExMCkNCj4gWyAgIDI3LjUxODYzOF0gWzxjMGM3MGJhYz5dIChkdW1w
X3N0YWNrKSBmcm9tIFs8YzBjNzc2NDA+XQ0KPiAobm1pX2NwdV9iYWNrdHJhY2UrMHg2Yy8weGJj
KQ0KPiBbICAgMjcuNTE4NjQyXSBbPGMwYzc3NjQwPl0gKG5taV9jcHVfYmFja3RyYWNlKSBmcm9t
IFs8YzAxMTBiMjA+XQ0KPiAoaGFuZGxlX0lQSSsweGU0LzB4M2FjKQ0KPiBbICAgMjcuNTE4NjQ2
XSBbPGMwMTEwYjIwPl0gKGhhbmRsZV9JUEkpIGZyb20gWzxjMDUyZTdmMD5dDQo+IChnaWNfaGFu
ZGxlX2lycSsweDk0LzB4YTgpDQo+IFsgICAyNy41MTg2NTBdIFs8YzA1MmU3ZjA+XSAoZ2ljX2hh
bmRsZV9pcnEpIGZyb20gWzxjMDEwMWE3MD5dDQo+IChfX2lycV9zdmMrMHg3MC8weDk4KQ0KPiBb
ICAgMjcuNTE4NjU0XSBFeGNlcHRpb24gc3RhY2soMHhjMTMwMWUzMCB0byAweGMxMzAxZTc4KQ0K
PiBbICAgMjcuNTE4NjU5XSAxZTIwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAwMDAwMDAwMQ0KPiAwMDAwMDAwMiAwMDAwMDAwMCBjMTMwYzYwMA0KPiBbICAgMjcuNTE4NjYz
XSAxZTQwOiBmZmZmZTAwMCAwMDAwMDAwMCBjMTMwOGNlMCAwMDAwMDAwMCAwMDAwMDAwMQ0KPiBk
YzAxODQwMCAwMDAwMDI4MiBjMTNmMGE0NA0KPiBbICAgMjcuNTE4NjY3XSAxZTYwOiAwMDAwMDAw
MCBjMTMwMWU4MCBjMDE4OTlmOCBjMDEwMjJkYyA2MDAwMDExMw0KPiBmZmZmZmZmZg0KPiBbICAg
MjcuNTE4NjcxXSBbPGMwMTAxYTcwPl0gKF9faXJxX3N2YykgZnJvbSBbPGMwMTAyMmRjPl0NCj4g
KF9fZG9fc29mdGlycSsweGJjLzB4NTI4KQ0KPiBbICAgMjcuNTE4Njc2XSBbPGMwMTAyMmRjPl0g
KF9fZG9fc29mdGlycSkgZnJvbSBbPGMwMTJlZmYwPl0NCj4gKGlycV9leGl0KzB4MTJjLzB4MTgw
KQ0KPiBbICAgMjcuNTE4NjgwXSBbPGMwMTJlZmYwPl0gKGlycV9leGl0KSBmcm9tIFs8YzAxOTVl
YjA+XQ0KPiAoX19oYW5kbGVfZG9tYWluX2lycSsweDZjLzB4ZTApDQo+IFsgICAyNy41MTg2ODRd
IFs8YzAxOTVlYjA+XSAoX19oYW5kbGVfZG9tYWluX2lycSkgZnJvbSBbPGMwNTJlN2E4Pl0NCj4g
KGdpY19oYW5kbGVfaXJxKzB4NGMvMHhhOCkNCj4gWyAgIDI3LjUxODY4OF0gWzxjMDUyZTdhOD5d
IChnaWNfaGFuZGxlX2lycSkgZnJvbSBbPGMwMTAxYTcwPl0NCj4gKF9faXJxX3N2YysweDcwLzB4
OTgpDQo+IFsgICAyNy41MTg2OTFdIEV4Y2VwdGlvbiBzdGFjaygweGMxMzAxZjEwIHRvIDB4YzEz
MDFmNTgpDQo+IFsgICAyNy41MTg2OTZdIDFmMDA6ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDAwMDAwMDAxDQo+IDAwMDAwMDA2IDAwMDAwMDAwIGMxMzBjNjAwDQo+IFsgICAy
Ny41MTg3MDBdIDFmMjA6IGZmZmZlMDAwIGMxMzA4OTI4IDAwMDAwMDAxIGMxMzA4OTY0IDAwMDAw
MDAwDQo+IDAwMDAwMDAwIGMxMzA4OTA4IGMxMzA4OTc4DQo+IFsgICAyNy41MTg3MDNdIDFmNDA6
IDAwMDAwMDAwIGMxMzAxZjYwIGMwMTg5YTQ4IGMwMTA5NDkwIDIwMDAwMDEzDQo+IGZmZmZmZmZm
DQo+IFsgICAyNy41MTg3MDddIFs8YzAxMDFhNzA+XSAoX19pcnFfc3ZjKSBmcm9tIFs8YzAxMDk0
OTA+XQ0KPiAoYXJjaF9jcHVfaWRsZSsweDIwLzB4M2MpDQo+IFsgICAyNy41MTg3MTFdIFs8YzAx
MDk0OTA+XSAoYXJjaF9jcHVfaWRsZSkgZnJvbSBbPGMwMTYwNzQ4Pl0NCj4gKGRvX2lkbGUrMHgx
YjgvMHgyYzApDQo+IFsgICAyNy41MTg3MTVdIFs8YzAxNjA3NDg+XSAoZG9faWRsZSkgZnJvbSBb
PGMwMTYwYmUwPl0NCj4gKGNwdV9zdGFydHVwX2VudHJ5KzB4MTgvMHgyMCkNCj4gWyAgIDI3LjUx
ODcyMF0gWzxjMDE2MGJlMD5dIChjcHVfc3RhcnR1cF9lbnRyeSkgZnJvbSBbPGMxMjAwZTI0Pl0N
Cj4gKHN0YXJ0X2tlcm5lbCsweDQxMC8weDRjMCkNCj4gWyAgIDI3LjUxODcyNV0gWzxjMTIwMGUy
ND5dIChzdGFydF9rZXJuZWwpIGZyb20gWzwwMDAwMDAwMD5dICgweDApDQo=
