Return-Path: <linux-media+bounces-17187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4296559F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 05:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E098B2395F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 03:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16420EEC3;
	Fri, 30 Aug 2024 03:18:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594113632B
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 03:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724987912; cv=fail; b=NYsAm8fqh+wnN680y+pOhINf72/+uk5PUPoMmrzvyBukhA7EQCF/zVDTIUl7I7x8ZUz8NYXnaz0dEj9/+cl5qDVZKvxT35d+1v1k6zv5T3turjwqGIalBnttZbb+fhvDgc7ketSOwxLyTq3MfcVJweNin+x7kbTmTMDKOoIFj1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724987912; c=relaxed/simple;
	bh=qCrhYMOZFkG8BehMW5q00wrwliiZBU8QA+eMmtK0ivk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cE4vFHPa+NNOx7XkHkU33AKUQrMvpErzPijkbRNjRjgdRvHqtILLUyyA59QGjPspa5TeXG+41qXugsmC+dqxlEcQpG8scMEcCIdzR6wXUHKKGnPIciKzYU4oMArMMMCdGROgEkaLiStBHVEsJ+3LVgKAB5mShnJSEG/2ndaLgV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZkzwSQSuHEfI6ORQp1Px2wlG5ZZ+3+y9tF7CeLrHHOZrKYWSVri5xio0r8eB7J0ANmfHZNzVvyRCfRMk/WPipumNljs9nwD/RpUQ53G6zqODph38IsQaaDE1ls+RJi8jG5zAjP0lrZLj1uCSYR8FZNv+Np48xCfpXmRQEQh4dgNG85Rea9RUzRHdbLGlIEOvTsKG++KxN3iXL/PuODFftD+rBo63zztpH1DbGEcQh32qzHUCqgSv8nr2CzULr17JdPCZaVnvOyfvE64b91HodeXqtPliZyNUirogzDz6NWuS+jSt209+n694I6d/8/VODdA7MnZU52rXU5cbk+Mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCrhYMOZFkG8BehMW5q00wrwliiZBU8QA+eMmtK0ivk=;
 b=UNb5ylgC8Epl5s+q6qLa8QdXZ/uSNvoNeLAqPLMlteDhg92gyDuYZqEqd4m6mb3BQGF5JYS3BG+j8wHxy6i7ucqsgy/v8KA3WycEB1tpDlXYe4H2DoX2bzNPAoHnpS+UMRx0M5DjAPWSPbkdALnR7EV7hEHCu5Q//I3CzgFPk0Il4Antnv2m2o5NfAyt7uKZIVQBJ78SHB/AbQGO/MZ2G8yH1AtbjvPiQn3QE+nOABCLXAI2AytZ03IPv/kqPGlIGPUJWTe1ASCgvGkbb1PUyTpViM4Z/5rMoN7sLdrB8QZAHEZuCOYz7Q8QPKSVVbMuREtUyiTWrsxauZNMkzgMww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1238.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.29; Fri, 30 Aug
 2024 02:44:26 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%4])
 with mapi id 15.20.7897.028; Fri, 30 Aug 2024 02:44:26 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: "zhangzekun (A)" <zhangzekun11@huawei.com>
CC: "hdegoede@redhat.com" <hdegoede@redhat.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG1lZGlhOiBhdG9taXNwOiBSZW1vdmUgdW51c2Vk?=
 =?utf-8?Q?_declartions?=
Thread-Topic: [PATCH] media: atomisp: Remove unused declartions
Thread-Index: AQHa+hMy0UJOlkAFj0eFCfwxgdx//LI/C02AgAAM6KA=
Date: Fri, 30 Aug 2024 02:44:26 +0000
Message-ID:
 <ZQ0PR01MB1302E70E237F8DCDB9709B70F2972@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240827071122.26706-1-zhangzekun11@huawei.com>
 <20240829125845.708915-1-changhuang.liang@starfivetech.com>
 <4bc13d33-90a6-4780-9c63-a72dca3d4f15@huawei.com>
In-Reply-To: <4bc13d33-90a6-4780-9c63-a72dca3d4f15@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1238:EE_
x-ms-office365-filtering-correlation-id: 3ed9dd1c-8ebf-49c3-6cff-08dcc89da9d9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 hX3iaq+2hrw+jMUsQL7gwFRfWJIYSR2iGKFHmDbcNrBBTrGX97NGshAosb1MDw2hzAn7ZEfmYuSRUxYZn/oTJTXnlDMuc7CHuY3nkY4lpJP6P9i6lyQ70sEfgxVRv5o7tayhA+2Sm0wcu7t/rP7ugJQPV0i/CpG77YOMO/jrVs9VBzxsgTdoiobfxUqyA2MJMZA0rVWWafwD7DAsHF0ONqcGiDX0ZXnb8I+lEx9M31pozDeHVJrcZJtNTAuhGYUIwzcduaziCuuDij+Ub2iNvr+sMkZFTp79F2X5brOZldDKKQCG96XQGfw5cmkx2H+TS1WpTiT+GANHOs0ZOwtVDqkJ9XUvb2JIz1pcJBc3lEKoezrpCNXUvMlX120Xqq/x/yI81XaCHc7vAWrhd/JBhg5OMTZKU75mclavnGbRmhokuQ6ovyK5AdMdyEd+V38sbLZdHffZZxw5ByGjZwIMF24eOEOosY88uRogSKaHBya0nhwqnNW6n3gggmSwduRycuSy+L2lU2rf7qhdgudSvqIsPIkod1qIgHD3yk45rNBRQDeZ/jBD7rgejnR5fWqsiURBpntTbuKNx5fr3CGSe+tdoqTJkWRRoMkBcdnjOo/IbIuvHzBgZvOpXXIkEgZa
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MGU4aTRjYkFlNkNKZFV2eGtiQVdNS2grc25ja2RWK3BBTHdKM2RIOWtTdmtX?=
 =?utf-8?B?OG9jazUzbnJOOHBmR2ZtTm1kSmtENndrb1V4VnVVMnZGbFhFTGk2NTRqM3k5?=
 =?utf-8?B?Y0haMXhiM3pLRkZJZTVQMC9wT2d5Q2Z1dGJTS2krY09Bb0cyUTZJemEyRTVB?=
 =?utf-8?B?eDVIaFJMZkFyeXVBOW45WUFBMkFaZEJtN2czaGV1ZitTWmE3YlJNb0I4OUFG?=
 =?utf-8?B?N1pCMFFCVnJibXI5UGhBSHVOTFMrcThmU1piYk13anhuWTU1UFRvUW1MSHNj?=
 =?utf-8?B?OUcwRGZsRmZNZFdyaWRxcXUzaWZEd0FBN3hha0NLcCsyRmhMMm1rNTdWd01s?=
 =?utf-8?B?M3o3YlZoVWxrRUZ1WTRrOURRMzBuZm9xL0I0bTBMSlZIcmprS3ZvZ3drTCtG?=
 =?utf-8?B?RTBISGlsRVViREh2VytBTjE2ZGpKaWF6SzZxL2dkWVZNL3FhOUwvbUN5TlF2?=
 =?utf-8?B?eXZxMVRja1pqWi94SFdGYXJ2dDVYK2NjMHNHYVkxRTNQWkx6YW9Zd092dHEx?=
 =?utf-8?B?Smx2MWhLSVErT0JHMGMvUExiQlJMQnBReVJ2QVZ1UUpTb2JoNkg1OFA1dkhE?=
 =?utf-8?B?bmpSZkl2NDN4UU9HYm1TdllHU0pKRmF3SHZpbWVycGNYRmxZMTNxRTlkUW9I?=
 =?utf-8?B?MzBUREJESUpjaVo3UUVHM3ZnMmk5N29yK2pYZ2VuZWV1NXZ3MlFmdkp1YjN6?=
 =?utf-8?B?ZGZHdlhUditRRGUrbE50eUdKaDlEQ2JZNlBuRmtNQUw5dDhtaVMxTGdsbjRY?=
 =?utf-8?B?d1QybGV3M3BaUlVLUllEU0xNdFgwd1F2NTV0OTFPQU1aZTBqR25PRVQyQzFS?=
 =?utf-8?B?eDQ1OVZaTW81V1NrdnZST2FFSFo0Y1BYek1ZRkw2cUFHQmkxWEw1TWVjSkNO?=
 =?utf-8?B?RWdJSmxGRGhtMmh2MmFSWndsVnE5K2xrSi9hM3pLMVZGYTlTd3RjVWdIYnd5?=
 =?utf-8?B?WC9GZncyaTNYaHZMbFU3ZTQra01rVVlCd0dxSHI1ZHZmUzQ3ODlqTUtJZ0VS?=
 =?utf-8?B?c2xWQUlTbUU2RkhNeTd0R0ZOcm5ybkRBSlNOYm12UjlSb0xwWWJkRG1YcFNT?=
 =?utf-8?B?VmUxZ05JeTFRd0FMVCtIbnNJMldTZXpnRnZuOFVETDlRWCtDWGhDbHZ2NUVs?=
 =?utf-8?B?MGhHSDNNZUx5ZUhrVEp1eG5LWG1mRmJ6V2d1VS94WjhPSG5RaUhJREV2YjJT?=
 =?utf-8?B?QytFalU5NXEyNlJGWVFZNlJkek1vWXB5aWh4TnFEMTlyQ0pjMDVwZ3RDK0JC?=
 =?utf-8?B?c21zRUl0ZXRHT3p5UzEzY0hLYkJJR0hLTEFtbWlVTkJ4TWc1Nk42M0ZUTDJK?=
 =?utf-8?B?WTB3b1lWMTlieU1QS3FXY0E1ci83WnhzNm4wYldvSFNrVTJZZnFlYXVBWTJE?=
 =?utf-8?B?dW1jeWJiTS9DMkFDTXY1eE5OellIanlnRXZQb1RMWnJJVnpsRlNXS3VIWFIv?=
 =?utf-8?B?bzF0OS9EMmdMcTRvYVRla3d4Sy9KdFd5WTJIRzBzRWxUNkFqVEpLRWhMQzF2?=
 =?utf-8?B?OTd1NUZhclJ1Nmh0bW9DVnU1Z3hvMmtISFlSTlRMOEsvRDh4Y2xjVEJZNS90?=
 =?utf-8?B?M1FoZ1BLYVFFaWdqeTlRV1F5TGhXOHp1T3pnamFiMk1oa0tqN29OalFwU3Jo?=
 =?utf-8?B?UVFhamt5TU1yVUlZVWcwc3VDbmhyVGN3YmxsRGZCTEh0bW5aa1FBV09OT3Ra?=
 =?utf-8?B?Y2RNY1hxYnF2SDk0UkFFcGNwTDNoSEdzN1JsMHVndlg1ejJOYlYweG9hU1VP?=
 =?utf-8?B?ZWtISzAwUzBqQlVITFJ0OHovT1hIY0VodU1BL2VmVWZoWk1lRGNQTlhpUWd3?=
 =?utf-8?B?aDhPUHdxbHNtbVRzYUtDR0xkZlRaZUwxOHlpYU43ME9LcE5VWlJjalpHeDNo?=
 =?utf-8?B?Q1NOYkdKL0RrdlczY29UeVlTU1AzR1JYcmdiRlV3L3VBdE4yYk1Mbyt4VGli?=
 =?utf-8?B?cHRvd0VMcEJLMjRXelZlQ1NYWVNjVFh1bmpnbCs1VlIwbjdOM0FnQndOZGxi?=
 =?utf-8?B?YnlFcXhQVjQ3aEdDMmt4R0VoQ1R0NU5uV0V2Tm8rcEYwdWRLU0dGc2pDUmJS?=
 =?utf-8?B?Z1dGQmNJOTBaWGJQdUdRTG56YitTZFVHSVM4WWlHbUQ2Rkt4ZnFqajUzdjVZ?=
 =?utf-8?B?MGNyY3YxdHhzU093Sk16bU5hWmgrR0VkKzRmRFZqRnFEUTFFZ2wzLzVqWWZH?=
 =?utf-8?B?VFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed9dd1c-8ebf-49c3-6cff-08dcc89da9d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 02:44:26.4245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rI/fNYG7TZ9j0l4iMiFnCxYwg2jgOYzyO9ih1ZVi77eX+Tbiiec+usN0zS/U38ifXppmCrCNFCOQSWLQkG4No+bIOySOYnyZd4vgHLalejrZgC7xcNms9rAqKK9b0gHJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1238

SGksIFpla3VuDQoNCj4gPiBIaSwgWmVrdW4NCj4gPg0KPiA+PiB2NGwyX2dldF9hY3BpX3NlbnNv
cl9pbmZvKCkgaGFzIGJlZW4gcmVtb3ZlZCBzaW5jZSBjb21taXQNCj4gPj4gZDgwYmU2YTEwY2Qz
DQo+ID4+ICgibWVkaWE6IGF0b21pc3A6IERyb3AgdjRsMl9nZXRfYWNwaV9zZW5zb3JfaW5mbygp
IGZ1bmN0aW9uIiksIHJlbWFpbg0KPiA+PiB0aGUgZGVjbGFyYXRpb25zIHVudG91Y2hlZCBpbiB0
aGUgaGVhZGVyIGZpbGVzLiBTbywgbGV0J3MgcmVtb3ZlDQo+ID4+IHRoZXNlIHVudXNlZCBkZWNs
YXJ0aW9ucy4NCj4gPj4NCg0KQWxzbyANCmhlYWRlciBmaWxlcyA9PiBoZWFkZXIgZmlsZQ0KDQo+
ID4NCj4gPiBZb3UganVzdCByZW1vdmUgb25lIGRlY2xhcnRpb24uDQo+ID4gT3I6DQo+ID4gZGVj
bGFydGlvbnMgPT4gZGVjbGFydGlvbi4NCj4gPiB0aGVzZSA9PiB0aGlzLg0KPiA+DQoNCkJlc3Qg
UmVnYXJkcywNCkNoYW5naHVhbmcNCg0K

