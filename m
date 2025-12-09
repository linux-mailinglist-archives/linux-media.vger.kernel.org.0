Return-Path: <linux-media+bounces-48456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A25CAF7DA
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 10:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7076130847B7
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363D2D47E8;
	Tue,  9 Dec 2025 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ccGtgN9U"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703A6296BC9;
	Tue,  9 Dec 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765273434; cv=fail; b=lT9ihu2P+hE/D2ZELd/4t5HcALhNsA9XHij2fTsd04qyi1j/jr9nHzONrPczi3WwyLUVoVq3r4/MjMYJTpnKhsR/IbtW9+Qs6Yfb5pHuX5OSZyk9ULu5m3v12pfTLKIy9t70iUK5b9xqVjHCvADYDxjofevaVGZ/ceeJx+Gwy8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765273434; c=relaxed/simple;
	bh=QZ2OZAE6sllnqUQaCvFhNbtvw69oAGUmoHQvfzBrUZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D5EAq0KKocVUIlvlATRrp90WfHCTi87A//0oUpDD22+5yFy243TQrujDt3e6pCiREx7Xw5Ux8JDxLyZCTltJmHz5BDOmZcWMrlMKFXUs1NaAZVXxW8L7aZ+17Em0/Z9jrSXEf3kePUp0KGW+SH0XSXxBq0ZRTl3fXG4MD/i0L/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ccGtgN9U; arc=fail smtp.client-ip=52.101.46.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHDxXZbXnD6BxhFKfc2x/7p/hm7uiFENA7Q9hSg+6SNOersEa0y5FZtv/v43OaLf56zJZgIDki/IoKMclqmYmbUsVTeCNdhT6p8xvDcm74waEZYNJxvBr+/zp2xgyo4TcJHy6RlcvWhgIZPjkpwdM+tVz6Y0GKLuVPEXQ7L82AWYmXsmQa1wb0kOzrLPdfgPoncotQWfLDDCuBZC3NqPqYXfZglL3tWNvcnGRMcboI+wGcHxkj1j2yXpa4dNMJ3r8zug8dFutxkT4la3GXLkZ8ARN0T2LtcM/dO5Bk/tFm9oy8OWobXXNzNPpZNF7yu10LRI1PnwaUVuUHdRCqEHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+0SorsKCHKINomH1IPJgXiZzvvIwk/4Ir2OK4Qa3Vw=;
 b=ogMpY5dT0n1jpCoHOrObIV1tCALV+1EBUL2G+qSmV+JjFk7Ypm0+DIClf46UQC/RLLZO0puEB0dogpePFPoMKC1wH4nRNKh9UwuNyjZUNk/r7hMlA+sHT2oqIGwHKFd3Teuh+3Js1TqntJ8Tlycc8cvdWc978Rtpy09BVcmVqPGQsPf5z6Z8k9WjMqM5LJ90h5xa5AsqnDLdKWBUHeKHVHBKKze/7+Zzbht8TayU7XfE+DZpP1F6qYWZoKM/kXLSP9zdQuCUNgnoOgSJ9eNwtb1xE4/7Rzre9/sdKYdIQxhN6ZxCA3f4BSfsDgg2OZPDjpDMkwRm2BgKwp+GPdhPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+0SorsKCHKINomH1IPJgXiZzvvIwk/4Ir2OK4Qa3Vw=;
 b=ccGtgN9UsOsNlVdY4voDHnO0le/yULXV5mtI7MAbUZ9LBuubLLFB/Zp04HozZ0iQCwJY9BD07i5oCYhXgWu49aZP9IPtvRbdYAzEm9RvATsmKq7xLbWK0QYFCSIb7cM3pma8a1tGgd13Hn0fuMrTEMRknGzri/VjyLedXizcILk=
Received: from CH5PR02CA0007.namprd02.prod.outlook.com (2603:10b6:610:1ed::29)
 by MW6PR10MB7637.namprd10.prod.outlook.com (2603:10b6:303:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 09:43:48 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::43) by CH5PR02CA0007.outlook.office365.com
 (2603:10b6:610:1ed::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 09:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 09:43:47 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 03:43:41 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 03:43:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 03:43:41 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B99hYSH985442;
	Tue, 9 Dec 2025 03:43:35 -0600
Message-ID: <c08199da-fa69-494f-bbaa-caf0cb943cde@ti.com>
Date: Tue, 9 Dec 2025 15:13:34 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/18] media: cadence: csi2rx: add multistream support
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
 <20251112115459.2479225-13-r-donadkar@ti.com>
 <aR8PMEHTJJVlg0YM@kekkonen.localdomain>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <aR8PMEHTJJVlg0YM@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|MW6PR10MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 97036731-088d-453e-3121-08de37077348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEg0WjRwNXQrYkR5NXpmZUdvMmRCeDRHazJjN2JtanBBczN1WFh4YnlaczZT?=
 =?utf-8?B?SUkzNklDNkg1VzJNVVlZd2dMcGhjbm8vWXJaUnFvQXhseHNhWk1MMkszZlFs?=
 =?utf-8?B?VHBLZlBTeHQ4OFEyMERwSUY4U2xOVFpPQXBHcHVKdExhNDhrdHc1NWdNUmVC?=
 =?utf-8?B?ZlA2aUhZd21wWjF3Z0dzK29SOTdLcmZTbDdYMWZUZFVCMURveTFidjBrR1dr?=
 =?utf-8?B?THVrN2R4cTZtK1IwMjJhZ244MkhQZHU5QWR0bFMyUG02NTY5bm9yWGp3MGNp?=
 =?utf-8?B?SlNqbWU1dUhQbkhsK0lIQkRHMmV4VU9mS0w5VHRTelBJTVE5TmlMUEVEcHlB?=
 =?utf-8?B?amFOSGpiaDcxTzNUYU00a1FxM054VkV6elFNS1FOTWpyQnJNY3Bra3J2OTZN?=
 =?utf-8?B?OUZSNkF5YjUzUlM3MGttQVZGZkViU0lYY25qaU5VNmU4WGJyN1p0bGF2c0pl?=
 =?utf-8?B?RlFJNTNRek1yNDRSM3pld0R5TDFHdEFZd25wd3NxTUdKaHE1SEIzc3RiRVVX?=
 =?utf-8?B?S1ZURVV1QkI4bmJtZWZGVks2OHhWZzFQK1FFNWxJWThLZ3k1RGdpWFcwYWE1?=
 =?utf-8?B?dnUzWEFWc2RJV285ZHB2c2FOMGk0QVV3OWJ0TkV5MXdLMndObGJpSDRvVExt?=
 =?utf-8?B?UnNSdzFNU0lTcCtMYitqZmlxejl6ZGhHNlFrM2JVeis0SWpIdXVjdkJIMjRq?=
 =?utf-8?B?K0s3cWhFOURvckVVcUZkbEdsdURBSE5HWkFZVXZjTjBXS09WQ0E1Zi9Wdm02?=
 =?utf-8?B?cUxSdmVzQTJuVjErV1gwRlBNd3JLVkxoZVNzVGRQTzB2ODV1VkJ0ZFdLbGhJ?=
 =?utf-8?B?TkJRWFJLYVRPa0s3Sks5Uml0aDJ4cThtQitNa1ViMU42Y05LZkFzZHNWcDky?=
 =?utf-8?B?SjI5blBPbGxlN1VvQXI1emFLUVlXT1hkN0pQWDJRdUczT1Z5T1M1U0txeUM2?=
 =?utf-8?B?bDJvSHVHS3NjKytaWnZrSk1TOXA4TnBRbjdnYXBSTkZiSGVaL0sxRDZUR3FQ?=
 =?utf-8?B?U1NYWlZGQzZEVWt1ZmxwQVNGZVI4V0NiRUxXbkJmY01rb3VDcEtkRW8yOE13?=
 =?utf-8?B?dFg5b0VOU01jK3RlKzdYbTZFRlJkWWJqQStudWtZWXdvQlcvK1ZEekcxQlNX?=
 =?utf-8?B?UTQvVk0xQ3VPVFFrUTF6U3gzWXBsNGhoYW9qZ3k4clpnN0tTMzIwMHBBVzBO?=
 =?utf-8?B?eWxUWjNYR3pjYlZsZTlDellKTFd4OHNNZnhFSHRncDl0VWcxWWFCKzI4cUh1?=
 =?utf-8?B?T01QNkZhb2hhR0haSVRtWm9nOCtBUENvdDd2Wno0ODI1OVhuTTMrYUdxejVP?=
 =?utf-8?B?ejdxMWFXdWI4VWZBaU9aM09GMEg2TUpSWmJuRDZUNkcvL2lEMVoyb2xSNDRP?=
 =?utf-8?B?R3l0NmNuOVdWcG54TXVpQVRtaUQ3V2J0TTRlSmhCRGJNUlFZQzZMandCZlJY?=
 =?utf-8?B?c1RudnBaOW5YcnZ1b3E3eWw0Y2plNjBhTDQwOE5Oek5yKzVUSks2QXN6UUgr?=
 =?utf-8?B?QURucWVsSEJIQk8vU2tNNjY2YlBnOTdNdmJBNWhUTUt2b2p3QWtoYWRIRHJU?=
 =?utf-8?B?ZUNtbE1OaDd2dTdHLzlnOW5hdjJJQis4UGVWN2VObjRjNmFMaU1BWW94ZG9H?=
 =?utf-8?B?TDEwZUt3SXVRZzJNRS9ITU5qN2RWZCs4SVBQWUJMWFpURk9iZ1pveE8xdE1l?=
 =?utf-8?B?OWVMajZUKzMxRTRpSkJnTEV2Yy9zRUc4aFFOdTBNWWI2UmxDL09jU2djR3BU?=
 =?utf-8?B?ekVISUNKaklrd2laQjV0N3FOMmVoMDZ0WGFHOGRQR2Rid24yYSsxeDRBMDll?=
 =?utf-8?B?ckx5MmJwTGZwTFp2bmxuM1hwVGxuU1Y2eFEyemEveTV6VGh3dnFsTEJHRTQ2?=
 =?utf-8?B?bSsxd0RXY0ozMEFEZjkveVEwNUM2aTI2WldQbFdlTUdCRUdqSTBtdVFYZExC?=
 =?utf-8?B?OXh2T1FSMDFvRHAzajJpVUI0eHFscXFKcm5kNHpHdmlkL1pFRFNubEd4MDA1?=
 =?utf-8?B?VEp6cE1SUDV4UTJsekJxNHl5d3hLS0RvS0luSWZaSGFGcjA0ZXJ6S3JCRmxI?=
 =?utf-8?B?S016VzloTXB4Vm03cmNOeENxd0k2TEFlOExHRmNCVWR6Um56YnY1ZzM3QVF0?=
 =?utf-8?Q?OCZg=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 09:43:47.0878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97036731-088d-453e-3121-08de37077348
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7637


On 20/11/25 18:23, Sakari Ailus wrote:
> Hi Rishikesh,


Hi Sakari,

Thank you for the review !

>
> I'm not commenting on the use of {en,dis}able_streams in the series; it may
> be this area will need some work in general, including in V4L2 core.
>
> On Wed, Nov 12, 2025 at 05:24:53PM +0530, Rishikesh Donadkar wrote:
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
> What do you need this for? I presume you'd have a sub-device driver
> downstream calling this, but wouldn't you always use {en,dis}able_streams
> from that driver?


Yes, Downstream consumer driver that call this are TI Shim and StarFive 
JH7110 CAMSS. TI Shim uses {en,dis}able_streams, the StarFive JH7110 
CAMSS calls the s_stream. I will change the StarFive JH7110 CAMSS to use 
{en,dis}able_streams.


Rishikesh

>
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

