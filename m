Return-Path: <linux-media+bounces-49997-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3986CF7AEE
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 11:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CD86308DBEB
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 10:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5674630E852;
	Tue,  6 Jan 2026 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kfvUefjZ"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036293A1E96;
	Tue,  6 Jan 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693989; cv=fail; b=S+8JWOpYwRIrLhNc/LkckhksNgWJ+xtnCqSkHGX6wARLw1XFCmzHTwP/cqTQpAjnr+KFZ4eYkaIWtlfrcpaehZCEAVuy/PoEVOLxDNM87t4Fw1W/B1/OSxmXQj+RKsxy+Ikkufq1Tvz0o7tL61frGVCfMtkKDbSeis87kCzOzVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693989; c=relaxed/simple;
	bh=m5nHGOQo+2mNC8PaauskTsQG9w6Wh0Sapq91xIu4eFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ajl7uKgx8NSM/xsmqDH+wmveyQunluWXT7hidNZDkfZ94E8xL2kygVwZZONYAGzx1aj7puq0sNuiDy7Dxjo6EfzhxcaiFHggKAPHIJLGkLiE7rGNblH3MCfvfDzDWz6I9i7eQBHQIP3cyI9kGTttDxEwGllGm/TOPVBaOiyEP+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kfvUefjZ; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkWJG8EfnxFIVMuwdnXtit5DtPFjTdeNKLV9bXklAHpPShgHrWoHoCVdICRO0MBxcjEAkN0gNsYV7YctgznSe03bqvIwouv426Yt8CYBCwozPIPlHgqd3srFFMHsZcmRTrjhL4PZM8ogir/fdaVdcf3U1VzEfyAyBz0FwChiD7aCSTUkyJ8EG5xpFkttZPDi1OmYOtkogNZp0N/T+j9of8dXBImIZIi3xi2OX2smyuGjY3a5zSuoRKIllbbMUM5Ovy8ICUw6bv3FJJpO5KLk6bB4jZ9B/a/2P6MEENaqSiJo73Z7Sj8VgKL3PGc+vehkQNk34gOv8s5yoIMszj7naw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTsoGxhmEn81t7EB0JYb2Y+74cjjUTYFRn0wqeAdIak=;
 b=GObUMTBSyedjfWZfsHCsY6Poj/uAUR58kytGdBbUXQkcZc5xaNxCHmYkFJXS7cGEw9VvTABu/cpONHRseXcFlFxDunUs0cbt9XbMEAhyoi22jLsnDwlJsH6PFpR/esd9G7410VwBIh/u5gmBKHTFkBar8tQ5/UYd5U0GSHJ6GOUjHaFIVhUH5INS7fV3bnyhfQ/9EWudgr3bqasRXedRaj5mXCt96s64kc4YV7q8UwbhB6RMZ+Y7Aayyarb3+mw6fFEcHtKbF5GxoYcT21TzE+jK+WHwSpFFpdoAa3YoZHptbn2nlTSz0M83z3TBzBu/dPrZoasOKqdFHM+B0NzflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTsoGxhmEn81t7EB0JYb2Y+74cjjUTYFRn0wqeAdIak=;
 b=kfvUefjZjyMGJP1ONwsOZRjCtkhuVpIkYOETl0LSliVSIksJMQt0CHDdtQSso9IFF7qVO1Aerk+AXcrkd+X4+O/E3Z3/NtjQozTiZE8Jm87tB3NKIP4BuADU9A4C3SB0M60GuUbYF2isZ03vSgDuKVDKS8HzNxI00EFdJVHT62Q=
Received: from CH2PR14CA0002.namprd14.prod.outlook.com (2603:10b6:610:60::12)
 by PH5PR10MB997733.namprd10.prod.outlook.com (2603:10b6:510:34c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 10:06:24 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::69) by CH2PR14CA0002.outlook.office365.com
 (2603:10b6:610:60::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 10:06:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 10:06:23 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:06:16 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 04:06:16 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 04:06:16 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606A6Bo02840634;
	Tue, 6 Jan 2026 04:06:11 -0600
Message-ID: <5b6b7c00-1553-45e3-90b9-ddd0da86263b@ti.com>
Date: Tue, 6 Jan 2026 15:36:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] media: dt-bindings: ti,ds90ub960: Add support for
 DS90UB954-Q1
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
References: <20251219122955.2078270-1-y-abhilashchandra@ti.com>
 <20251219122955.2078270-4-y-abhilashchandra@ti.com>
 <07cef607-365f-4c09-a57e-5ddbdfde7027@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <07cef607-365f-4c09-a57e-5ddbdfde7027@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH5PR10MB997733:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7384be-1fc6-4797-6e92-08de4d0b3f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVNPVFNzeEMrem9aaVZZYnV5L0RFcVpPMWhhSGMzWGh4VjIxUTdnVVZYcDJB?=
 =?utf-8?B?cERjVFhmeThUdWxodTFBVTRHTng3L05BNFhCQlNPd1pMNlVpakV1NnBQRk9W?=
 =?utf-8?B?Z282QnRMWFZkRWxhN0trWWI1YWhzR2pFcHZyTXowUUVscnp3SUJibWgzbkdp?=
 =?utf-8?B?MDJQMjJkeFBOVVFHUlIvVnVtNlRvOG40VDVSRkVzU3Y1eExpdmM3dVFQN1h4?=
 =?utf-8?B?dFRZbDhqZDVETmZZc1JIVEtPUmZZZ0VLUlRGNTg4eUk4aHBkWkJVdEE0OXIx?=
 =?utf-8?B?ak80QjNFRmpCSHRWdEFYenJ0WTBPUm80ZjVzVHdsS2pHZlpWSG4yZjRBd0ZW?=
 =?utf-8?B?aWVuMnhuNTZVOEFoYjRLUHdvSVNVb2xORnQrdmNSbWJXWVVpN3Y0Tms2S05C?=
 =?utf-8?B?cHBWNVdDdXdHTUhKTVJUKytaRDVRNStYUnBESnVnZlJQYnF2bmFxWUkwRzZN?=
 =?utf-8?B?RVlMK2xhbUtBeWlYQVJWVWJIWjVsTXpVdENFUmhnbVBIaVprVkpZd2gxTFdC?=
 =?utf-8?B?a2hnNXpRZElUcS9WUUFiTFhabUlyZVNLRmsrRkp0eEJOYWtSMGJzRVZiTjVU?=
 =?utf-8?B?RHVyVXhGMG8rQWpTOVRPNzNYUHZLZjFiUmg3OVlDSXZUeGlISjJxNzdMSlI5?=
 =?utf-8?B?TmREQWRINlFwLzlCUWNlZ1pQb3A5L2oranB4L3RvRW01MklQS3pYRndadUgz?=
 =?utf-8?B?cEN4YzUxaTh2VWJhYzJBUE5mSGlPYzdxb0FLTXVuT0lUWktvTzloblFLMUZN?=
 =?utf-8?B?YXNNdXVVYlRwYUR0WEJkbUtZODVrZW1mQk1FS0ZaRE1wM0tOVmsyS1EyS0Fj?=
 =?utf-8?B?dlpVQWladjZJM3pjT1BRWFlGV0wrZ29taGFGTHBXRU54TVphaVljTzZ6SGtV?=
 =?utf-8?B?SHhDL2piTGI2Q1lqendvQ3IxdmV5dmMvLzc4bXVHd3F0TDkvMUo3Rm9mTE55?=
 =?utf-8?B?ajM0c0NaN0IwYnpXYU5LVFJQZ0srQnpaRjlLRTdEcFYvRnc3d1k1RlJORkli?=
 =?utf-8?B?NVRIeXBIQzdCbjlFSHk2RkcvT0lhNndXemhFMEhXZjFBelpDOHBsUlBtdnNN?=
 =?utf-8?B?NUw4bEZ0cStmWWttUXdmdzRlWFdXMm9PY1NTWGxZYk5RZlJJNlh0SWNiM0FW?=
 =?utf-8?B?YUN3L1REckE4dnhTekgxSEk3bSt6QXZxSXBiYithdFNmTlgrWjZrUEFJemNF?=
 =?utf-8?B?QmN4M2tlNGhsa1pBMDgwbDdqZGIwbzR0S0JQcmJyUzhva2h5RzNHMmFOa0kv?=
 =?utf-8?B?MytRbjhPK2FsVklURDdnRDByNWFYYkd4NGpHeXJENTBDOXkvZTJ3WGpRUG5k?=
 =?utf-8?B?THF1QVY0c0F5bnUzNHJxVXcvT0ZTcUNMS1FNZktSdlhjN25BZk5JbHhMdzlP?=
 =?utf-8?B?MENPOVU0Q3dmTGdoYTJIM1FyaktOeExDNXhwSGVBZytEQjN5ZHhQQ3ZoNXVi?=
 =?utf-8?B?MXltbDBtWldIK3NRY0NOWVluWXdndjIxUVFaZUVWR3VVMEtYNjRySVQrL3hk?=
 =?utf-8?B?cTA5Rk5KWE5HVVk5Slc3c1FDVVBhTnBGYzZ2bHFHSXJWTWFqcjF4T2JUTkRG?=
 =?utf-8?B?cjRMZ0pDdkd4RUtwTHBwcmJ2aEpqYnBod0FjODhLUXpiOWdXUUpuSWVSSjhz?=
 =?utf-8?B?b2FPekRiUXdRMmFEVTFubUpTUWhlenRKb2w1dEo2dXNuUkthQmhyZ1V0OUtT?=
 =?utf-8?B?VXlUbWEwOGdrMCs4N0Z3OVYyL3RZSTlpM2c5d2lxbG1MbW9oUjBpd01FQUNl?=
 =?utf-8?B?bWphVXNtcUVJem1HR1BTalFPU2tPd2ZpbFVTbi9LbHFPOVZHQ20zL1VCeEZY?=
 =?utf-8?B?UnFaY1phaGJ0WmpOdS9pdnpqazZWOUY1a04wODlQd1lydWxJa0lYV0FFTnUz?=
 =?utf-8?B?SXNpSGdtWVpEN1lMZ01ZWFN0a0dlbjkwQXBLOFUzZ0phK0QxU0FFU0VOVzNw?=
 =?utf-8?B?NnpSamR0YkduQW5NQm95Q3BNYVBNc3pnMnhrN1ZUdnkyY0RFSy9aNnA3dVFF?=
 =?utf-8?B?S1BJaU9URlJKNCtJUzJyZm5vbE41SFFTNWpHUHIyZFRCM2grQkhCUlV0cDdJ?=
 =?utf-8?B?MENreDhzSmVmb3RZWXYwNy91ZEFCVkpLeWZ6RkFTTGk1ZmUzakN4QmNEWlF6?=
 =?utf-8?Q?DvWVYqJTlor6SkSV9Lj7p/4Kw?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 10:06:23.3154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7384be-1fc6-4797-6e92-08de4d0b3f38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997733

Hi Tomi,

Thank you for the review.

On 22/12/25 16:59, Tomi Valkeinen wrote:
> Hi,
> 
> On 19/12/2025 14:29, Yemike Abhilash Chandra wrote:
>> DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
>> compatible with DS90UB960-Q1. The main difference is that it supports
>> half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
>> port. Therefore, add support for DS90UB954 within the existing bindings.
>>
>> Link: https://www.ti.com/lit/gpn/ds90ub954-q1
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>> Changelog:
>> Changes in v3:
>> - Remove the example added for DS90UB954, as it is just a subset of the DS90UB960 example. (Rob)
>>
>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
>>   1 file changed, 77 insertions(+), 36 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> index cc61604eca37..8e2b82d6dc81 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -13,12 +13,10 @@ description:
>>     The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
>>     forwarding.
>>   
>> -allOf:
>> -  - $ref: /schemas/i2c/i2c-atr.yaml#
>> -
>>   properties:
>>     compatible:
>>       enum:
>> +      - ti,ds90ub954-q1
>>         - ti,ds90ub960-q1
>>         - ti,ds90ub9702-q1
>>   
>> @@ -129,39 +127,6 @@ properties:
>>         Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
>>         from the deserializer. The number of ports is model-dependent.
>>   
>> -    properties:
>> -      port@0:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 0
>> -
>> -      port@1:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 1
>> -
>> -      port@2:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 2
>> -
>> -      port@3:
>> -        $ref: '#/$defs/FPDLink-input-port'
>> -        description: FPD-Link input 3
>> -
>> -      port@4:
>> -        $ref: '#/$defs/CSI2-output-port'
>> -        description: CSI-2 Output 0
>> -
>> -      port@5:
>> -        $ref: '#/$defs/CSI2-output-port'
>> -        description: CSI-2 Output 1
>> -
>> -    required:
>> -      - port@0
>> -      - port@1
>> -      - port@2
>> -      - port@3
>> -      - port@4
>> -      - port@5
>> -
>>   required:
>>     - compatible
>>     - reg
>> @@ -204,6 +169,82 @@ $defs:
>>             - data-lanes
>>             - link-frequencies
>>   
>> +allOf:
>> +  - $ref: /schemas/i2c/i2c-atr.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - ti,ds90ub960-q1
>> +              - ti,ds90ub9702-q1
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 0
>> +
>> +            port@1:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 1
>> +
>> +            port@2:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 2
>> +
>> +            port@3:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 3
>> +
>> +            port@4:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 0
>> +
>> +            port@5:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 1
>> +
>> +          required:
>> +            - port@0
>> +            - port@1
>> +            - port@2
>> +            - port@3
>> +            - port@4
>> +            - port@5
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: ti,ds90ub954-q1
>> +    then:
>> +      properties:
>> +        ports:
>> +          properties:
>> +            port@0:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 0
>> +
>> +            port@1:
>> +              $ref: '#/$defs/FPDLink-input-port'
>> +              description: FPD-Link input 1
>> +
>> +            port@2:
>> +              $ref: '#/$defs/CSI2-output-port'
>> +              description: CSI-2 Output 0
>> +
>> +          required:
>> +            - port@0
>> +            - port@1
>> +            - port@2
>> +
>> +        links:
>> +          properties:
>> +            link@2: false
>> +            link@3: false
> I can't help but think if this is good or not. In other words, if we
> specifically add ports per compatible, why wouldn't we also add
> specifically links per compatible? Or, if we just disable links as
> above, why don't we do it the same way for ports?
> 

Quoting writing schemas:

"When bindings cover multiple similar devices that differ in some 
properties,
those properties should be constrained for each device. This usually means:

  * In top level 'properties' define the property with the broadest 
constraints.
  * In 'if:then:' blocks, further narrow the constraints for those 
properties.
  * Do not define the properties within an 'if:then:' block (note that
    'additionalItems' also won't allow that)."


Since new properties cannot be introduced inside allOf / if:then, it is 
not possible to define
device-specific patternProperties for links directly under each 
condition like below

- if:
     properties:
       compatible:
         contains:
           enum:
             - ti,ds90ub960-q1
             - ti,ds90ub9702-q1
   then:
     properties:
       links:
         patternProperties:
           '^link@[0-3]$':

- if:
     properties:
       compatible:
         contains:
           const: ti,ds90ub954-q1

   then:
     properties:
       links:
	patternProperties:
	  '^link@[0-1]$':

Therefore, a broad top-level definition such as:

patternProperties:
   '^link@[0-3]$':

is required, with device-specific constraints applied later via 
conditional logic

This works for ports since we have a

patternProperties:
   '^port@[0-9a-f]+$':

already defined at /schemas/graph.yaml#/properties/ports which we refer 
in the top level schema

Note that an alternative could also be modeled by explicitly disallowing 
unused ports for ds90ub954,
namely port 2, port3 and port 5 but that approach would require changes 
in the driver, as it currently
assumes that TX ports start immediately after RX ports. Hence I 
preferred having ports 0, 1 and 2 for ds90ub954

The approach that was used in this patch was also hinted at in our 
earlier discussion at
https://lore.kernel.org/all/58b309d9-de03-4818-8d38-a27cc68466db@ideasonboard.com/

Thanks and Regards,
Yemike Abhilash Chandra


>   Tomi
> 


