Return-Path: <linux-media+bounces-36032-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA6AEA543
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4083D17398A
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341BD2EBB85;
	Thu, 26 Jun 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="V7xFuwdt"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A8339A8;
	Thu, 26 Jun 2025 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962128; cv=fail; b=cAuNYS23HiUDCHhsHRhG/G+MnblzT5R/BvhiTfGcnH6v2qv0vLQUW3cKJrlmSoVTeUW/Q3o7/094Wn1Ts5qOmgLdcvrag0GaYpRFPfmgRdmp2WmKbBzWJ2nAgB00Oi0EDwgDkDxKZhvu8OTEkajbhByAMARZJvv468rjw4pKVrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962128; c=relaxed/simple;
	bh=Y+sfUMPNLsdADZw1pvgZA8b9K1nae+ZHBhtLTgbn8L0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GKz+ecXuAJnXM6Lm1pxJpcAsUoNPwHIbXFBJPIwo4eh56YGJH7lt7YGRRWxKQS15Bnz78hzZDAL1f60onGjaVL0jJ5TTRQpRTQ0vLdjnKx4BCXNEg/57v0D4r80VoWMIFG9fbI8LCbdc+aiWgIQf+eWVYNieKXIuXvpLw1muxo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=V7xFuwdt; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/ND1rnWyY7ocHdBkcEJmvqNMFTWe5mZhU7sgJhwd7vzTNY++LLTpK/cuVPGEFG1XQPo8T1QMVISBgKdfFvJGKse18Ryu9Qjm5T9X8SQwiYzzbx3Xxm3UoahsWzHwjgOftrzgjfVqlRdJ22AplhIEH9ig2H4TaiOZfZ9MEUl1fSBDvo7+WQAsFnb2KgF9IE9AQch/r6v8Z8cPEupr0AGtccTnZjmOuQma5Cb6DCJC6j8pqe20wckSnF1uCZ9+9GsgmCkHrUrVS9fzFFpH5Gy/9ISTymfDsfS/Jr+dwUwjcTZtywd2puYgnbNhnPoHu+rDpym3SxUbUcQuqdT6bnWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqWaS1X+W1Y7RebMyJXfv0yNsndEgTaAPJvQ+wCJDBI=;
 b=YAmw2uUSqQfyjCMya8x8Uv9QXBeWkcY5pZESvZnizYYoZga7E9F1ITlOFylHgsJoXcjAqYi6CMw1smhBkaJHgJ0XiOOgGhnLpztVSii4GsvHmRiYnR87Ymvv0+wSWxUy8gmHQfdQfv+VIPZ2a6Pj96GVEe6W0z6nqUktMbXuGoAB5zWFUlrXEUqZ9Iy0jY+Ytl2XExUdgg//xSmO73Nc1cha0Djc5dqVUld+LcUMXRPM9Kka9NlkCOagzWtWC5ZKhmAtdT+qeecLNCSe/SSy+jFQt6te0h+HrcZKcjXuC6HzkLp8qx97uBMW/nv1uyzgnYPERzhv2Y4AU52+818tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqWaS1X+W1Y7RebMyJXfv0yNsndEgTaAPJvQ+wCJDBI=;
 b=V7xFuwdtJoMuKetqhnhigMtckv+gq/36Bn36zhfPnAhPxrmU5AcWbVEQTGtfQeCrW+pWQEPEb/4siPWBkOIQt6uFt3l6w20PUioPp9qNlM74ich8fS34JZzZXX/+4zKqs5MLUfJOnj+rYafw/JX0WJItDc/md5KmFyzTBpnKBME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 18:22:03 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 18:22:03 +0000
Message-ID: <f59e0cdd-e41a-4865-8f11-9508b598e6b7@amd.com>
Date: Thu, 26 Jun 2025 14:22:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
 <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
 <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
 <20250626122306.GI8738@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250626122306.GI8738@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::21) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 081b3e19-51ff-4a09-d8df-08ddb4de594e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eldZamRxTmt4UGZuQkVsazd1V1MwM2pvSDF3d3FmeDl4UEhDUGVnazk1c1JO?=
 =?utf-8?B?Zm9aazM0N0MyV05CM3p5MFhvbDU3NklHNGVkWE1icmhNRDQyd05RVFRPNWFM?=
 =?utf-8?B?K3o4a0JHekpoSHZkeEs4RmhkejFoUXU3by8vRHdTNG4rcmdQQk1lYjhkL2o2?=
 =?utf-8?B?SnZmaWpsNjZ1empPT1hHVmI4eDZmbkZpYzBPT1Y1d2dnV3JWSm8rZnJSRE9m?=
 =?utf-8?B?RVV0UnNpRVJ2RjFEcDJ5dGRwTlZ6NW1sa1FidE54dG1JN203R1h3UFg3eExL?=
 =?utf-8?B?REovclB6ZTZ6YTBzS3hLR0w4N0tycEpCTEUyUXo1WDlOL0tXRU5PVWM3OGw5?=
 =?utf-8?B?TDRzOU5rRXdURStvamV1SWNGYk1HZmxDenRUNm5hYzRMT1lYYTJmWEJpVFBK?=
 =?utf-8?B?V3Q0UVprYmxoSVpBVmQwOE56bzVUVHZBL3YxQ05nalkwMU1YZkdpQ1FjWDVr?=
 =?utf-8?B?SEFHcjMrQU1FSWVjaTVYUlJSOWwyb1UyejFNWnRwd2NhSEdGTzhrSEVaME8z?=
 =?utf-8?B?YkZBSWJYM1hXZmZIWGVadjNBR0xmZjNWa2RsZ3B4c2R2OUs0M2RMOHRwTzVN?=
 =?utf-8?B?RzFWTFY1Y3c4VUdTT2hBRkVQYnZUMmtWSXNKNzRFSVdEYlUvZlJWbUFCa2k1?=
 =?utf-8?B?a0dONkllTWJBTHRyWlBZYWVCZWsxRGhuSDhqUy9OeXpFQmV4dEFUbUd5ZWt5?=
 =?utf-8?B?di9vZktXTHBsQSt1aTcwdk1IWDZiandLQjhuYlNkRUw3UFd1V1gzbUFHQXNm?=
 =?utf-8?B?cVFhRzVrZVZmRXFRc084aTNzUGMxeFVHVGNLVWtjbWo4QnlvQ2YvN1ZRcVdB?=
 =?utf-8?B?RUwxbjlMY2QyQ0pRRWlXaDU2UXBiMFd3eDlFTjZ4blRjM2lWRDRTTzZuMlc4?=
 =?utf-8?B?aVNkTTBkRUs0M3g3Wllqd1hWQ2cxMFd6VDhXbmJBRis5Uy8zWjJnck51YTNZ?=
 =?utf-8?B?ZDBvZ2pVQ2FJY2tQYk42QzF1TURWeTZzcWRHUTRmcHpEbFlrQWMxWnoveVRv?=
 =?utf-8?B?ekZtTmtuZzNPeFNVTmcyemxUVlU2RWQ4OXlpbzBOVk1BNjJGdnQxdDNJWnh1?=
 =?utf-8?B?dVZyZ1BWSTgwTE1VcXFXaUhkZzVwN0dYQi84TnhZOGVRYWV0QlhFSVhKbHdk?=
 =?utf-8?B?RzE1bVNPU1cvK1lOeDAxdG96cGYxMUR0YWFNR2x3TmdoaTFXWkhsRDhpbkg1?=
 =?utf-8?B?OGhHMnRPWDg3czdxMlVQQmVsZjBFeGR6OC95bTF2MzdQcml6MFNZalRZZGlL?=
 =?utf-8?B?S29VSFZpSExzSm8veTNmZEtOL01HdkJpdklUK0ZKcmI1c0k4RFBmbEE0Ull1?=
 =?utf-8?B?TWd3NGRwRSthZG5KU0daNnlIa01RcmMyc1QxbGdxS3ZKL3V4Vm9tMm1oUW4w?=
 =?utf-8?B?R21xVW1RNTF1VmpVbSt3Tm9odzhUSWxtRWJPL1p0eVlEb1BJRzhQOFBnc2dv?=
 =?utf-8?B?SjRxclNPeFJPYmx3U0NBbE5mZVg3YWJhanhCZnI2b0VhTk92NitHSWk5WU9R?=
 =?utf-8?B?RlZJc0dxbVk4S0lFQ0ljL2FvVDZXZ1hQcVc1UzZuaUtPTk1hVVBTL05Jb2tH?=
 =?utf-8?B?V2JSbEV0QStPMmdtY0d4a2RKN0htSHN6ZkxXTnRjSXJHNlY0YU5rMCtzcjha?=
 =?utf-8?B?Wnp4ZHd3eGt2d2NyNmdnb1IrNnk1TG0yK0pIOU1KQTRJbUZZSUYwMldqdnZt?=
 =?utf-8?B?SURvZlBySVBBZmloakdXZTlSZlRqSTJRMS9xSUtIcGl4U3pCRUN2d0h0cHFW?=
 =?utf-8?B?RlBRaWdsM3AyQUl1WXh0dzcvZDNBZHNPU241OE1VWkZTY0RoSnhQUGVQUTZI?=
 =?utf-8?B?Z0lxVlV0UzZjT3JtbXlKVmdjYUhDL3doNEpqWVdqSWZUd1JWSmFwbGZ3cFhH?=
 =?utf-8?B?eFp2YkpQYVNwQU9lSVBUWWdSUGJ0QWJoQ3gvS1hDWFpEWHQrd2ZmWVFWVEgw?=
 =?utf-8?Q?l9NnXxHexhI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzJ2dXRqUUdaRC8zTkZmdmhyd0hGUlVrTXIxdUxvQlNJWEJYMzZGeVV6MUFt?=
 =?utf-8?B?aSt1UU01TUZRaXFhTi9hRCt4MFp1VHkwMnZadFY5SlV1NmM3VGJ3R29kQ0lV?=
 =?utf-8?B?L2kxMzZVdjM2Rk1rV3RxTVNKL293SFRJZWh6OGo5MDBjaHl6Z2RaQ3Z3NGp1?=
 =?utf-8?B?bGdqQ0tRenp4V0JPUlpiN0JJY1FEU0NBdzloOVJGOXZxald6VExsMEV5Ymda?=
 =?utf-8?B?SU4wYTlCY28zOEJsOWpER1p2TlQ0UUdidlJxd0JNM0lEdWE4ZjBCNXYzckYr?=
 =?utf-8?B?blpOditySTRzd0xmLzVYTzJpNGI4VjhTK0U1V3p4clYyOUt0WjVOdkJkekRY?=
 =?utf-8?B?NjhxbzBIUWMzL3dFelVQUllobkMvZVJ5MXdNSGYrS1luUGcvQUVhNG9peXhv?=
 =?utf-8?B?eE9veDhpTWZ2Ti9XYVRrd3l2K3RxTU9EVmZjZWhJblRHWjNjczBlUkVjZk1p?=
 =?utf-8?B?aFR3UnRlb3VGaTJUZmlIdk9sQU1uY0ZNcVBVSDlhYTRybWtKMCs1R0pSVlFU?=
 =?utf-8?B?cWc4c0MxSDhlNGNjdDk5ejR2SnA0eHRHT1hxYW51OStOUGxDNmRjaHdoR21n?=
 =?utf-8?B?dlJMTjRFaXZCdDhXWS9yN3g4NkRldENJRFRpc2lnMDYvS2U0N1NFa1cwbENY?=
 =?utf-8?B?ZTRTdzdkVEJoeml0SnNJSldIZTJpVkw5eGh4Q0l0QjJSaHFmUzFWNkNUZ1dr?=
 =?utf-8?B?SnJ6dXRPK0lnUHB2dGF5UStkb1g5MEl4eGUyTFpHMTlSWE8zaWRkSkx2UllG?=
 =?utf-8?B?SlRHMStkYXlmTDZGMlRXUEczekYzTGQ1aGJqSjk5TmJib0wzTzhuM2FhY3BN?=
 =?utf-8?B?UkZ5dUhKbVVSTVA5OW16N25PQlZTNVlkdXJYMFBaQW10UHgxUlpMVUJRNzQy?=
 =?utf-8?B?Z3ZPaEZGbVRhaTc1VURlT1prWFZHanpqaTQ2NlRLU3lQZXlyQWExZk1lQllT?=
 =?utf-8?B?aDhYazdpSVlWN05BNXFhekUyUUtkVk53dUw4cXR2cTZqSit3Wkd3dHU4eTU1?=
 =?utf-8?B?Qy9aSW1iK3U4SUJtTHZwc2N2eVJBRWJOQTUwQThxRnZHdkRYVlRiV3FDK09n?=
 =?utf-8?B?MExyT1BKeDRiODhFc1RCR2craG85THdydndPMFA0cEdhR3pQR0dKS1IwTkRB?=
 =?utf-8?B?d1l2REdadVVHL3hsc3JIU3V4K3pEQ3FFWllCUXBmdUNYNGJEQ3lseGEyOHpV?=
 =?utf-8?B?UU5Ib3VHVllUekpWK0NBS244dmNkSy9TZnhEN2RhUzBrRmUrYnU3eGxud1Ju?=
 =?utf-8?B?NlR1bjlCYTBvV3IzcmdOUlgvQW9wN1dab3pteXdDL2drSUo5NlJVVDV4S0RG?=
 =?utf-8?B?KzBoNVdtNGp4RlIwcHltaVhGU1NqakxKTGJGMEgwY3g1SFcrL1c1bzNZODFR?=
 =?utf-8?B?emM5RWM2RzU4SE1HZS9wbWZwYUNyRmc3cjhhZ01VNWZCN2lHUXRzaENsTGNM?=
 =?utf-8?B?OThDbVpIT0haYThUY05qaUJNZUM0S0RCbnhxR3MyK2Z4UUR5UXFoakpjUkVQ?=
 =?utf-8?B?MDVyYklMZjJGMUNObWRseXlMOWI2cHVWZDJ3ZnRmcXpMWkhnK1NPSklKdEI0?=
 =?utf-8?B?TmhvY1d2Snl6SGpiNmIydDhwOXpITzB5R3ZzTWlZbnFqeUZxbk1yV2lvaFhl?=
 =?utf-8?B?UzgzN1VWQTBBNGpaNTQwMHQ4ZmJSOVhVTHM1bFBYdC90QmNrdWMxcTNocjdJ?=
 =?utf-8?B?eEc4K1phVzNMQ25kWHhFNVBVcmliUW5HcGFlZm8xTmZJcFhHOHVsWnI0SXgv?=
 =?utf-8?B?RUt1ZDF4Q2xPUXhTSmdpc2NiaHFpMzAzMGtZMC9RMEVBTXFvdnIwM25lZS9V?=
 =?utf-8?B?Y21mUGNrSytkbS9TelozQSswVlpET2pjQmN4WFNYVndDSklpdlVFdjVjbmxy?=
 =?utf-8?B?aitTZXNreXNMc25uWlU2YWJyTjhYbGRKWjJBS0Q1M08vczJkc2F6Z0w0Yk1l?=
 =?utf-8?B?UHdhaUt1dzUxUjJpNzh2bHkxL0FSaHhmcEdBcHQza09JajZIb3JsdjFoRCt4?=
 =?utf-8?B?K0JtL2gxZ0NWdzRsaVlRUWdtaDFCNE9Ua0Z1SFg5bXpKdklReFZJSDg4RHh0?=
 =?utf-8?B?aVlPVjNqc0FVTHRnb0FybzNLcFZxbGdxakxwQ0ZGdVdVd3B6bDdzL0gyNFlL?=
 =?utf-8?Q?RwdJvM/hHFWjWTsvpCPWr0p19?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081b3e19-51ff-4a09-d8df-08ddb4de594e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:22:03.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ebJH16dNmqqm5oPcLGCo7xlFAF0+Qo4GphW47e3R4uABDJ2RrzHEgKOUFzl9Y94+tFafjlSUpVoOulGSQAf3QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164

Hi Laurent,

On 6/26/2025 8:23 AM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Thu, Jun 26, 2025 at 12:11:27PM +0100, Kieran Bingham wrote:
>> Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
>>> Hi Sakari, Hi Laurent,
>>>
>>> On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
>>> [...]
>>>>>>> I think it can live in the driver for now. Given that the device uses
>>>>>>> only 8 bits of register address, I would store the page number in bits
>>>>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
>>>>>>> available for driver-specific purpose.
>>>>>>
>>>>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
>>>>>> bits are plenty for that. If we add pages to CCI later, this may be
>>>>>> refactored then.
>>>>>
>>>>> That works too.
>>>>>
>>>> Thanks for your support. We will add the page number in the register
>>>> address 15:8 or 11:8 and will update the implementation accordingly in
>>>> the next version.
>>>>
>>> I would like to share the approach we are taking to implement the CCI
>>> helpers that support page value. Could you please review the steps and
>>> let us know if they make sense or if any adjustments are needed?
>>>
>>> 1: Add new macros to embed page value into the register address.
>>>
>>> Ex:
>>> #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p <<
>>> CCI_REG_PRIVATE_SHIFT) | (x))
>>> #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p <<
>>> CCI_REG_PRIVATE_SHIFT) | (x))
>>>
>>> 2: Create V4L2 CCI context. Initialize page control reg, current_page,
>>> regmap etc.
>>>
>>> Ex:
>>> struct v4l2_cci_ctx {
>>>          struct mutex lock;
>>>          struct regmap *map;
>>>          s16 current_page;
>>>          u8 page_ctrl_reg;
>>> }
>>>
>>> 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle
>>> register read-writes updating the page control register as necessary.
>>
>> Out of curiosity - but couldn't the existing cci_write and cci_read
>> already be used by the users - and then the default behaviour is that
>> the page isn't modified if there is no page_ctrl_reg - and by default
>> CCI_REG() will simply have (initilised) as page 0 - so the pages will
>> never change on those calls?
>>
>> Then the users can indeed define
>>
>> #define TEST_PATTERN_PAGE 5
>> #define TEST_PATTERN_COLOUR_BARS BIT(3)
>>
>> #define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)
>>
>> and can call
>>   cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);
>>
>> with everything handled transparently ?
>>
>>
>> Or do you envisage more complications with the types of pages that might
>> be supportable ?
>>
>> (I perfectly understand if I'm wishing for an unreachable utopia -
>> because I haven't considered something implicit about the page handling
>> that I haven't yet used :D)
> 
> I don't think we should implement page support in the CCI helpers
> themselves yet. We have too few drivers to look at to understand the
> requirements. Instead, I would store the page number in the driver
> private bits of the 32-bit address (that's bits 31:28), and add wrappers
> around cci_read() and cci_write() to the OV05C10 driver that handles the
> page configuration.
> 
> Once we'll have multiple drivers doing the same, it will be easier to
> see what requirements they share, and move the feature to the CCI
> helpers.
> 
Thanks for clarifying. I agree it would be simple and safer approach too 
to handle this way. We will add the following macros in v4l2-cci.h and 
update the existing wrappers ov05c10_reg_write() / ov05c10_reg_read() in 
the driver to retrieve the page and register values to call cci_write() 
/ cci_read(). We will add new wrappers too wherever necessary in the 
driver (ex: wrapper for cci_multi_reg_write() on replacing CCI_REG8 with 
CCI_PAGE_REG8)

#define CCI_PAGE_REG8(x, p)		((1 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG16(x, p)		((2 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG24(x, p)		((3 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG32(x, p)		((4 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG64(x, p)		((8 << CCI_REG_WIDTH_SHIFT) | (p << 
CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG16_LE(x, p)		(CCI_REG_LE | (2U << 
CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG24_LE(x, p)		(CCI_REG_LE | (3U << 
CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG32_LE(x, p)		(CCI_REG_LE | (4U << 
CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_REG64_LE(x, p)		(CCI_REG_LE | (8U << 
CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
#define CCI_PAGE_GET(x)			FIELD_GET(CCI_REG_PAGE_MASK, x)

Thanks,
Pratap

>>> int cci_pwrite(void *data, u32 reg, u64 val, int *err)
>>> {
>>>          /* get v4l2_cci_ctx context from data */
>>>
>>>          /* get page value from reg */
>>>
>>>          /* acquire mutex */
>>>
>>>          /* update cci page control reg, save current page value */
>>>
>>>          /* do cci_write */
>>>
>>>          /* release mutex */
>>> }
>>>
>>> Similar steps for cci_pread() as well.
> 
> --
> Regards,
> 
> Laurent Pinchart


