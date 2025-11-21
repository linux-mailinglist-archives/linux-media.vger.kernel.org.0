Return-Path: <linux-media+bounces-47580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D893EC7A9B7
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 16:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D104E3A1248
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E058333971F;
	Fri, 21 Nov 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eQBL0376"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ED61F09AD;
	Fri, 21 Nov 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763740012; cv=fail; b=Iig8MA3qUYBY1+LspgjSWFicEv8orwbhkib/cDaM2HDt6lJSDdKWS20oz83U5HrB46MYxT2FPQ/dvgg6o8fkyIekPvuLjrc4B3zFfIIngAcn9Bh6v+CfKCfx5bVCNrXwYAOQjKSUiUwPptVYaxjYsSikFGzZXSc+oAo24GIXCk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763740012; c=relaxed/simple;
	bh=SXOYKdB5Q/S0vLTue0rbGadflzcjVfSut+QWKNvNR20=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RQYuQjwkmfxfrgx9XL9reRsrstEsp3egNISxjbAMDOv5rePAhHmK2z+HoSZkKCd99ssevFnRyqqjsCsgYAhmN5zzp+oikSvYX858UX6xaxrSjQrqF//zqVWnMTGmaW2vwI7GZElXUagUMsVvbFjvmXJEpSzNatpWiS5DcwDcgts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eQBL0376; arc=fail smtp.client-ip=52.101.193.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g60pq5E0lmcz8EVyX5fo3Wl+A/N88bAjp29tDDlpPg11teX9MVf5q+6b8n+agfIiJgGlocTIwzPYOSBt0Nb2qS22D/suLzbjXe+Y+p752t6RmZITXYZl0IB35Bagm1LoIriWMay2c+I/+1a8O9blBTsIwBwWNwC5jRdu+zERPDcqbQmafsPDU7G83WgOFkJx0gQe/9KgsbzTmr55jHMX+mzP/CFfCmUM4vGR2kmPZ1KCfm7LEk4NXtT4fHLZyi8J7e4BNN89tsLY2A/TJW7I4+y7DP+9GifdO39xt0ax0VOn4yj5LjKrmwWYbh2+mso+nwU2zcHpYL0MNzK8t2x1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YL/HTIq5Rs24HnbjWocyTo9H4MIvg8oDUVDzY/2o8Qg=;
 b=Cwcn1WyjC0vgnRlwN/pruYQX6x3g14CG2LBmu+w05GiVsffWpM1Qrg5w2Ougsvn+RdwuEualqwuiOU4MrNllMsCgjiDTE+rJ0A063spmFBJYezShT1KQVxECsNlpz2XBwqn/fJJci1HJTm8TRmf6TzjwemzsQPjFwnXhQ/OldU4rY1q/Kvq6/7Lpy3KTj5f/eFAd6EfHacZdQoDEqfuL4lSTAfL8BU+4eiYaIISwwCOavd30+ocz8kPAeHn61Qp9rQC49Jatnc9y7o5gkhm8s/T5muw+8hHpYmPW/XZ7VWErSrOEHkOZqWociF47FA+/6gVkCM4qOe++UyUCXS2j0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YL/HTIq5Rs24HnbjWocyTo9H4MIvg8oDUVDzY/2o8Qg=;
 b=eQBL0376W8dEPIkaJKw3ia0LRSmtmNBKgcarRyYLvCIqK1N0jolmPHa4EecoPThDNFYx01HdhEsck4ey/8fa+vqrdYOgUi4YAxdkyzLw7pWlcZauN8bgiJ3QZxeyfDSZMB+63HRgyhaTbjxm87/0X5wiLHKgIrI++44rFEv6ZKo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 15:46:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:46:44 +0000
Message-ID: <ccb0a045-fc00-49bc-9441-09d5a0b9aa51@amd.com>
Date: Fri, 21 Nov 2025 09:46:41 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: "Du, Bin" <bin.du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com
References: <aRPH1hV7bEfagPtE@sultan-box> <aRPhMCwJjpMqAROG@sultan-box>
 <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com> <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box> <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
 <aRwhuNmPRlPGxIia@sultan-box> <8288a5b3-6e56-4c9a-a772-99ca36bb7c52@amd.com>
 <aSAg1MUVZtDlCC96@sultan-box> <546a8d8e-514b-4f6b-bf46-1ec0c9974e7e@amd.com>
 <aSCHlvWMYEdRb2ey@sultan-box>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <aSCHlvWMYEdRb2ey@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:806:d2::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 3412076c-b7cb-4bb7-5b21-08de29152bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bDZ0QlNGbXNvejV1QTJoV0xGRDZIQldLU0Z5VDBKaTlTdXJMb2dzYS8za25H?=
 =?utf-8?B?QloyRERZWTVRWlBtdEdQbm5zd0J2aGhKL3hCSGpTNGpCVHc1d2VoMmxCUmV0?=
 =?utf-8?B?enBMOGFRaVByazNMSGtYejI1allqbDV5L2xpaUFoUzBGY1NHRGdacHFMVUY5?=
 =?utf-8?B?VklLc3NwTDU0a0RFWEtuNExkL2RscWNLQ0J5bnhyVHRXUlBxcHMyS2hhc0tL?=
 =?utf-8?B?bEs2Tm9pTUkxdkZMOU0yS3c4cTZUc0VkVTBGbzdqZCtIUm1GampNYnE0UlBn?=
 =?utf-8?B?QXBXTHZkeDU5c3pTNi9CUXJleWtWMGFFcXI3SkNJUmRGTDlTWkxuY0tOc2g4?=
 =?utf-8?B?d3p2MFJLMG8xcTBidGRGOXZFMlhEVjA3ZjhrKy9NQ0pzakFOK292M2dmOTAr?=
 =?utf-8?B?TW1yMy9EZEQyenBjbWtBbUJ3SVdPZkJSMzhFT1o5VjhKalIrZTZ6UFF6ekZE?=
 =?utf-8?B?OTBHd3N6U1RQV2hydklyYVhhcHl4QWxabGxITzdtWjB3OUZRMGZpMHlvNGYy?=
 =?utf-8?B?N09QazVFdUhWWThJT2FLcjI5SlEzdDlPSjdkc0pFQ29JaTBiNjRjZXRhbk8z?=
 =?utf-8?B?dkVDWENhRGlqUDVuVVg3MzJmdGRieDl0VTVIWGJDUHVrU2xmNmNGaWE0T3pB?=
 =?utf-8?B?azZaNVJZdTg5OWR4THAwREJCcTlkU0pVUUlDZW54VFRSaitsTmxiUmVrUHN2?=
 =?utf-8?B?NFAzYWYyUHIvaVV4T0RPaDErRkplOW0vMklLU2w2blhHN3FBa2ZlVVhtQXB3?=
 =?utf-8?B?S2pvcnUxcTNYTWFoZXBVYjBmdURaSlVNdGhiV29zNjFCdWFGUkxRREFnZElV?=
 =?utf-8?B?R1pCVk5EMzlFczJsZ1pteXNVcUxpSlpHZ3p2ZFZGdVBQSVp5MS9iVHErRmw0?=
 =?utf-8?B?Zm9ITUgzTEpRRHhWVVBVWmwxYnV0SWRPOFhXY3R0RUFBRGVHYmhDekxkNzBj?=
 =?utf-8?B?Ty9kN0h4UlZzY2NQWnpGL01xS1lGNVkybzY4T29SMmh2V1NDcE9mN2Q0NzR2?=
 =?utf-8?B?V1hFMFNiUTJ5ZFRjVnBFbnRaMmppTWZLRWxEUUhYOXc2c09JbDIyOXFKNjln?=
 =?utf-8?B?eUZNZm5Xd0VKcjk5bDUweitSVWJ5ZE9SUlVKaElIN2hpVm5rQ0xzYzhvdVA0?=
 =?utf-8?B?SXk5VnBwYzBPaFNMV3djYk5YNlRheDIvcGtNdzNtVmNGOHJadGNBamdCNHZY?=
 =?utf-8?B?QU9ObEdTV2xWR2prdy9OekNzWTI4ZWdYdFJXK3VESDNwRUpTdm9UdEJ2cTJ0?=
 =?utf-8?B?VmNRYko0RVpWNml6d25SeTZNK21FdmUvWW5HODg3amZHMm42dGhISUE3NVZY?=
 =?utf-8?B?WWlQbGFDcEJ4NFF1eDYvYndZZ3BrZkFteGovQUNsMzNZbDhtRXNUcTlidE1q?=
 =?utf-8?B?cTRVcXVVNmpBaWxrSnNhbGhvTExxOW5EczJ1U2tmNW5JamtUSjhINDNFeUVs?=
 =?utf-8?B?d3VOc2x3UFQwbEpya2tvOUlDYmpVY2tHdDRTeWV4eENBeTB3MS83a1ZQTTlX?=
 =?utf-8?B?UXp2L0RZU1FSdjVWb05ETlFFK21ERDExdzFrRy9iZTVrbGlsbHFsY0l6Vkc1?=
 =?utf-8?B?WEpEbVg1VUFxb2tCdHhwOUg4YWlvSHcwWGM0aktBWlEwa29LTENaTFJJVm5m?=
 =?utf-8?B?N0duSXpVTFFtZ0RPVlhWaXFwS0VsTHFnSlh5YTF6QkpTd2hiZWxReE5zVlQ5?=
 =?utf-8?B?Q1R3NmJHV0J4cTBkZjhXY3R5S3hrK0lTdVR6aGlaL2tpSUU5a1NXcGpnTlFi?=
 =?utf-8?B?RUFuV1RZYlpjWU5sUkY0VCtYNlNVYVp3cGVYQTRNR3dJSFlORzhhbVdBcjZT?=
 =?utf-8?B?SEpURFpnd0VhRGkxUDQ4ZVR2ZlZKcGUyMDVhbUYxbWZkTGlwYytEaU03bUg1?=
 =?utf-8?B?bnN4bFMvVzc2djNRMHRSMStpbzZxb0RWNjdUcXpWcGwvTGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHlHRWphSk5VZ2NnRUtjR2tuVDhVRHhwQjNCMVQ5MGh2YWRXSndPMllDS1F1?=
 =?utf-8?B?aFYwbW9nY2VRSVRKV3VXSk1PRmZlVCtsdnkwTFhzSVNHdElTcDh2anQ3K1Jx?=
 =?utf-8?B?aXU5MXNmVTdTeU5qM0RqUHQ2N1hNUllzbi9wNk5kNXpzTWRraHRhem1kQTBy?=
 =?utf-8?B?M3FPYzFjakFRNDBpbjNIejJiVVdsQjE1VVQvdUQ1MVU3NzBiZ00vTmFGM3ZG?=
 =?utf-8?B?TUJiVUM3M1NYaktEeGRnRFFYR3U5NEQySzZURVh2SXNMN3pqM0RENlp0U3R6?=
 =?utf-8?B?OUhRdWdrd2UvUXlCK1NvUS9WUjl2K3Jza1htTHFSZE5Wb29uRjBWNERWNUxm?=
 =?utf-8?B?Mkc0R2lwTXZldDg4b3BtTmh0ZHQwK1hSS0I3Z092bTNwYVpCYUYyWGcvMTFH?=
 =?utf-8?B?dkx0aU85OWtuYUoyOXhHQVRJZXBrVjhsRmx3SUU5U0NrK0s2cmJwWXpqczJQ?=
 =?utf-8?B?UEZGY1A0S2ZQRGxFZyt5a3FnWTJoQTFHY2xJbWErVmwyVEVpMEpRRmFvM3VG?=
 =?utf-8?B?SGI4K2FyUWVLVXBZUWMzTXd0UG82cmJSZ2hSVkQxd0hXQVVXMHAzeG14R2h4?=
 =?utf-8?B?RzZnT3NPS3poZTZxZXg1VkNyRjlldC9CNkQwRkRXaGdRQVZ4YjNrSnFCNWMw?=
 =?utf-8?B?M0hZVVRVM3l3U21YV1ZvWjM3d2NJd1M1SHpUK3ROWkx6dzBPYWxPY2ZCNGVj?=
 =?utf-8?B?M2l1MUw3cXR4SThPQmQyV3dnNEdKLzRDcmFXRkQ0RFhZNnlvcXBLRG1Tb1oz?=
 =?utf-8?B?TlcvQ3VweXdhUEtDWWVFT0ZVUHlXbE1xS3c2MVBTM0FDb01YcVhjeXhDQ1hB?=
 =?utf-8?B?Q1FPNlNLVnZ4SzNZVm5IZGVacXpkSDYwaDhQUFYwQ1dKOFcybGJFcTBtUGtK?=
 =?utf-8?B?N3czZXU2TFBoajR3Umdod09hNWx3K3lFTXFHYWxKZ3EyQjlkdE9BMmpHSlVp?=
 =?utf-8?B?enRHdlJlZDVqcnRaYnRzV1Z3bDFsYXBraGJRbldLcUd4ZzBjQjBRUTBQYjh6?=
 =?utf-8?B?WERWajlyT1lHd1JOa0FiRWl2OEtEWTRhSEJWZVowSSthek54aTE1MllIT1JB?=
 =?utf-8?B?clJKNXRIbUJQOVJCRCsxdFBmaEpENmRvWVNnbExkalVpeW5kTyszKytOQUZn?=
 =?utf-8?B?SEZucE5RUUpNMExqL1BtQlBKRXFyaERYbUd6YWJSWnFMTGhUeUZNV3p1Q0lp?=
 =?utf-8?B?alZBR2hadkRFa2hiWkZ2K2JmbDhRTGN6MjRzRnVMTDBPUTNQbmhaajNmVmE4?=
 =?utf-8?B?b0paYW44T2hBU0xOYTRuNzYwbTNWK1A5TjhHWmp5UHNNNE9seHNQZHZIQThu?=
 =?utf-8?B?b1FlMzQ2clBLYks2ckZ3Q25zMUJkL0dNdkFNbmNZVC9uSUkzbUtsbXRsOGlT?=
 =?utf-8?B?RnV4aFVqcDFUQTRlcjdWYTlmMndxVjRHekEya2J0a0J6NnB6Y2t3czl3aG4w?=
 =?utf-8?B?TzFtYkkzVC9tV0hqMkN6SmVXTnVrTndHSFRKZk81b0liTFhyY3lwdnFGcEl0?=
 =?utf-8?B?bi9mQzRiTDFhSW92SFYxb1FDcGNmZzczT0owbkhieXUwZ21aL0NCQWg4YVR6?=
 =?utf-8?B?NzU1Qkx5U05BUklSRFZMVEZTcXVIR1puZTRjM1o5YVFDUUM1anREVXdEc3dW?=
 =?utf-8?B?K1ZLVjV6UXJUTy96VkM3bDRublBkcy9Vd242TUZZWXFNMmFBaWpjdE9HQi9X?=
 =?utf-8?B?UUFMNXNOUUV0dzUrREx5TlNVaGQyYlBJV2pwaVpML1FyMmFXRXdja1YyMnRJ?=
 =?utf-8?B?OHRQU1pnMHNpZjY5TXZlQXN2WEs4N0VEZjQ0UmNxV3lCUlZCaXRjdUZkMTIw?=
 =?utf-8?B?Tkw3TzBoazkzZ1BlbUltdFJzcDZxSi9GUURKdmNCSWtBWWtvYmp1dDh5OVdW?=
 =?utf-8?B?ZkNhbUR5RWpUb3J0V3ZHUklETThvVmlmOFErOURqNFJzRytCRWp1ZnJxVVBn?=
 =?utf-8?B?bTMxZFo5OWRuSjcrUFduUC8xWmp4QkVwQkpqNE45ODdSUDlueFpndmZwMlJE?=
 =?utf-8?B?enovMWdBbzdlRHFUR0xXVmlpVzArL3RTdm9sZUpiLy9hT3ZWUmNqMWNxVk1M?=
 =?utf-8?B?VG4wbC82eFNtNnJ2OVJoUEJLdkpFNGgxdU0vTlRYSUNIWDhBZFMwekJyZWV2?=
 =?utf-8?Q?GIWDFe1nGYRtDFj8/Vl+CRK0d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3412076c-b7cb-4bb7-5b21-08de29152bed
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:46:44.3132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVaJZGgAsD9iyiNDcqHFDys96TwEzE0vh3+E2qdZpTzFiaBL8dJbDVF02+uXP8bYosH14A2bNc+ynVQ53a+xeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554



On 11/21/2025 9:39 AM, Sultan Alsawaf wrote:
> On Fri, Nov 21, 2025 at 08:32:34AM -0600, Mario Limonciello wrote:
>>
>>
>> On 11/21/2025 2:20 AM, Sultan Alsawaf wrote:
>>> On Wed, Nov 19, 2025 at 06:14:17PM +0800, Du, Bin wrote:
>>>>
>>>>
>>>> On 11/18/2025 3:35 PM, Sultan Alsawaf wrote:
>>>>> On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
>>>>>>
>>>>>>
>>>>>> On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
>>>>>>> On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
>>>>>>>> On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
>>>>>>>>> Thanks Sultan for your information.
>>>>>>>>>
>>>>>>>>> On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
>>>>>>>>>> On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>> On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>> On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
>>>>>>>>>>>>>> Thank you, Sultan, for your time, big effort, and constant support.
>>>>>>>>>>>>>> Apologies for my delayed reply for being occupied a little with other
>>>>>>>>>>>>>> matters.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
>>>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
>>>>>>>>>>>>>>>> Hi Bin,
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> To expedite review, I've attached a patch containing a bunch of fixes I've made
>>>>>>>>>>>>>>>> on top of v5. Most of my changes should be self-explanatory; feel free to ask
>>>>>>>>>>>>>>>> further about specific changes if you have any questions.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
>>>>>>>>>>>>>>>> I should send what I've got so far.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
>>>>>>>>>>>>>>>> protecting the list_del() anymore. I also checked the compiler output when using
>>>>>>>>>>>>>>>> guard() versus scoped_guard() in that function and there is no difference:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>          sha1sum:
>>>>>>>>>>>>>>>>          5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
>>>>>>>>>>>>>>>>          5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> So guard() should be used there again, which I've done in my patch.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I also have a few questions:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
>>>>>>>>>>>>>>>>           faster to use that than using disable_irq_nosync() to disable the IRQ from
>>>>>>>>>>>>>>>>           the CPU's side.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
>>>>>>>>>>>>>>>>           beforehand to mask all pending interrupts from the ISP so that there isn't a
>>>>>>>>>>>>>>>>           bunch of stale interrupts firing as soon the IRQ is re-enabled?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
>>>>>>>>>>>>>>>>           when the ISP posts a new response _after_ the kthread determines there are no
>>>>>>>>>>>>>>>>           more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 4. Why are some lines much longer than before? It seems inconsistent that now
>>>>>>>>>>>>>>>>           there is a mix of several lines wrapped to 80 cols and many lines going
>>>>>>>>>>>>>>>>           beyond 80 cols. And there are multiple places where code is wrapped before
>>>>>>>>>>>>>>>>           reaching 80 cols even with lots of room left, specifically for cases where it
>>>>>>>>>>>>>>>>           wouldn't hurt readability to put more characters onto each line.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I've attached a new, complete patch of changes to apply on top of v5. You may
>>>>>>>>>>>>>>> ignore the incomplete patch from my previous email and use the new one instead.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I made many changes and also answered questions 1-3 myself.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Please apply this on top of v5 and let me know if you have any questions.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Sure, will review, apply and test your patch accordingly. Your contribution
>>>>>>>>>>>>>> is greatly appreciated, will let you know if there is any question or
>>>>>>>>>>>>>> problem.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> BTW, I noticed a strange regression in v5 even without any of my changes: every
>>>>>>>>>>>>>>> time you use cheese after using it one time, the video will freeze after 30-60
>>>>>>>>>>>>>>> seconds with this message printed to dmesg:
>>>>>>>>>>>>>>>          [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> And the video never unfreezes. I haven't found the cause for the regression yet;
>>>>>>>>>>>>>>> can you try to reproduce it?
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Really weird, we don't see this issue either in dev or QA test. Is it 100%
>>>>>>>>>>>>>> reproducible and any other fail or err in the log?
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Sometimes there is a stop stream error when I close cheese after it froze:
>>>>>>>>>>>>>
>>>>>>>>>>>>>         [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>>>>>>>         [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>>>>>>>         [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>>>>>>>>
>>>>>>>>>>>>> When I revert to v4 I cannot reproduce it at all. It seems to be something in
>>>>>>>>>>>>> v4 -> v5 that is not fixed by any of my changes.
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Hi Sultan, could you please try following modifications on top of v5 to see
>>>>>>>>>>>> if it helps?
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>>>>
>>>>>>>>>>>> #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>>>>>
>>>>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>>>>
>>>>>>>>>>>> /*
>>>>>>>>>>>>        * standard ISP mipicsi=>isp
>>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> index 248d10076ae8..acbc80aa709e 100644
>>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>>> @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
>>>>>>>>>>>> isp4_subdev *isp_subdev)
>>>>>>>>>>>>              return 0;
>>>>>>>>>>>> }
>>>>>>>>>>>>
>>>>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
>>>>>>>>>>>> irq_enabled)
>>>>>>>>>>>> {
>>>>>>>>>>>>              struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>>>>              unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>>>>> @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
>>>>>>>>>>>> *isp_subdev)
>>>>>>>>>>>>                      return 0;
>>>>>>>>>>>>              }
>>>>>>>>>>>>
>>>>>>>>>>>> -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>> -               disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>> +       if (irq_enabled)
>>>>>>>>>>>> +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>>> +                       disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>>
>>>>>>>>>>>>              isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>>>>              dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>>>>> @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
>>>>>>>>>>>> *isp_subdev)
>>>>>>>>>>>>
>>>>>>>>>>>>              return 0;
>>>>>>>>>>>> err_unlock_and_close:
>>>>>>>>>>>> -       isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>> +       isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>>>>              return -EINVAL;
>>>>>>>>>>>> }
>>>>>>>>>>>>
>>>>>>>>>>>> @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
>>>>>>>>>>>> on)
>>>>>>>>>>>>              if (on)
>>>>>>>>>>>>                      return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>>>>              else
>>>>>>>>>>>> -               return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>>> +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>>>> }
>>>>>>>>>>>>
>>>>>>>>>>>> static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>>>
>>>>>>>>>>> No difference sadly; same symptoms as before. FYI, your email client broke the
>>>>>>>>>>> patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
>>>>>>>>>>> replaced tabs with spaces, and removed leading spaces on each context line, so I
>>>>>>>>>>> had to apply it manually. To confirm I applied it correctly, here is my diff:
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>> index 39c2265121f9..d571b3873edb 100644
>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>>>>>>>> @@ -97,7 +97,7 @@
>>>>>>>>>>>       #define ADDR_SPACE_TYPE_GPU_VA          4
>>>>>>>>>>> -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
>>>>>>>>>>> +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
>>>>>>>>>>>       /*
>>>>>>>>>>>        * standard ISP mipicsi=>isp
>>>>>>>>>>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>> index 4bd2ebf0f694..500ef0af8a41 100644
>>>>>>>>>>> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>>>>>>> @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>       	return 0;
>>>>>>>>>>>       }
>>>>>>>>>>> -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
>>>>>>>>>>>       {
>>>>>>>>>>>       	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>>>>>>>>>>>       	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>>>>>>>>>>> @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>       		return 0;
>>>>>>>>>>>       	}
>>>>>>>>>>> -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>> -		disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>> +	if (irq_enabled)
>>>>>>>>>>> +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>>>>>>>>>>> +			disable_irq(isp_subdev->irq[i]);
>>>>>>>>>>>       	isp4sd_stop_resp_proc_threads(isp_subdev);
>>>>>>>>>>>       	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>>>>>>>>>>> @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>>>>>>>>>>>       	return 0;
>>>>>>>>>>>       err_unlock_and_close:
>>>>>>>>>>> -	isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>> +	isp4sd_pwroff_and_deinit(isp_subdev, false);
>>>>>>>>>>>       	return -EINVAL;
>>>>>>>>>>>       }
>>>>>>>>>>> @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>>>>>>>>>>>       	if (on)
>>>>>>>>>>>       		return isp4sd_pwron_and_init(isp_subdev);
>>>>>>>>>>>       	else
>>>>>>>>>>> -		return isp4sd_pwroff_and_deinit(isp_subdev);
>>>>>>>>>>> +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
>>>>>>>>>>>       }
>>>>>>>>>>>       static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>>>>>>>>>>>
>>>>>>>>>>>> On the other hand, please also add the patch in amdgpu which sets *bo to
>>>>>>>>>>>> NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
>>>>>>>>>>>
>>>>>>>>>>> Yep, I have been doing all v5 testing with that patch applied.
>>>>>>>>>>>
>>>>>>>>>>> BTW, I have verified the IRQ changes are not the cause for the regression; I
>>>>>>>>>>> tested with IRQs kept enabled all the time and the issue still occurs.
>>>>>>>>>>>
>>>>>>>>>>> I did observe that ISP stops sending interrupts when the video stream freezes.
>>>>>>>>>>> And, if I replicate the bug enough times, it seems to permanently break FW until
>>>>>>>>>>> a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
>>>>>>>>>>> the ISP when this happens.
>>>>>>>>>>>
>>>>>>>>>>> As an improvement to the driver, can we do a hard reset of ISP on driver probe?
>>>>>>>>>>> I am assuming hardware doesn't need too long to settle after hard reset, maybe
>>>>>>>>>>> a few hundred milliseconds? This would ensure ISP FW is always in a working
>>>>>>>>>>> state when the driver is loaded.
>>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Actually, each time the camera is activated, the ISP driver powers on the
>>>>>>>>> ISP and initiates its firmware from the beginning; when the camera is
>>>>>>>>> closed, the ISP is powered off..
>>>>>>>>
>>>>>>>> Hmm, well I am able to put the ISP in a completely unusable state that doesn't
>>>>>>>> recover when I unload and reload amd_capture. Or maybe it is the sensor that is
>>>>>>>> stuck in a broken state?
>>>>>>>
>>>>>>> Here is the log output when I try to start cheese after unloading and reloading
>>>>>>> amd_capture, where the ISP is in the broken state that requires rebooting the
>>>>>>> laptop (annotated with notes of what I saw/did at each point in time):
>>>>>>>
>>>>>>> ==> opened cheese
>>>>>>> ==> cheese froze after a few seconds
>>>>>>> ==> closed cheese
>>>>>>>       [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
>>>>>>>       [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
>>>>>>>       [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
>>>>>>> ==> unloaded amd_capture
>>>>>>> ==> loaded amd_capture
>>>>>>> ==> opened cheese
>>>>>>>       [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>       [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>       [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>       [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>       [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>       [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>       [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
>>>>>>>       [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
>>>>>>>       [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
>>>>>>>       [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
>>>>>>>
>>>>>>
>>>>>> Thanks Sultan for the detailed info, I agree with you, tend to believe it
>>>>>> may related to the sensor, I will follow up with the FW team to investigate
>>>>>> further.
>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Sultan
>>>>>>>>>>
>>>>>>>>>> A small update: I reproduced the issue on v4, but it took several more cycles of
>>>>>>>>>> closing/opening cheese and waiting 30s compared to v5.
>>>>>>>>>>
>>>>>>>>>> Right now my best guess is that this is a timing issue with respect to FW that
>>>>>>>>>> was exposed by the v5 changes. v5 introduced slight changes in code timing, like
>>>>>>>>>> with the mutex locks getting replaced by spin locks.
>>>>>>>>>>
>>>>>>>>>> I'll try to insert mdelays to see if I can expose the issue that way on v4.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Could you kindly provide the FW used?
>>>>>>>>
>>>>>>>>       commit a89515d3ff79f12099f7a51b0f4932b881b7720e
>>>>>>>>       Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>       Date:   Thu Aug 21 15:40:45 2025 -0400
>>>>>>>>
>>>>>>>>           amdgpu: Update ISP FW for isp v4.1.1
>>>>>>>>           From internal git commit:
>>>>>>>>           24557b7326e539183b3bc44cf8e1496c74d383d6
>>>>>>>>           Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>>>>
>>>>>>>> Sultan
>>>>>>>
>>>>>>> Sultan
>>>>>>
>>>>>> -- 
>>>>>> Regards,
>>>>>> Bin
>>>>>>
>>>>>
>>>>> Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
>>>>> could be due to the driver. Also, the problem happens outside of cheese for me
>>>>> (like in Chromium with Zoom meetings), so v5 of the driver is pretty much
>>>>> unusable for me until this issue is fixed. :(
>>>>>
>>>>
>>>> Oh, really sad to hear that :(, there must be some difference between our
>>>> platforms because we still can't reproduce the issue you mentioned, to help
>>>> on this, would you share more info like your Ubuntu version, Kernel
>>>> version/source, ISP driver version, BIOS version, .config used to build the
>>>> kernel, FW: commit a89515d3ff79f12099f7a51b0f4932b881b7720e.
>>>> Just wondering, if possible, could you provide the kernel image either so we
>>>> can directly test on it. Also, the HW is not broken, right?
>>>
>>> I figured out why you cannot reproduce the issue. You need to pass amd_iommu=off
>>> on the kernel command line to trigger the issue.
>>>
>>> The reason I am using amd_iommu=off is because this laptop otherwise doesn't
>>> ever wake from suspend under Linux once it reaches the S0i3 state. The keyboard,
>>> power button, and lid do not respond to wake up the laptop from suspend. This
>>> happens 100% of the time once S0i3 is reached, and occurs on the OEM Ubuntu
>>> image from HP as well. The only fix I have found is to pass amd_iommu=off, which
>>> other owners of this laptop also found fixes the issue.
>>
>> You're the first report I've heard of this.
>>
>> Are you using storage encryption or a storage password of any kind (software
>> or hardware) by chance?
>>
>> If you are can you please describe it?
>>
>> Also can you generate a report using amd-s2idle?  I don't think it's going
>> to flag anything but I would like to confirm.
> 
> The issue is mentioned on a Reddit post [1]. A specific comment mentions
> amd_iommu=off fixing the issue [2], which is where I got the idea to do that.
> 
> You will find conflicting reports about this issue online, with some people
> saying it doesn't happen anymore after some kernel update [3], and others saying
> it worked until something updated [4].
> 
> The reason for all the conflicting reports online is because this issue only
> occurs when S0i3 is reached, and I suspect that no one realized there's a delay
> before S0i3 is entered. Reaching S0i3 appears to take at least 60 seconds
> *after* suspending the laptop. If S0i3 isn't entered, then you *can* wake the
> laptop but there will always be this message indicating S0i3 wasn't hit:
>    [  107.428836] amd_pmc AMDI000B:00: Last suspend didn't reach deepest state
> 

It shouldn't take 60 seconds to enter s0i3.  It should be ~5 seconds. 
So are you saying that if you have IOMMU enabled and interrupt the 
suspend around 20 seconds later you get that you didn't reach deepest 
sleep state, and if you wait longer it hangs?

> I am using LUKS1 encryption on my storage (software encryption). However, I'm
> not sure any of my configuration info is relevant because I reproduced the issue
> from a live USB using HP's OEM Ubuntu image [5], with nothing else physically
> plugged into the laptop and not connected to anything over WiFi or Bluetooth.

Is the SSD a SED?  Anything for storage password set in BIOS?

> 
> I had the thought of generating a report using amd-s2idle a couple months ago...
> except I have no way to wake the machine from suspend at all. I have to hold the
> the power button to do a hard shutdown. I tried using no_console_suspend but of
> course userspace processes are frozen so systemd couldn't record anything for
> me. I tried UART over USB and connected the output to another laptop but it
> would only work for a few seconds right after booting up the laptop (could've
> just been because I was using PL2303 serial converters, which aren't so great).
> 
> I have also tried several different combinations of settings toggled on/off in
> the BIOS setup menu, as well as resetting to the factory default values, without
> any change in behavior.
> 
> I'm at a loss on how I can retrieve some debug info for this issue. :/

You are on the latest BIOS presumably, right?

If you schedule a suspend with amd-s2idle for ~10 seconds, does it 
reproduce too?

> 
> [1] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/hp_zbook_ultra_g1a_ubuntu_fully_working_now_or/
> [2] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd4cldp/
> [3] https://forum.level1techs.com/t/the-ultimate-arch-secureboot-guide-for-ryzen-ai-max-ft-hp-g1a-128gb-8060s-monster-laptop/230652#hibernate-suspend-and-kernel-versions-16
> [4] https://www.reddit.com/r/AMDLaptops/comments/1mmrlgz/comment/nd1xbtd/
> [5] https://ftp.hp.com/pub/softpaq/sp158501-159000/stella-noble-oem-24.04b-20250422-107.iso
> 
> Sultan


