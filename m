Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294A4387311
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 09:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347081AbhERHWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 03:22:35 -0400
Received: from mail-eopbgr80080.outbound.protection.outlook.com ([40.107.8.80]:34727
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347049AbhERHWa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 03:22:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsQarlOiZcnudMZ23fyQiqRIyPFpuQ1kT4wQsrLjtXGDISIhvNXAjMRtK2BKRWTZDwUgobkpW7C3O8SDjYVk/XG5xOEoKyDuGQFuOUjJfgewv/Sx0esyj6ZLH1KLZoHGOxX3BEm/gYfiI/H8cL2C5xapxud5O/P7z5WPrOyWKZneFl/przI1RNC+uPrMckoco0FmhK4yhcybSPrNqEy7ubR8Ztf6aftWezK8KaaGXkaLYvf1QDVkzaxukKEHaXBWIYNET5qaAkM64SzRAvQ5TWuVHXoLT0FbdfM+8DqNGBBqixXl53A7P0HAbJTFip6LoqU+MOyRJNxMYnIAGbdorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGvjDxDnLeuRQTKwA+iNpa5YhyG54fjt/ZIfJffU/k0=;
 b=NmkZlSM3RiO3ZKWT//V4BXEDlg3u8C/+mMUC8+p8UoqDGwWzyFwnIt/IWptCy5eL4fCf8O6KEfguYNFcIqgk1hb16mgs3ZJslntsbh4MCed8CyZzGqPcPIdkO5211okOzQwob9UJFOPmC9TzRBI43I+3Eo8I5CIz3iITo+quYL8QnxtKHMcgTurEWrlV2EgBPyQlfTfG+C9AJLb3EPJ0w9YBGCRQ0trm4zWC5HnAJQRyy8gUkbkVpmaBaJ+IsIzCjRqTzPcGulhzqDAofXDLXPlFz6EJX4MkT35Y5JVfT3A0Q3Gr9KjjhlRVD6S+aTrM9McOHqxR8cKnDwBb4ftsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGvjDxDnLeuRQTKwA+iNpa5YhyG54fjt/ZIfJffU/k0=;
 b=jKa4TaOOrCnKZvbzOTG/ywGkP+R9z9Em4WooEPitW01qUlj+DQMkmR6iQUCOzEpiLb053R5BPRhI8a9Lnq/DkgWfSgpGwvzm7cNcJJkL8YiYje+qjcf1YyFskZARncXdBJIZihGqxU4VJ9IFEfusPJqgpoZm9Xi70iq0yFs/ZMc=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 07:21:10 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 07:21:10 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Peng Fan <peng.fan@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: RE: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v11] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXOClx/EGs7P4PmkKRDSOc1GkfSqro+uOQ
Date:   Tue, 18 May 2021 07:21:10 +0000
Message-ID: <AM6PR04MB4966477B30674145C9DD2E02802C9@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210423101414.20068-1-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3badbe2-88a0-4f60-da9f-08d919cd82ed
x-ms-traffictypediagnostic: AS8PR04MB7879:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB78794BD3BDBB58DC5EF8F85A802C9@AS8PR04MB7879.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vu0rU0ZMtuQACW4m6yj+Id49airn4FZd5ACFfMkeeT+VSF5PLE7xCn7r2ABJtBslrm+HK04s2s8hd5/ApkGKPWqMJmuvUvhay0ZB/xx//ul3zziNMyx+mtf5bJBm/ADaCyS+81Q11cAnP3+nZ4auPUKoiIu5H0+irikhEeZKEdjkc9VA/LpNV8f/I6zQZCujkOrq9oefvC3vJanByPZerjd435brLuOVgMpxhhwPst06AXoKzj/fMfesLy3C+imZfclcSIPriIChJFun2OOBUrAsw5gE5kOeTlEiET+Ur/+/g1Fc+P/dlkWao9Zes74AKZTc68lbH5gcBKRnG5dpPeJEIVU9DyVBDvWzrZB328kIFNXogwwkDRxwdC2CwN763OcXn/LnlhaeJyuqgF1GlLX6P04yUfP3Ic/EF2IMH/IDNNQhilyuuo8m39pJIN0Mg8rslw26dBoPj88ryA51u7ecmARyR3h06y7/kmit2bzn6M6TEl7X3QWSwDDF7vVhZzkbL/QLC5sbYmj5NXRdaqxoWjia2m1AxwQfZ8DmH09nCqqy4SZz/4t07IvvbmAaqmo1sI8mer/x5vhkmbjHpz6YVvxXxDdTtfCzynwroyjLjXmiAlZ9r6mbX+XVQ1dfIhrRyu7pyFqe9DhS6prMyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(83380400001)(5660300002)(26005)(478600001)(44832011)(9686003)(33656002)(76116006)(4326008)(86362001)(66446008)(64756008)(66556008)(2906002)(52536014)(66946007)(66476007)(38100700002)(55016002)(6506007)(71200400001)(122000001)(186003)(7696005)(54906003)(110136005)(8676002)(316002)(7416002)(8936002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UnRRL3RXWGJyZkp5WHFFREw4UHdweEZXeWJabGo4Z0NMY0Z4djlNZlg1TWIy?=
 =?utf-8?B?bHcyZWdUYkY3cTkvMm0veEVKU3dHU0tuS01tTjNaNWxXWXY0YmkzQnhkRExP?=
 =?utf-8?B?N1puK1pyWGtuSVJZYi9od1lEUzFzS0xKbVJmd0ZoZkQ3V29IazJZUEFyNy92?=
 =?utf-8?B?NDdoOUlqM0MzRzNvUnRTWkxaZEwzbkY4bS9PQVVnQmYzRXpJSU9QcGl5eTFK?=
 =?utf-8?B?Q1NtT2pTcmN1cS96QTljT0VQL3JNTjJ5ZVgzY2hYYWRxNmZPZ1hzZ2hxaG51?=
 =?utf-8?B?MUxETW5QU0xWVzNRZ3lhQ3E3ampobURjNW05VTZYWDZBcnBwckhCVVB2OEpM?=
 =?utf-8?B?RSs1SUFaSDdxdFpQb2pTY092Y1B1NmpXS3daeTFQTS94NWc1UEx5MWZtL3pr?=
 =?utf-8?B?RXdXZGZrQXM2Sk1sRjVKNzd6NHhBakNxd0JkVEpMNTZQa2UwZmpqbkhPeCtK?=
 =?utf-8?B?R0taNVZkOWZja3RuQk5YRXo3bnJJYzkxaStaR05zM0VHQWdzQVpsTTY3T3Fo?=
 =?utf-8?B?Z2p1L1BzaWhOUGVmOHFQYnZJWUt0WjdYKzVFR1dlbDVkODFvdnU5UDdCVDhX?=
 =?utf-8?B?VkxZNVNLeStrb2RaaWJyYzZXTDREaEk0anQ3YTBNVzB0TWVybHhjUkVNMUVN?=
 =?utf-8?B?RXhQbFpUUkIweFdidWtUYWs0QXlJb1k1M09qaFpSSWRmZ2lzNTNkZDU4cXl5?=
 =?utf-8?B?SktwdzlRRkFFa05heVp6UGhuTjlXalRnOUNFZDMxeDl6bkM1RVhhV0kvUjhZ?=
 =?utf-8?B?VjB4bEZXVTh3R2cyekxYaWxvVmk3amYwaFdoaWR0cC9TQTgrT1VDSktrREZR?=
 =?utf-8?B?dmFpbnJuNFpmNGMrV214MDRFQ2JMaERVOW5xT1VrNnNEWnNQVi85SlhONUlY?=
 =?utf-8?B?WnFJODQ3YmdJZUg5K2UzMWwwUFk2NEZQa0tWWStwczkvcTZRcCs4d0JCU0pt?=
 =?utf-8?B?Tm9ZQXhSemRZVkdwVy9zWk1UV2JQTFhjNHVLeEtDWFRFWWU1TDd6TVY5Sm1S?=
 =?utf-8?B?U1QyRUhKZWsvVnB0Rk85TllLSDhoRzdPRGpwRm0yVUtPRXZQckRCeW1oejVh?=
 =?utf-8?B?M0tNUnJLSjgvaktCYTJQK3FWU3I4TDJoeERUSDFGWUhmamlNNllYV0dwQjZZ?=
 =?utf-8?B?MGwzcVI1RXp1c2tuT3lhM09LOHJyeGF5Zk1kajZiS3VvTU9OMFdWeTYwbER6?=
 =?utf-8?B?RmM3dFlxSUoxTXZlK1ZlTDFlSVIzWHVlQWl0NG50QjdRSUpCUktvUWxQMWtL?=
 =?utf-8?B?Uk1FczZpMnpnM1hRWGVZanA4T3g5blI1UFdCZG9hWWZuL1d6bjVtUUh2Um03?=
 =?utf-8?B?N3hTS1NCUHhORkUzWDgvY3BnVFArZFRXck5WbDE0Q2p5cC9BdGxRbTBzYjls?=
 =?utf-8?B?eHg4UmFxRjJ2YUVqLzd5djA0eHRKRTdTN1BSSGpMa1BaU3o3dE5GdjErUkFC?=
 =?utf-8?B?NVRtaElscnMxbExsUEVCQm1yYmM1bnAySTBFZTM4cGtRc3cxVGF0MVk3TDA2?=
 =?utf-8?B?dGNJMmFjMEtQSUp1aFZmN28zWDZpNDV6UmtubTljWHRvN0l5RHdpeUhmSzlW?=
 =?utf-8?B?RU8zR3BTZkQ3dUtDUnZxZHF0Y20vMWREaG5UYjhtRjhHVXczN2tHVzlJVjRh?=
 =?utf-8?B?dHhGR0xLc3c5NEc5SWtnTkErY3h4d1JvVlNrZ1M0UStSWjJ4VHVSUkNJclMx?=
 =?utf-8?B?aEFoS3Z4d2lpU01PRTAzdnJ4VUtWckhWZDJaYmFsRWJuZ291SDdGbEJUcE9q?=
 =?utf-8?Q?ydBHf7bgTbw2ziHRvCmP3nOPElGRhkLGrTnE+pJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3badbe2-88a0-4f60-da9f-08d919cd82ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 07:21:10.4252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HkUGO00jGh9AbQ9dHwqwQnTHGKtdB/WNcfOrmyDlOwy9n9jocxiZXkRO2BbEniPkxa0fhEWi69qw5vDN4kYvpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBGcm9tOiBNaXJlbGEgUmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+
DQo+IFNlbnQ6IEZyaWRheSwgQXByaWwgMjMsIDIwMjEgNjoxNCBQTQ0KPiANCj4gQWRkIGR0cyBm
b3IgaW1hZ2luZyBzdWJzeXRlbSwgaW5jbHVkZSBqcGVnIG5vZGVzIGhlcmUuDQo+IFRlc3RlZCBv
biBpbXg4cXhwIG9ubHksIHNob3VsZCB3b3JrIG9uIGlteDhxbSwgYnV0IGl0IHdhcyBub3QgdGVz
dGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVh
QG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYxMToNCj4gICBBZHJlc3MgZmVlZGJhY2sg
ZnJvbSBBaXNoZW5nIERvbmc6DQo+ICAgLSBSZW5hbWUgaW1nX2pwZWdfZGVjX2Nsay9pbWdfanBl
Z19lbmNfY2xrIHRvDQo+IGpwZWdfZGVjX2xwY2cvanBlZ19lbmNfbHBjZyB0byBtYWtlIGl0IHZp
c2libGUgaXQncyBscGNnIG5vdCBvdGhlciB0eXBlIG9mIGNsaw0KPiAgIC0gRHJvcCB0aGUgY2Ft
ZXJhZGV2IG5vZGUsIG5vdCBuZWVkZWQgZm9yIGpwZWcNCj4gICAtIE1hdGNoIGFzc2lnbmVkLWNs
b2NrcyAmIGFzc2lnbmVkLWNsb2NrLXJhdGVzDQo+IA0KPiAgLi4uL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpIHwgODIgKysrKysrKysrKysrKysrKysrKw0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDEgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4g
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzUwOGU1ZDBjOTJiDQo+IC0t
LSAvZGV2L251bGwNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1z
cy1pbWcuZHRzaQ0KPiBAQCAtMCwwICsxLDgyIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgMjAxOS0yMDIxIE5YUA0KPiAr
ICogWmhvdSBHdW9uaXUgPGd1b25pdS56aG91QG54cC5jb20+DQo+ICsgKi8NCj4gK2ltZ19zdWJz
eXM6IGJ1c0A1ODAwMDAwMCB7DQo+ICsJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4gKwkj
YWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxscyA9IDwxPjsNCj4gKwlyYW5nZXMg
PSA8MHg1ODAwMDAwMCAweDAgMHg1ODAwMDAwMCAweDEwMDAwMDA+Ow0KPiArDQo+ICsJaW1nX2lw
Z19jbGs6IGNsb2NrLWltZy1pcGcgew0KPiArCQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsN
Cj4gKwkJI2Nsb2NrLWNlbGxzID0gPDA+Ow0KPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MjAwMDAw
MDAwPjsNCj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19pcGdfY2xrIjsNCj4gKwl9Ow0K
PiArDQo+ICsJaW1nX2pwZWdfZGVjX2xwY2c6IGNsb2NrLWNvbnRyb2xsZXJANTg1ZDAwMDAgew0K
PiArCQljb21wYXRpYmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiArCQlyZWcgPSA8MHg1ODVk
MDAwMCAweDEwMDAwPjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQljbG9ja3MgPSA8
JmltZ19pcGdfY2xrPiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1Y
X0xQQ0dfQ0xLXzA+LA0KPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW91dHB1
dC1uYW1lcyA9ICJpbWdfanBlZ19kZWNfbHBjZ19jbGsiLA0KPiArCQkJCSAgICAgImltZ19qcGVn
X2RlY19scGNnX2lwZ19jbGsiOw0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9N
SlBFR19ERUNfTVA+Ow0KPiArCX07DQo+ICsNCj4gKwlpbWdfanBlZ19lbmNfbHBjZzogY2xvY2st
Y29udHJvbGxlckA1ODVmMDAwMCB7DQo+ICsJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtbHBj
ZyI7DQo+ICsJCXJlZyA9IDwweDU4NWYwMDAwIDB4MTAwMDA+Ow0KPiArCQkjY2xvY2stY2VsbHMg
PSA8MT47DQo+ICsJCWNsb2NrcyA9IDwmaW1nX2lwZ19jbGs+LCA8JmltZ19pcGdfY2xrPjsNCj4g
KwkJY2xvY2staW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkJPElNWF9MUENHX0NM
S180PjsNCj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19qcGVnX2VuY19scGNnX2NsayIs
DQo+ICsJCQkJICAgICAiaW1nX2pwZWdfZW5jX2xwY2dfaXBnX2NsayI7DQo+ICsJCXBvd2VyLWRv
bWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+ICsJfTsNCj4gKw0KPiArCWpw
ZWdkZWM6IGpwZWdkZWNANTg0MDAwMDAgew0KPiArCQljb21wYXRpYmxlID0gIm54cCxpbXg4cXhw
LWpwZ2RlYyI7DQo+ICsJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAwMDAgPjsNCj4gKwkJaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDMwOSBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAg
PEdJQ19TUEkgMzEwIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAz
MTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkgICAgIDxHSUNfU1BJIDMxMiBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsNCj4gKwkJY2xvY2tzID0gPCZpbWdfanBlZ19kZWNfbHBjZyAwPiwNCj4g
KwkJCSA8JmltZ19qcGVnX2RlY19scGNnIDE+Ow0KDQpQbHMgZml4IExQQ0cgaW5kZXggYnkgdXNp
bmcgY2xvY2sgaW5kaWNlDQoNCj4gKwkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICsJ
CWFzc2lnbmVkLWNsb2NrcyA9IDwmaW1nX2pwZWdfZGVjX2xwY2cgMD4sDQo+ICsJCQkJICA8Jmlt
Z19qcGVnX2RlY19scGNnIDE+Ow0KDQpEaXR0bw0KDQo+ICsJCWFzc2lnbmVkLWNsb2NrLXJhdGVz
ID0gPDIwMDAwMDAwMD4sIDwyMDAwMDAwMDA+Ow0KPiArCQlwb3dlci1kb21haW5zID0gPCZwZCBJ
TVhfU0NfUl9NSlBFR19ERUNfTVA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1Mw
PiwNCj4gKwkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMT4sDQo+ICsJCQkJPCZwZCBJTVhf
U0NfUl9NSlBFR19ERUNfUzI+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfREVDX1MzPjsN
Cj4gKwl9Ow0KPiArDQo+ICsJanBlZ2VuYzoganBlZ2VuY0A1ODQ1MDAwMCB7DQo+ICsJCWNvbXBh
dGlibGUgPSAibnhwLGlteDhxeHAtanBnZW5jIjsNCj4gKwkJcmVnID0gPDB4NTg0NTAwMDAgMHgw
MDA1MDAwMCA+Ow0KPiArCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzA1IElSUV9UWVBFX0xFVkVM
X0hJR0g+LA0KPiArCQkJICAgICA8R0lDX1NQSSAzMDYgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+
ICsJCQkgICAgIDxHSUNfU1BJIDMwNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCSAgICAg
PEdJQ19TUEkgMzA4IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19q
cGVnX2VuY19scGNnIDA+LA0KPiArCQkJIDwmaW1nX2pwZWdfZW5jX2xwY2cgMT47DQoNCkRpdHRv
DQoNCj4gKwkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICsJCWFzc2lnbmVkLWNsb2Nr
cyA9IDwmaW1nX2pwZWdfZW5jX2xwY2cgMD4sDQo+ICsJCQkJICA8JmltZ19qcGVnX2VuY19scGNn
IDE+Ow0KDQpEaXR0bw0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gKwkJYXNzaWduZWQtY2xvY2st
cmF0ZXMgPSA8MjAwMDAwMDAwPiwgPDIwMDAwMDAwMD47DQo+ICsJCXBvd2VyLWRvbWFpbnMgPSA8
JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19F
TkNfUzA+LA0KPiArCQkJCTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MxPiwNCj4gKwkJCQk8JnBk
IElNWF9TQ19SX01KUEVHX0VOQ19TMj4sDQo+ICsJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19FTkNf
UzM+Ow0KPiArCX07DQo+ICt9Ow0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OHF4cC5kdHNpDQo+IGluZGV4IDFlNmI0OTk1MDkxZS4uMmQ5NTg5MzA5YmQwIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kNCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IEBAIC0yNTgs
NiArMjU4LDcgQEANCj4gIAl9Ow0KPiANCj4gIAkvKiBzb3J0ZWQgaW4gcmVnaXN0ZXIgYWRkcmVz
cyAqLw0KPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0KPiAgCSNpbmNsdWRlICJpbXg4
LXNzLWFkbWEuZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1jb25uLmR0c2kiDQo+ICAJI2lu
Y2x1ZGUgImlteDgtc3MtZGRyLmR0c2kiDQo+IC0tDQo+IDIuMTcuMQ0KDQo=
