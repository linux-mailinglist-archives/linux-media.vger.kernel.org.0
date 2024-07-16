Return-Path: <linux-media+bounces-15053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C49932691
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 14:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761A3284555
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2024 12:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559FA19AA42;
	Tue, 16 Jul 2024 12:31:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2135.outbound.protection.partner.outlook.cn [139.219.17.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FBE4C7B;
	Tue, 16 Jul 2024 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133106; cv=fail; b=eWLdKqvrbJN5ZY0R5cl0Xws6/+4kc2x+58lk2x0AEhw2oD+TKKF//IWCN/DDuwLVQ8hiitmGvdMPTRPa2YNYRdIHOm1s9m9j8AWO018/nchENWxy24CV1rIMqdwtyzqDbX1Z0MwJTnHLtaznIzvl1SUqLBH9JqMWJkwZzQU7Vl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133106; c=relaxed/simple;
	bh=F+r0SDFQKZgt7cROsyiFMJShwXGwB8sj/tKX9WMI+o0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h43l1TrUiOQaHmwPswuj0tMLHwawmTbtBv1FCDodDPXSbozLq+P6O5lMtxrO1vBiiiQ05Lmb0+CR1UxeAZ+cz8mqZ/UaavngdFwAEOq+xNmcQKCFizF+uqbVmcI6o2hyqaz9Mhy2EzeG61psVX5VG6i3GDZc72tr87g+rX251S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFWhVauSr1WJzcx8pVIPJqgDaaXlsLs5ja+WNdWKXXKhsHeus3p98YYYMSAIpwuhpNEdm3d2cUnI3/RDZ4r6W5TsayIyWZ4BijZ3nCqZfT9Wd7bEb5sKy254HD9a5yR7TPJ2uFhKjdadvqapRmAZsxJ6nYkNI0omOUl0X+f28uxka/S4/O/Yf07tsH3Rx1eEL3JyNOqDq6gErJJr5Lp2zerJE8YCSwsvSd5UtcJxiGu4s+Q5Ui+8ou9GtHDzV604JLQiowjT3TkyUzkx0qbHztAHf6Q37uZdEVKeUXCNj+dKFg8fUP+sapaP1Gjomugk4nonsG0ensZHU13h5ESrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+r0SDFQKZgt7cROsyiFMJShwXGwB8sj/tKX9WMI+o0=;
 b=QfLwEUZTKu4lzxEofOiEh/l63/Pu6gyZCNPlL0Lz4JzwwKJQcroN4j9wTQU8+m0x1XWzRQtbpPUJTlu+NLrxJZcbfv/O9dvNSHLzlB/vdy0aL1MzplJMJExP3NqztP2un9keLlL6+y+iTCLNfAgRIa5m+Fcl8NmWcq9vom17X+ALmFKW5/PdlXBjtG1xi/gfphuTOenwmH+NFNwGCoWPOzfk4rVm47oYaUuVfb4j94sDVk3YkPJq9d8MOWpQ0OhgsU+ZFAu/KaagdFryD5X3YQxbOLUYul+t0BVweAzq80TiW1d86iSCvwhE2QGyFDwTMnd6jEjZZJsjTS9jDHs8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.38; Tue, 16 Jul
 2024 12:31:31 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.044; Tue, 16 Jul 2024 12:31:31 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Jean-Michel Hautbois
	<jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Jack Zhu <jack.zhu@starfivetech.com>, Keith
 Zhao <keith.zhao@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMDIvMTRdIG1lZGlhOiBEb2N1bWVudGF0aW9u?=
 =?utf-8?B?OiBBZGQgZGVzY3JpcHRpb24gZm9yIFN0YXJGaXZlIElTUCBtZXRhZGF0YSBm?=
 =?utf-8?Q?ormats?=
Thread-Topic: [PATCH v5 02/14] media: Documentation: Add description for
 StarFive ISP metadata formats
Thread-Index: AQHa0dtiZdTUFHeD4EuX51mLkQMsHbHvsZYAgAmiVeA=
Date: Tue, 16 Jul 2024 12:31:31 +0000
Message-ID:
 <ZQ0PR01MB1302CB1DB67D3A36022B94B5F2A22@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-3-changhuang.liang@starfivetech.com>
 <dncfjg7e7a2i6xin7kuwnxifcjpdjxcwkfcudxnqczi4lhwac7@u7jjunr7zqc6>
In-Reply-To: <dncfjg7e7a2i6xin7kuwnxifcjpdjxcwkfcudxnqczi4lhwac7@u7jjunr7zqc6>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1047:EE_
x-ms-office365-filtering-correlation-id: 42ffa2aa-855a-4eb5-e55c-08dca59338e6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 oys7hzZZNtJtyfLhBI1U7NWHVLwHf1D9Pe53m07lbiOStX3t+Zf851sI+Vkh3kiI+P49cDwp/tni9/AVhicH5DemOxIYi8gANoxSiNLIsCKraz/gNvRGzyF9pI9brscdRis8Tp1XcXu0MGWNi5Lv6wY+eB59GKvkV9J7jI9BSk/8Rw9XYX2EOsFwhh1L8MyX/o8ZjZUXcjLilSYxVSpzkLu3MQ1+9hbSQhXVfBhs/w19VxZUNc0cVpBA5xoYMwblPTaoI5aM77m98vQw+5zk8t7FUv8NA2rPwV7O1zNc99R2JgHBXS9HhisAlIgEgzpK/99Hf9Nh20yOVL2mn252g6WZ8tNqY3lvzB+j5LYJX6/kgSPNlbkO7uBfXJkc4zoT+aUM4x2uDJIAH6aMQwl82C5oqhF8Im53JPkcp6xqiTzHX/W/cGKQmqlmjipHGMkhlpXqSWO765jgXwiQWK92A1r7Rk4l8yQz+bLvqe0/jqMQzg9eG1zfmLVfI++tZ0y7RvBmLJ2OdODYUngYVn1OVuIUBQmMn3Vo0bD7dL9TdWlGtgthGutFcxZq+jAWYtwu+DKczuaX1XiZjO6v9Agn3VAOMGfdpfUQRX8cUkiNajn6wtkW0eP6i50Pj2wNOSKV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K2g0OGV3NVpQaGxqNWd1cFdpNTliT1pXY0lwOXlrcGt6ejNWNXdEWVY2MWFl?=
 =?utf-8?B?TjUrVzJKZXRpYzVhUkFFZmordElCeTl1QVBFVytnWVpiQytCZGJHVHpjK3F2?=
 =?utf-8?B?bHVsYUx2ajFnZk5veC9ZbDIxQWNYckZIeHFJM1V4Y1pheERnZmFGVElMeE94?=
 =?utf-8?B?UjBHbXZ1TWhzb1ZuOEYrVU44d21WU2s5c1cxM3JTUnM2UElUYUxTYVdldkYz?=
 =?utf-8?B?T0t1bUlzSzN3VVBkYnRzUWhwOFRIRnZLNU9jRXlYU0RUbHpZK1lodkVqVyt1?=
 =?utf-8?B?WDd5RlI5dFBTa3BjdlBMUHM2U1c5aHllVXlwL2wwOXlmSjFBdXk5cllCYUd2?=
 =?utf-8?B?VEo0bFZPT1JaNG5ESndXSlJnd0RaMVloenhmODVEeXpueTVyRHBWcm9lM3hG?=
 =?utf-8?B?NXYxRFpnek9USnFaV2FrS2dlbGZNWCszRng3ekZaYzNNUURRdzhXekZwZDdD?=
 =?utf-8?B?VG5WZUlPYktRRkRBZmt3VUF6U2J6MWYvMkdDNzYvTWdjdkplZ1IzWmlHTWI0?=
 =?utf-8?B?SzVQTFhkOUxSY21kdU9Nb1R4UENGQ2l4aEpHWXRTNllSN09zYVZSU0FPanEr?=
 =?utf-8?B?Y1R2YXNpMHNhcU12UEd3WnZxdjlJcXVJSGcyU25ZUHRRUXZkM3hxdC9jWjJl?=
 =?utf-8?B?bm5vT3NjaVNEanZLNG5xS2Zud3NVTkJDNTEzeHFtT1BISW9iOENIamphRFlX?=
 =?utf-8?B?TEZ1Qm1pM2ZLWVFZdzAyMlFIQkVrMURuNkVHMVZpVm9ydEJ1aUQvdzVzL2k2?=
 =?utf-8?B?TTVWQUxXV014NDF3cElkU3JScExnd09MdVRpSGxrclFTVk5TeHUxMkdzL0kz?=
 =?utf-8?B?VDNXbEVTWmxCZHBOMGZvdVZPWHh1YXQvczRtUkRibFRxRFNBOHhKVmdDcnlp?=
 =?utf-8?B?V2R4RzF4dk5PM2pLR1E4ZlNrelAwQUJoV1NkY0ZZUFNZeTBoSHJHelJxSExZ?=
 =?utf-8?B?bTdFNmdSd281cjF4UUdrbVB0WWV4V1F3Sm9oeUFhOEFkaVNxL1hhaVFaQVE1?=
 =?utf-8?B?R0lxV2s0Zjc3M285TTVYbDR1VmdLdXdvUmt4T2VkQUFadHRIczhpancyTzhw?=
 =?utf-8?B?U2Q2ckhWS3kraVJPR3hFMDFOdFRqS28wejZ6TXI4WW1la3k4eTFQMVhrTTNO?=
 =?utf-8?B?d01LYm05R1c1Mno3TjR0a3JRZmRkZm9tVjRCbUFyZG1PNVRLYjZpamwxSGxn?=
 =?utf-8?B?T3VVMzYyVFRuV3RIYWw4SHJIMjNuZ3ZZSGdDN1hyc0dEdVpNWnVVWXBvclBv?=
 =?utf-8?B?cEc3NnVId0lBeWZzd1B6RklCMFBqSjlYZlVyc21EalgxVWNpQll3K3BSVnZq?=
 =?utf-8?B?MVpXcEhlS1NvTHJrSnltV2VRK0UxVnZHNU9FdFgyOHliNGd6SlpYNWVPS0ZN?=
 =?utf-8?B?cmFZUnZzbllvcW0zbVMyN0UvTG5lNW5Xd0NZaURNdytnRndnNjNJNjU5MnN2?=
 =?utf-8?B?UEhzUnVUUk0zMDcrdUM3WkNxMG5kNDBPR0k4cXh0a3RTTVNTR0N0alFkcEdv?=
 =?utf-8?B?ZWhnOXQ4VGxBYUtBRXBQNkU0M1BFVkFaMXc2Qng2RXlVOEFJVWlXNHk4b2Jk?=
 =?utf-8?B?NFNDcndMMHRTQlhxcWpab2lGRzR4SnBWNnhTQlU5citySFRjTGVQK2tUTkVZ?=
 =?utf-8?B?SW9sN0FRS0I4NXB5cm5NdzZaeHZVeHZOVFRxRlJRRmt1TGNpL05waHZ3cm9W?=
 =?utf-8?B?SElDeHg1REovK0ZERmZNZ2xLb25iYndqQXozdHk3UGZpZmVBaW1scGJnQXdC?=
 =?utf-8?B?YXNTZG5Cbnd3N2VrNU9VM2paZGRuQWIyOHU3K1I1YXFVc2lzNlZJT01RS0Zt?=
 =?utf-8?B?MmdEdk02UGJJcHJneWF6UFd5SjNUVVhyd09KTjVTWWttUyttMDEvMmhiUloy?=
 =?utf-8?B?U1NZSTEwTkFxbERaeDNkSDBuWnF4aTQzaFZ1MmxuNExkbnJWZ0pXbVNNYkVx?=
 =?utf-8?B?NGxqb2dock9KZVJLN3ZPNUhJME9UYzBvVEh5L25salR5SHpxU2NUZVBtRWl6?=
 =?utf-8?B?VHUyV1ZUbTZiUHhSWlc1ZmZ6N2lUc051M0cvT1F2T3NvRnhzMDVoM0grTTVE?=
 =?utf-8?B?ek9teFdrNFFPajZqVjNZelQ0NkZ5MVNEWUh0TnIvL2NkZXlUMVRZdzhLbUUr?=
 =?utf-8?B?ZkkxcFZnakt3Z25XZDNkMG9aM2wrNERRemh0d0ZMcU5RT1RwblNOQVcveHhB?=
 =?utf-8?B?Vmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ffa2aa-855a-4eb5-e55c-08dca59338e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 12:31:31.2805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLtqAC+MxRt0Dn3qy1hjrHPyeJUzlSeeWhhM+3WS6MJ/aDt60AeFzVaGboW0OFsX3g4QZ9wNS8TLFHnDE5VSce+Ysg+xci6a8PkSgonjWG8+LCWRsPeYaW8e7Vswu12h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1047

SGksIEphY29wbw0KDQo+IA0KPiBIaSBDaGFuZ2h1YW5nDQo+IA0KPiBPbiBUdWUsIEp1bCAwOSwg
MjAyNCBhdCAwMTozODoxMkFNIEdNVCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBBZGQg
ZGVzY3JpcHRpb24gZm9yIFY0TDJfTUVUQV9GTVRfU1RGX0lTUF9QQVJBTVMgYW5kDQo+ID4gVjRM
Ml9NRVRBX0ZNVF9TVEZfSVNQX1NUQVRfM0EgbWV0YSBkYXRhIGZvcm1hdHMuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+DQo+IA0KPiBJIGdldCB0aGlzIHdhcm5pbmdzIHdoZW4gY29tcGlsaW5nIGRvY3Vt
ZW50YXRpb24NCj4gDQoNCkNhbiB5b3Ugc2hhcmUgdGhlIHN0ZXBzIGFib3V0IGNvbXBpbGluZyBk
b2N1bWVudGF0aW9uPw0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

