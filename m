Return-Path: <linux-media+bounces-50772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA6D23F72
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CC98301F3C5
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538F436BCCA;
	Thu, 15 Jan 2026 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CyRILCYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15D11CBA;
	Thu, 15 Jan 2026 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473389; cv=fail; b=TCUPBj0sfMHuwEhvCCutJ0SbdOdlvC4TYTFNefhw/lRkFqBiVtYyFEShdVrdaHDikjAfLfKQ+cDER6/XLutCSlkX9Sy3jM+9e4KDJZTNvVH7s1HCDiz8nT96BVd3DbQJeOLWvO2DUHwSB8tncp1g6O4Pds/y1VllOq18KnTAmls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473389; c=relaxed/simple;
	bh=1hg6L6CwoumfnVkb63RRu1vq2jqRRGI5v/8mZ1IWl04=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HrawrmZuS79Ro1fqlbhRrNULUf+y4NcJa02CEAVzueLIM+xoAkqim9s8bWdLiEVOsYGMmcUTHCTnJc94tiG/wh5svRFNTFSdYgAgCy04rFb0FHt9RJk/ksT4nVT9kjwKulrCKqfYOXiaQCpIpHqb7nv2tZaZRBVvXcy3txRI3uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CyRILCYJ; arc=fail smtp.client-ip=52.101.85.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiO0/wdNLF0MjZyOYlYpqI2x22gCf3IXsJgS5VVWUu0V53yT7II+MmiLAJ8MlS775SRbCWomukTb6NUY5ekywHTTv70VhopaDmGK+WvRuWZJsZ4MpH1Y/fC5qOr1IRQuvywUvXJ8wZcVuGk39VPJOBWsvw5DHqQ+9apJSLbRVBJu1EUcNEpI6ad84UC+SVuY+zdJ7VGsv5EEtIIoMF3ijzZ1xezoO0rOyh8hbiW3GZo5KWH1VDiWv8tqfyKdTIhG02XBMHdITe/588e2kwq3evVrJz7k68joj5Euztjz92bhitjW4ETd8YdBO8lNeDnwORHdsqlhB2WhTWIVO1WDiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgZ8YbAotpTJrZmdxVXJjGSmdb4ijnrH9lkweTrLLDs=;
 b=RwdlrdxsbwjRELmEdj/WP1xmEQrUAAxhImshhHnGstuM7tExrIIuzEeEMjGUh9SVn4Dg/7wTVReffoSRKEdpFRahBHi1V1O1D8aVXQw0sHwKd9aJTNiEKBDfgv/xF6WtLsjPeRYy6wJlXyj0RWX6v9OoSiztyG9bMvnOBbKmrTQdf7kF3LrIuJH3jhFfaqJ2cqEdWnJ0teVfdZphaEcil/ac/MdrBRhF7xn+4+vMZBh+wCYY9nXihsbD6wBhq/4tgo5u2Gluh8ENnbzybs6p+Grc1Al+TJVbIMMxZFTyOfDrIwr872VSLOBFgZVTC4Nb6USogiWwFimFERSVDXKK/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgZ8YbAotpTJrZmdxVXJjGSmdb4ijnrH9lkweTrLLDs=;
 b=CyRILCYJtc12w/sCTGhm/l49ckY+DfIeVKsmakN3mtBmnlkNjALKxqmBbydrFNcqM01BkUlOQqHBp1m9fs1QgBJ/kvfW+5byyZWvxyP4QfQjnYxfWWak4zjHYjBSWra2UL6wu7kFlnb8RbKntso3kkBPANxzVwAoQqV11lYPyvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 10:36:26 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 10:36:25 +0000
Message-ID: <61888c27-6280-4a3d-a6d4-f5ee9cefec36@amd.com>
Date: Thu, 15 Jan 2026 18:36:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, mario.limonciello@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain> <aV4MYcgdOviulN3E@sultan-box>
 <aWgEtfp1MWioqKox@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aWgEtfp1MWioqKox@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SJ0PR12MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: d600f671-0ca1-497a-46b9-08de5421eecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFB5WFFqL3N5R1ZzZGRMazBSd2FxM29tY1BoNjNaYWpUbEs5MjZhU3RyYUUz?=
 =?utf-8?B?QmdGTGQrb05OemRMczdKbFpFenRtV2pMNGtFZmRtNTBHSUVKUXo5bkZ5RlFM?=
 =?utf-8?B?cmxYamZ1ZWhrMlAzbjhWRTJNS3o3MGZGRjhwRUJOREpucTEya2RUYkkyQlB5?=
 =?utf-8?B?ZlIwcWd4d1owTmF6anZXb1N6djMxcGhPdi9Gb0dQVi9HaDc0U3NWcTlEY2s3?=
 =?utf-8?B?OUxNOU9aUDFFZ3BDbjllNmpwckpMTVpSVlhaSmM0L29Nb3Zhak94Y1ZDbDlj?=
 =?utf-8?B?WU5nVmY0cGluaEZJTm4xMkZmRjN2L2Z6b1R4Y09HMWJaSDdjL09neUM2aGZG?=
 =?utf-8?B?bXRNdzYvRUlRUzJVTWRIMjJmek5FdGpwMFl2TnVhNHJXV3I2ZVg3Um1BOGhB?=
 =?utf-8?B?NGZSSmt0czBjaFN2UW9ISnE2dXdoSXBWaFdsRk95blQvQllCaGRycWtXVHZ5?=
 =?utf-8?B?bHpUTnlnUEhub2s5UEZCdzlrMkZoeDh4UFVhbWxpaHd5Q2NOM3NWTTN1Wksx?=
 =?utf-8?B?U2VVbkFjT3gwdS92SFZBeGtrMElyN2trb1YySUowTVFHNVBzSGt0YWpkTndm?=
 =?utf-8?B?S243WDhITk5EdEVUb2c1ejdlTVQydEkySjhISE9OWlJsMGg3Nmp3WnNmTnhH?=
 =?utf-8?B?bnlZb0FOdVZ5M0FnZHpVTWV4WkczaGVzQS93NUtwQ01oNmU3bTQwQXBSQ0Fz?=
 =?utf-8?B?MFd3VzZGTEJEY2hHcGZmMVJiM1RIdEJCZVdHSTlaN0hKZTV1MkdyNDFucmVz?=
 =?utf-8?B?Yy9IVDZHVGNLZ1RLVmIxN1Z3d2hQYituVFh5MzNzMDdyRUg5MnBEV0JZUmhK?=
 =?utf-8?B?bVBpV3lxa0xkaTJpNDdxVWwwazRrUzhhaGM2NysrYWdFeTgydEg4QnlZTmpF?=
 =?utf-8?B?c21VbHpyVDhCcmIrQXdIWmYyWDJrc2J4VHFEU0xEYW5xb09kc1RXZlhaNmU1?=
 =?utf-8?B?OU91TmR6QzgzZ2Q4M1RFRUEybWJ2YmQ4YWpiWm56VksyTkxZRW1wZTdjU3Js?=
 =?utf-8?B?cHNzRVhYSXhncDRUNDZLb2Jld1RCMkdWYkRNb3J6RnMzRisrbVFwTnFLaXRL?=
 =?utf-8?B?Mk9qaWpWV0xZY0lWV1N2MkE2aUw4cE1rS0lMVnBFWXB3akdRS0VpRDQ4L0pV?=
 =?utf-8?B?T0V6SWFWUERpN1JwekZyUEJlRzd6Y2xVU3VXTWpmVUNPRHBqR0c0dzdvdG9i?=
 =?utf-8?B?dUZWanN6d3NVd2hRaVpTd1dsWUcwaEFiekU0OVlITlE0STlMQ1hSWHlYdkpa?=
 =?utf-8?B?akx1YTFlVGZpdk9HK2VqRnJUS3EwajdGU1p5YTJ5MnRrQ2tBSnZPU1R1bnlL?=
 =?utf-8?B?c0R1MXo4OU9qR0dlNmtNek9CUk5yeXUvVHlBUEt1YTVBdEkrREJ6cGRVVjMx?=
 =?utf-8?B?clZoay9lL1Yyb2t0WjdkWFpWcHNZbGttbENYNktkWS9ONUpzUDV3cDRtbkxt?=
 =?utf-8?B?L0JyRTUwU1lueDdOT2lDZ1kveG9nWitqM1VvellpL0JwdUZMY3M4dHg2c2U3?=
 =?utf-8?B?NjExTUU3Y1dGVVFjK0Z4bHpVOXRLQWhncEQ0Q0p3ZGJ1cDFkaG5aUm1XUmw4?=
 =?utf-8?B?UDVmMmtSQndjbXFtOVVjcnJJL1kyRGRsRFlVdjZ2QVJ5ZHhTdWpKdGsrbzBy?=
 =?utf-8?B?MU1NeHd4djJJQ2VYNFk1Vk5EemFDUDJTTWpkMGd4cDJldFI3Y0Q5S3hucXhS?=
 =?utf-8?B?anNxWjB4NmF1VW44eThSZmhOMHlaUXVGUk1USE15bml5bzU4MDY2SXpuWUk0?=
 =?utf-8?B?VXNCSHR0YTZTejdmcjROUERjU1JRUHlqUmcza3o1U1d4SmhwbldKRzYzRWx3?=
 =?utf-8?B?MFE5QU1jdHNXcmdHRzhOQWUvNEJFS3NBTnMwdXV6RnVjMlFGaEpxaFNONmRK?=
 =?utf-8?B?WG9UQTg3LzNIbTN1MGpPNDhQWHhUdGFVbDhYdFl5clI4V1ZxQlpsZ0Z3T1RM?=
 =?utf-8?B?b3ZlOE1yZENvUm1ZVHY3QXZ4bXBiWC9CV2ZseTlCOFlFSkxwSnRBNXNFeFJS?=
 =?utf-8?B?clJMYXVhM2VxeFFKVXYvNXpRRWpma1NDVGEwVEJaZnNVZC9mVTBYbTR5RHlr?=
 =?utf-8?B?K2xpZlVqNGpEWHNvTm0yaXZ4TDRHTnN5M2FCdjRtYjAxamtLY3hnK3Z6KzVy?=
 =?utf-8?Q?ndn0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTlFRzlMeG9OM1lDYlMrWVVEVGJMVThJMW9zTW1SOUxzL3BoMEt4L0JCY0sr?=
 =?utf-8?B?aEl0WWJ6SDJzR0hjamxieWtuSzdLSm03TmdQVUZEdWZqZzQ0a3UxSkZLUnBu?=
 =?utf-8?B?UkFBMTVIdjdMdXVHZS91clVPRmtmZ25RMGRuT0lTZG1FTWd2UHBoMEpBNEt3?=
 =?utf-8?B?b3J1SUo1UUxURWhZUFdBN0h2aTVaVVpycnk4S0RESkljUk9nNWZNbGhFOEJs?=
 =?utf-8?B?Y3AvZEdEczNsUm5KVEhhVWg5Y3UzazVySnZzdDI2Qy8rcnZBb2lzVzJSZDBh?=
 =?utf-8?B?V1hXU0pBZmJzSGFZQ3pRNFl0VzlMN0VaSjN2aUd4MGtKcjk5VXF6d1RaVDlG?=
 =?utf-8?B?UHpDTGFjaWIxdGRwdWNyTms4ZUY3aDV0WVlkWWxua1F0Y2lJUjRMZ3d3U1dU?=
 =?utf-8?B?SktvMC9xZXBJT1NHa2VkWDNYZjIvdkk3WlFrczNkdU03NzM5M3JQempoVTdB?=
 =?utf-8?B?UzRIdEtZNnNjK3Y2VjR4UFZkRUV6b3p5eU52VzRQVjh4Nm5MeUF3SEJLRjQ3?=
 =?utf-8?B?VWpqSk1iZjJxWGxTR3dXZzNYTGtNQ3NjN014M1RCQnJBeDV3OWFJNFF5aU1R?=
 =?utf-8?B?dSswTDI2aUducVJwTk5oR1pIbE93NnZQWm9NNEJZTUtpMUpuQlplU3QwRGFW?=
 =?utf-8?B?eHJrTE9YM2dhUThIall2ejZJenlKdnNpVm5LbVZQNkt4eEFKdEhHOWlsbVQz?=
 =?utf-8?B?a2g0cEdwV1M2U01GdEgwdGNmamllL3NGaVBYY1V0Q2N4QVdSNnJURFQ5SjNu?=
 =?utf-8?B?T1I2cEt6RDlnRC9yOWtkbjVuaUkxNExVRlNrU2VIaVVmT25YNlVwNUtpWkw1?=
 =?utf-8?B?SUdKQnNtY1dBV2YxaUdnVmRIVE1vRDQ5MDNBVUh3cmt1SGEwSXVBSTVodjFp?=
 =?utf-8?B?bG9tZ0YveTlreGhiMllTemRoa3ROSjFndXFObHFpVXRzdUFBYnJOd2dlSWhR?=
 =?utf-8?B?SVhpRENEejFSQlpVQXpaN0VSUEhYTy9Fak10Y2IxTlRGMit5UWZtVy9KNXR4?=
 =?utf-8?B?T1ZvMjVUZFJtY3F2YmZtSWlMMllsV2N0Y1dpSWxBS0UzREVJTVBTeTRJVTVQ?=
 =?utf-8?B?MlFabWVLdnJ4cjJIR1RyOVZrMVdzRUpwRk9Ob1BHQy9Lekx4bFlCL3JHbHli?=
 =?utf-8?B?TGZiQWhWNVZOUnhjRUZsTFNoMkxtcllUTnl5dlg1UEVMdFJaSnJudXRKcFcz?=
 =?utf-8?B?WXI4a0RtcWNXc0dIemRsaWM3bHg1cGQrenlUZHUwc2diYXpJVGluODFPT1JM?=
 =?utf-8?B?TFoyenlYQ3BxN09NcmU3WndyV3M5SlJhRzhmQWF4Nk5Dd09scVRIaWc2QThU?=
 =?utf-8?B?NTU3S0xtZFhJKzZFWndqbWJ1eGY4clhOdzcwMDM1Q0NQbURwdEkvU3djbkd1?=
 =?utf-8?B?elh6N3NhNVJkUFpTczk5WGViZW1Hd1hXcnFhWG5ZZmM0TFBNeHd3a1R0M2FZ?=
 =?utf-8?B?cjZTUVJPOC9nMFFjbHhHbURQSEdCTE5VTDE1djhLUWtJT3FLNUw4UXlDbTU4?=
 =?utf-8?B?bEVDaUNNY3VjU1FiWWYwc01SeVEwVXZ3QlZYSTdMS08vTnBibi94d21DL1Q3?=
 =?utf-8?B?eXhydTdLd1ZOREk2UnN0dng4cmc4KzROWmg3aDZQR0U5Sm9aaklLYit2aUlv?=
 =?utf-8?B?VGp6a1MxMVpoaVZEWUZMek0wanJRaTV5b2xKdlNDbUd5QzluT3pDTEduWlJY?=
 =?utf-8?B?RFlmRmdicGdRY09XaFJHbFYvRVR5NHo2NmtXZ0NQR0tFdlhyQ0ZNWW9YOWJj?=
 =?utf-8?B?QVdsVlJ5UDhYRXNFc3hNUzlkWis4R08xZjF6SzZWMEwwVFZreUVaUkxxMVo0?=
 =?utf-8?B?NE1sTU1ZMmE3M2lSSHZXeW82c0FOV1NnWnlrc2hzMDZjMmg1YnB4TUc5Skhi?=
 =?utf-8?B?L1NxRk1OeGZKWjFyMzVRM2UrdG9xelhGdjJuNkM4UTd1dnZuaHo3SlZmVGhK?=
 =?utf-8?B?blliVWpITm5nRHF2YlZBRkZqanhEeWpMYVUxRWhuOE5jTmVWc3hOU0YvTHRY?=
 =?utf-8?B?TDNvZGNNaWRBOEFCR0g4b1VHWVRLNFZxbmlyQkx0c0x1S0pyRWU3RXZTc0VY?=
 =?utf-8?B?cGx5VUwrd0kxSFBVMWs2bHBpMUpPMjNEbG1UZ1FndndUS2hiMk9sT2ZQMTdJ?=
 =?utf-8?B?S2JFU3c2NkhWZENlVzFqQXl0Mm5wWWtITU5hdHh5OHJmNVZZU2Y4bkpaTlk2?=
 =?utf-8?B?ajRsZ3JBemxLK0lhUm5yVjhoRzY0V29zWG5MQk9qZmRKWEZoVnpwV3FpNVNn?=
 =?utf-8?B?dS9oVFllWjBhT1B2aWxWME5MUlhZc3lqaHBlSjJvRm0yM1JqQkQrMjhmOThQ?=
 =?utf-8?Q?aJ30C0sVU2TDPgVgUB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d600f671-0ca1-497a-46b9-08de5421eecb
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:36:25.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhZGfamlsvGdh1ti44dnGQDr/XD0YmLxDvSreZnlvpIymcsrIF7lhmDTvV0nWJ1O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008



On 1/15/2026 5:03 AM, Sakari Ailus wrote:
> Hi Sultan,
> 
> On Tue, Jan 06, 2026 at 11:33:53PM -0800, Sultan Alsawaf wrote:
>> Hi Sakari,
>>
>> On Mon, Dec 22, 2025 at 12:11:11PM +0200, Sakari Ailus wrote:
>>> Hi Bin,
>>>
>>> On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
>>>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>>>> capture video node, and supports only preview stream. It manages firmware
>>>> states, stream configuration. Add interrupt handling and notification for
>>>> isp firmware to isp-subdevice.
>>>>
>>>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>>>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>>>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>>>> ---
>>>>   MAINTAINERS                                   |   2 +
>>>>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>>>>   drivers/media/platform/amd/isp4/isp4.c        |  99 +-
>>>>   drivers/media/platform/amd/isp4/isp4.h        |   7 +-
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 975 ++++++++++++++++++
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.h | 124 +++
>>>>   6 files changed, 1202 insertions(+), 8 deletions(-)
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index cccae369c876..48ffc8bbdcee 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>   F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>>   F:	drivers/media/platform/amd/isp4/isp4_interface.c
>>>>   F:	drivers/media/platform/amd/isp4/isp4_interface.h
>>>> +F:	drivers/media/platform/amd/isp4/isp4_subdev.c
>>>> +F:	drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>   
>>>>   AMD KFD
>>>>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>>>> index a2a5bf98e912..6d4e6d6ac7f5 100644
>>>> --- a/drivers/media/platform/amd/isp4/Makefile
>>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>>> @@ -4,4 +4,5 @@
>>>>   
>>>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>>   amd_capture-objs := isp4.o \
>>>> -		    isp4_interface.o
>>>> +		    isp4_interface.o \
>>>> +		    isp4_subdev.o
>>>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
>>>> index ad95e7f89189..bcd7cad32afd 100644
>>>> --- a/drivers/media/platform/amd/isp4/isp4.c
>>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>
>> [snip]
>>
>>>>   static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>>>   {
>>>> +	struct isp4_subdev *isp_subdev = arg;
>>>> +	u32 intr_ack = 0, intr_en = 0, intr_status;
>>>> +	int seen = 0;
>>>
>>> Is int appropriate here? Should this be u32 or u64?
>>
>> ffs() is just a macro alias for __builtin_ffs(). The parameter and return value
>> of __builtin_ffs() are both int.
> 
> Ack, sounds reasonable.
> 

Thanks for confirming, Sakari.

>>


[snip]

>>> unsigned int, please.
>>
>> As mentioned above, ffs() takes an int and returns an int.
>>
>>> The parentheses around ffs() appear redundant.
>>
>> The parentheses are there because it's an assignment. Without them:
>>
>> drivers/media/platform/amd/isp4/isp4.c: In function ‘isp4_irq_handler’:
>> drivers/media/platform/amd/isp4/isp4.c:106:21: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
>>    106 |         for (int i; i = ffs(seen); seen = (seen >> i) << i)
>>        |                     ^
>>
>>> The increment could probably be expressed as seen &= ~BIT(i).
>>
>> Yes it can be, but it adds several more instructions before the loop body,
>> without any improvement to the loop body (the sarx in the loop body is replaced
>> by andn). The right shift trick is faster and this is a hot path (IRQ handler).
> 
> Fine by me, it won't make much difference in practice either way.
> 
> ...
> 

Yes, both options work for me either, my idea is to keep it as is and 
add the following comment.

/*
  * The operation `(seen >> i) << i` is logically equivalent to
  * `seen &= ~BIT(i)`, with fewer instructions after compilation.
  */

[snip]

-- 
Regards,
Bin


