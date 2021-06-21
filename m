Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C393AE1F4
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 05:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbhFUDs4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Jun 2021 23:48:56 -0400
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:27726
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230251AbhFUDsz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Jun 2021 23:48:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLp+w+Z2ueAEDI+SpHm0WKj6p0pqIF76FwjGHDdq+heqyi9IMdHf4aigcN96hi2fUnI1byYoJWDH6eX+0acbI456w0D79o5KXLvmKoYiq/zONSAT3lmBEYpP0W1D1fBhvepTkUQWd+qVu3EePw8xdazIl2Mm4u8+pAhnpcz6LGQ+YuzKEMnZmjI3KVV0/6od09I5BtYqOxnFuhdjeFobKyg2POtrcrEzlm+Xv7w8zlqqr8pSb3hdQkIC8/FIPaVS20k1NoJepwtksioqC0jl6Xc5QG2qz7EMNdBhR95SlpX6jWcr3yvWg55R1DHPeR5R2D9kfAG+I69r/6jexwjdOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ3IzizXQ0TWhmgq8L+rRMRAunmiqBha6W/s/GaSLyU=;
 b=VgwWjOivj9OPcjAuKGll0CE1KyxcvaUmB2lBG9xZWq0rN4tAx+BkUlhrEHll5wNzDRkh3qb/CLK6uZsnukx0IeDXWIGSUb9PvF18xJY1PX6zioys1QOXu7xDnBIW4r2kCuskhGIowqWyz2BvkCkzvfZHyRk5VE9dPZCqQ6UWLkj8psWwuScpqV1tFA+TAvKjfPL7yDqAiVBQB4X5MKSjyfdqQPoN1ihdiZDUiRXf0UqTs+02HB1xG7ewqhCypjUU95MaLSLHvDWw4K9eaUhm8anEwwmFXoSefYPcNYPfQHpjVvTlHhgV4RFvyKNzHOtXslp/lNanlNsYQj5KVDCXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ3IzizXQ0TWhmgq8L+rRMRAunmiqBha6W/s/GaSLyU=;
 b=UwrQQ48QJhHlgTzV5HwSEbXT+2Mo7V91j7zNAPzfY2j+sZE6vz/Zalb0JXJSSYzQzU5TIx6YX7StP2iDI4Jmy1IJmKpV+nm+V9NazT0WnIifYOeTWlymlfIc3wB5VDuRCHAMjD5CohRvhcEhmHaWYCdlFJeihtaqHfITbCZsNu4=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8869.eurprd04.prod.outlook.com (2603:10a6:10:2e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Mon, 21 Jun
 2021 03:46:37 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 03:46:37 +0000
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
Subject: RE: [PATCH v14 1/2] media: dt-bindings: imx-jpeg: Add compatible for
 i.MX8QM JPEG codec
Thread-Topic: [PATCH v14 1/2] media: dt-bindings: imx-jpeg: Add compatible for
 i.MX8QM JPEG codec
Thread-Index: AQHXZRiPYdTu0m8cL0uhR03mFqtFjasd1NFw
Date:   Mon, 21 Jun 2021 03:46:37 +0000
Message-ID: <DB9PR04MB8477C40976C1936E61EBF094800A9@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210619143611.17280-1-mirela.rabulea@oss.nxp.com>
 <20210619143611.17280-2-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210619143611.17280-2-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9643e6a-bec2-48bb-80d9-08d934672c19
x-ms-traffictypediagnostic: DU2PR04MB8869:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB8869401011EE81D8E1E5E539800A9@DU2PR04MB8869.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A6nWwDxRF/Ajj7pgLl/Lt77Suz6h+Ct+v2bm53ShJf/EbdrspZqPLjQCQSkjiHMX/fxeC8b4YX7sefzRXoTuHUmC+za8RY/luMTE8zpRjLy6TbfxPBSJhO5XqQt2zisWzsVn2Xk5go2XrjZP19Ngmr0bM64ySm1+8UwDCGVtMD0Mkpu4Q2aOZVvxSr7jpn3JCerfjSLZNf088orlk9OnG8UzdbSWZ0slzschF7oEY1yHsJmAKztewDGvDp5ZABxysaRbsb4/iHzZspLzU8QkolPDJ93b8DGJp3MGUHyaIcmKaib6+e3qq/iobycBpbV2UCJM48mUMv0rl+j638ssdvGX25unVs8Ce/5GH9PZgILvRreTRx31ScYTwEZGORbpQShkPONi3B5wuLw1Ryw9q0DCjwi+/egm/vmnvnUAjmveXYOv8FD9kzfuYvC8pM4Cd1rTswNEDbGKZ6YBzrDwQL9EUfh2xS2ulL0P/YfDdK4slVE+iWIUXOAUuu7M6GRRSWmC9vUsDae3MObX9g4OgPOr6qCzjyM1BeRviD/59sVcb0hY8fPwKBFQ3qVfFTGrexMXeRs3R64ThpQhWwaAmKsBd4ib0j2qZMmcLi0TJdthCpe7fL5On4UYgy1ePj7VeMsca4VwxuHlOrOdurSxfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(136003)(39860400002)(6506007)(44832011)(55016002)(53546011)(478600001)(83380400001)(71200400001)(2906002)(186003)(33656002)(9686003)(316002)(26005)(7696005)(8936002)(4326008)(8676002)(110136005)(52536014)(122000001)(7416002)(66946007)(66476007)(66556008)(86362001)(76116006)(66446008)(38100700002)(64756008)(5660300002)(54906003)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qmlya0JEd2NqeXFETFJlVzRoaDFaUCtGQVVscTM3Y011TUtzU1dVOWw4NmVq?=
 =?utf-8?B?MmdDMytIZHV2TExGelpGYkhmby9UMFEyNTJoYlpsV09rVFozVTFkRHg3TCtN?=
 =?utf-8?B?YjUyU2Uxb2EvWDQxWTdoTFJqaGNqczNNQVpML0JKcHZ5TkJIS08wMkFCaTdC?=
 =?utf-8?B?T0RtTUUzSTU1RHU4eWtFNzNUeG9lVnd0T1d0R1Z6TmRLWnJXNGgzR1R1dHhH?=
 =?utf-8?B?bDczU0NKb2hCSXJOMFlWcUlHMUtWWWxXbTVuWEJmUG92ZlNCRm9WV0plancv?=
 =?utf-8?B?Y3puWTJQSnhoN0NJV0RkbVVNeGF3SHArbzZVT29IWUFxWVg3ZmsvaHB4TTB6?=
 =?utf-8?B?WXNyNTl2OGJDcGVzWTdwdnRxalY2bnB1M1RCQkozL3hiQzY4ZUgxSS9Cd1Bs?=
 =?utf-8?B?d0Q5TnZ5RWQzRll6ajdoby9hbk0wZ3NTK1AyTGNRbW5Fck1LSVNKNEdhcEo2?=
 =?utf-8?B?ZHRzdlpCYkxvdXVHUlJmM3B3VGp5M0JteHR5WEV5dFFRQ2pxdGVKbGNSNE93?=
 =?utf-8?B?MTlOYTNYUlRUS2lYakF2eWw2cjJuQlFqeFA0SHBjTTBxTnp2VXRWb0NxeUlt?=
 =?utf-8?B?NHlyaHdHU0FpNGEwcE9yTzVTUUVrTmxEbnhHbHd4S3ZBZjhQeUhYenhuU21E?=
 =?utf-8?B?QlhuRk01NUx0RzZuaXpCWmlkYkpvNjhLRi92aWttc0NYc09sMXpvTGdSV2V2?=
 =?utf-8?B?a0dDZEUzVnh0SnFQL1VlU0MwS090dzJrdVdFaWxBR1FObnF5ak9FeG9vTGNZ?=
 =?utf-8?B?VC9DZ3VQOGE3ZEFTcG1NYlJDT1I2V2JkU3VMRnJhMVMvOXNuUUc4YlFLVmVL?=
 =?utf-8?B?MXRFdW5VT3paVTZZdVo2WmZMN1FIQmthL2Z3Q0tSeXFzQ0NKZDRHMmVUdFM0?=
 =?utf-8?B?SGtzbTcwQ0JNZVFFVFFDYkplZExOb09oVjMvcytOdm10dEJ5a2cxK0ZmUjA2?=
 =?utf-8?B?R3R6blNJdjNQUkRMTjBzZEpnb3N6b1BpTnl1Vng0MGM4S3o0MVpLVVlkVDdk?=
 =?utf-8?B?WnBPMDRzdVFCbWdOeVNhNk1pRkVZU2ZGVFF3dmxjOWZNUUE3L0ErWTZsNDNT?=
 =?utf-8?B?M0NLT1VEVmhPNDZsZHUyOUFjenZ2b3hiK015UVFYYng1bmxMNFE2aUhpSlJJ?=
 =?utf-8?B?SWVYUUJSSlhqekQzSGNuRC90SllxOGxKdTFTVWd6cnpiNVhhTkJzM2V3aTlN?=
 =?utf-8?B?d2ZEOXJhS0dJOFpnT2VtMzJxZzRIZHFSZlFSUm42aFVaOEtTZUlpN0hrWUpQ?=
 =?utf-8?B?RWEwa2FLRGdkWXlmV1FHVFpxVm42VEJ0WmRocmx1alRxZ3FqcEROMERMa2RS?=
 =?utf-8?B?SHpHTXVZUUoydWh2UFZibGhQKzErbDZ1NnBrOU5lK1pLVkcwR3g2SFRHcDc4?=
 =?utf-8?B?V0ZIOWw0Z2syOFVyU3VQY0VzMWJGMkd4cjJyMThmRWd1N3J1UzFiWjdsdzZy?=
 =?utf-8?B?ckFiQmgwejRCeDdscW9STkhWek5heGRTT2lZaTIyWm56dmdsdkFxWWlYSWx2?=
 =?utf-8?B?dnVmc1JEK2pyQXl6ekEyazVOUW9sd1lIWUYzamhwVHBvNjEvV2hzN1E4Nm4z?=
 =?utf-8?B?QWs4MHorZTEvYVJPMDhmdXlZRzJzTGhvTFFRbVdaaXJKU1RIM2ZqT1lIRWZw?=
 =?utf-8?B?REtCc1F1WWhrWW9YOTJTWTBraUJSdXpUTm1Tc0l5SWNLL0d2WC9hZDJiOTh1?=
 =?utf-8?B?OGhER3dGTitHRXBJb0pEV25kdyt4TnIvRU83OHZTeU04aFI3L0JmVU1objk0?=
 =?utf-8?Q?iDOTBWMpR8/L5ql8Y6MRs+2jLDwXbTX0RlxNLXA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9643e6a-bec2-48bb-80d9-08d934672c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 03:46:37.5063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGcFGcLOCrWz0TEN7MRyEwpj/5JFz+7r31pEhx+dCIQUkHzN7Fv/DIw7Sh5v/jT1vY+hXwFLYR1Lq2NwSq47HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8869
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IFNhdHVyZGF5LCBKdW5lIDE5LCAyMDIxIDEwOjM2IFBNDQo+IFN1YmplY3Q6IFtQ
QVRDSCB2MTQgMS8yXSBtZWRpYTogZHQtYmluZGluZ3M6IGlteC1qcGVnOiBBZGQgY29tcGF0aWJs
ZSBmb3INCj4gaS5NWDhRTSBKUEVHIGNvZGVjDQoNCk5pdHBpY2s6IHdlIHVzdWFsbHkgcHV0IGR0
LWJpbmRpbmdzIGZpcnN0Lg0KZS5nLg0KZHQtYmluZGluZ3M6IG1lZGlhOiB4eHgNCg0KQW55d2F5
IGl0J3Mgc21hbGwgcHJvYmxlbSwgc286DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFp
c2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gDQo+IEFkZCB0d28g
bW9yZSBjb21wYXRpYmxlczogIm54cCxpbXg4cW0tanBnZGVjIiBhbmQgIiBueHAsaW14OHFtLWpw
Z2VuYyIuDQo+IEFsc28gdXBkYXRlIHRoZSBjb21wYXRpYmxlIHByb3BlcnR5IHRvIGVuc3VyZSBt
dXR1YWxseSBleGNsdXNpdmUgdXNhZ2Ugb2YNCj4gZW5jb2RlciBhbmQgZGVjb2RlciBjb21wYXRp
Ymxlcy4NCj4gVXBkYXRlIGV4YW1wbGVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJh
YnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYxNDoN
Cj4gICBBZGRyZXNzIGZlZWRiYWNrIGZyb20gQWlzaGVuZyBEb25nLCBkbyBub3QgdXNlIGFueU9m
DQo+IA0KPiAgLi4uL2JpbmRpbmdzL21lZGlhL254cCxpbXg4LWpwZWcueWFtbCAgICAgICAgIHwg
MTkgKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXg4LWpwZWcueWFtbA0KPiBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14OC1qcGVnLnlhbWwNCj4gaW5kZXgg
NWQxM2NiYjUyNTFiLi4zY2M2ZjQyYWViNzYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ueHAsaW14OC1qcGVnLnlhbWwNCj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXg4LWpwZWcueWFtbA0K
PiBAQCAtMTYsMTIgKzE2LDE3IEBAIGRlc2NyaXB0aW9uOiB8LQ0KPiANCj4gIHByb3BlcnRpZXM6
DQo+ICAgIGNvbXBhdGlibGU6DQo+IC0gICAgaXRlbXM6DQo+IC0gICAgICAtIGVudW06DQo+IC0g
ICAgICAgICAgICAjIEpQRUcgZGVjb2Rlcg0KPiAtICAgICAgICAgIC0gbnhwLGlteDhxeHAtanBn
ZGVjDQo+IC0gICAgICAgICAgICAjIEpQRUcgZW5jb2Rlcg0KPiAtICAgICAgICAgIC0gbnhwLGlt
eDhxeHAtanBnZW5jDQo+ICsgICAgb25lT2Y6DQo+ICsgICAgICAtIGl0ZW1zOg0KPiArICAgICAg
ICAgIGVudW06DQo+ICsgICAgICAgICAgICAtIG54cCxpbXg4cXhwLWpwZ2RlYw0KPiArICAgICAg
ICAgICAgLSBueHAsaW14OHF4cC1qcGdlbmMNCj4gKyAgICAgIC0gaXRlbXM6DQo+ICsgICAgICAg
ICAgLSBjb25zdDogbnhwLGlteDhxbS1qcGdkZWMNCj4gKyAgICAgICAgICAtIGNvbnN0OiBueHAs
aW14OHF4cC1qcGdkZWMNCj4gKyAgICAgIC0gaXRlbXM6DQo+ICsgICAgICAgICAgLSBjb25zdDog
bnhwLGlteDhxbS1qcGdlbmMNCj4gKyAgICAgICAgICAtIGNvbnN0OiBueHAsaW14OHF4cC1qcGdl
bmMNCj4gDQo+ICAgIHJlZzoNCj4gICAgICBtYXhJdGVtczogMQ0KPiBAQCAtNjksNyArNzQsNyBA
QCBleGFtcGxlczoNCj4gICAgICB9Ow0KPiANCj4gICAgICBqcGVnZW5jOiBqcGVnZW5jQDU4NDUw
MDAwIHsNCj4gLSAgICAgICAgY29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdlbmMiOw0KPiAr
ICAgICAgICBjb21wYXRpYmxlID0gIm54cCxpbXg4cW0tanBnZW5jIiwgIm54cCxpbXg4cXhwLWpw
Z2VuYyI7DQo+ICAgICAgICAgIHJlZyA9IDwweDU4NDUwMDAwIDB4MDAwNTAwMDAgPjsNCj4gICAg
ICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDMwNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwN
Cj4gLS0NCj4gMi4xNy4xDQoNCg==
