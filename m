Return-Path: <linux-media+bounces-14323-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C9591BC21
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0292B1C2271E
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1C4154C1E;
	Fri, 28 Jun 2024 10:02:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2136.outbound.protection.partner.outlook.cn [139.219.146.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D73152160;
	Fri, 28 Jun 2024 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568966; cv=fail; b=nge9O/hnsVK4HcY2Yxk9ytxkL3BzDR8FzJu7lH0XC3mHivz06N/tvLumklgAi9uZxiX1EN6SOFJcNsvX+16S9AW8PZfa+d/k1iG3OPvAXsFo6IPQmvYp1xfdflo8QtNlCdYcDjFTYngPLaae8DPeLCBQ9N00Djkg/PsaPK2Tz+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568966; c=relaxed/simple;
	bh=lS+UGkQDLvVqkGSdpCQSCQZWFUa2kIKCFPT3RNTnqa8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WdWx2AIQbLUtn7zZ379AnHlIQ/tiYAVaSIg/CU6WWdoGYnWfThn10hUds/LyR9xgxeXmUB4mNOB2ktoM6aheRxh7wsZsrzSEw1SpO2lDd4M5As/t5jEcb9pF4cSTnb6HYS8ft0HBwZDQyuouAVaNgPopV8JFOxfajmnzUk6Ewfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8/2X08YBb7XCHepPIMtkS6c9Im/irnG9S64s+hPZwe1s7e144joinGJKRKCXRBF6KZ0cDVHBxzBhxz0puEr760FT42FxWI4yRbarS47hGmqEP5hnW9CMlk17/KhosOIGJldC7lm1wChf4SVR8+YYCPbxNBZ7jzQNh5IvsGK4e6E9qTVw177DbDpRGZ1ncVUqlU9o5C4dLYWZWvVYFKZshysSMuTm0RQdT/bf97cp98UdxPjHrYTDQMlX41049SsmWvk+jkfjk9NtxZypqxoBkmJBzKp0RhNG9mLyfXL5S4DXsK7CGCeF+8eYtiem7saq7iJ0RB/66roYSrb43QMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lS+UGkQDLvVqkGSdpCQSCQZWFUa2kIKCFPT3RNTnqa8=;
 b=Uica8Ls4IknYGew6iB1QojxDfkIUB5WFS2WAyiywDsM9gfz5n5/n71vLI3CPJS3c6cd9TEzQq+94umDxn2hHD4zLkAWKk4tUPZxLE6SI65rBNXqmvIKu8Kg5F+9z3tlN5Gjrl8ngs/U+XaFvGv5r0rHvFKfmXCo1FSu1Ny2ysJ+HioBNIM1MG3dk8RTRgV2RdMx6HpzLCQZwkFhCjDekUW4nekRW6JWU8phHlahOeuMM5wSnvykmGUkyunL6gut5RhFgK87btDohvsuaEmhSz1CJrOYnHEey6u3RvZW42TddayzYs5n+NoQWSpfAuTDH8Rom5wg3A6G4rLzWlfC1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.36; Fri, 28 Jun
 2024 10:02:31 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::4d66:ac5e:3903:cdf5]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::4d66:ac5e:3903:cdf5%4])
 with mapi id 15.20.7698.033; Fri, 28 Jun 2024 10:02:31 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <j-luthra@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath <vaishnav.a@ti.com>,
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Aradhya
 Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject:
 =?gb2312?B?u9i4tDogu9i4tDogW1BBVENIIHYyIDAxLzEzXSBtZWRpYTogY2FkZW5jZTog?=
 =?gb2312?Q?csi2rx:_Support_runtime_PM?=
Thread-Topic:
 =?gb2312?B?u9i4tDogW1BBVENIIHYyIDAxLzEzXSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4?=
 =?gb2312?Q?:_Support_runtime_PM?=
Thread-Index: AQHayJNptuXJ2qsJik29H2g7jEFGsbHc1VcAgAAHZLCAABBFgIAABbww
Date: Fri, 28 Jun 2024 10:02:31 +0000
Message-ID:
 <ZQ0PR01MB13028A690CE2EE8E9A91A8CFF2D02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
 <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
 <ZQ0PR01MB1302B36DDCE078AF2D16E935F2D02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <5nlxmwidnplo3xkahdev7o4hl45lxouirixexjhwx5ttgvuqcz@ctcjbgmr2man>
In-Reply-To: <5nlxmwidnplo3xkahdev7o4hl45lxouirixexjhwx5ttgvuqcz@ctcjbgmr2man>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_
x-ms-office365-filtering-correlation-id: 49783703-7e48-4d55-7665-08dc97596cb6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 VbDrsGMmEUXK7PuObg654q9uZsExoN5uRpfJrJOcgxl8ZxEK28GWdXRRRu/bWVrB3UTcfUe+7jN8xFND3Hpx8+Ck3Z8s8++kRUsUxUvjGu+XeUvVN/NXYvmo0yyRWagUsxXa6qjd7nz5bF0SQI+Q95fzmO0rsecHFXZCnUMABKeOZnHrxowR2A/pv+JTy7EIwH0ZfqmH4Zl8QUCM66WkAaktXP/k5dXo1viPs+oUy6NwvVOB16Pw9zIz0DUTfp73WGtGemTmRVAgfRL4UJtOwPqkxuOhcGJPmy2gk+z5mFY4XSlSpyhLxAgqWARqiYDUsjoaQ1T1NdyOah4fuRiYG/IdS5AF+KTus+XMti/DFp2w6UxZ6q9Q0bIrzC1/z0qm+OgSDvi1bDI6cUVKRsbMUPAM2MkZx198uRzxbXwLAcLDSO7N6kobtzTEFR4e8mms9Svj5lG36+J8VyqnTG2Oyh6kLtduvS3oLqUK9DeXjMoZqUBtbt4m4KT0L8K85RxU16Xw9a5ZLNNKv1Hk2r7QRCnMLSinRIaeWfkG8xwFLYm7n/k61GsfEQU8nDECvWlL2EeuHms303Ni9x1S7MGrpv74gBs4UKxSSGrCByVWwrCrHlwQEorCHnMThBbj3Ksa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?M3lLLzZGdTdleFZTQXpCVitTQ0ZMTSsrczNET1JoYThrQ0NnREdudFovbjMr?=
 =?gb2312?B?aTFHb0d4TzRyT0Y4aDBFaUJMTEtRYmZyamJBZnk0QnY1MVRMYTdwSWh5cjI2?=
 =?gb2312?B?M0xmZ1VOL3dMVW5uNkdUc3NyU0ZJK2ZtdFJ4WndlZVVNTDlVWXpacXVOaWM1?=
 =?gb2312?B?aHBtVkVvalF6bHRSb1FLcHJkais3RkV2TVpodFhJcDBmUk43eDZNc2dnMHN1?=
 =?gb2312?B?SXFISUw5eFUwcmwrcnhnNW5KdTJrVDBRb3VzTURuMkE0b1Z1d0ZSTllWb0do?=
 =?gb2312?B?NjV2Yy9Kd0ZPWFRzUHNKbFZLR2h2SC9WcXBKWndTRVdZUmVSWHN2WVJNWm9L?=
 =?gb2312?B?MktrclMxM3JiOGZEZ0c4OWRvTU9LaEN2dVZvOGZoN0VrZGRzbGlZTUUrZjJG?=
 =?gb2312?B?QWNjY3BnTC9lQ0dxZ0VnSnFYTUJQZFR6bzc0QXdoZkJJL1RMOFBadVUrOVkr?=
 =?gb2312?B?ODQ0eVdnSFNYcm8xTXZxT0piV2IwUndKUXlhY2hoV3N5dmFnZ05PZzVSMkRL?=
 =?gb2312?B?OWlFeXZ3c0tIaVNidnBlRjZpV2lRS1ZpMFZEbnRzSzVvQzdveUtrd2FaNmtM?=
 =?gb2312?B?WjBrKzNydXlzY0hYYzF4TzdNRmpib0NGSTdjakJWcmhRMEN0RUNDVnFrUng4?=
 =?gb2312?B?LzRQVEpZQ3ZSVzhzSXFNblFqaHlMbjk1MDhHSU8zdi9lbUZ4cnc5VjR3STdJ?=
 =?gb2312?B?bVlmOWRpTFNsWnNrZU9KVXhQaTNFRy8vMCthTlgzSjhqTUdGSjNVa2FNR1dU?=
 =?gb2312?B?MUVYYVBuejg2WE5Kc2EzcGR1UERLSUY3VjZWQmxsQzhnYU13TGIwRXpwL2gw?=
 =?gb2312?B?MkxUa2hZLzdHSEZ2cVcyTlZ1bzBlWWRlT0RiUmk0R0k5alB6UUxVZ3RnQ0Z3?=
 =?gb2312?B?VXZFVHhxWndZRHBvNjc5dmdiYW1ZNmNIcEk5N3lHenZOYnl1Mk5LRys5N3lQ?=
 =?gb2312?B?ZGRZWnRFNCtHQVpVNjR0UWk0Uis1TUxhLzU1Q2VIQVVHSXFQUmpHaFVCb0Ro?=
 =?gb2312?B?bW9vTEdUMTVRL3VSa0ZVbkFVODJKNkIwZ0FkWEFKZWc0TkwxMnhDYys0TEtN?=
 =?gb2312?B?RFhYWDArb2lkYWRlM2FqYVJWdzIxZXpMRytvUmpFY3Z0WFpoanAzTVRLU3RH?=
 =?gb2312?B?eEcrWUZUMG1uRFVOL0xyOTFCa0tsYWhIL1g4T3FSeUw2WUlXOWUxa3lJek54?=
 =?gb2312?B?OVRVRlhuS1AyNFZ3MmtwUVZ2aGFkRERFSWgrN2pBSmdoWDk4OGRtQ2Y1emI3?=
 =?gb2312?B?YldXRHd2UUlZT1QyM2hqdnJFMEV4ayt1dnZIdGJpeWQ4NlZRd04zdmZUZzBW?=
 =?gb2312?B?aTJKZW5NZlR1ZEdGMHp2V2JoM0EwdWVkeTlsbHB5bEFwamRyTjFEbDQ1YzBs?=
 =?gb2312?B?QTZzTU5XeU1Wa3JaTGcvZnhGSDdieGZVZ1o1N3M0QUJFU2lBVHJnMTY0Wm5U?=
 =?gb2312?B?b0ZFMmEzQjFXai9oUTNpS0h2REVyb29vaEJaTnZzeWJzMXBaL0crbjloYVZT?=
 =?gb2312?B?L3RIbmpaMHM2MzZsM2xyNEg4aUVaMGZnaWUwUjlEN2NYRFRESm1TYjRjSDVW?=
 =?gb2312?B?VE9aUHZ5QmJIRVowWGoyeHovL2xnbzZwL0J0SWx1OTZHN25GZExna0FQNWNC?=
 =?gb2312?B?UDh6RldXZEZycVl3bGltVEdERHhjZHkrK2N4YjQ1S2x0eUxWazNwdFhDOXVq?=
 =?gb2312?B?SSszYitwakJtOGtBSG9WN2Y4YXhHSFhhWVJjNUpOTlR1TkNQZzRIMXFNcFkv?=
 =?gb2312?B?N3JJMUN1UllCYy9TSGhWWFVSNUpXVkg5ZVBtam9sOG11ZDVqZjBkZEhBWnRE?=
 =?gb2312?B?d05OQWRYR3NlMjd1Zk9NYnhNODBOL2RoK04xQ2NnOFM5aTM2Mm1VTmo2alRQ?=
 =?gb2312?B?a1F6cmhSL3ZKQzZUdG1uVFlQeXBBSFlsSW54aFRvcUFBZmtmRU9wQ00rcGEr?=
 =?gb2312?B?eVNQYW5YVXVuekV5TVlFZXFMWHNVeXVLZXU5K2tKdFdJRzlDdjdmWHFCOHAw?=
 =?gb2312?B?WThJUWs2NnhPc3VhNXVyTWpvQTdnd3hWUGhOeU9sTUR6VURjZzlqcG9kNWU0?=
 =?gb2312?B?MGZrUXJoV2JmYWNkYmpxRksxdEtnMHljK08za1hWSU50WGFDckUrLzhmbHZX?=
 =?gb2312?B?clpEQmhLSlVESXI3eC9COTFJeEFKQ3VaS0hmYWRaY3dEclpGTSt3SWJYRElk?=
 =?gb2312?B?eVE9PQ==?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 49783703-7e48-4d55-7665-08dc97596cb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 10:02:31.1029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsJoGss0QI4awD6o8wDm6b55B/L4o09X/YwBm6S1plFiTK/vWILLSRrwcm3L0TMyuR7gvMJJzEGMWFHry2zZ8aK68XxMO0154l+EZ9p8YEXSLsWSflYAyFY+UbsZEWtl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1302

SGksIEphaSwNCg0KPiBIaSBDaGFuZ2h1YW5nLA0KPiANCj4gT24gSnVuIDI4LCAyMDI0IGF0IDA4
OjQ1OjA2ICswMDAwLCBDaGFuZ2h1YW5nIExpYW5nIHdyb3RlOg0KPiA+IEhpIFRvbWksDQo+ID4N
Cj4gPiBbLi4uXQ0KPiA+ID4gPiArc3RhdGljIGludCBjc2kycnhfc3VzcGVuZChzdHJ1Y3QgZGV2
aWNlICpkZXYpIHsNCj4gPiA+ID4gKwlzdHJ1Y3QgY3NpMnJ4X3ByaXYgKmNzaTJyeCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJbXV0ZXhfbG9jaygmY3NpMnJ4
LT5sb2NrKTsNCj4gPiA+ID4gKwlpZiAoY3NpMnJ4LT5jb3VudCkNCj4gPiA+ID4gKwkJY3NpMnJ4
X3N0b3AoY3NpMnJ4KTsNCj4gPiA+ID4gKwltdXRleF91bmxvY2soJmNzaTJyeC0+bG9jayk7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+
ID4gPiArc3RhdGljIGludCBjc2kycnhfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiA+
ID4gPiArCXN0cnVjdCBjc2kycnhfcHJpdiAqY3NpMnJ4ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwltdXRleF9sb2NrKCZjc2kycngtPmxvY2spOw0KPiA+ID4g
PiArCWlmIChjc2kycngtPmNvdW50KQ0KPiA+ID4gPiArCQljc2kycnhfc3RhcnQoY3NpMnJ4KTsN
Cj4gPiA+ID4gKwltdXRleF91bmxvY2soJmNzaTJyeC0+bG9jayk7DQo+ID4gPiA+ICsJcmV0dXJu
IDA7DQo+ID4gPiA+ICt9DQo+ID4gPiA+ICsNCj4gPiA+DQo+ID4gPiBJIGRvbid0IHRoaW5rIHRo
aXMgbG9va3MgY29ycmVjdC4gQWZhaWsgdGhlIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUNCj4gPiA+
IGlzIG5vdCBjYWxsZWQgb24gc3lzdGVtIHN1c3BlbmQvcmVzdW1lLiBZb3UgY291bGQgY2hhbmdl
IHRoZQ0KPiA+ID4gU0VUX1JVTlRJTUVfUE1fT1BTIHRvIHVzZSB0aGUgc2FtZSBjYWxsYmFja3Mg
Zm9yIHJ1bnRpbWUgYW5kDQo+IHN5c3RlbQ0KPiA+ID4gc3VzcGVuZCwgYnV0IEkgdGhpbmsgdGhh
dCdzIGEgYmFkIGlkZWEuIFJ1bnRpbWUgc3VzcGVuZCBpcyBub3QNCj4gPiA+IHN1cHBvc2VkIHRv
IHR1cm4gb2ZmIHRoZSBzdHJlYW1pbmcuIFRoZSBkcml2ZXIgaXMgc3VwcG9zZWQgdG8gdHVybg0K
PiA+ID4gb2ZmIHRoZSBzdHJlYW1pbmcsIHRoZW4gY2FsbCBydW50aW1lX3B1dCwgd2hpY2ggd291
bGQgcmVzdWx0IGluIHJ1bnRpbWUNCj4gc3VzcGVuZCBjYWxsYmFjayBnZXR0aW5nIGNhbGxlZC4N
Cj4gPiA+DQo+ID4NCj4gPiBJIGltcGxlbWVudGVkIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBiYXNl
ZCBvbiB0aGlzIHBhdGNoLCBJIGZlZWwgZ29vZA0KPiBhYm91dCBpdC4NCj4gPg0KPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMyNjAzMTIzNy4yNTMzMS0xLWNoYW5naHVhbmcu
bGlhbmdAc3QNCj4gPiBhcmZpdmV0ZWNoLmNvbS8NCj4gDQo+IFRoYW5rcyBmb3IgY2Fycnlpbmcg
dGhpcyBwYXRjaCBpbiB5b3VyIHNlcmllcy4NCj4gDQo+IEkgdGhpbmsgVG9taSdzIHBvaW50IHN0
aWxsIGhvbGRzIC0gb25seSB0aGUgc3lzdGVtIHN1c3BlbmQgaG9vayBzaG91bGQgdHJ5IHRvDQo+
IHN0b3Avc3RhcnQgdGhlIENTSTJSWCBkZXZpY2UuDQo+IA0KPiBSdW50aW1lIFBNIGhvb2tzIGFy
ZSB1c3VhbGx5IG9ubHkgY2FsbGVkIHdoZW4gdGhlcmUgYXJlIG5vIHVzZXJzLCBzbyBubw0KPiBh
Y3RpdmUgc3RyZWFtcy4NCj4gDQoNCk9LLCBJIHdpbGwgbW9kaWZ5IHRoaXMgaW4gbXkgc2VyaWVz
LiANCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

