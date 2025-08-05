Return-Path: <linux-media+bounces-38909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAEB1B183
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12B683AC23D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 09:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CB926C3A0;
	Tue,  5 Aug 2025 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j55tem/t"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F4E1D416C;
	Tue,  5 Aug 2025 09:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754387630; cv=fail; b=lo5+rJH6EoTwL9VkMc54HPQWIdc0g95AnTFQ0PVu5bwQO2to4xrd+zA2zOD/Idj+UGTIENddnahWEu0byt/R2xGXX5GON6ZeKwiCghW8lma8ijn3NDvlyKo7C3ej2qY4zS8f1LKL1iCk2uOxepCwF5YnlCuTmbuPQjKVYRc9Lns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754387630; c=relaxed/simple;
	bh=vEGlrVyajhbW976RRYGjQ7fUaMC91C0X/8Ya0epWi0w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a8usgSbPPUzqNIwIjrgnn4FIN5wumxdRTKTjTf9zYjpKFLxgeBuCuLY8FlAKg5jAL5XXNUC/NBC4ikHUKaZLhUbFh25uh3q0a0pwvw46D+QvLapkeLXeEz5eAJF6dx7ahdGOkdRaQUMK36305FOjQRc/YVfDLACVk8ka7WOurTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j55tem/t; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYnXymvhuEfDKIJHGxv3f/d8GxVdUHibfCSO4m12udFXZpSjrsXj8qd/rgxhQ45xi67mBsdlHc+D1zTQJxTTyEF0yBQAauE6VWVPioj5iamXFUyNGWno5whdwR9mOylcL6WDpJlfFEN+QAjKeRvYLgn+JDeDuiGO8FojORVoMQ+ZU+Wt27foppVkEY2UKe9J8c6qu51tbl6L66NIE8AWAZWPjtiLr6YFQ0UWUl+EuPXlSLMUcQmy0upUKL7E8rDpG6F/yTrHWAXCVRgSpyH1IXdmLGnSkMMH/L1A0mgnYXWYVsigqaqVe+uxB5C9R+doLYMNCXZ0srVbU3yGaj8xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbE9oN39SLVX0fiJr+xcH9NBg3Rm+t3OpRD/9cAB76A=;
 b=JaYuJ3D8tpYFrydUoKVzyUdqgxcEo+++Ij5evJ0pHzo2C6mFOC0DnIHuoC+d1dt2lwZxo7fiYFvPyNE+0vF+5EWgun8diGvWd05U33WaiYeIufEFedDxeFgCw/+fkoigN5iHRS/n5CsUrcH4Z6dJj0iMhis40GdsZnByBisINAQGWlRJ/1Fg0mv0iWEY5bp1I6pr0moKiTRKE9/ltghvZCTGghy2b00aGJTSyuWRWv2D6m0yXsh/SKWWpUJzy3NjW6z+f5CPz9pwW6+7n/NgPs8SiKH+gZcJhMKEsjs/VWtMEGcSZztyoyA35tTcy0GYkb23NL7ML2EtggqQrX+LNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbE9oN39SLVX0fiJr+xcH9NBg3Rm+t3OpRD/9cAB76A=;
 b=j55tem/tkenVksD0ALJyIckWSFecLRHpWoeyxSYqaf66lyFW78FVyTFEyKrHMqBvoU/iGIEaVTT3xkvwQBxJLrfaW10JcYknhT91cT+sNfR6/LtMgg3qdfzeXDYsN7BujhBeQ4slfe5pgHRVk1kCEQKM0cPJxHK/cHk2tvPL7GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB7439.namprd12.prod.outlook.com (2603:10b6:303:22b::7)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 09:53:39 +0000
Received: from MW4PR12MB7439.namprd12.prod.outlook.com
 ([fe80::1d2a:6c9a:5d46:f0c1]) by MW4PR12MB7439.namprd12.prod.outlook.com
 ([fe80::1d2a:6c9a:5d46:f0c1%7]) with mapi id 15.20.8989.010; Tue, 5 Aug 2025
 09:53:39 +0000
Message-ID: <87e27412-12fa-4c6e-b333-7e37077b2dd6@amd.com>
Date: Tue, 5 Aug 2025 17:53:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: platform: amd: Add helpers to configure
 isp4 mipi phy
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-4-Bin.Du@amd.com>
 <aIcZuj6wrekhaguE@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIcZuj6wrekhaguE@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To MW4PR12MB7439.namprd12.prod.outlook.com
 (2603:10b6:303:22b::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7439:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6cf2a9-9fe2-4fe9-c4ed-08ddd405f3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUlOWXUvMUppelhaQWRhWEMxODdsQ0tRa2tiTEI3dzFuSnhqazE3NFFsZUZi?=
 =?utf-8?B?NHVydFpPRXBXaFp0a1BmSnVIU3lac0pRUGZJYTg2ZHhzcndoOFhybzlDeFdm?=
 =?utf-8?B?M0d2WjhoUS9WWWUxWFluWGRBQ1RrbHBvY0kvYnhodGFxRk1xNDhwMnQ1S0lY?=
 =?utf-8?B?NGc1cy93WGo0c3JwQ05WOWdQNGFLYWhGdWg4a0NQbU5UYVNsdnVRc2JBQUJN?=
 =?utf-8?B?QjdwWWlDMGVlV2liZFZNUWIwOUcwMVVPcDhLc1c1MEJuZmYrR0hlekd6b0g3?=
 =?utf-8?B?am9sL3hhUG9wbng3TWZsMGZYOGFTSERVemFDRXJiWDdXMlJGRnVUTEVvdVpJ?=
 =?utf-8?B?YlVNRE5lLzNkeFRiMHUveEhSdEI1eUo0ZHNOSjhnSHlKTy8xTlNhV3Z5c0tL?=
 =?utf-8?B?TzNGUm82c0F2NjVuejB3VFFrU1lLTGR4MWJvUGQrWlVTcG5Kb0VXRURVU1Bv?=
 =?utf-8?B?bGRDRGdlMlZxWFM3bnZCb090NkdMelFKTHNxU1pnb2RiT2xicDk5ekhjeURJ?=
 =?utf-8?B?ai9OYUN1RXhBTUVQYm9OTTZ4TVM3ZXcwWGJPOUs3OUY4MXM4OGxjbnV6bHVZ?=
 =?utf-8?B?SFVqMmJLZDZnWnJoSFJFS3BBZlczU3hWbHV3K052VHE5Y3d3ZG5Ca3BoZytw?=
 =?utf-8?B?NXJVOUR2RENZVVhZaUY1Nk5rMUtyYnQ2aUx1K2NITmE2ZHRaSW95K2pMTXhj?=
 =?utf-8?B?RWZkeWZYcmhKV1NvOEZLN3hVZUJnanZPOHhxTitNSWwzQUlxMFdpWUYvbnho?=
 =?utf-8?B?NGlwZDczUlRwSzRuZ25PYTJ1c2Z0czZ1WkdJOS9LK0lIY2xWc1NVTGlVdDhM?=
 =?utf-8?B?U1dQa0lUVitZSmpOV1YzT1dRbk51aXdET2dUUGNRVnh3STBEN1Nsc0NQY2ZF?=
 =?utf-8?B?SFYyYXFLc1crRDdzY2pNdEdBWDRyRmxsUml5d0xhNlpuUTNtMFFtZkU3Qjlx?=
 =?utf-8?B?UVU4ODI1L3hQaExXT2twNHlXVVoxQUFBWGtnbFNtK1crR2xlWDRUTGNEYlVB?=
 =?utf-8?B?S1RXMjhjSnZ6NDFIQ3Y3aEZuMEhtU3ZiWFM2amR3MWhXZTR1U1h5LzhrKzBP?=
 =?utf-8?B?Wndodk45RkxVWFJqQy81UmlPaUZlakRJdFNZTExDejl6b01mLzQ2d0tzc2px?=
 =?utf-8?B?elVVazBaV3JBemQrMHc0N0pybVNDOXEvUC9kOXN6Y2pRYXRlOVhDdmIxaWY2?=
 =?utf-8?B?Rm1lbnNaU0RzRVBPRzd1OHBDdVEwdVZ2UVdhM1BydFNyUG9HR1EyUG8zZ1Zl?=
 =?utf-8?B?N2xKOGdvT0RYUlpiVUQyT09mM2RsNFIvQWZPQTJMUVRKZkhrTXFGSGpEeS9a?=
 =?utf-8?B?SUZkekg4emRHQ29hNExWNmlzU0hDMC9objlzcEpEUHNyRHBkU0lvS3A5UXlT?=
 =?utf-8?B?empMT2ZCUjRVSXRrV1Vvc1NpeVlWMlFQYXFDQWlQempGSGtoWGE3Z3BLR245?=
 =?utf-8?B?T2VEbkErOTNBVGFBWWdEbFZyanQya2hxV3BoUlBYY2VyQVg2akdqNDdzVWVa?=
 =?utf-8?B?aWZKb2tQd05iTGc2WHVQbFUyOFF3aUcwWU0wYTNGQ2MyVHUvbi85ckZRdXZr?=
 =?utf-8?B?QWlSK1Zrbi8ybHFTaTgxSlM0TzNWdXg1R2FRSWJyYXJGY3VFblFLNDVRWkRD?=
 =?utf-8?B?cGRpbUtuVWUzaHdMSVZvSDNrVk1FNVBBYy9xaVdYSHVzQnNsekdhV1ZzZEMy?=
 =?utf-8?B?KzgxL1gvMnJrOWV0NmoyMFVRVmlqSlViaXRVZjF5aVhiMEw4QVljdmw2VlE4?=
 =?utf-8?B?Z2ZRVGlHbTczRnVGbnZta0NCdjVVM0Znd241ZVp6VHhTUEhPNVRxSWFaNE5h?=
 =?utf-8?B?c29QbnZzMmkvaHlRMFJ6OFU0WjFadWY1enpjUENlVW94L3RJL24vOVczNXBI?=
 =?utf-8?B?cGloczhFOERtcElVTS9jVmdJMFNOT3VZWEZJb1k1b0NhbUtzVVJZeTdSTVZy?=
 =?utf-8?Q?90YEZBJQ1YQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7439.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlhBUWMyemFPYWNteE85T2ZXWjVKYzFUTWtETTVVMEl3K1pkajluUmhBUjh2?=
 =?utf-8?B?azQ1UXlUMncvYUl1V0JGRGFSc0lwYWNwTDJ6N29HV3lqdVYvdlc1UEpTYndR?=
 =?utf-8?B?TXpNVytHcHdzejlVSmR5V3RRdzNTMjBMVzlZUE4zcXo0N2NpMFJQMzJsZGdQ?=
 =?utf-8?B?T29QSXZSdk5oVkdIRk5xN25iQ3ZZclFOOXNnL2haaExsMytlNEtvc25uQW5z?=
 =?utf-8?B?UXhqRUxaVGVTRmRUbUJVZXprUTI3RFlpUjhNN0ZCQkl0VExoUnBtTGhhWnpD?=
 =?utf-8?B?NVdCVEo1VUFYVVRmT0w0UGJyQS85SzdDWHo5R1lIbzY2VVNGL0NlZHJCaHMr?=
 =?utf-8?B?RjE4QU5qeXJsaVBxLzRPT1A0T3ZUM0tXSFJDVjJaWGRidTkxM1QvTm5DalEv?=
 =?utf-8?B?MmFvbTl5Q1VBMnJpbzI3NmttQnZWaXEyUnQ5ZEtNb3p2K25HQWtGRDNUQ2hI?=
 =?utf-8?B?SVdjZkhEY203dW95ZDc0YVNqVVY3VVN3VWptdU1mS2Y2a094YzFDYzA5dmRr?=
 =?utf-8?B?YjE2azlUME1PQUdON09YWmxtNFFMc21PaEI3UHNRUXUyTjdsZ0lmOHh0bDZR?=
 =?utf-8?B?b0ZxVVZNaWhPWWFCYTZnMlB4NzN5c0I2WENKcFE5QStrTE9SN2pqbDhvaUZM?=
 =?utf-8?B?SitUVXVNMDdpVE1nWjlKNmdDNkJrNXRHa25yK1M5QzFHNnRWbmpIb0MySU40?=
 =?utf-8?B?dzVkQTlUeHJPQUEvN21DTUNwbytLZzFGbkRpQldjOXVRS0ZCSzZ5OVhFNjZ2?=
 =?utf-8?B?WmJXemhBMnBGNCthT2tQanZWY2xrUXVoQ0xrZUN3Y29tWW5OcE02aldBV212?=
 =?utf-8?B?MzJ1dmthVzZYcTJJZGx1cS9EV3k2dWczT1NUZjZFZnJVYVR5N1RXY1I0SUQz?=
 =?utf-8?B?VFhVV2MvVzVWbWVmQ0ZxVGpwc3Q2a05TanFubUdMWUc0WDJCL0lUNDZEczNL?=
 =?utf-8?B?U0RIdXJXZXA3SEhCNlE5M1lzQ3g5UFFWWGNidytWdXdCUFNrWWo2VVd1QXNT?=
 =?utf-8?B?QVlIVDJkYmlYS281alpFWXFKOS84R2cwUEpvd3Bkc0puWlFtRVBYT25DZUV6?=
 =?utf-8?B?UDJCSTFEdi9QTmM2RHhncEhHZjVhLzBYckhRVUk4K2RIWm9OcjJmbGtDdXJx?=
 =?utf-8?B?aTg3Qjk0UXZOOGg0bFRiUkJza2VVaHV4QytiVzNVUjBRMlNwa04rOXh4aEsr?=
 =?utf-8?B?M0xwMXZkWWpibXpENVhjaysrcmVwbzZKNE1zbFJMbzk4UkRWV3NkbEV0aWRa?=
 =?utf-8?B?WFhSRTRuemhtQlplcjJSYXVBK05tR2RYRkpFejMyMzBXNllISHhvbUNlS0hF?=
 =?utf-8?B?WmczQzQwSkh6NmhtbGdlWGZkN3A3Vk8rSEFuUFhBbHBBbmVjQW1YenB6WWtB?=
 =?utf-8?B?ZnVJN21rWG5iNDdnclU0bVhFbUw4dE5zaXJoelNGQTQ0UDhBeHNRTE9kMGZR?=
 =?utf-8?B?aHhJWHlLdXBQSE05WGUyS0NlUHJwckhpaVRiUEVURW9KNUQxNk9WNExVQ2dj?=
 =?utf-8?B?OXoreVNKcytDWFFZZ0VUN01LU210bXRrNUNON2JaZTFoSUVqQVFXc2NxMFBH?=
 =?utf-8?B?TnlxRjhlSlh1d2ZQLzdCNHV2a1FLNkl5VE9RSDJjd2RpQzNHaEl2NEtrWk9o?=
 =?utf-8?B?V2kvU3U0TkNOYnJLR3B1U1plMHIyb0xrYUdlZWYzeldjcHNUZGxzLzFMVmtU?=
 =?utf-8?B?MTBtdXZhczFHajd0RTJEanZMQ0luMFpIWUQvU20xQWx3WEdPK1d0UmZITWIy?=
 =?utf-8?B?cndjN2VpbjJmOURsM2tkQVlmdWlNT3J5T3poeklWbUV6TTlNaGF0b3c4a2xW?=
 =?utf-8?B?N2ViRkdsem9id2RIRmV6aXM3T2dhUnRvSFNpbFlJRW5NdXByWDRmcUlPd1RV?=
 =?utf-8?B?U2JwVi9oL0xMWUpNMVZKc1VKSGx4dklJQjdVTGhtVnkrSk56SlVGKzAzVnFp?=
 =?utf-8?B?RFZUSzlCTjlBRElNbG1LSTMvZVpjTWx1VUlYV1pWbFFRQ0oyR1Jkd1VMTVdh?=
 =?utf-8?B?alNva2lwYkJyV1lMWjRoMW42YlFaQW1nWTEvZWswcUNOYnlmZFFwRW9CZlpO?=
 =?utf-8?B?dUYxV1FmYlkzU0d1UjZmUDN1d2tTL1c3TzVEUlNHS1phL0lWekxaK2xVbzF1?=
 =?utf-8?Q?Bd14=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6cf2a9-9fe2-4fe9-c4ed-08ddd405f3a6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7439.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:53:38.9228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaCxuHg01aNvoiUbn9qyMuPbEnZrXmckieHNkSBszQSVM7qx9b+szip6ItNzl7yZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040

Many thanks Sakari Ailus for your careful review

On 7/28/2025 2:33 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jun 18, 2025 at 05:19:54PM +0800, Bin Du wrote:
>> The helper functions is for configuring, starting and stop the MIPI PHY.
>> All configurations related to MIPI PHY configuration and calibration
>> parameters are encapsulated in two helper functions: start and stop
>> mipi phy.
>>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> ---
>>   drivers/media/platform/amd/isp4/Makefile   |    1 +
>>   drivers/media/platform/amd/isp4/isp4_phy.c | 1547 ++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_phy.h |   14 +
>>   3 files changed, 1562 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
>>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> index 8ca1c4dfe246..0e36201fbb30 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -4,6 +4,7 @@
>>   
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>   amd_capture-objs := isp4.o	\
>> +			isp4_phy.o \
>>   			isp4_hw.o	\
>>   
>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.c b/drivers/media/platform/amd/isp4/isp4_phy.c
>> new file mode 100644
>> index 000000000000..8d31a21074bb
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_phy.c
>> @@ -0,0 +1,1547 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +
>> +#include "isp4_hw.h"
>> +#include "isp4_hw_reg.h"
>> +#include "isp4_phy.h"
>> +
>> +#define ISP_MIPI_DPHY	0
>> +#define T_DCO		5	/* nominal: 200MHz */
>> +#define TMIN_RX		4
>> +#define TIMEBASE	5	/* 5us */
>> +
>> +#define MIN_T_HS_SETTLE_NS 95
>> +#define MAX_T_HS_SETTLE_NS 130
>> +#define MIN_T_HS_SETTLE_UI 4
>> +#define MAX_T_HS_SETTLE_UI 6
> 
> Please align the macro bodies to the same column.
> 

Sure, will do that in the next patch

> Also using a descriptive prefix for these (such as AMDISP4) would seem like
> a reasonable idea. The same goes for the other macros used by the driver,
> too.
> 

Sure, will add prefix ISP4PHY_ as prefix of all macros in this file. 
Macros in other files follow the same naming convension(using file name 
as prefix).

> Speaking of macro names, some of the names below look quite random. Are
> these from a hardware datasheet (or something alike)? I might consider
> sanitising them. Some are also not in form fit for use in drivers, e.g. if
> you have many of something, then the number should be an argument to the
> macro, not part of the macro name, e.g. configuration related to lanes --
> if feasible.
> 

Yes, they are from HW datasheet and reference. Not sure if I got your 
point, different number in the macro makes different macro standing for 
different registers or fields, no idea how to make the number as 
parameter. Would you mind to give a detailed sample based on current code?

>> +
>> +#define PPI_STARTUP_RW_COMMON_DPHY_2		0x0C02
>> +#define PPI_STARTUP_RW_COMMON_DPHY_6		0x0C06
>> +#define PPI_STARTUP_RW_COMMON_DPHY_7		0x0C07
>> +#define PPI_STARTUP_RW_COMMON_DPHY_8		0x0C08
>> +#define PPI_STARTUP_RW_COMMON_DPHY_10		0x0C10
>> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2	0x1CF2
>> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0	0x1CF0
>> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_1	0x0C11
>> +#define PPI_CALIBCTRL_RW_COMMON_BG_0		0x0C26
>> +#define PPI_RW_LPDCOCAL_NREF			0x0E02
>> +#define PPI_RW_LPDCOCAL_NREF_RANGE		0x0E03
>> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG		0x0E05
>> +#define PPI_RW_LPDCOCAL_VT_CONFIG		0x0E06
>> +#define PPI_RW_LPDCOCAL_COARSE_CFG		0x0E08
>> +#define PPI_RW_COMMON_CFG			0x0E36
>> +#define PPI_RW_TERMCAL_CFG_0			0x0E40
>> +#define PPI_RW_OFFSETCAL_CFG_0			0x0E50
>> +#define PPI_RW_LPDCOCAL_TIMEBASE		0x0E01
>> +#define CORE_AFE_CTRL_2_0			0x1C20
>> +#define CORE_AFE_CTRL_2_1			0x1C21
>> +#define CORE_AFE_CTRL_2_3			0x1C23
>> +#define CORE_AFE_CTRL_2_5			0x1C25
>> +#define CORE_AFE_CTRL_2_6			0x1C26
>> +#define CORE_AFE_CTRL_2_7			0x1C27
>> +#define CORE_DIG_COMMON_RW_DESKEW_FINE_MEM	0x1FF0
>> +#define CORE_DIG_DLANE_CLK_RW_CFG_0		0x3800
>> +#define CORE_DIG_DLANE_0_RW_CFG_0		0x3000
>> +#define CORE_DIG_DLANE_1_RW_CFG_0		0x3200
>> +#define CORE_DIG_DLANE_2_RW_CFG_0		0x3400
>> +#define CORE_DIG_DLANE_3_RW_CFG_0		0x3600
>> +#define CORE_AFE_LANE0_CTRL_2_9			0x1029
>> +#define CORE_AFE_LANE1_CTRL_2_9			0x1229
>> +#define CORE_AFE_LANE2_CTRL_2_9			0x1429
>> +#define CORE_AFE_LANE3_CTRL_2_9			0x1629
>> +#define CORE_AFE_LANE4_CTRL_2_9			0x1829
>> +#define CORE_DIG_RW_COMMON_6			0x1C46
>> +#define CORE_DIG_RW_COMMON_7			0x1C47
>> +#define PPI_RW_DDLCAL_CFG_0			0x0E20
>> +#define PPI_RW_DDLCAL_CFG_1			0x0E21
>> +#define PPI_RW_DDLCAL_CFG_2			0x0E22
>> +#define PPI_RW_DDLCAL_CFG_3			0x0E23
>> +#define PPI_RW_DDLCAL_CFG_4			0x0E24
>> +#define PPI_RW_DDLCAL_CFG_5			0x0E25
>> +#define PPI_RW_DDLCAL_CFG_6			0x0E26
>> +#define PPI_RW_DDLCAL_CFG_7			0x0E27
>> +#define CORE_AFE_LANE0_CTRL_2_8			0x1028
>> +#define CORE_AFE_LANE1_CTRL_2_8			0x1228
>> +#define CORE_AFE_LANE2_CTRL_2_8			0x1428
>> +#define CORE_AFE_LANE3_CTRL_2_8			0x1628
>> +#define CORE_AFE_LANE4_CTRL_2_8			0x1828
>> +#define CORE_DIG_DLANE_0_RW_LP_0		0x3040
>> +#define CORE_DIG_DLANE_1_RW_LP_0		0x3240
>> +#define CORE_DIG_DLANE_2_RW_LP_0		0x3440
>> +#define CORE_DIG_DLANE_3_RW_LP_0		0x3640
>> +#define CORE_AFE_LANE0_CTRL_2_2			0x1022
>> +#define CORE_AFE_LANE1_CTRL_2_2			0x1222
>> +#define CORE_AFE_LANE2_CTRL_2_2			0x1422
>> +#define CORE_AFE_LANE3_CTRL_2_2			0x1622
>> +#define CORE_AFE_LANE4_CTRL_2_2			0x1822
>> +#define CORE_AFE_LANE0_CTRL_2_12		0x102C
>> +#define CORE_AFE_LANE1_CTRL_2_12		0x122C
>> +#define CORE_AFE_LANE2_CTRL_2_12		0x142C
>> +#define CORE_AFE_LANE3_CTRL_2_12		0x162C
>> +#define CORE_AFE_LANE4_CTRL_2_12		0x182C
>> +#define CORE_AFE_LANE0_CTRL_2_13		0x102D
>> +#define CORE_AFE_LANE1_CTRL_2_13		0x122D
>> +#define CORE_AFE_LANE2_CTRL_2_13		0x142D
>> +#define CORE_AFE_LANE3_CTRL_2_13		0x162D
>> +#define CORE_AFE_LANE4_CTRL_2_13		0x182D
>> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_0		0x3880
>> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_7		0x3887
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_0		0x3080
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_0		0x3280
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_0		0x3480
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_0		0x3680
>> +#define CORE_DIG_DLANE_0_RW_CFG_1		0x3001
>> +#define CORE_DIG_DLANE_1_RW_CFG_1		0x3201
>> +#define CORE_DIG_DLANE_2_RW_CFG_1		0x3401
>> +#define CORE_DIG_DLANE_3_RW_CFG_1		0x3601
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_2		0x3082
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_2		0x3282
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_2		0x3482
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_2		0x3682
>> +#define CORE_DIG_DLANE_0_RW_LP_2		0x3042
>> +#define CORE_DIG_DLANE_1_RW_LP_2		0x3242
>> +#define CORE_DIG_DLANE_2_RW_LP_2		0x3442
>> +#define CORE_DIG_DLANE_3_RW_LP_2		0x3642
>> +#define CORE_DIG_DLANE_CLK_RW_LP_0		0x3840
>> +#define CORE_DIG_DLANE_CLK_RW_LP_2		0x3842
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_1		0x3081
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_1		0x3281
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_1		0x3481
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_1		0x3681
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_3		0x3083
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_3		0x3283
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_3		0x3483
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_3		0x3683
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_4		0x3084
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_4		0x3284
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_4		0x3484
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_4		0x3684
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_5		0x3085
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_5		0x3285
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_5		0x3485
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_5		0x3685
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_6		0x3086
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_6		0x3286
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_6		0x3486
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_6		0x3686
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_7		0x3087
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_7		0x3287
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_7		0x3487
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_7		0x3687
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_9		0x3089
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_9		0x3289
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_9		0x3489
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_9		0x3689
>> +#define PPI_R_TERMCAL_DEBUG_0			0x0E41
>> +
>> +#define PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK				0x00FF
>> +#define PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK			0x00FF
>> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK		0x2000
>> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK		0x1000
>> +#define CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK		0x00FC
>> +#define PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK			0x0FFF
>> +#define PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK			0x00FF
>> +#define PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK			0x01FF
>> +#define PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK					0x07FF
>> +#define PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK			0x001F
>> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK			0xFE00
>> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK			0x0001
>> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK			0x0002
>> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK			0x007C
>> +#define PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK				0x0003
>> +#define PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK				0x0003
>> +#define PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK					0x007F
>> +#define PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK			0x001F
>> +#define PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK				0x03FF
>> +#define PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK			0x01FF
>> +#define PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK			0xFF80
>> +#define CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK			0x0400
>> +#define CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK			0x0400
>> +#define CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK			0x8000
>> +#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK			0x0100
>> +#define CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK		0x8000
>> +#define CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK			0x0200
>> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK			0x2000
>> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK			0x0200
>> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK			0x1000
>> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK			0x0100
>> +#define CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK		0x4000
>> +#define CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK		0x0400
>> +#define CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK				0x0100
>> +#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
>> +#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
>> +#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
>> +#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
>> +#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK			0x0001
>> +#define CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
>> +#define CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
>> +#define CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
>> +#define CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
>> +#define CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK		0x0100
>> +#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK		0x0100
>> +#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK		0x0100
>> +#define CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK		0x0100
>> +#define CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK		0x0100
>> +#define CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0003
>> +#define CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x000C
>> +#define CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0030
>> +#define CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x00C0
>> +#define CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK		0x0300
>> +#define PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK			0x00FF
>> +#define PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK			0x00FF
>> +#define PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK				0x03FF
>> +#define PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK				0x1F80
>> +#define PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK				0xFF00
>> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK					0xF000
>> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK				0x0C00
>> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK					0x0100
>> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK				0x00FF
>> +#define PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK				0x0200
>> +#define PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK				0x03FF
>> +#define PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK				0x03FF
>> +#define PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK				0x007F
>> +#define PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK				0x03FF
>> +#define PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK				0x00FF
>> +#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK					0x03F0
>> +#define PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK				0x000F
>> +#define CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK		0x1000
>> +#define CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK		0x1000
>> +#define CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK		0x1000
>> +#define CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK		0x1000
>> +#define CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK		0x1000
>> +#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
>> +#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
>> +#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
>> +#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK				0x0F00
>> +#define CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK			0x0001
>> +#define CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK			0x0001
>> +#define CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK			0x0001
>> +#define CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK			0x0001
>> +#define CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK			0x0001
>> +#define CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK		0x0038
>> +#define CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK		0x0007
>> +#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
>> +#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
>> +#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
>> +#define CORE_AFE_LANE3_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
>> +#define CORE_AFE_LANE4_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK	0x0002
>> +#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
>> +#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
>> +#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK	0x0002
>> +#define CORE_AFE_LANE3_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK		0x0002
>> +#define CORE_AFE_LANE4_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK		0x0002
>> +#define CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
>> +#define CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
>> +#define CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
>> +#define CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
>> +#define CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK		0x0008
>> +#define CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
>> +#define CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
>> +#define CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
>> +#define CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
>> +#define CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK		0x0008
>> +#define CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK			0x00E0
>> +#define CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK			0x00E0
>> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK			0x00FF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK			0xFF00
>> +#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
>> +#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
>> +#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
>> +#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK		0x0004
>> +#define CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
>> +#define CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
>> +#define CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
>> +#define CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK			0x0008
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
>> +#define CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
>> +#define CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
>> +#define CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK				0xF000
>> +#define CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
>> +#define CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
>> +#define CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
>> +#define CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
>> +#define CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK			0xF000
>> +#define CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK		0x0001
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK	0x2000
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK		0x2000
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK		0x1E00
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK		0x0007
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK	0xFFFF
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK		0xFFFF
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK		0xFFFF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK	0x2000
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK	0x8000
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK		0x8000
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK		0x01F8
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK		0x00FF
>> +#define CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
>> +#define CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK	0xFF00
>> +#define CORE_DIG_DLANE_2_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_3_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK		0xFF00
>> +#define CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK			0x0002
>> +
>> +struct isp4phy_mipi_reg_seq {
>> +	u16 addr;
>> +	u16 mask;
>> +	u16 data;
>> +};
>> +
>> +union isp4phy_mipi_0 {
>> +	struct {
>> +		u32 shutdownz : 1;
>> +		u32 rstz : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_1 {
>> +	struct {
>> +		u32 mode : 1;
> 
> Please pad these -- I don't think the ABI otherwise requires they're in a
> particular location of the container (u32).
> 

Sure, will do that in the next patch

>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_2 {
>> +	struct {
>> +		u32 rxdatawidthhs_0 : 2;
>> +		u32 rxdatawidthhs_1 : 2;
>> +		u32 rxdatawidthhs_2 : 2;
>> +		u32 rxdatawidthhs_3 : 2;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +struct isp4phy_mipi_3 {
>> +	u32 reserved;
>> +};
>> +
>> +union isp4phy_mipi_4 {
>> +	struct {
>> +		u32 enableclk : 1;
>> +		u32 enable_0 : 1;
>> +		u32 enable_1 : 1;
>> +		u32 enable_2 : 1;
>> +		u32 enable_3 : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_5 {
>> +	struct {
>> +		u32 forcerxmode_0 : 1;
>> +		u32 forcerxmode_1 : 1;
>> +		u32 forcerxmode_2 : 1;
>> +		u32 forcerxmode_3 : 1;
>> +		u32 forcerxmode_clk : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_6 {
>> +	struct {
>> +		u32 turndisable_0 : 1;
>> +		u32 turndisable_1 : 1;
>> +		u32 turndisable_2 : 1;
>> +		u32 turndisable_3 : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_7 {
>> +	struct {
>> +		u32 ready : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_ind_idx {
>> +	struct {
>> +		u32 addr : 16;
> 
> u16 would seem appropriate here.
> 

I think u32 here is similar as u32 enableclk : 1 or u32 rxdatawidthhs_0 
: 2, indicate an unsigned value, if change to u16, : 16 will be no need, 
So prefer to keeping it and adding u32 reserved : 16 after it.

>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_ind_data {
>> +	struct {
>> +		u32 data : 16;
> 
> Ditto.
> 

Ditto

>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +union isp4phy_mipi_ind_wack {
>> +	struct {
>> +		u32 ack : 1;
>> +		u32 pslverr : 1;
>> +	} bit;
>> +	u32 value;
>> +};
>> +
>> +struct isp4phy_mipi_reg {
>> +	union isp4phy_mipi_0 isp_mipi_phy0;
>> +	union isp4phy_mipi_1 isp_mipi_phy1;
>> +	union isp4phy_mipi_2 isp_mipi_phy2;
>> +	struct isp4phy_mipi_3 isp_mipi_phy3;
>> +	union isp4phy_mipi_4 isp_mipi_phy4;
>> +	union isp4phy_mipi_5 isp_mipi_phy5;
>> +	union isp4phy_mipi_6 isp_mipi_phy6;
>> +	union isp4phy_mipi_7 isp_mipi_phy7;
>> +	u32 reserve;
> 
> "reserved"?
> 

Sure, will fix it in the next patch

>> +	union isp4phy_mipi_ind_idx isp_mipi_phy_ind_idx;
>> +	union isp4phy_mipi_ind_data isp_mipi_phy_ind_data;
>> +	union isp4phy_mipi_ind_wack isp_mipi_phy_inc_wack;
>> +};
>> +
>> +struct isp4phy_mipi_config {
>> +	u16 afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg;
>> +	u16 max_phase;
>> +	u16 ddlcal_cfg_5ddlcal_dll_fbk_reg;
>> +	u16 ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg;
>> +	u16 afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg;
>> +	u16 afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg;
>> +	u16 afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg;
>> +	u16 afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg;
>> +	u16 cfg_1cfg_1_sot_detection_reg;
>> +	u16 hs_rx_2hs_rx_2_ignore_alterncal_reg;
>> +	u16 cfg_1cfg_1_deskew_supported_reg;
>> +	u16 afe_lanex_ctrl_2_9oa_hs_clk_div_reg;
>> +	u16 hs_rx_0hs_rx_0_thssettle_reg;
>> +	u16 hs_rx_3hs_rx_3_fjump_deskew_reg;
>> +	u16 hs_rx_6hs_rx_6_min_eye_opening_deskew_reg;
>> +};
>> +
>> +enum isp4phy_mipi_id {
>> +	ISP_MIPI_PHY_ID_0    = 0,
>> +	ISP_MIPI_PHY_ID_1    = 1,
>> +	ISP_MIPI_PHY_ID_2    = 2,
>> +	ISP_MIPI_PHY_ID_MAX
>> +};
>> +
>> +static const struct isp4phy_mipi_reg *isp_mipi_phy_reg[ISP_MIPI_PHY_ID_MAX] = {
>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY0_REG0,
>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY1_REG0,
>> +	(struct isp4phy_mipi_reg *)ISP_MIPI_PHY2_REG0,
> 
> That's an interesting way to prefill structs. I don't think these macros
> expand to valid pointers.
> 

Yes, these are valid pointers, but they are not pointing to system 
memory, they are phy registers address, can be accessed by adding the 
mmio base.

>> +};
>> +
>> +static const struct isp4phy_mipi_reg_seq startup_seq_general_common_config[] = {
>> +	{ PPI_STARTUP_RW_COMMON_DPHY_10, PPI_STARTUP_RW_COMMON_DPHY_10_PHY_READY_ADDR_MASK, 0x30 },
>> +	{
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_VAL_MASK, 0x0
>> +	},
>> +	{
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2,
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_2_GLOBAL_ULPS_OVR_EN_MASK, 0x1
>> +	},
>> +	{
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0,
>> +		CORE_DIG_ANACTRL_RW_COMMON_ANACTRL_0_CB_LP_DCO_EN_DLY_MASK, 0x3F
>> +	},
>> +	{
>> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1,
>> +		PPI_STARTUP_RW_COMMON_STARTUP_1_1_PHY_READY_DLY_MASK, 0x233
>> +	},
>> +	{ PPI_STARTUP_RW_COMMON_DPHY_6, PPI_STARTUP_RW_COMMON_DPHY_6_LP_DCO_CAL_ADDR_MASK, 0x27 },
>> +	{ PPI_CALIBCTRL_RW_COMMON_BG_0, PPI_CALIBCTRL_RW_COMMON_BG_0_BG_MAX_COUNTER_MASK, 0x1F4 },
>> +	{ PPI_RW_LPDCOCAL_NREF, PPI_RW_LPDCOCAL_NREF_LPDCOCAL_NREF_MASK, 0x320 },
>> +	{ PPI_RW_LPDCOCAL_NREF_RANGE, PPI_RW_LPDCOCAL_NREF_RANGE_LPDCOCAL_NREF_RANGE_MASK, 0x1B },
>> +	{ PPI_RW_LPDCOCAL_TWAIT_CONFIG, PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_PON_MASK, 0x7F},
>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_NREF_RANGE_MASK, 0x1B },
>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_USE_IDEAL_NREF_MASK, 0x1 },
>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_VT_TRACKING_EN_MASK, 0x0 },
>> +	{ PPI_RW_LPDCOCAL_COARSE_CFG, PPI_RW_LPDCOCAL_COARSE_CFG_NCOARSE_START_MASK, 0x1 },
>> +	{ PPI_RW_COMMON_CFG, PPI_RW_COMMON_CFG_CFG_CLK_DIV_FACTOR_MASK, 0x3 },
>> +};
>> +
>> +static const struct isp4phy_mipi_reg_seq startup_seq_common[] = {
>> +	{ PPI_STARTUP_RW_COMMON_DPHY_2, PPI_STARTUP_RW_COMMON_DPHY_2_RCAL_ADDR_MASK, 0x5 },
>> +	{ PPI_RW_TERMCAL_CFG_0, PPI_RW_TERMCAL_CFG_0_TERMCAL_TIMER_MASK, 0x17 },
>> +	{ PPI_RW_OFFSETCAL_CFG_0, PPI_RW_OFFSETCAL_CFG_0_OFFSETCAL_WAIT_THRESH_MASK, 0x4 },
>> +	{ PPI_RW_LPDCOCAL_TIMEBASE, PPI_RW_LPDCOCAL_TIMEBASE_LPDCOCAL_TIMEBASE_MASK, 0x5F },
>> +	{
>> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG,
>> +		PPI_RW_LPDCOCAL_TWAIT_CONFIG_LPDCOCAL_TWAIT_COARSE_MASK, 0x1D
>> +	},
>> +	{ PPI_RW_LPDCOCAL_VT_CONFIG, PPI_RW_LPDCOCAL_VT_CONFIG_LPDCOCAL_TWAIT_FINE_MASK, 0x1D },
>> +	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTX_VCOMM_REG_PON_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTX_VCOMM_REG_PON_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_1, CORE_AFE_CTRL_2_1_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK0_EN_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_0, CORE_AFE_CTRL_2_0_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_3, CORE_AFE_CTRL_2_3_OA_CB_HSTXLB_DCO_CLK90_EN_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_EN_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_EN_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_PON_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_PON_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_6, CORE_AFE_CTRL_2_6_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_EN_MASK, 0x1 },
>> +	{ CORE_AFE_CTRL_2_7, CORE_AFE_CTRL_2_7_OA_CB_HSTXLB_DCO_TUNE_CLKDIG_EN_OVR_VAL_MASK, 0x0 },
>> +	{ CORE_AFE_CTRL_2_5, CORE_AFE_CTRL_2_5_OA_CB_SEL_45OHM_50OHM_MASK, 0x0 },
>> +};
>> +
>> +static const struct isp4phy_mipi_reg_seq
>> +	startup_seq_dphy_periodic_deskew_program[] = {
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x404 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x40C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x414 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x41C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x423 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x429 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x430 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x43A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x445 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x44A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x450 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x45A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x465 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x469 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x472 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x47A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x485 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x489 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x490 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x49A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4A4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4AC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4B4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4BC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4C4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4CC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4D4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4DC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4E4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4EC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4F4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x4FC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x504 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x50C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x514 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x51C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x523 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x529 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x530 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x53A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x545 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x54A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x550 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x55A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x565 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x569 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x572 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x57A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x585 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x589 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x590 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x59A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5A4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5AC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5B4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5BC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5C4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5CC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5D4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5DC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5E4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5EC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5F4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x5FC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x604 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x60C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x614 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x61C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x623 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x629 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x632 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x63A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x645 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x64A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x650 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x65A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x665 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x669 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x672 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x67A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x685 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x689 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x690 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x69A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6A4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6AC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6B4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6BC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6C4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6CC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6D4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6DC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6E4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6EC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6F4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x6FC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x704 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x70C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x714 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x71C },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x723 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x72A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x730 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x73A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x745 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x74A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x750 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x75A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x765 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x769 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x772 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x77A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x785 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x789 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x790 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x79A },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7A4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7AC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7B4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7BC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7C4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7CC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7D4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7DC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7E4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7EC },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7F4 },
>> +	{ CORE_DIG_COMMON_RW_DESKEW_FINE_MEM, 0, 0x7FC },
>> +};
>> +
>> +inline u16 isp4phy_rreg(void __iomem *base, u32 phy_id, u16 addr)
>> +{
>> +	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
>> +
>> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
>> +	return (u16)isp4hw_rreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data));
> 
> Redundant parentheses.
> 

Sure, will remove it and all others in the next patch

>> +}
>> +
>> +inline void isp4phy_wreg(void __iomem *base, u32 phy_id, u16 addr, u16 data)
>> +{
>> +	const struct isp4phy_mipi_reg *reg = isp_mipi_phy_reg[phy_id];
>> +
>> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_idx), addr);
>> +	isp4hw_wreg(base, (uintptr_t)(&reg->isp_mipi_phy_ind_data), data);
>> +}
>> +
>> +static void isp4phy_mask_wreg(void __iomem *base, u32 phy_id, u16 addr,
>> +			      u16 mask, u16 regval)
>> +{
>> +	unsigned long _mask = mask;
>> +	u16 shift = 0;
>> +	u16 data;
>> +
>> +	data = isp4phy_rreg(base, phy_id, addr);
>> +	if (mask)
>> +		shift = find_first_bit(&_mask, 16);
> 
> __ffs()?
> 

Sure, will do that in the next patch

>> +	data = (data & ~mask) | ((regval << shift) & mask);
>> +
>> +	isp4phy_wreg(base, phy_id, addr, data);
>> +}
>> +
>> +static void isp4phy_optional_features_dphy(void __iomem *base, u32 phy_id)
>> +{
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
>> +			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_CFG_0,
>> +			  CORE_DIG_DLANE_CLK_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
>> +			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
>> +			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
>> +				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
>> +				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_LP_PIN_SWAP_REG_MASK, 0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_0,
>> +			  CORE_DIG_DLANE_0_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_0,
>> +			  CORE_DIG_DLANE_1_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_0,
>> +				  CORE_DIG_DLANE_2_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_0,
>> +				  CORE_DIG_DLANE_3_RW_CFG_0_CFG_0_HS_PIN_SWAP_REG_MASK, 0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_9,
>> +			  CORE_AFE_LANE0_CTRL_2_9_OA_LANE0_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
>> +			  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
>> +			  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_SEL_GATED_POLARITY_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_9,
>> +				  CORE_AFE_LANE3_CTRL_2_9_OA_LANE3_HSRX_SEL_GATED_POLARITY_MASK,
>> +				  0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_9,
>> +				  CORE_AFE_LANE4_CTRL_2_9_OA_LANE4_HSRX_SEL_GATED_POLARITY_MASK,
>> +				  0x0);
>> +	}
>> +}
>> +
>> +static void isp4phy_dphy_periodic_deskew_program(void __iomem *base,
>> +						 u32 phy_id)
>> +{
>> +	for (int ctr = 0;
> 
> unsigned int?
> 

Sure, will modify to use size_t in the next patch

>> +	     ctr < ARRAY_SIZE(startup_seq_dphy_periodic_deskew_program);
>> +	     ctr++)
>> +		isp4phy_wreg(base, phy_id,
>> +			     startup_seq_dphy_periodic_deskew_program[ctr].addr,
>> +			     startup_seq_dphy_periodic_deskew_program[ctr].data);
>> +}
>> +
>> +static void isp4phy_dphy_specific(void __iomem *base, u32 phy_id,
>> +				  u64 data_rate,
>> +				  struct isp4phy_mipi_config *phycfg)
>> +{
>> +	u64 half_rate = data_rate >> 1;
>> +	u16 ddl_cal;
>> +
>> +	ddl_cal = TIMEBASE * half_rate;
>> +	ddl_cal = (ddl_cal + 31) >> 5;
> 
> I think you could do this on a single line as well.
> 

Sure, will do that in the next patch

>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
>> +			  CORE_DIG_RW_COMMON_7_LANE0_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
>> +			  CORE_DIG_RW_COMMON_7_LANE1_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
>> +			  CORE_DIG_RW_COMMON_7_LANE2_HSRX_WORD_CLK_SEL_GATING_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
>> +				  CORE_DIG_RW_COMMON_7_LANE3_HSRX_WORD_CLK_SEL_GATING_REG_MASK,
>> +				  0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_7,
>> +				  CORE_DIG_RW_COMMON_7_LANE4_HSRX_WORD_CLK_SEL_GATING_REG_MASK,
>> +				  0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_8,
>> +			  PPI_STARTUP_RW_COMMON_DPHY_8_CPHY_DDL_CAL_ADDR_MASK, 0x50);
>> +
>> +	if (data_rate < 1500) {
>> +		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
>> +				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x68);
>> +	} else {
>> +		/* Digital Delay Line (DDL) tuning calibration */
>> +		isp4phy_mask_wreg(base, phy_id, PPI_STARTUP_RW_COMMON_DPHY_7,
>> +				  PPI_STARTUP_RW_COMMON_DPHY_7_DPHY_DDL_CAL_ADDR_MASK, 0x28);
>> +		/* LUT->24MHz case */
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_0,
>> +				  PPI_RW_DDLCAL_CFG_0_DDLCAL_TIMEBASE_TARGET_MASK, 0x77);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
>> +				  PPI_RW_DDLCAL_CFG_7_DDLCAL_DECR_WAIT_MASK, 0x22);
>> +		/* LUT->24MHz case */
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
>> +				  PPI_RW_DDLCAL_CFG_1_DDLCAL_DISABLE_TIME_MASK, 0x17);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
>> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_WAIT_MASK, 0x4);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
>> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_TUNE_MODE_MASK, 0x2);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
>> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_DDL_DLL_MASK, 0x1);
>> +		/* LUT->24MHz case */
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
>> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_ENABLE_WAIT_MASK, 0x17);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_2,
>> +				  PPI_RW_DDLCAL_CFG_2_DDLCAL_UPDATE_SETTINGS_MASK, 0x1);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_4,
>> +				  PPI_RW_DDLCAL_CFG_4_DDLCAL_STUCK_THRESH_MASK, 0xA);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_6,
>> +				  PPI_RW_DDLCAL_CFG_6_DDLCAL_MAX_DIFF_MASK, 0xA);
>> +		/* LUT->24MHz case */
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_7,
>> +				  PPI_RW_DDLCAL_CFG_7_DDLCAL_START_DELAY_MASK, 0xB);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_3,
>> +				  PPI_RW_DDLCAL_CFG_3_DDLCAL_COUNTER_REF_MASK, ddl_cal);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_1,
>> +				  PPI_RW_DDLCAL_CFG_1_DDLCAL_MAX_PHASE_MASK, phycfg->max_phase);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
>> +				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DLL_FBK_MASK,
>> +				  phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg);
>> +		isp4phy_mask_wreg(base, phy_id, PPI_RW_DDLCAL_CFG_5,
>> +				  PPI_RW_DDLCAL_CFG_5_DDLCAL_DDL_COARSE_BANK_MASK,
>> +				  phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_8,
>> +				  CORE_AFE_LANE0_CTRL_2_8_OA_LANE0_HSRX_CDPHY_SEL_FAST_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_8,
>> +				  CORE_AFE_LANE1_CTRL_2_8_OA_LANE1_HSRX_CDPHY_SEL_FAST_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_8,
>> +				  CORE_AFE_LANE2_CTRL_2_8_OA_LANE2_HSRX_CDPHY_SEL_FAST_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
>> +		if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_8,
>> +					  CORE_AFE_LANE3_CTRL_2_8_OA_LANE3_HSRX_CDPHY_SEL_FAST_MASK,
>> +					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
>> +			isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_8,
>> +					  CORE_AFE_LANE4_CTRL_2_8_OA_LANE4_HSRX_CDPHY_SEL_FAST_MASK,
>> +					  phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg);
>> +		}
>> +	}
>> +
>> +	/* Write  6 if Tlpx (far end / near end) ratio < 1
>> +	 * Write  7 if Tlpx (far end / near end) ratio >= 1
>> +	 */
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
>> +			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
>> +	/* Write  6 if Tlpx (far end / near end) ratio < 1
>> +	 * Write  7 if Tlpx (far end / near end) ratio >= 1
>> +	 */
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
>> +			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		/* Write  6 if Tlpx (far end / near end) ratio < 1
>> +		 * Write  7 if Tlpx (far end / near end) ratio >= 1
>> +		 */
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
>> +				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
>> +		/* Write  6 if Tlpx (far end / near end) ratio < 1
>> +		 * Write  7 if Tlpx (far end / near end) ratio >= 1
>> +		 */
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
>> +				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_TTAGO_REG_MASK, 0x7);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_2,
>> +			  CORE_AFE_LANE0_CTRL_2_2_OA_LANE0_SEL_LANE_CFG_MASK, 0x0);
>> +
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
>> +				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
>> +				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_2,
>> +				  CORE_AFE_LANE3_CTRL_2_2_OA_LANE3_SEL_LANE_CFG_MASK, 0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_2,
>> +				  CORE_AFE_LANE4_CTRL_2_2_OA_LANE4_SEL_LANE_CFG_MASK, 0x0);
>> +	} else {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_2,
>> +				  CORE_AFE_LANE1_CTRL_2_2_OA_LANE1_SEL_LANE_CFG_MASK, 0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_2,
>> +				  CORE_AFE_LANE2_CTRL_2_2_OA_LANE2_SEL_LANE_CFG_MASK, 0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
>> +			  CORE_DIG_RW_COMMON_6_DESERIALIZER_EN_DEASS_COUNT_THRESH_D_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_RW_COMMON_6,
>> +			  CORE_DIG_RW_COMMON_6_DESERIALIZER_DIV_EN_DELAY_THRESH_D_MASK, 0x1);
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
>> +			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
>> +			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
>> +			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
>> +				  CORE_AFE_LANE3_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
>> +				  CORE_AFE_LANE4_CTRL_2_12_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_VAL_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
>> +			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
>> +			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
>> +			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
>> +				  CORE_AFE_LANE3_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
>> +				  CORE_AFE_LANE4_CTRL_2_13_OA_HSRX_DPHY_DDL_BYPASS_EN_OVR_EN_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_12,
>> +			  CORE_AFE_LANE0_CTRL_2_12_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_12,
>> +			  CORE_AFE_LANE1_CTRL_2_12_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_12,
>> +			  CORE_AFE_LANE2_CTRL_2_12_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_12,
>> +				  CORE_AFE_LANE3_CTRL_2_12_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_12,
>> +				  CORE_AFE_LANE4_CTRL_2_12_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_VAL_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE0_CTRL_2_13,
>> +			  CORE_AFE_LANE0_CTRL_2_13_OA_LANE0_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_13,
>> +			  CORE_AFE_LANE1_CTRL_2_13_OA_LANE1_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_13,
>> +			  CORE_AFE_LANE2_CTRL_2_13_OA_LANE2_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
>> +			  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE3_CTRL_2_13,
>> +				  CORE_AFE_LANE3_CTRL_2_13_OA_LANE3_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE4_CTRL_2_13,
>> +				  CORE_AFE_LANE4_CTRL_2_13_OA_LANE4_HSRX_DPHY_DLL_EN_OVR_EN_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE2_CTRL_2_9,
>> +				  CORE_AFE_LANE2_CTRL_2_9_OA_LANE2_HSRX_HS_CLK_DIV_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
>> +	} else {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_AFE_LANE1_CTRL_2_9,
>> +				  CORE_AFE_LANE1_CTRL_2_9_OA_LANE1_HSRX_HS_CLK_DIV_MASK,
>> +				  phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_0,
>> +			  CORE_DIG_DLANE_CLK_RW_HS_RX_0_HS_RX_0_TCLKSETTLE_REG_MASK, 0x1C);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_HS_RX_7,
>> +			  CORE_DIG_DLANE_CLK_RW_HS_RX_7_HS_RX_7_TCLKMISS_REG_MASK, 0x6);
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_0,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
>> +			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_0,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
>> +			  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_0,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
>> +				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_0,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_0_HS_RX_0_THSSETTLE_REG_MASK,
>> +				  phycfg->hs_rx_0hs_rx_0_thssettle_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
>> +			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
>> +			  phycfg->cfg_1cfg_1_deskew_supported_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
>> +			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
>> +			  phycfg->cfg_1cfg_1_deskew_supported_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
>> +				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
>> +				  phycfg->cfg_1cfg_1_deskew_supported_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
>> +				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_DESKEW_SUPPORTED_REG_MASK,
>> +				  phycfg->cfg_1cfg_1_deskew_supported_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_CFG_1,
>> +			  CORE_DIG_DLANE_0_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
>> +			  phycfg->cfg_1cfg_1_sot_detection_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_CFG_1,
>> +			  CORE_DIG_DLANE_1_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
>> +			  phycfg->cfg_1cfg_1_sot_detection_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_CFG_1,
>> +				  CORE_DIG_DLANE_2_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
>> +				  phycfg->cfg_1cfg_1_sot_detection_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_CFG_1,
>> +				  CORE_DIG_DLANE_3_RW_CFG_1_CFG_1_SOT_DETECTION_REG_MASK,
>> +				  phycfg->cfg_1cfg_1_sot_detection_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
>> +			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
>> +			  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
>> +				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_IGNORE_ALTERNCAL_REG_MASK,
>> +				  phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0,
>> +			  CORE_DIG_DLANE_0_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_0,
>> +			  CORE_DIG_DLANE_1_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_0,
>> +				  CORE_DIG_DLANE_2_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_0,
>> +				  CORE_DIG_DLANE_3_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_2,
>> +			  CORE_DIG_DLANE_0_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_LP_2,
>> +			  CORE_DIG_DLANE_1_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_LP_2,
>> +				  CORE_DIG_DLANE_2_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK,
>> +				  0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_LP_2,
>> +				  CORE_DIG_DLANE_3_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK,
>> +				  0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_0,
>> +			  CORE_DIG_DLANE_CLK_RW_LP_0_LP_0_ITMINRX_REG_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_CLK_RW_LP_2,
>> +			  CORE_DIG_DLANE_CLK_RW_LP_2_LP_2_FILTER_INPUT_SAMPLING_REG_MASK, 0x0);
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_UPDATE_SETTINGS_DESKEW_REG_MASK, 0x1);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK,
>> +				  0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_UPDATE_SETTINGS_DESKEW_REG_MASK,
>> +				  0x1);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_1,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_1,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK, 0x10);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_1,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK,
>> +				  0x10);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_1,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_1_HS_RX_1_FILTER_SIZE_DESKEW_REG_MASK,
>> +				  0x10);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_2,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK, 0x3);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK,
>> +				  0x3);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_2,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_2_HS_RX_2_WINDOW_SIZE_DESKEW_REG_MASK,
>> +				  0x3);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK, 0x1);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK,
>> +				  0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_STEP_SIZE_DESKEW_REG_MASK,
>> +				  0x1);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_4,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_4,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_4_HS_RX_4_MAX_ITERATIONS_DESKEW_REG_MASK, 0x96);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_4,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK,
>> +				  0x96);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_4,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_4_HS_MAX_ITERATIONS_DESKEW_REG_MASK,
>> +				  0x96);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_LEFT_INIT_REG_MASK, 0x0);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_5,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_5,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_5,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_5,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_5_HS_RX_5_DDL_MID_INIT_REG_MASK, 0x1);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_RX_6_DDL_RIGHT_INIT_REG_MASK, 0x2);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK,
>> +				  0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_RX_7_DESKEW_AUTO_ALGO_SEL_REG_MASK,
>> +				  0x0);
>> +	}
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_7,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_7,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_7_HS_RX_7_SELECT_ALTERNATE_ALGO_REG_MASK, 0x0);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_7,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK,
>> +				  0x0);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_7,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_7_HS_SELECT_ALTERNATE_ALGO_REG_MASK,
>> +				  0x0);
>> +	}
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_3,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
>> +			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_3,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
>> +			  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_3,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
>> +				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_3,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_3_HS_RX_3_FJUMP_DESKEW_REG_MASK,
>> +				  phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_9,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
>> +			  phycfg->max_phase);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_9,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
>> +			  phycfg->max_phase);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_9,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
>> +				  phycfg->max_phase);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_9,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_9_HS_RX_9_PHASE_BOUND_REG_MASK,
>> +				  phycfg->max_phase);
>> +	}
>> +
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_HS_RX_6,
>> +			  CORE_DIG_DLANE_0_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
>> +			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
>> +	isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_1_RW_HS_RX_6,
>> +			  CORE_DIG_DLANE_1_RW_HS_RX_6_HS_RX_6_MIN_EYE_OPENING_DESKEW_REG_MASK,
>> +			  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
>> +	if (phy_id <= ISP_MIPI_PHY_ID_1) {
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_2_RW_HS_RX_6,
>> +				  CORE_DIG_DLANE_2_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK,
>> +				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
>> +		isp4phy_mask_wreg(base, phy_id, CORE_DIG_DLANE_3_RW_HS_RX_6,
>> +				  CORE_DIG_DLANE_3_RW_HS_RX_6_HS_MIN_EYE_OPENING_DESKEW_REG_MASK,
>> +				  phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg);
>> +	}
> 
> Could you do this using a loop instead? With a bit saner macros, that
> should be quite a bit easier, too.
> 

No very sure how, would you mind to give a sample?

>> +}
>> +
>> +static void isp4phy_common(void __iomem *base, u32 phy_id)
>> +{
>> +	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_common); ctr++)
>> +		isp4phy_mask_wreg(base, phy_id, startup_seq_common[ctr].addr,
>> +				  startup_seq_common[ctr].mask,
>> +				  startup_seq_common[ctr].data);
>> +}
>> +
>> +static void isp4phy_general_common_config(void __iomem *base, u32 phy_id)
>> +{
>> +	for (int ctr = 0; ctr < ARRAY_SIZE(startup_seq_general_common_config); ctr++)
> 
> Unsigned int for these, too, please.
>

Sure, will modify to use size_t in the next patch
>> +		isp4phy_mask_wreg(base, phy_id,
>> +				  startup_seq_general_common_config[ctr].addr,
>> +				  startup_seq_general_common_config[ctr].mask,
>> +				  startup_seq_general_common_config[ctr].data);
>> +}
>> +
>> +static void
>> +isp4phy_calculate_datarate_cfgs_rx(u32 phy_id, u64 data_rate,
>> +				   u32 lane,
>> +				   struct isp4phy_mipi_config *phycfg)
>> +{
>> +	u64 half_rate = data_rate >> 1;
>> +	u64 hs_clk_freq;
>> +
>> +	hs_clk_freq = half_rate * 1000;
>> +
>> +	if (data_rate <= 2500)
>> +		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 1;
>> +	else if (data_rate <= 4500)
>> +		phycfg->hs_rx_2hs_rx_2_ignore_alterncal_reg = 0;
>> +
>> +	if (data_rate < 1500) {
>> +		/*  do nothing */
>> +	} else if (data_rate < 1588) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 143;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 17;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 3;
>> +	} else if (data_rate < 1688) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 135;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 16;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
>> +	} else if (data_rate < 1800) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 127;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 15;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
>> +	} else if (data_rate < 1929) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 119;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 14;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
>> +	} else if (data_rate < 2077) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 111;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 13;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 2;
>> +	} else if (data_rate < 2250) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 103;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 12;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 2455) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 95;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 11;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 2700) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 87;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 3000) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 79;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 3230) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 0;
>> +		phycfg->max_phase = 71;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
>> +	} else if (data_rate < 3600) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
>> +		phycfg->max_phase = 87;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 10;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 4000) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
>> +		phycfg->max_phase = 79;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 9;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else if (data_rate < 4500) {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
>> +		phycfg->max_phase = 71;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 8;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 1;
>> +	} else {
>> +		phycfg->afe_lanex_ctrl_2_8oa_cdphy_sel_fast_reg = 1;
>> +		phycfg->max_phase = 63;
>> +		phycfg->ddlcal_cfg_5ddlcal_dll_fbk_reg = 7;
>> +		phycfg->ddlcal_cfg_5ddlcal_ddl_coarse_bank_reg = 0;
>> +	}
> 
> Please add an array for the values and implement this as a loop instead.
> 

Sure, will do that in the next patch

>> +
>> +	if (data_rate <= 1500) {
>> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 1;
>> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 1;
>> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
>> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 1;
>> +		phycfg->cfg_1cfg_1_deskew_supported_reg = 0;
>> +		phycfg->cfg_1cfg_1_sot_detection_reg = 1;
>> +	} else if (data_rate <= 4500) {
>> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_ddl_bypass_en_ovr_val_reg = 0;
>> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_ddl_bypass_en_ovr_en_reg = 0;
>> +		phycfg->afe_lanex_ctrl_2_12oa_dphy_dll_en_ovr_val_reg = 0;
>> +		phycfg->afe_lanex_ctrl_2_13oa_dphy_dll_en_ovr_en_reg = 0;
>> +		phycfg->cfg_1cfg_1_deskew_supported_reg = 1;
>> +		phycfg->cfg_1cfg_1_sot_detection_reg = 0;
>> +	}
>> +
>> +	if (data_rate < 160)
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b001;
>> +	else if (data_rate < 320)
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b010;
>> +	else if (data_rate < 640)
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b011;
>> +	else if (data_rate < 1280)
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b100;
>> +	else if (data_rate < 2560)
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b101;
>> +	else
>> +		phycfg->afe_lanex_ctrl_2_9oa_hs_clk_div_reg = 0b110;
> 
> Ditto. Or maybe use ilog2()?
> 

I'd prefer to using the hex value directly because it's more readable, 
what do you think?

>> +
>> +	u32 t_hs_settle_ns = MIN_T_HS_SETTLE_NS + MAX_T_HS_SETTLE_NS;
>> +
>> +	t_hs_settle_ns = t_hs_settle_ns >> 1;
>> +	u32 t_hs_settle_ui = MIN_T_HS_SETTLE_UI + MAX_T_HS_SETTLE_UI;
>> +
>> +	t_hs_settle_ui = t_hs_settle_ui >> 1;
>> +
>> +	t_hs_settle_ui = t_hs_settle_ui * 1000000;
>> +	t_hs_settle_ui = t_hs_settle_ui >> 1;
>> +	t_hs_settle_ui = div64_u64(t_hs_settle_ui, hs_clk_freq);
>> +
>> +	u32 ths_settle_target = t_hs_settle_ns + t_hs_settle_ui;
>> +
>> +	ths_settle_target = div64_u64(ths_settle_target, T_DCO);
>> +	phycfg->hs_rx_0hs_rx_0_thssettle_reg = ths_settle_target - TMIN_RX - 7;
>> +
>> +	u16 jump_deskew_reg = phycfg->max_phase + 39;
>> +
>> +	jump_deskew_reg = div64_u64(jump_deskew_reg, 40);
>> +	phycfg->hs_rx_3hs_rx_3_fjump_deskew_reg = jump_deskew_reg;
>> +
>> +	u16 eye_opening_deskew_reg = phycfg->max_phase + 4;
>> +
>> +	eye_opening_deskew_reg = div64_u64(eye_opening_deskew_reg, 5);
>> +	phycfg->hs_rx_6hs_rx_6_min_eye_opening_deskew_reg = eye_opening_deskew_reg;
> 
> You could just as well do these without a temporary variable.
> 

Sure, will remove it in the next patch

>> +}
>> +
>> +static void isp4phy_startup_seq_dphy_rx(void __iomem *base, u32 phy_id,
>> +					u64 data_rate, u32 lane)
>> +{
>> +	struct isp4phy_mipi_config phycfg;
>> +
>> +	memset(&phycfg, 0, sizeof(phycfg));
> 
> Would assigning phycfg to { } do the job?
> 

Sure, will do that in the next patch

>> +
>> +	isp4phy_calculate_datarate_cfgs_rx(phy_id, data_rate, lane, &phycfg);
>> +	isp4phy_general_common_config(base, phy_id);
>> +	isp4phy_common(base, phy_id);
>> +	isp4phy_dphy_specific(base, phy_id, data_rate, &phycfg);
>> +	isp4phy_dphy_periodic_deskew_program(base, phy_id);
>> +	isp4phy_optional_features_dphy(base, phy_id);
>> +}
>> +
>> +static int isp4phy_startup_seq_cdphy_rx(struct device *dev,
>> +					void __iomem *base, u32 phy_id,
>> +					u64 data_rate, u32 lane)
>> +{
>> +	struct isp4phy_mipi_reg phy_reg = {0};
> 
> { } is enough.
> 
> 

Sure, will do that in the next patch

>> +
>> +	/* readback the mipi phy reg */
>> +	phy_reg.isp_mipi_phy0.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0);
>> +	phy_reg.isp_mipi_phy1.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1);
>> +	phy_reg.isp_mipi_phy2.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy2);
>> +	phy_reg.isp_mipi_phy4.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4);
>> +	phy_reg.isp_mipi_phy5.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5);
>> +	phy_reg.isp_mipi_phy6.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy6);
>> +	phy_reg.isp_mipi_phy7.value =
>> +		isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);
>> +
>> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
>> +	phy_reg.isp_mipi_phy0.bit.rstz = 0;
>> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),
>> +		    phy_reg.isp_mipi_phy0.value);
>> +
>> +	/*PHY register access test */
>> +	isp4phy_wreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0, 0x473C);
>> +	usleep_range(10, 20);
>> +	if (isp4phy_rreg(base, phy_id, CORE_DIG_DLANE_0_RW_LP_0) == 0x473C) {
>> +		dev_dbg(dev, "PHY register access test suc\n");
>> +	} else {
>> +		dev_err(dev, "PHY register access test fail\n");
>> +		return -EFAULT;
>> +	}
>> +
>> +	/** T1: top level static inputs must be set to the desired
>> +	 * configuration (for example, phyMode. These *inputs can be
>> +	 * identified with Startup and Active Mode state: Static label
>> +	 * in Chapter 4, ¡°Signal Descriptions¡±).
>> +	 */
>> +	phy_reg.isp_mipi_phy5.value = (1 << lane) - 1;
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 1;
>> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5,
>> +		    phy_reg.isp_mipi_phy5.value);
>> +
>> +	phy_reg.isp_mipi_phy4.value = (0x2 << lane) - 1;
>> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy4,
>> +		    phy_reg.isp_mipi_phy4.value);
>> +
>> +	phy_reg.isp_mipi_phy1.bit.mode = ISP_MIPI_DPHY;
>> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy1),
>> +		    phy_reg.isp_mipi_phy1.value);
>> +
>> +	/** T2: APB slave is active and can be accessed (presetN = 1b1)*/
> 
> /* Single-line comment. */
> 

Sure, will modify in the next patch

>> +	/** T3: static register fields are programmed/read through the APB,
>> +	 *	with PHY in reset (these register
>> +	 *	fields can be found in Chapter 11.2, Static Register Access).
>> +	 */
> 
> /*
>   * Multi-line
>   * comment.
>   */
> 

Sure, will modify in the next patch

>> +	/* DPHY mode setup */
>> +	isp4phy_startup_seq_dphy_rx(base, phy_id, data_rate, lane);
>> +
>> +	/** T4: initial programming phase is over and PHY is ready
>> +	 *	to leave Shutdown Mode (shutdownN = 1¡¯b1
>> +	 *	and rstN = 1¡¯b1).
>> +	 */
>> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 1;
>> +	phy_reg.isp_mipi_phy0.bit.rstz = 1;
>> +	isp4hw_wreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0,
>> +		    phy_reg.isp_mipi_phy0.value);
>> +
>> +	dev_dbg(dev, "Termination calibration observability: 0x%x\n",
>> +		isp4phy_rreg(base, phy_id, PPI_R_TERMCAL_DEBUG_0));
>> +
>> +	/** T5: internal calibrations ongoing. No configurations are accepted
>> +	 *	during power-on-reset (POR).
>> +	 *	phyReady asserts to signal that POR is complete.
>> +	 */
>> +	do {
>> +		usleep_range(1000, 2000);
>> +		phy_reg.isp_mipi_phy7.value =
>> +			isp4hw_rreg(base, (uintptr_t)&isp_mipi_phy_reg[phy_id]->isp_mipi_phy7);
> 
> Why uintptr_t btw.? This seems to be a recurring pattern.
> 

To make safe conversion between pointer and big enough integer, removing 
it will result in compiling warning.

>> +		dev_dbg(dev, "Wait for phyReady: 0x%x\n",
>> +			phy_reg.isp_mipi_phy7.value);
>> +	} while (phy_reg.isp_mipi_phy7.bit.ready != 1);
> 
> Use read_poll_timeout() maybe?
> 

Sure, will modify in the next patch

>> +
>> +	/** T6: dynamic register fields can be programmed/read through APB
>> +	 *	(these register fields can be found in Chapter 11.3, Dynamic Register Access).
>> +	 *	Check Chapter 9.3.4, D-PHY and C-PHY HS Receivers for analog settings that must be
>> +	 *	programmed in T3.
>> +	 */
>> +
>> +	/** T7: de-assert forcerxmode_N.*/
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_0 = 0;
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_1 = 0;
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_2 = 0;
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_3 = 0;
>> +	phy_reg.isp_mipi_phy5.bit.forcerxmode_clk = 0;
>> +	isp4hw_wreg(base, (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy5),
>> +		    phy_reg.isp_mipi_phy5.value);
>> +	return 0;
>> +}
>> +
>> +int isp4phy_start(struct device *dev,
> 
> How about using "amdisp4" as the prefix for the driver's symbol names? Just
> "isp4" is very generic.
> 

Actually all symbols in this driver follow the same convention, just use 
file name as prefix, the reason of not adding amd is 1. All files are 
located under amd folder, so no confusion. 2. To make symbol name short 
3. No export symbol from this driver, if there is, the export symbol 
should add amd as part of prefix. Is that acceptible to you?

>> +		  void __iomem *base, u32 phy_id, u64 bit_rate,
>> +		  u32 lane_num)
>> +{
>> +	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
>> +		return -EINVAL;
>> +
>> +	if (phy_id == 2 && lane_num > 2) {
>> +		dev_err(dev, "MIPI PHY 2 just has 2 lane\n");
> 
> Maybe use a similar format than for the 4-lane case?
> 

Not very sure your meaning, will rewrithe this part using switch like
switch (phy_id) {
	case ISP_MIPI_PHY_ID_0:
	case ISP_MIPI_PHY_ID_1:
		if (lane_num > 4) {
			dev_err(dev, "fail invalid lane number %u for phy%d\n", lane_num, 
phy_id);
			return -EINVAL;
		}
		break;
	case ISP_MIPI_PHY_ID_2:
		if (lane_num > 2) {
			dev_err(dev, "fail invalid lane number %u for phy%d\n", lane_num, 
phy_id);
			return -EINVAL;
		}
		break;
	default:
		dev_err(dev, "fail invalid phy id %d\n", phy_id);
		return -EINVAL;

>> +		return -EINVAL;
>> +	}
>> +
>> +	if (phy_id == 0 && lane_num > 4) {
>> +		dev_err(dev, "fail invalid lane number %u for phy0\n",
>> +			lane_num);
>> +		return -EINVAL;
>> +	}
> 
> Maybe a switch for phy_id?
> 

Sure, as shown above, will do it in the next patch

>> +
>> +	return isp4phy_startup_seq_cdphy_rx(dev, base, phy_id, bit_rate, lane_num);
> 
> This line would benefit from wrapping.
> 

Do you mean wrap it into two lines? Seems oneline is better.

>> +}
>> +
>> +int isp4phy_stop(void __iomem *base, u32 phy_id)
>> +{
>> +	struct isp4phy_mipi_reg phy_reg = {0};
>> +
>> +	if (phy_id >= ISP_MIPI_PHY_ID_MAX)
>> +		return -EINVAL;
>> +
>> +	phy_reg.isp_mipi_phy0.value =
>> +		isp4hw_rreg(base, (uintptr_t)
>> +			    (&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0));
> 
> Extra parentheses.
> 

Sure, will remove it in the next patch

>> +
>> +	/* shutdown phy */
>> +	phy_reg.isp_mipi_phy0.bit.shutdownz = 0;
>> +	phy_reg.isp_mipi_phy0.bit.rstz = 0;
>> +	isp4hw_wreg(base,
>> +		    (uintptr_t)(&isp_mipi_phy_reg[phy_id]->isp_mipi_phy0),
> 
> Redundant parentheses.
> 

Sure, will remove it in the next patch

>> +		    phy_reg.isp_mipi_phy0.value);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/media/platform/amd/isp4/isp4_phy.h b/drivers/media/platform/amd/isp4/isp4_phy.h
>> new file mode 100644
>> index 000000000000..2909892dbd00
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_phy.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_PHY_H_
>> +#define _ISP4_PHY_H_
>> +
>> +int isp4phy_start(struct device *dev,
>> +		  void __iomem *base, u32 phy_id, u64 bit_rate,
>> +		  u32 lane_num);
>> +int isp4phy_stop(void __iomem *base, u32 phy_id);
>> +
>> +#endif
> 


