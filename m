Return-Path: <linux-media+bounces-35711-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF3AAE57EB
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 01:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F13F9188E372
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 23:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D311B22B8C5;
	Mon, 23 Jun 2025 23:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ME2kDLoS"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7901622A804;
	Mon, 23 Jun 2025 23:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750720883; cv=fail; b=S6kx+JoMKhEuKmMWW2W/xminNO8aZLe3wTHWaoEZoHE7BH9pHdvkYUMFDFnDOjNp6gSiKWbtPjL0RSGaJWQdd5IaEhyR2AEIysOl0bCDPPeC54/xhv60Y5JxX9533fFWX0+l66IPGsWjOqG78GFwkR9SB7VJLrWpDFCcrlDWHCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750720883; c=relaxed/simple;
	bh=YMOTWK5e7fokOajhUrdoZ8SL/k+gDHjg/rQb+jthGiU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nIvk7Cr1f5rBx8N1f+MqyduJAyVjzd9r0puwsXZz03DFD9oYDpbEQ0WPHsUN2vkOT+uU+0FgL3K8OU2+8uSh3Qf+rJA11/n8QSSI682W551Rnz14nsuIQxZnC9K+FsLJEGl+DGopHBULf7QHOE2nlUtrsYUH9wsiJmuoJWlHQYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ME2kDLoS; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXpQSWVBCOKZyg4MOqBmH+j7MvtyZo3paEtBhyklqU2UidEbt/8ZpNIa/lchNdJCXvuQ0dGuXRocfzq+QxEhGZZJh4pvpS/qs6ubhdM10SpxJtq6StNv60JhptqmagHNeL0B0FKJkQYZA/g3oD6MemsN3PCzGc9I0eWsKByrF5CW96CpoTSeCfbipN5QmTQkW1ANrhGT9uj7SkrjWRwCzIpX7t1Ujyc7v1W0oeSUJenbWL2VbRhJM2XAffULOKw0LMXNxYMSJ/Jkd8FlMYiJd66S2pmfOI/5j62CC8sG34jfcQ/ppxXF0LTtfQHlp5ujcHLo64qyymVf4mlWyWONwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWkUJUmgoY5V9ArOfQyyN1ubHcC1nIhujDYZtR2i6AI=;
 b=rSV/+dMknrq899kfu3jgKpj8RwHnpD/e+0rUtOvl4ZEmXxFeiAoWjQ7gAc90E6WH0bRKcK2XyBdF2ahn9EfLSV3ZtZADgNtQfD8Rb8wHyGjGXM9j/i38cviUNx8XvGXzdhySu7QJJc0KzwFPeg89+wo4wTjfVieepBYk5Xa1gt/pOmsEEpQ7R3nM68VctezrJnrBUQanMXWKaqh9tmCgiqmZYIpnMKxux/VcoLfeANgpgxcanK1gRvSuy5elrDZASxYD3eJNECbCmTPpkBnB7SO4REbWfOjbFhPmWHV0rtnAgK69fI8+Txh/fdOmyqAta61rgZnvqLeycOVp5z94Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWkUJUmgoY5V9ArOfQyyN1ubHcC1nIhujDYZtR2i6AI=;
 b=ME2kDLoSwDry5PCqUaykztH5Mrd069hOJWL0EYStiALo6ioXdZ1yFUSqp+rNFP8x/9Ds/jxLMrDowKGB3EiW81X3F8JaUG/Dx4lexlWiyRWrmf83nDLLnQrUWnbFJq5rjROJVs5H21Oi/CC5pdey3gkAAJVolpEXfdwW86fDJxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Mon, 23 Jun
 2025 23:21:17 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:21:17 +0000
Message-ID: <aa7c7270-e870-4613-b447-b2d4a2b8e892@amd.com>
Date: Mon, 23 Jun 2025 19:21:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
 <20250623220612.GB15951@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250623220612.GB15951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0012.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::25) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5cfcfc-42b8-49f0-b701-08ddb2aca7a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dW1QK3dKcWxxSkg3dGdkWktGTWRJRERjOTBwTjFTOGpxWTFEVjdBOXVjSUV0?=
 =?utf-8?B?NGltZUtJSWRRVzQ1aVk0b3B0TzFBTkRUdXJXenR6dlkwMi9XbzZlck8vTXFX?=
 =?utf-8?B?SzlhTU91NnZ6RXE3TUJibER5eE5HZGhNTVJWUXhQZE5RSUxLNUYwYXF1VTF0?=
 =?utf-8?B?ZWVtcDROd3V6R3plRDk5dkpHYmxWenl5YjgzQ1hMZFI5MFl6QkM0azFoTE5N?=
 =?utf-8?B?dVBZQVh4NFR2RDNUdkhwN3BZRStjditRNWVWQnpuTjdQSnBxR1NCZ3ZrcGZC?=
 =?utf-8?B?L0hIWVlRcGNra3pJMXVxMG5zVGJFNjlhWEJVckdBQkp3V01rOTR4MEtKSjN6?=
 =?utf-8?B?dlQ4aTZydHhFdWJZU1ZmQzdhRkIrbHpvbU8rZzVRYzkxNHBsRDNCQjhhQXdk?=
 =?utf-8?B?czdFVktROEpzb0RMUXVvaXN1bkJ5aGVNYzlKMjgyMEhpQ0V1Y0txZmoxdmt3?=
 =?utf-8?B?MnNFd09LYmNFbXRlbDh5Q3hmZ01SVUhyNlBGT1JuOE1sNUlwUGpGMTBYd1Jk?=
 =?utf-8?B?bVBuckM1VUZsRDN6Rzhtb0hSNWNtUldnaUVkK3lrdWRvaGpMQWNKYlI0ZGRS?=
 =?utf-8?B?VEpoNkYrMFVsdjladFFmRDYrYmRxM1JrclVQelVNNXN3Y2lTa2Fjb3FoVHlD?=
 =?utf-8?B?bFRmWm9PS0VKU1BPR0MyWHcrRkFFNlN1UmpZY1IyMFY0ZVJJcEsyZmZLcW00?=
 =?utf-8?B?TU4wU0kxVGp2UmMrSk43MUkxckJGL3o5NTYwWS9iZDZUd05mQ25qeFpoSWhE?=
 =?utf-8?B?RWxhOWpBaCtvUlpDMENGVHArNGQ3dFlEcStlRCtZQ2ovMy85cExGTTh3SVlR?=
 =?utf-8?B?dVlDQ3ozUkkwYjE5c2daVHNnYUNqcHptdFpRMEU4K3VpQ0ZqUytJQnJ1QW8r?=
 =?utf-8?B?RDRCK2t0WGpLQTZnZHZCR0lGbUFFQVpST2QwMmF3SHcvUnZsRW1CN0tzY05S?=
 =?utf-8?B?NnMwdFRoQk9xdDJLMDJwZTRsVlJlY2tvd0hDY2dVbHE3TmdNM0pkN3dJcG4y?=
 =?utf-8?B?eEwvZWxsT2g1NTdUTUFId0lhUXNsYlc5Z3ZpRVJPS3BhNHZJRVRWTU5WS0Fk?=
 =?utf-8?B?RGF1V2xNVXBKV2k5ZGdZZmdObHozY0tLaVpVMHIzYWc4U0ZnNE1lSHExRlUy?=
 =?utf-8?B?VVJlVFFuY20vVWlOZmtzeElQT1JuUGdLWmJkYzBTc1B4ejcyWk1DQW4vbWg2?=
 =?utf-8?B?V3JTdnQ5ODQrai9Sb3pPZHduUFJTVE9kWG04bU9rN1N6bHpzNCtFdlNRa2tL?=
 =?utf-8?B?elBwdXY4akVUb000ZmJtakFNb0Q5bnRIVnZxTk9VRlhLcmI2QTlLRmszOXAx?=
 =?utf-8?B?MXNZQWJ4dzZTN09JaEJYOTRHU2xxZWF5TzFEZW5Xa3JuQzA2RjlUZDhzU0xl?=
 =?utf-8?B?OGNxWW96eVdvaUk1RCtqVitaVndXRytLemlsaFNkejBUK3R2Y0ZydGswWmRu?=
 =?utf-8?B?d2Y1Um5WZWIrMi9pMkt2TTQzNUx6cndCR2NHTDJ1UitqbTdpZDNFRnVCU2o0?=
 =?utf-8?B?bXJkck5XOXM2dS9NTFl3ajVSc2JrK0lkZWg2NDV5cUxQbTVMTktiODhwRk0r?=
 =?utf-8?B?MVl2dkltRjBiWnM2VVVOY0Y4aXptMjV5dktnSHpuUmROdzhWdnhOVWE2Um1Z?=
 =?utf-8?B?Yk5Cd2QyUU01N3AxZHBhTlFOS1A4VzMrSllxNllQekl1SUNWNXRMU1JGYkdi?=
 =?utf-8?B?ckNuZDM5Nk45TVFGcXRjWkR4UnM3OXhqSGxpR29COUU1b2NzdmxIQjlVMnQ4?=
 =?utf-8?B?andUaFVkWnpKc05CTldIRk9oa3U2bStwNkF3b2lsZjB5ZHJlTkp6ZUZhVWtK?=
 =?utf-8?B?cXFqbElHQis5RUxHcGY4OGFzSGNROS9WeGhoa1JWVjQwdzlzZGNBQ1gxWU1u?=
 =?utf-8?B?WjF0UHBFL1pMcWhQQ2VIQ1FXaDVaSFVxbWJ2OEVTdE95M0t1ZnU2MmhDRCs1?=
 =?utf-8?Q?WwObHdCZKzw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0NVWnFFTFJ5ZHJDUHc1ZTlnMjQzWE9EWE9WbDRud1Q1WUErT0RoTEV5QnFH?=
 =?utf-8?B?YUh0cVZnbTRoTDNBa05VdE56bDJkWnZ2MWVGbGJPR3Z2SHNkREVML0IrUTlQ?=
 =?utf-8?B?OGZpOVRwTURxeEVSUWV1VXNhTGRWamNGQ20yNS93cFNncGladXpQTDlxTjh5?=
 =?utf-8?B?cStQUjgydjdORzJIT1dwMEsvWE50WUdXVWExYnoweVRMbmdDeTBpMzZMUkxi?=
 =?utf-8?B?QTFzVnpZMG9BYWhvSVR0K0xDSFVrZFRjWXEvUVNWZnhFV0M1elJpM2xucFVG?=
 =?utf-8?B?SlFzLzlFenI2RUpIREtWNmNnaDdKYW5WSlZDSHJWZUpMcVJNcnJ0YzFGLzFH?=
 =?utf-8?B?Q2dqdlJlVks5elhwVkFaTUkwZ1V5TTd0Z29pYUFRWWJXMldJWXZlM0gyVUtv?=
 =?utf-8?B?NDdjYjVGb1dvSDZKQUk0N2R2b3N2QnZLaGNSTlNkNGxKeUpFUDZtS2IyaXY4?=
 =?utf-8?B?T1RqZDdsU0pQaEhWK1ZGVy9Ka01uNXREQzhqT3NXUDNHSGJxYzgxK01zSEVo?=
 =?utf-8?B?cExidWo2eC9wQXcwZkl4VEtBK3lSYmFKRkdURmNJaWRqZmdva1BFZzhWbkZ1?=
 =?utf-8?B?T2Rwc3BkR1hzemlyZVNqNjZLVjBJOFQzcVVwZFJoTzRHVThLV3dEZmQvNDZh?=
 =?utf-8?B?ZzNEdDdndGVRRUdWamRkR1ZQODc2aHZSZEwrdXhLd1F3VTJsYUNkZEt3Q29U?=
 =?utf-8?B?NkVkKzRLVVhSbU1qamtQeUdSdUt1LzJvZUlmL2hJYUoreExIY2g1ZzJ2Z3pB?=
 =?utf-8?B?aXgyUTlNRExBQlF2YTlHNHFsYXl2ejBvNm5HUzZKM0xKOTZ6VjQrWVI1bzho?=
 =?utf-8?B?SkV2SnlKUG5sQVgzMjJUNDJxaFFId1k4a0NPSjZ3N2NVOFlTblZWb2pYY3Qw?=
 =?utf-8?B?Y3hmSEJIWGpYQXpGVERJdWZ4WXByQUk0RG1QWi9IaHJHTGZzUVVjYklaVHZ1?=
 =?utf-8?B?dDh2bG9FZ3VXRmJuVzlnenlvdURnaldORU5aODZIM0JQQUpNd0JyVzJaTUhP?=
 =?utf-8?B?OFRxVklUb2xneUkrMmQ1a21KT1dLc0dlWlZBMFNVZ2MrcGYzMkV6ZDFjL29C?=
 =?utf-8?B?NFVZdXNIeG5XOGkyUmxtUWxjWk9LZUllUllrY3FsK2dvbFNuTjREaStVeUhK?=
 =?utf-8?B?VFpTNFAxSFJ4aC9GaWNIM25kdHoxSlYydzd0OGNmaVZFWVZTY3I1TitQeUYv?=
 =?utf-8?B?Y2o2d2hMeFJDaUg5SldaQTkvR0diN3JoY1JyeGVPVnh6SUN1RDZNZDhKcnNK?=
 =?utf-8?B?ZnkvVjlYUWMzU2Q3cjMrL3FUVWVnVkdSeE45SU5wMmgrMVdzWlhYVnRDK2VD?=
 =?utf-8?B?MDNNd2FVY2JDcWhodXdvaWU3VGFvTDJTSDgyd0NvWkxCV1lXSTJpVDRHM0Fl?=
 =?utf-8?B?RmRaZzJReU9aVUJPNkFSRS81YmRYQWJ4QkJES3FXWFhmSkwyenBOZE5lMGZH?=
 =?utf-8?B?clN2VXNxMlA3bGkxMEdzSkt3OU9DcVBOUXpaOEdqZEgrUS80bjFkSk13MHht?=
 =?utf-8?B?ZmlSYjJHK3Q3VUkzRWJOZVVrUjYvVWQycTZhbXZqTU5lc2UvbER6dVJ6WUFY?=
 =?utf-8?B?dGFPNkpNU0Jodm4wdTdyUHQxQ1FPcy9laStYSkZyd3RONFJzKzBGM05ncGR5?=
 =?utf-8?B?ZFU4UFlGUU53eGVJcDArNEYwTkM0aU9tTW5CM05WWlZUYS8rdkhyUXFZZzZh?=
 =?utf-8?B?RmZ1QkdWSnZLTzVCaUxlYnJqSEdMTTRCR1c3c3FHWDV4b0xSd0MvTi9xTTJJ?=
 =?utf-8?B?ZXhwYSs1Sk9XY2pyYWdYb29FekZxNnZWK05vRzh3WmY1dmY3VzZrRElMM3Vw?=
 =?utf-8?B?dHJRSGU0Tnl5MFZhMktiL3RBSkg3VzVsU2g3RmluRTJtVDZ5ZlA0SEJKYVBI?=
 =?utf-8?B?ckR1RW5KSUVFQXRIamt4Wm4zanI5ZEpsTG52YVdPSFRpQjU4aVVRcjVsNE55?=
 =?utf-8?B?THlxd2lKeHRhdEtQbEgyZHkvbzB4UWpaY21nbVZ0RHVUdWVwSjZ6WERIaFJ3?=
 =?utf-8?B?UGJPVmhpWDVraDdoc0RJeWk5T0EyVkNiMTBPU1p6bE94SmQ2ODhmY2U5eXJr?=
 =?utf-8?B?OFRFWUM1NFN4c2Q0SHQvYW1jVzlTUVM0ZVBWT1NkY0M2QjY2clFvV3FUUWZS?=
 =?utf-8?Q?UmrhfOsv6+27BmMEEdohyM9M0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5cfcfc-42b8-49f0-b701-08ddb2aca7a1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:21:17.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4LAnDlZKfKvwGHzmsEtDi+Ojur+6FeJDOts5N86aO8jP25yozHQwtXdMkwQie1pFk4PZK6IdHbTHnF82DDFsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

On 6/23/2025 6:06 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Jun 23, 2025 at 05:55:14PM -0400, Nirujogi, Pratap wrote:
>> On 6/23/2025 9:42 AM, Laurent Pinchart wrote:
>>> On Mon, Jun 23, 2025 at 01:22:00PM +0000, Sakari Ailus wrote:
>>>> On Mon, Jun 23, 2025 at 03:09:29PM +0300, Laurent Pinchart wrote:
>>>>> On Mon, Jun 16, 2025 at 07:12:28PM -0400, Nirujogi, Pratap wrote:
>>>>>> On 6/13/2025 6:02 PM, Sakari Ailus wrote:
>>>>>>> On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
>>>>>>>> Hi Pratap,
>>>>>>>>
>>>>>>>> Thanks for your patch.
>>>>>>>>
>>>>>>>> This patch is written for your camera sensor module, which seems very
>>>>>>>> different from those already applied on Dell laptops (some of "Dell Pro"
>>>>>>>> series). Looking into the driver, I think this version will break the
>>>>>>>> devices using ov05c10 sensor.
>>>>>>>
>>>>>>> There never was such a driver in upstream so nothing breaks. However, in
>>>>>>> order to support these, could you check what would it take to support them
>>>>>>> using this driver and post patches, please?
>>>>>>>
>>>>>>>> I think this patch is better to be validated on existing devices, but please
>>>>>>>> do some fixes before we can do validation. Please check my comments inline.
>>>>>>>>
>>>>>>>> On 2025/6/10 03:42, Pratap Nirujogi wrote:
>>>>>>>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>>>>>>>> supports only the full size normal 2888x1808@30fps 2-lane
>>>>>>>>> sensor profile.
>>>>>>>>>
>>>>>>>>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>>>>>>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>>>>>>> Co-developed-by: Bin Du <bin.du@amd.com>
>>>>>>>>> Signed-off-by: Bin Du <bin.du@amd.com>
>>>>>>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>>>
>>>>> [snip]
>>>>>
>>>>>>>> Hi Sakari,
>>>>>>>>
>>>>>>>> Seems there are already several camera sensors using page-based registers.
>>>>>>>> Is it a good idea to add page support in CCI interface?
>>>>>>>
>>>>>>> Sounds like a good idea as such but I'm not sure how common this really is,
>>>>>>> I think I've seen a few Omnivision sensors doing this. If implemented, I
>>>>>>> think it would be nice if the page could be encoded in the register address
>>>>>>> which V4L2 CCI would store and switch page if needed only. This would
>>>>>>> require serialising accesses, too. There's some room in CCI register raw
>>>>>>> value space so this could be done without even changing that, say, with
>>>>>>> 8-bit page and 8-bit register address.
>>>>>>
>>>>>> Hi Sakari, thank you for sharing your insights and guiding us. Could you
>>>>>> please suggest if we should take up this work implementing the helpers
>>>>>> in CCI and submit the patch or is it okay to leave it as-is for now and
>>>>>> take care of updating in future once the implementation is ready.
>>>>>
>>>>> I think it can live in the driver for now. Given that the device uses
>>>>> only 8 bits of register address, I would store the page number in bits
>>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>>>> available for driver-specific purpose.
>>>>
>>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>>>> bits are plenty for that. If we add pages to CCI later, this may be
>>>> refactored then.
>>>
>>> That works too.
>>
>> Thanks for your support. We will add the page number in the register
>> address 15:8 or 11:8 and will update the implementation accordingly in
>> the next version.
> 
> The CCI private bits are bits 31:28.
> 
Thanks. Will use the CCI private bits 31:28 instead of bits 15:8 / 11:8

Thanks,
Pratap

> --
> Regards,
> 
> Laurent Pinchart


