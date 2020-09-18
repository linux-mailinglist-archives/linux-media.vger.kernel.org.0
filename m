Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05AB26EA97
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 03:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIRBmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 21:42:20 -0400
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:50585
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgIRBmU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 21:42:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiTEyzudXxnaJoWzUvVwnoD4cKxfV6BWGe1Rzqh13G8ZzSAEBy+82H+voC+yLwUFSSshu9YpoNFNmjOcrx+a03dl0Vxpyd6BzehGcEcxIoKIO8nmJ2WXqfwEks08Vp40epCysZvvcCPte2BP3NpGoeiomhcZuyc1h1Tdpkz4zqTxerMAq10OkHbTGN0/C1/l1MEJZ+RMNl6ORRdGJHmS6E94XYhfA8qOePKeXmEWE82KTMNAf9Hht7N2L6caTUOJF+pxuYqsDfeki1guYw0tv9w4eIr+Bzl+RvKKpcLQgeq5eGTQv/1iFXckjFL6daedY+wJuxgmTVgnaOoZX2tD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YVSwsLZMV9wdqqWRG/9sCj2q3LHbmFBuJrlwDffP1o=;
 b=MrbASPV3kETw3S5qLQMlbdtfxZdo6hGnnEVLkonqvMmKS/d3GirXt6s8FkziaJimfSmsr0oYWJdWWs+e3vASQrPNQaL5rkLLPMUTc/L3ck3ffYib0HUXsPaK96cpayOnMRRm8XvFEnGcKetTwXha1gXqn/orSOxwA3Uz7+fynw7yy9WfePUk7eXfY50ZbZ0ohOY6TUWO7RaogCWh1AEWvD6Guzby4zABteWCW1uOpeSWsyr7tnZugFYKE9v5Pw6Wr7wOhQanAH8uC/+MkH964bDIUENOKVFlIVJImWmI/k4wYOLbWMppipPZs4QQZQQOnVxS3Xtl7vvuDcR1oFG17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YVSwsLZMV9wdqqWRG/9sCj2q3LHbmFBuJrlwDffP1o=;
 b=qdeXDmUPrOelUxMmXWk3xA2KFzw3oXi246g/nCCnIHu7L8sojzm7rVnbxZwK1d5PeN1xlPAWlTjajMJHl/cXfLnt2GlRyPtgr5bEPVgwwA7nC2J8zoo2TI0RX6bOdDuU3p3coSGw6qIn30QZbxUcpisQ8Sn31p7jTP4UUaTYZVM=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB4956.eurprd04.prod.outlook.com (2603:10a6:10:1a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 18 Sep
 2020 01:42:15 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 01:42:15 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Topic: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Index: AQHWiy4MW1TKQEfe6k2eA6q7pgHUfqlpcD0AgAMT72CAAMvlAIAASn5g
Date:   Fri, 18 Sep 2020 01:42:15 +0000
Message-ID: <DB8PR04MB6795D5228426C7D93AF08081E63F0@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
 <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
 <20200917204336.GA21441@gofer.mess.org>
In-Reply-To: <20200917204336.GA21441@gofer.mess.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 31db0557-8dbb-40d5-7ec5-08d85b74122f
x-ms-traffictypediagnostic: DB7PR04MB4956:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB495610DA9001F23BDA02BE9CE63F0@DB7PR04MB4956.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iyGmn+zeQ4M9xgbY3pRPWaX961g8eHwPYpnBsl5r4dMZmdm9WFBbiRcamoE7p8bV6FqjLwdrHSszrtvuV39TymSU+2oeafzQvz59Eji7RI4E4qGqJru7XHDTwGB9u7FiHo7YhdwweHqIKlvkzpvctYp4pqC7SFU/hqnwhlq49M0u+tX91oZ2xTgc//shENiTXqlHsExtB2JzrvJnOYbJc1RKGrszfzexsXyAbChq9dN7gDzTVHQF+CQ+RMiMJMeRMz8RPvcdIOKjdouJWyPliFBINJGzoRzhBMOxRRUHU5rYNlai4bjUyuhb3hZI3OYE3wlNwJQJWJSgVq6lr5ZrkA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(86362001)(6916009)(33656002)(66476007)(64756008)(66946007)(76116006)(66556008)(26005)(8676002)(9686003)(71200400001)(66446008)(2906002)(6506007)(316002)(54906003)(478600001)(186003)(4326008)(8936002)(53546011)(52536014)(55016002)(7696005)(5660300002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 0UUDD8fRM9Q/ei8dZW1l6W/ofuWrh9zaMKICh9yVd3ipNfm5Hd6pZCsfC8Tc0KErci3q7BFHXssm2GlJ+Wr/wPL3kerqsWAJEstuAu1CGA9PZUeFY8AC8MBysbo0H0jpU+BB5ygXw2hq0E6CNwajR+pBTq/KbrvowEgzaMhFobl7T7tHSl9o5JESeWD7sQlxIcEeQjaO6X4sgnkrjlUuIdd5edxM+Mt7OEl+ot2xbC5I/Ouk0c3hT06069c9lLTGjywOfdi6zYd7RjwN2mcKX+CW7zgGTRh7FGcsj/Rr0ck+5TwdtrKW3ifP9xjdBksYHeDWANTUZTRsS4Yr3UEpmz1UFJ68inYxCFfXeR/nMXSflAfzUX9ia+bH7FH7l+9Rz7F8btMkXh9mg39GNbEb7Ei9Y3g7fZxIkDAOB3O2+b0N3PFHqq9YDph+YO5KxAlIgG0MAJjPcsZBowXkcpsUkHWitKH5GJd5az2UAAw9onRoc8Ibt5XW9lBjralhLZJ8YRz3RgLsHYid9qzdoDE7U4oC0axoiLuT6UDiuCPGZwbjaIZnGaexAwdrvgO8v2DBETASD60HRpqbvBcMPD8cVqIMJu+3JWcp2c3z0fCNvox0mWYPPWHuXcN1D5w+BOPMLHWomiywMalqPKii22Y+7A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31db0557-8dbb-40d5-7ec5-08d85b74122f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 01:42:15.1186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0c+sdiYyIeLo+WiioRSPqd5njvp/c38gIPMp2ia8HnYQbs195Tgll0Y8O4Rr8XASsEWZDfmoLSN6A1ieBps1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4956
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIaSBTZWFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlYW4g
WW91bmcgPHNlYW5AbWVzcy5vcmc+DQo+IFNlbnQ6IDIwMjDlubQ55pyIMTjml6UgNDo0NA0KPiBU
bzogSm9ha2ltIFpoYW5nIDxxaWFuZ3FpbmcuemhhbmdAbnhwLmNvbT4NCj4gQ2M6IG1jaGVoYWJA
a2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIXSBtZWRpYTogcmM6IGdwaW8taXItcmVjdjogYWRkIFFvUyBzdXBwb3J0
IGZvciBjcHVpZGxlDQo+IHN5c3RlbQ0KPiANCj4gSGkgSm9ha2ltLA0KPiANCj4gT24gVGh1LCBT
ZXAgMTcsIDIwMjAgYXQgMDk6MTI6MzJBTSArMDAwMCwgSm9ha2ltIFpoYW5nIHdyb3RlOg0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogU2VhbiBZb3Vu
ZyA8c2VhbkBtZXNzLm9yZz4NCj4gPiA+IFNlbnQ6IDIwMjDlubQ55pyIMTXml6UgMTc6MzQNCj4g
PiA+IFRvOiBKb2FraW0gWmhhbmcgPHFpYW5ncWluZy56aGFuZ0BueHAuY29tPg0KPiA+ID4gQ2M6
IG1jaGVoYWJAa2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4g
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhw
LmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIG1lZGlhOiByYzogZ3Bpby1pci1yZWN2
OiBhZGQgUW9TIHN1cHBvcnQgZm9yDQo+ID4gPiBjcHVpZGxlIHN5c3RlbQ0KPiA+ID4NCj4gPiA+
DQo+ID4NCj4gPiBbLi4uXQ0KPiA+ID4gPiBAQCAtOTIsNiArMTEzLDEyIEBAIHN0YXRpYyBpbnQg
Z3Bpb19pcl9yZWN2X3Byb2JlKHN0cnVjdA0KPiA+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gPiA+DQo+ID4gPiA+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZ3Bpb19kZXYp
Ow0KPiA+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3Bl
bmRfZGVsYXkoZGV2LCAocmNkZXYtPnRpbWVvdXQgLyAxMDAwIC8NCj4gPiA+ID4gKzEwMDApKTsN
Cj4gPiA+DQo+ID4gPiByY2Rldi0+dGltZW91dCBpcyBpbiBtaWNyb3NlY29uZHMgKHNpbmNlIHZl
cnkgcmVjZW50bHkpLCBzbyB0aGlzIGlzIHdyb25nLg0KPiA+ID4gQWxzbywgdGhlIHRpbWVvdXQg
Y2FuIGJlIGNoYW5nZWQgdXNpbmcgdGhlIExJUkNfU0VUX1JFQ19USU1FT1VUDQo+ID4gPiBpb2N0
bCAodXNpbmcgaXItY3RsIC10IGluIHVzZXJzcGFjZSkuIFRoZSBhdXRvc3VzcGVuZCBkZWxheSBz
aG91bGQNCj4gPiA+IGJlIHVwZGF0ZWQgd2hlbiB0aGlzIGhhcHBlbnMuIFRoaXMgY2FuIGJlIGRv
bmUgYnkgaW1wbGVtZW50aW5nIHRoZQ0KPiBzX3RpbWVvdXQgcmNkZXYgZnVuY3Rpb24uDQo+ID4N
Cj4gPiBIaSBTZWFuLA0KPiA+DQo+ID4gSSBjb21lIGFjcm9zcyBhIHByb2JsZW0gd2hlbiBpbXBs
ZW1lbnRpbmcgdGhpcyBmZWF0dXJlLg0KPiA+DQo+ID4gQXQgcHJvYmUgc3RhZ2UsIGRldm1fcmNf
cmVnaXN0ZXJfZGV2aWNlIC0+IGNoYW5nZV9wcm90b2NvbCwgdGhlbiB0aW1lb3V0DQo+IHNldCB0
byAxMjVtcy4NCj4gPg0KPiA+IFdoZW4gZWNobyBzb255IG9yIG5lYyB0byBwcm90b2NvbHMsIHdp
bGwgY2FsbCBjaGFuZ2VfcHJvdG9jb2wgY2hhbmdpbmcgdGhlDQo+IHRpbWVvdXQgdmFsdWUsIHRo
YXQgdGltZW91dCB3b3VsZCBjaGFuZ2UgdG8gaGFuZGxlci0+bWluX3RpbWVvdXQgKyAxMG1zLg0K
PiBGb3Igc29ueSBpcyAxNjAwMDAwMG5zLCBmb3IgMTU2MjUwMDBucy4NCj4gDQo+IFRoZSBzb255
IHByb3RvY29sIGRlY29kZXIgd2FudHMgYSA2bXMgc3BhY2UgYWZ0ZXIgdGhlIGxhc3QgYml0LiBT
bywgdGhlIHRpbWVvdXQNCj4gZm9yIHRoZSBJUiByZWNlaXZlciBjYW4gYmUgc2V0IHRvIDZtcyAo
cGx1cyAxMG1zIG1hcmdpbikuIFRoaXMgaGFzIHRoZQ0KPiBhZHZhbnRhZ2UgdGhhdCBkZWNvZGlu
ZyBpcyBoYXBwZW5zIHZlcnkgcXVpY2tseS4gQmVmb3JlIHRoaXMgY2hhbmdlLCB0aGVyZSBhcyBh
DQo+IDEyNW1zIGRlbGF5IGJlZm9yZSB0aGUgZmlyc3QgYW5kIGxhc3QgSVIgZnJhbWUgd2FzIGRl
Y29kZWQuIFRoaXMgY2F1c2VzDQo+IGRlY29kaW5nIHRvIGZlZWwgbGFnZ3kgYW5kIGtleXMgYWxz
byBhIGJpdCBzdGlja3kuDQoNClllcywgSSBjYW4gdW5kZXJzdGFuZCB0aGlzLCBlYWNoIElSIHBy
b3RvY29scyBoYXZlIHRoZWlyIG93biB0aW1lb3V0LCB0aGlzIGlzIHJlYXNvbmFibGUuDQoNCg0K
PiA+IFRoaXMgaXMgbm90IHRoZSB3YXkgSSB3YW50IHRvIHRha2UgYmVmb3JlLCB0aGlzIHdvdWxk
IGZyZXF1ZW50bHkgZGlzYWJsZS9lbmFibGUNCj4gY3B1aWRsZS4gU28gaXMgaXQgbmVjZXNzYXJ5
IHRvIHByb3ZpZGUgc190aW1lb3V0LCB0aGlzIGNhbGxiYWNrIHNob3VsZCBiZSB1c2VkIHRvDQo+
IGNoYW5nZSBwcm90b2NvbHMnIHRpbWVvdXQ/DQo+ID4gSWYgaW1wbGVtZW50IHNfdGltZW91dCwg
dXNlcnMgbmVlZCBjaGFuZ2UgdGhlIHRpbWVvdXQgdmFsdWUgZnJvbQ0KPiB1c2Vyc3BhY2UsIHRo
aXMgaXMgYSBtYW5kYXRvcnkgb3BlcmF0aW9uIGFuZCB1bmZyaWVuZGx5LiBBbmQgaXQgd2lsbCBh
ZmZlY3QNCj4gcHJvdG9jb2wncyB0aW1lb3V0Lg0KPiA+DQo+ID4gQXV0b3N1c3BlbmQgZGVsYXkg
c2hvdWxkIGJlIGZpeGVkIHZhbHVlLCBzaG91bGQgYmUgc2V0IHRvIGdwaW8gZGV2aWNlIHRpbWVv
dXQNCj4gdmFsdWUsIHdoaWNoIGlzIDEyNW1zLg0KPiANCj4gU28gdGhlIGlkZWEgd2FzIHRoYXQg
Y3B1aWRsZSBpcyBvbmx5IGVuYWJsZWQgd2hpbGUgSVIgZnJhbWVzIGFyZSBiZWluZyByZWNlaXZl
ZCwNCj4gdGhhdCdzIHdoeSBJIHN1Z2dlc3RlZCBpdC4NCg0KTWF5IGJlIGEgdHlwbywgImNwdWlk
bGUgaXMgb25seSBESVNBQkxFRCB3aGlsZSBJUiBmcmFtZXMgYXJlIGJlaW5nIHJlY2VpdmUsIiwg
dGhpcyBpcyBub3QgSSB3YW50IHRvIGltcGxlbWVudCwgZXhwZXJpbWVudHMgaGF2ZSBhbHNvIHNo
b3duIHBvb3IgcmVzdWx0cy4NCg0KPiBJZiB5b3Ugc2V0IHRoZSBhdXRvc3VzcGVuZCBkZWxheSB0
byAxMjVtcywgdGhlbiB0aGUgY3B1aWRsZSB3aWxsIG5vdCBiZSBlbmFibGVkDQo+IGJldHdlZW4g
SVIgZnJhbWVzLiBNYXliZSB0aGlzIGlzIHdoYXQgeW91IHdhbnQsIGJ1dCBpdCBkb2VzIG1lYW4g
Y3B1aWRsZSBpcw0KPiB0b3RhbGx5IHN1c3BlbmRlZCB3aGlsZSBhbnlvbmUgaXMgcHJlc3Npbmcg
YnV0dG9ucyBvbiBhIHJlbW90ZS4NCg0KWWVzLCB0aGlzIGlzIHdoYXQgSSB3YW50LCBjcHVpZGxl
IGlzIHRvdGFsbHkgZGlzYWJsZWQgd2hpbGUgcHJlc3NpbmcgYnV0dG9ucywgZGlzYWJsZSBjcHVp
ZGxlIGF0IHRoZSBmaXJzdCBmcmFtZSB0aGVuIGtlZXAgZGlzYWJsZWQgdW50aWwgdGhlcmUgaXMg
bm8gYWN0aXZpdHkgZm9yIGEgd2hpbGUuDQpTbyB0aGF0IHdlIG9ubHkgY2FuIG5vdCBkZWNvZGUg
dGhlIGZpcnN0IGZyYW1lLCBzdWNoIGFzLCBpZiB0cmFuc21pdHRpbmcgNCBmcmFtZXMgb25jZSwg
d2UgY2FuIGNvcnJlY3RseSBkZWNvZGUgMyB0aW1lcy4NCg0KSSBhbHNvIHRyeSB5b3VyIHN1Z2dl
c3Rpb24sIHNldCBhdXRvc3VzcGVuZCBkZWxheSB0aW1lIHRvIHByb3RvY29sJ3MgdGltZW91dCB2
YWx1ZSwgYnV0IHRoZSByZXN1bHQgaXMgdGVycmlibGUuIElmIHRyYW5zbWl0dGluZyA0IGZyYW1l
cyBvbmNlLCB3ZSBjYW4ndCBjb3JyZWN0bHkgZGVjb2RlIDMgdGltZXMsDQpldmVuIGNhbid0IGRl
Y29kZSBpdCBzb21ldGltZS4gVGhlIHNlcXVlbmNlIGlzLCBjcHUgaW4gaWRsZSBzdGF0ZSB3aGVu
IHRoZSBmaXJzdCBmcmFtZSBjb21pbmcsIHRoZW4gZGlzYWJsZSBjcHUgaWRsZSB1bnRpbCBwcm90
b2NvbHMnIHRpbWVvdXQsIGNwdSBpbiBpZGxlIHN0YXRlIGFnYWluLCB0aGUgZmlyc3QgZnJhbWUg
Y2FuJ3QgYmUgZGVjb2RlZC4NClRoZSBzZWNvbmQgZnJhbWUgY29taW5nLCBpdCB3aWxsIHJlcGVh
dCB0aGUgYmVoYXZpb3Igb2YgdGhlIGZpcnN0IGZyYW1lLCBtYXkgY2F1c2UgdGhlIHNlY29uZCBm
cmFtZSBjYW4ndCBiZSBkZWNvZGUuLi4uLi4NCg0KQ2FuIHlvdSB0YWtlIGFjY291bnQgb2YgSSBo
YXZlIGRvbmUgaW4gdGhlIGZpcnN0IHZlcnNpb24sIGF1dG9zdXNwZW5kIGRlbGF5IHRpbWUgaXMg
c2V0IHRvIDEyNW1zPw0KDQo+IFRoYW5rcw0KPiBTZWFuDQo+IA0KPiA+DQo+ID4gQmVzdCBSZWdh
cmRzLA0KPiA+IEpvYWtpbSBaaGFuZw0KPiA+ID4gPiArCXBtX3J1bnRpbWVfdXNlX2F1dG9zdXNw
ZW5kKGRldik7DQo+ID4gPiA+ICsJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKGRldik7DQo+ID4g
PiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgCXJldHVy
biBkZXZtX3JlcXVlc3RfaXJxKGRldiwgZ3Bpb19kZXYtPmlycSwgZ3Bpb19pcl9yZWN2X2lycSwN
Cj4gPiA+ID4gIAkJCQlJUlFGX1RSSUdHRVJfRkFMTElORyB8IElSUUZfVFJJR0dFUl9SSVNJTkcs
DQo+ID4gPiA+ICAJCQkJImdwaW8taXItcmVjdi1pcnEiLCBncGlvX2Rldik7DQo=
