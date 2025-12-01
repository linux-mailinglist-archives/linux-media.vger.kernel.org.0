Return-Path: <linux-media+bounces-47994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEB3C98D7D
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 20:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1653A4CBE
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 19:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AAB247289;
	Mon,  1 Dec 2025 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HTxxWN7n"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA71F03DE;
	Mon,  1 Dec 2025 19:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764616952; cv=fail; b=G8SnalRpn1qw6SDdA7I3pizo0YypCqgb0O2f87hqkvVvvjCNqRCwbd5LrR/bgeMnI45tE5Y4ZILu0zTzf3AC8pmnLIa0xfny11JaDmrii2ajAPUS73cL6bonvTS0moraumNBTXshaOcNWuihbn7osTsDSQwbqtL8ZMGvoVPT908=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764616952; c=relaxed/simple;
	bh=gTOKdgxtIx/+ltIDBZFUr9loKgkFbQkASJFU8JR0gDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uXyOc4wvd9bqeN8L3orDDY5XPq0eiS+yO4BGIWvBQTF4mCYXo1R0DganFm3fcHPuLiceFxJs0Wp7veHhHXv4DrQlUy16Saiba7FEQwoUWAGJg1lXvRLO70M51VRFEV7nwCcS6SYlt9c8hfG7X+Fw9AlLncwPFum/JRwf8KJ5wlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HTxxWN7n; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URfdgWAgU9mWuH/7lgU2jrMhS2ZeIo3OYltK5Au9Kl16AdElDgxOC+3J4fa/26/kPQZbevLs7t3RFgqsuJW42qq03T8lzEAr6QJwjCHbGxSS3X1thcAG++ognd8tJ8FXsKTieRz+s4VHhkS68CIM0z2le67eIvn+F7vLKELhvsjP6Ar4YPBuyie7jcfpvboEvIS5T2YAOFKgxvDeWb1MiOuxRzLvClFtVQ4DsIuNWDFg7r+Q7kWI4+kKaJiztwWcUIkss7acPtmfs/qfs9PVwXEbQDvR5Fd9p6kh5gFIwUMIzKZ4DFO/xU9S4O5gjVgG0HlWTPJGhgtZdP9cQ2TwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUxMXYf9ZtKAAzrn5NnOZQoS4ivT35vZdBsX9GVWqSw=;
 b=dqZRvX7F9D6tzZ6GOi9A/er3178G/+t4ohGBYIIaHD3yvm4OOu5NrQWYFOb6hmZY/Rd85QHNcxLBHRA8Z56Nh7i8+xhemKhqEE2oQusOBZBWOkroqxXm9BoJybdu7f61WpqgkuuS2XRSaraeLdvCHT6ovruby6H0ztLDT9R13yVP6smA/qSHXxR3qCBcmKbnQ9wFCr6oxkP6/99qcVISB+vo7l11UuH7X5YtGE8F4Ki4AIeqKpbRtDCL94ZWo8uy7LCbfr8a8oprGjqOA8kEVDfUCiBEiNO4wTZpG+jnv/iZ3TiCfvCrpjh2Fgvn5LOFi5XKyYvx1Dn5hFb7Lp8mEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=chipsnmedia.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUxMXYf9ZtKAAzrn5NnOZQoS4ivT35vZdBsX9GVWqSw=;
 b=HTxxWN7niwuKGjqztcnPprM4yV1SfqnWmkmrs6SGQ7YdFHVpPXwmO6q4482itWcAmpXPr7KF26BXrxHNId2wRHpdLZNBn5Q8HXUbWZWPiK7tjOqEyYWGC1WK2ew7xtFK3cQ0b40cgW/tjqLuqSDAK8VcbRvV5Szpi+ueaXsXFfM=
Received: from CH5P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::22)
 by CY5PR10MB6094.namprd10.prod.outlook.com (2603:10b6:930:39::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:22:27 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::39) by CH5P221CA0003.outlook.office365.com
 (2603:10b6:610:1f2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 19:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 19:22:26 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:22:25 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 13:22:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 13:22:25 -0600
Received: from [10.247.19.198] (lt5cg2132ltw.dhcp.ti.com [10.247.19.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1JMPvH966749;
	Mon, 1 Dec 2025 13:22:25 -0600
Message-ID: <42e340ad-1257-4bde-b7bf-1efd089b05a0@ti.com>
Date: Mon, 1 Dec 2025 13:22:24 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] Performance improvement of decoder
To: Jackson.lee <jackson.lee@chipsnmedia.com>, <mchehab@kernel.org>,
	<hverkuil-cisco@xs4all.nl>, <nicolas.dufresne@collabora.com>,
	<bob.beckett@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lafley.kim@chipsnmedia.com>, <hverkuil@xs4all.nl>,
	<nas.chung@chipsnmedia.com>
References: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CY5PR10MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b17b544-2de3-4bca-f843-08de310ef63b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekw0MEdHYzRXbmtXOG4zc0RGVjk2Q05EakYrYUVqU3M1YzZ2c0NrWlphSTM0?=
 =?utf-8?B?TTcyaG82R2lkUFBycHh1QktraE4rL0dXaENaUnNKMjdxSkVUYXRLY25TVm9I?=
 =?utf-8?B?enVqczhzUWFtdVdwWkFzWFhaRXFxUWJFSlhFYjBWTVV1UU5tZkN6Z2xWWnBv?=
 =?utf-8?B?QUZEZ3A5ZHZUMkNCYlpEanprSXMyWk45ZFJIZ0VzQk5MZmlPU2VKM05aQ0NY?=
 =?utf-8?B?TVVpcUlvTUxxdVo1MXlRYUpKc2ZmRDN1clZScnlRZEtWZWpvMU93SXUxdWN4?=
 =?utf-8?B?VHpRQXVpQVlkNE5TcjF3NXBIZHR3Q0dOSWN5TU9YanZpc2JJM2lZbmNMNXgw?=
 =?utf-8?B?Q01vaDBjeEpnbUx0MFN6ZHlTczJHd21IRHpNT0J1QWRUTlBLdzZFeVVheUxl?=
 =?utf-8?B?OTRNeC81TEZFbHlwTEZzdUxUTGgrV0UyMW9aTExIemxFK0prTUdzVE80R3Ru?=
 =?utf-8?B?YzdXZDZ6TU4zNHY2NzJHSnMycWdEWnF3UmNEZ3JieUxqRXN3RCtmSG9rTTdw?=
 =?utf-8?B?dlBtWFo4WVUxazdXQU1GbHNqUUdvZUhOYkY4dmxSQmpVRUkyTndnZHBCdVMr?=
 =?utf-8?B?OW9oMndrcWZPSHNFaC9nbFlUVURJV1JSMVJ6eU9DT3dDK05yT0d0a0lrQ1FJ?=
 =?utf-8?B?TnRnOTlGUlBtazFGT0x1RXd1NmdyZDRFK2lmb2dWNktxN1VsdmZya2ZJVFlH?=
 =?utf-8?B?YU83MXAxZzZhRlF1NXN0ZzladVN3WE5JU0NnbnJvVDYvVEQzWDNsTzl4c25t?=
 =?utf-8?B?ODlkMnYweDBKMkFZWWh2ZzRTT25nSHlrZ2ZsRnM0V3lCKzJ6N2R4WlJjZnFo?=
 =?utf-8?B?OEhSUkxhZmE4T3M0QU1rbk4vMjBSd3JVNk1nQjFuWTQwQXBoczF1TCs1UnMv?=
 =?utf-8?B?aVMrY3ErWWxUanVNcGQrYkYrSXIvWmFGek5RY0xtdDF3bTVxdk5UUExVVDFv?=
 =?utf-8?B?dWZFempCWGMvVms5UDB2NVE2ZzJQZ0lJZi9jMlVTdmlKR2sreVlpdkZVeFUv?=
 =?utf-8?B?VmFzWEFRbEZ4VFRKUnRJaHFBSXhDN1B1VUNnc0tXMzhvYkF6NlpHeGZTK3gz?=
 =?utf-8?B?SytCbmJvTDZWUmRpS1pJWXJZNkR5L3BCRC9iUTBWVE5pV3M3VEdkYzExc1Bp?=
 =?utf-8?B?N2VYRkNnN25vdXlNTkw3V3VHMXQ0RUExSVMyQ0hRZC8yRnNrOTRaY0VPWklY?=
 =?utf-8?B?SFM1UjlYRERoa1dYQUhUdXBoaFdvcE1CVmtub29YTFI4YXk4WFg1MzRiZmNv?=
 =?utf-8?B?aWlOQ0hqSWJQTXg2S2h1S2V2T2YrWFJUSXFRaEt6bVlrallnV0s2ZEdtYjEx?=
 =?utf-8?B?L0xLQWFXVHlQWFZIM0Nvb1JIMEVLazc3VFU4aWFyTjRDMERCamlMMW4vc09X?=
 =?utf-8?B?NkNDR3Z6ckE0Q2ljVmRZeDlNWkpHZnlXeFhFVjdlZTloeTdDSHQvL3o1Q082?=
 =?utf-8?B?aVplblB4MWl1SnhGdEtEcE1Ua1ozUzVsSTc0dlRCbGVLVVkwQTFLdTVPUXlC?=
 =?utf-8?B?Z3ZIOERQdjZ3YTBzcVhIWGl4aWx1QVJKOWZkK0JmOFpBQkpEdTBtc0JFOXZy?=
 =?utf-8?B?OTBBdVN4c1FLMVJpZk9jOExZejVCaEtNdlROSStqV1pidzh3dXZKZ1YzVVRs?=
 =?utf-8?B?L3RER2oreXZhVUM4UmQ4RVZoMUFscTBCRi9XVXYyRldkbXpXQzJDSWdseTNv?=
 =?utf-8?B?NDBEcVQyclExRWRma1A2QXlyTzdEKzBzYndZZTlLR2J5bGhNS3VLMUpDUVh2?=
 =?utf-8?B?Z0dyQUtLRGFBbTZBUkwybGt6dlg0WmtqWUN6MUYraEJBMERjNVZRT2FJNFFJ?=
 =?utf-8?B?TVI4YkxOSHBpV0pIVjFHSDh1akNCcmFoSnI1STRlRmIxaFhaZ3BaUmdpSTNW?=
 =?utf-8?B?RFBtVFcyaTN3clJBWGczVHF3azlUa1dMbjlLKytySy96SWRFR0V1V2toREhu?=
 =?utf-8?B?SXgrTlVyQ1laOEdkOUFFRDMwT21ZMnY2ZFBnYmw0ZEpKMUw1TUpMTGhheVNm?=
 =?utf-8?B?R2h6WGNNendLWE9uVnhvT3pwTGhBcVI3QWNVcUxtY2taTkdQTGJBd3YvVDds?=
 =?utf-8?B?R0hKSE03VTB1WVNhNFd3c3Z6eU5YUVlIZ0ZqVisrRTNtdktGNWY4YU05SlBS?=
 =?utf-8?Q?yCFI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:22:26.2992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b17b544-2de3-4bca-f843-08de310ef63b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6094

Hi Jackson,

On 11/19/2025 12:25 AM, Jackson.lee wrote:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
> 
> v4l2-compliance results:
> ========================
> 
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> 
> Buffer ioctls:
>                  warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>                  warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>          test CREATE_BUFS maximum buffers: OK
>          test VIDIOC_EXPBUF: OK
>          test Requests: OK (Not Supported)
> 
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 2
> Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
> 
> Fluster test results:
> =====================
> 
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 3 parallel job(s)
> Ran 133/147 tests successfully              in 61.467 secs
> 
> (1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
>   2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)
> 
> 
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
> Ran 78/135 tests successfully               in 45.083 secs
> 
> (57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)
> 
> Running test suite JVT-FR-EXT with decoder GStreamer-H.264-V4L2-Gst1.0 Using 3 parallel job(s)
> Ran 25/69 tests successfully               in 15.176 secs
> 
> (44 fail because the hardware does not support field encoded and 422 encoded stream)
> 
> Seek test
> =====================
> 1. gst-play-1.0 seek.264
> 2. this will use waylandsink since gst-play-1.0 uses playbin.
>     if you don't want to hook up display,
>     you can run gst-play-1.0 seek.264 --videosink=fakevideosink instead
> 3. Let pipeline run for 2-3 seconds
> 4. press SPACE key to pause
> 5. press 0 to reset press SPACE to start again
> 
> gst-play-1.0 seek.264 --videosink=fakevideosink Press 'k' to see a list of keyboard shortcuts.
> Now playing /root/seek.264
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...
> Redistribute latency...aused
> 0:00:09.9 / 0:00:09.9
> Reached end of play list.
> 
> 
> Sequence Change test
> =====================
> gst-launch-1.0 filesrc location=./drc.h264 ! h264parse ! v4l2h264dec ! filesink location=./h264_output_420.yuv
> Setting pipeline to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> Redistribute latency...
> Got EOS from element "pipeline0".
> Execution ended after 0:00:00.100759170
> Setting pipeline to NULL ...
> Freeing pipeline ...
> 

I have performed all the same testing you have listed above on this 
series as well as some additional scenarios to validate performance and 
reliability. These tests were conducted using interrupts and the hrtimer 
case. The only difference I have is that my v4l2-compliance reports 47 
out of 47 tests passed instead of your 46 out of 46 - I'm sure this is 
just a version mismatch between us.

In these tests I have validated the bug I reported in patch 1 is now 
fixed. There are no more SError panics when logging is high.

I have also validated that 4K60, 2x4K30, and 8x1080p30 are meeting 
timing requirements. Those tests apply to both H264 and H265. These 
tests were conducted on TI's J784s4 SoC where I increased the CMA size 
so that Wave5 could have access to enough memory for these tests to 
work. Each of the mentioned scenarios were also ran for 30+ minutes just 
to ensure that longer running cases are valid as well.

For the series,

Tested-by: Brandon Brnich <b-brnich@ti.com>

Best,
Brandon



