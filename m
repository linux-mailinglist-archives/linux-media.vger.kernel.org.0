Return-Path: <linux-media+bounces-30573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2E1A94D44
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466E01666C2
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E35520E037;
	Mon, 21 Apr 2025 07:35:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D281B4244;
	Mon, 21 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220932; cv=fail; b=I5K5vWxe2Exy6Xa21YGZSe4ruG/f+CuG6n7U3/0hsdyqGgk/j8N1Ewc3ksr5renJRqk974y2MKo92x6wQIH/ye3wIavxYwMbBENY10O5SQa1oK5KfT6Xrmzy7/Nk5QryzB2ELv0DB2JV8u3LFXg6pwZfcJC5p8F3ZQjRWJMFgEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220932; c=relaxed/simple;
	bh=32BIssHMe9y5fFHS2R4dEy2hTPUrkcGS1I8LLjGmu3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A8G2cBVnTk3DukNng7iCOjxWEecu2KliVnauogPrYuTd9p/Q7VxD4DuQZdyWdQzJPXpgo0OYVLYP9tRRi/9F9UMpWvdM7YxB1Z1x7sCxyXR5vV5WK0z4D7jtXyvjhFuVwGfgyFnyqNX0ObWdufdsm5nGSzho2C5pbm2FKGBHZoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rq4kXA8gX93gLNDheiFJ4NwZ4pD0Nbr6JD/8CfC6aDx/Vef88doS1EU5a/Z6Dfd2nrD1C2Xn4ZJX7AzZydmt8Xl0Zi8oodRMHrbZvhhqNKxUufDKUD0BvKkgMGsodDRw/TWd7iS5wz5kFOqLnCXtYKAKhwjRz3hJTMuouIOsPPWxeZPWwMX80WLwYmoqZw9b6jFGu2vrFk7Xov4Ghvjg0zfABmeAZFCmNEB36arnE8owfJb31G3t1FBT2NJAhzMqKZ5WoWaleBxXwHNUp+giHUTts8ynEClWhTfOW480fBV/gm1eRs1LIG7aOoE/R1b1k/gn9THqEshvB17bzths4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32BIssHMe9y5fFHS2R4dEy2hTPUrkcGS1I8LLjGmu3w=;
 b=itenC/xU8KUDxrmCY1VwO504/y6hBjHj42PlZfOiAjLn9dBeFQNpujaciAzvU29sAWlQKb0ogh1prl3rA0igm2I+JfgfC5b60w295rGyOu2QJPM+hwm9kUL1d3YEDlVrV5dPCZRW/i2Ax7mn19U0BGVJZGvHxmyqn1CYROdOSqGkcsGL3fxwlJvReo+ap+QlKZyc438zLMkl80+SaJteLxk4oEzD0Fx+KCcTDlrvECyslHVtKtPuAdBxRzCpp4JgNgAfkzu3y1lYDp8Vrx5nATelQr3iKBFdf5EYvryD6rmqelj9uijsa4kh0TMNjQfN8TEsSn7clw0geIDmKswK6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1094.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 21 Apr
 2025 07:02:47 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8655.033; Mon, 21 Apr 2025 07:02:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>, "jai.luthra@linux.dev"
	<jai.luthra@linux.dev>, "mripard@kernel.org" <mripard@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "devarsht@ti.com"
	<devarsht@ti.com>, "y-abhilashchandra@ti.com" <y-abhilashchandra@ti.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "vaishnav.a@ti.com"
	<vaishnav.a@ti.com>, "s-jain1@ti.com" <s-jain1@ti.com>, "vigneshr@ti.com"
	<vigneshr@ti.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>, "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>, Jack Zhu <jack.zhu@starfivetech.com>,
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHYzIDEwLzEzXSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4?=
 =?gb2312?Q?:_Enable_multi-stream_support?=
Thread-Topic: [PATCH v3 10/13] media: cadence: csi2rx: Enable multi-stream
 support
Thread-Index: AQHbr2XyRW/dIHP500yhgFSQ2TWUCrOtt5nQ
Date: Mon, 21 Apr 2025 07:02:47 +0000
Message-ID:
 <ZQ0PR01MB1302A36A1966E3ABEBA110E0F2B82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-11-r-donadkar@ti.com>
In-Reply-To: <20250417065554.437541-11-r-donadkar@ti.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1094:EE_
x-ms-office365-filtering-correlation-id: 942f7c55-e086-4959-1f25-08dd80a285ff
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 SSqJa1FUb01agG5wuX570pzAHX/mwTQ6aBZ4yTNQqdDqgTuZEpzMDREvZjfCykIJ9T5jMZDCsjzsCSnbzVybzkMzndfRuMFXX/A3x+KGK9mENVYdm5J6owDAbIQADleQGcGOV15l3iscJiH6AsIGw+t+qJhPKys0N5FBAcpgfbjmd3irKOoa1FgmsdYXFroxofldv+uQY5yeZ+2d2U7U57GEi+bNCt+2liQdjwrGTw8BtkKmqUeY/aVAMV4E+2kmSqLLhkYFm31JGjnXMEkYE1d0xbIVG/1NRXdcHxLn+JoK9FlILs8NHiM1oVpV6fteyosO51DDA/DfkwIBKGzA8z98WvK1/lKFDPB+/jV2/FOUCWFH5EcH+rXkiQys7IYQb1FDMKQ/mibOSJqDkArh5aQD8euqGaYbmtlONF7OuiJQO37mdoVWDGI0RZpkR634l4Wvc6cNKTsg4HTbTso7LWYbBKOZ3zz1VIfvMhch7AlLxhFxcREy1EC5mywhMEkbQR9gK89Ce46Hro30EyHveSxFJCwQ+bLiJf6DJAxRdc4ycgR6/KiTTxCQYmHj7c1Ts2OuE2ULu+lK7/uFer4VBgYbhMEvtoQ+frNscJwXRSM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MVdEQjdHY3dmcjNnV21lcXhwM084dUVTM0trZzlSbnVYQ3VmQjNBNGFCVERH?=
 =?gb2312?B?Y2tHSkJVL1BsbWNZakpNQUMxczdVZ0lJZ3Jwb0V0Y2JVYzRpNWJUblJjeXFi?=
 =?gb2312?B?aUtET1BYY09mU25ZOW1NSjdKakExUjdGb2ZjcDh2azlOS1ZjdHh3V3lZcW9O?=
 =?gb2312?B?dmZHU3dWaW9yTGJsQTJaRzNESUUvWWVlS2JLVitsb01qN1BDeHQvYXBRSHNY?=
 =?gb2312?B?bStIWFdzWHJQQUtIa2ovSVN4TGljdFlHVUlpenRkY0hJZXVKQkduV0dsV29S?=
 =?gb2312?B?cG9FbmhTNlRXM2Y2M29XZTAzdEx2bEhLMHNnTVNlUytpakwzWllkeExtdGhE?=
 =?gb2312?B?bm5nZDJCOGN6NWZaTnkwRldzMFAweCswSmYxdENEYWszOXJFeFZ2bjF4QjV2?=
 =?gb2312?B?Zm5UWEJmd0RZQVVEa1dxc0ZDckxhNFJKOGFzcXMrcGp1eXQ4ZkRaeCtOSC8v?=
 =?gb2312?B?N0VhcWhHZU8xamZqUTNWcko4SW53b2xHSFpTaVpBV1grcGFiQ3ZXK1Z1SGVM?=
 =?gb2312?B?UXdQZy9uVnRkTkU2M3E3ZkVZaXU2dm40VmZGN09Bc3FLZEVYRjF2ZWlxNm5v?=
 =?gb2312?B?NGExUTJ6QnFlekR2K1BjZFBYYnBxY0JoWXZ4aDZqK1FnTnBhR3BQdjh0d2hB?=
 =?gb2312?B?M2tiQkNtNk5ueVl3NzZaVVppaTIrWStVN0dkNE9DV09tc0RSV082QUlsYkkz?=
 =?gb2312?B?Vng0WmJTZmZUMnVPVDQwNGxKYUFRVkNnbFV3VnpHMnk2aFZDS3l2WHlkWTVu?=
 =?gb2312?B?RHJCNVQ4NGY2eklWeDdDdGRvK01sc2xDUmJnSkJ2MkExNkNBeVJ4TEdMWHNm?=
 =?gb2312?B?NmYwMFJ2amhkZElqMTVPQWJUS2wrbGE2cUZHKzkrN20wSUpWYXVJaDRFbXpi?=
 =?gb2312?B?VS8xcmRGZ0NGL1duTVRuZUZ1Y0RBZy94M0dMMGVSV2Rmc0FvMTFrN2xXL3BD?=
 =?gb2312?B?YmdVV0pRWXM5KzIwdUppVm0xREV5WFlzM2RMYW1waEk0TDdWRDl5TTFrNEZX?=
 =?gb2312?B?RUxUNSs4bUlSdENkczd6VnZuOTFzZlMwUEd5bG0veVR2Y2Nvaks3dTRGaDVL?=
 =?gb2312?B?Umg0SXJnRjlqRVVyMjlKZTQzZ0hIODBLeGl4cjQwUEwvU2RmZkJLUVZrYUNx?=
 =?gb2312?B?UVoyWjlUZXdQZ2ZlNXJIeDNMMGQwRlNpNUQ4aHdtMXh5YnRqNC9ncjJtMnBm?=
 =?gb2312?B?RlU4NzhUZkRwY29oT2laMnVPMEU3MkVoakQ5clNLcXJJUldoWXBaQk12dmJs?=
 =?gb2312?B?QU0zeXc0MjZ0MUFBOE5BYkptMmpkVGV0ZHlobEI3Wkx4dytCNGtZR1oxclBS?=
 =?gb2312?B?eWVST2ZSSUlFNlNYekltNFYvMFFtYTQ0RkZSWlR3cVFLelVyc0phQ09FYllh?=
 =?gb2312?B?VjZldElhWlRFS1hMWGZBbm1EL3BvMWNLVVlSN215dit0QzhVNEt0Tk8xS21O?=
 =?gb2312?B?VURRNndydC9Id2M3OEh2WWM4bmpQQUsxVkY2WVZpWExETFVyZmZGalhLUlEy?=
 =?gb2312?B?N2lVTWovR09OQnFKWUlzcjFMZHR5a21adXNwQkd0dmEvVlc3WEMzbnNQWUN5?=
 =?gb2312?B?aUdIZUdYRUlibnNDSGYycm9tdE9GQ2hscXVoZWpLU2F0ZE5HYjFCUWRaMHNh?=
 =?gb2312?B?dUxDTWQrdGFONXFWYXc3VEdTTDVOTFJQYWIyMGJTcmY4dHNsUmZzcHFld3RS?=
 =?gb2312?B?R05zNjIyRThRNldHaUhYaTFFcDBNSEJVWEZsdVByRWNZT2tXNHB4OXFZN2V6?=
 =?gb2312?B?SWlOM0NNckN5b1Q1NmZPSHc5QmhMTnRuVE1Yei9yNlFtK085cURiK0d2Qk1P?=
 =?gb2312?B?cDNFY1FVYmNxanNLMTJNcXpGNGNVMlhENjNCRnNKcjl0RW0wRm40MTFWdjFp?=
 =?gb2312?B?anFPcXAveFkxaE9yUGVXOGxSNzdHSkdWMjlTNEZkN1cwSWZzZktrUUxiQk5u?=
 =?gb2312?B?WlNqa3hTT2NFV3NuTm1ra0tiV0kvdE4wTnVQSmRjVlI4N0ludGtBYXN5cUxn?=
 =?gb2312?B?WFE4QWJXRUJMWWEvWFd2Tnc1RGhBV3hqa1Rhb3VYeXE3aEJ2R0pMLzVjWm5p?=
 =?gb2312?B?VWVPZVRlQlViYmtoYVZzTnZDdFdrdlZRQ2loRHVpRWFvbWxTT05raHk2UHQz?=
 =?gb2312?B?ZE43U3hJYjlKaWRUdW5PMlRIank2VlNCUEJpckFHRXJKZStRTmlKc2dWWStz?=
 =?gb2312?B?QkE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 942f7c55-e086-4959-1f25-08dd80a285ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 07:02:47.7004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFlsrmDw/nCswAoMVvm7cswV3ByCeRu+bjknVl4o38Cn0L5aRX3Cobe9lqlDgzzwkVO91tCrn8J/pYee/fdzkLb5y1sWsDJPl/jzj45+x+kytgS+Zalzkj3DLNbRZ1NR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1094

PiBGcm9tOiBKYWkgTHV0aHJhIDxqLWx1dGhyYUB0aS5jb20+DQo+IA0KPiBDYWRlbmNlIENTSS0y
IGJyaWRnZSBJUCBzdXBwb3J0cyBjYXB0dXJpbmcgbXVsdGlwbGUgdmlydHVhbCAic3RyZWFtcyIN
Cj4gb2YgZGF0YSBvdmVyIHRoZSBzYW1lIHBoeXNpY2FsIGludGVyZmFjZSB1c2luZyBNSVBJIFZp
cnR1YWwgQ2hhbm5lbHMuDQo+IA0KPiBUaGUgVjRMMiBzdWJkZXYgQVBJcyBzaG91bGQgcmVmbGVj
dCB0aGlzIGNhcGFiaWxpdHkgYW5kIGFsbG93IHBlci1zdHJlYW0NCj4gcm91dGluZyBhbmQgY29u
dHJvbHMuDQo+IA0KPiBXaGlsZSB0aGUgaGFyZHdhcmUgSVAgc3VwcG9ydHMgdXNlY2FzZXMgd2hl
cmUgc3RyZWFtcyBjb21pbmcgaW4gdGhlIHNpbmsNCj4gcGFkIGNhbiBiZSBicm9hZGNhc3RlZCB0
byBtdWx0aXBsZSBzb3VyY2UgcGFkcywgdGhlIGRyaXZlciB3aWxsIG5lZWQNCj4gc2lnbmlmaWNh
bnQgcmUtYXJjaGl0ZWN0dXJlIHRvIG1ha2UgdGhhdCBwb3NzaWJsZS4gVGhlIHR3byB1c2VycyBv
ZiB0aGlzIElQIGluDQo+IG1haW5saW5lIGxpbnV4IGFyZSBUSSBTaGltIGFuZCBTdGFyRml2ZSBK
SDcxMTAgQ0FNU1MsIGFuZCBib3RoIGhhdmUgb25seQ0KPiBpbnRlZ3JhdGVkIHRoZSBmaXJzdCBz
b3VyY2UgcGFkIGkuZSBzdHJlYW0wIG9mIHRoaXMgSVAuIFNvIGZvciBub3cga2VlcCBpdCBzaW1w
bGUNCj4gYW5kIG9ubHkgYWxsb3cgMS10by0xIG1hcHBpbmcgb2Ygc3RyZWFtcyBmcm9tIHNpbmsg
dG8gc291cmNlLCB3aXRob3V0IGFueQ0KPiBicm9hZGNhc3RpbmcuDQo+IA0KPiBXaXRoIHN0cmVh
bSByb3V0aW5nIG5vdyBzdXBwb3J0ZWQgaW4gdGhlIGRyaXZlciwgaW1wbGVtZW50IHRoZQ0KPiBl
bmFibGVfc3RyZWFtIGFuZCBkaXNhYmxlX3N0cmVhbSBob29rcyBpbiBwbGFjZSBvZiB0aGUgc3Ry
ZWFtLXVuYXdhcmUNCj4gc19zdHJlYW0gaG9vay4NCj4gDQo+IFRoaXMgYWxsb3dzIGNvbnN1bWVy
IGRldmljZXMgbGlrZSBhIERNQSBicmlkZ2Ugb3IgSVNQLCB0byBlbmFibGUgcGFydGljdWxhcg0K
PiBzdHJlYW1zIG9uIGEgc291cmNlIHBhZCwgd2hpY2ggaW4gdHVybiBjYW4gYmUgdXNlZCB0byBl
bmFibGUgb25seSBwYXJ0aWN1bGFyDQo+IHN0cmVhbXMgb24gdGhlIENTSS1UWCBkZXZpY2UgY29u
bmVjdGVkIG9uIHRoZSBzaW5rIHBhZC4NCj4gDQo+IEltcGxlbWVudCBhIGZhbGxiYWNrIHNfc3Ry
ZWFtIGhvb2sgdGhhdCBpbnRlcm5hbGx5IGNhbGxzIGVuYWJsZV9zdHJlYW0gb24NCj4gZWFjaCBz
b3VyY2UgcGFkLCBmb3IgY29uc3VtZXIgZHJpdmVycyB0aGF0IGRvbid0IHVzZSBtdWx0aS1zdHJl
YW0gQVBJcyB0byBzdGlsbA0KPiB3b3JrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFpIEx1dGhy
YSA8ai1sdXRocmFAdGkuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IFJpc2hpa2VzaCBEb25hZGth
ciA8ci1kb25hZGthckB0aS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJpc2hpa2VzaCBEb25hZGth
ciA8ci1kb25hZGthckB0aS5jb20+DQoNClJldmlld2VkLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxj
aGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCkNoYW5n
aHVhbmcNCg0K

