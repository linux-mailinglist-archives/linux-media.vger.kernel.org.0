Return-Path: <linux-media+bounces-33350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A80AC3AE4
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 005D47A93DD
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1A31DFDB9;
	Mon, 26 May 2025 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="v4D4sx75"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020115.outbound.protection.outlook.com [52.101.167.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF231607AC;
	Mon, 26 May 2025 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245888; cv=fail; b=m0315MD4+mFsyeYGwvcrwJ8S2UzdhkFKB3dY1v+Iqm0M758Z0I4rc0h2uwMewYj7/jkpxQuIi4qrjItMaXSvXn75kD1xw+sCka5B9v2tOONaG+TNo6oOEUyjsFlcQSW9xnejsIhoy6ZeVYXKzMu1KTV12KeLni22UgpYpU/japQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245888; c=relaxed/simple;
	bh=CWDR+4bck+MDvCqmLGqN9WudFshQBObgKU9ZfhuMcCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I7BFkpxLGsrEsWx9eVMdQWhmPym8P5BNH/eD+fuNBk+ZJOORhxpFsXieNvdpArwFo77MGq4xad/k0qrzZJn/bbPlZvYwsKIFEEsU4lwWZsNyawAuHfqs4jopIyZe1zlAVDtFsZhXwxdAmOVmflUeGL6t7C3xWQd9CbJeDEBVPiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=v4D4sx75; arc=fail smtp.client-ip=52.101.167.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWUtNBCcEZ84EBw0R0dCPYbTcUSdMe//kwQK/bekbtWjIMdDWX3+TsgUv3m+CJO1HU+QxVPdKts8+rSdKUKvDGUAyXSDtLzk4eFYQ+2U0y6/zXxncEEXN/hutFTWhJs9PA3iQRFwJJU3ZQY+xiIwrEdFbEStsT9dH0diGxmA3wFZpY6d1kaLQYTYpYwFWnokTEROVePUXjLPmjCz/pQ98gnk6u0Z645YS/+fXMCfPmtyPP8rhoPfOj7jtc7otyGGTwiRU5IlPcvyUmP18ryE6/RSfhFGWRf1PHFcXC4hFpzfOAzCW9LazjOI1gKkbmjTBq8y8/gnR2Pzttg9EzD4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeSINUtZl0nPn91jS6GAvHrhC70+M+LwfCoxIE0v2x0=;
 b=A/nmfibxyQG7FFb7S+D9SUGMUK0OrblsbEBiIS0zMPstjrJ8pwhs6Fx9149lcoIrBjyHc+kupHhOttaGCaJGnwWTCEz+0EyirTNuMpAZGMeXWWSBhhLDjqbQUnq/wwONOyqQ9jDFSfDvIFESR1NvUP6Q75vmN+b6aVRDRuM4Q1gi2o0h/3ogzIiT+HPLLLGndHYwf98tHu8eBTPdggr0MHLhrctbAeWeSfbEakZ8xq/hGAG5cuRjqRJyXNyIoTBZ/zLop4ap9z8/U2x2NYtBoGD096V3jpUrpk8coh60VI9U59lasYrSeG2YxfJNtv1sexsNuceArybo0ZLErET3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeSINUtZl0nPn91jS6GAvHrhC70+M+LwfCoxIE0v2x0=;
 b=v4D4sx750Din3a0YdfEQqCjFVCCN5lcRuezqByMkCr2OjwZT1hF0c8dgCbY32BPVM9GlSiJMpCx2tND+ULHxiRHibXHzPTs3OAwGQNee+ZVNfUyh38GL+/ZwOHaUhmvVmSobpRtczLS5VRL19BMD8AOv2CyICO4WuUOfdxd1RqOb4AVa0LCUkRVaKkiCp9VM9TjidqBBKd6PW1cELukC4tORVSIQhI1jcsUB5IXbwGZvbl3miL78qyFrCGiOQJ0Bu7T6YhrItSDv1rRB7ICucbOrTd9Sqh1HvrUA/82uQUqi6aajslpZjRg2yO8eeNoyeqkx6tYvcxo34oOafUOKJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PR1P264MB3327.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Mon, 26 May
 2025 07:51:22 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 07:51:21 +0000
Date: Mon, 26 May 2025 07:51:20 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Junhao Xie <bigfoot@classfun.cn>, Rafa?? Mi??ecki <rafal@milecki.pl>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kever Yang <kever.yang@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
Message-ID: <dujdd63m77qkcey3a54hpykklptdsw6n3njas6uk6brqklekxg@vltajft3fmtu>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
 <86a27f47a72a2c2f9a7d15250150743c5c43c0a9.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a27f47a72a2c2f9a7d15250150743c5c43c0a9.camel@ndufresne.ca>
X-ClientProxiedBy: MRXP264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::26) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PR1P264MB3327:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af37007-3193-4aac-9e4e-08dd9c2a1b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VklFdjYvdG9kcm5OZHYrSHphV2RGSDBCMVYyM2JMaGRPbDdSTk5taml2dlpR?=
 =?utf-8?B?bStubW1nakxmdkFSY1FSM05kMWg2eld6VVlOVE5MN1VFTzZ2T1dvNFFRemd3?=
 =?utf-8?B?b2l6L0JyZ25xRjB4VXRhVWdFU2twNXNVbzdBaXVweitxV1h3Rkc3ZEVtZzVa?=
 =?utf-8?B?Rk1hZHJIbUVIR1JUWDdXRERoV1NxSnROWlI2UkJvNHg1K1NNRkhkQzJVNE1k?=
 =?utf-8?B?VXRoY2R0ZUhSaEFZZ0ZxQm1FUkZ1bWI1RjR3R3Q1cVU0NjIzYUU0NkdzNDNE?=
 =?utf-8?B?RWpSTmRFYWhFanl3ekVXWTMwRUx2Smp3TkJlemErTVNXallXYmw2NXhXRmR5?=
 =?utf-8?B?ZTVSdHV2eStOb0JmemExU21ZMDJEUVQ2bHd3bEphMVp4QjNiaXlML005T2NF?=
 =?utf-8?B?UTJodWU5YjJIeHJaM0paVUU4V1JJa3JJVmxoUTNIRlRpOE1uTzRJL2xZWi9z?=
 =?utf-8?B?Nm5ETUkwaEJHc3FuZEIrOEQ1blg3ZW9haDVBRkhVMjRrRlMyZktkQUFpRlMw?=
 =?utf-8?B?aE00ZllxSDBITkxLSUxXL1h5ZFFzTTkzbkVOZTVuTk5nS1NWOWNCTUJVYklG?=
 =?utf-8?B?aldDRXdYZEhJWkNkVzZSd1VYdHJvZW1xV1B0R2MzeHNsUXRRaWhEMCtpeWZh?=
 =?utf-8?B?Q1RuZ1kxZDh3OWhhQ0YxdVR5MTJXMkhSajdqbUJTWlhwVzNZa1FxYXNVOWRD?=
 =?utf-8?B?WVl5MEV5bEV4Y25xZ2Y1THRmMGQwdkIxa1hsV3N6VGNEQjJvb3RiQkdpSDlr?=
 =?utf-8?B?MWg3Z1gxK05lSnYzTTNkcGJvbGZYbDB1a04rOWxIbDQ4ek94OW9NSWxvM1k0?=
 =?utf-8?B?TSswZmYwZ0ZiZDE2NzBlU1I5QVBpNy9OeS9OSTVwTEdwRzB5bFRZdGI0KzRK?=
 =?utf-8?B?RTF3WCtZdC81eUdQZWhiakpMekt1TnhTUTVpOExONlp1UFVuSDBCK1o0WDBs?=
 =?utf-8?B?Vncyb244SjVXNTcrb0JIaFd3b3B3SExkL25GZ3ZIbWRnazBqWXJtSUtGZ1Q5?=
 =?utf-8?B?N2VOUGdkUUJHdmR0SytYUG5GbkUyQXlOdkduQVREVjBSNnhkWTlhOXdkUDV2?=
 =?utf-8?B?R0dzM3FIUkd5dncyZkFQR29Zb25NOXdKNHJxdkxsWFl6VUVyNXlJVjZVMThN?=
 =?utf-8?B?eHhJL01YK29KUEFEd3BqYzlHRVhUZ0NJSW9rdHlWcUdBN082ZzZwZVdPdDVo?=
 =?utf-8?B?TzQ4eVh0SnVJUzd5dE9oa1ZNdHpkOE1TQjRJaVFSTHhqd0cwaUtJT0tFMGl2?=
 =?utf-8?B?aTMzTjU3WDA5eXRZK1g3Y1p1RmdwNXpDeFQxUWRPQUU4NVp0VVE1TkUxSUhZ?=
 =?utf-8?B?V3N0V1dmNnRjRCtIaVM3TzRQM0dUYWZVallPdUtlMkh4SHh0cnVyYjQvbUc1?=
 =?utf-8?B?TnErcFFyVklmK1U0S3BQNnFyb25WVCtqNCtBV1VZdDR3UzNLV3Fuak1WUWxq?=
 =?utf-8?B?TXJCZGswV3lGUTFQRVdUS05uWTVTMlowSmtKQUVXeWtwaTZGZlllOGMycyt2?=
 =?utf-8?B?anlybWNhOGNnR3NoRUFXMUJnd3FlMUoveGE0U21INERaeWZza3h6K1VrcTNG?=
 =?utf-8?B?R01tTVVuSkxSMjRmb3M5TkwrLzkxYXBTdXYyTWxhSitLTGovTzliQVkxT3I4?=
 =?utf-8?B?OFVNL3J0Snh6dUZqaEMyNUZ3b08vSmpaMEQ2S3N0cjBnV3cySE9WQ2E5NnZT?=
 =?utf-8?B?L1pPVFdoeE9BS3FXQ0pSMzArb3hLVFZleEZzN2s0N041bmhWS3lEL0RwSmxR?=
 =?utf-8?B?YTA5Um95M2o1ZTFNS1BtTlYrSDAvbHpLbWZSdHZVa2hnM0FpV1EwYXdBaStp?=
 =?utf-8?B?eUxZZHlpZ3R3WHRJejlQUncyeWduVmNXYW5XT1diYkpUZUVSY0lLRHdGakdJ?=
 =?utf-8?B?NlZmYys3aUsrZTZSbzdJYXVjNm5wRzR3UlplN0xvWVNibU9qWlFpelBFRGdt?=
 =?utf-8?Q?z3dmAembYUU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWZ0dXppb3hGQnhTZUhBREd2S05RZm5MNWpVMlJGYjhCblJ2dDZrUTZZc092?=
 =?utf-8?B?eURpY01uVFJab3IyQjYrTmFxQjc4NVZBM3hCQTB4RGoyMFdUWURSRVFIRUVY?=
 =?utf-8?B?NHZVSjVBd05HNVl5L3hFRG1sNEdzRjkxWjJRWjl4Vm9CemdjSVY4SUllRnRX?=
 =?utf-8?B?MTAxaVN5dE1JdnpSWTVuYndKQVVoSjdpT0RYWU9UQlhyc3dvNjgxeHNyOW1z?=
 =?utf-8?B?Nm11WHBKNzdoekhSVVYyK0FpMzFGcTJjYUFUQm9MT3ZIY0Q1UEpLNFlIWjA2?=
 =?utf-8?B?Y211UzFWZXpTbEN3a0QvNXplN2luWnFNYjdxc2tYUVhMMTZPNWVYWHZXUmZ3?=
 =?utf-8?B?ZVN6TlZSYzBDUjdtaUpUVW1ySGhXL3R1RVduelFOUmFQYjVva2paRjFPZGtl?=
 =?utf-8?B?TU0vZzF6Y0QzaldsQ0RhTTBRUXJOVWtkclc5SS90c2xsZWhIajlIRnlOdWdQ?=
 =?utf-8?B?YlpsZTZtVUNQQUQxNGJGNVVNTTdXRTNYSVYxUHYxRm5wTUhaaFc5RTZMWFpT?=
 =?utf-8?B?cFYxWUhGbHoreHlabGhCV2ltNkVQdjZONWJyQU5rcFNFVzB6MExzemY2TFUv?=
 =?utf-8?B?SmkrZjVJYkYwQktTSjlodDhzZHpLSzlLZVJ0M1kxVFREUUI0TjVqNlExQ1Nx?=
 =?utf-8?B?ak1ZWHhXREtSZFNRa1QzRlh2Vjd0aHhhWng1QXBlS1NkazZVaHpudDZRbXlZ?=
 =?utf-8?B?cnJKRmx4a2dUSWdCditRM04vcHpRQ1FwTTR0Tlh2WjgwQklSSkYxa0dWNzR1?=
 =?utf-8?B?ZGRYZFJ5ZE40RzhKV3pwZEVtWkMxM0lhWk5OZ2Y4MGpmZVNrZjdPNitHVWVh?=
 =?utf-8?B?VFZucTlzbks1bVZDSXk0Yytrb2tjUHFaZ3hlVUEvcHgwUS9rVEF4ZW1LVXpC?=
 =?utf-8?B?b2R1Mkx2UnpoS01JRVpwdzM0SGx4ejlRT3lHcmRpdVR5dEZ0ZmJ4bjZ2U3B5?=
 =?utf-8?B?UnQ3eVMwZ1RndjJrRXRPS1E3Qlh1MmhnaW1iUG90d1l4T3M3VnBQdHl5MWRB?=
 =?utf-8?B?NlRZLzFvNHdhcS9zemJSK1FHNXdCaFhCRDNBVDhmMzQxOENUQXYrWWVWN1Qv?=
 =?utf-8?B?NzV4SlkrekovUFdnVE00U2lqdSthYnZiVndPTzdNUUZES3grQnNUeTdMZkIx?=
 =?utf-8?B?eUp4cHRkeDhJVzQyaC8zOWhRY0hOWFlzeVRuZ2dkY3RVTG5Pd2o1amozaDhk?=
 =?utf-8?B?amgyNTBzMXpvbzYzQUZ2aSswazVhTTRyalNLUERnNVBLOU1WYlhEQlFxTzJa?=
 =?utf-8?B?SDg2cjQ1U2lXa3BocFlIWFFtSkhjUE13ajh2cUJBaGNGNGlhWE9XcHR4SmVY?=
 =?utf-8?B?SVRxSEkrVDBrT3FCdWZyQzg0ZmZtZlhlZ21CQy9TQStST1J1Uk1zMGFYaGFn?=
 =?utf-8?B?Si9rQlFaREZlRnl1dFNvdkttT25oWkJpSGZ6TEtIUWtUYXhlYUg3Z1gwZlpK?=
 =?utf-8?B?L2l6VzdaZWxNUVhxcXJjMlF6Tmk3aVhBWERPK3ZSNHFNcElWYVZRM3RjcTFI?=
 =?utf-8?B?ZHBNekM5L0hiV3Q5V2c4SWNud0tPS0psL2ZML0EyNXhuWER2UlAwR1d5cTNx?=
 =?utf-8?B?OWtDek50Vm1jRVk1LzN6OFpWeGROcE1oNW1scGxLZnBxdENkRUwrL2JLa3hj?=
 =?utf-8?B?T3NTOWJnSGZoNzlQanIvcnpad0d3UEhaZ1psREs0eVF1bDNVNzYrU2FsNkdG?=
 =?utf-8?B?SHpObi9kWHZYN2g3aHZCUDRjSFMrWmlpZkxVWG9WNG5LQ0ltUWVKTU1oZmVH?=
 =?utf-8?B?bWZGNFhnb1BlZU9yT0JIcXdsbkthM0VFR01FM3ZVUmlNU0ROTjdyMWFleHpW?=
 =?utf-8?B?dzhRTWtwYzN5RitUbWJpdXhWaHl6M0FiRTBqN0xad2NLUzQ0U3VIcXFXUzBC?=
 =?utf-8?B?amNyQ1U5cHR3YkU0NUhsNGZGWVdPMlYzN2JKVUxCZmE4Zm5FZW5vMnpkRXBD?=
 =?utf-8?B?NkxjYnF1Q2hpNFh3Y0RrSldWZWs3NmFzaUo2LzZWNzQ5cjdqbi9OSHN2aUI4?=
 =?utf-8?B?VEwyekNlYXJ6MzZKYmJWUXJHc3Zmenh0SEpOSWZXOUFyVHh4eU13Rk5LZTEr?=
 =?utf-8?B?RXZONlFmcGMwdVFlbGJGakZGVXlSVEs2M3BVa1NJNXJoVVZnQUZhajIvblRt?=
 =?utf-8?B?aEphRVluMHhKb29DcTJXK09HS29kbDltVzgzaWtFbHhjL3NhZ0pvaWVhU2pM?=
 =?utf-8?B?SFE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af37007-3193-4aac-9e4e-08dd9c2a1b1f
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 07:51:21.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhM7Of3FjDiV9PECjsSSQ4QBxEGRHKBdOTXlxkquD0i2mUbeYsnllyHrCzqu+ZS8/ixomYsimkT49yk/iZ029i9dVa9FEowQtE3apqkG5UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3327

On 25.05.2025 17:50, Nicolas Dufresne wrote:
>Hi Yassine,
>
>Le vendredi 23 mai 2025 à 15:41 +0200, Yassine Ouaissa a écrit :
>> Add my self as maintainer of the allegrodvt Gen drivers
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index e59011a36e6b..9285bb2f43d9 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -802,6 +802,7 @@ F:	drivers/platform/x86/dell/alienware-wmi*
>>  
>>  ALLEGRO DVT VIDEO IP CORE DRIVER
>>  M:	Michael Tretter <m.tretter@pengutronix.de>
>> +M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>
>Be aware that I do not endorse Krzysztof style of communication, and this
>does not reflect Linux Media values. We strongly encourage both new comers and
>contributions coming from the hardware companies. Please, don't get discourage,
>simply focus on the facts and the way forward. DT maintainers don't usually deal
>with pre-silicon drivers, so we'll have to see what this means for
>bindings. But having drivers contributed before the hardware is a clear win
>for the Linux kernel, so we should all encourage this and find a way.

Hi Nicolas,

Thank you for your support.
I already informe Krzysztof by email, that i have not make a good
approach with the previous patches, and i will send a new set of patches
to start cleanly.

And also i informed the linux-media community, and they was "OK" with
that.
>
>In general, don't assume any of the above is known and document it. Its quite possible
>your reviewers so far have been thinking this driver is for existing hardware already
>running in a known SoC. They cannot guess, you have to make things really clear and
>transparent.
>
>Meanwhile, a better approach to maintenance, and the one I expected initially, is to
>place yourself under Michael in the hierarchy, and remove yourself from the bindings
>path. Bindings should really come from the SoC vendor in practice, so perhaps we should
>not provide a generic one. Hopefully we can get proper feedback from DT maintainers on
>that aspect.

right, the al300-vdec dt-bindings is a generic one that the soc vendors
should follow for the specific driver.

>
>I'd like to see a focus move onto the driver code, which is at this stage much more
>important. In parallel, spend time to re-read the guidelines for submissions and
>check some automation tools. 'b4' is really my goto, and will help you avoid some
>of the common mistakes.

thank you for the tool, and also for the review.
>
>regards,
>Nicolas
>
>
>
Best regards,
Yassine OUAISSA

