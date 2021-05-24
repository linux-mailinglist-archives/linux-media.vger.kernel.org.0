Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5611938E163
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 09:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhEXHSj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 May 2021 03:18:39 -0400
Received: from mail-vi1eur05on2075.outbound.protection.outlook.com ([40.107.21.75]:5280
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232339AbhEXHSh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 May 2021 03:18:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmqiGbfOj/Ujns2iD6cQlfMxtILPhgex1PexXboxQML9giRDYegrcLmb1ttJ/iKB5hfzx5gOm2Z7OiP2vYzTyyTujDH/j0zrIB4jZ4Sjb3+Cig9ZczVd6maZBgTUxuvUNqlhYfaYJAxJhDuF/ImEUvB56zTB67/jS08jMLMXqveWkZp+/WYVmiyiFlmOUBum3oxPLlpWz4EcyTw6MwIusHHb5odeY9lt9HpCFM9av6unmYacIi4Vhraslf13NQBjhqrle3rVbdPyt89S7mLRzNK48S7w30UZ6BPBZOGDbWTzCqf1X/GRk/CNMyulTmyd8HJx1eY5XxHPzMPaZQ595Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCFJJo1bVSaYGkmUmhEb5eTV5jHFtziF0zqRh1gXz1E=;
 b=kBsEznpgrFk2LaQf/tCn5lDeAv59rqVw8Ffq77XhYw9Rb6n+sPg84WtZuXQiaKKRV50PjPzuDtbaBtO7ewGrQgcl0dw6WK62cbIk5QbWvfOSOMpT0Fr+TegHbuDspl29bVJHH1Ae623t7JTl0l6JMtHMSJnZmUo23Zctrujbhe4DeEDoOP5oUjdQOi9q2EKYFojkJzkpkGGaDC7MZ0J22pzRpqgAPjx1R9MYds/42JN80WlP1uS9HXUOjayYrCVmwLpFUVGlso/peOrxUHhtiqRwghAlVM3QXaWbbxETqrREH7wdgG7w/TUuO/rLFX6sI54JapxM3vizg0BEjCcHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCFJJo1bVSaYGkmUmhEb5eTV5jHFtziF0zqRh1gXz1E=;
 b=VDyDWONn/fJSBqIwlZA3l4VOJRQy2B2vPZci07sv60vzBoUn5FwdwFhS+HdHZKEvX7oIaBUyYlU5JB1aDty0K68FXUzrudgwOFKEjHj2m61tDt9/HKLdinJv953wTM9sZvPHY3wmqodKxlkAFE+b61S5rJ09EgdGHOSj290cdeE=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4759.eurprd04.prod.outlook.com (2603:10a6:20b:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 07:17:07 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 07:17:07 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v13 2/2] arm64: dts: imx: Add jpeg encoder/decoder nodes
Thread-Index: AQHXT08lZrgmjiZOP069Zd77XqoFn6rx+wUAgAA/9wA=
Date:   Mon, 24 May 2021 07:17:07 +0000
Message-ID: <e4c174afd7c55c56c68afbe69276b41c3f574964.camel@nxp.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
         <20210522211055.15988-3-mirela.rabulea@oss.nxp.com>
         <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB8477D8F7DC86E67F74D5D9F780269@DB9PR04MB8477.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6d9666a-eab4-47eb-1a80-08d91e83f08c
x-ms-traffictypediagnostic: AM6PR04MB4759:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB47597A1752D547B4000F531A8F269@AM6PR04MB4759.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Euh4FZMKiA0zpBKkYFjAeEzHQ9keq4obYAWko7L8bCbQu5qo5g5kTaXSR1XfPBokmrMoGRACSiJe9aVfrD4NTMZrMh9NMseEIcysXzqraTXj8w5xe8zJicJSLy+CJPWYJclNw8+iJhdkv+USNuRJ6rksSvggoRUv3vR8lgyUeWwhXe0Y8bR6BpETdbONnXMLvFAklNTxmV4tSOYoeoT6z+QkeTgQtFiEu0KrBIohcQJXGMYv+J9uMV6pND1Rb4/zaOKR4qkFiJxB0uZ7dO/8S67p5A3G6F1EAEUwrha/f+/OW8aRdTt+AYZhKhtsM/EjqZLoKubmw3Z4I0Ix+Bc44iNR9G5IfhLELycFXPXXAU1JKiLecE9HqiKGzgpoohUQg2V2A9RjSnHu+mCRT3cUPZiRNfK/oz0ywzKeJEcr41eV02yuUGms2MIXSv/R64BfGrzQ980sk3CNQq7BKkRnFcPNrYKSDI/Eu5+Scw0bWr/6v7mb6Uiej40MbXbBYvfMpT7KmDkchz26xM5+PQj0xPfszKxFM4SzL0F/fuFnH3S79jE/dBWXebtRg2yZhba5Lf4jzU3MckXaHW2jJCjqem/lET/0zrD2Uqc6KLJOoWQsigKbs8Z4mKOjQZEL/fbaI0yxEzFjp6T3Ys4qJiSBWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(5660300002)(8936002)(6512007)(478600001)(38100700002)(26005)(186003)(110136005)(53546011)(54906003)(36756003)(8676002)(83380400001)(122000001)(66446008)(91956017)(2616005)(6486002)(66556008)(316002)(6636002)(6506007)(66946007)(2906002)(44832011)(71200400001)(64756008)(7416002)(4326008)(66476007)(86362001)(76116006)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZTNnTlZhL09zdE90bS9IODdiTHBQZ0NEcXZVdTFZWUFLVUE4em9EQWh5dW5B?=
 =?utf-8?B?VkFpcjVyb0g5OEJCeTFqUXdOWlFEV1RFTml2WklTZnV0RXRwWFFyY1FKNlBu?=
 =?utf-8?B?NVZlcURRWTM2M3I4SlM2YjI4SG1BRWhRVXUwbU9mRGM0bHFOeEhLMTN4YitT?=
 =?utf-8?B?RUkxZE4wTmFWcjJVK1NndUhsR293c2h1RVdpcTFXb0VVWEZxOVJWM1hBcFBh?=
 =?utf-8?B?SDE0NXdlWTJRYXJXMzhmU2NRK0JqUkJhUnFPaGtybGFHMWNlKzJqN1ZjWkxP?=
 =?utf-8?B?OTJ2L2NzeC8yUVpJQ2thRzJjbkNFeC9ZL1J1UkpxbGhiR1NkOUdBSXJRUXU3?=
 =?utf-8?B?blBJRVNobVBUS2czQStVWEhjZ1VETnRmTTdEK0E0eTVEUG1kRE9wSTlDR28x?=
 =?utf-8?B?ZnZtL0pzVmwxSlRhY0ljUlc2SzVuY1NnaUtDeEVQaU5vRzZwdk5kUmE3T1Jk?=
 =?utf-8?B?Wm1qL2w0bmF3UVd3T1VWT2NmWWxuTm1xSXoxaml3Zjh4T2JaYlNrVVp0VWFS?=
 =?utf-8?B?aldLL0hwZDE1elRFTHZlTS81bWxtNVJlL0JGengwWTRzUy9KdWltRUEyeVc4?=
 =?utf-8?B?ekdvU2Y0OWpxUDNHa1ZodnJHL1o0YlJKU3hWcFAxeU9ncy9MUDR2Q2JpQnFZ?=
 =?utf-8?B?eDM5cHVjeWRnanljdXdXNkpReitZU29DRlRSQ29CVDlOVmJkeVVIMDFyRk0x?=
 =?utf-8?B?cVZxb3o3OFZVSmh0Zlp2SFpFalFXaHkwWkVXZXYvVURpekRCSFJsM1VoaVBK?=
 =?utf-8?B?VjVJMGxTRlNweW10Y1JyejVMcjQ5OXZSdEM4U2dkTmJjZGZ2UlBmbk9nemdF?=
 =?utf-8?B?RXJVc013UmREeGI3Wmd3TjUranZDYjAvMlNPVkkxckdveVlIbVJMZjJzS3VC?=
 =?utf-8?B?UXJCTDh0c2ZRdnozUWRDSTJLcUE0L2ZyUlg3UWRpUjVmaDBHMVgvWnhQbmhp?=
 =?utf-8?B?bWkydTlqRGRSNzhYQ2JMcjdSYWZIMXJGbXJsUk1tblkvTGh0MFF2c25sQVBa?=
 =?utf-8?B?ZmxOdFRpeE1YUm9WdkcwSnExbmdFeFYxVG5lNzdYY0J4RFJkRDlmNzlkNFA2?=
 =?utf-8?B?TFAzbkVUSUJ5TW9SS2ZiSUJMM254cms3OXZPWW1NUVZ5NXBROURSV05TYkRE?=
 =?utf-8?B?cmZ3Smk2dDNybWIyZzU0Z1d5RVl3MCs4ckZGcXRSVnozNDFXdDJ4dmVteEp2?=
 =?utf-8?B?eEdodExUZXdwKzVKR1FYTEI4U1NvSnNlUWFuZTUrRWxFb3YrWStxNzNHek1Y?=
 =?utf-8?B?L3lZcm1qZDhsVHpFUWZENEczeVI5MnNucWJoREJHY3paQkgxcDdHaFJ6TmxL?=
 =?utf-8?B?Qm9kcUNkRHJkRWE4YXc1Yk1hT0pxa1ZSTk5hcSsyS1d1SmhXdWxmNXRmMFZP?=
 =?utf-8?B?N0tjTGhlVkZSZTRmZmZJbFZzVk0rLzBQZXp0WnRSYjlqRWhOTVF6emxCNFEv?=
 =?utf-8?B?bjVXVTJFU1JFTVA0T2N6Mk1CQTJ3UDdlaTlTNVN0N3FUZUtkeFA0QUZLRWJC?=
 =?utf-8?B?S1J2c2sxdUFGaUNMazVEWmhMRHVFaDR6SnkzbDU2c1k5SUVKS0hRbDF3R1FY?=
 =?utf-8?B?REJyRVNLREtUUjRVZWJCa1B5ME5KRXdEUlJzQ2xoZG4veVlsMjZtdWVTZkZq?=
 =?utf-8?B?bUw1OGVRUzNNRXN6VTdEd0o3bUoxZkplY1lIc2hmb2M0c2FxZkhyTjBUTFo5?=
 =?utf-8?B?U0FTTTRKUnlrN0MybVFMcWhFL09tRlRzbzl0S3RVN3dMR2NXVWNEMmd5TlpJ?=
 =?utf-8?Q?162AupQphc5jbC+VUTPwQT/wpZ2uByUeLE+5KTh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D247A4D42EAA640B6495C1813620118@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d9666a-eab4-47eb-1a80-08d91e83f08c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 07:17:07.2929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVkYmm7PwGHelscQKtt1y+yf1Uk4E2pRLji8RuvHzcsAIxqbmjLTNohs59P3QtEadHryjJX4s3hpi/zO3V2Zig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4759
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQWlzaGVuZywgRXplcXVpZWwsDQoNCk9uIE1vbiwgMjAyMS0wNS0yNCBhdCAwMzoyOCArMDAw
MCwgQWlzaGVuZyBEb25nIHdyb3RlOg0KPiA+IEZyb206IE1pcmVsYSBSYWJ1bGVhIChPU1MpIDxt
aXJlbGEucmFidWxlYUBvc3MubnhwLmNvbT4NCj4gPiBTZW50OiBTdW5kYXksIE1heSAyMywgMjAy
MSA1OjExIEFNDQo+ID4gU3ViamVjdDogW1BBVENIIHYxMyAyLzJdIGFybTY0OiBkdHM6IGlteDog
QWRkIGpwZWcgZW5jb2Rlci9kZWNvZGVyDQo+ID4gbm9kZXMNCj4gPiANCj4gDQo+IHMvaW14L2lt
eDgNCg0KT2ssIEknbGwgdXNlIGlteDggaW4gcGF0Y2ggc3ViamVjdC4NCg0KPiANCj4gPiANCj4g
PiBBZGQgZHRzIGZvciBpbWFnaW5nIHN1YnN5dGVtLCBpbmNsdWRlIGpwZWcgbm9kZXMgaGVyZS4N
Cj4gPiBUZXN0ZWQgb24gaW14OHF4cC9xbS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXJl
bGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2Vz
IGluIHYxMzoNCj4gPiAgIEFkcmVzcyBmZWVkYmFjayBmcm9tIEFpc2hlbmcgRG9uZyBhbmQgdXBk
YXRlIHRoZSBjb21taXQgbWVzc2FnZToNCj4gPiAgIC0gTW92ZSBqcGVnIGNvbXBhdGlibGVzIGZy
b20gaW14OC1zcy1pbWcuZHRzaSB0byBpbXg4cXhwLXNzLQ0KPiA+IGltZy5kdHNpDQo+ID4gICAt
IEFkZCBpbXg4cW0tc3MtaW1nLmR0c2kgZm9yIGkuTVg4UU0NCj4gPiANCj4gPiAgLi4uL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpIHwgODANCj4gPiArKysrKysrKysr
KysrKysrKysrDQo+ID4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNp
ICAgICB8IDEyICsrKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0u
ZHRzaSAgICAgfCAgMiArDQo+ID4gIC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1p
bWcuZHRzaSAgICB8IDEzICsrKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cXhwLmR0c2kgICAgfCAgMiArDQo+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTA5IGluc2VydGlv
bnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS1zcy0NCj4gPiBpbWcuZHRzaQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy0NCj4g
PiBpbWcuZHRzaQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVz
Y2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjRiODQ1NmJiNDcxMg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gQEAg
LTAsMCArMSw4MCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCsN
Cj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IDIwMTktMjAyMSBOWFANCj4gPiArICogWmhvdSBH
dW9uaXUgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4gKyAqLw0KPiA+ICtpbWdfc3Vic3lzOiBi
dXNANTgwMDAwMDAgew0KPiA+ICsJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gPiArCSNh
ZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsJI3NpemUtY2VsbHMgPSA8MT47DQo+ID4gKwlyYW5n
ZXMgPSA8MHg1ODAwMDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiA+ICsNCj4gPiAr
CWltZ19pcGdfY2xrOiBjbG9jay1pbWctaXBnIHsNCj4gPiArCQljb21wYXRpYmxlID0gImZpeGVk
LWNsb2NrIjsNCj4gPiArCQkjY2xvY2stY2VsbHMgPSA8MD47DQo+ID4gKwkJY2xvY2stZnJlcXVl
bmN5ID0gPDIwMDAwMDAwMD47DQo+ID4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19pcGdf
Y2xrIjsNCj4gPiArCX07DQo+ID4gKw0KPiA+ICsJanBlZ2RlYzoganBlZ2RlY0A1ODQwMDAwMCB7
DQo+IA0KPiBOb2RlIHNob3VsZCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0Lg0KPiBBbmQgZW5hYmxl
IGl0IGluIGJvYXJkIGR0cyBpbmNsdWRpbmcgTFBDRy4NCg0KQXQgdmVyc2lvbiB2NSBvZiB0aGlz
IHBhdGNoLCB0aGUgbm9kZSB3YXMgZGlzYWJsZWQgYnkgZGVmYXVsdCwgYW5kIEkNCnJlY2VpdmVk
IHRoaXMgZmVlZGJhY2sgZnJvbSBFemVxdWllbCBHYXJjaWE6DQoNCiJQdXJlIG1lbW9yeS10by1t
ZW1vcnkgYXJlIHR5cGljYWxseSBub3QgZW5hYmxlZCBwZXItYm9hcmQsIGJ1dCBqdXN0DQpwZXIt
cGxhdGZvcm0uDQpTbyB5b3UgY2FuIGRyb3AgdGhlIGRpc2FibGVkIHN0YXR1cyBoZXJlLiINCg0K
U28sIGluIHY2IEkgbWFkZSBpdCBlbmFibGVkIGJ5IGRlZmF1bHQuDQoNCkFueSBzdHJvbmcgcmVh
c29ucyBmb3IgZW5hYmxlZC9kaXNhYmxlZCBwZXIgcGxhdGZvcm0/DQoNClRoYW5rcywNCk1pcmVs
YQ0KDQo+IA0KPiA+ICsJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAwMDAgPjsNCj4gPiArCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA5IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsJCQkg
ICAgIDxHSUNfU1BJIDMxMCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArCQkJICAgICA8R0lD
X1NQSSAzMTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCSAgICAgPEdJQ19TUEkgMzEy
IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiA+ICsJCWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2xw
Y2cgSU1YX0xQQ0dfQ0xLXzA+LA0KPiA+ICsJCQkgPCZpbWdfanBlZ19kZWNfbHBjZyBJTVhfTFBD
R19DTEtfND47DQo+ID4gKwkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4gKwkJYXNz
aWduZWQtY2xvY2tzID0gPCZpbWdfanBlZ19kZWNfbHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ID4g
KwkJCQkgIDwmaW1nX2pwZWdfZGVjX2xwY2cgSU1YX0xQQ0dfQ0xLXzQ+Ow0KPiA+ICsJCWFzc2ln
bmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD4sIDwyMDAwMDAwMDA+Ow0KPiA+ICsJCXBvd2Vy
LWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19NUD4sDQo+ID4gKwkJCQk8JnBkIElN
WF9TQ19SX01KUEVHX0RFQ19TMD4sDQo+ID4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19T
MT4sDQo+ID4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMj4sDQo+ID4gKwkJCQk8JnBk
IElNWF9TQ19SX01KUEVHX0RFQ19TMz47DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWpwZWdlbmM6
IGpwZWdlbmNANTg0NTAwMDAgew0KPiANCj4gRGl0dG8NCj4gDQo+ID4gKwkJcmVnID0gPDB4NTg0
NTAwMDAgMHgwMDA1MDAwMCA+Ow0KPiA+ICsJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzMDUgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKwkJCSAgICAgPEdJQ19TUEkgMzA2IElSUV9UWVBFX0xF
VkVMX0hJR0g+LA0KPiA+ICsJCQkgICAgIDxHSUNfU1BJIDMwNyBJUlFfVFlQRV9MRVZFTF9ISUdI
PiwNCj4gPiArCQkJICAgICA8R0lDX1NQSSAzMDggSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4g
KwkJY2xvY2tzID0gPCZpbWdfanBlZ19lbmNfbHBjZyBJTVhfTFBDR19DTEtfMD4sDQo+ID4gKwkJ
CSA8JmltZ19qcGVnX2VuY19scGNnIElNWF9MUENHX0NMS180PjsNCj4gPiArCQljbG9jay1uYW1l
cyA9ICJwZXIiLCAiaXBnIjsNCj4gPiArCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2Vu
Y19scGNnIElNWF9MUENHX0NMS18wPiwNCj4gPiArCQkJCSAgPCZpbWdfanBlZ19lbmNfbHBjZyBJ
TVhfTFBDR19DTEtfND47DQo+ID4gKwkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAw
PiwgPDIwMDAwMDAwMD47DQo+ID4gKwkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQ
RUdfRU5DX01QPiwNCj4gPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MwPiwNCj4gPiAr
CQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MxPiwNCj4gPiArCQkJCTwmcGQgSU1YX1NDX1Jf
TUpQRUdfRU5DX1MyPiwNCj4gPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MzPjsNCj4g
PiArCX07DQo+ID4gKw0KPiA+ICsJaW1nX2pwZWdfZGVjX2xwY2c6IGNsb2NrLWNvbnRyb2xsZXJA
NTg1ZDAwMDAgew0KPiANCj4gRGl0dG8NCj4gDQo+ID4gKwkJY29tcGF0aWJsZSA9ICJmc2wsaW14
OHF4cC1scGNnIjsNCj4gPiArCQlyZWcgPSA8MHg1ODVkMDAwMCAweDEwMDAwPjsNCj4gPiArCQkj
Y2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKwkJY2xvY2tzID0gPCZpbWdfaXBnX2Nsaz4sIDwmaW1n
X2lwZ19jbGs+Ow0KPiA+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xLXzA+LA0KPiA+
ICsJCQkJPElNWF9MUENHX0NMS180PjsNCj4gPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiaW1n
X2pwZWdfZGVjX2xwY2dfY2xrIiwNCj4gPiArCQkJCSAgICAgImltZ19qcGVnX2RlY19scGNnX2lw
Z19jbGsiOw0KPiA+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19N
UD47DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWltZ19qcGVnX2VuY19scGNnOiBjbG9jay1jb250
cm9sbGVyQDU4NWYwMDAwIHsNCj4gPiArCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ci
Ow0KPiANCj4gRGl0dG8NCj4gDQo+IE90aGVyd2lzZSwgSSdtIGZpbmUgd2l0aCB0aGlzIHBhdGNo
Lg0KPiANCj4gPiArCQlyZWcgPSA8MHg1ODVmMDAwMCAweDEwMDAwPjsNCj4gPiArCQkjY2xvY2st
Y2VsbHMgPSA8MT47DQo+ID4gKwkJY2xvY2tzID0gPCZpbWdfaXBnX2Nsaz4sIDwmaW1nX2lwZ19j
bGs+Ow0KPiA+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xLXzA+LA0KPiA+ICsJCQkJ
PElNWF9MUENHX0NMS180PjsNCj4gPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiaW1nX2pwZWdf
ZW5jX2xwY2dfY2xrIiwNCj4gPiArCQkJCSAgICAgImltZ19qcGVnX2VuY19scGNnX2lwZ19jbGsi
Ow0KPiA+ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+
ID4gKwl9Ow0KPiA+ICt9Ow0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4cW0tc3MtaW1nLmR0c2kNCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxbS1zcy1pbWcuZHRzaQ0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi43NzY0YjQxNDZlMGENCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLXNzLWltZy5kdHNpDQo+
ID4gQEAgLTAsMCArMSwxMiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCsNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IDIwMjEgTlhQDQo+ID4gKyAqLw0KPiA+
ICsNCj4gPiArJmpwZWdkZWMgew0KPiA+ICsJY29tcGF0aWJsZSA9ICJueHAsaW14OHFtLWpwZ2Rl
YyIsICJueHAsaW14OHF4cC1qcGdkZWMiOyB9Ow0KPiA+ICsNCj4gPiArJmpwZWdlbmMgew0KPiA+
ICsJY29tcGF0aWJsZSA9ICJueHAsaW14OHFtLWpwZ2RlYyIsICJueHAsaW14OHF4cC1qcGdlbmMi
OyB9Ow0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
cW0uZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kN
Cj4gPiBpbmRleCAxMmNkMDU5YjMzOWIuLmFlYmJlMmI4NGFhMSAxMDA2NDQNCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cW0uZHRzaQ0KPiA+ICsrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhxbS5kdHNpDQo+ID4gQEAgLTE2NiwxMSArMTY2
LDEzIEBADQo+ID4gIAl9Ow0KPiA+IA0KPiA+ICAJLyogc29ydGVkIGluIHJlZ2lzdGVyIGFkZHJl
c3MgKi8NCj4gPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0KPiA+ICAJI2luY2x1ZGUg
ImlteDgtc3MtZG1hLmR0c2kiDQo+ID4gIAkjaW5jbHVkZSAiaW14OC1zcy1jb25uLmR0c2kiDQo+
ID4gIAkjaW5jbHVkZSAiaW14OC1zcy1sc2lvLmR0c2kiDQo+ID4gIH07DQo+ID4gDQo+ID4gKyNp
bmNsdWRlICJpbXg4cW0tc3MtaW1nLmR0c2kiDQo+ID4gICNpbmNsdWRlICJpbXg4cW0tc3MtZG1h
LmR0c2kiDQo+ID4gICNpbmNsdWRlICJpbXg4cW0tc3MtY29ubi5kdHNpIg0KPiA+ICAjaW5jbHVk
ZSAiaW14OHFtLXNzLWxzaW8uZHRzaSINCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1pbWcuZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1pbWcuZHRzaQ0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zYTA4NzMxNzU5MWQNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC1zcy1p
bWcuZHRzaQ0KPiA+IEBAIC0wLDAgKzEsMTMgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjArDQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAyMDIxIE5YUA0KPiA+
ICsgKglEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KPiA+ICsgKi8NCj4gPiAr
DQo+ID4gKyZqcGVnZGVjIHsNCj4gPiArCWNvbXBhdGlibGUgPSAibnhwLGlteDhxeHAtanBnZGVj
IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gKyZqcGVnZW5jIHsNCj4gPiArCWNvbXBhdGlibGUgPSAi
bnhwLGlteDhxeHAtanBnZW5jIjsNCj4gPiArfTsNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiBpbmRleCAxZTZiNDk5NTA5MWUuLmE2MjVm
YjZiZGM2MiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cXhwLmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
cXhwLmR0c2kNCj4gPiBAQCAtMjU4LDEyICsyNTgsMTQgQEANCj4gPiAgCX07DQo+ID4gDQo+ID4g
IAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KPiA+ICsJI2luY2x1ZGUgImlteDgt
c3MtaW1nLmR0c2kiDQo+ID4gIAkjaW5jbHVkZSAiaW14OC1zcy1hZG1hLmR0c2kiDQo+ID4gIAkj
aW5jbHVkZSAiaW14OC1zcy1jb25uLmR0c2kiDQo+ID4gIAkjaW5jbHVkZSAiaW14OC1zcy1kZHIu
ZHRzaSINCj4gPiAgCSNpbmNsdWRlICJpbXg4LXNzLWxzaW8uZHRzaSINCj4gPiAgfTsNCj4gPiAN
Cj4gPiArI2luY2x1ZGUgImlteDhxeHAtc3MtaW1nLmR0c2kiDQo+ID4gICNpbmNsdWRlICJpbXg4
cXhwLXNzLWFkbWEuZHRzaSINCj4gPiAgI2luY2x1ZGUgImlteDhxeHAtc3MtY29ubi5kdHNpIg0K
PiA+ICAjaW5jbHVkZSAiaW14OHF4cC1zcy1sc2lvLmR0c2kiDQo+ID4gLS0NCj4gPiAyLjE3LjEN
Cj4gDQo+IA0K
