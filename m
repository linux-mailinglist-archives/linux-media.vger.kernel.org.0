Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 577E334B7AA
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 15:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231289AbhC0O3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 10:29:33 -0400
Received: from mail-db8eur05on2084.outbound.protection.outlook.com ([40.107.20.84]:47406
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231278AbhC0O3b (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 10:29:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvoZU5lx3CAuEkBiUTV4ve717fNIsWsU62isy4QnPEY2ZVMlG8gsqsNbip+hveCi4C2RW0upNWaF4bm98nXyqUCNEn8HfpS4AZ3lFGrPfgMljb4IycxqQMVxQhR6MC0g9QXfNK3o/wisw/5VZ5WCGPyEvaA/S3GTmvXPkYHTmbmelui+GDGsZ2nTcI0rrcKJUHZA1YnE16xUchAuBPYyVuO/Q4dxmHrGCzwnecwyFRRTWUAtP/ymp97HBnf+7ifFk1XayovTuHO+SmFRGobYQXnDKfoEqMOa9h7rE4JM7sBBMmI/dcafqmN1PBPS3ZaIpbdafG0v30FhJCdyLPc3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Rcdho2XOLieA1C6HuBOH3vWRA4LIIlLLIA1JS6C5k=;
 b=ocl1NYokwZPG31uoc6x2Gg9yeXFFHOPVxw0ELXqH3TylFeJlQLjLHdWdsQ+bVH411w444rmzO+z3UOSKzLfH+0x5KhL93ebRPKs/aX+7bWRqfS/exiy+sZOeD4RH7R6IoaZ1XqEduQwZAklSvoKSC9+Q+ikZv4vl57jF5ql7LFd7b8+hXzL2eVIn9QpfyiGnFx5ou1emzaxgCEyLCYzFthyiQ7XmtHXnf4wZbpIp0e0gKZ1E90z7Bcgp6HiHimWJUpCAWp+4fQnZir8UN/s5TWn41Nue6fA6wr6GnAE8MApEaFez2ZAh3CNvkMJmZDqzNGZM1xFJ8s3jkoyOyNcmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05Rcdho2XOLieA1C6HuBOH3vWRA4LIIlLLIA1JS6C5k=;
 b=IfrnPY7ryYtRxfs8T3mD5j7Gknw4ITvr+3SqSSZ32PMjYHkaGCBXt/kaIjxVMWBFRNUqUY1ViFajesB4cJU7GdKq5NzaUUMqSkDZuwPmgk9iAY2j7QGKdTO3HeRDUEuFKY/1mRa3agoE81DmtQjz1Wy4r+ap0a7HijbGxfr4S7U=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6038.eurprd04.prod.outlook.com (2603:10a6:20b:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Sat, 27 Mar
 2021 14:29:29 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.027; Sat, 27 Mar 2021
 14:29:28 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "colin.king@canonical.com" <colin.king@canonical.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [EXT] [PATCH][next] media: imx-jpeg: Fix spelling mistake "Canot"
 -> "Cannot"
Thread-Topic: [EXT] [PATCH][next] media: imx-jpeg: Fix spelling mistake
 "Canot" -> "Cannot"
Thread-Index: AQHXH8XxeV2Bi3WrEE2+I81vVRhPt6qX66KA
Date:   Sat, 27 Mar 2021 14:29:28 +0000
Message-ID: <d9f6a263c1bef283878f61400fde2ee7ebbdb137.camel@nxp.com>
References: <20210323092141.231744-1-colin.king@canonical.com>
In-Reply-To: <20210323092141.231744-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3d48bacb-118c-4d46-358e-08d8f12cbae2
x-ms-traffictypediagnostic: AM6PR04MB6038:
x-microsoft-antispam-prvs: <AM6PR04MB6038437A00BBB34A4CD5E3378F609@AM6PR04MB6038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GaYuqdiIn9MtB87J3i1tP8E1XN6bywyXwQfiltj5tCfgigyCASSxMymZOVia2A8p6RUDl9glDN0Pj7BpmghRwKjma3EdqalRpy6iR1fmEQXMSuW/nLPFrBk7BjEVVw5WPFpzxEAjYP5Ptap1/mPFVp1FU54dVtqoysNCkwQaxCXSGFy6rCL7Kp61RS0peddAJCZHVMopWUtTN8Rj4hI1lM9oea3uOPwtyJtakzm6JOF8E1ZClN7JUt3rJPGjKk+2BpOct7FSYKAFcF175taU6BH9RhVg9EG1+nTNvPJiH01ob9AOWiRiLyvXSo+xagxmVt1A7jTexI6ZlKDMzzxHsckbjTFX1s9EoUhfKvb/5pl9Cx7gdclcd+mIjN9UgpLuzJCo0l2P97ovV4XlUgu+e4bbkKxWKHPCoW9tCOYGgX5cufe5dNJFBNIL0D48neJudu3S1gF6urN8zgfTTKPvekXJ+PUh8pUuTBj89dqSS/Vmhbo6mA3y7sCLmdiBEomw3eP6HfIBHLcFWJkDGKH4xYY4M+03GHOLayquYatKZz6CxRhiXfqFzW6TbBpeYqb8HtxKyTUP/FR9u+HqQBLSJVQWeyyAyCkcgjaSXBffhjucJDM0ilr75OhCeih5CmHqJoXG3OsGpEKV+zS5ekwb7e6/dDbJV/8wZGAQAoin8XzOgguc14sPesJmxxdqFJPg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(5660300002)(8936002)(66476007)(316002)(7416002)(6512007)(64756008)(66946007)(76116006)(66556008)(91956017)(4326008)(4744005)(110136005)(66446008)(2906002)(38100700001)(8676002)(2616005)(186003)(83380400001)(6506007)(54906003)(71200400001)(6486002)(86362001)(478600001)(44832011)(36756003)(26005)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ekJlWWdadm5YV0NRbk1vWkFRZk5TWUxpSEpZalhBUzZ5SmJDNE1DbWNwTno5?=
 =?utf-8?B?RC9sa1o1OGYvVlJYQ0Z2WmsvNzZ6R0trVGpLVzJiOFlEbVBzZjVGZnRmY1Vo?=
 =?utf-8?B?RGxzU2NOc2tWSUxnZjhsT2VzQzJ2SE9oU3ZyT1hXTk1oNTlhYy9zYlBFWnkw?=
 =?utf-8?B?TUdYV25lczQ3M0dJQ3hkUVV1Sy9UVmR5QVBXcmFzZ2FkdzY1L0NKUTZRa3ZM?=
 =?utf-8?B?R1p3M2h6VEd2VExxbjhEd2s4NVhqTzhkNFdJY09Bd0Rub3dJelU5dTJxNEoz?=
 =?utf-8?B?WmIrM3p2MWVXQTJKQ2dDVVZXYjV1MXR3MmtWL0NvUC82eWxaMHdURFRheWdX?=
 =?utf-8?B?N1Azd2RiVmpsMmFROFAxVU1Bb3YwbFh3TXpjdG84SWc2c1NGc3NxcFBBZWdZ?=
 =?utf-8?B?c09wM094cElPaER4SXdiTmlVaVorVjFWTjZoeER1d1IxMldQbmhvamFXODJw?=
 =?utf-8?B?N0RvaFNkNDNCa25CdHdCd3BzUHRscGVjbmszYUdEWEM4QTNKWXR4cHYzckpt?=
 =?utf-8?B?MVNQVytubWtYTXVhcjdldkFnZERHd1kwcitSVjJzaFNlcngyd2ovSkxrMmFT?=
 =?utf-8?B?MFhCTEhWUTVvNzI2QlN0UU5jc1ZKd0JFSWNCVWhnVkY4b3JTRTZIUmZOc3ln?=
 =?utf-8?B?M2RaM0RoS1B5ZkNZL2NMUE4xb1RqQUpNTDhla2xZUmF1MGV3ZkpIWkZ3djJD?=
 =?utf-8?B?QVRmZFVZd08rRlFITHBrOUt5NjNCeHE1M0laTDNZdFVrSTluYWladWs0S1M5?=
 =?utf-8?B?TllWZHpHb0tMYStxR0VUbTc5SmZsOGt3N2MzNmtDT0VnS2YzWm56cXlmWitx?=
 =?utf-8?B?UWZ2bWVHTGhuL3A4ZVdDNGZVMmt1a0F0ckF4L1VCTEpFVGd1UjFNeHdlVFFU?=
 =?utf-8?B?UkRkbzJJakpoRWZxaVBGbUp6NEtvT2xCT0gvV1lNWDdWRnlLanJGblYza1hS?=
 =?utf-8?B?RDY0c28wWFJUYjZkSGl3NjhSMlBrZGRRL1A2enlaWGo5ZjZ4L0dzWWtkUDJP?=
 =?utf-8?B?YXErMEpmZTF3VTlHaGc5UEZPd0piU0NuU1Frdm9LVGowdmdERHozRzRWdE92?=
 =?utf-8?B?UkVBWFI0Vno2K2FJNUlYNWEwSFRpaUg0UXdPOHhBWncxL1dDR1FUTU9zVXY5?=
 =?utf-8?B?QlRTSVk3M0dBV0hleTFLSmZHQWFpTWVMcG9MaWE2K1Qvd1ZGRUl3OUMyRi9w?=
 =?utf-8?B?OTFOcFZtNHh4TWVVQ2NMZmFkUnErcE1Nc2pyOXp4MmtXdGtIWURqMUYyc1J1?=
 =?utf-8?B?T0xxMFZ0REpHak8ra1B0TTJjRS9JcUZxYWR5aE44Ty94VE9Vc1M5cXdjTk1u?=
 =?utf-8?B?SDFpdWhHUmIrV2NVVGF4Rmlxb1lQQWdCaE84NVcrMERCNEJVNkFheDVubTFI?=
 =?utf-8?B?dmZUSFJTZ3EvdUtyaWxIWUNjZU1qbTVKWUV3aHhYMzUzdEtHU2lSY01LcUpz?=
 =?utf-8?B?ZDhGWnA2R08xNUd1TksxMTNqTnhZdkp4VnBHdzM1TmVyNXFWL093UjlLQnlM?=
 =?utf-8?B?MmxpMDBVOElIZEI1aXRualFsNCt0Um5sM2VVRnZaMTN0TmtqTFE5Vm1Sdm9j?=
 =?utf-8?B?WXVROWp5enJ4M3VXZmRCa3N2Wm5DR2NpUlgrakJZUE1IdzRsRkdiSDM1M2R5?=
 =?utf-8?B?QWphR1lpR2piMzRYenZQbFVONnJnTE9LY1Vxd1pTVXJEMzlwa1kveDhlR2tS?=
 =?utf-8?B?ZllHVm45eEk2Z0RGSmtuaVRCRlAwNHhJMUQvaURqV21ySnAvanFqWlhoVzFr?=
 =?utf-8?Q?eO62ChlcusYx3Xcnjy6ZrAH/SkyPAGd/QSNYq3n?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <32E1CF8FBD579143AF272FFC3CCC0795@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d48bacb-118c-4d46-358e-08d8f12cbae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2021 14:29:28.7018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyDCzauT+w7VYRi8DXLNPefLwqqdWZKH1ngyIlx6AipJFZEvFtC6De8qwr6kjxao8/d3NJgUkj01XeW4Sfev8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6038
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMS0wMy0yMyBhdCAwOToyMSArMDAwMCwgQ29saW4gS2luZyB3cm90
ZToNCj4gDQo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+
DQo+IA0KPiBUaGVyZSBpcyBhIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBkZXZfZXJyIG1lc3NhZ2Uu
IEZpeCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5n
QGNhbm9uaWNhbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBl
Zy9teGMtanBlZy5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9p
bXgtanBlZy9teGMtanBlZy5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9t
eGMtanBlZy5jDQo+IGluZGV4IDJkMjk1NThmMTg2NC4uYWRiMTcxNWM3NWQ3IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMNCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9teGMtanBlZy5jDQo+IEBAIC05NDcsNyAr
OTQ3LDcgQEAgc3RhdGljIHZvaWQgbXhjX2pwZWdfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiAg
ICAgICAgICAgICAgICAgZ290byBlbmQ7DQo+ICAgICAgICAgfQ0KPiAgICAgICAgIGlmICghbXhj
X2pwZWdfYWxsb2Nfc2xvdF9kYXRhKGpwZWcsIGN0eC0+c2xvdCkpIHsNCj4gLSAgICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAiQ2Fub3QgYWxsb2NhdGUgc2xvdCBkYXRhXG4iKTsNCj4gKyAgICAg
ICAgICAgICAgIGRldl9lcnIoZGV2LCAiQ2Fubm90IGFsbG9jYXRlIHNsb3QgZGF0YVxuIik7DQo+
ICAgICAgICAgICAgICAgICBnb3RvIGVuZDsNCj4gICAgICAgICB9DQo+IA0KPiAtLQ0KPiAyLjMw
LjINCj4gDQoNClRoaXMgY291bGQgYmUgc3F1YXNoZWQgaW50byB5b3VyIG90aGVyIHBhdGNoIChQ
YXNzIHRoZSB2NGwyX2pwZWdfaGVhZGVyDQpoZWFkZXIgYXJndW1lbnQgYnkgcmVmZXJlbmNlKSwg
c2luY2UgaXQncyBqdXN0IGEgdHlwby4NCkVpdGhlciB3YXksDQpSZXZpZXdlZC1ieTogTWlyZWxh
IFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQoNClJlZ2FyZHMsDQpNaXJlbGENCg==
