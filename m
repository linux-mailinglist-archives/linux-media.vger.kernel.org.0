Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52D52CEF8D
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 15:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388237AbgLDOO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 09:14:29 -0500
Received: from mail-db8eur05on2059.outbound.protection.outlook.com ([40.107.20.59]:15232
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388063AbgLDOO2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Dec 2020 09:14:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHWoJ/brC7t8AGxibsG/eeYoqEqXJju91/AI0HAE2gv9hSquGXtvxpCGadDYQvhzBYxeCPiSmuM1xvVuIFXzEzsjmp68mXyzk6sWhMzwJFrVmz13r5qr934DW+Q/0/Mg6spENyoBk2dGCsQbqosBOtGuNmUG7IPAHPTjPh0ygaA47ECYy8JIhv8I7EKVz5T5DKpcOSytkjX4hDfwIaD8NIoE0kA9+ZIBbRJMY7enrnOR5oUFAaahLyHGM2CiR5QKujjUGTqbK17JY8JKePUrmetltLjTsJxOPxL8v9yE5SpVG+oZf9Y7xqyibhJBLFY2CQItsUtBGs7CZErpsZwWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyJZi+mWMRTMHEfXh4HBHdWulau+aVj9vm6nFTz7a5E=;
 b=ZRV/JplgMy/dX1pyhbpa5/zMTF5eGqAbZ+uKCu3g97oNrL38HgiXiN7H50koTxsHuanB66+Y0fPBVzSRWnKviZ/I2VsC5fvv6M2hkVW19+zD7uUlPaTz626JrgJEnCz9sVd/sTshESVCIXJ5ieDBqM9HPCV0+yNrFGUaFcLl2i1D8SPg86HCkTW+trCHlwPBC+/nPVVH0znlFx168KYup/OwNj32XgwwThU9MNcw4Lk9kcRBqRtQTgAc3KZnhmoi7+kLXMyIfRfV+csGQOCVR10SPu82wSzTfw1Kt0SMoSvhCPu3Ckzr1r/qYXMcTJmL5W7IPc4esnSRPx4anxVjSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyJZi+mWMRTMHEfXh4HBHdWulau+aVj9vm6nFTz7a5E=;
 b=h0bzeWFe9FOGznYsL6U7/3NM2nhyHxqO1yDqxTWa+br/RH8b1aOoU8nooRAJzUtJtraq6NNYduv7Ux6btozAZwqYYDSjGjmaBDZEj0sQtqJYq1Ifh1bVbEo9rqsIGbZpHHeDcNvtG4gk17V76Et4YwLGjFu8MtKZITCiN5fcMN0=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6279.eurprd04.prod.outlook.com (2603:10a6:20b:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 14:13:34 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3632.017; Fri, 4 Dec 2020
 14:13:34 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v5 07/10] media: Add parsing for APP14 data
 segment in jpeg helpers
Thread-Topic: [EXT] Re: [PATCH v5 07/10] media: Add parsing for APP14 data
 segment in jpeg helpers
Thread-Index: AQHWuKDqyfB9auL2qEC7/KHmF1dk4KnkC4eAgAMSg4A=
Date:   Fri, 4 Dec 2020 14:13:34 +0000
Message-ID: <2bffcb5a2454dfc2188cc11b0f796f965cc7291e.camel@oss.nxp.com>
References: <20201112030557.8540-1-mirela.rabulea@oss.nxp.com>
         <20201112030557.8540-8-mirela.rabulea@oss.nxp.com>
         <6acf2724130aa2e927cd116ecd216bec3e0321a5.camel@pengutronix.de>
In-Reply-To: <6acf2724130aa2e927cd116ecd216bec3e0321a5.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.124.172.14]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 259367a2-9e0b-4a06-3fa8-08d8985ec955
x-ms-traffictypediagnostic: AM6PR04MB6279:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6279BE128AA73735BC185B48CEF10@AM6PR04MB6279.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5fGKNVs00ql29YYC/IPvHjwkpsADiSM0jFLpovAv6iF4p2+MmIfOpAncrMYYheW9rlG4HfHYx4Zny6opY55QRTy7UIDiIuzv0oR90fhC7cmMvgsi/JkVS+eFJVMfpnMO2/DDlvae612gHg+X6/KxTBvK1Ql9S03zOUZCFOVRr4BPmAAk/iFhRppnhXAVCJvqsUDvPRnyDfce/n+WQAyFwu1P+xXcFFPrq/6Z6cl3x9V77KrOtGH4zUHUaAJYpfd9UUVMazFxYgEsILWK+h5fc1L2hjJe31jcpF2U+Hi4h+xCVLiTOoTcB/jvmEovosuVM5mw5Ezsl67I8qy+OemU1a5rcuc2Xyk3VhIo20ON3/mZKgUfeEsVA+V67V12RK3f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(478600001)(76116006)(66556008)(66946007)(66446008)(91956017)(6486002)(66476007)(64756008)(6506007)(2616005)(8936002)(83380400001)(86362001)(5660300002)(8676002)(7416002)(26005)(2906002)(4001150100001)(316002)(186003)(4326008)(6512007)(54906003)(71200400001)(110136005)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?WHRnOWtGWW8rK09QYi9ZbEhXOG5CYXJ3R2piekZLb0xsTW1RTTV6OFI4VVdN?=
 =?utf-8?B?ciswZEhUN1F5bFZmK1Y5bzNwTlJRazVuRUxtNER0MG9oNTYxNVcxeisyQ3k2?=
 =?utf-8?B?cHJNVFVLa05uRVozWmpQdjYvbWQxMG5hbVNSMW5CcjhSY0R2bjJSdi9relFX?=
 =?utf-8?B?Y0QyanV5TmZXa0xqelN1U3RMUzNBVitYVFRSVWpIalVjNmhhS2MzejArdUI5?=
 =?utf-8?B?NExOeHJuaHNVTjZlS2NQZDE1ZERsUW5weEJCRFg3WElPSXp1eE9sdnR0QytW?=
 =?utf-8?B?SVR2MzVzcmVJUVM5TW5lemFiZExkU0o5SzdVQjVzdnd3bzFxTGZUd2lRWEtI?=
 =?utf-8?B?Ymlhb0hGYks1SnhnRUFhSDlJOC9ZZU1JT2NHN01NNmV0N3h6OHR0SzNIcjk3?=
 =?utf-8?B?ZVZsc1RvTE9La3M1UXRhOExvdmRkcGVmUklTQVQ3N1dWK2dhMmllUDVManZq?=
 =?utf-8?B?RDY3N2YyZlNaZnBvenFabmJNcHVET3BNQnJnUkU2Nzk5bUkyQTJLWGl6dC9w?=
 =?utf-8?B?SWVXK2Vna2FnazljMFBSemsyZDdnSUF1RVhZQmo4amNKOHhUTHo1Wk1COUJN?=
 =?utf-8?B?UlpUbzhtcDI2ZEF0UHYwTUwvc3plb2Q0d05SM0JOQ1VidSt4OUx6Ykw5d2Qr?=
 =?utf-8?B?bVFTbXFLZWphQW5sbEZocUlLZ2RESGV3Q2RPcEpaTkxLRDdKUkQyL1JIYjVa?=
 =?utf-8?B?ZmpsaEN5ejdPVkU5aWdwZmwvdjE1akt4RmNTdnI4WTN1NU14NlNXbDNzOWZB?=
 =?utf-8?B?R081eWxRYnltcFdpNm50NTdnUTBjWTltTCtKeTdRY052bGUveFlxZXFIVWQr?=
 =?utf-8?B?SGpUenY0eG15T0FCK2IyNGFoVEtZWEE1cWN0eFJod29ES1I4ak9tRUJkSFFH?=
 =?utf-8?B?VjMxby9FY21aMTZFWDExcEFINFI4NlZrdlBHMHBsSGdjWXJmbzN3SU1GaWxo?=
 =?utf-8?B?M3RIc2RCdkhMeklZU0xJcy9xZWxUbmIrczFBb2E0WHJnMERwQW5VTnFOdWMr?=
 =?utf-8?B?Q09yajg3Qjg5Q0VaZVRyb09NZmRIMmwxNHBqc2ZMSlQyU3pVQytXamI5Y3BV?=
 =?utf-8?B?K1dWV3lqdEhkRG16ODRGVDU5ZjRRMDhXbEY5RFJKZzV2amZsSy9Xd25tSkpx?=
 =?utf-8?B?MWtBQnd2RTdPSGRGM25uNEZlZDB0Rll1QzdTcVBTQjJUd1ZsSitYMEhCTHMv?=
 =?utf-8?B?T3ZqVE9hRGFBdnJEaklxSjJYdkNnNnIvVWxSN1JlaWRNMWYrVTJqVUoxWmVV?=
 =?utf-8?B?dTFTWjFwNkloM3pDQUphcWRqeUlKK1dleTE5Mk81VndBaEtiZkZKUzNtNkN5?=
 =?utf-8?Q?HSpTNKYJe2Pql84qdDMaOUF4Mjml+cknAO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29D454CC9DA9634D847BD047F8EA316D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 259367a2-9e0b-4a06-3fa8-08d8985ec955
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2020 14:13:34.3621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6mY+sEbYhq8Xw1mVXklBtsd5lqk1yyMrq5+6mF3yxxxAimiam1y8GZQ/wFfzFkW7shFHyYPT1e9QRbZfN8M2Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6279
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpcGlwcCwNCg0KT24gV2VkLCAyMDIwLTEyLTAyIGF0IDE2OjE4ICswMTAwLCBQaGlsaXBw
IFphYmVsIHdyb3RlOg0KPiANCj4gSGkgTWlyZWxhLA0KPiANCj4gT24gVGh1LCAyMDIwLTExLTEy
IGF0IDA1OjA1ICswMjAwLCBNaXJlbGEgUmFidWxlYSAoT1NTKSB3cm90ZToNCj4gPiBGcm9tOiBN
aXJlbGEgUmFidWxlYSA8bWlyZWxhLnJhYnVsZWFAbnhwLmNvbT4NCj4gPiANCj4gPiBBY2NvcmRp
bmcgdG8gUmVjLiBJVFUtVCBULjg3MiAoMDYvMjAxMikgNi41LjMNCj4gPiBBUFAxNCBzZWdtZW50
IGlzIGZvciBjb2xvciBlbmNvZGluZywgaXQgY29udGFpbnMgYSB0cmFuc2Zvcm0gZmxhZywNCj4g
PiB3aGljaA0KPiA+IG1heSBoYXZlIHZhbHVlcyBvZiAwLCAxIGFuZCAyIGFuZCBhcmUgaW50ZXJw
cmV0ZWQgYXMgZm9sbG93czoNCj4gPiAwIC0gQ01ZSyBmb3IgaW1hZ2VzIHRoYXQgYXJlIGVuY29k
ZWQgd2l0aCBmb3VyIGNvbXBvbmVudHMNCj4gPiAgIC0gUkdCIGZvciBpbWFnZXMgdGhhdCBhcmUg
ZW5jb2RlZCB3aXRoIHRocmVlIGNvbXBvbmVudHMNCj4gPiAxIC0gQW4gaW1hZ2UgZW5jb2RlZCB3
aXRoIHRocmVlIGNvbXBvbmVudHMgdXNpbmcgWUNiQ3IgY29sb3VyDQo+ID4gZW5jb2RpbmcuDQo+
ID4gMiAtIEFuIGltYWdlIGVuY29kZWQgd2l0aCBmb3VyIGNvbXBvbmVudHMgdXNpbmcgWUNDSyBj
b2xvdXINCj4gPiBlbmNvZGluZy4NCj4gPiANCj4gPiBUaGlzIGlzIHVzZWQgaW4gaW14LWpwZWcg
ZGVjb2RlciwgdG8gZGlzdGluZ3Vpc2ggYmV0d2Vlbg0KPiA+IFlVVjQ0NCBhbmQgUkdCMjQuDQo+
ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVhQG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2NToNCj4gPiBUaGlzIHdhcyBwYXRjaCA4
IGluIHByZXZpb3VzIHZlcnNpb24NCj4gPiBSZXBsYWNlZCBhIHN0cnVjdCBmb3IgYXBwMTQgZGF0
YSB3aXRoIGp1c3QgYW4gaW50LCBzaW5jZSB0aGUNCj4gPiB0cmFuc2Zvcm0gZmxhZyBpcyB0aGUg
b25seSBtZWFuaW5nZnVsbCBpbmZvcm1hdGlvbiBmcm9tIHRoaXMNCj4gPiBzZWdtZW50DQo+IA0K
PiBDb3VsZCB3ZSB0dXJuIHRoaXMgaW50byBhbiBlbnVtIGZvciB0aGUgdHJhbnNmb3JtIGZsYWcs
IGFuZCBpbmNsdWRlDQo+IHRoZQ0KPiBhYm92ZSBzcGVjIHJlZmVyZW5jZSBpbiBpdHMga2VybmVs
ZG9jIGNvbW1lbnQ/IEkgdGhpbmsgdGhpcyB3b3VsZCBiZQ0KPiBiZXR0ZXIgdGhhbiBjaGVja2lu
ZyBmb3IgKGFwcDE0X3RmID09IDxtYWdpY19udW1iZXI+KSBpbiB0aGUgZHJpdmVycy4NCg0KQXBw
cmVjaWF0ZSB5b3VyIGZlZWRiYWNrLCBmb3IgYWxsIHBhdGNoZXMsIEknbGwgYWRkcmVzcyBpdCBp
biB2Ni4NCldoZXJlIHdvdWxkIGJlIGEgYmV0dGVyIHBsYWNlIGZvciB0aGlzIGVudW0sIHY0bDIt
anBlZy5oLCBvciBtYXliZQ0KaW5jbHVkZS91YXBpL2xpbnV4L3Y0bDItY29udHJvbHMuaD8NCg0K
VGhhbmtzLA0KTWlyZWxhDQoNCj4gDQo+ID4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDIt
anBlZy5jIHwgMzkNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+ICBpbmNs
dWRlL21lZGlhL3Y0bDItanBlZy5oICAgICAgICAgICB8ICA2ICsrKy0tDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1qcGVnLmMNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItanBlZy5jDQo+ID4gaW5kZXggODk0N2ZkOTVjNmYxLi4z
MTgxY2U1NDRmNzkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1qcGVnLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWpwZWcuYw0K
PiA+IEBAIC00NSw2ICs0NSw3IEBAIE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiAgI2RlZmlu
ZSBESFAgIDB4ZmZkZSAgLyogaGllcmFyY2hpY2FsIHByb2dyZXNzaW9uICovDQo+ID4gICNkZWZp
bmUgRVhQICAweGZmZGYgIC8qIGV4cGFuZCByZWZlcmVuY2UgKi8NCj4gPiAgI2RlZmluZSBBUFAw
IDB4ZmZlMCAgLyogYXBwbGljYXRpb24gZGF0YSAqLw0KPiA+ICsjZGVmaW5lIEFQUDE0ICAgICAg
ICAweGZmZWUgIC8qIGFwcGxpY2F0aW9uIGRhdGEgZm9yIGNvbG91cg0KPiA+IGVuY29kaW5nICov
DQo+ID4gICNkZWZpbmUgQVBQMTUgICAgICAgIDB4ZmZlZg0KPiA+ICAjZGVmaW5lIEpQRzAgMHhm
ZmYwICAvKiBleHRlbnNpb25zICovDQo+ID4gICNkZWZpbmUgSlBHMTMgICAgICAgIDB4ZmZmZA0K
PiA+IEBAIC00NDQsOCArNDQ1LDM3IEBAIHN0YXRpYyBpbnQganBlZ19za2lwX3NlZ21lbnQoc3Ry
dWN0DQo+ID4ganBlZ19zdHJlYW0gKnN0cmVhbSkNCj4gPiAgICAgICByZXR1cm4ganBlZ19za2lw
KHN0cmVhbSwgbGVuIC0gMik7DQo+ID4gIH0NCj4gPiANCj4gPiArLyogUmVjLiBJVFUtVCBULjg3
MiAoMDYvMjAxMikgNi41LjMgKi8NCj4gPiArc3RhdGljIGludCBqcGVnX3BhcnNlX2FwcDE0X2Rh
dGEoc3RydWN0IGpwZWdfc3RyZWFtICpzdHJlYW0pDQo+ID4gK3sNCj4gPiArICAgICBpbnQgcmV0
Ow0KPiA+ICsgICAgIGludCBMcDsNCj4gDQo+IExldCdzIGtlZXAgdmFyaWFibGVzIGxvd2VyIGNh
c2UuDQo+IA0KPiA+ICsgICAgIGludCBza2lwOw0KPiA+ICsgICAgIGludCB0ZjsNCj4gPiArDQo+
ID4gKyAgICAgTHAgPSBqcGVnX2dldF93b3JkX2JlKHN0cmVhbSk7DQo+ID4gKyAgICAgaWYgKExw
IDwgMCkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBMcDsNCj4gDQo+IFNob3VsZCB3ZSBjaGVj
ayB0aGF0IEFwMSB0byA2IGFyZSBhY3R1YWxseSAiQWRvYmVcMCI/DQo+IA0KPiA+ICsgICAgIC8q
IGdldCB0byBBcDEyICovDQo+ID4gKyAgICAgcmV0ID0ganBlZ19za2lwKHN0cmVhbSwgMTEpOw0K
PiA+ICsgICAgIGlmIChyZXQgPCAwKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKw0KPiA+ICsgICAgIHRmID0ganBlZ19nZXRfYnl0ZShzdHJlYW0pOw0KPiA+ICsgICAg
IGlmICh0ZiA8IDApDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gdGY7DQo+ID4gKw0KPiA+ICsg
ICAgIHNraXAgPSBMcCAtIDIgLSAxMTsNCj4gPiArICAgICByZXQgPSBqcGVnX3NraXAoc3RyZWFt
LCBza2lwKTsNCj4gPiArICAgICBpZiAocmV0IDwgMCkNCj4gPiArICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+ICsgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgIHJldHVybiB0ZjsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gLSAqIGpwZWdfcGFyc2VfaGVhZGVyIC0gbG9j
YXRlIG1hcmtlciBzZWdtZW50cyBhbmQgb3B0aW9uYWxseSBwYXJzZQ0KPiA+IGhlYWRlcnMNCj4g
PiArICogdjRsMl9qcGVnX3BhcnNlX2hlYWRlciAtIGxvY2F0ZSBtYXJrZXIgc2VnbWVudHMgYW5k
IG9wdGlvbmFsbHkNCj4gPiBwYXJzZSBoZWFkZXJzDQo+ID4gICAqIEBidWY6IGFkZHJlc3Mgb2Yg
dGhlIEpQRUcgYnVmZmVyLCBzaG91bGQgc3RhcnQgd2l0aCBhIFNPSQ0KPiA+IG1hcmtlcg0KPiA+
ICAgKiBAbGVuOiBsZW5ndGggb2YgdGhlIEpQRUcgYnVmZmVyDQo+ID4gICAqIEBvdXQ6IHJldHVy
bnMgbWFya2VyIHNlZ21lbnQgcG9zaXRpb25zIGFuZCBvcHRpb25hbGx5IHBhcnNlZA0KPiA+IGhl
YWRlcnMNCj4gPiBAQCAtNDc2LDYgKzUwNiw5IEBAIGludCB2NGwyX2pwZWdfcGFyc2VfaGVhZGVy
KHZvaWQgKmJ1Ziwgc2l6ZV90DQo+ID4gbGVuLCBzdHJ1Y3QgdjRsMl9qcGVnX2hlYWRlciAqb3V0
KQ0KPiA+ICAgICAgIGlmIChtYXJrZXIgIT0gU09JKQ0KPiA+ICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ID4gDQo+ID4gKyAgICAgLyogaW5pdCB2YWx1ZSB0byBzaWduYWwgaWYgdGhp
cyBtYXJrZXIgaXMgbm90IHByZXNlbnQgKi8NCj4gPiArICAgICBvdXQtPmFwcDE0X3RmID0gLUVJ
TlZBTDsNCj4gPiArDQo+ID4gICAgICAgLyogbG9vcCB0aHJvdWdoIG1hcmtlciBzZWdtZW50cyAq
Lw0KPiA+ICAgICAgIHdoaWxlICgobWFya2VyID0ganBlZ19uZXh0X21hcmtlcigmc3RyZWFtKSkg
Pj0gMCkgew0KPiA+ICAgICAgICAgICAgICAgc3dpdGNoIChtYXJrZXIpIHsNCj4gPiBAQCAtNTE5
LDcgKzU1Miw5IEBAIGludCB2NGwyX2pwZWdfcGFyc2VfaGVhZGVyKHZvaWQgKmJ1Ziwgc2l6ZV90
DQo+ID4gbGVuLCBzdHJ1Y3QgdjRsMl9qcGVnX2hlYWRlciAqb3V0KQ0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSBqcGVnX3BhcnNlX3Jlc3RhcnRfaW50ZXJ2YWwoJnN0cmVhbSwNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAm
b3V0LQ0KPiA+ID5yZXN0YXJ0X2ludGVydmFsKTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7DQo+ID4gLQ0KPiA+ICsgICAgICAgICAgICAgY2FzZSBBUFAxNDoNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgb3V0LT5hcHAxNF90ZiA9DQo+ID4ganBlZ19wYXJzZV9hcHAxNF9kYXRh
KCZzdHJlYW0pOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAg
ICAgICAgIGNhc2UgU09TOg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBqcGVnX3Jl
ZmVyZW5jZV9zZWdtZW50KCZzdHJlYW0sICZvdXQtDQo+ID4gPnNvcyk7DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQgPCAwKQ0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL21lZGlh
L3Y0bDItanBlZy5oIGIvaW5jbHVkZS9tZWRpYS92NGwyLWpwZWcuaA0KPiA+IGluZGV4IGRkYmEy
YTU2YzMyMS4uMDA4ZTA0NzZkOTI4IDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbWVkaWEvdjRs
Mi1qcGVnLmgNCj4gPiArKysgYi9pbmNsdWRlL21lZGlhL3Y0bDItanBlZy5oDQo+ID4gQEAgLTEw
MCwxMCArMTAwLDExIEBAIHN0cnVjdCB2NGwyX2pwZWdfc2Nhbl9oZWFkZXIgew0KPiA+ICAgKiAg
ICAgICAgICAgICAgICAgIG9yZGVyLCBvcHRpb25hbA0KPiA+ICAgKiBAcmVzdGFydF9pbnRlcnZh
bDogbnVtYmVyIG9mIE1DVSBwZXIgcmVzdGFydCBpbnRlcnZhbCwgUmkNCj4gPiAgICogQGVjc19v
ZmZzZXQ6IGJ1ZmZlciBvZmZzZXQgaW4gYnl0ZXMgdG8gdGhlIGVudHJvcHkgY29kZWQNCj4gPiBz
ZWdtZW50DQo+ID4gKyAqIEBhcHAxNF90ZjogdHJhbnNmb3JtIGZsYWcgZnJvbSBhcHAxNCBkYXRh
DQo+ID4gICAqDQo+ID4gICAqIFdoZW4gdGhpcyBzdHJ1Y3R1cmUgaXMgcGFzc2VkIHRvIHY0bDJf
anBlZ19wYXJzZV9oZWFkZXIsIHRoZQ0KPiA+IG9wdGlvbmFsIHNjYW4sDQo+ID4gLSAqIHF1YW50
aXphdGlvbl90YWJsZXMsIGFuZCBodWZmbWFuX3RhYmxlcyBwb2ludGVycyBtdXN0IGJlDQo+ID4g
aW5pdGlhbGl6ZWQgdG8gTlVMTA0KPiA+IC0gKiBvciBwb2ludCBhdCB2YWxpZCBtZW1vcnkuDQo+
ID4gKyAqIHF1YW50aXphdGlvbl90YWJsZXMgYW5kIGh1ZmZtYW5fdGFibGVzIHBvaW50ZXJzIG11
c3QgYmUNCj4gPiBpbml0aWFsaXplZA0KPiA+ICsgKiB0byBOVUxMIG9yIHBvaW50IGF0IHZhbGlk
IG1lbW9yeS4NCj4gDQo+IFVubmVjZXNzYXJ5LCB1bnJlbGF0ZWQgY2hhbmdlPyBJJ2QgZHJvcCB0
aGlzLg0KPiANCj4gPiAgICovDQo+ID4gIHN0cnVjdCB2NGwyX2pwZWdfaGVhZGVyIHsNCj4gPiAg
ICAgICBzdHJ1Y3QgdjRsMl9qcGVnX3JlZmVyZW5jZSBzb2Y7DQo+ID4gQEAgLTExOSw2ICsxMjAs
NyBAQCBzdHJ1Y3QgdjRsMl9qcGVnX2hlYWRlciB7DQo+ID4gICAgICAgc3RydWN0IHY0bDJfanBl
Z19yZWZlcmVuY2UgKmh1ZmZtYW5fdGFibGVzOw0KPiA+ICAgICAgIHUxNiByZXN0YXJ0X2ludGVy
dmFsOw0KPiA+ICAgICAgIHNpemVfdCBlY3Nfb2Zmc2V0Ow0KPiA+ICsgICAgIGludCBhcHAxNF90
ZjsNCj4gPiAgfTsNCj4gPiANCj4gPiAgaW50IHY0bDJfanBlZ19wYXJzZV9oZWFkZXIodm9pZCAq
YnVmLCBzaXplX3QgbGVuLCBzdHJ1Y3QNCj4gPiB2NGwyX2pwZWdfaGVhZGVyICpvdXQpOw0KPiAN
Cj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo=
