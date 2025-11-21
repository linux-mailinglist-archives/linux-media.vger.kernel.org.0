Return-Path: <linux-media+bounces-47550-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA15C77A32
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 08:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 014A84E768F
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 07:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7903432570B;
	Fri, 21 Nov 2025 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CH8uNjKb"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53DC1A9B46;
	Fri, 21 Nov 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763708577; cv=fail; b=s2S1gEEh+v8FrZnwxwL962uwQ7P62JUFEQEQnW4Qxm5kUbG5J4rIlmlezqAKqhr+MP1w9KfRTv5Nl5PkKd4Ic6QPtjOzrflAqN/pr86/9lrLZsqamN4SA7NDSIcS88yWjwHFaaaVQSFrwBO7eB6JRRPkfPqp8386tsW0sNiFx3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763708577; c=relaxed/simple;
	bh=XYJSSDvHpUtKQUQMMlX9uhoBTxgwnXr20arthXV5iho=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kzCqatk8ie4mJ3WqAh1D6iE2MEWojdyaU3xdYgbqDZOc5tu9NpuGFVFOd3pk8r4NMlB9E3ez/vPvVVy+q53+RSrO8/7ihkw5L9NG3TPTSKM7DDvF5Nc6dlXLiJ48LnkT8SWbsdYlTQ0ou9JCPhz1hy8s75I9kjirPWeQkgk74LM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=CH8uNjKb; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdT0mKvs1Bxrx0uSN5dlf9pzrRIoDXaGvrrN1Ph3nwP8a9Cs3DdkDfzDJ+CqP8j6kxaE7O5d+Bcck71XUaYi945L2OcHd9V9/NpdUmmoaHOFKT5BWxL3CjSCr0M7ldTB1ha65+oR1pleP2QnDV3zeTLdYp9cpx3EXR7eIo6Qe9+3uq+kYec1RSl5zCn4fUfVa3qFMuSxhd/1GXc++kBV/cfjRaViUN90UQ3h4yXC7XieKIS6Mbo7Pd5+3xWW4JauAEo/LtQQoMdEY4D1XaDbupW/h7DUvt15gU1kJrz4iA/Zd3flffDFa6S33GHSag+p4vWktMZAWmkzno/dkCxTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R9HMwWl9rQjcYKX6/geb76wCgUICdOw/cN4R8QQH5Y=;
 b=O0GqfTiJC4L7qsWaHnCYoURBL9FJsAB4RrJqko3IEVlNRFc5ZSzSbGHIIRGRX6AkSx2m2kTxaw31M+v77cgFiaedEHlhx6snPjB/Vhzu1x2Mj2tQLIT1CoCoYOfnXTsBcjNiHdnYwXXvcF6QOFQ51r+MWZuo6wc1/Mpbn9U2EfJYjuyzEOoNqO8vYWZuzcd0WrbZnDNIZA1UppsfWHGyJFlyLk95s7YKm3J2JSrqVLdTF1u0uTf5kb0Sqrrlu9VUL21GnYrsaehj39DEHWOWsk4rIQbVGtfRUBScWrpxiMZ2gjxUiVO/PmEfKl6kIj5VTVuE1geXJDSpsgyDsuY+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R9HMwWl9rQjcYKX6/geb76wCgUICdOw/cN4R8QQH5Y=;
 b=CH8uNjKb0/g4I3DOEZcEwpuQL6g0arrAF4FEA75CF6VQx/g8bomnlNcIZvqOEuuVltazJY/610d3p56a3Qen3woCoE5ieD8RwVzoO+ibhBUWO/h7Eg9bgzafhx6F/Sejdcsc1vsrizoQnwby2GxB7Bu9esvcgtn68gwmA6EZdiE=
Received: from SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10)
 by CO1PR10MB4403.namprd10.prod.outlook.com (2603:10b6:303:9a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 07:02:52 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::a) by SJ0PR03CA0065.outlook.office365.com
 (2603:10b6:a03:331::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 07:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 07:02:52 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 01:02:48 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 01:02:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 01:02:48 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AL72foN801942;
	Fri, 21 Nov 2025 01:02:42 -0600
Message-ID: <0ef7834f-5efc-4cd3-91ac-482937debc3e@ti.com>
Date: Fri, 21 Nov 2025 12:32:41 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/18] media: cadence: csi2rx: Move to
 .enable/disable_streams API
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
 <20251112115459.2479225-8-r-donadkar@ti.com>
 <810d566f-af2e-4a19-af39-2abcc558aa6b@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <810d566f-af2e-4a19-af39-2abcc558aa6b@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|CO1PR10MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: f47688a0-d80c-4d89-15fb-08de28cbfd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VzRtYXhSYW0rUnRsS2JEbVJnWTM4UGJPN0V5WWVWZTlaaE5Ta3JKZVFtUDNG?=
 =?utf-8?B?R0dSOElKbUdWenVJdE1oVWJmd01FUGkwSUdyc1phSm1OSWlGVWhvWGpXNVRW?=
 =?utf-8?B?bnlLR2kwTkJuSVptMGxpWFMwNnhjYzc4SFV6Y2xGK0lNWmFzM0N5SHhTdG9z?=
 =?utf-8?B?VFB3YTRHa3F5VzNpanQ5cnVkRldtMWlCRXg1aVNOcmpOeW0wbmdoTTliZUlq?=
 =?utf-8?B?Y0JOQkRJUVFXTk5uK0RQSXpFbGhFb0JuSHViVzNBSjkrRm5vYm5aSGczRkhN?=
 =?utf-8?B?ZmNSWXE4VFlaTTR2QUNrdW9mMXU3OVZRQXVoU2ZWb0x4Wm1CVlFXSGlvU3Vi?=
 =?utf-8?B?ay9ybndWNHVURkJCSWRoUC9JS0xySHoyTHEyRC9qUEhDbGdkdGZnNXZqcE5V?=
 =?utf-8?B?RTgvQVJCOTZINkppemJDN1huM0twNlJFdWUvc3BCQTRRVDNITXNSYkdqTzNz?=
 =?utf-8?B?elh2Nk1XM2hZeE1EeDhZSGtyUXBFOUxRRFh5anY1UjVBM3JER3ZBU2JyY29Q?=
 =?utf-8?B?RzFNUXlFU1dUTThzTy9jYWNWSGxMeUVhSFZScTRJVHVMdXNEYmxwczdIUVNY?=
 =?utf-8?B?c1VNVlg4bHRBai9DU2JLTTZKdG95eEwvdWtyRXgyOXJvNiswcW9lem5XQlMv?=
 =?utf-8?B?TVZKaExjMW1yd0FsNms4TmlGb2dGWDMzQjYwMWZlQU1SSjgrUzgzaWZVMTQ4?=
 =?utf-8?B?RnVibWpQVUFVTmkzUlNOdExzT0N4cUFkeFVUa0VmWVdsL1UreFBmUHhBckhG?=
 =?utf-8?B?bUR2blVPQ3hUWm5lcXgrNENuMGpqaGYraUVLUWJkcHN5ZW5aMGl4VTJ4WGlF?=
 =?utf-8?B?OWROUVJiZVoycjVmQVZxbU1JZ1duUDBlQkVDQWIrZHZscGtXRUVCQVg3bWFo?=
 =?utf-8?B?NUE5VERZWmNYWDdMZEVVL2hHdFFyMkUrSFA0V2lWTFBvaXFxcklYSTJWSDRr?=
 =?utf-8?B?SzdrMEw5UXUrZUZ1ZW9OMElvZXNXOXc1dVdTcTlJbDdrUjhaazZnMWwzdXlZ?=
 =?utf-8?B?blpIYW5kM0s5S1ArOVJTemtPSWdodzc3Z1l3SzUxR3pBUVBOUHY3ZVkyRVE3?=
 =?utf-8?B?dUhicmY0T3k3bXQyRFNXYXpybXo2dXIzYnJ2a1BRSkdqRWh0cTVLdE9NaC81?=
 =?utf-8?B?YW1EMEI4WmtPb21mdmpYUm9LQkJORHgycWtudjYxeUNIcEF1NFYxalphSk9k?=
 =?utf-8?B?MktEOUpQcmV1cEVFMWhwZWV4d1d2enVGTCtmMDJlRlR2UURuVFJuVVQxZ0kx?=
 =?utf-8?B?b0szbjRaMkh2bEVhalVMYnl6MUZ3OUhkYVg4Q1k0MGRBRUtYUDEwcXVRN1Za?=
 =?utf-8?B?bjQ5NDVHZ3o3UGJhVjNBc054ZHFZL2RyaEUrVjJaOWoycnVUaDZhSFZWMzNo?=
 =?utf-8?B?TGcvTTdpZmNjUWk3REwrd0gydGQwbGl3SEsrUGY5RGJoVExwTnNKYnZtdzFo?=
 =?utf-8?B?aVpibmV3Z1lvaFZjbEl5bzE3dWVteHdvMFFVRXVaTVRKOGFjMUcxL1YxTG83?=
 =?utf-8?B?aE5oc3pyWmFtYlBVUG9VOWQ2Sy9XUjcvNVpVdW4zNXdCM0NvbEFkOGVFN3Z5?=
 =?utf-8?B?TnRYdzlEckJyQjhwQ0N6c0x4RFl4cEpFQmRiRktDbWkrREIvSUZuREMxOVZo?=
 =?utf-8?B?VUkyRVJFeW1Pd2FqZUIxZDYxMEtFTnZOaXBrc3QxYXVQQzk2RklTa0VHWUNP?=
 =?utf-8?B?YThXaUxVS2kvZWE0VUdFZVNnUUlpMkQvTE1Cem1pV1V1bm5XUzEvcytxR1ZD?=
 =?utf-8?B?bUkwUW1SRlBhODZyc0RTU1Awb0lNZW1LRCtzSm5CTmNNSmc3S2g2d2YzSktM?=
 =?utf-8?B?MnAxc2ZtS3FnNHc1QTRHNExsL0VmVGtzZjBCa0Y1M2doZXhmTFpOQk40SGVx?=
 =?utf-8?B?Mmg2NktsZmdsSEx2aUNrbElRdTBaY25xZkp6UENXaXlMUWNUSEVSQkxHSTNP?=
 =?utf-8?B?YlBXWE5qMTdvVkFsZ0NMQS9EYlRUWllDaTRyVFZ6NUFCcXdmWUEva3FWL2xj?=
 =?utf-8?B?TC84NnY3dHBkUGZESWQzYUhab05nc2dCeUs4RkdlUVFxa0dWUUxVYkxXN2Fu?=
 =?utf-8?B?dW1JWkE2MjlyWG9Ma3QvdVRlQ1hpY2pFRWorT1lYbGtKaGduVmtVOTJ5Z1B4?=
 =?utf-8?Q?m5zU=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 07:02:52.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f47688a0-d80c-4d89-15fb-08de28cbfd22
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4403


On 20/11/25 18:30, Tomi Valkeinen wrote:
> Hi,


Hi Tomi

>
> On 12/11/2025 13:54, Rishikesh Donadkar wrote:
>> The enable_streams() API in v4l2 supports passing a bitmask to enable
>> each pad/stream combination individually on any media subdev. Use this
>> API instead of  s_stream() API.
>>
>> Implement the enable_stream and disable_stream hooks in place of the
>> stream-unaware s_stream hook.
>>
>> Remove the lock that was used to serialize stream starts/stops which
>> is not required anymore since the v4l2-core serializes the
>> enable/disable_streams() calls for the subdev.
>>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   drivers/media/platform/cadence/cdns-csi2rx.c | 108 +++++++++----------
>>   1 file changed, 54 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
>> index 8c19f125da3e5..34da81893308b 100644
>> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
>> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
>> @@ -125,12 +125,6 @@ struct csi2rx_priv {
>>   	unsigned int			count;
>>   	int				error_irq;
>>   
>> -	/*
>> -	 * Used to prevent race conditions between multiple,
>> -	 * concurrent calls to start and stop.
>> -	 */
>> -	struct mutex			lock;
>> -
>>   	void __iomem			*base;
>>   	struct clk			*sys_clk;
>>   	struct clk			*p_clk;
>> @@ -268,20 +262,21 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>>   		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
>>   	union phy_configure_opts opts = { };
>>   	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>> -	struct v4l2_subdev_format sd_fmt = {
>> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>> -		.pad	= CSI2RX_PAD_SINK,
>> -	};
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_mbus_framefmt *framefmt;
>>   	const struct csi2rx_fmt *fmt;
>>   	s64 link_freq;
>>   	int ret;
>>   
>> -	ret = v4l2_subdev_call_state_active(&csi2rx->subdev, pad, get_fmt,
>> -					    &sd_fmt);
>> -	if (ret < 0)
>> -		return ret;
>> +	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
>>   
>> -	fmt = csi2rx_get_fmt_by_code(sd_fmt.format.code);
>> +	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
>> +	if (!framefmt) {
>> +		dev_err(csi2rx->dev, "Did not find active sink format\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	fmt = csi2rx_get_fmt_by_code(framefmt->code);
>>   
>>   	link_freq = v4l2_get_link_freq(src_pad,
>>   				       fmt->bpp, 2 * csi2rx->num_lanes);
>> @@ -401,16 +396,10 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>>   
>>   	reset_control_deassert(csi2rx->sys_rst);
>>   
>> -	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
>> -	if (ret)
>> -		goto err_disable_sysclk;
>> -
>>   	clk_disable_unprepare(csi2rx->p_clk);
>>   
>>   	return 0;
>>   
>> -err_disable_sysclk:
>> -	clk_disable_unprepare(csi2rx->sys_clk);
>>   err_disable_pixclk:
>>   	for (; i > 0; i--) {
>>   		reset_control_assert(csi2rx->pixel_rst[i - 1]);
>> @@ -459,9 +448,6 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>>   	reset_control_assert(csi2rx->p_rst);
>>   	clk_disable_unprepare(csi2rx->p_clk);
>>   
>> -	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
>> -		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
>> -
>>   	if (csi2rx->dphy) {
>>   		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);
>>   
>> @@ -485,38 +471,56 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
>>   	return 0;
>>   }
>>   
>> -static int csi2rx_s_stream(struct v4l2_subdev *subdev, int enable)
>> +static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
>> +				 struct v4l2_subdev_state *state, u32 pad,
>> +				 u64 streams_mask)
>>   {
>>   	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> -	int ret = 0;
>> -
>> -	mutex_lock(&csi2rx->lock);
>> -
>> -	if (enable) {
>> -		/*
>> -		 * If we're not the first users, there's no need to
>> -		 * enable the whole controller.
>> -		 */
>> -		if (!csi2rx->count) {
>> -			ret = csi2rx_start(csi2rx);
>> -			if (ret)
>> -				goto out;
>> -		}
>> +	int ret;
>>   
>> -		csi2rx->count++;
>> -	} else {
>> -		csi2rx->count--;
>> +	/*
>> +	 * If we're not the first users, there's no need to
>> +	 * enable the whole controller.
>> +	 */
>> +	if (!csi2rx->count) {
>> +		ret = csi2rx_start(csi2rx);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>> -		/*
>> -		 * Let the last user turn off the lights.
>> -		 */
>> +	/* Start streaming on the source */
>> +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
>> +					 BIT(0));
> The stream mask is u64, so better use BIT_U64. It doesn't matter here,
> but before you know it, you have switched BIT(0) to BIT(foo->bar), and
> someone sets bar to 34 and it's broken...
>
> Yes, I see this being changed later, to variable set with BIT_ULL()
> (that could be changed to BIT_U64). Nevertheless, better use the correct
> macro.


Sure, I will change it in the next revision.

>
> But a bigger issue is if this and patches 6 and 8 are correct or could
> be improved.
>
> I think in this one you remove s_stream from cdns-csi2. But the j7
> csi2rx is still calling s_stream, so it would fail with this patch. In
> patch 8 you switch j7 csi2rx from s_stream to enable_streams. But in
> patch 6 you added mutex, locking and s_stream to j7 csi2rx, and in patch
> 8 you remove that.
>
> Maybe the end result is fine, but it all does feel messy. I think the
> patches we should have are:
>
> - Use v4l2_subdev_enable_streams() in j7-csi2rx instead of calling
> s_stream. v4l2_subdev_enable_streams() will work with either .s_stream
> and .enable_stream in cdns-csi2rx
>
> - Patch 7 (with BIT_64()) to convert cdns-csi2rx
>
> - Patches 6 and 8 combined. You're essentially adding a new subdev, just
> do it right from the start with .enable_streams, state, etc., instead of
> mutex and s_stream which are removed two patches later.


Right, I will merge changes from 08/18 into 06/18.


Thanks,

Rishikesh

>
>   Tomi
>
>> +	if (ret) {
>> +		dev_err(csi2rx->dev,
>> +			"Failed to start streams %d on subdev\n", 0);
>>   		if (!csi2rx->count)
>>   			csi2rx_stop(csi2rx);
>> +		return ret;
>>   	}
>>   
>> -out:
>> -	mutex_unlock(&csi2rx->lock);
>> -	return ret;
>> +	csi2rx->count++;
>> +	return 0;
>> +}
>> +
>> +static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
>> +				  struct v4l2_subdev_state *state, u32 pad,
>> +				  u64 streams_mask)
>> +{
>> +	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
>> +
>> +	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
>> +					csi2rx->source_pad, BIT(0))) {
>> +		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
>> +	}
>> +
>> +	csi2rx->count--;
>> +
>> +	/* Let the last user turn off the lights. */
>> +	if (!csi2rx->count)
>> +		csi2rx_stop(csi2rx);
>> +
>> +	return 0;
>>   }
>>   
>>   static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
>> @@ -611,10 +615,8 @@ static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
>>   	.enum_mbus_code	= csi2rx_enum_mbus_code,
>>   	.get_fmt	= v4l2_subdev_get_fmt,
>>   	.set_fmt	= csi2rx_set_fmt,
>> -};
>> -
>> -static const struct v4l2_subdev_video_ops csi2rx_video_ops = {
>> -	.s_stream	= csi2rx_s_stream,
>> +	.enable_streams         = csi2rx_enable_streams,
>> +	.disable_streams        = csi2rx_disable_streams,
>>   };
>>   
>>   static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>> @@ -623,7 +625,6 @@ static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
>>   
>>   static const struct v4l2_subdev_ops csi2rx_subdev_ops = {
>>   	.core		= &csi2rx_core_ops,
>> -	.video		= &csi2rx_video_ops,
>>   	.pad		= &csi2rx_pad_ops,
>>   };
>>   
>> @@ -829,7 +830,6 @@ static int csi2rx_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   	platform_set_drvdata(pdev, csi2rx);
>>   	csi2rx->dev = &pdev->dev;
>> -	mutex_init(&csi2rx->lock);
>>   
>>   	ret = csi2rx_get_resources(csi2rx, pdev);
>>   	if (ret)

