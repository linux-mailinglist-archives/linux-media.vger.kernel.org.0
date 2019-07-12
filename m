Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB966F72
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 15:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbfGLNC3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 09:02:29 -0400
Received: from mail-eopbgr60042.outbound.protection.outlook.com ([40.107.6.42]:15169
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727045AbfGLNC2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 09:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0phNepfyJlON2igMCuCnLBhgeo1BHj/eZEaOI2FPzqQ=;
 b=Ne1Ixsc6onMGSRbbY9F8eU1EGPvoKpLjbounaat+rQ75+dwMBcSUm5VlAb9Mu/y1D6J89+jp9GcQxw5R/JJdzxy+wpJG/sl+ELBAocdAdwRB+vFawpiN5uZu8aoahrhk0aqtGBEeeCGBoyS/eopnsmXQFP8nJ6iTlVgcXH77Zeg=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.17.31) by
 VI1PR0402MB3791.eurprd04.prod.outlook.com (52.134.15.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 12 Jul 2019 13:02:24 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::a4cb:fecc:3079:494]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::a4cb:fecc:3079:494%4]) with mapi id 15.20.2052.022; Fri, 12 Jul 2019
 13:02:24 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
        "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
Subject: Re: [EXT] Re: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel
 format
Thread-Topic: [EXT] Re: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel
 format
Thread-Index: AQHVN/CgZoYCDAU+vEW4YJIYV1JwU6bGtnSAgAA9wwA=
Date:   Fri, 12 Jul 2019 13:02:24 +0000
Message-ID: <1562936544.9511.25.camel@nxp.com>
References: <1562166911-27454-1-git-send-email-mirela.rabulea@nxp.com>
         <20190711081808.GA15389@aptenodytes> <1562853469.9511.6.camel@nxp.com>
         <20190712092121.GF15882@aptenodytes>
In-Reply-To: <20190712092121.GF15882@aptenodytes>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 592b0de1-e234-4166-92d6-08d706c92f2a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB3791;
x-ms-traffictypediagnostic: VI1PR0402MB3791:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0402MB3791535DE7CE0473320215898FF20@VI1PR0402MB3791.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(36756003)(2351001)(476003)(7416002)(6436002)(66476007)(14454004)(26005)(486006)(2616005)(25786009)(2501003)(11346002)(966005)(5660300002)(478600001)(81156014)(99286004)(81166006)(8936002)(44832011)(91956017)(229853002)(66556008)(8676002)(54906003)(6506007)(102836004)(76116006)(64756008)(86362001)(186003)(6246003)(6486002)(66946007)(76176011)(2906002)(66446008)(316002)(3846002)(68736007)(256004)(6116002)(446003)(103116003)(53936002)(50226002)(71190400001)(5640700003)(4326008)(6916009)(7736002)(19627235002)(6306002)(305945005)(71200400001)(66066001)(6512007)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3791;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 75cOLT3cEBsCOJ2yQIyhxZlkLdpwzaf4WhLViuem20MFzNAI51MD5Ncg/3lF9cJ/HYJL6cWoQSQY6RV9bsNFvAxbqYMWYiZ3o0E/NlUECnCTEeMeOXZGUycm+ewXLHgVJaZ91Qw8i5eCXrqGznZfaJde6JXeaHlxIToozy2r5dTntR3JNE+uW77dVwzckpwQUOE8bUf6my+lg88ZWag53vxhaH5uTvBmD4XEuUkKdaGXF9wsWBnIZJbBT4FPTqLpCBQUrnG+yHuX2xIHyRDp8CNOhU1iaiiOLMi1s6e2yOCydQ2kAOlLkG18sV/RbGCNW4rYmFy5Bn/95qxhvoSZbbwFXxk0TXUNOHtBomw/X4BoQ4rYmKpUMOG3pW/lDiTaxG72FGkfcYzThXa4G5fjJ3pzfRaOlGgipSPrdW6D6aA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D75569C1F0B6BE44B6BE039BB4CDBE19@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592b0de1-e234-4166-92d6-08d706c92f2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 13:02:24.4767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mirela.rabulea@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3791
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVmksIDIwMTktMDctMTIgYXQgMTE6MjEgKzAyMDAsIHBhdWwua29jaWFsa293c2tpQGJvb3Rs
aW4uY29tIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9uIFRodSAxMSBKdWwgMTksIDEzOjU3LCBNaXJl
bGEgUmFidWxlYSB3cm90ZToNCj4gPiANCj4gPiBPbiBKbywgMjAxOS0wNy0xMSBhdCAxMDoxOCAr
MDIwMCwgUGF1bCBLb2NpYWxrb3dza2kgd3JvdGU6DQo+ID4gPiANCj4gPiA+IENhdXRpb246IEVY
VCBFbWFpbA0KPiA+ID4gDQo+ID4gPiBIaSwNCj4gPiA+IA0KPiA+ID4gT24gV2VkIDAzIEp1bCAx
OSwgMTg6MTUsIE1pcmVsYSBSYWJ1bGVhIHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+IFRoZSBhZGRlZCBmb3JtYXQgaXMgVjRMMl9QSVhfRk1UX1lVVjI0LCB0aGlzIGlzIGEgcGFj
a2VkDQo+ID4gPiA+IFlVViA0OjQ6NCBmb3JtYXQsIHdpdGggOCBiaXRzIGZvciBlYWNoIGNvbXBv
bmVudCwgMjQgYml0cw0KPiA+ID4gPiBwZXIgc2FtcGxlLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhp
cyBmb3JtYXQgaXMgdXNlZCBieSB0aGUgaS5NWCA4UXVhZE1heCBhbmQgaS5NWA0KPiA+ID4gPiA4
RHVhbFhQbHVzLzhRdWFkWFBsdXMNCj4gPiA+ID4gSlBFRyBlbmNvZGVyL2RlY29kZXIuDQo+ID4g
PiBTbyB0aGlzIGZvcm1hdCBpcyBub3QgYWxpZ25lZCB0byAzMi1iaXQgd29yZHMgYXQgYWxsIGFu
ZCB3ZSBjYW4NCj4gPiA+IGV4cGVjdA0KPiA+ID4gdG8gc2VlIGNhc2VzIHdoZXJlIGEgc2luZ2xl
IDMyLWJpdCB3b3JkIGNvbnRhaW5zIGRhdGEgZm9yIHR3bw0KPiA+ID4gcGl4ZWxzPw0KPiA+ID4g
DQo+ID4gPiBOb3RoaW5nIHdyb25nIHdpdGggdGhhdCwganVzdCBjaGVja2luZyB3aGV0aGVyIEkg
dW5kZXJzdG9vZCB0aGlzDQo+ID4gPiByaWdodCA6KQ0KPiA+ID4gDQo+ID4gSGkgUGF1bCwNCj4g
PiB5ZXMsIHlvdXIgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0Lg0KPiBPdXQgb2YgY3VyaW9zaXR5
LCBpcyB0aGUgSlBFRyBibG9jayBhc3NtaWxpYXRlZCB0byAob25lIG9mKSB0aGUNCj4gSGFudHJv
IFZQVXMNCj4gb3IgaXMgaXQgYSB0b3RhbGx5IGRpZmZlcmVudCBhbmQgdW5yZWxhdGVkIGhhcmR3
YXJlIGJsb2NrPw0KPiANCj4gQW55d2F5IHRoZSBjaGFuZ2UgbG9va3MgZ29vZCB0byBtZToNCj4g
UmV2aWV3ZWQtYnk6IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGlu
LmNvbT4NCj4gDQo+IENoZWVycywNCj4gDQo+IFBhdWwNCg0KSGkgUGF1bCwNCnRoYW5rcyBmb3Ig
dGFraW5nIHRoZSB0aW1lIHRvIHJldmlldy4NClRoZSBKUEVHIGRlY29kZXIgaXMgYSBzdGFuZGFs
b25lIGNvcmUgJiB3cmFwcGVyLCBub3QgYXNzaW1pbGF0ZWQgdG8gdGhlDQpWUFUuIEl0IGlzIGRl
c2NyaWJlZCBpbiB0aGUgcmVmZXJlbmNlIG1hbnVhbCBoZXJlOg0KaHR0cHM6Ly93d3cubnhwLmNv
bS9kb2NzL2VuL3JlZmVyZW5jZS1tYW51YWwvSU1YOERRWFBSTS5wZGYNCmluIGNoYXB0ZXJzICIx
NS42LjMgSlBFRyBEZWNvZGVyIChKUEVHREVDKSIgYW5kICIxNS42LjUgSlBFRyBEZWNvZGVyDQpX
cmFwcGVyIi4NClRoZSBKUEVHIGNvcmUgaXMgZnJvbSBhIHRoaXJkIHBhcnR5LCBhbmQgdGhlIHdy
YXBwZXIgZnJvbSBOWFAuDQoNClJlZ2FyZHMsDQpNaXJlbGENCg==
