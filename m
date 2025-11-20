Return-Path: <linux-media+bounces-47484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9979FC73776
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 11:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4B0A04E4739
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F15532C31B;
	Thu, 20 Nov 2025 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wjvGljOB"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF02E8B8A;
	Thu, 20 Nov 2025 10:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634735; cv=fail; b=VsYLZS2OAUme2E0rSsqqalynLCnTJ8Zvrvnx2rdfWufeMqRSYWSIXnA9AXqQOyRAAnm1x0C/z/RPEfH1ekDAEdWdswk2I1fgOUcZntYpFW3HImJ9CtVFwxqGo29aTMxPTI8SOF4zy10hGWYaASMhNvUpGrhG3MG6Xxgtm/P+eN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634735; c=relaxed/simple;
	bh=OMDLiu89b7j9V40PUSEHWCmHOhxsy/omfPdKBlrbE0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EENZ4DhfZYYw7ic/2+LaC+Tetwf7OirxyCTUV3/TmP9poccluzsTevi2tojZRvAJqjhWbX60PAXWNWHNDcouPaPwYsQE46nCIGsvSzEfuoYQBfs4XzJUN5pK90i7lcQ7UaaJ5Ne+p2MwA10bnl6Pha1AOPwdugGIvNJ7N2U6VV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wjvGljOB; arc=fail smtp.client-ip=52.101.43.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k33u+Ca3k8l/20Mo1zVuznQiu0O4jQLVS5L3MgsJCzxk5X5YPG+7K3dQdKhOlVxNFduhETvVDJ27pzDl6oiFq9SyxX0uJ/3rhMhxYExCEEXrq/9fU6pf5bPw0aBYptZz/hcYTwrcKZ7xClG1ImFp55Or8wLn0jKXMjiI5kjs0cmf5etZHjgdRO52+mj6L1B8dSgEPDFtbsO9zXRxR0N2EcqGsqjxCJglsXGXCQwi/bkEHeGRjFx9Rk27Vu+IHcfbiQjtiS44CGNiQgqvlVs+qYv3q2v5cP5bxF1mKAnVJyccib4N5stdbOHzINlzGatvsf5qix9UrxrjwhX2wlK1zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U5n5W+49CJTfiSSPCPw6tB1AoKMdI9gMtef8SBjKxg=;
 b=pfldXA4zWOLfAHpFhc3B+9t/+BRiO3ddvGmSLuPI/ZvJ+hbbIetSmGDzTBUKzSn3aLqmMW3/CYONXYDq8a+l2Wx7H/zclnFIq2jKdc16klr9ujz7Ix3XGZCsAwVdlftSuuWoxAupv/eMZAWyJ9SgtQOv9kYq5jA9867YaritfXSq78+QkPjRZg/wuG7t+aYDLIKEUBN2tUTljgHqJzWPipjHsWnEaSEzVt7JYtoHlwfWqiFRKAfGzXJkv6cU5fg21h9WACnOpP6t21ZSDujwSSe4ATZBgXa8JAEHd1N1bGQmwkyY/bfvE/NPhuR/7Im8oBCm6NLyiuIQCuVW9P3qmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+U5n5W+49CJTfiSSPCPw6tB1AoKMdI9gMtef8SBjKxg=;
 b=wjvGljOBsNebjhHIPWzrCwF0rKDjPq0pu8RuZsTgTKDhS/j6lWSAYi+9Teg13mQrR0/W2Yn8G5agDZQz1Bt/g+p52lM/yiJbdJ49llk9yg8kUhLYlzzl00JPzbWmeIwnylo7+imc0CaQFceeybi+v/vEbzgJVxjvRVfQDLCNBnA=
Received: from BY3PR05CA0029.namprd05.prod.outlook.com (2603:10b6:a03:254::34)
 by PH5PR10MB997708.namprd10.prod.outlook.com (2603:10b6:510:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 10:32:10 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:254:cafe::61) by BY3PR05CA0029.outlook.office365.com
 (2603:10b6:a03:254::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 10:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 10:32:10 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 04:32:06 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 04:32:06 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 04:32:06 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKAW1rS3517791;
	Thu, 20 Nov 2025 04:32:02 -0600
Message-ID: <7ebd8fa2-eea0-4620-bf5c-c60a572575d3@ti.com>
Date: Thu, 20 Nov 2025 16:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 3/4] dt-bindings: media: ti: vpe: Add support for Video
 Input Port
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, Sukrut Bellary
	<sbellary@baylibre.com>
References: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
 <20251120091030.2081594-4-y-abhilashchandra@ti.com>
 <d0ca66b3-82ff-4187-b2c0-182e25f6f19c@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <d0ca66b3-82ff-4187-b2c0-182e25f6f19c@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|PH5PR10MB997708:EE_
X-MS-Office365-Filtering-Correlation-Id: 0465e731-d263-4697-7cc7-08de28200fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2tYVnY1bmFMZHlFeWlsbDgwb2podlVwb253eGI0ck1MRnlDTkMyL3dnUEJR?=
 =?utf-8?B?Y1RkVlROWnB5ZElJMUQ4SkJtc3pWOFVFdzlmamNKcjFWMUd3SnlDWnpZdkxJ?=
 =?utf-8?B?TnlVUTQ2cnUrTGYzeGRxQzFLS1pFSGNiVHdLZzBnZVRsOEwyVHp2QWVOMmVY?=
 =?utf-8?B?VjZoZVN5a1ZmRGp2WG9SNHZDdzI4czlEQ3NLWlBjWWxFaE1VVFBzTUlaZXRu?=
 =?utf-8?B?Tk0vcmxZaCswZnJYZGppUS9FOExoeEt0ZFZGVGpTWWxJVG1KUXllNGhhZHpI?=
 =?utf-8?B?UnBhMGl5c3lWOU4vdXU1NjBCK2l5VlJVdHBERE5EeDBnK3pmVzI1dlZyK1RR?=
 =?utf-8?B?MWN4T3lJbWJwdmRKSldFWUZTZ0REWkthN3c3ZjdlUVdhOHAwd3h6cC9JQmxk?=
 =?utf-8?B?NldYbmVkRGplUlBJaGVNMmdZT2tJR3dXYi9JT0I3NCtXazlCamplTXVBbHRa?=
 =?utf-8?B?Yk9YZ0JOcFozeWpnNjlzYmloazRYc01jOW1LWkxpTWJVSVVTd2VVSWlMN3gv?=
 =?utf-8?B?MnBNUUo1czlKbWhKSkZIMFhJVVMyWU5oUTRGU1V4dWJXOUE2MGxBL3NkTkpZ?=
 =?utf-8?B?SjFnSFBaSjZjakdBMXkzRzNqWncxWUdMSXF2eWVRRmFaRVBQRkxHRElJRU1C?=
 =?utf-8?B?WjExWVkzcjNiUno1M2lDRUdlNU5JUFpmdW1FckplTTc3dkhiczAxNXdZOGxi?=
 =?utf-8?B?SnNTNi9PYWhCSzhaQXExMmIwV1BQVm5GbDhrSGhxVGYyQ1gvcGhEb2xvSFho?=
 =?utf-8?B?R0pRZFdXZDlvSjVFanQrTnE1WUxySG82SnBFdlNuZFVQUi9QeXdJb1QrRUdq?=
 =?utf-8?B?NnZkVmNLN2RDWDMwc1BBMUtjQzRCWDJMbWRoaDhpd3lGR0dyMWVQSFZKNVRi?=
 =?utf-8?B?dXRhMUc4cVo3YU02elE1S3BRSm1nM3kxQ0FqOG1UYnBYb2FQQlI3WnR4WVNZ?=
 =?utf-8?B?UDg2YWYwNGZJU1NTQ2VRZ2N0MVE3c1hQb0hOUkRHdnVEUE5hbnFhWS92TGht?=
 =?utf-8?B?c2xXeXJpeUVlT0E1dVh4UzRabzBhZHFNM1c3VjdEVDQ4Wjd0UjVXcnNQRHRN?=
 =?utf-8?B?TXB6OWFqTlV2WHVubHZqOUhKZWRLNFhKYlVKUWNsK2FkQ2ZncWVQKzVNWW9z?=
 =?utf-8?B?OG85MDkzaERyeGJuWjF2eEFtMkcyc1VrK01PUnVBZVgrRVdBb2luSWhuc2dU?=
 =?utf-8?B?ZGN5VWZKRzdkTEpqc3gxMTByZDF6TUVCYkVvTUR3ZXY4a3hrQTRONkJnTUcy?=
 =?utf-8?B?bTVYZ1ZJY1lERDJ1V3RYdEhtUUhYRmt5L2JEcWQrVmlHdTgyZ0JsZ0h1Q0dy?=
 =?utf-8?B?Rkp2M3V3b2YxSVdIYkpiVnc5cXMwN2E5L3RJYVZBZHdZM01MUEZFVzI3em5Z?=
 =?utf-8?B?WkhmdVMra0dCb21yeE5iSEtCbXQxVTFUdnd4b0p4ekh1aHo2QkN0OHRqejFF?=
 =?utf-8?B?Q0hLbVhXaFZBUlhjVEJTejZWUmpIS0ozN29haHhDYmw3czh0NklqTFMvUVZ1?=
 =?utf-8?B?SEJXVmhMaVlkTk14dU9PYkpCdTVkZUd6U1EwTE9UUnlBUVcwNURVVllCSzVl?=
 =?utf-8?B?eUljSElaSmxaWCtML0NxblNEbGdza2RJVEVrdDZza1F6NWxSOTdNeEJFNlR1?=
 =?utf-8?B?TmE0aUkwZTRJcnB3YXBYazlESmM2ZEZzM2pQZTBBQ096T2lmcm5hTjU1Umxu?=
 =?utf-8?B?c1VHSVpVRlpPZkdTYzVDVThGQ0lKV1NoczdWVVlycUZDNVB6M0JnVHNDVytM?=
 =?utf-8?B?QXptTHFDVVMwbGVhWWtlcFRxZVJpY0Y4clk0QThkZnM3cWlkeXhpZFRwWnhU?=
 =?utf-8?B?eVg5eHYwRmdlSnlmcWd1QW92SHJ3YWk2QkVva1poMEE2RDUwK0ZQblE2emZY?=
 =?utf-8?B?QXVzTmZtWmg4RkNvU0ZQQkMzQjZhRjdkR1Fxd1U0a1FFaWpuUzlMSzlCL1dn?=
 =?utf-8?B?MzVzU3B2MlBsQ3kvT1ZzOCtEVks2aFowcHZtR3hHU0NZL3dZNFM2czdydU0x?=
 =?utf-8?B?NncrRFVjM0lHSm9BNWF6M3A1dDNkQ0syYnc1VVFRbmk0WjJ6NmF3dTMzMGJ6?=
 =?utf-8?B?QmlqWUJXa1NJNlQwRUtCMVI4Z1BDTHFTWXc4QU4zMURmcWNTcU5XdEw3NHdN?=
 =?utf-8?Q?SSoQ=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 10:32:10.0203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0465e731-d263-4697-7cc7-08de28200fb6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997708

Hi Krzysztof,
Thanks for the quick review.

On 20/11/25 15:20, Krzysztof Kozlowski wrote:
> On 20/11/2025 10:10, Yemike Abhilash Chandra wrote:
>> From: Dale Farnsworth <dale@farnsworth.org>
>>
>> Add device tree bindings for the Video Input Port. Video Input Port (VIP)
>> can be found on devices such as DRA7xx and provides a parallel interface
>> to a video source such as a sensor or TV decoder.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> How the tag could appear here?
> 
>> Signed-off-by: Dale Farnsworth <dale@farnsworth.org>
>> Signed-off-by: Benoit Parrot <bparrot@ti.com>
>> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> 
> Who actually sent the patch and what was the original DCO chain?
> 

The original author of the VIP driver and bindings was Dale.
Benoit worked on upstreaming the driver in 2020,[1] and Sukruth
later ported it to our downstream 6.1 LTS tree. I am currently
working to upstream the driver.

Before sending v2 , I contacted Dale, Benoit, and Sukruth and
obtained their permission to retain their respective Signed-off-by tags.
I also kept Dale as the author since he was the original author.

I collected Rob's R/B from [2]

I should probably have this context in my cover letter for better clarity.
Please let me know if you would prefer the tags to be removed or modified.

[1]: https://lore.kernel.org/all/20200522225412.29440-1-bparrot@ti.com/#t
[2]: 
https://lore.kernel.org/all/176158807606.1250661.5992100889957757703.robh@kernel.org/

Thanks and Regards
Yemike Abhilash Chandra


> Best regards,
> Krzysztof


