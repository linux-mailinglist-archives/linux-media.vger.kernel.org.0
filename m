Return-Path: <linux-media+bounces-49970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AA0CF7534
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 09:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB9A300CBBC
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 08:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEC230ACFB;
	Tue,  6 Jan 2026 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SU2ZFdEM"
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C2229B2A;
	Tue,  6 Jan 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767688518; cv=fail; b=SE+jTbOn+sqbcBTGzIJrJWD+bXxyT3ZmLgBGVvLerQtgx5Q/OXPxH+OUI013sGLbHlmzFJBMVzkxHTUjeamCyq9spFT28tdHD3tW22LCFH2014faB/cqiDmNBbsAmsJtWQ8p9j0ju/kK5b2rCzSP1oDaAm0CDFuEJVvvFtjfK3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767688518; c=relaxed/simple;
	bh=74OdMXuXyHRDnT7A+0ekfHAU9x12C+fBH6FU9z7xwEw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TAU6ecbrZg5Tb81GML8P7zR4Q/O9uFHQKprScIzduGWqKBNt+d4u9RapWQiei/FVTjBCEvTk8K27DIOdNd4NWpm4U5QJFvWvPea3Dt5BfjiOpQfNKxsjxFy16ojrsTIOtJgkbzAi7S3x+LUNii88KRxhym5K8RUKV/QUraySYq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SU2ZFdEM; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag3blSa8DYcEejpNjD2+KcMCFQrziUulVH4dFeOzwomh89gofkldsFiCACiRSfHrg0a9Z/+YL3tVRtLkDYIhHnMHcY2YqFtSOk+BE25DPTgq2uGtOJyLGhSPUHSJCSSlejIcz4JXhdZBnwT6BXx/d5+J4MDtYotAvKST9CnxFxCdUubeWe2+alwsDK23R/XYiV1NGpbOykaIZq4uJRRCZkPm4jLd72jzWaelgS2ncy90xaxYUljzjmuKbCjpWN2bT3K9QuBE5lEaJJHvbRDysHp5EIQzC/zsuudM+4OBGFSkqAhqh+V+RFOc1OnJc7Qd+YrP8YYKlePU/l/6Si2EXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nZgA4nteEyL3v6sAxoxKEQvx0PVHLAAbSv1dQAWB+E=;
 b=pguqGfkoLK6Z4tL7U8uGYsc3amIvNJ/Fojgjo/ISGY0gCnjfU/3BYaG6Ib6wgzmGxKl0Jtlthwicb8Fgq4hd8qh2ScjUKLfonbLESM8AakkU73sFEFJNdAY0lOpNOsrCQGlYzqohM4bDghfvlhX56rb1p5WK7Fdy32L7RTEyt52ecR4kkIMnXg4FQQy+qzF7D1pQfHRf1k7QOjb3RCl77JP0NcXqHvcMUQd4cGBj0E4UsEgUltd4CjK/DowuhSjdl7wt9GjbKwGGvy6cydiCDhK33Go+xDh+GThhvgALeLBQpp5OEbpb+6KHzKvi+rKjr5jH63yh7VEJvNO5P+HXYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nZgA4nteEyL3v6sAxoxKEQvx0PVHLAAbSv1dQAWB+E=;
 b=SU2ZFdEMFces+NxrPlePOd1lVOho0tvrdbnoYQKzLU1AZ7k6+fchFMf6ATh2Fljap+Te4bmbA3hWhQQ5+iOQN2hY86r2stC7nhiFpEJBzO52yMkjOVGUeZJP7QQeQ0EfGxebR6hrWdP0XfiBlST8ZCiEzRlY4iOfAU0Zts1MlPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:35:12 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:35:12 +0000
Message-ID: <fcc79419-9f9b-4151-8a95-b287ecb0436b@amd.com>
Date: Tue, 6 Jan 2026 16:35:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add AMD ISP4 driver
To: Kate Hsuan <hpa@redhat.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <CAEth8oGuoFH1R1NXVmFFrDmZeKLZSHnJO=wuXdaFYLFXi4upGA@mail.gmail.com>
 <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <CAEth8oHw6zjTYP31sCmpSX_Ac2Vb8QDnf=ZUt=tWGQeO9ApS=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0011.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::17) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc8e087-96a0-499f-9b10-08de4cfe8239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3NIcmJhb3dKeWpuTnRnMG1xVzhGanh5MlJpd2RaeUVHRlR1YVV6NVJTUFFs?=
 =?utf-8?B?ZGw1Zk1uL1V1ZDJqUXNUdERMNksvWGdXU21PSUNxRExMMExYaksyNGg1aE0x?=
 =?utf-8?B?aFVUUGlOUjg4eE0ySzJKbE5MV1VIaVNpclBodi85a09VeHJ5RE5MYTZLclVh?=
 =?utf-8?B?UkIrU2lrWG95VmprenoyT1lXcEFMd25NZ0FqRDg2NUt3TU1SaUh3WG53Z20y?=
 =?utf-8?B?d1QzVDd3UFVCenllcWtTWmhGUnpxVG1iTmwzMWs4dVZGYXM0anpoLytBcmFn?=
 =?utf-8?B?ZmdHWklPK1pYMGI1QnF4M0UrVVNKMlEvc01QUG9IRWgrM1pSOWJMeFBFUG5Y?=
 =?utf-8?B?RDFPa296YzZ6RVBOaXlFZi9WclltRU9UdEdQcU4zWVZqN3F5dEkrRkU0OWdp?=
 =?utf-8?B?YzkzN0V2ZjFHUjE2clNyeWJiVDg2L3JhZXdiakp4QUEwOU1kMWFIdWdWUjZh?=
 =?utf-8?B?cFVnbEQ0TjZYVVVjaW80MEFhV09VR0lWV1NHMk9tYndPMzIxN3dyS0RkdWUy?=
 =?utf-8?B?Wm84OEpIT2hUSE9tRHE2TW9wSkRCZzBLRkhRbEx6TDUrVmk3OGE2SHgyU3Bz?=
 =?utf-8?B?OXZxb01iUVJONnQ3WTRqS0xmdEE3UzY3TTBEaVRYZnVEdG5FVTFYb0h1eUp0?=
 =?utf-8?B?YWNMaWRtN0FVMmE0QzBPNjF6czZiRUVzeUNLNXZmRkJJa0o2S29PbnZUbUdi?=
 =?utf-8?B?ME9BUnNEVEFJYi9LVHI5cG9pdEQ3Vi9GcC9oOHkxSzdSVHpGemxWc25TK1pD?=
 =?utf-8?B?MjRRTUhTbmlBQnBTSE1jSk1pSEk4WGQvUDE5NENaWXNHcWNyNU5RdEk2NVBQ?=
 =?utf-8?B?dFNoVmJqcWpPZHFhcUFUT2J0VmNWOTRwWWlQcXAvamh6M215ZmNIRXFVdmEy?=
 =?utf-8?B?Z2RlbDA2SGJ0QWI1RS93dTVHc1NwOGtpdzdaYWdkUnBTbXN6K2M1ems1U2U0?=
 =?utf-8?B?RmtNRTlPQzg2MkN4MjVZSlV5dUhMWXRlVjVXK2FWQTAzSEZOc29ZRlVQY0k4?=
 =?utf-8?B?M3RIdjhlVnFoVXN3TExLOTVURWx2MnM5VldoVXVFVzcvNlE5NXd0dU1kNzZG?=
 =?utf-8?B?VDZjVEQzWTYydlh4eHBmRlc2QUMvR1hMa21zcXIwd0VnTHJicFNqU1RqUlNm?=
 =?utf-8?B?ODNjSkxpbXUyakU3bWdsSU51bEVpN1ZOVG02ZG93Z1lIZlVwM0RhVXpTaXFV?=
 =?utf-8?B?REdaS2hsL0VSbEV1K2hqWEZtcjVxM0gvNDkxTHIrWHZpQ1N4VnBQNEZBbG1u?=
 =?utf-8?B?Z0theEFzdWJUeHFvNTRUVFRmUHU2Z2poRFdRTlJTdnY3K0tZc2hJRndFSjBO?=
 =?utf-8?B?TU5yWWxueEtiZlk3ZThWOEpyZndTOVpUY1c0Z0Z6OFU3SS9XUzZIZk1pcUpX?=
 =?utf-8?B?eUtnWXpRbko3emkrVWFTWWFnMC9GaVVLQXI2UVVDdU5RR2lEOTRkbkJCcFp2?=
 =?utf-8?B?Um9BRFV4U29jaXpDYUFvQ1c1SXJNUDQzdWVjM3N1NUtyNWJnRmhvVmUveDdT?=
 =?utf-8?B?MUhkd1ByblJLcHIyWUI1TVR2VjAvc1Q1TFBMR3NUdGZ6TU9hWW9XdkhYbFVz?=
 =?utf-8?B?N2NUdFFhbWpIb0hyTW8vbFZ4T2ozcVpEOHNLeG90YkF3enBTZEd4MHk0U1lK?=
 =?utf-8?B?amR5SXVwNDFUaDg1Q1R1a0kraTJSSjFLeDNVZXgwWm5hMXROL2d5U1JCOEpF?=
 =?utf-8?B?RlkwOUVnNVdsb21zcDdtdUNxdHVFUEJaci8wblRaTDlwRFhOV3NKZ203L3lU?=
 =?utf-8?B?MHAyOHlMM2xUZys0Rm5meFhTRnV3Q0hrT0cxMi9ZQzU3dm5OQzRSQm51WG9X?=
 =?utf-8?B?SWdSUWI4azhCNmZ3aDJoRWZHTU40eWVzbU4wT1FEcDVpZnA3Zm5CakhhdUFh?=
 =?utf-8?B?VVMvWjdha3lpc2NQbWFrWktlTGxvUk9WTmlOdGtsQ2NTRTRmZ1ZsNjVCQUZO?=
 =?utf-8?B?T2lmMzJTSEZRcm56UHVNcXluSGxwd0NCRFZWV0k0YWFHcGRSMFlYTVc5RVFF?=
 =?utf-8?B?eXZSNHR2QklBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNlc1h5VzFGL2xMWmFhTFdhZXM0MWRnTXdBZEk0Y1FKTitOVGx2WjQvY2xu?=
 =?utf-8?B?ejhabTEvZnJBU1VOOXB3aHNlcCtIWXdiQmt2MjMvL3pCdVRPSlNEZURBdkpB?=
 =?utf-8?B?YzJIU2JaYVBna1NFTlg0aktwa3JLbEtNeFAvNnlsWGtCeVN3MEtRaUtjNldP?=
 =?utf-8?B?NG1MNmxOUU5iMnV3KzltS24rQkh5SGUySExGZDRDOUxrQ0ZFMDVvaXV3N3Fl?=
 =?utf-8?B?VWFkTzI2NmxWQlVXdXBKS0RFa0t2U1V6OUU5ck81QTNCMHdiSWdjM0lFenNH?=
 =?utf-8?B?QXE2MlFsUGM1ZlU5WVZKdVlOdkxNTTdHQ0tzOFF3eDhqZWVVMllnMlZFaURR?=
 =?utf-8?B?emR0ekxhMUlhMnlNd2s0VWphdm4rdFNvdEZiNkovZ05lSUFhNWtzRkNPVmpk?=
 =?utf-8?B?dGw0Mm01ZkhBT0hXWG9UUlZPNW5JdHJEM0ErTWQyT0tmcTBSQVpFeEsxalNw?=
 =?utf-8?B?YjllUzMrT1RmNTcydWhSTHJHQk9UbGRlTndOcmI5VUVxMGNSbFJzZXN6U2d4?=
 =?utf-8?B?ZUs0TVpKa3R6K3lJTHA0c1hvWkJhcUh5aHU1UkgwMzRlUXQ5Q1dPdXZKODls?=
 =?utf-8?B?S0NkR0dYNHBJd3Q5SUs0bUJTQjh0SG9wS1pMaU1UaUV4aG1NOWRpVHg5ZXJS?=
 =?utf-8?B?eDlMdHRIU2o1SXdGakRCUlBGeklseldJMDNJTkNicnc3dlVBd2JSMC85LzF1?=
 =?utf-8?B?UmJkOHBnOHhWZmZpVGwwbnZSNEVZOXlIU2prQkE3ZkxPRW5GY280TFFUL1hE?=
 =?utf-8?B?R0JJNTNtNGQxK3N4Unl3R2M2RFk0aHpnSjljNTZETnN5OFpGR0NJTUlBVGRh?=
 =?utf-8?B?d21sS2g4VmJ0aWlLU2oxWUUwT3dHcjh1UkppUDlhVk1tMXZ4ZlU4Mlgrc0RS?=
 =?utf-8?B?ZzlvLzZFTTF5MTl3WFg0b2QvZ1FucTJabWZwUEVCeFpzempCTTRrcktabW1E?=
 =?utf-8?B?VEZCMi9TQUFmR3ZnUmhEbERLd1Z2anFOQmhHTmZvWHFaN0ttQWRYZGFJbnZz?=
 =?utf-8?B?aTJtZit1aVhOVm9ieW92OXNCbUZzNnFPK2YvbFd4ckMyOFF0UHhwSG9WQWNz?=
 =?utf-8?B?L1NFcmxxby9sSDNXNDdKRnN5NEdUOEx6SVZ5QVBTa0FTNmh5aW5aYmU3SjFw?=
 =?utf-8?B?SThYS1VFUStaOXpOMHp3b3EyWEhRNU11d2JNbW1JZ090ZFRNcXBtNWU4cDcx?=
 =?utf-8?B?NFliU0RQUktGdXBzV0xUeVEvVjdTajYwMmpSRHZnT3RRUzA2bFZsR1AyN0NW?=
 =?utf-8?B?d09iLzNDWThnYzNKSnFua1loNnBUVlRJUFZhamJuRU43cDV2dm1Zc3JWaytU?=
 =?utf-8?B?aFI0YWJMWmppb0QweGxYL1NoMElkS1h6WVNjRld6a01jcmp5KytpSWtwcnlO?=
 =?utf-8?B?akh3UWlld2Y5L0hpSnh6cDdQYis1K01ES0Z5eUEyRWN5UVp5ZEoxMlFINStB?=
 =?utf-8?B?TSs5djZYYi9VRE45OHh6VFc4dC9VRERSeURZSUJUY1FIUFZHVFRZbEJ5ZVN4?=
 =?utf-8?B?MWtGZC9nYmNveXQwZENEdDFDeWJXWXVHMEFFNjdyeUh2OEVxNjhIQ0JFelkv?=
 =?utf-8?B?cFhHcmxVeStZVE5QVGovMDJGSXRqODRCMlVnTjdHY2hLL1BHU3JBVWx6QjRS?=
 =?utf-8?B?SGRuZXdWN1FyWmM2UVVjT2hmWFJXVTlqZU9zMFh5SWRDS2xFZG9iUEl2cVdD?=
 =?utf-8?B?SzFoNVVoSjFXUkdabGlIek1Tb2RMdlJoYThwMUZSSjJDZlBkdWd2OXhIeGRu?=
 =?utf-8?B?QzJGZnhJU0R6NVpjQWFEOGd6cmZnTFVvNFdlMlQ5aElSR1RxTnRwZkh3NGJZ?=
 =?utf-8?B?WXV2a1ZYL2dobm9MRXhYUitRVGx6eG53SW54TFBRSDk3QUMwWVZrVXZhY3lF?=
 =?utf-8?B?cVphZy9NVFhST1NhV0ZMYy9HN0xaY1FaRW5ySUFQa3kxZjlGV3lSM05xaFl5?=
 =?utf-8?B?NytXSDd1bmRuVzNDZmpoazhZZzIyeTdZd09TZkNGby9XWHBERVJheDIvRC83?=
 =?utf-8?B?c3ZleG9YZFlXWG5YMkQvUnhhYW80ZmJnN29oQi9SRFB3dGlDanNCMzFZcEhS?=
 =?utf-8?B?bHROT2JmMUZkYkdoNENoM3krZGYvK3kxZEdVSVRDZjIzYTVGZDIzK3pCa2p6?=
 =?utf-8?B?N3RmR0hCR2VEZGVPVG9ob3IxSXV6WkR0RjNpNFg2dmE4WUYvdGNlVTZsNXdI?=
 =?utf-8?B?OFlGaUtJSDZTV0pFUXFZeENIVEVUWVVabWdwcDN2b0VoNU1kaitONDF0c1dy?=
 =?utf-8?B?OGV6NVVkV1A4RmE1dWtqdGFSQWt3UFlEMCtNQUFZSnNDd2tXYlVqQ0gvOHZ5?=
 =?utf-8?Q?/vbGwCsMWyplzP3IW5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc8e087-96a0-499f-9b10-08de4cfe8239
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 08:35:12.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF5l4W7vKVS+QbnD2MZZOFgmgt9rFuH4g+e0ba0Z77ta+higNbw1VJ+TQCxf+x+z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045

Thank you, Kate, for the verification, it gives us more confidence.

On 1/6/2026 1:49 PM, Kate Hsuan wrote:
> Hi
> 
> On Wed, Dec 31, 2025 at 5:03 PM Kate Hsuan <hpa@redhat.com> wrote:
>>
>> On Tue, Dec 16, 2025 at 5:14 PM Bin Du <Bin.Du@amd.com> wrote:
>>>
>>> Hello,
>>>
>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC (Ryzen AI Max 300 Series)
>>> (https://ubuntu.com/certified/202411-36043)
>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>
>>> Patch summary:
>>> - Powers up/off and initializes ISP HW
>>> - Configures and kicks off ISP FW
>>> - Interacts with APP using standard V4l2 interface by video node
>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>> - Supports enum/set output image format and resolution
>>> - Supports queueing buffer from app and dequeuing ISP filled buffer to App
>>> - It is verified on qv4l2, cheese and qcam
>>> - It is verified together with following patches
>>>          platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>>          pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>>          drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>          drm/amd/amdgpu: Declare isp firmware binary file (https://gitlab.freedesktop.org/agd5f/linux/-/commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>>
>>> AMD ISP4 Key features:
>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>> - Downscale input image to different output image resolution
>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc.
>>>
>>> ----------
>>>
>>> Changes v6 -> v7:
>>>
>>> - Added missed blank line after some if statements.
>>> - Changed the pm_runtime_disable() order in isp4_capture_remove() to align with initialization.
>>> - Reset buf_sent_cnt and start_stream_cmd_sent on stream stop.
>>> - Removed duplicate buf_sent_cnt and start_stream_cmd_sent reset in isp4sd_pwron_and_init().
>>> - Combined isp4sd_reset_stream_info() and isp4sd_reset_camera_info() into isp4sd_uninit_stream() to eliminate redundant stream info reset.
>>> - Removed always-false status check in isp4sd_uninit_stream().
>>> - Minor style improvements.
>>>
>>>
>>> Changes v5 -> v6:
>>>
>>> - Lowered FW mempool buffer size from 200M to 100M (actual usage).
>>> - Added an irq_enabled member to the ISP subdev for proper IRQ disable handling in both normal and error cases.
>>> - Removed unnecessary .owner assignment from isp4_capture_drv definition
>>> - Updated IRQ handling to enable and disable interrupts via the ISP register for improved performance.
>>> - Revised ring buffer management in isp4if_f2h_resp(), addressing safety checks to ensure the read pointer is validated before memcpy operations, reducing the risk of out-of-bounds access. The ring buffer logic was also streamlined significantly.
>>> - Modified ring buffer handling in isp4if_is_cmdq_rb_full(), correcting an off-by-one error in safety checks that previously allowed rd_ptr to equal wr_ptr when the buffer was full.
>>> - Refactored ring buffer handling in isp4if_insert_isp_fw_cmd(), simplifying overall logic.
>>> - Resolved a regression from v4 to v5 where isp4if_dequeue_buffer() did not protect list_del with bufq_lock.
>>> - Addressed a subtle use-after-free issue that could occur if a timeout on a synchronous command coincided with completion.
>>> - Added missing pm_runtime_disable() calls to isp4_capture_remove() and to the error path in isp4_capture_probe().
>>> - Removed stray semicolons following closing curly braces.
>>> - Improved and clarified macro definitions in isp4_interface.h.
>>> - Eliminated unnecessary (u8 *) casts.
>>> - Added missing memset for firmware command structures in isp4sd_stop_stream().
>>> - Excluded streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK, preventing their activation in the interrupt enable register.
>>> - Enhanced error handling to clean up kthreads in the event of startup failure.
>>> - Corrected a race condition during kthread creation where waitqueue head initialization could be delayed, as it was performed by the kthread itself.
>>> - Removed status checks in isp4sd_pwroff_and_deinit() that were always false.
>>> - Ensured isp4sd_init_stream() is only invoked once per stream start and reordered corresponding status checks in isp4sd_start_stream().
>>> - Improved error handling in isp4sd_start_stream() to propagate errors from failed functions.
>>> - Relocated debugging messages in isp4sd_stop_stream() to execute under lock protection due to access to output_info->start_status.
>>> - Eliminated redundant GET_REG_BASE() macros.
>>> - Removed isp4sd_is_stream_running() function.
>>> - Corrected error message in isp4sd_init_stream() caused by copy/paste.
>>> - Refined struct isp4_interface to remove firmware ring buffer configurations.
>>> - Removed obsolete isp4sd_is_stream_running function.
>>> - Removed pdev member from struct isp4_device, as it is unnecessary.
>>> - Fixed typo in 'isp_mmip' parameter name within isp4if_init().
>>> - Removed gap in struct isp4_subdev definition.
>>> - Performed extensive dead code removal and minor style improvements throughout the codebase.
>>>
>>>
>>> Changes v4 -> v5:
>>>
>>> - Transitioned VIDEOBUF2_V4L2 from 'depends' to 'select' within Kconfig.
>>> - Standardized object file naming conventions in the Makefile and sorted entries alphabetically.
>>> - Removed the unused macro definition to_isp4_device.
>>> - Eliminated unused members mem_domain and mem_align from struct isp4if_gpu_mem_info.
>>> - Deleted unused fields mc_addr and gpu_pkg from struct isp4if_cmd_element.
>>> - Removed obsolete pltf_data, i2c_nb, and notifier elements from struct isp4_device.
>>> - Updated platform_get_irq failure handling to return its actual result rather than -ENODEV.
>>> - Refined inclusion of header files for clarity and efficiency.
>>> - Appended comments following #endif statements in header files.
>>> - Improved implementation of isp4if_gpu_mem_free and isp4if_dealloc_fw_gpumem.
>>> - Removed isp4if_append_cmd_2_cmdq and revised isp4if_send_fw_cmd accordingly.
>>> - Enhanced isp4if_clear_cmdq and isp4if_clear_bufq by eliminating unnecessary list_del operations.
>>> - Adopted completion mechanism instead of wait queue and condition for command completion notifications.
>>> - Employed memset to ensure proper zeroing of padding bits in structures shared between ISP driver and firmware.
>>> - Streamlined IRQs, reducing total from four to two, retaining only essential ones.
>>> - Optimized IRQ handler logic using a while loop for greater efficiency.
>>> - Introduced dynamic IRQ enable/disable functionality based on camera status (open/close).
>>> - Applied distinct identifiers to differentiate multiple threads and IRQs.
>>> - Removed unnecessary initialization of local variables.
>>> - Refined camera start/stop workflow to mitigate potential synchronization concerns.
>>> - Replaced all remaining mutex with guard mutex.
>>> - Enhanced command and buffer queue performance by substituting mutexes with spinlocks.
>>> - Removed redundant isp4sd_init_meta_buf function and its references.
>>> - Limited firmware logging activities to the stream1 thread.
>>> - Relocated v4l2_device_unregister_subdev() and media_entity_cleanup() calls from isp4_capture_remove to isp4sd_deinit.
>>> - Resolved media device registration sequence issues.
>>> - Modified stream processing thread behavior to await IRQ without a timeout.
>>> - Addressed cleanup procedures in video device initialization and deinitialization routines.
>>> - Corrected typos and made other cosmetic improvements.
>>>
>>>
>>> Changes v3 -> v4:
>>>
>>> - Replace one mutex with guard mutex.
>>> - Remove unnecessary bus_info initialization of v4l2_capability.
>>> - Drop V4L2_CAP_IO_MC from capabilities of v4l2_capability.
>>> - Modify document with better SOC description.
>>> - Fix Test x86 failure in Media CI test https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/83470456/artifacts/report.htm
>>> - Modify some commit messages by describing changes in imperative mood.
>>> - Add media-ctl output in cover letter.
>>> - Create separated dedicated amdgpu patch to add declaration MODULE_FIRMWARE("amdgpu/isp_4_1_1.bin");
>>> - Fix typo errors and other cosmetic issues.
>>> - Add DRM_AMD_ISP dependency in Kconfig.
>>>
>>>
>>> Changes v2 -> v3:
>>>
>>> - All the dependent patches in other modules (drm/amd/amdgpu, platform/x86, pinctrl/amd) merged on upstream mainline kernel (https://github.com/torvalds/linux) v6.17.
>>> - Removed usage of amdgpu structs in ISP driver. Added helper functions in amdgpu accepting opaque params from ISP driver to allocate and release ISP GART buffers.
>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of the previous hybrid approach controlling sensor from both FW and x86 (sensor driver).
>>> - Removed phy configuration and sensor binding as x86 (sensor driver) had relinquished the sensor control for ISP FW. With this approach the driver will be exposed as web camera like interface.
>>> - New FW with built-in sensor driver is submitted on upstream linux-firmware repo (https://gitlab.com/kernel-firmware/linux-firmware/).
>>> - Please note the new FW submitted is not directly compatible with OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/tree/4.0) and the previous ISP V2 patch series.
>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>> - Included critical fixes from Sultan Alsawaf branch (https://github.com/kerneltoast/kernel_x86_laptop.git) related to managing lifetime of isp buffers.
>>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>        media: amd: isp4: Don't increment refcount when dmabuf export fails
>>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>        media: amd: isp4: Fix possible use-after-free when putting implicit dmabuf
>>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>>        media: amd: isp4: Remove unused userptr memops
>>>        media: amd: isp4: Add missing cleanup on error in isp4vid_vb2_alloc()
>>>        media: amd: isp4: Release queued buffers on error in start_streaming
>>> - Addressed all code related upstream comments
>>> - Fix typo errors and other cosmetic issues.
>>>
>>>
>>> Changes v1 -> v2:
>>>
>>> - Fix media CI test errors and valid warnings
>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>> - In patch 5
>>>          - do modification to use remote endpoint instead of local endpoint
>>>          - use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
>>>
>>> ----------
>>>
>>> It passes v4l2 compliance test, the test reports for:
>>>
>>> (a) amd_isp_capture device /dev/video0
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>> -------------------------------------------------------
>>>
>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>
>>> Compliance test for amd_isp_capture device /dev/video0:
>>>
>>> Driver Info:
>>>          Driver name      : amd_isp_capture
>>>          Card type        : amd_isp_capture
>>>          Bus info         : platform:amd_isp_capture
>>>          Driver version   : 6.14.0
>>>          Capabilities     : 0xa4200001
>>>                  Video Capture
>>>                  I/O MC
>>>                  Streaming
>>>                  Extended Pix Format
>>>                  Device Capabilities
>>>          Device Caps      : 0x24200001
>>>                  Video Capture
>>>                  I/O MC
>>>                  Streaming
>>>                  Extended Pix Format
>>> Media Driver Info:
>>>          Driver name      : amd_isp_capture
>>>          Model            : amd_isp41_mdev
>>>          Serial           :
>>>          Bus info         : platform:amd_isp_capture
>>>          Media version    : 6.14.0
>>>          Hardware revision: 0x00000000 (0)
>>>          Driver version   : 6.14.0
>>> Interface Info:
>>>          ID               : 0x03000005
>>>          Type             : V4L Video
>>> Entity Info:
>>>          ID               : 0x00000003 (3)
>>>          Name             : Preview
>>>          Function         : V4L2 I/O
>>>          Pad 0x01000004   : 0: Sink
>>>            Link 0x02000007: from remote pad 0x1000002 of entity 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>
>>> Required ioctls:
>>>          test MC information (see 'Media Driver Info' above): OK
>>>          test VIDIOC_QUERYCAP: OK
>>>          test invalid ioctls: OK
>>>
>>> Allow for multiple opens:
>>>          test second /dev/video0 open: OK
>>>          test VIDIOC_QUERYCAP: OK
>>>          test VIDIOC_G/S_PRIORITY: OK
>>>          test for unlimited opens: OK
>>>
>>> Debug ioctls:
>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>
>>> Input ioctls:
>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMINPUT: OK
>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>
>>> Output ioctls:
>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>
>>> Input/Output configuration ioctls:
>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>
>>> Control ioctls (Input 0):
>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>          Standard Controls: 0 Private Controls: 0
>>>
>>> Format ioctls (Input 0):
>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>          test VIDIOC_G/S_PARM: OK
>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>          test VIDIOC_G_FMT: OK
>>>          test VIDIOC_TRY_FMT: OK
>>>          test VIDIOC_S_FMT: OK
>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>          test Cropping: OK (Not Supported)
>>>          test Composing: OK (Not Supported)
>>>          test Scaling: OK (Not Supported)
>>>
>>> Codec ioctls (Input 0):
>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>
>>> Buffer ioctls (Input 0):
>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>          test CREATE_BUFS maximum buffers: OK
>>>          test VIDIOC_REMOVE_BUFS: OK
>>>          test VIDIOC_EXPBUF: OK
>>>          test Requests: OK (Not Supported)
>>>          test blocking wait: OK
>>>
>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
>>>
>>> The media-ctl output of media device /dev/media0:
>>> -------------------------------------------------------
>>>
>>> atg@atg-HP-PV:~$ media-ctl -p -d /dev/media0
>>> Media controller API version 6.17.0
>>>
>>> Media device information
>>> ------------------------
>>> driver          amd_isp_capture
>>> model           amd_isp41_mdev
>>> serial
>>> bus info        platform:amd_isp_capture
>>> hw revision     0x0
>>> driver version  6.17.0
>>>
>>> Device topology
>>> - entity 1: amd isp4 (1 pad, 1 link, 0 routes)
>>>              type V4L2 subdev subtype Unknown flags 0
>>>          pad0: Source
>>>                  -> "Preview":0 [ENABLED,IMMUTABLE]
>>>
>>> - entity 3: Preview (1 pad, 1 link)
>>>              type Node subtype V4L flags 0
>>>              device node name /dev/video0
>>>          pad0: Sink
>>>                  <- "amd isp4":0 [ENABLED,IMMUTABLE]
>>>
>>> Please review and provide feedback.
>>>
>>> Many thanks,
>>>
>>> Bin Du (7):
>>>    media: platform: amd: Introduce amd isp4 capture driver
>>>    media: platform: amd: low level support for isp4 firmware
>>>    media: platform: amd: Add isp4 fw and hw interface
>>>    media: platform: amd: isp4 subdev and firmware loading handling added
>>>    media: platform: amd: isp4 video node and buffers handling added
>>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>>      errors
>>>    Documentation: add documentation of AMD isp 4 driver
>>>
>>>   Documentation/admin-guide/media/amdisp4-1.rst |   63 +
>>>   Documentation/admin-guide/media/amdisp4.dot   |    6 +
>>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>   MAINTAINERS                                   |   25 +
>>>   drivers/media/platform/Kconfig                |    1 +
>>>   drivers/media/platform/Makefile               |    1 +
>>>   drivers/media/platform/amd/Kconfig            |    3 +
>>>   drivers/media/platform/amd/Makefile           |    3 +
>>>   drivers/media/platform/amd/isp4/Kconfig       |   14 +
>>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>   drivers/media/platform/amd/isp4/isp4.c        |  235 ++++
>>>   drivers/media/platform/amd/isp4/isp4.h        |   20 +
>>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  271 ++++
>>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  124 ++
>>>   .../media/platform/amd/isp4/isp4_interface.c  |  789 +++++++++++
>>>   .../media/platform/amd/isp4/isp4_interface.h  |  141 ++
>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1057 +++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  131 ++
>>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1165 +++++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4_video.h  |   65 +
>>>   22 files changed, 4480 insertions(+)
>>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>>   create mode 100644 drivers/media/platform/amd/Makefile
>>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>>
>>> --
>>> 2.34.1
>>>
>>>
>>
>> v7 worked on my HP ZBook Ultra G1a 14 inch Mobile Workstation PC and
>> the camera worked fine.
>> It was tested with the latest upstream firmware [1] and 6.19-rc3 kernel.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/amdgpu/isp_4_1_1.bin
>>
>> Thank you for your work :)
>>
>> --
>> BR,
>> Kate
> Leave a "Tested-by" tag for my previous testing assertion.
> 
> Tested-by: Kate Hsuan <hpa@redhat.com>
> 
> 
> 

-- 
Regards,
Bin


