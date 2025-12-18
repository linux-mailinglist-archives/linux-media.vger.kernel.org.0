Return-Path: <linux-media+bounces-49067-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE32CCB5B8
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 11:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 671A2307D375
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 10:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E07348454;
	Thu, 18 Dec 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hJ/bR2tr"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9729347FD7;
	Thu, 18 Dec 2025 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053505; cv=fail; b=OyjSawYwMEiFhjMt6wIJFsuVcfdTDXaMNKhjtb2zljeFKfCJNlz4jjnLDBurPwxY3+mX8aTVMkgV9ilsISVH4gySYqqqFgwZCOQL89KtUF6MLvjfXYenUSnm5s6eWN0syDvxsPrP/MvwtSeJico8la3pRitZATH9eRqrAkzBiQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053505; c=relaxed/simple;
	bh=uuHdAWEQUGRrektPBEM+tkC+JiAw3y/YeDJVA9Ih/aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=X/+/Vg2yJ6d/nb3RpvVWsUXUL4st3qieANY81miG5wmxeKpApPEpuQxJlUslTpLo48S8WvZntkaoKEZODxkk+Hpi0Nqr6hEU1ROJMYjgO/0FVpRsscrQJGk72zTcSrYQxDKd7iFN0YDDf9RH4oDpH2CWiZY/2ZmpQ9KYFger4RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hJ/bR2tr; arc=fail smtp.client-ip=52.101.61.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9Pk08idde4+ZexsZA+6o4JKJQzHlefhRAtKx+cDPRXlqp18pLz1VMYjcMkAuxD4Kkfzg0rCjFuU0ov+dWl5/39rMTQOwbYTVq+ty66Tml5rvzipXtcYODmg0FDtjE6gTyd6YE3m5/dzh5ldr61JEQdFraupMllLx86kLXcUZK3+7B1JIWunwG6hYgW+/47BInomaHOuKOzyxuAjf11ah/EQEmx1upO9GuRpq8f7RY/fpvLQyvPPUqYjcZG6E4pv+yN3lZY6JA2lTXu4fIB+YgNHgd3bJVsJhgHa4D8b9KClqG/GYcKwbcaTlGvd7OC0q4fAxtNSyQVqoJoqZY+lSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chaiDqh0BfC71ukyg3AghjyC4Ge9WJXzWQLmw2Ps6EQ=;
 b=Hjfpabb7+6kzBMS6ASdDcx7cFIBu6Edbo88KS5j6eqzRiod+r3jAAh90mnsAeMydYU520Apqn2zz9iukHd4/4Ylk5yvUd4wNvprf2izatJSLH+JGGnfMUPVaYchIUoGkWcShUSXM69xe1Q9gNYuAncPdmhDt5sgBbSY7KDgNeZHUunKCRyEo4oUCzYAMTLpQzSC6p6p8mV2Iyl72rOCvcybakqDmcrYWvKYn9jkFLC5F+pd0uJFPvG5yE1sx/YzjgEASOyj/rhEO1s6kr0ieYetEu7Wd79c3vcTqxmPSuuzVDW5Jt0K/34/Eu8Reg9v+uZ5KtsUkzR2K4NrGtiwcrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chaiDqh0BfC71ukyg3AghjyC4Ge9WJXzWQLmw2Ps6EQ=;
 b=hJ/bR2tr7wDh+IUwPGkS2NhxbeQdbyrMIGjRTKDtrljfXDdAVhYWCbYaMtMrUCw/j/KryEvLmPMcBi4OiiP3/ubh5C7df6+DLmSOdwsbzdJExcJptaNim0DXXD/l8pV47vzN7lIQcZcF1FK7naJa0LOzkAQxMBKYfHeTC9c9l0M=
Received: from BL0PR02CA0092.namprd02.prod.outlook.com (2603:10b6:208:51::33)
 by MN6PR10MB7422.namprd10.prod.outlook.com (2603:10b6:208:46d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 10:25:00 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:51:cafe::8d) by BL0PR02CA0092.outlook.office365.com
 (2603:10b6:208:51::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 10:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 10:25:00 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:24:58 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 04:24:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 04:24:58 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIAOqTL3145993;
	Thu, 18 Dec 2025 04:24:53 -0600
Message-ID: <c0c08f7c-fb6c-4ae5-8748-1c1be74b5a38@ti.com>
Date: Thu, 18 Dec 2025 15:54:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] media: i2c: ds90ub960: Use enums for chip type and
 chip family
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-3-y-abhilashchandra@ti.com>
 <3fb1b12c-2f54-4bdf-8a33-a42b4852d651@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <3fb1b12c-2f54-4bdf-8a33-a42b4852d651@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|MN6PR10MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a29b6b-4f06-4ef8-479a-08de3e1fb33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDFMVkhaUE9raGpPRXNSMFp2WVJlN2hxMWt1VmZ4NTM2OGpzU1FMZHB5c0Vz?=
 =?utf-8?B?cEJ6TWdoenhMRjJjQnQ3aGU2RVVGTXpMY2dzcFRYbWxuaCtndHdxKzlZT1ZT?=
 =?utf-8?B?c2g1cXhBNTh0bmxGdGZnbjUxaWxjSHFZZElMVlVmYkFvK1dlak5GT2U3anBC?=
 =?utf-8?B?S05LcUswYXNGcmtuUndGeUdkRUlqdnhiajdmd1RzWGIwY01Eb1Q1VGJaczJB?=
 =?utf-8?B?bHlTbGNpb0w1WjJ6REt3Z052MU8xT0lnNUdrYkszTUVSVytOTjhBdlR5V1Vz?=
 =?utf-8?B?bGlvaXltZUUvc205alpCdW01cjVjcGhXc1ZlRkthZGdKc1duZUQwbTc4R0Jh?=
 =?utf-8?B?WWdFYTRZVnZHZHNLcmR2VmQ2ekpOYWRsaWNKeUduRzJIa1lQQW9jZFlRTWNv?=
 =?utf-8?B?NTVDd1J2YmovZ1AyZnM5Qlo1aHUwb2ltUFhCS0Y4WGRORGVuOVgxWThnNXRL?=
 =?utf-8?B?eURrTW04TExER2R3YTlGUTFDYXVmVjVocTMxZGp6dWZ3RE1leDAvK2Fpbita?=
 =?utf-8?B?ZVJUWjNYRmxDZXVkWHZzL0xGKzJNbHAyQXR5bndFL0NmbkpWOTJuVi9naHYy?=
 =?utf-8?B?VlYyaTZvTTRHQmJuaXBhcEtlYXZFd3N3QW5sNmhZU1NYVmZaNHNHeVhOMzNY?=
 =?utf-8?B?OWtldU9BMjkzRXhUMWhhTi9XS2dGbnpYNEVpS3BTY2J6RVFTWXRuU0FTdFZ4?=
 =?utf-8?B?bVhUeG1ZblZyclhVa3dPNVVjb1NVemNEMmwzQ3BLNnlwZlRXbXN0SlhCS2x1?=
 =?utf-8?B?cFZRUjZhdUtjMnU3QkVDbU9YSFUrTndFcGR0b2VPMG5wM3ZRVkF3eU01ZmFM?=
 =?utf-8?B?S1hVZ3ZGd1k4RmxCQXhsbmpBM2hBSHlUVkEveG1HMXhlUGFDRHYrK0ovTHNB?=
 =?utf-8?B?Tm5Gb1JOS0tzanhrK21lS2tYYmllMkM5bWlRdFc0dXpjSnNmdStXZDRPelVY?=
 =?utf-8?B?RWhkZ0ZSMHJsM1JjTTJHallFbGxpajYwbVNXWWR4UjBwTzVkRnE2U3g3ZWtk?=
 =?utf-8?B?V1Y3YloxdzJlcXptMGJJZ3NjY0UwWGQ0Y1o0MGRLMnB0MFdBazlEblhTTGtC?=
 =?utf-8?B?L0xkZHhpQlAvLzRjaCtSZURKN043YUZOemQ1T0Y5NHl1RndweHgwOW9UaE5s?=
 =?utf-8?B?dUphRHE5a1BKU0xPZFpTcW41STRkSHg4RHpyVTg3eExZSi9BSFVqS3I4UDhM?=
 =?utf-8?B?ZCs0YTVudDNsZy9FR3pCS2xEMENJeW1wbkRUN0FONjZDazhpSUtnU21Ba05P?=
 =?utf-8?B?RU9mN0FtOTd4Rkx2L1BrWTNXbHhIVlZ2Z0xGQ3o4WnpIRWNMZVVHS2ZhdnE0?=
 =?utf-8?B?aGxXcm9MSXdtYWhaWUdLSm9kbFA2RndwblQ5MTc1MFRCQVhUZVpMekVPcXRN?=
 =?utf-8?B?VnNKMy9KYkh6L2sxRmZLZlNrYUlEaEdKUUYwOEhwbHFiU1gxdHQ4WTUzRjIr?=
 =?utf-8?B?ODNpYk51K2tNRDJRS2hqbEl1ZXhZeEFjZ0pJRWwralFGbXBJQ0pNeno0OEIv?=
 =?utf-8?B?V2ROZkhUM051bmtxbmVLSmVXOGNRc2lIb01qWVgxSHNHVWdPa3RLWCs3bExG?=
 =?utf-8?B?Ymh4MkFid0hWd0diMEZqcitncDM5akEwNjNwNUZGSUcyTXlYV2lIVmlGWHVC?=
 =?utf-8?B?RVh6N3ZLUVBSRXVhMkw1dmh1QmlCRzVhQktKaGxNQ1FSOUFTUEpMNTcxQjc3?=
 =?utf-8?B?TGNkbVBFTzlQQjNpWWtYRVU0S20xdnFQcWxna1R5aWVhMGRDMzV1a3ROQmxw?=
 =?utf-8?B?SE9xOVZraE41SXJWWHBwelBaRG0xSk92UThXb0QxUStnMnVnd3UzTlBCTUll?=
 =?utf-8?B?cFlIN2xqbHg3UzB6UUZBbDM1UUM2RHJIYWM3M3paVnhwVGg1NTRiVjJzU2tO?=
 =?utf-8?B?L2xIRUtXN21VRjhJcHl3SXlqU0RNaGdUT1E3ZU9jMERONGNZR2lMczBCZVpl?=
 =?utf-8?B?NEZuVXJqVlNxaXpCMmZSdXdtRVZLRjgxS3FkZ0s0amx2cEl0dTcrcHZCTzAy?=
 =?utf-8?B?MjcwNDlTakJXSWIvUi9Ddld1SDBOYmN3QmdyZXNVa2lIcW9QK2JxRUlRSXBs?=
 =?utf-8?B?YW15NnZ0SzYraVViUUI5eTE3eVM5bW1WbGhiam5adFpIN0c1SURUYnNxd1lR?=
 =?utf-8?Q?0TB8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 10:25:00.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a29b6b-4f06-4ef8-479a-08de3e1fb33e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7422

Hi Tomi,
Thanks for the review.

On 05/12/25 16:16, Tomi Valkeinen wrote:
> Hi,
> 
> On 02/12/2025 12:22, Yemike Abhilash Chandra wrote:
>> Replace chip-specific boolean flags with chip_type and chip_family enums.
>> This simplifies the process of adding support for newer devices and also
>> improves code readability.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/i2c/ds90ub960.c | 56 ++++++++++++++++++++++++-----------
>>   1 file changed, 38 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
>> index 5a83218e64ab..45494fcaf095 100644
>> --- a/drivers/media/i2c/ds90ub960.c
>> +++ b/drivers/media/i2c/ds90ub960.c
>> @@ -454,12 +454,21 @@
>>   #define UB960_MAX_EQ_LEVEL  14
>>   #define UB960_NUM_EQ_LEVELS (UB960_MAX_EQ_LEVEL - UB960_MIN_EQ_LEVEL + 1)
>>   
>> +enum chip_type {
>> +	UB960,
>> +	UB9702,
>> +};
>> +
>> +enum chip_family {
>> +	FAMILY_FPD3,
>> +	FAMILY_FPD4,
>> +};
>> +
>>   struct ub960_hw_data {
>> -	const char *model;
>> +	enum chip_type chip_type;
>> +	enum chip_family chip_family;
>>   	u8 num_rxports;
>>   	u8 num_txports;
>> -	bool is_ub9702;
>> -	bool is_fpdlink4;
>>   };
>>   
>>   enum ub960_rxport_mode {
>> @@ -1933,7 +1942,7 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
>>   		if (ret)
>>   			return ret;
>>   
>> -		if (priv->hw_data->is_ub9702) {
>> +		if (priv->hw_data->chip_type == UB9702) {
>>   			dev_dbg(dev, "\trx%u: locked, freq %llu Hz\n",
>>   				nport, ((u64)v * HZ_PER_MHZ) >> 8);
>>   		} else {
>> @@ -2195,7 +2204,7 @@ static int ub960_rxport_add_serializer(struct ub960_data *priv, u8 nport)
>>   
>>   	ser_pdata->port = nport;
>>   	ser_pdata->atr = priv->atr;
>> -	if (priv->hw_data->is_ub9702)
>> +	if (priv->hw_data->chip_type == UB9702)
>>   		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub9702(priv, rxport);
>>   	else
>>   		ser_pdata->bc_rate = ub960_calc_bc_clk_rate_ub960(priv, rxport);
>> @@ -2361,7 +2370,7 @@ static int ub960_init_tx_ports(struct ub960_data *priv)
>>   {
>>   	int ret;
>>   
>> -	if (priv->hw_data->is_ub9702)
>> +	if (priv->hw_data->chip_type == UB9702)
>>   		ret = ub960_init_tx_ports_ub9702(priv);
>>   	else
>>   		ret = ub960_init_tx_ports_ub960(priv);
>> @@ -3633,7 +3642,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
>>   
>>   		case RXPORT_MODE_CSI2_SYNC:
>>   		case RXPORT_MODE_CSI2_NONSYNC:
>> -			if (!priv->hw_data->is_ub9702) {
>> +			if (priv->hw_data->chip_type != UB9702) {
> 
> While the above is correct, I think it's better to do 'if
> (what-we-need-here)'. So rather check for UB960.
> 

I will change this in v3.

>>   				/* Map all VCs from this port to the same VC */
>>   				ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
>>   						   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
>> @@ -4259,7 +4268,7 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>>   
>>   		dev_info(dev, "\tcsi_err_counter %u\n", v);
>>   
>> -		if (!priv->hw_data->is_ub9702) {
>> +		if (priv->hw_data->chip_type != UB9702) {
> 
> Same here.
> 
>>   			ret = ub960_log_status_ub960_sp_eq(priv, nport);
>>   			if (ret)
>>   				return ret;
>> @@ -4417,7 +4426,7 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>>   		return -EINVAL;
>>   	}
>>   
>> -	if (!priv->hw_data->is_fpdlink4 && cdr_mode == RXPORT_CDR_FPD4) {
>> +	if (priv->hw_data->chip_family != FAMILY_FPD4 && cdr_mode == RXPORT_CDR_FPD4) {
>>   		dev_err(dev, "rx%u: FPD-Link 4 CDR not supported\n", nport);
>>   		return -EINVAL;
>>   	}
>> @@ -4976,6 +4985,7 @@ static int ub960_get_hw_resources(struct ub960_data *priv)
>>   static int ub960_enable_core_hw(struct ub960_data *priv)
>>   {
>>   	struct device *dev = &priv->client->dev;
>> +	const char *model;
>>   	u8 rev_mask;
>>   	int ret;
>>   	u8 dev_sts;
>> @@ -5012,14 +5022,24 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>>   		goto err_pd_gpio;
>>   	}
>>   
>> -	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", priv->hw_data->model,
>> -		rev_mask);
>> +	switch (priv->hw_data->chip_type) {
>> +	case UB960:
>> +		model = "UB960";
>> +		break;
>> +	case UB9702:
>> +		model = "Ub9702";
>> +		break;
>> +	default:
>> +		model = "Unknown";
>> +		break;
>> +	}
>> +	dev_dbg(dev, "Found %s (rev/mask %#04x)\n", model, rev_mask);
>>   
>>   	ret = ub960_read(priv, UB960_SR_DEVICE_STS, &dev_sts, NULL);
>>   	if (ret)
>>   		goto err_pd_gpio;
>>   
>> -	if (priv->hw_data->is_ub9702)
>> +	if (priv->hw_data->chip_type == UB9702)
>>   		ret = ub960_read(priv, UB9702_SR_REFCLK_FREQ, &refclk_freq,
>>   				 NULL);
>>   	else
>> @@ -5038,7 +5058,7 @@ static int ub960_enable_core_hw(struct ub960_data *priv)
>>   		goto err_pd_gpio;
>>   
>>   	/* release GPIO lock */
>> -	if (priv->hw_data->is_ub9702) {
>> +	if (priv->hw_data->chip_type == UB9702) {
>>   		ret = ub960_update_bits(priv, UB960_SR_RESET,
>>   					UB960_SR_RESET_GPIO_LOCK_RELEASE,
>>   					UB960_SR_RESET_GPIO_LOCK_RELEASE,
>> @@ -5111,7 +5131,7 @@ static int ub960_probe(struct i2c_client *client)
>>   	if (ret)
>>   		goto err_free_ports;
>>   
>> -	if (priv->hw_data->is_ub9702)
>> +	if (priv->hw_data->chip_type == UB9702)
>>   		ret = ub960_init_rx_ports_ub9702(priv);
>>   	else
>>   		ret = ub960_init_rx_ports_ub960(priv);
>> @@ -5179,17 +5199,17 @@ static void ub960_remove(struct i2c_client *client)
>>   }
>>   
>>   static const struct ub960_hw_data ds90ub960_hw = {
>> -	.model = "ub960",
>> +	.chip_type = UB960,
>> +	.chip_family = FAMILY_FPD3,
> 
> I think we can keep the model name here. It's a bit duplicate with the
> chip_type, but allows us to drop that switch-case from probe.
> 

Understood, I will keep the model name here and drop the switch case.

Thanks and Regards,
Yemike Abhilash Chandra

>>   	.num_rxports = 4,
>>   	.num_txports = 2,
>>   };
>>   
>>   static const struct ub960_hw_data ds90ub9702_hw = {
>> -	.model = "ub9702",
>> +	.chip_type = UB9702,
>> +	.chip_family = FAMILY_FPD4,
>>   	.num_rxports = 4,
>>   	.num_txports = 2,
>> -	.is_ub9702 = true,
>> -	.is_fpdlink4 = true,
>>   };
>>   
>>   static const struct i2c_device_id ub960_id[] = {
> 
>   Tomi
> 


