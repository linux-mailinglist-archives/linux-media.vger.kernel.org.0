Return-Path: <linux-media+bounces-16131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33694EA98
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 12:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CACE2819E8
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 10:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F4F16EBFE;
	Mon, 12 Aug 2024 10:17:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2134.outbound.protection.partner.outlook.cn [139.219.17.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6671733C7;
	Mon, 12 Aug 2024 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723457860; cv=fail; b=BGPnCa+EbfTuvEquNsPPrsX3kyYmXDLcb8oJrLrPeTaz3eJZnurq9sc9GlNa7yINoWFOq9nauVIAW6TavKl8amVmzYNPv5fq4NdZgj8phzm/HHBFH/RphxufGJvc1fO/S0F18LtwPtlRB+bCSLcRfdNPvcElBU2tbGqZR5pTgG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723457860; c=relaxed/simple;
	bh=nhXChEo+V2di/YZ9XBFv8kQ9ofOqd5wtiFXvmNfONbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=himYdHKefJ1Q32tBECiMnIf6Or3zVndRsLdZJYVvMoJ0DCj5VhHKg+g6Y2i18Jh9y1QfPlGWrtswGSAuRC1emzDEb9ZJm8YQ0dgnolEsL4KVIvtxpFAP9t/mNLogRudyLc0l3jUGNkzqGw7NqSuEAm4qksIw/eEi6GCq4erTGys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/pmbu1BoXmvX/siXsthtRAxiMBhA5dOkeCC9mf2oF8hw95eCe2fgXRqCRow/fzjmveFlrMqI3VH/w1QdAO9Lnmg31ScvSS2HFA7ZdukDcZTcO8KwSrXZZec9gJtw9xHxBI9VJ6geS4zKWF5IYxxA970hQdGo8GTkVtRKbXrJ1fU0cCK2W5pvRHF7pWs/Vysjd20kMlwOKMwdRbvvnt7CVd579vlGtk1HtC2uDRqP7ejJZrp5m9Jeq2/0PR1GBHzMWFLwS49c3KxXpioDMZYZFKn81N1sSP4MDMpdwU6N0R17iaa+elaDXUdtC/VRm1as8uzoQ/ETVRv1uh6CvdZug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhXChEo+V2di/YZ9XBFv8kQ9ofOqd5wtiFXvmNfONbQ=;
 b=nIi0ZFATLi6KjqBQEAb226f9W7aLHwXZfPtucogwbKKXSPTVIbkoZ9oCA4fA7GXuIskmKg/+Dpivcos24fNhK+r0ag8Sj1q9PBC7GzJpfaHUkIsdmbyAfxw6FS6O20+vVZ3xv16hYn4mSpisjiNhcPwHfWBRDH1Bi07JwdjTPGVmUCdDd3F5+hgqDh0ewTrnOPM3+xe24ukTA8mdMTklRoHJ7B+iv75mF6yfzPK4xJjCxT+2PA0yYy6RO/oYY532mXt3pLOPSP0abcf2Kt9esqqS5BpDy31m7kUchlbP+DAcjkINB7oXbxQn0gUXI2+FJw+VWig4DhIGewlhnHJz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1239.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Mon, 12 Aug
 2024 09:43:47 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.031; Mon, 12 Aug 2024 09:43:47 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gc3RhZ2luZzogbWVkaWE6IHN0YXJm?=
 =?utf-8?Q?ive:_Add_multiple_resolution_support?=
Thread-Topic:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHN0YWdpbmc6IG1lZGlhOiBzdGFyZml2ZTogQWRk?=
 =?utf-8?Q?_multiple_resolution_support?=
Thread-Index: AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfYLwAgAAkcMCAABXlAIAEdWGw
Date: Mon, 12 Aug 2024 09:43:47 +0000
Message-ID:
 <ZQ0PR01MB13029DA731711FAA57BD13A4F2852@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
 <20240809132624.GB1435@pendragon.ideasonboard.com>
In-Reply-To: <20240809132624.GB1435@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1239:EE_
x-ms-office365-filtering-correlation-id: 0f1251a5-80d9-4d43-3e3c-08dcbab343bb
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 lp7EUIp1rbo6YBbqN0DR+g0AxibjrzYyMuGvoY7Av134YDf01aIPkiKYBZnVKsYW5jw8dODd3QO9ZZ3YgIAk2D9kg1KBO9BZebmJJZKMcqwGukx9gi7kvihbod6Y60NtKgsn99VoxZrrF1dm7Y3Mh0RyIv7j6PDCm3xgqdyuLZlDhJwG4KtETJbxt7BzdMNfszGtsBlf+vHN/nWCogUsnoNrKRz29OJequ41SCEyzudx9FYES1Hm4T6FsxeOSHp9sWxMh5AO6Zfp78xQi9Bgh/xaWiqFsZGE1jCfejWUBgvT6cnubxc694krx/CaaTBicHon3PGgK9aWquQTw2Ucm6GzWrOSmtdDg5xBzCuatM5oEWRwVlDr0X2ogUM5fgo8YzWjsd75bIdQS9fMMeNljxHBnbAl4pVEbEwyn7yNhsBkvry7JeNw1V/hhbhJj+gb+TJmuKoAEPfx++ie4DcS/hCqiHUnIISimq7Gi6E+Cox55Hja/ieEAlMWlo5J0zOP6nsiiGBETmDFZEvcx6E3NgrYzy5b7Ppj/khF4joFNI3peQunLxSiuCYehyYZCbysSY/RuUupmhU51+4SXfEy9d5mRXDBoZYA+ELMBgbknOJ2iIHLNOrIXYOurgUEjbu5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUVVU0lQQ1R3SjhyNXBkWUJlMFRjRVdqT29odFd5Z3YwOUQvUWJXSFVpNURh?=
 =?utf-8?B?RXhoU2x0SGxWRnpUWGFWQXdabXdVMkpZRVVjb2hPSlgwbDhiQ21WNDhMcVN5?=
 =?utf-8?B?YnBWYkxES0w4aVFqajRsT2dWKys4SFZRWEJKdThReEh5MnBsTDJ6UDNZUmlF?=
 =?utf-8?B?Qm9STzNQRk1aRWp2cGw4aHN5aVpZdnd3cWNNOFVoL1pHcTBYR28ySzlraHFH?=
 =?utf-8?B?dGhwdXVEa0d2eXVxaVk0TWlWdDZFQStNR2hYOWhvUHBYeUJQQWpRdTAxZWZP?=
 =?utf-8?B?NmZmUGtpeWN0MEdNVEduNDd2UVV2bkV5VnZuYmtQUVdUdmV3TWdTTGNKenA2?=
 =?utf-8?B?SWFvUTJhYmR3bUVQWjMxOEttSHBySUoyTDR6cWZTdGdTZnVQYURNZDFiUVZR?=
 =?utf-8?B?dWpJdTl5RiszN3BPYSsrOHJFK1hjVVZ4RDZCditKbnJnTFZ5TllNVlZLZEF5?=
 =?utf-8?B?djBOYjVsd2FvTld4SUV3QmFHM2FOMU5TOEU4TG1ubTJ5VW1ialVsQWcvVXY4?=
 =?utf-8?B?Tjdpc3dDbXI1NGNGUHA0OE5jMWFtZDM3Y2Y5ekJKcE9EQ1FZejE0SXRxSzdk?=
 =?utf-8?B?V1FOUnJmNDNNclRGQVVxZEtncWRzdjB2Z0xNNEpVR1VKYko3UFRzamtzNmdK?=
 =?utf-8?B?cTM4NXJtTWZHbVlNVDFzVUlaOXpNUEVFY3ZZbm5DdURXOHhxMHFtOVFDQnRy?=
 =?utf-8?B?NkhyR0dQckdNakhmR0x2VVF2Wi9VTnBPQmtqZ2s2YmlVMWhlbUVZU2R5Z01n?=
 =?utf-8?B?c203bnRlL1dHRjlWNStvNVVHWEZBcVAvYkdQbEt0U0NLUmNJZlMwWlIwcjRu?=
 =?utf-8?B?WkdFb0o3V1pRQ1Rjb0tjTHFFMWxuaml1QXZhZEJaUS80T0x0c1BzWW1vRjl5?=
 =?utf-8?B?N1dMOUZtRzdvazNhQUljWHJLSXhnWWJQRDA0WmhjallOTzFIL05TZVJTbUZa?=
 =?utf-8?B?YUJTZ1ZrR2hPSDhuOVJBMU1KamRKczRMSGswSnhHS2ZQZGthK1RyL3BIS01k?=
 =?utf-8?B?YVRQbHhreVg0RGZ5aVlFT3ZiYUJ3VjFBbFJvcDhrQm82ZS9qR2RQWllzQ25J?=
 =?utf-8?B?N3p6WFFjcXMyR3RmK3ZhT3JZTDFETERMOEgzakkzL2N5RmFFZk5NZmh3OWd0?=
 =?utf-8?B?UVdmemxJWXQ4QnMwSmQ2RU1VSHMxU3IraEZkeFdxMGt6SWlTM0ZMZmFTUEQ4?=
 =?utf-8?B?RTJHVmJhSjVua0hKOFFEdWtDUTFLSGg1eWNOakhCYXlYeGdEYnlnSk5WUmt3?=
 =?utf-8?B?cXd2bTdsV1pISVFBSSt3WjEvN2FyZFdxb0M0OGZRSlV1Umlxc1cydzdidHRE?=
 =?utf-8?B?R3p3Zzk5dittZmkzUGI3R2puRlEweTZISEtreEJIRnFLTzl0R3RHZ2tTNTdL?=
 =?utf-8?B?OWE4ZVYxYTNvaGpOekd4SGJZTUoxaDVMTUdKUWs0QkUzaTVhZmlVUlNQTU9F?=
 =?utf-8?B?R01pemRXVi81VEVJa2VxNXlpTjZvM1ZNRzV5bU56aFhwWWd3d0dkTUlxbjI4?=
 =?utf-8?B?Z1FtVC9OdnJ3T1lqVE5JWGkzNVpFZ0lTMkdhZWZ1am9tR2ZZNjNTbGdJTEs3?=
 =?utf-8?B?VzJaaDE4MERKUW1UL2EzVldTSzdyQjR4NlNhU3NWOUxhZXJ0QUlLT3g5UzJQ?=
 =?utf-8?B?a0pERndkNlgzdGhWeFp4eWlyNGo0Rk9UejBwdWFXbU9QaFhJcytIR2w2cFF5?=
 =?utf-8?B?ZHFkWHhvaE9RMm1qOEJjZVpDdk9vVDFQMlhJUFB3TDlXdHVpem1MNElPTGdU?=
 =?utf-8?B?TmNGNHZtME5KZDhNenN4cnp0bGJEand2a0htTjZpN1VJV2srNWc0Z2dPWjJE?=
 =?utf-8?B?Qi9acmVoYS9yYVRPZ0ZNR1U1b0ZOSGxlYitoblRmQTlra2dPRnczdTlHK01t?=
 =?utf-8?B?Qi9sa3RlNVZ2dS95SDY0d2ZwQ2xjS0lFRzIwaGVQQnZMUkhWYWxHTVVYVTMz?=
 =?utf-8?B?SStTa055R3hxc3VEQS9hNVJVVFVFSExiSUsrODMvSXBrVzFFd2pMZGEyazhj?=
 =?utf-8?B?VDVxMjFXUjVmTVI3Z2tMN0ZEaFcyS0VTS3hoVlNZcVdDRk1IbHAzZDJjbVNw?=
 =?utf-8?B?VVdmanQzL1U1NkJZOGx1Vnl5NG5QUEpFMUpXaWZlZFBJZTZOd05jZ2UwK25o?=
 =?utf-8?B?Q1VSbkpXVzU5NTJ6T1VsMEl6VHJyMVlhVmZZSXdKRkhmSDczVnhwZUhVVjhq?=
 =?utf-8?B?Y2c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f1251a5-80d9-4d43-3e3c-08dcbab343bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 09:43:47.7525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kDyn/Roh9buoMP+xOFv2Ngjgr5OlEjDmbhR4TL1Bm/oX3fWy34bz0Xxvpg3l9t1VWmHpwIUu4K/erNoH+sybW+xSJsmE9zO5CZGBBV9IInUxSQs1lee3nxi6yrIvslHQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1239

SGksIExhdXJlbnQNCg0KPiANCj4gT24gRnJpLCBBdWcgMDksIDIwMjQgYXQgMTI6MTI6MDFQTSAr
MDAwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBIaSwgTGF1cmVudA0KPiA+DQo+ID4g
VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KPiA+DQo+ID4gPiBIaSBDaGFuZ2h1YW5nLA0KPiA+
ID4NCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiA+ID4NCj4gPiA+IE9uIEZyaSwg
QXByIDE5LCAyMDI0IGF0IDAxOjE5OjU1QU0gLTA3MDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6
DQo+ID4gPiA+IEFkZCBtdWx0aXBsZSByZXNvbHV0aW9uIHN1cHBvcnQgZm9yIHZpZGVvICJjYXB0
dXJlX3JhdyIgZGV2aWNlLg0KPiA+ID4gPiBPdGhlcndpc2UgaXQgd2lsbCBjYXB0dXJlIHRoZSB3
cm9uZyBpbWFnZSBkYXRhIGlmIHRoZSB3aWR0aCBpcyBub3QgMTkyMC4NCj4gPiA+ID4NCj4gPiA+
ID4gRml4ZXM6IGUwODBmMzM5YzgwYSAoIm1lZGlhOiBzdGFnaW5nOiBtZWRpYTogc3RhcmZpdmU6
IGNhbXNzOiBBZGQNCj4gPiA+ID4gY2FwdHVyZSBkcml2ZXIiKQ0KPiA+ID4gPg0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nDQo+ID4gPiA+IDxjaGFuZ2h1YW5nLmxpYW5n
QHN0YXJmaXZldGVjaC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJpdmVycy9zdGFnaW5n
L21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYXB0dXJlLmMgfCA1ICsrKystDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+
ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mv
c3RmLWNhcHR1cmUuYw0KPiA+ID4gPiBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9j
YW1zcy9zdGYtY2FwdHVyZS5jDQo+ID4gPiA+IGluZGV4IGVjNTE2OWU3YjM5MS4uOWU4NTNmZjI1
OTZhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUv
Y2Ftc3Mvc3RmLWNhcHR1cmUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
c3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUuYw0KPiA+ID4gPiBAQCAtMTc3LDkgKzE3NywxMiBA
QCBzdGF0aWMgdm9pZCBzdGZfY2hhbm5lbF9zZXQoc3RydWN0DQo+ID4gPiA+IHN0ZmNhbXNzX3Zp
ZGVvDQo+ID4gPiA+ICp2aWRlbykgIHsNCj4gPiA+ID4gIAlzdHJ1Y3Qgc3RmX2NhcHR1cmUgKmNh
cCA9IHRvX3N0Zl9jYXB0dXJlKHZpZGVvKTsNCj4gPiA+ID4gIAlzdHJ1Y3Qgc3RmY2Ftc3MgKnN0
ZmNhbXNzID0gY2FwLT52aWRlby5zdGZjYW1zczsNCj4gPiA+ID4gKwlzdHJ1Y3QgdjRsMl9waXhf
Zm9ybWF0ICpwaXg7DQo+ID4gPg0KPiA+ID4gVGhpcyB2YXJpYWJsZSBjYW4gYmUgY29uc3QgYXMg
eW91IGRvbid0IG1vZGlmeSB0aGUgZm9ybWF0Lg0KPiA+ID4NCj4gPiA+ID4gIAl1MzIgdmFsOw0K
PiA+ID4gPg0KPiA+ID4gPiAgCWlmIChjYXAtPnR5cGUgPT0gU1RGX0NBUFRVUkVfUkFXKSB7DQo+
ID4gPiA+ICsJCXBpeCA9ICZ2aWRlby0+YWN0aXZlX2ZtdC5mbXQucGl4Ow0KPiA+ID4NCj4gPiA+
IEFuZCBpdCBjYW4gYmUgZGVjbGFyZWQgYW5kIGluaXRpYWxpemVkIGhlcmU6DQo+ID4gPg0KPiA+
ID4gCQljb25zdCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0ICpwaXggPSAmdmlkZW8tPmFjdGl2ZV9m
bXQuZm10LnBpeDsNCj4gPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAkJdmFsID0gc3RmX3N5c2Nv
bl9yZWdfcmVhZChzdGZjYW1zcywgVklOX0NIQU5ORUxfU0VMX0VOKTsNCj4gPiA+ID4gIAkJdmFs
ICY9IH5VMF9WSU5fQ0hBTk5FTF9TRUxfTUFTSzsNCj4gPiA+ID4gIAkJdmFsIHw9IENIQU5ORUwo
MCk7DQo+ID4gPiA+IEBAIC0xOTMsNyArMTk2LDcgQEAgc3RhdGljIHZvaWQgc3RmX2NoYW5uZWxf
c2V0KHN0cnVjdA0KPiBzdGZjYW1zc192aWRlbyAqdmlkZW8pDQo+ID4gPiA+ICAJCXZhbCB8PSBQ
SVhFTF9IRUlHSF9CSVRfU0VMKDApOw0KPiA+ID4gPg0KPiA+ID4gPiAgCQl2YWwgJj0gflUwX1ZJ
Tl9QSVhfQ05UX0VORF9NQVNLOw0KPiA+ID4gPiAtCQl2YWwgfD0gUElYX0NOVF9FTkQoSU1BR0Vf
TUFYX1dJRFRIIC8gNCAtIDEpOw0KPiA+ID4gPiArCQl2YWwgfD0gUElYX0NOVF9FTkQocGl4LT53
aWR0aCAvIDQgLSAxKTsNCj4gPiA+DQo+ID4gPiBJcyB0aGVyZSBubyBuZWVkIHRvIGNvbnNpZGVy
IHRoZSBpbWFnZSBoZWlnaHQgYXMgd2VsbCA/IEhvdyBkb2VzIHRoZQ0KPiA+ID4gZHJpdmVyIHBy
ZXZlbnQgYnVmZmVyIG92ZXJmbG93cyBpZiB0aGUgc2Vuc29yIHNlbmRzIG1vcmUgZGF0YSB0aGFu
DQo+IGV4cGVjdGVkID8NCj4gPg0KPiA+IE91ciBoYXJkd2FyZSB3aWxsIGNvbmZpcm0gYSBmcmFt
ZSBvZiBkYXRhIHRocm91Z2ggdmJsYW5rIHNpZ25hbCwgc28NCj4gPiB0aGVyZSBpcyBubyBpbWFn
ZSBoZWlnaHQgY29uZmlndXJhdGlvbi4NCj4gDQo+IFdoYXQgaGFwcGVucyBpZiB0aGUgc3lzdGVt
IGV4cGVjdHMsIGZvciBpbnN0YW5jZSwgYSAxOTIweDEwODAgUkFXOCBpbWFnZSwNCj4gYW5kIGFs
bG9jYXRlcyBhIGJ1ZmZlciBvZiBvZiAxOTIweDEwODAgYnl0ZXMsIGJ1dCB0aGUgc2Vuc29yIG91
dHB1dHMgbW9yZQ0KPiBsaW5lcyA/IERvZXMgdGhlIGNhbWVyYSBoYXJkd2FyZSBpbiB0aGUgU29D
IG9mZmVyIGFuIG9wdGlvbiB0byBwcmV2ZW50IGJ1ZmZlcg0KPiBvdmVycnVucyA/DQo+IA0KDQpU
aGUgaGFyZHdhcmUgY2FuIGNvbmZpcm0gdGhlIGltYWdlIGhlaWdodCBieSB1c2luZyB0aGUgVlNZ
TkMgc2lnbmFsLg0KDQpJbWFnZSB3aWxsIHRyYW5zZmVyIHdoZW4gVlNZTkMgaXMgaGlnaC4NCg0K
VlNZTkMgdGltZSA9ICh3aWR0aCArIGhfYmxhbmspICogaGVpZ2h0Ow0KDQpSZWdhcmRzLA0KQ2hh
bmdodWFuZw0KDQo+ID4gPiA+DQo+ID4gPiA+ICAJCXN0Zl9zeXNjb25fcmVnX3dyaXRlKHN0ZmNh
bXNzLCBWSU5fSU5SVF9QSVhfQ0ZHLCB2YWwpOw0KPiA+ID4gPiAgCX0gZWxzZSBpZiAoY2FwLT50
eXBlID09IFNURl9DQVBUVVJFX1lVVikgew0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExh
dXJlbnQgUGluY2hhcnQNCg==

