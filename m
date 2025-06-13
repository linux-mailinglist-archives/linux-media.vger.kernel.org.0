Return-Path: <linux-media+bounces-34692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31DAD811A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B0C41892C23
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E574323D290;
	Fri, 13 Jun 2025 02:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gERzNr0J"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD781E5B7C;
	Fri, 13 Jun 2025 02:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782401; cv=fail; b=VOrKfRlR1Nos+U44NX0qKAGAR4NygynS1a0Isd//C/kLYwz21nebvfaWAa0Kvo5T0WqGlHHle7m1fRUIS1y1qcLdGR77g54zKkBfQvyh8BOvnfIaUd+Ms8yAZMDSOVRSiZoXeE90SJbT9mzrcgBp5LhDhR4VmKJN4z8ojLt6XiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782401; c=relaxed/simple;
	bh=V+GeleuRJhMkRXjmW7WU0xdLgaZwqwnz+9f/DzzgDF0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nhx7KpQ+8/ChVBV6LMmn0hDVlEkypBD76R4tK4NXu2B9KEXzw6mAmSDXiTqHA2LwjOfxqWx5inM+DqeHjTryX8em7UbHwUo+bWR5fBYH3Uwkv7cMisTr9gr6qkwZD/GyH+kkfwayo8Bf7b+zSGXoK2SO1W7RIFo0zpv4+x937xI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gERzNr0J; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbCIzPUFMTkEThcbTs6IHYTBKO1y8YJw9CrOmGEHS0NrmF/0kRyQHYH0vKtQPGACfpkB3IJErO19RxeBihVShn4vAkfdwh+/MJtCxrG9l1VBrK95mTGZ/AJ4ObAk7YZW8hjEEE4UkP+WV1+jdUUYobUFfoXsz0abDaqf2ASk6cXwrQ2cnjuKUVDN5OmWa5oVZMpIZ3xLa5gtCn13PSux9E6UpvPDZnKYM7YqHi7yhYywMJAcrqK+UQT5XgZnW7xAqaL3vof4sttCTv7ACm3lbtqedqCBikQ0ll2h37XS65oPiIC4yxX6NxYWVKW6BQ2DVfJwqP+vzgXaPimVSAuXDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL0aVs4WQrSAbBvzTa9ddj5UTmZUEcqedXgeYmDLAL0=;
 b=JjwMZ3kWY29kgW94lezmVQwufqvpnHuDfZQDLBsMM6UJ9OVYMwruGOnQnCMEQAtB1GH1S4lu1vROONxo6EMlxbRJWN9vVXNl2Ut1E24mPN/hJ9JVy/QAd39bxxlunYzlDT47rLPLEdQaL0m+q10jlXYLsxkJO45EC2W6WPRixjp2JnZTfxjGhnNWT5GSXKYBOqBlQENifP5mJ1OBSvBnKocUWUPUn86kIkNLNhdx/zu9Hjt1NftmfXlcaTlvxsun6AQ5dSGmsv0hWmaZI+6FSDlxWwORVRb5R7dBJErLEQfmFd2pffIIVtLMTTNwLNAhLhOJGZuHQJF8pzcm0eA0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL0aVs4WQrSAbBvzTa9ddj5UTmZUEcqedXgeYmDLAL0=;
 b=gERzNr0JfZxcRx4J6nWcY/u6mQ48cFmZulN2dKOWEYIZuz6K3sdCLlpAC544WUaYXqy1xvpFhEIbuHQIPfCaFg2U/wIKkJREWdBD6mKsJmUt+X2zigSeEyl0PfnkkLszfq16pf/vPSHGadqVLTpky7N4hu3wBUhqPH8wTd5Izgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:39:56 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:39:56 +0000
Message-ID: <7d1e6072-887b-498b-a008-1524d3282db0@amd.com>
Date: Fri, 13 Jun 2025 10:39:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/9] media: platform: amd: Introduce amd isp4 capture
 driver
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-2-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-2-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b088b97-8bbe-4d39-519f-08ddaa239516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WTBqWTJRMmVlNUp4cERsOVZYZVFKdEhRTG5VWHp5SnlmTFFuNzluY0dQQUs5?=
 =?utf-8?B?azBRa3lGNjZ5UlRwVzdzMnZYdmRibmxhZStmSy9nejJEcThxRlhnR0JYUTgx?=
 =?utf-8?B?WEo1ZHFDVHE2UUJrZXY0bkdtdE52Tmo3bmVOWWN6S3ZtSFNzbzRyV1NwTDc5?=
 =?utf-8?B?L0xOUjFWWlhhWUc4eDJ1eU5NNU5VWWs0dnBoRGtZZm0rYUVwdXBYNEpxeG5H?=
 =?utf-8?B?QndEaXZhUG5DVmxaaVoxa1NockZpY0NDQi9JTFdxY1RFU3l2VDNRa2dzTUFQ?=
 =?utf-8?B?Q1JZLzRhSGdCTWZsdWUxU3Y4SjhCOWNVMzRtUENWMTU3UEw3Qit6MHZ4VzZE?=
 =?utf-8?B?S01pWjNUWHBjNmxvWU5GMjcxRXoyZE5MVVhxMlFnSnRLcXNhWEluV2JrcGx5?=
 =?utf-8?B?aVR2S3RuNWVqaGJmT2FJRW9KMFd1ajl4SWRtR2h0cDUvWUFiTmYxelkvdkJ6?=
 =?utf-8?B?YVJFanRDemtFeUdySm1IWjB4bS84ejFmdXlxanBNTmI3RitLNnQxVTB1TEwv?=
 =?utf-8?B?M29YK24veXRvbktUWFJCNmFOaWtwR0I5VGNGblB2VVRBL1ZOdEt6NzZxWWRE?=
 =?utf-8?B?aXplMFlXakYwcEI0Zmp3RWNpS01McWwyenhwa1llUlRjSWRJMmhmdkRZcWh3?=
 =?utf-8?B?OVFEalZlckQyR0QvNXRqUzZRR2UxOTlBUEFCa2h0cHdIb2FPZUorai9zOTh2?=
 =?utf-8?B?VEJBODNrLzFQV0ZiWjh2ZkViSjJGS3BKKzVvSEY5Yk1hWGUrMTQzemRweTBS?=
 =?utf-8?B?VnNxOXo2dVZjZnhHQ0F3cURiWi9OZTJsUytxbHgyMmU0QjAyM2F3blU1amxs?=
 =?utf-8?B?SjVZWWVIeVR2dGRFdkhSN2xHNW9iUUpTVkY0S1NQb0tqODFzSlYxeTA2aEdu?=
 =?utf-8?B?L1dCZzFlbmIrOGhZR0xTNnVnVDVZSUM5RjVzb2FXZi9ZWVBvNzFESDBwc1BF?=
 =?utf-8?B?bU1NdUxYcDcwaWZvTjdEV1N6OFN3a3NhTEczUDRYQ3FqV1ZGemVqU0I3Mjh5?=
 =?utf-8?B?Q0NvWjcyZnlVamI1RkwzNzVwYmE3bEtBeEN4NmlCa242SGlGdVYxOHprQ3BH?=
 =?utf-8?B?b25WajdYVkVVYkFSbzlwNy9DcTRzYzhuem9uK1hSRThBNXdKbGlTUzRoVkVs?=
 =?utf-8?B?TlV0cmhBcjJKL0h6VUVHMG9SZjJEMWo4anI1M1BqcFNJSjBhSFNaZFBBNU9U?=
 =?utf-8?B?dWQ2Um5hNUJ2c1hVSzNaTkRMdVQ3bXZVZEhqanpSa2hWbUlDTW9UMkNLYnVZ?=
 =?utf-8?B?OEVtSkh4VFBYYzhocURuWEpCZml3bm4ybkZqRWRUKzdLMWg0OTEvTFdVSEM1?=
 =?utf-8?B?Sko0KzdQWWV3L01VMDFNRUdmNlppVHRrRG9DT2dCbUJrTmhBNE9MOUI1T2Vw?=
 =?utf-8?B?S1ZpeERYZ054OG5ES0tNUld6c0U5UG5tREpCNENJcnl6eXltL0VFY0ZnUkRJ?=
 =?utf-8?B?OTF6ZWNxSS8rUVM3d2FZd2xoRGhRODE1U2Q0R3B2K0xuWHBWRGlzOXRmcnNQ?=
 =?utf-8?B?OC9qWlNPYWNrRk5ZbUR2MTlGblpWV1pDbkJteFBPUUFaM0NBbko1ZURvcCtm?=
 =?utf-8?B?SWpJODcxNWwwc2YvT2JCQjRnUmxhRlV4WUI1c2g4MU5yV0FuSnhYcyszWThx?=
 =?utf-8?B?SGVDckhrdWVXSk43MFFRVGFIT25pSCthTnVBQkJ0UXdNa2Z6QjA0L0VrSjdP?=
 =?utf-8?B?V0VpdTBRSjBmMHdoYlM0TmJabW16MjdEbVY0SHlkV2lpMWp5aVF0eWdqeUQz?=
 =?utf-8?B?UkprOVpwdUovbm8vTDcrMjI2OXFHWHkyNHpoQzFjR1ZyN2hwdGVxK3ArZ2hH?=
 =?utf-8?B?c1hwVzErUVNXY3pOdmFmSFUyZ0RkandXTEJSbncyRDlMWTlnNVdGeHc1NEVy?=
 =?utf-8?B?akZlQTZRVkJNNmUwL2J3b1A2c25ZU3hWeW4xcVBWdEhnaVBFcU1tUlR1ZE9j?=
 =?utf-8?Q?qj1mGpzF5UA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTR4ZDRWY1IySi9YdERZbDk1UFRndkdScnh5QVB5dXBHOUh0VjdTY0IvN2V6?=
 =?utf-8?B?M0h0aSttSHB3bmw5YUczR3hPdDZEeXlqUUk0SzdjUStnWjBvdHJmVU5oL0hs?=
 =?utf-8?B?RmJEZmlaZDUydEtYU2RNTjlWUVdlOFB5RU1pNXo5d3FnUTVNTU1SWmx3RW52?=
 =?utf-8?B?MFFzRkUrNjRRVzk3NFZQcnlURVV3cTlOa3c3Znk1VVRWR3FUS3EyMFBoQVhr?=
 =?utf-8?B?dnJSTTBsWnpuNUpYVEFPZEs0MHpwdG5WYnd1NmFRZnMxZjJ4WGI0MDNMR21t?=
 =?utf-8?B?WjN4RG53cGxKTVVsS0NvMTYrdVowaHpUTVZOSk81M2xSYmRPT3NHdjkvS1p2?=
 =?utf-8?B?dXpSZURHbk1ldExtZlJMSTB6MHczN05DeWtwYU5ISzhCR25OYzF3TjdOWHhU?=
 =?utf-8?B?aUNyWjJFenJHQjJ0NkpwR1cwNU1uaS84WDFCRGRmR0FuNUhBM0c1M09xUk84?=
 =?utf-8?B?UGp5RzduUVhZcHRyM1RIcWZYeFI3K253d1BiMWZjUnphRE1TSU5TTFR2K29C?=
 =?utf-8?B?b0lGOVVjWVVLZmRuT1VSWjREbEp5M3U3YklFMlJvbTZlNEt5T2JFZHdIRU1i?=
 =?utf-8?B?aEQzNDJTdFNkUHcrNk9FVVB6SnZKYS9PSlp6TFRud2hqUEJOamxYYURjaGNq?=
 =?utf-8?B?azJpRjRXUElONkFCT2pmNnZrSEYvMUFQa0pXTXBuUVRKZ05hcStjSnZEVmtM?=
 =?utf-8?B?ZndDTjh3ZTFpMUJ2U2FJd1UzMk52MVpIRDhuTE1YeXFSK2xXc05zSHB6aDh4?=
 =?utf-8?B?SFNxVDBQcGN6ZW1yNENQZFhseW1rY2pTZGYwWWRRbDJ2VjFBenhjdVRpNC9M?=
 =?utf-8?B?NGQ3aU5vNGhsM3lOZ1FyaXh1bERtR2xGSUlYQ240YUlYSzIrcWt3TXpNbFll?=
 =?utf-8?B?Ri85bnozYmJqZEg2UGh1UXpWNlQzV3ZsVkl2NVppODMrbkxWdk9RcmEybXlE?=
 =?utf-8?B?Ym9vYTh4cExhVDVsenJBK3JhbUxUTUZHaTc4cDB0a2NxVjBreVRZOWx5VVJX?=
 =?utf-8?B?aG9HNkp4NDhjQVpEOVppakpGK2xyK2Q5OEJFNFFHODBMQzB1Mm5pdWZ0Nnk5?=
 =?utf-8?B?QStkVzJ6MlJEdDRnRVFqNm1VSmpvK21tTlJ2bWZEck9lRmpUeXJZV3lnczR3?=
 =?utf-8?B?UlhkMWxDc1BNY1pKMlo1NWFnYVA1Sk1wdjZRZ2gyRWErdmozNTA2ellTWDcy?=
 =?utf-8?B?WFhCbDZIaGE0eUhyUW5hZXYreEt6VFY3SnlMS0VYbXZsM20yTmVGOExjd1Nq?=
 =?utf-8?B?UkFqTFVXaVF0K3ZNcEIrdkJxUERnK0lOTHpyWHF6YTY2dnhLWk84WERlSGl6?=
 =?utf-8?B?MzJSSWhGcElUdWZkRlZHTnd3azUvVkdEa0g4M3VZWDZjU3YvYWY3b2svWlF0?=
 =?utf-8?B?clp2TlJLWjJweEFoMlp2RFJQTWUyU1kzcU5aKzNGNHpRY3VnbkhBQnJ6a2dT?=
 =?utf-8?B?eDlaUlRKODBsSnlvbG8xSzY1T3F5am5WalVraVdpOG8vQktWQXAzdi84aGY5?=
 =?utf-8?B?eENnWWhLS3NwQWFvcWRpYUR0c1E3YW01Z0s5cUczdjRSMEFMYTNhTG5qNmZy?=
 =?utf-8?B?SXVuZ3R6Y211VWR2WllKanhzaDVxZ3RxUGhUUmMrT1V6N2FLZ0c4N2lqbHhl?=
 =?utf-8?B?Mmx4WTVMSU9NN2xHOVB0U2J1cmNOOFNaNEVoUmlZNG5XdXNoZkJ6Z2grVnJl?=
 =?utf-8?B?VlZIOHhFbEVFenlLQ3puQUpOd1R2T2dBbTI1ZXhUSjFGZWdrNGc2a0o2dzRp?=
 =?utf-8?B?WmcybDQrQVhjNHNBNDU2S25hVTM5eWpQcEFBcHRXazZ4T2tTd1duMjVrRlkw?=
 =?utf-8?B?dHhmK0VsWU0zUlI4Y2h3NStuRk5pQ3h1WmEyd2Z2VS9tVDlJbExIdzhPS1Va?=
 =?utf-8?B?V2JpQ2VjQmdOVHhOdVRuL3VvY0lLV0lWWkFQZHFWTm1WM1NlYjE1dkJ4R0wz?=
 =?utf-8?B?TER6enltQkcxTkVPR0wxMGcwZ1BGcituS2M2WFdoclZrQXliSEZPQ2NRclpR?=
 =?utf-8?B?WU1EZFl4K0RuSWhkT3Qzb1NtajVOM1Zjc1dnTDFMVGxUd2hZSG9MVVBZNFlZ?=
 =?utf-8?B?WFJhNUtRdGNqQTZpKzhDbitUd3ZpS3Q3UmVQdmtheVNtTlNoR0g0dlU2Z0s0?=
 =?utf-8?Q?4I/o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b088b97-8bbe-4d39-519f-08ddaa239516
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:39:56.1649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OngeUeoEFLaU+rabs0cjktPaDWQN/r/hi560q5HwBqfIYPDtlt6A+YxGIu6B6Y8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and will be fixed in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Amd isp4 capture is a v4l2 media device which implements media controller
> interface.
> It has one sub-device (amd ISP4 sub-device) endpoint which can be connected
> to a remote CSI2 TX endpoint. It supports only one physical interface for
> now.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: I1a55f348db6a307797349203640132675aafbc0a
> ---
>   drivers/media/platform/Kconfig           |   1 +
>   drivers/media/platform/Makefile          |   1 +
>   drivers/media/platform/amd/Kconfig       |  15 +++
>   drivers/media/platform/amd/Makefile      |   5 +
>   drivers/media/platform/amd/isp4/Makefile |  16 +++
>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>   7 files changed, 212 insertions(+)
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 85d2627776b6..d525c2262a7d 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>   source "drivers/media/platform/verisilicon/Kconfig"
>   source "drivers/media/platform/via/Kconfig"
>   source "drivers/media/platform/xilinx/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>   
>   endif # MEDIA_PLATFORM_DRIVERS
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index ace4e34483dd..9f3d1693868d 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -32,6 +32,7 @@ obj-y += ti/
>   obj-y += verisilicon/
>   obj-y += via/
>   obj-y += xilinx/
> +obj-y += amd/
>   
>   # Please place here only ancillary drivers that aren't SoC-specific
>   # Please keep it alphabetically sorted by Kconfig name
> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
> new file mode 100644
> index 000000000000..361b3d687529
> --- /dev/null
> +++ b/drivers/media/platform/amd/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: MIT
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	default y
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	select VIDEOBUF2_VMALLOC
> +	select VIDEOBUF2_DMA_CONTIG
> +	select VIDEOBUF2_DMA_SG
> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
> new file mode 100644
> index 000000000000..76146efcd2bf
> --- /dev/null
> +++ b/drivers/media/platform/amd/Makefile
> @@ -0,0 +1,5 @@
> +# Copyright 2024 Advanced Micro Devices, Inc.
> +# add isp block
> +ifneq ($(CONFIG_AMD_ISP4),)
> +obj-y += isp4/
> +endif
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> new file mode 100644
> index 000000000000..f2ac9b2a95f0
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
> +
> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> +amd_capture-objs := isp4.o
> +
> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
> +ccflags-y += -I$(srctree)/include
> +
> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
> +	cc_stack_align := -mpreferred-stack-boundary=4
> +endif
> +
> +ccflags-y += $(cc_stack_align)
> +ccflags-y += -DCONFIG_COMPAT
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..d0be90c5ec3b
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,139 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/vmalloc.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#include "isp4.h"
> +
> +#define VIDEO_BUF_NUM 5
> +
> +#define ISP4_DRV_NAME "amd_isp_capture"
> +
> +/* interrupt num */
> +static const u32 isp4_ringbuf_interrupt_num[] = {
> +	0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
> +	1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
> +	3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
> +	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
> +};
> +
> +#define to_isp4_device(dev) \
> +	((struct isp4_device *)container_of(dev, struct isp4_device, v4l2_dev))
> +
> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
> +{
> +	struct isp4_device *isp_dev = dev_get_drvdata((struct device *)arg);
> +
> +	if (!isp_dev)
> +		goto error_drv_data;
> +
> +error_drv_data:
> +	return IRQ_HANDLED;
> +}
> +
> +/*
> + * amd capture module
> + */
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
> +
> +	int i, irq, ret;
> +
> +	isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
> +	if (!isp_dev)
> +		return -ENOMEM;
> +
> +	isp_dev->pdev = pdev;
> +	dev->init_name = ISP4_DRV_NAME;
> +
> +	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
> +		irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
> +		if (irq < 0)
> +			return dev_err_probe(dev, -ENODEV,
> +					     "fail to get irq %d\n",
> +					     isp4_ringbuf_interrupt_num[i]);
> +		ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
> +				       "ISP_IRQ", &pdev->dev);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "fail to req irq %d\n",
> +					     irq);
> +	}
> +
> +	isp_dev->pltf_data = pdev->dev.platform_data;
> +
> +	dev_dbg(dev, "isp irq registration successful\n");
> +
> +	/* Link the media device within the v4l2_device */
> +	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
> +
> +	/* Initialize media device */
> +	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
> +		sizeof(isp_dev->mdev.model));
> +	snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
> +		 "platform:%s", ISP4_DRV_NAME);
> +	isp_dev->mdev.dev = &pdev->dev;
> +	media_device_init(&isp_dev->mdev);
> +
> +	/* register v4l2 device */
> +	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
> +		 "AMD-V4L2-ROOT");
> +	ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "fail register v4l2 device\n");
> +
> +	dev_dbg(dev, "AMD ISP v4l2 device registered\n");
> +
> +	ret = media_device_register(&isp_dev->mdev);
> +	if (ret) {
> +		dev_err(dev, "fail to register media device %d\n", ret);
> +		goto err_unreg_v4l2;
> +	}
> +
> +	platform_set_drvdata(pdev, isp_dev);
> +
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +err_unreg_v4l2:
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +
> +	return dev_err_probe(dev, ret, "isp probe fail\n");
> +}
> +
> +static void isp4_capture_remove(struct platform_device *pdev)
> +{
> +	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
> +	dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
> +}
> +
> +static struct platform_driver isp4_capture_drv = {
> +	.probe = isp4_capture_probe,
> +	.remove = isp4_capture_remove,
> +	.driver = {
> +		.name = ISP4_DRV_NAME,
> +		.owner = THIS_MODULE,
> +	}
> +};
> +
> +module_platform_driver(isp4_capture_drv);
> +
> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +MODULE_DESCRIPTION("AMD ISP4 Driver");
> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
> new file mode 100644
> index 000000000000..27a7362ce6f9
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_H_
> +#define _ISP4_H_
> +
> +#include <linux/mutex.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-memops.h>
> +#include <media/videobuf2-vmalloc.h>
> +
> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
> +
> +struct isp4_platform_data {
> +	void *adev;
> +	void *bo;
> +	void *cpu_ptr;
> +	u64 gpu_addr;
> +	u32 size;
> +	u32 asic_type;
> +	resource_size_t base_rmmio_size;
> +};
> +
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct isp4_platform_data *pltf_data;
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;
> +};
> +
> +#endif /* isp4.h */


