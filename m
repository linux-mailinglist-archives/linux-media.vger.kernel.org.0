Return-Path: <linux-media+bounces-48126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C0CC9E2B4
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 09:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47F133A9149
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 08:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE55D29B239;
	Wed,  3 Dec 2025 08:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IxSAR9kL"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012029.outbound.protection.outlook.com [52.101.48.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4548221546;
	Wed,  3 Dec 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749971; cv=fail; b=PqWi9RxbvCnM9a64qyfhYh/OgGs1ibMaH2sIg2UnBaOBZMX/FoUiErc3Xa7QhUjJuewU7Sg7Y6+oxfe/tdZgyS/wEiA1/FXo6NOeUGrOe47cz2ANouFts7exgYQh+XzFk66H8X0jdUT+ObjYbKa8BseGyhbQ+On5/3i7w8LsBds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749971; c=relaxed/simple;
	bh=Qo+2QOmEFNpHPZhv/ahBQKqO8rOQmnLpXEv0vTYo9JM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XjobA8l/t4mngLolX8zo93/CHn7gp3VcH41ujuy004tWlZyhdR2D6RKbP8H5v4K/pait/wGGqgy6IbzqHq8jR2ANWNQhnnUyOXXyvQcXgJ87diEHZEI0zs04V8aycJYyo6XVQwYv1IrOg/LoJoBNoDPU5wcqkYhUJ1BYsC/KbFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IxSAR9kL; arc=fail smtp.client-ip=52.101.48.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5aeQsMlDzXXXwCDxgiQPF+HVJI+6PJSWoS7VJduAMM/ZroUPIaJAFcJOeE/oUlExSpYzYUD3Y3jA+mQJiqhGeSESULQbOOFQiHKU+RxoMvVTiZ/6tUE/1n0RfU8YF/kV51knJHz4BH2y6juBqybpuK/Aq0gDNoLiCo7YKnLhpnAuWimvteXAY+UQxEwiFe+8ESN+NPnLaT3orRqqRbd+OM/AA0f58FeotL2R67+ncjsF4bpf66vFUIDJixRdNRvEgpLMQfB/P+Vp6jKCIhjZI8AWTIQPW87e6CMU+em/tOJ8uZQP3vu3IPlHNjMAGluHkpsPWIn/ZuG+9W5DPiv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT5ge8x0hBfBceXqXLiTPE6uB2XjacV1bq0rbRaK8ZE=;
 b=LM9AalGl9xafh/H3vBDag5razPWIqE0xE5EI6eg/Oe45ZpsQbN35tl7oVWVcD2Y2zEz4fSUkkDzNIH0YqNpSvXl04cy+tBg4WcHWTko1QoZGTYnpYgndMiISR4bxbiozjStBpIS++V30nOhnF9xrbphZQJvS4Waflw8WjmM30Y3bD+c4NiinGmcEpwY+5Xaac8GJ5BGnOzdnigWjEhtQa8DJ/l9pd7bZefjyg94fZOkg4dTnvphj4YfJ89tWwfGodmZiYi+0rGpR2jyp/p1XQC9TOf4wQVcnoOJGcX7XP520wgIxcfjof1SsR0QeZapor5HnjaZy1k8xpu40znEU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT5ge8x0hBfBceXqXLiTPE6uB2XjacV1bq0rbRaK8ZE=;
 b=IxSAR9kLH+UAf+RPs6xy/XKuxhp1dxa7DvpFKTlZ59d+J8cEVpH2/Ra2opX0uCsg3/TqstYybK0xvyshtM4IZn3n1KIQu5hONtioNQoS5r1h2IuzQml5meI4MAbs9ab+S9Ni2J+I1o3lcXOog+zIz2464ffPETrkiMQehDazr5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 08:19:26 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 08:19:26 +0000
Message-ID: <ec22c183-e224-4c68-a390-2e4994ac10f0@amd.com>
Date: Wed, 3 Dec 2025 16:19:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20251128091929.165272-1-Bin.Du@amd.com>
 <aSpkA2pGzCwMcCdI@sultan-box> <f5e80d6a-da3e-4596-8779-00094e5794a7@amd.com>
 <aS6TrNMyPXq9i9kY@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aS6TrNMyPXq9i9kY@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|DS0PR12MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: ea208b0e-83f5-4f76-5bd2-08de3244ac11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlV4ZDJTVS82VTVES2JadHdDcVpXSWZ4WEVmeDB4Tkk2Y3FDajFvU3JUbzhp?=
 =?utf-8?B?Ykl3T2VjdCtZSXIyWkE5emlPSEZJQUhSdzlQQXR6UGQyK0F6MmVlY2RLbnJo?=
 =?utf-8?B?N2pHOWxiVTNsc0k0c056WU5XZ3JYNXRuQWNjMEVYZHFob2QvNm9NUkV0dWRM?=
 =?utf-8?B?WVRlbW1YTHlEVXJKc0xWN2VPNTVvOEVWWWFqT09ybmU2RE96QzZwb3FYSXY5?=
 =?utf-8?B?SEZ0a1RxSy85YVB4Q1FURStnN1kxZ1ovWFExd3JGWU9uYk5Jd1lMN21zM0Fq?=
 =?utf-8?B?bWVQTWlscGpGRW5wb1ZGOGdnYlFPeWxWN0hMZXFwSFZ6b1Ixd2p2WVMxZzk0?=
 =?utf-8?B?anIvdmk1bngwMlJxR080ZldzMGJXdUcxVStZNEpXa0F3V1ZqY0JDTnJ6TXZK?=
 =?utf-8?B?QmtEQzBkRlRVTlFUejVJTFdUMFdhOW1IOGxwaTJWckI5d1BpWE5LWUpQREwx?=
 =?utf-8?B?YmZlNHI2NDJjS1FmUC9JcG9RWXNKN2dEeEhFTnp3SWVOL2hQdytiQWxIZERy?=
 =?utf-8?B?N0duU29VcEZqRFBqVTdWYXJETGFrMXJUV2VJWUgvNE9BeDU4ZG5EUnI3dW1x?=
 =?utf-8?B?TDZNVWtlbVZHN0Z5S3cyaTduWTlQdzNlSnpBaS91NVpId0dWN1U3RnIwb1dy?=
 =?utf-8?B?bG1nR05FTXZ3SVFTeGp2ZnY0SStudzcrN0VZMkh0cS9BNDErWk5HTEV5RFQ1?=
 =?utf-8?B?YWUyRWc5RHFtanB2blFuT1JSZEY4YXhaQ3ZiQkl5bWJUZ1ZRRzRCb2RwNGls?=
 =?utf-8?B?Yy8rYWgrVEg4aEU4S0I5SVpHWkJITzdMcThYbUZ5S2k1WlpCYm8rcWxDMW5V?=
 =?utf-8?B?L0prdHN5MzRCZUJjaysxY05HYUoyTkVYNi9rMWFJSDNvemxFL0U3WXRaUHda?=
 =?utf-8?B?M2NRbjVCWGkwRTQ4Q1JCZFBhTGNCckFDV3hiNHEvR1lmWlRDczJrVXJjWC9h?=
 =?utf-8?B?TGk0TCtIcHJRcFd2L3k4b01STXB1MGxpbG85NnhORWNyUHJXdzRUZ2lES2Zy?=
 =?utf-8?B?dGFYY3VRS0dJcFA2Y3NWeEt6OUJieWlZVEcxRHBIcll2NmQ0Wm12WUVYckJp?=
 =?utf-8?B?SmhYcVpEdHQydFBIa1pxbVFwTHpnWVpNWjhvTDROa2d4cGo1a1oyQWQzNWNW?=
 =?utf-8?B?VXdFMjJVMFBIcGMrbkdsOUhLMlllb2hudHZXR3pyZWZWY3FoY2Voand4ZE9u?=
 =?utf-8?B?L3haQU04TURaaVUvYlAwMVByQWZ1OVkzeUQ0YnRQRTZXMzZWZi8yVVNCOUQz?=
 =?utf-8?B?b0djTEk4TDQrUVVqTFJPck1Ga1p2QkdpMGd6dmwrMjJzNzg4MEJHWVlIL21w?=
 =?utf-8?B?M3lHLy82WGlpa29kT2ZtTGxEOWtyZWJvYkJQOFE3S05PMVRDSTlaaCtIR08z?=
 =?utf-8?B?V2wwNWs3bE5YNTkzY09MODl3T3pDOHpQVWw2Z3BsOVRGQkQveHZ1Yms1VjM1?=
 =?utf-8?B?VkZmbGhqRDRGNk5xekY1NFcvSm1Ba1Zpc0ZiTnE5QWdnemlqck02RzgyRWs3?=
 =?utf-8?B?SzRkZ1ZlQ2lHSmlvazBaaDUzRjZoakdPQXlZcGhUTUFJNys4NWtpQmk2aGxD?=
 =?utf-8?B?Q0JjMy9aeTY0MHRhMDN0TXBwUmtqaWk4WEE2S3FWOWJtY3F5eHV6eU4waitJ?=
 =?utf-8?B?VkpJc1pNSnVBY20rejMvQmRsK1dSNmZsSllKUFlhbnRybm52UXBiZDVVdGlN?=
 =?utf-8?B?c2lHdGVzSzAxK3ZqTzVtTjlUZnNtaUZRdVlRZURXeFFQV1ZQSnlDbDdxTU83?=
 =?utf-8?B?MzY2bjhwQndqZWZ5anpQcFExWXJ1T3RER3FkdEdlMGZUMWtlVHRTcFAzT09h?=
 =?utf-8?B?bk1KMjh3MCt4dHdtbm5ZUllNQktHSUhtUVBRVTk3dzhjT0gvcG5hSTRpTUZl?=
 =?utf-8?B?ZW9EN2NpNXh6aThucXExWEJtRmVhMVRvaVJtYUpHWEs3UUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L04rSnhZQUsxTGtxODlmK0d3c0wzZlY2K0NqS1ZaMXhJclA0ZXZrN0N6cVdt?=
 =?utf-8?B?c0FFQ2IvanlMVjVrYm96VmNmVXA1eXZhMEQ3Q2xGNXBuejdiR3NQdm01V2pw?=
 =?utf-8?B?QmpTaVVmOHV3MnZjVFJJeWlJNVlvcFFETWRmb0NFUGw3OGlUTStUcnNmSkox?=
 =?utf-8?B?OG1HTFFTb3NKNUhLRmdyeE80Z2w3TFlxUmp5ZDBnKytlL2M4bGRzY2gxeTU3?=
 =?utf-8?B?MFJsNmlkMVNra0t6TFdndmVvL0RuOFplUGdPRlFIOGhJcFVDdkRRZEhRK3Q1?=
 =?utf-8?B?dlZ0UWphTWJYQlNUS21pN3FIRzdlQmgwNnlYU2V2MUMwWlRNQ1JLNUlDaHRv?=
 =?utf-8?B?Ymp1T2grY0w4T3d2SnFEKzBWSUpkS01FaEJpSDNYY1QvK3liOGM5a1I0MXRX?=
 =?utf-8?B?SWZvZnF3ZUZxeFI0WjZIVXR1NithSC9IYm5sbzVNTllBRDgySHBVL3dTY1lN?=
 =?utf-8?B?NjM4aDZDYjRsaW5kTFprbW1lUjVNMktDcHpBYTlRV212U3lLV2M0b2JzbGdG?=
 =?utf-8?B?QXhQWlZxYnVrK09hb2Z5RG0vRUJlZzVHOWg5aWkvU3NjUFM5dmZZNkJweVVv?=
 =?utf-8?B?QnZEVUZlVVpGanNIOE9VY3E1alRRbjFRdzkvb3VBNkNJQVFLdXdiNjNYSjNw?=
 =?utf-8?B?ZXBLYy80N2xvWDdaVlYrSURubUdtUmluTWpqdW1YTXIyS1hEUkJOS2FXZnpV?=
 =?utf-8?B?R3FZYTE0NmZGQ3A2Z0t3cko3L0hFb2tvT3V5cVlNaTRKazUyd3dycW5zSU8v?=
 =?utf-8?B?TDk0MzBYVitRYTYzRWRjVy95Qzk2MXhXc29Id2xWSkhnUmJycTA0SGwrQ1o0?=
 =?utf-8?B?QlJxWnhvWlJGcTlMQzk3VFpCaCtaWm8rTEd2TjlsM0VJWWcxby9oMTJPY0Jm?=
 =?utf-8?B?WXhVYzlhb0s5cTlWYnhjaklmSUQ3RHRta1RDaDhnVnJkOHZIRDlYYmF2Nzkr?=
 =?utf-8?B?L3dVN1J0YmhWclEyR1VzSmIyZVdIRDE1QkpNSkZWQUlLWlVWT1llbktlMVYx?=
 =?utf-8?B?N0lBZUE5SmtSbTV1ZGo5OC93bjJLN2xUMEQxQ0ZjV3MvNG1TUFdYdlZjZ2Q0?=
 =?utf-8?B?ZHV6RHF2RHltaUR2dGRpcmZQbzIxWlFOQmZHWHJhcVNXV3lPVVM1SExkNG9L?=
 =?utf-8?B?Z2pzUUY5bTNCMlRqN1hSRGlTL0dRRFJBb0NaL0tGWTJBc05TaU5LdHNseVM4?=
 =?utf-8?B?TjFWWGdoOFI5U1hFZkpTTXBCYnhmOWhNOVpjaFladGVoNWZJL0tGRlNsMGJj?=
 =?utf-8?B?SzFNaEFqa2dEM0RLZXlCck5MbUJzd0pHNzFPdlRsbTM1LzVQQW8rb0s5UkY5?=
 =?utf-8?B?TzRCMHBxdjExbDFKMUtqSnNRYUw0bmlYcW9mdEpZY1EydWt1MjlhL0tnVmpR?=
 =?utf-8?B?S0g2WmZLc1BXYXFHUEZLcmtsV2xiWVZDVEZpL3pyVGc0YXdxUWNMdDV1VlV4?=
 =?utf-8?B?cmxBdkx2MjRvNmwxbXB1R1BJTmRFbjVnR0dkM1dJdm1qUzlPNXNCMW1VM1g1?=
 =?utf-8?B?K2Y1TU9ZRDZKcFpITGswcWpESEgzZ2VCaXNZdnV3QTdHLy93d2U4WVJLT0tX?=
 =?utf-8?B?YU1vYmFEVHIvYjdqRE82UldEc21JUHdkNWhqWTBsd0VzelVIUXg3eTlSTFF3?=
 =?utf-8?B?bWVjbDBGY012VjJlc05kdXA0WnJ6TDJqK0JkM3Q5UlBuRy92YzRJNFZGU0Vp?=
 =?utf-8?B?djBrblRtWkw4T3hDT2RzWWtIcWVYN3kvWWhWdDF1UmsrWmxIcjlnV1k0ajA4?=
 =?utf-8?B?VHF1TFRBS3U0ZktMbm1HZlRzU1F5RmVHUFR6M3Q1cFo2dENQdmQ4M3ZhelJT?=
 =?utf-8?B?ODROWmNXRzR3QW9idFk0Um80K095aG8rbFpOUi9CVE45TVpJNHBLR0g5VlZj?=
 =?utf-8?B?NjZSSkw2ZFJXcy9UdTU4N29hREhidlU2VGMxNUVtY2V2ZGNCK2xETnRLd1Jh?=
 =?utf-8?B?alFJS3MxbEw3aE80ejNLNEpkR1ExQWJYNU1hUUdoZkF3SE5OOVo3VEtuSms4?=
 =?utf-8?B?UVRCYzdJellKOEZNSGY1MUQvZHFRSS8ySmhDK1d2OVJFQ2NmQXpqSnFXNnZu?=
 =?utf-8?B?MWh2Rk9XdWptZUpJcHVrVXlxOGZVUFhZNFQvUGhlZXcwcGo1TEFlQTZucXdv?=
 =?utf-8?Q?egR4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea208b0e-83f5-4f76-5bd2-08de3244ac11
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 08:19:26.1920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtSrwcY4KIURP47WrAwXCEp4AYbQXQkq4tSHTUHYPKEKVcdPbHg/hIOdFFd/dmA5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442



On 12/2/2025 3:22 PM, Sultan Alsawaf wrote:
> On Mon, Dec 01, 2025 at 02:16:22PM +0800, Du, Bin wrote:
>>
>>
>> On 11/29/2025 11:09 AM, Sultan Alsawaf wrote:
>>> On Fri, Nov 28, 2025 at 05:19:22PM +0800, Bin Du wrote:
>>>> Hello,
>>>>
>>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>>>> (https://ubuntu.com/certified/202411-36043)
>>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>>
>>>> Patch summary:
>>>> - Powers up/off and initializes ISP HW
>>>> - Configures and kicks off ISP FW
>>>> - Interacts with APP using standard V4l2 interface by video node
>>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>>> - Supports enum/set output image format and resolution
>>>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>>>> - It is verified on qv4l2, cheese and qcam
>>>> - It is verified together with following patches
>>>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>> 	drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>>>
>>>> AMD ISP4 Key features:
>>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>>> - Downscale input image to different output image resolution
>>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>>>
>>>> ----------
>>>>
>>>> Changes v5 -> v6:
>>>>
>>>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
>>>> - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
>>>> - Removed unnecessary .owner assignment from isp4_capture_drv definition
>>>> - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
>>>> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
>>>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
>>>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
>>>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
>>>> - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
>>>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
>>>> - Removed stray semicolons following closing curly braces.
>>>> - Improved and clarified macro definitions in isp4_interface.h.
>>>> - Eliminated unnecessary (u8 *) casts.
>>>> - Added missing memset for firmware command structures in isp4sd_stop_stream().
>>>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
>>>> - Enhanced error handling to clean up kthreads in the event of startup failure.
>>>> - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
>>>> - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
>>>> - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
>>>> - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
>>>> - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
>>>> - Eliminated redundant GET_REG_BASE() macros.
>>>> - Removed isp4sd_is_stream_running() function.
>>>> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
>>>> - Refined struct isp4_interface to remove firmware ring buffer configurations.
>>>> - Removed obsolete isp4sd_is_stream_running function.
>>>> - Removed pdev member from struct isp4_device, as it is unnecessary.
>>>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
>>>> - Removed gap in struct isp4_subdev definition.
>>>> - Performed extensive dead code removal and minor style improvements throughout the codebase.
>>>>
>>>>
>>>> Changes v4 -> v5:
>>>>
>>>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
>>>> - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
>>>> - Removed the unused macro definition to_isp4_device.
>>>> - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
>>>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
>>>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
>>>> - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
>>>> - Refined inclusion of header files for clarity and efficiency.
>>>> - Appended comments following #endif statements in header files.
>>>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
>>>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
>>>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
>>>> - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
>>>> - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
>>>> - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
>>>> - Optimized IRQ handler logic using a while loop for greater efficiency.
>>>> - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
>>>> - Applied distinct identifiers to differentiate multiple threads and IRQs.
>>>> - Removed unnecessary initialization of local variables.
>>>> - Refined camera start/stop workflow to mitigate potential synchronization concerns.
>>>> - Replaced all remaining mutex with guard mutex.
>>>> - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
>>>> - Removed redundant isp4sd_init_meta_buf function and its references.
>>>> - Limited firmware logging activities to the stream1 thread.
>>>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
>>>> - Resolved media device registration sequence issues.
>>>> - Modified stream processing thread behavior to await IRQ without a timeout.
>>>> - Addressed cleanup procedures in video device initialization and deinitialization routines.
>>>> - Corrected typos and made other cosmetic improvements.
>>>>
>>>>
>>>> Changes v3 -> v4:
>>>>
>>>> - Replace one mutex with guard mutex.
>>>> - Remove unnecessary bus_info initialization of v4l2_capability.
>>>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>>>> - Modify document with better SOC description.
>>>> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
>>>> - Modify some commit messages by describing changes in imperative mood.
>>>> - Add media-ctl output in cover letter.
>>>> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>>>> - Fix typo errors and other cosmetic issues.
>>>> - Add DRM_AMD_ISP dependency in Kconfig.
>>>>
>>>>
>>>> Changes v2 -> v3:
>>>>
>>>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>>>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>>>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>>>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>>>         media: amd: isp4: Add missing refcount tracking to mmap memop
>>>>         media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>>         media: amd: isp4: Don't increment refcount when dmabuf export fails
>>>>         media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>>>         media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>>>         media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>>         media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>>>         media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>>         media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>>>         media: amd: isp4: Remove unused userptr memops
>>>>         media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>>>         media: amd: isp4: Release queued buffers on error in start_streaming
>>>> - Addressed all code related upstream comments
>>>> - Fix typo errors and other cosmetic issues.
>>>>
>>>>
>>>> Changes v1 -> v2:
>>>>
>>>> - Fix media CI test errors and valid warnings
>>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>>> - In patch 5
>>>> 	- do modification to use remote endpoint instead of local endpoint
>>>> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>>>
>>>> ----------
>>>>
>>>> It passes v4l2 compliance test, the test reports for:
>>>>
>>>> (a) amd_isp_capture device /dev/video0
>>>>
>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>> -------------------------------------------------------
>>>>
>>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>>
>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>
>>>> Driver Info:
>>>>           Driver name      : amd_isp_capture
>>>>           Card type        : amd_isp_capture
>>>>           Bus info         : platform:amd_isp_capture
>>>>           Driver version   : 6.14.0
>>>>           Capabilities     : 0xa4200001
>>>>                   Video Capture
>>>>                   I/O MC
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>>                   Device Capabilities
>>>>           Device Caps      : 0x24200001
>>>>                   Video Capture
>>>>                   I/O MC
>>>>                   Streaming
>>>>                   Extended Pix Format
>>>> Media Driver Info:
>>>>           Driver name      : amd_isp_capture
>>>>           Model            : amd_isp41_mdev
>>>>           Serial           :
>>>>           Bus info         : platform:amd_isp_capture
>>>>           Media version    : 6.14.0
>>>>           Hardware revision: 0x00000000 (0)
>>>>           Driver version   : 6.14.0
>>>> Interface Info:
>>>>           ID               : 0x03000005
>>>>           Type             : V4L Video
>>>> Entity Info:
>>>>           ID               : 0x00000003 (3)
>>>>           Name             : Preview
>>>>           Function         : V4L2 I/O
>>>>           Pad 0x01000004   : 0: Sink
>>>>             Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>>
>>>> Required ioctls:
>>>>           test MC information (see 'Media Driver Info' above): OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test invalid ioctls: OK
>>>>
>>>> Allow for multiple opens:
>>>>           test second /dev/video0 open: OK
>>>>           test VIDIOC_QUERYCAP: OK
>>>>           test VIDIOC_G/S_PRIORITY: OK
>>>>           test for unlimited opens: OK
>>>>
>>>> Debug ioctls:
>>>>           test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>           test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>
>>>> Input ioctls:
>>>>           test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMINPUT: OK
>>>>           test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>           Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>
>>>> Output ioctls:
>>>>           test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>           test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>           test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>           test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>           test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>           Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>
>>>> Input/Output configuration ioctls:
>>>>           test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>           test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>           test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>           test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>
>>>> Control ioctls (Input 0):
>>>>           test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>           test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>           test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>           test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>           test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>           Standard Controls: 0 Private Controls: 0
>>>>
>>>> Format ioctls (Input 0):
>>>>           test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>           test VIDIOC_G/S_PARM: OK
>>>>           test VIDIOC_G_FBUF: OK (Not Supported)
>>>>           test VIDIOC_G_FMT: OK
>>>>           test VIDIOC_TRY_FMT: OK
>>>>           test VIDIOC_S_FMT: OK
>>>>           test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>           test Cropping: OK (Not Supported)
>>>>           test Composing: OK (Not Supported)
>>>>           test Scaling: OK (Not Supported)
>>>>
>>>> Codec ioctls (Input 0):
>>>>           test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>           test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>           test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>
>>>> Buffer ioctls (Input 0):
>>>>           test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>           test CREATE_BUFS maximum buffers: OK
>>>>           test VIDIOC_REMOVE_BUFS: OK
>>>>           test VIDIOC_EXPBUF: OK
>>>>           test Requests: OK (Not Supported)
>>>>           test blocking wait: OK
>>>>
>>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>>
>>>> The media-ctl output of media device /dev/media0:
>>>> -------------------------------------------------------
>>>>
>>>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>>>> Media controller API version 6.17.0
>>>>
>>>> Media device information
>>>> ------------------------
>>>> driver          amd_isp_capture
>>>> model           amd_isp41_mdev
>>>> serial
>>>> bus info        platform:amd_isp_capture
>>>> hw revision     0x0
>>>> driver version  6.17.0
>>>>
>>>> Device topology
>>>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>>>               type V4L2 subdev subtype Unknown flags 0
>>>>           pad0: Source
>>>>                   -> "Preview":0 [ENABLED,IMMUTABLE]
>>>>
>>>> - entity 3: Preview (1 pad, 1 link)
>>>>               type Node subtype V4L flags 0
>>>>               device node name /dev/video0
>>>>           pad0: Sink
>>>>                   <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>>>
>>>> Please review and provide feedback.
>>>>
>>>> Many thanks,
>>>>
>>>> Bin Du (7):
>>>>     media: platform: amd: Introduce amd isp4 capture driver
>>>>     media: platform: amd: low level support for isp4 firmware
>>>>     media: platform: amd: Add isp4 fw and hw interface
>>>>     media: platform: amd: isp4 subdev and firmware loading handling added
>>>>     media: platform: amd: isp4 video node and buffers handling added
>>>>     media: platform: amd: isp4 debug fs logging and  more descriptive
>>>>       errors
>>>>     Documentation: add documentation of AMD isp 4 driver
>>>>
>>>>    Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>>>    Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>>>    .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>    MAINTAINERS                                   |   25 +
>>>>    drivers/media/platform/Kconfig                |    1 +
>>>>    drivers/media/platform/Makefile               |    1 +
>>>>    drivers/media/platform/amd/Kconfig            |    3 +
>>>>    drivers/media/platform/amd/Makefile           |    3 +
>>>>    drivers/media/platform/amd/isp4/Kconfig       |   14 +
>>>>    drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>>    drivers/media/platform/amd/isp4/isp4.c        |  234 ++++
>>>>    drivers/media/platform/amd/isp4/isp4.h        |   20 +
>>>>    drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>>>>    drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>>    .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>>    drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>>>>    .../media/platform/amd/isp4/isp4_interface.c  |  787 +++++++++++
>>>>    .../media/platform/amd/isp4/isp4_interface.h  |  140 ++
>>>>    drivers/media/platform/amd/isp4/isp4_subdev.c | 1087 ++++++++++++++++
>>>>    drivers/media/platform/amd/isp4/isp4_subdev.h |  130 ++
>>>>    drivers/media/platform/amd/isp4/isp4_video.c  | 1158 +++++++++++++++++
>>>>    drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>>>>    22 files changed, 4498 insertions(+)
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>    create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>    create mode 100644 drivers/media/platform/amd/Kconfig
>>>>    create mode 100644 drivers/media/platform/amd/Makefile
>>>>    create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>>    create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>>    create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>> Hi Bin,
>>>
>>> I have attached a small patch with a fix for an old issue I noticed now while
>>> reading the v6 code and some remaining style nitpicks addressed. And some
>>> duplicated code on stream stop removed.
>>>
>>> This is the last change from me, I promise. :)
>>>
>>
>> Alright, I'll trust you the last time, LOL :) Never mind, they are small
>> changes and every single one brings the code closer to perfection.
>> I'll wait for feedback from other reviewers so I can incorporate them all
>> into next version.
> 
> Great, then maybe I'm not getting coal for xmas! :)
> 

Of course you won't, you've earned toys and candy to enjoy the holiday:)

> BTW, there is something else I noticed while making that patch: the min buffers
> handling seems a bit odd. q->min_queued_buffers is set to 2, but then there is
> ISP4SD_MIN_BUF_CNT_BEF_START_STREAM set to 4. Why isn't q->min_queued_buffers
> just set to 4 instead of using the macro?
> 

According to the description of min_queued_buffers, `the minimum number 
of queued buffers needed before @start_streaming can be called. 
VIDIOC_REQBUFS will ensure at least @min_queued_buffers + 1 buffers will 
be allocated.` Since the ISP driver manages the buffering and streaming 
initiation process, the specific value of min_queued_buffers is not 
critical. Furthermore, given that ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 
represents the minimum buffer count necessary for ISP FW functionality, 
the maximum value for min_queued_buffers is 
ISP4SD_MIN_BUF_CNT_BEF_START_STREAM - 1 (or 3). Therefore, 
min_queued_buffers can be set anywhere from 0 to 3; a median value of 2 
has been selected. The actual buffer count is determined by 
isp4vid_qops_queue_setup.

> And then what seems weirder is that isp4sd_ioc_send_img_buf() sends
> CMD_ID_START_STREAM once 4 buffers are queued. But isp4sd_ioc_send_img_buf() is
> called from the buf_queue callback, not the enable_streams callback, so why is
> it sending the stream start command to FW?
> 

Since ISP firmware requires 4 buffers to be sent before 
CMD_ID_START_STREAM, but the APP may send buffers and start streaming in 
any order, e.g. start stream->send buffer 0, 1, 2 ...  or send buffer 0, 
1, 2, ... -> start stream  or send buffer 0 -> start stream->send buffer 
1, 2 ..., or any more combinations, the ISP driver needs to handle all 
possible sequences. To ensure compatibility, isp4sd_ioc_send_img_buf is 
called both in isp4vid_qops_buffer_queue and 
isp4vid_qops_start_streaming(you might miss this).

> It looks like isp4sd_start_stream() will send CMD_ID_START_STREAM unless it was
> already done by isp4sd_ioc_send_img_buf(), so I'm wondering why
> isp4sd_ioc_send_img_buf() needs to do it at all, especially before the
> start_streaming callback (which is what indirectly calls enable_streams).
> 

Please see the details below.

> Also, when isp4sd_ioc_send_img_buf() is the one to send CMD_ID_START_STREAM,
> isp4sd_init_stream() and isp4sd_setup_output() will be skipped in
> isp4sd_start_stream(). Is it okay for those to be skipped? :\
> 

No, `isp4sd_init_stream()` and `isp4sd_setup_output()` are always 
called. Let's consider the two simplest scenarios,
- APP sends buffer before starting stream
When ISP driver receives the buffers, `isp4vid_qops_buffer_queue 
callback()` is called, it just pushes the buffers to internal queue 
`isp_vdev->buf_list` without sending them to ISP FW because flag 
`isp_vdev->stream_started` is false
When ISP driver receives the start stream, 
`isp4vid_qops_start_streaming()` callback is called, inside it, 
`v4l2_subdev_call(subdev, video, s_stream, 1); ` is called and causes 
`isp4sd_enable_streams()` to be called and in turn 
`isp4sd_start_stream()`, `isp4sd_init_stream()`, `isp4sd_setup_output()` 
are all called, after that, inside `isp4vid_qops_start_streaming()`, all 
queued buffers in `isp_vdev->buf_list` will be sent to ISP FW by 
`send_buffer` callback, inside `send_buffer` callback, when sent buffer 
count gets to ISP4SD_MIN_BUF_CNT_BEF_START_STREAM, CMD_ID_START_STREAM 
will be sent to ISP FW, after all buffers in `isp_vdev->buf_list` are 
sent, `isp4vid_qops_start_streaming()` will set 
`isp_vdev->stream_started` to true
- APP start stream before sending buffers
`isp4vid_qops_start_streaming()`-> `isp4sd_enable_streams()`-> 
`isp4sd_start_stream()`-> `isp4sd_init_stream()`-> 
`isp4sd_setup_output()`-> set flag `isp_vdev->stream_started` to true
`isp4vid_qops_buffer_queue()`->directly send buffers to FW by 
`send_buffer` callback because `isp_vdev->stream_started` flag is true 
(if count gets to ISP4SD_MIN_BUF_CNT_BEF_START_STREAM, send 
CMD_ID_START_STREAM)->add buffer to queue `isp_vdev->buf_list`.

The logic is little complicated, I hope I make it clear, the basic idea 
is to ensure the required sequence to the ISP FW regardless of the order 
in which the APP sends buffers or starts the stream.

>>> Otherwise, v6 is looking very good! Good catches with the error handling too,
>>> with the irq_enabled flag and v4l2_device_register() error cleanup.
>>>
>>
>> Yes, I believe so. I received two warnings from the Media CI checks;
>> however, it appears that the issue is related to the CI system itself.
>>
>> # Test static:test-smatch
>> drivers/media/platform/amd/isp4/isp4_interface.c:439 isp4if_send_fw_cmd()
>> warn: '&ele->list' not removed from list
>>
>> # Test static:test-coccinelle
>> ./platform/amd/isp4/isp4_subdev.c:404:6-25: WARNING: atomic_dec_and_test
>> variation before object free at line 405.
>> ./i2c/ds90ub953.c:779:44-51: WARNING: Consider using %pe to print PTR_ERR()
>> ...
>> If you believe that the CI is wrong, kindly open an issue at
>> 	/-/issues or reply-all
>> to this message.
> 
> Yes, both of those are false positives. The atomic_dec_and_test one is funny
> actually because it's just a refcount before freeing the object, which is a very
> normal thing, heh.
> 

Thanks for the confirmation!

> Thanks,
> Sultan

-- 
Regards,
Bin


