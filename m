Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C3538DFD6
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 05:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhEXDUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 May 2021 23:20:51 -0400
Received: from mail-eopbgr40067.outbound.protection.outlook.com ([40.107.4.67]:45190
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231896AbhEXDUu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 May 2021 23:20:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKwcVMigqWzJiiS87pltFx5KrOsleYafd0ix8Lzcw0/h18lZnB9b0kMFsM+2lF5hT3jnaBMfHImc0Ba19kbBMiTKXsVHm2viPA8FHkgb3LARHhjH+NjDrhQPrq2WPVXOkj9avQGMxbE7xrx9xcVp4uj6JTdAydekpGWGtJksUTaUxB5/bQFhAsgMy6b8Cliq1yIB+r14VSN/6ZQWN1vJVNMkGT57rqjlYmbcdRKj50snxPVxZPfhOYfDVEU7udtCDqgAJmIuBlJINMdecyUnhPDbq2vnwHrqRVyNGWrDhONAlm1iaERtS2HbOSAqZvuXUz/0/S1cGJKaymFUq74Jmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdX9GbrHHoLmfZg+G3bEu3fWRdr9DmxEsPfKEnyaGss=;
 b=LaQAwVxERn6outeANOO6p9XAl/GowEGsNpk7LITGsLYCYDaTc2qbSfIjo9ZvmU3iaQMJeJ3E7zs5793Dma3e69bnc1ef3UVr2cpkvxZuhcxJrPngnUC/1Pgklfs5leli3E4n7oMlNpPyahYRf4t4NJ5AFEVOsN0P0QL36Wp2d8C2ctbAWgz63ckT0U+slmOGvzU2haDKfnsR9vMY5nl6cRIHELSJte9o1F7+h1uCV+SO1kciD1cbwpIW3RLdnMh0OdR+gkhX6B33gO3aTrEuSnQ7X+JGj7YcctZGn7AzLAghcClx+5mXKY4w94j6AlEDqke1RcV8G9B2Lj+vPeFvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdX9GbrHHoLmfZg+G3bEu3fWRdr9DmxEsPfKEnyaGss=;
 b=Ig4uKjD7h5qp532SRrN/nu8vkEvTv1doI+QCP6bGkEIG7IUXBh0078Vnj8iqJ8ZUHQKe/jmksK/VWP186K7C+unHi8vPBJoE2g7re2CeLHO3p/Tv22j8YCTswHaYkJtrQY3w9fvSlvWevkuH6Unug0ciCBv5e7WdWgctKhnAfAE=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8648.eurprd04.prod.outlook.com (2603:10a6:10:2df::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 03:19:21 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::508:d95f:f63b:714a%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 03:19:21 +0000
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
Subject: RE: [PATCH v13 1/2] media: dt-bindings: imx-jpeg: Add compatible for
 i.MX8QM JPEG codec
Thread-Topic: [PATCH v13 1/2] media: dt-bindings: imx-jpeg: Add compatible for
 i.MX8QM JPEG codec
Thread-Index: AQHXT08mL2yrtaXj0keY3JfR0XsFiqrx8g7w
Date:   Mon, 24 May 2021 03:19:21 +0000
Message-ID: <DB9PR04MB8477A2CA9717526D12C1465B80269@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210522211055.15988-1-mirela.rabulea@oss.nxp.com>
 <20210522211055.15988-2-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210522211055.15988-2-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b94ef12-55e1-4aa5-03dc-08d91e62b94b
x-ms-traffictypediagnostic: DU2PR04MB8648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB86486D5D9B4B529D13DD41C180269@DU2PR04MB8648.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CL+rkOExgtnl41CiyuGRSaLVrFYqnR/zpNxMQ5AdWjMhWMxmX9BCQSeX20vJsmCwDx+BQhBq+Qs4///nbK/EOsRkk0LrMfcrBQLELDZ12f3YT6/2kkaPKx0tVifEVuWtJbr4dB1Zw26/FtUVp5povxr5IjQ3jqyfVHt+TocNuJ6gzrm5CH8/UqNNUy5wWAIyEAUFJSvY+8CzNdG6ReRsKY36SSbfK5bWcCE5fKTwE18GhuxlpJJfsBnxs0iNtNQyNp2lG6kLzXytGZgkWvlxwGh/RJdLxYoJiyr+hdF+33O8kFWC+HelzTLlHy43X30G0BRwZy0bRAB55IJsSsRjjvvI1EYmsIbZgiy3VaQmQV9Mac9beDy60zp4bd3PCPtA1+9L3nv8dim7/CzzTVWPpTPCXgjMaklKzu5pk8JmlU8WBE1xqgwBO/P/TAMIXXSz3T9utGWUkEA9a24y07abU3XLNZ2iukf0J4VacuEFj3n477neE/GedtxWZJCqb27b7kN588aRFc7z1CIA1dNJTBruggbOQ0UjoUDxIE7u0uVV6JQu4O2pgGWpjx7wsLPSksbrOL/gouYVi2RKt75kfWWp54QsWjx6w8BnF8aMNts=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(6506007)(83380400001)(4326008)(55016002)(54906003)(110136005)(186003)(8936002)(8676002)(478600001)(316002)(66556008)(52536014)(86362001)(26005)(7696005)(71200400001)(33656002)(76116006)(66946007)(66476007)(64756008)(66446008)(7416002)(5660300002)(38100700002)(44832011)(9686003)(2906002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TndYS3ZNN0lxOWZzbExPa1NaVmF6aGpYakhDYmdoeFZJek1IdSt2aDZOTHZs?=
 =?utf-8?B?MGVoTmJ0ZUJKQmZMdTlUbzFSbkppdkpaUThVWE9xNnhFV24yNVJwelZDTEow?=
 =?utf-8?B?aHk4bmF6RVM1Wm5XL1lYTk56MDZTV2FWWFBLMWcwODJoNlltTG42cjc5L2lh?=
 =?utf-8?B?N1NvSlc5VW9tWEJMbWhxSGpPemJNaEEzVU9EZlhnWnRFOUdFcytHWlZZZ0FL?=
 =?utf-8?B?TzBMbmF4akRGN1pXYUNzTkJmYXZxSDNEak04OFl6YVF2MnZ6ZDlsY2lrR21B?=
 =?utf-8?B?WGM1S0VHczByRmlHS0hXcmx5Rld0aXUzVGxyOHpWV3NFWS83d3lxVVdYaDBG?=
 =?utf-8?B?L0JBS2piUFc5MitISS9QL1lDNVdLRUcyUHpNTG1TK1BEanpJWm5EbmxCZFJy?=
 =?utf-8?B?SDBNUEtCaVlZblZsOXJ6eXcvNzFSb0c3SlpFOERPRjFGUkJ6MDlwQ3pYUE9u?=
 =?utf-8?B?c2VIc1FXemliUHlweUd2N3Nqdk8yMmpzMWZWeTRpUTQ0em1jUklUTEU5UnlO?=
 =?utf-8?B?RUY1cWpmUkdUU1FjOXY1RnRhZVhaWVNKZVFsUXhVdUNOQXJLcndPWXcrKzFk?=
 =?utf-8?B?T0tpckY0SGpsamlIbkdyN3V4VzZYaE1UVzFjVk1QRjA0elJMVnVOTFkyTm1w?=
 =?utf-8?B?eW9Pd1VLcFpHVlRMekZnWkRmT3RxVElCOE0xSmdiNUI1VVI1ZGNYTVRRdkRU?=
 =?utf-8?B?MFE3Q0pqOVBvRGhkZzFvVi85QVNaODJHd29BcC84cTl1cVhQc2JScHA1UXc1?=
 =?utf-8?B?THh0RDI1anB2OXg5aE5HOVhZYVViN1dVZmZxRHhkb2JqT0xQaWd6Vkx4V0JZ?=
 =?utf-8?B?Y2JRZHRMazdEN1A3MjJ1QjlLOXBLZnNCc1RNTUFlU2x4Q1lnUE01cytNKzhz?=
 =?utf-8?B?NlRXRjE5WFI4RHZWZmpscUREbVQzTlVJd3VvK2VOWU9EbmMxTjYwU2k4ZDlT?=
 =?utf-8?B?NmZCVGo1aEswSjNrRGFaSDVYajhZU2ZWb2EyMFp5RXVzWU91emI3aUVLeG1Q?=
 =?utf-8?B?TVBHWVJHSG5NdmJ1VVdHTmc5SXdZRjF3SHFnTnpYQzJjcit0U0YwYzRVWkRj?=
 =?utf-8?B?U3pRNE90aUxINTJyYWpyYTJUd3dIS0NReWlKSWVlSUhhQndhTEYzVytiVjVL?=
 =?utf-8?B?S0lWZURrM0h2ZFR2TDZHdHRDdUUxNC9UMzVpZm1RbjZ1cTlINVkyMmlSSWtO?=
 =?utf-8?B?Y2ErYlR2RERhNndXV29zN0dhdk53bFZxY2tsNHhiaURMSFBHYytEVE95N1Jq?=
 =?utf-8?B?bFNQbjdJTG5XWFkvNzJscXFva2JUbmpJamRZU1JEUVNadjA2emJxUEY0SEpz?=
 =?utf-8?B?bmM4M2VncHUyRkkxT09zdlB6RTJJOVkwMnllUUdTWkFadmpXNHh1YVRvdFBu?=
 =?utf-8?B?c0U1bitkS2VmZ01VZDAraElVVGQrVVpnZE1KSmNYcytLQTdOVVF2MU0xSFFX?=
 =?utf-8?B?RG1ZZzY1bHgwRDV5S29SYURyNFNNeGhUUWlMY0pPdXhuZTY4YmVoRDlnd1Nj?=
 =?utf-8?B?VHJHSU41U2VxVGtpTjRHZStyZlgrdEhEVHUzWkR2dUNKU2RndHN2Y05QdE9n?=
 =?utf-8?B?dkY0Y3BNRExvYmFxcUV4Ym1uUE5vYmtrbkNMVEVWT1pjMzAwekU5VUhOQXM1?=
 =?utf-8?B?SXI1aHJDTVFRdWRVYmt5VkdvRzBJUVZGcjd5RHNURGN1b1kvWko4KzRwTmVV?=
 =?utf-8?B?My9aNlBrOU12L0d2c0E1YmVvaFhOcjA1dHgwcHdBUm5qbWJpR01iR3BYVXVW?=
 =?utf-8?Q?vr+yv57++rbAHTfGxc7epHJ/bHYmC1fZCgx3Qxz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b94ef12-55e1-4aa5-03dc-08d91e62b94b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2021 03:19:21.2292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IIjkBsHhBhFNtweeYQPuj2kJ2qw8Wl/9NrDDvdnIuPpkZI6xrE0nxGEMc2F170UOqHVqQUiWc84hsFypWjOBrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8648
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFN1bmRheSwgTWF5IDIzLCAyMDIxIDU6MTEgQU0NCj4gDQo+IEFkZCB0d28gbW9y
ZSBjb21wYXRpYmxlczogIm54cCxpbXg4cW0tanBnZGVjIiBhbmQgIiBueHAsaW14OHFtLWpwZ2Vu
YyIuDQo+IEFsc28gdXBkYXRlIHRoZSBjb21wYXRpYmxlIHByb3BlcnR5IHRvIGVuc3VyZSBtdXR1
YWxseSBleGNsdXNpdmUgdXNhZ2Ugb2YNCj4gZW5jb2RlciBhbmQgZGVjb2RlciBjb21wYXRpYmxl
cy4NCj4gVXBkYXRlIGV4YW1wbGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJhYnVs
ZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL21lZGlh
L254cCxpbXg4LWpwZWcueWFtbCAgICAgICAgICAgfCAxNyArKysrKysrKysrLS0tLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxp
bXg4LWpwZWcueWFtbA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9ueHAsaW14OC1qcGVnLnlhbWwNCj4gaW5kZXggNWQxM2NiYjUyNTFiLi41Y2M3YjZhOTRjNDQg
MTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9u
eHAsaW14OC1qcGVnLnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL254cCxpbXg4LWpwZWcueWFtbA0KPiBAQCAtMTYsMTIgKzE2LDE1IEBAIGRlc2Ny
aXB0aW9uOiB8LQ0KPiANCj4gIHByb3BlcnRpZXM6DQo+ICAgIGNvbXBhdGlibGU6DQo+IC0gICAg
aXRlbXM6DQo+IC0gICAgICAtIGVudW06DQo+IC0gICAgICAgICAgICAjIEpQRUcgZGVjb2Rlcg0K
PiAtICAgICAgICAgIC0gbnhwLGlteDhxeHAtanBnZGVjDQo+IC0gICAgICAgICAgICAjIEpQRUcg
ZW5jb2Rlcg0KPiAtICAgICAgICAgIC0gbnhwLGlteDhxeHAtanBnZW5jDQo+ICsgICAgb25lT2Y6
DQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAgICAgICAgIGFueU9mOg0KPiArICAgICAgICAgICAg
LSBjb25zdDogbnhwLGlteDhxeHAtanBnZGVjDQo+ICsgICAgICAgICAgICAtIGNvbnN0OiBueHAs
aW14OHFtLWpwZ2RlYw0KPiArICAgICAgLSBpdGVtczoNCj4gKyAgICAgICAgICBhbnlPZjoNCg0K
SSBtaWdodCB3aXNoIHRvIGF2b2lkIHVzaW5nIGFueU9GIGZvciBqcGVnIGNhc2VzIGFuZCBkZWZp
bmVkIGluIGEgbW9yZQ0KU3RyYWlnaHRmb3J3YXJkIHdheS4NCg0KZS5nLg0KcHJvcGVydGllczoN
CiAgY29tcGF0aWJsZToNCiAgICBvbmVPZjoNCiAgICAgIC0gaXRlbXM6DQogICAgICAgIC0gZW51
bToNCiAgICAgICAgICAgICAgIyBKUEVHIGRlY29kZXINCiAgICAgICAgICAtIG54cCxpbXg4cXhw
LWpwZ2RlYw0KICAgICAgICAgICAgIyBKUEVHIGVuY29kZXINCiAgICAgICAgICAtIG54cCxpbXg4
cXhwLWpwZ2VuYw0KICAgICAgLSBpdGVtczoNCiAgICAgICAgICAtIGVudW06DQogICAgICAgICAg
ICAgIC0gbnhwLGlteDhxbS1qcGdkZWMNCiAgICAgICAgICAtIGNvbnN0OiBueHAsaW14OHF4cC1q
cGdkZWMNCiAgICAgIC0gaXRlbXM6DQogICAgICAgICAgLSBlbnVtOg0KICAgICAgICAgICAgICAt
IG54cCxpbXg4cW0tanBnZW5jDQogICAgICAgICAgLSBjb25zdDogbnhwLGlteDhxeHAtanBnZW5j
DQpDb3VsZCB5b3UgY2hlY2sgaWYgaXQgd29ya3M/DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiAr
ICAgICAgICAgICAgLSBjb25zdDogbnhwLGlteDhxeHAtanBnZW5jDQo+ICsgICAgICAgICAgICAt
IGNvbnN0OiBueHAsaW14OHFtLWpwZ2VuYw0KPiANCj4gICAgcmVnOg0KPiAgICAgIG1heEl0ZW1z
OiAxDQo+IEBAIC02OSw3ICs3Miw3IEBAIGV4YW1wbGVzOg0KPiAgICAgIH07DQo+IA0KPiAgICAg
IGpwZWdlbmM6IGpwZWdlbmNANTg0NTAwMDAgew0KPiAtICAgICAgICBjb21wYXRpYmxlID0gIm54
cCxpbXg4cXhwLWpwZ2VuYyI7DQo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibnhwLGlteDhxbS1q
cGdlbmMiLCAibnhwLGlteDhxeHAtanBnZW5jIjsNCj4gICAgICAgICAgcmVnID0gPDB4NTg0NTAw
MDAgMHgwMDA1MDAwMCA+Ow0KPiAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA1IElS
UV9UWVBFX0xFVkVMX0hJR0g+LA0KPiAgICAgICAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMzA2
IElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiAtLQ0KPiAyLjE3LjENCg0K
