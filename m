Return-Path: <linux-media+bounces-35829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9991FAE702F
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 21:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69AF17B1D56
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 19:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B912E6D0F;
	Tue, 24 Jun 2025 19:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="y/QO57Ng"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4A23C51F;
	Tue, 24 Jun 2025 19:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794547; cv=fail; b=SLoxwKUr4H4eK4/btOV5MctfN9cjXcjqxp8yYBx0+ZhkmMvGo03bZ/9OpIjUNsV4C4YkLVwvDOtzKC2jU1jdIQN73RFEBY02fiBNsCnr89SLy9gT3r+rZUbeLTuhy8HvCZzUOKcKqrsp0mMevngYMC5HDLdt8hrVFVRKNwc1Pvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794547; c=relaxed/simple;
	bh=4Him+JIHcYs/ERJoDthsk7GtHQl8akng7dQGB9aOdEM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Vb73FR/hMazEffV3W0daKcBSm5Ixd5C1PuE8NV/wR8EdKGIPsu/GKbfZD2DHLIJoVLSOCX/3ybAqMOXKINBom856h15vlMhWBDAmLerQbrvbllJU/wgxIOq3RMmd99f1nV6wfMSRZb/0Yc+sCCXmMpQywTfVEwGd2gy7/92pPM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=y/QO57Ng; arc=fail smtp.client-ip=40.107.220.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqpKNQt+blXgnrYa63+ailtIxMgr0FHtPv6/jkR3IDTAqZV5/MRL3Iz56Un6t0C+hjdBYIbvczDSCD7R3sOPoJlgKQVSk/Q44kiuM09oe9lOfvycLd8hgz0GdRV0YzuxBieYlEy7/yaXhNw50CVOAgqJEAgCnaJGGw8GiItdQAPQ3io0ybyq1cdlu5DRrBPFOsrpe8QUiNSf9Qzp8vmFknTXg6x7XneXRoyoruAsVqAkT92K2iRgixnhPpP9Zkj4rWMgKywdD7QIdrn1iVzmyflTvlN6J49cO199QL1WfXh/sJ7rhROG9O1VsR1MErRtMMiJRtthxU8I1eiwIQQKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnZsWRC93oy7iBcvtefDX19ZP99q/bQ0HnEhN1eHrGo=;
 b=yscqsD9hgMFcuPYb4ClREsLNnuYE+UQdddDMici8UAxUUQbtm2rFPBWUAaOh7S4lVxIl4T2z9yegwZUFmbgf3ozzI+vGrfNW6EGuRICfl7QaRek26HXixDAeRNfUgkAeIBGc4RO8HQipz8eNSB+TBe7FEq/ijtbMYLNUWrAZvDvik69stmjkhxRqVmpFMidEQvkHboCjMd9z25u9jPw0BvEK/ydIoNZkv9ggU3UBy46dvcLSad3rdrl1iMvQCsK2WUYgtJE8LmAJ1cJEUe/5DluyONHHrNU3xDaFJmPg8MtUfCYzLaPdqnBHjPlG6ouUT5aQuwASSkddunpQgVaP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnZsWRC93oy7iBcvtefDX19ZP99q/bQ0HnEhN1eHrGo=;
 b=y/QO57NgyeVGLtILJwL66ZlLIQfcHh1vZUdeM0IuUBUiqogZ6/RjQQXJ0uKiTtm3mVV2UEj3IpK+WicCuvGvKbv6/NeTHbLMCJo/KXUmDOkBRo213uh5RVsXFcSHlkB2T8vCErA83LF4cxD2Ngv0sStMOqByyqlRoXcVCJwV0Ic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 19:49:03 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 19:49:02 +0000
Message-ID: <6f5a9eda-c499-4b0b-805e-f75abea46098@amd.com>
Date: Tue, 24 Jun 2025 15:49:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <163655af-2a3d-4489-ac7a-4ee31d3980e2@amd.com>
 <20250624001942.GF15951@pendragon.ideasonboard.com>
 <d2a1d937-9db2-46e4-bc73-f810a3e86f20@amd.com>
 <20250624190018.GF20757@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250624190018.GF20757@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0319.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::22) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ff2850-1a34-42dd-94f0-08ddb3582b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUNuS0dYZHRLKzdRL1VqdEZtblE3MXYvd29OK2tCRW41Zk53Y2FPVlRYUHpW?=
 =?utf-8?B?TmNvTGU0SGJmbTRPTjc1eWJnd2ZoeFVySW94czJXSndEK015dm1VTWF5R0RM?=
 =?utf-8?B?RFpveS9nYkZvL1FDZEdsa1ZjTVl2Q21rd2tMQVZHTEFCeDB0LzY2SjlZYU1D?=
 =?utf-8?B?dUZSVFdKSEZDQ1o1RFBPU0VqemQ1TGFrODdocTBxYk1yREg5a0lMb2swZE05?=
 =?utf-8?B?UTVWeXlFalRzRnA3bXM4R1A0dDFHS2JKWWxtOHRwZ3M0ZDZ3TGVnN1g1T1E4?=
 =?utf-8?B?Mm9ubUlWblFDUmRSVndLSWpuWERnL2xKVyt6ZVRSeVBhcFgyOWRrdWlVUjlP?=
 =?utf-8?B?VktWc1pmcFVqdnBvZlp2RWE2dVk4eGNzWVhRYjU0TWxTQ0k4dTNib1dDOStR?=
 =?utf-8?B?R2tTQjFELzJ1dVhOQ2t3cnFDdjZFN1J6Umc2RzNaR1hYOUIzV1R6SVhOYVd6?=
 =?utf-8?B?Ui94STVLNUlqd1BqSUVETlBWbjU5WEE5TFhCR3puNHFhSWxQK0YxVDlsRkFW?=
 =?utf-8?B?WVhPdkIvZjJTTWRRTTRwVi9RYXZiTUtYSjJpdGl2cW5URkYyQ3UrYngza0Vq?=
 =?utf-8?B?dkx5dWJZdHVmbDNBUUlaUU53TEJ0RU9DVEJSNGhNeGcxQ2ZBQURZTDRHWklN?=
 =?utf-8?B?RmFaVU9GMURkemFsQmpLNTJQcG1uSjM4ai9ZRUZHN2YvTFZZYyt4eGNGcWxG?=
 =?utf-8?B?dlpCMzR6bmtCTXowcGZBdlRFMm9BK1ArK3IxNDdTMjJHL2txV21kU1BkcmFG?=
 =?utf-8?B?SW1hMEs4RDZsTEpLcnRCM2hNVXQ3cnkwU3ZYR0xHMi9oR1Q5eTdHUXVQQkkz?=
 =?utf-8?B?YkxnWXZTWjRQTW5jVjhhM1RRc3FNclhaM1lsV0l6Y3lHeGZSRnRlWUV0cFpt?=
 =?utf-8?B?REJBNnB1UStOZlJzM25XQ0lMWUc3Lyt0emwrR3VWWmk1U1cyUDEwcWlEZ1Nw?=
 =?utf-8?B?SmVqRkJINW1tUkVsbWtXQ05IUFZyQjg0UGljSTVtLzJDd2dacVFmNytJay85?=
 =?utf-8?B?YVVva2dWSzNscnJDWk9DQ3o2a042QzhRbWx5THFWazJUSWpBK1BPYkFPNnNS?=
 =?utf-8?B?b1hUUno2Y3JuVnF6dUFsSjNiZ2J5amhqY2loSG5wWHhDM2ZLai9OYjRyQTRO?=
 =?utf-8?B?QlJ6N0R1ODBVVmZEOXhmaVVTZFRlZHVmSmlDTThWc1IyaVNzMXFsM0lTb00r?=
 =?utf-8?B?ellDd3lEdU5WNnJ3MFhvc1QyVW1zbVE5UWJsUkVPbTAxNFdxNmZvRGptSGxu?=
 =?utf-8?B?M280YStudU1TNWdYcXhHSUxIOWYwaDB3TUFza1hzWWdsNjJ5elRpS05uQ1BT?=
 =?utf-8?B?Qzh5QXR1K1BpSHAzWWQ0Z00wNE81SGlWK0tMZ2U2dDhnWldvTlp4V3B3ZnI4?=
 =?utf-8?B?Vmd2Y3VGWTNrZDlRUkJlcTVpOHgyNHVMbUs5VVcwdk1qdmVINEs4c1YwejhD?=
 =?utf-8?B?eDhvOEExQzluenZ5Und5Y2tZaE10NFF3RnF6cXJTMW9ST2NYOU5mclk2cDlP?=
 =?utf-8?B?MXA3aDQzRGwxZTAvRXZGNnNkSWpDcHlndHdmNHg2ejN2dnJWUzNWME04UWFR?=
 =?utf-8?B?R1kxNTVaVGZCOTFOVHk5ckliU0h1Z0dSU1Bla0RCdzhRaHJhUTdsc0hqQmVR?=
 =?utf-8?B?NHFHR0ZjZGFPOUpMdDVpemdJNmxDUXhIMHYwQ0xhUHFUTlRLTmdiZm80SWtp?=
 =?utf-8?B?YitCRkFhelVscFNBYmdLQlNxV3FveGZSWVlNdFIxbTNLTlBFOVVRSGJ6dEpP?=
 =?utf-8?B?eS9Rck1yRnhIR2YyelMvc0hqcXcrbStoVkNCMzU2Y3EzM1ptRlpXRDdodXdk?=
 =?utf-8?B?VVdtbzM4blZabkVBRFJWZkRpRWNtM1FSS2ZYWEx1bi9Send6MytPQlNYQkJ3?=
 =?utf-8?Q?7OI/84jyPre8o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzRNN2Qvc0F6TEZod3A3b282NzEyaUJMT1piQXlPMjV6cUMzdkc5NGpNZlBL?=
 =?utf-8?B?ZVdDT3ZmZUJXRHNBZExOWlE3cDJwVHYvTkxnRk5CSmRQQ2IrSlBLMUtoclhR?=
 =?utf-8?B?b2M0eEVCT3VEREsybFRWWnZvditXTzZlTWZlNzFDUkhZM0dkVlJQOTI4SnUv?=
 =?utf-8?B?aGlwRzVUdk9TUVRFMjFYcm5yTWd2bWhiSnBncGtDSkFxdlF4MTlrSzFYeUk3?=
 =?utf-8?B?R2x4SGhmaStDMjZFSTRYN2s1ZEtGMGhHOVF5Z2szY3BzTzNUQkx2Nm5vM3dE?=
 =?utf-8?B?ZGFCU24ra0VEeWVNelJPMW5QVXlacDZlOElCRDlHNU9RZkZ6L0FiVkxKR09H?=
 =?utf-8?B?Nk9rdlEvQm01ZmlRWVVrcTJPYzFmM3lObGc0a2h5NUZ5NXNSRVhzYzZHTk0w?=
 =?utf-8?B?bXk1cDErMTNBZW10ME5oT0VlSVBCdW11cGE3dUo1TkxzeWNJNHhMN2tQSFo0?=
 =?utf-8?B?dnVKb3MvUkZnYXQzVTh3eUxDdm41cjVpcjltOWd4QjJhQ2VrRlozVFBuZ082?=
 =?utf-8?B?UDFpTlFNaW1EM0tIR0d3REd0OHlFcDdqYjEvZTd3aHhNN29DdDNTZ2NGNU5w?=
 =?utf-8?B?Vk1NYUFiTjhLeExwK1RaenZNdVhjQVlSd1hIR1o2a01sSVpOMjFKUWZ4bEZ0?=
 =?utf-8?B?a2NPWFVnK2JmUk9jMlBsdEtUUGFYYkdjNlQ1ZWpNUnNzNThqMXZsamxueCtl?=
 =?utf-8?B?UjlyOUUyazdmcnYxUUFKL2ZrbnlDbkdXRkN5V2NRL0ExdkxhdEY2NXR6T3Z5?=
 =?utf-8?B?bmppK3F6SklNMUZkdnVQTm1pRWc2RE5oNUpabVJMdmoxeGh0aEEyQ01xMHlR?=
 =?utf-8?B?ZHZ6eStTNFNMZjZEWCtJVERKQTBmNFBVYlhlSXhXMlc1ZENLckRCVTRGWG1C?=
 =?utf-8?B?clhQYllQa0d5bGVIaGVnQ09QenhiSHloSlhHRnZMaWF1ak4xYy9Jb2pPVk55?=
 =?utf-8?B?bnNlYUFyOFJMeUpmSFhTTFo3a1d4QUcwNiswbjVKTWNVQ0xTWElYZHQxcUh0?=
 =?utf-8?B?bWRnOVZLZ00rTmRYMDFlRFVWcmpwcVVIOGY5ckVyUlVEWkRHM0kyaFE3alFv?=
 =?utf-8?B?YUNFNU1xOG9OTndUckFRRkJEOXY5SlluUWtod1dLd3FZQXdBY3IxQXBmVjF2?=
 =?utf-8?B?a1p5T2piejFCaFUwejlodmZPSVkzTHRsTVJHTkNVb25QaS9KR0RMcXBHNU9X?=
 =?utf-8?B?ZG9nKzY3d3dNa1BSRTZ3aG5aSzVQRG1BcThnalUvaWFjRkJjOWhaNHF6d0lG?=
 =?utf-8?B?NHoyeXlDSHpHcUF4OVZNVmVCOGNNVTZoVmUrdjk0VWtLZmQ0SFFTWGM3eWVH?=
 =?utf-8?B?R0l0b28rQ2NuWC9YY2NPUW1mcGpMbmRYNlNkSEs4VHpxUENSQzRlN1NNVVhP?=
 =?utf-8?B?ZGYyV0dKZU8yWE1BSElBNFBnbUtoNG85SFNZL0NxaktLU1Z4UDlEQi9EU3pP?=
 =?utf-8?B?RFJDdi9TdE1GWG43a2VXelNpYUNsc0h0a0VzR3I2Q0JCdm5DeTltRDZaN1hC?=
 =?utf-8?B?NCs3VDFlKzB3dVM4MXl2aWRsbjBvWk1XSnRXN29ocnppakU0MExUM1hNSjZB?=
 =?utf-8?B?K0NKR1RyY1lHM2tzVUsvRXdtTWdFSitZMVoyTmxiRHluWEcrL1hKK2hWVzlL?=
 =?utf-8?B?SVdoejJCS0NFTFVLWWc3UFlPM0REQWMxb2VCcFVvS0o1R1dSbkpYQWlkYzFG?=
 =?utf-8?B?ZVdFdlFhRUFBUzBZa01hTmxqbEFvTkcvR3lkaWVlMGtBUWpIeFN2UWc2ekFY?=
 =?utf-8?B?VmhCKzJ1akdsaEJFS0N2Rm5UY0RIdkxDVU9oRTNmWm5tZUprcGZ3aDBhaHFY?=
 =?utf-8?B?aEJXYkhUb0lJUC9UNGxEbnh1MjVvQlRTUEFKTk5TY3NSMTFEUkJrcmhFRDA2?=
 =?utf-8?B?UDVIcGFOU1VlZisrTXNLMDZVdVNxODdKZktkYmRQeUltM0FTMXZmV3VENnR3?=
 =?utf-8?B?YVhicTlGUDE5OVpqS1o5UTVCajZBVG1hZUNIazRCUi9LYWllVDlJa21zTmtT?=
 =?utf-8?B?alFicnE4emlhOEkvVHNBaXFaWnBac2Q3RU1MNkxZTDRBeDFHandsS3FVdEFH?=
 =?utf-8?B?akFKb2pYUkxZaWVGR0p4QW9vTlJCU3FwRFNFU1paSWM2OUJjUlN5SGhocXlw?=
 =?utf-8?Q?Q3gdkHtdoNR+OCyrwmBwVsWNG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ff2850-1a34-42dd-94f0-08ddb3582b8a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:49:02.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05nHIZR9e+GT2q4EWcoZmSgkqMxgb9MsHRTIGiP2OUE/i8TP5zh039svoivEDbSWhNMRDTtn6pYS/j/dF0rmwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936

Hi Laurent,

On 6/24/2025 3:00 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, Jun 24, 2025 at 02:49:36PM -0400, Nirujogi, Pratap wrote:
>> On 6/23/2025 8:19 PM, Laurent Pinchart wrote:
>>> On Mon, Jun 23, 2025 at 07:28:46PM -0400, Nirujogi, Pratap wrote:
>>>> On 6/23/2025 6:05 PM, Laurent Pinchart wrote:
>>>>> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
>>>>>> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>>>>>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>>>>>>> +{
>>>>>>>>> +     struct ov05c10 *ov05c10;
>>>>>>>>> +     u32 clkfreq;
>>>>>>>>> +     int ret;
>>>>>>>>> +
>>>>>>>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10),
>>>>>>>>> GFP_KERNEL);
>>>>>>>>> +     if (!ov05c10)
>>>>>>>>> +             return -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>>>>>>> +
>>>>>>>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency",
>>>>>>>>> &clkfreq);
>>>>>>>>> +     if (ret)
>>>>>>>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>>>>>>>> +                                   "fail to get clock freq\n");
>>>>>>>>
>>>>>>>> Let's try to land
>>>>>>>> https://lore.kernel.org/linux-media/20250521104115.176950-1-
>>>>>>>> mehdi.djait@linux.intel.com/
>>>>>>>> and replace the code above with devm_v4l2_sensor_clk_get().
>>>>>>>>
>>>>>>> Ok, we will verify on our side.
>>>>>>
>>>>>> We tried using devm_v4l2_sensor_clk_get() and found its required to add
>>>>>> support for software_node to make it work with this driver.
>>>>>
>>>>> Why is that ?
>>>>
>>>> Its because the i2c_client device is initialized with swnode in the
>>>> x86/platform driver.
>>>>
>>>> https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/amd_isp4.c#L235
>>>
>>> So there's no information provided in the _DSD for the sensor ?
>>
>> yes, camera device was not properly described in the current model, we
>> are going to address this issue for future models following the MIPI
>> DisCo Imaging spec.
> 
> Any idea how far in the future that will be ? I suppose it won't be done
> overnight, how many new machine models will get to the market with a
> need for a platform driver ?
> 
We are aiming to have MIPI DisCo Imaging ready for models based on 
ISP5.x. However, I don't have specific information on when the ISP5.x 
based APU models will be released at this point of time. We may use the 
current mitigation using the platform driver for the launches that are 
based on ISP4.x. But, to be honest, I don't have visibility into future 
ISP4.x launches as well.

> Will the Windows driver team also switch to MIPI DisCo Imaging ?
> 
yes, even the windows team intends to switch to MIPI DisCo Imaging, they 
shall need to coordinate with MSFT to finalize the plan.

Thanks,
Pratap

>>> Looking at that platform driver, it matches the device based on the
>>> sensor ACPI HID only ("OMNI5C10"). That doesn't seem quite right, I
>>> think you need a DMI match as well. You can't assume that OMNI5C10,
>>> which identifies the sensor, will always map to specific platform
>>> integration data (connected to an AMD ISP, using a particular link
>>> frequency, ...), can you ?
>>
>> Initally we had dmi checks, but as the driver matured through review
>> iterations, we switched to ACPI driver approach and felt the bus
>> traversal to find the matching HID device and dmi checks are no longer
>> required. The (_HID, "OMNI5C10") used is specific to this platform and
>> shouldn't be impacting other platform even though the dmi checks are
>> skipped. Please see [A].
> 
> How do you guarantee that the same sensor will not be used with the
> OMNI5C10 ACPI HID on another AMD-based laptop that would require a
> different link frequency or use a different number of data lanes ?
> 
Currently, no such scenario exists AFAIK. OMNI5C10 is tied to the models 
based on "AMD RYZEN AI MAX PRO 385 w/ Radeon 8050S". We can for sure add 
the DMI checks if really necessary for the current or future models.

Thanks,
Pratap

>> [A] https://lore.kernel.org/lkml/8d892845-e134-4553-a6af-55d785c1ae98@amd.com/
>>
>>>>>> Please refer
>>>>>> the changes below and let us know if these should be submitted as a
>>>>>> separate patch.
>>>>>
>>>>> Mehdi, do you have any comment ?
>>>>>
>>>>>> ---
>>>>>> @@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>>>>>> *dev, const char *id)
>>>>>>             const char *clk_id __free(kfree) = NULL;
>>>>>>             struct clk_hw *clk_hw;
>>>>>>             struct clk *clk;
>>>>>> -       bool acpi_node;
>>>>>> +       bool is_node;
>>>>>>             u32 rate;
>>>>>>             int ret;
>>>>>>
>>>>>>             clk = devm_clk_get_optional(dev, id);
>>>>>>             ret = device_property_read_u32(dev, "clock-frequency", &rate);
>>>>>> -       acpi_node = is_acpi_node(dev_fwnode(dev));
>>>>>> +       is_node = is_acpi_node(dev_fwnode(dev)) || is_software_node(dev_fwnode(dev));
>>>>>>
>>>>>>             if (clk) {
>>>>>> -               if (!ret && acpi_node) {
>>>>>> +               if (!ret && is_node) {
>>>>>>                             ret = clk_set_rate(clk, rate);
>>>>>>                             if (ret) {
>>>>>>                                     dev_err(dev, "Failed to set clock rate: %u\n",
>>>>>> @@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>>>>>> *dev, const char *id)
>>>>>>             if (ret)
>>>>>>                     return ERR_PTR(ret);
>>>>>>
>>>>>> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>>>>>> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
>>>>>>                     return ERR_PTR(-ENOENT);
>>>>>>
>>>>>>             if (!id) {
>>>>>> ----
> 
> --
> Regards,
> 
> Laurent Pinchart


