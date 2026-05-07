Return-Path: <linux-media+bounces-60744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO9xBZ48/GnfNQAAu9opvQ
	(envelope-from <linux-media+bounces-60744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:17:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9504E3F5D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 09:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E53302453E
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 07:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA337351C3A;
	Thu,  7 May 2026 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tDf8Eyp3"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1FD30F934;
	Thu,  7 May 2026 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778138252; cv=fail; b=fsgW1HCBLH7wCTfNE22EdsBeLzQB6b5KIS2H6+0zDjTQcZGK35SwEceUI0p4qH3xtoNqXkehkLXvf6J3CJIh6cnLdQju6slq4XKEcCLFZJIjo8XomTOL15dnhw+UnkFmLqLqAEQ5gmNVqIAjxCmXVQ/H+hzJZ4tCFbzx9e8kUjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778138252; c=relaxed/simple;
	bh=0PZAWAlTNPKHJ9E1BBdADbXfuzBZSA4/u4w6UIdvR8Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n17AVJo147RalZT75SWZmRkpIldgOFZ1zTK6nltEbqOGWwFX1jStj69Gl82EhL58EJ9yrWVitUOJYXR+5Or7S5iPXbqz4LTiVpBf0JuDcGL53G/sq05m5P69BdBRlxb2C9sEN1HjPGoWiTLsE+Spu7+LmXE4sTS7qD1TkRlkaPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tDf8Eyp3; arc=fail smtp.client-ip=52.101.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGsid/N0YYHnmTcopbVvVfTYGN2dAbHpXUHnpH+g2l5Hhy5S/Sgcrv4nnznco0cnOE6JC9OriEnMBiIGtHS+lv+m9JFHEXbzKUBCsYVNWALO5zdV2uUN8byMFvJvAYl2TIstG/ueT2sQVPqTh9IIfajtqbZ2+vgqaRizKtIXqsXshaN9ehLEffWdSWkOvke8nrYn3VuSODXv9pph7ji/lAFZ+Tt4rx8V0NWxeiwuv/6tVRwyANkZ1j0vHMBN/QBQwFZYxZDu0TD2E5uu1798cKZkTQXO3MSbzv8H/1zdG1AXgTaIhU/AUnpZqywr7+LohA83xsFFgEi7UI9hkpKKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6dUpy5OzDYhykHzzE4FCOFg70D7+73JxMIRyntjTMg=;
 b=NPLIxWTMiT99BbMbmLWFnWpWoTFHEv82jCYXyuHq8cnr5ThI2ihwxIULfhGjbNs3KtGrV8qMeyyiJyJ87lX93SnersFeoAiMSVYDghizDv9pHE6EFcZUecyTdmpf211VBpn7AUr8e2blwTvMEPzA17r8iDfuuBeNEZoci/LyRfrt6gQFdbhhxBiFVoHxgPXG1Q3G6FhQcj/yMgpuC2UymSUIhcZykq+ODRElp302AEO5n6dhW00/mEHBsfVy9T1jOl/dpjgSIMuHHGZRnwmKlv+cR2FAP4oJmUpjAJgCfdTo5cTTJXAxV23byK+dJzJyai8zT8O3Ph4Nrjeq8L88OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6dUpy5OzDYhykHzzE4FCOFg70D7+73JxMIRyntjTMg=;
 b=tDf8Eyp3bYtkTfq6t115rwGvi3bkmuCqJtVSoMBL8yjQUgTQ0MtpgbRYvVPYvI/iRcSyUhvBg9UyuT2R1wTD7KUcz0zoVTOJIphKT7Nt3y9kcnicFS572Ul1yrO6KET/4QTo/xzofSDWI5gKJL3Ey4KmuRRzBgpDLvwtYrCZH5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by IA1PR12MB9532.namprd12.prod.outlook.com (2603:10b6:208:595::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 07:17:27 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::1e6b:ca8b:7715:6fee%6]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 07:17:27 +0000
Message-ID: <3128deea-95a3-4c36-902b-37f280913f2b@amd.com>
Date: Thu, 7 May 2026 17:16:56 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 04/12] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-5-yilun.xu@linux.intel.com>
 <c0b160f8-2930-4158-9e50-b4cc4209e2ca@amd.com> <afs/Jamxnj6GGFfM@nvidia.com>
From: Alexey Kardashevskiy <aik@amd.com>
Content-Language: en-US
In-Reply-To: <afs/Jamxnj6GGFfM@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY0PR01CA0016.ausprd01.prod.outlook.com
 (2603:10c6:10:1bb::19) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|IA1PR12MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: b97efd35-1eb8-4714-ca97-08deac08b178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HxbieoliFjwlewnxEljCnOrXG541PQFgbZsyZtgN5PHxWQUtpYpTvFZvAI14CMgc7ycnd8KVPDoVfu6NzOIeK8k0hCt0m8X/hOlKcPC4jydA8kF8cZIFlzv8VHdBPdtU+qwHFSFHylM012SJld81KcaTm0Ov+jvJHWSUlzgXBkQXmb97O6/FjxfeKzseZ7FZQ2AA3HWCo2KXPfrxM+skOA+4nxu1sa930acdofOlZSftkM6mkebZ6sZtzSRiEnrm9FqJdG07B9lOxzbwEwVCD4rXU7RdzTD4m5YLSr5V+A8D+Dl3hJXVGcVmydn/v7TtdNgDi3XI0rS2nenf231WzxeZ/6g0XPWBI4cMavDxET1SKkqEnpDJqSv6FG34ndktCLRLaHBhhKNwIpmi4WQsK+HqnyettYy6pW6PttRFYIQds57cUOfdnpXW3dDwtRgj8pD+U7G0dJWHDXm4BZ/udVEcP1tz20G/lunEliXRjokz22kDbFYGufaThd/075lgn0OvRvJo2JeMquBcXRre9ZHUfhdl3AlwSrsI6N5Ps1ywFQHnaEaXan0+ROQN074M2CNkym8vRiGfB7yltxIwjab3+eiBOALf1I4GZBaMU9O110JCRtHCnfJFfy1GFW4+i58aYiOyIsZUCU0Pjq76cIyHA/wTEC19j7GuMHKjfZrPNkmCHgboeoLsyhFBWhAk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9194.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUVCWWJsTXV4Nm5Cd0UwL1Y4djkwZU5nQlMyZkJVL1dRTUJtcldEQlpnM3dJ?=
 =?utf-8?B?bDhrN2lGdlc0SlhySHBVYUE2aEVEMnJtd2ZLUHNuUDVKVTk5L3FoVGtoOTMy?=
 =?utf-8?B?VWhBbzE3M2lSb0R4c2U0K0N4amYxdEVPRVQ4TmxVT3JueXVLR0xYSXoxd3Ry?=
 =?utf-8?B?VDB5VnJhLzRpWlJaZnZteFg2bFljVTR1MFFZS0QwaEJodHpOVnR3K0dzOVM5?=
 =?utf-8?B?UDBxODdWazdVcXJySHdjKzN3a2pmZ3d3OE1ybTNjM2tLNUFsR2xtRWo5eHEr?=
 =?utf-8?B?dnpERzlFWFZBOHo4ZTVtRWxsYTBQc05xUzZldVpwbTN2SXF0eVcrWjlTVVV5?=
 =?utf-8?B?UGdXOHozYUJjOU1ob2dWcytwOFVzR3BOZVVyMXNJeUl0d2NBZ3FsWjY4SWtO?=
 =?utf-8?B?bUdLZjhENzIrU2JFRnZqQTlGeUVpeG5XVllQQ0syNXZRZDZHUStsS3J3N2lR?=
 =?utf-8?B?bk9ra01YSjgrUVRyRHhodDVvaEpPZi9wTng3MW1MRG5tT1NTZXhOaTB3bThm?=
 =?utf-8?B?ZU1SS0NXbXoyZUhwRWhqR0pTekdLMy9wdHFpUWZxZjdvajZsZjYwV0lMZG9Z?=
 =?utf-8?B?cjZQT3ZVbDhlNEQ0ZVlMaXhqSkt3cnh6bEdQMU8weDhmZ2l2THVxbll0djBH?=
 =?utf-8?B?OXpEOWZzQy94QksxbjIrVFlYb2JlWEZTeFVxUjRVSUJGd1M3VCtvMGlvNFRX?=
 =?utf-8?B?d003TEoxMmFIVVRQRHlXSWRLLzNVb1d3NFpkYXFvSjJPbHIxNkZoL3FmZ0Ir?=
 =?utf-8?B?Q3JHckdvR1FHOUZUOC9heC9Oa25lcURqOFVMWnl6R0cwTmt6bjNNU1RMOEN1?=
 =?utf-8?B?WWI5YitDZmZCWGZabXlnYy93dmtnZzY2dk1YK0VDbnllNVNaZkhNcHhTdWIr?=
 =?utf-8?B?dkN5TlV1cEN2amtHY1NBdUMvaURzTVI1MFplMUpOUmpwNWxuRVloVjcwV1or?=
 =?utf-8?B?Wms2RGVqR29xaTFLa0pQREgyK1BxdGFnZDdlMVpLQno4azZXZnpONFlJdDFN?=
 =?utf-8?B?Nnc4ZDdJUWpVKzhKcTdWNjY4U21xYWQ4NmhtNm03WU50TFppMUY2MlZJbjg3?=
 =?utf-8?B?SldPNnI0ZGxHRW80cUplQUlYMHdkZkVTbENqRHR2UW5tOUNDdTVBZ1U1K3M3?=
 =?utf-8?B?NmRSaVQwTElWcHBkVXJuZmdFZ0dmcFRETWUyaThQR3QrNlFXMDlYUWhqUDAv?=
 =?utf-8?B?RFVpL0ptTzZFTG9PRDQ5bEJ4bHVKZmxoUlpnU212Vkk0TjNWVjR0V01MdG1o?=
 =?utf-8?B?a1NxTDRpUkF1QzFoOE5laVpmcnVrY005bnlFVXl3bWV2d09RT1RURTFZVHlx?=
 =?utf-8?B?OVpkeVpGejk2b2NRemZBdEZHOXZCV3NrbU9Yd0FpMklPZkRTL3RFdFRKbFdz?=
 =?utf-8?B?VXpkaVB4SUdQM01YenRWZWNzZVZKQVAveUpxTjN4d2M0c3drQ2pKMDRHRGNQ?=
 =?utf-8?B?Z1d2RVFSTjc3ZkJwSzFLVXpMZW1FQjluOGJmZGU5VjNERHBwZGNvTmo5eHlu?=
 =?utf-8?B?Sm55eC9rWWpIbndRUlRNQzlrV0dnUkJkSzdFbFhiNnJjM2toNE16NmVOSTlN?=
 =?utf-8?B?VkFFQnZFblVVTDg2YjJpcjR5bE9VK05CYXBxQ3gxQm5JL0pTOVEwZUl0UTZF?=
 =?utf-8?B?RmVLWFFodGVPWTNnTll5TVFkQjlmdzlMZk9SRW5QenM5VmZET3ZVK3UwNTNv?=
 =?utf-8?B?NzNKbzVVMFEyd3NuMmd6dkhtVFJZdXVrWXIwRFd2ZytTaEsxYVl1TVdEMVdy?=
 =?utf-8?B?VlpnMHkrblZPT3BHWVJEdFFPOEVPLyszUTdpcERTb2lKVmpHajJjKzhPeVhV?=
 =?utf-8?B?RU5CSG9sNlF0QzBEVUlickx6QnVVWmVET25iYnVrL0VkbU82blJiYWt4ekI1?=
 =?utf-8?B?eTFDdEVRMTVJTGlBTWhDSTZWbDFaOWRoTHcrVnc0dmlqbEFWRmp6QVlFQ0xz?=
 =?utf-8?B?VjBROTNJVktsTWpJN1J3YjRPcFZJaW1uQzhXbEFUQUJyeUdmNndLQlNFUU00?=
 =?utf-8?B?VzdxaE1yUi9aSExrV0d4aVFUcDYrR0ZuenVyN0NSNnJuVWd6NTQwYjZSTDZk?=
 =?utf-8?B?UTlGeTQzUlZpNXRyVDhuV2ZTblBsY3QyRUorUE1VVFlEU3hIRDNtRDhpczZz?=
 =?utf-8?B?Y0JQYUkxYUJXR1RDNkVUVmJOZnVsaGFZSVBOMGc0R0d4eUxFZjdJL3Q1K3c4?=
 =?utf-8?B?U0VCMW9ZZ2d3OEdQZHAzMWZ4MkgyZDFkTGpZMkZLdVNqMkxocWxXUzBuTGhO?=
 =?utf-8?B?QkxoRDIvMWlyVzBodHB2MkhieE5KTlhXUEJBNWJoSkVxK2JiY1RycGFPNFpM?=
 =?utf-8?B?d1ZtTzlsTWVqbnZhVnZ1RXk0Vm91eW9yOUhTbkFhWTc5QzJUY291dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97efd35-1eb8-4714-ca97-08deac08b178
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 07:17:27.2392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ctpg1MVf4Mcg+Vu8EBUrQeU8PQwqwkmZZW0gpBFPcla5UyP5cfuurVqsQJ8O6hdkfbsRm11Xp+2m8aUbELe0rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9532
X-Rspamd-Queue-Id: 6E9504E3F5D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60744-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aik@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 6/5/26 23:16, Jason Gunthorpe wrote:
> On Wed, May 06, 2026 at 12:35:42PM +1000, Alexey Kardashevskiy wrote:
>> Hi!
>>
>> Let's reignite this topic.
>>
>> I've been using these patches + QEMU side hacks for 6+ months. And it's been fine until I got a device where MSIX BAR is in a middle of another BAR marked as TEE in the TDISP interface report. And no trusted MSIX yet.
>>
>> Every time QEMU mmaps a BAR - I request a dmabuf fd from VFIO in QEMU. Since mapping of an entire MSIX BAR is allowed by default, VFIORegion::nr_mmaps==1 and it is an entire BAR.
>>
>> Problem: KVM memslot mismatches the dmabuf fd size
> 
> Huh? kvm does not care about dmabuf at all? Are you running other
> patches to hook kvm and dmabuf?

yup, 06/12 of this patchset.

> Putting a slice in a dmabuf is a well understood need for MSI, so I
> expect whatever kvm dmabuf interface that gets merged to accomodate
> this?

good to know.

>> Solution2: modify logic in VFIO dmabuf to allow multiple KVM memory
>> slots per dmabuf. Now it is kvm_memory_slot::dmabuf_attach with no
>> offset into the dmabuf and one kvm_vfio_dmabuf per dma_buf.
> 
> Yes, when kvm learns to take in a dmabuf it needs to take in a slice,
> not the whole buf. Or you need to create multiple dmabufs with the
> necessary slices from the VFIO. The upstream vfio dmabuf creation
> allows creating it with a slice.

true but either way dmabuf slicing will be directed by QEMU's msix-table emulation MR and this slicing needs to match the TDISP report so I'll have to teach QEMU these reports, right? I am worried if I miss something obvious, again. Thanks,


ps. I like nntp.lore.kernel.org very much for ability to dig out old stuff and then just reply to it :)

> 
> Jason

-- 
Alexey


