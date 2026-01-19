Return-Path: <linux-media+bounces-51004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5FD39D9B
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 06:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD631300A85D
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 05:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B9433031E;
	Mon, 19 Jan 2026 05:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Hc4m+xiT"
X-Original-To: linux-media@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729F22836E;
	Mon, 19 Jan 2026 05:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799336; cv=fail; b=rqbrEwreKiGqf4lTqGba3vDC2Xu/ALKFFoF5boAbNQDnofhTGN4AjUkgn+uqCUpbKt3Xd5wTuYNULSw5GUM0QE1HhvBf8Fo2fEvyP00NrqYh6hrOodA6Hkh9Txv3Tl8GoS28EoOuUC3uCdZVhvjpG/AqX9HN3Uo1hobyYOR3dLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799336; c=relaxed/simple;
	bh=U7QMjQaWR3+jRJpq+Zyu7AAqj6gU/3sjQwvlzu9HeC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uPrsrNq8DMT07pf3o7rDD0Bjms1COSE80rS76bQFP4iXVqt+S2XMZtnGeOBnf+xRY0n57q6vfVTdJXSnaDhWqvVl7m6ae7Xs8mQyaH8lT2ywm7USCe9eB1xQRnkTGZ1smb/TkvKga1Q4saSPt+yehRtiigUi1HLME8z1W1DJjhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Hc4m+xiT; arc=fail smtp.client-ip=52.101.52.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p++P+BE4KeEWEieLbdgli0T0F4ZMciTmAJVGqT72l4KxLh5GG0dQG3VwMejNYKzxiP3z0UcmK7CDsA79fYSPUM/QD74yywxUrx7OlYLkDBfE6iYHMB0KzSIvz5Lk8RhqYiGRnjJDjoH3H4/ioBLi1S9nYl2qzA5VnSenLEDPSHgftYxu6v7dd5OUXSKn9N0m33myvODoAgO2TAMQ7ydL8o45NeLTqCmXcIBYNka/imvZRdjQag2QE9Rc7s9f4Xdb1NdXOshLHN3VIVRusyJ+5knioCrNZfw6SjEY7XvRbaRDFIquT+xFqgEHVD818NXNd6rmNPDs3nrNBHj9fR8Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pePdyJf18a5lY2MH7RhAjQJa1KzTKiiuq3YBG1N/2AA=;
 b=Uz9umD4e+sImL2NszeO4lcIVL51TvhYzqhpqoOmseI+XxOXKopG6T7czzJUBqZcnsevr38ZQOD35KB1hrkrPcAjCQXPKojBTiYuoxlWgE1c/gGYtA4fmGPa/Gq83Q+OnVUUCCAWAAYrP72if5n0Ch/bnsHMXjTbvbqJ3ppZOjUoyLfG441g9C1g5KOcGWrn2Q/YFwfDXfDWNqc46QhAYewMTatl9fnvk00f0qCwyrgARC7md2UHVYjpIqn0MXKMSiuX1QVLaBlj+MlgwAdjhvyACwpAb8uvm8ViA4Uphkemgf05SGOXwRuq3jhQvBG/U+dwZlXIiS2Wq56C9txEHZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pePdyJf18a5lY2MH7RhAjQJa1KzTKiiuq3YBG1N/2AA=;
 b=Hc4m+xiTjT4VIo8X+L/8yNlMPRr5IfhuMy6Rz1Vj+JoP/v5yIyKyi/v6SwcQ5QAzIS8DfMNfgNQlVx+ffbmpr8xQe7J3B9+xs3u8yf3hlx/Oe+YTx56e9sMrqZnBpNuvuZT7u5WYRhC2EYbFXqyh7B6T7IYoN47tA53iS2EengQ=
Received: from SA1P222CA0187.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::14)
 by SN7PR10MB6498.namprd10.prod.outlook.com (2603:10b6:806:2a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 05:08:51 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:3c4:cafe::9c) by SA1P222CA0187.outlook.office365.com
 (2603:10b6:806:3c4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 05:08:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 05:08:50 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:08:50 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:08:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 18 Jan 2026 23:08:49 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60J58fvm2963855;
	Sun, 18 Jan 2026 23:08:41 -0600
Message-ID: <fa6a32f4-c1a5-4c91-9c7e-b148257e631b@ti.com>
Date: Mon, 19 Jan 2026 10:38:40 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/19] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
To: Jai Luthra <jai.luthra@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-16-r-donadkar@ti.com>
 <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
 <176849292515.3449975.5983605057289270065@freya>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <176849292515.3449975.5983605057289270065@freya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SN7PR10MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1fd8fc-78ee-417c-5d6d-08de5718d578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEE0OUhNNGpnZGhLTFMrM0N6clJLVzV5TVhDTEI1SzFuNDE5L0FPTnZseFdi?=
 =?utf-8?B?NWRrbG0vREhHUzNpTGprN3NlSUtMTEdyKzljQWtFZUNVanZuNVZhUmcyZi9q?=
 =?utf-8?B?NmlSZCtQNiszSkJEekxtQzkvOFBSTlE4SFh3eDZ4Q3d5Vm1IeEk3c2pLM2Zr?=
 =?utf-8?B?aDFjdWk1UUpHSVNFenY4cTkzN0RjWVZFOXkzNzJZMWcxSmx5NG9udmxMMjhl?=
 =?utf-8?B?UHR2SEkwazZXb2t4N3hma05yS3hzTUhQQWlieHczcHRHdVA0S3Vxb2s5RThN?=
 =?utf-8?B?NHA5Z2JaallWamZvNGFhVFM4MzM4VXZta01jaUZCTDBBMTkzVDJ3TGR6UkNo?=
 =?utf-8?B?SmZ1bG5lYkx1OUNRaWsxREFZRWZsdC9oYkFCRFM1aTJleW0ybHZsZzBrUU9j?=
 =?utf-8?B?TEJEMHp6VytjNUIyUGpiTk1KL21ZWDBTOFpKNGNWcURBczR0WVVja2VhM3l3?=
 =?utf-8?B?SG0vY2dUYWpsanVyOXRRZDdsUWwzcTd5eXlSR1o0UzlnVGIvRm1FdFIyQ2xH?=
 =?utf-8?B?VTNPd1loR3ExdUVGR2NGWVQvemtYUmFpcStPVE5FaDZ0eVlXY0QrMFI2dUY4?=
 =?utf-8?B?TEVKTE1RaDRwMVU1SnJuS20zUjBnTVlxWVNPNHhxOE9WSE1MUWtoODRBSmlH?=
 =?utf-8?B?c2MxanROQTlIR010MjlOTDVOVlJnZ3RCRE10MUV4UEtValZxeGFJRHQ3aHBo?=
 =?utf-8?B?dk9VTjNpMmtOZ0FlV1pDdVZLWDZ1YTFLRGtRMzQ4WWd0N3QxUFpEMmhEeC9Y?=
 =?utf-8?B?V1FEbHh2Q2pCT1E3eldZd1RLZFA1VWxqQkxxb2l0TlFsMC9kZ3I2TVg5eERq?=
 =?utf-8?B?NVhCUGNYbXhLc1lwNnpHM1J1T3ZpNUwzYzl6ZVVqTjlYVCs0ZFoyN29GbnpU?=
 =?utf-8?B?S0hCaXB0RmpRS0hKL015ZlVTWVFqRnc3U1IrZGczVUJ2ZllBdERLZDlodjF6?=
 =?utf-8?B?dG5KU1kyZWtPcElER2EvelZDVDg0SWphditzKytiMmM5MitoZTFzUGhZVy9P?=
 =?utf-8?B?OFZWR3lkbUM3YVZQV1lBZ2o4Qzc1djJzUWlRMjVpYmNPSWpsUVhwUkNiOHVI?=
 =?utf-8?B?Wmg1SzYyd3h2N2Y0by9hdkd0NDZtMC9hcDlQckxzY0ZTeFg4aTBVY3FpNTU5?=
 =?utf-8?B?Sk1MR3pIMUozYmt0NkRIY0d4bG4zUFFaWU11N1F2NTkxYWFlOGxGU1Jna0E2?=
 =?utf-8?B?SjlDaWpjZ2tsK2JRa0E2N240Ujh3dmlKZmZPS0RWZ2pDTjYvQ2dKNnQyTENu?=
 =?utf-8?B?UTd2clpkKzVZcUVmdGdST1FRdUQwSWZiVnFYRkc1QU9KRDdCREdrejZBdUNJ?=
 =?utf-8?B?MVJHYzl2ZVI4NURZbXNTTVhoOEJsdnpidUFIaUt1Rm5oK05HbHA1aUJNalJ0?=
 =?utf-8?B?Vk9UZHVRcGtHTmhTL0FhSmxFWHYxcWNMWDRPLzR3ZmRiU3hUTVRWVHhpdXlR?=
 =?utf-8?B?S2hqVmsvRkd1ZFZzYTR4WEJ3U3dBb29pc05hQzdOUDUydXV3eFIvb3dQRk8w?=
 =?utf-8?B?MFFPWXdhcjg1ZmgrUlB6Y0Z6OEJ0d2Vtazk4V2t6Z0dCalFGM1BIZmVNSGxa?=
 =?utf-8?B?RjJFK25mQUcyak5maWlWZ2N2RmZVYmxNRC9kK3NtUHpxRUV0S0dPYXhQK0FN?=
 =?utf-8?B?Tk1hL0xST0dRVHBjK0g1L3dsNkZwSDkxQ3BDdDRJY2dIejlRZ2NMdEpOaVQ1?=
 =?utf-8?B?VnRiWUdUY1c2UExob3pLUFVsZm0zUUc3NldCLzJKOU8wMnBVNHlNODc1ajdx?=
 =?utf-8?B?QXdzamZ6Kzk1NmNjNlFaVUE4SmhOZjlOZHYxRmdKLzBxbnBTUkJaamFUNmxq?=
 =?utf-8?B?aUFlYTlxT2IvZllVdUdnbWNic3ZiZlR6MDZIV2ZkazU2enFMTVhKSmFuNGt3?=
 =?utf-8?B?Y0xPcXZtTjl4amsyWkdHT29mQXJOK3UvTXJMYW1TRUJPT1VXempRU1ljUDhX?=
 =?utf-8?B?NFhzV1B6S2xUODdPT1lYbWpCak9YUnMxalBNemhiU0tBZ3lMMnJxR1NLRXZS?=
 =?utf-8?B?TzhraEJKaTlBeCthK3o2dW1TTFl5TWhtMjEwUkVWdGJ0T3A5bmphN1FTdDJF?=
 =?utf-8?B?d09zQ0tSRk91bzM2OHJRNzBqT3RQdktmZHNwNnVxakhxRjJoc29VZ2ErYk04?=
 =?utf-8?B?QzJLdGhBbHdXQUJma08zY1FWdjlvTVRuWFJzVnpuOElkQ0U3V2NTTjF3S0Ew?=
 =?utf-8?B?T1ZXaUVsVFFNR0FGVjQvWEVMUmN3dFFMdHl6R2JITTZxUzI1eW10TmNYZDA0?=
 =?utf-8?B?Q0dWdTVDUUVOa2NVMUxrVm1QY0tRPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:08:50.4792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1fd8fc-78ee-417c-5d6d-08de5718d578
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6498


On 15/01/26 21:32, Jai Luthra wrote:
> Hi Tomi,
>
> Quoting Tomi Valkeinen (2026-01-15 18:07:07)
>> Hi,
>>
>> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>>> On buffer starvation the DMA is marked IDLE, and the stale data in the
>>> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
>>> userspace. This approach works fine for a single stream case.
>>>
>>> But in multistream scenarios, buffer starvation for one stream i.e. one
>>> virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
>>> stall the pipeline for all other virtual channels, even if buffers are
>>> available for them.
>> One stream is filtered based on VC & DT, but the above only mentions VC.
>> And then later uses VC when referring to the stream. I think you can
>> drop the VC parts, and just talk about streams.
>>
>>> This patch introduces a new architecture, that continuously drains data
>>> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
>>> available to the driver from the userspace. This ensures independence
>>> between different streams, where a slower downstream element for one
>>> camera does not block streaming for other cameras.
>>>
>>> Additionally, after a drain is done for a VC, the next frame will be a
>>> partial frame, as a portion of its data will have already been drained
>>> before a valid buffer is queued by user space to the driver.
>> This makes it sounds we drain a single 32KB piece. But won't we continue
>> draining that stream until the stream is stopped or the user provides a
>> buffer?
>>
>> Also, does the DMA not offer us ways to drain a full frame? There's no
>> way to e.g. set the DMA TX increment to 0, so that it would just write
>> to a single location in memory? Or just set the target to void.
>>
> + Vignesh
>
> AFAIU the dmaengine API is the first limitation here, and the actual
> Transfer Record (TR) structure for BCDMA might support writing to a single
> address. It also might be possible to use dmaengine_prep_dma_cyclic to
> setup a auto-repeating TR like it's used for audio.. maybe that can be
> explored separate from this series.
Makes sense, if we have such API we can drain a full frame as Tomi 
suggested and also not care about the next frame being a partial one.
>
> But yes, ideally we need to set the target to void, which I don't think is
> supported by the HW (TI folks please correct me if I'm wrong :)
>
> Thanks,
>      Jai
>
>>   Tomi
>>
>>> Use wait for completion barrier to make sure the shared hardware FIFO
>>> is cleared of the data at the end of stream after the source has stopped
>>> sending data.
>>>
>>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> [...]

