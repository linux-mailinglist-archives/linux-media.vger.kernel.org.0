Return-Path: <linux-media+bounces-51003-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CBFD39D94
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 06:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A27E3008F94
	for <lists+linux-media@lfdr.de>; Mon, 19 Jan 2026 05:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE6832F766;
	Mon, 19 Jan 2026 05:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rC2cEw2e"
X-Original-To: linux-media@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F6B1C3F36;
	Mon, 19 Jan 2026 05:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768799089; cv=fail; b=S77hX5fpfm50W8ZL9pKjoI1411Mgt86kmFt7QKzIGV4WtS1HPJvqlHHfc6WpuYv5dRBZRY6QfdjyUdJ+b7Epl1+RT+EYts0xx6TlHYYmQy80ceO3Yg71TywtolFAgWfmdhuuUAL5bWS7C6nzTssnxOSNfzxhNMScLstYDtXaFhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768799089; c=relaxed/simple;
	bh=UVvSmjGV6A50qjtwBcej6geafMEFwqKPZUDv2C7Nb6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kpBcjrxnWiJKsD++BUdh6yuK2EX7+XCCY0LtiHGEPgqAKoRwrKweBg+xoFRHXRreramQcIqAX4JNUJqr59XiMlDHSGEjXgn96SHSYdAdLJ+MNS3KlcbmCw/6RebrJ/gVvInA7d0GY26c8saXgEw6MTlXn3wYUwq+DKfUDP6Is2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rC2cEw2e; arc=fail smtp.client-ip=52.101.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SisgKRAvzoACqcuwO+jgj8f9t4sIGZ0pq/U+JbuWUz7u7Rle5pcacNbyrwKfpc9U6O01ilO2IlbYadCVRBsaCaz1oST/+W7ZHqV1tQv2qK1UFc3NCvxRDGGOkOYRcoqGkZjjrUA8/iadrLFJLMTQBJWUdOMxzqlMjzRVi4f5T/dl8B2KHP+RbPbZfGW9vj7s3hSUchu+H0MKf52hCExM9QGUoKkM00j8q4rbLKNXoEfXWHPk/OjMwL9q/aA7AZcbnNhKsR6tzY5mokfiZVQhevPvRhm97efvEtLu8h3BsTFNEGPdPGUd0mCLp6ODSV3ALcEBih5Fgvnhvf87AoyJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZquQXrBumI5aCYOZEljPxhYdo/GvZAEgPYREaXI5IA=;
 b=phnxWjSyIU/RUwiI9+lgKvRMLwzOFcjqCBtDalCQvG5XSpghZv2Yy+62neEiD17u8yeTiJQTG9/tjNV61P57kkCEE8JcJBiccXeyn0Bk7EHLMdHx1uJSEr/7oze5G93brUtHAcUOTzulbkqB69HXd7dTviHnit4kk9E5Oq/xuZ7jCd9KCMrlGj7hD0M4Ay7Hmp/Tl2c3g/4d9BFOBjq3brlqaoCniM56ll3kzA1TiV9LZk17rp8d5kqjAapo+2VI2AuiIomdAMj4Qz19vtVimoMrSDGK6L0aEeB2r3emc98Nz2eiQ9RcPN5toOutRHCkrsS6aJNiyLFQazJ0SoR0vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZquQXrBumI5aCYOZEljPxhYdo/GvZAEgPYREaXI5IA=;
 b=rC2cEw2ecfwdKzko1VnwLtCB7pFTTKYsbus+gKuKTQmzlZauRov6UeCnelyyaf1V3aqWNv2X9Yvkx+vtugp6BYimb9RtYwyq/qncDaJKrZK8UY1CpkPO+UwFNp7AzUskAED2ZPLn6UWjygSyojzBfbgZbNo5ZUdmWgR5hq00zeY=
Received: from CH2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:610:5a::24)
 by BLAPR10MB5202.namprd10.prod.outlook.com (2603:10b6:208:306::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Mon, 19 Jan
 2026 05:04:43 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::47) by CH2PR08CA0014.outlook.office365.com
 (2603:10b6:610:5a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 05:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 05:04:43 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:04:42 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 18 Jan
 2026 23:04:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 18 Jan 2026 23:04:42 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60J54YSX3097518;
	Sun, 18 Jan 2026 23:04:34 -0600
Message-ID: <25cdbefb-b1cb-4da1-b0bd-577c287a57ac@ti.com>
Date: Mon, 19 Jan 2026 10:34:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/19] media: ti: j721e-csi2rx: Change the drain
 architecture for multistream
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-16-r-donadkar@ti.com>
 <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <fbae9c01-6a2c-46ee-963a-8e5230b860b4@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|BLAPR10MB5202:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0e993e-da16-407d-e4b8-08de57184231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzhHR2JLVkhtLy8vVFB1MUZZNm1lVExmME9ZeHBLSTVJTklwSE9zMXY5Z1VE?=
 =?utf-8?B?WG9KWTRCYkwwT09ZVGp6SlBCeTNUL2JKeUZLRFRWdW9QZGVKeFc0RzIya0dy?=
 =?utf-8?B?aVJxV3dUUVFTZ2toZ1NwU0oyYzI1S3NqdUVIOUdtSDJzRkZoU1J3NmZoWXlh?=
 =?utf-8?B?Si81cjJ6eVU1akI1cEpCSEJQSFNKTHBlM3JMcWR6UUlEeTlQb0ErSFU3aHlo?=
 =?utf-8?B?d1dmWCtMMVhDTUFueFdoWk04eEtLcDg4alZGZDRFcjR5WHhXUkwydWtYK25m?=
 =?utf-8?B?SEkybFJXaWxwNTA0Q3dBTEhYL1RlVjV6N1orY09WUlNXa1dIZlBjRFgwRnkz?=
 =?utf-8?B?cGYycTNhZWVPMmxnWllqckZQMVlIWXF3dXpLZnIvUGt3STgrUTlFSk1Weklv?=
 =?utf-8?B?VE1sWGZ5SDVQc1pXcVpDZ2hxakdsRlo2Q21SenR5MmtlTnpwb000RlR1N0c1?=
 =?utf-8?B?SWw3TkJMbFl5dnVyRzJETHM4d25EdmpDTlQwejArOHNyODMwLzAyTGpmc0xw?=
 =?utf-8?B?UlZoVVhzakZ6bWo0YWxBc2kzei9PYnVLcmE0TklKMy9yb2lKOG0vajdPVVFN?=
 =?utf-8?B?a1h5Q3plVUpCbDMvc0JUNGxzQTI3cmZZb2UrV0gyRW1Jd3hiTi9OaTRQYWFx?=
 =?utf-8?B?Z2duQlErdS9EMWZSY1Z3ZXhOOHd1UUZMOGdWWFlXeklLcGlOamJHWStRckJn?=
 =?utf-8?B?ZDVjRmpRZE5xUjliMU5sU0tBbEh1enNsaWQ1ZUd2aTlPMHNON0o0ZnI3Y0xl?=
 =?utf-8?B?OHhzL1VSSHR4RWxIb09EUDh2MFhMbHl2eVJQUHV0NEdLNG5DOG8rOUdmRUQz?=
 =?utf-8?B?Y1BWOHB0TVU2aTUxdldsR0poOXFuSW1CK0hHQitMdmVlYXE0TFBMRTZKbTln?=
 =?utf-8?B?SHJJYjFhVGxYSkZQQktuMEpoaHp2U29OeC8rb3AyMTNIMFhtODc3YmhBNGha?=
 =?utf-8?B?V1hQOFlva3dSWUxLejl1Q2JJc0lTNEd2dEh4NzRkLzdHS3JEM0oxTE5vNXNt?=
 =?utf-8?B?NlhvYlk2eFBpdDhrTHQzVms0SS9mMVdaQ1h3ZWFabWNqb1h2Y3VjVjRRL2pH?=
 =?utf-8?B?Z2dNdThWa2ZIa2lqZXBvRHlUUzhpVjNtVmRTSTdpcWQzZGlsaE5ENjNVUDRM?=
 =?utf-8?B?YmFqb3RTS3JxWEUvRmFiMDZpWVBqVFBxNnRmblJjc214RHdONmJRQ0RkNjNr?=
 =?utf-8?B?M3gyNHVqdGlDWHVnZ01hcW1WSFBJcTRVVU1zWUhFNk9pci8raGlOUkZ5TVRD?=
 =?utf-8?B?NEJDK013a0FDZHpoTTNQcjFYSStEY3F3UDBaVU5VZGJsRnVoc1Zxd1BBTmMy?=
 =?utf-8?B?NXRNeWJVSis3MnQxKy9FMGJmdDZXRkgyK0xUTk1LLzQrZ3FYUkFaQmJ0Y2xs?=
 =?utf-8?B?SzBWalcxOTZLc0JoeTRNZnJVbm85ZlhKbmJWMDQvWENIbUJhNlpaaWxEWVFS?=
 =?utf-8?B?Vm5vRDUrM3orQUJXTVB1VHhxM2o1SE9oSlFrM1k1UWpFMVIwTHc5Nkw0NEJh?=
 =?utf-8?B?Q0t3VTVaWmg5UEs1TngxM2FKM0RWSWJUcndVQXhqVDdhNW9uOVNIYUg1QmJn?=
 =?utf-8?B?NTc4T09ZOUU4WUUwcjZYbGd6RjVVL3ZMUSsyaFpua2lZMW9CTHdBOVRuczZr?=
 =?utf-8?B?YUJjN3dZZzlOc0VQb3N5V0VVenFVam9Uc0JGK0Q3WTVHZHlrMjAvWXd4a1Iv?=
 =?utf-8?B?YmJCeGZWVnRsM2ZsemRnZkFVWFRZYUZDR2lNWkVaeW50cG5uNGk1VDVpeWtJ?=
 =?utf-8?B?WXY3RWJrQzdrRWMzaDZsVURjQjVaTlA2K1FwbThPdUFGQTJHV0pSVnM0N3dN?=
 =?utf-8?B?VlY5OXRGT3hwZHJTSFM4V3dNUzFRTnJBQUordlJXbVpuNTRPWnhDUzNPMUl6?=
 =?utf-8?B?Ni9lRWRuNmp1WXQ0aVpGQnp0d0FGWVRlZDFDbjRzYXZwc2JoTHNnVWdqdU5M?=
 =?utf-8?B?bkxscGFwOGdDQ2tBZWoxWWtlU2FqakVFRlNSNVB5ajVzRm9WL2ZqU1pYM2Qx?=
 =?utf-8?B?Z0xiVGNWS3g4M2ZCSFNBZ29YWExSKzkvS0ZyNTNBaGdFMmx0UkthTk9WT2w0?=
 =?utf-8?B?ZUhrTFkwS0tXdVNIY0xoazE4WTduaFdRT2xXVktqRFVvZUNtRUtiVmZQeG5t?=
 =?utf-8?B?VGcrbGE4NVY3aHV3ZDcyWGV0SkVvRVlYMllZRDh3Qmd0UDFEV2puWVNmblRs?=
 =?utf-8?B?R3VoT0U3dThPdEVkWG5vL2tYNE9GRHB1d3ViWXhlY0xWaDZtazZNeVRvaXlX?=
 =?utf-8?B?d09tdjhMdFFrbDROMEpwbHdFcDVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 05:04:43.3601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0e993e-da16-407d-e4b8-08de57184231
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5202


On 15/01/26 18:07, Tomi Valkeinen wrote:
> Hi,


Hi Tomi,

Thank you for the review !

>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> On buffer starvation the DMA is marked IDLE, and the stale data in the
>> internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
>> userspace. This approach works fine for a single stream case.
>>
>> But in multistream scenarios, buffer starvation for one stream i.e. one
>> virtual channel, can block the shared HW FIFO of the CSI2RX IP. This can
>> stall the pipeline for all other virtual channels, even if buffers are
>> available for them.
> One stream is filtered based on VC & DT, but the above only mentions VC.
> And then later uses VC when referring to the stream. I think you can
> drop the VC parts, and just talk about streams.


Okay, will do !

>
>> This patch introduces a new architecture, that continuously drains data
>> from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
>> available to the driver from the userspace. This ensures independence
>> between different streams, where a slower downstream element for one
>> camera does not block streaming for other cameras.
>>
>> Additionally, after a drain is done for a VC, the next frame will be a
>> partial frame, as a portion of its data will have already been drained
>> before a valid buffer is queued by user space to the driver.
> This makes it sounds we drain a single 32KB piece. But won't we continue
> draining that stream until the stream is stopped or the user provides a
> buffer?


Thanks for pointing out, I will change it to talk about continuous draining.

Rishikesh

>
> Also, does the DMA not offer us ways to drain a full frame? There's no
> way to e.g. set the DMA TX increment to 0, so that it would just write
> to a single location in memory? Or just set the target to void.
>
>   Tomi
>
>> Use wait for completion barrier to make sure the shared hardware FIFO
>> is cleared of the data at the end of stream after the source has stopped
>> sending data.
>>
>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 112 ++++++++----------
>>   1 file changed, 50 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index fa6152464d4b6..e713293696eb1 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -82,7 +82,6 @@ struct ti_csi2rx_buffer {
>>   
>>   enum ti_csi2rx_dma_state {
>>   	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
>> -	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
>>   	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
>>   };
>>   
>> @@ -109,6 +108,7 @@ struct ti_csi2rx_ctx {
>>   	struct v4l2_format		v_fmt;
>>   	struct ti_csi2rx_dma		dma;
>>   	struct media_pad		pad;
>> +	struct completion		drain_complete;
>>   	u32				sequence;
>>   	u32				idx;
>>   	u32				vc;
>> @@ -251,6 +251,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>>   			       struct ti_csi2rx_buffer *buf);
>>   
>> +/* Forward declarations needed by ti_csi2rx_drain_callback. */
>> +static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
>> +static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
>> +
>>   static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
>>   {
>>   	unsigned int i;
>> @@ -617,9 +621,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   
>>   static void ti_csi2rx_drain_callback(void *param)
>>   {
>> -	struct completion *drain_complete = param;
>> +	struct ti_csi2rx_ctx *ctx = param;
>> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&dma->lock, flags);
>> +
>> +	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
>> +		complete(&ctx->drain_complete);
>> +		spin_unlock_irqrestore(&dma->lock, flags);
>> +		return;
>> +	}
>>   
>> -	complete(drain_complete);
>> +	/*
>> +	 * If dma->queue is empty, it indicates that no buffer has been
>> +	 * provided by user space. In this case, initiate a transactions
>> +	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
>> +	 * will be done here, the subsequent frame will be a
>> +	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
>> +	 */
>> +	if (list_empty(&dma->queue)) {
>> +		if (ti_csi2rx_drain_dma(ctx))
>> +			dev_warn(ctx->csi->dev, "DMA drain failed\n");
>> +	} else {
>> +		ti_csi2rx_dma_submit_pending(ctx);
>> +	}
>> +	spin_unlock_irqrestore(&dma->lock, flags);
>>   }
>>   
>>   /*
>> @@ -637,12 +664,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct dma_async_tx_descriptor *desc;
>> -	struct completion drain_complete;
>>   	dma_cookie_t cookie;
>>   	int ret;
>>   
>> -	init_completion(&drain_complete);
>> -
>>   	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
>>   					   csi->drain.len, DMA_DEV_TO_MEM,
>>   					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>> @@ -652,7 +676,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   	}
>>   
>>   	desc->callback = ti_csi2rx_drain_callback;
>> -	desc->callback_param = &drain_complete;
>> +	desc->callback_param = ctx;
>>   
>>   	cookie = dmaengine_submit(desc);
>>   	ret = dma_submit_error(cookie);
>> @@ -661,13 +685,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
>>   
>>   	dma_async_issue_pending(ctx->dma.chan);
>>   
>> -	if (!wait_for_completion_timeout(&drain_complete,
>> -					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
>> -		dmaengine_terminate_sync(ctx->dma.chan);
>> -		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
>> -		ret = -ETIMEDOUT;
>> -		goto out;
>> -	}
>>   out:
>>   	return ret;
>>   }
>> @@ -716,9 +733,11 @@ static void ti_csi2rx_dma_callback(void *param)
>>   
>>   	ti_csi2rx_dma_submit_pending(ctx);
>>   
>> -	if (list_empty(&dma->submitted))
>> -		dma->state = TI_CSI2RX_DMA_IDLE;
>> -
>> +	if (list_empty(&dma->submitted)) {
>> +		if (ti_csi2rx_drain_dma(ctx))
>> +			dev_warn(ctx->csi->dev,
>> +				 "DMA drain failed on one of the transactions\n");
>> +	}
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   }
>>   
>> @@ -754,6 +773,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
>>   static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	enum ti_csi2rx_dma_state state;
>>   	unsigned long flags;
>>   	int ret;
>> @@ -763,6 +783,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>   	dma->state = TI_CSI2RX_DMA_STOPPED;
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>>   
>> +	init_completion(&ctx->drain_complete);
>> +
>>   	if (state != TI_CSI2RX_DMA_STOPPED) {
>>   		/*
>>   		 * Normal DMA termination does not clean up pending data on
>> @@ -771,11 +793,20 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
>>   		 * enforced before terminating DMA.
>>   		 */
>>   		ret = ti_csi2rx_drain_dma(ctx);
>> -		if (ret && ret != -ETIMEDOUT)
>> +		if (ret)
>>   			dev_warn(ctx->csi->dev,
>>   				 "Failed to drain DMA. Next frame might be bogus\n");
>>   	}
>>   
>> +	/* We wait for the drain to complete so that the stream stops
>> +	 * cleanly, making sure the shared hardware FIFO is cleared of
>> +	 * data from the current stream. No more data will be coming from
>> +	 * the source after this.
>> +	 */
>> +	if (!wait_for_completion_timeout(&ctx->drain_complete,
>> +					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
>> +		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
>> +
>>   	ret = dmaengine_terminate_sync(ctx->dma.chan);
>>   	if (ret)
>>   		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
>> @@ -838,57 +869,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
>>   	struct ti_csi2rx_buffer *buf;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>> -	bool restart_dma = false;
>>   	unsigned long flags = 0;
>> -	int ret;
>>   
>>   	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
>>   	buf->ctx = ctx;
>>   
>>   	spin_lock_irqsave(&dma->lock, flags);
>> -	/*
>> -	 * Usually the DMA callback takes care of queueing the pending buffers.
>> -	 * But if DMA has stalled due to lack of buffers, restart it now.
>> -	 */
>> -	if (dma->state == TI_CSI2RX_DMA_IDLE) {
>> -		/*
>> -		 * Do not restart DMA with the lock held because
>> -		 * ti_csi2rx_drain_dma() might block for completion.
>> -		 * There won't be a race on queueing DMA anyway since the
>> -		 * callback is not being fired.
>> -		 */
>> -		restart_dma = true;
>> -		dma->state = TI_CSI2RX_DMA_ACTIVE;
>> -	} else {
>> -		list_add_tail(&buf->list, &dma->queue);
>> -	}
>> +	list_add_tail(&buf->list, &dma->queue);
>>   	spin_unlock_irqrestore(&dma->lock, flags);
>> -
>> -	if (restart_dma) {
>> -		/*
>> -		 * Once frames start dropping, some data gets stuck in the DMA
>> -		 * pipeline somewhere. So the first DMA transfer after frame
>> -		 * drops gives a partial frame. This is obviously not useful to
>> -		 * the application and will only confuse it. Issue a DMA
>> -		 * transaction to drain that up.
>> -		 */
>> -		ret = ti_csi2rx_drain_dma(ctx);
>> -		if (ret && ret != -ETIMEDOUT)
>> -			dev_warn(ctx->csi->dev,
>> -				 "Failed to drain DMA. Next frame might be bogus\n");
>> -
>> -		spin_lock_irqsave(&dma->lock, flags);
>> -		ret = ti_csi2rx_start_dma(ctx, buf);
>> -		if (ret) {
>> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>> -			dma->state = TI_CSI2RX_DMA_IDLE;
>> -			spin_unlock_irqrestore(&dma->lock, flags);
>> -			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
>> -		} else {
>> -			list_add_tail(&buf->list, &dma->submitted);
>> -			spin_unlock_irqrestore(&dma->lock, flags);
>> -		}
>> -	}
>>   }
>>   
>>   static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)

