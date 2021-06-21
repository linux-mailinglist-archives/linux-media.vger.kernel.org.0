Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA613AE1FD
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 05:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhFUDxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 23:53:10 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:19445
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229905AbhFUDxJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 23:53:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6USAY55OJ2z9J98TJfhaRabwEui3fXvGCBx1YT1JQMw+swl+ZzP08diDHwWiMaef9UXuVNh+d5mTW1T4CvX7+w6gkwIAMezo3OV4uLkcat1Gj5ESN/gSDHcrS7JCI33mGkDE7aZOxf6b9RKxr0IsFjzu3xh13xabtqfUqoofF7FQ1KcsQ9SMib66fwkcVqnBSmtcGZ89584Vqm1epaNykF99jL8H2BU7DLWOiEOhRFSDFrEjvNusgdIJITx2wudEhupoWcaOsQ4QZT45Dw7IOvTD7qqr8NJJpJXwDTeJzzH3eus40nDikjc+yAuq3T4y5fRB75rC8GMEn6lGTRksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIrc4OPr/Xrs+9Fpnr93/ureim0psuBvq07wteLFB6o=;
 b=C0qZMuVj85QveaNSaB+7V9zsGnfLafRg5pJk7213wbWc0llPiu5oe++S+TzusBbkhImcGe4RtUW9u9WE+15z2iMcmvN+s1RvGe9SpWdC4xbCXUmRGUKjGGlKGVtYqa9epDQuQsY1jmy32374v9CuAoG/3ekGnQu30ReVEEmAuVEQ4kffj47Fyl/emxzygd3JA7UL4un7qtlnAJryxEhfk6cJzW9kFoHAYsGiucmcu31xTfV1k6tRUi0HO47WUbtgMUZ6QlPmUcbKpITwfqhQ5wiReDe3J8e3ssI6iw1+saOMB8PH0y3+5CYOlVs3ndTjHggrknf8gqwKL9XdEu+cFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIrc4OPr/Xrs+9Fpnr93/ureim0psuBvq07wteLFB6o=;
 b=T8pzfMEm2JEeqMi2kkORHyswwBIz1yQEoxXGJ+sPJwZ/PdRzIQb5AMCQEQe9Qh5pZCw4AssNsoGTiQ5WaMI3X88SLe9leQNBB+1fTYxiDa24CgixOZyNbIbUyID9qLNffsyJ4Ez3slXbs0d0GY1jgm1AJDLfN+M3/IYLv2HvtW4=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 03:50:53 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 03:50:53 +0000
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
Subject: RE: [PATCH v14 2/2] arm64: dts: imx8: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v14 2/2] arm64: dts: imx8: Add jpeg encoder/decoder nodes
Thread-Index: AQHXZRiQNll7xFG2VkGbsBbXmZyAGKsd1qlw
Date:   Mon, 21 Jun 2021 03:50:53 +0000
Message-ID: <DB9PR04MB84775869C7ACB6E482A13C6F800A9@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
 <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210619143611.17280-3-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37119947-c65c-4644-9cd5-08d93467c4db
x-ms-traffictypediagnostic: DU2PR04MB8869:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB886960661BFBA8F2F2E1D6D3800A9@DU2PR04MB8869.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c41ECDOjc2OIoHiyDm+S5HwgiN+tOtqnfIor/gfLlXjE/v9gtzfNymLrW3uLjJxgko4+x+HEyTCDKC4V790D/+2EZ2OYC1JztGUuA4ehMum1dqEBVNhkAXTAk2J0f/Yw+Ux3nR02L73jjYyM18vXW4XlrfTOwjGzvhK5DGkIDSXrpVkumjkLBqVv+058nOjdDNKGzM26YICUvrMlzvwrEtL/W4x8FWcGv1ESmWf59uG0Pw2x1e1aGywOxBSMqjK5UPkDiTTPcsgv+VNMMsM1w7Robtkyf8RQcBz/xgjL9QBhdCFnfB4YgUz8ButfHFOBouqjDVIbgNyy2yRjvYIc0rCsY6xZNktRkqxHYNXniEq8hOK5zFwOPzncKbkMQMulkvzE0IiRig2g//YSSDf6i0IYU2QN/YpYJf/T2gQmrRkhstZkvcJsx40A3NDLKvTaeveAhUGIN/Hrbz8WavTMonzV+eCge5bg8N4IMZDqLQ6KWJOHdhI02jzN+XE4Q/+nUwNT8vYBRtjAY6zWfrbQE1Kwnw+gT8v6TtHbb7mW48ObOmXTvbtTwqozGHZ/MjJvkK++sqakiqtPR/6TUoM4MRB7g0tIZSyCJxBAFAUwRhA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(6506007)(44832011)(55016002)(478600001)(83380400001)(71200400001)(2906002)(186003)(33656002)(9686003)(316002)(26005)(7696005)(8936002)(4326008)(8676002)(110136005)(52536014)(122000001)(7416002)(66946007)(66476007)(66556008)(86362001)(76116006)(66446008)(38100700002)(64756008)(5660300002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWNkdHAzc0tuS3BwVWxVQTBUSFpweXYzUytrWkNIVWFpNFErZy9JUG54TWhI?=
 =?utf-8?B?Ri82bC9HejRLK1FScXVQa2hqWnNnWERtVWExUHN6L1lsbzdiRHFGR0NQQkUw?=
 =?utf-8?B?ck10eiszeE9YUUJiT3cycytnRFBxWkNuVHY4L1dCL2x6d3FlOWdCOFc2dU5B?=
 =?utf-8?B?YVZ4NGpvZ01KOTBqRnh2VUU4ZmZ3V090N1BydmE3Wi9zUjRDSmtudVlmSVkz?=
 =?utf-8?B?L3I2MEczV21yc3ZJVGlwcm9jQ0FYaHFGUXVMWmlQVGMrVDNvYzcrTDVCT25L?=
 =?utf-8?B?UDY5Zi9TNWJlNHYxendrVUhINmY5OUNIcS9NbmZqdjZqWmVRaDlFYXEvMlJY?=
 =?utf-8?B?RE5GTzl0VHJ2cHZFNGFXTnJLcXNJazBxYkZBTGxZMEk5TzFDUmpMUTA2MlJt?=
 =?utf-8?B?dWlSK2VrQVRlWDFXdUljeC94RGM4MHBhemx5cHF4bXFacmtJbndubjh3YjhP?=
 =?utf-8?B?blIzMC92M0xwaXdIZFRWRk9WOTYwcFV5RXQybjNhTFhXMkRHVW13L3hXMHpt?=
 =?utf-8?B?Y3NtSUg3Y2Y5M3FYUU5MNFJCSXRMMXhCOGZhM2diWC9DdG1kYlQvaWRRUVlM?=
 =?utf-8?B?MUV2b05TSjdsc09XdHlNanBWS3k4TjFMOEI2UkVyRmxXWmVwMGRuSitTRlBR?=
 =?utf-8?B?dEhtNFpLZE5CYUJYL3lGSTZPWWpzMDJxWVNyRDlVWUozaVFLb2c0dkxtbHJr?=
 =?utf-8?B?czFOWVFCc0xzdTR6cFB5dGw0WnJBSSt4RTFFU3BsWUxnS3VKWC9XRWU5ci84?=
 =?utf-8?B?SE9RZ3k3WkF5OWRzQW5OTHJrN0g0M0ZEbGpYSTYvb2VUSENEM05sc0x4anRh?=
 =?utf-8?B?SWVKMGZZU0NDdmRncHQwNmdKUDllOStuaWpML3V0YjRBdVhtc04xdHkrUTBW?=
 =?utf-8?B?bFZSZlZtNHZNbkpJenhkQnp3TEVQQU5MN0c0ZHhhRmNHTngxWC9PRHo1NCtM?=
 =?utf-8?B?dUw3c1NyWXBXOTh4cTlEdmdVTG1tZzBGUm9lWHF5SnY3SGY1OW5LTnNuckVU?=
 =?utf-8?B?Mnl1aGxpZEpuQzFkNEhEOGlNU3M4MFVHZFhpZmdjZUYzcmovRE5DeDVOWDZ6?=
 =?utf-8?B?cWlZaEovMzNqK2pVTndNZ3pzbjVYY3Rkc1Y4cmJVS0FPaDd6OHdGTEFXK1hQ?=
 =?utf-8?B?ZlJDRDA2QUNJQXI0T2hRMVlRSVVWenJxdTdpSmE1YmlzbGMzMmVxK1ZyeHha?=
 =?utf-8?B?K081MmUyd29leTR1WThlRTVtMXBCNEJXQXJkQ2hDaUJmeklDM1ZUa3Z1cGpM?=
 =?utf-8?B?RndhaEtYcW8yVlFnTndhWW53aldDd1pjRXl4cG9yYzBNdWFjcWlKL1BaOFB1?=
 =?utf-8?B?QTgzVy9jOHFDWnl4TXVRckZORXI0ZEEwYnNsS1E1MkhsZTB4ejhQdlJMSXpM?=
 =?utf-8?B?djdFT3cveGN5OVI4SUJ2emlnb3RMaVhYc213Q09waWJLR29GYkRqUXNuOHRM?=
 =?utf-8?B?dmVzdFRDUmtoVEFVL3BRY085dkZKOFRLWTFwVjg3Zkc4ekJzTEV1Y0E5c3R4?=
 =?utf-8?B?MG05MC9zci9vekt5a3dOUFVNWTFOejk3T2JJelJIZjNSQ2FiK0xhdXNiamND?=
 =?utf-8?B?bnczeTFaM29XTDBsbWVDQTJIMEU0UXovVmgzYXd2MnMzSkx4VU1ONG1pWkZ3?=
 =?utf-8?B?RnFPblZzUnAwNklQMnB0dGRXU3JXNU9iMWc3TnI2amxOZTNPS3pPUmFkZkxh?=
 =?utf-8?B?ZmpSVk15NmpIUCtoZHB6ejJ6L3ZPR09iamQvNFBvV3VJN2F0TFE5VzlDa0lm?=
 =?utf-8?Q?gEWuPhjUF4v9rqQXYBciW1ycBHn8+xtvRncjk+N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37119947-c65c-4644-9cd5-08d93467c4db
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 03:50:53.7981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 08cqAOERYdWNUOuaLL5vNIvCFKqdImBgl0+p0Rd5OFOJ5RzCJkN1xuDnO84ZCHw0N4DNvXCUrCTsXxaktOx4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDE5LCAyMDIxIDEwOjM2IFBNDQo+IA0KPiBBZGQgZHRz
IGZvciBpbWFnaW5nIHN1YnN5dGVtLCBpbmNsdWRlIGpwZWcgbm9kZXMgaGVyZS4NCj4gVGVzdGVk
IG9uIGlteDhxeHAvcW0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgUmFidWxlYSA8bWly
ZWxhLnJhYnVsZWFAbnhwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVu
Zy5kb25nQG54cC5jb20+DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiAtLS0NCj4gQ2hhbmdlcyBp
biB2MTQ6DQo+ICAgQWRkcmVzcyBmZWVkYmFjayBmcm9tIEFpc2hlbmcgRG9uZyBhbmQgRXplcXVp
ZWwgR2FyY2lhOg0KPiAgICAgLSB1c2UgaW14OCBpbnN0ZWFkIG9mIGlteCBpbiBwYXRjaCBzdWJq
ZWN0DQo+ICAgICAtIGtlZXAganBlZyBhbmQgTFBDR3MgdXNlZCBieSBqcGVnIGVuYWJsZWQgYnkg
ZGVmYXVsdCBpbiBwbGF0Zm9ybSBkdHMgKG5vDQo+IGNoYW5nZSBoZXJlKQ0KPiANCj4gIC4uLi9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaSB8IDgwICsrKysrKysrKysr
KysrKysrKysNCj4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNpICAg
ICB8IDEyICsrKw0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kg
ICAgIHwgIDIgKw0KPiAgLi4uL2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNzLWltZy5kdHNp
ICAgIHwgMTMgKysrDQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0
c2kgICAgfCAgMiArDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspDQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1p
bWcuZHRzaQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhxbS1zcy1pbWcuZHRzaQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3MtaW1nLmR0c2kNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IGIvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmE5MDY1NDE1NWE4OA0KPiAtLS0gL2Rl
di9udWxsDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1n
LmR0c2kNCj4gQEAgLTAsMCArMSw4MCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjArDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IDIwMTktMjAyMSBOWFANCj4gKyAqIFpo
b3UgR3Vvbml1IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiArICovDQo+ICtpbWdfc3Vic3lzOiBi
dXNANTgwMDAwMDAgew0KPiArCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7DQo+ICsJI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQo+ICsJI3NpemUtY2VsbHMgPSA8MT47DQo+ICsJcmFuZ2VzID0gPDB4
NTgwMDAwMDAgMHgwIDB4NTgwMDAwMDAgMHgxMDAwMDAwPjsNCj4gKw0KPiArCWltZ19pcGdfY2xr
OiBjbG9jay1pbWctaXBnIHsNCj4gKwkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ICsJ
CSNjbG9jay1jZWxscyA9IDwwPjsNCj4gKwkJY2xvY2stZnJlcXVlbmN5ID0gPDIwMDAwMDAwMD47
DQo+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJpbWdfaXBnX2NsayI7DQo+ICsJfTsNCj4gKw0K
PiArCWpwZWdkZWM6IGpwZWdkZWNANTg0MDAwMDAgew0KPiArCQlyZWcgPSA8MHg1ODQwMDAwMCAw
eDAwMDUwMDAwPjsNCj4gKwkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwOSBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19TUEkgMzEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0K
PiArCQkJICAgICA8R0lDX1NQSSAzMTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAg
IDxHSUNfU1BJIDMxMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdf
anBlZ19kZWNfbHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkgPCZpbWdfanBlZ19kZWNfbHBj
ZyBJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW5hbWVzID0gInBlciIsICJpcGciOw0KPiAr
CQlhc3NpZ25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2RlY19scGNnIElNWF9MUENHX0NMS18wPiwN
Cj4gKwkJCQkgIDwmaW1nX2pwZWdfZGVjX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQlhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+LCA8MjAwMDAwMDAwPjsNCj4gKwkJcG93ZXIt
ZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX01QPiwNCj4gKwkJCQk8JnBkIElNWF9T
Q19SX01KUEVHX0RFQ19TMD4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNfUzE+LA0K
PiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MyPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19S
X01KUEVHX0RFQ19TMz47DQo+ICsJfTsNCj4gKw0KPiArCWpwZWdlbmM6IGpwZWdlbmNANTg0NTAw
MDAgew0KPiArCQlyZWcgPSA8MHg1ODQ1MDAwMCAweDAwMDUwMDAwPjsNCj4gKwkJaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDMwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAgPEdJQ19T
UEkgMzA2IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAzMDcgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMwOCBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdfanBlZ19lbmNfbHBjZyBJTVhfTFBDR19DTEtf
MD4sDQo+ICsJCQkgPCZpbWdfanBlZ19lbmNfbHBjZyBJTVhfTFBDR19DTEtfND47DQo+ICsJCWNs
b2NrLW5hbWVzID0gInBlciIsICJpcGciOw0KPiArCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmltZ19q
cGVnX2VuY19scGNnIElNWF9MUENHX0NMS18wPiwNCj4gKwkJCQkgIDwmaW1nX2pwZWdfZW5jX2xw
Y2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAw
MDA+LCA8MjAwMDAwMDAwPjsNCj4gKwkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQ
RUdfRU5DX01QPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMD4sDQo+ICsJCQkJ
PCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfUzE+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdf
RU5DX1MyPiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMz47DQo+ICsJfTsNCj4g
Kw0KPiArCWltZ19qcGVnX2RlY19scGNnOiBjbG9jay1jb250cm9sbGVyQDU4NWQwMDAwIHsNCj4g
KwkJY29tcGF0aWJsZSA9ICJmc2wsaW14OHF4cC1scGNnIjsNCj4gKwkJcmVnID0gPDB4NTg1ZDAw
MDAgMHgxMDAwMD47DQo+ICsJCSNjbG9jay1jZWxscyA9IDwxPjsNCj4gKwkJY2xvY2tzID0gPCZp
bWdfaXBnX2Nsaz4sIDwmaW1nX2lwZ19jbGs+Ow0KPiArCQljbG9jay1pbmRpY2VzID0gPElNWF9M
UENHX0NMS18wPiwNCj4gKwkJCQk8SU1YX0xQQ0dfQ0xLXzQ+Ow0KPiArCQljbG9jay1vdXRwdXQt
bmFtZXMgPSAiaW1nX2pwZWdfZGVjX2xwY2dfY2xrIiwNCj4gKwkJCQkgICAgICJpbWdfanBlZ19k
ZWNfbHBjZ19pcGdfY2xrIjsNCj4gKwkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQ
RUdfREVDX01QPjsNCj4gKwl9Ow0KPiArDQo+ICsJaW1nX2pwZWdfZW5jX2xwY2c6IGNsb2NrLWNv
bnRyb2xsZXJANTg1ZjAwMDAgew0KPiArCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ci
Ow0KPiArCQlyZWcgPSA8MHg1ODVmMDAwMCAweDEwMDAwPjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0g
PDE+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJ
CWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xLXzA+LA0KPiArCQkJCTxJTVhfTFBDR19DTEtf
ND47DQo+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJpbWdfanBlZ19lbmNfbHBjZ19jbGsiLA0K
PiArCQkJCSAgICAgImltZ19qcGVnX2VuY19scGNnX2lwZ19jbGsiOw0KPiArCQlwb3dlci1kb21h
aW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19FTkNfTVA+Ow0KPiArCX07DQo+ICt9Ow0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNp
DQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNpDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzc2NGI0MTQ2ZTBh
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHFtLXNzLWltZy5kdHNpDQo+IEBAIC0wLDAgKzEsMTIgQEANCj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wKw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDIxIE5YUA0K
PiArICovDQo+ICsNCj4gKyZqcGVnZGVjIHsNCj4gKwljb21wYXRpYmxlID0gIm54cCxpbXg4cW0t
anBnZGVjIiwgIm54cCxpbXg4cXhwLWpwZ2RlYyI7IH07DQo+ICsNCj4gKyZqcGVnZW5jIHsNCj4g
Kwljb21wYXRpYmxlID0gIm54cCxpbXg4cW0tanBnZGVjIiwgIm54cCxpbXg4cXhwLWpwZ2VuYyI7
IH07DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0u
ZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpDQo+IGlu
ZGV4IDEyY2QwNTliMzM5Yi4uYWViYmUyYjg0YWExIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaQ0KPiBAQCAtMTY2LDExICsxNjYsMTMgQEANCj4gIAl9
Ow0KPiANCj4gIAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KPiArCSNpbmNsdWRl
ICJpbXg4LXNzLWltZy5kdHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4LXNzLWRtYS5kdHNpIg0KPiAg
CSNpbmNsdWRlICJpbXg4LXNzLWNvbm4uZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1sc2lv
LmR0c2kiDQo+ICB9Ow0KPiANCj4gKyNpbmNsdWRlICJpbXg4cW0tc3MtaW1nLmR0c2kiDQo+ICAj
aW5jbHVkZSAiaW14OHFtLXNzLWRtYS5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhxbS1zcy1jb25u
LmR0c2kiDQo+ICAjaW5jbHVkZSAiaW14OHFtLXNzLWxzaW8uZHRzaSINCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3MtaW1nLmR0c2kNCj4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLXNzLWltZy5kdHNpDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2EwODczMTc1OTFkDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4
cC1zcy1pbWcuZHRzaQ0KPiBAQCAtMCwwICsxLDEzIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMCsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAyMSBOWFANCj4gKyAq
CURvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQo+ICsgKi8NCj4gKw0KPiArJmpw
ZWdkZWMgew0KPiArCWNvbXBhdGlibGUgPSAibnhwLGlteDhxeHAtanBnZGVjIjsNCj4gK307DQo+
ICsNCj4gKyZqcGVnZW5jIHsNCj4gKwljb21wYXRpYmxlID0gIm54cCxpbXg4cXhwLWpwZ2VuYyI7
DQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OHF4cC5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNp
DQo+IGluZGV4IDFlNmI0OTk1MDkxZS4uYTYyNWZiNmJkYzYyIDEwMDY0NA0KPiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IEBAIC0yNTgsMTIgKzI1OCwxNCBA
QA0KPiAgCX07DQo+IA0KPiAgCS8qIHNvcnRlZCBpbiByZWdpc3RlciBhZGRyZXNzICovDQo+ICsJ
I2luY2x1ZGUgImlteDgtc3MtaW1nLmR0c2kiDQo+ICAJI2luY2x1ZGUgImlteDgtc3MtYWRtYS5k
dHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4LXNzLWNvbm4uZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14
OC1zcy1kZHIuZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1sc2lvLmR0c2kiDQo+ICB9Ow0K
PiANCj4gKyNpbmNsdWRlICJpbXg4cXhwLXNzLWltZy5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhx
eHAtc3MtYWRtYS5kdHNpIg0KPiAgI2luY2x1ZGUgImlteDhxeHAtc3MtY29ubi5kdHNpIg0KPiAg
I2luY2x1ZGUgImlteDhxeHAtc3MtbHNpby5kdHNpIg0KPiAtLQ0KPiAyLjE3LjENCg0K
