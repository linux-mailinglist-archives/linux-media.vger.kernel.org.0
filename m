Return-Path: <linux-media+bounces-51611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDJaBAh6eGnBqAEAu9opvQ
	(envelope-from <linux-media+bounces-51611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 09:40:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47790912E0
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 09:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92AB33053DC8
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 08:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9B92BF3F4;
	Tue, 27 Jan 2026 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GSFE5bAC"
X-Original-To: linux-media@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBF6231A23;
	Tue, 27 Jan 2026 08:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503175; cv=fail; b=kitNkbQ3JiZpfdErfu6GtGLi2ff66JD/JYbRTXwh49mTM/AxNDY1tXVtfM1KHqsiThXAXdKpWQH8UyQb6hSjzhaBQF58tzUzwvZ7TQdDoXY10u7j+PKhDzCV0ctTHP3CAsMQ5VuturPr7QycIVCXOPFvdB1RH8H7mLFCg3bGyPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503175; c=relaxed/simple;
	bh=ZSSUHNKeCyGJzoi7pZlsHJIXCmluQOJuCVvCXURW7YU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OB5kqsNj9YlFrnGrGCxmtywsVBodxIcWdM2uOFRaiIKo6c0sc1qHK+1r5xO30sunA0ES+gybZbQ8QqcTmv5VPETNEz4uvTfwuqaxYdsFPKhPytm6SACzd82fMjdwTNBIMtay0t5IxRuuDQUsxye/hQMSjC3cSGs8xLHpDhwidQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GSFE5bAC; arc=fail smtp.client-ip=40.107.208.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1zyGY3ikt1SRUy5YlpttBThrt1fuis3StgDeO5jCDTCeJH4DNYkGgZtqq94XjXl81adBKosisfUOSW0p8x0DD/jcZ6zGLtEZfYHeSoT9dpmzCu4ROHlCDTrBzCXzUJPR2fFVko/XL57Cc/i3egyJwUB+7C3xohg0xijI2FbVoqPj3CP32UjX4EqOX4eR+PNTJ5oKqUfUA/ucdgUoQdTunmIH188yk4AzDuuelOvvJPXSEhbOdAYl3Rg0DUt6xind/YNt4npR858MhDN+U8UCBgTQg+ToNv846K0Dop2HFioFIUArYXAcLGw6PyiK+Z5M+ty5cZRjy0OB/DJuxPqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aa2UuILP2CcKHT1kLZk5qJRrOIGw/jQn2pSjMoo8N4M=;
 b=VqApknQyYAL/9vH1XGoCm69ni1uN7GCiX+nuSOIngYSsCBwTmWSu8n3xugTjGvnO1CJH9d30R74jGkQYzPWf9ACu6reoQtFyBpeRzPZwc9YJ0dJnD02pvjYL/Q08Mf6B8nIqI8erwnZjL/hENl6vaa8QN7UaN/YmgwtZLU8LG8/fWepttuFhEUJuN3r0FN/DkyA15f0sqWKJjt5n2iltAwSxqmjX8vzhA4vee4yBMfKyhnGOuq8SEDQ3eFa1mg1K0rqFShK2e4l+nxHnbR9yJ/XrVWevaFFqqy33uMAwXT7xPnwjohzzbDwlpyziz9nIlZ2pVd+lC6svq/BgrL1bng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aa2UuILP2CcKHT1kLZk5qJRrOIGw/jQn2pSjMoo8N4M=;
 b=GSFE5bACEpGfGZyaknnbvSD7p9w0G2xLO400vgdEYpG18rK31MTvmWyfGizPEOjsSXnTCOWopbk9/AuRQXaKWKQIPKElc0Ya44EZnUahsg1qWlGkH30XLfhauJNGrfgMMkVJ73HLRk6nRcvtbOwhqyU+ujep2sC+V7qLJrnu3iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:39:31 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:39:31 +0000
Message-ID: <5d77fed1-7031-4481-a9c2-b002d77ebf23@amd.com>
Date: Tue, 27 Jan 2026 16:39:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
From: "Du, Bin" <bin.du@amd.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
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
 <aWgEtfp1MWioqKox@kekkonen.localdomain> <aWiVfyz49P7oWTsn@sultan-box>
 <24c3bcfb-5338-4cf7-a0f3-a32428e91144@amd.com>
Content-Language: en-US
In-Reply-To: <24c3bcfb-5338-4cf7-a0f3-a32428e91144@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0016.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::14) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 6619e361-da75-4410-1bb6-08de5d7f9732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MSt3VGF5Z1pvaHF5c1NQeHBTdW1Xek54REpCY1IzempTUWlTQlpkeWZTdjRD?=
 =?utf-8?B?UmtGT0dta2ZNZ1o4NysrRy85R3JNbktQb1FCVEZMSU5WbUs3bGpNTWxQSi9a?=
 =?utf-8?B?YTU5Q3Mvb005NXpHaWhYVEJiT0VPNWc0R3BhdGVNMFBkZDJ4bWNWbFJjWWsw?=
 =?utf-8?B?Nnlad2pPV2Y0MEpqWjZOU3VrTVFYd0pSVGpVOGNmKzY3dURqbjJXNmZUQTZr?=
 =?utf-8?B?RFVZVk1tRFlyOWk2SDBBbTFRZ2FQTDBvVTVyQkZBRE5ZZUl3b24zVlA5TEg5?=
 =?utf-8?B?WDY0MTIxVDFtbnN1Y3FCUVIwb1FCUFh0UWE1MWR6UDllNTR3MnN2Y0VJSHZ4?=
 =?utf-8?B?U1krUmNDYTZMby9oVnVUMmJHK2ZrbFdWQ3ZoRFdpa0oxd0RvYzJwUUNJTkp5?=
 =?utf-8?B?Y3VOZjhpZGlFbzU5d1NmYkkwOEZyMktrQWxCNm5zOHVpWWxOa1hING04M1BU?=
 =?utf-8?B?a1BXcjVTa1hWb1JMVktmdkkrb2VWdU1HZ2RaaDl6bXlBeFhiS1F0ek9PYW0x?=
 =?utf-8?B?aXBYaUZQTDI0UnVqM2RRbU1UY0IwM1pzdTBFbVpVTHZvNTZnTDZRN0JZS3Zu?=
 =?utf-8?B?ZWlRVHZxLyt0Z3M5eERDYUczZEhUeGFFUG5rSXVJUkVwSFlxRkh1K1A5MDZC?=
 =?utf-8?B?NkJNK3RkUXlySFlhZmhFY1lqTldRYjlyYU03U1NJcDNVS05DWFcxTitmRzRM?=
 =?utf-8?B?NTlPVHlIV3I1L3RKNEdMTUNBb1JUaVhYT1psTEJpTE1Pd09vS3ZNaWxlOFY0?=
 =?utf-8?B?TFVMQjcwbDJHQnd5YXJ0SE9zd0JHbTdWbW16bER1OGxsRldhamlkRUhlSDdj?=
 =?utf-8?B?eDNQN2EvWmZZSWVLUTFoaDRyRjVHcVUxS2dwQkRRV1VHVHZZNVVabXNyQUxC?=
 =?utf-8?B?V3BPWDlQYXRuSGlQTEVSV1BucnZBNGlnZnF1NVdlc2xvYU9oTjRZK2VQQjJi?=
 =?utf-8?B?T0R3eUFMMzcwWlN6NHkxTUp5VUY4VGNpNjR3Rlg5MjA1WXp2STVndHRnckRw?=
 =?utf-8?B?RU9EMjA0MUhDSmxzaGNvT0JzSGZIbG9TNTFiVmIrUzZUMWM5Z3B2eGxINWkv?=
 =?utf-8?B?N00xTHR1N0hwZ0NPeTI5MjdpSGtlS2ZWZ2tTaXFBSnFPS3A1SUhPdmUwM2FD?=
 =?utf-8?B?QVlnTW03QUtrNkdzMzVHZUtiRGhhTG01Uk9zYWltRi9UMlZqanZaNjVHUktS?=
 =?utf-8?B?TnVubHlEM0VKOEh4U01UTzZJSEpIeDdITUJMRXF5MVpaKzFiWWl1dUUxWGtR?=
 =?utf-8?B?RGJrRGJSK21ONFY1Q0FPRG83ODJBY2I0SGdHUUFIRHNMbStGZDFRUVBicVRC?=
 =?utf-8?B?N2U5cjZ5Tk5zQTdUamVyN0EyZW9idFhTUXRKTWsyWXdiUWd6LyszdTAwUVUv?=
 =?utf-8?B?TXNsRVh3cm9QKzFHVVBzbnRoS0tvcmNhTkw3bURhcVpuTGlQdkx3N0pndnk0?=
 =?utf-8?B?Z3Y4Sy9kMENFN2MzQmZHNTcwWTV6eGZnOVlFbHc1Tk1WVTlWbm5KMlpra1lv?=
 =?utf-8?B?N1lsVVgyK0d2dmE5dHlEL2tVUDd0bFJwRlJ5a0xYMGJDWEpXVDE5SDBVMVV6?=
 =?utf-8?B?ajltbVNiU3FkRUM1c1FyblJoS0RDOUFhTzFUNTBrZFhJSkJqazhPU0dScHY2?=
 =?utf-8?B?RmJIZm8xaE80TXpIUVkvUFdJU0hyZkMvL3E0bzdVMTltbzRZbWRxL1lWQmRk?=
 =?utf-8?B?ZE8zWmFKaW9uc1l1R0lxeDJTckNYZWNCYVNTdU9RelB0RGpCZWdnR2xWd2Vj?=
 =?utf-8?B?ZHdtMHp3Wmp5V01zQWdmZ1M1ODJuVFRUa0I5S3orc2tRSFIvbnhvUUdQL3dW?=
 =?utf-8?B?d1dRNFRqaUhhTXdWRHJYRHBFQ2tWa2NUdVI0TlZkQlRzeUFkK3B1ZkFzN1JJ?=
 =?utf-8?B?eU1TNTZYQzJ3L25MWGdBV0thcFpBNXZnaUNlOS8wWE56a2pEOHNDY1pVSUdS?=
 =?utf-8?B?cXdiOFV0L1lSNnc3Q0ZESmxHeFBvV0VLUDlUTE1ua1dacTNiQjFUbkZ2SnV4?=
 =?utf-8?B?VGNndHVzT05iU0FKNDFlcHluUGRWb3dQb0dSVDB1NGJwaDY5ODdmeGsvZWFo?=
 =?utf-8?B?V09PeWZ1c1QrT1hHcWplUjdPOURBK1EzVHhFc3Fjd093MGo1RkcxM1JQbGpK?=
 =?utf-8?Q?Wrkc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2c0dy93QTV1WFF3NkFXNW9RenpRaVpGMWZUaHFBQUlDSVI1NVBHMlozeWRQ?=
 =?utf-8?B?dHQ2YU1rRUhUT1JER1BSN1REdnlHSG1JWlhjMWRyQkUvQmhoQzFqd2xnY2Fm?=
 =?utf-8?B?ZzcxVWhNWTV4LzhVUlBSQW1lRUs5c2lWWXRvdHRRRUxHVjVSQUUyam92OFhG?=
 =?utf-8?B?ZnNjOGhPOWJPa2JEeG43Z2M5SEJsNWFZVmJPL3pVNC8wdHAvc2VNVzNuNjdk?=
 =?utf-8?B?UUpvMmdia01wRmZJR09XbFdLZjA5NDFEVTJUV09oWWtyd2dpQkgwbTF2VVFq?=
 =?utf-8?B?NnVrQWV6SUMwSTN0Y2FDbXRwR252SGd2UUoxUHBkVlpiaW9mVjlBUFpQN0Q1?=
 =?utf-8?B?RHc3cUFQZExYdjlhQVBscVNmb1VhSi8wS0J3VWtKY2QvT2krdkN0RkdTb2Vk?=
 =?utf-8?B?cFA4K0ZvRkQ1eEJpOTVQWjVqQXJndEpMWGRhdXNheHE5eVQ4L04ycktYNEFU?=
 =?utf-8?B?MFRkSGhwNy9EbUxhaGZoTllJVUY1S0doS0xjUzhXemwyam0zcE9iS3JqSWx5?=
 =?utf-8?B?L0R5dXVSYlZIQ1lqVG9lcHdYeC9GaXBmcFVGajVOL2lFZ0FUQ0JjZkorVnpX?=
 =?utf-8?B?ZTJpbVMrTFZBZjlXdU9iN1ZSRFNib0dJRFU4OXU2WkhpRWh4a2lac0xoRHhD?=
 =?utf-8?B?SHJxOFZwcDc3ekFLNkN5bHVNTGpLY3I0eUFubWh4NG9NZzV4R2RLcHI1OTdh?=
 =?utf-8?B?OHowK0h0Mk5XcEEyK094R3NoN0hscHNyM0t3K3dNUDFpbXFXTXY3QkNrUFdp?=
 =?utf-8?B?aG05MmxaT0RpYjh5WUFodllFdzFzRjk5YVFQN1pjSFR2OVdCSGlBQlg0dTFE?=
 =?utf-8?B?dFludU5BTVFkeVBVUlphRXBvTGdLQ2VXTHRhVzg2N2JDQmV6T1dlTlRCREsx?=
 =?utf-8?B?TzRWbno3L2lpUjZSRUlpLzRDeVQ1VWtXbjVCVjV1WDZuQUN0ckpSZzc0eXVj?=
 =?utf-8?B?WEZIc1pYblR0MU94ampZZjlncDNlc252M1NzWi9nb3JKa2ZaN2xHc3B6QzBF?=
 =?utf-8?B?T0RTbUxNVDNVc09SdWptaTNaQ3ZsUmFCMG1HN2hKanQ2cW8vbm9xT2hEMDdk?=
 =?utf-8?B?MGwxdllBSG9FRWxkWmRrdGM4RThCdDYvN3psUmNSU0NjUXFtL0hXVFFhQWFh?=
 =?utf-8?B?d1NqN0RmUWV0VG84a2kyZHNqMVZUNEpIUmdvalZGWlN6UStqT2E3ckxnY1Ra?=
 =?utf-8?B?Q01UVmIzK2VKZUdkOTVMUHNmRDM5bHI5eFc4ZU1NUDhJRSs0UHEwLzJ6emFR?=
 =?utf-8?B?Zzc0dkpvc3hsTGtpTnorL0RYNFAxbXk2WXR5SHlaZzZJeUh2QVdLSWdOMTRu?=
 =?utf-8?B?M2pwY3NVOER6THV2WDZqNHVySnY3cnBFWkhMQzFINkV3Q0laRXNYaXFGQWo3?=
 =?utf-8?B?dUFHdDJuSk00eWFBZmxsSEduMDhIOEFQdTQzVWgzUmFTWWVRNi91VnR2WW9Q?=
 =?utf-8?B?N2ttMnFLSUs0ZmpVWnp0RnF5RUZ1MzZMbEZGSkJxeEhxYnJlSDBPd0RLK1Vu?=
 =?utf-8?B?c0JQSU5TLzVETlpUYmxza1IwQ0dQbExpV2JURWNpRnlkY1B5OFB3dkhYMmVF?=
 =?utf-8?B?dnVibFJpQjNQVlFHQW50S0xtNG1aVk5CQVVTV2ZqbTJ5N2tpNXFLSFhnV0JM?=
 =?utf-8?B?a3l2OGd3NUsxbHhWcTJpSEQva3VaK3ZQdzFBNUNSOUdSZGZoWkIwVzBUVmJi?=
 =?utf-8?B?Tlo3c3M4NXVwd0Y3SzhiQVhHbkxZU0taTmNmUUVJSUZncmVkd2NFN0w3M0x5?=
 =?utf-8?B?VFppUSswLzJnR0hjdTFSSzNPMUdqakljVnFQU29vekhJOS9BQTFvRTFiL3hR?=
 =?utf-8?B?WkZwbEJia3hYZVpRb0R4cUxUQ1JndjBEQUlUSkdPSVNSZWxKWjlCNFh1dDFL?=
 =?utf-8?B?RzdsVGNhWmNHNE9yMUhQckVXeFdUcU9LbW8yWXNWeDBERFdydTl3QjhOZjls?=
 =?utf-8?B?WUFlUGsyQWdqNnlZek1WbFZIejk2SVBnbHdRelFFVHJvNVpmNFhOWXVDR1lU?=
 =?utf-8?B?TktzOGdQeWFuMUNpNE16WkltdXgyd0x0SkduVDRTdGQ4VzloeEd4blRBTUlm?=
 =?utf-8?B?NE4zQ2lKcWFOZ09Yc0ZrdmpMUXNVblV4U2p0Wnlyc2N5TWhlNWg5TlppMUE4?=
 =?utf-8?B?WUFkUHRSRzdMN3VRSzNHNnlUWU5lb080WjlRRDMydmExZmphc0lscUhaWWRG?=
 =?utf-8?B?YTV3MUp3TFhiemwyMnU3NkJvRFlNcGowbFFkRnY0VWNEcDd5dzVLQU03MXVH?=
 =?utf-8?B?cENuNkxJZ0ROejNBVHZUU2F6TzRQVUxFMXZweG83cWRsV0ExY1RmNmJVKzho?=
 =?utf-8?Q?eT7JlPjwq0DBuBDJ1j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6619e361-da75-4410-1bb6-08de5d7f9732
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:39:31.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYwjMWdrpeRcF5/ygvI31iVMJk9S4cuKHZblnSQN+z45yakjqTkQQnx6EJ+ACzLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51611-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47790912E0
X-Rspamd-Action: no action

Hi Sakari, apologies for any inconvenience this may cause. Would you 
please confirm the following remaining one item in the patch at your 
earliest convenience, so that we can ensure its inclusion in version 8?

On 1/20/2026 5:29 PM, Du, Bin wrote:
> Hi Skari, since this is a mature product, the ISP driver/FW interface is 
> fixed and should not change. The only remaining question is how to 
> initialize them—by declaration or with memset. Would you please share 
> your preference?
> 
> On 1/15/2026 3:21 PM, Sultan Alsawaf wrote:


-- 
Regards,
Bin


