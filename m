Return-Path: <linux-media+bounces-29676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2662A8176A
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B784633C5
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8FC253F23;
	Tue,  8 Apr 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uS1DdcHM"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75CEEB1;
	Tue,  8 Apr 2025 21:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146600; cv=fail; b=OZ+mHJe7+Tp9ag6Spmp1It0Ne5EqU6RntPpZni0lWW8oqucYgHgIc1GBjsR9RSUjFQE56ROoKzWJcoa0yM0VgJ/xf90a9OUaJ21M+O6s0OlHoLgZN3l3ZU0Yh4vV6yMGRqYMWgns0BwxP4fIDaIrLdhs4MKqsyl7tSu3hpeVuUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146600; c=relaxed/simple;
	bh=hrb5AMqhw6iA/eC5b1ByFKIFiXZrhfOQK5dfgMljGhU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HOMyrZ3b+K/Olu7wtJeTFBcAoV+rXmRjmFJL/x55oBSPj8WzbxkDcYkwVHYnMEB2OUW4N056+7pEEIapToVTOIl7L0I/L6QEzmdSoStUWCSmw8pZ3/TaacL9A99ayc/QS5Xa9ABUlG47QhhO9upgBJ4W/vnuvghvMmGjNLVaMVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uS1DdcHM; arc=fail smtp.client-ip=40.107.244.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQXPk/qACeKDtcrBe5lG46fl91Ek5vEdfWrdV5WFinbIM3pUZDuoExK2MLhfBQbq9NBAz1uvTwf6sHw955HyfdaMfp2DiEDCe55pJU0pz3xoQDioSSlhfk6nb8RI8+sN7vAW+4CQLG7Pl7VCeVhTDNkV72kXW8x+OTxQXQ47geV0kncmXSKkdp24ZW3Qp51fTojFmfwOfF6Ebvh+ko1kGNQLoQblGFRO8E/FORRBine8RSqyjTMcBg0XfiQ9FiC1CdZR50mcxBnVVGeKdyYRL9iOflekexRpMKv4ieJrvlybdwqKiUIrgQ1RJ2Zoz15Kpn3hm3gLOnxc5uYezhMsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLOtPdlyX37J1BHkZpXG6RdGyxTOR8XQgMxE1kDIHSw=;
 b=nukghL5cnI9m0g7dZpkekOgCTtV8SJFR06/vAKW40R3uuAHaRocGYkblbKeDkBNWqiFV0jx58wigylbIi/u5svGiFHxkaNGaecc4aHobvQCIf9zFJTQE+HtPrDhadIxTBGmOdr3iAe8bol8diDfNOA8i+59Vfi8e/5hfibJ8R+Rp4t0c7fWoJ8eSZDrish9o3mKsl6fdSiz2btbgDjSfAIln64N/OwkntQejF9sScb6EKPkuKkZ9cfKF7ggNSkqCWoSwr0pfvSnHAwDUNkubkzf+8jFbm9hGBgYUm6zXq3w/AjRcOuWiznCSd3aiZcU9MF3Hjs+Kq4G0WoEAGjeQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLOtPdlyX37J1BHkZpXG6RdGyxTOR8XQgMxE1kDIHSw=;
 b=uS1DdcHMquo0cyzlVenUjaxkkm4Fm65m6NGfkNs50ZjvdwUBlPwr2lK+6MiMQX9ZSOFszPFlFPtpLCixq29iP0xYZauqWArhWdM2UvwGks5vojC/A2OZgCoOF8D3Ny+BIOeCfVTW5rcgyTjtDoYJlnmhLmgr6EpaGYyQ3kHdxy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SN7PR12MB7450.namprd12.prod.outlook.com (2603:10b6:806:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 21:09:53 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 21:09:53 +0000
Message-ID: <3134809c-720b-4033-9cc0-2ecc29da645e@amd.com>
Date: Tue, 8 Apr 2025 17:09:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
 krzk@kernel.org, dan.carpenter@linaro.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, Venkata Narendra Kumar Gutta <vengutta@amd.com>
References: <MhUYQD7uWnfZQAPq7VslFWPHOmx2B2UfAIpbMhLq1-7GC_i5bI2hhns_-ov_AAVpEH_VmDDFYkS5aOKBwnY61g==@protonmail.internalid>
 <20250328214706.1516566-1-pratap.nirujogi@amd.com>
 <fef11ce6-b3b6-4677-9387-13332b9a9d43@linaro.org>
 <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
In-Reply-To: <6ba024ef-4757-4db0-b12a-d56622329bb0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::23) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SN7PR12MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6337d694-08a0-4074-0e38-08dd76e1b4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDZJb1hZYzJadEhXVU9zcmZQanZPK3R5K2RZQUI1dnRCR2RoeW5OZ045OXpT?=
 =?utf-8?B?Y1ZtbU9lb1A3ZUtBWEZybG15MU5md0MvUHpDWHNmckZKQmtLZm52Ykc5dlFi?=
 =?utf-8?B?OXpqUU9vV3ZZOUtlVGYvMjVIREhwb09VcVBmeENFZEhmeWUvN3JuZ29tTi9y?=
 =?utf-8?B?eFhWZ3pTMURIRFk2S3B0WWMyVWN2T0xjWUxyZU4xUjR4YmE3cEo4T3o3U2xL?=
 =?utf-8?B?cFlSdFdvemk2SVlDVW5KM3plbGwwYkRTTTNDQjBUNTNSMEFmZEpzWVpEYStY?=
 =?utf-8?B?TGt5Nm9sRURDTWpOOHpMVlFwbHkyZFpLVFVITDZ4QnZEc0FRb2pkalVFNTZB?=
 =?utf-8?B?SWR0a00waDBWeVdBM2YrZzh0TDFDcHg0Y1dsakpmZldoS016NHcyYXgvSUla?=
 =?utf-8?B?Y21aVUYvMm42U2dLMEJhTlAwc0tnbThNZmlTVVp5WUdITjBVS1p5UmZtTGtt?=
 =?utf-8?B?cHBrOEhqS0Ivcm5QdU1hZksvTlVsYWZaOGQreG92NytidjJuZTM0VU01T3N1?=
 =?utf-8?B?b0FMV2FyRUR0VW5ERlp3OURyNDdLMDhxSWpKcVJleEtneHBiUHZ2OUNNMmFC?=
 =?utf-8?B?eUVSSWttSVhBeUg5RndlYlE4enJ3NHVCNHlDYW9uQjQyY3JRVTF0cTNCdTYr?=
 =?utf-8?B?dTJmVWdyM0dqbzJGZVMxWDc0MkVJQ3JpdFU4R1d2NVRNT0dtUDZPc25DZ1p0?=
 =?utf-8?B?UHZtY1NxMU9hcWs3NXl0Wlp5UzY2Tm40TmQ1U2E4T211NlJvQ2JJZUVsUitD?=
 =?utf-8?B?Y3huUTIrbVZIdzNuYjMzdmZrZHYxYUwwQ1R3NkNxL2xkUTlRbGRDeDdRQ1JU?=
 =?utf-8?B?SElTdFNnbkJHdVhtWkJBWEdwMkYzb2tiZHB0aFZIU1hKM2FSVXhaVzVxcFgv?=
 =?utf-8?B?RkFla25XSXkwSW1ncWlQYisxTEFaV0RiZ2swYVQ1NW03UEJibXFaMUVXc1h5?=
 =?utf-8?B?cTkrTDlYNUZ4WlcvMXBJOVVoK3JqMXNhenkzcjRzc09QY0s3d3QyMWFrWm1q?=
 =?utf-8?B?VXRxN0VyMlRyWmdDT0hqcEdERG93M2ovTTFEM2xOMklJY2N5L1VJcm9PcWVH?=
 =?utf-8?B?bmpnMHAzY3dDRVRTbXNPMXZCWDFDazNlZlYzbzdKM3ZOVGpwTUprUUNUR3Zz?=
 =?utf-8?B?Y1hnWnZDMlR5ZlprYU83d2RDQ1lGZ05XQmNRZ0N2VkhJeExreThwOTRYUjU5?=
 =?utf-8?B?NTlMcnNicGUrUTlmUWpqSm9ldXJpclAwWnRzak85TndKSkc2cGc1cENSSXB0?=
 =?utf-8?B?MUN5WGk3bTlJSjFkbUhIdTQ2dk5OUlRJaFhwb3pzOGFKWjA3djIzQmV4clRa?=
 =?utf-8?B?cTBGc09aeW11RHpEYjVwNmFtN3hFbDFnSUNKS2xzZXRUd0g3eVY0SzlDUXZT?=
 =?utf-8?B?QTBsZHJnY2psZ2p6UEhjYVNFSzJHckY5S2JGUFowRlg3aGI3emVIK1ZSd1Y4?=
 =?utf-8?B?TVpDYWg0d2lBdzlGUkluVkVPdk1PK1ptR3ZiOG9GU3Z6QlhOaXFnVnViRURr?=
 =?utf-8?B?S1BuRXhyelN3SVhVUnBIcEJzb0QyQzVIVk9aUDR0TFd6R20yNXArVVpoNHY1?=
 =?utf-8?B?MHpoYUU4NlNIZEJzU3JHN3ZvMkpkR1NCTUFvVTF2MmIzc2w2Z3YvSWZISVpF?=
 =?utf-8?B?NkVqTHhjNS8reUNVc3M5ajBCZk1PMys3TWpHMGgrM24zZnA3aENwTUNrc0V1?=
 =?utf-8?B?MHk3ckxvT0RCU3ZSTCtTMFhlbzNOZ0RUc09jUFBzUStxRTBMUVlTNWFYdHhG?=
 =?utf-8?B?NVU0MTg0UC9ORHQ3VmtkSlh4MDRPUllRQW9iV3hLOXJpczY0QzgrWTdTRVk3?=
 =?utf-8?B?VmZwTHNONllsc1NmZ0huZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTBCNVhkRlorZHFWaGRCTVFCdFc3NVFWZmF3dU5kdmtacVhVL3JwZTYrYmh6?=
 =?utf-8?B?cXRid0RxWkJoSFVEY25jbllZSEdtdStXQkZHcW13UXhpMzNBOHB1SmcveC9H?=
 =?utf-8?B?dmFlditoWlpCR0ozUjQrcVpLOEhjMFRQNHdRc0xRY1BtQXgydS9HVlJQNGUx?=
 =?utf-8?B?TSsrVStpMk1nc2xlWHFuMXNZMURFRFRmSDBlT1IxdEM5eGRuSmhOVlBqKzNu?=
 =?utf-8?B?eTNZWFAyUm94WXVtdzZrek1rTTlMcU1jRmtjM1lQK05qYVQrMUlRbStTNyty?=
 =?utf-8?B?Q2s0RzZaYjVraTdxUUpDRHJMWXNCY0FqUDlxczJzUTZHcDBuemJMbHJZbnlR?=
 =?utf-8?B?N0FLMGJzaEp2Qnk0Q3RZL0RuSWNrUFIzUmFQOGM0RTVkQkFUUnZuRXFhaFg3?=
 =?utf-8?B?TXNLS3F5OWJXbmplZTYrM1FZbCtCOWdxOVRCMzd0VGMyYTg1dGVEenJlelFo?=
 =?utf-8?B?Nzk0RWVxZytYeUdnMFVjRVNNYTRRUE9oM1hVVU1EeTV3Ni9VL2ZXMzlnYUhs?=
 =?utf-8?B?WTkybzVwbXhWVElkWnhnUzc3d0twMjJxUm8vM3N4NkNoSVdHbWNXWmNTSTFu?=
 =?utf-8?B?MGF6ZUdHVXdmazgraUVxTGtQYThVb2VpMHEzRVZGcHVxQnBzWXhlbVp0SUpp?=
 =?utf-8?B?QURUdFZpRUhSOGVzZDFpb1psdithd2VjWlRYanJhUlhML0V2UHY5ZjBWL0Y0?=
 =?utf-8?B?YkRvL3ZDWmNxVWpRUXR0d2RhQjVQeXRuVmR4MkljaUQzeUdhc0lsNlBDWWF1?=
 =?utf-8?B?eFF2U1Rwc3cyenk0eFBGTlZUWDlJVHQ4a2JrM1I3WitZWVlCMFpsQk8zeWp0?=
 =?utf-8?B?UFJjWmZTeitiMFpGblBNZ1k2TUVVcHhDWnY5TU5tZ3ZGTmU4N0dQNUFYMGRY?=
 =?utf-8?B?T2RnRHZjZzFmTW15dEdqaUgzZ2dXaWZNbWNDcm5SOWNsVHdFRzJEUGhtandv?=
 =?utf-8?B?cEtyMFo2eU9VSmRtS01EK0k3U3BZMDlNcnFVeXlCYjh5SlBCVkJVYXdZc1ZU?=
 =?utf-8?B?ajRjaEJzOE1PKzlOQ0svaWFGUFk3LytHVTRwZFZGQ0NHV3I0My9LYnRIQVJu?=
 =?utf-8?B?THBYR3h6MU04ZkgzZ3JNc2xVRFcwTFEzVHV2SEVBQVFFUitKQkxJbnhPZldh?=
 =?utf-8?B?UTZSd0VMWEZ5bEsvUUN2M3lNQXVTZk5mUU52Y3hTWWprVW9raXJxRFRrZFYx?=
 =?utf-8?B?RG1DVCtodzJNT0pZbTNsWDMwQmZiRW9sL09rTGd1TzhzYnFOdDg4bUFBSmdn?=
 =?utf-8?B?Ym5ObnJSM3ZWL3NqTUxNUHlocm5yUHE2eVlFRmVubXpQa2h2RmV1RGpNbXN6?=
 =?utf-8?B?elFDWEFyRUIySGZKK1ZDVmsvNTRFKzNrTmpjOTdZeVNaVmovNlp2d29oWGVX?=
 =?utf-8?B?a3ZQNWJIWTIwM2pyR3g1ZlJZSFhzQm1qYTVyNTVoQmRaRDlDQklPOEZyMHpj?=
 =?utf-8?B?d094OWRtSG0yTTdHR2E4U3MzWlEvZ0lpblFJV2IrUDBRZzRhUk1lR2VhWld3?=
 =?utf-8?B?RHNNRjlGVmZvaHk5R25LQnNwdHFuS2tpbGxBQTJLREN6V1dwV3lOTzdOZ3g5?=
 =?utf-8?B?dC81UHdpd1JTMWtRbVNDb0x5aVBuL2RoSUxoUHp1YnRRSHdEQVB0eVVEY1h3?=
 =?utf-8?B?eWpJVE9OVk9waEZFcFNvd3kvZy9xZ1Z5N1ZEOVNtcHhqelRTbzBSVEU3eS9P?=
 =?utf-8?B?ZklDc2w1Qy9FRWNKaWF1T21YdG1DandvbFp5T1ZacElDUS9xNEQxRUtmazBy?=
 =?utf-8?B?cWtjUVhhUXNQelYyaTZpWEJhRlliaUZoY1paRG0xN0JjMHlIUEJ5SVhxcXFW?=
 =?utf-8?B?bDN1bElCY25OSmVFVnhBM3dWQ0FZSTNPMUxOSCtIVlVmY0RFZ0RjSzYwR2NJ?=
 =?utf-8?B?d2tSUHk4TVl2RStQUUY5T0xXNjJ2ZmlEbm5iUVhsN20wRGFUdFNFVGtmVm5O?=
 =?utf-8?B?SUtiRnZtTlhKRVA5T1FWOENxYzNDa05Ka0ZIc1h2bUVaMW9ZdEVuR3FIeGtU?=
 =?utf-8?B?eVptbGZoMlBVZUhKQ2dhWDdja0lrOWM1ek9OaEJJTFhoWSs1bGREVlRWejFm?=
 =?utf-8?B?K1pOdldZelg4S0xUTnJSK0Y4RVE3eWxIMjVwYnRtYStSQXdoOGd0aG56b1hD?=
 =?utf-8?Q?pxCxy4KbGSSKj/JUsEx3v4DGM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6337d694-08a0-4074-0e38-08dd76e1b4c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:09:53.1822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LYwKkyy24VWRiispvHcH60ZcJxrbYn6hcHE/Y0lWUDamWRKR3I5tE6cN4NLl+LGAKr3MdThVhRdWVXcmXLXcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7450

Hi Bryan,

On 3/31/2025 3:17 PM, Nirujogi, Pratap wrote:
> Hi Bryan,
> 
> Thanks for the review.
> 
> Thanks,
> Pratap
> 
> On 3/28/2025 9:18 PM, Bryan O'Donoghue wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On 28/03/2025 21:42, Pratap Nirujogi wrote:
>>> From: Bin Du <Bin.Du@amd.com>
>>
>>> +static const struct i2c_device_id ov05c10_id[] = {
>>> +     {"ov05c10", 0 },
>>> +     { }
>>> +};
>>
>> There's an IPU6/IPU7 version of this driver.
>>
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ 
>> ov05c10.c
>>
>> Perhaps you could import the Intel ACPI name contained in there too.
>>
> sure, will add Intel ACPI names too in V3. To be specific, I'm going to 
> add the below table in addition to the existing "struct i2c_device_id 
> ov05c10_id[]" table:
> 
> static const struct acpi_device_id ov05c10_acpi_ids[] = {
>      { "OVTI05C1" },
>      {}
> };
> 
I'm planning to submit v3 addressing the outstanding comments, but will 
not be including the ACPI device table for now. I  will take care of 
this in the upcoming patch based on Sakari's feedback to accomodate both 
ACPI and I2C device tables.

Thanks,
Pratap

>>> +
>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_id);
>>> +
>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>> +     .driver = {
>>> +             .name = DRV_NAME,
>>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>>> +     },
>>> +     .id_table = ov05c10_id,
>>> +     .probe = ov05c10_probe,
>>> +     .remove = ov05c10_remove,
>>> +};
>>> +
>>> +module_i2c_driver(ov05c10_i2c_driver);
>>> +
>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>> +MODULE_LICENSE("GPL v2");
>>
>> Why v2 ? Checkpatch will complain about v2 and BTW the IPU6 driver above
>> is GPL not GPL v2.
>>
> sure, will replace "GPL v2" with "GPL" in V3.
> 
>> ---
>> bod
> 


