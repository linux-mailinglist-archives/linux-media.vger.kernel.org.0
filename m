Return-Path: <linux-media+bounces-17226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7649660BD
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 13:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18A41F29A8F
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 11:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B183192D75;
	Fri, 30 Aug 2024 11:28:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3506C190684
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725017312; cv=fail; b=a02OpPHzqDi8CrTlHIxH4cvLI3bbq9ODMUZa5BL+aIlOxVMpoARbKlxHlXTAhGvRari0z0AJzx2FhR6bdP5C87JenmSrnl2oVru4SeHWWxubehcQgbl6qxauhm3INXAkc4Szqr0f5bfCBAIphReJpBJGjv+BBx8trqlNHhqvPus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725017312; c=relaxed/simple;
	bh=o+gMTqKfe+R0WJejeEh2M/cdHFeqTMOrxEeE2ZoArrE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EKHq88JbEiYFOIg/D0Hgc4fdooW/hpP+XT4Wd15icK8KCqJuuoUkjMM9aFHWMCPkRDJZ3Gd4PG+7WCeBZ9StCXYvNvwLkTom6Qezwos0KW0A7JuQqSKoLNFSBDUCoFqlSq//ULHIpcp2QkNu/Hp7cqC63MLWZLXgDK1aMmdRGyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqxoLxKr3N37WThlWU25Fr9FljNWXYw/TseAioQuHSyLVYTrDAwMDWswpD2dP1BF2jlGQiAW4j4EHmnKCNJ39zd+DJagfv+dRcxABQcfjGFmO2/JPdn12iamOjfyGcCXmYmcmJwbuveTSzSvLI+oNfgHMwZh67hBEKBWeIhaGmbdD1/rK4mO1IDH+1ft5zwjTcEqa6o7IrvL7j26BVJSIVirG86vPOtkhE0PHRKtJHEpeBpdMh29Dty/sHQmXkb4gHff3s3bnwVn2/GAXVtg5DZ3A52ZgxIyO9lKUQCOjKBkGrcFFVd/lmQeF+2iC413Q3nUUAm3rBdH4eCDuxFJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+gMTqKfe+R0WJejeEh2M/cdHFeqTMOrxEeE2ZoArrE=;
 b=ICpkS+CcmblcBfX9IKnrH9syS8rGwAT62e3438F1UgO8VfxnH6ATEys2z2Dw93HBBHd0+eHyylTlFpA7fAEDlznssddWcTN9GZ97fdipYv+LOl8Rl5p/Ucrgkv2fOq+dgvTV1WQdPatkATaI4IdNZbExcJAjKfA0PN6e9wlCz5qxAntgDYcUtYpcruz2hhtVFm9RAyV7X+jfFRYr/jaaK59KGWv3sUCc9sgKwrMcoSudtKzaBvJMUnRbRrUFUM3/0SRIzYoBWdcFIX+3ftb7mehMZH/4qD/hzcdzOzO+sALoZOT5IQER7h3ob0gqrQJCBlYzy50AoLmFJ2NYix/j8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1285.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.29; Fri, 30 Aug
 2024 11:28:20 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%4])
 with mapi id 15.20.7897.028; Fri, 30 Aug 2024 11:28:20 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Zhang Zekun <zhangzekun11@huawei.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject:
 =?gb2312?B?u9i4tDogW1BBVENIIHYyXSBtZWRpYTogYXRvbWlzcDogUmVtb3ZlIHVudXNl?=
 =?gb2312?Q?d_declartion?=
Thread-Topic: [PATCH v2] media: atomisp: Remove unused declartion
Thread-Index: AQHa+oqqoeow0ejfyk6YZXSTYFsN+bI/qgkg
Date: Fri, 30 Aug 2024 11:28:20 +0000
Message-ID:
 <ZQ0PR01MB1302A4419D6EE44D4FC37504F2972@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240830030035.15686-1-zhangzekun11@huawei.com>
In-Reply-To: <20240830030035.15686-1-zhangzekun11@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1285:EE_
x-ms-office365-filtering-correlation-id: bd748eca-17d5-46e0-043e-08dcc8e6da25
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info:
 kHsnp8kd8vHCstvIL++KPZpR8mD4LacsNxeuayYmLzOaqwMqBm0icZNPCrExrxaZBC4vQcjCfdvhNnFr19kSifd0a9zVgHTv78TeAjh5u0pz2asZzmMlU4Y/k8ZnhbBuVoKcWZZ+fJmDMGzrqBYErwQfOXbw19sPTI+8YqcAEuryJL+qkOGXbMCuIHnW7ZOhR4qCzrXp30UcdXOkQsO7TkksYZuHgKQSaYyM3Z3pR6y8P9xJjhsBO2r7XwWpvBobrIEYwK1dNBUdhAhrS5jZECsTYaZtLqgQZIO3eFOPBOlOepBUm34vIVUmKRVomZPqxMdCHTMZcHFj0GBPoNrEJyt8Oa3a6djfaX8rx0P3bGuXExhMUoFXlWJ/uuJAFHOol/wKmrlla/IDSoY1TPQXADtV7oXbo23/bCihlbCDEvQcdkN5NOKT6i1+uyVmX+7XoR+tFZRtb0TG85eGSw1Sr1/krD+qVGyBViKbIe0oZp2AtbNQ/Otn7lzwo9rQYSffDE5/w87bDE1147mq9W0bFayCzzboz/qlOTwLYGL52jSfRiGLkIH1bZ+fobCgGcoM4QBcgFa583aUst09lIMPZ5gy7BlkGtLFhRux4kHEZNWvQUrZiZEEA2sf7+Uvr5dd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?NFV5WExkSnVSRlR0Z25ZVEpnZUZHTjJKTi8xVHlkbUcrOEN3MG82SGJIRysv?=
 =?gb2312?B?d1crY3I3cnVDNHZZWXBXSjcyY1A3OUkrdDR6MjZHV0pMTHBLbFVGeDBvLzRu?=
 =?gb2312?B?V3dwU1F0LzlaOE5kMm5BTzRhVWMrNzN4SkFuZGRDOVZVampqOEIvdFVrQTA5?=
 =?gb2312?B?RStKSmx2TG42UmpDZVRIc2RrOFJxa1pRdVpkSGZkY3JZRXF0WlpWNHRocW9l?=
 =?gb2312?B?dmNDb3R4VStKdUQzOW91eWJEbWtOMzB4K1pES09yRlNQT2FwbmduZURubW9p?=
 =?gb2312?B?VWFFMUJ5N2tKa1Ntd0tybjJiTXFLcHdJZHcxTGlvK0lSZ1lxV1lFT05DZFJv?=
 =?gb2312?B?V1M4T3NSWnVQL0VaYWlUMHNBb3FSMW9TbmRTd0N0VzNwVGRxT1NMdXZyRTNN?=
 =?gb2312?B?WTgwNG5QbUhXMy8rZzJCMkIxcnprL2cxbXIxc2ZoNXI5VXZhTnV5NDN4YWF1?=
 =?gb2312?B?akQyVkxqYXYxa25vKzRndjgyTURhbEFEQ0NzQjkvcXFDeFI0ZERNZGtoWXNo?=
 =?gb2312?B?UUFyQjhlQU5SNCtUNHIzRWFHSmVFVnhRM255WUFGdWZUcVdZSW9oVzF5Z0dM?=
 =?gb2312?B?OU1VSHJxMVkwNlJmelJKUjQ1dEV1MnhuaXpDU1dWOUszR3l1dG0xRDV5TUxz?=
 =?gb2312?B?b1NUaVFWb25GVGdEd2RnUUM4MFcyaWZwdllBNld3TlVURk40WU50M1Z4Y1d1?=
 =?gb2312?B?UnB0VHpsbVV1Z1F2KzJUVmRWeGJnaWxLMEVzWHg2cU5BZjVpakZ4amkwRVEz?=
 =?gb2312?B?U0ZXMXJPUnRkRHVPeUdVdEk3bG1NeG1UMlk4NUhISUpFS3ZnS3BUME02enc4?=
 =?gb2312?B?RmhjTEpjTFZQVWR5R241N3ZEV2ZQQktST1pqMW81M0FiZWY4cWh6TUNjNnBs?=
 =?gb2312?B?S2tBSElqRG5sWnNuNThibWIrT0QyeXpjdVpiWFNRQVVwcnQ2L1RSQ3p0MG03?=
 =?gb2312?B?MUVGVWhzbFZHaFhvNzhQMlJ4M1YrRVdmQzE1aWNnRHpWVmRiQTJCS05xTi9v?=
 =?gb2312?B?WDdpQi9Tcjh5UThYMjFxc2ZSczVIMFUyOHdjc3FKemx2OXpZTmdib1hzNmJs?=
 =?gb2312?B?Q3oyT1FuN1lGUG5kbkFvQnc2aUNQc0xTTzdDS2xBeUJYZlhRWlFQWElwRkFX?=
 =?gb2312?B?aHV5TFZ0L3ZBNTg4NU1XV2RMRHpwV0pvalZDcHV1K3E0NkFncmVDVzZuM1Zw?=
 =?gb2312?B?WDE5Q2daS3hCeThWaThpT2VrMTNRbHQxOEdwYTQzR3g4ZXY2cjNsQnluK3pv?=
 =?gb2312?B?V2hGNzYxSDNrdVVYWDVoWWkyY1Axa2xmZVQzdE45enNhdFNIQWRWRnVuRTYv?=
 =?gb2312?B?eU1wTkd1bTVXMjFzL2htYmRNYTRUWHNjQVRrZUdNS28wQ084SnltNWZUTjlF?=
 =?gb2312?B?UTZCTk43eEkyTS9FUDNLZ0c3cFJlRzdZMEJVMkkrSUY5R3FIVTJBTDlJeXNl?=
 =?gb2312?B?dkhqZ1JzVVNYd1FNMGhKbjBtdm04YXJmL1VnVmtBRTAxN3hWeTFlM0FtdUpQ?=
 =?gb2312?B?bHZEWWMxZ2t0OWhVcVllU01ldWlZS2Z2ZnBBc0c1Q3JUOGZnYlFWaHFOUEp2?=
 =?gb2312?B?SEdPZWlDcUlodnJ1V1lDOUEwQ3dYQ3JhTEJCWXA2dy9GcWo0OGlaY3hSOVdq?=
 =?gb2312?B?aTRyTHBRUjRKRGtjcUljeENlYUIvT2huSUZ3RUdqQi8zNUN5dDg0cXJkTURm?=
 =?gb2312?B?Mjl3MEZuYUtBbStsbmVUOHpxTW1xbTRaRkNsUnk3aFI0Y0dQeEdPNWRCZUlT?=
 =?gb2312?B?RHMyb1hUKytSMGR0Nzk3K2xQNUVHVkxweDFEejVZcjhMdTcySnRuaEFTTWts?=
 =?gb2312?B?Umsra2NZVnBCQmpIbXJ4OWllakZQd1pnV3l2Yjc3dlFHb3FXc0htZElsNnow?=
 =?gb2312?B?ZGtSSEg0a3Fwd2ZvOHd5R1dlTTNkbVRURmtkaGYxMUNTdlNBNDNrVnd1TWxE?=
 =?gb2312?B?MVlHamYxZGxwUzlZTmlCbVpjMmh3Wm9yOXhlYllwd3RDK1pGUmt5YkEvc3o0?=
 =?gb2312?B?azlYUjdQN0UyMnpaS0JYQXhxc2hVckQzWUxLYU1iazlKWnJUM3p3ZDFScG9V?=
 =?gb2312?B?Sk1wbm95V09TSzZzVGsrUGlNVWp1bW5pYUp2c3RzMUxCZUF0Q244YytqdFQ2?=
 =?gb2312?B?Wk9zZWk0eUJ3NjhWVGRmakN5ZXM2d0RGV0U2OHNjWCtaUWUvalN0N0ZoYWdh?=
 =?gb2312?B?eFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd748eca-17d5-46e0-043e-08dcc8e6da25
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 11:28:20.7493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GxblgIswDywoO0GwGP0HB22dUwajhLENKeBe3pLUl16bZQ8INOWZNIMXTvHT2ltp8bKMDwOkneACGqQr0pKRanjGX4P7g2KrQGGToYzX4/J32GCSBIwHUWik6Z6UWQCD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1285

SGksIFpla3VuDQoNCj4gdjRsMl9nZXRfYWNwaV9zZW5zb3JfaW5mbygpIGhhcyBiZWVuIHJlbW92
ZWQgc2luY2UgY29tbWl0IGQ4MGJlNmExMGNkMw0KPiAoIm1lZGlhOiBhdG9taXNwOiBEcm9wIHY0
bDJfZ2V0X2FjcGlfc2Vuc29yX2luZm8oKSBmdW5jdGlvbiIpLCByZW1haW4gdGhlDQo+IGRlY2xh
cmF0aW9uIHVudG91Y2hlZCBpbiB0aGUgaGVhZGVyIGZpbGUuIFNvLCBsZXQncyByZW1vdmUgdGhp
cyB1bnVzZWQNCj4gZGVjbGFydGlvbi4NCj4gDQoNClJldmlld2VkLWJ5OiBDaGFuZ2h1YW5nIExp
YW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCj4gU2lnbmVkLW9mZi1i
eTogWmhhbmcgWmVrdW4gPHpoYW5nemVrdW4xMUBodWF3ZWkuY29tPg0KPiAtLS0NCj4gdjI6IElt
cHJvdmUgY29tbWl0IG1lc3NhZ2UNCj4gDQoNCg0K

