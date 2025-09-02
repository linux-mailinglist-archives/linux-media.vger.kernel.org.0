Return-Path: <linux-media+bounces-41499-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B1CB3F2CF
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 05:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 933477A72CB
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 03:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265142E092E;
	Tue,  2 Sep 2025 03:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zw8V/EWP"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6E27057D;
	Tue,  2 Sep 2025 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756784402; cv=fail; b=jjTQbRjnhknOOVcUrgGKgCQCQ180/vfJoYralAo/huF174ZG5pZJT8K1x1qIuQ4hJdgKnwlSiZ5eDjb3/Wspq8RBQC9cw/LGZvItkqTRd8x9fZ4EU4vHNNQv4FLXpuHpN1/8615IUElFZfcjA0q20sPR/2cDwduqh7KYT2HcrdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756784402; c=relaxed/simple;
	bh=XF6z4FlfbH1FwJVK49tYnlK27H4frPQyZLrWHpx2A2k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ko/tZ/cNqc5z6FDLFiS7GS9r79XRjv8YgRngPZ0axJZuwPiM161ay+yBN+SL+YRFdapOeGozYdxpZuSJrb8tM5wD7YNNcynh/grYMgb8koWot+zZLgoq7kWVmaykw/LZvO4rPN6HrYMKOo2/54jJpdUJPbAP7BdR9GWd0j0YgTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zw8V/EWP; arc=fail smtp.client-ip=40.107.93.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd3KFF9dCxw1N+N02WhQqcCP7xGwmkRA1MMfO2Y6/BcsrkE5LOULTgzLp8MLVzoPzLmrBFw0bGq7q8aDhR/zoc6OcJ9XQyKQG2LZ21hdu8V6WB2zyr7gz7vnXb3sQdfjlZEmk2mgAdbgaX2HS7XPHUPT9is42dm3Isf4UMsddjo38iD8AVZuxHFOcfU5AORCq2FaRw0nHlhqNtYaniUor6m1d+ZcmX2YgkBsfhJCk2Xt3k5thFNh4nkNgSLfDnELsa35Rc5k4ETfyuKi5GQqBwDEfJL8SK2m+80wu53i2kOd32xHVpiXz2qkrrw62cMIZ5jhpCd56a6bDhLxKyK7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+YkBjjtMwuPy+flRQ9iUHXYRksqPaplWG6Dy82bAZ0=;
 b=hlQbTBQB+l35Oo8nimXowNVRdDGhjUfTjcvW8AWzM8eOaz8deh/U12A5r4AJj0PjO/uVHjhAkrURdElEYCaSVUoAirNju2w4uecfCnMiA77yIERCrUYMWjqCIZppD4WX7pqyc/aFkkXEJ5lTtuRDADnmbhRdVnSFakXIP3szNPA3obnjKUZoUxdgHrou6UVOMrpmJt0cvid0yRqfFP6FmXp2E4DaO9ZYPm71IVIQDFfpy+HtO/QHquAv5+d5aaMOGjgNwYH7x6eA8+BZk0Re/uC9Mkw9if0/ZQqL+JBOyw5dSN0utOqNhXyG2KLSLaLKxcxOWt0ZHhZs+SaVTMlJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+YkBjjtMwuPy+flRQ9iUHXYRksqPaplWG6Dy82bAZ0=;
 b=Zw8V/EWPCYpNVYbirIcxM2ND7bqLAwndoNmxIlT8pQtvHwM02W9aYR3UDkRpVxKA1mzgs/Tb8sPglECDnDV9XramhK3u6pnwakTDZUh5u4fvAmFyT0SHOs946V5uH9SvkTWn/iB12VFoZ5S3kCk3iqnTR9OsMPbT+OBHm2blhm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.28; Tue, 2 Sep 2025 03:39:57 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 03:39:56 +0000
Message-ID: <0a10bae2-600c-4ca2-8437-411e9c236d5c@amd.com>
Date: Tue, 2 Sep 2025 11:39:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <20250828165605.GA9916@pendragon.ideasonboard.com>
 <20250828165850.GA14246@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250828165850.GA14246@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: e16d0476-c6e9-48db-7d5a-08dde9d262a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDdWL0crZTYzYjg1MWozM2hCM1pCd05nNUVtQXZ6YUMxcHBDWGtQZkdJaHRh?=
 =?utf-8?B?M3g4L2dZdXBtLzQ4bEVORCtDZ2YyQm9IS3JNbWZJTDFJRWVpTjJKaEhsVVlJ?=
 =?utf-8?B?RVk5NUZYblgvWXN5cHpRbUpJcnFXM1lYMlJGamdZc2VrQUVKME1KZkdpWXQ1?=
 =?utf-8?B?R3VTUnNYeXlQN2FHQlNyV2RaYkZuRjlFTkhJdURCdVo3dmFFRnBlMkZ6L2RV?=
 =?utf-8?B?WXkxdXVtQzZaRWxEN2hRUmlYSnVVMG5PSVN5aEltNkdSNjNma0MxaG1NaEh4?=
 =?utf-8?B?K25XY3h4U3Y4RE00Mm1TcTZLemdiN3VnUStUeGRzL2E3UWFNb3cyRzBKWUhN?=
 =?utf-8?B?SHpaQ3RwY1g1UEVIY0p2M0dVekNBeEFWMm5hVVJ6dXVhQzFYU01TZk0xZlpM?=
 =?utf-8?B?dDhsVlRZVWwvSjlZVkgwOVJKbHh2NFdDQ3Q3cWVYajRyVWd0OUV6eVh3OGxD?=
 =?utf-8?B?YUZOUWJGajZieEpLa1FkbTVjcjFJTkQvenRvd3FvSDFRRFV5U1pQTnJkVy8w?=
 =?utf-8?B?VzhWY0laOWp6WW5tZTJFenVmTzNyNmpjMkhzMUlDWTlKOGY0S3B6d2lPeUhV?=
 =?utf-8?B?bzdzd01hK1o4UGJRcmtycHZEZVNidGxHWHpzRWVPUTJiMXYwRE9jZzlqaG1D?=
 =?utf-8?B?eHVrQjdhK2VYeG1YM3d1RCtldFdXd1FJN2tEeHhncDZTZndaZzRsb1dJNWpW?=
 =?utf-8?B?dkswMGIvNTdjN0UraWNEQzBvdFV0M2Y4T0JBRFdmRy9RNWFkQW9BTWwrR3Qy?=
 =?utf-8?B?L0dIc0JHMTk1NXpja0NlZXpOUjkxNW4yT1E1THArOWVFa0tPa2NHVENHUTZX?=
 =?utf-8?B?cmFMQk9sOVkyUXhMQU9pYzF0aEM1b0kxZEcvYmwxVERFQUFaR0NyVzBoaXJ3?=
 =?utf-8?B?bVJRUktXNSs4K0JhWTA0dFBnb1R1RHFkSDhHSC9HT2cza0Y5d2RuQnpiYVJP?=
 =?utf-8?B?RktuZ21mOE5vallVY1I4dWRxWXorT1M1MVlxUm5ocFlVT1FIMnJ0dTE0dk04?=
 =?utf-8?B?b1FLVGwzb0gwM3U4amx1WlJOQ1hlZ21VSGo2QVFVa0lsN0cwTTRLMDBSaGdY?=
 =?utf-8?B?ZU5LeWVSQkhiM3RyeHNzQkN0enM2K0U3bk9oOGE5cVU4eitsN0c5MzNSODBj?=
 =?utf-8?B?OWxjV1B5ZFJoV004MldGNUludW5IR3BXTjBjT1ExV2huQm1PWmYwUU5hbDFH?=
 =?utf-8?B?QmpxY2dDUWpkWEQxS0tUOGRQcDZFanJHY3Q1ZkU5Nml3OE45TVJJVHJkWk0x?=
 =?utf-8?B?Wnh4RVhidFd3WUFycUNNS3RLOGFRdDRNbXlwSVZreDZPeXM3LzJWR1dFMVdW?=
 =?utf-8?B?dXJmOUhyUTlkdW5xcXovS0RLTlhtQm9FbldEWTJVRnNQd3ZTc2x4Smw5ZFM1?=
 =?utf-8?B?L2JONUZleG4vSEgwSHRidGFVNk1xRnRQMFBNUXhzS3lWRXlaSHlKbWFlRW5T?=
 =?utf-8?B?SHgwZ1pOUHg2Zjc2SW9kT2FERUxyOVpsOVVXSGN6dXVwYzJlbkgxbTY5UHdI?=
 =?utf-8?B?Tno1UlFpNDRyazkwT3diaHB5K3Y1WVM5S3hRNVBMTFRZRHJVZmJ1eXQxeGJx?=
 =?utf-8?B?UHNoVVl3NDM4aVhLNDQrNXhIVHROeVQ1dCt1QWRkYnBDNzhtSVcyMFRyUHJZ?=
 =?utf-8?B?S205dEVUWVBSWXMzOVlUY05MM0JIRW1sWlNSQjlSUEd4TEhlc1VwZHlvVXBK?=
 =?utf-8?B?WkJabnYyZ0JaRzVtVkVYVG0wL04vQnFBRFg3K3I3Y1E5VmpVRCtUMUVqNmlr?=
 =?utf-8?B?dit1VEh3M2ErMjUyeGorVWVrN3hWeDRwMEJKdS9HaHF0SldlTi96eDBMSEVI?=
 =?utf-8?B?RTVwV3VLeUl4bHVzd21qcGd0OWhwSjA1VkE3a25vNTVGY0FTMmdyWXVhZUlR?=
 =?utf-8?Q?/k8PpexbKWMWg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ky9RQmJXdFZ2ZEJIV3QvdVNJWE1INkFFQTJoTEUrQlNiLy9HamIybUdDZ0V2?=
 =?utf-8?B?d2Z4WFFZbFNBd1R6ZkZWZUpGaHdhTDIwY1VyVGNYZmF3WEFGWndhd2U4RkZs?=
 =?utf-8?B?a2NGMExPY2d1SzEzMlFKWHU5V2J2ZGRSbUgvMytxclphcEtCVkR3MTBkSkZt?=
 =?utf-8?B?TDlqVVQzNWFCT3hETGxMQzl3TEdibDB5Vk9FbmNKMGxoSEJ1NlZscGl4WUov?=
 =?utf-8?B?S1Q2NzAxc2poTFo1YW1yZGZMbjFXS2RBbDVHUEt3ZW41TlYyV0xuVDQ4WnBz?=
 =?utf-8?B?MG9LckN0dmRMZndoV1VXcXpxei9FaGNtMWRtS2Fvb1NPSjdhV3dQUnl6T2k2?=
 =?utf-8?B?Y3R0N3NheG5XUHMrM2llOGlac055WU9INjVhMHVkVHlxaE8ycFpRU3J5bjJS?=
 =?utf-8?B?K0dsaEc1bGFBVkdXbUNTT1oxYXpmVUtINnh4dFc0MVZXWTRHZVJCTFU5WVNh?=
 =?utf-8?B?WnB2RUhtNmNBMTRjZjc2ZjlJYUkvRnVjOGh5NTNFNzY0S3dqc3Z6V1FJZytr?=
 =?utf-8?B?Y2ZSMHpyWkI0Sm0vV2FCQmcrYUFyWmtuTVhGd2lkTWFnNE5QM1l4eCtQZDht?=
 =?utf-8?B?UUpnd1FQN3dUUnpJWWlqSm9vV3RpRE5wNzY4SWwxcWpiZ0VCTzA3b0VPQmtN?=
 =?utf-8?B?RkMxR1AvZEJDWnZoY1poRnlTazRocWFKR0JITGN6U0JVcEZDZkpvaUpCaXUz?=
 =?utf-8?B?VHFsako3TStoNXJOSkxzYnkvemE5dVVvYUJiSUJrbHZsMk93U2pySmhpOVdE?=
 =?utf-8?B?MVZ3RDJoU2ZiM1BaUkNqWGNGcm5WK1lsRjBWdkNYTHFyV2YyVEhFeVhuZEhC?=
 =?utf-8?B?R2RUNWpFaHhHb25KRDJCQ05pZ2dheUdZMGo1VXBWQkl5N1o5T01WSE5QSC9r?=
 =?utf-8?B?ZlBVditQaURadUdpRmc2WHhzTk5TL090SGIySTFFRWxZKzEvREZ0c2JkUU5p?=
 =?utf-8?B?bk5oLytzcXQwaGVwZFRkeXBQNGxqRWlWTEc3UXpicmZtSzMxTmtLZ2k3ZXNs?=
 =?utf-8?B?Ny9FRHNNRUhBUS9Rb3F6SU5HRFhPSkJCVVJ3QXU0MElrTi8ydHFLNlYxVzJi?=
 =?utf-8?B?ZkdCbmdCdUtCays2akViMEdGVlEyOW1NL2lseHIxVjRTRjdTYVhxV3F0T2tO?=
 =?utf-8?B?Vmt2N3VBbWJLcUFJZzNXdlljZUR4bVlObHJHYjVxMDZGUU9kSWE2SGZnQm9F?=
 =?utf-8?B?Z05XQmZxTzRpRjRiTy9oMnN2L0l4UzlnaTVZeGp2aWJJWlBaaWRCU1FtMHoy?=
 =?utf-8?B?RFQxRVNhNTFXalRWR0xlRkpvMHVmNHhPZStxaEYzTmZxUXBycTcybHhLVUVy?=
 =?utf-8?B?UzdiVnZxNThzSXRSc2QyVm9vTTFmaHVjWjNPOFNpTk1oUktiNWdZQVdZdGk0?=
 =?utf-8?B?clNZOHBzcGZ3dXFmOHZnS0M4RGVCbS9GVTdNTnFBL0hjUEFLVS9VWFdqZlJW?=
 =?utf-8?B?ZlZDRHI1TXNkVDUxUDdQbFcxUHcvbGswVkU3Ync2SVJ2MUc2dGI0T0txSkg2?=
 =?utf-8?B?TnVoeUZ4K3ZmM2tzb3pVYk1DQVZEMnZSWFNlR1d1WU1Eb2dBV0x3VWgzMUdS?=
 =?utf-8?B?VjJkZU5md2o1ZUxCUGtMQTNCcEI5bjZ2dDIrUmtGMGlqVmJ1MXpYQ05tWTZn?=
 =?utf-8?B?WUQrK2ROalk0di9hM29UUVAzdmJIQmVhVTFlZ05MdWlGcXFUSE93RE9XN05V?=
 =?utf-8?B?ZEpDWTNCVjJkR1pzZEwyS2FxR2JXWkY4c1VRYzI2d2ZQMEJ5dkI0LzVMbXZs?=
 =?utf-8?B?N0xlUWd1dEl6MSt4VzhzWjB4bDVhZktVR3BObHloNmtFckZ6SllrVUV5SGtu?=
 =?utf-8?B?azVtOWVONXRuRkNMTHhaNmgwZ1VjNUhqRlVWUWsrdGtPZWJJTHNwZmhYcHlv?=
 =?utf-8?B?NktCSzIrajBUdFpsY0htUFdWdjUrdURRblBZTUtwL2Q3Q2dFeENqaDNLaWow?=
 =?utf-8?B?TmNJVkNTeURabmR4S1RPbWhyd2pkVmRpSldSVTE1WGRWOGJHa0FTUnkrWWJH?=
 =?utf-8?B?OGtQbTlTMUVQMkVQbjU2VzgrWjRxN0sxbFNnTWJscWQ2U25BVURzd3k5dVRu?=
 =?utf-8?B?Nkc3Y0MvKzlSQVlQUEsvYmdkQkFtQTAwODNkL3pZUGQvVnI5ZGNCTVViLzJ2?=
 =?utf-8?Q?8Rlc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e16d0476-c6e9-48db-7d5a-08dde9d262a3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 03:39:56.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHZpQ72rcZYX2FhQcsUBt5M9245iCprt8YmduFpYE3Te2FcB+yI0jtHmjb/OJ33J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632

Hi Laurent Pinchart, sorry for the confusion.

On 8/29/2025 12:58 AM, Laurent Pinchart wrote:
> On Thu, Aug 28, 2025 at 06:56:06PM +0200, Laurent Pinchart wrote:
>> Hi Bin Bu,
>>
>> Have you sent out the cover letter only ? I haven't received the rest of
>> the series, and it's not found on lore.kernel.org either.
> 
> I've just noticed you sent the rest later and separately, as
> https://lore.kernel.org/all/20250828100811.95722-1-Bin.Du@amd.com/.
> 

Before sending the formal ones, i did some internal test, after the 
cover letter, when i tried to send the rest, i encountered this error, 
4.4.2 Message submission rate for this client has exceeded the 
configured limit. So i had to wait for some time so i could send again.

>> On Thu, Aug 28, 2025 at 04:45:00PM +0800, Bin Du wrote:
>>> Hello,
>>>
>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>>> (https://ubuntu.com/certified/202411-36043)
>>> This patch series introduces the initial driver support for the AMD ISP4.
>>>
>>> Patch summary:
>>> - Powers up/off and initializes ISP HW
>>> - Configures and kicks off ISP FW
>>> - Interacts with APP using standard V4l2 interface by video node
>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>> - Support enum/set output image format and resolution
>>> - Support queueing buffer from app and dequeueing ISP filled buffer to App
>>> - It supports libcamera ver0.2 SimplePipeline
>>> - It is verified on qv4l2, cheese and qcam
>>> - It is verified together with following patches
>>> 	platform/x86: Add AMD ISP platform config (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>> 	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>> 	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>
>>> AMD ISP4 Key features:
>>> - Processes bayer raw data from the connected sensor and output them to different YUV formats
>>> - Downscale input image to different output image resolution
>>> - Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc
>>>
>>> ----------
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
>>> - Fix typo errors and other cosmetic issue.
>>>
>>>
>>> Changes v1 -> v2:
>>>
>>> - Fix media CI test errors and valid warnings
>>> - Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
>>> - In patch 5
>>> 	- do modification to use remote endpoint instead of local endpoint
>>> 	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint
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
>>>   Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>>>   Documentation/admin-guide/media/amdisp4.dot   |    8 +
>>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>   MAINTAINERS                                   |   25 +
>>>   drivers/media/platform/Kconfig                |    1 +
>>>   drivers/media/platform/Makefile               |    1 +
>>>   drivers/media/platform/amd/Kconfig            |    3 +
>>>   drivers/media/platform/amd/Makefile           |    3 +
>>>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>>   .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>>>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 +++++++++++++++++
>>>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>>   22 files changed, 4898 insertions(+)
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
> 

-- 
Regards,
Bin


