Return-Path: <linux-media+bounces-14312-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CD591BA4D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94F61F22F6C
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 08:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052DA14D2AB;
	Fri, 28 Jun 2024 08:45:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A214B952;
	Fri, 28 Jun 2024 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719564322; cv=fail; b=K3aOcs81fBJ6uu7IoZUUwAgaPWZRW025dNDf2oRXuqYJUze8a1H8qE2Qtcebdp8VUEuh+3EGaNpGQkZyd1oLIR8t/wZRJdvem4TZL9ry7q6G18Rwfz1VA0zTwA4fExwTtJBsDDmVfN38YbNspuYFh/7YwOKlNIxb9WER4uQcsTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719564322; c=relaxed/simple;
	bh=P3MmHcoRBQbcAgZj1Ie3wy0WxVKEH5GLU3z2PYtfisU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ju1IvpFWOgsg8QCrBicVRvYKysvM6AJQV96v8t3V5wkHbMOl2908IKVh6Oc+9TIpFnKYGR15zrHEOEEAo8tVvbD8fSWDyedd06HP+vEB29Oz1/6+x4YClA9twm5YD0AgVknDEpgQK0wQ0qRtPeQdkYjTyYr9GW3gvQMKbMMlPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=As76DsCdyNwwNX5ZPyWXjr7lvGQMd6pOgY1CpG24jGwQ/X6bPbj+Jz7GIGAfs6FEMO7ZqgEktgc8vnUTOLQkuoXPyUsoniNCgVhAcvHqs9+t3Xcj6KA2+mozUcAu5331WqIwKE8MV+CElQsrOJtvCOokA7yx3UQvL652o/4M3NQMwEnC30M9DGya0eFmhmcW5ogrbpjIRzxDszk6+SHiGd/nWpnf17ZLz6DPGipDwmY4yKQomgampHowsZCRA5bxp3dguGmK5Hqpy8x9PaILuB2UPUG81aKClXt4r4bvzjnswUjGQSsBmk++NC9ZmRSITnPyuRFc5lnGyRvai4z8tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3MmHcoRBQbcAgZj1Ie3wy0WxVKEH5GLU3z2PYtfisU=;
 b=eRQVlpoLfmxrP/QZzpoTrw54VDzUVNW9g0BhYJ9RsHU6G8NTDxOTNZflfKpA8uyb0IiYgfP+eGRIMA5F81OXyi16d4phtCeVCbeBozCbB7LaVk0AsRTmsGgzeRn6T6U1wprIGYOgl+3cC0PkTbMekRGWHw40ePmEcbuEcVcPd/Sw7Cjos2zB2yMXLtLBLBMrPorqnFYcWQEDnwKsvbI3YKRGbIOc34EoE1DCps/LpsKNhDy9G0lfAXq+xLE+3rS3XS2QE3X+U7fjLOxEYeVcX7gg+Bl/u3fVB91MwhKU8a9i11r8/LS5ARJ4w37H0sXM0rvH5WKPqdK0H23GaiS9gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0968.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 08:45:06 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::4d66:ac5e:3903:cdf5]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::4d66:ac5e:3903:cdf5%4])
 with mapi id 15.20.7698.033; Fri, 28 Jun 2024 08:45:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra
	<j-luthra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Vaishnav Achath <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>, Jack Zhu <jack.zhu@starfivetech.com>, Julien
 Massot <julien.massot@collabora.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMDEvMTNdIG1lZGlhOiBjYWRlbmNlOiBjc2ky?=
 =?utf-8?Q?rx:_Support_runtime_PM?=
Thread-Topic: [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM
Thread-Index: AQHayJNptuXJ2qsJik29H2g7jEFGsbHc1VcAgAAHZLA=
Date: Fri, 28 Jun 2024 08:45:06 +0000
Message-ID:
 <ZQ0PR01MB1302B36DDCE078AF2D16E935F2D02@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-1-6ae96c54c1c3@ti.com>
 <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
In-Reply-To: <c0e3623b-0af6-4bdc-8eb0-9072df1311de@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0968:EE_
x-ms-office365-filtering-correlation-id: 2ef34b68-7d3d-4f93-48b8-08dc974e9c33
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 7Z6YhR+NyuAekdAR+DnnmafG10Fmm78YDhKTuBUM3djgwG1au41/HMYXrLIQCh2OvMJU8Vz5Zre2wXSztaB8YzautijWSC81RyOXOell1YkWuSdg08AN9qSKnGXTzJFqbsrUemvDiU7wDyVc4ACCmEGt8NiEN4orwM6sK270qPVmoGelaVFtL8rSSJ7SVteM98rqHImQZa9RLCP/9HS0+UFDmdDcyaoad9n4vLquIxc1Hlt/41endnwe30GFcbKrH0OgCXOvI93Hu6mV0Z3KKaVm1u4J5sPs7hka6OijTZy3QDX3sdH3yorgvCj8AssovWz6Jo0Xss7bPu15bzczvHiG9YKQfNkR7kK0UsTCviDfb3C1xWfxhVsQYshS6HacW2n3FrJOUh+Ix6azeqRjWj7e5F+D2GX2jEiXNmsvr+Ybc0qaLJmsmwLNKxTaU859dIuPnHk8hTz9588ig8tY5V8SCCizMI0xRHcxzxFw5TGv08jWn+xY5WybJCfMBSJVz5xF6DLEI/J7TTiT047VQX5uYWe8UOAsWf2etXtsTv3CTBAPtFmDDAhJc316PMevuZVWQ+qGHtrfjY8OATQNauXTna0tC+/W36zZTBbqkCVAG0xE2E5XF8iqDSWEuxpBa3eutSVnRbqGqkAcrsR2zA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUNWVG9zaERtUnNhMzNZeTdPWEUwT0FYcEl2TXRtOUZMTWVwUEpRM0hQcGxw?=
 =?utf-8?B?RDNxTXNJb2RVREJiSVpIL24yamdldE1QQUNaL1JhRnlBdWVrTGpDUkVydEps?=
 =?utf-8?B?NmFRbDRDUkl2YzJSU1JIQ0NrczZFT1o2S0hUUDhiRGg4Vk1GL29adk1jbndo?=
 =?utf-8?B?OVdGNTc4WkZsdFB1WWFpR0FrSnM2UGhNWUxLVVJ1ZU5nMHp3R09yMzluaERM?=
 =?utf-8?B?YlhxWnNCKzFmdkdxcjJYM1U3VjlkNmhjbENqWVV3YzBIZktueTFiUm5LZWxq?=
 =?utf-8?B?c1pBSkNrZzdWRFkzd2FHRVZzU2E1NmdSS3FucCtVazJLSlRTZmNUcyt1RWtl?=
 =?utf-8?B?VDY3VmxENmZoN1lGWVFKakt1VXFzcjVFNWg2Z2pMTVczbXhvUnNCZDZPbllL?=
 =?utf-8?B?MURUY3F2QUhrMTk0b1FybzRYVlNnMEl6cytHWCtEbzdKV2o0RU94QWNqOTRv?=
 =?utf-8?B?ZGl2cnZyc0g5dkVqaHJDVUQ5eWtEZ3BiNmlBQW43N3IxSmdzV3dpSUxWbUUy?=
 =?utf-8?B?aWtKQXppMXprV2hKMjNDUGkxNVNCWlBVQ1FCVHZIVEZOb2xHck0xZk04S0I1?=
 =?utf-8?B?VE9kc1AwSWNpR21KMUhaWnMxV3FnVXFvSEhadHl2Y1J2YU1jUEgvN0dTYzhK?=
 =?utf-8?B?a1RnWVViNUludG1NekVIWXIyeFJCaWNKOTZZblVraXZNQ0d2SmM4N1RJY0s2?=
 =?utf-8?B?NC9sYWxHS25YWm52bFpyWENkaUoyQkptaVNIb1ZEVnUxTTVhMForT0RJUnF0?=
 =?utf-8?B?QXFraW9CWHd1d0dxNERkbzRodWl1eE5VZmpWWXpVOFUxMVNUbWZMU2U1Qk42?=
 =?utf-8?B?UnpMN2tydW9zaUExVTdqS2dkcFdXbWI5ell1YmhOVmtPaFFaTEtqUmVva1o3?=
 =?utf-8?B?MkJsOVk2bEN6aU1VU2dWTjM1YUlJckRaTVp1anZiUFU0MXlkRmJtamh4SDEv?=
 =?utf-8?B?SDgxRmU1TDY1UXF3dWRGUzBIRDlpZzJlKzhySTVlTVVjN0pITXBheDdMTUpD?=
 =?utf-8?B?eTc2MGo3RTB2YlI1bThaMWNSZ2ZxR2IwM05BTmkyRndidGhDV25vaGhqM2VX?=
 =?utf-8?B?eCtidkJwVWZNNklQSlBrdS95emRjT2lDb2ZxazhJdnp6aDBaeURRMlNLeWJT?=
 =?utf-8?B?UnhHV0U0SWQ3V1VhWk1hY1doTVlpdnE5WGQ5YWt4RDdxNDd6K0hTb1BBdSts?=
 =?utf-8?B?WVZRWGN4ZVptS3F2YThncVhoOS9UbHBySWdCK3RmVTdGS2Npa3BuVEFQSGd2?=
 =?utf-8?B?TlRmRkZuZFBtelN0M0VSa3EzMllST1NqZ0RWOFhZQ3hIb1kvZVcxNFdlQVdu?=
 =?utf-8?B?eUIxS3RIdFFSbjBSQjhLeTJra3lsZVlOWHFXQnZJNXNQU1FWbHdjdVhLR21E?=
 =?utf-8?B?bnJHWFh3ZHEydTZYZ0dlVXBSdy9STlQ5VzR4d2tVMFRoamVKVG1WR2tLTHVZ?=
 =?utf-8?B?NkpNeWlQaVNOZXFXM01LS1BaTEZRVFNOQndkb0NPNGJTbUx2QW5ZemNwS1p5?=
 =?utf-8?B?SmVqM1ZEd0VCd2dlNDhUbzRuU2NXYUxnakZiekx2L0RYd1g3dUxyYXZtK0NK?=
 =?utf-8?B?RiswQTlmSmJ5b3B3ckh3cGVGc1VvTkV1S3l5UUk3OGZXUnNHcVl6WVpKMjZD?=
 =?utf-8?B?NHJOVHRUWE5HK2lBYW95T1oyVzZreTg0M0hQekZRVVhNNXQ1bldMZGlNQTcz?=
 =?utf-8?B?RFlPb0RTY3RmdUtPR2tsTVN5SEVVMGgxRUNnVE9vZStmM2ViZURpWnJPUlRD?=
 =?utf-8?B?UjU3KzdnMVBabmVtMXBYTFpzMStGLzFFOCtmNngrc1MzcnJUeTVkWGhwR28z?=
 =?utf-8?B?UWZ4Vkd5S1NFY2g1em91NEtiM0h2cnNuSDFIbU1qL0MyYXVIZVRvUXVjR1h1?=
 =?utf-8?B?bFNxWFdXSTZzQUQ1NkJTbUlQSlBmdStONmVWWU9FaVQxcXJXeGlreXZEVVR6?=
 =?utf-8?B?QnZSczIvdHN6OXFZa1VoRXZEVTBTTVRERTRpdEtoUU15Q21USWpiMWpnREN6?=
 =?utf-8?B?S0lNMmNXeEd1VnRWMGJqV2h1MTlQMkFSd2w4ZThtc2lZSTJINWx3MEswQzZX?=
 =?utf-8?B?alJYbk9oUWxvdVNhd3FjMzRRU0JSN0lneXE5TWhJdkVYa1d3RzBTR05KMHVK?=
 =?utf-8?B?clRheGQva2pqbmx3LzM2UXZiaDJZa3BSUDllTHJHNlJBWlM1ek5FYkIrTno0?=
 =?utf-8?B?RVE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef34b68-7d3d-4f93-48b8-08dc974e9c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 08:45:06.3449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 90F4Ag3h1UD901u99Jgdbs1nOajy/RPTciP++MpP+1mbwcoArwnWc0fvtCdpinN2tlpqfLynKDdc/zI6DczeHm/YxMjEr/PJQLeIV5VRKE4+7dDZYGc8n8WtIfWZUhFH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0968

SGkgVG9taSwNCg0KWy4uLl0NCj4gPiArc3RhdGljIGludCBjc2kycnhfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpIHsNCj4gPiArCXN0cnVjdCBjc2kycnhfcHJpdiAqY3NpMnJ4ID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9jaygmY3NpMnJ4LT5sb2NrKTsN
Cj4gPiArCWlmIChjc2kycngtPmNvdW50KQ0KPiA+ICsJCWNzaTJyeF9zdG9wKGNzaTJyeCk7DQo+
ID4gKwltdXRleF91bmxvY2soJmNzaTJyeC0+bG9jayk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIDA7
DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgY3NpMnJ4X3Jlc3VtZShzdHJ1Y3QgZGV2
aWNlICpkZXYpIHsNCj4gPiArCXN0cnVjdCBjc2kycnhfcHJpdiAqY3NpMnJ4ID0gZGV2X2dldF9k
cnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJbXV0ZXhfbG9jaygmY3NpMnJ4LT5sb2NrKTsNCj4g
PiArCWlmIChjc2kycngtPmNvdW50KQ0KPiA+ICsJCWNzaTJyeF9zdGFydChjc2kycngpOw0KPiA+
ICsJbXV0ZXhfdW5sb2NrKCZjc2kycngtPmxvY2spOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30N
Cj4gPiArDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMgbG9va3MgY29ycmVjdC4gQWZhaWsgdGhl
IHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUgaXMgbm90IGNhbGxlZA0KPiBvbiBzeXN0ZW0gc3VzcGVu
ZC9yZXN1bWUuIFlvdSBjb3VsZCBjaGFuZ2UgdGhlIFNFVF9SVU5USU1FX1BNX09QUyB0bw0KPiB1
c2UgdGhlIHNhbWUgY2FsbGJhY2tzIGZvciBydW50aW1lIGFuZCBzeXN0ZW0gc3VzcGVuZCwgYnV0
IEkgdGhpbmsgdGhhdCdzIGENCj4gYmFkIGlkZWEuIFJ1bnRpbWUgc3VzcGVuZCBpcyBub3Qgc3Vw
cG9zZWQgdG8gdHVybiBvZmYgdGhlIHN0cmVhbWluZy4gVGhlDQo+IGRyaXZlciBpcyBzdXBwb3Nl
ZCB0byB0dXJuIG9mZiB0aGUgc3RyZWFtaW5nLCB0aGVuIGNhbGwgcnVudGltZV9wdXQsIHdoaWNo
DQo+IHdvdWxkIHJlc3VsdCBpbiBydW50aW1lIHN1c3BlbmQgY2FsbGJhY2sgZ2V0dGluZyBjYWxs
ZWQuDQo+IA0KDQpJIGltcGxlbWVudGVkIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBiYXNlZCBvbiB0
aGlzIHBhdGNoLCBJIGZlZWwgZ29vZCBhYm91dCBpdC4NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjQwMzI2MDMxMjM3LjI1MzMxLTEtY2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRl
Y2guY29tLw0KDQpSZWdhcmRzLA0KQ2hhbmdodWFuZw0K

