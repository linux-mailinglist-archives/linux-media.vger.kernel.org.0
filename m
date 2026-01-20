Return-Path: <linux-media+bounces-51101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C6AD3C2C6
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 10:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D30C6427FE
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2583B8D4D;
	Tue, 20 Jan 2026 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DCq2Hau+"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010053.outbound.protection.outlook.com [52.101.61.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3A342518;
	Tue, 20 Jan 2026 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898902; cv=fail; b=AHIMMzixhqLJzO1kJ636cQMBMVSoYmjxlEAUdGfU7fnRlOgQjOoyfFIh+OrfwdQP3c2J4eIS/DPXyEBXTThgE1lZsoI16ETuzkm1+DYXxdNg2/Urfc07SX6CEC1syrQ737gOsLlxqeq7aKKnNTJcVMqJQTRg7bMUFwLKmTbyuAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898902; c=relaxed/simple;
	bh=em2Jfr+uHCThtLLxlQWbqRzKe2iXs8YZ693Mn5IdWNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZIi6D/wG3sv8Jei97UiAG+0R62kaDEnZfdGI1ro9MGL3NM+U3V889BAYC7sK5QS1JEcnq+h59U3XPlkKsOECeBDObsFFc+AidCrxZoKgCqa2n0kmDDD7mdjLK5NTRcuLWpyRR0wRT8JX7NUkgUTXT1WTApc8ZjNlSMNlbILVRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DCq2Hau+; arc=fail smtp.client-ip=52.101.61.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHQ0oUOdNUOWvyIS0n9BUw68vzCNfZI5kY5Djp58kodIxFcCzdhVZ2VjD9sn6HOLquvIdQPI1G6CsBMUhBLBhGzaFnNlRGn7SK1ZnExysFwOQap7Zxnz9y84zSvTdB43hKmtO0/WtKswbzrHZr2l8prGinRv9E8OgIJpsi34ZSEwGCqtBq6WHPAWLbnJMoT9s4Z3NkoDObBp6v2Uk6qgXNUPChSZkw7paiKyUN5OlFRduav4NkT91hgW0Akba8wSH5z12LBkX7D/u85DBnRKqhVkJ9AcQqKPpNm+rFnnCFL1mbmYrsdUleij4yvEHuNmNhy52IkZZ8kxXx6w4xqRxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMDc12/WhJUd0HlHRx6xDzCmhXumC7D0cA3GTfWmYvo=;
 b=W7Bd3bHOwpxdR48wu91h1cUNwAWSOcklWBmN8ifrHzfDJhPDrrsE2Tm+HdOsGS2nRFJzlqHs8SsSw7ATDS+vx9P7tfqdGCNeKw2Yn6oIdYeLrOd8BFfU3zu0Xj1zgkJBYA8QAne+7DgqA9hcnKuMvQWrApn7KTIaou5mC4HU7XMLhsw16W3l4vW7e/l4/jle3/+XrEz4Yi8E2EgC3woPgXAl+bNVn6dPwrXy5CAM/f20cYokXY/G3a77NVoPUz/aSiPMleTzMb+iN5uF02LhPC9PMX/JKsX5mQzPKWN3eEEehZrvmdI5xRE6Um9+9+krF0VT812zyWhgh11QNaXEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMDc12/WhJUd0HlHRx6xDzCmhXumC7D0cA3GTfWmYvo=;
 b=DCq2Hau+ksZdcpbSMZk/Z6aZ4dZ1G7yVuX6iS7+qENYQlDjAELKc8c1Jgi2eaSBGP+NbVq88qal1NxKYOq73W0j3/G5f5gy3edvA6jgD6BW20eYxOe9wi8SRCqoJsUklrytU4J+IvtcNzLPMUb9bac/qiiL8TiTNvzsT8QTthjk=
Received: from BN9PR03CA0521.namprd03.prod.outlook.com (2603:10b6:408:131::16)
 by IA3PR10MB8162.namprd10.prod.outlook.com (2603:10b6:208:513::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:48:11 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::41) by BN9PR03CA0521.outlook.office365.com
 (2603:10b6:408:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 08:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 08:48:10 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 02:48:09 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 02:48:09 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 02:48:09 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60K8m2c0923077;
	Tue, 20 Jan 2026 02:48:02 -0600
Message-ID: <82c1a585-7e49-4db8-a832-d7a8bf35e75d@ti.com>
Date: Tue, 20 Jan 2026 14:18:01 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
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
 <20251230083220.2405247-14-r-donadkar@ti.com>
 <84a6038a-4805-4cce-abaf-975a61b196e4@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <84a6038a-4805-4cce-abaf-975a61b196e4@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|IA3PR10MB8162:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b1a729-3046-4c90-2d17-08de5800a409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTNaVGRxSXhDOUh3ZTJiVkc1MGxqOENqdHZEQmM0YWNXYXF0eFhuWkhWTk9X?=
 =?utf-8?B?SnRJelVtMUhNc0xmdUY4cDN2bVpzZ3RlMFVzZ09YTTM1bHNOb1luTjRla3Nw?=
 =?utf-8?B?Tjl5MUJpbkRDQTVtQmV3dFpRRGJVbzA0K0JJclA2Q2todXhPTHd3cXhwaVZX?=
 =?utf-8?B?NmZPY2g1ZytpTUFkVFhveXlyQ0V6OU9FdG9FUHJpS21lVUVYcWhLL3M1UHdI?=
 =?utf-8?B?SVZ4bm5LaVM1K2t0MDhLWlB0YlR0ZjIvakpMZzJGQUF2NmdLYXhZZDVRSFpE?=
 =?utf-8?B?RFR6Nk1iRVZmREJGb0d6cVZOTFEyd1oxaXhCcDFCMEFHbHZ4bzBxN3B1MFFh?=
 =?utf-8?B?WmhnNlQyTnZvOGo0TC96eC9TK0RXN0hiaHBQOU1ONTR6MG9wdnNKbUJMVGFJ?=
 =?utf-8?B?TXhCKzAvSWtlSzd4NzRXek12Smtod3VxQzJaWE8rZFd0NmZFanBpM2RCVmpq?=
 =?utf-8?B?bGpYL0tGWGZ1aWhMVnZXWFdXdTV1QXhqQXdzYmpKM01tSkxEdVIxeDdxT0Ex?=
 =?utf-8?B?NEgyZ1loSCthWldxQ1dIZktvOG4xekdpSFJUdWEycWVnTlo5OHJIWkh5Q2cx?=
 =?utf-8?B?Zng1QUdVcTBRVUhnN0dReUNiYndKRGN4WWtxeTd3L2tQMVc1bnl6T1E4MXNO?=
 =?utf-8?B?aFNoZWt6MFRkUUNucUt6SUxsbW9WR3ltL0lYR2xKRkZQckJlWDRwdVliZ0hu?=
 =?utf-8?B?dHVyaU1DZGNZYkVLdWpRK0hOVUtOdFRNRWlBUlNHaTc1cUh3b3c4YjZMaVlZ?=
 =?utf-8?B?QnRZR3RZbW1NWmtBT1puTmVVVnlVRnhwNlNEL1JyaGpacTV0UWJxbGt6Nk9a?=
 =?utf-8?B?NGpOL2x0OUZDNjJsYnNxaUJMMHZmR0g3Nmg2bXVqZWJ1REZPMDhBV3hCNVJT?=
 =?utf-8?B?OGNPTEVBeEdzZWVtQ3FFdXhaOFVlVWN4TU1DVDl1NkZtUG1ZK0puTzNHZXpq?=
 =?utf-8?B?SmdCWFBUd2pjQTF6YmIvQmF0WUJYTnZmSzBVcm4xak5tNmZLUEtiWERQQ2U5?=
 =?utf-8?B?RVUrR1dzWVF5WG9sMEpYTk9UbjZ4b3dzM3grU2tMc2RURC9pS1FlQll3QThj?=
 =?utf-8?B?Y2I0WE1sNFRxdmtBRnRGbzhUNmQ1SzkrcXNyYWF1K0ZiakFhWWg2S1N2YWFh?=
 =?utf-8?B?eGMvYkZwRW1yT1VHWEY0TVoxNnBEUXhIbWlETjc4MXAzYk5wOFRUbDdtRGVy?=
 =?utf-8?B?NWRDcW5ZV1MrLytjb0NXOFNBUXNNOENjd1hhTlBMTGtwcmdrL0J4RUs2QlJ3?=
 =?utf-8?B?YkZabHRLSW1ZZm84NER1blpoMlZYY2hSdlM3YUpzVDJVWWdtRUhQNGFxbXQx?=
 =?utf-8?B?aEwwVk02Q0FLUGw1ZDF1L0xkL1p0QUljWnVSak90bU1DcVFXME1tQ0dsRmhp?=
 =?utf-8?B?dG5tT0JPQVdDR0Q5K0NEUlV5SzM2WTJvK0xzL09DYkdjUGhGS016SzBsUGdQ?=
 =?utf-8?B?Z0dTUDZGVUxRL2x6TlZzNEpVaERqdnlFbGw0NzZjSmI0Nm9MNVZwRjlaUHR3?=
 =?utf-8?B?bmhOK3BsRmpqRlFmay9LZFN5c3gvVU1BOWlWUjcvWFBPUllwNmFwL0xmSFgz?=
 =?utf-8?B?ZWhoUEk2Tjgza0xVRm1ydExwcnpsbi9zdXNPS0pmNkZ0U08yWDI1bWIwaXV3?=
 =?utf-8?B?WGhlZnpWbzBCOVpOUmtFclNyOHp1SHdsdlltZll6YUlGbVl2eWkrRDFORkVy?=
 =?utf-8?B?M2ZVTzFSMXQ1THhudTNZMU1RV3Q4aFdhOSs0THBhb0FRUWdLdHdZOThaSWZs?=
 =?utf-8?B?TUhRZVYyMUhhWGxPT2p4YTQ1b0NxRTZsek1ORW9vblhwN1BZSHo1WXJnT3pz?=
 =?utf-8?B?cDE4dEt5SUNrQ2NQZTJkYTYvTm9ncXZsL1p5SDNHM1FnL0RFR3UxQ21DRVJH?=
 =?utf-8?B?YmlCeWNWaHBpY1Q4d3BST3h6N1NuRHo1OGQrOUo5N3QrVHNOV0hreHVYTjBF?=
 =?utf-8?B?dkd6UGJUN3ZNVTVZZHVTenFYSXRES3VmT3NzQklBbkUyRUNIYko1MlVoTUl0?=
 =?utf-8?B?eHRVK3VWL3NPc1Y4aEIwMVAxZEtSdnJRaVZWQkx0QmdUK1VZbytPTzFaNjNm?=
 =?utf-8?B?OU9vSGkxQVpnSFczTnRqWkRsOUgxY0ZNWkk2Vi90Rm1BSHQ1UDhvTXY2Qm5G?=
 =?utf-8?B?VWRyUWNBeEhEMmNvQ2tmZXFya0xLTDljdWhHSk9FYmtKR2NxS2FYa25MdFJS?=
 =?utf-8?B?NWFHLzU0WTBnVzFJQUlhT2Q4M3RKTG5WRDFkWk1RL2VWZEpDeXV1akE1ekxK?=
 =?utf-8?B?dFduUFBVRFhOakNVSlB1ZUNZME1nPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:48:10.7347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b1a729-3046-4c90-2d17-08de5800a409
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8162


On 15/01/26 17:57, Tomi Valkeinen wrote:
> Hi,
>
> On 30/12/2025 10:32, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Each CSI2 stream can be multiplexed into 4 independent streams, each
>> identified by its virtual channel number and data type. The incoming
>> data from these streams can be filtered on the basis of either the
>> virtual channel or the data type.
>>
>> To capture this multiplexed stream, the application needs to tell
>> the driver how it wants to route the data. It needs to specify
>> which context should process which stream. This is done via the
>> new routing APIs.
>>
>> Add ioctls to accept routing information from the application and save
>> that in the driver. This can be used when starting streaming on a
>> context to determine which route and consequently which virtual channel
>> it should process.
>>
>> De-assert the pixel interface reset on first start_streaming() and assert
>> it on the last stop_streaming().
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 259 +++++++++++++-----
>>   1 file changed, 189 insertions(+), 70 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 6f9f34aa26f1b..4a063364f893e 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -137,6 +137,7 @@ struct ti_csi2rx_dev {
>>   		dma_addr_t		paddr;
>>   		size_t			len;
>>   	} drain;
>> +	bool                            vc_cached;
>>   };
>>   
>>   static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>> @@ -144,17 +145,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct ti_csi2rx_dev, subdev);
>>   }
>>   
>> -static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
>> -	.width = 640,
>> -	.height = 480,
>> -	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> -	.field = V4L2_FIELD_NONE,
>> -	.colorspace = V4L2_COLORSPACE_SRGB,
>> -	.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -	.xfer_func = V4L2_XFER_FUNC_SRGB,
>> -};
>> -
>>   static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_YUYV,
>> @@ -567,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>>   
>>   	/* De-assert the pixel interface reset. */
>> -	reg = SHIM_CNTL_PIX_RST;
>> -	writel(reg, csi->shim + SHIM_CNTL);
>> +	if (!csi->enable_count) {
>> +		reg = SHIM_CNTL_PIX_RST;
>> +		writel(reg, csi->shim + SHIM_CNTL);
>> +	}
> I think this is a bit messy. Here we have ti_csi2rx_setup_shim() which
> is passed ctx as a parameter, but it also does non-context stuff, if
> this is the first enable.
Right, I will shift the pixel reset code from ti_csi2rx_setup_shim() to 
ti_csi2rx_sd_enable_streams() function to make things symmetric in the 
start and stop path.
>
> In ti_csi2rx_sd_enable_streams(), we check !csi->vc_cached (which,
> afaics, is essentially also "is this the first enable"), and do stuff.
>
> The structure should be so that we have a clear
> setup-things-on-the-first-enable function, and
> setup-things-for-a-context function. Now these two things are mixed in
> together, also with the 'vc_cached' field which I think is not needed at
> all.


Yes, Thanks for pointing out, the vc_cached field can be removed entirely.

>
> Actually, maybe I'm mixing the operation of the video dev and the subdev
> here, as the single file contains both. It still looks confusing: in
> ti_csi2rx_stop_streaming() we assert reset, but we don't de-assert in
> ti_csi2rx_start_streaming(). Instead we deassert in
> ti_csi2rx_setup_shim() which is called from ti_csi2rx_sd_enable_streams().
>
> Please check these out. There most likely should be more symmetry here
> wrt. enabling and disabling things.
>
>>   
>>   	/* Negotiate pixel count from the source */
>>   	ti_csi2rx_request_max_ppc(csi);
>> @@ -889,29 +881,69 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct media_pad *pad;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *r;
>> +
>> +	/* Get the source pad connected to this ctx */
>> +	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
>> +	if (!pad) {
>> +		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
>> +		return -ENODEV;
>> +	}
>> +
>> +	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
>> +
>> +	for_each_active_route(&state->routing, r) {
>> +		if (r->source_pad == pad->index) {
>> +			ctx->stream = r->sink_stream;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	/* No route found for this ctx */
>> +	return -ENODEV;
>> +}
>> +
>>   static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct ti_csi2rx_ctx *curr_ctx;
>>   	struct v4l2_mbus_frame_desc fd;
>> -	struct media_pad *pad;
>> -	int ret, i;
>> +	struct media_pad *source_pad;
>> +	int ret;
>> +	unsigned int i, j;
>>   
>> -	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> -	if (!pad)
>> +	/* Get the frame desc form source */
>> +	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!source_pad)
>>   		return -ENODEV;
>>   
>> -	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
>>   	if (ret)
>>   		return ret;
>>   
>>   	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>>   		return -EINVAL;
>>   
>> -	for (i = 0; i < fd.num_entries; i++) {
>> -		if (ctx->stream == fd.entry[i].stream) {
>> -			ctx->vc = fd.entry[i].bus.csi2.vc;
>> -			ctx->dt = fd.entry[i].bus.csi2.dt;
>> -		}
>> +	for (i = 0; i < csi->num_ctx; i++) {
>> +		curr_ctx = &csi->ctx[i];
>> +
>> +		/* Capture VC 0 by default */
>> +		curr_ctx->vc = 0;
>> +
>> +		ret = ti_csi2rx_get_stream(curr_ctx);
>> +		if (ret)
>> +			continue;
>> +
>> +		for (j = 0; j < fd.num_entries; j++)
>> +			if (curr_ctx->stream == fd.entry[j].stream) {
>> +				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
>> +				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
>> +			}
>>   	}
>>   
>>   	return 0;
>> @@ -922,8 +954,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>> -	struct ti_csi2rx_buffer *buf;
>> -	const struct ti_csi2rx_fmt *fmt;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -938,35 +968,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> -	ret = ti_csi2rx_get_vc_and_dt(ctx);
>> -	if (ret == -ENOIOCTLCMD) {
>> -		ctx->vc = 0;
>> -		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> -		ctx->dt = fmt->csi_dt;
>> -	} else if (ret < 0) {
>> -		goto err;
>> -	}
>> -
>> -	ti_csi2rx_setup_shim(ctx);
>> -
>> -	ctx->sequence = 0;
>> -
>> -	spin_lock_irqsave(&dma->lock, flags);
>> -	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>> -
>> -	ret = ti_csi2rx_start_dma(ctx, buf);
>> -	if (ret) {
>> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>> -		spin_unlock_irqrestore(&dma->lock, flags);
>> -		goto err_pipeline;
>> -	}
>> -
>> -	list_move_tail(&buf->list, &dma->submitted);
>> -	dma->state = TI_CSI2RX_DMA_ACTIVE;
>> -	spin_unlock_irqrestore(&dma->lock, flags);
>> -
>> +	/* Start stream 0, we don't allow multiple streams on the source pad */
>>   	ret = v4l2_subdev_enable_streams(&csi->subdev,
>> -					 TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					 BIT_U64(0));
>>   	if (ret)
>>   		goto err_dma;
>> @@ -975,7 +979,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   
>>   err_dma:
>>   	ti_csi2rx_stop_dma(ctx);
>> -err_pipeline:
>>   	video_device_pipeline_stop(&ctx->vdev);
>>   	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>> @@ -990,17 +993,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	int ret;
>>   
>> -	video_device_pipeline_stop(&ctx->vdev);
>> +	mutex_lock(&csi->mutex);
>>   
>> -	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>>   
>> +	/* assert pixel reset to prevent stale data */
>> +	if (csi->enable_count == 1) {
>> +		writel(0, csi->shim + SHIM_CNTL);
>> +		csi->vc_cached = false;
>> +	}
>> +
>> +	video_device_pipeline_stop(&ctx->vdev);
>> +
>>   	ret = v4l2_subdev_disable_streams(&csi->subdev,
>> -					  TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					  BIT_U64(0));
>>   	if (ret)
>>   		dev_err(csi->dev, "Failed to stop subdev stream\n");
>>   
>> +	mutex_unlock(&csi->mutex);
>> +
>>   	ti_csi2rx_stop_dma(ctx);
>>   	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>>   }
>> @@ -1043,25 +1055,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>>   	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>   	*fmt = format->format;
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
>> -					   format->stream);
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>>   	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>>   
>> -static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> -				   struct v4l2_subdev_state *state)
>> +static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     struct v4l2_subdev_krouting *routing)
>>   {
>> -	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>> +
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
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	if (ret)
>> +		return ret;
>>   
>> -	return 0;
>> +	/* Only stream ID 0 allowed on source pads */
>> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
>> +		const struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		if (route->source_stream != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    enum v4l2_subdev_format_whence which,
>> +				    struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +
>> +	if (csi->enable_count > 0)
>> +		return -EBUSY;
>> +
>> +	return _ti_csi2rx_sd_set_routing(sd, state, routing);
>> +}
>> +
>> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = { {
>> +		.sink_pad = 0,
>> +		.sink_stream = 0,
>> +		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
>> +		.source_stream = 0,
>> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +	} };
>> +
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = 1,
>> +		.routes = routes,
>> +	};
>> +
>> +	/* Initialize routing to single route to the fist source pad */
>> +	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
>>   }
>>   
>>   static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>> @@ -1069,15 +1140,58 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>>   				       u32 pad, u64 streams_mask)
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
>> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>>   	struct media_pad *remote_pad;
>> +	struct ti_csi2rx_buffer *buf;
>> +	const struct ti_csi2rx_fmt *fmt;
>> +	unsigned long flags;
>> +	u64 sink_streams;
>>   	int ret = 0;
>>   
>> +	ret = ti_csi2rx_get_stream(ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Get the VC and DT for all enabled ctx on first stream start */
>> +	if (!csi->vc_cached) {
>> +		ret = ti_csi2rx_get_vc_and_dt(ctx);
>> +		if (ret == -ENOIOCTLCMD) {
>> +			ctx->vc = 0;
>> +			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> +			ctx->dt = fmt->csi_dt;
>> +		} else if (ret < 0) {
>> +			return ret;
>> +		}
>> +		csi->vc_cached = true;
>> +	}
>> +
>> +	ti_csi2rx_setup_shim(ctx);
>> +	ctx->sequence = 0;
>> +
>> +	spin_lock_irqsave(&dma->lock, flags);
>> +	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>> +
>> +	ret = ti_csi2rx_start_dma(ctx, buf);
>> +	if (ret) {
>> +		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>> +		spin_unlock_irqrestore(&dma->lock, flags);
>> +		return ret;
>> +	}
>> +
>> +	list_move_tail(&buf->list, &dma->submitted);
>> +	dma->state = TI_CSI2RX_DMA_ACTIVE;
>> +	spin_unlock_irqrestore(&dma->lock, flags);
>> +
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
>> -					 BIT_U64(0));
>> +					 sink_streams);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1092,17 +1206,21 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>>   	struct media_pad *remote_pad;
>> +	u64 sink_streams;
>>   	int ret = 0;
>>   
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	if (csi->enable_count == 0)
>>   		return -EINVAL;
> Correct me if I'm wrong, but I don't think this should ever happen. If
> you want, you can place it in the beginning of the func, with a WARN_ON().


Will do.


Rishikesh

>
>>   
>>   	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
>> -					  BIT_U64(0));
>> +					  sink_streams);
>>   	if (!ret)
>>   		--csi->enable_count;
>>   
>> @@ -1111,6 +1229,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   
>>   static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>>   	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
>> +	.set_routing = ti_csi2rx_sd_set_routing,
>>   	.get_fmt = v4l2_subdev_get_fmt,
>>   	.set_fmt = ti_csi2rx_sd_set_fmt,
>>   	.enable_streams = ti_csi2rx_sd_enable_streams,
>> @@ -1289,7 +1408,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>>   	sd->internal_ops = &ti_csi2rx_internal_ops;
>>   	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>   	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>>   	sd->dev = csi->dev;
>>   	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
>

