Return-Path: <linux-media+bounces-13880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 207389118F0
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 05:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEF9E2849B0
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 03:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573DB126F02;
	Fri, 21 Jun 2024 03:14:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2130.outbound.protection.partner.outlook.cn [139.219.146.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0724224DC;
	Fri, 21 Jun 2024 03:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718939698; cv=fail; b=m4yDtd4dD4O1RVqHcGIHXjqa/nsNcJa8Zx/FNUAH1TIAYleu6yrcHe6mg7XUKgREAjX/9TqoNun8tba0sfNEHIq1Y3dJepB1Nx4sipnNiJWFgrLfwJKZCsI730tfI7pmBgML6qB00Kd/OySa3SkVMtOGt+Soh01C/cUPHe9jVpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718939698; c=relaxed/simple;
	bh=js7a7qTF6vGhrQS4+8/fDdp5x82pybHYHH8L7YiNlzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FkLRdlSKkCCb+2C2X22XlkuJXYdJm+TCXg+EC+2A2YYXyNVrMtVhoz5Di/Rl4tZJCu35PFFsz3q4SfTVqp5D8WpSo+yxMAY2ZVJxxDvMishbSogkl7WbIaGPzRodWoV0S5/j3KlMUQ6EMJ0mjzGCztRIlvxTMCcLe3aGVDXTYcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS1UhC6CtIqSpI+xm+9xvaA2squM+ht5PuZi87G/bbdVufuLzbdty7R1qQWjiV4oUSj4aQnxbh52sUaOj85Z+MxTy2gSHLXgkfTbyBG0IMvV1xIVOky0QLUKFL+Cg6owzWyh0ymm144G8I0d+vtup3Zaw+qG6Q1bgNHdrX3+iFQ05X2GM+CuDhz7wjLGrSXD749urw8QcesqP1z3MRE14zAFoA9F8nWXhIB6o9LpuSDJ2Q8cga+SzpP2OUGwLV1ddtduS/ayCro9o5N92v4uFJt93t4b/5eQT4xGvBn/LZwRRJPG6AhKmyc8VcunkkgYUvNBAGUQb54PYUKWh302gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=js7a7qTF6vGhrQS4+8/fDdp5x82pybHYHH8L7YiNlzI=;
 b=Y5a+2yDjDwZqfbqWkx8W+Pxk0z0ciuq8/ZGKI6FER7GDVB8EOzw6KI+d87WVBU0d83rEe88NiBr/oXCBz9Cv1meQaJ8Enw7YZelZJt+SDlXs6Ex2V6STinDR+5D8O78X8rho2G5wG8b6R2tV4vkqo0csXERQZ6o7UuZBXwfsDz9fkF2HGCsge2WuPM4CpWFtZlKMZCBYebC5jFtp+TJu78r6Jw0sGn7PnhTu+DnSsiGrt8f7CPQ1GEIk0OMZTMut8A2kaGqNvc9BKIF+3Rd1RaIFQyGZip1/1fJik0YIyaNYjLb4UAX7JLyxFaThoB7Ju2ylnMdlQzFKjbbaZj52og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33; Fri, 21 Jun
 2024 01:41:41 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::4d66:ac5e:3903:cdf5]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::4d66:ac5e:3903:cdf5%4])
 with mapi id 15.20.7656.033; Fri, 21 Jun 2024 01:41:41 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Marvin Lin <milkfafa@gmail.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjQgMDgvMTNdIHN0YWdpbmc6IG1lZGlhOiBzdGFy?=
 =?utf-8?Q?five:_Add_for_StarFive_ISP_3A_SC?=
Thread-Topic: [PATCH v4 08/13] staging: media: starfive: Add for StarFive ISP
 3A SC
Thread-Index: AQHahOSawdmUtagK2Eiyr8mx7nkYE7HRCieAgADjzfA=
Date: Fri, 21 Jun 2024 01:41:41 +0000
Message-ID:
 <ZQ0PR01MB1302942ADDEE849AA741B202F2C92@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
 <20240402100011.13480-9-changhuang.liang@starfivetech.com>
 <94acc95a-c0cc-4ec1-836f-bedbd46b73cd@xs4all.nl>
In-Reply-To: <94acc95a-c0cc-4ec1-836f-bedbd46b73cd@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1047:EE_
x-ms-office365-filtering-correlation-id: 8c32f2a5-a470-47c2-811c-08dc91934cfc
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|41320700010|366013|7416011|921017|38070700015;
x-microsoft-antispam-message-info:
 H3Ora3NI6VUFZKCIGf0qSj20zT788d8gAI2AkHxGEmCY82YplqjKaM1BV3SH53CoPDI0Bf2qbaOYjI8TeKnkCJZ5nL95PCH1vgMtD3/BKyFRTtKUgryHHQUOPArd7poscFXVjbwLk0D4ahegkpbyhYTw7n+xJcg8TeQbVB+PBeRfOPZJOo3yA/x2lJKdECDYvl86HPN2goETh4JQQwXgy/2tqobJbqnaHhB9GQ72pSTuxHDoR34v5GK+WzMY3YS96reIFosuy/qum0S2+PZcMRU9LFnv92iqwgPOSbBzzLUarrlVo1gsUfaFhKCoxQEyn9GuJiwrNHHinZrNu911Z/i29G2ki5gB9JcL5hHd3gtSghdRWdRXSi/XOZpgtOpNTqTkj+1/3zT0w3bftoDIJPeFYiEc2J+CcD+zse/0FiUXe4YvVq3OFXPryl4ObdSyEbN+FgReL26wMLYoapkR5vW/MWkzpcf7r93dRTOXRAo70bdytrSwGfkbWQ9M7V+Y09rZqyRxUJT+2P9b4nTrElkKGxjKMRkWA8dRKwce2OTFShJG0zJO3UjktU8WLr/YgbNkUFYYYZmPLKHDZzbjnhZcY7PTgJf9Wd57p5P5B0XHmkSrbO7aoiYUNJxdApyG+yKw14RXC47BpSTfezzqJQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(41320700010)(366013)(7416011)(921017)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TzFCbHFNYjc1Uk1pZHFsSXVTdHdZeXNna3BtNDJKcWVJcXVSaDNyeDdLcFNo?=
 =?utf-8?B?ZFFHV0hPcEZTTGFmMi9hZnZnaDlNQWhpaEV3MXhOMWpMb3lnYkZHNVpOaHhj?=
 =?utf-8?B?dFpGZ3RYQ2pKbnVDQ3R1VkcwQWxlTVd2TnAzN2lKZFRXM3RycFBoenUyQ01Y?=
 =?utf-8?B?cFgvNnkrQVpqdWRuR0kzb25CRk1iUzliamE2UlRzTUJnMDN1OXhkeDlOMFhZ?=
 =?utf-8?B?WFQrMEcxZW9FZ1pFVm00cnluR0hDR0hiSDJWb2E2S2dLbUNJSmVjODJJYm92?=
 =?utf-8?B?S0tsL2lsRE8xMUhBTml1M21PVE15ZmVuT3FYaHBvVXRHcVdZMkY0L1dvOVNJ?=
 =?utf-8?B?MXhUcDdsZytSVCtQa01xeWxrV05aTkNXSzczbUNXclhpVk5obFlBNGRNSFcv?=
 =?utf-8?B?Zk1vMDZGQ25ZSXoyVzc0Y1M1dWdQUEh5VUltck8xeDUxbzhSQkNBYzB2ZUN4?=
 =?utf-8?B?blpxUUM1eGp1SS9CMG1zb1EzNVh5bkdlR1JibStMdFJwL0I4V1VjTzNiajRn?=
 =?utf-8?B?c0ovR3NZdUprMDBtcG5yVE9ZWlNJaU1KeUFlQXB4dk9pT0J4c1haWFdySkUx?=
 =?utf-8?B?YzNaKzFWbU9XbUFMY0RDZXhoSEFsT05lV0lLZWN1bWN4WGZNZ0hGWk9Sb3lC?=
 =?utf-8?B?eFMvQWtIb3V3bmE1bTJjeUV3NndXaVY4anNjU3hKWlVRVUpFVXFObXR2dHI1?=
 =?utf-8?B?SC9UQjM1SzJDQ01acFcwS0tpV2w4UmRrN1Z2amo3NTQ2dFNTenZ5NUtJWW1n?=
 =?utf-8?B?bDl0YVAwSGZGK0VZd3Jjc0d1YzR0YzB5b0FWb1lHN1UrOW1SNnZqSDJPdUlx?=
 =?utf-8?B?Rjk0VGZ3K1E5eU1BOWk5M2ZhM3B5OVpZYXAyUDkrVkt6dFBjYW1VZzFjWWVT?=
 =?utf-8?B?ZnlkYTA2KzRJYVBWRTBXM2lhWWF5dnVqVTZtWHhHb29UREp2YjBXeFpBN0Js?=
 =?utf-8?B?VEVBY24zNzMrRWhUWWhoN20yc3BveFhnKzZ6OUx6SGJ3RHdtQUoybjVNL3dJ?=
 =?utf-8?B?WTZhd1VrbXJveG5yWUtES2M3QzMxRFJYNUZvZkwza2FpUFNydWpObVhmODB1?=
 =?utf-8?B?anRNcHhwNkVyeTFPeVJYQ2x0ZWxldHNEZHBwOHl5bVdLcm0xVFoyWU9JeEk4?=
 =?utf-8?B?dE0yVG5zL21kZzllSmVIbHNvcENYQ1B2aGxPWGF5SFlTSVZyS0pWMUduNjM1?=
 =?utf-8?B?S3R6dHpNelRoQk9PRXdzV25ITlB0RWxMWlZaYXJ4cmw5SUtFa0FBZjcxWVN0?=
 =?utf-8?B?dVEyU1JJamppNE9ORUhGaHV6b1B6RVZSY0dFSitycEZucmhwc2pYSVordkRv?=
 =?utf-8?B?UzZzcEVSNHNjNFd1L1JETk1LN3lYemE5SzAzdUVnNFozS1JXV3BkYjM5OHZ3?=
 =?utf-8?B?VjExOVZjaVgxWFZFcFo5T21IZG1FSngxY1RGdUNibzFJSUJUVFNMN29HVzRu?=
 =?utf-8?B?a3VHNW9lT2NLTEdtQXk3d0xrb2pEYzBHYUY3TjVZOVFOK01PdkJoRVVYV3BV?=
 =?utf-8?B?RVdBWHh2RzU5bkZDaXNlWG55dUtFaU5HeTRhc0orOCtCYnJnUzF0Wm14Zm1K?=
 =?utf-8?B?dFZEOFUxTVo1NWRVYjh2ZFl0VzFtcXVJUHJHVUJDNFk2OTN4cmNRaGhaSFgz?=
 =?utf-8?B?ZWV6VWYxRG55ZlFJdkowNnFtQ0xkdHFDRGgzcWIyQ0tUaXlTSkNNK2ZMUjIy?=
 =?utf-8?B?TVFGa25kWlgyeHdhTk53cXpqb2hqVzFyWlU3b0svanBFRjJ2bCtnUUdrU1Fm?=
 =?utf-8?B?a1RhRkxTZkozUmttNnJXdG5IU1pNL0J5U1lEMGhsKzJYYkkxM05ROEltRXNW?=
 =?utf-8?B?NnFjQmF2V2ZwRXNpT0VPcU9Qb2crRmxDRUdjYWZHTlRUUjl3Z2lJamQzM1pC?=
 =?utf-8?B?aFJXd3dSWjNMSzNoSVNURUo3bmpCVnNaemFhRndxKzl2QlRxNmhpWVNsNHE2?=
 =?utf-8?B?czl2ZFA5SEYwZU9ZNDFTQWZib3B5U2dmQVdNL1V6Z3ZlRU5hQ3ZEcFd4d3d3?=
 =?utf-8?B?dGVmZGxYV1l4VWlvOVZ6NVpXdlQrMENueGtqTFIzTE9CcFdYSXRpUWNBRkNz?=
 =?utf-8?B?Z3NwOXRJTDZjeFpCU0VrdUJVNHdZeHllQnQrQjhtaVBqL3ZJQzNtUHRTMjJS?=
 =?utf-8?B?MXJYdHpuSW1tMmZWdnY2WDVvU3NmZ3lqM2xONE5qVERCVi9rei9VODljOGRT?=
 =?utf-8?B?WVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c32f2a5-a470-47c2-811c-08dc91934cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 01:41:41.7541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8YIPrsw2dzLLBdgFqMI55iBPmh+kYENvKCyBJJ426/6OE5YmfXfoA1Ammb7SypoQVFco5UuxeIAGXGPtzuAEIYdbhP8GTX9k5XHmHu5ZY8sB+R1P6eL+CGeZeLPUUmy8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1047

SGksIEhhbnMsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50DQoNClsuLi5dDQo+ID4gK3N0YXRp
YyBpbnQgdmlkZW9fc2NkX3F1ZXVlX3NldHVwKHN0cnVjdCB2YjJfcXVldWUgKnEsDQo+ID4gKwkJ
CQkgdW5zaWduZWQgaW50ICpudW1fYnVmZmVycywNCj4gPiArCQkJCSB1bnNpZ25lZCBpbnQgKm51
bV9wbGFuZXMsDQo+ID4gKwkJCQkgdW5zaWduZWQgaW50IHNpemVzW10sDQo+ID4gKwkJCQkgc3Ry
dWN0IGRldmljZSAqYWxsb2NfZGV2c1tdKQ0KPiA+ICt7DQo+IA0KPiBUaGlzIHN0aWxsIG5lZWRz
Og0KPiANCj4gICAgICAgICBpZiAoKm5wbGFuZXMpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
c2l6ZXNbMF0gPCBzaXplb2Yoc3RydWN0IGpoNzExMF9pc3Bfc2NfYnVmZmVyKSA/DQo+IC1FSU5W
QUwgOiAwOw0KPiANCg0KV2lsbCBhZGQgdGhpcy4NCg0KPiBmb3IgcHJvcGVyIFZJRElPQ19DUkVB
VEVCVUZTIHN1cHBvcnQuDQo+IA0KPiBPdGhlcndpc2UgdGhpcyB3aWxsIHByb2JhYmx5IGZhaWwg
d2l0aCAndjRsMi1jb21wbGlhbmNlIC1zJy4NCj4gDQpbLi4uXQ0KDQpSZWdhcmRzLA0KQ2hhbmdo
dWFuZw0K

