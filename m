Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AED434B7BA
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 15:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhC0Oga (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 10:36:30 -0400
Received: from mail-eopbgr00048.outbound.protection.outlook.com ([40.107.0.48]:55886
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230176AbhC0OgT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 10:36:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7TJWqP/AII1c3SuZ/d/NJ7XwANm0RocNA4M7XOHYRKn3XotW4VNLOisECrEqkzJdSJFyQv0pOUGSOMJGdwKjmYzlFtYzxG1lOZVldNfLpznsEDKRdSZQtmdd6IQ7FCMDd6mx3sCOI8fY5xUDzS7i3+2yds9EvSNDhHZEjD28TPX1/28R+NWogIB62+IQVoitbCnxzbx15tvChjjSemQ46tKfz6KKsfTNHOezaSHKNBJOZcPYxI3Iv784pzmt1CtrDyp6xnTsF7oXBPzLIJMsqe67uIcJ7nRQP/mVJwLs8qjENB/aBdVUIAXVnXi+BJA+SW2OIJreP8wf5r4+FaG+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMR+h61HKeklqtxdI+PY3iNspjVtq3ouS/3O3OmoCus=;
 b=PS4bh51+khWT0unyh5/sjyXC74dmYntTAtPIu2e+PknBUA1NBJnm8qTMGi/7MRUcpa7T9E+TRu7wa+qQ913hq40ME0pirZwG8EI8L4BZwsMeKwHprZRpiwDLbX/q8KUXzSj9CMcmvVdEQvvyXgc+VXjIUBMq1UUhg+xpU8QTrQ8+2mfcdFFnmmBFjlOhdXobQNKrH+/RErZqOxlVgu6XR4DacbBLGCtYmAyMSLn/3iIF9tosQeOP0H1qRUJtGUIqNcN3LhascPlGjYlYQXmmxa7yaXGKeNpXA8SR0alEHY7c3SuvPahomo8YLr9uslREG/tJvpBqN3l6t6Q5YeVHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMR+h61HKeklqtxdI+PY3iNspjVtq3ouS/3O3OmoCus=;
 b=AsyRZ35oVQP1ZDPw28/EN0cdS4PvDxtAS2kzt8f5f/khc1GW6/zuwoXNDXdeRXoyIAmTfsk4JcKucB1f8UDFW/a7OHAnl14ilEEXvp3kwyKQSw9B/YxNsPnNdOJpnNGbaS6DQbG8HsepGybip/K3f0DJlMtPlylh9rbnCQbSXkk=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB6038.eurprd04.prod.outlook.com (2603:10a6:20b:b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Sat, 27 Mar
 2021 14:36:17 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.027; Sat, 27 Mar 2021
 14:36:17 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hulkci@huawei.com" <hulkci@huawei.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] media: imx-jpeg: Fix error return code in
 mxc_jpeg_probe()
Thread-Topic: [PATCH -next] media: imx-jpeg: Fix error return code in
 mxc_jpeg_probe()
Thread-Index: AQHXH9Zcjm23Mt+m+UWjJU8dQvV8ZKqX7WkA
Date:   Sat, 27 Mar 2021 14:36:17 +0000
Message-ID: <731eb264f49130ebfc9e0408ea80b75e81b26c45.camel@nxp.com>
References: <20210323112855.1016779-1-weiyongjun1@huawei.com>
In-Reply-To: <20210323112855.1016779-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9e0db1f-0aff-4fc9-fd72-08d8f12dae7a
x-ms-traffictypediagnostic: AM6PR04MB6038:
x-microsoft-antispam-prvs: <AM6PR04MB6038D2DB44FBC6CC298EAA3C8F609@AM6PR04MB6038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3JtrdV3cDux/SgWf2s8/lmWFqc2y6cX8CGfinDYYAOJICRMScK2I2QvkXHYncZNLhS48nKunglrmay5q2VorAzn9g8bb/fscG6eZTFNMvt8ksfPyBCmrQyVoeEI7sCccV9S91nHXL8w5pyXv0bAUbbdVWI7r7wvG66Y9pMPjrxtkBudWHSZurN78QKNYxpvy5RwRkThhQANMUD2E4gUnjS/2tg695e3iRPcQk5Zkh7ExWrY+jSJfp1EYS/9i/STmkjhDXQvhSlTZVJFPYx+/x8B4bgbLmpKkcis6bVtSU4zGfBqShW3gZklrrEim3L/HXBZH7xmOOnMzVGFUbFdM7ebeLH9te/tp/7gyhiIwqBJwH16a3bvhRioX6mehfkZYj3xbvV52J3vchLp/aP3ns01UkaqMBNh+vBYVueEUJDDkn/x22DGS2Np9KAPVrmRxS7pJnVWRoduXwm1ceaDSFAAGXuCPQ43SErPMQTOJibnMsXB8XC3FVS0fzo4IQznu9QhOblo8SNRaP3a4z0tvE+CKIx71jLUDK1sFH4cNeINrth26ZRVyTmzAIf1SEouxlUJe7LQQ2mj/808FcEPSRO5JcOhIXCPLnYd3aBPecbshk0/1AEc5sNGt5vXaWkzTvOQ415cYQMkISFMMIEVB1o/sphZTfI7UsxKEokJ7nRKNy2hXds/1rRtbybgr1ng0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(6506007)(8676002)(2616005)(186003)(86362001)(478600001)(44832011)(36756003)(26005)(71200400001)(54906003)(6486002)(66946007)(76116006)(66556008)(91956017)(4326008)(66476007)(316002)(5660300002)(8936002)(64756008)(6512007)(2906002)(38100700001)(110136005)(66446008)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzFqcFJUcDduK21jbUk1TzJBSTJIUklkY0Y3M3BBTmlOMGVzb1RLS09Talpm?=
 =?utf-8?B?L0FrWjBrYmtZc1ZGTUdwOEtnSnFlRlNVV3l1WkRWRW5YMjJhOGlFdGl2QnBX?=
 =?utf-8?B?anRENnY0bDNCS0QvZTg0b1JnWXNQSHl2L1ZSeThXU21IQWRsS2JCOERVbllS?=
 =?utf-8?B?ZWp1enpmTG9mUitMTmE1MEljbXQ3YU1QY040d0thMVdyQWtpVlVUc2JVT3JQ?=
 =?utf-8?B?VzFZY1pmOGlPQ3hBaEl4NWVrNUxkbFZSb3owVlloeDNBcFd5ZHRCbXBLb1VQ?=
 =?utf-8?B?SXB1VnR2S2hSNlpjR0tGU3paWmQxSHQ0VlFqZ1FQd0JVSFJBT0duV3hLUlZ5?=
 =?utf-8?B?SVl0dnhBb01tMXM1SVFLZnRlS2l1d3V3bUxKSU9NeHRma2FUUks4V2FJNmNI?=
 =?utf-8?B?a0RzMmh4ZHlSV3NESklqc1BMMkhLd3pRVzVDV0x3YTZHSXY4YVFZWVJ0Mys2?=
 =?utf-8?B?QTVNakF3NGY4RjhRWXRmVVh1UzVKdTg2SHlwbFUxYVdUWDBrVmpmbFVGeWt1?=
 =?utf-8?B?OFhrOXBHM1M5STNVUGZZMlNJcUxzWFRaVzd3ekdMOXFNNnhobEFVZDR3UVlD?=
 =?utf-8?B?TGpIelJXb29tRDVBWHhUYUZpTlZFN1dnOFVUR2RHczBzTy81VE1LQUZ1ZUNQ?=
 =?utf-8?B?YnFybHcweXdGMC9WZmZzNjhqM1RDMXRUMS9vdk9qNlNtRjlROW80U2QrTitF?=
 =?utf-8?B?K1piS2pZVXpRSFlMWE1hNTEvbDBOazQybFFtUnkzNTFvaHdXWFE0RzNsMHVi?=
 =?utf-8?B?VEpKWCs1aExkb0lMb3RJcS9BMmUxUG9uMXlFbEd1RUhMS3hXMDNYUGdndk4z?=
 =?utf-8?B?QXZleTR2eDdLSnNWampsQWRRenpVTUhzaVNSZEJUYWNHbkJ6ZEtyeDZKbnA2?=
 =?utf-8?B?NnFpL3dEZWRpZWxEcU9VMktoRzR5cmlxME1YdnV6VXRUcW9nUGk2bXI3Sm1p?=
 =?utf-8?B?b3JWdG92OG1LMTRYT1BJMVRzdFdhb0JZeG5qWmYyNFNsRjRwYkdUakxjcFlE?=
 =?utf-8?B?RWdVdHRSSjQ3RXRMclBzbkRLMDVFcHBOZExxT3BEVktrNDJRZWdlNmtVazhv?=
 =?utf-8?B?UzlyeENXOTZTM05oaGZkSHR3Q242aFl4bU9Pc21UM2hHTEREaW1UNFpreDRk?=
 =?utf-8?B?eDMzZHZxc3Rudi9ONkZ3NDcwc0ozRHBxdnE4WmJkWE0xZWVMS1lRTWpLWFZM?=
 =?utf-8?B?N1dUUklHVFlHbXJLN3hKaER6aEtaZHJJYVpvSWpGaWVpRlcraGpWK0FmVVQ4?=
 =?utf-8?B?MlhGN0hkM1BzbDBmcE5QVnJuSkdBNHEyUjNySGdrNXA2VEgzVjlUSXFHWXVO?=
 =?utf-8?B?WDY2OVBWdU1yWkRQeksrbUdMN3B3MFlyMTM3UkZuQnJQNEpYU2JVWHU4d2cy?=
 =?utf-8?B?ZkpTT0VrRTNPTnhMSGsvQ1lRTFQ4eVp1RmdBZndoR2l2M0JyV0FXN1NSZkFa?=
 =?utf-8?B?S2tzMnRrNmlndnlGUHNmajFqWXBBa1NEOHRoMkVucFh4TStRM1dBQUpHNE5K?=
 =?utf-8?B?bnVjMEZ2dXZENWZCcHRPZWRCWnByT2xFUHNXbmYyMC92bUpoT1JQZW9xVE82?=
 =?utf-8?B?Q1p5M2NWd2s1dUt5M201MFlQZXA4eUN3eHUwQU4rREI3dXZJQ0JIZW1rVEhJ?=
 =?utf-8?B?TVpDT2VkcjQ0WFNzT0JLMmN1Qms3NElKS2NoZVVQbUpzSGZzSmtONDluNzZ4?=
 =?utf-8?B?VFlwY1pIczRRYXM2a1d3TmR2RXZoNlJuYzZudDNIbGwzMUhraU1LZFJ1WkNE?=
 =?utf-8?Q?RgsPX2xrlcAoPCZuiiA/YI5ad6SNo+9L4yD8Zzh?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC18427A5A04304D9D4C898EB54D7DF4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e0db1f-0aff-4fc9-fd72-08d8f12dae7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2021 14:36:17.4724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dz+8UqfgLzwQTNv6YFmty1JxE0zPIowRyT9cje3M/9X79ukzvmG7YxwtjImsC1FslAAz7yi/I/A+fbMTa9KQPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6038
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIFR1ZSwgMjAyMS0wMy0yMyBhdCAxMToyOCArMDAwMCwgJ3cwMDM4NTc0MSB3cm90
ZToNCj4gRnJvbTogV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+DQo+IA0KPiBG
aXggdG8gcmV0dXJuIG5lZ2F0aXZlIGVycm9yIGNvZGUgZnJvbSB0aGUgZXJyb3IgaGFuZGxpbmcN
Cj4gY2FzZSBpbnN0ZWFkIG9mIDAsIGFzIGRvbmUgZWxzZXdoZXJlIGluIHRoaXMgZnVuY3Rpb24u
DQo+IA0KPiBGaXhlczogMmRiMTZjNmVkNzJjICgibWVkaWE6IGlteC1qcGVnOiBBZGQgVjRMMiBk
cml2ZXIgZm9yIGkuTVg4IEpQRUcNCj4gRW5jb2Rlci9EZWNvZGVyIikNCj4gUmVwb3J0ZWQtYnk6
IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9u
Z2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMgfCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9p
bXgtanBlZy9teGMtanBlZy5jDQo+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9t
eGMtanBlZy5jDQo+IGluZGV4IDJkMjk1NThmMTg2NC4uNzBiOWI2MWZiZjg4IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2lteC1qcGVnL214Yy1qcGVnLmMNCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9teGMtanBlZy5jDQo+IEBAIC0yMDIyLDEy
ICsyMDIyLDE0IEBAIHN0YXRpYyBpbnQgbXhjX2pwZWdfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gIAlqcGVnLT5tMm1fZGV2ID0gdjRsMl9tMm1faW5pdCgmbXhjX2pw
ZWdfbTJtX29wcyk7DQo+ICAJaWYgKElTX0VSUihqcGVnLT5tMm1fZGV2KSkgew0KPiAgCQlkZXZf
ZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciB2NGwyIGRldmljZVxuIik7DQo+ICsJCXJldCA9
IFBUUl9FUlIoanBlZy0+bTJtX2Rldik7DQo+ICAJCWdvdG8gZXJyX20ybTsNCj4gIAl9DQo+ICAN
Cj4gIAlqcGVnLT5kZWNfdmRldiA9IHZpZGVvX2RldmljZV9hbGxvYygpOw0KPiAgCWlmICghanBl
Zy0+ZGVjX3ZkZXYpIHsNCj4gIAkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgdjRs
MiBkZXZpY2VcbiIpOw0KPiArCQlyZXQgPSAtRU5PTUVNOw0KPiAgCQlnb3RvIGVycl92ZGV2X2Fs
bG9jOw0KPiAgCX0NCj4gIAlpZiAobW9kZSA9PSBNWENfSlBFR19FTkNPREUpDQo+IA0KVGhhbmtz
IGZvciB0aGUgcGF0Y2guDQoNClJldmlld2VkLWJ5OiBNaXJlbGEgUmFidWxlYSA8bWlyZWxhLnJh
YnVsZWFAbnhwLmNvbT4NCg0KUmVnYXJkcywNCk1pcmVsYQ0K
