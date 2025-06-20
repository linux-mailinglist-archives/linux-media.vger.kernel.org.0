Return-Path: <linux-media+bounces-35453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E584DAE11D1
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 05:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27BDA7AC79D
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 03:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC461DC988;
	Fri, 20 Jun 2025 03:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ba493JBp"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA27404E;
	Fri, 20 Jun 2025 03:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390342; cv=fail; b=rTtWnOB3BoJ6uppd9lNg4gXbmuKH8ABe/sQDwBxoV5mrnIdlXNd2Uz5JJnCUff1AJkVJVDDei+qL85NMS8bJ6Zw1XzWbStxjF2izHHnRnJapDeqCjmz0CgLcnr7lTP0c+9FGX2snGHL7xvkZjya6evojAN2okdvmdtDBGT63JtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390342; c=relaxed/simple;
	bh=rrJjvafpL8z6ZqOmLpsI1XfBrsmZ774G950SLKQ4Mto=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sEBrp3Si/6Un6rqhno/V9WLSUjkSeN7q7MC/UUuRO0PUeGxppQQVry6ryBWk/Jt55SMdup+9ND45tNowlWzHxp6Nn1RbaZCLphaVJ/JVxOGdC/BZLOddP1DKCZ/TZi8mDS4k++lLeRxmQCkuGm7lI4jPgL/txLlkGapdmG3R3zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ba493JBp; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9IMIWU+exl5B99GlHo5Kp6dyBa/AfFzSzTVbNei/Hli8idJlF1y5mJa64kPinqVK0bUs3hT1Nh8lSeceKo0wolNgscoraYXuhOZqsihYoS0YQ5FCRbtdoGupworN5heZtjzK+z6CuKgAB+dkOHrT1tLbWaDZygfYHXVD1fLhXCZ9CQ0G4OkuJii3Urh7eWHBdNzUHA7LfXQGhI7Mzjk7Eghv8IA7KMnXJ4vZpke2j/YWixEHvvg8FQBcK90Vl7nYth/GjS4KlXey3hQKOb+woEM6nPEptKYO9w6hc3ifrQ9HXCFjaNY/rG3Qmls4ljmXJBabKFcXqKT06UnuM958A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AofSAVsonIvu1YL/CfpmfG2Tg4MJe2E6f6jWFLWk/0I=;
 b=vPgz0cBIDrLW2geRl+z2Of4X6RvKEFgOislTLOer1VUTbnjMWzQj75PSIWvgwM8d7LfyU0nYC7ChxBgSBSt7NswBC5aVMKR9/OibPahxcjqpnAVMckS4ygH/gsygA0BTtIzK9nWVbl+06+OkA1LwF66l+k1e8CI8+B5i5kbNSjTdV3jcmb6xIUua/ng5i2HagE/w9W7MK8QMYHzE2S6chC2+UVESywzDOSDP08/LYA2I/Fy2YrLTM7dkmgm6AFplc0BnLCPTmzeVy2yv2lGcmGTO8LrI8Fb+npEr2dzjhPorVER5HmFAgoeCCZKJvslBlLrnWmeicQQpyxNKzg0ROw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AofSAVsonIvu1YL/CfpmfG2Tg4MJe2E6f6jWFLWk/0I=;
 b=ba493JBp69rkmp/fCLQSiswyoy/P0xSue4uuqf0b1qZm5JhZKPuv8GUnTDFfhb/XxWs0Rn1ixx0DECzXqEEf9rADYlxPZSHuR+dfIpUhXh8D9rf29eJBb2NMWvD9Da7UT3ZqW+04eG1xPFDaFcfL/z+3k+eCVQ1ZAGwIz/Q3olE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Fri, 20 Jun
 2025 03:32:15 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 20 Jun 2025
 03:32:15 +0000
Message-ID: <a7a2e647-eee6-4ca7-ba91-13f5617e9b90@amd.com>
Date: Fri, 20 Jun 2025 11:32:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <42bac0f3-159b-4192-b23f-658d7edc0d37@amd.com>
 <6735fb02-24a0-42c1-86ab-605a783c4f47@amd.com>
 <beb4ba2d-49e9-4945-b3c9-5af6927026fd@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <beb4ba2d-49e9-4945-b3c9-5af6927026fd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1eee1c-b6ff-4fcd-f61a-08ddafab0d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU9tR2s2eWhES1ErRGYzSDFLWVhDUUJtSlk1S00yTkZ6SS9YOEM2QXI4VHFP?=
 =?utf-8?B?djE1QWFLckU1dVo1bytJZzZzRW9HOVZ4d0laRHBjY0IvQkZKSXNFWTNmVnFF?=
 =?utf-8?B?THlNQWR1ZGRKN2o0czZVbFNPRVppSUttMGs4SzVBODJOYTlqa1pIMSt3VWpa?=
 =?utf-8?B?Y05Va0RhamdJZEpoRlpxa2FkNDkzUFJzcVRJbVJvTEl5NW5mN0VtL2oyUElR?=
 =?utf-8?B?MWZWN2pPVnZKMGhYMy96YWJHZTkvMzhMNzNoVWRVR2NKRExldDY1U2dmQWhk?=
 =?utf-8?B?MlZHWTFEeDBRVG9FbEpONkNZc1NQL2lFNXhVaHJjY2ZiWFdxbTd5NXR4L2NV?=
 =?utf-8?B?UmQ5U0hPeGRwVUtqcmZmSTl2SE5TWWd0cGNwTjlTeDFRMDBvdjB2TEVMNUlM?=
 =?utf-8?B?VVVmd3FkQyt5QjU2bVJteGJveDE3djQwd2wwTU1QTzY4b2dRdVZIbTVMeUVS?=
 =?utf-8?B?RlgvRTNPRUtDeTNycTJEVGszM0M4ZHllc1ZYdkJOTEMwTXplZEFsYy8zaTls?=
 =?utf-8?B?NDFZS3NuaEZ0L1dDQ2NYVDVEN0k5NlBjT0tPd25QVTIveU5wRjBuU2dlVys4?=
 =?utf-8?B?SnlDME13eG10SDYyYTFFZHVoeTJ1MGRVL2RuSWxuRG56THAzSTh5LzF4bGN0?=
 =?utf-8?B?d2dYVFJaRFpzNDAxTVpsOHBaSkFuTGEwY2tzdmFBNitra1VONnIzWXcwWHBQ?=
 =?utf-8?B?RjJQTnJqcnVPNy9XYzVVVVdyempNYlZkUzh0Sm0yTmRTNWxKam1oakFGeTNI?=
 =?utf-8?B?OHhMOEduZnloa0E2UStWeldmWlBCcjhXbmlndUxZd01kVng3TXZZQ3RlL3Qw?=
 =?utf-8?B?SGd4TGJ2TU4wRTI2amprb1R6L0p0TzVjVkJNNWRvQmVrL3BCVTBOODNwdHRs?=
 =?utf-8?B?WFEzLzR5R1RoS3hqeW51Q3FxdEVubVFicmh5cUNSQ29TUE5NVTlPKzdyK21m?=
 =?utf-8?B?cy9nOU9VYkZ5OVhVZFVncjllOFdML0JMQko3MEtTR1Rid2E5ek1lRmNPaVpS?=
 =?utf-8?B?dW9FcHo0SjVuVHhPMk9Zb2hidjF1QldlR2NWcVV5Nk9tY25RZGIzYnk1MUpz?=
 =?utf-8?B?Q1Jtb1JlaUY4eldHdXZQOThkMWV0WHRKMUZoU3FqU2VFYmkvWDV4ZU5mT2RD?=
 =?utf-8?B?ZUlmUGU1VUxUNUpoeUpCTGlPbDk2VDV2WE9scTFlMjdjaXRjQXFGcmxNUXp4?=
 =?utf-8?B?WXM2TXROOTdwSXhWRkZIR2JRRVUwVzRwKzBPK0VGWHlKMGpJb3YvTlZnUjhE?=
 =?utf-8?B?emo4OU5kbzFNcWt4blgyRktBbkJaamFtZU5GZFQ0UEZWMkpPMGhxanRPcFhV?=
 =?utf-8?B?UkRCUzBBK212TVZZRnRLVDZrRUMzTTBabUZ2OCsrVWNNaWpjZDdsU3RtMVJ1?=
 =?utf-8?B?TzZDb2E0dTdLNndiZTFVYVh3M0ZwUkZJMWFqbURSZUhQb1NSM2VkSWkySlFG?=
 =?utf-8?B?U1daL3VtbkVCa3NsQWdpeWpVaElmTmRWNERHRnQ2WVZacDNMRUVZRXVESmZE?=
 =?utf-8?B?SVdybnVGNWNLVVRJakEyemt3Z1g5bG1RNEVDTkc2K0VYN2c0QWxkSGRoVk12?=
 =?utf-8?B?WGxTTTBYWlRoOXdkN3l6U1NFbW9GS1BIbEZYVDNpaEVCc0s5cS9mdGFwbmht?=
 =?utf-8?B?NTk4bnhmWHJ3UE15MXMvaG43dWVnSE9QTnhTWllJcTVHZFBUSFpBb2NrVTdM?=
 =?utf-8?B?a3RZTWhJUkF0S01RY2gvMTB6eDdQTk1MWGVkRGNoWTBRblpEUnRaM1M4UXo2?=
 =?utf-8?B?dklEc2J3MlFwbDlKYzQxR3NybXpteFk3MklrVGxSc0hiZkNOc2NVRGt3T1dU?=
 =?utf-8?B?L1JyeVlDYkxPSHEyK1JvTXllQ1ZQa3UzYlRDaWtrTzRmelFYd25FdHgra2M3?=
 =?utf-8?B?QTVHbUdyMEdGbG5sczA2TjdlNjJNK1ROaHhQaG0wUHAxVTdQOVZqTlQyVG5y?=
 =?utf-8?B?OC9sWXhFVzNac2FxOXl6dG9rWXJ6M2RsVkNyQWNyWG85MStLdG9kTzVqN0VL?=
 =?utf-8?B?eEtQMjdhbjhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkUwOHlqQTJLc3FDRDhGNmNPVHVhWFRrai8rb0FpSkJEZG1WWlFFa1FIbnJx?=
 =?utf-8?B?anVMTUt1Q2tLNHFWa2lmZUF3Nk1USmR5NzNRRzVsazJMSnJmOHFFYm1pSGxp?=
 =?utf-8?B?bGUreTJXUWY2ZHhyd1RDL0hORndpWG5oc2trMThpR3hRV0hWV1VFTmUyaXVS?=
 =?utf-8?B?VGQraG5yUkxMblBKcEdRY1pJaERVWUlNOVQ0SDA4TC9la1Avc2xqeVBnd1lJ?=
 =?utf-8?B?c0x2MmFNZHpzMWpac2ZaczRGUmY3RzhpQkIvRVlhQTBveTAwT2kxUXBSUWFn?=
 =?utf-8?B?TzN3SjYyOHU3R3Jlb1NldXVKVWRZUFVZOVIrK3hPbklNZWFQZ2EzM3NwZE9J?=
 =?utf-8?B?NWtOSUtsbXlQa21ZNHdKWEg2Szd0ckRwY1ZtTURmS0x0d2lBOWVNY1JtOS9t?=
 =?utf-8?B?dzF6WExOeERabmxMdU5UQ00xcklXZjArREh1aHNhSWhOaC9tZjJadzhqaCtn?=
 =?utf-8?B?em5uZ0hJSysyNEdZV3lNVVpmdG1QV1hSSDVpSGRnYkFqTzBuQXpTY010OW8x?=
 =?utf-8?B?SzdLeXlvMjdvSnZqMkwzdkt3TnFmOUpHWGUyaElwRzRxSW5ZUWdIaUcyN3Rn?=
 =?utf-8?B?dDl0dzZEZjdWM2RMcGhhTU9BTXRnUXVFY1A1SG5RM2JRNVlZbFNEMFhzb3lH?=
 =?utf-8?B?UWJla2R3VlNVcVM4elhFMDdpVEIvUWl5bDg1MnlRWlB5cmRZaGtpMmhta2g1?=
 =?utf-8?B?dG5rWmszTVdtMHRka1FhSzRvMnpZcFdxV0dVSi9CUmwwMmhvb3lJZllFQ20y?=
 =?utf-8?B?VXVrdnVvTjRUbEpycG0vQ24wT0Jjb2V3WlJnMlNSOEpWUzZ6NDAwWUd3YVUv?=
 =?utf-8?B?WFlMM3ZueFVtNnBaVnluMDdRN3B5RCthbVpsMHlwakRJMTQ2Wm82VG1NTUxs?=
 =?utf-8?B?S3ExenZ3Yy8xOWN4RzNjMHB4Y1J5M3d4SFJiT2haOUxPOXdSNW5KK0x3djhr?=
 =?utf-8?B?YVZqUzNpem1ySlpkZTNad1FJMnhjRFB3alZjVnBKdkwyZWJkSnlqb3VqdDdu?=
 =?utf-8?B?SUxtejdNSmZVT3RzZFppQ1dBWjRvN1NxamR1YXZjSzhJc3N5WWtMNUpNUGE4?=
 =?utf-8?B?T0NQTUd4NlAwV0l0bjhDSG5SbmphZmxrNURETytYZkpuL0JlUjRoVnpoeDlD?=
 =?utf-8?B?YitFYkFISFZzVGtDRGtVWE1yYk1JYTNFQ21McmQ3dnA3b0ZRYnl4b0ZoM09Q?=
 =?utf-8?B?UWd1bVBjMVZMVnFUL2lqMUhJRGNrK3d3V1RuelVzUStnazZPL04wQnV5Qk5Q?=
 =?utf-8?B?ZFo5QTVtTzA1STBDSEo5dkRGOWphT1M5aFZWZy9nYWIxUitJM1FxcU1uWlAx?=
 =?utf-8?B?M1AzZXdiOWNXdDI3Qm9mN2ttYm15WnJHVHl5cGg0ZDgxcTdvZmxiV2sxMEVU?=
 =?utf-8?B?cHZacjJHWVdpYy84VXgwOVdHOEVrYjlPeVRDN0NOa2xubnRjYXMrWXNtSHlY?=
 =?utf-8?B?QTZsS05udk1qNUtiUjU4R25HM29IZWVDM3VKamxlcll6aE81R2VmNU1EMTFN?=
 =?utf-8?B?RjB4cktOV0VWWHhDU0pFd1RmTWFwbU5QSmducXNyK1pqK0xvOTJ0VFBUTUkw?=
 =?utf-8?B?NzgwRnUzaFN4TFhZaFM2c1p1bXlDcTFHVVhvcEh2ZFE1T3dlRlVSam5RYTZp?=
 =?utf-8?B?MXlGZU1odS9mL095UjZzc3Y3OU9paWRxUWgvL1QySVFlaDdiZ3ovOVJJOFlS?=
 =?utf-8?B?YlIyQmJ3bzZ3cmV2b09uQ2R5ZUtOQndRL1VRNUNsM084MG5BM0ZWQzRYcVdQ?=
 =?utf-8?B?Tlc4YVRMcnNuZHQ1L0ExZWdYNWY0MkpZMDhETURNSmEyLzBpcnVJS3UrMmNr?=
 =?utf-8?B?S3o1UVJtNUZ5RDRuVFlTMlk4cjJmNUhpdVdUdmRwbWpxR1F3OHpPa09SSmRE?=
 =?utf-8?B?ZFYyYTJvaUQvYTg3RmhtRTZJbThnU0dRNVZMT3FFRXVUVXp5cWJ1M1FXUWxp?=
 =?utf-8?B?Nng5eUt5NDhaTDJjeENldXJBa005Q3RQVTVNRWhOU20xdW9qdjhvd0NWdWEw?=
 =?utf-8?B?d2NaZGdpM2x2blhuZ3hIb3lOSVVhV09OUmpaK3hCS2Y3V1VZYVk2bzhIaDky?=
 =?utf-8?B?aGlrT0U0cUt4OTZWWDB4bGpGL1pCcWhHb3NIdXROUVN1bnMwWEJaUUVLSXdr?=
 =?utf-8?Q?s5Dg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1eee1c-b6ff-4fcd-f61a-08ddafab0d07
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:32:15.2586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Lx2iz3HfmQYr2vza7Mc+bCbW8Lb2jbkickRO+/vDcZIAHxk3nYe8FDmN9uXCysT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176

Thanks Mario, add more comments

On 6/19/2025 11:11 PM, Mario Limonciello wrote:
> On 6/19/2025 4:58 AM, Du, Bin wrote:
>> Thanks Mario, will fix in the next version and pls see some of my 
>> comments
>>
>> On 6/19/2025 12:17 AM, Mario Limonciello wrote:
>>> +Alex
>>> +amd-gfx
>>>
>>> On 6/18/2025 4:19 AM, Bin Du wrote:
>>>> ISP firmware controls ISP HW pipeline using dedicated embedded 
>>>> processor
>>>> called ccpu.
>>>> The communication between ISP FW and driver is using commands and
>>>> response messages sent through the ring buffer. Command buffers support
>>>> either global setting that is not specific to the steam and support 
>>>> stream
>>>> specific parameters. Response buffers contains ISP FW notification
>>>> information such as frame buffer done and command done. IRQ is used for
>>>> receiving response buffer from ISP firmware, which is handled in the 
>>>> main
>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>>> helper function prior to stream start.
>>>> Memory used for command buffer and response buffer needs to be 
>>>> allocated
>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> ---
>>>>   drivers/media/platform/amd/isp4/Makefile      |   12 +
>>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 +++++
>>>>   .../media/platform/amd/isp4/isp4_interface.c  | 1052 +++++++++++++ 
>>>> ++++
>>>>   .../media/platform/amd/isp4/isp4_interface.h  |  164 +++
>>>>   4 files changed, 1546 insertions(+)
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>>
>>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/ 
>>>> media/ platform/amd/isp4/Makefile
>>>> index 0e36201fbb30..c0166f954516 100644
>>>> --- a/drivers/media/platform/amd/isp4/Makefile
>>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>>> @@ -5,10 +5,22 @@
>>>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>>   amd_capture-objs := isp4.o    \
>>>>               isp4_phy.o \
>>>> +            isp4_interface.o \
>>>>               isp4_hw.o    \
>>>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/include
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/amdgpu
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/pm/inc
>>>> +ccflags-y += -I$(srctree)/include/drm
>>>>   ccflags-y += -I$(srctree)/include
>>>> +ccflags-y += -I$(srctree)/include/uapi/drm
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/acp/include
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/include
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/modules/inc
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/dc
>>>> +ccflags-y += -I$(srctree)/drivers/gpu/drm/amd/display/amdgpu_dm
>>>
>>> IMO this feels like a hack and also fragile to be sharing so much 
>>> across subsystems.
>>>
>>> Either there should be a kernel wide include/ header that can be used 
>>> by both or there should be a helper exported to get just the data 
>>> that is needed.
>>
>> Yes, will refine to remove unnecessary ones in the next version, 
>> actually isp driver needs to access function amdgpu_bo_create_kernel 
>> which is exported by amdgpu and delared in amdgpu_object.h, because 
>> amdgpu_object.h also includes other amd gpu header files, so have to 
>> add these include path to avoid compilation error.
>> It'll be greate if there is kernel wide include, any suggestion for this?
>>
> 
> Ah yeah I do see exports as of https://git.kernel.org/torvalds/c/ 
> ebbe34edc0a90
> 
> So based on what is in the tree right now what you did "makes sense", 
> but I don't think it's "correct".  From another driver like the ISP 
> driver I feel that the code should really just be something like:
> 
> #include <linux/amdgpu/isp.h>
> 
> I see a few ways forward.
> 
> 1) A new set of helpers created for amdgpu that can take
> opaque" data arguments (maybe the mfd device?) and return back a pointer 
> to the new buffer.  Describe those new helpers in that isp.h header.
> 
> 2) Manage the lifecycle of the buffers in sw_init/sw_fini of the ISP in 
> amdgpu.  Store pointers to them for access in the mfd device, and let 
> the ISP driver take references.  This only works if you don't need new 
> buffers after the driver is loaded.
> 
> I personally prefer option 2 if it is feasible.
> 
> Alex or others might have some other ideas too.
2 is not feasible, because the buffer size and number are decided by App 
at runtime.
1 is really a good idea, will have more investigation internally



