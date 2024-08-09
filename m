Return-Path: <linux-media+bounces-16061-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FAB94D4F3
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 18:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83C131F23FB3
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD6F38FA6;
	Fri,  9 Aug 2024 16:46:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2122.outbound.protection.partner.outlook.cn [139.219.146.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1645288B1;
	Fri,  9 Aug 2024 16:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723221985; cv=fail; b=FHBt0ndxx+jjixhxzY1FCjOva6/7erSF+JXDzV1HvCjFTxcS8boBu1dfnWL1Tj8SJU6m1E3zAMI+pzpPrF93NRGbQbr4m/hFN8c24o9S7DMyajSPaCO8XrFTClXiw0wxFTGyQarNiFF3vnrkyk4KeJa2i8rkB8saCXA2x5Hi6RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723221985; c=relaxed/simple;
	bh=yJU2SKMlw2upgeH5+rphp74Zs94zkxvzWsNPbwhYj+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lMsvrg2rd2KPxva3PJsMtoRJNlMEMLus6uRLZXxdHPdbdwTp4XW7Nn1QeMFbJoFEMhzsdOP5/ARbHMPvalNJ4YH9mmcpoBouHEuZj7hQWNH6HL5q2ai+mjxpdIwcwRXg5kWRQKkqp/kB6gRoG4SQffYCuo+Wy0ZQaybUeqPFIcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5HHilMS8DEVBXaNoLNoyfjZKveNv62iKrFDgt42wnjmlRd/yVmluPljeCVwV98M99i4+mHEIqiRW/tNeB85CJycGvAdOUrsRWYOcQpibcAPzJyclDWotRKuiqYwZkMOI3ENNB2gWNGs8n5gIkgxHWEi+vdLUvq6btVtSrYI4Y+lXVRNkXcWZKAOEA11vDEgovOFxjFNoiKQJU9LeTY24GfaFXaZmaKQks9v63Q3nCPgUWtwCvWAm43tblhYeosphyOKBPUT7XNvz33uRVQngKXOAGbsi1Nq9WbnvgOSDE4OfwIqeB6D8+7531GL+qEyAcfwxpm0np6KMklmT2xGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJU2SKMlw2upgeH5+rphp74Zs94zkxvzWsNPbwhYj+U=;
 b=LSgeY8esu4wqxi+cCQuc5AW94zbek2awhlwyaH3YFX8n+Vn5VhqmpgM1mDLzLgIt2UfG3j0COIQ2QINvajoF7ff12FMLX2cjeZNufUBcuhjWxXf8byXy2GTvxdSBpFkBnSjbgQLXcNTB+uTlHHi9M1A+xhIvU4FiEM2khWIJ2YVvivhvliKcxycByGGykNyfNPQ5zWkWwzvdc0Rkyt9kKVzz/48WMznxC+heoyLL9xHN05okSHWWA2IJze5a5T2xhnsMAiyrtboJfY62D0cZXDdoRm7EU6uDW6TtvBYxvLYtixpP93HRtPeriP5uj94vJRPHWzKHuf0K7wsS9sEcIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1159.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 12:12:01 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7828.030; Fri, 9 Aug 2024 12:12:01 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Jack
 Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHN0YWdpbmc6IG1lZGlhOiBzdGFyZml2ZTogQWRk?=
 =?utf-8?Q?_multiple_resolution_support?=
Thread-Topic: [PATCH] staging: media: starfive: Add multiple resolution
 support
Thread-Index: AQHakjJgnQOCOrefE0y1na0O5Q3CHLIfYLwAgAAkcMA=
Date: Fri, 9 Aug 2024 12:12:01 +0000
Message-ID:
 <ZQ0PR01MB1302CAAE59FA0358E7FE6BD0F2BA2@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240419081955.5140-1-changhuang.liang@starfivetech.com>
 <20240809095738.GG5833@pendragon.ideasonboard.com>
In-Reply-To: <20240809095738.GG5833@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1159:EE_
x-ms-office365-filtering-correlation-id: e9a49783-93a8-45d0-019b-08dcb86c7957
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|41320700013|366016|38070700018;
x-microsoft-antispam-message-info:
 PV0fLpo70xSF3fQ3zqRzxF+9dueQezTqzHxGgtAtgnrOUTOPd/YFmmGJejHr1Zi/sZFehEeaGaMqjYnmrpafLuSFNCeKdLQ+17kczC1sKNmY/xmwGQITLGvKB1F5ePs4zvRe60ifQ2FG7TnIQa8UOOZXa76yZojQggq8slBxd7kACjg9OgHmx5zSpNnjN+OZAwaA+ziFkxFVnfqe6GPIBpUKsI/CVXFKC9nu/akZ05CWImk22qe6Uw7UvkDn5AyF/1TZ7KrlrbhLWfNrmJrZRCbazqqKV7OvlhTCTgeWtN0SfQMKW9tZZdCm1V7BNi/geJiKaR7i/3GrwdC39hL4M6QnGswCF5Lk/msTocuiZ1UAspEz1xYhPqJkVyRCbpQmpPwYJs1CKi4hE+qnKfs2a0PyWHxWRoV3YuiC1yuswyATfKJ+4QtVZMu8XOa1QWeayUfscGR/zjXZsfGV66TjV3DpLOodoYYUwBZo7gK14nPspCDOYqkRp5lDPB6czXK8Y2VBl9o14+7BIlp71gJ7W4WKRWXi4U5/aP/sORT460ORJ24eszTGFgweWpPN9+M6EqdRao2XKqZ223PcDhmtSl3BV0/7mjrpyUk+TVtTvZNl1xV+iM47NS3DNfxg+P7b
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cU8wS05YNFovdVdBSXUwejBWLy9VOW9SQjI4Zko5Qy9YQjBRVkxmNzcveHVX?=
 =?utf-8?B?NWhqNG83LzRSNWpYdFlTaHZoZFVqYWpaRTJFaU4vYWppU29ieG5PMUpQWitR?=
 =?utf-8?B?dVV1VjMwTFJTeUlub3NxbnNPUjFPUlFnWjZYSlFnVTU2bDRla0RxNmt5NXJs?=
 =?utf-8?B?bkxNMGR6b1JoMzZVbksyOCtGdlJFUzl5QjMxeDFTVHk3TXBiT1ZqV2o4T0Ra?=
 =?utf-8?B?MGd5V21zQTBHSGJ1NXdmbjZUU3J1NDI3NXM0d2dqSUhzVThnTGw5RThQdmpu?=
 =?utf-8?B?SVRDU21OMVFVbVUzZlVWdHM3NnFNYWNVcncvSDU3M2VMZHFPUE5JYXkycW9C?=
 =?utf-8?B?M1NIRHNPQkhiZ3BMQlNacnhzaXBxZUNIWjU3SlFQZmgzbnZieWNpZ1dZdjZj?=
 =?utf-8?B?aEhDZ0pMZFFFV1I5eUdTTFZLY2dtYURHYTd2RVg0ei82VTNyOXkrUklIMnA0?=
 =?utf-8?B?L3lCejl2Z3Qya1Y3VWtQM251cHRVUTl4UmsyRkljNmpKT1B2RFJhVlcvV21L?=
 =?utf-8?B?eFhHdDkyelNkTmZNN0VkTUY0YjhBZ000dUljbGlSbWlmQ3QvVjg2NVc0UURD?=
 =?utf-8?B?Q3hCV3RuWlA0L0piWmY3NG80R2I0eU5EanMyZERQZUVaek9MOWNhdGlaRGtj?=
 =?utf-8?B?SXpFZHpPZWcxdFdMN2FtYlFYL1FTa215Y083c2IxMVQ3QmU2MnNlVFpQTG9Z?=
 =?utf-8?B?NE9tWkoyNTdPNWRLbU0yOEZMMkVVK2xwck9aV3FnTTJQTEVBZi9IQVUySXdK?=
 =?utf-8?B?WmhLbkM2TGhtZVhBeXl4a2NGUjZvQXFYNVJjNjBOdVNaV1Zwczc4bVR6Rzhw?=
 =?utf-8?B?M01rWDdrNHVZbFZLYlhQdy9CcHpmeW4zbmlFK2xzVFRHZU9XNzl5WFB6dXpp?=
 =?utf-8?B?aUFZOGE2VGJZMmVBbkh2aExudlc0aSttdzRsZnA2cFN4KzRoRElMWnRSazdY?=
 =?utf-8?B?UWYwR2NXOG1reDFsQzJPcHNWLzJ0SEkxUi9McnBTaDBtNEJlNHh2ODBwM1pM?=
 =?utf-8?B?alIvWWdLbVYrSHY4M0ZaaGtTZENCZnVEcDRGUzhzQW93ZzZqc1VwcFF4Q2w1?=
 =?utf-8?B?dVAwQyszVEF3VHRPN0hDM2QyNHpDbjZLMTlpTjhkc0ZwWVd1eEVPay9KSXpv?=
 =?utf-8?B?SGR2UVZObHlSTllmT3djeDBxYWhkTVQ0NlJyTm1VeVpSbFVtbWVvdG9icWsz?=
 =?utf-8?B?Umd1UWF2SU5VczNSdE1kMlUyQzhtMXBiUHNldDZXQ1YxbkJkem5yZXlndk0w?=
 =?utf-8?B?SlVURWQwTTROK0VQZFN6NmppdGpJRlRPYjJxdWphZVJMQUdaaWlTQ0ltVlNJ?=
 =?utf-8?B?aCs5R1dnOGIzRWZiZk8xWi92L1g3TzE4WUM1Vmp1WFlxbWgxR0NPTzg0Um1S?=
 =?utf-8?B?N0d5MHNXNytoNzV3dFBMbmpOYzZQYkZyT2VBc25XU3J5SWlRaHF4c010Nm0v?=
 =?utf-8?B?NnlqV2prT042SWpFdStHbEkvNmswRmFHSXN5ZVFHYnpkbDNMODdsUFBISS9j?=
 =?utf-8?B?S2Q0Nkhib3I4UU1EZS8yZDhwWUlubmdJK3dxK3MzRks4UmxBQy84MVM3UmZW?=
 =?utf-8?B?VGs0ZlRMVjlZSzdKNU5ZOXE3WmEvRGhXQjYrVHo5YXhCL1BGTnNuK2xJYnpU?=
 =?utf-8?B?NHE4cnN3K014ZGxqdFJLWGxzZjZTd1pINmJBMHZPdGRJMkw4NEJBdEpQeUZO?=
 =?utf-8?B?cDl1UDllc2pOSGhPdWhtN0M2L0hzTGNWQW9hRlVMWk94TkJtUzRCNVhLckdM?=
 =?utf-8?B?NWc5dkN0MzNQc1p6RFBzNmh0NklEcXFNOHVXYVljNE5URzRpZk1UazBXVVdG?=
 =?utf-8?B?cU4yd0l0akhRL2EzVnVDUzErcGU1U2F1Y0s1QkcyWE5qKzRoRUJhc2xtUzV3?=
 =?utf-8?B?Q2NwekNtZnFPV1IrcGx3eTJ1MDQ2SHlabytETnVlNzVmbFhTT09DajNBOGZF?=
 =?utf-8?B?TWI2dFRpM0gvbmxVYVNjRHRMSGtKRDBtY1NTYUFsQ2d6ZG5wb3BLeDRwR2Jx?=
 =?utf-8?B?TElhUzVGaTZoTjJjSUNSQURHRUZtOENJZ3pPeEVNbEkrczNBZCtmRkhTK1lY?=
 =?utf-8?B?OFQ4NllQbzUrSjZIWVBsc2JlTmE1NHB6MHlwZW9HdlR0MlRwdjd5aGNNK2J1?=
 =?utf-8?B?QWEwZ1ZvODFvdjNFWlNyRG9SbENqK2tHZ3hoNlBkcE5NNWs4U0piN3BjaWM2?=
 =?utf-8?B?TFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a49783-93a8-45d0-019b-08dcb86c7957
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2024 12:12:01.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkSI+h47jbYwd/PGericqdpZQhiQzVUXZ2oD7rsLlcKZkgVXvFurbt2p6TGbfotbhHYFl1He/r5p92n74JCgRiRAalDSz9u8S5Hil8BhaY1oS8++RH4bKRYSUI7qvk6o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1159

SGksIExhdXJlbnQNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IEhpIENoYW5naHVh
bmcsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIEZyaSwgQXByIDE5
LCAyMDI0IGF0IDAxOjE5OjU1QU0gLTA3MDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6DQo+ID4g
QWRkIG11bHRpcGxlIHJlc29sdXRpb24gc3VwcG9ydCBmb3IgdmlkZW8gImNhcHR1cmVfcmF3IiBk
ZXZpY2UuDQo+ID4gT3RoZXJ3aXNlIGl0IHdpbGwgY2FwdHVyZSB0aGUgd3JvbmcgaW1hZ2UgZGF0
YSBpZiB0aGUgd2lkdGggaXMgbm90IDE5MjAuDQo+ID4NCj4gPiBGaXhlczogZTA4MGYzMzljODBh
ICgibWVkaWE6IHN0YWdpbmc6IG1lZGlhOiBzdGFyZml2ZTogY2Ftc3M6IEFkZA0KPiA+IGNhcHR1
cmUgZHJpdmVyIikNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNo
YW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9z
dGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1jYXB0dXJlLmMgfCA1ICsrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNh
cHR1cmUuYw0KPiA+IGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3N0YXJmaXZlL2NhbXNzL3N0Zi1j
YXB0dXJlLmMNCj4gPiBpbmRleCBlYzUxNjllN2IzOTEuLjllODUzZmYyNTk2YSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvc3RhcmZpdmUvY2Ftc3Mvc3RmLWNhcHR1cmUu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdGFyZml2ZS9jYW1zcy9zdGYtY2Fw
dHVyZS5jDQo+ID4gQEAgLTE3Nyw5ICsxNzcsMTIgQEAgc3RhdGljIHZvaWQgc3RmX2NoYW5uZWxf
c2V0KHN0cnVjdCBzdGZjYW1zc192aWRlbw0KPiA+ICp2aWRlbykgIHsNCj4gPiAgCXN0cnVjdCBz
dGZfY2FwdHVyZSAqY2FwID0gdG9fc3RmX2NhcHR1cmUodmlkZW8pOw0KPiA+ICAJc3RydWN0IHN0
ZmNhbXNzICpzdGZjYW1zcyA9IGNhcC0+dmlkZW8uc3RmY2Ftc3M7DQo+ID4gKwlzdHJ1Y3QgdjRs
Ml9waXhfZm9ybWF0ICpwaXg7DQo+IA0KPiBUaGlzIHZhcmlhYmxlIGNhbiBiZSBjb25zdCBhcyB5
b3UgZG9uJ3QgbW9kaWZ5IHRoZSBmb3JtYXQuDQo+IA0KPiA+ICAJdTMyIHZhbDsNCj4gPg0KPiA+
ICAJaWYgKGNhcC0+dHlwZSA9PSBTVEZfQ0FQVFVSRV9SQVcpIHsNCj4gPiArCQlwaXggPSAmdmlk
ZW8tPmFjdGl2ZV9mbXQuZm10LnBpeDsNCj4gDQo+IEFuZCBpdCBjYW4gYmUgZGVjbGFyZWQgYW5k
IGluaXRpYWxpemVkIGhlcmU6DQo+IA0KPiAJCWNvbnN0IHN0cnVjdCB2NGwyX3BpeF9mb3JtYXQg
KnBpeCA9ICZ2aWRlby0+YWN0aXZlX2ZtdC5mbXQucGl4Ow0KPiANCj4gPiArDQo+ID4gIAkJdmFs
ID0gc3RmX3N5c2Nvbl9yZWdfcmVhZChzdGZjYW1zcywgVklOX0NIQU5ORUxfU0VMX0VOKTsNCj4g
PiAgCQl2YWwgJj0gflUwX1ZJTl9DSEFOTkVMX1NFTF9NQVNLOw0KPiA+ICAJCXZhbCB8PSBDSEFO
TkVMKDApOw0KPiA+IEBAIC0xOTMsNyArMTk2LDcgQEAgc3RhdGljIHZvaWQgc3RmX2NoYW5uZWxf
c2V0KHN0cnVjdCBzdGZjYW1zc192aWRlbw0KPiAqdmlkZW8pDQo+ID4gIAkJdmFsIHw9IFBJWEVM
X0hFSUdIX0JJVF9TRUwoMCk7DQo+ID4NCj4gPiAgCQl2YWwgJj0gflUwX1ZJTl9QSVhfQ05UX0VO
RF9NQVNLOw0KPiA+IC0JCXZhbCB8PSBQSVhfQ05UX0VORChJTUFHRV9NQVhfV0lEVEggLyA0IC0g
MSk7DQo+ID4gKwkJdmFsIHw9IFBJWF9DTlRfRU5EKHBpeC0+d2lkdGggLyA0IC0gMSk7DQo+IA0K
PiBJcyB0aGVyZSBubyBuZWVkIHRvIGNvbnNpZGVyIHRoZSBpbWFnZSBoZWlnaHQgYXMgd2VsbCA/
IEhvdyBkb2VzIHRoZSBkcml2ZXINCj4gcHJldmVudCBidWZmZXIgb3ZlcmZsb3dzIGlmIHRoZSBz
ZW5zb3Igc2VuZHMgbW9yZSBkYXRhIHRoYW4gZXhwZWN0ZWQgPw0KPiANCg0KT3VyIGhhcmR3YXJl
IHdpbGwgY29uZmlybSBhIGZyYW1lIG9mIGRhdGEgdGhyb3VnaCB2Ymxhbmsgc2lnbmFsLCBzbyB0
aGVyZSBpcyBubyBpbWFnZSBoZWlnaHQgY29uZmlndXJhdGlvbi4NCg0KUmFnYXJkcywNCkNoYW5n
aHVhbmcNCg0KPiA+DQo+ID4gIAkJc3RmX3N5c2Nvbl9yZWdfd3JpdGUoc3RmY2Ftc3MsIFZJTl9J
TlJUX1BJWF9DRkcsIHZhbCk7DQo+ID4gIAl9IGVsc2UgaWYgKGNhcC0+dHlwZSA9PSBTVEZfQ0FQ
VFVSRV9ZVVYpIHsNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0
DQo=

