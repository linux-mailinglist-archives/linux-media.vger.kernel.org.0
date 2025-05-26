Return-Path: <linux-media+bounces-33400-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE33AC410A
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762C7189A327
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 14:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF4D213B5B3;
	Mon, 26 May 2025 14:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="M6d4lKJk"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021079.outbound.protection.outlook.com [40.107.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F6202998;
	Mon, 26 May 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268568; cv=fail; b=jIkk2HaUO2QZ2R67Za7uyXLRJiwUfym8g1YF20LXxUiild+mL/Vp7OO2jXyXlAmXC3j0cZ7uruxu/PA+0P8a8KHspcy6AQchQZqRyY+uzRtW4nP7VQ8WCP/RIPEaLI//V/qzotTVLxWAcH7oxruChpUvIr0f2M4IaLf6r8yExNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268568; c=relaxed/simple;
	bh=wwRxUlR5L7VhPAtc82WmTAZhp0OcBanQ2kChL41DUsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LRjPGSL+Srhghux99klD1HhWwoq5LDtH+gK4Ws2/TFTwJdPgoNuVl4kj11gSPTR1RlHiVUsdFEWcZETovn+r+YHVeiuFQaPvC0Nx294i7LIy1EJA8MjbVFYbhHyTLRFeZxJEXnqLwpUHXt1UmmnpAet7Yb6dB5+4kvzfMSpSPfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=M6d4lKJk; arc=fail smtp.client-ip=40.107.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa/IkLsSL+YUg9b3eDBluawL6xBphQz8ea/fLexpeMoMryck6isnIxrBTOPGxGYtVBSlvobZzd5F07+S7UiOzIR8TEHxLZjSyOx8QBp5YRn9CrzIZssUBY3gb4yXnXMzchGkJS1+iOF3oz/UNBQQwxOlo6++f39cf2Hif5o8mZr4tjdX9e78ukZty6XLMQ8+j0YQvSO5f7eJ7335GJFroLgyTy0DM0OrVaPiwX46IgYR8XTmRG+glq4PokuKOuFRdKEw4kvdPAIQR6gKmLtSCCHqExLPAasSf2+++AuSc0+xHfrDgqvjoYGUV8cwTXtKZChyPhC0XRFz8Pjyq8Y7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/rmNzhOA/PA4+GJxbG4tC7rJI7OGpkfYqv40hw3/S0=;
 b=EbLO3vDSFJ52PjiVAezRZkMnPi7TbVkQkUpFBp59NBuTpagD5Ks0NQb7Ipiz9E3v3/YK7xa1v1aldN8QDxXeU9bo2cqyrODas8VCD27eTkexPWF2q7ntToIbU7ZiJVcG/7cURZagOAhbZOxW5S8JZhi+U0eTDn9L+62RnEURHyOJGmsoQ1bUVbWtqeahY0M0tXWxD+yfS8OaGaY61npeA3I+OsZE72qPPl00OmiSQYrSObhAzTwZ2D5r4fKGiWsMocyx13bE4G3wZtsXvvhvDvK1SPPI7SaNeqlUjxR4LJiClRtZTSw20GxA5cws+KMP3yqvKWgMOhA8z9NpADEIfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/rmNzhOA/PA4+GJxbG4tC7rJI7OGpkfYqv40hw3/S0=;
 b=M6d4lKJkLvwD7mNeROSdgARITeo0KgLitQqcCiUi9llg2qAwIMNVk/h8INRAQwPhn+AJx8jIH3RZ1I8j4U/YdDy6TzK88OXldABCVtTWX22CZEk27ZEfIyfIcPYY4DnQ4QTVGRyJO8zg9HLkp75LdQEhnTeaJPToEXyONMnQDrk1UXW2TTRaiC6wyvEgtN26hHE74MtxEN1gsL3AuK1Gsf9rN/3Eq+rQAc27fPa02ISHb0HorHBtq7ZAgxaegIYtcmd0KNMi89ERVN8mwl4BnX6KPOiMxtKwNXoUxOVOlrx7ezGK/0K7wD1PGqLSNHLLuzzOLHg5aE2ybZTh2phMdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR0P264MB5437.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 14:09:15 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Mon, 26 May 2025
 14:09:15 +0000
Date: Mon, 26 May 2025 14:09:13 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Rafa?? Mi??ecki <rafal@milecki.pl>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <qmquc4eklvoihte6d4vuwyl5p4o2cu2dxo6s5wstrjsrozdwgy@b6uzx3qk3kuv>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-6-yassine.ouaissa@allegrodvt.com>
 <26843d9f3c998855d96d7bbbd715ec7037bea66c.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26843d9f3c998855d96d7bbbd715ec7037bea66c.camel@ndufresne.ca>
X-ClientProxiedBy: MR2P264CA0020.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::32) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR0P264MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: fb24c28a-8ad2-448d-0767-08dd9c5ee58b
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NXVXdWkvU2JRTG9NbG9EZUoyMWlzbzB5Mmx1TWRVelozSWZPSnZobVZwYkU4?=
 =?utf-8?B?bXd2Mjl2NWovOFNZVmxMOTRUUkQ0S05HaDdXOVFSOXlzcm5OWVY3NXh4bmdX?=
 =?utf-8?B?S1VBRW52VVE2eWtPWmtYb29SbnlCMUlpYlJ2M0pOcU4yZWFueE9pMXZTRmVP?=
 =?utf-8?B?SUlvQU9EandncGgwSFFKMkZMaEUxNDc4akZJZlFHUWRmcWs4OHROZzBwTXkr?=
 =?utf-8?B?TVlFYmJaVHBDRlZNbG5TdTNWNTJ6QkcrejNCVjhObS9EdDAvR1FUTmlJZk1n?=
 =?utf-8?B?aXRmTGZNN3VHY21LQW51a3NMQmRqUDZmVVRLMGJ6ZVk4UlR3U3RqTHlXMWZu?=
 =?utf-8?B?dTFYTzR6OVMzSTBiUGZsN09Za3YrMVJ1V25HZVpXUjhUVWxmT3ZJby9iWVJQ?=
 =?utf-8?B?MndhRFU1cXdubVV5T09haHcyNDVjNHpWWnErTTdoYkJIbmFxU2s1bWU0SmJG?=
 =?utf-8?B?ZVVRM2NJbmVBTDFYa3B6YkdwcFFNemhzMi81SkJ0SDdkYW1TK3J0L1h4Rysy?=
 =?utf-8?B?NDE2MmpsVjBoZ0xXdUVIbDZIUHI1ZDNnLyt2aTZGSStaTkVLQ3hZRVRrTDhs?=
 =?utf-8?B?THB5OHpJeUdtMFJyVElCM3FtN0ZVeFhtaHpscVNJRVFKbVBCQ1dsT3UrZUJo?=
 =?utf-8?B?dFNWMXpzRFdYTWR1QUpMaGNpNmFVei8zNStDV0psdndRNmh0K29iYXNKYVph?=
 =?utf-8?B?ZnJzTktHRFMyUE1BRFdRc0w5aFA3OWlxSmZkekJKa280N01Cd0wzUkdDV2F4?=
 =?utf-8?B?UW9qckxmcGoveTVhYlZpWjFpU0JzbTQ1ejhIVENmREorVDdQQS80cENxdXV6?=
 =?utf-8?B?S3pTNjU3ZnhoSmw0TS96NWc1aDRjVk9OK1IzT0lSMkM3bTRLT1Q4Mm4wa29a?=
 =?utf-8?B?dHNsN0RRc2hXcmladUxxTmsyTWRvTnQ4YjR2Y2l5ay84ODBZbjZuSEtMRkJC?=
 =?utf-8?B?QzVXMjhWRDRpYVB4L2xLQ0UzRG1JdmpHVVVPQ0ZzYVBEMnRFL1Z3SjA5VXBz?=
 =?utf-8?B?MHpUUU41bUZ4c3RndVZkOWpHZnMzVWJnMzRXQWdndU42TUNzRHdVYytQMklZ?=
 =?utf-8?B?VmVoUDJlQVRhRlE5OHlhVEZhK3hHWFBWS2VpZGVZWC8yRTROWWlybk54SkhS?=
 =?utf-8?B?bUJPWWhadjdYZXU3YUY1NEdKaE1sUmVDYVF3aVFvQno5U1JxT1k3WTQ2OEJZ?=
 =?utf-8?B?d3MreFBVOVFxWjAxU3N3b05HelREM0U4UkY4U3FiVTRMVnNHbnpaaTYwTWkw?=
 =?utf-8?B?aTRocWJVbnJtUWl0b0R0aC9yYjhBTllQamxJWkJ1NHJFT1ExQSswM3E1NFU4?=
 =?utf-8?B?aWZHb010blBJSjVJVmVrQXVhb0tvTGRoMXAwN0dPZGtUc091aGM2WmVNbFhK?=
 =?utf-8?B?RGVQcDRqb3IzTG1vSFA3NGcvOFg1aXlSQmFudGFqUW5nRXNtditjODMxU2lL?=
 =?utf-8?B?d2pZbHpEUFF1RUh5Zm42QVFzekR1OGhITVJMaWFMaCt6Tk91SEJjM2MydVlo?=
 =?utf-8?B?dkxSWkMxaHMzNjBCVm1RZHgzOXRDVHFHcnM2clZNd3liZ2hRV0lYVlZRMU1R?=
 =?utf-8?B?bU1yNVpXWHhKV2w5cU9CTGU4eUJYZjk5NUozQkxTUEpzZHM2VERxam01OSs5?=
 =?utf-8?B?MUdEY0ZMN2FSMXg2Z3ZRNGk0VE12L1hSR1JLUk94eHVYOGNFbjVuQ2dFTWZi?=
 =?utf-8?B?TDN3OENSSEFXVVZjMURzVW91V0ZWRnArUm8wUytnR2R0N3QvV3lyS2VhM014?=
 =?utf-8?B?SDlZZWRyays5VzhzbTRRSEtsWVlqaDBjK2V0WGxvQlhmcmJQZ3poMkpiVlRZ?=
 =?utf-8?B?algxczcrNkd4b0lHcFU0MnBBWjBEVzdHWG9mQ00zTCtjeFlSMks4R0pRU1V1?=
 =?utf-8?B?Q1lkWUJDTkIrNnAzb2RmaGtiZDIxS3pacTVGTmoxd1NFL2RZUXgrM28zMEow?=
 =?utf-8?Q?rMf/I2M6IdI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VnZQdUtLc0d5b09OQS9BUS9vWmZuQ2E2cHRLUFphUmovNndJUUV0UWVJYnhI?=
 =?utf-8?B?K0t4UkNNUGRWQUFxWUFzb3BtSnNGaDB3dEZHVm1xc1o1M1JlM2NTeHhkYlgx?=
 =?utf-8?B?cDdlYXV5L2hweVhFZ2p3RGl4aFdUUWpqclROaDhkcWlXdEM1NDQwbG1zNHYy?=
 =?utf-8?B?K0pIbmdQaFlDWTlVK2lJQWpIVzlkaHpseWtWZGcrakVnSWRxMVF6M2h2ZVEw?=
 =?utf-8?B?S09Kd3NWQmd6Tm5YNDljZ0Z0aEhyQ1RJdG5CTVVUQ1FuUHlHMnlSVU5sQ2ZJ?=
 =?utf-8?B?OFpiSE13WFozVnJrMHVRRVJNS1lhcllzMWF6WmI1YTNsSkdzakRFUWJtWFdw?=
 =?utf-8?B?T1ZNUlU5S0VOWUQvRUIrRlI4VkhYUkJ3OThwT3oyK3hmN0E3OWpIaVhxaEdv?=
 =?utf-8?B?NGlWRjY3a2dUTk5YZzc0RVdYS0pTQ1R1dWk4NDAyMzMxNEt6S3M2aEluVkhk?=
 =?utf-8?B?c240QXVhaEJ1bUJUMk9XTGwxc05RNU5yNVBUVlF5WUQrbXpjaElEYnVYYWVP?=
 =?utf-8?B?NnlZaGtNbVE4N3RVWHlRbHNJVFRqd0dsUTB4ZnlQb3hSbkdaN0N0aTdqTThl?=
 =?utf-8?B?T1ZYVGkvRmFITi9idEJTRzViRU9WMmtLR1F5THRnQjFSYnIra1ZYc1lHUHlr?=
 =?utf-8?B?NXlKeVNaUXN3SzFSTFFjTFZ0dG5HdDh4N0hkMDZ1ckhvT0xQYS9wWWVLeEFC?=
 =?utf-8?B?RUJrTkJ4MktIUkZmbi9wcStwb1RmTXhwYVNVQThiM3htbzZFN2JOVTRtdG5B?=
 =?utf-8?B?Qkh2eHVwZkYxeVFSZW04US9TcTY4ekNPcDFHeE9pL3UxcWVzVkxOT3VyTXZz?=
 =?utf-8?B?WE1HUE1iazNuZjBuaExoMGh3SVhtdDl1cStrc002Y1MyaUhHVThOeFlXenBs?=
 =?utf-8?B?cHZnVUpZWUVYVzVmaTNBMFU0TERuTnlueXoydGh1cGdramZHKzBMMjRabmRz?=
 =?utf-8?B?VDFyaDU1MGh6VnVsQUdKNkVHaURFZTNIanNOR0RTdEJJaElwYXB4UFdLdGNl?=
 =?utf-8?B?UzBDT3FiK3ZWY0xRU1FFR3dQNDZRT3BUQWtqRGZGYTZUYTU4YVZIZ3B1RHZl?=
 =?utf-8?B?UXZGb01ZYnhTOWYrdTlKTHhIT3owOGVxYzZ2OW0xTjV0c0VTZWRYWDlFU0xI?=
 =?utf-8?B?S0NUN1NiQnc3ZUp2L2xxSnR4eE91UnY1Uk9UdDk3RkRKaXM1dkVaYTVhd2JR?=
 =?utf-8?B?LzFBcUhTZVc1SDQwbnZhajNLdnF2TGg1N05sS2JXbG9QZFpvN0cyQVZYaElE?=
 =?utf-8?B?aFQ4WHlYUlpVZmRxdEN2S3JpcXQ2L1QzMEt0Q1VMOUZvQ1FvWHpvQm43aXRi?=
 =?utf-8?B?QkNCbW5EYnE2MHpGbE50YXRPMXdvM1dSRzdSVGFJZFp3TnB0eW5JWlFYMEFR?=
 =?utf-8?B?STdzKytxUHNTVVVXc2xGZ3ZBZjFDRk1ibjlidTBjM3piVjFnWkZsYzdEK3FI?=
 =?utf-8?B?dXErVG5DaTdhM2ZLRmRzRHUzYlBFNXlqeEdFUWpKSlUzU3hqd1UzVVo0RUJh?=
 =?utf-8?B?a1dxTGN6T2lWeG1naE95YTh3TGZkWGx1M0cyZlNhb1RnZjFibWZ3VWxnbFpW?=
 =?utf-8?B?RDRieG13WnorK2lNNkU4VW9vMnFGWGhibjVCc2FGL1htY2hVV3I5WmhUTzY0?=
 =?utf-8?B?TEp3OXFSdWNIWTdTdVFZN09sWjdwK3ZOWDRrcmtORVJ2M08xZnR3OThDbDM0?=
 =?utf-8?B?N3BVMDdvcjJXa29lejVOdTI4WWlHZCtKcWdneGxheDFLdGpSUWhHT0s0TnJE?=
 =?utf-8?B?dUZCYnJ6b09xL3k0d2llamJqdmpad3VTSm0raElZa1p3L2hqZ2xQRldva0xC?=
 =?utf-8?B?WGlsbzVpVTJwLytIbXVPbUJrNFVqWW55ekYrZHY4emk1dXZUTGJRTURoTVg4?=
 =?utf-8?B?My9JeVhxOHo4Yi9vMW9WeXdMWFRwWm5ZLzdzclQ1ZVF2ZjNaaFIzOXFYc0NM?=
 =?utf-8?B?SDErY29JRHM4V3VLVTNDMlUyb00zRVh4RGhDTkxzTDdiVi9hbjloS0I3b3hE?=
 =?utf-8?B?U3RqNnBwaEdqUUhLQnFERisvb3lYWXR2RVJrQTFYT2ZjOEd3WUtyU1NrLzVT?=
 =?utf-8?B?TDBaK0xKZGNGeHJaNEtQNFQvSXpvdERrc1U1UWtMV2VuNzZtdWRURHVaM1FW?=
 =?utf-8?B?YzdjQzgyNHZKUlp0ZWREckwrY2NlK0VPK1VObDM3ZU80MG5ZVWlpNnloV2Y2?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb24c28a-8ad2-448d-0767-08dd9c5ee58b
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:09:15.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LA20b8vFGO+/r5asAPCbg2ZsvuuQwa3ZFHA8kZpLygMknJljh7CR+pCbrQL1Er/TwjgHt9KHq9YPl8t3t4pUUVsSz94znXeUbCcJYcLdZoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB5437

On 23.05.2025 15:58, Nicolas Dufresne wrote:
Hi Nicolas,

>Hi Yassine,
>
>not a complete review, just covering the common.
Thank you for this review.
>
>Le vendredi 23 mai 2025 à 15:41 +0200, Yassine Ouaissa a écrit :
>> This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
>> the Gen 3 IP with support for:
>> - AVC (H.264), HEVC (H.265), and JPEG decoding
>> - Output formats: NV12, NV16, I420, and P010 for capture
>>
>> MAINTAINERS: Add entry for the allegro-dvt Gen 3 driver.
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  MAINTAINERS                                   |    1 +
>>  drivers/media/platform/allegro-dvt/Kconfig    |    1 +
>>  drivers/media/platform/allegro-dvt/Makefile   |    1 +
>>  .../media/platform/allegro-dvt/al300/Kconfig  |   23 +
>>  .../media/platform/allegro-dvt/al300/Makefile |    6 +
>>  .../allegro-dvt/al300/al_codec_common.c       |  754 ++++++++
>>  .../allegro-dvt/al300/al_codec_common.h       |  247 +++
>>  .../allegro-dvt/al300/al_codec_util.c         |  177 ++
>>  .../allegro-dvt/al300/al_codec_util.h         |  185 ++
>>  .../platform/allegro-dvt/al300/al_vdec_drv.c  | 1530 +++++++++++++++++
>>  .../platform/allegro-dvt/al300/al_vdec_drv.h  |   94 +
>>  11 files changed, 3019 insertions(+)
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefile
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.h
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.c
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
>>  create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9285bb2f43d9..8912fabab6ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -808,6 +808,7 @@ L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
>>  F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
>> +F:	drivers/media/platform/allegro-dvt/al300
>>  F:	drivers/media/platform/allegro-dvt/zynqmp
>>  
>>  ALLIED VISION ALVIUM CAMERA DRIVER
>> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
>> index e9008614c27b..0d01ed0ad08a 100644
>> --- a/drivers/media/platform/allegro-dvt/Kconfig
>> +++ b/drivers/media/platform/allegro-dvt/Kconfig
>> @@ -2,4 +2,5 @@
>>  
>>  comment "Allegro DVT media platform drivers"
>>  
>> +source "drivers/media/platform/allegro-dvt/al300/Kconfig"
>>  source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
>> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
>> index d2aa6875edcf..c70ca19a47fb 100644
>> --- a/drivers/media/platform/allegro-dvt/Makefile
>> +++ b/drivers/media/platform/allegro-dvt/Makefile
>> @@ -1,3 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0
>>  
>> +obj-y += al300/
>>  obj-y += zynqmp/
>> diff --git a/drivers/media/platform/allegro-dvt/al300/Kconfig b/drivers/media/platform/allegro-dvt/al300/Kconfig
>> new file mode 100644
>> index 000000000000..0bc3d7a79f14
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/Kconfig
>> @@ -0,0 +1,23 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_ALLEGRO_DVT_D300
>> +	tristate "Allegro DVT Video IP Decode Gen 3"
>> +	depends on V4L_MEM2MEM_DRIVERS
>> +	depends on VIDEO_DEV && OF && HAS_DMA
>> +	select V4L2_MEM2MEM_DEV
>> +	select VIDEOBUF2_DMA_CONTIG
>> +	help
>> +	  This is a video4linux2 driver for the Allegro DVT IP Decode Gen 3,
>> +	  that support codecs : AVC (H.264), HEVC (H.265), and JPEG.
>> +
>> +	  The driver provides hardware acceleration for video decoding operations,
>> +	  enabling efficient processing of compressed video streams on platforms
>> +	  featuring this IP block. It handles memory management, buffer allocation,
>> +	  and decoder command sequencing to deliver optimized performance.
>> +
>> +	  The driver integrates with the V4L2 framework and videobuf2 subsystem
>> +	  to provide a standard interface for applications requiring video
>> +	  decoding capabilities.
>> +
>> +	  To compile this driver as a module, choose M here. The module
>> +	  will be called al300-vdec.
>> diff --git a/drivers/media/platform/allegro-dvt/al300/Makefile b/drivers/media/platform/allegro-dvt/al300/Makefile
>> new file mode 100644
>> index 000000000000..3c50caccb731
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +al300-vdec-objs := al_codec_common.o al_codec_util.o
>> +al300-vdec-objs += al_vdec_drv.o
>> +
>> +obj-$(CONFIG_VIDEO_ALLEGRO_DVT_D300) += al300-vdec.o
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-
>> dvt/al300/al_codec_common.c
>> new file mode 100644
>> index 000000000000..0aee82b6335a
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>> @@ -0,0 +1,754 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Core MCU functionality including firmware loading,
>> + * memory allocation, and general MCU interaction interfaces
>> + *
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +#include <linux/clk.h>
>> +#include <linux/dma-mapping.h>
>> +#include <linux/firmware.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/of_reserved_mem.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +#include "al_codec_common.h"
>> +
>> +#define AL_CODEC_UID 0x0000
>> +#define AL_CODEC_RESET 0x0010
>> +#define AL_CODEC_IRQ_MASK 0x0014
>> +#define AL_CODEC_IRQ_STATUS_CLEAR 0x0018
>> +#define AL_CODEC_MCU_CLK 0x0400
>> +#define AL_CODEC_MCU_RST 0x0404
>> +#define AL_CODEC_MCU_IRQ 0x040C
>> +#define AL_CODEC_MCU_BOOT_ADDR_HI 0x0410
>> +#define AL_CODEC_MCU_BOOT_ADDR_LO 0x0414
>> +#define AL_CODEC_MCU_IP_START_ADDR_HI 0x0418
>> +#define AL_CODEC_MCU_IP_START_ADDR_LO 0x041C
>> +#define AL_CODEC_MCU_IP_END_ADDR_HI 0x0420
>> +#define AL_CODEC_MCU_IP_END_ADDR_LO 0x0424
>> +#define AL_CODEC_MCU_PERIPH_ADDR_HI 0x0428
>> +#define AL_CODEC_MCU_PERIPH_ADDR_LO 0x042C
>> +#define AL_CODEC_MCU_IRQ_MASK 0x0440
>> +#define AL_CODEC_INST_OFFSET_HI 0x0450
>> +#define AL_CODEC_INST_OFFSET_LO 0x0454
>> +#define AL_CODEC_DATA_OFFSET_HI 0x0458
>> +#define AL_CODEC_DATA_OFFSET_LO 0x045C
>> +
>> +#define AL_CODEC_UID_ID 0x30AB6E51
>> +#define AL_CODEC_IRQ_MCU_2_CPU BIT(30)
>> +#define AL_CODEC_IP_OFFSET GENMASK(26, 25)
>> +#define AL_CODEC_APB_MASK GENMASK(26, 0)
>> +#define AL_CODEC_MAX_ADDR GENMASK_ULL(38, 0)
>> +
>> +#define AL_CODEC_MCU_BOOT_RESET_WAIT 2 /* in ms */
>> +#define AL_CODEC_REG_ENABLE BIT(0)
>> +#define AL_CODEC_REG_DISABLE 0
>> +
>> +/*
>> + * struct codec_dma_buf - Allocated dma buffer
>> + *
>> + * @list: list head for buffer queue
>> + * @paddr: physical address of the allcated DMA buffer
>> + * @vaddr: virtual address of the allocated DMA buffer
>> + * @size: Size of allocated dma memory
>> + */
>> +struct codec_dma_buf {
>> +	void *vaddr;
>> +	dma_addr_t paddr;
>> +	u32 size;
>> +	struct list_head list;
>> +};
>> +
>> +struct mb_header {
>> +	u64 start;
>> +	u64 end;
>> +} __packed;
>> +
>> +struct boot_header {
>> +	u32 bh_version;
>> +	u32 fw_version;
>> +	char model[16];
>> +	u64 vaddr_start;
>> +	u64 vaddr_end;
>> +	u64 vaddr_boot;
>> +	struct mb_header h2m;
>> +	struct mb_header m2h;
>> +	u64 machine_id;
>> +	/* fill by driver before fw boot */
>> +	u64 ip_start;
>> +	u64 ip_end;
>> +	u64 mcu_clk_rate;
>> +} __packed;
>> +
>> +static u32 al_common_read(struct al_codec_dev *dev, u32 offset)
>> +{
>> +	return readl(dev->regs + offset);
>> +}
>> +
>> +static void al_common_write(struct al_codec_dev *dev, u32 offset, u32 val)
>> +{
>> +	writel(val, dev->regs + offset);
>> +}
>> +
>> +static void al_common_trigger_mcu_irq(void *arg)
>> +{
>> +	struct al_codec_dev *dev = arg;
>> +
>> +	al_common_write(dev, AL_CODEC_MCU_IRQ, BIT(0));
>> +}
>> +
>> +static inline void al_common_reset(struct al_codec_dev *dev)
>> +{
>> +	/* reset ip */
>> +	al_common_write(dev, AL_CODEC_RESET, AL_CODEC_REG_ENABLE);
>> +
>> +	/* reset and stop mcu */
>> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
>> +	al_common_write(dev, AL_CODEC_MCU_RST, AL_CODEC_REG_ENABLE);
>> +	/* time to reset the mct */
>> +	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT);
>> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_DISABLE);
>> +
>> +	al_common_write(dev, AL_CODEC_MCU_IRQ, AL_CODEC_REG_DISABLE);
>> +	al_common_write(dev, AL_CODEC_MCU_IRQ_MASK, AL_CODEC_REG_DISABLE);
>> +
>> +	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT * 5);
>> +	al_common_write(dev, AL_CODEC_MCU_RST, AL_CODEC_REG_DISABLE);
>> +}
>> +
>> +static int al_common_setup_hw_regs(struct al_codec_dev *dev)
>> +{
>> +	u64 reg_start, reg_end;
>> +	dma_addr_t boot_addr;
>> +	unsigned int id;
>> +
>> +	id = al_common_read(dev, AL_CODEC_UID);
>> +
>> +	if (id != AL_CODEC_UID_ID) {
>> +		al_codec_err(dev, "bad device id, expected 0x%08x, got 0x%08x",
>> +			     AL_CODEC_UID_ID, id);
>> +		return -ENODEV;
>> +	}
>> +
>> +	boot_addr = dev->firmware.phys + dev->firmware.bin_data.offset;
>> +
>> +	/* Reset MCU step */
>> +	al_common_reset(dev);
>> +
>> +	/* Configure the MCU*/
>> +	al_common_write(dev, AL_CODEC_IRQ_MASK, AL_CODEC_IRQ_MCU_2_CPU);
>> +	/* Set Instruction and data offset */
>> +	al_common_write(dev, AL_CODEC_INST_OFFSET_HI, 0);
>> +	al_common_write(dev, AL_CODEC_INST_OFFSET_LO, 0);
>> +	al_common_write(dev, AL_CODEC_DATA_OFFSET_HI, 0);
>> +	al_common_write(dev, AL_CODEC_DATA_OFFSET_LO, 0);
>> +
>> +	reg_start = dev->regs_info->start;
>> +	reg_end = reg_start + resource_size(dev->regs_info);
>> +	al_common_write(dev, AL_CODEC_MCU_IP_START_ADDR_HI,
>> +			upper_32_bits(reg_start));
>> +	al_common_write(dev, AL_CODEC_MCU_IP_START_ADDR_LO,
>> +			lower_32_bits(reg_start));
>> +	al_common_write(dev, AL_CODEC_MCU_IP_END_ADDR_HI,
>> +			upper_32_bits(reg_end));
>> +	al_common_write(dev, AL_CODEC_MCU_IP_END_ADDR_HI,
>> +			lower_32_bits(reg_end));
>> +
>> +	al_common_write(dev, AL_CODEC_MCU_PERIPH_ADDR_HI,
>> +			upper_32_bits(dev->apb));
>> +	al_common_write(dev, AL_CODEC_MCU_PERIPH_ADDR_LO,
>> +			lower_32_bits(dev->apb));
>> +
>> +	al_common_write(dev, AL_CODEC_MCU_BOOT_ADDR_HI,
>> +			upper_32_bits(boot_addr));
>> +	al_common_write(dev, AL_CODEC_MCU_BOOT_ADDR_LO,
>> +			lower_32_bits(boot_addr));
>> +
>> +	return 0;
>> +}
>> +
>> +static void al_common_dma_buf_insert(struct al_codec_dev *dev,
>> +				     struct codec_dma_buf *buf)
>> +{
>> +	mutex_lock(&dev->buf_lock);
>
>For new drivers, I encourage using:
>
>	guard(mutex)(&dev->buf_lock);
>
>> +	list_add(&buf->list, &dev->alloc_buffers);
>> +	mutex_unlock(&dev->buf_lock);
>
>And you can drop this line, it will be unlock one you exist the scope. For more
>complex function it simplify the error handling and reduce risk of forgetting to
>unlock. Please apply over the entire driver if you agree to.

This also will simplify the error handling, instead of call unlock each
time. Good.
I'll apply this change for the entire driver.

>
>> +}
>> +
>> +static void al_common_dma_buf_remove(struct al_codec_dev *dev,
>> +				     struct codec_dma_buf *buf)
>> +{
>> +	mutex_lock(&dev->buf_lock);
>> +	list_del(&buf->list);
>> +	mutex_unlock(&dev->buf_lock);
>> +}
>> +
>> +static struct codec_dma_buf *al_common_dma_buf_lookup(struct al_codec_dev *dev,
>> +						      dma_addr_t buf_paddr)
>> +{
>> +	struct codec_dma_buf *buf = NULL;
>> +
>> +	mutex_lock(&dev->buf_lock);
>> +	list_for_each_entry(buf, &dev->alloc_buffers, list)
>> +		if (likely(buf->paddr == buf_paddr))
>> +			break;
>> +
>> +	mutex_unlock(&dev->buf_lock);
>> +
>> +	return list_entry_is_head(buf, &dev->alloc_buffers, list) ? NULL : buf;
>
>This is currently not thread safe, the usage of guard will fix it without the need
>for an intermediate variable.
>
>Note that while it can be made thread safe, this won't be memory safe, since there
>is no ref-count around buf to ensure its not freed in another thread. And if this
>case does not exists, then the entire locking seems to be pointless and should be
>reconsidered.
>
>Please provide feedback, I would likely get a better idea once I'm passed the
>common helper, but then it will take more time.

When the mcu is done with the internal buffer, it send a memory_free request ( see handle_free_memory_req)
with the physical address of the buffer that has to be freed.

And the mcu cannot free more than one buffer in the same time.
>
>> +}
>> +
>> +static void al_common_dma_buf_cleanup(struct al_codec_dev *dev)
>> +{
>> +	struct codec_dma_buf *buf, *tmp;
>> +
>> +	mutex_lock(&dev->buf_lock);
>> +	list_for_each_entry_safe(buf, tmp, &dev->alloc_buffers, list) {
>> +		dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr,
>> +				  buf->paddr);
>> +		list_del(&buf->list);
>> +		kfree(buf);
>> +	}
>> +	mutex_unlock(&dev->buf_lock);
>> +}
>> +
>> +static int al_common_setup_dma(struct al_codec_dev *dev)
>> +{
>> +	int ret;
>> +
>> +	/* setup dma memory mask */
>> +	ret = dma_set_mask_and_coherent(&dev->pdev->dev, DMA_BIT_MASK(64));
>
>If you change this to DMA_BIT_MASK(39), perhaps your can drop the check below ?

I'll make the change, and i will check if this works.
>
>> +	if (ret) {
>> +		al_codec_err(dev, "failed to set dma");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Try to use reserved memory if we got one */
>> +	ret = of_reserved_mem_device_init(&dev->pdev->dev);
>> +	if (ret && ret != ENODEV)
>> +		dev_warn(&dev->pdev->dev,
>> +			 "No reserved memory, use cma instead\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void *al_common_dma_alloc(struct al_codec_dev *dev, size_t size,
>> +				 dma_addr_t *paddr, gfp_t flag)
>> +{
>> +	void *vaddr;
>> +
>> +	vaddr = dma_alloc_coherent(&dev->pdev->dev, size, paddr, flag);
>> +
>> +	if (!vaddr)
>> +		return NULL;
>> +
>> +	/* PADDR <= (2^39 - 1) (39-bit MCU PADDR) */
>> +	if ((*paddr + size) > AL_CODEC_MAX_ADDR) {
>
>This one.

I got it, thanks.
>
>> +		al_codec_err(dev, "mem check failed for 0x%16llx of size %zu",
>> +			     *paddr, size);
>> +		dma_free_coherent(&dev->pdev->dev, size, vaddr, *paddr);
>> +		return NULL;
>> +	}
>> +
>> +	return vaddr;
>> +}
>> +
>> +void al_common_remove(struct al_codec_dev *dev)
>> +{
>> +	al_common_dma_buf_cleanup(dev);
>> +
>> +	/* reset device */
>> +	al_common_reset(dev);
>> +	clk_disable_unprepare(dev->clk);
>> +	dma_free_coherent(&dev->pdev->dev, dev->firmware.size,
>> +			  dev->firmware.virt, dev->firmware.phys);
>> +
>> +	if (dev->firmware.firmware)
>> +		release_firmware(dev->firmware.firmware);
>> +}
>> +
>> +static void handle_alloc_memory_req(struct al_codec_dev *dev,
>> +				    struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_alloc_mem_reply_full reply;
>> +	struct msg_itf_alloc_mem_req req;
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	reply.reply.phyAddr = 0;
>> +	reply.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY;
>> +	/* both fields embed info need to finish request */
>> +	reply.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl;
>> +	reply.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl;
>> +	reply.hdr.payload_len = sizeof(reply.reply);
>
>Its always nicer if things are fully initialize in myopinion, so
>I encourage to use static initialiser:
>
>	struct msg_itf_alloc_mem_reply_full reply = {
>		.reply.phyAddr = 0,
>		.reply.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY,
>		...
>	 };
>
>Or the old school memset to zero. Probably not a strict rule, but
>clearly good practices.
>

a static approach is a good idea. Thanks
>> +
>> +	ret = al_common_get_data(dev, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(dev, "Unable to get cma req");
>> +		return;
>> +	}
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		goto send_reply;
>
>Its not obvious to me why you'd still want to send the request in case
>you ran out of memory. Since you didn't really do anything yet,
>just return ? Consider adding a return value to your helper, so you can
>propagate -ENONMEM.

The mcu is waiting for the reply.
We do need to tell the mcu that the host has no available memory.

>
>> +
>> +	buf->size = req.uSize;
>> +	buf->vaddr =
>> +		al_common_dma_alloc(dev, req.uSize, &buf->paddr, GFP_KERNEL);
>> +	if (!buf->vaddr)
>> +		goto send_reply;
>> +
>> +	reply.reply.phyAddr = (u64)buf->paddr;
>> +	al_common_dma_buf_insert(dev, buf);
>> +
>> +send_reply:
>
>I'd name this "send_request", you actually will receive a reply.

the driver receive the request from the mcu, and it should reply to the
request.
>
>> +	ret = al_common_send(dev, &reply.hdr);
>> +	if (ret) {
>> +		al_codec_err(dev, "Unable to reply to cma alloc");
>> +		al_common_dma_buf_remove(dev, buf);
>> +	}
>
>Try to propagate ret, silent failures are the worse.
Actually, this function is a request handler, it's executed only when
the mcu send the alloc_memory to the host.

the error is handled by the mcu.
>
>> +}
>> +
>> +static void handle_free_memory_req(struct al_codec_dev *dev,
>> +				   struct msg_itf_header *hdr)
>> +{
>
>Please apply previous comments to the rest.

Same as alloc_memory, this function is only executed when the mcu sent a
request to the host to free the given memory ( with the physical address )
>
>> +	struct msg_itf_free_mem_reply_full reply;
>> +	struct msg_itf_free_mem_req req;
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	reply.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY;
>> +	/* both fields embed info need to hinish request */
>> +	reply.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl;
>> +	reply.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl;
>> +	reply.hdr.payload_len = sizeof(reply.reply);
>> +	reply.reply.ret = -1;
>> +
>> +	ret = al_common_get_data(dev, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(dev, "Unable to put cma req");
>> +		return;
>> +	}
>> +
>> +	buf = al_common_dma_buf_lookup(dev, req.phyAddr);
>> +	al_codec_dbg(dev, "req.phyAddr = %p => %p, Size %d",
>> +		     (void *)(long)req.phyAddr, buf, buf->size);
>> +	if (!buf) {
>> +		al_codec_err(dev, "Unable to get dma handle for %p",
>> +			     (void *)(long)req.phyAddr);
>> +		reply.reply.ret = -EINVAL;
>> +		goto send_reply;
>> +	}
>> +
>> +	dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr, buf->paddr);
>> +	al_common_dma_buf_remove(dev, buf);
>> +	reply.reply.ret = 0;
>> +
>> +send_reply:
>> +	ret = al_common_send(dev, &reply.hdr);
>> +	if (ret)
>> +		al_codec_err(dev, "Unable to reply to cma free");
>> +}
>> +
>> +static void handle_mcu_console_print(struct al_codec_dev *dev,
>> +				     struct msg_itf_header *hdr)
>> +{
>> +#if defined(DEBUG)
>
>I would use #ifdef DEBUG, just a preference. Quick grep, its 1099 time that
>way, rather then using defined (99 times).

This will not change anything, i'll change it.
>
>> +	struct msg_itf_write_req *req;
>> +	int ret;
>> +
>> +	/* one more byte to be sure to have a zero terminated string */
>> +	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
>> +	if (!req) {
>> +		al_common_skip_data(dev, hdr->payload_len);
>> +		al_codec_err(dev, "Unable to alloc memory");
>> +		return;
>> +	}
>> +
>> +	ret = al_codec_msg_get_data(&dev->mb_m2h, (char *)req,
>> +				    hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(dev, "Unable to get request");
>> +		kfree(req);
>> +		return;
>> +	}
>> +
>> +	/* Print the mcu logs */
>> +	dev_dbg(&dev->pdev->dev, "[ALG_MCU] %s(),%d: %s\n", __func__, __LINE__,
>> +		(char *)(req + 1));
>> +	kfree(req);
>> +#else
>> +	al_common_skip_data(dev, hdr->payload_len);
>> +#endif
>> +}
>> +
>> +static void process_one_message(struct al_codec_dev *dev,
>> +				struct msg_itf_header *hdr)
>> +{
>> +	switch (hdr->type) {
>> +	case MSG_ITF_TYPE_ALLOC_MEM_REQ:
>> +		handle_alloc_memory_req(dev, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_FREE_MEM_REQ:
>> +		handle_free_memory_req(dev, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_WRITE_REQ:
>> +		handle_mcu_console_print(dev, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_MCU_ALIVE:
>> +		complete(&dev->completion);
>> +		break;
>> +	default:
>> +		dev->process_msg_cb(dev->cb_arg, hdr);
>> +		break;
>> +	}
>> +}
>> +
>> +static irqreturn_t al_common_irq_handler(int irq, void *data)
>> +{
>> +	struct al_codec_dev *dev = data;
>> +	struct msg_itf_header hdr;
>> +	int ret;
>> +
>> +	/* poll all messages */
>> +	while (1) {
>> +		ret = al_codec_msg_get_header(&dev->mb_m2h, &hdr);
>> +		if (ret)
>> +			break;
>> +
>> +		process_one_message(dev, &hdr);
>> +	}
>
>Since ret is unused, perhaps ?
>
>	while (al_codec_msg_get_header(&dev->mb_m2h, &hdr) == 0)
>		process_one_message(dev, &hdr);
>

This make more sense. thanks
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t al_common_hardirq_handler(int irq, void *data)
>> +{
>> +	struct al_codec_dev *dev = data;
>> +	u32 irq_status;
>> +
>> +	irq_status = al_common_read(dev, AL_CODEC_IRQ_STATUS_CLEAR);
>> +	if (!irq_status)
>> +		return IRQ_NONE;
>> +
>> +	al_common_write(dev, AL_CODEC_IRQ_STATUS_CLEAR, AL_CODEC_IRQ_MCU_2_CPU);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> +
>> +static int al_common_start_fw(struct al_codec_dev *dev)
>> +{
>> +	/* Enable the MCU clock */
>> +	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_REG_ENABLE);
>> +
>> +	return !wait_for_completion_timeout(&dev->completion, 2 * HZ);
>> +}
>> +
>> +static void al_common_copy_firmware_image(struct al_codec_dev *dev)
>> +{
>> +	const struct firmware *firmware = dev->firmware.firmware;
>> +	u32 *virt = dev->firmware.virt;
>> +	size_t i;
>> +
>> +	/* copy the whole thing taking into account endianness */
>> +	for (i = 0; i < firmware->size / sizeof(u32); i++)
>
>These days you can declare in the for loop scope:
>
>	for (size_t i = 0; i < firmware->size / sizeof(u32); i++)
>

Good to know.
>> +		virt[i] = le32_to_cpu(((__le32 *)firmware->data)[i]);
>> +}
>> +
>> +static int al_common_read_firmware(struct al_codec_dev *dev, const char *name)
>> +{
>> +	struct platform_device *pdev = dev->pdev;
>> +	const struct boot_header *bh;
>> +	int err;
>> +
>> +	/* request_firmware prints error if it fails */
>> +	err = request_firmware(&dev->firmware.firmware, name, &pdev->dev);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	bh = (struct boot_header *)dev->firmware.firmware->data;
>> +	dev->firmware.size = bh->vaddr_end - bh->vaddr_start;
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_common_parse_firmware_image(struct al_codec_dev *dev)
>> +{
>> +	struct boot_header *bh = (void *)dev->firmware.virt;
>> +
>> +	if (bh->bh_version < AL_BOOT_VERSION(2, 0, 0) ||
>> +	    bh->bh_version >= AL_BOOT_VERSION(3, 0, 0)) {
>
>Good to know that firmware 2.X is used for Gen 3, I would have got
>confused.
>
>> +		al_codec_err(dev, "Unsupported firmware version");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev->firmware.bin_data.offset = bh->vaddr_boot - bh->vaddr_start;
>> +	dev->firmware.bin_data.size = bh->vaddr_end - bh->vaddr_start;
>> +
>> +	dev->firmware.mb_h2m.offset = bh->h2m.start - bh->vaddr_start;
>> +	dev->firmware.mb_h2m.size = bh->h2m.end - bh->h2m.start;
>> +	dev->firmware.mb_m2h.offset = bh->m2h.start - bh->vaddr_start;
>> +	dev->firmware.mb_m2h.size = bh->m2h.end - bh->m2h.start;
>> +
>> +	/* Override some data */
>> +	bh->ip_start = dev->apb + AL_CODEC_IP_OFFSET;
>> +	bh->ip_end = bh->ip_start + resource_size(dev->regs_info);
>> +	bh->mcu_clk_rate = clk_get_rate(dev->clk);
>> +
>> +	al_codec_dbg(dev, "bh version     = 0x%08x", bh->bh_version);
>> +	al_codec_dbg(dev, "fw version     = 0x%08x", bh->fw_version);
>> +	al_codec_dbg(dev, "fw model       = %s", bh->model);
>> +	al_codec_dbg(dev, "vaddress start = 0x%016llx", bh->vaddr_start);
>> +	al_codec_dbg(dev, "vaddress end   = 0x%016llx", bh->vaddr_end);
>> +	al_codec_dbg(dev, "boot address   = 0x%016llx", bh->vaddr_boot);
>> +	al_codec_dbg(dev, "machineid      = %lld", bh->machine_id);
>> +	al_codec_dbg(dev, "periph address = 0x%016llx", dev->apb);
>> +	al_codec_dbg(dev, "ip start     = 0x%016llx", bh->ip_start);
>> +	al_codec_dbg(dev, "ip end       = 0x%016llx", bh->ip_end);
>> +	al_codec_dbg(dev, "mcu clk	= %llu", bh->mcu_clk_rate);
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_common_load_firmware_start(struct al_codec_dev *dev,
>> +					 const char *name)
>> +{
>> +	struct platform_device *pdev = dev->pdev;
>> +	dma_addr_t phys;
>> +	size_t size;
>> +	void *virt;
>> +	int err;
>> +
>> +	if (dev->firmware.virt)
>> +		return 0;
>> +
>> +	err = al_common_read_firmware(dev, name);
>> +	if (err)
>> +		return err;
>> +
>> +	size = dev->firmware.size;
>> +
>> +	virt = dma_alloc_coherent(&pdev->dev, size, &phys, GFP_KERNEL);
>> +	err = dma_mapping_error(&pdev->dev, phys);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	dev->firmware.virt = virt;
>> +	dev->firmware.phys = phys;
>> +
>> +	al_common_copy_firmware_image(dev);
>> +	err = al_common_parse_firmware_image(dev);
>> +	if (err) {
>> +		al_codec_err(dev, "failed to parse firmware image");
>> +		goto cleanup;
>> +	}
>> +
>> +	err = al_common_setup_hw_regs(dev);
>> +	if (err) {
>> +		al_codec_err(dev, "Unable to setup hw registers");
>> +		goto cleanup;
>> +	}
>> +
>> +	al_codec_mb_init(&dev->mb_h2m, virt + dev->firmware.mb_h2m.offset,
>> +			 dev->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
>> +
>> +	al_codec_mb_init(&dev->mb_m2h, virt + dev->firmware.mb_m2h.offset,
>> +			 dev->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
>> +
>> +	err = al_common_start_fw(dev);
>> +	if (err) {
>> +		al_codec_err(dev, "fw start has failed");
>> +		goto cleanup;
>> +	}
>> +
>> +	al_codec_dbg(dev, "mcu has boot successfully !");
>> +	dev->fw_ready_cb(dev->cb_arg);
>> +
>> +	release_firmware(dev->firmware.firmware);
>> +	dev->firmware.firmware = NULL;
>> +
>> +	return 0;
>> +cleanup:
>> +	dma_free_coherent(&pdev->dev, size, virt, phys);
>> +
>> +	return err;
>> +}
>> +
>> +static u64 al_common_get_periph_addr(struct al_codec_dev *dev)
>> +{
>> +	struct resource *res;
>> +
>> +	res = platform_get_resource_byname(dev->pdev, IORESOURCE_MEM, "apb");
>> +	if (!res) {
>> +		al_codec_err(dev, "Unable to find APB start address");
>> +		return 0;
>> +	}
>> +
>> +	if (res->start & AL_CODEC_APB_MASK) {
>> +		al_codec_err(dev, "APB start address is invalid");
>> +		return 0;
>> +	}
>> +
>> +	return res->start;
>> +}
>> +
>> +int al_common_probe(struct al_codec_dev *dev, const char *name)
>> +{
>> +	struct platform_device *pdev = dev->pdev;
>> +	int irq;
>> +	int ret;
>> +
>> +	mutex_init(&dev->buf_lock);
>
>Ad this stage, you driver is not yes active, can it really be concurrent ?
>
It's not, but the mutex should be initiated before starting the MCU.

>> +	INIT_LIST_HEAD(&dev->alloc_buffers);
>> +	init_completion(&dev->completion);
>> +
>> +	/* setup dma memory */
>> +	ret = al_common_setup_dma(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Hw registers */
>> +	dev->regs_info =
>> +		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>> +	if (!dev->regs_info) {
>> +		al_codec_err(dev, "regs resource missing from device tree");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev->regs = devm_ioremap_resource(&pdev->dev, dev->regs_info);
>> +	if (!dev->regs) {
>> +		al_codec_err(dev, "failed to map registers");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dev->apb = al_common_get_periph_addr(dev);
>> +	if (!dev->apb)
>> +		return -EINVAL;
>> +
>> +	/* The MCU has already default clock value */
>> +	dev->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(dev->clk)) {
>> +		al_codec_err(dev, "failed to get MCU core clock");
>> +		return PTR_ERR(dev->clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(dev->clk);
>> +	if (ret) {
>> +		al_codec_err(dev, "Cannot enable MCU clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		al_codec_err(dev, "Failed to get IRQ");
>> +		ret = -EINVAL;
>> +		goto disable_clk;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
>> +					al_common_hardirq_handler,
>> +					al_common_irq_handler, IRQF_SHARED,
>> +					dev_name(&pdev->dev), dev);
>> +	if (ret) {
>> +		al_codec_err(dev, "Unable to register irq handler");
>> +		goto disable_clk;
>> +	}
>> +
>> +	/* ok so request the fw */
>> +	ret = al_common_load_firmware_start(dev, name);
>> +	if (ret) {
>> +		al_codec_err(dev, "failed to load firmware : %s", name);
>> +		goto disable_clk;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_clk:
>> +	clk_disable_unprepare(dev->clk);
>
>Please double check if anything else need cleanup on failures.
>

This is a startup function, all failures that we can have is the no
ENOMEM for the firmware ( already handled ), and other failures are
handled by this probe function.
>> +
>> +	return ret;
>> +}
>> +
>> +int al_common_send(struct al_codec_dev *dev, struct msg_itf_header *hdr)
>> +{
>> +	return al_codec_msg_send(&dev->mb_h2m, hdr, al_common_trigger_mcu_irq,
>> +				 dev);
>> +}
>> +
>> +int al_common_send_req_reply(struct al_codec_dev *dev,
>> +			     struct list_head *cmd_list,
>> +			     struct msg_itf_header *hdr,
>> +			     struct al_common_mcu_req *req)
>> +{
>> +	struct al_codec_cmd *cmd = NULL;
>> +	int ret;
>> +
>> +	hdr->drv_cmd_hdl = 0;
>> +
>> +	if (req->reply_size && req->reply) {
>> +		cmd = al_codec_cmd_create(req->reply_size);
>> +		if (!cmd)
>> +			return -ENOMEM;
>> +
>> +		hdr->drv_cmd_hdl = al_virt_to_phys(cmd);
>> +	}
>> +
>> +	hdr->drv_ctx_hdl = req->pCtx;
>> +	hdr->type = req->req_type;
>> +	hdr->payload_len = req->req_size;
>> +
>> +	/* Add the list to the cmd list */
>> +	if (cmd)
>> +		list_add(&cmd->list, cmd_list);
>> +
>> +	ret = al_common_send(dev, hdr);
>> +	if (ret)
>> +		goto remove_cmd;
>> +
>> +	al_codec_dbg(dev, "Send req to mcu %d : %ld ", req->req_type,
>> +		     req->req_size);
>> +
>> +	if (!cmd)
>> +		return 0;
>> +
>> +	ret = wait_for_completion_timeout(&cmd->done, 5 * HZ);
>> +	if (ret <= 0) {
>> +		al_codec_err(dev, "cmd %p has %d (%s)", cmd, ret,
>> +			     (ret == 0) ? "failed" : "timedout");
>> +		ret = -ETIMEDOUT;
>> +		goto remove_cmd;
>> +	}
>> +
>> +	ret = 0;
>> +	memcpy(req->reply, cmd->reply, req->reply_size);
>> +
>> +remove_cmd:
>> +
>> +	if (cmd) {
>> +		list_del(&cmd->list);
>> +		al_codec_cmd_put(cmd);
>> +	}
>> +	return ret;
>> +}
>> +
>> +bool al_common_mcu_is_alive(struct al_codec_dev *dev)
>> +{
>> +	static const struct msg_itf_header hdr = {
>> +		.type = MSG_ITF_TYPE_MCU_ALIVE,
>> +		.payload_len = 0,
>> +	};
>> +	int ret;
>> +
>> +	ret = al_common_send(dev, (struct msg_itf_header *)&hdr);
>> +	if (ret)
>> +		return false;
>> +
>> +	ret = wait_for_completion_timeout(&dev->completion, 5 * HZ);
>> +	if (ret <= 0)
>> +		return false;
>> +
>> +	return true;
>> +}
>
>I've stopped here, but hopefully feedback is better then no feedback.
>

Thank you for this review, the fixes should be applied on the v2
patchset.

>regards,
>Nicolas
>

Best regards
Yassine OUAISSA
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.h b/drivers/media/platform/allegro-
>> dvt/al300/al_codec_common.h
>> new file mode 100644
>> index 000000000000..41373bbf3671
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
>> @@ -0,0 +1,247 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#ifndef __AL_CODEC_COMMON__
>> +#define __AL_CODEC_COMMON__
>> +
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <media/v4l2-device.h>
>> +
>> +#include "al_codec_util.h"
>> +
>> +#define fh_to_ctx(ptr, type) container_of(ptr, type, fh)
>> +
>> +enum {
>> +	MSG_ITF_TYPE_CREATE_INST_REQ = MSG_ITF_TYPE_NEXT_REQ,
>> +	MSG_ITF_TYPE_DESTROY_INST_REQ,
>> +	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ,
>> +	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ,
>> +	MSG_ITF_TYPE_FLUSH_REQ,
>> +	MSG_ITF_TYPE_INFO_REQ,
>> +	MSG_ITF_TYPE_CREATE_INST_REPLY = MSG_ITF_TYPE_NEXT_REPLY,
>> +	MSG_ITF_TYPE_DESTROY_INST_REPLY,
>> +	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REPLY,
>> +	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REPLY,
>> +	MSG_ITF_TYPE_FLUSH_REPLY,
>> +	MSG_ITF_TYPE_INFO_REPLY,
>> +	MSG_ITF_TYPE_EVT_ERROR = MSG_ITF_TYPE_NEXT_EVT,
>> +};
>> +
>> +struct msg_itf_write_req {
>> +	u32 fd;
>> +	u32 len;
>> +	/* payload follow */
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_write_req);
>> +
>> +struct msg_itf_free_mem_req {
>> +	phys_addr_t phyAddr;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_free_mem_req);
>> +
>> +struct msg_itf_alloc_mem_req {
>> +	u64 uSize;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_alloc_mem_req);
>> +
>> +struct msg_itf_alloc_mem_reply {
>> +	phys_addr_t phyAddr;
>> +} __packed;
>> +DECLARE_FULL_REPLY(msg_itf_alloc_mem_reply);
>> +
>> +struct msg_itf_free_mem_reply {
>> +	s64 ret;
>> +};
>> +DECLARE_FULL_REPLY(msg_itf_free_mem_reply);
>> +
>> +struct msg_itf_create_codec_reply {
>> +	phys_addr_t hCodec;
>> +	s32 ret;
>> +} __packed;
>> +DECLARE_FULL_REPLY(msg_itf_create_codec_reply);
>> +
>> +struct msg_itf_destroy_codec_req {
>> +	phys_addr_t hCodec;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_destroy_codec_req);
>> +
>> +/*
>> + * Note : no need to know the status of this request
>> + * The codec should be destroyed, in case of the mcu
>> + * hasn't received any request with the codec handler
>> + */
>> +struct msg_itf_destroy_codec_reply {
>> +	u32 unused;
>> +} __packed;
>> +DECLARE_FULL_REPLY(msg_itf_destroy_codec_reply);
>> +
>> +struct al_buffer_meta {
>> +	u64 timestamp;
>> +	struct v4l2_timecode timecode;
>> +	bool last;
>> +};
>> +
>> +struct msg_itf_push_src_buf_req {
>> +	phys_addr_t hCodec;
>> +	phys_addr_t bufferHandle;
>> +	phys_addr_t phyAddr;
>> +	u64 size;
>> +	struct al_buffer_meta meta;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_push_src_buf_req);
>> +
>> +struct msg_itf_push_dst_buf_req {
>> +	phys_addr_t hCodec;
>> +	phys_addr_t bufferHandle;
>> +	phys_addr_t phyAddr;
>> +	u64 size;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_push_dst_buf_req);
>> +
>> +struct msg_itf_push_buffer_req {
>> +	phys_addr_t hCodec;
>> +	phys_addr_t bufferHandle;
>> +	phys_addr_t phyAddr;
>> +	u64 size;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_push_buffer_req);
>> +
>> +struct msg_itf_push_buffer_reply {
>> +	s32 res;
>> +} __packed;
>> +DECLARE_FULL_REPLY(msg_itf_push_buffer_reply);
>> +
>> +struct msg_itf_info_req {
>> +	u64 unused;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_info_req);
>> +
>> +struct msg_itf_flush_req {
>> +	phys_addr_t hCodec;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_flush_req);
>> +
>> +struct msg_itf_flush_reply {
>> +	int32_t unused;
>> +} __packed;
>> +DECLARE_FULL_REPLY(msg_itf_flush_reply);
>> +
>> +struct msg_itf_evt_error {
>> +	uint32_t errno;
>> +} __packed;
>> +DECLARE_FULL_EVENT(msg_itf_evt_error);
>> +
>> +struct al_match_data {
>> +	const char *fw_name;
>> +};
>> +
>> +struct al_common_mcu_req {
>> +	phys_addr_t pCtx;
>> +	int req_type;
>> +	size_t req_size;
>> +	size_t reply_size;
>> +	void *reply;
>> +} __packed;
>> +
>> +struct al_firmware_section {
>> +	u64 offset;
>> +	size_t size;
>> +};
>> +
>> +struct al_firmware {
>> +	/* Firmware after it is read but not loaded */
>> +	const struct firmware *firmware;
>> +
>> +	/* Raw firmware data */
>> +	dma_addr_t phys;
>> +	void *virt;
>> +	size_t size;
>> +
>> +	/* Parsed firmware information */
>> +	struct al_firmware_section bin_data;
>> +	struct al_firmware_section mb_m2h;
>> +	struct al_firmware_section mb_h2m;
>> +};
>> +
>> +struct al_codec_dev {
>> +	struct platform_device *pdev;
>> +	struct v4l2_device v4l2_dev;
>> +	struct v4l2_m2m_dev *m2m_dev;
>> +	struct video_device video_dev;
>> +
>> +	/* Firmware */
>> +	struct al_firmware firmware;
>> +	dma_addr_t apb;
>> +
>> +	struct clk *clk;
>> +	void __iomem *regs;
>> +	struct resource *regs_info;
>> +
>> +	/* Mailbox structs */
>> +	struct al_codec_mb mb_h2m;
>> +	struct al_codec_mb mb_m2h;
>> +
>> +	/* list of buffers used by the MCU */
>> +	struct list_head alloc_buffers;
>> +	struct mutex buf_lock;
>> +
>> +	/* mutex protecting vb2_queue structure */
>> +	struct mutex lock;
>> +
>> +	/* list of ctx (aka decoder) */
>> +	struct mutex ctx_mlock;
>> +	struct list_head ctx_q_list;
>> +	int is_video_init_done;
>> +
>> +	/* list of cap/out supported formats */
>> +	struct list_head codec_q_list;
>> +	struct al_codec_cmd *codec_info_cmd;
>> +
>> +	/* Command completion */
>> +	struct completion completion;
>> +	/* Resolution found completion */
>> +	struct completion res_done;
>> +
>> +	/* callbacks set by client before common_probe */
>> +	void *cb_arg;
>> +	void (*process_msg_cb)(void *cb_arg, struct msg_itf_header *hdr);
>> +	void (*fw_ready_cb)(void *cb_arg);
>> +};
>> +
>> +static inline int al_common_get_header(struct al_codec_dev *dev,
>> +				       struct msg_itf_header *hdr)
>> +{
>> +	return al_codec_msg_get_header(&dev->mb_m2h, hdr);
>> +}
>> +
>> +static inline int al_common_get_data(struct al_codec_dev *dev, char *data,
>> +				     int len)
>> +{
>> +	return al_codec_msg_get_data(&dev->mb_m2h, data, len);
>> +}
>> +
>> +static inline int al_common_skip_data(struct al_codec_dev *dev, int len)
>> +{
>> +	return al_common_get_data(dev, NULL, len);
>> +}
>> +
>> +int al_common_send(struct al_codec_dev *dev, struct msg_itf_header *hdr);
>> +int al_common_send_req_reply(struct al_codec_dev *dev,
>> +			     struct list_head *cmd_list,
>> +			     struct msg_itf_header *hdr,
>> +			     struct al_common_mcu_req *req);
>> +bool al_common_mcu_is_alive(struct al_codec_dev *dev);
>> +
>> +int al_common_probe(struct al_codec_dev *dev, const char *name);
>> +void al_common_remove(struct al_codec_dev *dev);
>> +
>> +#endif /*__AL_CODEC_COMMON__*/
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.c b/drivers/media/platform/allegro-
>> dvt/al300/al_codec_util.c
>> new file mode 100644
>> index 000000000000..6cc5b1322475
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
>> @@ -0,0 +1,177 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Mailbox communication utilities for command creation
>> + * and message exchange with the MCU
>> + *
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#include <asm-generic/errno.h>
>> +#include <linux/errno.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/string.h>
>> +
>> +#include "al_codec_util.h"
>> +
>> +static int al_get_used_space(struct al_codec_mb *mb)
>> +{
>> +	u32 head = mb->hdr->head;
>> +	u32 tail = mb->hdr->tail;
>> +
>> +	return head >= tail ? head - tail : mb->size - (tail - head);
>> +}
>> +
>> +static int al_get_free_space(struct al_codec_mb *mb)
>> +{
>> +	return mb->size - al_get_used_space(mb) - 1;
>> +}
>> +
>> +static int al_has_enough_space(struct al_codec_mb *mb, int len)
>> +{
>> +	return al_get_free_space(mb) >= len;
>> +}
>> +
>> +static inline void al_copy_to_mb(struct al_codec_mb *mb, char *data, int len)
>> +{
>> +	u32 head = mb->hdr->head;
>> +	int copy_len = min(mb->size - head, (unsigned int)len);
>> +	int copied_len = len;
>> +
>> +	memcpy(&mb->data[head], data, copy_len);
>> +	len -= copy_len;
>> +	if (len)
>> +		memcpy(&mb->data[0], &data[copy_len], len);
>> +
>> +	/* Make sure that all messages are written before updating the head */
>> +	dma_wmb();
>> +	mb->hdr->head = (head + copied_len) % mb->size;
>> +	/* Make sure that the head is updated in DDR instead of cache */
>> +	dma_wmb();
>> +}
>> +
>> +static inline void al_copy_from_mb(struct al_codec_mb *mb, char *data, int len)
>> +{
>> +	u32 tail = mb->hdr->tail;
>> +	int copy_len = min(mb->size - tail, (unsigned int)len);
>> +	int copied_len = len;
>> +
>> +	if (!data)
>> +		goto update_tail;
>> +
>> +	memcpy(data, &mb->data[tail], copy_len);
>> +	len -= copy_len;
>> +	if (len)
>> +		memcpy(&data[copy_len], &mb->data[0], len);
>> +
>> +update_tail:
>> +	mb->hdr->tail = (tail + copied_len) % mb->size;
>> +	/* Make sure that the head is updated in DDR instead of cache */
>> +	dma_wmb();
>> +}
>> +
>> +static int al_codec_mb_send(struct al_codec_mb *mb, char *data, int len)
>> +{
>> +	if (!al_has_enough_space(mb, len))
>> +		return -ENOMEM;
>> +
>> +	al_copy_to_mb(mb, data, len);
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_codec_mb_receive(struct al_codec_mb *mb, char *data, int len)
>> +{
>> +	if (al_get_used_space(mb) < len)
>> +		return -ENOMEM;
>> +
>> +	al_copy_from_mb(mb, data, len);
>> +
>> +	return 0;
>> +}
>> +
>> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic)
>> +{
>> +	mb->hdr = (struct al_mb_itf *)addr;
>> +	mb->hdr->magic = magic;
>> +	mb->hdr->version = MB_IFT_VERSION;
>> +	mb->hdr->head = 0;
>> +	mb->hdr->tail = 0;
>> +	mb->data = addr + sizeof(struct al_mb_itf);
>> +	mb->size = size - sizeof(struct al_mb_itf);
>> +	mutex_init(&mb->lock);
>> +}
>> +
>> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr)
>> +{
>> +	return al_codec_mb_receive(mb, (char *)hdr, sizeof(*hdr));
>> +}
>> +
>> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len)
>> +{
>> +	return al_codec_mb_receive(mb, data, len);
>> +}
>> +
>> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
>> +		      void (*trigger)(void *), void *trigger_arg)
>> +{
>> +	unsigned long timeout;
>> +	int ret;
>> +
>> +	timeout = jiffies + HZ;
>> +	mutex_lock(&mb->lock);
>> +	do {
>> +		if (time_after(jiffies, timeout)) {
>> +			mutex_unlock(&mb->lock);
>> +			return -ETIMEDOUT;
>> +		}
>> +		ret = al_codec_mb_send(mb, (char *)hdr,
>> +				       hdr->payload_len +
>> +					       sizeof(struct msg_itf_header));
>> +
>> +	} while (ret);
>> +	mutex_unlock(&mb->lock);
>> +
>> +	trigger(trigger_arg);
>> +
>> +	return 0;
>> +}
>> +
>> +static void al_codec_cmd_cleanup(struct kref *ref)
>> +{
>> +	struct al_codec_cmd *cmd = container_of(ref, typeof(*cmd), refcount);
>> +
>> +	kfree(cmd->reply);
>> +	kfree(cmd);
>> +}
>> +
>> +void al_codec_cmd_put(struct al_codec_cmd *cmd)
>> +{
>> +	if (WARN_ON(!cmd))
>> +		return;
>> +
>> +	kref_put(&cmd->refcount, al_codec_cmd_cleanup);
>> +}
>> +
>> +struct al_codec_cmd *al_codec_cmd_create(int reply_size)
>> +{
>> +	struct al_codec_cmd *cmd;
>> +
>> +	cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
>> +	if (!cmd)
>> +		return NULL;
>> +
>> +	cmd->reply = kmalloc(reply_size, GFP_KERNEL);
>> +	if (!cmd->reply) {
>> +		kfree(cmd);
>> +		return NULL;
>> +	}
>> +
>> +	kref_init(&cmd->refcount);
>> +	cmd->reply_size = reply_size;
>> +	init_completion(&cmd->done);
>> +
>> +	return cmd;
>> +}
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-
>> dvt/al300/al_codec_util.h
>> new file mode 100644
>> index 000000000000..1743877e9ff6
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>> @@ -0,0 +1,185 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#ifndef __AL_CODEC_UTIL__
>> +#define __AL_CODEC_UTIL__
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/v4l2-common.h>
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#define MB_IFT_MAGIC_H2M 0xabcd1230
>> +#define MB_IFT_MAGIC_M2H 0xabcd1231
>> +#define MB_IFT_VERSION 0x00010000
>> +
>> +#define MAJOR_SHIFT 20
>> +#define MAJOR_MASK 0xfff
>> +#define MINOR_SHIFT 8
>> +#define MINOR_MASK 0xfff
>> +#define PATCH_SHIFT 0
>> +#define PATCH_MASK 0xff
>> +
>> +/*
>> + * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
>> + * the same for minor, 8bits for the patch
>> + */
>> +#define AL_BOOT_VERSION(major, minor, patch)    \
>> +	((((major) & MAJOR_MASK) << MAJOR_SHIFT) |    \
>> +	 (((minor) & MINOR_MASK) << MINOR_SHIFT) |    \
>> +	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
>> +
>> +#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
>> +#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
>> +
>> +#define DECLARE_FULL_REQ(s)         \
>> +	struct s##_full {                 \
>> +		struct msg_itf_header hdr;      \
>> +		struct s req;                   \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_REPLY(s)     \
>> +	struct s##_full {               \
>> +		struct msg_itf_header hdr;    \
>> +		struct s reply;               \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_EVENT(s)     \
>> +	struct s##_full {               \
>> +		struct msg_itf_header hdr;    \
>> +		struct s event;               \
>> +	} __packed
>> +
>> +struct al_mb_itf {
>> +	u32 magic;
>> +	u32 version;
>> +	u32 head;
>> +	u32 tail;
>> +} __packed;
>> +
>> +struct al_codec_mb {
>> +	struct al_mb_itf *hdr;
>> +	struct mutex lock;
>> +	char *data;
>> +	int size;
>> +};
>> +
>> +struct al_codec_cmd {
>> +	struct kref refcount;
>> +	struct list_head list;
>> +	struct completion done;
>> +	int reply_size;
>> +	void *reply;
>> +};
>> +
>> +#define al_codec_err(al_dev, fmt, args...)                                \
>> +	dev_err(&(al_dev)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n",  \
>> +		__func__, __LINE__, ##args)
>> +
>> +#define al_v4l2_err(al_dev, fmt, args...)                                 \
>> +	dev_err(&(al_dev)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n",   \
>> +		__func__, __LINE__, ##args)
>> +
>> +#if defined(DEBUG)
>> +
>> +extern int debug;
>> +
>> +/* V4L2 logs */
>> +#define al_v4l2_dbg(al_dev, level, fmt, args...)    \
>> +	do {                                              \
>> +		if (debug >= level)                             \
>> +			dev_dbg(&(al_dev)->pdev->dev,                 \
>> +				"[ALG_V4L2] level=%d %s(),%d: " fmt "\n",   \
>> +				level, __func__, __LINE__, ##args);         \
>> +	} while (0)
>> +
>> +/* Codec logs */
>> +#define al_codec_dbg(al_dev, fmt, args...)          \
>> +	do {                                              \
>> +		if (debug)                                      \
>> +			dev_dbg(&(al_dev)->pdev->dev,                 \
>> +				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
>> +				__LINE__, ##args);                          \
>> +	} while (0)
>> +
>> +#else
>> +
>> +#define al_v4l2_dbg(al_dev, level, fmt, args...)            \
>> +	do {                                                      \
>> +		(void)level;                                            \
>> +		dev_dbg(&(al_dev)->pdev->dev, "[ALG_V4L2]: " fmt "\n",  \
>> +			##args);                                              \
>> +	} while (0)
>> +
>> +#define al_codec_dbg(al_dev, fmt, args...) \
>> +	dev_dbg(&(al_dev)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
>> +#endif
>> +
>> +#define MSG_ITF_TYPE_LIMIT BIT(10)
>> +
>> +/* Message types host <-> mcu */
>> +enum {
>> +	MSG_ITF_TYPE_MCU_ALIVE = 0,
>> +	MSG_ITF_TYPE_WRITE_REQ = 2,
>> +	MSG_ITF_TYPE_FIRST_REQ = 1024,
>> +	MSG_ITF_TYPE_NEXT_REQ,
>> +	MSG_ITF_TYPE_FIRST_REPLY = 2048,
>> +	MSG_ITF_TYPE_NEXT_REPLY,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
>> +	MSG_ITF_TYPE_FREE_MEM_REQ,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
>> +	MSG_ITF_TYPE_FREE_MEM_REPLY,
>> +	MSG_ITF_TYPE_FIRST_EVT = 5120,
>> +	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
>> +};
>> +
>> +struct msg_itf_header {
>> +	u64 drv_ctx_hdl;
>> +	u64 drv_cmd_hdl;
>> +	u16 type;
>> +	u16 payload_len;
>> +	u16 padding[2];
>> +} __packed;
>> +
>> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
>> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
>> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
>> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
>> +		      void (*trigger)(void *), void *trigger_arg);
>> +
>> +static inline bool is_type_reply(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
>> +	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +static inline bool is_type_event(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_EVT &&
>> +	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +void al_codec_cmd_put(struct al_codec_cmd *cmd);
>> +
>> +struct al_codec_cmd *al_codec_cmd_create(int reply_size);
>> +
>> +static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
>> +						    uint64_t hdl)
>> +{
>> +	struct al_codec_cmd *cmd = NULL;
>> +
>> +	list_for_each_entry(cmd, cmd_list, list) {
>> +		if (likely(cmd == al_phys_to_virt(hdl))) {
>> +			kref_get(&cmd->refcount);
>> +			break;
>> +		}
>> +	}
>> +	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
>> +}
>> +
>> +#endif /* __AL_CODEC_UTIL__ */
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c b/drivers/media/platform/allegro-
>> dvt/al300/al_vdec_drv.c
>> new file mode 100644
>> index 000000000000..3d80b47d7056
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
>> @@ -0,0 +1,1530 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + *
>> + * Allegro DVT stateful video decoder driver for the IP Gen 3
>> + */
>> +
>> +#include <asm-generic/errno-base.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/string.h>
>> +#include <linux/v4l2-controls.h>
>> +#include <media/v4l2-ctrls.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-event.h>
>> +#include <media/v4l2-ioctl.h>
>> +#include <media/videobuf2-dma-contig.h>
>> +
>> +#include "al_codec_common.h"
>> +#include "al_vdec_drv.h"
>> +
>> +#if defined(DEBUG)
>> +/* Log level */
>> +int debug;
>> +module_param(debug, int, 0644);
>> +MODULE_PARM_DESC(debug, "Debug level (0-3)");
>> +#endif
>> +
>> +/* default decoder params */
>> +#define DECODER_WIDTH_DEFAULT 640
>> +#define DECODER_HEIGHT_DEFAULT 480
>> +#define DECODER_WIDTH_MAX 3840
>> +#define DECODER_HEIGHT_MAX 2160
>> +#define DECODER_WIDTH_MIN 16
>> +#define DECODER_HEIGHT_MIN 16
>> +#define DEC_REQ_TIMEOUT msecs_to_jiffies(1000)
>> +#define DEC_RES_EVT_TIMEOUT DEC_REQ_TIMEOUT
>> +
>> +/* Supported formats */
>> +static const struct al_fmt al_src_formats[] = {
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_H264,
>> +		.bpp = 20,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_HEVC,
>> +		.bpp = 20,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_JPEG,
>> +		.bpp = 8,
>> +	}
>> +};
>> +
>> +static const struct al_fmt al_dst_formats[] = {
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_NV12,
>> +		.bpp = 12,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_P010,
>> +		.bpp = 12,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_NV16,
>> +		.bpp = 16,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_YUV420, /* YUV 4:2:0 */
>> +		.bpp = 12,
>> +	},
>> +	{
>> +		.pixelformat = V4L2_PIX_FMT_YVU420, /* YVU 4:2:0 */
>> +		.bpp = 12,
>> +	},
>> +};
>> +
>> +/* Default format */
>> +static const struct al_frame al_default_fmt = {
>> +
>> +	.width = DECODER_WIDTH_DEFAULT,
>> +	.height = DECODER_HEIGHT_DEFAULT,
>> +	.bytesperline = DECODER_WIDTH_MAX * 4,
>> +	.sizeimage = DECODER_WIDTH_DEFAULT * DECODER_HEIGHT_DEFAULT * 4,
>> +	.nbuffers = 1,
>> +	.fmt = &al_dst_formats[0],
>> +	.field = V4L2_FIELD_NONE,
>> +	.colorspace = V4L2_COLORSPACE_REC709,
>> +	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
>> +	.quantization = V4L2_QUANTIZATION_DEFAULT,
>> +	.xfer_func = V4L2_XFER_FUNC_DEFAULT
>> +};
>> +
>> +static struct al_frame *al_get_frame(struct al_dec_ctx *ctx,
>> +				     enum v4l2_buf_type type)
>> +{
>> +	if (WARN_ON(!ctx))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		return &ctx->src;
>> +	else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return &ctx->dst;
>> +
>> +	al_v4l2_err(ctx->dev, "Unsupported type (%d)", type);
>> +
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>> +static const struct al_fmt *al_find_fmt(u32 pixelformat)
>> +{
>> +	const struct al_fmt *fmt;
>> +	unsigned int i;
>> +
>> +	/* check if the pixelformat exist in the src formats list */
>> +	for (i = 0; i < ARRAY_SIZE(al_src_formats); i++) {
>> +		fmt = &al_src_formats[i];
>> +		if (fmt->pixelformat == pixelformat)
>> +			return fmt;
>> +	}
>> +
>> +	/* check if the pixelformat exist in the dst formats list */
>> +	for (i = 0; i < ARRAY_SIZE(al_dst_formats); i++) {
>> +		fmt = &al_dst_formats[i];
>> +		if (fmt->pixelformat == pixelformat)
>> +			return fmt;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static int dec_fw_create_decoder(struct al_dec_ctx *ctx)
>> +{
>> +	struct msg_itf_create_decoder_req_full req;
>> +	struct msg_itf_create_codec_reply reply;
>> +	struct al_common_mcu_req mreq;
>> +	int ret;
>> +
>> +	if (ctx->hDec) {
>> +		al_v4l2_dbg(ctx->dev, 3, "fw decoder already exist\n");
>> +		return 0;
>> +	}
>> +
>> +	req.req.codec = ctx->codec;
>> +
>> +	mreq.pCtx = al_virt_to_phys(ctx);
>> +	mreq.req_type = MSG_ITF_TYPE_CREATE_INST_REQ;
>> +	mreq.req_size = sizeof(req.req);
>> +	mreq.reply_size = sizeof(reply);
>> +	mreq.reply = &reply;
>> +
>> +	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
>> +				       &mreq);
>> +
>> +	if (!ret && !reply.ret)
>> +		ctx->hDec = reply.hCodec;
>> +	else if (reply.ret)
>> +		ret = -ENODEV;
>> +
>> +	return ret;
>> +}
>> +
>> +static void dec_fw_destroy_decoder(struct al_dec_ctx *ctx)
>> +{
>> +	struct msg_itf_destroy_codec_req_full req;
>> +	struct msg_itf_destroy_codec_reply reply;
>> +	struct al_common_mcu_req mreq;
>> +	int ret;
>> +
>> +	if (WARN(!ctx->hDec, "NULL Decoder to destroy !"))
>> +		return;
>> +
>> +	al_v4l2_dbg(ctx->dev, 3, "Destroy decoder %lld ", ctx->hDec);
>> +
>> +	req.req.hCodec = ctx->hDec;
>> +
>> +	mreq.pCtx = al_virt_to_phys(ctx);
>> +	mreq.req_type = MSG_ITF_TYPE_DESTROY_INST_REQ;
>> +	mreq.req_size = sizeof(req.req);
>> +	mreq.reply_size = sizeof(reply);
>> +	mreq.reply = &reply;
>> +
>> +	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
>> +				       &mreq);
>> +
>> +	if (!ret)
>> +		ctx->hDec = 0;
>> +}
>> +
>> +static int al_dec_fw_push_frame_buf(struct al_dec_ctx *ctx,
>> +				    struct vb2_v4l2_buffer *vbuf)
>> +{
>> +	struct msg_itf_push_dst_buf_req_full req;
>> +	struct v4l2_m2m_buffer *m2m_buf;
>> +	struct al_common_mcu_req mreq = { 0 };
>> +	int ret;
>> +
>> +	if (WARN(!vbuf, "NULL frame Buffer to push!!"))
>> +		return -EINVAL;
>> +
>> +	req.req.hCodec = ctx->hDec;
>> +	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
>> +	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
>> +	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>> +	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
>> +
>> +	mreq.pCtx = al_virt_to_phys(ctx);
>> +	mreq.req_type = MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ;
>> +	mreq.req_size = sizeof(req.req);
>> +
>> +	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
>> +				       &mreq);
>> +	if (ret)
>> +		al_v4l2_err(ctx->dev, "Failed to push frame buffer %p %d",
>> +			    m2m_buf, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int al_dec_fw_push_bitstream_buf(struct al_dec_ctx *ctx,
>> +					struct vb2_v4l2_buffer *vbuf)
>> +{
>> +	struct msg_itf_push_src_buf_req_full req;
>> +	struct v4l2_m2m_buffer *m2m_buf;
>> +	struct al_common_mcu_req mreq = { 0 };
>> +	int ret;
>> +
>> +	if (WARN(!vbuf, "NULL Buffer to push!!"))
>> +		return -EINVAL;
>> +
>> +	req.req.hCodec = ctx->hDec;
>> +	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
>> +	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
>> +	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
>> +	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
>> +
>> +	/* Fill the v4l2 metadata*/
>> +	req.req.meta.timestamp = vbuf->vb2_buf.timestamp;
>> +	req.req.meta.timecode = vbuf->timecode;
>> +	req.req.meta.last = vbuf->flags & V4L2_BUF_FLAG_LAST;
>> +
>> +	mreq.pCtx = al_virt_to_phys(ctx);
>> +	mreq.req_type = MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ;
>> +	mreq.req_size = sizeof(req.req);
>> +
>> +	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
>> +				       &mreq);
>> +	if (ret)
>> +		al_v4l2_err(ctx->dev, "Failed to push bitstream buffer %p %d",
>> +			    m2m_buf, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int dec_fw_flush_req(struct al_dec_ctx *ctx)
>> +{
>> +	struct msg_itf_flush_req_full req;
>> +	struct msg_itf_flush_reply reply;
>> +	struct al_common_mcu_req mreq;
>> +	int ret;
>> +
>> +	req.req.hCodec = ctx->hDec;
>> +
>> +	mreq.pCtx = al_virt_to_phys(ctx);
>> +	mreq.req_type = MSG_ITF_TYPE_FLUSH_REQ;
>> +	mreq.req_size = sizeof(req.req);
>> +	mreq.reply_size = sizeof(reply);
>> +	mreq.reply = &reply;
>> +
>> +	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
>> +				       &mreq);
>> +
>> +	if (ret)
>> +		al_v4l2_err(ctx->dev, "Failed to flush the decoder %d", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static inline struct vb2_v4l2_buffer *
>> +al_dec_dequeue_buf(struct al_dec_ctx *ctx, uint64_t hdl,
>> +		   struct list_head *buffer_list)
>> +{
>> +	struct v4l2_m2m_buffer *buf, *tmp;
>> +	struct vb2_v4l2_buffer *ret = NULL;
>> +
>> +	mutex_lock(&ctx->buf_q_mlock);
>> +	list_for_each_entry_safe(buf, tmp, buffer_list, list) {
>> +		if (buf == al_phys_to_virt(hdl)) {
>> +			list_del(&buf->list);
>> +			ret = &buf->vb;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&ctx->buf_q_mlock);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct vb2_v4l2_buffer *al_dec_dequeue_src_buf(struct al_dec_ctx *ctx,
>> +						      uint64_t hdl)
>> +{
>> +	return al_dec_dequeue_buf(ctx, hdl, &ctx->stream_q_list);
>> +}
>> +
>> +static struct vb2_v4l2_buffer *al_dec_dequeue_dst_buf(struct al_dec_ctx *ctx,
>> +						      uint64_t hdl)
>> +{
>> +	return al_dec_dequeue_buf(ctx, hdl, &ctx->frame_q_list);
>> +}
>> +
>> +static void al_ctx_cleanup(struct kref *ref)
>> +{
>> +	struct al_dec_ctx *ctx = container_of(ref, struct al_dec_ctx, refcount);
>> +
>> +	kfree(ctx);
>> +}
>> +
>> +static inline struct al_dec_ctx *al_ctx_get(struct al_codec_dev *dev,
>> +					    uint64_t hdl)
>> +{
>> +	struct al_dec_ctx *ctx;
>> +	struct al_dec_ctx *ret = NULL;
>> +
>> +	mutex_lock(&dev->ctx_mlock);
>> +	list_for_each_entry(ctx, &dev->ctx_q_list, list) {
>> +		if (ctx == al_phys_to_virt(hdl)) {
>> +			kref_get(&ctx->refcount);
>> +			ret = ctx;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&dev->ctx_mlock);
>> +
>> +	return ret;
>> +}
>> +
>> +static void al_ctx_put(struct al_dec_ctx *ctx)
>> +{
>> +	kref_put(&ctx->refcount, al_ctx_cleanup);
>> +}
>> +
>> +static int al_dec_start_streaming(struct vb2_queue *q, unsigned int count)
>> +{
>> +	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
>> +	struct al_codec_dev *dev = ctx->dev;
>> +
>> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
>> +		struct v4l2_m2m_buffer *buf;
>> +		int ret;
>> +
>> +		if (list_empty(&ctx->stream_q_list)) {
>> +			al_v4l2_err(dev, "Empty stream list.");
>> +			return -EINVAL;
>> +		}
>> +
>> +		if (!al_common_mcu_is_alive(dev)) {
>> +			al_v4l2_err(dev, "Unable to ping the mcu");
>> +			return -ENODEV;
>> +		}
>> +
>> +		ret = dec_fw_create_decoder(ctx);
>> +		if (ret) {
>> +			al_v4l2_err(dev, "Unable to create the fw decoder %d",
>> +				    ret);
>> +			return ret;
>> +		}
>> +
>> +		/* Get the first vid-out queued buffer */
>> +		buf = list_first_entry(&ctx->stream_q_list,
>> +				       struct v4l2_m2m_buffer, list);
>> +
>> +		if (al_dec_fw_push_bitstream_buf(ctx, &buf->vb)) {
>> +			al_v4l2_err(ctx->dev,
>> +				    "Unable to push the bitstream buffer");
>> +			return -EINVAL;
>> +		}
>> +
>> +		/* Wait until the mcu detect the resolution of the stream */
>> +		ret = wait_for_completion_timeout(&ctx->res_done,
>> +						  DEC_RES_EVT_TIMEOUT);
>> +		if (!ret) {
>> +			al_v4l2_err(ctx->dev, "unsupported stream");
>> +			ctx->aborting = true;
>> +		}
>> +
>> +		ctx->osequence = 0;
>> +	} else
>> +		ctx->csequence = 0;
>> +
>> +	return 0;
>> +}
>> +
>> +static void al_dec_stop_streaming_cap(struct al_dec_ctx *ctx)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	struct v4l2_m2m_buffer *entry, *tmp;
>> +
>> +	mutex_lock(&ctx->buf_q_mlock);
>> +	if (!list_empty(&ctx->frame_q_list))
>> +		list_for_each_entry_safe(entry, tmp, &ctx->frame_q_list, list) {
>> +			list_del(&entry->list);
>> +			vbuf = &entry->vb;
>> +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
>> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +		}
>> +	mutex_unlock(&ctx->buf_q_mlock);
>> +
>> +	while (v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx)) {
>> +		vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>> +		if (vbuf) {
>> +			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
>> +			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +		}
>> +	}
>> +
>> +	v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
>> +}
>> +
>> +static void al_dec_stop_streaming_out(struct al_dec_ctx *ctx)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	struct v4l2_m2m_buffer *entry, *tmp;
>> +
>> +	mutex_lock(&ctx->buf_q_mlock);
>> +	if (!list_empty(&ctx->stream_q_list))
>> +		list_for_each_entry_safe(entry, tmp, &ctx->stream_q_list,
>> +					 list) {
>> +			list_del(&entry->list);
>> +			v4l2_m2m_buf_done(&entry->vb, VB2_BUF_STATE_ERROR);
>> +		}
>> +	mutex_unlock(&ctx->buf_q_mlock);
>> +
>> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx)) {
>> +		while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
>> +			if (vbuf->vb2_buf.state == VB2_BUF_STATE_ACTIVE)
>> +				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
>> +	}
>> +
>> +	dec_fw_destroy_decoder(ctx);
>> +}
>> +
>> +static void al_dec_stop_streaming(struct vb2_queue *q)
>> +{
>> +	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
>> +
>> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
>> +
>> +	/* Releasing the dst and src buffers */
>> +	ctx->stopped = true;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(q->type))
>> +		al_dec_stop_streaming_out(ctx);
>> +	else
>> +		al_dec_stop_streaming_cap(ctx);
>> +}
>> +
>> +static int al_dec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
>> +			      unsigned int *nplanes, unsigned int sizes[],
>> +			      struct device *alloc_devs[])
>> +{
>> +	struct al_dec_ctx *ctx = vb2_get_drv_priv(vq);
>> +	struct al_frame *format = al_get_frame(ctx, vq->type);
>> +
>> +	if (IS_ERR(format)) {
>> +		al_v4l2_err(ctx->dev, "Invalid format %p", format);
>> +		return PTR_ERR(format);
>> +	}
>> +
>> +	if (*nplanes)
>> +		return ((sizes[0] < format->sizeimage) ? -EINVAL : 0);
>> +
>> +	/* update queue num buffers */
>> +	format->nbuffers = max(*nbuffers, format->nbuffers);
>> +
>> +	*nplanes = 1;
>> +	sizes[0] = format->sizeimage;
>> +	*nbuffers = format->nbuffers;
>> +
>> +	al_v4l2_dbg(ctx->dev, 2, "%s: Get %d buffers of size %d each ",
>> +		    (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? "OUT" : "CAP",
>> +		    *nbuffers, sizes[0]);
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_buf_prepare(struct vb2_buffer *vb)
>> +{
>> +	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +
>> +	if (ctx->aborting)
>> +		return -EINVAL;
>> +
>> +	if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
>> +		if (vbuf->field == V4L2_FIELD_ANY)
>> +			vbuf->field = V4L2_FIELD_NONE;
>> +		if (vbuf->field != V4L2_FIELD_NONE)
>> +			return -EINVAL;
>> +	}
>> +
>> +	al_v4l2_dbg(ctx->dev, 3, "%s : Buffer (%p) prepared ",
>> +		    (V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP"), vbuf);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void al_dec_fill_bitstream(struct al_dec_ctx *ctx)
>> +{
>> +	struct vb2_v4l2_buffer *src_buf;
>> +	struct v4l2_m2m_buffer *m2m_buf;
>> +	struct vb2_queue *src_vq;
>> +
>> +	lockdep_assert_held(&ctx->buf_q_mlock);
>> +
>> +	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) > 0) {
>> +		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>> +		if (!src_buf)
>> +			return;
>> +
>> +		/* Dump empty buffers */
>> +		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
>> +			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>> +			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
>> +			return;
>> +		}
>> +
>> +		src_vq = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
>> +		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>> +
>> +		if (src_buf) {
>> +			src_buf->sequence = ctx->osequence++;
>> +
>> +			if (vb2_is_streaming(src_vq) &&
>> +			    al_dec_fw_push_bitstream_buf(ctx, src_buf)) {
>> +				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
>> +				return;
>> +			}
>> +
>> +			m2m_buf = container_of(src_buf, struct v4l2_m2m_buffer,
>> +					       vb);
>> +			list_add_tail(&m2m_buf->list, &ctx->stream_q_list);
>> +		}
>> +	}
>> +}
>> +
>> +static void al_dec_buf_queue(struct vb2_buffer *vb)
>> +{
>> +	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +
>> +	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
>> +		mutex_lock(&ctx->buf_q_mlock);
>> +		al_dec_fill_bitstream(ctx);
>> +		mutex_unlock(&ctx->buf_q_mlock);
>> +	}
>> +
>> +	al_v4l2_dbg(ctx->dev, 3, "%s queued (%p) - (%d)",
>> +		    V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP", vbuf,
>> +		    vb->num_planes);
>> +}
>> +
>> +static const struct vb2_ops dec_queue_ops = {
>> +	.queue_setup = al_dec_queue_setup,
>> +	.buf_prepare = al_dec_buf_prepare,
>> +	.buf_queue = al_dec_buf_queue,
>> +	.start_streaming = al_dec_start_streaming,
>> +	.stop_streaming = al_dec_stop_streaming,
>> +	.wait_prepare = vb2_ops_wait_prepare,
>> +	.wait_finish = vb2_ops_wait_finish,
>> +};
>> +
>> +static int al_dec_queue_init(void *priv, struct vb2_queue *src_vq,
>> +			     struct vb2_queue *dst_vq)
>> +{
>> +	struct al_dec_ctx *ctx = priv;
>> +	struct al_codec_dev *al_dev = ctx->dev;
>> +	int ret;
>> +
>> +	src_vq->dev = &al_dev->pdev->dev;
>> +	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
>> +	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	src_vq->non_coherent_mem = false;
>> +	src_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
>> +	src_vq->mem_ops = &vb2_dma_contig_memops;
>> +	src_vq->drv_priv = ctx;
>> +	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	src_vq->ops = &dec_queue_ops;
>> +	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	src_vq->lock = &ctx->dev->lock;
>> +	ret = vb2_queue_init(src_vq);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dst_vq->dev = &al_dev->pdev->dev;
>> +	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>> +	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
>> +	dst_vq->non_coherent_mem = false;
>> +	dst_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
>> +	dst_vq->mem_ops = &vb2_dma_contig_memops;
>> +	dst_vq->drv_priv = ctx;
>> +	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>> +	dst_vq->ops = &dec_queue_ops;
>> +	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
>> +	dst_vq->lock = &ctx->dev->lock;
>> +	ret = vb2_queue_init(dst_vq);
>> +	if (ret) {
>> +		vb2_queue_release(src_vq);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_querycap(struct file *file, void *fh,
>> +			   struct v4l2_capability *cap)
>> +{
>> +	struct al_codec_dev *dev = video_drvdata(file);
>> +
>> +	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
>> +	strscpy(cap->card, "Allegro DVT Video Decoder", sizeof(cap->card));
>> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
>> +		 dev_name(&dev->pdev->dev));
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>> +{
>> +	const struct al_fmt *fmt;
>> +
>> +	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
>> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
>> +		return -EINVAL;
>> +
>> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
>> +		if (f->index >= ARRAY_SIZE(al_src_formats))
>> +			return -EINVAL;
>> +
>> +		fmt = &al_src_formats[f->index];
>> +	} else {
>> +		if (f->index >= ARRAY_SIZE(al_dst_formats))
>> +			return -EINVAL;
>> +
>> +		fmt = &al_dst_formats[f->index];
>> +	}
>> +
>> +	f->pixelformat = fmt->pixelformat;
>> +	return 0;
>> +}
>> +
>> +static int al_dec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
>> +	struct v4l2_pix_format *pix = &f->fmt.pix;
>> +	struct al_frame *pix_fmt;
>> +
>> +	pix_fmt = al_get_frame(ctx, f->type);
>> +	if (IS_ERR(pix_fmt)) {
>> +		al_v4l2_err(ctx->dev, "Invalid frame (%p)", pix_fmt);
>> +		return PTR_ERR(pix_fmt);
>> +	}
>> +
>> +	pix_fmt->fmt = al_find_fmt(pix->pixelformat);
>> +	if (!pix_fmt->fmt) {
>> +		al_v4l2_err(ctx->dev, "Unknown format 0x%x", pix->pixelformat);
>> +		return -EINVAL;
>> +	}
>> +	pix->field = V4L2_FIELD_NONE;
>> +	pix->width = clamp_t(__u32, pix->width, DECODER_WIDTH_MIN,
>> +			     DECODER_WIDTH_MAX);
>> +	pix->height = clamp_t(__u32, pix->height, DECODER_HEIGHT_MIN,
>> +			      DECODER_HEIGHT_MAX);
>> +
>> +	pix->bytesperline = pix->width;
>> +	pix->sizeimage = (pix->width * pix->height * pix_fmt->fmt->bpp) / 8;
>> +
>> +	if (V4L2_TYPE_IS_CAPTURE(f->type))
>> +		if (pix->sizeimage < pix_fmt->sizeimage)
>> +			pix->sizeimage = pix_fmt->sizeimage;
>> +
>> +	al_v4l2_dbg(
>> +		ctx->dev, 3,
>> +		"%s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d) ",
>> +		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
>> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
>> +	struct al_frame *pix_fmt = al_get_frame(ctx, f->type);
>> +	struct v4l2_pix_format *pix;
>> +
>> +	if (IS_ERR(pix_fmt)) {
>> +		al_v4l2_err(ctx->dev, "Invalid pixel format %p", pix_fmt);
>> +		return PTR_ERR(pix_fmt);
>> +	}
>> +
>> +	if (!pix_fmt->fmt) {
>> +		al_v4l2_err(ctx->dev, "Unknown format for %d", f->type);
>> +		return -EINVAL;
>> +	}
>> +
>> +	pix = &f->fmt.pix;
>> +	pix->width = pix_fmt->width;
>> +	pix->height = pix_fmt->height;
>> +	pix->bytesperline = pix_fmt->bytesperline;
>> +	pix->sizeimage = pix_fmt->sizeimage;
>> +	pix->pixelformat = pix_fmt->fmt->pixelformat;
>> +	pix->field = V4L2_FIELD_NONE;
>> +
>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
>> +		pix->bytesperline = 0;
>> +		pix->pixelformat = ctx->codec;
>> +	}
>> +
>> +	pix->ycbcr_enc = pix_fmt->ycbcr_enc;
>> +	pix->quantization = pix_fmt->quantization;
>> +	pix->xfer_func = pix_fmt->xfer_func;
>> +	pix->colorspace = pix_fmt->colorspace;
>> +
>> +	al_v4l2_dbg(
>> +		ctx->dev, 3,
>> +		"%s : width (%d) , height (%d), bytesperline (%d) , sizeimage (%d)",
>> +		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
>> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
>> +{
>> +	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
>> +	struct v4l2_pix_format *pix;
>> +	struct al_frame *frame;
>> +	struct vb2_queue *vq;
>> +	int ret;
>> +
>> +	ret = al_dec_try_fmt(file, fh, f);
>> +	if (ret) {
>> +		al_v4l2_err(ctx->dev, "Cannot set format (%d)", f->type);
>> +		return ret;
>> +	}
>> +
>> +	frame = (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? &ctx->src : &ctx->dst;
>> +
>> +	pix = &f->fmt.pix;
>> +	frame->fmt = al_find_fmt(pix->pixelformat);
>> +	if (!frame->fmt) {
>> +		al_v4l2_err(ctx->dev, "Unknown format for %d",
>> +			    pix->pixelformat);
>> +		return -EINVAL;
>> +	}
>> +
>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
>> +	if (vb2_is_streaming(vq)) {
>> +		al_v4l2_err(ctx->dev, "queue %d busy", f->type);
>> +		return -EBUSY;
>> +	}
>> +
>> +	frame->width = pix->width;
>> +	frame->height = pix->height;
>> +	frame->bytesperline = pix->bytesperline;
>> +	frame->sizeimage = pix->sizeimage;
>> +	frame->field = pix->field;
>> +
>> +	frame->ycbcr_enc = pix->ycbcr_enc;
>> +	frame->quantization = pix->quantization;
>> +	frame->xfer_func = pix->xfer_func;
>> +	frame->colorspace = pix->colorspace;
>> +
>> +	/* Set decoder pixelformat */
>> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
>> +		ctx->codec = pix->pixelformat;
>> +
>> +	al_v4l2_dbg(
>> +		ctx->dev, 3,
>> +		" %s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d)",
>> +		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
>> +		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
>> +
>> +	return 0;
>> +}
>> +
>> +static void al_queue_eos_event(struct al_dec_ctx *ctx)
>> +{
>> +	const struct v4l2_event eos_event = {
>> +		.id = 0,
>> +		.type = V4L2_EVENT_EOS,
>> +	};
>> +
>> +	v4l2_event_queue_fh(&ctx->fh, &eos_event);
>> +}
>> +
>> +static void al_queue_res_chg_event(struct al_dec_ctx *ctx)
>> +{
>> +	static const struct v4l2_event ev_src_ch = {
>> +		.id = 0,
>> +		.type = V4L2_EVENT_SOURCE_CHANGE,
>> +		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
>> +	};
>> +
>> +	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
>> +}
>> +
>> +static int al_dec_decoder_cmd(struct file *file, void *fh,
>> +			      struct v4l2_decoder_cmd *dcmd)
>> +{
>> +	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
>> +	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	struct vb2_queue *dst_vq;
>> +	int ret;
>> +
>> +	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dcmd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Get the vb2 queue for the Capture */
>> +	dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
>> +
>> +	switch (dcmd->cmd) {
>> +	case V4L2_DEC_CMD_START:
>> +		vb2_clear_last_buffer_dequeued(dst_vq);
>> +		break;
>> +	case V4L2_DEC_CMD_STOP:
>> +		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
>> +		if (vbuf) {
>> +			al_v4l2_dbg(ctx->dev, 1, "marking last pending buffer");
>> +
>> +			vbuf->flags |= V4L2_BUF_FLAG_LAST;
>> +			if (v4l2_m2m_num_src_bufs_ready(m2m_ctx) == 0) {
>> +				al_v4l2_dbg(ctx->dev, 1,
>> +					    "all remaining buffers queued");
>> +				v4l2_m2m_try_schedule(m2m_ctx);
>> +			}
>> +		}
>> +		dec_fw_flush_req(ctx);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_enum_framesizes(struct file *file, void *fh,
>> +				  struct v4l2_frmsizeenum *fsize)
>> +{
>> +	if (!al_find_fmt(fsize->pixel_format))
>> +		return -EINVAL;
>> +
>> +	/* FIXME : check step size */
>> +	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>> +	fsize->stepwise.min_width = DECODER_WIDTH_MIN;
>> +	fsize->stepwise.max_width = DECODER_WIDTH_MAX;
>> +	fsize->stepwise.step_width = 8;
>> +	fsize->stepwise.min_height = DECODER_HEIGHT_MIN;
>> +	fsize->stepwise.max_height = DECODER_HEIGHT_MAX;
>> +	fsize->stepwise.step_height = 8;
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_subscribe_event(struct v4l2_fh *fh,
>> +				  const struct v4l2_event_subscription *sub)
>> +{
>> +	switch (sub->type) {
>> +	case V4L2_EVENT_EOS:
>> +		return v4l2_event_subscribe(fh, sub, 0, NULL);
>> +	case V4L2_EVENT_SOURCE_CHANGE:
>> +		return v4l2_src_change_event_subscribe(fh, sub);
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int al_dec_log_status(struct file *file, void *fh)
>> +{
>> +	struct al_codec_dev *al_dev = video_drvdata(file);
>> +
>> +	v4l2_device_call_all(&al_dev->v4l2_dev, 0, core, log_status);
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_ioctl_ops al_dec_ioctl_ops = {
>> +	.vidioc_querycap = al_dec_querycap,
>> +	.vidioc_enum_fmt_vid_cap = al_dec_enum_fmt,
>> +	.vidioc_enum_fmt_vid_out = al_dec_enum_fmt,
>> +	.vidioc_g_fmt_vid_cap = al_dec_g_fmt,
>> +	.vidioc_g_fmt_vid_out = al_dec_g_fmt,
>> +	.vidioc_try_fmt_vid_cap = al_dec_try_fmt,
>> +	.vidioc_try_fmt_vid_out = al_dec_try_fmt,
>> +	.vidioc_s_fmt_vid_cap = al_dec_s_fmt,
>> +	.vidioc_s_fmt_vid_out = al_dec_s_fmt,
>> +
>> +	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
>> +	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
>> +
>> +	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
>> +	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
>> +	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
>> +	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
>> +	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
>> +
>> +	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
>> +	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
>> +	.vidioc_log_status = al_dec_log_status,
>> +
>> +	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
>> +	.vidioc_decoder_cmd = al_dec_decoder_cmd,
>> +	.vidioc_enum_framesizes = al_dec_enum_framesizes,
>> +
>> +	.vidioc_subscribe_event = al_dec_subscribe_event,
>> +	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>> +};
>> +
>> +static void al_device_run(void *priv)
>> +{
>> +	struct al_dec_ctx *ctx = priv;
>> +	struct vb2_v4l2_buffer *dst_buf;
>> +	struct v4l2_m2m_buffer *m2m_buf;
>> +
>> +	if (unlikely(!ctx))
>> +		return;
>> +
>> +	if (ctx->aborting) {
>> +		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
>> +		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
>> +		return;
>> +	}
>> +
>> +	if (!v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx))
>> +		goto job_finish;
>> +
>> +	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>> +	if (!dst_buf)
>> +		goto job_finish;
>> +
>> +	if (!al_common_mcu_is_alive(ctx->dev) ||
>> +	    al_dec_fw_push_frame_buf(ctx, dst_buf)) {
>> +		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
>> +		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
>> +		goto job_finish;
>> +	}
>> +
>> +	mutex_lock(&ctx->buf_q_mlock);
>> +	m2m_buf = container_of(dst_buf, struct v4l2_m2m_buffer, vb);
>> +	list_add_tail(&m2m_buf->list, &ctx->frame_q_list);
>> +	mutex_unlock(&ctx->buf_q_mlock);
>> +
>> +job_finish:
>> +	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
>> +}
>> +
>> +static const struct v4l2_m2m_ops al_dec_m2m_ops = {
>> +	.device_run = al_device_run,
>> +};
>> +
>> +static int al_dec_open(struct file *file)
>> +{
>> +	struct video_device *vdev = video_devdata(file);
>> +	struct al_codec_dev *dev = video_get_drvdata(vdev);
>> +	struct al_dec_ctx *ctx = NULL;
>> +	int ret;
>> +
>> +	if (mutex_lock_interruptible(&dev->ctx_mlock))
>> +		return -ERESTARTSYS;
>> +
>> +	/* Aloocate memory for the dec ctx */
>> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx) {
>> +		ret = -ENOMEM;
>> +		goto unlock;
>> +	}
>> +
>> +	ctx->dev = dev;
>> +	/* Init ctx mutex */
>> +	mutex_init(&ctx->buf_q_mlock);
>> +	/* Init ctx LISTHEADs*/
>> +	INIT_LIST_HEAD(&ctx->cmd_q_list);
>> +	INIT_LIST_HEAD(&ctx->frame_q_list);
>> +	INIT_LIST_HEAD(&ctx->stream_q_list);
>> +
>> +	/* Init the irq queue */
>> +	init_completion(&ctx->res_done);
>> +
>> +	v4l2_fh_init(&ctx->fh, vdev);
>> +
>> +	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 0);
>> +	if (ctx->ctrl_handler.error) {
>> +		ret = ctx->ctrl_handler.error;
>> +		al_v4l2_err(dev, "Failed to create control %d", ret);
>> +		goto handler_error;
>> +	}
>> +
>> +	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
>> +	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
>> +
>> +	file->private_data = &ctx->fh;
>> +	v4l2_fh_add(&ctx->fh);
>> +
>> +	/* Set default formats */
>> +	ctx->src = ctx->dst = al_default_fmt;
>> +
>> +	ctx->codec = V4L2_PIX_FMT_H264;
>> +	ctx->stopped = false;
>> +	ctx->aborting = false;
>> +
>> +	/* Setup the ctx for m2m mode */
>> +	ctx->fh.m2m_ctx =
>> +		v4l2_m2m_ctx_init(dev->m2m_dev, ctx, al_dec_queue_init);
>> +	if (IS_ERR(ctx->fh.m2m_ctx)) {
>> +		ret = PTR_ERR(ctx->fh.m2m_ctx);
>> +		al_v4l2_err(dev, "Failed to initialize m2m mode %d", ret);
>> +		goto error_ctrls;
>> +	}
>> +
>> +	v4l2_m2m_set_src_buffered(ctx->fh.m2m_ctx, true);
>> +	/* v4l2_m2m_set_dst_buffered(ctx->fh.m2m_ctx, true); */
>> +
>> +	/* Add ctx to the LIST */
>> +	kref_init(&ctx->refcount);
>> +	list_add(&ctx->list, &dev->ctx_q_list);
>> +
>> +	mutex_unlock(&dev->ctx_mlock);
>> +
>> +	return 0;
>> +
>> +error_ctrls:
>> +	v4l2_fh_del(&ctx->fh);
>> +handler_error:
>> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +	v4l2_fh_exit(&ctx->fh);
>> +	kfree(ctx);
>> +
>> +unlock:
>> +	mutex_unlock(&dev->ctx_mlock);
>> +	return ret;
>> +}
>> +
>> +static int al_dec_release(struct file *file)
>> +{
>> +	struct al_dec_ctx *ctx =
>> +		fh_to_ctx(file->private_data, struct al_dec_ctx);
>> +	struct al_codec_dev *dev = ctx->dev;
>> +
>> +	mutex_lock(&dev->ctx_mlock);
>> +
>> +	/* It is important to do this before removing ctx from dev list.
>> +	 * Those commands will trigger some traffic towards fw and so we
>> +	 * need completion to avoid deadlock if cmds can't find ctx.
>> +	 */
>> +	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>> +	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>> +	v4l2_fh_del(&ctx->fh);
>> +	v4l2_fh_exit(&ctx->fh);
>> +
>> +	list_del(&ctx->list);
>> +	al_ctx_put(ctx);
>> +	mutex_unlock(&dev->ctx_mlock);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline bool al_mark_last_dst_buf(struct al_dec_ctx *ctx)
>> +{
>> +	struct vb2_v4l2_buffer *buf;
>> +	struct vb2_buffer *dst_vb;
>> +	struct vb2_queue *dst_vq;
>> +	unsigned long flags;
>> +
>> +	al_v4l2_dbg(ctx->dev, 1, "marking last capture buffer");
>> +
>> +	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
>> +	spin_lock_irqsave(&dst_vq->done_lock, flags);
>> +	if (list_empty(&dst_vq->done_list)) {
>> +		spin_unlock_irqrestore(&dst_vq->done_lock, flags);
>> +		return false;
>> +	}
>> +
>> +	dst_vb = list_last_entry(&dst_vq->done_list, struct vb2_buffer,
>> +				 done_entry);
>> +	buf = to_vb2_v4l2_buffer(dst_vb);
>> +	buf->flags |= V4L2_BUF_FLAG_LAST;
>> +
>> +	spin_unlock_irqrestore(&dst_vq->done_lock, flags);
>> +	return true;
>> +}
>> +
>> +static const struct v4l2_file_operations al_dec_file_ops = {
>> +	.owner = THIS_MODULE,
>> +	.open = al_dec_open,
>> +	.release = al_dec_release,
>> +	.poll = v4l2_m2m_fop_poll,
>> +	.unlocked_ioctl = video_ioctl2,
>> +	.mmap = v4l2_m2m_fop_mmap,
>> +};
>> +
>> +static void handle_error_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
>> +{
>> +	struct al_codec_dev *dev = ctx->dev;
>> +	struct msg_itf_evt_error evt;
>> +	struct v4l2_m2m_buffer *vbuf;
>> +
>> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
>> +		al_v4l2_err(dev, "Unable to get resolution found event");
>> +		return;
>> +	}
>> +
>> +	al_v4l2_err(dev, "Decoding error  %d", evt.errno);
>> +
>> +	mutex_lock(&ctx->buf_q_mlock);
>> +	if (!list_empty(&ctx->stream_q_list)) {
>> +		vbuf = list_last_entry(&ctx->frame_q_list,
>> +				       struct v4l2_m2m_buffer, list);
>> +		list_del(&vbuf->list);
>> +		v4l2_m2m_buf_done(&vbuf->vb, VB2_BUF_STATE_ERROR);
>> +	}
>> +	mutex_unlock(&ctx->buf_q_mlock);
>> +}
>> +
>> +static void handle_resolution_found_evt(struct al_dec_ctx *ctx,
>> +					struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_evt_resolution_found evt;
>> +	struct al_codec_dev *dev = ctx->dev;
>> +	struct al_frame *frame;
>> +	struct vb2_queue *dst_vq;
>> +
>> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
>> +		al_v4l2_err(dev, "Unable to get resolution found event");
>> +		return;
>> +	}
>> +
>> +	frame = &ctx->dst;
>> +
>> +	if (frame->width != evt.width || frame->height != evt.height ||
>> +	    frame->nbuffers < evt.buffer_nb) {
>> +		/* Update frame properties */
>> +		frame->width = evt.width;
>> +		frame->height = evt.height;
>> +		frame->bytesperline = evt.bytesperline;
>> +		frame->sizeimage = evt.sizeimage;
>> +		frame->nbuffers = evt.buffer_nb;
>> +		frame->fmt = al_find_fmt(evt.pixelformat);
>> +
>> +		/* This has to be changed */
>> +		if (!frame->fmt)
>> +			return;
>> +
>> +		al_queue_res_chg_event(ctx);
>> +	}
>> +
>> +	dst_vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
>> +	if (!vb2_is_streaming(dst_vq))
>> +		complete(&ctx->res_done);
>> +
>> +	al_v4l2_dbg(
>> +		dev, 3,
>> +		"width(%d) , height(%d), bytesperline(%d), sizeimage(%d), n_bufs(%d)",
>> +		frame->width, frame->height, frame->bytesperline,
>> +		frame->sizeimage, frame->nbuffers);
>> +}
>> +
>> +static void handle_bitstream_buffer_release_evt(struct al_dec_ctx *ctx,
>> +						struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_evt_bitstream_buffer_release evt;
>> +	struct al_codec_dev *dev = ctx->dev;
>> +	struct vb2_v4l2_buffer *vbuf;
>> +
>> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
>> +		al_v4l2_err(dev, "Unable to get buffer release event");
>> +		return;
>> +	}
>> +
>> +	if (ctx->stopped)
>> +		return;
>> +
>> +	vbuf = al_dec_dequeue_src_buf(ctx, evt.bufferHandle);
>> +	if (!vbuf) {
>> +		al_v4l2_err(dev, "Unable to find bitsream buffer 0x%llx",
>> +			    evt.bufferHandle);
>> +		return;
>> +	}
>> +
>> +	al_v4l2_dbg(dev, 3, "Release bitstream buffer %p", vbuf);
>> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>> +}
>> +
>> +static void handle_eos_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_evt_frame_buffer_decode evt;
>> +	struct al_codec_dev *dev = ctx->dev;
>> +
>> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
>> +		al_v4l2_err(dev, "Unable to get frame buffer event");
>> +		return;
>> +	}
>> +
>> +	/* set LAST_FLAG to the last done CAPTURE buffer*/
>> +	al_mark_last_dst_buf(ctx);
>> +	/* Set eos event */
>> +	al_queue_eos_event(ctx);
>> +}
>> +
>> +static void handle_frame_buffer_decode_evt(struct al_dec_ctx *ctx,
>> +					   struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_evt_frame_buffer_decode evt;
>> +	struct al_codec_dev *dev = ctx->dev;
>> +	struct vb2_v4l2_buffer *vbuf;
>> +	struct al_buffer_meta *meta;
>> +
>> +	if (al_common_get_data(dev, (char *)&evt, hdr->payload_len)) {
>> +		al_v4l2_err(dev, "Unable to get frame buffer event");
>> +		return;
>> +	}
>> +
>> +	vbuf = al_dec_dequeue_dst_buf(ctx, evt.bufferHandle);
>> +	if (!vbuf) {
>> +		al_v4l2_err(dev, "Unable to find frame buffer 0x%llx",
>> +			    evt.bufferHandle);
>> +		return;
>> +	}
>> +
>> +	meta = &evt.meta;
>> +	al_v4l2_dbg(dev, 3, "Decoded frame done for buffer %p (%d) (%lld)",
>> +		    vbuf, meta->last, evt.size);
>> +
>> +	vb2_set_plane_payload(&vbuf->vb2_buf, 0, evt.size);
>> +	vbuf->field = V4L2_FIELD_NONE;
>> +	vbuf->sequence = ctx->csequence++;
>> +	vbuf->timecode = meta->timecode;
>> +	vbuf->vb2_buf.timestamp = meta->timestamp;
>> +
>> +	if (meta->last || (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
>> +		vbuf->flags |= V4L2_BUF_FLAG_LAST;
>> +		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
>> +	}
>> +
>> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>> +}
>> +
>> +static int al_handle_cmd_reply(struct al_codec_dev *dev,
>> +			       struct msg_itf_header *hdr)
>> +{
>> +	struct al_dec_ctx *ctx;
>> +	struct al_codec_cmd *cmd = NULL;
>> +	int ret = 0;
>> +
>> +	ctx = al_ctx_get(dev, hdr->drv_ctx_hdl);
>> +	if (IS_ERR_OR_NULL(ctx)) {
>> +		al_v4l2_err(dev, "Unable to find ctx %p for reply %d",
>> +			    al_phys_to_virt(hdr->drv_ctx_hdl), hdr->type);
>> +		return -EINVAL;
>> +	}
>> +
>> +	cmd = al_codec_cmd_get(&ctx->cmd_q_list, hdr->drv_cmd_hdl);
>> +	if (!cmd) {
>> +		al_v4l2_err(dev, "Unable to find command %p for reply %d",
>> +			    al_phys_to_virt(hdr->drv_cmd_hdl), hdr->type);
>> +		ret = -EINVAL;
>> +		goto ctx_put;
>> +	}
>> +
>> +	if (cmd->reply_size != hdr->payload_len) {
>> +		al_v4l2_err(dev, "mismatch size %d %d", cmd->reply_size,
>> +			    hdr->payload_len);
>> +		ret = -EINVAL;
>> +		goto cmd_put;
>> +	}
>> +
>> +	ret = al_common_get_data(dev, cmd->reply, hdr->payload_len);
>> +	if (ret)
>> +		al_v4l2_err(dev, "Unable to copy reply");
>> +
>> +	complete(&cmd->done);
>> +	ret = 0;
>> +
>> +cmd_put:
>> +	al_codec_cmd_put(cmd);
>> +ctx_put:
>> +	al_ctx_put(ctx);
>> +
>> +	return ret;
>> +}
>> +
>> +static int al_handle_cmd_evt(struct al_codec_dev *dev,
>> +			     struct msg_itf_header *hdr, int type)
>> +{
>> +	static u32 evt_sizes[] = {
>> +		sizeof(struct msg_itf_evt_error),
>> +		sizeof(struct msg_itf_evt_resolution_found),
>> +		sizeof(struct msg_itf_evt_bitstream_buffer_release),
>> +		sizeof(struct msg_itf_evt_frame_buffer_decode),
>> +		sizeof(struct msg_itf_evt_eos),
>> +	};
>> +
>> +	u32 evt_size;
>> +	struct al_dec_ctx *ctx = NULL;
>> +	int ret = 0;
>> +
>> +	if (type < MSG_ITF_TYPE_NEXT_EVT || type > MSG_ITF_TYPE_END_EVT) {
>> +		al_v4l2_err(dev, "Unsupporting event type %d", type);
>> +		return -EINVAL;
>> +	}
>> +
>> +	ctx = al_ctx_get(dev, hdr->drv_ctx_hdl);
>> +	if (!ctx) {
>> +		al_v4l2_err(dev, "Unable to find ctx %p for evt %d",
>> +			    al_phys_to_virt(hdr->drv_ctx_hdl), type);
>> +		return -EINVAL;
>> +	}
>> +
>> +	// Check the received event size and the expected one
>> +	evt_size = evt_sizes[type - MSG_ITF_TYPE_NEXT_EVT];
>> +	if (hdr->payload_len != evt_size) {
>> +		al_v4l2_err(
>> +			dev,
>> +			"Invalid event size for client (%p) for evt (%d) : Got (%d), expected (%d)",
>> +			al_phys_to_virt(hdr->drv_ctx_hdl), type,
>> +			hdr->payload_len, evt_size);
>> +		ret = -EINVAL;
>> +		goto clean_ctx;
>> +	}
>> +
>> +	al_v4l2_dbg(dev, 3, "Event received from MCU (%d)", type);
>> +
>> +	switch (type) {
>> +	case MSG_ITF_TYPE_EVT_ERROR:
>> +		handle_error_evt(ctx, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_EVT_RESOLUTION_FOUND:
>> +		handle_resolution_found_evt(ctx, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE:
>> +		handle_bitstream_buffer_release_evt(ctx, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE:
>> +		handle_frame_buffer_decode_evt(ctx, hdr);
>> +		break;
>> +	case MSG_ITF_TYPE_EVT_EOS:
>> +		handle_eos_evt(ctx, hdr);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +clean_ctx:
>> +	al_ctx_put(ctx);
>> +	return ret;
>> +}
>> +
>> +static void al_dec_process_msg(void *cb_arg, struct msg_itf_header *hdr)
>> +{
>> +	struct al_codec_dev *dev = cb_arg;
>> +	int ret;
>> +
>> +	if (is_type_reply(hdr->type))
>> +		ret = al_handle_cmd_reply(dev, hdr);
>> +	else if (is_type_event(hdr->type))
>> +		ret = al_handle_cmd_evt(dev, hdr, hdr->type);
>> +	else {
>> +		al_v4l2_err(dev, "Unsupported message type %d", hdr->type);
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	if (ret) {
>> +		al_v4l2_err(dev, "Skip received data");
>> +		al_common_skip_data(dev, hdr->payload_len);
>> +	}
>> +}
>> +
>> +static const struct video_device al_videodev = {
>> +	.name = "allegro-decoder",
>> +	.fops = &al_dec_file_ops,
>> +	.ioctl_ops = &al_dec_ioctl_ops,
>> +	.minor = -1,
>> +	.release = video_device_release_empty,
>> +	.vfl_dir = VFL_DIR_M2M,
>> +	.device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
>> +};
>> +
>> +static void al_dec_register_v4l2(void *cb_arg)
>> +{
>> +	struct al_codec_dev *dev = cb_arg;
>> +	struct video_device *video_dev = NULL;
>> +	int ret;
>> +
>> +	ret = v4l2_device_register(&dev->pdev->dev, &dev->v4l2_dev);
>> +	if (ret) {
>> +		al_v4l2_err(dev, "Unable to register v4l2 device %d", ret);
>> +		return;
>> +	}
>> +
>> +	dev->m2m_dev = v4l2_m2m_init(&al_dec_m2m_ops);
>> +	if (IS_ERR(dev->m2m_dev)) {
>> +		ret = PTR_ERR(dev->m2m_dev);
>> +		al_v4l2_err(dev, "failed to init mem2mem device %d", ret);
>> +		goto v4l2_m2m_init_error;
>> +	}
>> +
>> +	video_dev = &dev->video_dev;
>> +	*video_dev = al_videodev;
>> +
>> +	video_dev->lock = &dev->lock;
>> +	video_dev->v4l2_dev = &dev->v4l2_dev;
>> +
>> +	video_set_drvdata(video_dev, dev);
>> +	ret = video_register_device(video_dev, VFL_TYPE_VIDEO, -1);
>> +	if (ret) {
>> +		al_v4l2_err(dev, "failed to register video device %d", ret);
>> +		goto video_register_device_error;
>> +	}
>> +
>> +	v4l2_info(&dev->v4l2_dev, "registered as /dev/video%d\n",
>> +		  dev->video_dev.num);
>> +
>> +	dev->is_video_init_done = 1;
>> +
>> +	return;
>> +
>> +video_register_device_error:
>> +	v4l2_m2m_release(dev->m2m_dev);
>> +v4l2_m2m_init_error:
>> +	v4l2_device_unregister(&dev->v4l2_dev);
>> +}
>> +
>> +static int al_dec_probe(struct platform_device *pdev)
>> +{
>> +	struct al_codec_dev *al_dev;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	const struct al_match_data *match_data;
>> +	const char *firmware;
>> +	int ret;
>> +
>> +	dev_info(dev, "Probing ...\n");
>> +
>> +	match_data = device_get_match_data(dev);
>> +	if (!match_data) {
>> +		dev_err(dev, "Missing device match data\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	al_dev = devm_kzalloc(dev, sizeof(*al_dev), GFP_KERNEL);
>> +	if (!al_dev)
>> +		return -ENOMEM;
>> +
>> +	al_dev->pdev = pdev;
>> +	al_dev->is_video_init_done = 0;
>> +	mutex_init(&al_dev->lock);
>> +	mutex_init(&al_dev->ctx_mlock);
>> +	INIT_LIST_HEAD(&al_dev->ctx_q_list);
>> +
>> +	al_dev->cb_arg = al_dev;
>> +	al_dev->process_msg_cb = al_dec_process_msg;
>> +	al_dev->fw_ready_cb = al_dec_register_v4l2;
>> +
>> +	/* firmware-name is optional in DT */
>> +	of_property_read_string(np, "firmware-name", &firmware);
>> +	if (!firmware)
>> +		firmware = match_data->fw_name;
>> +
>> +	ret = al_common_probe(al_dev, firmware);
>> +	if (ret)
>> +		return ret;
>> +
>> +	platform_set_drvdata(pdev, al_dev);
>> +	dev_info(dev, "Probing done successfully %p\n", al_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void al_dec_remove(struct platform_device *pdev)
>> +{
>> +	struct al_codec_dev *dev = platform_get_drvdata(pdev);
>> +
>> +	dev_info(&pdev->dev, "remove %p\n", dev);
>> +
>> +	if (dev->is_video_init_done) {
>> +		video_unregister_device(&dev->video_dev);
>> +		if (dev->m2m_dev)
>> +			v4l2_m2m_release(dev->m2m_dev);
>> +		v4l2_device_unregister(&dev->v4l2_dev);
>> +	}
>> +
>> +	al_common_remove(dev);
>> +}
>> +
>> +static const struct al_match_data ald300_data = {
>> +	.fw_name = "al300-vdec.fw",
>> +};
>> +
>> +static const struct of_device_id v4l2_al_dec_dt_match[] = {
>> +	{ .compatible = "allegro,al300-vdec", .data = &ald300_data },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, v4l2_al_dec_dt_match);
>> +
>> +static struct platform_driver al300_vdec_drv = {
>> +	.probe = al_dec_probe,
>> +	.remove = al_dec_remove,
>> +	.driver = {
>> +		.name = "al300_vdec",
>> +		.of_match_table = of_match_ptr(v4l2_al_dec_dt_match),
>> +	},
>> +};
>> +
>> +module_platform_driver(al300_vdec_drv);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:al300-vdec");
>> +MODULE_AUTHOR("Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>");
>> +MODULE_DESCRIPTION("Allegro DVT V4l2 decoder driver gen 3");
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h b/drivers/media/platform/allegro-
>> dvt/al300/al_vdec_drv.h
>> new file mode 100644
>> index 000000000000..8d8f2b9e734a
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
>> @@ -0,0 +1,94 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#ifndef __AL_VDEC_DRV__
>> +#define __AL_VDEC_DRV__
>> +
>> +#include "al_codec_util.h"
>> +
>> +enum {
>> +	MSG_ITF_TYPE_EVT_RESOLUTION_FOUND = MSG_ITF_TYPE_NEXT_EVT + 1,
>> +	MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE,
>> +	MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE,
>> +	MSG_ITF_TYPE_EVT_EOS,
>> +	/* Mark the end of the events list.*/
>> +	MSG_ITF_TYPE_END_EVT,
>> +};
>> +
>> +struct msg_itf_create_decoder_req {
>> +	unsigned int codec;
>> +} __packed;
>> +DECLARE_FULL_REQ(msg_itf_create_decoder_req);
>> +
>> +struct msg_itf_evt_resolution_found {
>> +	u16 buffer_nb;
>> +	u16 width;
>> +	u16 height;
>> +	u32 pixelformat;
>> +	u32 sizeimage;
>> +	u32 bytesperline;
>> +} __packed;
>> +DECLARE_FULL_EVENT(msg_itf_evt_resolution_found);
>> +
>> +struct msg_itf_evt_bitstream_buffer_release {
>> +	u64 bufferHandle;
>> +} __packed;
>> +DECLARE_FULL_EVENT(msg_itf_evt_bitstream_buffer_release);
>> +
>> +struct msg_itf_evt_frame_buffer_decode {
>> +	u64 bufferHandle;
>> +	u64 size;
>> +	struct al_buffer_meta meta;
>> +} __packed;
>> +DECLARE_FULL_EVENT(msg_itf_evt_frame_buffer_decode);
>> +
>> +struct msg_itf_evt_eos {
>> +	u32 unused;
>> +} __packed;
>> +DECLARE_FULL_EVENT(msg_itf_evt_eos);
>> +
>> +struct al_fmt {
>> +	u32 pixelformat;
>> +	u8 bpp;
>> +};
>> +
>> +struct al_frame {
>> +	u32 width;
>> +	u32 height;
>> +	u32 bytesperline;
>> +	u32 sizeimage;
>> +	u32 nbuffers;
>> +	const struct al_fmt *fmt;
>> +	enum v4l2_field field;
>> +	enum v4l2_colorspace colorspace;
>> +	enum v4l2_ycbcr_encoding ycbcr_enc;
>> +	enum v4l2_quantization quantization;
>> +	enum v4l2_xfer_func xfer_func;
>> +};
>> +
>> +struct al_dec_ctx {
>> +	struct al_codec_dev *dev;
>> +	struct v4l2_fh fh;
>> +	struct v4l2_ctrl_handler ctrl_handler;
>> +	struct kref refcount;
>> +	struct list_head list;
>> +	/* CAP and OUT frames */
>> +	struct al_frame src;
>> +	struct al_frame dst;
>> +	struct completion res_done; /* Resolution found event */
>> +	u32 codec;
>> +	u64 hDec;
>> +	struct list_head cmd_q_list; /* Store active commands */
>> +	struct mutex buf_q_mlock;
>> +	struct list_head frame_q_list;
>> +	struct list_head stream_q_list;
>> +	u32 csequence;
>> +	u32 osequence;
>> +	bool stopped;
>> +	bool aborting;
>> +};
>> +
>> +#endif /*__AL_VDEC_DRV__*/

