Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFA23668EF
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 12:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbhDUKND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 06:13:03 -0400
Received: from mail-eopbgr80071.outbound.protection.outlook.com ([40.107.8.71]:43531
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238321AbhDUKM4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 06:12:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+RwJQwzkZijazCVZHsvurRL14EB8kEsNOl6tpRw1kgShgzVtO28GAYRvt2iP/cYlh11EDpJnyFYWWu0RtjT5lZ9lKhKaEsjIjP88dVWSQy7JxfwV+Y0PNMIGTQJi+sJ1aVzGb+8b2gG2KoxczHN2PXnZZunZLyBeL3Co8YWCD9MAapM4UI9lT7yhV6pVq6UTPHjTwlh5KvR4/e1lgAW02FlOW0wxonwFg4AwuIsbTAY8SlWLmb6eNDqAWFmYt3RaPcSk+UjLAHA1TiaGgHt2MXzVlZg5vesx5wE30Y0HIrUO6yWQf93Top1cImvBEaOGsNq3Shkn3gNtvRAtWgJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLPjVFR5vbLJargMqhfLbBmXS8iCs2b87qMKEQ5IsA0=;
 b=hlU5k+QYzF82UgsgW4W7VB5KMWCy32UIxObF5lc1s9OGgycs46kvKdl2cB3IxRdR5Nw1RSNasduhGAfbMIHfO1Exw+IUDWXLdN/UgVXhKRYaX8k6alXM5vpAXAV1j+ruvThlDbQiRvdAB6c04aeZVVb78p9RDp6dQB5V+WDreqh68Nr+76GwiIa4oZLA2pWfXSfbaLp2unl0Y/WQKeT40c5bm3iNYEA/UGzPru10POdrSscGv6Gth8INDPRQdKUYIdLANfYrV6opQqqbNCV/tb9Ddd9KRmWj4fNwZpWI2X74zQPfhit7W2iRs4e6rxi7CW9nlW8GkWYhFvYADgbAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLPjVFR5vbLJargMqhfLbBmXS8iCs2b87qMKEQ5IsA0=;
 b=J2Xq0e4QksRLQsxn74deSdM6HvNf0qIRJHVCXe4aa6iS/JoAKPPYnylhVdw7W1RoSwqo7o+e2bHPjz8ispSsTMSD4AiUdP9doMq7E5HRSq9jUcQ6U2HEVv23/mJfWLSkPMCBEP8ypRlvo9zi68f6+qAml8OCiSwd/lwg1jts1xI=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM7PR04MB6872.eurprd04.prod.outlook.com (2603:10a6:20b:106::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 10:12:20 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::b10a:ad0:a6f5:db9b%2]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 10:12:20 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "G.n. Zhou" <guoniu.zhou@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
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
Subject: RE: [PATCH v10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Topic: [PATCH v10] arm64: dts: imx8qxp: Add jpeg encoder/decoder nodes
Thread-Index: AQHXKwo00+hhoUqk50aSBsajPrI5tKq+0rMg
Date:   Wed, 21 Apr 2021 10:12:20 +0000
Message-ID: <AM6PR04MB496668C16DBDC3D46A2A018080479@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20210406172740.13904-1-mirela.rabulea@oss.nxp.com>
In-Reply-To: <20210406172740.13904-1-mirela.rabulea@oss.nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70871847-fcf2-4996-dc68-08d904adf320
x-ms-traffictypediagnostic: AM7PR04MB6872:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6872CE74257D7D9AB70042C780479@AM7PR04MB6872.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uDQ27WZtICXq6uDUalVIKNhg1om4FEFQt+EAFnbQq2rCpS8eOA9+sjqoNGCnJO8i9+9fCl69JnkaSjxEBh1TuAjI+SoPxhr1LsjY0GAQHHkbbtZHNenN3+T6oozx2BoLgiJiHxokxuAod+lKxQWu/2NgltnixM9iEn6NgR/zjk0ShxRHcZHDCAk31HC/jW3Mlo7O2KVKnhbjV0t94RfzasvlKaAfG6aQ5LTvSgg+ugLfDpY6BYqWs4qQlmUZmCzQRbItsEU/MAXsIw19GICpmmu4Y1K/0y9wgBgrJb+girsiKQmOUsfYcO+fc0d6GGd3lzSKrx7ioQUcCIec4RXT+RVdv6bD/2nphvpWj5zoTr2JG2AHrqMvd9TRSEpZEcdQkDAvbu4dC1ZboMkzLy8jkvEgmRaehCnfIIiOFLdO5/iVjyMG4WZFhzOZ9MpL0b+qT6Ztdqsu3me/OCslqmS315ey/o8roV8nk5AOgoJ94HyiU4GGLDituIqAi9m06boNuMJ4aChePMmJhOUu9t5+hO9pO2lVwGdxVm9W1zH7weguPd8rjLKgJQPh+ta561PqGuMhkx7Msc9/7d4n55OaN9XvZSVTEYgXWL3c5WHVFV4HLpXSORBDqFjzcb8x5RJDRCtlaLUS7tDmMe2hJjwEfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(2906002)(478600001)(33656002)(44832011)(110136005)(38100700002)(316002)(86362001)(8936002)(71200400001)(83380400001)(5660300002)(54906003)(66476007)(52536014)(66946007)(66446008)(64756008)(66556008)(76116006)(7416002)(4326008)(7696005)(26005)(9686003)(6506007)(8676002)(55016002)(122000001)(186003)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZDVMTVR3MXJCNmlXb1BzRXRBbWdPcTZBWTRBeEptcXB4UjVoZ1lRSE5pM1J4?=
 =?utf-8?B?a2VJYWdGRHRqblF5VVlXcEgxaTJBc1JxNjRCYjNZVUxkdE1sMmxwZEkzWGFS?=
 =?utf-8?B?NG5OcHp3MkRHcXFZakovYStudVdIOW1uaHNHK0RObnpTRDBaYzRtSkpDaVRu?=
 =?utf-8?B?MnNVNDNzTENoMFlOZzlVK2xIU3BnWFBlbHk5NUZZVEdCNDhmemxPck5uOFUz?=
 =?utf-8?B?VGlkRi9kR1BYWWFTdWh6QXJwY1BIMEtBZjBydmtLa1R0NExXd1c0YVBreFFW?=
 =?utf-8?B?cUZwM29VS1Q0M0ZuRnBJdllHOWdjN29JTFg3RVE5Q3krVmZjZHJPeUtIMkIx?=
 =?utf-8?B?NmNNbWROdXRFR01xc0llUzJ2TUs4WTJjczZmNGFjRHlydW1idXVjUWhacVk0?=
 =?utf-8?B?MGF2WWcvUXBoNGNsd0haSDJtcklHVFZVTFpLZnlDN2VQb3FCUGsyYXFxcHFk?=
 =?utf-8?B?UVNjWVRybTNLN2xJNzRHRUZUSXRGUzl5M3Fib2FYZVJuNTFWUldtZHpJT1Bm?=
 =?utf-8?B?Smt1dTl1T0hLWDBGY1VHY0tMZDJxazdyeDQ0Q3lGWGd3QkJTemtXRURQYmE1?=
 =?utf-8?B?aWczMllZNUlNaG5wVHBVVVhkTUNPU0YyWU5zZ1I0NHY2R3pTTitlRXhwU3N5?=
 =?utf-8?B?SnJwVHY0ZEE5UnVDZmt6U1RGOUJyOThVa1VxcStuOSttUEszNFIwZVlORDh2?=
 =?utf-8?B?TGE3ZzJOUkRWZ2dvNnNIb1dLREJVZGVMOEowRnNEeUdFNXh5WEswbkcwdm9w?=
 =?utf-8?B?OSt6MTl0c1M1aVF5VUU1M2RXTklESmQ4S0hIMW9IMXZtMHVzMUpDR3lyUUNY?=
 =?utf-8?B?YTFsMmUxVm9KaXozUGIyRHpRQkhocXluVHltWWZEeWlQNGlVOEdtbXU0TTcz?=
 =?utf-8?B?VnZwSzNmS2IwSjd1MTI5VHBjVlNaUlY4eFZHL2R3NlZXUGY1Z1lKL1hoUnVv?=
 =?utf-8?B?NVdzdXY5OEVUZEo4TnVPSm5RRnE2UDJXYWsrWllrRGh5YjBjcnByRmtBc0kv?=
 =?utf-8?B?WnV4L0dHYzlEMjlJTkRheGNQVTc0d3NJTURrc0Z6R0pscHREU2ZmZGxvR3lQ?=
 =?utf-8?B?RjI5QkZxN0dKZ2pxeTloWW9VZ3c4SmtsUmJ2dFJnTXV2MnBTeW1xSWtuZFJU?=
 =?utf-8?B?dVpyUnJkY1JLZk55bWRMMnJ4dmVTbEVIWUtHOEl5Nk1DcXo0NnN3ZlZjNklJ?=
 =?utf-8?B?b2ZtWTBIR3dKY1ZOcXd2ZFRiVTZBemVuZXcxOUNZZ0JsMDRrL3FoZk9GNDhB?=
 =?utf-8?B?Y1FQSVpQMEJuTmhBaE9oK3VtUFRjOEZya2JTdm05YWEvajM2c2VURC9Wcktq?=
 =?utf-8?B?VGNCOWtiRlI2cE10dk5lRmxQM0JCY25GV3hxaDU2UFRIUitFZ0QxekJkOEJt?=
 =?utf-8?B?aFJibGZyNHZ0aW5rYmNJeEwza2EyWWtXYS85TytNZ2NCVmR0b25sQjBDSGZ6?=
 =?utf-8?B?Nk5Tb1NEMnN0Wllvdm5tMnVMaTFiUWJPOWxic1hsOXFZSnQ2SERUdDY4R2xx?=
 =?utf-8?B?SDB1RUJ0MzErbnZiSDFZSW83Q3YxOHc0RVpoVm5IejVhRzBhQ1UwMVIzMkdJ?=
 =?utf-8?B?bnRNeDVqaGtrUGZlTDBTMVJDTzYxN21mWlRob0xNcyt1My9wK3hwSXZtL2F4?=
 =?utf-8?B?dE9oZXU1OW42bVpYTE1zNzBQenVDSE5LVXhFUHI0OCtjbXdxSG9Namt6TFBY?=
 =?utf-8?B?dDAxdmhpQmYxcUZMYWp5SjBPRjB4Riswa1UySy9EY3dKNlRmTy9xUG1scjdp?=
 =?utf-8?Q?loCvvOTGjsyhp/gQGigq8YeS4AT7YE3/Qkx8z3K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70871847-fcf2-4996-dc68-08d904adf320
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2021 10:12:20.2747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KWoRioKbUwO41Ix4MU0YcrxhEkylaJF1woWnqL+12x3v3faZ+yoqViDVeGlNYmHDiBXxv+oeFXgdxMiiSRZazQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6872
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCg0KPiBGcm9tOiBNaXJlbGEg
UmFidWxlYSAoT1NTKSA8bWlyZWxhLnJhYnVsZWFAb3NzLm54cC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgQXByaWwgNywgMjAyMSAxOjI4IEFNDQo+IA0KPiBBZGQgZHRzIGZvciBpbWFnaW5nIHN1
YnN5dGVtLCBpbmNsdWRlIGpwZWcgbm9kZXMgaGVyZS4NCj4gVGVzdGVkIG9uIGlteDhxeHAgb25s
eSwgc2hvdWxkIHdvcmsgb24gaW14OHFtLCBidXQgaXQgd2FzIG5vdCB0ZXN0ZWQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4g
LS0tDQo+IFRoaXMgd2FzIHBhdGNoICM3IGluIHRoZSBpbml0aWFsIHBhdGNoIHNldCB0aGF0IGFk
ZGVkIG14Yy1qcGVnIGRyaXZlcg0KPiANCj4gQ2hhbmdlcyBpbiB2MTA6DQo+ICAgQWRkcmVzc2Vk
IGZlZWRiYWNrIGZyb20gQWlzaGVuZyBEb25nOg0KPiAgICAgLUFkZCBqcGVnIGNsb2NrcyBpbiB0
aGUganBlZyBkdHMgbm9kZXMuDQo+ICAgICAtQWRhcHQgdG8gdGhlIHJlY2VudCBzcGxpdCBvZiB0
aGUgZHRzIGludG8gc3Vic3lzdGVtczoNCj4gICAgICBhZGQgdGhlIGltYWdpbmcgc3Vic3lzdGVt
LCBhbmQgcGxhY2UganBlZyBub2RlcyB0aGVyZS4NCj4gDQo+ICAuLi4vYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kgfCA4OSArKysrKysrKysrKysrKysrKysrDQo+ICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4cXhwLmR0c2kgICAgfCAgMSArDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDkwIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1pbWcuZHRzaQ0K
PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDgtc3MtaW1nLmR0c2kNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xNDU3ZDIxOWE2NTgNCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
LXNzLWltZy5kdHNpDQo+IEBAIC0wLDAgKzEsODkgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wKw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAyMDE5LTIwMjEgTlhQDQo+
ICsgKiBaaG91IEd1b25pdSA8Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gKyAqLw0KPiAraW1nX3N1
YnN5czogYnVzQDU4MDAwMDAwIHsNCj4gKwljb21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KPiAr
CSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiArCSNzaXplLWNlbGxzID0gPDE+Ow0KPiArCXJhbmdl
cyA9IDwweDU4MDAwMDAwIDB4MCAweDU4MDAwMDAwIDB4MTAwMDAwMD47DQo+ICsNCj4gKwlpbWdf
aXBnX2NsazogY2xvY2staW1nLWlwZyB7DQo+ICsJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2si
Ow0KPiArCQkjY2xvY2stY2VsbHMgPSA8MD47DQo+ICsJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyMDAw
MDAwMDA+Ow0KPiArCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiaW1nX2lwZ19jbGsiOw0KPiArCX07
DQo+ICsNCj4gKwlpbWdfanBlZ19kZWNfY2xrOiBjbG9jay1jb250cm9sbGVyQDU4NWQwMDAwIHsN
Cg0Kcy9jbGsvbHBjZw0KDQo+ICsJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhxeHAtbHBjZyI7DQo+
ICsJCXJlZyA9IDwweDU4NWQwMDAwIDB4MTAwMDA+Ow0KPiArCQkjY2xvY2stY2VsbHMgPSA8MT47
DQo+ICsJCWNsb2NrcyA9IDwmaW1nX2lwZ19jbGs+LCA8JmltZ19pcGdfY2xrPjsNCj4gKwkJY2xv
Y2staW5kaWNlcyA9IDxJTVhfTFBDR19DTEtfMD4sDQo+ICsJCQkJPElNWF9MUENHX0NMS180PjsN
Cj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gImltZ19qcGVnX2RlY19jbGsiLA0KPiArCQkJCSAg
ICAgImltZ19qcGVnX2RlY19pcGdfY2xrIjsNCj4gKwkJcG93ZXItZG9tYWlucyA9IDwmcGQgSU1Y
X1NDX1JfTUpQRUdfREVDX01QPjsNCj4gKwl9Ow0KPiArDQo+ICsJaW1nX2pwZWdfZW5jX2Nsazog
Y2xvY2stY29udHJvbGxlckA1ODVmMDAwMCB7DQoNCnMvY2xrL2xwY2cNCg0KPiArCQljb21wYXRp
YmxlID0gImZzbCxpbXg4cXhwLWxwY2ciOw0KPiArCQlyZWcgPSA8MHg1ODVmMDAwMCAweDEwMDAw
PjsNCj4gKwkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KPiArCQljbG9ja3MgPSA8JmltZ19pcGdfY2xr
PiwgPCZpbWdfaXBnX2Nsaz47DQo+ICsJCWNsb2NrLWluZGljZXMgPSA8SU1YX0xQQ0dfQ0xLXzA+
LA0KPiArCQkJCTxJTVhfTFBDR19DTEtfND47DQo+ICsJCWNsb2NrLW91dHB1dC1uYW1lcyA9ICJp
bWdfanBlZ19lbmNfY2xrIiwNCj4gKwkJCQkgICAgICJpbWdfanBlZ19lbmNfaXBnX2NsayI7DQo+
ICsJCXBvd2VyLWRvbWFpbnMgPSA8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19NUD47DQo+ICsJfTsN
Cj4gKw0KPiArCWNhbWVyYWRldjogY2FtZXJhIHsNCg0KSXMgdGhpcyBub2RlIG5lY2Vzc2FyeT8N
Cg0KPiArCQljb21wYXRpYmxlID0gInNpbXBsZS1idXMiOw0KPiArCQkjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gKwkJI3NpemUtY2VsbHMgPSA8MT47DQo+ICsJCXJhbmdlczsNCj4gKw0KPiArCQlq
cGVnZGVjOiBqcGVnZGVjQDU4NDAwMDAwIHsNCj4gKwkJCWNvbXBhdGlibGUgPSAibnhwLGlteDhx
eHAtanBnZGVjIjsNCg0KSXMgdGhpcyBjb21wYXRpYmxlIHN0cmluZyB1cHN0cmVhbWVkIGFscmVh
ZHk/DQoNCj4gKwkJCXJlZyA9IDwweDU4NDAwMDAwIDB4MDAwNTAwMDAgPjsNCj4gKwkJCWludGVy
cnVwdHMgPSA8R0lDX1NQSSAzMDkgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJICAgICA8
R0lDX1NQSSAzMTAgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJICAgICA8R0lDX1NQSSAz
MTEgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJICAgICA8R0lDX1NQSSAzMTIgSVJRX1RZ
UEVfTEVWRUxfSElHSD47DQo+ICsJCQljbG9ja3MgPSA8JmltZ19qcGVnX2RlY19jbGsgMD4sDQo+
ICsJCQkJIDwmaW1nX2pwZWdfZGVjX2NsayAxPjsNCg0KSXMgdGhlIGluZGV4IGNvcnJlY3QgaGVy
ZT8NCg0KPiArCQkJY2xvY2stbmFtZXMgPSAicGVyIiwgImlwZyI7DQo+ICsJCQlhc3NpZ25lZC1j
bG9ja3MgPSA8JmltZ19qcGVnX2RlY19jbGsgMD4sDQo+ICsJCQkJCSAgPCZpbWdfanBlZ19kZWNf
Y2xrIDE+Ow0KPiArCQkJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8MjAwMDAwMDAwPjsNCg0KTWlz
bWF0Y2ggd2l0aCBhc3NpZ25lZC1jbG9ja3MNCg0KPiArCQkJcG93ZXItZG9tYWlucyA9IDwmcGQg
SU1YX1NDX1JfTUpQRUdfREVDX01QPiwNCj4gKwkJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
UzA+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0RFQ19TMT4sDQo+ICsJCQkJCTwmcGQg
SU1YX1NDX1JfTUpQRUdfREVDX1MyPiwNCj4gKwkJCQkJPCZwZCBJTVhfU0NfUl9NSlBFR19ERUNf
UzM+Ow0KPiArCQl9Ow0KPiArDQo+ICsJCWpwZWdlbmM6IGpwZWdlbmNANTg0NTAwMDAgew0KPiAr
CQkJY29tcGF0aWJsZSA9ICJueHAsaW14OHF4cC1qcGdlbmMiOw0KPiArCQkJcmVnID0gPDB4NTg0
NTAwMDAgMHgwMDA1MDAwMCA+Ow0KPiArCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDMwNSBJUlFf
VFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCQkgICAgIDxHSUNfU1BJIDMwNiBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwNCj4gKwkJCQkgICAgIDxHSUNfU1BJIDMwNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwN
Cj4gKwkJCQkgICAgIDxHSUNfU1BJIDMwOCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gKwkJCWNs
b2NrcyA9IDwmaW1nX2pwZWdfZW5jX2NsayAwPiwNCj4gKwkJCQkgPCZpbWdfanBlZ19lbmNfY2xr
IDE+Ow0KDQpEaXR0bw0KDQo+ICsJCQljbG9jay1uYW1lcyA9ICJwZXIiLCAiaXBnIjsNCj4gKwkJ
CWFzc2lnbmVkLWNsb2NrcyA9IDwmaW1nX2pwZWdfZW5jX2NsayAwPiwNCj4gKwkJCQkJICA8Jmlt
Z19qcGVnX2VuY19jbGsgMT47DQo+ICsJCQlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyMDAwMDAw
MDA+Ow0KDQpEaXR0bw0KDQo+ICsJCQlwb3dlci1kb21haW5zID0gPCZwZCBJTVhfU0NfUl9NSlBF
R19FTkNfTVA+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMD4sDQo+ICsJCQkJ
CTwmcGQgSU1YX1NDX1JfTUpQRUdfRU5DX1MxPiwNCj4gKwkJCQkJPCZwZCBJTVhfU0NfUl9NSlBF
R19FTkNfUzI+LA0KPiArCQkJCQk8JnBkIElNWF9TQ19SX01KUEVHX0VOQ19TMz47DQo+ICsJCX07
DQo+ICsJfTsNCj4gK307DQoNClJlZ2FyZHMNCkFpc2hlbmcNCg0KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGIvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpDQo+IGluZGV4IDFlNmI0OTk1MDkxZS4uMmQ5
NTg5MzA5YmQwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4cXhwLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4
cC5kdHNpDQo+IEBAIC0yNTgsNiArMjU4LDcgQEANCj4gIAl9Ow0KPiANCj4gIAkvKiBzb3J0ZWQg
aW4gcmVnaXN0ZXIgYWRkcmVzcyAqLw0KPiArCSNpbmNsdWRlICJpbXg4LXNzLWltZy5kdHNpIg0K
PiAgCSNpbmNsdWRlICJpbXg4LXNzLWFkbWEuZHRzaSINCj4gIAkjaW5jbHVkZSAiaW14OC1zcy1j
b25uLmR0c2kiDQo+ICAJI2luY2x1ZGUgImlteDgtc3MtZGRyLmR0c2kiDQo+IC0tDQo+IDIuMTcu
MQ0KDQo=
