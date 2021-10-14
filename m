Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A37342D010
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 03:50:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhJNBv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 21:51:57 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:12679
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229930AbhJNBv4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 21:51:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGYfgSJ5LuLmA1InMKymsFnyjeDY86MejBWzAdjZMksJ0WRuaF+l9ohrik54rYYFsOR0uAuNuvd2tlLhpxfGflBPCGocg21a6hK3U628jRU9jv33IBsnEg73ORkZhkSF7qLMaMBszT3DuMkGFl6OyVTv+/yHZiYY3T8hX3NthzBD3l7Abfax66+bCqG40qbGExDpKUsEbTDx31E2obBieWpAlbRkPjJoN5oiaBVVAZ5FARVMNERqlPF8WKoMMYk2NoNzq2rjQ1znuICZt6LfirBAt4Gv86JprsJrR05VNkmrnFECCUeMEjmkTVkopibhkTf6s+Mc1/3jdCKfuRQbiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM7uV141XBfU82z3CJ1pJ7ku43hbnQa2Qju4alFoLBY=;
 b=CCyzfcGfDjo/Y/ilDJcNqcfwP8vNIl6A854/g+hYEacPHPoUWY3jY4mWqOPlMdcW1BUMjmj2zn7VULHU19EHdXXNpvn6Sc46DVY1t9SjjrZdnv/4v375Es9uLRnelcjlfk+SBIwbGWh0FaC8Ouo2DnPr1ghaPx/9Vgvuwv9/3L/88JoNaAOiyVBzbfwfEIibGpnLSWMh2EKsjcFpkFjb+XN53HlbaA0mDC4q5ldbu/0+FrBrlpKW5TSN/XWhbwx1IE8mqikEkwjtPleQVAEFN9aJucH1RQlnG5yxb17ZRTkb6KAdRHul2bgmmyYWquJHHtOe1RnIMpb8LnTbqhafYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM7uV141XBfU82z3CJ1pJ7ku43hbnQa2Qju4alFoLBY=;
 b=kO6HBDL2WIeetClPH9ZOEoT98nTXPtwTueZPc12RQ/v75USfPaCEfMoEzX97/zhBLP4FP6ZnmuYe75dKEwracKYH+KfHGRd6vds88Fbbt43rKIAvO6cnIqm+Fm7R9c3+CSZQ0QvX4F0dIO4agUQqhrT9uiOBEEejRQGi8sw/ubc=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4021.eurprd04.prod.outlook.com (2603:10a6:209:3f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 01:49:49 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 01:49:49 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v10 03/13] media: amphion: add amphion vpu
 device driver
Thread-Topic: [EXT] Re: [PATCH v10 03/13] media: amphion: add amphion vpu
 device driver
Thread-Index: AQHXv/9iMWizhmuKXESNdb1YjXwXu6vRf/wAgAA7SRA=
Date:   Thu, 14 Oct 2021 01:49:49 +0000
Message-ID: <AM6PR04MB63414D1465CDABB6E5550529E7B89@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
 <2a70d55e012874b9a3381e0aca23010edf65b2f4.1634095309.git.ming.qian@nxp.com>
 <591813d6-2633-bc64-110e-8f62ca07044e@infradead.org>
In-Reply-To: <591813d6-2633-bc64-110e-8f62ca07044e@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 587d6140-ef4a-4aeb-b6f8-08d98eb4e8a4
x-ms-traffictypediagnostic: AM6PR04MB4021:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB402135447A4FEAD18E4D55E1E7B89@AM6PR04MB4021.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K5loU/dIFjhtIGsxXBdqKIM+TWmHxoTaCstvo6aYC9iuWYTBW9sZ+fwyWfmYrYETsXMIBlZNc8VyHyDeXqEdVElghakUaztGbIbiTqv57keVl0uSUVqyjBuIdQUX3zhRuvWdTyqcC095cQeOtZqydkEqdVf4hvaIyDPQVrZ3x4QMRb6J4XyOhp2QfbmblaUlWRTDzcantAkiC4fOViNdBEp4iSPkqMe0YzK+bmLCnnM+qVoxUZppcGcAQ3nP+TaQ1lN3I6foA+FOYRFCepD5Z9YJfVpY+zsqNFr9A+1OKG8m6blekQJeMouV8FBUURSalukU/lsXoz3yWpbjF2ftEJyUrvg9aDeD0KFoLLyiB3kpFmeUykZaJyDQvTJNLKjhe7ggEx9Wc7b6uQyYamiezA8c1uign6SaB4cyxyGsgf4D9RDNMTGcHFHTfQIdRWxjbi5EfmXVgqZMTBRMOlyjMKJDY4qRqkYYcqc6uNXWaB1TVR4pQ4xj4k8NkUOvm+PmpVSHLx8Ct90k15u9oIn39HYAkfRCpWvtgUlqCjEWZf6+tHGDSzYYmzbAuEwJrzq9XrRlSf6cPO6qJW+OxVV8XUqNucTWS+NUbyQ/rNZSkNJ0jFw3+GV525I4GFy7mJSc4vPbrYsxTc5qOxwwEluWubxK9m208f7/ATBYqwZElhCtYKAmTXuavnE6wBw52yhX8dOr+eYJtylJb/d4oDNgYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(53546011)(186003)(6506007)(508600001)(76116006)(8936002)(26005)(110136005)(9686003)(54906003)(316002)(71200400001)(7696005)(44832011)(2906002)(66446008)(66946007)(55016002)(33656002)(66556008)(5660300002)(66476007)(64756008)(122000001)(38070700005)(38100700002)(83380400001)(86362001)(52536014)(8676002)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MSttZ3M4Z2pJTW5leUdYUjFuNVZEeWJseThkUFdRaTJGMDQvMXFvK3FyOUNU?=
 =?utf-8?B?bXFldjI1aGdad1VLTUVCNUEzaFZnZmUzQkVjSW02UWFURnVJSGIrRFRtcTYx?=
 =?utf-8?B?QmQ2LzhJQWJzMHlyUTFxZ1ZicUozWEZNcC9jMUdnVkIrQmVueE9Vb2RDbFBP?=
 =?utf-8?B?eFN3MVdYanBJWEk3QXlFakRzTjRWTzdBQmJtRksvaGp0cU1neGJScVJhWjdO?=
 =?utf-8?B?a1g2dGZLZHE0Vzk4U2dZVlFDcVV1WEVCcTg1R0s3bFFRb3VBQ3FQUTlrcEVL?=
 =?utf-8?B?UFBMaTZHeDhwVWpLc3VrL2hQelc5SVR3TGNvT0JreDc4dTV0M2hqcW9VbDR6?=
 =?utf-8?B?eTZwU04wZ3hQMEF6K0VPRjh3Z0ZGYmpoTDBVMGRHSUpSQjBxN09aZERQclNz?=
 =?utf-8?B?TDdDMUFWd052VHRQZ1N1UlJsczdJdFVXcjJDZDlrdGxoR3l2aWR5cGxpRllF?=
 =?utf-8?B?QzVjckRhaCs4UXdleUtyZWNieUVaQ0VvK29kS1AzNldUTmlpZ08zUVlsS25m?=
 =?utf-8?B?NUhQMjZvYXY1elJtVGlpQkFncDhYMFBPNHZSUVZoaGY0YlBGZWlCdy9COFpq?=
 =?utf-8?B?WWVJbUlMU3IyWExtWC9RNW1HQXpNODI2KytwZXBRRW85N25SS1hqTVViNUUw?=
 =?utf-8?B?ODZDRTNJSmNMYlNNcjllOFB3MmhhTHA4Uk83dTdQOS9pcjdvR05QeS91MjZF?=
 =?utf-8?B?Z1BMRTdrYlBlZWlNYy95RVBHM0p4WFFUNittOVU3Um9sWngyRFFqRkRmbVNX?=
 =?utf-8?B?RjFuNHZ6cTF4UXFZRElCd2YrUEZUMkZ6V2Nja3U0SVdwRGZFM3hzdFRQY1dE?=
 =?utf-8?B?VHYyOEI2bUhuaHdwWENmQnJGLzdWUTJyeUhBd3JPZXE1UXg5d2dwYzRPMnNt?=
 =?utf-8?B?TCtxUTZZS2dFdXhrUlNSUUxOVUJORE1jUmx2WjZPamZzaS9CYXduVlJOaHpo?=
 =?utf-8?B?MWZOcmd1RTBkdGE1aXhzZHF2ek5aYStSVk5keTVnRWpyVVBPZVo2UnZkNXl1?=
 =?utf-8?B?YmNQQjVVQ1oxQ0IvdFl1bmNSaG1XRW9sSDNPN3lnL1BteHQ1b2I4Qnp2M1Np?=
 =?utf-8?B?SGx5MUdBb1FOS1JhcVp0N1I0ZG5jNllLTG4xNXdRUURsengvSnhGVXltWGkx?=
 =?utf-8?B?ZmNhTWZ2akNtVWhnY0hKaFZwejlueUo4RnZlMFVBdlhKYW4rUGdsZDdSK2dQ?=
 =?utf-8?B?UEFXSFQzWGxvSmFMaXJrWHZnNDNvSis3RVJ1SUhhT1RwQVc5d2R1eXBqajlJ?=
 =?utf-8?B?Y3VOTjJYME92WFNBK25IWitoeXJvKzViMDI2Y2JEangxMmV6cDN3V0hVYXE0?=
 =?utf-8?B?ZGlDOU1QWGN4SUx6UWMreUd5VENzU0ZYVmxJNmRXTnJUYnNNaGpVSXpGcXVs?=
 =?utf-8?B?dXZaSllSK2Rud2tJT3NCVlRJMjJyWkxtTEpvSU9wTkU1RnFQblJ2WFRCR0RU?=
 =?utf-8?B?dTFlR2dQRXJ1ZW5EdTd4SG9XUVBUb3pzTHE5bDBJUnhrdUl1c3NrQmpHK0tW?=
 =?utf-8?B?ak9VYTcwVmFGa282RWdmdFlMKzFSUWNmem5oZzJUaXJhZjVza0NxS05JMkVv?=
 =?utf-8?B?dFdrMUhPVUFMTVA1Wmk3QVVIWEFqRmpIVkRxN0ZUTTVuODQzaVJFUG5WYndZ?=
 =?utf-8?B?ZWdreGF6UHJmTC8xMWFvb1NPa2xQK0c4NDUvenpoV3ozaWdnUDBCVmhBb09h?=
 =?utf-8?B?VkF2Q29qUDNCSWhTZDdjNWJCWW14c0RYUkQxT3RPRVhTTGlIVFRIMmowS2xw?=
 =?utf-8?Q?M80TjD0ttM9H/HoR9o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587d6140-ef4a-4aeb-b6f8-08d98eb4e8a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 01:49:49.6782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /H1Uv2E93BSPLqP9/aqraxTDSJ52ESY1KfQNjOnvFxqvcN5eiQtQY+K6r0LKuI/JmDUvUH+T98ww6W3WFkmXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4021
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSYW5keSBEdW5sYXAgW21haWx0
bzpyZHVubGFwQGluZnJhZGVhZC5vcmddDQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE0LCAy
MDIxIDY6MTcgQU0NCj4gVG86IE1pbmcgUWlhbiA8bWluZy5xaWFuQG54cC5jb20+OyBtY2hlaGFi
QGtlcm5lbC5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHJvYmgrZHRAa2VybmVsLm9yZzsg
cy5oYXVlckBwZW5ndXRyb25peC5kZQ0KPiBDYzogaHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sOyBr
ZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gZGwtbGludXgtaW14
IDxsaW51eC1pbXhAbnhwLmNvbT47IEFpc2hlbmcgRG9uZyA8YWlzaGVuZy5kb25nQG54cC5jb20+
Ow0KPiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MTAgMDMvMTNd
IG1lZGlhOiBhbXBoaW9uOiBhZGQgYW1waGlvbiB2cHUNCj4gZGV2aWNlIGRyaXZlcg0KPiANCj4g
Q2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBPbiAxMC8xMy8yMSAxOjI3IEFNLCBNaW5nIFFpYW4g
d3JvdGU6DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vS2NvbmZpZw0K
PiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnIGluZGV4IGQ5ZjkwMDg0YzJmNi4u
MjQ2NWE1ZjdhMDczDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnDQo+ID4g
QEAgLTIwMCw2ICsyMDAsMjUgQEAgY29uZmlnIFZJREVPX1RJX0NBTF9NQw0KPiA+DQo+ID4gICBl
bmRpZiAjIFZJREVPX1RJX0NBTA0KPiA+DQo+ID4gK2NvbmZpZyBWSURFT19BTVBISU9OX1ZQVQ0K
PiA+ICsgICAgIHRyaXN0YXRlICJBbXBoaW9uIFZQVShWaWRlbyBQcm9jZXNzaW5nIFVuaXQpIENv
ZGVjIElQIg0KPiA+ICsgICAgIGRlcGVuZHMgb24gQVJDSF9NWEMNCj4gPiArICAgICBkZXBlbmRz
IG9uIE1FRElBX1NVUFBPUlQNCj4gPiArICAgICBkZXBlbmRzIG9uIFZJREVPX0RFVg0KPiA+ICsg
ICAgIGRlcGVuZHMgb24gVklERU9fVjRMMg0KPiA+ICsgICAgIHNlbGVjdCBWNEwyX01FTTJNRU1f
REVWDQo+ID4gKyAgICAgc2VsZWN0IFZJREVPQlVGMl9ETUFfQ09OVElHDQo+ID4gKyAgICAgc2Vs
ZWN0IFZJREVPQlVGMl9WTUFMTE9DDQo+ID4gKyAgICAgZGVmYXVsdCB5DQo+IA0KPiBUaGlzIHNo
b3VsZCBub3QgYmUgImRlZmF1bHQgeSIgdW5sZXNzIGl0IGlzIG5lZWRlZCB0byBib290IHVwIHNv
bWUNCj4gcGxhdGZvcm0vbWFjaGluZS4gQW5kIGV2ZW4gdGhlbiBpdCBzaG91bGQgZGVwZW5kIG9u
IHRoYXQgcGxhdGZvcm0vbWFjaGluZQ0KPiBpZiBwb3NzaWJsZS4NCg0KSSdsbCByZW1vdmUgdGhl
ICIgZGVmYXVsdCB5ICIgYW5kIHN1Ym1pdCBhZ2Fpbg0KDQo+IA0KPiBBbmQgdGhlcmUgYXJlIDIg
b3RoZXIgZHJpdmVycyBpbiB0aGF0IHNhbWUgS2NvbmZpZyBmaWxlIHRoYXQgaGF2ZSB0aGUgc2Ft
ZQ0KPiBwcm9ibGVtLg0KPiANCj4gPiArICAgICBoZWxwDQo+ID4gKyAgICAgICBBbXBoaW9uIFZQ
VSBDb2RlYyBJUCBjb250YWlucyB0d28gcGFydHM6IFdpbmRzb3IgYW5kIE1hbG9uZS4NCj4gPiAr
ICAgICAgIFdpbmRzb3IgaXMgZW5jb2RlciB0aGF0IHN1cHBvcnRzIEguMjY0LCBhbmQgTWFsb25l
IGlzIGRlY29kZXINCj4gPiArICAgICAgIHRoYXQgc3VwcG9ydHMgSC4yNjQsIEhFVkMsIGFuZCBv
dGhlciB2aWRlbyBmb3JtYXRzLg0KPiA+ICsgICAgICAgVGhpcyBpcyBhIFY0TDIgZHJpdmVyIGZv
ciBOWFAgTVhDIDhRIHZpZGVvIGFjY2VsZXJhdG9yIGhhcmR3YXJlLg0KPiA+ICsgICAgICAgSXQg
YWNjZWxlcmF0ZXMgZW5jb2RpbmcgYW5kIGRlY29kaW5nIG9wZXJhdGlvbnMgb24NCj4gPiArICAg
ICAgIHZhcmlvdXMgTlhQIFNvQ3MuDQo+ID4gKyAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlIGNob29zZSBtIGhlcmUuDQo+IA0KPiANCj4gLS0NCj4gflJhbmR5DQo=
