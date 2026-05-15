Return-Path: <linux-media+bounces-61658-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCE8Hfj7BmrtqQIAu9opvQ
	(envelope-from <linux-media+bounces-61658-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:56:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB754DDBD
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 12:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68F323007886
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 10:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176C046AF06;
	Fri, 15 May 2026 10:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y0pW//WF"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071B7309F1B;
	Fri, 15 May 2026 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842151; cv=fail; b=ZuwjRr3pi1Sk0jeOc96AqEiRwVfVRTV1X7ejjiGhHhPkjG6a2ZKB3iehKoNZFZPf1eQf+r62MW69501bWd/23uXgtzgEMuTQTX26IH/Z/mykJ/21+Gw0cOnPaC0hoMZUasHARywKo/pVQl27PpcgW81EBgNn8sIdM8XL5N/0XBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842151; c=relaxed/simple;
	bh=gI7XnAyJLiS2Z8d8QalnioCh3uGbBnYOJxp0L4jZCBA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d2ejltNcr4PqAxlieipVK1hPZ1CP124jGZe8OutKJ7nrkYh0WiAs6hsX5VmKnCDAe1KAUYdLf3YkR0wUiSKMWF9EQtdPuXRpByETmPDBgz1y42/sgBnLWveJZe7SyChfdD9SwnGDmyL3VwZ88KoSInw4PQ/4/RUVWdM6+/EyohE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y0pW//WF; arc=fail smtp.client-ip=52.101.52.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdMFIyygtU+PfnoEASCkdcco1P7pBuWNHu+pAHahnpqsZM61WucH/lF4nWviMGwNKaZ1CmQhD0k/pKEpPfFOFvI+Q777CBgX1GJzhGlq/zfOujJbKXXdDk/nkqhDFYH9APOHgGVQjhAmF53R1chBS1Rkrw0uSLDH4JX5mLDNm/M60WWPudDwHpKkybvV3AN7JHTEIQfzdWzIL7dNf8GNuUhUZsjmm2QPN7oDzdkS7rS3Uzt8fXN3hS8GFhX1eWgvKm+tyPMKiH48C72jp3/qIDARzBdM24hR2jK3VJXw+9VHD7sIk9Xo7pCB8d6KeQt2fPN8RErwsbMzlqgBdxhXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEglVTZc2/alh6qwQ1wOhsac7lORTjYKvgEWmhEgoVc=;
 b=fSmXPF6uq4hDF37NdHPybF7ehT9Jo3k8yhHjfiyu0TeSs9uwJKabtx2UQFeU7omBM/ZZmTnG6kNZQEUq8SK4CtAqKg45NG2yvAjCa2WZbygxJx09qSXN56T7siv2EMW8ZLPv0k+LnFandiy4NPnkEguAOndckrmzarDPYsQCvdpUQFb7VR8zz6t8Vo+LWPll8rWlaeMErlgCpyGkTzaeAm7PNm4neesxAd3p2BlFhNrvq+kzSLuQnGNgUJCNWCC9dPsKHKQi3LyOoKuzxeNLiTC3FKZT1TmXkmqzW+4GiPh/FNNofOXRsDrAaq4LaXuekSCwKcKRP8kKgAUQ6Y2LHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEglVTZc2/alh6qwQ1wOhsac7lORTjYKvgEWmhEgoVc=;
 b=y0pW//WFRc8BZk9QGnjtfwpFv2H1EcEb1ZHT1j0DuHNb0em2hrEBVoL/N3i6AXnxAmuqc9wyv8Qmh20l32wBodO0HU7mFRA5xVoa2XbjQ2NxVRoiyGDwPgpODP9rxYqaUKowzI64tIY6NHf+/9zi8qtRpCyBXvGtoYtSxtP6xOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by CH3PR12MB9342.namprd12.prod.outlook.com (2603:10b6:610:1cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 10:49:06 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%6]) with mapi id 15.21.0025.016; Fri, 15 May 2026
 10:49:06 +0000
Message-ID: <496b1a70-613a-4cca-8db0-a39f933ff1a3@amd.com>
Date: Fri, 15 May 2026 18:48:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: amd: add DRM_AMDGPU dependency
To: Arnd Bergmann <arnd@kernel.org>, Nirujogi Pratap
 <pratap.nirujogi@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, King.Li@amd.com, Benjamin.Chan@amd.com
References: <20260515091212.581789-1-arnd@kernel.org>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20260515091212.581789-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0027.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::14) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|CH3PR12MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 9731b724-9d1f-4adf-1f07-08deb26f95b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	Ua374OxxTB+AHCu+p2OdTDAUjokfA+lhj4cqTJgdcrbXFnpCPn/wlbWGPDbJTYfR2giClLS42xwAuCCbYSRCOiC02Az8B7l9Zjmha4kTzbqKZ3SfgZpVq5iciGxQHSznQqO5TWx0WkkQrwWDNLj19pN+zKssS7f0icM+MqJ+HHii8qQQKGu1IX5mRsxCeS5uZf4YxlXTwMcl2uHimQKPcnqVE+s/Q6AptuedCQ2BOQJ7oDdpgfS0rHEz7dr2pMgmzx+vp/vRd2I+4+3WLRuo0H2bHXDkCxpz+H77gQwR1F9hTxjOqq7UxFWhblQzLT8AiNONK+4VKvUXWhSLmqo7+7ZW7absdkDCHaVuFMs96boXwtKJEdPVlsV8uRYVXtFPxJxxYyXrb2obAMGSm05g6xKGwMX5VxnJtqBHdlbat1YSYwphQEWUL1iYaQzBsxCspwZhIsSq3Ms0A04rabUFheW2QI0vhFYKHB5WogU729JCSlzeG8J3gOgry+/Isl2EIYZz7DjiQEm/NZtgaTEj76fIv4QgGVgsKtEWgPMDlXLMgzO2QgSPiYciBminB10B4XkEm1s0vVnXM+rIjb6k9OP3WQbXnXaejf1PT6cRzZNHiJvo9Jg7YnyJeAV9clMyxboWiUclymvl+yWZO4znCl218EURnul5E4cxf0xEaYueTPLqCCWskhJKaBt5kjnX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVlyTW9Wa1R1NkFaRm16V0Zab3B0RWFpcE9zMzU1bkk0ZDlzWGZJaGtzWG83?=
 =?utf-8?B?Rksva2ZiT1kvWnZSQ1h6MVZjbGVJVGZpQlgzN3pQQ2p6dUQ5a0FIQUx2bEUy?=
 =?utf-8?B?dm5iTm1GZGUralNlQ2QzZ1paL3k3Z0RYWUZ6RFNRVWc4QlRiL1oyNGhMR3Iy?=
 =?utf-8?B?aTFLeDhRMzFlTG54SjNZY2QyY2J3UVRSbnN0d2dwdzVvNnVSV0JNOXVGVXpx?=
 =?utf-8?B?WHFMQk9yRDhHTVE1WDltbUxWYW56Yk1UbmQ0aXlGZlV0anI2YzgzdmdVb0Vj?=
 =?utf-8?B?UmVzdTZjSHBGTjZTd05UZjRPRUxBaDg1U3ZrUEp2WUJWTUMxZm5TdVJNZTNY?=
 =?utf-8?B?bXVobW43UzBQa2U2MGRWd1l0bm5nSzgxbXBOTVk5NDVZQU1MNW43OUxnSjhO?=
 =?utf-8?B?bTluL2E0akg3MXZ5dXBSWjJ3U1JaOU5ZWmhESm1obzlGbHZCbkNIV255cTJE?=
 =?utf-8?B?OU1BUVRBam44eUYzTHJIM1VqOTU2WVdXVWFLcUxUbFFVUTl2R1ZvZXdGaFBx?=
 =?utf-8?B?M1ZLWEFqZno0NzR2YXNKRkdsVklncE4vZnBUYk5nZnFJb0ZNNUZMZ0t2ekZp?=
 =?utf-8?B?Z0krakNuQ3RianB0NWxtUmdkd29zS1JmRjhTbUpjdm1kRnoxOE9FVTJRNGxn?=
 =?utf-8?B?SDRibklFUlZKZnBhZ2RMOXhRb0g2ZnpoVm9wcHczNHJqQys5STc1STVIK3Aw?=
 =?utf-8?B?TDdpci9kSzBETE8vZjVxZDhKRzhrV3V2bDdyTkVWMjRCdGROL0NLVnpkcVYx?=
 =?utf-8?B?QjRKK0ZiOEQvRzNHQ2RtZjEzUXFiTEpkNTJJSEZtbE51bWhxYTF3UHJnTHly?=
 =?utf-8?B?UUZoeE9NZEtNUEZSMUpTTmJteUZmQVA0d1hkRjFCWEdHQlB2VjcwbUViOEtu?=
 =?utf-8?B?RE9iVVl3SXR6bmlmWW8vKzNaQjZGUUNZRi8ycUpqalNEVWFCVkJtUDdITUhi?=
 =?utf-8?B?ZmN2anhxVjlXbWZ0cTFMUUZtbnRPU0wvQmxwSVBmTEtnYkZ0S1gwMVZ3VkhM?=
 =?utf-8?B?eG5KWk5iNkV5ZWV5YXJRRnlSYzZjRGpaVVlyQTNEdUlVTjR6UDFhREt3MmZz?=
 =?utf-8?B?enFOWkIxV3k4RzdGbFRNM3N4ZGMwL3hIdVE3c1crZ1RuRWovakZaUmJVd09v?=
 =?utf-8?B?VVFYSGswbE9mYW1tWFpyczFWOHRkcE42TlFwWk90bXF2ZW9sTlo5QnRNN3c5?=
 =?utf-8?B?YWhpelNEdU1PaWN2WkhtcXlJQmExanFXMXprTHZZd2I3cHAwdnRQRG1HVWtz?=
 =?utf-8?B?dFY0UHlGb0FyTVRlY1lwM1VPL3BPWmhJQlIyL2pUUi9HdlpvTnBJQUVmSHgz?=
 =?utf-8?B?ZjMwWTRXU0ZWeXhTOXord2QxbTFBVXMrRkpPbE1GUGVzY3pxUUdWZjZWckMr?=
 =?utf-8?B?VEZLK1VVMnhDVXBOR3k0NHROR2RNWHh4V2ZDZHhHSW1vdFFDQzdHM2xLbitn?=
 =?utf-8?B?SkRGVUJ2TnNLa2VKbk5ieG00MHl6OWdtbkZKZ3RodUdPTE11SU1aMFRVMGR5?=
 =?utf-8?B?L1Z1em9QYnJDVHNUUkx1ZGpwSDhnTWpnY2tucWIxK1VWd1F2ODAyRkpLV0tR?=
 =?utf-8?B?eWRnVklxMjhPaWovTEo1UTdPbHo3SFJROEEydHhPb244aGFEaUlkblFiRUVt?=
 =?utf-8?B?M3NGcENjWEV3THhvMkl1MDZLdkF0cFo2UUZxUnRBencxQkRxNHRKTUZhUkdv?=
 =?utf-8?B?N29QQ3BKUHE3Rko1YlJsVW9uYlJ5VGNsRjZ5QXQ5M3dmdThzVzhhTUtXTDl3?=
 =?utf-8?B?ckRjTlN5WDlCYWQvSVpPdFVSY2NYTWRlN0p0QXVvUHNKWVg1Mm9rVjBrUExB?=
 =?utf-8?B?OFpTQmNEcjQwaDdaZ3k3VEVXNGVFNFBCWk5sem9sbElNUDlCNlUxKzc0OHJO?=
 =?utf-8?B?ZG1yeExiMDl0OUhXdTZkWWJxSmNib0RKVnF0R3g1eDZWMjVZSDhvR2ZwRzZr?=
 =?utf-8?B?ZE1VaTBnd3ViVC9DUUJwdWRDajk2ZHlKcnloREJKVHpVcS9DMlZvSDgvdW9x?=
 =?utf-8?B?cUM1TGlYYWVReUpLRitlSHRicm9SOUVsWHBQU3dIUjdVbFhHV3NGenRiTzF1?=
 =?utf-8?B?azhPcGt4SDJ1bkw4QnFjeTlLYmNQUFpJc2tjM3M3a0pxU2c3LzdWNkszUjBi?=
 =?utf-8?B?YmlZQUZGL2FrK3VQUDl4cW1KL0ZiRW11R2doVUd0dFYyQUsrK1JheUxlWmlR?=
 =?utf-8?B?UnVuZGVnR0RJMkh6a041N3RyWGVmNm1YOUc0Y1p1RkYrbEc0WElwTDRDWlJH?=
 =?utf-8?B?OW1uNkVNYnVSQnBDcjFLS2FJM0lyN0gyUlFZaU96K3N2NE04N1ZSZTkvaENE?=
 =?utf-8?Q?IMAhgxuA0krOb1dhzj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9731b724-9d1f-4adf-1f07-08deb26f95b4
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:49:05.9699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqu2U2Dp8hHWQsH6lrqKQv7Qw/5N77p7bd5rPwYXQB2DHRcsTN6YvxVzydwbZwRa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9342
X-Rspamd-Queue-Id: 17CB754DDBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[bounces-61658-lists,linux-media=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Action: no action

Hi Arnd,

Thanks for the fix.

On 5/15/2026 5:12 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With DRM_AMDGPU=m and DRM_AMD_ISP=y, it is possible to configura
> VIDEO_AMD_ISP4_CAPTURE as built-in, but that fails to link:
> 
> aarch64-linux-ld: drivers/media/platform/amd/isp4/isp4_interface.o: in function `isp4if_gpu_mem_alloc.isra.0':
> isp4_interface.c:(.text+0x1d0): undefined reference to `isp_kernel_buffer_alloc'
> aarch64-linux-ld: drivers/media/platform/amd/isp4/isp4_interface.o: in function `isp4if_dealloc_fw_gpumem':
> isp4_interface.c:(.text+0x26c): undefined reference to `isp_kernel_buffer_free'
> 

I verified this. Reproducing the link failure on the unpatched tree
also requires CONFIG_MEDIA_SUPPORT=y and CONFIG_VIDEO_DEV=y; otherwise
Kconfig downgrades CONFIG_VIDEO_AMD_ISP4_CAPTURE to m.

> Add a dependency on the tristate DRM_AMDGPU symbol in addition to
> the boolean DRM_AMD_ISP=y, so this can only be built-in if
> the ISP driver is also linked into the kernel itself.
> 
> Fixes: 9a54c285630c ("media: platform: amd: Introduce amd isp4 capture driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/amd/isp4/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
> index 55dd2dc453a2..9d1927af1cb8 100644
> --- a/drivers/media/platform/amd/isp4/Kconfig
> +++ b/drivers/media/platform/amd/isp4/Kconfig
> @@ -2,7 +2,9 @@
>  
>  config VIDEO_AMD_ISP4_CAPTURE
>  	tristate "AMD ISP4 and camera driver"
> -	depends on DRM_AMD_ISP && VIDEO_DEV && HAS_DMA
> +	depends on DRM_AMDGPU && DRM_AMD_ISP
> +	depends on HAS_DMA
> +	depends on VIDEO_DEV
>  	select VIDEOBUF2_CORE
>  	select VIDEOBUF2_MEMOPS
>  	select VIDEOBUF2_V4L2

With this patch applied, olddefconfig correctly changes
CONFIG_VIDEO_AMD_ISP4_CAPTURE to m when CONFIG_DRM_AMDGPU=m, avoiding
the link failure.

Reviewed-by: Bin Du <Bin.Du@amd.com>
Tested-by: Bin Du <Bin.Du@amd.com>


