Return-Path: <linux-media+bounces-47693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46740C84C91
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 12:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 718C93A3071
	for <lists+linux-media@lfdr.de>; Tue, 25 Nov 2025 11:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B18B314B9D;
	Tue, 25 Nov 2025 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HszSkWGM"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022111.outbound.protection.outlook.com [52.101.126.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A830FF13;
	Tue, 25 Nov 2025 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764071116; cv=fail; b=Hg5sTXc30c3t5Z5a8PTsplifGj1eaQsM/XjesgFp852+0i5zS8ODMGaS8pQwA89zYtGthFGHb8sQSpQv5Nu/Kx2lCfHZf7gEbWeT2VAV4mmSYib6ReJUxKHYRczs6eBuUJkhkCE5duki8CWIexPPctQ3OLh4unie9mPAi5BhHb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764071116; c=relaxed/simple;
	bh=vBGyCBuT2dsxTCXNHjVRRiP3o2sfpkhqq+i8a3kTn7g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HrjafAQP4w0FZty6caDJ5Hx8bse2rsHktonlxkFsMLUWKSFtrvE1qY6tFCkkq/c9CNQr6dhSSMArhGzzb6AGny5qMpPJhW3bmmOXhY7SeogZagSjx+VKEornwWdW3+Ov5HvKRFhYlZbWvyOwVwOdaJI0aEHG7Ot4hKPQD6l0DgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HszSkWGM; arc=fail smtp.client-ip=52.101.126.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OqBqCuEmaec/jn1uAbZqhJYvoX2fO7YjeUX9ngVLmT6LGoZR15BfwHueIEg1iYi32mg0pDRmhULNZypYNlFpC1eFl4lCbl/QqmBFJARpTJZqNNHWoaYhncqi7ycOBxkjKmYfoUG0QkEuwrlGSx8yS7B42MITMli26s/n4s8Mk1zv8XFeXy6+k2VNrkN3ifaMMNwmL3h9SrbkEbvHsV1YUgv55BCmf4jI2QQRmY8+Q41zqT3E6DStlY7kdgKPYpGW2IvYjY7b9ez+xS3fLnRomtAEZGg/Z4qEm7/gghmHAk3FpdA9VfZ/kVcDzBOP8xD8cx1TJ8RJfnQvVUEI9ExLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0LZ6bOHuh8WYxS6iq6Bb1hXfI+PMVA0JCipaBBZ9ig=;
 b=W2lMq0ofPQwd6BfpgIivnJJKSbVPOYfP5DR4t6ei8ERx+7HGqVQYRCL+UY9Y2kXomH2k4UT5Nweg8rVQkyiq4wARQJc5yH7gF9cUVE+gLfZ/DVOel282UIM2TePQJr386HNfnGZO6egWvKG4BUUdNzo+G6zooEYvZL1IEU9vPdHBWgeo+9BmhL2lTHpHuGpIQX3h3HdZbUZGFGkfaK8CsjNZDO0uQUNcjwJbaQv4FTmuSQzU3jeOPCXkCJ0YFBT9e/7TWcDmQiM5VpWqXUSL3M33H4NRrCCWTcJQa74+GcChLpOA2ZgKB0gw1ajW2gRv8/vo2WPZmFpfhpTNfqPyuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0LZ6bOHuh8WYxS6iq6Bb1hXfI+PMVA0JCipaBBZ9ig=;
 b=HszSkWGMyJOasIRdJZNFDHVJd/7wYN/4yEwAr40XtNuFCBFst4p0c1DKn8PL58vmX4ychH9fgBXAZt2DgJMEVdAfh/kKPr955Ot2pfTQ0SRpO/cAHEle4dJX/1Tw/vCpMEooxHQebJFFMlCXSagVMvFo9gWnVDnyth/CEtL23YyJEnZdS0G6UzyhZpkYf4ilJBr0l9zqy4VRxyZBy0VWE+/SXiWPoPNS+obAiQWio1iADfxoxQbSPU5E7IkQ6aHfOA8CGr86s+81O5y0SiXvOa7UKwShzmt/V6c5HSEuVvRtdsr91E10fxee7jFDgJ661FgGvPdSbmm8e9KAqMQC1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by TYQPR03MB9457.apcprd03.prod.outlook.com (2603:1096:405:2a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 11:45:09 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 11:45:08 +0000
Message-ID: <db18fee8-6117-4356-a212-bfbd9cbcdc05@amlogic.com>
Date: Tue, 25 Nov 2025 19:45:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20251124-b4-s4-vdec-upstream-v2-0-bdbbce3f11a6@amlogic.com>
 <20251124-b4-s4-vdec-upstream-v2-1-bdbbce3f11a6@amlogic.com>
 <07d0b355-861f-443a-a3a2-e003ecbaa29b@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <07d0b355-861f-443a-a3a2-e003ecbaa29b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|TYQPR03MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 34293610-f1cf-47a6-d7ec-08de2c181587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXljODd4LzRLcHpzenpaU1hCWWI2SkVxdU9ucklTQlBvZjN0V0lOR0xKQlFo?=
 =?utf-8?B?czg1UTZzdnhHT1IyL0lGelJoWmdhUER3aGVBQldQY0xlYUxOSDdObHB4bUFG?=
 =?utf-8?B?c3UzU21tY1Z0MklZWSt3VllJcm51ZDkvMmw1TmErKzkzajFjVmxuQ3RZSjA0?=
 =?utf-8?B?NkZWTlRWalNyb2Zja000NGpKRkZTRHcxNTBFVVloN1MrY1pzRFpiNWtyNFZB?=
 =?utf-8?B?QTRjYUxYSU54QjhabTViMXVWYVl2RGNGQlBLMkZnSk9JN0RRSXRvcWF2QkU0?=
 =?utf-8?B?WU1UZkk3SWpDV284RmRYUTF6RFJlNnMxWGN0bkQrRElnRTh3YmI5QnBTSEJx?=
 =?utf-8?B?YjNBUjUzUlhOaGpFR3FJcFRNOFFhczlQcjJYb1NJajJZcWo5MUVRQVlscnJZ?=
 =?utf-8?B?SUdmUmlmcVczMktkWmxIQ1FDOEhLT3N3UTZJQ2k4V1JDN3IrSnYxRGVDZmtU?=
 =?utf-8?B?bnJMbllyWlBBLzVEMUI1Yi9MN1RsV1oydmRxU1dHTUVkR0k2bmljYTdwbWM1?=
 =?utf-8?B?Rk1GNXpNQnVKcWdEazY1Zlc3NzVGcHpmSWxtSGVTU3phL2FNSC9PMitBWU5J?=
 =?utf-8?B?S3BDbjJJcnVVbHdPTmNKRCsvMklvcTZSTWQ2Qis1aGZFL0w1RHh5bHlHTHpU?=
 =?utf-8?B?cDVLUmNtaFQxQW5hemlteHJocmZkZUN3c1c0dDNyZHNFOXZkaWlhWGVZNDFv?=
 =?utf-8?B?a2FzSThoTmlBTW02K25HdDhHV2lHcU1hOVEzSXpJU2krai9vRE1yQkJ6eThH?=
 =?utf-8?B?UTVxVkU5b0U3NEsrQ2k4RU9aMFdvbHJWc2ZaSXZuOVhjNzB2dXBVS203dVdh?=
 =?utf-8?B?R3hZYlNpWjcvQ29CTFhoejlOb2RZSy92T1VQdnJtYnI1cGZnWmlDNit0Z2Q5?=
 =?utf-8?B?ZE42c0lvNjZ1UmlpV08vWmtDM1JZZzUwYW9xWE1uR0tSZWlKTk0rcVplZkNG?=
 =?utf-8?B?bVVQTGE3aDRSMDhGYUkvbWhaeC9nTVhxc28yNU9Ld1VpWVpPam1aVXROaEN1?=
 =?utf-8?B?TFdHVEthbTk5T0hBOXA5eGt5RFQ4cUh4MkY1cHpXa3I4ZHhpSGxRZ29QbnI2?=
 =?utf-8?B?NWl3K1h1Y0lUeHlhb1dpQm1zVXV0QzJFSkw1TENNM2lkd3pqSzdaU0RPUkF4?=
 =?utf-8?B?TDZ5R2k5cEVzeHdIaTN0U2kzZHBVME1HdkVxejg5NDZFUWUvclJFRWRFWnM4?=
 =?utf-8?B?cDcvdmZTMUN5dU95ZU1yT3VzaGRONGF0M1R4eUt4dk5tVTBWYjFzVWhkaWc2?=
 =?utf-8?B?ZnVjdUhJdlNjelAxRU1QQStXYzI3MDNGcE4wSHk3QUFJblRpaWFsdFV0bllL?=
 =?utf-8?B?LzhsaXBid0FiWW9vTTlqNWVCVGpTeEFoV2NLa2ErU1BYTDIzNmU4eFlsREtq?=
 =?utf-8?B?bGljQVY0NGtSa2JvUEtlQkROdVhWdzZJSHh2akhQTzZZckVUMjI4M2xPUGpC?=
 =?utf-8?B?TEUrSnhGY1MzTUpCY2U3QWxNMHlnR0Z1eDZPc09kTnZaNm9ydGE3SmlJSCs2?=
 =?utf-8?B?YmcxR2thQjZoNUZ1QUFmby9DVkpsRkE0dTcvS0paLzlCaVdhUFpHQlMvaS91?=
 =?utf-8?B?YmtDckFlMWk5d253VlRaVmdrL2xNLzBydGVkU09Yb3gxMjhldi94T0tGTDNH?=
 =?utf-8?B?ZkhQNmxsMUx0cEY1VUVoR3RadnFQZWhBYkdFQkduVktVRUVOSXgrMGRGNDEr?=
 =?utf-8?B?RzJtblczVys3L202VThTYkJBQVZzWkZXZktxWW9NdGtjWWJ4ZGtnTkxyTGlL?=
 =?utf-8?B?a1B6V3U3WVlyMk0ycVhwU1BneHhUNUZ6ZUJYU0o4Nk1vME9Ld2p1a0FLenJP?=
 =?utf-8?B?MHcydG9UYXdkejFWcWw4VktVaUNyaTBxaHQ0c1FoOWU5RnhMQmJyZjVQYjJh?=
 =?utf-8?B?MnhBRUtPTThxSHl1aGdaK1kyQjYrVS9UaGx6S0hpRjhqcE9vYTZPRDZyL3kx?=
 =?utf-8?Q?9vqQny7etci/Fb4ppXZx85dWkofFlx+R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU9nUkhVSnpFTWhnOCtpYWk0OTBCa01BcG81N0xiTkl2VG90cWhWTTBDVUo1?=
 =?utf-8?B?NG9JNkVGS3BNQzJBNmZGcEZudXlZOXE3OFFjL0pxVjBEU2R4a0wzY3o3aWR6?=
 =?utf-8?B?VXJhcTJXNjNZTVNaMUhCM2VUM2F0ZkNBdnRxVjdsdE5uVXg1cnpPQ0tpc3lz?=
 =?utf-8?B?MkMyS0x3cWtuYTdKN0M1dUZJbjIrczFCbm1TYUxsTU9mN0FqdTBpNVNGNHEx?=
 =?utf-8?B?TjdaNlJ4Z2JCY3FLNFhTekpNbnRZY2dYa2JkQVBYRm03L1p4VFpFYkxocmJp?=
 =?utf-8?B?RW1oTXQ5UmNmNjQrczl5Y3RxS2ZhSC9wZjhrRTRxYkppK1Z2RWtVcGMyOVVt?=
 =?utf-8?B?a240Z21SS0tNRW5sRGJPYm9kTVJ4RFoweEZtTG1wdk1BUmtNVHVzWnBHMnVL?=
 =?utf-8?B?bXdyOE9xTDhIY1RzczlOYll4cjFGYy8wdlZ6U0pGQzRJR01TYkcwREREWU1D?=
 =?utf-8?B?eXkwbTlpTVNkOW5DUVpKT3d0QVdTVHh1WFIvUFlxZUJSZkVTYmJDMkE2ajJD?=
 =?utf-8?B?U2Nnb0tGZUUzR3UyWnFFazVUMUVZbXZra2w3RjhmZzVFQ1Z1VnBkNW0xSEl6?=
 =?utf-8?B?ZmoycTdEdmxWWGRjUUNreDM2SWZTcGNpVkwzTysyWGRKbU9MTmNjenBVZkg3?=
 =?utf-8?B?Zk1mUjlJSzdkQTE3bUhEM1VybTJhNHFZbTNyVzQwWGYyczBJYUo0c2lWcTV1?=
 =?utf-8?B?dXVCTGhDZFMwZTJ2WCtZSDYyMjQ0MmJxQk9hYnJtMHlmUE83YTFWWTJENGNO?=
 =?utf-8?B?OXllSmh2ZW5VdjFXUE4vSDBJQzE3a1hzbVM4bEc3clR1bU52UW1Bd1BLQXJo?=
 =?utf-8?B?NWQxL1NScXh6a25lWXlnVmhTNWJ6VlBxUnd0Q0Z0ZkUrV0xkMmt2UUdQWFpq?=
 =?utf-8?B?cE9ER2h1N3hoQU1SWGJvT1k1clJraG9MWktidkxHNnUxRURaV3MvVDFiMEVV?=
 =?utf-8?B?Q2Q2clJPcDV3TVZhWUlibzV2dVFYRzh5YTgvdVVETXpFcDBQbUppUm0wZ1VD?=
 =?utf-8?B?bkhyQ0krYXRBRVVubkFGRG9nRnA1ZkR5aldYRitzZy95RFF6cGxKUlpKaFF1?=
 =?utf-8?B?R1lndWVmVTdBYTQ2eE85QnFGbGZwYU1zZnU3aGxyRStjeUpNb1ZBUnZjYlNU?=
 =?utf-8?B?YXNuRm03UE1qQk42YW1zSTlMWFh0QzkzTGFNRDhhMEpjZkU2T2VFeHJWS1RW?=
 =?utf-8?B?V0llWTZoWlBMZUdNcTUzN2VIZ3ZXZm5xdEpqUXZzeEllWGE2STFGS3ppWjF2?=
 =?utf-8?B?NS9SK2NzK2YrTDR0aGRIaG45eFE1Uzd1aWM2emVGM1BpQy9GclZuK3JEK3g1?=
 =?utf-8?B?aGpuQVpBNzlxVklqOFpEOXRKaUxNWWxzbklwOHNJU0lwNTRLTjFJR2YrWURj?=
 =?utf-8?B?QXZEVW1Yb1BMV2E0NVBQUXhKcHZFVk8vUUpTNzdVTlVnKzBNWlBnaVpiUk5h?=
 =?utf-8?B?cmZxUWtoUS9pTlhHM2hyQ1hXNHVTSFhVbUhqY0o4NUJjMmFESHlHY2pjY2Zq?=
 =?utf-8?B?MmU5Y2hJRkptYWtIZ3VJZVdtNkpVdnVSTXBNa0FoaTVoZzhrVlQ0MHkyODl4?=
 =?utf-8?B?dVlLeC9KL3doNFVoeVI3OXp3WVZYVTlxeFZvTlZCVlpSUFJubU1BVEJEeUsv?=
 =?utf-8?B?Y3dKMnRFTi9Gd29PUEdRSXdvTHRLUXV5Z1dzczZQOWw4WFZLK1lLTHl1UUM4?=
 =?utf-8?B?RENXTU41bTJlOWkwMTU2UTArdjM1TzRxVHdQMS82WlZqQ3hBNkh2NGtBSnVs?=
 =?utf-8?B?YVJPZjhMb05wWEFkL3drT2VHSkhoNHlTckcyS0cxdU9YaGUxSk9LUloyQnRW?=
 =?utf-8?B?VnpIUDhKcTF5UE1Ddy8vQ2JlR01ZTkFQTDg2c1k3bW00K3ZqSkpoNWU2YUl2?=
 =?utf-8?B?a3pZQ0xLMExGQjRLTC8wRHUxM3B5VXJvT254K1RnT2dJK20xbkNvcERJM2hV?=
 =?utf-8?B?Uzc1TGVoRExHaG45Tng3eGFHQ1JPUytXS0dNOG1OSWg4WUxpWXlybjU5YTQ3?=
 =?utf-8?B?WVI4K1FxcHFNelV2SHc5Z3R2S2w4aEJRSzVmQndLaXREVHVSZmI3NWVNS2lH?=
 =?utf-8?B?UGNWSDU2eWcwdjdZUEZhL1JlYTVyUUhZV0x6WUpPT0dqSEMxamIwQ2JLdENM?=
 =?utf-8?B?VkwySFBLSDVJVENkN3FMK0duR1p5alVQTm4zWmJ4Tk4xaU1zenp1eHkzTkRD?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34293610-f1cf-47a6-d7ec-08de2c181587
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 11:45:08.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSFTZX1CEvaD1miDU7OS/T0W6BFT7QYgJsf5kI7KCwVlPdXZDR43GU4HgU6/9KOlP28Cg2hO+wkWYS9yL7C+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR03MB9457


在 2025/11/25 19:31, Krzysztof Kozlowski 写道:
> [ EXTERNAL EMAIL ]
>
> On 24/11/2025 04:32, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Describe the initial support for the V4L2 stateless video decoder
>> driver used with the Amlogic S4 (S805X2) platform.
>>
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
>> ---
>>   .../bindings/media/amlogic,s4-vcodec-dec.yaml      | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>
> Never tested, although maybe you imply this by RFC. If that is the case,
> explain IN THE FIRST paragraph of your cover letter why this is RFC, why
> this is not ready for review and mention that because of this you did
> not test your own code.
This is my fault, I didn't test the dtbs check carefully. This will not 
happen again! The reason for the RFC tag is that there are still some 
Fluster test failures and we are resolving them.
> Best regards,
> Krzysztof

BRs

Zhentao


