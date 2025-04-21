Return-Path: <linux-media+bounces-30572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C80A94CD2
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05C7C7A34F4
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1871ADC69;
	Mon, 21 Apr 2025 07:16:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED6C63D;
	Mon, 21 Apr 2025 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219810; cv=fail; b=RoTDd6guwPuSnU9hX3NlVOr/56pvROOatCOJFcaefwpgi3WxIzmoQiZtXJMCAsp7w2q/BKYOwOY8BFNGPvhF/gKMNgoomNlqxieBnYPZ1iGL5127sNk2+b7JLlVLnu82kr1Q6oqTsWkqIuhjYilLdLZT50/kjYyOA0h3rsZhTgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219810; c=relaxed/simple;
	bh=+2NM82EFUi0n/K/iIiYZH/xhNUTn5LAPFTyVxqR+nIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G/8rXKVT7VF/WdtQGq68cIM/nSk8VDLsIqevXdyqFl4kONbgCCmKZbUu7DefurpQYRVKRPx+OaxGH9Must5sxgEV7WkeeMiI+b71bQylTdjBKyeXbwBrqg0mNrqDWADGotZmxPGY6VwjtiBMs0KtPUV/BoKqJ5XxCLQWHg1fuFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YluLlSDLAUNeJkhwcBgXB2lZD3MoNWfbQ6+zlvwHQBAt2cXSwrDh86tuEOTU6dHqblStscwMyAMqFOY0Fxm4P9xF76FN8IlHs2zqh2vQUqjFvNswbBYGDXhZ+63hW+Kl13KTYww4GvJ/lruWjLLLdAI4jPwtJ/wu+1nLeo66/1l25E6T4YxuatkKWrRX/oSLT0RY69V49IsEleafelLB2yQFIUYBItV+a3fxnmCFPujPK1uQZ/1PJswhyf92dpx2k5NUm3pmwE/i3CB7f70iHr82RUedZPshpCGvqtGmKk4Dspgt3u4MjtTGkJ0oTGzY7Hzld/g9ktU1nZnZjh30Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2NM82EFUi0n/K/iIiYZH/xhNUTn5LAPFTyVxqR+nIU=;
 b=LYgwFsDXzVotZODZVT5RXZyNdhstq7k9yi/ZGZdOVpolPmpNNi5xBKyP5O354ubHB7LqbBqSLxwErEkBfBk5ia/pYPMY8QrxpLpuBPy81d8WtnIE29OGB0SD1FyWausaFx9bYMkoIjAGkcWkfbyrRo8vwtQrkg3feUlukBvDVAxm+sV1pjALOSuNkBa0CczsD3emqmmpCpi+j+fV5fPDmnZmWNbakzhkanbvnriuD1OqSqF4zKzg3tZ8D/8NDn7yYcBaT0gBl6mcoRt5XAuIAT0hD9v+tFKzUJaOCeK1H88O8Q9P9nVugRDoqaCeIzSS8Jl/xVpIlx15ehRFgQMotA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1286.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:00:49 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%5])
 with mapi id 15.20.8655.033; Mon, 21 Apr 2025 07:00:48 +0000
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
 =?gb2312?B?u9i4tDogW1BBVENIIHYzIDA3LzEzXSBtZWRpYTogY2FkZW5jZTogY3NpMnJ4?=
 =?gb2312?B?OiBhZGQgZ2V0X2ZyYW1lX2Rlc2Mgd3JhcHBlcg==?=
Thread-Topic: [PATCH v3 07/13] media: cadence: csi2rx: add get_frame_desc
 wrapper
Thread-Index: AQHbr2XlT1hvaSx8DUCuiLvYmGnw17Ottzkw
Date: Mon, 21 Apr 2025 07:00:48 +0000
Message-ID:
 <ZQ0PR01MB13027DBD33AAC8D3F237EFDFF2B82@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-8-r-donadkar@ti.com>
In-Reply-To: <20250417065554.437541-8-r-donadkar@ti.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1286:EE_
x-ms-office365-filtering-correlation-id: 005e6609-81d3-404e-81c9-08dd80a23f17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|41320700013|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 N9qRilYUghwfT1q98JiUNG4xnK5Ca0figDCNnpp0NEu1HJ4NgEnV6Wjrzp3BY5g8phfRUtn9rQmeyz2RneFn/GOuDMoEbXwOcJw/Z8v4sb+LiX4LP0UEaxZH8WEp0WeC1OnM0dep9c262pbdlJZ8W6kUd8aqBvTHFWlauv+9PR3jtoGFq+ht37i1rqXXYsqkt/TsDjJ5qy6S44Yns8sudFjgXtSrJrnwnX+M0D+FQXZ+NE3KZpUQ/D4J1kS8f9wacSXL5OCMZf0+6w317XchJVL5QFVJLuJv83noR/Trum98SdlmWLRrgzlrqPOBxh9WzivILVfzt2f9Nxwnnoh5tlFikrfewOfr2TA/dt/9bUfebJNgMwOha7sQDN40B8EI1L75I19vffXe77WL3PfVfq6F+IkBx/eXPGmWuDW4Ayo4I/lveTANlHt2wadOrdevUyYQtYVBCSmNSWCjrakyi9ZMdXDZjBfdLHIbj8bkq9WX2DSJcsMQkELs2aUcnJKNMIjHbBwLTzxy0hGpVlB1ETswOTA4jnwHs6Pc9+tjuY/zz0Vs9xXY24FIxkL3eO2ZdIZXvvfFqD+usBvExXVYgATOaKG9fxqIgISXtcwkN0s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?a2YrbFY0cHNrME9RZFk0a1pRa3hQcTV3WllZODhobnROdVRzV1RaTnRpYVMx?=
 =?gb2312?B?WkhtMXZwNkxRUm5heWV0VUowSGpjbDRZYmxqdGlvMXlyM2ZFa29MNTdFa25L?=
 =?gb2312?B?T1oxVXMrYThHOVhQNFRsdThUQmRJZ29Ba3h3cUYwYnR5NUNSSVg0YUo5bkFs?=
 =?gb2312?B?OXo1ZVFWTi9IUzQxYitpcmt3cHd1ZEJ3bXd5Um9LKytiUXJhdFNxVTZ3WWw0?=
 =?gb2312?B?WkhxRUloR0pYWExhdGxIdlRFZ3Z1NzViNHEwOHUrb3cvckRucUc0ald1N3Bv?=
 =?gb2312?B?K3FUTGloT1dseGF2THoxS2RzcnlHYjcxMm5DZ3VTZFllVnpTMDcyRzZYeERZ?=
 =?gb2312?B?SnpLVUloYzlSQlBWS2VtTTBLT3g0QTkzVCtaYW5qRytqMVJiM3AvQVJqWmE3?=
 =?gb2312?B?empYekhMdHdCSFBPdVN6Sk5lSlJwOEg2U0VyWHhKZDdMd1dDYzhDSkgvQVRw?=
 =?gb2312?B?ck1Bb0h4K0RnSWRDMFYyUG1pOTZYTStSTkxpMmFpbE94SWNGV1pveGd1V003?=
 =?gb2312?B?NUJBbW45WWlXUFh0dVhJcEc5QU5Qdit2YWR5c1l4b1dSR2t1S3BpcmYyTGNY?=
 =?gb2312?B?VUZESGJRUWxWZTlNSjdVUGpqV0h1SUd3V1IyVmx6UmdRS1JaQlpwNkVRTGVX?=
 =?gb2312?B?Q3NNaHdZRHI5NnlpSVRpSkFPbEg4RnRlai9HV0FadWF5dXpCWGZtUzhDMy91?=
 =?gb2312?B?Y0FJS2JtMkY5cDJGUC9adnFQY2hCTVdtd1RrVFhvRW50aHZ3UXBhejVQbjBD?=
 =?gb2312?B?RVJPWjlXMGRmbnhCWlhHK1JGcitwVzFOYWJHa2R0by9OdFZkV2RzOVVLdEdx?=
 =?gb2312?B?bTdFOUtmUEc5aTZac0N5U2VRTTBod1JZZUVoekpxaS9kSFkyRk5aOStZZ2Vv?=
 =?gb2312?B?eERMUGZ4bklqeVFlT3VDVzVIdXB3OXRLRzZkNkVGR1h3d2hvUmZTZW9zZk9C?=
 =?gb2312?B?ZkEzeURpWnUwMkJYanZNblgrZmp1MDlMY2hpV2RSUGE1R2NmbUQxVlFKc1k3?=
 =?gb2312?B?QnU1aCtHL3hKbXhYRFhFZjB0Q1g0NEYzQzVEUi9TRlZBVXJKdWcxQXZkS2Ri?=
 =?gb2312?B?RFVFM2NGdVZEU1YwQlhDUndxMm56dVFyWHhoRkZSMlJTODk1TndXMTQ5NzlB?=
 =?gb2312?B?am4raUxrdkpjS0IzMDRLd2p6NE1JNFlDNk9hNzRpaUxodS93MCtTUW9Hbjl1?=
 =?gb2312?B?MjV3bVdpcktMKy9zM0RrcFVEOGNKQVhtMi95dythdUY0ZDI0TDRza3phVmhM?=
 =?gb2312?B?SzExQ01kanVtTjhWdkw3V1orWUsyK3hydVBEQ0dKVzZZZmh0VmJnNFYxK1VT?=
 =?gb2312?B?am4yRFROeVBwaFpqd0lhYTg2SWMzNjhrTzFNMS9DMGhuZkRBYzdXODg2VHJa?=
 =?gb2312?B?N29zS3VIelgwMzJhVk8wRC96MWhzY0dIUWxabUt1NUo3UmlIY2NReVVGSk5o?=
 =?gb2312?B?ajAwOXJHdzc1aHBOckFZZENCUE5XdVhpNTl0NXR0VDVnKy85eWEzRnNqOFRx?=
 =?gb2312?B?VlZwRUs1V1N4QXFJaHJIdTNkQXowM081cnlhck5VdlBVd0VMcFhkUlNaeEFK?=
 =?gb2312?B?eHQ0MGtva3BHK1dIa1NGdVcySXJZdEs1VXROTGFIZGhFLzNpeTFQaE9acXpI?=
 =?gb2312?B?VUlVVGZZeEFVVkdBVjB2em8yNWx5R3E0ZldOS3VkSktqR3ZoSHJhSjdIaGdh?=
 =?gb2312?B?dUpxYU5oelE5ODA0QTQyTFowdGErVmVuWTdJRm1lTlowVEFpcGI0M2c3N0Qv?=
 =?gb2312?B?QnZaWkcrbFJCZkp2MDZjYXk0WUJRamVXL2tjOG9CZ1Q2cmt2bkt4dGIxMFdF?=
 =?gb2312?B?Z0dqSy9VZmNkd2pTNzdkUTNwT1NCbHc3YTdrNXhSSmdIdVR4elRvSkVqbzRj?=
 =?gb2312?B?Qk92dkJ6Vk9FWDJJQ2VoaFVOcXJxQlpuZ1pZVGpGdzZRQ09xa3c0ejVjNGNt?=
 =?gb2312?B?bjYrSWVQZkdQRzVwZFkvRkphNm5pNS9udUpNcGhIamhDNzlNV0Y0MXBnOURR?=
 =?gb2312?B?MkxtbWhpYXR4OW55bjBHWGR6R2JhRnM4Njg1d1VvejBRTU1od1NYK2gxNmZz?=
 =?gb2312?B?cGswQ2YvVm9vWWdIMzkzWE53YnUyMFI1aHNqNEpFQ2p1NEZMaVNPaHJ1NDFV?=
 =?gb2312?B?Z0s0dnVsem4yVFg0RUVzL0UrcmFwZGkycXFCcC80aDFhVUM1Z2R0T01CNFBk?=
 =?gb2312?B?d1E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 005e6609-81d3-404e-81c9-08dd80a23f17
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 07:00:48.7686
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wygHKQlVY37wNljVcIRvIpnZoBgb/lRRCeREakP/c5JvHvA/A65cwCVHaWjzjSquiqbJyqeg+DGaOM1/HLT5HDERj6CQSiN9cce9UOTQ3vojWW1Af+z4rMyr2WCefrB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1286

PiBGcm9tOiBQcmF0eXVzaCBZYWRhdiA8cC55YWRhdkB0aS5jb20+DQo+IA0KPiBKNzIxRSB3cmFw
cGVyIENTSTJSWCBkcml2ZXIgbmVlZHMgdG8gZ2V0IHRoZSBmcmFtZSBkZXNjcmlwdG9yIGZyb20g
dGhlDQo+IHNvdXJjZSB0byBmaW5kIG91dCBpbmZvIGFib3V0IHZpcnR1YWwgY2hhbm5lbC4gVGhp
cyBkcml2ZXIgaXRzZWxmIGRvZXMgbm90IHRvdWNoDQo+IHRoZSByb3V0aW5nIG9yIHZpcnR1YWwg
Y2hhbm5lbHMgaW4gYW55IHdheS4gU28gc2ltcGx5IHBhc3MgdGhlIGRlc2NyaXB0b3INCj4gdGhy
b3VnaCBmcm9tIHRoZSBzb3VyY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQcmF0eXVzaCBZYWRh
diA8cC55YWRhdkB0aS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphaSBMdXRocmEgPGotbHV0aHJh
QHRpLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvLm1vbmRpQGlkZWFz
b25ib2FyZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJpc2hpa2VzaCBEb25hZGthciA8ci1kb25h
ZGthckB0aS5jb20+DQoNClJldmlld2VkLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5n
LmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg0K

