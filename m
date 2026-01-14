Return-Path: <linux-media+bounces-50683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A42D1E1DF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D18A30158C8
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AD138FF16;
	Wed, 14 Jan 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oMUpMkzY"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C82FD68B;
	Wed, 14 Jan 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386902; cv=fail; b=lM16YVLENtOXMjcISziCAqBgAC+nVKCI7FYqxjEaMRNcrL27oflLbo+7zgid3uakiIio6WTpBHk5SlQWqkLx4PsNBlOPfq2CdzoCdxM6JqZTEwacrFvZ2mJ5bPwTSrMAWuACeg3doaK1RZri6eLMVCOhWxlHRp40d05dKHYBxrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386902; c=relaxed/simple;
	bh=oOJiwZsKfe55Gr3H5AOvP2cdWEExc905vx7YklA5iRM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gB+LKKLfppqLY4dRh52m0mYAjllKZPc66AmJQaT2yoMTOOXWFzi8YKsps1ztB2aY1DDBK+7VWiYgEiaohrApAo3Q8GJzdg+oPwZop3lfYsGU7a64BgbUTNmKCYTpjm3CdNvDPPVGbB4I2VA4Ik2AlWYSb6/ySlKLzjCMAGXzZoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oMUpMkzY; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQkdwBDlW59OugpBCHhM5rFCTsC7nbeulxbFITVnvC+RpqpIYjZm07zY75KU3dTZ77Xpy4JNHUEo6fMODuB/HOYB9qcpbYJqsnEXT9gZ2sGjxG6mZzKUUJYHkLRKd70X2TQlbwhjdiyz9QpFfhYaVt8Y3zWBD+Jwk7UqpnB9V+1qflMsVpLDGG2+fbNp2gYdUuTVHQH5ltcfgg6N3ncOj+qJzmGYJjHFCC828ejmk6Uw6RBjHE+nGzRq0gGu0c/Oo8xKWE1axCkTJTZskKMP6lQJ8YunGVHwZsZmHmr9udW6E0VozT9+mAIyZwEKwbgCayHu1d1Ah7xN5H6FCEJdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jb+aGJwhX9gaWgcgjrpjxh9zyb7oi9KEpjD/29KXeiw=;
 b=ki5KXojRTTWJo8TmoF88PIip9madwNjSFvxpjQOWUAPARLwpZNbQGlXYWoxmplXpeDS+ZejZSQbjuRv34p6BdHHyoWmPWuoKqHlq7mUVNE+F7UWe/FayWhOSJYbUHH9X0oUjDPiTyAGtReGVhn6/FSDWCXtqX6ayMF+NgulTV7aLxUfO59n/fIbg93bLxDbAn0Q1Q9lOMyFwwX/P1LSEh25N6DqG3heurHWITwkk8aBKqSDSeOQQy6+EanF/zYYI/qXSMI2EZsZ90O0uNtpg++U0ssTrtHPKQziuKiOstJt2KTL2Z6sqWCJyBjM+fZG4eRq8H8+0vxeM7k3pMAEsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jb+aGJwhX9gaWgcgjrpjxh9zyb7oi9KEpjD/29KXeiw=;
 b=oMUpMkzYGPPPxhYYwI9X+0DCcvDU9Wqxk9HDUl/G3EEVZpu7p6/Sgj4Qi5hqHqSHMwCNXHTEOuC+zh8ukW2qP9ElrlA578TQe2DaEw7scUUgfh5aD4dAogdVlyqs7iYiwW4u/e5j+BpKONNXJxyArR7mne344wGPlTFNYhWarrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:34:45 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 10:34:45 +0000
Message-ID: <62bd8248-dd8a-4d51-8a85-ad13d3a03180@amd.com>
Date: Wed, 14 Jan 2026 18:34:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aUkZP8i90uWaFliY@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:194::7) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: 50b8b2bb-e228-490e-6628-08de5358888d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmdZUTZCWXRWOWRHR0EzTytwbmZtRS96T2g5dGE2cGo5VW9hbi9SVm52OGdy?=
 =?utf-8?B?YlpibUJjcDAxWjlRcUtiK21ibDJYVkRvV3pVdmNPdU9oVUdaclhob2JoWGxl?=
 =?utf-8?B?OVBNOHlpdzBOaXN0K3EzL3hFNWNldzJWUGJNSCt5a3NPWmJaOHJBZjRVM1N4?=
 =?utf-8?B?WnZPMjJoRkl2VDRNdEs2Ui9UcG9JUENxQnRJeXMwblRmVmpsUlBPNHZldUM0?=
 =?utf-8?B?UmZsR2ljcGFxelZzNjg1QkhKREMxRGZhMlB3RXFvMlVYeXo0aU1JcitoM0p5?=
 =?utf-8?B?K0M2YjlteTZESkkzdmR4MCtRS2xtL3JhQ0tLSnd6c09uSHFxNHFxRGVvaW5S?=
 =?utf-8?B?KzRtQmlZQnN0QTZJYUxGdW81cUo5WmQyTTNSVHRqWldacmdiRWZjY1ZXVDI0?=
 =?utf-8?B?VG84eTJIK1FBUmYrVjhKYnZCVEowV1EvOHpyU2pvTjBsQTR1dkpCcFdJYlRX?=
 =?utf-8?B?UEEvRmtYdFhLYSsvZkdEOVcxV3NqUXRhNVg5R1crVEFnZkFwNE0zSDYwRGtz?=
 =?utf-8?B?dW1tOVIvQWhGZGt3L2lWaXllWnkzZTBGOVlxZnErYVQ2R1dXeWQyREJzeWFk?=
 =?utf-8?B?Vm9HQ1pHQlBrVTlrVHdLZXlvU0kzeXlwdklQQmxQcDl0MkhnZnJ6MVM4cHZl?=
 =?utf-8?B?LzNSZDhFdkkzMTlaUDlrWGR6Wjd3TGJ3OSt3SytlUGhCbUszeUJhcmIzY2tB?=
 =?utf-8?B?UHg3QlNucXp1czUzSFlVS1V5TFFPUEcxQU1kUDlDSDBIMStyL1A2UXFTRy9N?=
 =?utf-8?B?ZWpFYWNzdGJxK2VFcVY3bU1RTkluSFc1K1hoaDFyNElQbkFxRFNsa2s2R05l?=
 =?utf-8?B?RWQ3YUhwd0xOWHNRS1JSenNoeitIbHlXYXpMRWNrS1FtS2VYUXh4N0U5QkI5?=
 =?utf-8?B?QnNmUWJsSjFpUS9PMW0vUWpsQ0JBalc5Y1NoRFcyVHY0Yms4RWtrNGcrUE1t?=
 =?utf-8?B?SENMdy9KcGNEc1JYdU5WVFgwdS8xTlp6YVRmTjAwakVRMFVCZm5vVjU5cUU1?=
 =?utf-8?B?VFhzUHN1RlFZT2dqYko3UFJqWkgrZkdxaWVobGVWU0RxcWRId0FVQ0plN1Bi?=
 =?utf-8?B?VzEzbDhzQ1ZOVE1qc2pDejNJM3ZuL3AyRWx5am95bWFjUnEycjR6OXV5SGVR?=
 =?utf-8?B?V0dESXh2Rm5Wc0cyczFMd2dqcDRjdSt3eXI0ejNPQk5ZY1JxV0pKVmltNkly?=
 =?utf-8?B?ZmxHK3U4VGpTSDRaK0xjbTlCMzc0V29JZllKSUNyc2NpUEs3SmptY3ZLSWVq?=
 =?utf-8?B?ZmNBUWx4enBiWXdML25IaHJhOFRyUExBUmRPdUVBaTFZaUxpZWttclhBQ0Zz?=
 =?utf-8?B?TlZHcG5XZCtDUVZrNkxUN0ZwRy9oOW9lckpjeG1xZUJrWWxGYjdIMXVRQ1Jk?=
 =?utf-8?B?b09PYm40NDBuTnZhaVhuVlU4QmVRR2t2QTBicm5MamVJUUIxUTUzaDdiOFIy?=
 =?utf-8?B?VWJqTmM1RjdaRDFSejUxeldLeVBmNDlob3pSRVAyYWQ3ZERZV09HMEYySlN5?=
 =?utf-8?B?ME1pdG4vOHhOTWQ0c3FYVUkyTE1EcTQvQ2pMZlRham56eFA2RkhWaFp5TEwx?=
 =?utf-8?B?UitkMm55YmZMLy9RTUZlaXZFZ0Y0d2p5MlZsbXVoM2pwdG5GUEsxUUdKOHJU?=
 =?utf-8?B?bGJsM1BRRkI2KzhoaFEzL0JhZjJFUmR4YU9Gd0Zhb041NnBFNHdKb1BySFlD?=
 =?utf-8?B?OUQ5cmJOU2d3eEtqMG9UZFZYbzVhSDd4MHo5RWliVlVDZkt2MHFKQkZ6SVlx?=
 =?utf-8?B?UW5nOTUrTTA1Z3NEUzRlTzhnb0hDejQxSTZ2Y1VhRElsK0U4TXA0YXVST0Jz?=
 =?utf-8?B?L0p1M3NYdzBxREpCWjJlLzV5SEo5VGFIRVoxOXduNWZEL05qcGhnS0tVR0Nx?=
 =?utf-8?B?T0EwUElqYU90aFhHOEcwRlZFRFRwOTdYTmg0UXJwRTRER2grNzRjQ2VydkNz?=
 =?utf-8?B?SU9qN0dacUZXWmw1dkxrTkVpc2FCU1paOEJlY01oSFJ2WXcxWWhWcGtUQkFQ?=
 =?utf-8?B?SjFFUmVwSVZYbUlPNWlGZ2tzbE9mK3NBdnYzSFBCeWQ4dmJYVU9zVWVmQ0R3?=
 =?utf-8?B?QkJQSzJrVU1jL1R5enJtbW5rdjNvcGVmQXkxZG92TU5Fa0cxekVsTHVVZFAy?=
 =?utf-8?Q?fOJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUV6R2tGVWpZK29oL1Y0blh1NkN6dkxZb0x3RDZ6bXI4bTFpWUpNdENGZUlU?=
 =?utf-8?B?Y0VPRU5VY3MycW1kUlFZNmFiaEN2RElNZzNVUDEyVTVKd2w1ck0xMys0cm1N?=
 =?utf-8?B?c3BIMmJZMEpmV2IzNy95OFNkbG83NmM4c2xqYTMxcmg3ZzMzVXVnSElGN1di?=
 =?utf-8?B?eWQ5TitiK3BmRWhVTFUrTVl0QlpQaUo5aDN3R0VOMzRVMUhSU09aTDNmZUhL?=
 =?utf-8?B?THZyNzhmamxWNUgxdEpQTFRhS1pLK0lWYVlENnZHU0xRWlZJaTBOS21xN05D?=
 =?utf-8?B?NFF5QTVEUHhWWjJ5Vks3STNQcU9CRXNjZkdPYVFUcWVnVG50bnVOeWRid1pw?=
 =?utf-8?B?MGJaNDBKT1UvYzJjM1FidlBiVXFhVWFUOGdZTDhMWkJwM1diK2Zkd2VWMmVL?=
 =?utf-8?B?WVJIanVKVjhFV29CT0Z4Z21PZ21vY2FaM3lyL1BLbHAwV2pOV2tyaXdvUnVY?=
 =?utf-8?B?RjBZTzRGWVQvY0MxR0M2dlE2dFJPbVdWWmFTZUU3TGJLNks5dE4wTU1CSjVi?=
 =?utf-8?B?bWxjem9lUXVia3JsL1g2WEFGTktTcnlBVHBwTkg1dU5iNlp4WmhFaURhc0pQ?=
 =?utf-8?B?N1pURGE2V05HaDh3WHhIWWxtTnExb05BbjM5Yy9rSG91RWtuc3l0UXF5N1p4?=
 =?utf-8?B?R1dObUZoVkJEdHdPMDdtaGNXdEJCVFZDUStPejJqS2tjSXVZa3oyV3VpREtj?=
 =?utf-8?B?WDVHcGhyU0RxRUtrSTdyL3NwV1luRzhsZHc2dXlkRFZQbnpXcG45OU9FUS8x?=
 =?utf-8?B?RXhxdWJoN1JEUW94S0ovOGU2Sit5TUJITUc1bnVHa1JnWmxVR0FJcWdyODlj?=
 =?utf-8?B?SjlFdkVpaHFMVHJjb3ZnWDVScXUvZkhoa200aWp1a0xaYkpSd1BmTVJCdE5M?=
 =?utf-8?B?alNXcjNLR2FOa1VQcElFYU9ESUQzcy9Oa1dEc2E2Z2dqekRJWFlXSnZ4ZDd4?=
 =?utf-8?B?T3FEYnNMK3JVNXFITURzUmpibW1FbmUxOWVkcmZnUHlROVMxb2Ztb2NnZ0pD?=
 =?utf-8?B?QURHcklSb0cwUFBMRmlpSWNVNmNIVE5qUWpZVWRVNmNzbjRSY2lmYkdrdEtG?=
 =?utf-8?B?RXdtbjFnbU9VYXl5NGd4bG4zVERyTG5hejEzb3grd0IxS0FuaURHK1VObDJO?=
 =?utf-8?B?Snhaeld2QVY4dzRqc05QUlBpY2w2UnBMaWZ1VWZSaFBNdEI3OEFvZ2RHVzFV?=
 =?utf-8?B?NU1nRldjbHRzV2hpaEJVeUxNSWh2d2pReEVEVHhyZDJobGVENzdISEM4b3Yw?=
 =?utf-8?B?SHhMKzJaTndCSnloVDUvZ1lTOTJicXZib2JMNzRKMDlnQkVobU5WbUllMkJz?=
 =?utf-8?B?SFhpM3Z0WEZWY0c1Ryt4cGdMc1I4YVRLK3NpNW11OG9wakl5Um9aa1BCNyt0?=
 =?utf-8?B?Y1BiNzlFcCtVWjZOODNrdXUxWC9FRmNtR0NkOXlTTE9mMWl4WmFDNWJ4azRk?=
 =?utf-8?B?eVNNUjNOZ0ZUZ0g5dnVnNlM4RnA4TzhHMGNnc002d1JXc1R4RG5jcDc3V0dm?=
 =?utf-8?B?L05TYVByc2FxcGs1aTZQNVVmTjllKzZNZGxkUEMxS2Z5bXNaQi9iMm1UREZD?=
 =?utf-8?B?eHhBcGYrakdnYjlFczRMM0podWxHRmE4bTFVa1QzMlBiTmdyZnBENW9PdDh2?=
 =?utf-8?B?MWhJSjJWV1lFaUwxb2dPQzVXT1VFL2szcldwZ2Nma21QVlRCczRueDl3TkZq?=
 =?utf-8?B?SUxwNVU0TWJOVVp6OGpTa283bTliMFg3RHhyRks4V1d1ME50VTQ3MXFmc2tv?=
 =?utf-8?B?VFA4QVhibGh5WkVTamQzeW9BR2JlQ2tmU2M3emk2WGJIdU5QWnhuamJRbFdE?=
 =?utf-8?B?TFNtc285SjIyaVBKY3JOQ3F0bmgya2lERmtwUDFacnFBNGVaR1EvNlpKWFhq?=
 =?utf-8?B?YkdsTXVua3RBeG81U2xBS3VhTTRtWEkrZVQwVXlJYyttdE1UOER3ZlE5TWJu?=
 =?utf-8?B?WXl4QzV5SzlBMmFrdUtTSjZWcm5WdS9SL2pHaVAzcVg4amg5THhvVm9IeHp4?=
 =?utf-8?B?WWJhNTlRQ2dWbi9hSUJ6YTNLMDFVZ0JGM3gvYkkrME9MbnZvcFBwMkw3OE5h?=
 =?utf-8?B?WDNoS1BGMEdIRkVwZjFZb2dsZlVINTJIMCtzTjdqWTlsU2ROVC9QdUdSV1dy?=
 =?utf-8?B?aktYUkFpNGdMRWV1c29YWjJGdmlRQ0orMnB2eThYQ1VoMzdvVlpYd3dTcWhm?=
 =?utf-8?B?Ky9wMmxBb0hZcURMaUdKbE00clJhU0pSMmpNWDYyZyswcUVCbk5VWExJNE8w?=
 =?utf-8?B?TkFHalZSQ2NTQXVtYnlTY0hPRVZ0QkIxZlZwYTV4TXV5T2h4VVJZRnZ5UCt2?=
 =?utf-8?Q?7CTIS7ePJ544l1VOns?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b8b2bb-e228-490e-6628-08de5358888d
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:34:44.9909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c763QF6hVqUabe+Ok0v92BzFRPnUz3UW7F2tDzU6X+3W3/uHgvo1vs6TJCTyA/go
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195

Thank you, Sakari, for your review.

On 12/22/2025 6:11 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Dec 16, 2025 at 05:13:23PM +0800, Bin Du wrote:
>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>> capture video node, and supports only preview stream. It manages firmware
>> states, stream configuration. Add interrupt handling and notification for
>> isp firmware to isp-subdevice.
>>
>> Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
>> ---
>>   MAINTAINERS                                   |   2 +
>>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>>   drivers/media/platform/amd/isp4/isp4.c        |  99 +-
>>   drivers/media/platform/amd/isp4/isp4.h        |   7 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 975 ++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4_subdev.h | 124 +++
>>   6 files changed, 1202 insertions(+), 8 deletions(-)
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cccae369c876..48ffc8bbdcee 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1149,6 +1149,8 @@ F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>   F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>   F:	drivers/media/platform/amd/isp4/isp4_interface.c
>>   F:	drivers/media/platform/amd/isp4/isp4_interface.h
>> +F:	drivers/media/platform/amd/isp4/isp4_subdev.c
>> +F:	drivers/media/platform/amd/isp4/isp4_subdev.h
>>   
>>   AMD KFD
>>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
>> index a2a5bf98e912..6d4e6d6ac7f5 100644
>> --- a/drivers/media/platform/amd/isp4/Makefile
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -4,4 +4,5 @@
>>   
>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>   amd_capture-objs := isp4.o \
>> -		    isp4_interface.o
>> +		    isp4_interface.o \
>> +		    isp4_subdev.o
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
>> index ad95e7f89189..bcd7cad32afd 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.c
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -3,15 +3,19 @@
>>    * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>    */
>>   
>> +#include <linux/irq.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vmalloc.h>
>> +#include <media/v4l2-fwnode.h>
> 
> I don't think you need this one.
> 

Yes, will remove it.

>>   #include <media/v4l2-ioctl.h>
>>   
>>   #include "isp4.h"
>> -
>> -#define VIDEO_BUF_NUM 5
> 
> What happened with this one? Is it no longer needed?

Yes, it is not used. It was added in the first patch and removed by this 
one in the set, so, will not include it in the first patch.

> 
>> +#include "isp4_hw_reg.h"
>>   
>>   #define ISP4_DRV_NAME "amd_isp_capture"
>> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
>> +	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
>> +	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>>   
>>   static const struct {
>>   	const char *name;
>> @@ -19,27 +23,97 @@ static const struct {
>>   	u32 en_mask;
>>   	u32 ack_mask;
>>   	u32 rb_int_num;
>> -} isp4_irq[] = {
>> +} isp4_irq[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
>>   	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
>>   	{
>>   		.name = "isp_irq_global",
>> +		.status_mask = ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK,
>> +		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK,
>> +		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK,
>>   		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>>   	},
>>   	{
>>   		.name = "isp_irq_stream1",
>> +		.status_mask = ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK,
>> +		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK,
>> +		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK,
>>   		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>>   	},
>>   };
>>   
>> +void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable)
>> +{
>> +	u32 intr_en;
>> +
>> +	/* Synchronize ISP_SYS_INT0_EN writes with the IRQ handler's writes */
>> +	spin_lock_irq(&isp_subdev->irq_lock);
>> +	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN);
>> +	if (enable)
>> +		intr_en |= isp4_irq[index].en_mask;
>> +	else
>> +		intr_en &= ~isp4_irq[index].en_mask;
>> +
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
>> +	spin_unlock_irq(&isp_subdev->irq_lock);
>> +}
>> +
>> +static void isp4_wake_up_resp_thread(struct isp4_subdev *isp_subdev, u32 index)
>> +{
>> +	struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[index];
>> +
>> +	thread_ctx->resp_ready = true;
>> +	wake_up_interruptible(&thread_ctx->waitq);
>> +}
>> +
>>   static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>   {
>> +	struct isp4_subdev *isp_subdev = arg;
>> +	u32 intr_ack = 0, intr_en = 0, intr_status;
>> +	int seen = 0;
> 
> Is int appropriate here? Should this be u32 or u64?
> 

Quoted below is Sultan's reply regarding this,
"ffs() is just a macro alias for __builtin_ffs(). The parameter and 
return value
of __builtin_ffs() are both int."

>> +
>> +	/* Get the ISP_SYS interrupt status */
>> +	intr_status = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_STATUS);
>> +	intr_status &= ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
>> +
>> +	/* Find which ISP_SYS interrupts fired */
>> +	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
>> +		if (intr_status & isp4_irq[i].status_mask) {
>> +			intr_ack |= isp4_irq[i].ack_mask;
>> +			intr_en |= isp4_irq[i].en_mask;
>> +			seen |= BIT(i);
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Disable the ISP_SYS interrupts that fired. Must be done before waking
>> +	 * the response threads, since they re-enable interrupts when finished.
>> +	 * The lock synchronizes RMW of INT0_EN with isp4_enable_interrupt().
>> +	 */
>> +	spin_lock(&isp_subdev->irq_lock);
>> +	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN) & ~intr_en;
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
>> +	spin_unlock(&isp_subdev->irq_lock);
>> +
>> +	/*
>> +	 * Clear the ISP_SYS interrupts. This must be done after the interrupts
>> +	 * are disabled, so that ISP FW won't flag any new interrupts on these
>> +	 * streams, and thus we don't need to clear interrupts again before
>> +	 * re-enabling them in the response thread.
>> +	 */
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_ACK, intr_ack);
>> +
>> +	/* Wake up the response threads */
>> +	for (int i; (i = ffs(seen)); seen = (seen >> i) << i)
> 
> unsigned int, please. The parentheses around ffs() appear redundant.
> 

Quoted below is Sultan's reply regarding this,
"As mentioned above, ffs() takes an int and returns an int.
The parentheses are there because it's an assignment. Without them:

drivers/media/platform/amd/isp4/isp4.c: In function ‘isp4_irq_handler’:
drivers/media/platform/amd/isp4/isp4.c:106:21: warning: suggest 
parentheses around assignment used as truth value [-Wparentheses]
   106 |         for (int i; i = ffs(seen); seen = (seen >> i) << i)
       |                     ^"

> The increment could probably be expressed as seen &= ~BIT(i).
> 

Quoted below is Sultan's reply regarding this, Would it be acceptable to 
leave it unchanged?

"Yes it can be, but it adds several more instructions before the loop body,
without any improvement to the loop body (the sarx in the loop body is 
replaced
by andn). The right shift trick is faster and this is a hot path (IRQ 
handler).

Before:
      d8:   jmp    10d

     // loop body
      da:   lea    -0x1(%rax),%eax
      dd:   xor    %ecx,%ecx
      df:   mov    $0x1,%edx
      e4:   mov    $0x1,%esi
      e9:   lea    (%rax,%rax,4),%rax
      ed:   sarx   %ebx,%ebp,%ebp
      f2:   shlx   %ebx,%ebp,%ebp
      f7:   movb   $0x1,0x9b0(%r13,%rax,8)
     100:   lea    0x998(%r13,%rax,8),%rdi
     108:   call   __wake_up
     10d:   mov    $0xffffffff,%eax
     112:   bsf    %ebp,%eax
     115:   add    $0x1,%eax
     118:   mov    %eax,%ebx
     11a:   jne    da

After (with seen &= ~BIT(i)):
      d8:   mov    $0xffffffff,%eax
      dd:   bsf    %ebp,%eax
      e0:   add    $0x1,%eax
      e3:   mov    %eax,%ebx
      e5:   je     12f
      e7:   mov    $0x1,%r12d

     // loop body
      ed:   lea    -0x1(%rbx),%eax
      f0:   xor    %ecx,%ecx
      f2:   mov    $0x1,%edx
      f7:   mov    $0x1,%esi
      fc:   lea    (%rax,%rax,4),%rax
     100:   movb   $0x1,0x9b0(%r13,%rax,8)
     109:   lea    0x998(%r13,%rax,8),%rdi
     111:   call   __wake_up
     116:   shlx   %rbx,%r12,%rax
     11b:   andn   %ebp,%eax,%ebp
     120:   mov    $0xffffffff,%eax
     125:   bsf    %ebp,%eax
     128:   add    $0x1,%eax
     12b:   mov    %eax,%ebx
     12d:   jne    ed"

>> +		isp4_wake_up_resp_thread(isp_subdev, i - 1);
>> +
>>   	return IRQ_HANDLED;
>>   }
>>   
>>   static int isp4_capture_probe(struct platform_device *pdev)
>>   {
>> +	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>>   	struct device *dev = &pdev->dev;
>> -	int irq[ARRAY_SIZE(isp4_irq)];
>> +	struct isp4_subdev *isp_subdev;
>>   	struct isp4_device *isp_dev;
>>   	size_t i;
>>   	int ret;
>> @@ -50,6 +124,11 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   
>>   	dev->init_name = ISP4_DRV_NAME;
>>   
>> +	isp_subdev = &isp_dev->isp_subdev;
>> +	isp_subdev->mmio = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(isp_subdev->mmio))
>> +		return dev_err_probe(dev, PTR_ERR(isp_subdev->mmio), "isp ioremap fail\n");
>> +
>>   	for (i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
>>   		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
>>   		if (irq[i] < 0)
>> @@ -57,7 +136,7 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   					     isp4_irq[i].rb_int_num);
>>   
>>   		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
>> -				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
>> +				       IRQF_NO_AUTOEN, isp4_irq[i].name, isp_subdev);
>>   		if (ret)
>>   			return dev_err_probe(dev, ret, "fail to req irq %d\n", irq[i]);
>>   	}
>> @@ -83,6 +162,13 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   
>>   	pm_runtime_set_suspended(dev);
>>   	pm_runtime_enable(dev);
>> +	spin_lock_init(&isp_subdev->irq_lock);
>> +	ret = isp4sd_init(&isp_dev->isp_subdev, &isp_dev->v4l2_dev, irq);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "fail init isp4 sub dev\n");
>> +		goto err_pm_disable;
>> +	}
>> +
>>   	ret = media_device_register(&isp_dev->mdev);
>>   	if (ret) {
>>   		dev_err_probe(dev, ret, "fail to register media device\n");
>> @@ -94,6 +180,8 @@ static int isp4_capture_probe(struct platform_device *pdev)
>>   	return 0;
>>   
>>   err_isp4_deinit:
>> +	isp4sd_deinit(&isp_dev->isp_subdev);
>> +err_pm_disable:
>>   	pm_runtime_disable(dev);
>>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
>>   err_clean_media:
>> @@ -108,6 +196,7 @@ static void isp4_capture_remove(struct platform_device *pdev)
>>   	struct device *dev = &pdev->dev;
>>   
>>   	media_device_unregister(&isp_dev->mdev);
>> +	isp4sd_deinit(&isp_dev->isp_subdev);
>>   	pm_runtime_disable(dev);
>>   	v4l2_device_unregister(&isp_dev->v4l2_dev);
>>   	media_device_cleanup(&isp_dev->mdev);
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
>> index 7f2db0dfa2d9..2db6683d6d8b 100644
>> --- a/drivers/media/platform/amd/isp4/isp4.h
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -6,12 +6,15 @@
>>   #ifndef _ISP4_H_
>>   #define _ISP4_H_
>>   
>> -#include <media/v4l2-device.h>
>> -#include <media/videobuf2-memops.h>
>> +#include <drm/amd/isp.h>
>> +#include "isp4_subdev.h"
>>   
>>   struct isp4_device {
>>   	struct v4l2_device v4l2_dev;
>> +	struct isp4_subdev isp_subdev;
>>   	struct media_device mdev;
>>   };
>>   
>> +void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable);
>> +
>>   #endif /* _ISP4_H_ */
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> new file mode 100644
>> index 000000000000..3a25d1fc49ce
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
>> @@ -0,0 +1,975 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_domain.h>
>> +#include <linux/units.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_interface.h"
>> +#include "isp4.h"
>> +
>> +#define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
>> +
>> +#define ISP4SD_PERFORMANCE_STATE_LOW 0
>> +#define ISP4SD_PERFORMANCE_STATE_HIGH 1
>> +
>> +/* align 32KB */
>> +#define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
>> +
>> +#define to_isp4_subdev(v4l2_sdev)  \
> 
> Virtually always variables referring to a sub-device are called either sd
> or subdev (or variants of these). Up to you.
> 

Sure, will change it to sd to meet the convension.

>> +	container_of(v4l2_sdev, struct isp4_subdev, sdev)
>> +
>> +static const char *isp4sd_entity_name = "amd isp4";
>> +
>> +static const char *isp4sd_thread_name[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
>> +	"amd_isp4_thread_global",
>> +	"amd_isp4_thread_stream1",
>> +};
>> +
>> +static void isp4sd_module_enable(struct isp4_subdev *isp_subdev, bool enable)
>> +{
>> +	if (isp_subdev->enable_gpio) {
>> +		gpiod_set_value(isp_subdev->enable_gpio, enable ? 1 : 0);
>> +		dev_dbg(isp_subdev->dev, "%s isp_subdev module\n",
>> +			enable ? "enable" : "disable");
>> +	}
>> +}
>> +
>> +static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (!ispif->fw_mem_pool) {
>> +		dev_err(dev, "fail to alloc mem pool\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
>> +	 */
>> +	memset(&buf_type, 0, sizeof(buf_type));
>> +	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
>> +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
>> +			    &buf_type.buffer.buf_base_a_lo,
>> +			    &buf_type.buffer.buf_base_a_hi);
>> +	buf_type.buffer.buf_size_a = ispif->fw_mem_pool->mem_size;
>> +
>> +	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +				  &buf_type, sizeof(buf_type));
>> +	if (ret) {
>> +		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
>> +			ispif->fw_mem_pool->gpu_mc_addr, buf_type.buffer.buf_size_a, ret);
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
>> +		ispif->fw_mem_pool->gpu_mc_addr, buf_type.buffer.buf_size_a);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_set_stream_cfg cmd;
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
>> +	 */
>> +	memset(&cmd, 0, sizeof(cmd));
> 
> You could assign assign all these in the declaration and avoid zeroing the
> memory explicitly at the same time. I presume possibly leaking some
> information from memory to the firmware in case there are holes in the
> struct isn't an issue.
> 

Quoted below is Sultan's reply regarding this, does that make sense? 
Could you please make a decision so that I may continue?

"Leaking kernel memory is bad. Also, there is no guarantee that the 
firmware will
behave as expected with varying values for the padding bytes.

Please see my arguments from v4 on why these structs should be memset [1]."
[1] https://lore.kernel.org/all/aNTtLHDHf_ozenC-@sultan-box/

>> +	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
>> +	cmd.stream_cfg.mipi_pipe_path_cfg.b_enable = true;
>> +	cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id = MIPI0_ISP_PIPELINE_ID;
>> +
>> +	cmd.stream_cfg.b_enable_tnr = true;
>> +	dev_dbg(dev, "isp4fw_sensor_id %d, pipeId 0x%x EnableTnr %u\n",
>> +		cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id,
>> +		cmd.stream_cfg.isp_pipe_path_cfg.isp_pipe_id,
>> +		cmd.stream_cfg.b_enable_tnr);
>> +
>> +	return isp4if_send_command(ispif, CMD_ID_SET_STREAM_CONFIG,
>> +				   &cmd, sizeof(cmd));
>> +}
>> +
>> +static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type;
>> +	struct device *dev = isp_subdev->dev;
>> +	int i;
> 
> unsigned int, please. You can also declare this within the loop as you do
> elsewhere. Consistency is nice.
> 

Ok, will declare it in the loop by unsigned int for the consistency and 
check all the other for loop in the patch set.

>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
>> +	 */
>> +	memset(&buf_type, 0, sizeof(buf_type));
>> +	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
>> +		struct isp4if_gpu_mem_info *meta_info_buf =
>> +				isp_subdev->ispif.meta_info_buf[i];
>> +		int ret;
>> +
>> +		if (!meta_info_buf) {
>> +			dev_err(dev, "fail for no meta info buf(%u)\n", i);
>> +			return -ENOMEM;
>> +		}
>> +
>> +		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +		isp4if_split_addr64(meta_info_buf->gpu_mc_addr,
>> +				    &buf_type.buffer.buf_base_a_lo,
>> +				    &buf_type.buffer.buf_base_a_hi);
>> +		buf_type.buffer.buf_size_a = meta_info_buf->mem_size;
>> +		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +					  &buf_type, sizeof(buf_type));
>> +		if (ret) {
>> +			dev_err(dev, "send meta info(%u) fail\n", i);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	dev_dbg(dev, "send meta info suc\n");
>> +	return 0;
>> +}
>> +
>> +static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
>> +				    struct isp4fw_image_prop *out_prop,
>> +				    struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct device *dev = isp_subdev->dev;
>> +	struct v4l2_mbus_framefmt *format;
>> +
>> +	format = v4l2_subdev_state_get_format(state, pad, 0);
>> +	if (!format) {
>> +		dev_err(dev, "fail get subdev state format\n");
>> +		return false;
>> +	}
>> +
>> +	switch (format->code) {
>> +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
>> +		out_prop->image_format = IMAGE_FORMAT_NV12;
>> +		out_prop->width = format->width;
>> +		out_prop->height = format->height;
>> +		out_prop->luma_pitch = format->width;
>> +		out_prop->chroma_pitch = out_prop->width;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUYV8_1X16:
>> +		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
>> +		out_prop->width = format->width;
>> +		out_prop->height = format->height;
>> +		out_prop->luma_pitch = format->width * 2;
>> +		out_prop->chroma_pitch = 0;
>> +		break;
>> +	default:
>> +		dev_err(dev, "fail for bad image format:0x%x\n",
>> +			format->code);
>> +		return false;
>> +	}
>> +
>> +	if (!out_prop->width || !out_prop->height)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
>> +		return 0;
>> +
>> +	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
>> +		dev_err(dev, "fail for previous start fail\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(dev, "w:%u,h:%u\n", w, h);
>> +
>> +	if (isp4sd_send_meta_buf(isp_subdev)) {
>> +		dev_err(dev, "fail to send meta buf\n");
>> +		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
>> +		return -EINVAL;
>> +	}
>> +
>> +	sensor_info->status = ISP4SD_START_STATUS_OFF;
>> +
>> +	if (!sensor_info->start_stream_cmd_sent &&
>> +	    sensor_info->buf_sent_cnt >= ISP4SD_MIN_BUF_CNT_BEF_START_STREAM) {
>> +		int ret = isp4if_send_command(ispif, CMD_ID_START_STREAM,
>> +					      NULL, 0);
>> +		if (ret) {
>> +			dev_err(dev, "fail to start stream\n");
>> +			return ret;
>> +		}
>> +
>> +		sensor_info->start_stream_cmd_sent = true;
>> +	} else {
>> +		dev_dbg(dev,
>> +			"no send START_STREAM, start_sent %u, buf_sent %u\n",
>> +			sensor_info->start_stream_cmd_sent,
>> +			sensor_info->buf_sent_cnt);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
>> +			       struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
>> +	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
>> +		return 0;
>> +
>> +	if (output_info->start_status == ISP4SD_START_STATUS_START_FAIL) {
>> +		dev_err(dev, "fail for previous start fail\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
>> +	 */
>> +	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
>> +	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +
>> +	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
>> +		dev_err(dev, "fail to get out prop\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
>> +		cmd_ch_prop.ch,
>> +		cmd_ch_prop.image_prop.image_format,
>> +		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
>> +		cmd_ch_prop.image_prop.luma_pitch,
>> +		cmd_ch_prop.image_prop.chroma_pitch);
>> +
>> +	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
>> +				  &cmd_ch_prop, sizeof(cmd_ch_prop));
>> +	if (ret) {
>> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +		dev_err(dev, "fail to set out prop\n");
>> +		return ret;
>> +	}
>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
> 
> You should have explicit padding fields in any case and not rely on ABI in
> this case.
> 

Quoted below is Sultan's reply regarding this, does that make sense? On 
the other hand,  these definitions are shared between the ISP driver and 
firmware and have been verified. I prefer not to add extra padding 
fields to the driver as it would affect consistency. Is it acceptable to 
leave the definitions as they are?
"It is error-prone for a human to make sure that all padding bytes have 
explicit
struct members. And what about future changes to the firmware API where 
explicit
padding might be forgotten?

Unless the firmware API structs are all __packed in a future firmware 
update, I
think the memsets should remain."
>> +	 */
>> +	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
>> +	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +	cmd_ch_en.is_enable = true;
>> +	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
>> +				  &cmd_ch_en, sizeof(cmd_ch_en));
>> +	if (ret) {
>> +		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
>> +		dev_err(dev, "fail to enable channel\n");
>> +		return ret;
>> +	}
>> +
>> +	dev_dbg(dev, "enable channel %d\n", cmd_ch_en.ch);
>> +
>> +	if (!sensor_info->start_stream_cmd_sent) {
>> +		ret = isp4sd_kickoff_stream(isp_subdev,
>> +					    cmd_ch_prop.image_prop.width,
>> +					    cmd_ch_prop.image_prop.height);
>> +		if (ret) {
>> +			dev_err(dev, "kickoff stream fail %d\n", ret);
>> +			return ret;
>> +		}
>> +		/*
>> +		 * sensor_info->start_stream_cmd_sent will be set to true
>> +		 * 1. in isp4sd_kickoff_stream, if app first send buffer then
>> +		 * start stream
>> +		 * 2. in isp_set_stream_buf, if app first start stream, then
>> +		 * send buffer
>> +		 * because ISP FW has the requirement, host needs to send buffer
>> +		 * before send start stream cmd
>> +		 */
>> +		if (sensor_info->start_stream_cmd_sent) {
>> +			sensor_info->status = ISP4SD_START_STATUS_STARTED;
>> +			output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +			dev_dbg(dev, "kickoff stream suc,start cmd sent\n");
>> +		}
>> +	} else {
>> +		dev_dbg(dev, "stream running, no need kickoff\n");
>> +		output_info->start_status = ISP4SD_START_STATUS_STARTED;
>> +	}
>> +
>> +	dev_dbg(dev, "setup output suc\n");
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	ret = isp4sd_setup_fw_mem_pool(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to setup fw mem pool\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = isp4sd_set_stream_path(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to setup stream path\n");
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
>> +				 struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4sd_output_info *output_info = &sensor_info->output_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct v4l2_mbus_framefmt *format;
>> +
>> +	format = v4l2_subdev_state_get_format(state, pad, 0);
>> +	if (!format) {
>> +		dev_err(isp_subdev->dev, "fail to get v4l2 format\n");
>> +	} else {
>> +		memset(format, 0, sizeof(*format));
>> +		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
>> +	}
>> +
>> +	isp4if_clear_bufq(ispif);
>> +	isp4if_clear_cmdq(ispif);
>> +
>> +	sensor_info->start_stream_cmd_sent = false;
>> +	sensor_info->buf_sent_cnt = 0;
>> +
>> +	sensor_info->status = ISP4SD_START_STATUS_OFF;
>> +	output_info->start_status = ISP4SD_START_STATUS_OFF;
>> +}
>> +
>> +static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
>> +				    enum isp4if_stream_id stream_id,
>> +				    struct isp4fw_resp_cmd_done *para)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4if_cmd_element *ele =
>> +		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
>> +		stream_id,
>> +		para->cmd_id, para->cmd_status, para->cmd_seq_num,
>> +		ele);
>> +
>> +	if (ele) {
>> +		complete(&ele->cmd_done);
>> +		if (atomic_dec_and_test(&ele->refcnt))
>> +			kfree(ele);
>> +	}
>> +}
>> +
>> +static struct isp4fw_meta_info *isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
>> +						      u64 mc)
>> +{
>> +	for (int i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
> 
> unsigned int, please. Similarly for the rest.
> 

Yes, will do that as mentioned above.

>> +		struct isp4if_gpu_mem_info *meta_info_buf =
>> +				isp_subdev->ispif.meta_info_buf[i];
>> +
>> +		if (meta_info_buf->gpu_mc_addr == mc)
>> +			return meta_info_buf->sys_addr;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
>> +				  u64 meta_info_mc)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct isp4fw_cmd_send_buffer buf_type;
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	if (isp_subdev->sensor_info.status != ISP4SD_START_STATUS_STARTED) {
>> +		dev_warn(dev, "not working status %i, meta_info 0x%llx\n",
>> +			 isp_subdev->sensor_info.status, meta_info_mc);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
>> +	 * zeroed, since this is not guaranteed on all compilers.
>> +	 */
>> +	memset(&buf_type, 0, sizeof(buf_type));
>> +	buf_type.buffer_type = BUFFER_TYPE_META_INFO;
>> +	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
>> +	isp4if_split_addr64(meta_info_mc,
>> +			    &buf_type.buffer.buf_base_a_lo,
>> +			    &buf_type.buffer.buf_base_a_hi);
>> +	buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
>> +
>> +	if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
>> +				&buf_type, sizeof(buf_type)))
>> +		dev_err(dev, "fail send meta_info 0x%llx\n",
>> +			meta_info_mc);
>> +	else
>> +		dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
>> +}
>> +
>> +static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
>> +				      enum isp4if_stream_id stream_id,
>> +				      struct isp4fw_resp_param_package *para)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	struct isp4if_img_buf_node *prev;
>> +	struct isp4fw_meta_info *meta;
>> +	u64 mc;
>> +
>> +	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
>> +	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
>> +	if (!meta) {
>> +		dev_err(dev, "fail to get meta from mc %llx\n", mc);
>> +		return;
>> +	}
>> +
>> +	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u(%i)\n",
>> +		ktime_get_ns(), stream_id, meta->poc,
>> +		meta->preview.enabled,
>> +		meta->preview.status);
>> +
>> +	if (meta->preview.enabled &&
>> +	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
>> +	     meta->preview.status == BUFFER_STATUS_DONE ||
>> +	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
>> +		prev = isp4if_dequeue_buffer(ispif);
>> +		if (prev)
>> +			isp4if_dealloc_buffer_node(prev);
>> +		else
>> +			dev_err(dev, "fail null prev buf\n");
>> +
>> +	} else if (meta->preview.enabled) {
>> +		dev_err(dev, "fail bad preview status %u\n",
>> +			meta->preview.status);
>> +	}
>> +
>> +	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
>> +		isp4sd_send_meta_info(isp_subdev, mc);
>> +
>> +	dev_dbg(dev, "stream_id:%d, status:%d\n", stream_id,
>> +		isp_subdev->sensor_info.status);
>> +}
>> +
>> +static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
>> +				enum isp4if_stream_id stream_id)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	struct isp4fw_resp resp;
>> +
>> +	while (true) {
>> +		if (isp4if_f2h_resp(ispif, stream_id, &resp)) {
>> +			/* Re-enable the interrupt */
>> +			isp4_intr_enable(isp_subdev, stream_id, true);
>> +			/*
>> +			 * Recheck to see if there is a new response.
>> +			 * To ensure that an in-flight interrupt is not lost,
>> +			 * enabling the interrupt must occur _before_ checking
>> +			 * for a new response, hence a memory barrier is needed.
>> +			 * Disable the interrupt again if there was a new response.
>> +			 */
>> +			mb();
>> +			if (likely(isp4if_f2h_resp(ispif, stream_id, &resp)))
>> +				break;
>> +
>> +			isp4_intr_enable(isp_subdev, stream_id, false);
>> +		}
>> +
>> +		switch (resp.resp_id) {
>> +		case RESP_ID_CMD_DONE:
>> +			isp4sd_fw_resp_cmd_done(isp_subdev, stream_id,
>> +						&resp.param.cmd_done);
>> +			break;
>> +		case RESP_ID_NOTI_FRAME_DONE:
>> +			isp4sd_fw_resp_frame_done(isp_subdev, stream_id,
>> +						  &resp.param.frame_done);
>> +			break;
>> +		default:
>> +			dev_err(dev, "-><- fail respid (0x%x)\n", resp.resp_id);
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>> +static s32 isp4sd_fw_resp_thread(void *context)
>> +{
>> +	struct isp4_subdev_thread_param *para = context;
>> +	struct isp4_subdev *isp_subdev = para->isp_subdev;
>> +	struct isp4sd_thread_handler *thread_ctx =
>> +			&isp_subdev->fw_resp_thread[para->idx];
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	dev_dbg(dev, "[%u] fw resp thread started\n", para->idx);
>> +	while (true) {
>> +		wait_event_interruptible(thread_ctx->waitq, thread_ctx->resp_ready);
>> +		thread_ctx->resp_ready = false;
>> +
>> +		if (kthread_should_stop()) {
>> +			dev_dbg(dev, "[%u] fw resp thread quit\n", para->idx);
>> +			break;
>> +		}
>> +
>> +		isp4sd_fw_resp_func(isp_subdev, para->idx);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
>> +		struct isp4sd_thread_handler *thread_ctx =
>> +				&isp_subdev->fw_resp_thread[i];
>> +
>> +		if (thread_ctx->thread) {
>> +			kthread_stop(thread_ctx->thread);
>> +			thread_ctx->thread = NULL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct device *dev = isp_subdev->dev;
>> +	int i;
>> +
>> +	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
>> +		struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[i];
>> +
>> +		isp_subdev->isp_resp_para[i].idx = i;
>> +		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
>> +		init_waitqueue_head(&thread_ctx->waitq);
>> +		thread_ctx->resp_ready = false;
>> +
>> +		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
>> +						 &isp_subdev->isp_resp_para[i],
>> +						 isp4sd_thread_name[i]);
>> +		if (IS_ERR(thread_ctx->thread)) {
>> +			dev_err(dev, "create thread [%d] fail\n", i);
>> +			thread_ctx->thread = NULL;
>> +			isp4sd_stop_resp_proc_threads(isp_subdev);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
>> +		dev_err(dev, "fail for stream still running\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	sensor_info->status = ISP4SD_START_STATUS_OFF;
>> +
>> +	if (isp_subdev->irq_enabled) {
>> +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>> +			disable_irq(isp_subdev->irq[i]);
>> +		isp_subdev->irq_enabled = false;
>> +	}
>> +
>> +	isp4sd_stop_resp_proc_threads(isp_subdev);
>> +	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
>> +
>> +	isp4if_stop(ispif);
>> +
>> +	ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +	if (ret)
>> +		dev_err(dev, "fail to set isp_subdev performance state %u,ret %d\n",
>> +			perf_state, ret);
>> +
>> +	/* hold ccpu reset */
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
>> +	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
>> +	ret = pm_runtime_put_sync(dev);
>> +	if (ret)
>> +		dev_err(dev, "power off isp_subdev fail %d\n", ret);
>> +	else
>> +		dev_dbg(dev, "power off isp_subdev suc\n");
>> +
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +	isp4if_clear_cmdq(ispif);
>> +	isp4sd_module_enable(isp_subdev, false);
>> +
>> +	/*
>> +	 * When opening the camera, isp4sd_module_enable(isp_subdev, true) is called.
>> +	 * Hardware requires at least a 20ms delay between disabling and enabling the module,
>> +	 * so a sleep is added to ensure ISP stability during quick reopen scenarios.
>> +	 */
>> +	msleep(20);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	if (ispif->status == ISP4IF_STATUS_FW_RUNNING) {
>> +		dev_dbg(dev, "camera already opened, do nothing\n");
>> +		return 0;
>> +	}
>> +
>> +	isp4sd_module_enable(isp_subdev, true);
>> +
>> +	if (ispif->status < ISP4IF_STATUS_PWR_ON) {
>> +		unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_HIGH;
>> +
>> +		ret = pm_runtime_resume_and_get(dev);
>> +		if (ret) {
>> +			dev_err(dev, "fail to power on isp_subdev ret %d\n",
>> +				ret);
>> +			goto err_deinit;
>> +		}
>> +
>> +		/* ISPPG ISP Power Status */
>> +		isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0x7FF);
>> +		ret = dev_pm_genpd_set_performance_state(dev, perf_state);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"fail to set performance state %u, ret %d\n",
>> +				perf_state, ret);
>> +			goto err_deinit;
>> +		}
>> +
>> +		ispif->status = ISP4IF_STATUS_PWR_ON;
>> +	}
>> +
>> +	isp_subdev->sensor_info.start_stream_cmd_sent = false;
>> +	isp_subdev->sensor_info.buf_sent_cnt = 0;
>> +
>> +	ret = isp4if_start(ispif);
>> +	if (ret) {
>> +		dev_err(dev, "fail to start isp_subdev interface\n");
>> +		goto err_deinit;
>> +	}
>> +
>> +	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
>> +		dev_err(dev, "isp_start_resp_proc_threads fail");
>> +		goto err_deinit;
>> +	}
>> +
>> +	dev_dbg(dev, "create resp threads ok");
>> +
>> +	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>> +		enable_irq(isp_subdev->irq[i]);
>> +	isp_subdev->irq_enabled = true;
>> +
>> +	return 0;
>> +err_deinit:
>> +	isp4sd_pwroff_and_deinit(isp_subdev);
>> +	return -EINVAL;
>> +}
>> +
>> +static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
>> +			      struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4sd_output_info *output_info = &sensor_info->output_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +
>> +	guard(mutex)(&isp_subdev->ops_mutex);
>> +	dev_dbg(dev, "status %i\n", output_info->start_status);
>> +
>> +	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
>> +		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
>> +		int ret;
>> +
>> +		/*
>> +		 * The struct will be shared with ISP FW, use memset() to guarantee
>> +		 * padding bits are zeroed, since this is not guaranteed on all compilers.
>> +		 */
>> +		memset(&cmd_ch_disable, 0, sizeof(cmd_ch_disable));
>> +		cmd_ch_disable.ch = ISP_PIPE_OUT_CH_PREVIEW;
>> +		/* `cmd_ch_disable.is_enable` is already false */
>> +		ret = isp4if_send_command_sync(ispif, CMD_ID_ENABLE_OUT_CHAN,
>> +					       &cmd_ch_disable,
>> +					       sizeof(cmd_ch_disable));
>> +		if (ret)
>> +			dev_err(dev, "fail to disable stream\n");
>> +		else
>> +			dev_dbg(dev, "wait disable stream suc\n");
>> +
>> +		ret = isp4if_send_command_sync(ispif, CMD_ID_STOP_STREAM,
>> +					       NULL, 0);
>> +		if (ret)
>> +			dev_err(dev, "fail to stop steam\n");
>> +		else
>> +			dev_dbg(dev, "wait stop stream suc\n");
>> +	}
>> +
>> +	isp4sd_uninit_stream(isp_subdev, state, pad);
>> +
>> +	/*
>> +	 * Return success to ensure the stop process proceeds,
>> +	 * and disregard any errors since they are not fatal.
>> +	 */
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
>> +			       struct v4l2_subdev_state *state, u32 pad)
>> +{
>> +	struct isp4sd_output_info *output_info =
>> +			&isp_subdev->sensor_info.output_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = isp_subdev->dev;
>> +	int ret;
>> +
>> +	guard(mutex)(&isp_subdev->ops_mutex);
>> +
>> +	if (ispif->status != ISP4IF_STATUS_FW_RUNNING) {
>> +		dev_err(dev, "fail, bad fsm %d", ispif->status);
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (output_info->start_status) {
>> +	case ISP4SD_START_STATUS_OFF:
>> +		break;
>> +	case ISP4SD_START_STATUS_STARTED:
>> +		dev_dbg(dev, "stream already started, do nothing\n");
>> +		return 0;
>> +	case ISP4SD_START_STATUS_START_FAIL:
>> +		dev_err(dev, "stream previously failed to start\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = isp4sd_init_stream(isp_subdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to init isp_subdev stream\n");
>> +		goto err_stop_stream;
>> +	}
>> +
>> +	ret = isp4sd_setup_output(isp_subdev, state, pad);
>> +	if (ret) {
>> +		dev_err(dev, "fail to setup output\n");
>> +		goto err_stop_stream;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_stop_stream:
>> +	isp4sd_stop_stream(isp_subdev, state, pad);
>> +	return ret;
>> +}
>> +
>> +static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
>> +{
>> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +
>> +	guard(mutex)(&isp_subdev->ops_mutex);
>> +	if (on)
>> +		return isp4sd_pwron_and_init(isp_subdev);
>> +	else
>> +		return isp4sd_pwroff_and_deinit(isp_subdev);
> 
> The s_power() callback is deprecated, please rely on runtime PM.
> 

Thanks, I'll switch from deprecated s_power() to runtime PM callbacks.

>> +}
>> +
>> +static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
>> +	.s_power = isp4sd_set_power,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops isp4sd_video_ops = {
>> +	.s_stream = v4l2_subdev_s_stream_helper,
>> +};
>> +
>> +static int isp4sd_set_pad_format(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *sd_state,
>> +				 struct v4l2_subdev_format *fmt)
>> +{
>> +	struct isp4sd_output_info *steam_info =
> 
> Steam?
> 

yes, typo here, should be stream.

>> +		&(to_isp4_subdev(sd)->sensor_info.output_info);
>> +	struct v4l2_mbus_framefmt *format;
>> +
>> +	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>> +
>> +	if (!format) {
>> +		dev_err(sd->dev, "fail to get state format\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	*format = fmt->format;
>> +	switch (format->code) {
>> +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
>> +		steam_info->image_size = format->width * format->height * 3 / 2;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUYV8_1X16:
>> +		steam_info->image_size = format->width * format->height * 2;
>> +		break;
>> +	default:
>> +		steam_info->image_size = 0;
> 
> Please stick to formats the driver supports i.e. make either of the above
> the default.
> 

Sure, will make MEDIA_BUS_FMT_YUYV8_1_5X8 the default.

>> +		break;
>> +	}
>> +	if (!steam_info->image_size) {
>> +		dev_err(sd->dev, "fail set pad format,code 0x%x,width %u, height %u\n",
>> +			format->code, format->width, format->height);
>> +		return -EINVAL;
>> +	}
>> +
>> +	dev_dbg(sd->dev, "set pad format suc, code:%x w:%u h:%u size:%u\n",
>> +		format->code, format->width, format->height, steam_info->image_size);
>> +
>> +	return 0;
>> +}
>> +
>> +static int isp4sd_enable_streams(struct v4l2_subdev *sd,
>> +				 struct v4l2_subdev_state *state, u32 pad,
>> +				 u64 streams_mask)
>> +{
>> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +
>> +	return isp4sd_start_stream(isp_subdev, state, pad);
>> +}
>> +
>> +static int isp4sd_disable_streams(struct v4l2_subdev *sd,
>> +				  struct v4l2_subdev_state *state, u32 pad,
>> +				  u64 streams_mask)
>> +{
>> +	struct isp4_subdev *isp_subdev = to_isp4_subdev(sd);
>> +
>> +	return isp4sd_stop_stream(isp_subdev, state, pad);
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops isp4sd_pad_ops = {
>> +	.get_fmt = v4l2_subdev_get_fmt,
>> +	.set_fmt = isp4sd_set_pad_format,
>> +	.enable_streams = isp4sd_enable_streams,
>> +	.disable_streams = isp4sd_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops isp4sd_subdev_ops = {
>> +	.core = &isp4sd_core_ops,
>> +	.video = &isp4sd_video_ops,
>> +	.pad = &isp4sd_pad_ops,
>> +};
>> +
>> +static int isp4sd_sdev_link_validate(struct media_link *link)
>> +{
>> +	return 0;
> 
> Uh-oh.
> 
> What is actually being configured via the sub-device? There is no device
> node either, is there? Are there plans for future developments, apart from
> possibly making the ISP and the sensor controllable by the host?
> 

Yes, you are correct. For the first version, no device node and 
configuration for the sub-device now. Possible future development plan 
is under internal discussion.

>> +}
>> +
>> +static const struct media_entity_operations isp4sd_sdev_ent_ops = {
>> +	.link_validate = isp4sd_sdev_link_validate,
>> +};
>> +
>> +int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
>> +		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM])
>> +{
>> +	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +	struct device *dev = v4l2_dev->dev;
>> +	int ret;
>> +
>> +	isp_subdev->dev = dev;
>> +	v4l2_subdev_init(&isp_subdev->sdev, &isp4sd_subdev_ops);
>> +	isp_subdev->sdev.owner = THIS_MODULE;
>> +	isp_subdev->sdev.dev = dev;
>> +	snprintf(isp_subdev->sdev.name, sizeof(isp_subdev->sdev.name), "%s",
>> +		 dev_name(dev));
>> +
>> +	isp_subdev->sdev.entity.name = isp4sd_entity_name;
>> +	isp_subdev->sdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_ISP;
>> +	isp_subdev->sdev.entity.ops = &isp4sd_sdev_ent_ops;
>> +	isp_subdev->sdev_pad.flags = MEDIA_PAD_FL_SOURCE;
>> +	ret = media_entity_pads_init(&isp_subdev->sdev.entity, 1,
>> +				     &isp_subdev->sdev_pad);
>> +	if (ret) {
>> +		dev_err(dev, "fail to init isp4 subdev entity pad %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = v4l2_subdev_init_finalize(&isp_subdev->sdev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "fail to init finalize isp4 subdev %d\n",
>> +			ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = v4l2_device_register_subdev(v4l2_dev, &isp_subdev->sdev);
>> +	if (ret) {
>> +		dev_err(dev, "fail to register isp4 subdev to V4L2 device %d\n", ret);
>> +		goto err_media_clean_up;
>> +	}
>> +
>> +	isp4if_init(ispif, dev, isp_subdev->mmio);
>> +
>> +	mutex_init(&isp_subdev->ops_mutex);
>> +	sensor_info->status = ISP4SD_START_STATUS_OFF;
>> +
>> +	/* create ISP enable gpio control */
>> +	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
>> +						 "enable_isp",
>> +						 GPIOD_OUT_LOW);
>> +	if (IS_ERR(isp_subdev->enable_gpio)) {
>> +		ret = PTR_ERR(isp_subdev->enable_gpio);
>> +		dev_err(dev, "fail to get gpiod %d\n", ret);
>> +		goto err_subdev_unreg;
>> +	}
>> +
>> +	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
>> +		isp_subdev->irq[i] = irq[i];
>> +
>> +	isp_subdev->host2fw_seq_num = 1;
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +
>> +	return 0;
>> +
>> +err_subdev_unreg:
>> +	v4l2_device_unregister_subdev(&isp_subdev->sdev);
>> +err_media_clean_up:
>> +	v4l2_subdev_cleanup(&isp_subdev->sdev);
>> +	media_entity_cleanup(&isp_subdev->sdev.entity);
>> +	return ret;
>> +}
>> +
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev)
>> +{
>> +	struct isp4_interface *ispif = &isp_subdev->ispif;
>> +
>> +	v4l2_device_unregister_subdev(&isp_subdev->sdev);
>> +	media_entity_cleanup(&isp_subdev->sdev.entity);
>> +	isp4if_deinit(ispif);
>> +	isp4sd_module_enable(isp_subdev, false);
>> +
>> +	ispif->status = ISP4IF_STATUS_PWR_OFF;
>> +}
>> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
>> new file mode 100644
>> index 000000000000..70007b9de3f3
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
>> @@ -0,0 +1,124 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_SUBDEV_H_
>> +#define _ISP4_SUBDEV_H_
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/delay.h>
>> +#include <linux/firmware.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/types.h>
>> +#include <linux/uaccess.h>
>> +#include <media/v4l2-device.h>
>> +
>> +#include "isp4_fw_cmd_resp.h"
>> +#include "isp4_hw_reg.h"
>> +#include "isp4_interface.h"
>> +
>> +/*
>> + * one is for none sesnor specefic response which is not used now
>> + * another is for sensor specific response
>> + */
>> +#define ISP4SD_MAX_FW_RESP_STREAM_NUM 2
>> +
>> +/*
>> + * cmd used to register frame done callback, parameter is
>> + * struct isp4sd_register_framedone_cb_param *
>> + * when a image buffer is filled by ISP, ISP will call the registered callback.
>> + * callback func prototype is isp4sd_framedone_cb, cb_ctx can be anything
>> + * provided by caller which will be provided back as the first parameter of the
>> + * callback function.
>> + * both cb_func and cb_ctx are provide by caller, set cb_func to NULL to
>> + * unregister the callback
> 
> These comments would benefit from grammatical and spelling corrections.
> Same below.
> 

Thanks for noting this; I'll check all comments in the set.

>> + */
>> +
>> +/* used to indicate the ISP status */
>> +enum isp4sd_status {
>> +	ISP4SD_STATUS_PWR_OFF,
>> +	ISP4SD_STATUS_PWR_ON,
>> +	ISP4SD_STATUS_FW_RUNNING,
>> +	ISP4SD_STATUS_MAX
>> +};
>> +
>> +/* used to indicate the status of sensor, output stream */
>> +enum isp4sd_start_status {
>> +	ISP4SD_START_STATUS_OFF,
>> +	ISP4SD_START_STATUS_STARTED,
>> +	ISP4SD_START_STATUS_START_FAIL,
>> +};
>> +
>> +struct isp4sd_img_buf_node {
>> +	struct list_head node;
>> +	struct isp4if_img_buf_info buf_info;
>> +};
>> +
>> +/* this is isp output after processing bayer raw input from sensor */
>> +struct isp4sd_output_info {
>> +	enum isp4sd_start_status start_status;
>> +	u32 image_size;
>> +};
>> +
>> +/*
>> + * This struct represents the sensor info which is input or source of ISP,
>> + * status is the sensor status
>> + * output_info is the isp output info after ISP processing the sensor input,
>> + * start_stream_cmd_sent mean if CMD_ID_START_STREAM has sent to fw.
>> + * buf_sent_cnt is buffer count app has sent to receive the images
>> + */
>> +struct isp4sd_sensor_info {
>> +	struct isp4sd_output_info output_info;
>> +	enum isp4sd_start_status status;
>> +	bool start_stream_cmd_sent;
>> +	u32 buf_sent_cnt;
>> +};
>> +
>> +/*
>> + * Thread created by driver to receive fw response
>> + * thread will be wakeup by fw to driver response interrupt
>> + */
>> +struct isp4sd_thread_handler {
>> +	struct task_struct *thread;
>> +	wait_queue_head_t waitq;
>> +	bool resp_ready;
>> +};
>> +
>> +struct isp4_subdev_thread_param {
>> +	u32 idx;
>> +	struct isp4_subdev *isp_subdev;
>> +};
>> +
>> +struct isp4_subdev {
>> +	struct v4l2_subdev sdev;
>> +	struct isp4_interface ispif;
>> +
>> +	struct media_pad sdev_pad;
>> +
>> +	enum isp4sd_status isp_status;
>> +	struct mutex ops_mutex; /* ops_mutex */
>> +
>> +	/* Used to store fw cmds sent to FW whose response driver needs to wait for */
>> +	struct isp4sd_thread_handler fw_resp_thread[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>> +
>> +	u32 host2fw_seq_num;
>> +
>> +	struct isp4sd_sensor_info sensor_info;
>> +
>> +	/* gpio descriptor */
>> +	struct gpio_desc *enable_gpio;
>> +	struct device *dev;
>> +	void __iomem *mmio;
>> +	struct isp4_subdev_thread_param isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>> +	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
>> +	bool irq_enabled;
>> +	/* spin lock to access ISP_SYS_INT0_EN exclusively */
>> +	spinlock_t irq_lock;
>> +};
>> +
>> +int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
>> +		int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM]);
>> +void isp4sd_deinit(struct isp4_subdev *isp_subdev);
>> +
>> +#endif /* _ISP4_SUBDEV_H_ */
> 

-- 
Regards,
Bin


