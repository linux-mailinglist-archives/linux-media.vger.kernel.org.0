Return-Path: <linux-media+bounces-21788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F219D5B08
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E181B21D00
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5C118B486;
	Fri, 22 Nov 2024 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IrcpeEm6"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833431779A5;
	Fri, 22 Nov 2024 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264123; cv=fail; b=aD1eNwclbIMmMR2fDirACQl9pvsfRv3fSvZ2qxUu8VP9nCPrGQwbAIxD5RXK7N19zKZrUUaHxbl55XDhOXO9BUTxo9mZRUhG7zooT42z5vdWgsIpvV3Z+5rh+lWhasWfkpa3v1Ovndeq+brMHDLCRhsErzTAyZAf/GUDSpc7LMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264123; c=relaxed/simple;
	bh=Mlsnbpf8Z0+TMQtttrgCd78+Vfs6kTCEFWqOgdaXrEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WmSAa/V1254yIo2h2cy8yqttyqie/idizi7b6G4555SL3ZGiZ7Lu+eml0OrwFX9RR87Xuwn13hiwSaY9J/LxEfpkQwj8pKvRfy3aMHqYtK085R5QYb1jmKukZT4uZvq8FEv1tAgDuKuZrSr3TVxrcIT/JQUtOkuLBrKtnzC16G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IrcpeEm6; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF1YY5S2a+0T+ZymABfzn407CZbTmLwdzBsLaq4DMlmP6QxLuW9dpEbqES9kajaAGc2N6qb5gS7wkfDZ7yMJQpBdHk6QFT9UIdxhoceVyxmJ+REYahfgYMR2+yh2SWxJA0Dd4b5z+t0cRH0AecAJtqsb0XaYaRioFG1KuEyLUeJsDbmED1J2LCgaGZSxNDIroAByw2CZYPDaGcBYf3LYl19GQ6gvv4zTJC8kkNj3Ogv9ghn0vXVCHqZeqnFMW/HktJSjG4FJ1XnnS1KjgvrBfJDx0CgufJXBYC9utpWv/w4JLjtZfkofC2hPAIyHgdctXXQL9KvG0amN3vUSTaBxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2/n0HnLieqJYaoWo0ZA5fnIhi2KQGLuSqJHSRr4Y/I=;
 b=m3BGHdiDtFF8qkrW/7ebE2ue8juDnc3favoM2lURTSJ8AVG6fzrLH3kMI3+iCTh+cz0RegUM0cjtILYW4mqpWEQocpyHZjw3JPfZD3OZnxxHJhVe/KT4QklcnTRGhUebkbxQe81Qyl8TnxVPURml5zLyuF+gT44bwm49bqJXVnE8rtLjewrhu+tNAwz4z08Uekiwu2wN3uy/WQQxVnE2rqUVuFo5ICc3neLahwAt2+k/OFh/jbBCnNWQT4loTsxUH7EBeCNXMUSAoe70V+oTflj+WLRtGSz1VXL94ikV92kqmw2yH39oETTwjZZipOtimiSeRpfrPfcxLq0x726njg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2/n0HnLieqJYaoWo0ZA5fnIhi2KQGLuSqJHSRr4Y/I=;
 b=IrcpeEm6FbP04s7tCBrt1xiLFQTqI/qKe3D6xaEMkXcTtB5FUBiuzHqvb4yg3CgbcdFgs93tmD9cZhxC9ELuskwtXxPsp/ppVLjIEa2wa4IPDT2vqcnAlcV6Igv6ZgD5B3vUGW/Yl4kbjcbnTX3PeEYFDdEvTaE9YAWrdpIW/8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 08:28:39 +0000
Received: from SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899]) by SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899%5]) with mapi id 15.20.8158.023; Fri, 22 Nov 2024
 08:28:38 +0000
Message-ID: <9ecd7514-fcf1-4deb-aa1f-6f1d695d76a2@amd.com>
Date: Fri, 22 Nov 2024 09:28:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov5640: fix get_light_freq on auto
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, Sam Bobrowicz <sam@elite-embedded.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 "open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
References: <cb9f8aca1f07472d4c794cc66ebbde1977ee9e95.1732195934.git.michal.simek@amd.com>
 <Zz83Hh6gKCFkxWtI@kekkonen.localdomain>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <Zz83Hh6gKCFkxWtI@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To SN7PR12MB8101.namprd12.prod.outlook.com
 (2603:10b6:806:321::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8101:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 138a10a1-4b8f-4e55-bb60-08dd0acfaa32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkJ1QkxUWk1xdGU3cXErS01ha1BjaWdWNkVCUjBzR1pUT04xK2lZdWhSelRs?=
 =?utf-8?B?TnM0WnROejNIQmJkVG5hWUxOTlYyUDl1d1FLcWswaGhDYjFFdnozZmhoT3JG?=
 =?utf-8?B?WFhLWHJYK3UrNUs3V1QyNXhIby9iQWVlVHRNQ3MzbS9Tb3BRZEFFSC9kMXR6?=
 =?utf-8?B?em9WallJcHFOV3AxUGpkZ0NRTzBCdDlIT1liNnEzdktKQVNDWXZHVC8rcU5y?=
 =?utf-8?B?ei94RTVOWm03bi8xK2lHQUozZzVxUW5sK3pqOFNDUDc1dVFjQVBnT29TOW83?=
 =?utf-8?B?R3FHSU1FQXoxczlra2dUNU5GclFKaTlyZjlJVURxaFdIVWttTEVHZmFrQ1RO?=
 =?utf-8?B?WUY1NmFtMy9nNmI3dDBENjRCNDNXTzRPL2hYYVgxK1NvWWg1UzFqUHlIQURl?=
 =?utf-8?B?YytTUk1WaTFseCs0SHIwOFlyRDFXTXlHZmRqUXlGTnZhL3lxR2hFYkFKL29R?=
 =?utf-8?B?bVpkOTlsNzR1MituUzRKZTB6dWpNTk9aNEM5S2xsMHFTTTNuS3lFRDVXYVIz?=
 =?utf-8?B?dnc3dkoveVpQVTlVMW8yR1EyV20rZ1NhWWdHc1NZa1ZTSnk3dlF3SS9Tb1FM?=
 =?utf-8?B?YVdMbFN0SmRlSCswb3NqU1dRZjhYUkIxalZuakFWWHJ1MFRxNG5yVTdraFgw?=
 =?utf-8?B?ZC9VYzRFYyt1RTk3K3NVS2x0a0tSaGh5VVQyOTVkTmFyS2FyT2pYeHF6VnFY?=
 =?utf-8?B?bEpVemlSNm0rOTlrMm82TFdaWjQ1S0dmam1lQmo2MEpoaDdlK1hLNm5ucEh0?=
 =?utf-8?B?aVNWQW1WN2lnYVV4VDdPSk1WWkRLOVo4RnlUbmFBcVRSMlE2b0s3eS9hdWls?=
 =?utf-8?B?VTRIeFBSNXRBOWJ3U1FMRmwweUJTcEUyU2k1bVgwVGNIRXNnRlpXVmd2REkz?=
 =?utf-8?B?SDBhb0xNZ2h0c2ZuSm1Fb2QyZkNUbkVkSlVJbE9URzhLb3NGZERqNWF4R2tz?=
 =?utf-8?B?NXAwcGlDd2YzdHBlM2JOcUFSZGUvWFJaY2lSSXJlSmlSdHFaMHI4eEE5Y2Ri?=
 =?utf-8?B?TWdRdlgxMGVFbFRNODdOZzVsZitCd2dPNmlJVW1YTlpUWWRWNS9EVVk3MXg2?=
 =?utf-8?B?TlcxdisyNURtWUVqa0cxckM1VnBGdTVGaDEvVGd6ei9IMnVPeG1mbTBuVDhz?=
 =?utf-8?B?enlZd0NGWWRrVnMvRjZQd1Eza3drbGpNMGUwMjBMQU16YUJ4NU9FRGszSDRB?=
 =?utf-8?B?NlFMa09vVS9zUHpHSU8rMEVQc3kwdkJSTjFUYVdMdUVUcWljRnhFaWxwTHUy?=
 =?utf-8?B?RGJXd3Z5c0J4a1ZSM0pEMEkvbkVGTDNhK0RycHZjcmxtRmRxZXYvQ1AzTExJ?=
 =?utf-8?B?KzQzWnlFbWdrN2NoblFKWXMwcEpia1lkTE45M05EcFg3TGsvZ2diQ1dSbmdk?=
 =?utf-8?B?dkNzMTJscC9TcTBNODhTMEhLcmJiUnpVTzJTUlpSRERPcEx1V1UrZkRtM2FM?=
 =?utf-8?B?RGRmQUJ6dkQyL1dMOWt6YWtaWEY1L2NXQXdvZ3pmVkswbWI4Q3cyZFczYWYr?=
 =?utf-8?B?Yk91SWlOSXlvcWVHM1V3MEN5UC9aSG5KVC9mY0QxRWo3VE90eTNRZng5emd5?=
 =?utf-8?B?T29SUW9sODkydExxL20wdXNLK0w1SnpmSHB6Q2dzSGNlbXQ0UXNpOTY1TVlZ?=
 =?utf-8?B?Y25GRVV4Smg5SXdCbGk2Ynp2dDh1RmlkbVZINTlPUjZEUUxHMWQ2MU05c0tH?=
 =?utf-8?B?ZDdpSDBsNTlRQkJONHV5aUJReUkxbERNbjFrZUIxYUtsdHpsZnpuS0lnV0lH?=
 =?utf-8?Q?rIw2X/VzlEvHFCGCyr+0xxoPMOgiWrtGnzVeYLP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjlpcHNKcUp1azN2SW1PSW5Dc1FmWDVQRmVwL1VmRGFZYTZXeFRFOCtFQy80?=
 =?utf-8?B?eUo1MFppYmJScDFzYThZNXBjSlBFSTFMcWJqQnJzOFhNc1BrdXZjemtWQjRI?=
 =?utf-8?B?VVpsMW1tRHdQbmNUdUUxbXVLeGxxV1hDeTE3cUNpcytuTlR1SW41SDJoYWhi?=
 =?utf-8?B?M0hGZmJNN054d0Jaa0RkYUJLVVBXclJNNktOZFFRMEhYVWhvTHIzZUhNMkMw?=
 =?utf-8?B?VVhxYnFDL3hnQWlLQTRYNVBmbXdvZjJMMEFERzRDUGwwcUovSVlyQ2s1UGZZ?=
 =?utf-8?B?dkVlQjNmT3lCWnFXd0FKUmMzOW1tSkUxWFU1ZEdpbFZpVWlNVDFrS2E5ZWtp?=
 =?utf-8?B?QVdETzY2NUJaTnZxbWhOSWhGdk0zRGJIUkE2MVVIV0JSZU5EZXpIejlHMnFR?=
 =?utf-8?B?bWFxTnZNRVRCZ1Q1cEUzMnlPTFNKbGlESTZTbS9SalpoSktBTE9lbUZXSjMr?=
 =?utf-8?B?OC9wcU9wWXNzTUkvakx1cUUxcDF3S3ZaMlFVVS9md0RHSFNWbHlMS2xobnZ1?=
 =?utf-8?B?U3NLNEo3RUl4VmpxQzdjRjNUQjNoWUZWN3paTXRjaWY0cE5vOTZ5blRDcWhK?=
 =?utf-8?B?Q0NlVVozTVMxY1I5ckhVRTlMQ21BNURjWHNaL0tzL294ZmlHcUppdVB3dURU?=
 =?utf-8?B?cHE3cC8xd3BEYlBWWWgxVkNYRWtQM1R4WFNQbWlKS1pLUFQ5c0J1ZkowUFd3?=
 =?utf-8?B?eXhRR25BRHA2bXpBdkdUYlk0L2J4Ykx2a1hhQmUydjRLZmhIU0pwQndnWEp5?=
 =?utf-8?B?ekVuUFhFMm9xMG8wQ0tlQlRuVHcxR2pBeVlmVXp3Mm9wWnNreHliUzJSRktZ?=
 =?utf-8?B?YXMrNHZxK2JmWUZhOEJrMVExMWxmbVA2akorWFlwYkgzK252eUFOaHR2eSsr?=
 =?utf-8?B?ZEFJVUVERDNtOGg2Sk42RmNHTmgvbmhnM0pWTmZCVmRHQ0N0N1JzVFMzZEw0?=
 =?utf-8?B?SGlCclppKzJscGVyd0VDeVlteWplNmcvTG5rOUpGUi9vaUE1SHM0T1p2aFhk?=
 =?utf-8?B?ZjR0ckhNV0pBV2xvajM4SHZydHVTQmtpbzBSeFJUQkpGM0VjKzhSK3YvM2tV?=
 =?utf-8?B?aFVwelhwYWM1Q3IvUlEvbFIwdWdVdmxKdndKRXM3ZHR6ZnhkRlQ1LzdUSU1x?=
 =?utf-8?B?Z2hCKzBQVVFoWEJVU1hRc2p1STlGWkhPbGhmZ29vWHRlQW14YUdLbFlqeEJy?=
 =?utf-8?B?OWVXd0VNSWNHamErbGwyV1orWEtsSERac2M3Z1JDdEZ4dXhneENYbnUvTW42?=
 =?utf-8?B?T1FVbTZrdXhQQ3Y2YnBSOFNNUHYwcXNHeWRuS0crMmJCVUR4YmNCb0t1ZUZS?=
 =?utf-8?B?YWphUEt0MXlDTjVVa2NhNkxZSE9rdDA0THkwaXJiQjJtamIrZFA3cTR5aFpv?=
 =?utf-8?B?QWJOTmZuNUE1NjVKTUFKSzAwcEc5cGJIMVlueHNaNXVqSkJIcTR2M2lOUDNl?=
 =?utf-8?B?Rlh0cis0VkdhOXdNYkN0S2VpcmdkVUNQTktYN25uMTYyc1NYSTRHZ2R1NFN6?=
 =?utf-8?B?Q0piWEZiKzJwZHpqZ1dnT2V1a1k4am4xYWttNlpsV09OakhiMXFWQ3Z6NlBa?=
 =?utf-8?B?WE1kdDRxMUJONVk4QnBCN3N5OUF3eitLeThVY1JKU1JpMGdDbU43TnRWVHhK?=
 =?utf-8?B?MGNZYisveTlncVhLZzBmcE1TMG51cm15ZTBUQ3cyYkU0OWkwS080bUxsWWdj?=
 =?utf-8?B?NGFGNXhqMUlrbWt0V0o0dG1YdWFLb0MvTTBOZnZPQUtzaEtJQVpLMGFjaEM1?=
 =?utf-8?B?L1Jzb0NaUmxoS2kxK3BNTkJtK2dKUTMxblFSV3Z1bml6eWNkTzhOVWZreURl?=
 =?utf-8?B?ZkdtRmoxYkNYelo0cTJ6NVVGc1BpY0N0QXpFSjdmNGRZQUFlL0g5TGk2Q2J1?=
 =?utf-8?B?MDMzUHkvZFQ0VkI0Z1V0Q2h6V05uMDFsT3RnTU01Q3FPRE9SYlZ3VFVWUnM5?=
 =?utf-8?B?TGM1a0NNVEdkOThvU0hqeC9Ualdaa0ZCa1d3bDRqYm9wV3hoSU51WllIVkVK?=
 =?utf-8?B?ZXF5cnBVYXUyQ3VCNEZYQ08xMGkvcU00RGF6dW1WSG1IbUs4ZEYvOWl4aDdn?=
 =?utf-8?B?YVF4K1FRdjc5cnBRTEFWb0R1TlYzZDNEOGpyMWpjclZ3U3Q3M0J1aVN6Vzlr?=
 =?utf-8?Q?+CmNNc8WwnHyw5rHh2xYPuTuj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138a10a1-4b8f-4e55-bb60-08dd0acfaa32
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 08:28:38.7584
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TY/huB+AJtzMtG76wTouqCYnbbEh8TIFJg20D26fZr6I7jZ1bLypg5sBZYMF4DtR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329



On 11/21/24 14:35, Sakari Ailus wrote:
> Hi Michal,
> 
> On Thu, Nov 21, 2024 at 02:32:16PM +0100, Michal Simek wrote:
>> From: Sam Bobrowicz <sam@elite-embedded.com>
>>
>> Light frequency was not properly returned when in auto
>> mode and the detected frequency was 60Hz.
>>
>> Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>> ---
>>
>>   drivers/media/i2c/ov5640.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index c1d3fce4a7d3..8566bc2edde9 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -1982,6 +1982,7 @@ static int ov5640_get_light_freq(struct ov5640_dev *sensor)
>>   			light_freq = 50;
>>   		} else {
>>   			/* 60Hz */
>> +			light_freq = 60;
> 
> Any idea where this issue was introduced?
> 
> It'd be good to add Fixes: and Cc: stable to this.

It was there from beginning. I have sent v2 with this updated.

M

