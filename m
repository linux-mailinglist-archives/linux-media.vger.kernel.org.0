Return-Path: <linux-media+bounces-35836-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF43FAE7095
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 22:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33C95A4245
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 20:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2444C2E9ECC;
	Tue, 24 Jun 2025 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mAiq8Cmc"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA092512DD;
	Tue, 24 Jun 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750796668; cv=fail; b=brBT2JR/OKBSyraYxh70R2W5t+7EMtUfHwu5fS9PjiPXAGH5VsX0c01R/mFnLEDqqE2xYQEPUvJRbYQJXvSW3xkjfEZ5oIrXF0nW3NAGNO0Kp8XEBiBHTdbaI3wxZHQL+5uPr8Kl8d3QfhLx8ThFcIQXpHMFzmbb6XoTpFhBWLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750796668; c=relaxed/simple;
	bh=UU04REGXC1jgAizfwF8XFPJfydgVqq1JiVlJCGeqfFI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X7o4DxdkuHTOREJ5xrc7HHqZ0X+pg2prQl/dn7td021FaPAavK1xi9jIh1f/k0lKBsji0uBdfHwYhpxFkUaZTWUGcWX2YpGJhiSAmM4eGWGU228FVmdAY5HUe0bAnglsOzXcjHSPqiRhIkSNEN7/nInSVKIks6/cjy6qr3fNeMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mAiq8Cmc; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGRecN8FiduLOK75w9khmTLscBeorHgS82SbJAObJL4yY0xFBgAUudscGIBZpkMMBhyBwk2bCv9gTnjq5bj48d7W0jJy3U/ToRKVf1FBxbRHu5OySKcCehfULL95kvfjhib5kmarI/esDEc+iE5IhL4sB9OF352jrb9Pw2dFXhSs1AJO8R3fZTLABF17U3ATxtw+GnWkK34Pradn/qhDiAM1Cp/cTAMBbVX5+VLIcXn1qAZxeFrqdEd5pCkW/vVZGBeH1NKQ1toz/qF88JPUELmHg3jJ8axf9mrkUbBr8B/b8MghyUM5L+I7HRwAWOG6Hfe7T+s0IoFoKWsF3L75+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL+zGerFeSnXS64G8K3LHzli7lcyC6g5eaZhmtwKL10=;
 b=wStgVH5ZGAPA7stxKVTT3bqn/jdkNOXyCYhKPVmLXqiQSZsMXwnFqWwY6aE4wanFcR1qyX1E6JYLuzHAiqVQPym8++TJEZ8TWWK4AjpcAJ2JJ8ApZgdRfnrBZilrvEvBpNZHWbpi/jpRkjYUb1EmqfslmPnfg8vpf7fJ8L6YZIvzcaLtTpOxWiHgtAutNoNlsAsjwHCP3++5+rVJ2XSsNROfb/4HC5632JAG/6MUdzXa6Qsf6OCOd1idYNEL9/c3pR4qyLcdpKOJJxSJ/BSyWDws2LfyPOEeeTc3o/rHLT83iqbGjvuG+duPkUagJnJ9PLKzIdOZCOy1CPyyXj/SRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BL+zGerFeSnXS64G8K3LHzli7lcyC6g5eaZhmtwKL10=;
 b=mAiq8CmcamSzWAsper3Cq9vYeBDvPXtZZRJ9NP11SJ3Q9oAnbjrXqHOew5o5g+NzeTUKED7iNXdWsAWiCC/y2RWiGj8PBrG4Gj6louQUSA6NsSFCwqa5JnIcSMRl2RdxFIVMWAdf/6FzzXQQW3p81YEmL6XOm5g71ht9Puy+LAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MN2PR12MB4336.namprd12.prod.outlook.com (2603:10b6:208:1df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 20:24:24 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 20:24:24 +0000
Message-ID: <0efb8ce3-cf71-4a49-8ca9-735019a3a7d8@amd.com>
Date: Tue, 24 Jun 2025 16:24:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, Svetoslav.Stoilov@amd.com,
 Yana.Zheleva@amd.com
References: <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
 <aFqQEwdzSY123xps@kekkonen.localdomain>
 <aslodzamkbjm6n6oherakch2nyltl6mnncl4mzr4o774oolr4t@hpegah7dq72g>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aslodzamkbjm6n6oherakch2nyltl6mnncl4mzr4o774oolr4t@hpegah7dq72g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::23) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MN2PR12MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: b1794e68-5a7a-40ad-54d4-08ddb35d1c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWQxRTc4NW1Od0pBODhuMG1mV2xQMWxBbmk0N0ZWTkpxMVdCRjEzeDdIMHRs?=
 =?utf-8?B?TTlMWHlxNmp3RnNpMm5KVHVWamhvVXBFc2xhbTlTcUcvMi82VEc2UlVSQUZy?=
 =?utf-8?B?Vyt4MHNPcmFsMGkwSGZCQmRwVXhXUzlCekZ0MXBHbWFQTjd5TThIcCs5TWkx?=
 =?utf-8?B?TVBnWFlLMVBFNGtUdWY3QXZwMHR4OW52YkQvQWlmUHFOdWZJMzRsQ2kxV3Zu?=
 =?utf-8?B?MEZGQmxmVkYvbkZ4QW1EWmZYTVpVOXQvUTRBMW5GSmVFeWhsTldQMFdYK3dT?=
 =?utf-8?B?M0VlRW5rMVhSbVEyNHlUbkN6REZLZlAvSHRrdFRiZnBWRXI5ampUVlpzeVRI?=
 =?utf-8?B?Skg1TTArSXpZUXl4L055ZW9zSkpKWXMxWm45UGtQMk9BejZMdzF0MnVJQkRD?=
 =?utf-8?B?NHNzbXdkZkQ0OHNPN3p1NWcwUUlUMXlMVjNvdjdNS2tRem4velBBTGo3Z1kx?=
 =?utf-8?B?MVhpMlNrL3hPbDVYQ1VoTFhEWmhDK0pzM0dmQ0czWEhLL2V6Q2UrVytJMDBQ?=
 =?utf-8?B?eFlsdy9oRHR5NGErUThIUmlwQXIyNTlUaXhuM2ZUVVcrL0ZqbmRtUldPTXJQ?=
 =?utf-8?B?aHA3VUh4WkRPM2FoK1VFc3VFZFdSK3p5d2FnQUtENlZHVUVpTnQ5czRuTTVv?=
 =?utf-8?B?Qm83ZndHUXB3aCtsM203NE01RGtTR3NJdlZKNUxVQi9WcFFwMzNqVFNKKzFL?=
 =?utf-8?B?TWI5OXh5bTNqeEdsR2xuSHpoZ0tzV2JzeEVpQ0ZWY0djSlgrTk5pWTNLMmxa?=
 =?utf-8?B?VTJQSG9SMlJQZXgrMlNKNzNxbzd0VE5BQVhQdTJrdWN4NnJ6ZnUxa2pkZ0tu?=
 =?utf-8?B?VHMwRXRMTUZkMEROayt3cGUxSWNubStGQTI5ZjZvN3lpVFhzYUVXcTZUekE2?=
 =?utf-8?B?TzdkTFBIbjlMODViNG8xa3k4RE9DNEF1TnJyYUF4Y2FlWm02SEJjbUVab21P?=
 =?utf-8?B?S1NOV1BBMUdMenpTZzR6c1lBOUVvSWcrNU11OC9zSXRnSE1pRmFFSEhmQ05p?=
 =?utf-8?B?Ym9RU0R4VUtoVUFYL1V2NUtjU2JTVytwcDNJeWZPaHdET2grTXB0bythNzJR?=
 =?utf-8?B?Q1krVUU2bGYra0UyaDF2TmI4KzAxdW9nU2ZuUDI0S2lTRzh0cmwxQ2FGQjhr?=
 =?utf-8?B?Wk1jOXdXcDBMN3lOczJFM1FvdnVFd2RoOXE4anU3MmZTYTY3QVVkejdOM1pY?=
 =?utf-8?B?MkV0UGhzczVINWtqUGpvRnlBaCs3dHBiNmhmL3BUbmRsUy85RC9ndFJscGtp?=
 =?utf-8?B?MzduL3FvR1dCL0lkTG1XNzZtbUhDZWF0L2VHV21kUzN0S2xKRDhsc1JFNkVZ?=
 =?utf-8?B?M21meERDVVdMOUYzSGFZVFMrV2FhZlkwN25tUjFxUkxxQ2VYa1poekxqVnJY?=
 =?utf-8?B?K1NaWHAvQ3l5R3JMTDNHM2YySm1vSzV5eHJ6OStLQjVXNzFhTjc2ME9LcTFl?=
 =?utf-8?B?ekVqaWltYVM2bmtEemJWWjJLaUxtVXNXVXNWejJiTjN2bW04azUzUnRzcDdZ?=
 =?utf-8?B?U3NTNjRnaWM4QlI4dkNMSHUxSWwxUTR1Y2tMbVAyUHRaRjFXbTJwSDRSbDFX?=
 =?utf-8?B?VTZ4NVNKM3JVSkcxM042ZjI2cjVhUDBpNWZZN0w3M2xiWkJYSVdqOUhvanpU?=
 =?utf-8?B?NFpINGV4SXltU2QxdmNJQ3RuUlZZZEhZT2tNcFN4RmFLZlJNWS9uY2wvQ21m?=
 =?utf-8?B?VU9Sa3Bkd01YbVZ2SzZrVnFxbDcrZ09wcVptTFBBQkJaRHEvcklpd0w1RkNU?=
 =?utf-8?B?RGlTaDJzd25lb2pwbk5PczZVMXg3K05veVpPaHZjSWVvY01WTjhnUHQ2MGls?=
 =?utf-8?B?eVJoSkJqR2ord0JtODBKTXNHaExmN1FxYmUwQ2o1MUpCQ3BLUFM4Z3hkczV5?=
 =?utf-8?B?Ti81NEFzSm5xQjN2TkJJZ1d0UUV3MmdHYTRWSkdWNi9BWlhaRWlSQVJtQTVv?=
 =?utf-8?Q?dk/DKddghUY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlU5MWdYYTIwcjlCVSt5Wkp5NmFRd0ZGUEpzdDV6elRJVXZBVHhCc2pQMitT?=
 =?utf-8?B?dUQ0SjBZbVd6Unc0WGsxL1BrU3o0NmhPQWVKa3hKSklETEZlQkk1dHgrT3c3?=
 =?utf-8?B?OFR0aUZubVFZdTlsc3pXMW50VGxJclZKaW1Ld1RuNkF1eUYrdG1kM0FFajFp?=
 =?utf-8?B?ZHpGTk9iRjdhVDFzYVkreG9hQ2xRMGFOQm10SW9nUmhSM0g1SnpxMGlVK0NJ?=
 =?utf-8?B?L1ZIb0FBZERZWDRzdW1tUUtzV2Q0YWhBQ2NHWlNFdHp5TmhRMVpINHdCNUsx?=
 =?utf-8?B?MWFaWGVKTlp5UzV5ZzFzckluZndRQTZaMnBLak1TeExoZnRIcTk0NEtCOFlr?=
 =?utf-8?B?Skg1QTQzdEhQVkZnekV0RC9USmt1TnRoNFVKNFB2Z04vMFlncnIzMGV6TmZm?=
 =?utf-8?B?VDU2T3dPeHIvM2NZazgyamk1UzBoalk1TTc5Wnl0Z1ZDL3RsOXVMT0cvVUxo?=
 =?utf-8?B?aGdlL01seUNVcy8xazZDVVpIMWZ2cG9BS3A5Q1o3MkE4VkZscUJhTEJOSGZ2?=
 =?utf-8?B?MEk2bEhNdVJCbHBFQkJ3YjFjdERCOUlvOGs4M1VXYlM5eWJFbEZ4QTFMYmRz?=
 =?utf-8?B?eUNpU2t6dDg0YWdUSHMvbU1TYVgrZlRqdXRiUU1UdmFqQ3lzbWRlUGFKMjA0?=
 =?utf-8?B?OEhvdE5aL0FOTnNsS1B1ay9CUnZJbXJDRnp1QjBYQjNSbUxDelp4N01MbjND?=
 =?utf-8?B?NUdEOW0vc2MvOHM5WnJlemswN1FtY2NWMStkellsdDcxMzJVMWZBcDA3Nlc5?=
 =?utf-8?B?MU0xV2xqbTZWTnVGTjZ0TWVub3hDajFRc3hLekpXR25ERk94dU5IeUd4bGdt?=
 =?utf-8?B?aUI0QmY5dENvOUhDQ2ljSk9DWXNBYk96d3N3bVNyTEgwc29PaEkxQVR4aE9D?=
 =?utf-8?B?Y3pkOVY2ZjdJY3Z0L0xEdzlLb3JMOStoUEc3Z1Z0Ym81eXBpRXc5cVNudlV6?=
 =?utf-8?B?OC96eUVDVjFRaEVvNWFuNWlqUFFnK2FhSUJCY2FxNm9wNjdhZ3Yrd21jMWRq?=
 =?utf-8?B?TFcycXpCVDIzeXpWREdLSHNCbWJGWW0zZDFYUUQ4d2VBWTlReFAwNEFUN0Zm?=
 =?utf-8?B?VHlFZmxpTXowaE9aZy9ZNVNDNy9Kb2VTZUhRU0I0a25JUVBEVU03dmtkM3d0?=
 =?utf-8?B?bEk4N1haOU0xYUp2S1F0QXhGbGYrSm1jSTA0dlNmZkJncmpZUnpsL1U0MGtn?=
 =?utf-8?B?WC9BUC9qSGk2cWU0d2Z3cVdYZXBNNUxCU3hNM1UwOVhKWGJnSERQTnBsZHU1?=
 =?utf-8?B?RXZMVDR5eEhBUkRWckdES2RBT1R3VUI5YWxXaTlpK0JZRGJrOVBIZTlnRUpJ?=
 =?utf-8?B?S00wdEluVHZBeHIwbFBGNSsyRHZ5RXZLbkkrVjFGbUZCYUJyMnVFeXcwVW5Y?=
 =?utf-8?B?UGdNbjhSNDRIaVJmZjU1dWNNUzU0ZzNlMXNXcWs0eHA5RU54WFIzQUFWV1Na?=
 =?utf-8?B?dFpHaTRsdk1qSkdRTU9qOUNTYk42aGJheU9JSnBKQTJHcFhiVitxdXdvaFo3?=
 =?utf-8?B?VWRVaHJzT0JnSW5KUnM2NTBNeHFKZlF5QjBpYXdnZSs5UVhCTS9iVlg5YU5l?=
 =?utf-8?B?c2VuYXlTWUxkSnI2dUp0WGtydnJHS0ZNL1RTRGxsSzY0S1JXSldlZzh1aWZO?=
 =?utf-8?B?ek81VUZmbkxsY2pqWG1vODBkQ0JxcHhKTGI4WXljcmlMN2Z3a3hpcFdWYThm?=
 =?utf-8?B?ck5uckxCczhOeUpYMWZONVdXUVVTT2Rqd2dnTDlFRmJPK1E3dnFuQU5vYXEz?=
 =?utf-8?B?NldyYmtTMFUreEFPZDRCMTd3Y294bkVEejg1cmwxZGkrMXF1VStSTW5iUWM5?=
 =?utf-8?B?Qm9wZW5kWkgxZGtJYVIzOU5sZ1ozY1dwSnRVZVFPMUIwT1E4bEY2dzdLaUF0?=
 =?utf-8?B?ZDY3Mklyb0hpaEd0UWJjWTBIZXIyM1JMb1c3eWNRUWEwS29JTnJmMGd4M09Z?=
 =?utf-8?B?Rk5HaFNVem9ieWdzYStnWW4xNUdibmdHZ3YzNWMwN1BPZ2lvTU03Ty82SUlE?=
 =?utf-8?B?b1RFeCtUVkYwY2VuUGJCRzQ2MXFaK0h4b1lrUkVWT2hpY2hiUDJGK2RYUG90?=
 =?utf-8?B?QXhESENrZ21FYUdxVW1YRXVlYnlINy9ZY3FwQ2tnbUpqL2dTTFluQmlJQTIx?=
 =?utf-8?Q?pSFHM2Rss0p/BWPhbMbTfUkEm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1794e68-5a7a-40ad-54d4-08ddb35d1c10
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:24:24.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GUyztHbVZhbyqzMS3vRyGr51oZ48wSD/ZpdUjZBCWSCquSZYAihAR69X01IHzDRUBA+CblGOUnVbSQrlNOMYUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336

Hi Mehdi, Sakari,

On 6/24/2025 12:34 PM, Mehdi Djait wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Sakari,
> 
> On Tue, Jun 24, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
> 
> [...]
> 
>>
>> I'm in favour of the latter but both should be workable.
>>
>> Speaking of return values, devm_clk_get_optional() may also return
>> -EPROBE_DEFER. That needs to be handled.
>>
> 
> Ack.
> 
>> And further on -EPROBE_DEFER, I think the helper should return
>> -EPROBE_DEFER if the "clock-frequency" property doesn't exist on non-OF
>> nodes. That signals the required software nodes required on Intel Windows
>> definitions/ipu-bridge or AMD systems aren't in place yet so really probing
>> should be deferred. This would allow removing the hacks that return
>> -EPROBE_DEFER in sensor drivers when no graph endpoint is found.
> 
> device_property_read_u32() returns the following:
> 
>   * Return: number of values if @val was %NULL,
>   *         %0 if the property was found (success),
>   *         %-EINVAL if given arguments are not valid,
>   *         %-ENODATA if the property does not have a value,
>   *         %-EPROTO if the property is not an array of numbers,
>   *         %-EOVERFLOW if the size of the property is not as expected.
>   *         %-ENXIO if no suitable firmware interface is present.
> 
> 
> Do you mean something like this in the helper:
> 
> if (ret == -ENODATA && !of_node)
>          return ERR_PTR(-EPROBE_DEFER);
> 
If I understand correctly, the recommendation is to return -EPROBE_DEFER 
on !of_node systems when the driver fails to read the clock-frequency 
property. Kindly confirm.

if (ret && !of_node)
	return ERR_PTR(-EPROBE_DEFER);

Thanks,
Pratap

> --
> Kind Regards
> Mehdi Djait


