Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBDF38DFE0
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 05:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhEXD3l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 May 2021 23:29:41 -0400
Received: from mail-eopbgr70070.outbound.protection.outlook.com ([40.107.7.70]:13467
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230181AbhEXD3k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 May 2021 23:29:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvNeP4LAdzBtBdyCixgclUzNOtw62V2ac/6xkXjE/PZk3TG5VnXa0lg8xMlLBEi4gXDb9rBNnCONJLninhq12gm5OndA6B68hxDtM8uhpGSptRkVRC2Pn9XGBU1V6+Iusogy/FmiOe6ZARzAH3H2Pe7oFrFMejj7fFvYS5ZKoKFxPNJcBmo7KafbLX+1ku3vVCEq6l7lK1/buDEBBkhvOAqC4CgtlGpGCwDW+ho9HL34F2lDLx867FttaERX6egNDpISwx1PK0m9OQ7wjpzbYuk6A9meu+bgSTDT3IT5Apj37wEGvmSLMvdy8YK9b08rXjhJnC6sVRv6tlCie51ikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRmnOeTBi9YLsFKhX3R/IZrMx5qmvRtios2cWjdFKLc=;
 b=DbY+zz6GIWjzofw6BPWB0M8ezpMtA4DRZKALuDBjYCf4wzKV301P85uJgwIcC6psMpFH7HcCxK/M0U20hzrdl9LWO8WIaTleV3Q/N+Ut8Nshzii0UG84q0lQOGSRxLrK1051N+Mq79Nf23BpVqSvags8T3PVyibJq1E2PBRNrrSK+kRKxCazfh4L963L/gpqIIJOaI/J78m9HPSILDJ7dpLxa9n9I62lc8yzlg460/O3VI+iVE7YASprynmUJIy2cGgLqoNtG6LTxesQxpvlEAZARdGpwSbBEFj9voBv9H+Qk06G5oGY2KK52f0eYV6TvDMZ/jVDTA+IAX1+Whh8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRmnOeTBi9YLsFKhX3R/IZrMx5qmvRtios2cWjdFKLc=;
 b=DVjXz8LBsju/OL4e275C3+LvZYC0T4IXbmUTboDcIjo6mGpnmmfRqMgDvonZjIkdMO+lC54hzjFLQVUAb0YyRt6x+oMgu8M1z0JBVNSBHbzY4TvHI5Z24OoBifWvvfAmUpSJHIjU7hMi8x7moMRik1l2EOgtDXaUJcFPCatKCuU=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8663.eurprd04.prod.outlook.com (2603:10a6:10:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 03:28:10 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 03:28:10 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     Peng Fan <peng.fan@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
Thread-Index: AQHXT08mZrIKSkofcU+RjKU8hS/UQ6rx+NDQ
Date:   Mon, 24 May 2021 03:28:10 +0000
Message-ID: <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
 <20210522211055.15988-3-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210522211055.15988-3-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1d2185f-aad9-45fb-4a7b-08d91e63f4b6
x-ms-traffictypediagnostic: DU2PR04MB8663:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB8663E835082E823BB54D4D8A80269@DU2PR04MB8663.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:175;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: igTvONVKPEQBSVF+QY/eP7yHcIuOJCjRh5C7rtLQn1kXMKBWG76dW/MYlEOh0FAdEsNCACM2/p5oHEvXX8Xe1ttvin3MKU+FWBFNEt6KBKOs4YeMYNV+CrUDp0o7lRl/474LC5QEhEMxBHsTFugwCdfdJJi8OkRIg+Uyql7a6hq7pgs+pTujdsIiQvb7pIq2B131r3K/N9SgxsZM3X2gIBTdq6qCSeA071uqDAeMS+Vdx8hRAKSSQJBbQsNG0VfHrwHP2sku+8NqRadh/qjaOPg0qXYEKpfjyUH0+fN9DyYVegtV/mE5L2/Q2GV03NeF0hobS/P66rLIi3GJdYiokqpAjpIHLIRihlTEP8OnsETP3hzdy74l/dxSWOAYMkg6N8A+bVIF41+jSz1ihsbDKrMnf2reZePH7JENDCrOQzkv0YZR2Q9GcPYX3Qo5FPw9NBX1sNISu3WuCI0ZTUj/zfaasjbgxuYD7UsNS2XRCt+fKBA4Ns/zv5OmpkIbV9SK8nX5DS5A6SSewfa3pypZDUCYVDM9zT5ravjKxwsENyzSHFBRlF+Z1C8YWPinrEUf4myWF4u3O2wgOV9Fh1b9dDVvP51rQJvu5YR5YG/lf6U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(76116006)(33656002)(478600001)(26005)(8676002)(4326008)(8936002)(52536014)(66946007)(66476007)(44832011)(71200400001)(66446008)(64756008)(66556008)(9686003)(54906003)(53546011)(55016002)(186003)(5660300002)(6506007)(38100700002)(86362001)(110136005)(83380400001)(7416002)(316002)(7696005)(2906002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WXNYOWZDTUduRmEwRGZGUXVEZk1WN1MxVURsZFVZNkowVmsxWGU5MjdSRHJG?=
 =?utf-8?B?VVhhcFFCKzRRWXR6ZE5hb1dQcHI4eHY0bVlFeXpRNktpdlNJVjJhMnRqUXgz?=
 =?utf-8?B?c05XY2doQTdtdkpCRnYyNjhWUSt1NDdnalp6dW56U0lxZWtrNXhabnFGbHJq?=
 =?utf-8?B?Zk4wTTFSK3FqWGlDemRSMDMybEM0djdzVUR5SDQ3US83U2g3amtBSEl0YnQv?=
 =?utf-8?B?Q2FGeGJuc05uQ21sZHNvWEd2TCszY3lLQWhGa01IUXZmVlpuMDJIeGQxcnZX?=
 =?utf-8?B?Q3AwWlRyRXlhU2UvMytsbnlEUnNQTzlKeVNjeGdOMnBobVBGRmJCcndDMW9I?=
 =?utf-8?B?L1dyRUc3L21IQUxudlh3R3Z5b0RJb3Z2MU9FVG13aHk1WGZQVGpNcEl5OFlQ?=
 =?utf-8?B?Uk9xR1ZNY01WajNUcGQxbktuSWE1NGpLWHUrVXFGRTdCR2VldjRMdnl1T3BY?=
 =?utf-8?B?N0x0a3lUclVvR25uekhZc25Qak5HMnNBalkzQkEySmExMDUrRXI1ZzJtL0Ry?=
 =?utf-8?B?T2xnTUs4WnVIRHhHQzRXcjhMdUk2eFJNRG5hd3J3cTg1enF3ZitwOVJ6bU44?=
 =?utf-8?B?K1lvVTFyb2FQOFNTMjFtS3VXTHFzZG1SRjRST1hYazJybEtXSmFGaUppQXV6?=
 =?utf-8?B?aTIyTWxjY2dXNXVKMFg1ZFBlWFk1dUNoZlBWc1ZNU0pDL2lDd0ovaVpUa3FJ?=
 =?utf-8?B?bHpjUldzNkNzZUZBeE5yMlFmTjF3Wndma1R0aW9hTDR5QmFrVHh4d0w4WlNu?=
 =?utf-8?B?Rkk5cjBYdjl4b1N1MHZrWklSbW9rOE1pZXAxVWtURXNST2dibDh6SE5tVGY0?=
 =?utf-8?B?VGdXZHdsZzQwSXUzVXFyaDhTSGFGWjdrdEFNdnNGM1RBWWthOCtoREtiN2hE?=
 =?utf-8?B?ZnZEY3psc1N5SWJSdG5RS1BybHNYTTJ1QXB6OHpHMXpkVW9iUllwVW1nOS8v?=
 =?utf-8?B?Mmt1YjQ3UFFRejgzVVBKV1Q2dG9MbHVWU05uRjRzWitpaW9uZmkrVHlraVR2?=
 =?utf-8?B?UzE3UGhZSkRWTEFFWTdkSkc3ZXpTRlQ4RlpMYUZLVTV2NWxPUCtvZmJWQjRx?=
 =?utf-8?B?c0p2dG9FUFdVc3pwVkZ1YmtXSWVuWU9XY1BnaTRXakZ2RTl4eWt3V1hISy9L?=
 =?utf-8?B?VUZTOHlhQ0ZYczUvQzY0YTR0ZjhMOVpmQU5GREdQVXlucmU2OEZVYnRKekE0?=
 =?utf-8?B?em93WDV5YmJ3UE55UDg0Vm5TMlZNMVFiV1VCOVBWRU1FOVp3ZGVFazZOSk1m?=
 =?utf-8?B?a09nYkVTRm91MlByL2UveUZzVVRhaGRwTXdsZlFPdDlaSUEyc3ErME1XNDIw?=
 =?utf-8?B?aC9Jb2NNdUVZSGRkVlh5OFZjNEx5NEVtK2dKREh3U2RickZqcVg2bTAxcWlF?=
 =?utf-8?B?cjhGQVBsa0lzYlNqZTBiYXEraHlrOS8zcjBkbVhJVlJNNkF5b3NoY3dFbXpM?=
 =?utf-8?B?VEZ3c3VZVGxyai9BS01WU0hSSW9LLzJzTzJCMW1IUUpaSWNYRWRMT2dGVjc5?=
 =?utf-8?B?dmlaay9meUlWeVhrRVQ5bEZnWmZDUTVsZENmMVFKV3ByYUNROVZEak9WdHhZ?=
 =?utf-8?B?UE53djJOUkJyaVpVZDdlRUIwbXZyZk03cTNlWHZWNG5PMko1elFGRWZQc2tH?=
 =?utf-8?B?a0phK3VrZEpjUit6TjBDN3BxMGNiUlorVDQzdHdnRlBwR2pnb1B2UC9pUDV0?=
 =?utf-8?B?Y1FrT2NvZTliOVlnT2U2QjFLbFdZOGJxVnNWbGM0czd1QUNnM1E1U0djWG5V?=
 =?utf-8?Q?fRHRfW9sy1I+DmFdB0z614gCkMOg9IMHBEajZEM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d2185f-aad9-45fb-4a7b-08d91e63f4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 03:28:10.3329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hRbkQ9sU6RIaXgwklDTBknbNcy182p64m879y1Rzbq5sSjVb/Wu9C2L5x3Y/7NS730Xned0L3dTpk4mpBC6bzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8663
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFN1bmRheSwgTWF5IDIzLCAyMDIxIDU6MTEgQU0NCj4gU3ViamVjdDogW1BBVENI
IHYxMyAyLzJdIGFybTY0OiBkdHM6IGlteDogQWRkIGpwZWcgZW5jb2Rlci9kZWNvZGVyIG5vZGVz
DQo+IA0KDQpzL2lteC9pbXg4DQoNCj4gDQo+IEFkZCBkdHMgZm9yIGltYWdpbmcgc3Vic3l0ZW0s
IGluY2x1ZGUganBlZyBub2RlcyBoZXJlLg0KPiBUZXN0ZWQgb24gaW14OHF4cC9xbS4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPg0K
PiAtLS0NCj4gQ2hhbmdlcyBpbiB2MTM6DQo+ICAgQWRyZXNzIGZlZWRiYWNrIGZyb20gQWlzaGVu
ZyBEb25nIGFuZCB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlOg0KPiAgIC0gTW92ZSBqcGVnIGNv
bXBhdGlibGVzIGZyb20gaW14OC1zcy1pbWcuZHRzaSB0byBpbXg4cXhwLXNzLWltZy5kdHNpDQo+
ICAgLSBBZGQgaW14OHFtLXNzLWltZy5kdHNpIGZvciBpLk1YOFFNDQo+IA0KPiAgLi4uL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpIHwgODAgKysrKysrKysrKysrKysr
KysrKw0KPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0tc3MtaW1nLmR0c2kgICAgIHwg
MTIgKysrDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaSAgICAg
fCAgMiArDQo+ICAuLi4vYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3MtaW1nLmR0c2kgICAg
fCAxMyArKysNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAuZHRzaSAg
ICB8ICAyICsNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTA5IGluc2VydGlvbnMoKykNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5k
dHNpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHFtLXNzLWltZy5kdHNpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1pbWcuZHRzaQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNGI4NDU2YmI0NzEyDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRz
aQ0KPiBAQCAtMCwwICsxLDgwIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAxOS0yMDIxIE5YUA0KPiArICogWmhvdSBH
dW9uaXUgPGd1b25pdS56aG91QG54cC5jb20+DQo+ICsgKi8NCj4gK2ltZ19zdWJzeXM6IGJ1c0A1
ODAwMDAwMCB7DQo+ICsJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gKwkjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxscyA9IDwxPjsNCj4gKwlyYW5nZXMgPSA8MHg1ODAw
MDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiArDQo+ICsJaW1nX2lwZ19jbGs6IGNs
b2NrLWltZy1pcGcgew0KPiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCj4gKwkJI2Ns
b2NrLWNlbGxzID0gPDA+Ow0KPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsNCj4g
KwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19pcGdfY2xrIjsNCj4gKwl9Ow0KPiArDQo+ICsJ
anBlZ2RlYzoganBlZ2RlY0A1ODQwMDAwMCB7DQoNCk5vZGUgc2hvdWxkIGJlIGRpc2FibGVkIGJ5
IGRlZmF1bHQuDQpBbmQgZW5hYmxlIGl0IGluIGJvYXJkIGR0cyBpbmNsdWRpbmcgTFBDRy4NCg0K
PiArCQlyZWcgPSA8MHg1ODQwMDAwMCAweDAwMDUwMDAwID47DQo+ICsJCWludGVycnVwdHMgPSA8
R0lDX1NQSSAzMDkgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMx
MCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkgMzExIElSUV9UWVBF
X0xFVkVMX0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAzMTIgSVJRX1RZUEVfTEVWRUxfSElH
SD47DQo+ICsJCWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0K
PiArCQkJIDwmaW1nX2pwZWdfZGVjX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQljbG9jay1u
YW1lcyA9ICJwZXIiLCAiaXBnIjsNCj4gKwkJYXNzaWduZWQtY2xvY2tzID0gPCZpbWdfanBlZ19k
ZWNfbHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkJICA8JmltZ19qcGVnX2RlY19scGNnIElN
WF9MUENHX0NMS180PjsNCj4gKwkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAwPiwg
PDIwMDAwMDAwMD47DQo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0RF
Q19NUD4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzA+LA0KPiArCQkJCTwmcGQg
SU1YX1NDX1JfTUpQRUdfREVDX1MxPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19T
Mj4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzM+Ow0KPiArCX07DQo+ICsNCj4g
KwlqcGVnZW5jOiBqcGVnZW5jQDU4NDUwMDAwIHsNCg0KRGl0dG8NCg0KPiArCQlyZWcgPSA8MHg1
ODQ1MDAwMCAweDAwMDUwMDAwID47DQo+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMDUgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMwNiBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkgMzA3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiArCQkJICAgICA8R0lDX1NQSSAzMDggSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsJCWNsb2Nr
cyA9IDwmaW1nX2pwZWdfZW5jX2xwY2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiArCQkJIDwmaW1nX2pw
ZWdfZW5jX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQljbG9jay1uYW1lcyA9ICJwZXIiLCAi
aXBnIjsNCj4gKwkJYXNzaWduZWQtY2xvY2tzID0gPCZpbWdfanBlZ19lbmNfbHBjZyBJTVhfTFBD
R19DTEtfMD4sDQo+ICsJCQkJICA8JmltZ19qcGVnX2VuY19scGNnIElNWF9MUENHX0NMS180PjsN
Cj4gKwkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAwPiwgPDIwMDAwMDAwMD47DQo+
ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD4sDQo+ICsJCQkJ
PCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdf
RU5DX1MxPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMj4sDQo+ICsJCQkJPCZw
ZCBJTVhfU0NfUl9NSlBFR19FTkNfUzM+Ow0KPiArCX07DQo+ICsNCj4gKwlpbWdfanBlZ19kZWNf
bHBjZzogY2xvY2stY29udHJvbGxlckA1ODVkMDAwMCB7DQoNCkRpdHRvDQoNCj4gKwkJY29tcGF0
aWJsZSA9ICJmc2wsaW14OHF4cC1scGNnIjsNCj4gKwkJcmVnID0gPDB4NTg1ZDAwMDAgMHgxMDAw
MD47DQo+ICsJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdfaXBnX2Ns
az4sIDwmaW1nX2lwZ19jbGs+Ow0KPiArCQljbG9jay1pbmRpY2VzID0gPElNWF9MUENHX0NMS18w
PiwNCj4gKwkJCQk8SU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAi
aW1nX2pwZWdfZGVjX2xwY2dfY2xrIiwNCj4gKwkJCQkgICAgICJpbWdfanBlZ19kZWNfbHBjZ19p
cGdfY2xrIjsNCj4gKwkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX01Q
PjsNCj4gKwl9Ow0KPiArDQo+ICsJaW1nX2pwZWdfZW5jX2xwY2c6IGNsb2NrLWNvbnRyb2xsZXJA
NTg1ZjAwMDAgew0KPiArCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KDQpEaXR0
bw0KDQpPdGhlcndpc2UsIEknbSBmaW5lIHdpdGggdGhpcyBwYXRjaC4NCg0KPiArCQlyZWcgPSA8
MHg1ODVmMDAwMCAweDEwMDAwPjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQljbG9j
a3MgPSA8JmltZ19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJCWNsb2NrLWluZGljZXMg
PSA8SU1YX0xQQ0dfQ0xLXzA+LA0KPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2Nr
LW91dHB1dC1uYW1lcyA9ICJpbWdfanBlZ19lbmNfbHBjZ19jbGsiLA0KPiArCQkJCSAgICAgImlt
Z19qcGVnX2VuY19scGNnX2lwZ19jbGsiOw0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhf
U0NfUl9NSlBFR19FTkNfTVA+Ow0KPiArCX07DQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNpDQo+IGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNpDQo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzc2NGI0MTQ2ZTBhDQo+IC0tLSAvZGV2L251
bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5k
dHNpDQo+IEBAIC0wLDAgKzEsMTIgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBH
UEwtMi4wKw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDIxIE5YUA0KPiArICovDQo+ICsNCj4g
KyZqcGVnZGVjIHsNCj4gKwljb21wYXRpYmxlID0gIm54cCxpbXg4cW0tanBnZGVjIiwgIm54cCxp
bXg4cXhwLWpwZ2RlYyI7IH07DQo+ICsNCj4gKyZqcGVnZW5jIHsNCj4gKwljb21wYXRpYmxlID0g
Im54cCxpbXg4cW0tanBnZGVjIiwgIm54cCxpbXg4cXhwLWpwZ2VuYyI7IH07DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaQ0KPiBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpDQo+IGluZGV4IDEyY2QwNTliMzM5
Yi4uYWViYmUyYjg0YWExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4cW0uZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cW0uZHRzaQ0KPiBAQCAtMTY2LDExICsxNjYsMTMgQEANCj4gIAl9Ow0KPiANCj4gIAkvKiBz
b3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5k
dHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4LXNzLWRtYS5kdHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4
LXNzLWNvbm4uZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1sc2lvLmR0c2kiDQo+ICB9Ow0K
PiANCj4gKyNpbmNsdWRlICJpbXg4cW0tc3MtaW1nLmR0c2kiDQo+ICAjaW5jbHVkZSAiaW14OHFt
LXNzLWRtYS5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhxbS1zcy1jb25uLmR0c2kiDQo+ICAjaW5j
bHVkZSAiaW14OHFtLXNzLWxzaW8uZHRzaSINCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3MtaW1nLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNzLWltZy5kdHNpDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2EwODczMTc1OTFkDQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1pbWcuZHRzaQ0K
PiBAQCAtMCwwICsxLDEzIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MCsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAyMSBOWFANCj4gKyAqCURvbmcgQWlzaGVuZyA8
YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ICsgKi8NCj4gKw0KPiArJmpwZWdkZWMgew0KPiArCWNv
bXBhdGlibGUgPSAibnhwLGlteDhxeHAtanBnZGVjIjsNCj4gK307DQo+ICsNCj4gKyZqcGVnZW5j
IHsNCj4gKwljb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2VuYyI7DQo+ICt9Ow0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGIv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4IDFlNmI0
OTk1MDkxZS4uYTYyNWZiNmJkYzYyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OHF4cC5kdHNpDQo+IEBAIC0yNTgsMTIgKzI1OCwxNCBAQA0KPiAgCX07DQo+IA0K
PiAgCS8qIHNvcnRlZCBpbiByZWdpc3RlciBhZGRyZXNzICovDQo+ICsJI2luY2x1ZGUgImlteDgt
c3MtaW1nLmR0c2kiDQo+ICAJI2luY2x1ZGUgImlteDgtc3MtYWRtYS5kdHNpIg0KPiAgCSNpbmNs
dWRlICJpbXg4LXNzLWNvbm4uZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1kZHIuZHRzaSIN
Cj4gIAkjaW5jbHVkZSAiaW14OC1zcy1sc2lvLmR0c2kiDQo+ICB9Ow0KPiANCj4gKyNpbmNsdWRl
ICJpbXg4cXhwLXNzLWltZy5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhxeHAtc3MtYWRtYS5kdHNp
Ig0KPiAgI2luY2x1ZGUgImlteDhxeHAtc3MtY29ubi5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhx
eHAtc3MtbHNpby5kdHNpIg0KPiAtLQ0KPiAyLjE3LjENCg0K
