Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BCF338A4C
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 11:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhCLKgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 05:36:23 -0500
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:32417
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233538AbhCLKgL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 05:36:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxvB8uC2QP8j8oi9D48sJlmNBh2ES3yn4ABJd8IdrZIvnm9CMD9XJo+nqYPPPgi27VLMN/ex9tnPSFB47GCgVnyDuZG9JFSZU1gbTIvAIpIiZdpy7FkVlRCoNBMqcDXt/ww9eGHUqOanSU305wdRj3GJp0OBdN3PzImTBcqm+2+j/GcntnTng2WpSs0OA25Ii2moxvPeysudRn43UGP33raRjLm4Jqum68CGAJYQHxV+X/y0xZov4kaEPJluS+m9fDL2ZRM8wFG3mMFBv+LW5T65faltUAVyMhc/W7kpKXjmx69hUQ4UYAvx5atAT2TZjE8EcoOOfPLHv+p9K8KbtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRoPhHiY8mftTsZhxizoroeoBw0buBywBJ2Uc5UNFuM=;
 b=dcZn7Uu4PBiJYsAM3hShgN7+j2fhJv4Uzb33Xufl4cVzrbSz6LXH6m2a8D2QdBta0L2AGtJ1c0K5Z4E1PVtNf7Ta02eThT1ELdOeVbyMmAua3XC6w5pCgLY9wZfNoNYwE5XS9mFTPWGzi+RluMgxPSH8WUvcvMAaNqh5dRxGezViVjEq0HXFzzWZstYuAVsn5wuap62SaDrFOHvHEnYkpEJ3BitSvjKKoT7AG7AaXKxy6P+ICoL4/d7IAPSPML55/8cdaDvdquNUZyoNMALMz31V95jw1eXxQ2QPsZpKxZksYE0J8ImeNlWbc4oOAhVGs/iN+gswGdGPNHUZFtFXGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRoPhHiY8mftTsZhxizoroeoBw0buBywBJ2Uc5UNFuM=;
 b=cRRdfj4bPQ7/VKSJhXW7u77XtDrpuFNqO0EYACq/AhT/WxaOJ58MiE9nYHYryxVbkiozDEz9gbMXZA51EIsRqMe8R4Alnf1N0Yck3NOwY1j2JVVgD1hTinYmzaZ2CiIL64Yy5ys4rh0Ut4emx4BujUJWLWcVXDoAjmMLgYOjM+Y=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB5509.eurprd04.prod.outlook.com (2603:10a6:20b:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 12 Mar
 2021 10:36:06 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::ecad:ebb8:8eb0:d359%7]) with mapi id 15.20.3890.039; Fri, 12 Mar 2021
 10:36:06 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC:     "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v9 7/8] arm64: dts: imx8qxp: Add jpeg encoder/decoder
 nodes
Thread-Topic: [PATCH v9 7/8] arm64: dts: imx8qxp: Add jpeg encoder/decoder
 nodes
Thread-Index: AQHXFg3KE3/e8dH4JUu78bCMIQT0RaqAKpLg
Date:   Fri, 12 Mar 2021 10:36:06 +0000
Message-ID: <AM6PR04MB49668378CCF21F52C820E98A806F9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210311002854.13687-1-mirela.rabulea@oss.nxp.com>
 <20210311002854.13687-8-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210311002854.13687-8-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 84a4c164-e3b7-4318-7142-08d8e542a4b4
x-ms-traffictypediagnostic: AM6PR04MB5509:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB55091544F2BA00650A6EC1DE806F9@AM6PR04MB5509.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y/K2rR1HZYl/7Xo+fbibCL/ECg+SDV22StWF5tGzAKS3up2fK2lxN6+JrO+D8k7HXZgW6EWVcfZqHspo9aClZPZ0EXBBCpQ+dHYwhYV8MyMP0fyV9J0yxuU9/D6AEOqB7AKm3rUqOtPtEM/ahU7otETsx9fYzUAS1wOhQ4jwiUM4DNsGyr29bJslp7irw2dgiffpyC+OmsKRmFEF/xrwt9Le+/tRv4hzbUD7LXJK4XODTtL8NW4ejypPnL0yG9fgkv1s8UmIvMDg7oj6NkjCQeFbdxEzduKgsC3fCGvppXepgbCCGtGu+jBO1b4wlxPFYVSbGn5l806ZSajsgdFz+t4XA56RaemvChPHlyqPgP5sxWBCl2t3tEU3uH5j/mmbQBPPFW1lH7fYUzJoXWI1Aie4M8z0rqftfsygXRnispT94TMbEqJEraCnggwzXQ0+iRx/62J1KzmOakjcGSqVTlczzskczbSMiYK0JhBXAtT/w1Ea+HBL/wuWlecrB3y5T5P7C8Iap1PpHh1nL14o8aoMb4WzhPHybb4EkoY7Vn7ctuNK7BswYlsHg32UYInd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(2906002)(44832011)(71200400001)(478600001)(83380400001)(316002)(110136005)(4326008)(6506007)(86362001)(66946007)(186003)(7416002)(54906003)(66446008)(8676002)(5660300002)(76116006)(64756008)(52536014)(66476007)(66556008)(33656002)(9686003)(55016002)(26005)(8936002)(7696005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WWFBTlp0N2E1VVdsWGZjM0tXRzJaSTJlOEtzMmlOeUpVSTNwMStJTG5KUWlV?=
 =?utf-8?B?V21lRFJqSVZhNDhhakxweFJKY2dlSTluZFFaZGFJRklUT29XckhtZGUzY1Np?=
 =?utf-8?B?NmRPWW9sRkF6Q3N6U21XY3JnMk12ZnFHeUd0Zkc5M002RXFLTXFEQ2JpdnRi?=
 =?utf-8?B?aGYvK0pvVnB3WSt5cno0ZEc0ek4rWExHMCtHQjM0Qy9FUUdxb0M3ZDhGNkN3?=
 =?utf-8?B?Qmphdkp3aVNxL0oyQ3BrY1ZEVm8yTlJhTkRDZFczajR2RS93SkJod2VielU4?=
 =?utf-8?B?ZGtudjN6SmRaZHFBc2lLNEJNRDh0d1BLZjEzTXd2bW5paU9GaDFhWDc1aThZ?=
 =?utf-8?B?YytreXRlaW1OQ1VsdDkyUjFDWFpBdXRmK2gvRGtmRnJibjFlNjczTVNBZmla?=
 =?utf-8?B?WHVkNitDTEIrOGM0eFZHencyUkdyVmRRcVZNZGsraWVYbEJmWElLUHVlbkN0?=
 =?utf-8?B?M0JSRS90cHg0NzE4QkFMVE5OWXdPSEhRbHQ1b0FKSXVYWUM1TXNMMXpTVFN4?=
 =?utf-8?B?dWNST1dld2gvWDNuSUVTbVcyVXFrK1Y1aG92OFBtZEdjaUhkZ0JlYlUxOTNI?=
 =?utf-8?B?MjludGVzSVBNVU9NWGMvTktOTnhjYWZXWk53ZlEwdkU4V1FMUElUQkdTdlh3?=
 =?utf-8?B?RU9ZSkUyV0JGWVVXNTlSNHpxcGpzYkdOa1lWN0JUTjFab1FWTm9ueTBnSnZT?=
 =?utf-8?B?WlVROXVJbWF2eDZhbW10VmRWZ1VKN2RzckdEVWpwZkE5L3labjZKQTQ3NEVt?=
 =?utf-8?B?T2tGSGhBNDZHcCtNRUlLY25oVHlJY0xKL0dwdXdqZXovNndaQnJRQjdCZDBy?=
 =?utf-8?B?WGFrUnZlSFdlL0RDVXNZc1ZoWW1GZ2FHamZCajFYaFJWcXFjWmwwWlBtejhm?=
 =?utf-8?B?OGVVNFY5REpFSWdGWm9pNlhHS1dxSnRtcmVGR2E2TVRlUGwrazBNOXRDL0JT?=
 =?utf-8?B?Z1BjTXJMc1VwOFhZY0U4K0c0UzNXc0sxZFlNbjc2ZXNoVUNJZXR1VTZEZ3ZG?=
 =?utf-8?B?VTNrRkFCQnZzL2RpTlNZWEtlbk1VbjM5RDJrMDVTcFpOeWtmeDRyUTNFaFUr?=
 =?utf-8?B?NmlrSUllRStEMkFPTk4vN3lKc21vSjY0TDc2Wjd3Y0p0MytVV1o1WUpxeWhn?=
 =?utf-8?B?emtGNTNRT2dXZlVFMVFnb0ZxZkx3RmtQN09jWXhnSjVJV2s4NEJiS3F5b0Fw?=
 =?utf-8?B?bnRYTk9PY0xiNGRiN0JjNUxQWFVJaWUxZS9OZ2NiaHYwQlFHcHpkODRiMkE1?=
 =?utf-8?B?WE9CYUJpWDZ0QzFTMmd3eE8xcnpjaVZ2SDE0bUNHeWUrUW5lZ1pOcDE4dW5G?=
 =?utf-8?B?eDhyN3BpZzdnWjh1anc3bEpxWFJuYXpHMHBPSWFNdS96NHVSeUJrSVBzQUJN?=
 =?utf-8?B?R2EyNEE1ZWlRdTVMWi8wTVhDT0VScTZZK2gwa2preTgzVkpscUhGcUxmYmlK?=
 =?utf-8?B?bGYvT0s2aW9xNDRzU0tYOU1GVzhNL0VCMHVZeGdWK0tCdmw0NmcrK05oSzkx?=
 =?utf-8?B?TVkyQjhNdEdpZEpjTCtiQyt5eWl2ZWFIdEFxbi9RNFRPc3FGOGRRRVdQdnVP?=
 =?utf-8?B?V0huY0Qyem5VT0FRNW5YTXVHWmpwZ0svOVU2emhzNkYwbS96cm05YXZVeXY4?=
 =?utf-8?B?U0dUc1ArNituV2dOWnh0KzRnT1N2MGhKMnlmOFdaTzBGTEtTSW5pYS9DVXY0?=
 =?utf-8?B?YWQ5ejVsS2pJa0ZBaUYreUtURE1EMnJVdWgzQzlIZVNua3h6RVVua3hJL0py?=
 =?utf-8?Q?/kkaWYaGTQVitELP4/2JTDNZtn5NhBU1Oh6tfmw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a4c164-e3b7-4318-7142-08d8e542a4b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 10:36:06.6292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLF18jZthnWSPwI3iOlcIyvJ8cnBqgAczdry0FNNYx5tlNgsY9PvlXWStXnyfo+GV2nipiJfGyPYGlDKwSFcdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5509
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxMSwgMjAyMSA4OjI5IEFNDQo+IA0KPiBBZGQganBl
ZyBkZWNvZGVyL2VuY29kZXIgbm9kZXMsIGZvciBub3cgb24gaW14OHF4cCBvbmx5Lg0KPiBUaGUg
c2FtZSBzaG91bGQgd29yayBvbiBpbXg4cW0sIGJ1dCBpdCB3YXMgbm90IHRlc3RlZC4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPg0K
DQpQbGVhc2UgcmViYXNlIHRvIGxhdGVzdCBzaGF3bi9mb3ItbmV4dCBicmFuY2ggYW5kIGFkZA0K
dGhlIG5lY2Vzc2FyeSBjbG9ja3MuDQpJIGNhbiBoZWxwIHJldmlldyB3aGVuIHJlc2VuZC4NCg0K
UmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OHF4cC5kdHNpIHwgMzUNCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gaW5kZXggMWQ1MjJkZTdiMDE3Li40ZjJiM2VkZDc4
NTAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAu
ZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kN
Cj4gQEAgLTYyOSw0ICs2MjksMzkgQEANCj4gIAkJCX07DQo+ICAJCX07DQo+ICAJfTsNCj4gKw0K
PiArCWltZ19zdWJzeXM6IGJ1c0A1ODAwMDAwMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAic2ltcGxl
LWJ1cyI7DQo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCQkjc2l6ZS1jZWxscyA9IDwx
PjsNCj4gKwkJcmFuZ2VzID0gPDB4NTgwMDAwMDAgMHgwIDB4NTgwMDAwMDAgMHgxMDAwMDAwPjsN
Cj4gKw0KPiArCQlqcGVnZGVjOiBqcGVnZGVjQDU4NDAwMDAwIHsNCj4gKwkJCWNvbXBhdGlibGUg
PSAibnhwLGlteDhxeHAtanBnZGVjIjsNCj4gKwkJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAw
MDAgPjsNCj4gKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMDkgSVJRX1RZUEVfTEVWRUxfSElH
SD4sDQo+ICsJCQkJICAgICA8R0lDX1NQSSAzMTAgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJ
CQkJICAgICA8R0lDX1NQSSAzMTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJICAgICA8
R0lDX1NQSSAzMTIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsJCQlwb3dlci1kb21haW5zID0g
PCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfTVA+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVH
X0RFQ19TMD4sDQo+ICsJCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MxPiwNCj4gKwkJCQkJ
PCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzI+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVH
X0RFQ19TMz47DQo+ICsJCX07DQo+ICsNCj4gKwkJanBlZ2VuYzoganBlZ2VuY0A1ODQ1MDAwMCB7
DQo+ICsJCQljb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2VuYyI7DQo+ICsJCQlyZWcgPSA8
MHg1ODQ1MDAwMCAweDAwMDUwMDAwID47DQo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA1
IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJCSAgICAgPEdJQ19TUEkgMzA2IElSUV9UWVBF
X0xFVkVMX0hJR0g+LA0KPiArCQkJCSAgICAgPEdJQ19TUEkgMzA3IElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KPiArCQkJCSAgICAgPEdJQ19TUEkgMzA4IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiAr
CQkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX01QPiwNCj4gKwkJCQkJ
PCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzA+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVH
X0VOQ19TMT4sDQo+ICsJCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MyPiwNCj4gKwkJCQkJ
PCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzM+Ow0KPiArCQl9Ow0KPiArCX07DQo+ICB9Ow0KPiAt
LQ0KPiAyLjE3LjENCg0K
