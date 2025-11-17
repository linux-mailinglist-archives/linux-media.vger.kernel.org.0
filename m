Return-Path: <linux-media+bounces-47187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D8C6274F
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 06:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 568C04E67FC
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 05:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EA930DEB6;
	Mon, 17 Nov 2025 05:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LlV1tFZM"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08832571C5;
	Mon, 17 Nov 2025 05:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358724; cv=fail; b=I9VhwJm/kEB+DN+PNfYDU7kPBW50zqLyNPpFl9Wx9EoeD9pTszVf/SW7oWYnY4wLtbYvKNf4H02CPvRrRtMTZlND3d7OXifvZp6rqxd971Xtutnyt6Y8ZfbCXi5Wa2gU0NI0c464Fx9ac7LHR0Zmt8GVXEqdlcDUHpKXQzjQVyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358724; c=relaxed/simple;
	bh=fRx0UgBD/CtCEVYpmI7xzHhN4a1MsD/AeX+8zzzBvEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=s5l6fkmWr8rP8OWbYPXyfit0ZlavyTnSgzAyOiEkPJxz+JiGujbhUnz7v2U9spcTgRrHhmBZvLm0u7Yx5lS72SkaAPn2dNf6pU7tKOEEjee7JU3AqOdO+Cv1Mv+/byNXVVv1V49KJzyhxGnJIdWuMrD3Woet/vGVnVPJkXdXBzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=LlV1tFZM; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB212fxDdokYtJHVqifl5iQxglfQ8d+nn2HS5/sfz36QT4cfycGLty7++3QiN4aumRcbCDo3DqtNVwjegDi2Gf4WDI6cbt7uouAX3nVOAyDGNbRvbVz9R/HiF8tNgGLhN5XasOAYXnBo/hOpOvjLWd0qftKL/AVkBf9JzIU5BWvhMRUBZejX7cSBCCE1Wwsdyn8JExparWdGXdiRNL8o7pQEptpPcfD/DCemuQ7xSDByOetGvWIePG9y5ETUGFheBHm1SmzJsRD1m8F0VGzi8o6ORYrjnHwdG43PAKXgu0xKidz2IUUeu4KajQ+per23deM054auSi/05rXOLQsPsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFSLuxk70v7cXjU3BmvXfsUer+9dCIvh5mkDJyDVcnk=;
 b=KlnPy/4yU4oNWm2ygDCIfFGdmkaA71aqGAPdVs+I+lmd4mg8Cv3l8ID/GxaiqvdMTZNDJo7bXRCO5A3OWpfBMil1gjws4Feb4W3yoxRrChWWXDFHBHw/m8jN+lfzyo/ixwhAEK1dj6av0HP5oKFNhzLYWxygtmd7RJwe61+jj7/7agqriFGHwoJEhsTu31KtAdAPTRsALxjBoBBKKlSLvyleS/gXpJOevSchVbSb9xZzKpoVFgwk7pi1fgtkcAJOZg2vEkndHQJFH2vnUzBYwJ3gs+AqMQ/0fcHXJdbCviOnNaw7WA4t7MH3I1RFHMDWJfViCwMAR9/lA/E95QXGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFSLuxk70v7cXjU3BmvXfsUer+9dCIvh5mkDJyDVcnk=;
 b=LlV1tFZMQ+ytqL0rs/PT1tcTAiWc1uDcgw0Y0Ja9a/4e6vPj5CiHJ0cbbL5m8BejDfuzHKrZ2iL+DxFmKp4pQMZiQjanQD2JiJhlif43Iu/CRn+d4hXo7g9x5sQuxsq8L31mPjEjMpQHmIaYqam/6tY5fsLG7W/VNhNwHlVcTpc=
Received: from BL6PEPF00016419.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:8) by SJ0PR10MB4526.namprd10.prod.outlook.com
 (2603:10b6:a03:2d6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:51:59 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2a01:111:f403:f900::2) by BL6PEPF00016419.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 05:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:51:57 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:51:52 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:51:52 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 16 Nov 2025 23:51:52 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH5pmR21915863;
	Sun, 16 Nov 2025 23:51:49 -0600
Message-ID: <a6cc80aa-fbb4-4698-82fc-b5ccb8928f09@ti.com>
Date: Mon, 17 Nov 2025 11:21:47 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 0/4] Add support for TI VIP
To: <hverkuil+cisco@kernel.org>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251024094452.549186-1-y-abhilashchandra@ti.com>
 <27b5eef1-f59f-4556-897c-f0cec7689d14@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <27b5eef1-f59f-4556-897c-f0cec7689d14@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|SJ0PR10MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cec1f3-ce80-4bd8-6e76-08de259d6b8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjE3QWpUR1VsZlE1b3gxVmQxdHpkVithcXhudW5uNHJZbm5WaEI2L0hCa1JR?=
 =?utf-8?B?b0l1Rk5NaUt3bHFpS2dwWWxPTjBBOHIwRXBiZ2V3OHZKWERHb1BoUGllQ3NQ?=
 =?utf-8?B?WDIyWnhCQ2hkSk9TRDZFOWc0Qzd0MGF5T0NZWGwvcGF2NWVxZUxzUHFHN1R2?=
 =?utf-8?B?OWRqbGpwd1JYNTVueXhTQlNnd0psS3czSFdIUFd6NmZ6RXVWejlDa05WcVVT?=
 =?utf-8?B?SXEreGtHZlRHam0rT3VOVHF3R2hLK2IrSGtqQmEwdlI3bXhQMXhmbGVnODE2?=
 =?utf-8?B?elhsaVYwL2ZpcWRVa2pUV2hlYytpR3lpdCt5RkhTUG5ZRXJ3c3RTUEc1Q2JI?=
 =?utf-8?B?dDVuWkdBQW1SZlZrRXpsZkgyS1JEMjBoaTZGdmxISzM5TkVkZC9vK1dKa0Zj?=
 =?utf-8?B?UlZ5M2lQUnluQm5lQXkzaUJ3dE1lTm1JVGlEWjd4NXQzdUlCczltbzVyTjlq?=
 =?utf-8?B?RHFCSVpwZS9heTMvUUpwTmVHcTliUk9xZ3UzK2x2bE9nRzFOMHZUZmY4bjg0?=
 =?utf-8?B?VlVxTHM1SnBZR0lFd3lDUWNTZmhUcHVXQlFtdnFpZHBZZnQrS0ZvRWYxRzI3?=
 =?utf-8?B?NHNSVmdpNzJMQTFFMVdQdGtpM1FmZnZIck4yc3owNzB4ZEF5SGF2VHA5aGFG?=
 =?utf-8?B?VnI0NDZoa2dOK0Z4NEM4bU5WNnhPVU1tS05uUVMwcllPUUpxWGxSVmNPR0Nh?=
 =?utf-8?B?ZkdBT1I5Vk5nSXYzcjlOVzBGd3VWS1A4T2ZtSXJSZGNBVkdWZUd0RXk5dEV3?=
 =?utf-8?B?VGpnV20va01ZSnRzMEFlUFVkWVl0SFNDVUY1R0U1WXp5MDluNXQyVVVxZVN2?=
 =?utf-8?B?d1JtVGJzYVFBY3BtQytPL2wvbUpnS3pDWTlTb2VTbTRNQ0dGMDhZRVcrenl4?=
 =?utf-8?B?VHErVXlkalFPYVlYTlhyZkZzcnJ3cktNNVlaL1VXdGJ1UTUreitJMXJRSGJz?=
 =?utf-8?B?cHp0RGo0TDF3OWtLdFFseDlTZlg5cTRaWjJuOFAra1JiMW9GWnhqSXdkeHc0?=
 =?utf-8?B?WGtyYlcxZWc4ZDJhT0pPTHRkR2E4QUMrK2c1RytaMWxOc0dVTFJibzZ3MSto?=
 =?utf-8?B?dUZpNGVQamJUbDFCVVpudmFMYzdsM2FSUFpoNXJKOTJkR0xwVEU0MzZlMHVt?=
 =?utf-8?B?OVBrOTFMNmhXcitxWGVzVHV5YmlOY3BjcFZsN2xVNlZPbE5RWVFObXAzNHZ6?=
 =?utf-8?B?c0ZLSlNaOEgrRDZKQ1J5TVBmNGRvZ1dyNlZFK2h3RXVhVHEwMUVZZStlN1By?=
 =?utf-8?B?YVpYbk1pbTErZHR4U0dSMXlhMGluSUo1cnl1QUlpQ1NTM3psUFZWaGNud3M1?=
 =?utf-8?B?bnhCWHE0ZjMxc2Rnb3lvTU90SFhzWkgzSHhvaW9jbHdNOUkwUVkwNXk1L0VC?=
 =?utf-8?B?TXhPWHgwVlk1MVZVcXpFbG13dEt0Z2I4UGZqYkdpSDFlQ0JqRTlJdzFUdlA5?=
 =?utf-8?B?SjVtN0lnSFVKamJBaGxzZFBuYS81UHkvaXlJaHZZdDFzakkzYVA5akY5WDZJ?=
 =?utf-8?B?SURRbC85YWtpM0hWNzI1T2dXY2swR3ArdVR2VGowemszTXlGNU1NcTN1QVl1?=
 =?utf-8?B?S0dyQmJZM1Y3b3NMTFRLV0lSL3BkQ0RDWDU5UmFqd3JRMWxJcTQxMVltRnlv?=
 =?utf-8?B?VVRYY1dwMHgxV3crcHRpS3hjY0lSeGJ4SnZ4Rk1OOWlXd0NHSUcwRkRtTEx3?=
 =?utf-8?B?Mi9QNXVNeC9xQy9Zc2RWSnZFL1prZkZqa1VBNnJrVjZuc3QxWWgxWTlsRU13?=
 =?utf-8?B?eXUrRXpRb1JsK2lTZ0l2Y3R2dHJjcnI3emVUd0tmaFg1Vk1odEdWUExPVlk0?=
 =?utf-8?B?Q2lNdGZVNHlTbzZSVFZjekJIVVU1R1pkT1hXS0JEU1R2UkRoRmlnTi9tdmZy?=
 =?utf-8?B?UzRwREVMc3BCWHpZc29qeXpxcmlPWmtENlZzeXBxbWs3cG5hRGRKUEErYnkx?=
 =?utf-8?B?dTRRQzBSQUtZVG93KzNaOTgyUW4rRCtiNy9reStrK0Y0QjNLVCtwUGoyTmt1?=
 =?utf-8?Q?CXvjwy1mC4mTZ+8tWdHaQOFds9Odr8=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:51:57.6525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cec1f3-ce80-4bd8-6e76-08de259d6b8e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4526

Hi Hans,
Thanks for the review.

On 03/11/25 17:11, hverkuil+cisco@kernel.org wrote:
> On 24/10/2025 11:44, Yemike Abhilash Chandra wrote:
>> This patch series adds support for the TI VIP. VIP stands for Video
>> Input Port, it can be found on devices such as DRA7xx and provides
>> a parallel interface to a video source such as a sensor or TV decoder.
>>
>> Each VIP can support two inputs (slices) and a SoC can be configured
>> with a variable number of VIP's. Each slice can support two ports
>> each connected to its own sub-device.
>>
>> Changelog:
>> Changes in v5:
>> Krzysztof:
>> - Drop VIP node's label from the example in DT bindings
>> - Fix indentation of the example in DT bindings
>> - Get the phandle args directly through syscon call using syscon_regmap_lookup_by_phandle_args()
>> - Use devm_platform_ioremap_resource() instead of platform_get_resource() and devm_ioremap_resource()
>> - Drop struct resource *res from vip shared structure since it is now unused
>>
>> v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/8d68342247da38d6ac59625f8eaf41c2
> 
> v4l2-compliance is too old:
> 
> v4l2-compliance 1.28.1-5233, 32 bits, 32-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> It's always best to compile v4l-utils from scratch using the git repo: https://git.linuxtv.org/v4l-utils.git/
> 
> v4l2-compliance is continually improved, and also kept in sync with the latest media
> git repo (https://gitlab.freedesktop.org/linux-media/media-committers.git), 'next' branch.
> 

Understood. I will re-compile my v4l-utils.

Thanks and Regards
Yemike Abhilash Chandra

> Since there are kernel messages interleaved with the v4l2-compliance output I
> recommend to write the output to a file and show that.
> 
> There is one failure for 'test Cropping'. If that still occurs with the latest version
> from git, then that needs to be addressed.
> 
> Regards,
> 
> 	Hans
> 
>> v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/1dfa740a34e0e3d77a315b245e61b9ec
>> Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/e44c4504d596f24e7c93a4c0b59f5316
>> DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/a7eb1308df2d4a167baeec62bc744335
>> (No errors related to ti,vip.yaml)
>>
>> Link for v4: https://lore.kernel.org/linux-media/20251015054010.3594423-1-y-abhilashchandra@ti.com/#t
>>
>> Dale Farnsworth (2):
>>    dt-bindings: media: ti: vpe: Add support for Video Input Port
>>    media: ti: vpe: Add the VIP driver
>>
>> Yemike Abhilash Chandra (2):
>>    media: ti: vpe: Re-introduce multi-instance and multi-client support
>>    media: ti: vpe: Export vpdma_load_firmware() function
>>
>>   .../devicetree/bindings/media/ti,vip.yaml     |  152 +
>>   MAINTAINERS                                   |    1 +
>>   drivers/media/platform/ti/Kconfig             |   13 +
>>   drivers/media/platform/ti/vpe/Makefile        |    2 +
>>   drivers/media/platform/ti/vpe/vip.c           | 3731 +++++++++++++++++
>>   drivers/media/platform/ti/vpe/vip.h           |  717 ++++
>>   drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
>>   drivers/media/platform/ti/vpe/vpdma.h         |    6 +
>>   8 files changed, 4672 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.c
>>   create mode 100644 drivers/media/platform/ti/vpe/vip.h
>>
> 


