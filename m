Return-Path: <linux-media+bounces-6704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB7E8760E5
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 10:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5225C1C21EA5
	for <lists+linux-media@lfdr.de>; Fri,  8 Mar 2024 09:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F13653399;
	Fri,  8 Mar 2024 09:26:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B69219FC
	for <linux-media@vger.kernel.org>; Fri,  8 Mar 2024 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709890018; cv=fail; b=AoUUWWfPo/3svvjz1kZMFC1WE/U+Jm8tk9GO2DZZhKcnOsKfVgrnSpVKKs7unk6ZiBB5rFv843LZCJlryaY3RexzzOAOxVoQ3peH+YpRJiJqnkns2O81Ba5jUT4++9OZdQ8Clddsu5ObvyDJpIn0waPBcyA3PJtjlbwAK4YeuRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709890018; c=relaxed/simple;
	bh=JKLZdY8QWQFMHHCBcpgG8HCUnmDoJUomoVhoBX+N77Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FWTg0WXvaka3r4b9hzF9dSKYHM/bgRw0Ye2nT2k925Jtgykq9Zqf/WiBxTieht4ahFiQQLzRSmn2SNBkl+lTFWRsVHle0fnvFTcAM7XvByV+Bqjes3syVxZWrxf9LqIpi+o1bsfuhE8CJHPKlYUTKa4V+7zTKWbVEBzvXIzvSD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nze+VGqRJJUIF36Ju7Ed9K400M3ZzNCaljWLL8PQxXY8uspcgZAsi93BZWyGfyw0Cs8A4GxwX9fCrq3HNDKjXqOTJUrP1FuxqutnT/r/psDGxRbUy1D9o5YRjLp1JKcBMuZBd+RPgEzffYpjKgjQ+i9SpHWDUIiDVRrHlEqua7Cv+HYAp8dXwilN0+jAAm3mPb1uxvVwC6eEu8Tl2HBHvqW4ipZWQo2LCYB/ojHgq4KZynv+HgKhQCe1YCzbSkPPqBnNEe0boBr6FrF4vbKu0nUb58P5gXdzjngQfMGfY9L59ozOymjLi3QUByb8f3PH0cS+NxfkUUot43+PzqIeNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKLZdY8QWQFMHHCBcpgG8HCUnmDoJUomoVhoBX+N77Y=;
 b=OL59PDeEujUA7UrFZhvaYrmEYaWDvHpXZ5G8hoUEyjIwuJSWnJm7OUw0IZqbm+BZMS5hmc06sK7V8/MiB9o1to7KnsM+K7qWIJzUBmYt6sRa8w9AJCeHSJXPWHoOLEwbCDGCx03OYg/arYVeVmXFOmKBmL892Fbghqp4bUcQtpTHtA8ZzrN9A8AdL+pCVfO/blOxPmaqHF0BNjJ+0ohEW8bNZFIQGpUV7F3DcLR8BtQ1+fnlzK8F5CndUg6JQlPXRMjYin4GkK2LwjyftStdFWGnwJPTP6Zc93SHv1NxN1vvraZ/9VqRqjmWYsUTidxBYxzhLkLfjm/H4bhNFEIucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::10) by SHXPR01MB0848.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.54; Fri, 8 Mar
 2024 09:11:49 +0000
Received: from SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
 ([fe80::b0af:4c9d:2058:a344]) by
 SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn ([fe80::b0af:4c9d:2058:a344%6])
 with mapi id 15.20.7249.041; Fri, 8 Mar 2024 09:11:48 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
	Jack Zhu <jack.zhu@starfivetech.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG1lZGlhOiBzdGFnaW5nOiBtZWRpYTogc3RhcmZp?=
 =?utf-8?B?dmU6IGNhbXNzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFj?=
 =?utf-8?Q?k_returning_void?=
Thread-Topic: [PATCH] media: staging: media: starfive: camss: Convert to
 platform remove callback returning void
Thread-Index: AQHacTXgp1SP2yfnyUqNOOA6nZye6bEtjbWQ
Date: Fri, 8 Mar 2024 09:11:48 +0000
Message-ID:
 <SHXPR01MB06719D8714C431388BCCF1DFF227A@SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn>
References:
 <c43a9c68e64e3e8360174ae0c6706e46d3d40a11.1709886922.git.u.kleine-koenig@pengutronix.de>
In-Reply-To:
 <c43a9c68e64e3e8360174ae0c6706e46d3d40a11.1709886922.git.u.kleine-koenig@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0671:EE_|SHXPR01MB0848:EE_
x-ms-office365-filtering-correlation-id: 5741207d-5803-4f0c-f309-08dc3f4fc914
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 KIe3uA6gLzsveBlQPogjfdbQg5TN9qTjC409iXby1DOBS+KMRsOrhqBYrj9xJKJDRVZw8ZuCjZvqcGeU0Z9DMu5zBOwf2cmo+P5jS3UPxI9l5ksuzJRQ5z+FZQWIrNdUwOUHtiIO23nWoRf2JrpeiwkcptabfX/z1ScQp0wC8nreZXAhRbZ6RwlvD1qnae71ADyTTQyzquz3waeqV8c0DyJ4cV+ddvcDUl+k83Mawyie+ZlNX9d4xrv4+lexGfzXQEC0TA8PMV6511NoTpYNrJnJRGzstA9oo4qDAug0l+L5WzHX54AZ57DIiKOpfbyASciZ1MWghCGCpSgbgAi/sIlVEX7we3UwH7rgCyl8CCUj8pC/KuOC4FIKa7TnpPTOzQtOOFiQ8+xcUhq7yuQ/pmSzq5oI3mqK5QwOVWSwncOKF6ifGXIHcHyUrXYAfej56Nvor+RFg+KYmeBgHLRsY9I0d3f4Zxo2E4kaRP5PhSBI/gd7xkJX/Jn5iOC0wacReDUmdIQuhUcn2Ah3xpW1WIsJVIVmkZNGZwQkYHSC2110cVtKEpp9cCiweimDywQjRSXPGOVFj7jE1ziwY7SQItNe9V+TQkky7rAPtfxbXhd+aHBpjF2mGQpdcFyK7/Nb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QnlOV2M4WEZYbmsxZ0RUdDJVeWFJcm1OcWx5SWdvb0x6L09LYTVrYzIvQWp2?=
 =?utf-8?B?LytNdkhpcCs3QUNxc3V2VmtPc1ZCWG1pMEprR1ZyVTJRTjV0U3BMczhRVGcv?=
 =?utf-8?B?Tko5SGhVL3pTMktFWjJUYmFaOGtWM1psWlR5c2xPUVpKcTZWUUFxS1drYi8z?=
 =?utf-8?B?RmVJSlQyM0pHenVXSjNObk8vRE90cDBKWWhwbnBOZVVDT09RREgrVHVObVJ2?=
 =?utf-8?B?dFN5cUo0d3NUSXdUdWdMOWR4clNMRDdMdjNraS9TaDRxZ2VMVjUyeXNMTStx?=
 =?utf-8?B?d0VQbU9sYmd3TFhDRnFXS1NQM1BiSmFla3l0bFBQT2xXWjBqeFJPTk9CK1BM?=
 =?utf-8?B?ZFphc0dmWC9pN1ArdmdmK1ErK21URzBUa0VHcjlIdm15T25MNWhSMUZhVytW?=
 =?utf-8?B?cFBHTlNuQkhpb1FuK0hVWG42Qk0xUUdyNStGUUFBM0I2Nkh0UElqLzV0eU9U?=
 =?utf-8?B?T1ZYVTNlUzJKY1F1UFVRM0xVWUxMcVBWbFlhNmMxOVVwM3NKOHVjdGNzK2h5?=
 =?utf-8?B?cXY1MG40KzBoZWtEaFdaM2tsMCs4UDRTZ0k2eTUvcUVldzd2YUxUbi92cCtt?=
 =?utf-8?B?N000TW5Mek9lVndVN2VuSXN4eFpVeGtINldjU0ZyUjRFZWVZbTJoeW9VZU5q?=
 =?utf-8?B?SWhocFVaY2VMNkxSQ1NGUlgzU3RhdnQva0NxKzFlS0o1L1dmZEFWWElvM2JO?=
 =?utf-8?B?QUMwbTRJVmEyUUpCSWwwSzYweDE4RDVMcDVHN1B5Y21nWnFOUGpGUDg1NWhK?=
 =?utf-8?B?UGYyMXd5WHNjSkczcHcxNFZYQUV1Tjl2RlY0RE40ZDd5VUROZExyL3FhSTRL?=
 =?utf-8?B?dnhsbVdwcGM4Zm84aXg5bjJmUnBGODFvci9CVitJRlVlbHN3NFdubUNzZzl0?=
 =?utf-8?B?ZmM0azVvc0lEZlRBRk0vV2laYm4rbElTRklUMnVoRlVGSDJpRnNuMWZrY2hs?=
 =?utf-8?B?ZTV2d2JzMVFDMWhpWVJHdERmRU4rZDY5WktwQ0lmbFFBYnByTm5ZRGdITkQr?=
 =?utf-8?B?QTJzVktkMUlkNkRrSWhSMGhlRWF2RHp4aFMrSTR0bWVPMG5wZy9IU3RlTEh4?=
 =?utf-8?B?bWlGbHlhTW5Nbk1YWlkwNld4dDNmSm1ROGtrcmczdytLbG95Q0QvdFg3Q3JI?=
 =?utf-8?B?UlFvYSszU01HSG5GeFNJdHdLSjljZXE0U2p1N21nZjF2SUxhUndaTEIvc3dT?=
 =?utf-8?B?ZjRMNG5vSGN5blZZNTFEQUluUlpQVENqMkgyUHFqcnByRDNFQXB3OEJBc1F4?=
 =?utf-8?B?UjFscmFxbndYaSswQ1pIaVc3dGpSaTgyWk5acHNsYURCSEsrR3ZIU1M4TGVw?=
 =?utf-8?B?ME1XVFAxdnpQUEtsdTZQeXZiM0MvRjk2a2xXc1hKbEtwRTFyUmlvYjAzYWFz?=
 =?utf-8?B?K2gwTzdXbjZaYkVLYURCLzlyajhHMitzUk1nVmp3ei9MandUb2grYWpkeHZs?=
 =?utf-8?B?VXdUcnl0OThlVnQzRVhxQUVXYVZtT3NLalUzUGJHL0ljeURBV1FOSEpSSUFW?=
 =?utf-8?B?akRGekZ4K2o5MUNOK3NURldpRVNyekZlTGFvSUtVQUpQOUY1by92TlJhWWdD?=
 =?utf-8?B?NVBmb05nSEkyVHVCVmc2eU1MQzA2SHU5ZGFQRzhsdzZEVmdmWVE3SVp6bXBj?=
 =?utf-8?B?dzd5LzYvQ0JMUWpFQXlMb09DWFFKZk1mV1ViZEY5ZFV4cmx0STNjcGErUVYy?=
 =?utf-8?B?N3ZBWGFaTDduaG5Fek1abTBwZGszdFhIeUYyY3BncDRiNXc4Z2VyaG5DKzE2?=
 =?utf-8?B?aTZZc2E5TFFqdU9xb2E1NXhsVy83cnk2dGM3cE9GY1J0V1FjTUVtd2JEZTY5?=
 =?utf-8?B?UEdtK1VUZ3dubW5xcmh1UUlOL3VhT1JXWGMvcVo5SWVEZXlVMldZaHBOY3di?=
 =?utf-8?B?TEpwNWJJWE8yZHNJUUxjY281NXNsRVhqMDRuYVpwQ1FBWjZyUlErOFJadjl3?=
 =?utf-8?B?ejIyL04rZ1JDNktkc1c5dWl1bUNoa1phSmpDNUFMcHB0a2VYdXdwQ0JSQWZV?=
 =?utf-8?B?K0MwUnROTjE2cDFYcjVFWVpsMHluRTFUZjcxWDhtWXQzR2dVeHRlK0s3empS?=
 =?utf-8?B?dFFGaU14VitVL21HTE9zRS9paURtMmtSWWJuNUZFV3UzMUN2eVp6ckg5RmE2?=
 =?utf-8?B?Q2VtOVk1eTNoQnYzdXBuUngrNVZOQk1BeXhUcDErWERtM1h3d29vRmNuallL?=
 =?utf-8?B?ckE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0671.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 5741207d-5803-4f0c-f309-08dc3f4fc914
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 09:11:48.7864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2K6k96u7GK5QfZCT+EyZ9QV8jK2yJGbYKTmHCFaMJZnQpFk7TvmzyFh2R0//LIRw94n3y1VnH4HuZAiOd2AlHKQRDbyGsJuDkhoc5ziA/1tWqHqenH0yjCoFuXMrXdyq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0848

SGksIFV3ZQ0KDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQoNCj4gW1BBVENIXSBtZWRpYTogc3Rh
Z2luZzogbWVkaWE6IHN0YXJmaXZlOiBjYW1zczogQ29udmVydCB0byBwbGF0Zm9ybQ0KPiByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQNCj4gDQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sg
Zm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzIG1hbnkNCj4g
ZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBo
YW5kbGluZyBieSByZXR1cm5pbmcNCj4gYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUg
cmV0dXJuZWQgaXMgaWdub3JlZCAoYXBhcnQgZnJvbSBlbWl0dGluZyBhDQo+IHdhcm5pbmcpIGFu
ZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLg0KPiANCj4gVG8gaW1w
cm92ZSBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybiB2b2lkLiBJbg0KPiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJz
IGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSwgd2hpY2gNCj4gYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKQ0KPiB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLg0KPiANCj4gVHJpdmlhbGx5
IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJl
bW92ZSBjYWxsYmFjaw0KPiB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0
Zi1jYW1zcy5jIHwgNiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlh
L3N0YXJmaXZlL2NhbXNzL3N0Zi1jYW1zcy5jDQo+IGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0
YXJmaXZlL2NhbXNzL3N0Zi1jYW1zcy5jDQo+IGluZGV4IGE1ODdmODYwMTAxYS4uZjk2MTNjMmM5
ZGZlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mv
c3RmLWNhbXNzLmMNCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNz
L3N0Zi1jYW1zcy5jDQo+IEBAIC0zNTUsNyArMzU1LDcgQEAgc3RhdGljIGludCBzdGZjYW1zc19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgICoNCj4gICAqIEFsd2F5
cyByZXR1cm5zIDAuDQoNClRoZSBhbm5vdGF0aW9uIGZyb20gaGVyZSBjYW4gYmUgcmVtb3ZlZC4N
Cg0KUmV2aWV3ZWQtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZp
dmV0ZWNoLmNvbT4NCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

