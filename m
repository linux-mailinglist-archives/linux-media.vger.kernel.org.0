Return-Path: <linux-media+bounces-16139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46694EEA3
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 15:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A7E81F22A2E
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 13:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE12317C7AF;
	Mon, 12 Aug 2024 13:48:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2138.outbound.protection.partner.outlook.cn [139.219.17.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C92D1791ED;
	Mon, 12 Aug 2024 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470514; cv=fail; b=YX/oDjPOrdtjJhPKlH9rTW+jQeTRnNTNm0sBpxOwwbsw3/PNmVPTlAKAByGcBBYQo110rPBrVpI9K3MW8KCB6c77X7W+R/2GLZ2VOJgy8s8nQ+1rb25TKtFdD5npogl/qPGBa9LRCB0wWrvyWrO7qt8lvDUmSupp03FSy6FpyB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470514; c=relaxed/simple;
	bh=a4GgXkN97eCM1q+16iXU0KIUx5OrHGSeQS4/SZsIs3Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XYJ4DgikcxxjVf4imH/0oEJ0sr5SMlEtL8jWKd7MhbKEW4qghWcnG8iCPqr3cWtijHl7AYLK6UD/jF/Oe9FIbBjWk4UiZXKNjW+qMZsIyEMWt7Q8ErN1vtWhqTBx+9LpkenzhDzmHZILo52nCp06fv72yv+slvdpdv9hy0ivLsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcUcG5ZU+neCQMXmR3d/qI75B6DWhwU5x6MstIgbzxbcxuoyqUrlDQkt0CYbROSdHQZ9qp+9VOPnLdB8ED/KHgeuJst+h6O+0cMB80ZfJBF1TV+H2Gcne3xoopbinEEqcYlLd3iOZtPOMVhEikQsw+3gt3JMqRXEFBc73P9DzFgzSHuTC9vfysbY95kt5GKzdjx+HMyQH//6ei0E6wddWJtn4hKiWkSRKScdrS4a9gdZRTXjBW9huIWvV57A4E0CIwezAw7xu7DgjS9hRhfJ6jRvw6ReULNMQjEldjncZAsmEhUmK1y9mMSYJ0V1OPxix47Bfgj6n4FXAcJkfizYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4GgXkN97eCM1q+16iXU0KIUx5OrHGSeQS4/SZsIs3Q=;
 b=kvveqUr0VxTlKzixayA1v9Qe0g0IbUeKf1Jkp+Pe0F0IR8maNRTkw8gAQ2/FCL5bcC+PuH5LAHO7fQHF5vtoyuWpRzRc6NQg6S4yfVec6LQ0TRbhZFbSnUXimUZYbwMRm6zh86KQZaFIp+jMOrwmzGQNtqNWnYoJXd2QSxxFUWufn4db2Ism6h1JC5//XzqVFaB11/nVA5Ut0a5uYdJHQXmFVPaZg73nWaQumWSJk09B/gCxS8b1WJhK60iR7pQ/EC0lo+4YZgzfhn5sOkuiwXLxlxPAHRXC4Pqy8QEKz4Sf1pozOe29OivuC7u7W28Y7l5elLklSMIGVCvVsGTM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 12:13:04 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.031; Mon, 12 Aug 2024 12:13:03 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIXSBzdGFnaW5nOiBtZWRp?=
 =?utf-8?Q?a:_starfive:_Add_multiple_resolution_support?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gc3RhZ2luZzogbWVkaWE6IHN0YXJm?=
 =?utf-8?Q?ive:_Add_multiple_resolution_support?=
Thread-Index:
 AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfYLwAgAAkcMCAABXlAIAEdWGwgAARb4CAABoVkA==
Date: Mon, 12 Aug 2024 12:13:03 +0000
Message-ID:
 <ZQ0PR01MB130236FA891A04350CBC4245F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240809132624.GB1435@pendragon.ideasonboard.com>
 <ZQ0PR01MB13029DA731711FAA57BD13A4F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240812103357.GB18729@pendragon.ideasonboard.com>
In-Reply-To: <20240812103357.GB18729@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1176:EE_
x-ms-office365-filtering-correlation-id: e42e2b44-276c-4fcb-630e-08dcbac81def
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 kwaMP9m1fbY8PzYahMAH+omz0H8ipaJG9C4XBMwtTgXvfuijiMYZ7Fi/kbtmM1Wn2UU6350Gp1EtWtKshL/2bvrHwyggbvSkleDrG+nrEJBWn2tkt1wvS5XCKoRIwopY+FWsiU8FyH1q8gkHgaXpOTgYB4sOIHN4s1Gx7ADYxQy3kGBLbsvZ67Z4Z1+EcFo66NvLKZzKSAjUkKxioFty34zw8LtNtEbCrhsFGrL4P90pv2gzuXF57yJjeM9YsUJogN1BH8v9v8vbb3V+SHk+UKmylpsqqjFSORQoCK8fBFrwGUz2d+HrW+a06kkMuspwEs+1LyTSKNs6eBe+Fs4EIe3nQnICqw4B6HdnnnRDf7V+MXVGOjbly6Ej3Hrni/v4KOh2NU+BaoNso0bGb+HP6UOL8wHRnMQQDgn6HGmx0cUofXb9JcN534jK0BXm+V5Yd1mqg1hMy7Vq+8wM8F8v384GJ4gnX89c6bOgY+JNPrjZ8eNZx4hul7kqh0rebuMNCBPCdNzlI8PPGMn9+Whqe23mWAiyFRbpZynvV0OFjqHpxc2kkNlGesz++w5a0Fsbj5LUES26FbfYoL8LhBCIfzeQKWN3vwc+/+S1BVq5I3DNtP2vjij2YHxjlxb92zkX
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NmVheUNVaWp2c1B6UU45SERoTVhnVXZGVGNUV0gxVkhUL0hGeGJ5TFpsLzBQ?=
 =?utf-8?B?YjJJZzh3aGZXR0hBanJJd1YwcDVRYmZ4aCt0VjM1RURKb0haVGlHekJobzNM?=
 =?utf-8?B?OGpZbWlzandPK0hOVERLY3FkY2lIZ09qRjgydmZzSmQxdTBFOWE4OEdPVlY0?=
 =?utf-8?B?NG9iUHFjT2NiUU94WU9uU2U1Wi9wMW1uRGVnUjMwRHhIWkpicDJZZmRpSVh5?=
 =?utf-8?B?bVJUak5PWDg5YkFsMDZMNXdhZnQrZDcvVDNWQ01OOGFFU1FTQy9GZUZvN0ho?=
 =?utf-8?B?ZlZDMnVmZGRzMHRwZCszeVp5TjVpWG5JTDZjSDFEWHdqYmdkWnU4bUd6UXY1?=
 =?utf-8?B?azBqWEtWVlMvd2E3V2xLbWxsWjJpd3RiaXY1RytOMmpSeWxJKzh4NC9UaWlr?=
 =?utf-8?B?bVRIMjgyelIwY01zSnZsU2FOZUlPaTVOdTRyU0dGaC9HUkZDWllCMSt4MVFh?=
 =?utf-8?B?NWRvZGVsS2hpRDNhUkRSU2FzdHQ3RWlFWTZlbDdXRWV4djZkTis1R0lQK05V?=
 =?utf-8?B?ZmZYOUZNSWpkZTdLYmJaVldpTzJrQ0pEMkd1U25GNDl2eVljQitDUlpnUUxT?=
 =?utf-8?B?Ny96WUJXSVE5MERscEdvU2RvZ2VranhqdkFxSVFnZ2tvYUg3RDlzMGcyZGNy?=
 =?utf-8?B?Vnh6R0ErU3VGejVvU2ZaZnd4VDFWbXpOZE5rZHJuYzdIUCtDVlNuWEV5Zlp5?=
 =?utf-8?B?a25QR1YzWHpjRmxGTHFYbnhPc1Zaa1V6ZUI0ek1saVRvV240YlBiSDdsOXV5?=
 =?utf-8?B?dEJVT3Noc2ZaVlJGb2RUNUFtU3NQMW1VZUVkaWRIcmVBa3phKzc0Q0IzTEtE?=
 =?utf-8?B?OVZMR3lVUXljYjJKdUdnZDQ4YnNJS1hXeFc3dGxqSjNlT1dJMXIwNVpDMWIv?=
 =?utf-8?B?NUNrTnNvZzdDMkJBd2VldmFwTkN6YUhZV3BUQWt2VG1tWU9NbWJKa1JYb2Jv?=
 =?utf-8?B?VkgwS0gzZVp5SVRvY05nbllJY3JrZzd6R3JsN1pDMzhJUDdNOWxaS01RSmJH?=
 =?utf-8?B?VDE3aU00eCtBbTUyRy9YY3RpMTRKUmVaRkRwNFhMOEVVS0NkcW8wOHJVa0Zq?=
 =?utf-8?B?blRpV2c2OVBCK1lsRSt0dXZuOTUxN2VqSi9sNWZvMmlGSjZmRmt2REErQm1q?=
 =?utf-8?B?eldoazg5Y3pKRkdkQUxBSzBGM2Mydk1ISEVVUEpiMHNyRHRSTmNqbDZDeUV0?=
 =?utf-8?B?dGViajJ0bzcwYmdNcExCOTFnYWQyS0V5V1JpQnp2MFpqZFhaVDBBbE14QVVQ?=
 =?utf-8?B?ZUsrRkxXeW52WWFUOHVxV3FCcVJhNU1BVlVPcXZsc0RDRkt3MEY3VnVNWk1R?=
 =?utf-8?B?U3NTZjFTOVhzQ1krTlE4c0ZwbDZRa2xiWU1KVzlGR1NHazdoUGdBMWVsMXNu?=
 =?utf-8?B?aVNxYkNEWXhpbmY2VFJ3cXBKNzlnVUZCZzFKbWRIcFVZd2NjdUVzWkZWQXQv?=
 =?utf-8?B?aGxESnJDL0JpN1ViQjdabXdCbGNlNVJFdmJKWExsTkRudXlEZTUxWlJLYWN5?=
 =?utf-8?B?bW5JV2Y0cnRiaG00aGo0cnZETmVZWmxhaDFlVHkyc1E2TXdlckZabmthdTlL?=
 =?utf-8?B?YW5zWkpLakh4WURONEZNeGpPWi9TYzRacEZEandWK0J6MmpKT2NHSnJRUzVs?=
 =?utf-8?B?akhjVmo5L1FhOVNTMjNLelpJR0E3cDRuUG9FcWVhd0c0ZjkwWWdKaEw5Skdh?=
 =?utf-8?B?K1JrL1M4bDNTQmhNZHc0bHdwbmgwaHNHTmZlL1NrUEZrc0s2T21CTTRKSnNY?=
 =?utf-8?B?Q0VWc2FqQXFEUWFnb1NJRGFRYUlydjRDSU5HcmthaEw5VElwQ3k2V3BsdjZU?=
 =?utf-8?B?UDdJZDBzenUyNERrSlZsNXdXaW9vQlhGbGhNTUJUSVNoL3ZXZ2JyZkxRTlJN?=
 =?utf-8?B?U2VwZHJ1VHhFUFVKT1NmeWxqc2krQ1MzdlA4U2hjNWx3WDdGOTliTXpFeitk?=
 =?utf-8?B?cFFRMk5TUzY3cGkvdytBTCtSTjF4S0hoeVRSMGYwNWtzYTNVSk9CTDgveU5i?=
 =?utf-8?B?S080Zlg0K3VFMXM2T3U4UXZNU00wVXU0MUlKY2pRZ1MyUWdkYjEzaUFIeERk?=
 =?utf-8?B?LzBRTFh1M21DekYxME1yaTFkZDVFWFpSSmsvNnNoTkx0c0dxakl4RGxLSXhp?=
 =?utf-8?B?QWxVd05aZTJ6U1hwTjh2cU9veGRxVWFaUDQybk4vVmFJRDdweUx5NVdkWHho?=
 =?utf-8?B?a1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e42e2b44-276c-4fcb-630e-08dcbac81def
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 12:13:03.8005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqkhzUbBOzLRtoZYaIZyuL7I5epw/SEgxnC0nkE3s9jY4m0MG7pMCbQOxjDlYdfTgj58OxsPwYWMN6ZFbctnPF335UDZvrnPvHe/a3WDaKgB4EzGt/3KqByV4vwAf7pZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1176

SGksIExhdXJlbnQNCg0KPiANCj4gSGkgQ2hhbmdodWFuZywNCj4gDQo+IE9uIE1vbiwgQXVnIDEy
LCAyMDI0IGF0IDA5OjQzOjQ3QU0gKzAwMDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4g
PiBPbiBGcmksIEF1ZyAwOSwgMjAyNCBhdCAxMjoxMjowMVBNICswMDAwLCBDaGFuZ2h1YW5nIExp
YW5nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgQXByIDE5LCAyMDI0IGF0IDAxOjE5OjU1QU0g
LTA3MDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4gPiA+ID4gPiBBZGQgbXVsdGlwbGUg
cmVzb2x1dGlvbiBzdXBwb3J0IGZvciB2aWRlbyAiY2FwdHVyZV9yYXciIGRldmljZS4NCj4gPiA+
ID4gPiA+IE90aGVyd2lzZSBpdCB3aWxsIGNhcHR1cmUgdGhlIHdyb25nIGltYWdlIGRhdGEgaWYg
dGhlIHdpZHRoIGlzIG5vdA0KPiAxOTIwLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEZpeGVz
OiBlMDgwZjMzOWM4MGEgKCJtZWRpYTogc3RhZ2luZzogbWVkaWE6IHN0YXJmaXZlOiBjYW1zczoN
Cj4gPiA+ID4gPiA+IEFkZCBjYXB0dXJlIGRyaXZlciIpDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmdodWFuZyBMaWFuZw0KPiA+ID4gPiA+ID4gPGNoYW5naHVh
bmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4g
IGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2FwdHVyZS5jIHwgNSAr
KysrLQ0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4g
PiBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2FwdHVyZS5jDQo+
ID4gPiA+ID4gPiBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2Fw
dHVyZS5jDQo+ID4gPiA+ID4gPiBpbmRleCBlYzUxNjllN2IzOTEuLjllODUzZmYyNTk2YSAxMDA2
NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1z
cy9zdGYtY2FwdHVyZS5jDQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
c3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUuYw0KPiA+ID4gPiA+ID4gQEAgLTE3Nyw5ICsxNzcs
MTIgQEAgc3RhdGljIHZvaWQgc3RmX2NoYW5uZWxfc2V0KHN0cnVjdA0KPiA+ID4gPiA+ID4gc3Rm
Y2Ftc3NfdmlkZW8NCj4gPiA+ID4gPiA+ICp2aWRlbykgIHsNCj4gPiA+ID4gPiA+ICAJc3RydWN0
IHN0Zl9jYXB0dXJlICpjYXAgPSB0b19zdGZfY2FwdHVyZSh2aWRlbyk7DQo+ID4gPiA+ID4gPiAg
CXN0cnVjdCBzdGZjYW1zcyAqc3RmY2Ftc3MgPSBjYXAtPnZpZGVvLnN0ZmNhbXNzOw0KPiA+ID4g
PiA+ID4gKwlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0ICpwaXg7DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGlzIHZhcmlhYmxlIGNhbiBiZSBjb25zdCBhcyB5b3UgZG9uJ3QgbW9kaWZ5IHRoZSBmb3Jt
YXQuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICAJdTMyIHZhbDsNCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiAgCWlmIChjYXAtPnR5cGUgPT0gU1RGX0NBUFRVUkVfUkFXKSB7DQo+ID4gPiA+ID4g
PiArCQlwaXggPSAmdmlkZW8tPmFjdGl2ZV9mbXQuZm10LnBpeDsNCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IEFuZCBpdCBjYW4gYmUgZGVjbGFyZWQgYW5kIGluaXRpYWxpemVkIGhlcmU6DQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiAJCWNvbnN0IHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgKnBpeCA9DQo+ID4g
PiA+ID4gJnZpZGVvLT5hY3RpdmVfZm10LmZtdC5waXg7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICAJCXZhbCA9IHN0Zl9zeXNjb25fcmVnX3JlYWQoc3RmY2Ftc3MsDQo+
IFZJTl9DSEFOTkVMX1NFTF9FTik7DQo+ID4gPiA+ID4gPiAgCQl2YWwgJj0gflUwX1ZJTl9DSEFO
TkVMX1NFTF9NQVNLOw0KPiA+ID4gPiA+ID4gIAkJdmFsIHw9IENIQU5ORUwoMCk7DQo+ID4gPiA+
ID4gPiBAQCAtMTkzLDcgKzE5Niw3IEBAIHN0YXRpYyB2b2lkIHN0Zl9jaGFubmVsX3NldChzdHJ1
Y3QNCj4gc3RmY2Ftc3NfdmlkZW8gKnZpZGVvKQ0KPiA+ID4gPiA+ID4gIAkJdmFsIHw9IFBJWEVM
X0hFSUdIX0JJVF9TRUwoMCk7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIAkJdmFsICY9IH5V
MF9WSU5fUElYX0NOVF9FTkRfTUFTSzsNCj4gPiA+ID4gPiA+IC0JCXZhbCB8PSBQSVhfQ05UX0VO
RChJTUFHRV9NQVhfV0lEVEggLyA0IC0gMSk7DQo+ID4gPiA+ID4gPiArCQl2YWwgfD0gUElYX0NO
VF9FTkQocGl4LT53aWR0aCAvIDQgLSAxKTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElzIHRoZXJl
IG5vIG5lZWQgdG8gY29uc2lkZXIgdGhlIGltYWdlIGhlaWdodCBhcyB3ZWxsID8gSG93IGRvZXMN
Cj4gPiA+ID4gPiB0aGUgZHJpdmVyIHByZXZlbnQgYnVmZmVyIG92ZXJmbG93cyBpZiB0aGUgc2Vu
c29yIHNlbmRzIG1vcmUgZGF0YSB0aGFuDQo+IGV4cGVjdGVkID8NCj4gPiA+ID4NCj4gPiA+ID4g
T3VyIGhhcmR3YXJlIHdpbGwgY29uZmlybSBhIGZyYW1lIG9mIGRhdGEgdGhyb3VnaCB2Ymxhbmsg
c2lnbmFsLA0KPiA+ID4gPiBzbyB0aGVyZSBpcyBubyBpbWFnZSBoZWlnaHQgY29uZmlndXJhdGlv
bi4NCj4gPiA+DQo+ID4gPiBXaGF0IGhhcHBlbnMgaWYgdGhlIHN5c3RlbSBleHBlY3RzLCBmb3Ig
aW5zdGFuY2UsIGEgMTkyMHgxMDgwIFJBVzgNCj4gPiA+IGltYWdlLCBhbmQgYWxsb2NhdGVzIGEg
YnVmZmVyIG9mIG9mIDE5MjB4MTA4MCBieXRlcywgYnV0IHRoZSBzZW5zb3INCj4gPiA+IG91dHB1
dHMgbW9yZSBsaW5lcyA/IERvZXMgdGhlIGNhbWVyYSBoYXJkd2FyZSBpbiB0aGUgU29DIG9mZmVy
IGFuDQo+ID4gPiBvcHRpb24gdG8gcHJldmVudCBidWZmZXIgb3ZlcnJ1bnMgPw0KPiA+DQo+ID4g
VGhlIGhhcmR3YXJlIGNhbiBjb25maXJtIHRoZSBpbWFnZSBoZWlnaHQgYnkgdXNpbmcgdGhlIFZT
WU5DIHNpZ25hbC4NCj4gPg0KPiA+IEltYWdlIHdpbGwgdHJhbnNmZXIgd2hlbiBWU1lOQyBpcyBo
aWdoLg0KPiA+DQo+ID4gVlNZTkMgdGltZSA9ICh3aWR0aCArIGhfYmxhbmspICogaGVpZ2h0Ow0K
PiANCj4gV2hhdCBJJ20gdHJ5aW5nIHRvIHVuZGVyc3RhbmQgaXMgd2hhdCBoYXBwZW5zIGlmIHRo
ZSBJU1AgaXMgY29uZmlndXJlZCBmb3INCj4gMTA4MCBsaW5lcywgYnV0IHRoZSBjYW1lcmEgc2Vu
c29yIHNlbmRzIG1vcmUgdGhhbiAxMDgwIGxpbmVzICh0aGUgVlNZTkMNCj4gc2lnbmFsIGlzIGFj
dGl2ZSBmb3IgbW9yZSB0aGFuIDEwODAgbGluZXMpLiBXaGVyZSBpbiB0aGUgZHJpdmVyIGlzIHRo
ZSBoYXJkd2FyZQ0KPiBjb25maWd1cmUgd2l0aCB0aGUgMTA4MCBsaW5lcyBsaW1pdCB0byBhdm9p
ZCBidWZmZXIgb3ZlcmZsb3dzID8NCj4gDQoNCklmIGlzICJjYXB0dXJlX3JhdyIgdmlkZW8gZGV2
aWNlLCBubyBpbWFnZSBoZWlnaHQgY2FuIGJlIGNvbmZpZ3VyZWQuDQpJZiBpcyAiY2FwdHVyZV95
dXYiIHZpZGVvIGRldmljZSwgaXQgd2lsbCBiZSBzZXQgYnkgc3RmX2lzcF9jb25maWdfY3JvcC4N
Cg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg0KDQo=

