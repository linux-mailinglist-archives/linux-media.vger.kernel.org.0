Return-Path: <linux-media+bounces-14870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA592D533
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 17:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3F121C21753
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4578A194AE6;
	Wed, 10 Jul 2024 15:42:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4F010A09;
	Wed, 10 Jul 2024 15:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626153; cv=fail; b=LSAbaAsGQowB72HRAlk7xN9UmWqR1VkiTBEX4gotzg0KE3cYy70yljUVjsWeIS3vHadD9US/lY8MxrEWnyV/00+pGBf5kKCbMM5mdepAWeofdWaYA64Bl1fZAuv0Alb7MyTxPhwKX2GPMQxNCcalD2nNSC8Z7ucE/iU6Fb6rMn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626153; c=relaxed/simple;
	bh=fRka0JX7R6zOXqzwC0RXmes0Aul408haiGNF6EkpjuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fvdbV4LS2HLbN6TnxTI2Pda1ZiLw86fmoKJtD5Ps6ogfexfQLltVP0IAMHclgydD8W2AERJaUnDY6LXHtb1ZVgIwYcgV59Wl9+LRYroHJjDymxBZfH0nXNu1DgivzS0kIcaZrK4X+d1cz9lMWsBFkcLy1yY1uadDOFpkFe0YQZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgRdwfcW6oDotlyfqcc1egbUp+45loCCkC+PsLAcAxshHSysvHgWiNBB4h0RO9WkIADisFj2W+Bbtu7YbgJTGRJitOB9q3zHown5hFCv1DC1vtsyMPT45xay+jORf6IfakxIBn/2snpkIuw1LrYhI7ORJ6CjxiEejFNroqkAZJrHOx7Mskp6gDW56/PPtgYHeR/OlTYd009+E3mDiRvwxJ38rjWjZnDkPp0KsY02bT2tjL1tu2GVoQaHK3WdbgFUtylMc/Rn1JIdel/VhBlYe8XlphCo4n73D52YRvvMsYseejKCZ09L63DeJddXj2IVBMsLiPYgWpOuXfc/aYdHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRka0JX7R6zOXqzwC0RXmes0Aul408haiGNF6EkpjuA=;
 b=PDL2lg5CUS452RLR5H1kCjTHobAkDvbyfcD65tCTLlLKAoIDha8LkX2KsL0T/f0dJ+xk3h5ee7A+uOtkVwXLo5QC9AtTkuhiKqjqFFTNreQYxR7m9Kg2eDYFeiyiTKncoCkUIWUXKmWaYI1s2kfSy2g0QFVJR4WkP+yQWkE6v1rWna+iFpEklsF6M3BesjUHfc0Z8+2v2S7AocOtu9sRzKhvJAcYnbP/U6tcbFnyLqFnRfweOOEU5QyzeIdNDmGOnnBiel3m/+AxrozfB8XUXd17mPM+WyH74NnEtkM25Naq9BqvXZ8ScU5R7sT5KI+co8F6Ek2PQD2znV1lX8foQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1093.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 13:10:22 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Wed, 10 Jul 2024 13:10:22 +0000
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
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMTAvMTRdIHN0YWdpbmc6IG1lZGlhOiBzdGFy?=
 =?utf-8?B?Zml2ZTogQWRkIFY0TDJfQ0FQX0lPX01DIGNhcGFiaWxpdHk=?=
Thread-Topic: [PATCH v5 10/14] staging: media: starfive: Add V4L2_CAP_IO_MC
 capability
Thread-Index: AQHa0dtoR3b09GBaykmyrfxGSDgyb7Hv4r+AgAANn5A=
Date: Wed, 10 Jul 2024 13:10:22 +0000
Message-ID:
 <ZQ0PR01MB1302D11ECB6B1477FE8DE859F2A42@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-11-changhuang.liang@starfivetech.com>
 <y4rmftogfbsvs76juvrs6px7qlyqjxesg6wqupnrxiys7droea@rrwnc3nsrohr>
In-Reply-To: <y4rmftogfbsvs76juvrs6px7qlyqjxesg6wqupnrxiys7droea@rrwnc3nsrohr>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1093:EE_
x-ms-office365-filtering-correlation-id: 05fee587-cb0d-47e6-b38f-08dca0e1a7e1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 5PpWV8+Ge3beaNFrC0Msjl9LgVaOeQqh9sMp32dsE/8OLPmmU3B228YlyHLKhHe3Ly8pvH0reTnhhCgt/c5WUc0XgjU1VlAR/c0sA5UP/Xhqu6vTI6TpEUYihhBuC1SSJmXGRQbjVgur7nD7tQO8HqHR3XcTzbL9I6MuXDig9f0Aek5a4E/fcWH8aE5mgIk9itATkThEYUHSLfCJTclmkAD+SvS+Rh5wN7VubOYcgh9oTP8aPpzO35Z7zQAAMMP71QNYVyAEd7Ii7AKA32DFQqndOG3lnvCo36jPKnj/Edfz9FXx9vDevfNtAEY8RNkyVZerR9fKLSRnx3pOTY+twrvio5QSDIe2yh/o81RaJOe6mfHHYo22LNGZArk4YtQkzugB0d6V2AOO1L169aT+0LiM98AYk6A+lQs8M/3y5QwvkLcrO93Nh7Rs0p/J8mYf3bILfHMfxx21FcnR5nhyQKvHQbwxuxsId7FHpA9e35qTCXU1Zis5KhH3OnTxffbL7vHGG3Fv57+6cuHZS8DQxqgZWvA9EPe+IXULwiUFz9u2fnurbPKiXg1NohZm1IuWGXXs7/6grcKca9jUEwenHj36JgNfaxtb/b1jNw4g2zZBw1JVRNDxA9Qs+YJW+tVm
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TEZjdkFhUVQ4Q1l6bWd6UVcvTmwweXJiRzlLeVFkK05iNlFuZFRHWVZsVEpD?=
 =?utf-8?B?aUFveVlnR0JucUxQQWJsSG83MU9GMm1uMWc2Zi9jenY1aEl0ZUpmTzBqRVlh?=
 =?utf-8?B?UTRjNEtiS1kwM2VBMC8vWndFdVl2ZHBIb0grUGJ1V3NoeUpVa2x6TVR2R3h0?=
 =?utf-8?B?dFJDNHFzekxKRTAwd1huZmlRQnkvMkRPR3RLYUx1bitBMDdoWW14am5CZ1Zo?=
 =?utf-8?B?NlFUazZtN0NaY0hpSG9LOXRDOVFWQWtELzNWMGRCWWxpRDFlbW80eGdieEZ1?=
 =?utf-8?B?Zk1IWThDY1NoNnpUUVU1MzN5SlhISXRvTWo0VGJqWXVISE9oS0wwYWM0bzk0?=
 =?utf-8?B?TWlGV1k4UGJUcUJGS1g3UERUNnIrRFhOT0tqSmtvaTNXdlVQenk5eE1IczFD?=
 =?utf-8?B?SVcxWnJ3aWJrU2ZqT29iN242N21IL0NkLzRMQlE1RjdzdmZsQ3BuZFAyMGI3?=
 =?utf-8?B?a3V2VEdZdHo3ajRxb001VkpPY29QU3hCQXJ0Wnk1NThRWlFjNmJsR3ZjNGFa?=
 =?utf-8?B?Q3o4VE4wVXdwM2dlNTNqTnZDRzFDTEtHTXRSU1diS2UxK0lLUm5nZ2I1bVhq?=
 =?utf-8?B?RytxTGpnK24yT2FuZEZEelh4dHozekt4TUxWRXM5LzhkRi9LVUpBZ1hWOFpC?=
 =?utf-8?B?TVRSODZnR1ZvT1FsWVJlY3BHQ2FwOCtGN0xIZGd1MlNjSm1PdVZESkMwTVVO?=
 =?utf-8?B?d0JYWjJIWUdhSFN2T3FmOUV4WjJhVWFXZkJ0OGtyN2VENlZRRjVidDVJZkRy?=
 =?utf-8?B?TEZpUmpvSzRpR1RzaTl5b0RQazhBVmx4cEY3RE01aXd1dllHbE1DTkhZdVdt?=
 =?utf-8?B?YkZkSXJQS3M0Q1ExSVpvUnN6YWI5dUxsYi9HYnR2cDQ2bjkzMWlySUZjdkxv?=
 =?utf-8?B?WkZyOVdVekdzQTlDYU5qejFweXh0aTdaQWRycDh5dGovQWJoeHd3Vmd6RFlZ?=
 =?utf-8?B?aGgyTG1kalRZcDJZY2Z0TUlBQVMvNjdzcVYzY2ZMOWFHRmM4Qk9Od0hRc0Uw?=
 =?utf-8?B?MUhxL0I2eXhQVW9Jb2N1eDJONWdoYjUxWERmWGtBZURuajMyc2JJRW50SElH?=
 =?utf-8?B?TnJDS0VKZjZldlYwRlZLNmNhSWs3Nldlc0YxMTZkbE1mVXBUaERtRGN1dFM1?=
 =?utf-8?B?OWxvWitKbVZoMDNPbkROMEFYektTL3lNRElCaEFUa2U0RytHT3kzN2VLMXkz?=
 =?utf-8?B?Y1FTKzhrQjZaa0l0NFE3RkkxaUVpMENlS2tHTFMrODN4R1dCcGxWVlB3bHNq?=
 =?utf-8?B?Q05aUEhwT3VKWEdndC9tNWVLdGFDRGthZVIyaER2WjV6amFrWnRLdTFRdHN0?=
 =?utf-8?B?VnFUWFdjcTF2TE9qQXYwSGpwbVpJejI2OWNWbENaRlFyUmRiUEV4SllWL0dV?=
 =?utf-8?B?S3Jjd3pGelpXQWp6YmVFVW5Zei9XcUtINmdzazdkUmgzVHEwRFZzaHFpL3No?=
 =?utf-8?B?NFB1ZE5mVi9PZVN6T0NNQVFSU21WeFg5aXFZM0FCOXlEbFNubzlUTXpmS0Jw?=
 =?utf-8?B?aGxlVDFzbWhyRTRXYVBzVnBjUmZLN2Z6VjhBTmxNRzVMeGdQc2JDOE9qYjNH?=
 =?utf-8?B?ZDlkbHlxaXVzZjVSNGFnNnRSOVpzVlo4RVUrSWgrVUdUdkxPSjFPZ0ZKVFl2?=
 =?utf-8?B?Z3NFczU1Y0ZNUHpUbldLTmF3OFZFOGVVTFJzdW05STFVTHJtV2kwMWMxdmVs?=
 =?utf-8?B?SDl4KzkvVVVONyt3TDJiQ0pJWFNBQUpXc0lOMHBXRCtVNENPK0dTNk15N3h6?=
 =?utf-8?B?NlFxbldpNkMydytwOVhiYkNYVVRKa2QvMTRoVi8ycHNFU2kvYStEZlJ0dUZM?=
 =?utf-8?B?TG5Wc1VsdHpsU1k4S1NrNHMxZVRyTnd3Miswems4SERTT0tLT1A5RUtFdzdi?=
 =?utf-8?B?QnlRdlBncGticjZsRlhwN3pLSnhMZitnMEZZSEZIeFloWGg0T3FnZWY4aXVv?=
 =?utf-8?B?bGxNTzVCSlY4TzlBMEUrQndoUXZZTVp6TEZ2ckh4SktNL3A3b09rdEs5L21j?=
 =?utf-8?B?TDZNQTYrbmdUWnNSTlgvb3ZMUkF0UEJxTC9iaWpNSTg0QkxCdUpZWm5EdHBh?=
 =?utf-8?B?RW1oYjlYY2hXRkRsYldEWEN1c2tTcTNkRkFPYUZ3b2I1US9yQ1czNlpqMHUz?=
 =?utf-8?B?U3lwc2pmbUNFanJibHBzVkQ3T2E1bUlHR05BcFlwVlppOHd6ZUtubncrV0FJ?=
 =?utf-8?B?K2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fee587-cb0d-47e6-b38f-08dca0e1a7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 13:10:22.3912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0kmK6ZbZTWAHW5W/N+AschF1Plasl3CMC0UWE6UKDTD1iPFY9THBafSTZbHAE6cRf/Gy23ZNINPDOUcN2m1t+vDQ2dyJqOE9Jdoy5eFMdjC2yAXZRKVJADvc7hrWTD4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1093

SGkgSmFjb3BvDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4NCg0KPiANCj4gSGkgQ2hhbmdo
dWFuZw0KPiANCj4gT24gVHVlLCBKdWwgMDksIDIwMjQgYXQgMDE6Mzg6MjBBTSBHTVQsIENoYW5n
aHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gQWRkIFY0TDJfQ0FQX0lPX01DIGNhcGFiYWxpdHkgZm9y
IHZpZGVvIGRldmljZS4gVXNlciBzcGFjZSBjYW4NCj4gPiBlbnVtZXJhdGUgZm9ybWF0cyBieSBt
YnVzIGNvZGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtdmlkZW8uYyB8IDIgKy0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi12aWRlby5jDQo+
ID4gYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLXZpZGVvLmMNCj4g
PiBpbmRleCAyMjAzNjA1ZWM5YzcuLjhjNmM0NWQ4YjdhMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLXZpZGVvLmMNCj4gPiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLXZpZGVvLmMNCj4gPiBAQCAt
NjY4LDcgKzY2OCw3IEBAIGludCBzdGZfdmlkZW9fcmVnaXN0ZXIoc3RydWN0IHN0ZmNhbXNzX3Zp
ZGVvICp2aWRlbywNCj4gPiAgCX0NCj4gPg0KPiA+ICAJdmRldi0+Zm9wcyA9ICZzdGZfdmlkX2Zv
cHM7DQo+ID4gLQl2ZGV2LT5kZXZpY2VfY2FwcyB8PSBWNEwyX0NBUF9TVFJFQU1JTkc7DQo+ID4g
Kwl2ZGV2LT5kZXZpY2VfY2FwcyB8PSBWNEwyX0NBUF9TVFJFQU1JTkcgfCBWNEwyX0NBUF9JT19N
QzsNCj4gDQo+IERvZXMgdGhpcyBzZXQgdGhlIGZsYWcgZm9yIHRoZSBzdGF0IG5vZGUgYXMgd2Vs
bCA/IE5vdCB0aGF0IGl0IGh1cnRzIGJ1dCBmaWx0ZXJpbmcNCj4gb24gbWJ1cyBjb2RlIHdoZXJl
IG9ubHkgTUVUQURBVEFfRklYRUQgaXMgYWxsb3dlZCBkb2Vzbid0IG1ha2UgbXVjaA0KPiBzZW5z
ZSA/DQo+IA0KPiBTYW1lIGZvciB0aGUgcGFyYW1ldGVycyBub2RlDQo+IA0KDQpZZXMsIEkgd2ls
bCBkcm9wIHRoaXMgZmxhZyBmcm9tIHN0YXQgbm9kZSBhbmQgcGFyYW1ldGVycyBub2RlLg0KDQo+
ID4gIAl2ZGV2LT5lbnRpdHkub3BzID0gJnN0Zl9tZWRpYV9vcHM7DQo+ID4gIAl2ZGV2LT52Zmxf
ZGlyID0gVkZMX0RJUl9SWDsNCj4gPiAgCXZkZXYtPnJlbGVhc2UgPSBzdGZfdmlkZW9fcmVsZWFz
ZTsNCj4gPiAtLQ0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

