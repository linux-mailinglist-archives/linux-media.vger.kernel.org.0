Return-Path: <linux-media+bounces-39783-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27243B24610
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 11:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30CC93AFADE
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E39A2F3C0C;
	Wed, 13 Aug 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="emXV30Um"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD421256D;
	Wed, 13 Aug 2025 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755078154; cv=fail; b=EMqsLOiEyfu1OCIHuKe5hPjRW0xiTtVTji+8gp4jjqLjwvkuRcThLHTND+Uou4T4Itn4N6UtCFicGt+WruY8Ag03ZYXv8QRxWy3XvZjaJg98h4p1YR7oawD++Vq1X74T6TX+SE6bIuXAWdCOvskSfcfzQCIEtA5ptln5L5fitBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755078154; c=relaxed/simple;
	bh=EL98S4JTShfwPmyfJPcZHdjJrijRazwVi4OpD4CSb7Q=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kh33pLiyXOGzIUsv0+fQu8HhgQ97fcagCIa92mi5UmjiLvwV/6mJHesiKHPYAkXBH39NB+EGyVtn19IYEz2sWl+5D0qTFcTcRYIUO3arrWFqitfoAxW+n+ulrly91JxQYGHOYeRxTYFOmcnQ/R6UQ5kQpID/j1xuy26pGsVdX4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=emXV30Um; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS+rHKLrbmC4vyLx53k+itc/J3XibAnlPMChRgO8P+AgOSESRGRnX1Nd4BAs/twiJwXU3B5eoxfDOu3i9fQrbyKKhGSuoczKWfjAzyPEqDjjAtGvTX1sMf1gV3vX3rPi3v+v8RGtnZjKoe2U9G3dujoYss2Ui9phhx0S1//U9TL/Rlfd+0YHz0U2085wylGhUzdSVSn/cub7uaDFkomkcb38Os90UeC4kDyYQ31oxxjt3QVrlPKwGEDzxviKbFKNSwd6Z0TcVatAEt+kdBilGHoveGptVEZc4SHh7UlU/rs44MpzlC2KSJn204xzg/xPujGXZWODE7Pnn+ZcniH89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2GGID0fcxoboXZrxOoEi8F138a2KFh6KTznDwlOJfY=;
 b=t0NxREX+uhQkwjHhBTcbmOep6QP8HcWQDwv04SBWgrCqxZz6ZStU8XR96cWvK3I4SkQzY717JMyuzJWj5Z4sACiGmXrc+yw1jehfCIcSjTeU0dC75lc4F3cCWwVF2Q9Zha4pFf5nxCfumWCNfeqzYrfNo6Vr+K6aM3vbxTDzigHPK7R5FbkxieT4qNwegUNqZPrzERBNI+xupGnZNXgb1CKgWXWgsKcmTJLXVCAqTqyMUzweDCuR0Z3KxSo0gdGlalEVJJS9CTcpjuAooVBcglxgRN+wxKPahN7qENPdN+J9bmhh1LerpIxcnAPR6DdqjwtI3CT4TWVkmiUR5vSlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2GGID0fcxoboXZrxOoEi8F138a2KFh6KTznDwlOJfY=;
 b=emXV30UmMIH0YukEcEKph/nHNkaNbp/LCQ3/k7fJEZ3cf+nHMzVsbZnvOnQaDiNxILmEfaPOSesdpL87zg05+DWHeMaBqwJmiHqRFaWJS9cUWi58Xb015y+oUQOGopGZtwL88u5GjdluP2vnMPnQQ3fa8qjLaAcfbeJzPwVHFUc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 09:42:30 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 09:42:25 +0000
Message-ID: <72c7316c-d2ef-4ce8-ace4-4ed1dea87d0c@amd.com>
Date: Wed, 13 Aug 2025 17:42:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
From: "Du, Bin" <bin.du@amd.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIchBRdmy48BHl2k@sultan-box>
 <7a422602-7a99-4b49-b994-cddd9730cb20@amd.com> <aIq6DpV_cMJWKfhn@sultan-box>
 <aJmHWQMsk6Pdniap@sultan-box> <5500a71a-68bd-4dd1-99cb-6523281f0c7d@amd.com>
 <aJrWb1LfwXf5PGUf@sultan-box> <1a2e9233-4914-4d27-ae9f-51ca28adf568@amd.com>
Content-Language: en-US
In-Reply-To: <1a2e9233-4914-4d27-ae9f-51ca28adf568@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0004.APCP153.PROD.OUTLOOK.COM (2603:1096::14) To
 PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: bdaffd51-c571-48dc-2a87-08ddda4db539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHdoRlpOaHFrai84bjJnbFg1bit6eFdLeXhMdWp5KzFsenpHR3hsM1dTQ05j?=
 =?utf-8?B?cUJ0OVg0NGl3RDd2RkpiUFVxZjNWYkRpOTlNV3lmbHhuK2RXWE43d0dURmFk?=
 =?utf-8?B?N0c4YTN1bmYzSkpkVEFXL0dZbTQ1eUQwajVTTk9HSWFrOGVmS2lyL0RPa0NR?=
 =?utf-8?B?NzVjbHN4WmxvUDFiWldEWnozaHJkNUdDNkkrTG0yL04xVGxkNk5wbXN2ZmxX?=
 =?utf-8?B?U1c1TnE1MXRkS2cwNDJ5TnlKd1hKcFNpazh2MFdDMVZzWHJXSGU4ZGpFcVhr?=
 =?utf-8?B?UHBBangzeG9heXZ5cG1ySkFGM1cxbkJOb1lhdWJPYXdNZWx1b2hmTGRya2JL?=
 =?utf-8?B?TkY4a2M2RWtEM0hQbFdURVRsb0pGOVBncTE3bTNmaFVIbzlUbk42c05aVEF4?=
 =?utf-8?B?K0dwb0pVN05OUGxVNVBoVEVBMTBNYkVOV1pHclEwaW5obFVJU1VzMnI5UGxL?=
 =?utf-8?B?eDAyOW1HY3pudGFacUlUMUUzbXdaTHNLdE9CUFozeU56bXlpcVNaSVJGNkNM?=
 =?utf-8?B?dU5HM3NKUWdLV1lldXU2VzhKdkx0MHU3dzJXYXI4RWRNVnJvaXFSSFNieHFn?=
 =?utf-8?B?NFJtNy9xNGt4ZDA2YjF4OFEwWWRmT0J5UmVGQU5OSkZxYW1kSWNxSHMwZXJa?=
 =?utf-8?B?Q3JHQ0lQY2hBMldwSm1PeXJZU0duelVVNldOVDZXbFc1UWVINkhzWm8vR1h2?=
 =?utf-8?B?cFk0SFF1N0xtejN0WitzTlY1YThGYm9BdmgxdUVhOXdQVE1qZnF3RFFvV2M4?=
 =?utf-8?B?V2xPR044UVI1TkdkVXNHY3BqbmdZWTQ0MFdtcTQ4aCtuSDJjVTBHQ0NzbEpR?=
 =?utf-8?B?L1V5U2k2VG1NTlI4N1l4YUxWcGNDcXdzVFRqakdpYkptdTZpZ3BkbG12Qm41?=
 =?utf-8?B?Zjl3ejB0ZDdCNkF1OVBDN1VuZlN1azkybVBPdjBVY3kwcHhERjFEeUFxVmZq?=
 =?utf-8?B?NkJZcURETUR3eGdSUUVtTlJtMHJPbGRyVVpiY0kzRE1YcXU1NXd6ZitwRXRT?=
 =?utf-8?B?bWVYLzdMWGFhckpPRnNFYU1oUytPcWlZZDZwTTI1VjBaVUZrQ01YUmZmM0RE?=
 =?utf-8?B?K1QzcHpVNExwTVV5eURacWtlVGExMnFoVXpyN3dGS2tRenhvWjAwL2VOVng1?=
 =?utf-8?B?bnc1bDlwangyd2lzeWhLY1dUUVNLbmpwdXc3cEFSb1BwWWNMOGVFTEpibkI0?=
 =?utf-8?B?bWYzZlZ3YnlvU2FQS1FmVmJJUVlnSWo1T0locW8rb2dmSjJQSllIdlZWbDJl?=
 =?utf-8?B?MUhxbUo0cUh3ODZPU3g4NURtTVlicEprc2gzd3ZGZGVqSXNXVjI2V0xJekpo?=
 =?utf-8?B?a2VlWGNuR0VlTmdidnhZMTIyKzVPOUg3cVh3bDA1SHBlQmMrMHgvb09meEN4?=
 =?utf-8?B?UlIwVkU1akx2akFTdTVPbmhEVjhLenNGM3dPeU5DSlBkQVplVm5VOUplQm9w?=
 =?utf-8?B?VXZPSlhxa29jcHRDZmF4ZkxTeTZ5TS9MNU43TjhkSlh0TU1DdFN0Yk8vOGhN?=
 =?utf-8?B?c3RHRHpsNUtmMFZBVUtYMmppUC9ja2poUFliNjQvR1g2NDdXc05lUmNOV3dl?=
 =?utf-8?B?Sk5STFNTcGhwbERFMjZqY0dTcklodkdObWNLb0FhUWVDQVhsYWtzYzdKWTA0?=
 =?utf-8?B?V2NyZVlaM0dEY21EejJmcElNei90Q3VCckFBZ25qU0NuUjRIYjRvREF3VHlO?=
 =?utf-8?B?SU53UWZCNFZDeUQ5ZjA4dTJQbmZIK1lNL3BrSHVpY3d2SFp1OUhzajl4N0VD?=
 =?utf-8?B?cE0veGxuMm9oVGw5YWJLenJRb3hrUGEvU2laQWtpVVIyd1NuN1h3dVN5Skp2?=
 =?utf-8?B?WFcxSzlyU3d0Z1lQdjlET1lvK2NERjF1NzdqeVNHNnNZQUZqUjlQcE5Ibncr?=
 =?utf-8?B?TzZNa2xjVURCZmF1UU9nT05DQjI3NXdYQzZGbC9xVHEzUkQrSFBjZ1A3NVVj?=
 =?utf-8?Q?OBLSbEzslf4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d052YnE2Q2phRkNTRWlyUFdtSTJ1d3NDSWJ0OElTYXE4SFNpdlFRVnQrVmFr?=
 =?utf-8?B?UW5EZEdkN2IxcUpPaW1HZWJxVEtoMlhiSmp6YkVyM09OeUpHeHBkTy9FWWhm?=
 =?utf-8?B?d05lQnV2UFl0VmMydkZaU05Ob2JSSGRJOGttSlhFbkZQcERrWk5sOTQrVFR5?=
 =?utf-8?B?Mm5YcnExcWZMUVZpbjZBTWJJRWQ4MmF1OHJDWnRJZndMeDQyTzNrRk5hS1RE?=
 =?utf-8?B?RklaWXYyTUswY0xBSmRtdWd3bGpIUXNpWXBYWXZNWFBqVjI1Q1R1ZGV3K2dK?=
 =?utf-8?B?UUtqWEI3WHdMcUN2MXFzZ0tGYysxMTVnM3JHUjByaVVnMEdLUWNpRTZYeHdv?=
 =?utf-8?B?anBEQzFSbHZNNmpZbTIwZXRJcGVESklhUWtkS0tNelozZkljbmhLL0dTcTk5?=
 =?utf-8?B?Ujc2Nm1ZT043SGlEOHlQTHhCWEliWkl1QmU3RzdoUUpzTDBTZzBDMVQ3U3l4?=
 =?utf-8?B?VDdkTDZxb0NEUW50NmduRHJOekE2SjhGY1FsQkVIUllrbmNaS2gxa3l0NWFY?=
 =?utf-8?B?dEFuN0Z2L1dacXlPOUtZTDAzbWVVbGNIam5XM1RUOTV3d3V3NDVPdVZLNHUr?=
 =?utf-8?B?SmpZV2VKNVl6bis2RnE0TUlPTTRCWlFFYjFodGtjVzMvQ1dGK0RMZlhWZ0FK?=
 =?utf-8?B?R3F3R2g4WGY3dkYvQ1hYQ1hFNG55Z2hMc3pOdW5FL0x5ekFQTVpTWmFVaFNH?=
 =?utf-8?B?TUw3ZDdKaGo2Ri9majJScTgyZzk5WnA3MHM2VXZoMFJ2em1OVzMxVjZuaEUx?=
 =?utf-8?B?NGxtQ0dGV0Z0OGlKYnlITmZwZTlycnBFak9VN1lBV3d5WGFGVHF2TFlsTzZz?=
 =?utf-8?B?cjBJVFNqRkVaem1KMVlZQks0ZEd1VlNYWndNRXJRaHJSanBWckdKZmtrRFZO?=
 =?utf-8?B?QVBTKzNYSFdXTGVxVytRRlBPQm03SzFZTms1cWFpYkFUdWNFU1dIMGtmM202?=
 =?utf-8?B?dXllRDNBdzg2R3M4SXIvVTY1Q3d2VUV4SHlldnFkT1lOWGRpeUdMMGZaTEJ1?=
 =?utf-8?B?aXpUaWFDVUV1ZUxWN1NxOW1iOXRrU2hzWlFmczllWVZyVlpxd3RRLzBWS3RK?=
 =?utf-8?B?T2FwOG1tZ3FXL2RSd0k5OFB3d1RWS2t2OFM0TTVmZ1hHMGRkRkhqdGFTSEdl?=
 =?utf-8?B?Q2xXVHY5Z3V2bGNYR1AyR3hJY3ZqTVNFQlJxVEtzTldCdkVTeTc3NGczdnM0?=
 =?utf-8?B?Y0JvaEdjY2luTzVuNmtZTklYTFJrLy9yTEtWaS9wV1Q0VHNpL2o5VE9Sc3E4?=
 =?utf-8?B?d2hNWDN3MllpQnB6YlZrMUhLT0tOc2NTR2pucnhGVml3SUk4d0F5SFM2QTFE?=
 =?utf-8?B?RmRIVzBXMXYxZG45alU4L0ZsaWI2YVdOd0hGZ0wwZTZacCtjVkpzOHc4ZmNM?=
 =?utf-8?B?Lzc1SjRzSGkwejFkb2lhb2FNNDdEWlh5M2ZTbUEvWFBDR2Jjbm1iZEFMYlpV?=
 =?utf-8?B?QlRlVjVOS1ZsTmZmeEZWZzhFQjFBTmlZTDFyTVRja254RkJyeEFlbVJMbkRl?=
 =?utf-8?B?UThNc3dCS2lzNlRXWnVoa2xKWEJIZS9ieVZaTmw3a1NwOHgrZWlWb0tVeWdV?=
 =?utf-8?B?bjhvZ1d6WmVGWVBVVDJVWDdXTkxCKzZvSlk5OFcvT2MveHV3UTQwb3QxQ1JZ?=
 =?utf-8?B?ZkkzV2kvS2Q0bGt6d1hFbHJKU0xzUXVvejNoaEgwdWpoTVRxdnE4eEJQdTRO?=
 =?utf-8?B?MFZnUnRabEhFdEdCc3VuQUd6UVpKZ09FclBPN2NZK2xIQllXRGN1eTBlTGlW?=
 =?utf-8?B?V0RHMDh5ZFBzam5lSmZJcTR1Mzhsb1JDUFNWb01jcXV6bXV5cUlzMGpCY1NJ?=
 =?utf-8?B?NW1VSnhHS2lmdjhMTTlRMUdWNUxKb1REc3AzblJyOE1WQ3gzdjE1TzRZbnpL?=
 =?utf-8?B?SVNtZ0NYWDh3RFltWUJQdmxRRkN4U3NnTUJSZzFodTZKUTBBMUc2UWM4eWxV?=
 =?utf-8?B?VVpwZEdHS1dYQWYvbDdSRmRSZkJxekd1YTc4VmF1QmJFMk5yVXoxbmxYK09X?=
 =?utf-8?B?NDY2RVRuOFY3SWJDVlo2U0FWR1hUWVlrQjMvZjVVYW5hZGdYR0xKUW1hMEQ3?=
 =?utf-8?B?YzFIVFBDdFFJNFhzbDdkNG1QbGtFbHVMTmZrZjMvYW5Hazlmb0l4aUduVm9y?=
 =?utf-8?Q?AVZc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaffd51-c571-48dc-2a87-08ddda4db539
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 09:42:24.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkvmdQY3ifmdq4oUkTl8xTA+N+ihXLC8d6WsLzX1CHGtbgPImlBdexBE2jrbV+I4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599

Hi Sultan,

On 8/12/2025 2:33 PM, Du, Bin wrote:
> Many thanks, Sultan.
> 
> On 8/12/2025 1:51 PM, Sultan Alsawaf wrote:
>> On Mon, Aug 11, 2025 at 05:05:39PM +0800, Du, Bin wrote:
>>>>> [ old quotes trimmed out ]
>>>>
>>>> Following up on this: there were several more issues hiding in the 
>>>> driver that
>>>> needed to be fixed unfortunately. I ended up making a lot of changes 
>>>> to fix all
>>>> of the buffer lifetime issues, and I created individual commits for 
>>>> this work
>>>> because it was getting hard to keep track of all the changes.
>>>>
>>>> I think I'll have this completed tomorrow and will provide a link to 
>>>> my tree
>>>> with my commits. Hopefully your internal branch hasn't diverged too 
>>>> much from
>>>> this patchset submission, otherwise there may be some conflicts to 
>>>> resolve.
>>>>
>>>> Sultan
>>>
>>> Really appreciate your time and effort. Yes, big code changes happen 
>>> in our
>>> internal branch to address upstream comments, but i believe your commits
>>> will be extremely valuable. We can check and test after fixing possbile
>>> conflict.
>>
>> I've pushed my work here:
>>
>>    https://github.com/kerneltoast/kernel_x86_laptop.git v6.16-drm-tip- 
>> isp4-for-amd
>>
>> Please see my changes since commit 
>> 48d18b6e58c6dadbc79374773736924d2f532da5 on
>> that branch, up to commit 5cdacf4ff108d83869414a00465e7a612bcd04b1.
>>
>> There are 29 patches:
>>
>> Sultan Alsawaf (29):
>>        media: amd: isp4: Use amdgpu helper functions for ISP buffers
>>        media: amd: isp4: Remove -mpreferred-stack-boundary=4 cflag
>>        media: amd: isp4: Remove -DCONFIG_COMPAT from ccflags-y
>>        media: amd: isp4: Remove the myriad of redundant ccflags includes
>>        media: amd: isp4: Pass warning flags through cc-option
>>        media: amd: isp4: Clean up amd_capture-objs formatting
>>        media: amd: isp4: Don't set CONFIG_AMD_ISP4 to y by default
>>        media: amd: isp4: Clean up AMD_ISP4 Kconfig dependencies
>>        media: amd: Fix Kconfig/Makefile directory structure
>>        media: amd: isp4: Remove superfluous NULL pointer checks
>>        media: amd: isp4: Remove superfluous void pointer casts
>>        media: amd: isp4: Remove superfluous memset in 
>> isp4vid_vb2_map_dmabuf()
>>        media: amd: isp4: Don't read refcount counter directly
>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>        media: amd: isp4: Don't increment refcount when dmabuf export 
>> fails
>>        media: amd: isp4: Fix possible use-after-free in isp4vid_vb2_put()
>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf memop
>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>        media: amd: isp4: Fix possible use-after-free when putting 
>> implicit dmabuf
>>        media: amd: isp4: Remove 'refcount > 0' warning in 
>> isp4vid_vb2_put()
>>        media: amd: isp4: Fix comment in isp4vid_vb2_dmabuf_ops_release()
>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>        media: amd: isp4: Add comment to CONFIG_HAS_DMA #endif
>>        media: amd: isp4: Move up buf->vaddr check in isp4vid_get_dmabuf()
>>        media: amd: isp4: Remove unused userptr memops
>>        media: amd: isp4: Make isp4vid_vb2_memops static
>>        media: amd: isp4: Add missing cleanup on error in 
>> isp4vid_vb2_alloc()
>>        media: amd: isp4: Release queued buffers on error in 
>> start_streaming
>>
>>   drivers/media/platform/amd/Kconfig               |  18 +-
>>   drivers/media/platform/amd/Makefile              |   6 +-
>>   drivers/media/platform/amd/isp4/Kconfig          |  14 ++
>>   drivers/media/platform/amd/isp4/Makefile         |  42 +---
>>   drivers/media/platform/amd/isp4/isp4.c           |   9 +-
>>   drivers/media/platform/amd/isp4/isp4.h           |  11 -
>>   drivers/media/platform/amd/isp4/isp4_debug.c     |   4 +-
>>   drivers/media/platform/amd/isp4/isp4_interface.c |  46 +---
>>   drivers/media/platform/amd/isp4/isp4_interface.h |   6 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.c    |   8 +-
>>   drivers/media/platform/amd/isp4/isp4_subdev.h    |   4 +-
>>   drivers/media/platform/amd/isp4/isp4_video.c     | 297 +++++ 
>> +-----------------
>>   drivers/media/platform/amd/isp4/isp4_video.h     |   4 +-
>>   13 files changed, 122 insertions(+), 347 deletions(-)
>>
>> At least 1 of them should be redundant for your internal branch 
>> (9f394a7af2cf
>> "media: amd: isp4: Use amdgpu helper functions for ISP buffers").
>>
>> Cheers,
>> Sultan
> 
> Wow, amazing, fantastic work. Will compare to our latest internal branch 
> to see what might be missing and try to merge, then have some test. Will 
> let you know the result, it might cost some time. Thanks again.
> 

We cherry-picked your buffer related changes and did some quick test, it 
works well. Will merge them into our internal branch and check other 
changes later. Really appreciate for your time, effort and good work.

-- 
Regards,
Bin


