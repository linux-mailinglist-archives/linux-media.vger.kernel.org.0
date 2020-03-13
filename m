Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D3F184226
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 09:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgCMICP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 04:02:15 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:7371
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726310AbgCMICP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 04:02:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDgIAkwYgZN3k2yo8r2LO5wDn/jEK0gVvOintNc+hLiSw5GkFaoT80GDvRyJlWGyWNPowfitKig2MiiWIzFT5QiBcPkME7OuCMbgpnxLW5Puhqi9yJ4Xpvdrt/GFSxSW38/5zvwRxzRgI+5wVQJ+3HCp4dAsmTj9ypIBSh99/BvfrppZY8EE/nZ5IcUShhk5MWWQTkzTlgbOBtT2c4VTHFafQMdsKzCyZWH3THHBiRLE4kWq9tarAmGV2qPcbHIXaHTCTCai4EYsiZsa56AN9eTIBst5plBJmE5lxI+2eEeHlSxpZrzXuoKVq1cCfD9uZbCbyhqSFwoEEBcXTxK20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGC+YQ1cGl513boYqKKNwTKXD3SHCT91/ImlBTTYeOU=;
 b=Th4+FLI1WRiCAmOT0TMWN29Vl+HwKbvzGIbG+N8mNQkJwvc7XRCrMp/gyV6/NazUauG79wmfNqYRg2zG1UfY5bjH5rvdiPwyS7qpmIywOCb3D2Fd3xniMECFNuzAzvlquYCvGsQiEvbRTwGE+3BM1wFPA/UX9WTIIpjrtF6yqJqJ0q66oNeNs6CNvAYNBOE7RpYb//y4mByyppuNcSTY1ZdjfrJJPJHUin7DVNwndkyK57rIWqcJiXwUXpzrmHemQ+l4ALuO/tI5uT/+KwFQ5xUWPR6l9i0DYo2p2SR01GfuQ638iFWcqwlF2qLTSeIUjf/xOMaztQUXnSyH+IkYAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGC+YQ1cGl513boYqKKNwTKXD3SHCT91/ImlBTTYeOU=;
 b=bWVIs5/8H3LQKgmkiQCwdaYLBfCwov/uWvh3oI+RCuP72mcpKAVoxmVsdKz4ufBQ57/MhAg3rnpONy+H8OSdQFe2G12GvQDD0qtQJ+XEaYYVrPv8S8z4EXBc4NMrgZEjIRN43YgFDwIXwr7QiOvltrOXsM/lJmcRKXdhQ3O+eRo=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB3030.jpnprd01.prod.outlook.com (52.134.252.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Fri, 13 Mar 2020 08:02:08 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 08:02:08 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Thread-Index: AQHV+LMHriTg1O9fLki5YHCWHclgDahFfJwAgAABE5CAABWjgIAAldMw
Date:   Fri, 13 Mar 2020 08:02:08 +0000
Message-ID: <OSBPR01MB35902AAC382503C40DEF929BAAFA0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1584047552-20166-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1584047552-20166-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUgMHjU_ZANzJbxQji6K7Pdc-jD4C7JatQc-OtN=jJt_w@mail.gmail.com>
 <OSBPR01MB3590906C6121D1DFFF4ABF0DAAFD0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
 <20200312230253.GB30932@pendragon.ideasonboard.com>
In-Reply-To: <20200312230253.GB30932@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a83edc62-e307-419b-2e97-08d7c724d410
x-ms-traffictypediagnostic: OSBPR01MB3030:
x-microsoft-antispam-prvs: <OSBPR01MB303015D3EC32A7729D085277AAFA0@OSBPR01MB3030.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(199004)(186003)(54906003)(81156014)(81166006)(52536014)(8676002)(86362001)(6506007)(8936002)(4326008)(316002)(76116006)(9686003)(53546011)(26005)(478600001)(33656002)(5660300002)(7696005)(64756008)(2906002)(66946007)(66556008)(55016002)(66476007)(66446008)(71200400001)(7416002)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3030;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ncvwFHQ5TQSRUaroFJON4z6cKvqNTenY7XTuorh6WA3p8W7GzQ9ZkJHewufZ3wjcJzqDKfhkLP36C7oz7YymU+Ihh49JgwtQaUJl5XLfqtEeSlpMzgOnH6clGeNCW2PMnttY0Ll19W6skOtNRfZO5BMg3QxY4cAgqlben6bFMfoHMyXcSdvh1sPI/2xoFFv3Fsu6NbDzMaiQRRV5dVPVN67Wrl0IFjTYaw9/rvMrb9kWhCe0p+t/EXvJ38BmgnWGv9PZf6Dkql5l7MU0NpedPmMg+e40bKsqVZCmu8tTR5ZC7yJfjelPJImlxx+Oho+BRU3Vij7HNv30SE/PSoCzZW9CcIt2sDRG4mUTtVE/yIPkMd7ERIX9xK5Arj35PL+SmEO/bK58CQqPVl8+2eF+0eccn6RtBVxYxm7mh6dn1HGmG/5v4TGzRfgdnWD/b6tC
x-ms-exchange-antispam-messagedata: qboE3iUMMH77kFz6r/WJhjlGlE2t2WKFbwtumd7qn+OSgzCkbuBIhrFYCrQ97z/zdZgLke6kfIyEvuqmm76lIMmrmnP0bxRmngLuIqBNw2lN/P6KnHI6bLYs6PugZlE+cbsznYuH70l9dPLRkIkD0w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83edc62-e307-419b-2e97-08d7c724d410
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 08:02:08.5385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nxvYeIKEhjNZ+4FKeHQldQpO8syyHEQiBhIHVdWHWVMttoJXXRkMZZs26w/6Jvg6+TaR4U0psbQbLvMrI22Pf6nNJ4U18QVM2G7Y6TMvmhaI5m9SH9ffgTUZzLLpbRaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3030
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogMTIgTWFyY2ggMjAyMCAyMzowMw0KPiBUbzog
UHJhYmhha2FyIE1haGFkZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+DQo+IENjOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPjsg
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiDQo+IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBTaGF3biBHdW8g
PHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGENCj4gSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4LmRl
PjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IE1hcmsNCj4gUnV0bGFuZCA8bWFy
ay5ydXRsYW5kQGFybS5jb20+OyBTYWthcmkgQWlsdXMNCj4gPHNha2FyaS5haWx1c0BsaW51eC5p
bnRlbC5jb20+OyBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+Ow0KPiBNYWdudXMg
RGFtbSA8bWFnbnVzLmRhbW1AZ21haWwuY29tPjsgRXplcXVpZWwgR2FyY2lhDQo+IDxlemVxdWll
bEBjb2xsYWJvcmEuY29tPjsgb3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRA0K
PiBERVZJQ0UgVFJFRSBCSU5ESU5HUyA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBMaW51
eCBLZXJuZWwgTWFpbGluZw0KPiBMaXN0IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsg
TGludXgtUmVuZXNhcyA8bGludXgtcmVuZXNhcy0NCj4gc29jQHZnZXIua2VybmVsLm9yZz47IEZh
YmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IExpbnV4IEFSTQ0KPiA8bGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsgTGludXggTWVkaWEgTWFpbGluZyBMaXN0IDxs
aW51eC0NCj4gbWVkaWFAdmdlci5rZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYy
IDIvM10gbWVkaWE6IGkyYzogb3Y1NjQ1OiBTd2l0Y2ggdG8gYXNzaWduZWQtY2xvY2stDQo+IHJh
dGVzDQo+DQo+IEhpIFByYWJoYWthciwNCj4NCj4gT24gVGh1LCBNYXIgMTIsIDIwMjAgYXQgMDk6
NTI6MzhQTSArMDAwMCwgUHJhYmhha2FyIE1haGFkZXYgTGFkIHdyb3RlOg0KPiA+IE9uIDEyIE1h
cmNoIDIwMjAgMjE6NDIsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+IE9uIFRodSwg
TWFyIDEyLCAyMDIwIGF0IDEwOjEzIFBNIExhZCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4gPiA+IFRo
aXMgcGF0Y2ggc3dpdGNoZXMgdG8gYXNzaWduZWQtY2xvY2stcmF0ZXMgZm9yIHNwZWNpZnlpbmcg
dGhlIGNsb2NrIHJhdGUuDQo+ID4gPiA+IFRoZSBjbGstY29uZi5jIGludGVybmFsbHkgaGFuZGxl
cyBzZXR0aW5nIHRoZSBjbG9jayByYXRlIHdoZW4NCj4gPiA+ID4gYXNzaWduZWQtY2xvY2stcmF0
ZXMgaXMgcGFzc2VkLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgZHJpdmVyIG5vdyBzZXRzIHRoZSBj
bG9jayBmcmVxdWVuY3kgb25seSBpZiB0aGUgZGVwcmVjYXRlZA0KPiA+ID4gPiBwcm9wZXJ0eSBj
bG9jay1mcmVxdWVuY3kgaXMgZGVmaW5lZCBpbnN0ZWFkIGFzc2lnbmVkLWNsb2NrLXJhdGVzLA0K
PiA+ID4gPiB0aGlzIGlzIHRvIGF2b2lkIGJyZWFrYWdlIHdpdGggZXhpc3RpbmcgRFQgYmluYXJp
ZXMuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXINCj4gPiA+
ID4gPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4g
PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+ID4gPg0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL2kyYy9vdjU2NDUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDUu
Yw0KPiA+ID4gPiBAQCAtMTA1NSw2ICsxMDU1LDcgQEAgc3RhdGljIGludCBvdjU2NDVfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQNCj4gKmNsaWVudCkNCj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgZGV2
aWNlX25vZGUgKmVuZHBvaW50Ow0KPiA+ID4gPiAgICAgICAgIHN0cnVjdCBvdjU2NDUgKm92NTY0
NTsNCj4gPiA+ID4gICAgICAgICB1OCBjaGlwX2lkX2hpZ2gsIGNoaXBfaWRfbG93Ow0KPiA+ID4g
PiArICAgICAgIGJvb2wgc2V0X2NsayA9IGZhbHNlOw0KPiA+ID4gPiAgICAgICAgIHVuc2lnbmVk
IGludCBpOw0KPiA+ID4gPiAgICAgICAgIHUzMiB4Y2xrX2ZyZXE7DQo+ID4gPiA+ICAgICAgICAg
aW50IHJldDsNCj4gPiA+ID4gQEAgLTEwOTQsMTAgKzEwOTUsMTcgQEAgc3RhdGljIGludCBvdjU2
NDVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQNCj4gPiA+ICpjbGllbnQpDQo+ID4gPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gUFRSX0VSUihvdjU2NDUtPnhjbGspOw0KPiA+ID4gPiAgICAgICAg
IH0NCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihk
ZXYtPm9mX25vZGUsICJjbG9jay1mcmVxdWVuY3kiLA0KPiA+ID4gJnhjbGtfZnJlcSk7DQo+ID4g
PiA+ICsgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAiYXNz
aWduZWQtY2xvY2stDQo+IHJhdGVzIiwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmeGNsa19mcmVxKTsNCj4gPiA+ID4gICAgICAgICBpZiAocmV0KSB7DQo+ID4g
Pg0KPiA+ID4gSSB0aGluayB5b3UgY2FuIGp1c3QgbGVhdmUgb3V0IHRoZSBhYm92ZSBjaGVjay4u
Lg0KPiA+ID4NCj4gPiA+ID4gLSAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiY291bGQgbm90
IGdldCB4Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gPiA+IC0gICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgLyogY2hlY2sgaWYgZGVwcmVjYXRlZCBwcm9w
ZXJ0eSBjbG9jay1mcmVxdWVuY3kgaXMgZGVmaW5lZCAqLw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAiY2xvY2stDQo+IGZy
ZXF1ZW5jeSIsDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAmeGNsa19mcmVxKTsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4g
PiA+DQo+ID4gPiAuLi4gYW5kIGlnbm9yZSB0aGUgYWJzZW5jZSBvZiB0aGUgZGVwcmVjYXRlZCBw
cm9wZXJ0eS4NCj4gPiA+DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiY291bGQgbm90IGdldCB4Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICB9DQo+
ID4gPiA+ICsgICAgICAgICAgICAgICBzZXRfY2xrID0gdHJ1ZTsNCj4gPiA+DQo+ID4gPiBJLmUu
IGp1c3QNCj4gPiA+DQo+ID4gPiAgICAgICAgIC8qIGNoZWNrIGlmIGRlcHJlY2F0ZWQgcHJvcGVy
dHkgY2xvY2stZnJlcXVlbmN5IGlzIGRlZmluZWQgKi8NCj4gPiA+ICAgICAgICAgeGNsa19mcmVx
ID0gMDsNCj4gPiA+ICAgICAgICAgb2ZfcHJvcGVydHlfcmVhZF91MzIoZGV2LT5vZl9ub2RlLCAi
Y2xvY2stZnJlcXVlbmN5IiwNCj4gJnhjbGtfZnJlcSk7DQo+ID4gPiAgICAgICAgIGlmICh4Y2xr
X2ZyZXEpIHsNCj4gPiA+ICAgICAgICAgICAgICAgICByZXQgPSBjbGtfc2V0X3JhdGUob3Y1NjQ1
LT54Y2xrLCB4Y2xrX2ZyZXEpOw0KPiA+ID4gICAgICAgICAgICAgICAgIGlmIChyZXQpIHsNCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiY291bGQgbm90IHNldCB4
Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ID4gICAgICAgICAgICAgICAgIH0NCj4gPiA+ICAgICAgICAgfSBlbHNlIHsNCj4g
PiA+ICAgICAgICAgICAgICAgICB4Y2xrX2ZyZXEgPSBjbGtfZ2V0X3JhdGUob3Y1NjQ1LT54Y2xr
LCB4Y2xrX2ZyZXEpOw0KPiA+ID4gICAgICAgICB9DQo+ID4gPg0KPiA+IEkgZGlkIHRoaW5rIGFi
b3V0IGl0IGluaXRpYWxseSwgYnV0IHJlYWxpemVkIHRoZSBjbGtfZ2V0X3JhdGUgbWF5IHZhcnkN
Cj4gPiBwbGF0Zm9ybSB0byBwbGF0Zm9ybSBmb3IgZXhhbXBsZSBpbiBHMkUgY2xrX2dldF9yYXRl
KCkgcmV0dXJucyBhDQo+ID4gZnJlcXVlbmN5IG9mIDI0MjQyNDI0IHdpdGggYXNzaWduZWQtY2xv
Y2stcmF0ZXMgc2V0IHRvICAyNDAwMDAwMCBhbmQNCj4gPiBwcm9iZSB3b3VsZCBmYWlsIGR1ZSB0
byBhIGNoZWNrIGZvciBleHRlcm5hbCBjbG9jayBtdXN0IGJlIDI0TUh6LCB3aXRoIDElDQo+IHRv
bGVyYW5jZS4NCj4NCj4gVGhlbiB5b3UgbmVlZCB0byBoYW5kbGUgdGhlIHRvbGVyYW5jZSBpbiB0
aGlzIGRyaXZlciA6LSkNCj4NClN1cmUgSSB3aWxsIGluY3JlYXNlIHRoZSB0b2xlcmFuY2UgaGVy
ZS4NCg0KQ2hlZXJzLA0KLS1QcmFiaGFrYXINCg0KPiA+ID4gPiAgICAgICAgIH0NCj4gPiA+ID4N
Cj4gPiA+ID4gICAgICAgICAvKiBleHRlcm5hbCBjbG9jayBtdXN0IGJlIDI0TUh6LCBhbGxvdyAx
JSB0b2xlcmFuY2UgKi8gQEANCj4gPiA+ID4gLTExMDcsMTAgKzExMTUsMTIgQEAgc3RhdGljIGlu
dCBvdjU2NDVfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiAgICAgICAgIH0NCj4gPiA+ID4NCj4g
PiA+ID4gLSAgICAgICByZXQgPSBjbGtfc2V0X3JhdGUob3Y1NjQ1LT54Y2xrLCB4Y2xrX2ZyZXEp
Ow0KPiA+ID4gPiAtICAgICAgIGlmIChyZXQpIHsNCj4gPiA+ID4gLSAgICAgICAgICAgICAgIGRl
dl9lcnIoZGV2LCAiY291bGQgbm90IHNldCB4Y2xrIGZyZXF1ZW5jeVxuIik7DQo+ID4gPiA+IC0g
ICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4gPiArICAgICAgIGlmIChzZXRfY2xrKSB7
DQo+ID4gPiA+ICsgICAgICAgICAgICAgICByZXQgPSBjbGtfc2V0X3JhdGUob3Y1NjQ1LT54Y2xr
LCB4Y2xrX2ZyZXEpOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNvdWxkIG5vdCBzZXQgeGNs
ayBmcmVxdWVuY3lcbiIpOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgICAgICAg
IH0NCj4gPiA+ID4NCj4gPiA+ID4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgT1Y1NjQ1X05VTV9T
VVBQTElFUzsgaSsrKQ0KPg0KPiAtLQ0KPiBSZWdhcmRzLA0KPg0KPiBMYXVyZW50IFBpbmNoYXJ0
DQoNCg0KUmVuZXNhcyBFbGVjdHJvbmljcyBFdXJvcGUgR21iSCwgR2VzY2hhZWZ0c2Z1ZWhyZXIv
UHJlc2lkZW50OiBDYXJzdGVuIEphdWNoLCBTaXR6IGRlciBHZXNlbGxzY2hhZnQvUmVnaXN0ZXJl
ZCBvZmZpY2U6IER1ZXNzZWxkb3JmLCBBcmNhZGlhc3RyYXNzZSAxMCwgNDA0NzIgRHVlc3NlbGRv
cmYsIEdlcm1hbnksIEhhbmRlbHNyZWdpc3Rlci9Db21tZXJjaWFsIFJlZ2lzdGVyOiBEdWVzc2Vs
ZG9yZiwgSFJCIDM3MDggVVN0LUlETnIuL1RheCBpZGVudGlmaWNhdGlvbiBuby46IERFIDExOTM1
MzQwNiBXRUVFLVJlZy4tTnIuL1dFRUUgcmVnLiBuby46IERFIDE0OTc4NjQ3DQo=
