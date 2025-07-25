Return-Path: <linux-media+bounces-38448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944EDB11C2F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 12:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB5216A08E
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3CF2DC334;
	Fri, 25 Jul 2025 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A7IbpD6w"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F3234966;
	Fri, 25 Jul 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753438938; cv=fail; b=hjRKTC4v1T6XEJj+QX8u6rVogC5UsRKKZ80KL0QGCduDnX9Zg2unDa+OJM7+qmjqVGdFrF7APLJpOEmtUtvI9Me18yGA5bj5+e8KzHCix6pg+3zcg49rM24SYVsCH/0GOnErGQ/RIySuOMmZtzAYgB50QIItbzhPYtaQumVe/no=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753438938; c=relaxed/simple;
	bh=pylHlrMO6mCuXbgseCyoQs4TdupJm6pmf76BuRq0UKo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ubDzUjtFRCxaugJWkuFJcan183FAtz4NdfOXw3GNrdrvm+D6c4K7wPglu3hi8C6FjM9xE3PQ3hywvEztkG2gz3IvPBBiAhoc4yFjt22SzTEBQWj5u7tqHQ7RYVjnmauvsUyoVSTeqB0nkp7D8lS6gbsBhk4eM/HzTvtOZ75Wh1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A7IbpD6w; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXqg8VGJbku2HD7IyhZd84mK4P87+MNectJ7b9giuaWgrByXfzjMSCTfWR7nhGy5WEEIEilNZN3zLzV5zy/CmB8iPqkcmDudfxQ4gVJkxu1UX3tKn2NTVQ/YtimSpV0BJ8Cf7eHvAn3OYpycyYz3ELJ0lQMBTjkQuSvkhsmK6w8+dpaqv/YvfPzbLn3Kk5IzdSXji8A6YiHvnQGqUi7vCR5avfyS4j7NdbJdGRwQtidl8FSCX0sQjRtV9LAc2TT3uEPskrcLxoHCG7ilFx1Mar9VZmfHlti63T1cuopxQ88JaJQVFHjctTbxL51WMP/E+zPNe/1GrnFhidvcoXbVxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPwNe0v4SDcG4FP1Vz7hSGHSr6y5FZd7ez46Hpn6Iz4=;
 b=Az/x6YcOOXqAObxKpBqxLaj3Z6CMsX9WtrKTgeHWXiZsJyLsRe8T4ZfxCNyepCo42ti8hABpsGijbEg0cGaVA2zOiSGbRTt1PP4E4MTSs7MT+M/5nqDQs+fbwWmJaATCL71KUxPOAsuyeJnxUlLHACgFHrhS9w//11un4IQanWqTjbJtw2zy07na+6s7TXQ2HWO3ICUof36XuL2FWlThAv4Vs88CwDdOimFW/UmtwRcXAQxaiJAjQvtptAzTMsg8Q3CYZZ2StVU+yNM+fwCAC+mX3v3CQlB/Y/1qxXjryxFUI5tl2lkbMEU2DoR5nl/vSRd5Ui3Ex+Y5fYPFdBIAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPwNe0v4SDcG4FP1Vz7hSGHSr6y5FZd7ez46Hpn6Iz4=;
 b=A7IbpD6wtGQEyKo2uXFRKokcaDLF7jDSPhdr8HP0zICUOwfKx6LDOCZQKt5q7sonWO9tsbCoZVcAsNp+3vJse8Z/QAdZhx9/DJ8dtxwKin/F7uBl1fpLO6iuqtntLUENfo5Z4FZ21DQsi3W0aRb1cG5A7qyPtaLtxsHmspVLtts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SA1PR12MB6972.namprd12.prod.outlook.com (2603:10b6:806:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 10:22:12 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 10:22:11 +0000
Message-ID: <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
Date: Fri, 25 Jul 2025 18:22:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com, bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIEmJXNpNN0QF233@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SA1PR12MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: f112db67-7b66-435a-8281-08ddcb651e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SitiakwvOGNiUURVVjBWczRoMWFXRUxnN3E5Y2RGYk1VbDdtbC9XODNkdlFV?=
 =?utf-8?B?a1RrU3QrN0h4R0tiUDBKZDk0M1U1NzRYUUZlMmd5TCtyVW13Y1pRNnJVWVZy?=
 =?utf-8?B?T29Sc200dnYvN0cyUW9Hby9mb3Y2MHJlNTRPQkFFblVkL1VTRng3YmN6WkFo?=
 =?utf-8?B?S2ZkUWdXVDE4WVFhRDJhTFh0NHZIeStyZFpxNlBYOFI2RmpZZ0NoYTFlY3ZQ?=
 =?utf-8?B?ZGIxMlMvUHR6L1VqNnVmMkFFY28rT0pTaEc4ZW9ZQzhhazlHaC9zQWVUeXhr?=
 =?utf-8?B?b0NoME8yMkRncjVPYXloR0JOT21hNERua0FKak4rRjNNNEZLRTVMMjdBcml5?=
 =?utf-8?B?dXY2NHpIaEs1NVZIY1phd0NwQVY2UTJHTCs0bDNMNGhSNHFyMzgzaEpnYnQw?=
 =?utf-8?B?Z1FYZkRhRzMrYWhSQU14VUxXMHBXNG9jU0RLbUxQeG1BdnMwd0J5MmNuNGpn?=
 =?utf-8?B?emZBSjNycGRoYkRSbVZDODBlSEY2VjlQVWVGTm0rbnVDRFRGTXViSFBmSHVX?=
 =?utf-8?B?eXVleG5zc3ZpYXhGa3ovMG5oMWRHeFJVaXlkc2Q5cURIMHFvY0lnbGUvS0lW?=
 =?utf-8?B?bmlTSU9va1BwK3ZlbTIzV29tVXhmKysxcUZFT1dSakFiQ25kbFpDWUhUaEZ1?=
 =?utf-8?B?VFVGNnlja3ZkOU1rN3l3UGlSUkZXVWp0R25YbjZiWCt0K2JvYnRNSFY0Z1Jv?=
 =?utf-8?B?SzdZT3k2QU04Mkx0a1UrMTl6Q2U4amlyU3lGczdxUEpGbmJMVmpmSSt5MmQ2?=
 =?utf-8?B?OHVPdGZTOXcyQVFJN3lLZTI3Tm5oVDF2cnJ3TkVBamVJUyt0TGw1eklDMjBU?=
 =?utf-8?B?dmt6LzVYdHErV2lGYWRJYjNlVHpGbGRhdEV0VDVsblJ0ck1jbzhSSE0yWERN?=
 =?utf-8?B?WmFON1NaajhLREQzVm4yQ25va0dQWXE1N0JaREVDVGtKNXJSOGJiSkcvUXN1?=
 =?utf-8?B?K2pGa2ZaMExBREZibXJ6ZXNpQ2dZNjFKamJ1M3MxTHgwQWZRZk44TE9LS3Qy?=
 =?utf-8?B?Q25PSWgyMlJXTy9JK25xcWlwRnI0QndXd2djN2xlUE9NeThJWUJxaGNZOSsx?=
 =?utf-8?B?VDUwZDZMb1RjUzBIUUhkS21aOUUvZjBTbm41eEJjRGRzVG5SZCtqMzVBTk9V?=
 =?utf-8?B?ZHBUUDJrSnZXZ01oNG9Bb2xIVW9vQTQzaXJHNTMvdWtsQVloT2JOOVU1cjlT?=
 =?utf-8?B?OUFLRENhN0ZQZkFpbzZwRGJWcUR1VlRmZG95YUdrRnc3amdXbXJNdFNnRDRo?=
 =?utf-8?B?amVMSGpGamxDTFdwMUxBU0hWNWprTHZpYk5DbzVSZmpmWmRuTHhIZE1ySnBZ?=
 =?utf-8?B?Sy92R3A5M3RQa1pMUXVpSjAzWURoZ1Y1U1ZVd3A5OURQY3ZKU0V5dS9WLzY5?=
 =?utf-8?B?Y0lUeHdLZG9PZVhDRC9VWWRvK09vMEYxeUNxQ0Q2NnlYbXpLcklnY3VNSUpn?=
 =?utf-8?B?SlhqOE1uc3VGbUg3MmhTR3RraXBRbytZNFNzS1l6aXpBWEZIMElNTkhaL2ZJ?=
 =?utf-8?B?MzRCdjJMSmwybnhFVkxPeTJ5VVcvNEZPRy9GMmMrM25mNnVrMUdTcGc3ZW9l?=
 =?utf-8?B?T1paZllaaHhsdkNLVUlpWmx3MlBibVZoSkE5MHFWNTJ1elRmZW9ETTI3L3BX?=
 =?utf-8?B?MFdlcGE4bWUrTUh5ZS9OSEVhY2diNHVaVE1NdkZLSm1sdlpwaUFkc3VSVTZy?=
 =?utf-8?B?aktRNnUvQVRkYWVvWERSRnladkFJNFIzRkczSmFqNXI5L3lNRVlMY1kvUDB2?=
 =?utf-8?B?c3VwSWx0dEo1ZFNmazdSNWxiS3oyNmtCdmh6cU9tei91a0NQOXNQNXp3bDBL?=
 =?utf-8?B?d3U3dTVRTWhOeW9ZcXMvbEJKY3RraUQ0R0VjSWpLbE5jK09WQU1rbkUyQ3dU?=
 =?utf-8?Q?tSb5CazOco3A0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnBBQldPd0hDUDR6UEJ5WjBBQzY0dDRsaENpNnJDMUpqWHBFN0hOOGVqTjZj?=
 =?utf-8?B?NUhxVEtqeUNKeWIrS0tqUkNNaDRKaGpQUEdwYXJKTW5YeUJOTzJpcHRUVk5M?=
 =?utf-8?B?V3Z4YWdrOXhnRW5Mcm9RNTFJeFV1eVQvWEh1MFE1d0huTlJyRmtWTGt4VFZU?=
 =?utf-8?B?ZE9SWUJ6ZGIyY2I1UHpQVWg2dmhvVFFOOEppRkVUaWN0QWREb1A5U25nd0pH?=
 =?utf-8?B?amNTV1VEZ3h6Wm50cjJ0ZEhQc3FjbElBUHFLZ1B5V3ppUWhyWkZoQmRYN1hH?=
 =?utf-8?B?bVlWdmdmbGFqU0lkblEvN05Oa1FzSmJqSWVpZUk4c0l2SkpRMHpNMUpvK0J1?=
 =?utf-8?B?eTJJWEN6NlFra2pRSU1WMGx6UTIvdVZBc1EvVjlWOEF5Ly9lQVVWNnArUnlt?=
 =?utf-8?B?UHJTNDliNnBkdmpQdWZnQmxoTk1EVUtha0IwQ1BzR25PL2xFeXFsRzU1Mzk3?=
 =?utf-8?B?TndwQXd4anJsRXJDY3dMVU5kYnlqYS9sY0xKWTIrdUpkUnRkcjdKd2I2bTdP?=
 =?utf-8?B?amMwU3FMOG1xay9zaTFBNHJGcGxPdG5INWVXRTN4SkdFdTB2SjJiTlRVU0hu?=
 =?utf-8?B?WWYvbWtFMnhwVFdoRGpIaGlMZU5PVDlzYmlZV3IyMFp4dE05SUV2U1FEV2hq?=
 =?utf-8?B?c3lKS004czNLWXBCMWtYaGYwK05XQnF3VldVVVF3RUlSWnlFSE9SNnFmZTZW?=
 =?utf-8?B?ZUJRWlJIQ2hRYVppbzliU1Q5L1ZQK1Q4bGZ3QVdMTjZOSnBTbWpuanBid0NZ?=
 =?utf-8?B?c2tncEFwS3pHV3RNZHI3cERhcW45L3Z2UWp3c04wbTF5b0hEVTgrQkZkQ2I1?=
 =?utf-8?B?ZDdIQ25QWWx6RDV3eDd4ajdGcXBTVCtiMVpKSXF6M21NSzFSUjNFYzljSVRu?=
 =?utf-8?B?YUFWK1h5Y1BtTCtQYnBHeWFsejE0K1hCOGIxUlFEMlVqTy9OY2E2clhjN0JO?=
 =?utf-8?B?VHlVcjFkbW9tRTNPZXRFcGdKWXZ0Ty9FRzZGd2diOUNRaDNuTWFFU3JkZGNJ?=
 =?utf-8?B?cHBwTkNmUmlsT1YrTWVMY0U2UEpVSlpKSmxLYzlzUFl6MHkzTlVhZ1gxRzJD?=
 =?utf-8?B?VU1CVzNlaDV2ZTNwRG1rdWF4ZkQ4Tyt4cGFaRGEzWXl3bHZuYzZiRUoydG91?=
 =?utf-8?B?RjAwb2haL3l6TWlWYXB5UlpYQnZmUng2K1MrNjR0ZlY2TUpDN3dha3d3N2tL?=
 =?utf-8?B?a0lEeHBWbmJnZ3Y0SmNkWEJyRm5yRlpvdjU3aUJBd0M0ZllCbmFSUmV1Rjc4?=
 =?utf-8?B?MUxUSVBDbWJZUHpJN0xwdU1aMk43bkNhUyt4MXRRdWg4cTZrNlEwOGJ1TEhB?=
 =?utf-8?B?Y3MzNkNHZ0l2eDdOOW1wclpnUDhIWEtFdU0rL0tzRjAydlAxSmI0WGdlZW5x?=
 =?utf-8?B?TGZ2eXJJR082eWY5VWFXSUp2dU9vcVM5c01SRThYUkd4QUhUek05WXdCS2Rw?=
 =?utf-8?B?NUd5WnBldTRzTGdTMTd4bTJxK05La2hHTlBFbnUwQmVTS1ptWmlRakZSVHZr?=
 =?utf-8?B?WDNUcVp5OVZ6SXBGeGxHK3dwdWhZVXBDN3pOckhPUk9TUHl6R0tLbHpDVmY2?=
 =?utf-8?B?RTZjUDR3bXE3ZUtHc0lmcTF1bFh6b1BHbXJUZXVsWnRZUTBwQnBvNGwvK01w?=
 =?utf-8?B?Z3Z3bjRuQkFXYmxxQU93ZEg3a0g5N0E4R05lbUpsWnF1VzVrYWpLRnhnUVRK?=
 =?utf-8?B?ZnJoZXcxTTFzN0NTcmJLbjUxd0YvOFJiVjJEMHlkVHQvRHBnUXhpUS9WS0RB?=
 =?utf-8?B?ditzT1dSZHRRL0N0bGpRMCs0bDdkbW9xRnJmdkd1dm5zaDRMZkFRSEVqOHpS?=
 =?utf-8?B?ZHJRQm0rY2NXSjNpUHVkWlBkNHRMQTZTL3UycUI3MHpYY0lLN2hYQUE2RzRW?=
 =?utf-8?B?QUp1QWxsZFhrUzFFQ0FlM0Q1c3duTWF2a1JrNUJNc01yaC84VUMvUDN1Nzgr?=
 =?utf-8?B?OVVKRlhoeklBdW90aEMyRTI4S3NHK0Q1TTc3bFpzMWkydi80MktaM3hWQ2c2?=
 =?utf-8?B?OTVPU1RGSWtxK2ozRWRkVTFHSGNucWJudHh1QlNHOFdaRk94TnNpQzduNWo5?=
 =?utf-8?B?WXdVRjdlMncrNWMzVHRiUTRPVGtRb24wUzJDMm1KcFg1QUZuMXZtcHRVMTBm?=
 =?utf-8?Q?dGtQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f112db67-7b66-435a-8281-08ddcb651e1d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 10:22:11.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQVF4+oTTPAV1H0+Z5SukhmB825RUggFvb99KnZfUrv88a6TAK1xZ6JxNe1VSDju
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6972

Hi Sultan,

[1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't 
verify on 6.15 but we are really glad to help, would you please provide 
some info,
1. Suppose you are using Ubuntu, right? What's the version?
2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?

After your confirmation, we'll see what we can do to enable your camera 
quickly and easily

Regards,
Bin

On 7/24/2025 2:12 AM, Sultan Alsawaf wrote:
> On Wed, Jun 18, 2025 at 05:19:51PM +0800, Bin Du wrote:
>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>> (https://ubuntu.com/certified/202411-36043)
>> This patch series introduces the initial driver support for the AMD ISP4.
>>
>> Patch summary:
>> - Powers up/off and initializes ISP HW
>> - Configures and kicks off ISP FW
>> - Interacts with APP using standard V4l2 interface by video node
>> - Controls ISP HW and interacts with ISP FW to do image processing
>> - Support enum/set output image format and resolution
>> - Support queueing buffer from app and dequeueing ISP filled buffer to App
>> - Starts/stops sensor and mipi csi when camera App starts/stops streaming.
>> - It supports libcamera ver0.2 SimplePipeline
>> - It is verified on qv4l2, cheese and qcam
>> - It is verified together with following patches
>> 	platform/x86: Add AMD ISP platform config for OV05C10 (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>> 	media: i2c: Add OV05C10 camera sensor driver (https://lore.kernel.org/all/20250408221246.911508-1-pratap.nirujogi@amd.com/)
>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>> 	i2c: amd-isp: Add ISP i2c-designware driver (https://github.com/torvalds/linux/commit/d6263c468a761cd4c89887073614394ac48441e1)
>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
> 
> Hi,
> 
> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
> 
> I cannot for the life of me get the webcam working under Linux. The webcam works
> under Windows so it's not a hardware issue.
> 
> With this patchset and all of the patches you link here applied to 6.15, I get
> the following errors:
>    [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
>    [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
> 
> With the old ispkernel code from February [1] applied on 6.15, the webcam
> indicator LED lights up but there's no image. I see these messages at boot:
>    [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
>    [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
>    [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>    [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>    [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>    [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
> 
> And then the kernel crashes due to the same use-after-free issues I pointed out
> in my other email [2].
> 
> Any idea what's going on?
> 
> [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
> 
> Thanks,
> Sultan


