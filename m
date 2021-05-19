Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD08388690
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 07:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240874AbhESFe6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 01:34:58 -0400
Received: from mail-eopbgr140080.outbound.protection.outlook.com ([40.107.14.80]:27222
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241627AbhESFea (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 01:34:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/IJPdNOx+xvR1oCV5ZGwHY0gpyfUnSQ5zwbZ8f7BPXMGkzcvcP4W0VS6Jccjloy5WgulxgBImapEhrU1qnEsnSeM4t61Rxpla8a9cifaMCETJP8nDmxLyiE5J8nV1TtTBRqMWPi67UdJLQOzSrU3Ohn7aM00JRWzkUmbE+OYwA4aMTjE2rNvEsWtMZMGdyNAnSral9XHONxse3w/7X12dvgSwysk5CYJYukqF2xD3u9OTjO1Kg28WC735qGZiUGDCvxd5boopdscH1vHG9k3arM6iEjcGhnBDRNsHiifiNNl6k6AosERDQ//6Xxxgv05u0uhx7pFfaK81sH3KiGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/luFCRd2W5PkNv7cZvJY8cNAJD1o9/XJtmhbvc+0c4=;
 b=Q8AwSfMhd7C6UoHLD0kmz53h4cHswtyl5h6slvM6rMSYSxeSxbeLjY533gnWXxidsjLoHOHUx5byKZb8oIlh4XwTbbvsXl6U+wexv+tNop8PNXhLYANkTmigABCaOox+RcvJqdWDk5ien+e6LHvKxzD0DME1Td32QbNMZlirzX7VU1hP+Xc5DRMHt7yHTsbscGz/psrohCy7GlVUMeQKL2ZbTmgGsxttBAJ2IJEl2val4NXJwBM4nTOyYrOaT9GiskhnGsUkl5N37jm/xCRHSBD0Qc1yPjuljCh64pUWRCuMYw6L482TRrZJ5E1kqWGPmpnZJ3adf53kwITeXgisYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/luFCRd2W5PkNv7cZvJY8cNAJD1o9/XJtmhbvc+0c4=;
 b=iGv5lIfpgfEeHMLoLE4NuxOSTrdbYqqtS1A4UoxwYp/qYp/bkLB3S0ao/BPgMWFrplYMC5htrjY0yns/AfXcHd8Lr+6tvXzQ8q9oU8bpkssdtjjtoTyvD8BuzXDYlfF57zxqFgA0M0JNuthAZDa8Ma+chGI2iKaQDetrSG/U0i4=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 05:33:01 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::31a9:4de7:806f:93eb%5]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 05:33:01 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "shawnguo@kernel.org" <shawnguo@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v11] arm64: dts: imx8qxp: Add jpeg
 encoder/decoder nodes
Thread-Topic: [EXT] Re: [PATCH v11] arm64: dts: imx8qxp: Add jpeg
 encoder/decoder nodes
Thread-Index: AQHXOClw0Sman3LmCU6j5KBIgM4Hk6rhJaCAgAlK4AA=
Date:   Wed, 19 May 2021 05:33:01 +0000
Message-ID: <46b11b5f7664d4ab4ac0993c70e262c6798d86f3.camel@nxp.com>
References: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
         <20210513073832.GS3425@dragon>
In-Reply-To: <20210513073832.GS3425@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e50890b2-c367-4553-4c11-08d91a8791d1
x-ms-traffictypediagnostic: AS8PR04MB8119:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB8119EB0E29FB5662D592DCB68F2B9@AS8PR04MB8119.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zY9DihhZm1NoGGprE3ELUVl/rFt6pnNuAolL0+so16u2IyOEOhPy/YZwlBl3BOWjNAcwed5TOv0O3301kEHj49gPZhRDox7TsMrLftILtwjB9uWBXuWHiJ2hR8x/+7yiA6Yk2N4VqV2ZprqmrC1E5YRB12I4L4vb7KwW3OXGVbifJaDGpWjqXrufjTKzb0x21hysF6O06UXXn9ZhKQAycTBDp1tKjjtcQDIPqGVEJQFS19gH4DpYM+2LPu/gtK9LjEJB+ClYimJgj2/AiNj6FNra2YM0vG15U3dSCszpjT2nst+xi28vmFUs9d3iBXALdcwbnz20Ce/YSwF2mEadomdjj4ypTQmkUHY/NhwgBAIUJ3LO9TGN0uwPLS5DS+pK4bugl8fjoX+cG6aLUmwUEAltXEelPqkjOsFk/QoOcCp+UZgW7RszV8//z4iPPjdI2HJnykt9H57dEYGry0XUzs8ukKyDRUx+KlEpPJZT/cSl3BGz82gviIyB/zxSExq+LbycljI0PGD8y5QTzxYeZP/uGhDn/HQX6+USmX1J6evLDIOnCO+aA8MDIRES5o77rGmKTaQP8sG5fEodBq4ZGn3+GoLulHT4ASHDNICn2LVHJpGx2u8gY7KGDQh9MSMl77uUfnvb+1PJGKEVszNYgkxT4i2pqVwLq2h+X+0InHM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(2616005)(6486002)(44832011)(26005)(5660300002)(2906002)(38100700002)(4326008)(122000001)(7416002)(71200400001)(478600001)(54906003)(8676002)(6506007)(36756003)(64756008)(8936002)(83380400001)(86362001)(66446008)(66476007)(316002)(6512007)(66556008)(91956017)(66946007)(186003)(6916009)(76116006)(99106002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YVB6UlZ4QlF4NklTQzFVakxKUDhDSkhNak9idVl2Z1RKSllyS1JYd3pYV0ky?=
 =?utf-8?B?VENEOUV4Z05FdjRNMHJpVGdQREs1SUlKdTF5Z2VVQmdPUkZWeGFQYXlPZTlr?=
 =?utf-8?B?Vk85ZnVDOUdkeDdPcW9oSFgwQ3JIQks1UkVBclVGUCtWMW9paURCcTRiNkJF?=
 =?utf-8?B?YUE0UnZxajZGRWNRb29tckVrcC9ZN3VHeEVFSXhqWnVkRlpmSy8vYXBISnQ5?=
 =?utf-8?B?am5SU0pxdlBYOXlkeCs2NUpwR1Y3WUZZcGt3WVRiTnByRE83SGlTVGVEYXFP?=
 =?utf-8?B?L0xTVjM3MXIzaXR2Nkpqa1Fuak9yOHNUZ2NYMFppV0Z1Ykk0cUMxRjc5cklz?=
 =?utf-8?B?K2xLMU42ZVJYTzFZc04yOUFXWklMaFRWdXBwUUMrWTFCbXY3WXNwT25lRjE2?=
 =?utf-8?B?Nms4QUsraVE0ajZTRHlhSGlmY2tLU1lwMU4zeVF0Z29Zb1ZtV3lnTmdsYk9C?=
 =?utf-8?B?MkdKNzBHeXhBVE5IYUM0NnI1Q0JIajlQTk55anVYVlBKNmxGb081OHcyYStG?=
 =?utf-8?B?R2J3NUdnNjNEY28zMUpyU1ZTckc0ZGRVT3VubFhTemNtWVZQc0JrOG1FbkJr?=
 =?utf-8?B?YS9RTmgwcUFDbS9ralJrRmFYVExYZXJrSDFTTEZRR2tCOUs5WnlWU3oxdmlH?=
 =?utf-8?B?S08vbTlEVFdKR1JpNGhWMktpbWhJeVFXTWZacm5HWE9UeGtQRTJQdTNiRExz?=
 =?utf-8?B?VWlVME5rbXMxWTBlbDJLTGtUdWFiNEs2cDB2N0djWjJ3b1JGRzhlR2dEWURo?=
 =?utf-8?B?RFJEeitjRlllQTMxdWFMUmVNdGRvVWdYemUzNTdkRHEvWjh4YWJFMExydVZz?=
 =?utf-8?B?TTFoaU1Pd21wNDdSV2Uyc0ZjQStLTHRhOFV0VDRnQWcyTVRoU3FmVWpwQnRz?=
 =?utf-8?B?MTM2U2owb3ovS3RjNk10a05KQkdFNzRqd2FYR29sYTNoeFpHamlsRkg4VXk1?=
 =?utf-8?B?UStnYTcyYURSSFBiY0NBK1JBdE11a0V6L1RVZUY4VVdwU25lVTdOb0JaRThh?=
 =?utf-8?B?b21GS0FyQWVwWmpsa0lmc1FuazlOblJjSVNNeWZkQWNuUkZqdmRHaFRMZmh3?=
 =?utf-8?B?YnoyVWo1aWN4bC9zQkFVT3NMbUxDVWZaWlJCWFN0MWFzQVM1ck9vU0hjMDZK?=
 =?utf-8?B?dkJLZ1ZTWllMR2M0T1BQWFVvM3pTL01sVU0rR3VhYWtCalBpUzR4RUpZT0NQ?=
 =?utf-8?B?N1dhT3dUZk81UE9qSExweWhmMGxIb2xodDkrNjFZeHdYRjUzWDFDMjZoT2kv?=
 =?utf-8?B?cmhXWmo2YnV5UDFYTEpCN3BReVQ4dU1acmQxSUdPTzNMVUlmNDRiQTYwY1BZ?=
 =?utf-8?B?c3dzbEhYWDhPaDFmemhWTzZSWTdkVzVON2V5b0ZyaDF0ZStuZis2UmRIMm9O?=
 =?utf-8?B?OWtyZDVpMks2ZElKTVgxditRZGpjMEhsMjVYN0NSNVZBUFl0WlRrRjlubnox?=
 =?utf-8?B?ejU1eWw4ZVNZQ1JsTFpvTkF2Y1lka1F3UTQ2VUtaNnFzR2FkL0t3WTdIRE0w?=
 =?utf-8?B?SUs1eExzSkxRWTZ4TjhjM3BrWnRLWVBsVzZEN29SU3hKOENHMWF0Yjh3bzRL?=
 =?utf-8?B?QVJWQkR0MkpMYUQrbXhwYU13Z29iWFc4RzBnRXhhUkpXSUF3bkxpcklRVkJG?=
 =?utf-8?B?WTZmaGgrS0F0clg1Q0JYK1ExMTVyTHdhMDZPUjlYOGZvRkorbGx4L1hBbVpF?=
 =?utf-8?B?QTkxNzd4dXdIR3p4TlFFQm1lMHlVcXRMcHlKUkF3QzhQeTdzdmMyb3ZLMjdl?=
 =?utf-8?Q?m7egUM3OOcD/8G1HknZBXm+Q/Bx0z3rHvH38f/X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0A1B2017A67354B9A455D2C2446A21C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50890b2-c367-4553-4c11-08d91a8791d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 05:33:01.7986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ww/ok05dfY65IGn8o+VFofAaKpgiKBkNiPTfvSVPeOv2bFjzwVPEg1FN3U2QDxUUT/IjBwppwDGDTcdPjxF73Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2hhd24sDQoNCk9uIFRodSwgMjAyMS0wNS0xMyBhdCAxNTozOCArMDgwMCwgU2hhd24gR3Vv
IHdyb3RlOg0KPiANCj4gT24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMDE6MTQ6MTRQTSArMDMwMCwg
TWlyZWxhIFJhYnVsZWEgKE9TUykgd3JvdGU6DQo+ID4gRnJvbTogTWlyZWxhIFJhYnVsZWEgPG1p
cmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+ID4gDQo+ID4gQWRkIGR0cyBmb3IgaW1hZ2luZyBzdWJz
eXRlbSwgaW5jbHVkZSBqcGVnIG5vZGVzIGhlcmUuDQo+ID4gVGVzdGVkIG9uIGlteDhxeHAgb25s
eSwgc2hvdWxkIHdvcmsgb24gaW14OHFtLCBidXQgaXQgd2FzIG5vdA0KPiA+IHRlc3RlZC4NCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhw
LmNvbT4NCj4gDQo+IFNvIHRoZSBiaW5kaW5ncyBhbmQgZHJpdmVyIHBhcnRzIGhhdmUgYmVlbiBh
Y2NlcHRlZCBhbHJlYWR5Pw0KDQpZZXMsIHRoZXkgYXJlIGFscmVhZHkgaW4gbGludXgtbmV4dC4N
Cg0KPiANCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYxMToNCj4gPiAgIEFkcmVzcyBmZWVkYmFj
ayBmcm9tIEFpc2hlbmcgRG9uZzoNCj4gPiAgIC0gUmVuYW1lIGltZ19qcGVnX2RlY19jbGsvaW1n
X2pwZWdfZW5jX2NsayB0bw0KPiA+IGpwZWdfZGVjX2xwY2cvanBlZ19lbmNfbHBjZyB0byBtYWtl
IGl0IHZpc2libGUgaXQncyBscGNnIG5vdCBvdGhlcg0KPiA+IHR5cGUgb2YgY2xrDQo+ID4gICAt
IERyb3AgdGhlIGNhbWVyYWRldiBub2RlLCBub3QgbmVlZGVkIGZvciBqcGVnDQo+ID4gICAtIE1h
dGNoIGFzc2lnbmVkLWNsb2NrcyAmIGFzc2lnbmVkLWNsb2NrLXJhdGVzDQo+ID4gDQo+ID4gIC4u
Li9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaSB8IDgyDQo+ID4gKysr
KysrKysrKysrKysrKysrKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
cXhwLmR0c2kgICAgfCAgMSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OC1zcy1pbWcuZHRzaQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLmM1MDhlNWQwYzkyYg0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+
ID4gQEAgLTAsMCArMSw4MiBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCsNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0IDIwMTktMjAyMSBOWFANCj4gPiArICog
WmhvdSBHdW9uaXUgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4gKyAqLw0KPiA+ICtpbWdfc3Vi
c3lzOiBidXNANTgwMDAwMDAgew0KPiA+ICsgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7
DQo+ID4gKyAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgI3NpemUtY2VsbHMg
PSA8MT47DQo+ID4gKyAgICAgcmFuZ2VzID0gPDB4NTgwMDAwMDAgMHgwIDB4NTgwMDAwMDAgMHgx
MDAwMDAwPjsNCj4gPiArDQo+ID4gKyAgICAgaW1nX2lwZ19jbGs6IGNsb2NrLWltZy1pcGcgew0K
PiA+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQo+ID4gKyAgICAg
ICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgICAgICBjbG9jay1mcmVx
dWVuY3kgPSA8MjAwMDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1l
cyA9ICJpbWdfaXBnX2NsayI7DQo+ID4gKyAgICAgfTsNCj4gDQo+IEhtbSwgbm90IHN1cmUgYSBm
aXhlZC1jbG9jayBzaG91bGQgYmUgaW4gdGhlIHN1YnN5c3RlbS4NCg0KSSBjaGVja2VkIHRoZSBy
ZWZlcmVuY2UgbWFudWFscyBmb3IgOFFYUCBhbmQgOFFNICh3aGVyZSB0aGlzIHN5YnN5c3RlbQ0K
Y291bGQgYmUgaW5jbHVkZWQpIGFuZCB0aGlzIGNsb2NrIGlzIHRoZSBzYW1lLCAyMDAgTUh6Lg0K
QWxzbywgYXMgQWlzaGVuZyBtZW50aW9uZWQsIHdlIHdpbGwgYmUgYWJsZSB0byBvdmVyd3JpdGUg
aW4gUU0gc3Vic3l0ZW0NCmlmIHNvbWV0aGluZyBpcyBuZWVkZWQuDQpUaGUgc2FtZSBhcHByb2Fj
aCBpcyBkb25lIGluIHRoZSBmb2xsb3dpbmcgc3Vic3lzdGVtcywgd2hpY2ggYWxzbw0KY29udGFp
biBmaXhlZC1jbG9ja3M6DQogICAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1z
cy1hdWRpby5kdHNpDQogICAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1k
bWEuZHRzaQ0KICAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtbHNpby5k
dHNpIA0KDQo+IA0KPiA+ICsNCj4gPiArICAgICBpbWdfanBlZ19kZWNfbHBjZzogY2xvY2stY29u
dHJvbGxlckA1ODVkMDAwMCB7DQo+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxp
bXg4cXhwLWxwY2ciOw0KPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4NTg1ZDAwMDAgMHgxMDAw
MD47DQo+ID4gKyAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmltZ19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ID4gKyAgICAg
ICAgICAgICBjbG9jay1pbmRpY2VzID0gPElNWF9MUENHX0NMS18wPiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8SU1YX0xQQ0dfQ0xLXzQ+Ow0KPiA+ICsgICAgICAgICAgICAg
Y2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19qcGVnX2RlY19scGNnX2NsayIsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaW1nX2pwZWdfZGVjX2xwY2dfaXBnX2NsayI7
DQo+ID4gKyAgICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBFR19E
RUNfTVA+Ow0KPiA+ICsgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgIGltZ19qcGVnX2VuY19scGNn
OiBjbG9jay1jb250cm9sbGVyQDU4NWYwMDAwIHsNCj4gPiArICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLGlteDhxeHAtbHBjZyI7DQo+ID4gKyAgICAgICAgICAgICByZWcgPSA8MHg1ODVm
MDAwMCAweDEwMDAwPjsNCj4gPiArICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwxPjsNCj4g
PiArICAgICAgICAgICAgIGNsb2NrcyA9IDwmaW1nX2lwZ19jbGs+LCA8JmltZ19pcGdfY2xrPjsN
Cj4gPiArICAgICAgICAgICAgIGNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xLXzA+LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxJTVhfTFBDR19DTEtfND47DQo+ID4gKyAg
ICAgICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAiaW1nX2pwZWdfZW5jX2xwY2dfY2xrIiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJpbWdfanBlZ19lbmNfbHBj
Z19pcGdfY2xrIjsNCj4gPiArICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9T
Q19SX01KUEVHX0VOQ19NUD47DQo+ID4gKyAgICAgfTsNCj4gPiArDQo+ID4gKyAgICAganBlZ2Rl
YzoganBlZ2RlY0A1ODQwMDAwMCB7DQo+IA0KPiBLZWVwIG5vZGVzIHNvcnRlZCBpbiB1bml0IGFk
ZHJlc3MuDQoNCkkgZml4ZWQgdGhpcyBpbiB2MTIuIFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0K
DQo+IA0KPiBTaGF3bg0KPiANCj4gPiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLGlt
eDhxeHAtanBnZGVjIjsNCj4gPiArICAgICAgICAgICAgIHJlZyA9IDwweDU4NDAwMDAwIDB4MDAw
NTAwMDAgPjsNCj4gPiArICAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzMDkgSVJR
X1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19T
UEkgMzEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIDxHSUNfU1BJIDMxMSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICA8R0lDX1NQSSAzMTIgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ID4gKyAg
ICAgICAgICAgICBjbG9ja3MgPSA8JmltZ19qcGVnX2RlY19scGNnIDA+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgPCZpbWdfanBlZ19kZWNfbHBjZyAxPjsNCj4gPiArICAgICAgICAgICAg
IGNsb2NrLW5hbWVzID0gInBlciIsICJpcGciOw0KPiA+ICsgICAgICAgICAgICAgYXNzaWduZWQt
Y2xvY2tzID0gPCZpbWdfanBlZ19kZWNfbHBjZyAwPiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmaW1nX2pwZWdfZGVjX2xwY2cgMT47DQo+ID4gKyAgICAgICAgICAgICBh
c3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAwMDA+LCA8MjAwMDAwMDAwPjsNCj4gPiArICAg
ICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19NUD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
UzA+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmcGQgSU1YX1NDX1JfTUpQ
RUdfREVDX1MxPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBkIElNWF9T
Q19SX01KUEVHX0RFQ19TMj4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZw
ZCBJTVhfU0NfUl9NSlBFR19ERUNfUzM+Ow0KPiA+ICsgICAgIH07DQo+ID4gKw0KPiA+ICsgICAg
IGpwZWdlbmM6IGpwZWdlbmNANTg0NTAwMDAgew0KPiA+ICsgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJueHAsaW14OHF4cC1qcGdlbmMiOw0KPiA+ICsgICAgICAgICAgICAgcmVnID0gPDB4NTg0
NTAwMDAgMHgwMDA1MDAwMCA+Ow0KPiA+ICsgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNf
U1BJIDMwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICA8R0lDX1NQSSAzMDYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgPEdJQ19TUEkgMzA3IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMwOCBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsNCj4gPiArICAgICAgICAgICAgIGNsb2NrcyA9IDwmaW1nX2pwZWdfZW5jX2xwY2cgMD4sDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICA8JmltZ19qcGVnX2VuY19scGNnIDE+Ow0KPiA+ICsg
ICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ID4gKyAgICAgICAgICAg
ICBhc3NpZ25lZC1jbG9ja3MgPSA8JmltZ19qcGVnX2VuY19scGNnIDA+LA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgPCZpbWdfanBlZ19lbmNfbHBjZyAxPjsNCj4gPiArICAg
ICAgICAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDIwMDAwMDAwMD4sIDwyMDAwMDAwMDA+
Ow0KPiA+ICsgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmcGQgSU1YX1NDX1JfTUpQRUdf
RU5DX01QPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnBkIElNWF9TQ19S
X01KUEVHX0VOQ19TMD4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwZCBJ
TVhfU0NfUl9NSlBFR19FTkNfUzE+LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MyPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMz47DQo+ID4gKyAgICAgfTsNCj4gPiAr
fTsNCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4
cC5kdHNpDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kN
Cj4gPiBpbmRleCAxZTZiNDk5NTA5MWUuLjJkOTU4OTMwOWJkMCAxMDA2NDQNCj4gPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gPiBAQCAtMjU4LDYgKzI1
OCw3IEBADQo+ID4gICAgICAgfTsNCj4gPiANCj4gPiAgICAgICAvKiBzb3J0ZWQgaW4gcmVnaXN0
ZXIgYWRkcmVzcyAqLw0KPiA+ICsgICAgICNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0KPiA+
ICAgICAgICNpbmNsdWRlICJpbXg4LXNzLWFkbWEuZHRzaSINCj4gPiAgICAgICAjaW5jbHVkZSAi
aW14OC1zcy1jb25uLmR0c2kiDQo+ID4gICAgICAgI2luY2x1ZGUgImlteDgtc3MtZGRyLmR0c2ki
DQo+ID4gLS0NCj4gPiAyLjE3LjENCj4gPiANCg==
