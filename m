Return-Path: <linux-media+bounces-51104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B66BD3C457
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A808A668F4C
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 09:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1FD3D6696;
	Tue, 20 Jan 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I2AGfngB"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C93D6671;
	Tue, 20 Jan 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900976; cv=fail; b=rdZDaPqXgclgrgL34OTtbMUXusfOFzcdTlUixOBleqHlH2bE+4IdfOJGbW4heG1f6X1F9KcU4kB2DrbS2kG95dd8uKBkSfo/tjgnUpXRpAn5H7U/ZpRgxF5nAuzdh4zLSG5of3/HDIarxq9Nc0MlJsdljhh0jK2Y51fhR37rrbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900976; c=relaxed/simple;
	bh=XFtZWWK1lObl1Kb3xSz1in38qwEvWA+MnwTKZS2QojQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RnWiAfP5mfh79gT7w9wsnsHzKtZ/HdoxJkG10auFaAXvXnLqgSO6pL/+7GGLg4xSKtPIrXfBsgTqSq5zaP4HFItMhpLHrY+jXXEd6jjj27/pY1SUC7ubFNiZG0JlMueEkctQ/FXU1scHFvs4MyMGdFJPXNdKqNCLMcKITU2te/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I2AGfngB; arc=fail smtp.client-ip=40.107.209.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue28w4StEivIyRb6OqTkZ/6ZhHNSTlvAf6Y7x9POtcOO3ah7UnlpbFgkK8MECYgL9lMmtrDI0T5XbEDJrAm8FGlQvilbYXvr8qjRAPFix9h/mIDtVL7ZVFeYr5LRdbsoVgc1Ck5MvJla7Cowp2VnLl9xx634QFPfEr5CG6b7c8u+jIKHJ+75eE7MTu+xbkOFMIBdpvakCDV3IKGPOCAHpY0Oj3d1NcQknlEDI4qg1Q4IWz6dVd+L4zBcZgvpO4UkkV9cK8Fm2b2wITWI6QGyZGJIuqhq1DKMdM6jEd5lYOBB2LbfrbF1ADErHVEaEw40JtPqgH+ME0Dj+7hUqiaxnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIldFF4jnP2BRciLYUdwmDirYqqjFo1qS+aClLuqoak=;
 b=NFzJ8msaEQRDfoUJV4UATRuMAgU0AVPvaCmcbbWB/bIfR7lUq6t1j3+DSOIH3taQdCqO/0zFGg27lU6NDE8JasT9WJwHnplZamepQGfe0dVLluJ3NSrMWe3HDptDCILLasgtOdC5gI7Yh3phaUOtXNQcKyeeJh6mBQr0qlh7aKwPSjPX0zlVw/W+qhcVKCjwPkvJil+0XvuovrXBnXyMgnnyWwsjkreE0MgZhG5wX20UPESrSSEVV8GFKj39lAVTfZmyKD25BQN8mJOpnRxd1pIHFejZSvoyMt+zxc8Ch+/o+URpeC5Q5TLw3rh1zQLB3zFT+m3FwXGZOCOzM+N1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIldFF4jnP2BRciLYUdwmDirYqqjFo1qS+aClLuqoak=;
 b=I2AGfngBaPqiL5mxxh1fJ2GdR1QqJZclH+GicQV83bKwS+ZrUF1vF46M1Zyhtjx/TxkFWt3otwBQTc6AQZkbXoWTeQve9DeKskHF4jTGvPqOv0UM/pxUK2vXUjHyBQy6St33kF7TmHDRXfvKjmhYbaLzOsrr5Kaii2wVYElXsAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH8PR12MB9789.namprd12.prod.outlook.com (2603:10b6:610:260::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 09:22:52 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 09:22:52 +0000
Message-ID: <b95118d9-7186-4ec8-8760-ecf6345ce875@amd.com>
Date: Tue, 20 Jan 2026 17:22:41 +0800
User-Agent: Mozilla Thunderbird
From: "Du, Bin" <bin.du@amd.com>
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
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
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
 <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
Content-Language: en-US
In-Reply-To: <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH8PR12MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c776a3f-af57-4d77-6f83-08de58057c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2V3UktDL0Q2OFpwajRiN3ZzTUN4OUVzdHFYeHNEVUhPbU9sOUYvQ3MzNVh2?=
 =?utf-8?B?dFpzc3pWeFA0dzRoTmxFY3c4Q0ZEOWZHRkpSMWVkby9QZHNkVzYyUzBLTE4v?=
 =?utf-8?B?Y3hacjJuYkx6b2ZERUR0UWFhSzZMYjBiUVBOM3A0SytTK3dNbHhuUWNBZUd0?=
 =?utf-8?B?elg0SEZvZ2JOTS82WHNMZGFBMk9WSlhFUHgwZURRNHVmSUxzRzQxVVRpTm9W?=
 =?utf-8?B?NnJJRjJueWVMT0I1SmZBaHJyMFlCNDBNbnF0L29VVTFVWjU4Zm91SkdhdGJL?=
 =?utf-8?B?UDVwNUVlZGNNTFBqT2U1MGc5R0s2TndLQTNhV2ltQ2FZNFgyMW1USDk4UW5D?=
 =?utf-8?B?d0txekxQTmNaYmRnOHRpSG12UVpudDVjVWlYL29tQThWd3VpYU0zOE0wdHIz?=
 =?utf-8?B?Zmh4TUxPbkVlV2JGM0M4QUtWM1lCeXg1M01wbUtIaVJTNEJuSnhuTmEzSGRa?=
 =?utf-8?B?Ni9YME45cW1lYnhKUXJFMzNhK1oxRHpLK2hKQ05QaDlaUkMxUFo2akZ3eGtr?=
 =?utf-8?B?NVB0ZTNWUmdYMzlRSjY0UmxWNVZxNkk4S0o2b0FkWGg3eGdNRHJRR0w4NFRF?=
 =?utf-8?B?UmYvZjE2NmlvSlhVajNqNlQ5NXkrek4yRklPdmFxQVhOZTVxbTlFaDBlMkRP?=
 =?utf-8?B?QnYzVUZ1a2NWeHp2SENWQVZKWTQ3aytVeUE2OTZrSkxnbFh2c0FtZWhGUXBv?=
 =?utf-8?B?ODFZVXM0THJtNmNZRWZEODNWY1k5cURHakdNRXVSNUJZM3BhbTgrMldxckkv?=
 =?utf-8?B?QXowYS9BbUdzdEMzUWVjQzVHdkhjVks5MVB4SGlrazdwaGlxMWZRWkg2RGow?=
 =?utf-8?B?ZTV2YW41VWI5b0g3RnE1Y1pSSmNheTBKZzhsSlozRFJFbTZTUlRkUituajAw?=
 =?utf-8?B?ditrQW96dXFOWXl2dWR1dStmaVVMYlVsSkVmR1dQc29IZ1ZUVkV3M2xoWmVG?=
 =?utf-8?B?Tm1Vak1rRXpnSE1rb1k2bHUxa0dUeVJZeDVFTEJBVTcwZjBkZkdtdGJuelNz?=
 =?utf-8?B?UEY3Sy9MajNoY3QyVTl6Sm1NSFovZS9LYWxYVWwrMS9RZFQ2eFFyZzZzS2Ew?=
 =?utf-8?B?VDJ5OWdqcWNzRFJRMC92NUdqZHBEWXVXQWp1dzFNbzduUmFGcVNWdGw5cWxJ?=
 =?utf-8?B?NTQwVmlSaDVHcUJnVUdkdjNES1d0YUp3bi84Q1RXRGdiQUNtR3o2aGdRRXJT?=
 =?utf-8?B?QnJnNEtBT2x3LzAvMG1mRmpRSlFVNGRzUDA4aWxZd0xGYmR2bWJucU5idWZq?=
 =?utf-8?B?RHdiaFBoNlhOV2xpYzVCaUx5Qk9zMUxxMUdHK1NkUmFNVVlVenZiMFp1RUZV?=
 =?utf-8?B?TSt6cm8ySFVoTFdEY2E0aGlUTWZtUzE3L29Mak1VVklabmJrTE9aY0E1NWxY?=
 =?utf-8?B?YkgzTDJtb0RoK2kvQUJyK1V6R0dyOExkTTBoRXN1enlWSnVEMGxGR0RoZW9z?=
 =?utf-8?B?VFBsNmhueGlkLy8wdUlJV1hXVlZJZ2Zwb3JMWHhYV2YvTDh0V0d2L0ErYXpM?=
 =?utf-8?B?RzhDcE5xZ1ZXTUpJSjg4akFDSkFycUl5MnZBUGVJTStKWEJVTFhtL3JFckVi?=
 =?utf-8?B?NzBKSWg3eXYwcmYrcHlRSVBmaHl2Z1BUaTNQQ3BqeXBZNW00ZWtnQnh6NFp4?=
 =?utf-8?B?UnBFclVsU3Y5d25vU1gwS1V5Y2oyZmpNcmk3OU04SHVNOGtZU2ZmUjlRaklT?=
 =?utf-8?B?d2NQRUZ5Z0VHVnVFWFJleFdtNlVWdDZLRDJra2hVajAvVlVCTTY4YldldG5Y?=
 =?utf-8?B?UmdpMXNSc0I1ZmkzZ2ZJK3RENDRkMkg3eE11OG56WVNlWk9uWmZJSWxMYVZH?=
 =?utf-8?B?eUEvbzZhV1haekhHeEVNRzIwdGJrREV2M2hobFFVVGVoTktpRUw5a0FTTHBZ?=
 =?utf-8?B?bkxGTjZOMm5xanFVaUpOZDlVUGdRVjZVdmpuV1ljZktVZ1EwT2RiYjlqdFdp?=
 =?utf-8?B?czg3ZWFmcmdmUnAxdVQwdG1HVXcxaXh5RHVJWjZLMVdnTVBnaW16OVE1TG8r?=
 =?utf-8?B?VGpsWGNPSncrbmc2eGZhV0ZmZUk2YUZqM3ArN3R5SzRaTVZTRUkxTisxWTJ2?=
 =?utf-8?B?T0NMV2MxdFh3WDNJcmZaZzJvTXRDYndSNEpnaEhvbEVXc3poRHJMSmZEMnp5?=
 =?utf-8?Q?EjhQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjdiWUdZdTRZVEdBdHU0ZjdVZk1jLytuejgxa3N5aVpKSk1CcUZETWFJTWYy?=
 =?utf-8?B?SzJDVGJmQU5Wb1hFSUdMcmZmSHhOWW5DVFNzbXNCam93TzZjQlRXOTRzd0hx?=
 =?utf-8?B?RlpkeVRmdkJuYURxd1NOMWJvOC9CcG9XM1hwNFBWTktwa1NYTWVpenQyUVJG?=
 =?utf-8?B?Zis3UVJQMDNhU210MWkxSTgxVG5VcWFRRWNyV0ZLL2p3ak96Y0hlckhNRVor?=
 =?utf-8?B?VzZaL1ZlckhSbkNLZU13QTZEaVUrMzRTeVQ2elR5NWdGTjBEMCtNS281aUt0?=
 =?utf-8?B?dU53MjhPbzFtVVoyR3NobG45bW0ybGx3T29GTUxmc3ZwQjZ5ZGdJMUh5SUJI?=
 =?utf-8?B?QTRSRlJobEl3Y0l1M3diVFFqOUJGNnJzU1pKSXg4b1BRWTlWNVRQaTI0dmxY?=
 =?utf-8?B?b0U5MjNjSVpnUVc4MzNmV1ZlVTVTR3BxaE50MjJHWUc4THNHRkJXNWJGRGMr?=
 =?utf-8?B?eldVd3pNeUtYeEI5ZXQ4b290aXFQRTdMb2I0bE1rNVQzeEV5eE1DTmNLM0V3?=
 =?utf-8?B?RGlrN0JSTDdxRW9ScjNBckJMN3JYTVhFaU5TTXNaUUh2RHpXTGdDejV2M1lj?=
 =?utf-8?B?TTNZWHI2Y1JqZ09lT0FHQWg3NzBadEE0OWROU3A4Q3JneVBjSEd2SkdLdGM3?=
 =?utf-8?B?ZHJ2eTE3QjEyeDJUd3EwRHdsMFNDVzB2aHhXL2h6RWR1T3dZaXY4YVY2dVVN?=
 =?utf-8?B?TmtOY1g0a3NQOURjM2p2R0V3UnBxTHNrTU5kYWNEQUthekNaSytxZUp6NGt5?=
 =?utf-8?B?MXlyWjJsN0FLV1pXYVh5L3Bad0tvL0t4WXJjbnlFQnhnNFJzZ0FsVFk4OEJ3?=
 =?utf-8?B?clkyYm9UTThrR3IvUk12MmFYWnM5ZzJzS2s1amFzSzJJV0Jsb1A3Y0MzcGdU?=
 =?utf-8?B?bVJMYTM5NmRZVnpzZy9wVW1LYUxFci9jcmRuUmZKMGRHb0lkcVhrSlluTSt1?=
 =?utf-8?B?T1BNWUF6MXJ3aVk0bVBLUVhQT0FZc3hsMjZiWGVLVVBkY1ZGdlZOYXQ0d21E?=
 =?utf-8?B?QksyY3JXcXhQUTlCNURHVHVabktxZjNGdi9UNFhUdkE5Lzc4Vi9yV21ldnhJ?=
 =?utf-8?B?SkcvU2dZNERaLzBDajJqUVJtbGhpdUdMQnhydWZ3aSt2VE1PdWNGVFRDSmdl?=
 =?utf-8?B?ZHVBa0VsQ0MvYThGQldUdGQ0RGxRMDZjdUU4bHVQUVlvdEg2OUlONStiTHcr?=
 =?utf-8?B?dzVoUTRzZ3kwOVlzbS9JcW5kelRYVHR3Uk1LRG8ySFdOVDJWOVhnYUNvU1hI?=
 =?utf-8?B?YnVsK1RPRUQ0eEozaFpWTWxYd3hQMjh2ZVo1aFo0c2R0bDc2M25DOE44bjJt?=
 =?utf-8?B?dmRyQzdIRGhVSi9IeDR3N3dzcHBZVUc4YnRHTGRaaldCbmFvbE9YeHAvei93?=
 =?utf-8?B?U01RUWkyRS9xVS9ybUlXay9hUXBhVXdEbkpndjZrcjZUYkxmVWVKT1ZlYTda?=
 =?utf-8?B?dXVoenczcWQrUGE5bTFqeW5NUVVIeitBSmw0Tllnb0wranRXSFlyeURjU3hW?=
 =?utf-8?B?U0ZLa2dJRmxTZFRIc2lUWWVFYmdURE5jdkxKcDdxUENudk0yczY1RlAxL0l4?=
 =?utf-8?B?cStCSkl2WjY5RVQ1SVprKzlrVUI4dDFaUFNOcTRGby9jNDJRZ3NYcUw4bEFh?=
 =?utf-8?B?M0FhR2JUckNEeE1kd2E0M0cwV0dlN3FndW14SDhhZThPOWkybG5scENac2Ju?=
 =?utf-8?B?dDlPS2hrb0c4MHRseGp5MXlERGQrZ3JxUW9lUUVhN3lBbU9ONHdPbW9xQ2hp?=
 =?utf-8?B?T2NpVjlkczEyZ1M5Z21LMVJuRk15OFg3WnpXZnVIRjBRN1FZNXZvam8zb3NG?=
 =?utf-8?B?cFdGY2VTRnBJMEVvZXFXVjI0NVhLRFMvL0FQWlFVdVR1K216dDNTZWQ0eGs2?=
 =?utf-8?B?NzN3Wjg1N0J1NEZ5NFVLNEd0dXZCQ0FFdW84TnZ1QzhnSE1kRHU1VnZzOVox?=
 =?utf-8?B?d3NabjJIYUZ0RWQxM1hicDkxQ2xOUGRPaE1YSGxLMXNzWEhWNnVwYm1tSzZF?=
 =?utf-8?B?a1N0QW12bnVFRFVGVnJhMk8rbFpXNW9zbXVNU0RhZlBOdW9wQVdxR1V4QURL?=
 =?utf-8?B?YTZjTjZDZ0dKYkN4OC96elI0MlZNbm11ajd5NmtqOG1KMG1DNVUxOVJ1SCt6?=
 =?utf-8?B?d1JQYkFjUGlhRVpja0VUb1VsUlc0RGo3a2p6czhCcFNqaUVlZFQ0eXhqTlVO?=
 =?utf-8?B?TTZqSVFkRkxLaVZMblBYN0xYOGNTdEJFSThrdmNZY2pHTm0rdmtWYUlscnRz?=
 =?utf-8?B?TVEvcXY3cHBaTG55SHozcjg4OVVHNGJYR0dEYk9Ib2swb2ZianV5TzJsbExl?=
 =?utf-8?Q?MIaD0P+JpJ7qTEKZcn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c776a3f-af57-4d77-6f83-08de58057c55
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 09:22:52.0623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoXkWT38zR8oi2I6YGOJSy1nLdqICnKMHyOJqeopGjqTodGyU1pO/gpDHlls3Meg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9789

Hi Sakari, there's still one left. Could you please help check it?

On 1/7/2026 4:44 PM, Du, Bin wrote:
> Thank you, Sakari for the feedback.
> 
> On 12/22/2025 5:37 PM, Sakari Ailus wrote:
>> Hi Bin,
>>
>> On Tue, Dec 16, 2025 at 05:13:22PM +0800, Bin Du wrote:

[snip]

>>> +enum isp4fw_buffer_source {
>>> +    /* The buffer is from the stream buffer queue */
>>> +    BUFFER_SOURCE_STREAM,
>>> +};
>>
>> Could you also use the ISP4 (or ISP4IF) prefix for these, please? Many 
>> look
>> rather generic.
>>
> 
> Thank you for highlighting this matter, since these definitions are 
> located in isp4_fw_cmd_resp.h, ISP4_FW may be a more appropriate prefix. 
> Just to confirm: are you suggesting that we should add this prefix to 
> all macros and enums? For example, changing CMD_ID_SET_STREAM_CONFIG to 
> ISP4_FW_CMD_ID_SET_STREAM_CONFIG, and BUFFER_SOURCE_STREAM to ISP4_FW 
> _BUFFER_SOURCE_STREAM? Our initial thought was that these would only be 
> used within ISP and shouldn't lead to any confusion.
> 

Hi Sakari, would you please help to confirm so we can decide if further 
modification is needed.

[snip]

-- 
Regards,
Bin


