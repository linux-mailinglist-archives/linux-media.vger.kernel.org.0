Return-Path: <linux-media+bounces-48457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A021CAF807
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 10:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 159B73069C97
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 09:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58E12FC88B;
	Tue,  9 Dec 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f3/Gq3ZV"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC4E2FC009;
	Tue,  9 Dec 2025 09:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765273526; cv=fail; b=b3g5RqliW4tii3q46MMk7+WJwLDdy0IllEUX+kWe65NZWq18GkPEbtrogW7TZdfU2az/O3SRv2gnfCqiA+xTklb2nyj+5011FXLgfkR2+gxO4pAOkJosEYbWdnahvPwcbfmJckWN6ZW8ftp+jM8lLmnQFUUb4TDu8eLI/SbTmZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765273526; c=relaxed/simple;
	bh=3iV0Rz4rJeSf+k5AF18U0bqiSIIPVfsXCVekbsd7GpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tc58HE6YxVQ9B2d0kf4TtanTw3m1VacKKdkNLXLHhZIwQTC4O2guo+xp2YLQdecmhDZxYr9EdiVjZNjd5AEKDzEETxeXSKaaQinUHpaUxCh0y8MzWJHeDneEwOtFUNM+iVceVRmJdpJmLjCsOOn59VxguOulHOy3aOzXtVMG9cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=f3/Gq3ZV; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6BRrtcN3MQnCItkmYfXaKcTu4EkuB5tLsliRKGPLrjk8bRVOTR+5eTaxmi/5C3zoFcE9/dly7OCJGlbloLu8JP38/n1Bf0prfe/eFSqA9WqK232pQprOknnyETAnkSfoR/+4ZDBXEjvy6jo6DlcXSxC/C+5Cn8MVndHurcqxBRJWKZTnYRa0pqsqr2H+citgcLu3/G91ziZucQ+ZRjDL7qpw3HZnkbzbXshIg6Rv7CnaFOlxSL4NR9CgiBwvJ4i81jx/uBm9Xi0FvVk84OEnhB/5LkbrZ5pcRKaKfYt7+yJnlCZfdkugzqTyOqE+D9wzegaHAW9fmtHzloUHusk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjzudqkGaJy9Z3g77JW3UtOtHSjHEBCDMjUflKx/WHM=;
 b=X0yMP1l6e6xloMA8BO/BbBEGZav0hsoxlzjdu9fEJIjiyInmUKlMx7capFeP5Dq6NI+Z0cKo7kYz7Kun3dpzSg80FYF9OXfo+4Q5w2S953GA3LRXIg3I3sKIDnfp40Y3Le3nvWcas7eXOpN3/tikNmzAOdD512zgTI4BiPD00euMhABJPraXGWdZq/btfvbxL9Wy0BehXPCf9wSGjyXFh64BEjhgnaFiX5PHb2X3U77uie4cxxUhEEH8SChUbEYQItFuauNcjEbvndHGeWPcOHDfml19Ia+R0sRkbAoO+4CQPMhBHjYzAa9avvqiC8EyZvi3RIqMP6NfgigkSGU3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjzudqkGaJy9Z3g77JW3UtOtHSjHEBCDMjUflKx/WHM=;
 b=f3/Gq3ZVwHPqd7La853YrED2CAtvUNWQHcsLWl/OZsF1Xlk8MZfvyH8JEhEKAYaTEwceyrcIEpFi5wpIX3lIaKZyAunItDwJKruSaAali6AhZyoNdbX38Y9pu8ko++nwBQUohJqIkDRF4JgqL08l1Hf6ZWIp7Hl5COHok8R7x00=
Received: from MN2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:208:23b::10)
 by SA2PR10MB4506.namprd10.prod.outlook.com (2603:10b6:806:111::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 09:45:20 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::1f) by MN2PR11CA0005.outlook.office365.com
 (2603:10b6:208:23b::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 09:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 09:45:18 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 03:45:17 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 03:45:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 03:45:17 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B99jAaK987359;
	Tue, 9 Dec 2025 03:45:11 -0600
Message-ID: <e9f18b36-2afa-4aee-8ce1-bfef9e0e9578@ti.com>
Date: Tue, 9 Dec 2025 15:15:10 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-13-r-donadkar@ti.com>
 <a531c415-a526-4cc4-8469-54f0fb77e6c3@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <a531c415-a526-4cc4-8469-54f0fb77e6c3@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SA2PR10MB4506:EE_
X-MS-Office365-Filtering-Correlation-Id: b33c1b6b-6caf-4290-ba9d-08de3707a9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnNJcDgrYU5nbk5sN1NUYkkxWjJ0MHVaNDZqbU1xbXBsaHNvYzd0Zk84aGJm?=
 =?utf-8?B?ZTVHU3Vwb3g2UU9jVTIyUDYyeVRwQVlFM3IrZU04VkZlZFdIenRXdWFJdTNN?=
 =?utf-8?B?U0U3eWdJYXRicWx3cGRpdnlBRFdkM3hHZlFTNTRXQTl6YU96ZnN2ZFdzTDB6?=
 =?utf-8?B?UGFIZVdJa3JseW0wRWVhYnU3MEZWSDZvL1Q1REdKQjBUb0xEbzVCaHhSR0Zq?=
 =?utf-8?B?M3QxdEZzRWpHVmRNYk93ZVhtSGlYZElhZjV0UzVodWFoaWVWUy9FTkNvRVZi?=
 =?utf-8?B?Ni9PUGxORHdPWmZmY0k2MTNWVnUvTkxwRXlqNkdueW13RFNTMTFPL0l6V012?=
 =?utf-8?B?TVBDTXh2Qmw5Rnd2VTFkcEhSVUNzUnVMeXgySjg0WTl5bmJ6bU1HYlE4aHVF?=
 =?utf-8?B?U1JNZWVlRnVOUzN3WXBpSkg1VGl4MDVENlYvbHE0aERYOW45aTc3UkVadE92?=
 =?utf-8?B?cFJoaXpqSEFMTys5alVoSjZBeUpVTGtlbm9CRXZ1TGZMcHVVd093WG4yRXdR?=
 =?utf-8?B?b1hSS0l4bitOK1JxN2xIM2E3eVEySWw2bWVEc01idnFuMnhINGJUc2V3Z0hH?=
 =?utf-8?B?UlRuckFhQmNwV3orQ0FGbC81NG1WVFRLemdJUFNhTUdIZFdOdkJuV0hYblli?=
 =?utf-8?B?MjR4d2hwOEFOT3g3VEpwc3ZLcDFTZDRlZThJbjZwUkNaOGFIdldvWXFEOFBh?=
 =?utf-8?B?bG16TmZMNFpvdGlTVUMrY0pZeDM5SmdtRlloT3hubWxxcHVEdkt2TmllN3dj?=
 =?utf-8?B?bjZaYzBlTlVwSXdKN0dVMHVnbFN2dW5vRXdCcXRMNWJlTk0vWnh2Y0s5WjJ1?=
 =?utf-8?B?K2kyek1yWnFTVHNITUpMc2tQczUycUZMeHh6Vi9MamZRVmJsUm84NlZobnkv?=
 =?utf-8?B?cU1TdldYT1g3cHdZTW5sQjRycjBYc1lzUHpCM2sxRjUxS2RNU243WG5rQ2p0?=
 =?utf-8?B?VFk3cEs3ZWlTVUYzNkk1OFJoMUkvTHVmSGg4V0hqR1dHdEdvUlZHdUMzKzVD?=
 =?utf-8?B?c2ZNdmVROS94cmpUWE5pdGFXMk84bW5tcEd6RGhTRVBZUTVUdS9rV1FNK05P?=
 =?utf-8?B?L3FCVVpoMkNkNHRQOUgyYWowejZQUWZwM292UFhoanJwY08zaDhXQ3RaLzdi?=
 =?utf-8?B?R2U1OEIrYmxLbGROWXVRZFkvQ0FEaWJkZnhiWGpEWk1rdGRHWWhFQ0hZdUxq?=
 =?utf-8?B?TTdzd2xicytUa1N0dEFrVXV0bHdubEdnRjBka1Rnb21YeEFvQkR2NTJqbTN2?=
 =?utf-8?B?b1Q5ZjhpeGZCNFltRjJFcU16RXZZSTVrQ1lNTTBLWStHYzNqb0RkYVBTazVL?=
 =?utf-8?B?Yis4QmorZWpEK3FQMzFjNG5JQlRYYmdaWXkySG5TTjd2YnNDSTJuRVM3eTc1?=
 =?utf-8?B?bmdDOGhNYlh4TEE2SWtheTdtSFpYMUpRVElJM2FiU0hKbk14ekQ0MTgxVE5P?=
 =?utf-8?B?NU1rMG84ZDhETVBOczFZcWVOSDg1MkRhdGhFdXlvQW1TVjhac0FtbFR0eGo3?=
 =?utf-8?B?NUNLdlJab3FPSjBDRWFUUVdSOXZ1Q1pjbitaTXBXQ0hhQUtjUWE0ZTg3MTB5?=
 =?utf-8?B?WldaRUNKOUpIMkJQWE04TlhFaU9STmZQRE5iNFh0Y3p0TUFGdUVwVFdsVVRv?=
 =?utf-8?B?MXZidGRhNVFaSEcwaFlJczc3NngrY1BQYzBRRzJicVpkNTlXK1JudzRjZjNW?=
 =?utf-8?B?bUVvT21BcCtGa1dIc3oyTGZMclhJRW5KZjRrR1l1ejIrcmlHeCtHMEgzaThS?=
 =?utf-8?B?QXk5OVBMQnFHeURjWDMvaUpJQnpIUnlLZEtkSzNjalBvNGh0SGRzZjNHcXNM?=
 =?utf-8?B?cXVha0srN2QyTTJvUDdqWkhhU2Q0R28xSno2N3FKNGtiazRxT2VYcEc4NzFN?=
 =?utf-8?B?aStHam5iR1dKN1hjdmdLUGgyOEQwQnpod29NYWpic3Exb3hkbUJTcHJBeVlq?=
 =?utf-8?B?dURibjZVRnpmZHViT2hyN3d6OUdmTUI4QW53OGhYc1BFQ09yb0F6UzR4TkRo?=
 =?utf-8?B?ZzlyYjhocytsSDVQeVVJWUJYekNLV29EbndaVGg3WlZvVkp1aDR5VzVscUJM?=
 =?utf-8?B?UHVBUEIrK3N6VDFBM01VTStPMllIYkw3TFVvcFozQ3NHMDZFWkJMdGV1dFpk?=
 =?utf-8?Q?sEfA=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:45:18.4042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b33c1b6b-6caf-4290-ba9d-08de3707a9bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4506


On 20/11/25 18:44, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
>> of data over the same physical interface using MIPI Virtual Channels.
>>
>> While the hardware IP supports usecases where streams coming in the sink
>> pad can be broadcasted to multiple source pads, the driver will need
>> significant re-architecture to make that possible. The two users of this
>> IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
>> have only integrated the first source pad i.e stream0 of this IP. So for
>> now keep it simple and only allow 1-to-1 mapping of streams from sink to
>> source, without any broadcasting.
>>
>> Implement a fallback s_stream hook that internally calls enable_stream
>> on each source pad, for consumer drivers that don't use multi-stream
> Hmm... So earlier in this series the .s_stream was removed from
> cdns-csi2rx. Did that break the "consumer drivers that don't use
> multi-stream"? What are those consumers? I assume it means j7-csi2rx and
> the above-mentioned starfive camss?
>
> Change the starfive camss to use v4l2_subdev_enable_streams() before the
> patch that converts cdns-csi2rx from .s_stream to .enable_stream?


Okay, will add one more patch to do this.


Rishikesh

>
>   Tomi
>
>> APIs to still work. The helper function v4l2_subdev_s_stream_helper()
>> form the v4l2 framework is not used here as it is meant only for the
>> subedvs that have a single source pad and this hardware IP supports
>> having multiple source pads.
>>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 283 ++++++++++++++++---
>>   1 file changed, 236 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 3688077fa8347..833bc134f17cb 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -135,6 +135,7 @@ struct csi2rx_priv {
>>   	struct phy			*dphy;
>>   
>>   	u8				num_pixels[CSI2RX_STREAMS_MAX];
>> +	u32				vc_select[CSI2RX_STREAMS_MAX];
>>   	u8				lanes[CSI2RX_LANES_MAX];
>>   	u8				num_lanes;
>>   	u8				max_lanes;
>> @@ -273,30 +274,43 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
>>   
>>   static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   {
>> -	struct media_pad *src_pad =
>> -		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>>   	union phy_configure_opts opts = { };
>>   	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>> -	struct v4l2_subdev_state *state;
>>   	struct v4l2_mbus_framefmt *framefmt;
>> +	struct v4l2_subdev_state *state;
>>   	const struct csi2rx_fmt *fmt;
>> +	int source_pad = csi2rx->source_pad;
>> +	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
>>   	s64 link_freq;
>>   	int ret;
>> +	u32 bpp;
>>   
>>   	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>>   
>> -	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> -	if (!framefmt) {
>> -		dev_err(csi2rx->dev, "Did not find active sink format\n");
>> -		return -EINVAL;
>> -	}
>> +	/*
>> +	 * For multi-stream transmitters there is no single pixel rate.
>> +	 *
>> +	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
>> +	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
>> +	 */
>> +	if (state->routing.num_routes > 1) {
>> +		bpp = 0;
>> +	} else {
>> +		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> +		if (!framefmt) {
>> +			dev_err(csi2rx->dev, "Did not find active sink format\n");
>> +			return -EINVAL;
>> +		}
>>   
>> -	fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		fmt = csi2rx_get_fmt_by_code(framefmt->code);
>> +		bpp = fmt->bpp;
>> +	}
>>   
>> -	link_freq = v4l2_get_link_freq(src_pad,
>> -				       fmt->bpp, 2 * csi2rx->num_lanes);
>> -	if (link_freq < 0)
>> +	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
>> +	if (link_freq < 0) {
>> +		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
>>   		return link_freq;
>> +	}
>>   
>>   	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
>>   							 csi2rx->num_lanes, cfg);
>> @@ -394,11 +408,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   					  csi2rx->num_pixels[i]),
>>   		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
>>   
>> -		/*
>> -		 * Enable one virtual channel. When multiple virtual channels
>> -		 * are supported this will have to be changed.
>> -		 */
>> -		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
>> +		writel(csi2rx->vc_select[i],
>>   		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>>   
>>   		writel(CSI2RX_STREAM_CTRL_START,
>> @@ -486,18 +496,59 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>>   	return 0;
>>   }
>>   
>> +static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
>> +				    struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_mbus_frame_desc fd = {0};
>> +	struct v4l2_subdev_route *route;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	/* Capture VC=0 by default */
>> +	for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
>> +		csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
>> +
>> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
>> +	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
>> +		dev_dbg(csi2rx->dev,
>> +			"Failed to get source frame desc, allowing only VC=0\n");
>> +		return;
>> +	}
>> +
>> +	/* If source provides per-stream VC info, use it to filter by VC */
>> +	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
>> +
>> +		for (i = 0; i < fd.num_entries; i++) {
>> +			if (fd.entry[i].stream != route->sink_stream)
>> +				continue;
>> +
>> +			csi2rx->vc_select[cdns_stream] |=
>> +				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
>> +		}
>> +	}
>> +}
>> +
>>   static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   				 struct v4l2_subdev_state *state, u32 pad,
>>   				 u64 streams_mask)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	u64 sink_streams;
>>   	int ret;
>>   
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>> +
>>   	/*
>>   	 * If we're not the first users, there's no need to
>>   	 * enable the whole controller.
>>   	 */
>>   	if (!csi2rx->count) {
>> +		csi2rx_update_vc_select(csi2rx, state);
>>   		ret = csi2rx_start(csi2rx);
>>   		if (ret)
>>   			return ret;
>> @@ -505,10 +556,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>>   
>>   	/* Start streaming on the source */
>>   	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
>> -					 BIT(0));
>> +					 sink_streams);
>>   	if (ret) {
>>   		dev_err(csi2rx->dev,
>> -			"Failed to start streams %d on subdev\n", 0);
>> +			"Failed to start streams %#llx on subdev\n",
>> +			sink_streams);
>>   		if (!csi2rx->count)
>>   			csi2rx_stop(csi2rx);
>>   		return ret;
>> @@ -523,9 +575,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>>   				  u64 streams_mask)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	u64 sink_streams;
>> +
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
>> -					csi2rx->source_pad, BIT(0))) {
>> +						 csi2rx->source_pad, sink_streams)) {
>>   		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>>   	}
>>   
>> @@ -538,6 +595,36 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>>   	return 0;
>>   }
>>   
>> +static int csi2rx_s_stream_fallback(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *route;
>> +	u64 mask[CSI2RX_PAD_MAX] = {0};
>> +	int i, ret;
>> +
>> +	/* Find the stream mask on all source pads */
>> +	state = v4l2_subdev_lock_and_get_active_state(sd);
>> +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
>> +		for_each_active_route(&state->routing, route) {
>> +			if (route->source_pad == i)
>> +				mask[i] |= BIT_ULL(route->source_stream);
>> +		}
>> +	}
>> +	v4l2_subdev_unlock_state(state);
>> +
>> +	/* Start streaming on each pad */
>> +	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
>> +		if (enable)
>> +			ret = v4l2_subdev_enable_streams(sd, i, mask[i]);
>> +		else
>> +			ret = v4l2_subdev_disable_streams(sd, i, mask[i]);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>>   				 struct v4l2_subdev_state *state,
>>   				 struct v4l2_subdev_mbus_code_enum *code_enum)
>> @@ -550,12 +637,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>>   	return 0;
>>   }
>>   
>> +static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
>> +			       struct v4l2_subdev_state *state,
>> +			       struct v4l2_subdev_krouting *routing)
>> +{
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>> +	int ret;
>> +
>> +	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>> +		return -EINVAL;
>> +
>> +	ret = v4l2_subdev_routing_validate(subdev, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
>> +}
>> +
>> +static int csi2rx_set_routing(struct v4l2_subdev *subdev,
>> +			      struct v4l2_subdev_state *state,
>> +			      enum v4l2_subdev_format_whence which,
>> +			      struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	int ret;
>> +
>> +	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
>> +		return -EBUSY;
>> +
>> +	ret = _csi2rx_set_routing(subdev, state, routing);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>>   static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   			  struct v4l2_subdev_state *state,
>>   			  struct v4l2_subdev_format *format)
>>   {
>>   	struct v4l2_mbus_framefmt *fmt;
>> -	unsigned int i;
>>   
>>   	/* No transcoding, source and sink formats must match. */
>>   	if (format->pad != CSI2RX_PAD_SINK)
>> @@ -567,14 +698,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   	format->format.field = V4L2_FIELD_NONE;
>>   
>>   	/* Set sink format */
>> -	fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>   	*fmt = format->format;
>>   
>> -	/* Propagate to source formats */
>> -	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
>> -		fmt = v4l2_subdev_state_get_format(state, i);
>> -		*fmt = format->format;
>> -	}
>> +	/* Propagate to source format */
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>> +	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>> @@ -582,21 +715,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
>>   static int csi2rx_init_state(struct v4l2_subdev *subdev,
>>   			     struct v4l2_subdev_state *state)
>>   {
>> -	struct v4l2_subdev_format format = {
>> -		.pad = CSI2RX_PAD_SINK,
>> -		.format = {
>> -			.width = 640,
>> -			.height = 480,
>> -			.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> -			.field = V4L2_FIELD_NONE,
>> -			.colorspace = V4L2_COLORSPACE_SRGB,
>> -			.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -			.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	struct v4l2_subdev_route routes[] = {
>> +		{
>> +			.sink_pad = CSI2RX_PAD_SINK,
>> +			.sink_stream = 0,
>> +			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
>> +			.source_stream = 0,
>> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>>   		},
>>   	};
>>   
>> -	return csi2rx_set_fmt(subdev, state, &format);
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = ARRAY_SIZE(routes),
>> +		.routes = routes,
>> +	};
>> +
>> +	return _csi2rx_set_routing(subdev, state, &routing);
>>   }
>>   
>>   int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
>> @@ -630,17 +764,70 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
>>   				 struct v4l2_mbus_frame_desc *fd)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +	struct v4l2_mbus_frame_desc source_fd = {0};
>> +	struct v4l2_subdev_route *route;
>> +	struct v4l2_subdev_state *state;
>> +	int ret;
>> +
>> +	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
>> +	if (ret)
>> +		return ret;
>> +
>> +	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
>> +
>> +	state = v4l2_subdev_lock_and_get_active_state(subdev);
>> +
>> +	for_each_active_route(&state->routing, route) {
>> +		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
>> +		unsigned int i;
>> +
>> +		if (route->source_pad != pad)
>> +			continue;
>> +
>> +		for (i = 0; i < source_fd.num_entries; i++) {
>> +			if (source_fd.entry[i].stream == route->sink_stream) {
>> +				source_entry = &source_fd.entry[i];
>> +				break;
>> +			}
>> +		}
>> +
>> +		if (!source_entry) {
>> +			dev_err(csi2rx->dev,
>> +				"Failed to find stream from source frame desc\n");
>> +			ret = -EPIPE;
>> +			goto err_missing_stream;
>> +		}
>> +
>> +		fd->entry[fd->num_entries].stream = route->source_stream;
>> +		fd->entry[fd->num_entries].flags = source_entry->flags;
>> +		fd->entry[fd->num_entries].length = source_entry->length;
>> +		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
>> +		fd->entry[fd->num_entries].bus.csi2.vc =
>> +			source_entry->bus.csi2.vc;
>> +		fd->entry[fd->num_entries].bus.csi2.dt =
>> +			source_entry->bus.csi2.dt;
>> +
>> +		fd->num_entries++;
>> +	}
>> +
>> +err_missing_stream:
>> +	v4l2_subdev_unlock_state(state);
>>   
>> -	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
>> +	return ret;
>>   }
>>   
>>   static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>> -	.enum_mbus_code	= csi2rx_enum_mbus_code,
>> -	.get_fmt	= v4l2_subdev_get_fmt,
>> -	.set_fmt	= csi2rx_set_fmt,
>> -	.enable_streams         = csi2rx_enable_streams,
>> -	.disable_streams        = csi2rx_disable_streams,
>> -	.get_frame_desc	= csi2rx_get_frame_desc,
>> +	.enum_mbus_code		= csi2rx_enum_mbus_code,
>> +	.get_fmt		= v4l2_subdev_get_fmt,
>> +	.set_fmt		= csi2rx_set_fmt,
>> +	.get_frame_desc		= csi2rx_get_frame_desc,
>> +	.set_routing		= csi2rx_set_routing,
>> +	.enable_streams		= csi2rx_enable_streams,
>> +	.disable_streams	= csi2rx_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
>> +	.s_stream	= csi2rx_s_stream_fallback,
>>   };
>>   
>>   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>> @@ -649,6 +836,7 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>>   
>>   static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
>>   	.core		= &csi2rx_core_ops,
>> +	.video		= &csi2rx_video_ops,
>>   	.pad		= &csi2rx_pad_ops,
>>   };
>>   
>> @@ -876,7 +1064,8 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>>   	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
>>   		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
>> -	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
>> +		V4L2_SUBDEV_FL_STREAMS;
>>   	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
>>   
>>   	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,

