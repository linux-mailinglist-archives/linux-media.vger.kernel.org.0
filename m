Return-Path: <linux-media+bounces-42235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B07B51EB8
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 19:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6C0A00532
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 17:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6552472A8;
	Wed, 10 Sep 2025 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HSlKqznD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39423BCEF;
	Wed, 10 Sep 2025 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757524656; cv=fail; b=azZFF2cpthFtaJ0fCR9/7v/UhgoAOX4BPjpAMKqgbUWu5hAwLZy4mmssckAdOlHd1Fu1/LguHpuVlJCiYe59Eg/2NguysoaseU/bLMx2FmcO+c5szun5ron8VtbuAcOj9JSHwvlqZ9L/iezqyYcgQltKx3L3G1GWbTjrkirgCFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757524656; c=relaxed/simple;
	bh=RMNsSYGK1GyRfz33o9WXn1Mkl5BDEDJ6sNo9AR1asRM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WRH8aOQnJmI+fpFPS4M5/ULSJTAq+RVpxBmykDv3KbD+A7AjR6wqcT4teE3NSGdTYxD1R5SS6jV+3bXMBQMJFB/w6q3d5gH7Kd02WRSn+Q8b7ixZ2KFA6f3xwbOJ9xdFqwSMSHfO1v1JGm56eSLMVGUOw1DgCK7tLZHqvTZ/Tw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HSlKqznD; arc=fail smtp.client-ip=40.107.220.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azjttu5v/TiNRDXSkWX/dlAShOM3hzVIKAFR9Q5Y2KgauldGjSz3q08zJu+DWPu92Ty1G7pKyP7oKgKWkjztXgYoneMgi7zrgVln1kyA7SoIEYuk2GF+d04Bt0Ze9B8C3pRDHayOEi1kJylVyvZexzpfDTMDUpJFJt6cFBUh4SAyhVQZhzw+VZQDiqzokttdjTd4usr/XVU3EkAKJWajCcaSo/2Y0cJ/aC1xQUBxaCfwemVi4a7PXnVUdNkWLobBs25YzQMzBAzPbY9zAEk5IT/hUwNLFqfXSDgkKjZxA/6W+DaTvtQEUfH43Fi4J7735fj/YOQY+2daLuIaFPpjiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80z6HzS7moe9AcsjV5mDW+L7OTAmJiWeFiFH1Ir1H+M=;
 b=FNFo2JyeUdYZjKJs26fMck7iGlDAj92t7pN/60vLFbROgOi+WaRS2fhvFQ/u8oXp0NLLsOL7ji+3jLOlDKR3aHdcHt15m8LWq6NkYbnzGt0Qrxa+8aZbXkUNOYXwLxvo6PKdctaeXM7Z6j3vb7skfnHzBw+RKbAX3auN2QQqWkSdrUwNgT7z31wxGTXAsd/HUMYEsb4UstPtsobNYZtYFNoq+hiQr/o813I+R7y1Sm708evHjxNDwEX4TKWz6mbuIEEU3IuTPUDSfsl6wYsELnwApCdl9XO9P4U81VCOgEzws31EywaDUawkRF9Ast5S9cmAPUvs4e/gkRyNQtSICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80z6HzS7moe9AcsjV5mDW+L7OTAmJiWeFiFH1Ir1H+M=;
 b=HSlKqznDsaayMAOL80dknDfxLo8D/iMwmmdztiJhnBI4b+/H7OpcvQqxQB5/uo3v6VyXjk6l6TYNa+AKNIcLyWC+Apb+fvgkbXiFtPkN9Y1HTGxsxjbi7whGo2C0++zdh6Hf953RYVZ2JC8W7W0t27Y52+PUa2DTmEnzGsiEOVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7113.namprd12.prod.outlook.com (2603:10b6:510:1ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 10 Sep
 2025 17:17:29 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 17:17:29 +0000
Message-ID: <9ad2ec92-847c-4a3f-b734-ec055ab0e699@amd.com>
Date: Wed, 10 Sep 2025 12:17:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Bin Du <Bin.Du@amd.com>, mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250828100811.95722-1-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0106.namprd04.prod.outlook.com
 (2603:10b6:805:f2::47) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7113:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa85dc4-9970-4bf6-0ccf-08ddf08deb64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHJmcVFObXBWekZob09MMElvdTdSU2VQZ3VVb0w4NS9HZ0NyMCt1dWxxN0Vv?=
 =?utf-8?B?S2ZRUnlTeFhySDRhUnFpKy9Wb1VkSHpmQTIyYTVld0Z4aGdyeVRlbmxuOC9y?=
 =?utf-8?B?QnRRaVN1d3gyaFVob3Z5SytZOEg2TzRJV25hZ0dmUHp2c1dtQ0VPUlRtcmFB?=
 =?utf-8?B?OWpML3VyaWxlaGNEdmFTR2hmNE9JSDF1cURQL0pQaXZHVmhaWmNMK1lnbnJv?=
 =?utf-8?B?OERFRGFQTzBXVzJON2V4NzA1VnEvaWVHdWhRcU9EZjl3cW5VeUlYWTBMNVMw?=
 =?utf-8?B?MEtBNDZFdWNHSEx4T3F4VTFMbG9SQmJZSGpiRk85bW9pekpybVdFcFFhRE1Y?=
 =?utf-8?B?cXd0THlwOEwybkg0NlhvdmY3cUZSMjBsMUFLNWhqNmxVYjA3UFVqbjFJNmtZ?=
 =?utf-8?B?MWtES2VCaG9udk54ai9IeldlMlZJNGxVMGNTa3RSRCs4NHVCbklxelZCcVVZ?=
 =?utf-8?B?Y01pc0JoMXpqbmtxckcrOCszMEZaMFFDeXZiTDNaa1BmNnk0dnR2ZXgyeGpm?=
 =?utf-8?B?NkYzWWozUjFuYzl4b3lKd1JtVnMrTTQ0UUxhU3ZiODNhT0x5b1NkWDdRY083?=
 =?utf-8?B?Q01KbGtuR0cwVTVHR0pVUEFMc1AxZS9neGRsUlRtbllIZmY3VVhZKytaM0N2?=
 =?utf-8?B?MUU3ak1ldUlkZ3lCMnFKelBZTVRQSlE3bmkrM1NLWTRvZkZiSVpONDRkY3Zr?=
 =?utf-8?B?U3RpZ1VoeUQzWTBjQzVMN0dGWmRnNnNwb1ZEVGJNUXFscng2cHZHRWNJcFBN?=
 =?utf-8?B?L0VpL2RyUFVmYXVabVRTY3pjUk1VaUhSQnIwVlBlVG5DaXVnRmlqc0Q0aHVY?=
 =?utf-8?B?VXpvT2lRV2NodTE2azU1RCtjNnFyelN0MlJnMDFDeW5SVmQwdEplVkdBTm9u?=
 =?utf-8?B?a1lBVEZTMzBKQWZJRXVkMFB5bVBoWHZwUFpXUlcveHVCYmNXYmhpWldETmFQ?=
 =?utf-8?B?OVVHbUVFdDluU2ZRTnZXZkN1cGVkcUR0amF0QVVkZ3draldJanVEV0F0SHpi?=
 =?utf-8?B?Kzd4WEQ3WGVYSG1DUUhBbnpBdUlFcGtxL1ZmcS9tL1hnKzZvMjd3UTgzQWhB?=
 =?utf-8?B?WnY0UHQ1bThSSThOSmZFNXAveTc4Y2JxczdEcVpuSXNZenpQMUg2ZTY2MGJC?=
 =?utf-8?B?YkY0aU5TUkJuV0JFWTA1MlJVVWZHYXAxZEF6MldXbmErbDhkeVUrd2REOGsw?=
 =?utf-8?B?RTROS2E1N0Q1SlFUU1p4VDdTS1FVWlN3U2RzWVB1Q015RkthL2RMZWNOLzZK?=
 =?utf-8?B?UG9Rcyt2d3NwVkd4WHA0SDdyaHFxSi9mdkJOVHk3R3pZZzNkMkhZK3AyZ2gr?=
 =?utf-8?B?SkZrYnZsemVZZDBwckRHWjg0QmF3UlBkS2xiYXlqZFk1QzBrdnpXazhaVEdM?=
 =?utf-8?B?cDBkanFlbWMzZEd3VUFtNTRaTUZPOXF6MHRJenNTS2xwcEgxQnBmcGpvbEZI?=
 =?utf-8?B?QmNqaXJUY0g3bWFGQ1I4TGdIeVZQMWYxeVdhbXdDR2tld2JjNUtUU1RvSnJ3?=
 =?utf-8?B?SmgvR0FmM3VDaVYwZU9NdVhQclpuZ1ZZbjJWNWNsZmQrK2I1T2pUWmQwd2VE?=
 =?utf-8?B?TDhOYmFJVys3V0tjaVlManhDQTFtZVhCTnE3YUZJYzhjT0t0VHo2dVNJaFdO?=
 =?utf-8?B?K2ZyNWhTa0VtckdFdmpBUTVGNmtFVFBvRDYzVGsxd0ZLL0taYTRKQmp5U3Nn?=
 =?utf-8?B?UHJ0OC9zMHRBejlSNjViSVhrVnhxTUMwWkthR25vYi82WHB6K1BJbjFWOVFn?=
 =?utf-8?B?djJ6WFJJZnlIVmVDcGJtMTNiL25jV2Y2ZVloWkZ3RHBNSmdpQjcxVGFZUzZO?=
 =?utf-8?B?QkdoR1FtL25jeW1veVFLdDM5ZE1qUEZFUmVPaThPUHNkYjFTUUdNZFJDVGdz?=
 =?utf-8?B?RUh3MTFNTzYvcVZvV0I0NHNtb0dLWG1Pelhrei9KL25iOURiNThKNUROS1pI?=
 =?utf-8?B?RmNhTEJnc0Ntd0EyaE93Y1FxU09YL0FsMUJhTUJqWTlLdUlPakpxTHBDU1VH?=
 =?utf-8?B?SDFkbHF3MTBnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHVEWmhzOFN3dTRlVTRpcEwvcUJMQ3VBYUVrTUh5VnBmNk1maThPMEJETGVN?=
 =?utf-8?B?Yk1HMUMvaHdzVDMxQzNST3NVM29Vb1Voekg5c3ZJUlZDM3VqbGFGZFJ5VTQw?=
 =?utf-8?B?d1FKL2h4OUczenNvd2RIV3VtTkwrdnJhbnNGbldZZUg4OXkxM1ZjWTJNT3lC?=
 =?utf-8?B?aVc2SFoxaGRtcHZRNC9uMWM1Y3l5YVFKZU1oNk9DQ3J4aXRQcUNwcFFVMnJP?=
 =?utf-8?B?eXhlSFNUaXd6T3ZJTDFRdWd2c2ZRMWZGdGZXMVBoa2I1L05wTXR3cVp4VU5y?=
 =?utf-8?B?c0RtWmVNb0phUjkyYUhOajJCcnc4NGJYL1c5OGJWMXhlbC9jakVma3ZHbmxh?=
 =?utf-8?B?S0E4RlVaUG1vVjE0RlhQYko2YjNXMklnS21rUDFOd1Q0OE9pYVVDek5SNy9j?=
 =?utf-8?B?MzMrODZ5Rzczek9KNEM2OEVmdXg2VzFVazc1SldibnhhNVBOVkd3SHNwYTQv?=
 =?utf-8?B?VHhDaTZNeVNJSTFDbEJINFZhMjFDNzllbDI1TjUySlpIbG5aMTFHKzRMUVVN?=
 =?utf-8?B?bEdoc3pLRFo0V3QwWnpqa0tyS2JVMDZzbTZ3RFBnRktqajRTUXNXamg4STZN?=
 =?utf-8?B?ZUtwblBSYWgxbk1QV0RJdGJXaE11aVBKemgzNGZuZlQ2dVpWN2ZxWXpNYTZk?=
 =?utf-8?B?SnBpb25PSENkU0ZlNVRnRUExMUV5SUkyZnEwQjlJdDJuRmJoYWJNQ3Njb3lN?=
 =?utf-8?B?bGlSQUE5VlVGUDJXV1BRNXhtenhEbVJXZ3lraTdOYVNLUytyNzFZeDBCMmdx?=
 =?utf-8?B?Qy9pbDA0cWk0eFRwa1VHcGhqMUZVODFzRlpDOFUzVDhkaWlkVHRiWTdNVGxL?=
 =?utf-8?B?NVNZeWswWnkxTFJ0cVZOSlpOZWR4VUt5ZTlsTkdPTWgwMkI4RHdVcHNnK2E3?=
 =?utf-8?B?eVBzT0R0VVNLaXRHR2loVVAzSGdCckpqQXBOczR5OWxaM2RlcER2bUkwL2h2?=
 =?utf-8?B?WGNUQjdPb0JPVXB1VC9DNHoxS0ZtZEtLVm1xaHhhTzBLek9LNjVmUjJBYUx0?=
 =?utf-8?B?MUtjMDZWWFRVeGQzWDRITzB0aU1qUGt5aC8xTlUvWjQ1SXVMSlV4MFNXTXZ3?=
 =?utf-8?B?M1gyM2xuYUY0bk5YRUxzM2UvaDdFOE40eCtLSmdxdm5sci80aHJ3YmJwQlZm?=
 =?utf-8?B?LzdCQXdiRjZmanZoUDIvWGdqZmNlQ3IxdS82OWVLK29ZTzVSVTZLdC9pZUhM?=
 =?utf-8?B?dk9ET0Y1VFRRRkVSUHhJaDFrMHp6cTZ1L05NQUU1SEg2Q3hENEJVZlc2aGhx?=
 =?utf-8?B?eFJBMm9CQWdFcHpLRkVLZTUraUpkOEY3NXdlSEQyWi9SK053Z08rWEREZjRQ?=
 =?utf-8?B?TGZpaWtlN2tLeE9lMzNvdkgzRnZ2b2NxTzdPc3BWUTNSU2VNUjUyR29FWGNx?=
 =?utf-8?B?YjEySUJ3MzMyN1ZoY09RcWNoVkFVSkc1NytabTA2YVFuWkJYL29oSjA1UHlF?=
 =?utf-8?B?UjBMOXEybnRYMVA0a0lPY3NIc3hqWVJRY3F0YTN1MUFrZmxwY3VuNDlXZldK?=
 =?utf-8?B?RmFoK216MTZuNVRZOVBjdWFwZmkzNXN4dWVIOHFpTlZuWnIwMVpiWXRROWsy?=
 =?utf-8?B?WnIrWWRoMG5XZ3lPNlNTVkFtVnhxcTZsY2U0Yk5na1BWMy9Fa0RqUHc3cm5x?=
 =?utf-8?B?WGtIYzI3c2J5dUR3NkI3bm1DUUl3MW8wRmczU1IrejgvR2t0aGFMRkgvZ2Fy?=
 =?utf-8?B?enRkMS9Nd256cTVtTk5uNjdnWXpiMHNqQ1o3MFlvbUQ4UkRsMng4dDNEbm5i?=
 =?utf-8?B?QWlabWhodjd4dVpjVlRKWE9iM0xBaXR0dWwwdkVscWlQWDZWaG9ZbzdnNk8v?=
 =?utf-8?B?VUtKSElDR0RqcytHd0JBRzNHMThLK3VIOHMxNCs4NXVlSkpKVVJhT3FLU0xp?=
 =?utf-8?B?STJBZURUaVYvWktjSllrbkJQQmNOYU9rQ2dBcWpaZEdiRkZsc3JFeUZxNE1n?=
 =?utf-8?B?d1lDNHZUVVQvNG1rVTgzNS94dFNhTXliYW1yNlRJb2VqMmgrcUJORVFMWjZG?=
 =?utf-8?B?dU8yeWxTY2NDQ1VLT3VZUGM0QVdQN3JIZmFIZGtxTXBnSXdvOVVkaVRDUXZ3?=
 =?utf-8?B?V2VKaDVOcTRkM29TcXJsMC85ME5OT0VXUGx0dFVFbjdwYTc5blNTa2h2bjBQ?=
 =?utf-8?Q?u+SskEc8ar+MxkrBxDsl9L3ku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa85dc4-9970-4bf6-0ccf-08ddf08deb64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 17:17:29.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pp5xoFxiS68Q5ydySvmRJ4uvUpFg+vVzI2rtqJRB3p2MyUhBMcCdqYBPAehOSx/FT6MR9dHWbNHEG1eKWL+Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7113

On 8/28/25 5:08 AM, Bin Du wrote:
> AMD isp4 capture is a v4l2 media device which implements media controller
> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
> be connected to a remote CSI2 TX endpoint. It supports only one physical
> interface for now. Also add ISP4 driver related entry info into the
> MAINTAINERS file
> 
> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> ---
>   MAINTAINERS                              |  13 +++
>   drivers/media/platform/Kconfig           |   1 +
>   drivers/media/platform/Makefile          |   1 +
>   drivers/media/platform/amd/Kconfig       |   3 +
>   drivers/media/platform/amd/Makefile      |   3 +
>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>   9 files changed, 185 insertions(+)
>   create mode 100644 drivers/media/platform/amd/Kconfig
>   create mode 100644 drivers/media/platform/amd/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..3ad845f1511b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>   F:	drivers/iommu/amd/
>   F:	include/linux/amd-iommu.h
>   
> +AMD ISP4 DRIVER
> +M:	Bin Du <bin.du@amd.com>
> +M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +T:	git git://linuxtv.org/media.git
> +F:	drivers/media/platform/amd/Kconfig
> +F:	drivers/media/platform/amd/Makefile
> +F:	drivers/media/platform/amd/isp4/Kconfig
> +F:	drivers/media/platform/amd/isp4/Makefile
> +F:	drivers/media/platform/amd/isp4/isp4.c
> +F:	drivers/media/platform/amd/isp4/isp4.h
> +
>   AMD KFD
>   M:	Felix Kuehling <Felix.Kuehling@amd.com>
>   L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index 9287faafdce5..772c70665510 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -63,6 +63,7 @@ config VIDEO_MUX
>   
>   # Platform drivers - Please keep it alphabetically sorted
>   source "drivers/media/platform/allegro-dvt/Kconfig"
> +source "drivers/media/platform/amd/Kconfig"
>   source "drivers/media/platform/amlogic/Kconfig"
>   source "drivers/media/platform/amphion/Kconfig"
>   source "drivers/media/platform/aspeed/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
> index 6fd7db0541c7..b207bd8d8022 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -6,6 +6,7 @@
>   # Place here, alphabetically sorted by directory
>   # (e. g. LC_ALL=C sort Makefile)
>   obj-y += allegro-dvt/
> +obj-y += amd/
>   obj-y += amlogic/
>   obj-y += amphion/
>   obj-y += aspeed/
> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
> new file mode 100644
> index 000000000000..25af49f246b2
> --- /dev/null
> +++ b/drivers/media/platform/amd/Kconfig
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +source "drivers/media/platform/amd/isp4/Kconfig"
> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
> new file mode 100644
> index 000000000000..8bfc1955f22e
> --- /dev/null
> +++ b/drivers/media/platform/amd/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +obj-y += isp4/
> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
> new file mode 100644
> index 000000000000..0268060c2dae
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +
> +config AMD_ISP4
> +	tristate "AMD ISP4 and camera driver"
> +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
depends on DRM_AMD_ISP> +	select VIDEOBUF2_CORE
> +	select VIDEOBUF2_V4L2
> +	select VIDEOBUF2_MEMOPS
> +	help
> +	  This is support for AMD ISP4 and camera subsystem driver.
> +	  Say Y here to enable the ISP4 and camera device for video capture.
> +	  To compile this driver as a module, choose M here. The module will
> +	  be called amd_capture.
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> new file mode 100644
> index 000000000000..de0092dad26f
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
> +
> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> +amd_capture-objs := isp4.o
> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
> new file mode 100644
> index 000000000000..6ff3ded4310a
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.c
> @@ -0,0 +1,121 @@
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
> +	return IRQ_HANDLED;
> +}
> +
> +static int isp4_capture_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct isp4_device *isp_dev;
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
> +
> +	media_device_unregister(&isp_dev->mdev);
> +	v4l2_device_unregister(&isp_dev->v4l2_dev);
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
> index 000000000000..8535f662ab49
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4.h
> @@ -0,0 +1,24 @@
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
> +struct isp4_device {
> +	struct v4l2_device v4l2_dev;
> +	struct media_device mdev;
> +
> +	struct platform_device *pdev;
> +	struct notifier_block i2c_nb;
> +};
> +
> +#endif /* _ISP4_H_ */


