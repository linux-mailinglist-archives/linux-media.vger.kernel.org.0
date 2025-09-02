Return-Path: <linux-media+bounces-41497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1301B3F293
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73E35203B9F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6444D2DF70F;
	Tue,  2 Sep 2025 03:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0lWz3yFB"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8FC248F66;
	Tue,  2 Sep 2025 03:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756782682; cv=fail; b=gjBHKn3ge8JaOvcSpI1C0eDfcmlzSKUuUbBYh4ihd6NLhwiIfvV2RRPwQJMq7OXcbL6yivejajb23iybOihMzi/kG7LOlQ3SFMqul1gu0lhmj6ORP2WZ4j3/xE9MUEXr/ipE5n+Tnz1xdYseBPIYTuHrmnibDqkwWyaGnFjY30w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756782682; c=relaxed/simple;
	bh=zvJ20exs1Q76Qi2VMBO3jlVkkh++hpGcK12yz/PzZm8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PPJcwh+PlzR79gOsDytNa1kbd9UvEJqToEKzi6XLiNkaQb96kwCjXqYjqWMaLkQqQ8LpWVM98vOC9Gr1eRu9e7puskMfLiYMkVr5DRBoF9VA2dE2khkoB2Gfj82Uo0ecC9Mfqemng5Z97dnosSzRdElrRZbU5rzqjgGdArLXbLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0lWz3yFB; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V91biFta6ai2+LiKdEoKI/GxPsf2u/46B9IQA1+c+SR8/fTfEgh+e6Fk1HNd5N04DiKyuGUeZMepW/pwcIOLPT4M1EyABSd0XZtGcmCChwfngYBKseMg7ehJzq4IpQfn2aPsbtkRKvXKYDGRanlNGrS+m0rDFd1w46F4564ooBSX7XmRHSp+gWRrcLXQo+jm3e5ftfGli40eVMnkhU7outldQUc1UGqxVp3zaHBw0Z1wp6LgQ9jM8et+q788wDCMArT1ls72ozUcaG19edBc/L9G2Vd/pM3f6jmiYDE6/5jBTDGAWg/ribYJ8wKyBMEk9QcoOtMgpzfEhHznZj9XZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmF+/X2JT0+RUul16hFMltyWinNoXv8tTEfLMFtsnnQ=;
 b=VxxtEd1Bw9esHvFP8tReHT5iq/yJGWu3vBe1qC5iqUu+24dvD0GqprgWq7fbZ1tp8FuEPempb30/9LhtzGbPoWPp62SbIjwypMR1+QbN41Q0vuT/e+eCnMH7NNGAE/EsV8hYWtU1eQtNSPd4jIXUHkS7np8tktZZFDzJTcI/lgZmTQd1wh1WXKXhahKD5P1kpLl5iZh+MKmMNqMWaI5FTCi1t7/jjkD68wOp+rHBQgpw+OJQ6FKtXwMa29UX/xlCiLMOpapEeyHrueY0K5MfYV6qipwWD3kuIFJLy2zNROyF2Ot40D031+FU7kGwxb6I46uzkS9aLp5t/iFbFw/OWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmF+/X2JT0+RUul16hFMltyWinNoXv8tTEfLMFtsnnQ=;
 b=0lWz3yFB8v4L7z9I0QH8EUjU+PVPGRM5UNhpphoBJaDMjlTWHjyX4qHU4uo6WYj2VQyEvVJI9oKfPGJE5ZKIWz1a283zcYQYp6rXZN3alPLHCO/+n30gF+LDiUMVrDnxZxwZ9wNNtzQpdiOBqLK+xK6C1k4ttdQjzVCbzYWm/8Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 2 Sep
 2025 03:11:18 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 03:11:18 +0000
Message-ID: <7627ca50-ab5b-46bd-9711-83718e3dd269@amd.com>
Date: Tue, 2 Sep 2025 11:11:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Mario Limonciello <superm1@kernel.org>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <062b36df-2fc6-43ba-9f71-25f8fe786b7a@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <062b36df-2fc6-43ba-9f71-25f8fe786b7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 190e0152-b513-40fd-abeb-08dde9ce6245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzVGbGFpa2ZTU0dKYTIxSEJsMnkycUQvVG85aVhPR2xaQzhVeDA1M0xub0gy?=
 =?utf-8?B?S1Q2ZnBaWEhrRHpmdy9qTTNHUVFWNElQOTJnMko2eWJJcUJVcFpXOHd1STJL?=
 =?utf-8?B?VTdBTTFuQTN6Z1gwWWxOUWp2eEZRNWFNa3NVS2lHTm5vRDluNTRGbWk1WUJQ?=
 =?utf-8?B?b2Y3bGljMU4ydmpNcm4wMmdZUWlxSUtrTzhiMEdrMXhTOEVLck56cDh0NzNL?=
 =?utf-8?B?NjNlM0xjT1ZmanBGZjNZd0FhVjZBbTA5Sm1DVU9VVlE1VXBJRlNOTGp6djN6?=
 =?utf-8?B?RG5QNHk3N2FQOUVXUFc5ei9GVjJZQldHN3M1SjNXWkFBVTdYMGo3T2FTMk9M?=
 =?utf-8?B?RENyajl5M2NSOVJkQkVOQ1l2SDlWQ0l1aUtOekl0Z0t2QldvZjZLMjVRWlZz?=
 =?utf-8?B?MzUxOC9rR1p4NmFMU3NnK1ZkcUxXanBabDNtUURoVjdacnNpaXJkSDhOaDBw?=
 =?utf-8?B?SGw0UlE4WjBublE0SXFEVmJ2V1ZJYVgwU1JEL1lPWmppNGVJc1p6ZGNWV2Zi?=
 =?utf-8?B?RU1NK1RFUitCdExldVhmd0hkQTNFVmEzek9mZnJEOWFCbEZ0OGVlamFYT0xj?=
 =?utf-8?B?Mk8xMzJoV0U1a2dlaVEwc2RHbkJaZFlMM0xZMGN0ejk3eTdNUVdvOGhKM00r?=
 =?utf-8?B?dEMxN0J6SkF2TU5pVUt0Vk5JcXdrODRxQmdIYzFQMmlFOW1xb1RjVkhYV1hG?=
 =?utf-8?B?dGsyNW5tbWxPVk9ZTm5BYjVpcGpTTjJNenIxSzlHVnJ2bFBpbTBZdEhVMFdJ?=
 =?utf-8?B?c214dW14UmliRXVsNU9BRWd4S3NLdXF2dEVUSWNKSXVScmlBVWc5V0x6ZS9I?=
 =?utf-8?B?OE1vckJ0SGFOTVpxclgxbHdYV2JiemI2UUpuTDUzYjc5MUFhdFBsTXVNbUpz?=
 =?utf-8?B?NnhQdUpZT1VsaXJPODUydHgxa3F2Vkk0UHVTdEpXQzVRQXFicnl3Zkpsd0ti?=
 =?utf-8?B?MWpiUVpGMkxrb0hyaTNTWW5VclQ5eHBqYVI3V3BBTGFBYnR5MTdXK2hrT1RL?=
 =?utf-8?B?SWl0WkZtTEsxaUF4Yzl2dGlHR2h6Y3R5NThva2pTdUF1THlpYzl3L1liMmRC?=
 =?utf-8?B?QUh5NnN1YU5OSDRWRERZN0QvVEpkSUlKZ0tKS1Y4ZnlISzVxUStrSm5ZTHdQ?=
 =?utf-8?B?Ui9QVkpRN0MzMGM0YlhwVktVSjVMbzBuSDVqZ1lKekhRem9OZ1hMT2V6K2ky?=
 =?utf-8?B?ZUw1eTAzbjRLL0N6ZE9nOXdIQ0dmTHYyVmdVNEUvaHVSa3hwVzVEYTlyZW1X?=
 =?utf-8?B?QVMrdVZVRWRzWVlMeDRGQWxUeTNYTFhQN2JNTS9OcGxpc1BoSjVpQUFCTzU1?=
 =?utf-8?B?VTBGNXRTT21KY1RpZ0h5WW4rcEhsU3hVaGN2Z2FXcUJ5Y01tdGkrSHJPb2Nz?=
 =?utf-8?B?cGVDOXlFWXZ2cjRwNHlsdy9lL3pFWnQzdzIwQlUwR3hqalUrNk9DQ2ZYU2Mw?=
 =?utf-8?B?Z2J4YnJWbnhhR1BKYUF2d282OGxaQ2J4ek5CVWtYYUYrTGNmUU5kSTMyYlA4?=
 =?utf-8?B?QWJoVVVIOWwwczRCam9DNWJBak5PZElVY2REcTFmbWEwYXV5anpQdmcrN3Ar?=
 =?utf-8?B?TnhBTW9zMy8xR3plQU5PL1VIMk40alVkTHFOMEJ6SldvQkZoVlUyQ1dRd1J0?=
 =?utf-8?B?dnRlaXdDN2JhaDlONi82S2ZpVm1LeUNWdFY1UElnZGJUY2lEck5kUmxxWGls?=
 =?utf-8?B?Zm9NZnhzelh5aGhhOHA2NmloZzVwV2gwb0E5OE9MZVlXcWtXdHkwVXUzUHNJ?=
 =?utf-8?B?NkxFTDR4ckNudlhDNldSNkZMR2pPRVE0UDZObGdQd2RyamsyV0VMZjFVZ3k2?=
 =?utf-8?B?OFlrT09oVHVIbFRFOHJvOXBUeDFzeUY0akJVeWdoYnBxMTUrQ3U4WUZHOXpB?=
 =?utf-8?B?MHdzdks5cnU1N0d6ZHExVmNNL250V3dKeHU4OWVwL0l5SXJUQmpGQkJFWlFj?=
 =?utf-8?B?YnN3UjFZYkxCRGZvK0JnUVlRODhXRUFsWjRBQ0dnN2JMZUdrNGp0MzlOc2xk?=
 =?utf-8?B?d1MrM2p0ZVhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWQ2SHNOeEZZb2dxVnlOZnNySFVvbExlcms4bVNValhyZ0pBR0lGbkVyNEZM?=
 =?utf-8?B?RDI5MGtiZmthN2pheGpIOEVDbDdDelp2MTI2amZrQ1hyN0RXOTJNNEtOWG1p?=
 =?utf-8?B?Qy92NTFOWHdMR2VLZmxNQkJtc2hsZUE1cXV2NXhJZG9lQ2VXazQvSUtSWnBR?=
 =?utf-8?B?Q29VNU1ITzY5dm9TcmtFdWo2RDk0N2xkSHNHRDFTWXFJUjBUZm1uT3kvQTIw?=
 =?utf-8?B?a3FrWFNEWjZKSjVvYWFwYVEzM0pkQm93eVpqN2dLSUVuTXdKa1ZsVWR5WkI5?=
 =?utf-8?B?bDZlWXVndUo5SzBkRHoxNS9yUFAzSHhMa0lXdDVzcEIrWHNreCtHeFhrK0Jt?=
 =?utf-8?B?cTdtZmt5S1pnZFZMYy9NU1EwZk9ad2QyVGNvMTVWaWxnVnhhWUtqTCtJRlNW?=
 =?utf-8?B?aWJraWMvWUdMTWlrdUExcmtOaFdtcWNtVGhFM3orS3l3bVRRcjhaWWNNY1lu?=
 =?utf-8?B?bEt4d3h1anVZeER4L2s3MXZyMW9IWCsrTmdYdVNKcHBKVEtvOHdvSHNVWGpz?=
 =?utf-8?B?M2hzWlNUMHNyRis1ZjBjUlE2NVpoZjJURk85VkNhaXdpOVJ3RXZVdXEzK0NR?=
 =?utf-8?B?TmdDK0N1ZkpOQ25LQjRrUjBnQlFoeVdpM3BGbTNDaitHeEw1eFVTbDI5S3lS?=
 =?utf-8?B?ZnlzMFVRdXZ6NWVveXQzUnR4dmNJSERsb0U3V0ZjOEhkWU9iUmhEUXlTNVha?=
 =?utf-8?B?VmdiZVZNMXVEd2tDOUpwWjFVQWJSVDRMNW0xUUp2bFViUDZ2czlHRnhoVGFU?=
 =?utf-8?B?UHlZTTR2Q3l5MDRJQk54TWszY3VwaW42SHNxcXNpaTZjaXcyVnJXR1VzUUln?=
 =?utf-8?B?dHJ6b0NlN2JkVmdSZFlmdFBobkx2bllFSThzQmVxbDFUR2F3QUlZTVlwNlJN?=
 =?utf-8?B?REU0VjBncXlSYzFzREs5Q3VTa2RvdnJQcXZtc0RhQnNDY1cwV2I5MXFUbi81?=
 =?utf-8?B?WHFRYk5DcC9sQlRQemRqdWoxck1QRWVoUC9rZ0JPQ2lCaE5GSjB6Qm1XM2ps?=
 =?utf-8?B?S09rUnVLeUNuNzlMbU4xWFBIenZVZVM5MW93aEt5cnBaK3hTd21tSnhraVVa?=
 =?utf-8?B?SWxOODkzenAwYW9jMWV3TGk4cGtTVnc2Mjh5ZndwbE9GeWxaRDhTUEYrUUQ3?=
 =?utf-8?B?ZWdteWVTR2x2amRETmxmVGN6aHN3UFNVbi9Vc2ZVbXlQVzJJdVFydkJ0TWYz?=
 =?utf-8?B?eDdGY1NSeW40ZmdkZTI4RFdQMmVQeXpPa3UwQ3RORVRuSyswSEdTZ2pkUEox?=
 =?utf-8?B?WjhyTXczcWlIeG9YTTJpVjZDZUkrNEJaL0YzZVFaZGpTVmJFR3A5L0g0cnF4?=
 =?utf-8?B?aDZqZjBLQVRyZ3dqRTZncE01RDhkMTFNSXU5TjdyRy9ScTNqanBLMWt3cFFE?=
 =?utf-8?B?ekVYc2lvZ1BoSEllUktHdWJvaW45c1lYVnpCME1EMHVrRFdVUEZGWGpHSE9r?=
 =?utf-8?B?RGlPdzhISVFwRzVEOWdZdGJRS0V6YklpdWZZY21xNUMyWlFRKzZYeG5vamxV?=
 =?utf-8?B?SHNGV04xZnhZczRaZnpKRnVYRTcwSUlEcXlEdHNINGhqVVR5WHNVb2xFTW1i?=
 =?utf-8?B?cUx1Q0lrckpkc3NST2VnU3dXNHVOWHFRZ283Y2ZUM0JlSjJsNDhMTGFYRUFW?=
 =?utf-8?B?UEZRRmZESDlqaW04NXF0bVhXSUJqakFYSVhOZjhpNnRmMTZkMFg3bFZNV3pz?=
 =?utf-8?B?eGRYR3VzRXhkS0pqVGpKa0ZoK1piYlFVeSt1QTFrS0NKMXFDaDQvL3kzWnB5?=
 =?utf-8?B?a0lhMGxZd3cyVkFKalpsZWljU0h1NDV3ZmRqWnRkZnhVQlhWMk5mbGJIbXNZ?=
 =?utf-8?B?QXRLcGo1YXdXaUo3WndwQzJWRFZ3QTdHQVN3Q09kdEFTaDlZQS9TRUs5cXFD?=
 =?utf-8?B?S0xFRHdDSzZrWW5FYkNpMk5SRmpCRXF1ek5WZTZlRkIrWlk0RW5RSEdYWEgx?=
 =?utf-8?B?WUJCbkdjRWdyc01YM25RaTA0aERoM1JuZ3YyYmUva1A5MDZzajhyM2VFdmNF?=
 =?utf-8?B?QldRVHVSS1Q2YU9QZC8yOWZpTFRWVER5V0FyZFhFYjZ2Vll2QlJjNWlPRkw4?=
 =?utf-8?B?ZWFQSzZDYmhNWG5KekV3bE8vNXBxM1ZoVzZJd1p4ajRvVDA3SmoyNUErL2tY?=
 =?utf-8?Q?TUIM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190e0152-b513-40fd-abeb-08dde9ce6245
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 03:11:18.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSq6lPJF0fU4tICSCsEqHB8PQLkYhtCwdP+7IQVC1B2XzELHUHJihwrTmeN7hQwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027

Many thanks Mario for the review.

On 8/29/2025 12:54 AM, Mario Limonciello wrote:
> On 8/28/25 5:08 AM, Du, Bin wrote:
>> AMD isp4 capture is a v4l2 media device which implements media controller
>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>> interface for now. Also add ISP4 driver related entry info into the
>> MAINTAINERS file
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>>   MAINTAINERS                              |  13 +++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |   3 +
>>   drivers/media/platform/amd/Makefile      |   3 +
>>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>>   9 files changed, 185 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe168477caa4..3ad845f1511b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1133,6 +1133,19 @@ T:    git git://git.kernel.org/pub/scm/linux/ 
>> kernel/git/iommu/linux.git
>>   F:    drivers/iommu/amd/
>>   F:    include/linux/amd-iommu.h
>> +AMD ISP4 DRIVER
>> +M:    Bin Du <bin.du@amd.com>
>> +M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +L:    linux-media@vger.kernel.org
>> +S:    Maintained
>> +T:    git git://linuxtv.org/media.git
>> +F:    drivers/media/platform/amd/Kconfig
>> +F:    drivers/media/platform/amd/Makefile
>> +F:    drivers/media/platform/amd/isp4/Kconfig
>> +F:    drivers/media/platform/amd/isp4/Makefile
>> +F:    drivers/media/platform/amd/isp4/isp4.c
>> +F:    drivers/media/platform/amd/isp4/isp4.h
>> +
>>   AMD KFD
>>   M:    Felix Kuehling <Felix.Kuehling@amd.com>
>>   L:    amd-gfx@lists.freedesktop.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/ 
>> Kconfig
>> index 9287faafdce5..772c70665510 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -63,6 +63,7 @@ config VIDEO_MUX
>>   # Platform drivers - Please keep it alphabetically sorted
>>   source "drivers/media/platform/allegro-dvt/Kconfig"
>> +source "drivers/media/platform/amd/Kconfig"
>>   source "drivers/media/platform/amlogic/Kconfig"
>>   source "drivers/media/platform/amphion/Kconfig"
>>   source "drivers/media/platform/aspeed/Kconfig"
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/ 
>> Makefile
>> index 6fd7db0541c7..b207bd8d8022 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -6,6 +6,7 @@
>>   # Place here, alphabetically sorted by directory
>>   # (e. g. LC_ALL=C sort Makefile)
>>   obj-y += allegro-dvt/
>> +obj-y += amd/
>>   obj-y += amlogic/
>>   obj-y += amphion/
>>   obj-y += aspeed/
>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/ 
>> platform/amd/Kconfig
>> new file mode 100644
>> index 000000000000..25af49f246b2
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Kconfig
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +source "drivers/media/platform/amd/isp4/Kconfig"
>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/ 
>> platform/amd/Makefile
>> new file mode 100644
>> index 000000000000..8bfc1955f22e
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +obj-y += isp4/
>> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/ 
>> platform/amd/isp4/Kconfig
>> new file mode 100644
>> index 000000000000..0268060c2dae
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +config AMD_ISP4
>> +    tristate "AMD ISP4 and camera driver"
>> +    depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>> +    select VIDEOBUF2_CORE
>> +    select VIDEOBUF2_V4L2
>> +    select VIDEOBUF2_MEMOPS
>> +    help
>> +      This is support for AMD ISP4 and camera subsystem driver.
>> +      Say Y here to enable the ISP4 and camera device for video capture.
>> +      To compile this driver as a module, choose M here. The module will
>> +      be called amd_capture.
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/ 
>> platform/amd/isp4/Makefile
>> new file mode 100644
>> index 000000000000..de0092dad26f
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +#
>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>> +
>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> +amd_capture-objs := isp4.o
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>> platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..6ff3ded4310a
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +    0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +    1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>> +    3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>> +    4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +#define to_isp4_device(dev) \
>> +    ((struct isp4_device *)container_of(dev, struct isp4_device, 
>> v4l2_dev))
>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct isp4_device *isp_dev;
>> +    int i, irq, ret;
>> +
>> +    isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>> +    if (!isp_dev)
>> +        return -ENOMEM;
>> +
>> +    isp_dev->pdev = pdev;
>> +    dev->init_name = ISP4_DRV_NAME;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +        irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +        if (irq < 0)
>> +            return dev_err_probe(dev, -ENODEV,
>> +                         "fail to get irq %d\n",
>> +                         isp4_ringbuf_interrupt_num[i]);
>> +        ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>> +                       "ISP_IRQ", &pdev->dev);
>> +        if (ret)
>> +            return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +                         irq);
>> +    }
>> +
>> +    /* Link the media device within the v4l2_device */
>> +    isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +    /* Initialize media device */
>> +    strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +        sizeof(isp_dev->mdev.model));
>> +    snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +         "platform:%s", ISP4_DRV_NAME);
>> +    isp_dev->mdev.dev = &pdev->dev;
>> +    media_device_init(&isp_dev->mdev);
>> +
>> +    /* register v4l2 device */
>> +    snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +         "AMD-V4L2-ROOT");
>> +    ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "fail register v4l2 device\n");
>> +
>> +    ret = media_device_register(&isp_dev->mdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to register media device %d\n", ret);
>> +        goto err_unreg_v4l2;
>> +    }
>> +
>> +    platform_set_drvdata(pdev, isp_dev);
>> +
>> +    pm_runtime_set_suspended(dev);
>> +    pm_runtime_enable(dev);
>> +
>> +    return 0;
>> +
>> +err_unreg_v4l2:
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +    return dev_err_probe(dev, ret, "isp probe fail\n");
>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +    struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +
>> +    media_device_unregister(&isp_dev->mdev);
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +    .probe = isp4_capture_probe,
>> +    .remove = isp4_capture_remove,
>> +    .driver = {
>> +        .name = ISP4_DRV_NAME,
>> +        .owner = THIS_MODULE,
>> +    }
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>> +MODULE_IMPORT_NS("DMA_BUF");
>> +
>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>> platform/amd/isp4/isp4.h
>> new file mode 100644
>> index 000000000000..8535f662ab49
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/videobuf2-vmalloc.h>
>> +
>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> +
>> +struct isp4_device {
>> +    struct v4l2_device v4l2_dev;
>> +    struct media_device mdev;
>> +
>> +    struct platform_device *pdev;
>> +    struct notifier_block i2c_nb;
>> +};
>> +
>> +#endif /* _ISP4_H_ */
> 

-- 
Regards,
Bin


