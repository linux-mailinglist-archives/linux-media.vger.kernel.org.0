Return-Path: <linux-media+bounces-47551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B750DC77A3E
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 08:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EF76B35F5D2
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD753314DA;
	Fri, 21 Nov 2025 07:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L/QvR4+y"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451261D90DF;
	Fri, 21 Nov 2025 07:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763708674; cv=fail; b=I82kM384sKrSpPwV0XXiFjfRe6BUbAac3RUlCSJ+FHXFOh6QDLHLx5S3kFmuYVr+kbfWKkzdr9xgioTuIA9xCnCg3dV/CzcAOJlOFdrcsQfHgZErRj5XOnWFgD998m+SRs35M+feCkkaYJQGGUHrO3hoFBLGLTkAcOey1UdMzVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763708674; c=relaxed/simple;
	bh=bgNuxDl+dww7bfnBDh4gwsnpQcCdDqBFXqcVpdYsxPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C68nz9vX9qMJNV4auitvRBVibfB5W2yNju586xs34iW8JDm15isYqCiHTv6mBFozShfcMCz7Gr/OxAYIJVW1o0iWROH9uRCtl1Ytd7Dyj3SmX83iucmRqJD3MGJNicDiOJFwVBshWJunH5O2m8wbYmldtPalVXtVVqaYjNygWoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L/QvR4+y; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtY2YK2Q9sNwRL59hrMnpoC94QeS6EwdcDyH9f6onFNPlQt8jmBFCHy4rfdIMvFGcA0kICyickX1rzEJPRIcMT68seCb1IO1ZUd0P68V1ENvN8cSI61ocZzCrEh4gftZTqt71gDJY6YDAsPMQAJ2W/tmnpo4zzT9FVGt3FSZeLbKod6FRDQWKjt7swMwfmWpzZ9CS7We1i5qV/yTotZ6/exR4i+LlB7uDo2Xf77wZrG/ScfcqRHs8LURvpcUIvn7SIBr082xJt/mpmqyaWDIL7ulbbNvI+ZJyVNJeX7/GudIHoKPjXjVmKUmRRxkmVBa6hdap2QumZ7YuFO7ElyOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgNuxDl+dww7bfnBDh4gwsnpQcCdDqBFXqcVpdYsxPw=;
 b=xsmUxgTSxo+zK7C5ZM2Fx00pvM6jFoGLifZj6r0PLFx4KoCCVACacHCcR+yA0vipOujF052Ex1NFI81rRGcJykJPhz5/jhD7fRIe2R3Ui/z2EFPqioLNZ3yJZAIbK1WrF35cG1SUhryckOawvEhSG/1rdMJf9bFyaDvMj8jD1Q8BZkTTeELAqjeuxiGzTgT8ki0+trfZcVQGNZLocnzyWrbJFJRSxWZCWoAGUxOQwU/nMfRbxpejZEnxyMu6QMGiBJpsD7LZniGeotqQzIGINm6nPgshB0R/KDQ9IkPk/OTxaSR1Y1pgYefvKNA2lVqjIwezFVpWPZFYI9QPwRiKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgNuxDl+dww7bfnBDh4gwsnpQcCdDqBFXqcVpdYsxPw=;
 b=L/QvR4+y+RPrwAhJsKqYmqlOt1htIuZr5BiHG0NtbxBqWppgLHUIuZbJNbmWXyoeYStLk/jbx86sr6arWYWYcvG9Rnv4GkyJD+W6EF1H3pGyhI9BuHvtRE2ntJV0UgQfVjvSpOwcPqj3THvwIBFINue3lgoJpAo0/H3E36qcYEY=
Received: from SJ0PR05CA0173.namprd05.prod.outlook.com (2603:10b6:a03:339::28)
 by DS0PR10MB7523.namprd10.prod.outlook.com (2603:10b6:8:158::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 07:04:26 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:a03:339:cafe::cd) by SJ0PR05CA0173.outlook.office365.com
 (2603:10b6:a03:339::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Fri,
 21 Nov 2025 07:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 07:04:25 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 01:04:17 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 01:04:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 01:04:17 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AL74BpX851675;
	Fri, 21 Nov 2025 01:04:11 -0600
Message-ID: <99527942-cfee-4cf4-b940-2095d65c8658@ti.com>
Date: Fri, 21 Nov 2025 12:34:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/18] media: ti: j721e-csi2rx: Move to
 .enable/disable_streams API
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <tomi.valkeinen@ideasonboard.com>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-9-r-donadkar@ti.com>
 <aR8MOiFowG8E3_NJ@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <aR8MOiFowG8E3_NJ@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|DS0PR10MB7523:EE_
X-MS-Office365-Filtering-Correlation-Id: 8badb048-8905-4f9e-43d7-08de28cc34cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWc0QWZVbkhvaTN2Mk1ZaWRENWU2K2RBU0RiS1k3UmFkL3pFWHg4MDlzUHlt?=
 =?utf-8?B?YktJQzZaQk5hOHNLN3haeGFJbjJnWWFLbXRCYm40STlJd3p0SjJ2di85U2lD?=
 =?utf-8?B?SVRmdmR3WjJkNlNCVmhEazRTVXVhN1N0ZTM4VzhFK3QvUUphOTJzN0JET2ha?=
 =?utf-8?B?TFRjRWJNeG5aTTR5LzZ2WGtkNWhpRmhTSFY4VytVUEJxU2MvNUQreGRuSk1q?=
 =?utf-8?B?cHVQWFVkVDRrbGRLTGd1M0NuY2w1RXdzaTQrZzV3elJpcFVsemVRNFVwWG9r?=
 =?utf-8?B?Zy9TN1BUSFNNOG5xc2dJTzhBUmtIdDVYQyt5ZWprT2xKeWNGZGs5cHdvSGJI?=
 =?utf-8?B?RnhDZStBdnZnRmkyYXJZR3lXSHViU2RlbktIRmIzbndyc2hGdTFnSnVDRTVE?=
 =?utf-8?B?YmM3MDF1ZTZJOGVPTGFjLzJpZFdwN3RkRWtwb0hkK2txL0V1R3hEWWN6WXM0?=
 =?utf-8?B?c1ptOTB2YXBkOFhFejR2RXlRWjVZcmJuOEpjY0twTGxIc05aUmVMVFhMeFBu?=
 =?utf-8?B?Zm80WkdJbk92bnBsNTB4NkcwZWhWUEpUcnFyejZzdTNjN3Zqd2Yyb1d4cFVG?=
 =?utf-8?B?N1F5bUV3TEQvT001czhlSW1KeUVoRUprVEMvRzNXcGJFMXBjeUs0UjF1bHVV?=
 =?utf-8?B?Q2tDZFFuVCtpZE9HcUl5SCs3VUdjbVk1OFBrcm0wYldOOUtWTDlqaGxacVh5?=
 =?utf-8?B?R20zYkFqc2VLUFN0b3ZqQjlPMTBQQ1F2SVNsYzhjL0FQeWJhUnJyQWlhSmhw?=
 =?utf-8?B?Snp1YjhBUjFaSVJSeWdjRWRLdW1ZcGxCWTc4Vi8vVDdWZGRLR29Xc3NWY3Zx?=
 =?utf-8?B?dDZ6aDVmeVRKbFp3UkkwcFlDdUVJall6bkludnpLaGoxcW1yWEFSbE9xaXZr?=
 =?utf-8?B?QzZudDB4TjNzVW44QjNqZVNEN1N1MTNNcnlOL04wVGFJMkNKK1NRRmJldVdG?=
 =?utf-8?B?bXI4enpVdHVqOFg4MTZhTTgwbUd5czRCSkhQTExhcUp5WVZEaHpCYkI2RjdL?=
 =?utf-8?B?bVZLQlhoWVEzMW0xM1JTMDRvV24wS0hFRDgwb0FpYzFhSGN6ZVl6ZkpKMmFs?=
 =?utf-8?B?dmpYWmE0RkFRbFJXUWRSTnkvT3hoMDFnK1h4QW5kRGNWK2orUysvWDNNeEc1?=
 =?utf-8?B?MW1JSnFKaWdKdTUxMGhhRmYzZXMzTCtzcE1mNHlZNWpkTnZtRW80SnFXV0NO?=
 =?utf-8?B?bWJLVTBBazV6b2ljdFk4NzFubkM0Ym1wZ0xxZ0pSMEVSUkRBRlFMZFdoWHdZ?=
 =?utf-8?B?SVZ0dC8wVFlwcnF5YzBjSEp0MHFuYUdEbVh3Sm5hNklKWFUydWtYVXE5ak1M?=
 =?utf-8?B?WE9HRkFNRVgzNTlHUlVYSUVFRkVZL3dGL0I2K0R5RW1vU3pOS2ZMYzBzc0xS?=
 =?utf-8?B?cUF5dHdwaVF4LzU0UGd5RkY0b3FoSjBYWCswQ2UyM1paMDQzei91RHhJa1By?=
 =?utf-8?B?TjhiRHVnakFGeENQNDFvaW9kelpEY2VVZUhwRUdUV2xPQ2gzODExZjRRT2F5?=
 =?utf-8?B?a1BucFY4M2JqRzYvVTVCZEpmZVhXOW1ZNzNSakhhaGhLc05rRFdVbjFMQk85?=
 =?utf-8?B?S2FjQjdYTkNHcWo1R2xMTjY1YnM5eUl3bGpkSEdwMVhxMDR3eHFFQ2RyZWxa?=
 =?utf-8?B?TDZDQnlaSWxQZkNwTnF1V0RRUjNuZDhRS0ozdGFzdnVaWXBaM3RHQWZaa3Np?=
 =?utf-8?B?dUVXZFU0L1d2SGZpcjFVYWtYT2kxZzFzdEZ3ZFBzSUlJUjNFdm1YUGdIcDNG?=
 =?utf-8?B?M1E2MUk1cWJUZzNzMm9nTlh3ZEYyblArNXJFTm5URWFrZUs5TUZUVUJNdzVR?=
 =?utf-8?B?ckwwcEFuK0FyUXd1YzlQOHpaNTUwcytXci9PdDgvUm1qNnNnZHJwR29KME1U?=
 =?utf-8?B?S3QrbXVzV244TnlIWVBVWVlSY2ZwMUJ0UEF2Um50TXI1cDg2V3pwWCtLRWhu?=
 =?utf-8?B?cHkzL3p1L3BXbXhNZU5NODRJSXRmOE5VeVJzTDA1bC90VFpOdDNDcWI5Z1ZK?=
 =?utf-8?B?Q2FMOWFZa1p5aVJBNVErSC85UGdjUTZHSHFhaXlLK3BmbXdUdGZ2Y2J4UmhB?=
 =?utf-8?B?VlZXNVV5ZFZqaDdvT3hGWWV1VXh3anE1RmV1MFN0U25HMExremRyYktkQUVT?=
 =?utf-8?Q?iwpo=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:04:25.6516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8badb048-8905-4f9e-43d7-08de28cc34cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7523


On 20/11/25 18:10, Sakari Ailus wrote:
> On Wed, Nov 12, 2025 at 05:24:49PM +0530, Rishikesh Donadkar wrote:
>> Support the new enable_stream()/disable_stream() APIs in the subdev
>> instead of s_stream() hook.
>>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> This addresses my comment on the 6th patch.
>
> Shouldn't this be merged to that?

Sure, I will do that.


Rishikesh

>

