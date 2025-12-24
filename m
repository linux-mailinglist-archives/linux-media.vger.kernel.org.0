Return-Path: <linux-media+bounces-49457-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF31CDBF9D
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 11:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD619304F137
	for <lists+linux-media@lfdr.de>; Wed, 24 Dec 2025 10:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2F5313E01;
	Wed, 24 Dec 2025 10:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OiSzker6"
X-Original-To: linux-media@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C80C280033;
	Wed, 24 Dec 2025 10:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571660; cv=fail; b=vFGLcqCzpjGW+1ZIqsTxXx/P/CKGBvqGfPKHvrWh3cVDKaiBDCUHiWba7BHDkc0egR8FCg8tS4uDNBO7Gm8v1ESIN96VAGVlB8T7DexEfIRGNa/YzmcaDbjKETRCT5CANHV/4gF1uVRcRUUA5pzbPEmkkKXHlEAG4nIa3XAbKno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571660; c=relaxed/simple;
	bh=4vpfboFJI8jslPhNkIPlModzvK0g45ECxkBVuHo4ZAQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yf0Fjr/Ot5NcVa65QltyWqoQSy3Z6g+oNVaODpOIogSzK2lxEMqaJjioXIp+GXySDmtnnxZP4WKWJN/4eBIUcy3vxth1ujWcajxwy/gDCN1PmL+eLOQMMW7mizhPYaIw1pbeP3KKX2xcwpcNXUHZJO3n/42tlMfUpwuC77N1FSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OiSzker6; arc=fail smtp.client-ip=52.101.48.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqAx2pAXRZ3qy/3oIls1Ssagr7t2t6XAbqJAbcxHpKu7ITQRZ0IlUxMofoEW6d78f3/L9ErOupEnSNPvUD+4plFfi4UW8Fr6jPcYJxRWpHWYjJeJOhZEzGfZ7pQcikQ4AMMIFafTt058iYRrSRz9bZmG4tAFasQprKYRMNpRSBQkJXhrbo7bKK5VMxdnd3glo8A3sqQP5GLSIx9iI2hyRevQyLtkM/dShSMs6QQ2ln0j3x5JMOklnSlRU9MOSC7iXgGPzcuuSZZNPmFLR97HqmojLdYUIsq7/NFZI3QxxEgvmQ5lje9QJ2v396skQcDbp3sHdR7GtJ/ldHfwARIslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJxTtSGUDeBCmKQRihyq0A48l9avtqh4GtepRf/CuWY=;
 b=XzIDUz6fIVsKTgdcnBbJAf1S4oQtAE8z9YPmJCmDiQS8u11dy2LgJw05tGZ56hjBearZaqk6svAVFi07aRJ+tlydWP/F0Xi76Iw9fpslCU3NogpuasbaREA6M3q5hlZkExkl7SkVtB4f70lFguVrgb6scnvKHfFOYQxGMRNNfkz3lSZaiUQ+ZeNVcGcwxvqLRXOYDYfb2GZqSFnSlDqk9Ppg6QyfJNeo28kV/XZLZ1EVAgE77s2CkLpyP/eR+eIYLMqsA2uzKavcuuD+GL1iIvclNrAJ2A5bEQCh73vvv7wE8dgCgaDL80hVIPmYe5YZinahdqQwKOxQ1/lLd6vtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJxTtSGUDeBCmKQRihyq0A48l9avtqh4GtepRf/CuWY=;
 b=OiSzker6aHcmEkhMLYueHB2ZyWilVLwhVfHQUI1fezPxmnRHvs26UFrGDZrUfHCgUi0I9SWPaSNdVF7tRTH3vDQe1655oewdOrDUXF4FuZLBOO3S8qJGw7YTrQbp3VjfdQB22S0xLUdz6UKMNGjonz2c4y3EkFbt3biXEL3wI3o=
Received: from MN2PR11CA0009.namprd11.prod.outlook.com (2603:10b6:208:23b::14)
 by LV3PR10MB7940.namprd10.prod.outlook.com (2603:10b6:408:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 10:20:55 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::7c) by MN2PR11CA0009.outlook.office365.com
 (2603:10b6:208:23b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Wed,
 24 Dec 2025 10:20:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Wed, 24 Dec 2025 10:20:54 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:20:50 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Dec
 2025 04:20:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Dec 2025 04:20:50 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BOAKk8e412110;
	Wed, 24 Dec 2025 04:20:46 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<sbellary@baylibre.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V7 0/4] Add support for TI VIP
Date: Wed, 24 Dec 2025 15:50:23 +0530
Message-ID: <20251224102027.3343361-1-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|LV3PR10MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: da25cd97-e8b7-4106-0ecc-08de42d61f00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5QPhgs4nBGMK76LrmYJLt/iIzn9xztQ9aaIB/E63/gtImPIs8NKkBduZUIRu?=
 =?us-ascii?Q?Gtapu7TEn8UjWHu6dFSSkuwEr11yK1tUOo4uNQzRRAjm6Wx54IxBjUUlUWUo?=
 =?us-ascii?Q?ST+/Biiekfj21+6ZlgQCrrHskCzYPCI7fqmVped0Dp85zANa0Egef09Nytsh?=
 =?us-ascii?Q?b6wPlDhpKJ3Oul+pd1K+a7fhknE2QHdK1mv9qWNGPpqrcyyog0npIDTagCc9?=
 =?us-ascii?Q?sqsh57n+1Qfnlns/3rmeqLtKrokcN3a7tuxGjeMHA5assV0pIRM6HL0dAPSt?=
 =?us-ascii?Q?pbEUUXT6dv7DHKcB8JnDXvgrZB6bs+UEqKgcN6ilfTUmf7bON1rYTe7ZF+4G?=
 =?us-ascii?Q?avfKfXc6PDCfEDWwitNg6oJGEIHzGW3JhILRW8NNDK24pNiaTJt1r6ar1B4D?=
 =?us-ascii?Q?GslqpFiETRBnWD26PlPPdrlgyi5DmxlOiTpEwEmLXi+QMlhW5Oyiv/AdJZk4?=
 =?us-ascii?Q?Z9885KTCSjhN95Q/iLWoJOnHNWmmIczJQI/yAAZR7Vkk4A3VLSxCcWCcHD3p?=
 =?us-ascii?Q?q4T6D4Zng8NWHhQPQerBdNNvfpPHEOuJyPan0eWJhJSxWw2zV/aFW6DrrCcG?=
 =?us-ascii?Q?RfzN/TDP0/3gPcIX2OyXw3yudn42RvopaaLleVFtbW/bMXw0je9f5m1H7G1y?=
 =?us-ascii?Q?yt94RjNeh0KSIsV5JXDfpAKa4hSdpxzVPV0Vol8LxLt6vQamSkvDVxhBPB7J?=
 =?us-ascii?Q?Mk8iiaW+dJgMjxysGIeRXwl4iNJBkUZesPHV9/xVrB+PH8VhIoZcSgEVsP3m?=
 =?us-ascii?Q?sucHOriYNpa9dJMeSDgMGMJcNRTP8shakrIaxrILFYr37xKyliA3KhaMZLP1?=
 =?us-ascii?Q?QirJ6lclOVbQ7A7bTgzrLnoHtMaULa4bFM691ev6CXXVkSuQoMSCKMG6BNp0?=
 =?us-ascii?Q?3Ml4e4TpOVZ9vlM0FIc1T5er9nyx307YrLm3VCVdafqv72QJj7ZdUaphQtWM?=
 =?us-ascii?Q?jFxtmXIbQ26rU8+WsLfytav/MAF/VfBKFfHdVLrVbDwyG9z4w5cdDVhVOK1t?=
 =?us-ascii?Q?PoIbcFXRajLxE2VodF9lv+0rHvUDUcJpo+vDu404St8nL9jqD5FihABEBuC9?=
 =?us-ascii?Q?Tgv/jtvl5+dbSlnA+EWZFUnX53PBS7tESozOtGvk1XlUsrsIvVzBCyFZ3WZD?=
 =?us-ascii?Q?MG2M48i/KykOSIzTp2A4VmLNLl0TAXYb1XNLWagTDh2yQkdm33kHL3VMjM6p?=
 =?us-ascii?Q?2uPQvALPd9IzrDARhUDdeqDzFLdE6Tq/cJpLMxxh6lj4eu5G9ReLH6q89gVL?=
 =?us-ascii?Q?FtYaDF42dKi6QHk73WHTb6GYwc1h1JBWaiVOV9OlN+fde7IZu2L5SHH1/YZo?=
 =?us-ascii?Q?+ZiYHIprnqnTASW+hW4wAu8LEgjkR7QdR2rGTbF+fF10AQr+4MoSes6LNAhy?=
 =?us-ascii?Q?3rJ7fpzRGCq+PFpJDFTuINfnwbgqg21uGUH8LwOWHQKf/ejloPjkUHEdMAX2?=
 =?us-ascii?Q?9VhixSbxV1jJ/5DKdniTma2/Y5wuZR3rPznmZEBipEsu4VXUIqWo+KM2IhjN?=
 =?us-ascii?Q?BjFDosQnopvz3L0vh/PI9nLT/DKR6C/+b/ByJsMweKYCj17rkkCObtxIBoUK?=
 =?us-ascii?Q?JrGQzIvW/iMMMkLvC0o=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 10:20:54.2670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da25cd97-e8b7-4106-0ecc-08de42d61f00
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7940

This patch series adds support for the TI VIP. VIP stands for Video
Input Port, it can be found on devices such as DRA7xx and provides
a parallel interface to a video source such as a sensor or TV decoder.

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

Note: The main intention behind updating this series is to address
the warnings reported by Media CI at [1].

[1]: https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/88224108/artifacts/report.htm

Changelog:
Changes in v7: 
- Fix overflow warning by casting to u32 while doing reg_write in enable_irqs(). (Media CI)
- In function add_out_dtd(), initialize max_width and max_height by replacing else if
  with else to avoid possible use of uninitialized variables warning. (Media CI)
- Add missing error code when video_device_alloc() fails in alloc_stream(). (Media CI)
- Fix inconsistent indentation in switch-case block in vip_probe_complete(). (Media CI)
- Correct pm_runtime_get_sync() handling in vip_probe() by checking ret < 0 instead of ret. (Media CI)
- Add missing goto path when we fail to ioremap in vip_probe() for proper error handling. (Media CI)
- Avoid passing zero to PTR_ERR() in vip_probe_slice() by using PTR_ERR_OR_ZERO(). (Media CI)
- Prevent possible NULL dereference in vip_process_buffer_complete() by using list_first_entry_or_null(). (Media CI)

v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/37fe86055f5f754d825dd18f739ee4c4
v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/f53334765660eaa2fcb3b880596d4878

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/c95bd8aab9d8a43aa91286aab885f87c
Link for v6: https://lore.kernel.org/all/20251120091030.2081594-1-y-abhilashchandra@ti.com/

Note: The original author of the VIP is Dale. Benoit and Sukruth have also contributed to this
driver in various capacities in our downstream tree. Before starting the upstreaming effort,
I reached out to Dale, Benoit, and Sukruth and obtained their consent to retain their respective
Signed-off-by tags.


Dale Farnsworth (2):
  dt-bindings: media: ti: vpe: Add support for Video Input Port
  media: ti: vpe: Add the VIP driver

Yemike Abhilash Chandra (2):
  media: ti: vpe: Re-introduce multi-instance and multi-client support
  media: ti: vpe: Export vpdma_load_firmware() function

 .../devicetree/bindings/media/ti,vip.yaml     |  152 +
 MAINTAINERS                                   |    1 +
 drivers/media/platform/ti/Kconfig             |   13 +
 drivers/media/platform/ti/vpe/Makefile        |    2 +
 drivers/media/platform/ti/vpe/vip.c           | 3673 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  717 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
 drivers/media/platform/ti/vpe/vpdma.h         |    6 +
 8 files changed, 4614 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


