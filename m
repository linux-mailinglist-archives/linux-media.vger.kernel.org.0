Return-Path: <linux-media+bounces-36614-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E8AF5EF9
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 18:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C081C42827
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 16:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1AE2E03E5;
	Wed,  2 Jul 2025 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zMVuOXDC"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2584BA2E;
	Wed,  2 Jul 2025 16:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474870; cv=fail; b=qTKoNhmYckSWSJ9Fasu/1ZbgsrOx+hl4v2e1C5yzOd8FgnLvj5kQxrTisMb+YBpRzCRPVHrJvhoIzuKhVw1wIvTYnT7b3EiAXj0tfCd0RvziDHR/gAqpX73PLk0myhSakqi9RCgYEFhoPkl0HupI2hBoD4RERH4EVa2Wdp/fdIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474870; c=relaxed/simple;
	bh=WCbTqMvI0j8jU4/UfZ49XryoP5aQmCWUdF1zng4OgAY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I0zycdOpzyyJpV+96Za2kefc1rodwWTyl87GxYg6uhvi1dp3hWYsRbqtVD5pHnypyD1cnYnx9fcBaIqtpZuZuwSHtgGJMUIISVnxsZAW9yGZegh2J76yciwMPQ/xpbg5k5B5Q8Jhs1THEa3M9UGKCEXvf81TqMrbnVBqyRl/7Jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zMVuOXDC; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8K/gD9ichirbNUcczEy3cokbo5YGZz3FCO1cvBvhrcr/75mSkX8sEnUDuvy5GPr8iSbJs49Tgl9SvH/BY2BQxsZruLyMYTXvMdBGecUEKYbgCYuxzGkDUtsmTLJ3plvABRHaXMycdY+iRbiyCMVilEjaqKN2GuYd+0FQaelVmT+GLPfc3VcuLDPFyUINfo0b/qTpB7jJ2vCN6QJtRdsPsfCi10h38JOVwUBRH9nD+xltGnl0h1s4fo8/X0+zhp8XZXV04b7mM4YqVLqPJGS+nQa/wPJOmRwPtO6GypPoqDC8Qpv6BedSJqN4loJeSd8u+XFUkSPtRnhU32SC8Lj0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=op3MRTpxUIOniCb1fhNOoBBVRl0tWyeGN/M8gCOwlk4=;
 b=HYRYk3bNBkCP7XXEAXcadi1+qoRw/Ccc/bdEWhyidmsglXjI2QrwsXgmJ+qZMLPI1M4Hrc0RjS59ei9lMnROkgRuAlWR3pUNPUEnI8EuAvcxl8FWlyiEDMWygi1uzm67MGlekYPi04I+axdLcs7v3Bg3NB8JtBRIPyVa1mss4m4JXjU+GzJCASLmkjqBe6c3uAi2u5v0GN9KZml2RZZscNiYct4zp2+LiTNjX4LbcR6EkXlxDuF6MQ+MfezjISkoNl0mQF8H2foysYORyi+H8ka3W/Zws5HouW3LcnkZIpWeD/VkgZuvyK9RPUX70KUts7Y5uRLMKb8XsrgNKO20BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=op3MRTpxUIOniCb1fhNOoBBVRl0tWyeGN/M8gCOwlk4=;
 b=zMVuOXDCvvyzdhdp2nrfg5br/T4iYfihcHZ6hZ1ZJwCy5fC98LV/5Yt4NblY2Uxe/BwaPiPoydGLfQKMpa9NQnr2irDIo7hhU1SLHB6htKdq6OemOph09NC1wfv4rh+wM9KiY+yVMoPA4vwCHwTpBpio7gOuKHsEzZUegsqCWxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 2 Jul
 2025 16:47:43 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 16:47:43 +0000
Message-ID: <91985c5e-fc69-4d12-b5b0-3dff0ba1b078@amd.com>
Date: Wed, 2 Jul 2025 12:47:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
 <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
 <aGTN5PbfyHTw529O@svinhufvud>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aGTN5PbfyHTw529O@svinhufvud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::30) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf2395e-7436-4d22-9cfe-08ddb9882a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0hvS0w4N3VCN0ZvQzduTjJteWRvRWhEbmdvOGp5VWZId09MWXZxQkxhTjhG?=
 =?utf-8?B?WmtCRFFKRFRoaTlZR0UwWVArVUhEZHlPY3dFUXA4Z3g0VHlaUXQ3WFVEZCtv?=
 =?utf-8?B?RXlKL0RtdDNwcnIyT0dnVWN1Q2RkOFQvdW41RFpRakNpbUZqSUR3UTFoSWF0?=
 =?utf-8?B?OFduUkcybVJDOTJMeURFMUpOWXU1K2NQODZjSVdxdHgrNDlGTWlkNDNMNzUw?=
 =?utf-8?B?WGt2aGJUOUpEcmcwb1FFUThpRDh0dDhUTWhGKzdGTkNPOHNPa2NydUsyNXVx?=
 =?utf-8?B?SjVXWVJoZ1pOUGlwbzdLa2YyOEN3MkxJQ2NIS3hUNm1IZ3J0RUVubE54QVBL?=
 =?utf-8?B?Y3FlYnhuMmtrTVJLMUluS2tkcU9scFV1Ympzdk9vTWxjOFJ6Vkd2Kzl4Umt6?=
 =?utf-8?B?RnQzdmk4Wm9FaU5ONGdsekljN1ZDOWZPeDR6QzNIR29rZzV6VjBjcnNYVWc0?=
 =?utf-8?B?cDB5bVBlb2pvMnN4eUJxa0dIcDhWZURrQlZmUmlDdml6VmtZMHB5ZCtuZUxi?=
 =?utf-8?B?ZDNWMkR5bGdnMGhhZ3UrR1BTbXBCNW1vNHVXWG85V0NETVZUblU1ZGxiaXZ0?=
 =?utf-8?B?WkJUNzNzd2Z4REptcG1rUGZ4dnhGNGZkYXZLT0NyL3c4M21qWXhzbFB1Z29F?=
 =?utf-8?B?NWlLeTkybE9oZEdoS0tUSytXMTIyUmhFSFpsOHNJWWNkREt4M2svZVNja05I?=
 =?utf-8?B?TS9BcDhwRWFLdUw4V1hxVWRaZGZBNWZOZlpuVW1mcFB6WUtkRTVMcDVWTm5w?=
 =?utf-8?B?Mk5jWW55Ymg1K2MvNllGQ2k2Wld0M1dFdTQ3TmFhSFFVUUE0Z2ltRFdOdlA3?=
 =?utf-8?B?R1JIdjZZSVVoNkVsNTY0LzhlSXVKR0VlQXphc0VYQithWFlZZ2JBNTdyOE9T?=
 =?utf-8?B?cmVFR1FSVHVqN3ZFdVdIeEVkaXlJMlpobzh0TFhXTENaVzlnY1lrdDdXVmlY?=
 =?utf-8?B?ZDV5c1lrbjdDdkVuaElFV0t2bDV5TUJhNTBxR2JXUDZzWjF4eEJqRm9oSlZL?=
 =?utf-8?B?QUlFT3ZpbGQzZ1Nwc0lPZXVXTWE1b2JqaTczM1BnR20xUmwzVDEyTTZEaVhH?=
 =?utf-8?B?R1l5Z0ppN01XeGtaMzE3VWx1dHZvUFBnK21nV2JQbzRNL2dyblYwZ2Z1cGVm?=
 =?utf-8?B?MXFXRTZ3a0hZTUNKYy82M2ptLzVvaHEzQjFlcXhFRmdORUVWbXVjRHRBQmU0?=
 =?utf-8?B?Yk5OeCtXTGFqaUh1VXVnaUV1c3RIb1FXalF5NEtqdUc3eWxvdmhFbkpXRStl?=
 =?utf-8?B?akl4NFRjU1hMNittbWRuOVhmc0g2UGxUY0JwNWxuRTlINldwWFltejYxY3hv?=
 =?utf-8?B?Uk15ZFZqL25VdGl5bmNCTlpWTHA3dVRoL0ZxSFgxQVI5QXlqeHQ4ck1vam1T?=
 =?utf-8?B?eTlxS0NQeEtRTHNYdWJpTTdUZ0VkWWhmUDFNcTZXUjE0cVQ1MmUwU1U0UHBF?=
 =?utf-8?B?aTA0dmRubXU2T084L3JiSTFqb3huQ0UvODVkbDRxSzBMc01FeXZLR05qYnZz?=
 =?utf-8?B?bGE5c3JZZVVKQU9OemMwd2pJN2dCT1VHYWtPeTUrRUtLNnFrWEhtalAxd0kw?=
 =?utf-8?B?aWozWGxuSnpISGpqY28zUTJYK1VCNjNhelpBUVFQYmlqcFBtVVZQcUdSazNL?=
 =?utf-8?B?eng0RjNjZVZzU25SOEt5WlJjdTM0VW9IeU5vYzJlMnBrTnEydjdVMlh3bDUr?=
 =?utf-8?B?WkNKeEpsVWlPNjV4QjFGNEkxVHlGL1R1UExyWE9yNjBWNWpCMlpwS1d1TFhy?=
 =?utf-8?B?U1lPOTRSQnRNeDRPc2k4M2M4c2VkNm1BZ1JJSDlucFlxWjFkQ1c1bnIxSW9I?=
 =?utf-8?B?WGxKNUNyYUFUY2cxSjJWQW9IV2NIL2NtanhYWTRBR29yYTU3Qkh3ZTFCUjlj?=
 =?utf-8?B?N2EvYU1jRk92SkxrTnQ2RTl3T1FnNEdmakM2d0pSaDNKeHpxZ3hKRGhUZFR4?=
 =?utf-8?Q?MIJJMO9rY7I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzBHWGxrSGpYZ2oyV0RmODFNNjJYRFdDNzRTU2R6YTU0RkZxY3JTbWR1Q2dR?=
 =?utf-8?B?ajQzdnJDUGhCOVlVaUVnOUhMT09qNzlpamxsUE1OdktMdHl3bkg3N0hGM2Nz?=
 =?utf-8?B?Y0NuaU96TFBtUlEzckdLU0owN2c4TmdYczd6NXg4LzZBY21UaXExaFFQNFg2?=
 =?utf-8?B?Y1pGNmF0ZkUvckNJZjVFOXdnRXJTdWtaY2NuZzllRDlFUDJNeU1UbERma0pp?=
 =?utf-8?B?MmVvZStjZzhSZ3pkWEhBNnYwSTVIMjZSSTljYVNZOWk4aUwvMjI2YThFVVlm?=
 =?utf-8?B?YTBjWlEyN2JUSFQrT3hzeXFLUHZTSWV4QURjOHkyZnB6Z3c3eTVSUDM3QXc0?=
 =?utf-8?B?RzN4Rkx0TUh5ZkkxVlRyZk1senFqU1llK2Y4elpUWDBEcHVsN1JOc0dTcTJO?=
 =?utf-8?B?clEzaWRHaW1heHFLMWwyUEpaVEV6bnV4Y2xUZlJtbWhqOXdyMXFPTitXY1A2?=
 =?utf-8?B?WGdvSThxQ01sWXA0WVg0N3BITVRIVGVXY3gxNDJmbnBJNGFHbmZBTmJtUG9h?=
 =?utf-8?B?UlQxK3ZLSEpURWVSekFOTk5SUkpYRXZ5MmVhU25lUTloSmlMcW9EallPMHRm?=
 =?utf-8?B?S2xHZnpMemNYZzM5M0pxYStSSmV6VW56WnhZVjRZUU8wY3BVY2w1aXNEekJi?=
 =?utf-8?B?cTFwQ2lQRHlBYW0xNVl1VGkvL1FwYm5DTHpxbEVNb2xjNURwWElhN2trSVVq?=
 =?utf-8?B?TDdvVWpoU0ZYcG1HZFl0eUwycjMxdFRteWsyam1SdEVJRk9HZjJGM1l2eVh0?=
 =?utf-8?B?cUN0ODlYTVo2STZhSmxXWExOTzZjZlo2TFdnR3hrV21Yd1ZYOTV1KzlkT1Qz?=
 =?utf-8?B?SGExdzVHNzg4OU1TRURLSzk3LzNDNllTYWlUbk1wRDZxOEtWRmdVRGVwSHFO?=
 =?utf-8?B?VDUyR0VkWVJlVzFFeGd0dDFacEY0Qk5RU2tzdytXaVlBaHorZzFlempGQ2tt?=
 =?utf-8?B?ajNtckpISUh0bUpvL0dDcVlCL0J1VGc5dGtTS2cwcUJxZnowRjUvMnpZVnBH?=
 =?utf-8?B?OUJlZlJ1eG1STWFTOVcxbDUyQm42RVAwT1pjV1J5UEp6eWhWNVcrR2hxcUJN?=
 =?utf-8?B?UXVTeldrWmU3WEZvWmxyM1l4UDFaTTY2NzRJZUw5QmZsbmp4TmMzQng4NEl1?=
 =?utf-8?B?RWIvNFdLb3NZS245RlZZVFl1SDdRMm50OVNmU1VVWjJKR0g2bCs1TjZod05G?=
 =?utf-8?B?MGJZeTJqMDNGWmpPdjZQM25JQkd1eGJ2SHJDSXlhazZjUGpTMSs5ZXlRM0Zs?=
 =?utf-8?B?OVAvS0crbXJkNEJWL2ZKemg4TU5qQVludlpScStpQ09uck1XMlJKdTMzVUdx?=
 =?utf-8?B?eEx1RnpVd2YwbldxRkR2YkdxSUljelNhS1dsQytKU1lVZ3lkb1VSZFE5K0xG?=
 =?utf-8?B?MkhnWDJkc1lFSEdZTndNY1g1NXBGa1I4S0gxV0dRZ2NjTXpCZEtCOWo1VUla?=
 =?utf-8?B?d2Z3amIweThxYXNZN29oQklGcFJpdmRNc2U4MlM0MnBySzZaV0ttdERyVGVY?=
 =?utf-8?B?N0dSZ0htdWJiYlNhK2VFSVZVRVJ0QnVVYWd4TU05alJlWHhRR2JxNVdWMDJX?=
 =?utf-8?B?VHFBQWdKcTkzZzZjR0pwcWFhSW1yK05IMHM1aUpycEp1b0s0OGRONzc5T0Qv?=
 =?utf-8?B?eXlWNmNMTkcrU2ZFNGxZWjlTZTVQZmw5L04zbVFuRWlFa2hWaVNOZVppTGlG?=
 =?utf-8?B?N3VkTnlUT28vOWRNTjBMNFp6SDUwRE01Uk5WbjhFeEQvTDZiUVpzNVhEb083?=
 =?utf-8?B?YWhaOHdUaVZnQnpNSUdEVXRrT3haT0F0QzZTYW0xOEJMS2dQQXF4VEFIWlZl?=
 =?utf-8?B?ay9hSFcxbVBUVjZLL2ROWi95TllyM2FyRFFSU29ZQXZmVGw1WlM1Ynk2bGk4?=
 =?utf-8?B?WS83RWY4K1poWmpRNVdweE1BUWxvSlJUZlJoWFVpeG5TTGg3Y2JQTmoySU81?=
 =?utf-8?B?emFjTWhaY2NIUEZ4U1JBNjBQZ3VtZnZHa0ZpcERZMUpOd0tueWFEbWN1UU0x?=
 =?utf-8?B?b1A1SW05N1ZZOXNScEgwbjhkREZWMU9NNytKNlY4TEZvcUVSVVVlMEpEYjJK?=
 =?utf-8?B?ZXIrdVhWcXVaVTcrbEhDUTBZYmIxcC9Rb3REMXZzN3RFbjd6QXJ1NGFxeEF6?=
 =?utf-8?Q?OaKHI1KWe3rrUATSq4k0k+AcN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf2395e-7436-4d22-9cfe-08ddb9882a65
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 16:47:43.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMNPu4yv3MfxW6s+hTW8OLWD5EiGp7AJpNbJcH6oYlhb9hcczEvV8uKDZw9C0rL8sgp6EfAp/U/enenGVVEEIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662

Hi Sakari, Dongcheng,

On 7/2/2025 2:12 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Dongcheng, Pratap,
> 
> On Wed, Jul 02, 2025 at 02:08:26PM +0800, Yan, Dongcheng wrote:
>> Hi Pratap,
>>
>> On 7/1/2025 6:31 AM, Nirujogi, Pratap wrote:
>>> Hi Sakari, Hi Laurent,
>>>
>>> On 6/29/2025 3:40 AM, Sakari Ailus wrote:
>>>> Caution: This message originated from an External Source. Use proper
>>>> caution when opening attachments, clicking links, or responding.
>>>>
>>>>
>>>> Hi Pratap,
>>>>
>>>> On 6/17/25 01:33, Nirujogi, Pratap wrote:
>>>> ...
>>>>>>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0x20),  0x00 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0x20),  0x0b },
>>>>>>>>> + { CCI_REG8(0xc1),  0x09 },
>>>>>>>>> + { CCI_REG8(0x21),  0x06 },
>>>>>>>>> + { CCI_REG8(0x14),  0x78 },
>>>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>>>> + { CCI_REG8(0x21),  0x00 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>>>>> + { CCI_REG8(0x03),  0x00 },
>>>>>>>>> + { CCI_REG8(0x04),  0x06 },
>>>>>>>>> + { CCI_REG8(0x05),  0x07 },
>>>>>>>>> + { CCI_REG8(0x06),  0x44 },
>>>>>>>>> + { CCI_REG8(0x07),  0x08 },
>>>>>>>>> + { CCI_REG8(0x1b),  0x01 },
>>>>>>>>> + { CCI_REG8(0x24),  0xff },
>>>>>>>>> + { CCI_REG8(0x32),  0x03 },
>>>>>>>>> + { CCI_REG8(0x42),  0x5d },
>>>>>>>>> + { CCI_REG8(0x43),  0x08 },
>>>>>>>>> + { CCI_REG8(0x44),  0x81 },
>>>>>>>>> + { CCI_REG8(0x46),  0x5f },
>>>>>>>>> + { CCI_REG8(0x48),  0x18 },
>>>>>>>>> + { CCI_REG8(0x49),  0x04 },
>>>>>>>>> + { CCI_REG8(0x5c),  0x18 },
>>>>>>>>> + { CCI_REG8(0x5e),  0x13 },
>>>>>>>>> + { CCI_REG8(0x70),  0x15 },
>>>>>>>>> + { CCI_REG8(0x77),  0x35 },
>>>>>>>>> + { CCI_REG8(0x79),  0x00 },
>>>>>>>>> + { CCI_REG8(0x7b),  0x08 },
>>>>>>>>> + { CCI_REG8(0x7d),  0x08 },
>>>>>>>>> + { CCI_REG8(0x7e),  0x08 },
>>>>>>>>> + { CCI_REG8(0x7f),  0x08 },
>>>>>>>>> + { CCI_REG8(0x90),  0x37 },
>>>>>>>>> + { CCI_REG8(0x91),  0x05 },
>>>>>>>>> + { CCI_REG8(0x92),  0x18 },
>>>>>>>>> + { CCI_REG8(0x93),  0x27 },
>>>>>>>>> + { CCI_REG8(0x94),  0x05 },
>>>>>>>>> + { CCI_REG8(0x95),  0x38 },
>>>>>>>>> + { CCI_REG8(0x9b),  0x00 },
>>>>>>>>> + { CCI_REG8(0x9c),  0x06 },
>>>>>>>>> + { CCI_REG8(0x9d),  0x28 },
>>>>>>>>> + { CCI_REG8(0x9e),  0x06 },
>>>>>>>>> + { CCI_REG8(0xb2),  0x0f },
>>>>>>>>> + { CCI_REG8(0xb3),  0x29 },
>>>>>>>>> + { CCI_REG8(0xbf),  0x3c },
>>>>>>>>> + { CCI_REG8(0xc2),  0x04 },
>>>>>>>>> + { CCI_REG8(0xc4),  0x00 },
>>>>>>>>> + { CCI_REG8(0xca),  0x20 },
>>>>>>>>> + { CCI_REG8(0xcb),  0x20 },
>>>>>>>>> + { CCI_REG8(0xcc),  0x28 },
>>>>>>>>> + { CCI_REG8(0xcd),  0x28 },
>>>>>>>>> + { CCI_REG8(0xce),  0x20 },
>>>>>>>>> + { CCI_REG8(0xcf),  0x20 },
>>>>>>>>> + { CCI_REG8(0xd0),  0x2a },
>>>>>>>>> + { CCI_REG8(0xd1),  0x2a },
>>>>>>>>> + { CCI_REG8(0xfd),  0x0f },
>>>>>>>>> + { CCI_REG8(0x00),  0x00 },
>>>>>>>>> + { CCI_REG8(0x01),  0xa0 },
>>>>>>>>> + { CCI_REG8(0x02),  0x48 },
>>>>>>>>> + { CCI_REG8(0x07),  0x8f },
>>>>>>>>> + { CCI_REG8(0x08),  0x70 },
>>>>>>>>> + { CCI_REG8(0x09),  0x01 },
>>>>>>>>> + { CCI_REG8(0x0b),  0x40 },
>>>>>>>>> + { CCI_REG8(0x0d),  0x07 },
>>>>>>>>> + { CCI_REG8(0x11),  0x33 },
>>>>>>>>> + { CCI_REG8(0x12),  0x77 },
>>>>>>>>> + { CCI_REG8(0x13),  0x66 },
>>>>>>>>> + { CCI_REG8(0x14),  0x65 },
>>>>>>>>> + { CCI_REG8(0x15),  0x37 },
>>>>>>>>> + { CCI_REG8(0x16),  0xbf },
>>>>>>>>> + { CCI_REG8(0x17),  0xff },
>>>>>>>>> + { CCI_REG8(0x18),  0xff },
>>>>>>>>> + { CCI_REG8(0x19),  0x12 },
>>>>>>>>> + { CCI_REG8(0x1a),  0x10 },
>>>>>>>>> + { CCI_REG8(0x1c),  0x77 },
>>>>>>>>> + { CCI_REG8(0x1d),  0x77 },
>>>>>>>>> + { CCI_REG8(0x20),  0x0f },
>>>>>>>>> + { CCI_REG8(0x21),  0x0f },
>>>>>>>>> + { CCI_REG8(0x22),  0x0f },
>>>>>>>>> + { CCI_REG8(0x23),  0x0f },
>>>>>>>>> + { CCI_REG8(0x2b),  0x20 },
>>>>>>>>> + { CCI_REG8(0x2c),  0x20 },
>>>>>>>>> + { CCI_REG8(0x2d),  0x04 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x03 },
>>>>>>>>> + { CCI_REG8(0x9d),  0x0f },
>>>>>>>>> + { CCI_REG8(0x9f),  0x40 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0x20),  0x1b },
>>>>>>>>> + { CCI_REG8(0xfd),  0x04 },
>>>>>>>>> + { CCI_REG8(0x19),  0x60 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x02 },
>>>>>>>>> + { CCI_REG8(0x75),  0x05 },
>>>>>>>>> + { CCI_REG8(0x7f),  0x06 },
>>>>>>>>> + { CCI_REG8(0x9a),  0x03 },
>>>>>>>>> + { CCI_REG8(0xa2),  0x07 },
>>>>>>>>> + { CCI_REG8(0xa3),  0x10 },
>>>>>>>>> + { CCI_REG8(0xa5),  0x02 },
>>>>>>>>> + { CCI_REG8(0xa6),  0x0b },
>>>>>>>>> + { CCI_REG8(0xa7),  0x48 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x07 },
>>>>>>>>> + { CCI_REG8(0x42),  0x00 },
>>>>>>>>> + { CCI_REG8(0x43),  0x80 },
>>>>>>>>> + { CCI_REG8(0x44),  0x00 },
>>>>>>>>> + { CCI_REG8(0x45),  0x80 },
>>>>>>>>> + { CCI_REG8(0x46),  0x00 },
>>>>>>>>> + { CCI_REG8(0x47),  0x80 },
>>>>>>>>> + { CCI_REG8(0x48),  0x00 },
>>>>>>>>> + { CCI_REG8(0x49),  0x80 },
>>>>>>>>> + { CCI_REG8(0x00),  0xf7 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0xe7),  0x03 },
>>>>>>>>> + { CCI_REG8(0xe7),  0x00 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0x93),  0x18 },
>>>>>>>>> + { CCI_REG8(0x94),  0xff },
>>>>>>>>> + { CCI_REG8(0x95),  0xbd },
>>>>>>>>> + { CCI_REG8(0x96),  0x1a },
>>>>>>>>> + { CCI_REG8(0x98),  0x04 },
>>>>>>>>> + { CCI_REG8(0x99),  0x08 },
>>>>>>>>> + { CCI_REG8(0x9b),  0x10 },
>>>>>>>>> + { CCI_REG8(0x9c),  0x3f },
>>>>>>>>> + { CCI_REG8(0xa1),  0x05 },
>>>>>>>>> + { CCI_REG8(0xa4),  0x2f },
>>>>>>>>> + { CCI_REG8(0xc0),  0x0c },
>>>>>>>>> + { CCI_REG8(0xc1),  0x08 },
>>>>>>>>> + { CCI_REG8(0xc2),  0x00 },
>>>>>>>>> + { CCI_REG8(0xb6),  0x20 },
>>>>>>>>> + { CCI_REG8(0xbb),  0x80 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x00 },
>>>>>>>>> + { CCI_REG8(0xa0),  0x01 },
>>>>>>>>> + { CCI_REG8(0xfd),  0x01 },
>>>>>>
>>>>>> Please replace these with names macros where possible. I'm sure quite a
>>>>>> few of the registers configured here are documented in the datasheet.
>>>>>> The registers that configure the mode (analog crop, digital crop,
>>>>>> binning, skipping, ...) should be computed dynamically from the subdev
>>>>>> pad format and selection rectangles, not hardcoded.
>>>>>>
>>>>> I agree, but we get the sensor settings based on our requirements from
>>>>> the vendor, i will check if we can get some more info regarding the
>>>>> crop, binning, skipping etc...
>>>>
>>>> Some of this infomation should be available in the datasheet. Use at
>>>> least the register names that can be found, for those that can't there's
>>>> not much that could be done.
>>>>
>>> Sorry to say that I don't have the details in this case. We have
>>> previously reached out to the sensor vendor, but they are not willing to
>>> disclose any of these details. We hope for your understanding of the
>>> constraints we're facing and truly value your support.
>>>
>>
>> If you have a spec of OV05C10 (I assume you do, as the developer of this
>> driver), it is not a issue.
>> Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
>> 0x78 in your reglist ov05c10_2888x1808_regs. If define all named
>> registers rather than the confusing magic hardcode, the driver code will
>> be more readable and easy to review.
>> I think this is what Sakari thought.
> 
> Yes. And even if it happens that a register write slips to a wrong list,
> we can fix it later.
> 
I agree with the suggestion on proper naming of register offsets, but 
unfortunately we lack access to the spec. We are completely relying on 
the sensor vendor for these sequences, which they are not willing to 
share the details.

Thanks,
Pratap

> --
> Kind regards,
> 
> Sakari Ailus


