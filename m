Return-Path: <linux-media+bounces-48547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5E5CB28E9
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 10:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D29C3016728
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 09:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE273043D0;
	Wed, 10 Dec 2025 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I+uEPfHu"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D12236E5;
	Wed, 10 Dec 2025 09:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358736; cv=fail; b=HTJvawL/uZ2/4VaWKJH1oWaTzgK6gKstG+zkQ1xdgaD5e11e7JvUJMrX0UhE7kAcvBdQms/4va8jPb2CNf2fZoV4G9nR4aweaw2ZzVTLr0VBjIMRMCh7BvaMQPxwEvpmsC24wgZSYzrUYw9oQVpElIsQGCINQaCNHmRBpLiPaxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358736; c=relaxed/simple;
	bh=j5RSMXrz+Q9pnDbJFNi0LQaTtNH2eTQMY2WdEo2B+3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XtnSPWPoi08G2JzT8O/dsVm8NdAsIQpqPgNxF35I2p1r+dI1uPX7Qnm16G8j9iaR0Fr/LO09cZOV5JeiO/h98JUzY8hy3nJOJE9YGnN9SxrmnRgrO3vSPsLNdy5MwsutuEFYckPijFa3l1tASXCYJ7O6zqlQh44MIOV3HKOSuAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I+uEPfHu; arc=fail smtp.client-ip=52.101.201.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1u8Juo2eW46EpJ349ibKMQRJaLrPEvjveasJuVRvU8wJZUbHA0VsiSCZ9Tjuga0YoXl5AQB92R0ZuI7RZUdrvIih0qkZaCpsGzlX30E22inPEttvZ5s1v48J0HKX2np0X1aSmr42Ej3NlXsNYg945Ih2x49WbN3dI8Ope0bD/MeOPyaKpncfGWQ0IhJhv6lN2hQU12wExSaQnm9cBGiBorFJRlD5uHz22hNTTwtMwKfCv1QVVHH8siiVKKkTqA+ISU/4PPEGt/grRtlJXjUl7fl8shmDgKPBZGNsH+saCHuDRa+Hh1GNlT8AK1usUS15VrcKlv+VJDjZwuBkvtQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQW+pxJf6vZ6zb5vRyMEwctFIj/KU78Ai/gjoVLCVfo=;
 b=wGeH86uy034oROMuJIi8KPh9U+vLsn++njusocbA4JJP+dnmD815R2c329iGGM14b9KshCl+5dySEuKgWkO77OzXTOlL/4wqGZSMbZwU4G/gJ2boYYGRWLmuH+WrJDD0s/eywHrIyRK+Hbax8pzBB7Rs5bU4zHNQhSQwKl4hI7VDT2zgwzaxQPNrmTQjmM0AO1JUA3Vr7OvUIkb/RaRTFaLDviMA2ctx0nNVnCFdMC3eVZZ4P4O4BbNgdKqCU2/+fj7bN9NV+J2xG50aNeH2WqbnuCj2V2lpNAKq55exSg6mOU8OVnnRpGPX5zlCxRCCYnBDSTsSt5VugkVIwbMljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQW+pxJf6vZ6zb5vRyMEwctFIj/KU78Ai/gjoVLCVfo=;
 b=I+uEPfHugXhBYP8RTDhdoOStDWRxhb7ZvmjVEmATg2eUlngpJW2YiDUKBbrsufRkq/YLdgWFRYfaPxRtkLJ0yVxSvdM1kiDnowBfvdz8pLCFzIXC3RVuM1f6cvXXUAmfzVIogKNKoK9YmrDBQx2VWCIclv70Nl8CEnYoJl18wCk=
Received: from SN6PR16CA0040.namprd16.prod.outlook.com (2603:10b6:805:ca::17)
 by CY8PR10MB7292.namprd10.prod.outlook.com (2603:10b6:930:7a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 09:25:30 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:805:ca:cafe::71) by SN6PR16CA0040.outlook.office365.com
 (2603:10b6:805:ca::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.7 via Frontend Transport; Wed,
 10 Dec 2025 09:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 10 Dec 2025 09:25:30 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 03:25:27 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 10 Dec
 2025 03:25:27 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Dec 2025 03:25:27 -0600
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BA9P5x32700949;
	Wed, 10 Dec 2025 03:25:06 -0600
Message-ID: <d3c8df6a-f9d7-4ce3-9da5-25af98be91c3@ti.com>
Date: Wed, 10 Dec 2025 14:55:05 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/4] media: dt-bindings: ti,ds90ub960: Refactor port
 definitions
To: Rob Herring <robh@kernel.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <hverkuil@xs4all.nl>,
	<sakari.ailus@linux.intel.com>, <laurent.pinchart@ideasonboard.com>,
	<hansg@kernel.org>, <mehdi.djait@linux.intel.com>, <ribalda@chromium.org>,
	<git@apitzsch.eu>, <vladimir.zapolskiy@linaro.org>,
	<benjamin.mugnier@foss.st.com>, <dongcheng.yan@intel.com>, <u-kumar1@ti.com>,
	<jai.luthra@linux.dev>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251202102208.80713-1-y-abhilashchandra@ti.com>
 <20251202102208.80713-2-y-abhilashchandra@ti.com>
 <20251205151158.GA158904-robh@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20251205151158.GA158904-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CY8PR10MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2d5324-c662-4749-8fc6-08de37ce0fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1pyTVJDNUZHUzg5RHFqWkZTL1pjZitQaXlrbkNzU2ZzdkpGOEtYbkUyblBP?=
 =?utf-8?B?NUhjbnZUdHJRTTdxeWtDWWxHazZ6MHlXaFkxY3lTd1Nwc0ZtY1NOdDZ3a0dt?=
 =?utf-8?B?NTBHTXl2Wlc4SW9SamN1VUNRTldNOWZnRmZzM1BuYTFqY1pDTTc2L3BQMENP?=
 =?utf-8?B?a2FYeVBVeE04MHQzV3pXWVVsU2F3NVNiQ3NJOSsxVEw0akZLbVYyMFpWbnJs?=
 =?utf-8?B?WkhGY0VtaHl6dGd1Zk9Gbm9IVWEwcVcrT0tKbTc1TzE2b1RxSE5vSFhKZlBt?=
 =?utf-8?B?NXNxYjRjMmNQZEhEY0lVTnlsOStjTG1mQXBXSDZSWEtPYlpNZWZZR2tKMXkr?=
 =?utf-8?B?ZlpNZjUzMEdWRHhCbkl4QTRRYVZreXY2bTRuNDFRR1JjaWxiMjRRVjVHMlFO?=
 =?utf-8?B?azNUTjlMRWhDTG1XNDBXT21FeTdHZGFreCtSTWJBeUxwQ3hIOXlLNHBJSjFp?=
 =?utf-8?B?cld0THBiSm1NRlNWenZWbktJeEI4T3ZjanhQeVN0L3dFbUU1WVV4cjhNMnRN?=
 =?utf-8?B?VlVCMWJRb0h1dzRSTlMxT0RjL1JWUUlFZWFOV2xHeHJ3WkJlK2J5L1NBdmtx?=
 =?utf-8?B?UCtudEY0ZW9CUVNjd212L0tsZVRtbWo2YysrRThoSUt4VzlvTjVWeDd0c2pa?=
 =?utf-8?B?L2cyUjZEemZkeHJ0ZVQzeW9QK3M0T1BHSUoxdlN5bE5KdTZHbnkrV3NSUHdp?=
 =?utf-8?B?U0xnVzBHb3hyUitqWTJESTlRQjEyVGZlWTN1ajZ2Z25jZHhJYUtlNDR0dDJH?=
 =?utf-8?B?bzNUK2gwRDd0aHl0a2JRYzFtWXJLZlZJMDQycVFQTWkycU1iVWRuUUZ1dm9q?=
 =?utf-8?B?WU5VZTFHb0NtaGhtSXRjaEFLMEFmUXU0N2RwbTkxWnNLdkVuTXpvbWNkM05y?=
 =?utf-8?B?elVkaXNTYS9Pd1dRNzk4cjM5bkhNdDhocWRhOXkyLzVUMFRiOXFYT3JaMDRV?=
 =?utf-8?B?RHZWL1p4ZUtxbXZkdDJqVFErVzFFSEh1bWIvUkNycW44TDBsRzBwTEI0ZDgr?=
 =?utf-8?B?WUN4SGNTeDVvRDM0T0lpY044OXgwbkNZNzhLMFlLRVF5cmx3NWtHWTJGcmhW?=
 =?utf-8?B?d1ZxZnhqZEFuTFZDaVU1cldJMUUwWHl4R0FRQUxCN1cvL1lxTjdqSmE4YjNM?=
 =?utf-8?B?VUN3UnRyZDdqNXVhTEVpK3o4U05rRUN0ZkxTUm5LcHJ5M29xbVhZcmk5QUph?=
 =?utf-8?B?MTNBdUkxMTc1d0ZrTk5tKzFIVEJpMWtmR2ZYWHMzSDBZcFNEeXBMN3N1NG9Q?=
 =?utf-8?B?YllCMTVFOFhkU2VmQXVBZTQ1U1A0YVdpZjdibFhWTE9HVkZMZzRhSzR1MnZp?=
 =?utf-8?B?MXM1R1JMNDdGeVVxa2hyOENxU3N1ekYvZmFqWVpGKzlxazh4Y284WWZXYnZ0?=
 =?utf-8?B?TE14d1dXR2FEdXZjbnllVVlEYlcyT0xNOGJzdGN1dU04SURERmU3bU9wMU8r?=
 =?utf-8?B?OERCR01JYWpYSHN3ZjNGcjJIN1R2QkkxdTBQZGRnMDQ3RFdmczB1dlY0TkVz?=
 =?utf-8?B?eHFXd2N6czVRY1NNQTBCd1BBU2tGN1c4TWI1d3hrK0RINzI0OGdVdlo5VVhJ?=
 =?utf-8?B?ZjJ0ZVcrOUtNR2xlc3BtWWdmaitYNS9NMi93ZjJHaWRMd25ObmRMK2hoTVlD?=
 =?utf-8?B?NG9vQzZRdzVuZ05XMHI0K1lBeTkxUEtzK3ZTK0U2ZjNCcFZpc0hweTdmTUJ1?=
 =?utf-8?B?NDJWbGVXbkdkZXYrcDVHeXVULzJnSFcwRVUvRU5manhGRTdLR0ZTU2pkNEl2?=
 =?utf-8?B?bmJ3c2o0ZDZNbldWbTQxU0FnRWN3a24vZndqN0JsL085b3pUYXhFWUVTK3lk?=
 =?utf-8?B?YzRGUmFvM1NHL3dvbVY0ZlFmVXB1bHFwUnVSRFF0SVhWeWVJZ1ZVUmVmdTJN?=
 =?utf-8?B?YkFWcnRNQ3dBV05OWTNjMVhLMlR1ckhSYWszU3lJeDg4YVpScHVsMnYvc2tv?=
 =?utf-8?B?TUpXZEM2N29OVlAwajE2RFo2MXNYTDJNUElSUXgwdTIwOTBmL2RsV2FPMUJp?=
 =?utf-8?B?THVFM0h5ZitRWTRRT1hCdnIwVGtXcXhia3haYWZrTHVNQmZsOEdlcUFhYm8v?=
 =?utf-8?B?aXR5WHRPbXBMK3pyZUF6ZnJ6QTF2V0VSbVFoR1ppZ1ZFS0dFOHVwTmNLaGsx?=
 =?utf-8?Q?zXMk=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:25:30.2103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2d5324-c662-4749-8fc6-08de37ce0fe1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7292

Hi Rob,
Thanks for the review.

On 05/12/25 20:41, Rob Herring wrote:
> On Tue, Dec 02, 2025 at 03:52:05PM +0530, Yemike Abhilash Chandra wrote:
>> The current bindings duplicate the port definitions for each FPD-Link RX
>> and CSI-2 TX ports. This results in a large amount of repeated schema
>> blocks and makes it harder to extend the bindings for new devices.
>>
>> Refactor the bindings by introducing shared deftinitions for FPD-Link
>> input ports and CSI-2 output ports. No functional change intended.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   .../bindings/media/i2c/ti,ds90ub960.yaml      | 120 +++++++-----------
>>   1 file changed, 44 insertions(+), 76 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> index 0539d52de422..6a78288aebaa 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
>> @@ -125,102 +125,35 @@ properties:
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> +    description: |
> 
> Don't need '|' unless you have formatting to preserve.
> 

Understood. I will fix this in v3.

>> +      Ports represent FPD-Link inputs to the deserializer and CSI TX outputs from the deserializer.
>> +      Their number is model-dependent.
> 
> 'The number of ports is...'
> 
> Wrap lines at 80.
> 

I will fix this in v3.

Thanks and Regards,
Yemike Abhilash Chandra

>>   
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/FPDLink-input-port'
>>           description: FPD-Link input 0
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -            description:
>> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> -              hsync-active and vsync-active must be defined.
>> -
>>         port@1:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/FPDLink-input-port'
>>           description: FPD-Link input 1
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -            description:
>> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> -              hsync-active and vsync-active must be defined.
>> -
>>         port@2:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/FPDLink-input-port'
>>           description: FPD-Link input 2
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -            description:
>> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> -              hsync-active and vsync-active must be defined.
>> -
>>         port@3:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/FPDLink-input-port'
>>           description: FPD-Link input 3
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -            description:
>> -              Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> -              hsync-active and vsync-active must be defined.
>> -
>>         port@4:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/CSI2-output-port'
>>           description: CSI-2 Output 0
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -
>> -            properties:
>> -              data-lanes:
>> -                minItems: 1
>> -                maxItems: 4
>> -              link-frequencies:
>> -                maxItems: 1
>> -
>> -            required:
>> -              - data-lanes
>> -              - link-frequencies
>> -
>>         port@5:
>> -        $ref: /schemas/graph.yaml#/$defs/port-base
>> -        unevaluatedProperties: false
>> +        $ref: '#/$defs/CSI2-output-port'
>>           description: CSI-2 Output 1
>>   
>> -        properties:
>> -          endpoint:
>> -            $ref: /schemas/media/video-interfaces.yaml#
>> -            unevaluatedProperties: false
>> -
>> -            properties:
>> -              data-lanes:
>> -                minItems: 1
>> -                maxItems: 4
>> -              link-frequencies:
>> -                maxItems: 1
>> -
>> -            required:
>> -              - data-lanes
>> -              - link-frequencies
>> -
>>       required:
>>         - port@0
>>         - port@1
>> @@ -236,6 +169,41 @@ required:
>>     - clock-names
>>     - ports
>>   
>> +$defs:
>> +  FPDLink-input-port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    unevaluatedProperties: false
>> +    description: FPD-Link input
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +        description:
>> +          Endpoint for FPD-Link port. If the RX mode for this port is RAW,
>> +          hsync-active and vsync-active must be defined.
>> +
>> +  CSI2-output-port:
>> +    $ref: /schemas/graph.yaml#/$defs/port-base
>> +    unevaluatedProperties: false
>> +    description: CSI-2 Output
>> +
>> +    properties:
>> +      endpoint:
>> +        $ref: /schemas/media/video-interfaces.yaml#
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          data-lanes:
>> +            minItems: 1
>> +            maxItems: 4
>> +          link-frequencies:
>> +            maxItems: 1
>> +
>> +        required:
>> +          - data-lanes
>> +          - link-frequencies
>> +
>>   unevaluatedProperties: false
>>   
>>   examples:
>> -- 
>> 2.34.1
>>


