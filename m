Return-Path: <linux-media+bounces-47459-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED05C730DE
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 10:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9144A4EC9C9
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9511B30FF24;
	Thu, 20 Nov 2025 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R3HzLfOF"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012067.outbound.protection.outlook.com [40.93.195.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA178F54;
	Thu, 20 Nov 2025 09:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629847; cv=fail; b=pyolBBN4mPTouSK0BHRc9ilRyiJQZbG2WddY9fuCBYyvrxrqeh5Q1y5efsSG2UpX6+RnI9qInfXG3WvE8xXKdjzVWS1B4ijh++CQlDGIm5KQWXmcNH5r8sH17n2xwGqo2uI6hz6DIU+wmDKvp9ihCkOWTO0B6y0Kk3o9nsYfsuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629847; c=relaxed/simple;
	bh=jcWlr3ynAX28+s97fQa6gbHSxCosuZXIvrUiVTAHLi8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R/PBmAb1IUNx7DsAThhFJza/I1YF6VYMo7P9mzjfx9iqZBFNQ4sBcl3Dd2dzg5m17wO/maafhh26jRwG4F3efMe3zON34n5NWvq8ismlkD9YFYyhSVCKy504e+38CXo2NQiRl3HTxioXGi0429ML3XEiYSnRjftIMn2tuiMi4j8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=R3HzLfOF; arc=fail smtp.client-ip=40.93.195.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoUpSJ1bz6qntTZT1eKOGRkP4ZVk+ufu14BrsLQiG7fYIVPxM06Nl1plblSfMRBmnpmew+fMNcVJ3+cZLYL+C00PXU1D0P5F0M9BPnOh3mrfXqrCgKqr3x/GqgDuWyB6mw7XVijP9Lx3M9wqEGCDr4csps4hj1vsVSfRHNmkDHZyB+p6lHlVYEgLbq2jbmWK0CU58gd95VuNCQbF69yhyTm2USocgucIuOCVRBd5kQhgcfO/OU+pVDVBjIyRvFCRih0kSbMOVSrZV4k6Oo/NFETLFPYlwke9BW1evRniHNcXABsNKSE0HZPJqHHyuNPKDdivRtYozOVMA+MC/bHkiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFTc2VDstp7N9Nwhs2AETmEas8/fPWdCe0LY1uP5kEo=;
 b=jZELY4QFJa4VTLX+4YOWlv+GMZtcUYRABJJfFk5NHRO09/S/WoridziQCBDxXrEgKk7jUVV7ngoJguGFixW5ALp0x+fAz1o4hBO6N+9cIHxSe9L++sSUCeO+V+ARKUjbKPRx9qd47JPecSkdl2YKt6Tny6ab2W8q8nXrUKa5IdNwLKyxuV7MQ54ngv8VrKLHL/FdnF4qT6n9oZj4HtX9eMym3F/WDuQstS610ktEETgeGF4uavVD83mVa8fci0v6Rd/8mFaNKI053VArd1GZHMHi7MyPDu89JgifWnpWHh0DSUMFNVyMSn2370yvs9HcIcfqHBgiEP749kLTaK/4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFTc2VDstp7N9Nwhs2AETmEas8/fPWdCe0LY1uP5kEo=;
 b=R3HzLfOF8xxPxKwY/TMl9Zcm70bOSGHXgpjrOgmqZWJH7q+AUd37Kjue9Mf/lHhZrxA3Ohu6c8UVR1ciywSszT/G1ixK8RRY7uEFsLe5kXBEubF6D5QENUUYiPUSNn9OIoOBkCf9lf0zhaywYPtan+Dw6B7AxQFKCGgSTY3vMCk=
Received: from MN2PR22CA0002.namprd22.prod.outlook.com (2603:10b6:208:238::7)
 by SA1PR10MB6566.namprd10.prod.outlook.com (2603:10b6:806:2bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:10:40 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:238:cafe::88) by MN2PR22CA0002.outlook.office365.com
 (2603:10b6:208:238::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:10:40 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:38 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:10:38 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:10:38 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9AXWc3413879;
	Thu, 20 Nov 2025 03:10:34 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <hverkuil+cisco@kernel.org>
CC: <sakari.ailus@linux.intel.com>, <bparrot@ti.com>,
	<jai.luthra@ideasonboard.com>, <dale@farnsworth.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <y-abhilashchandra@ti.com>
Subject: [PATCH V6 0/4] Add support for TI VIP
Date: Thu, 20 Nov 2025 14:40:26 +0530
Message-ID: <20251120091030.2081594-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|SA1PR10MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 920db8e1-be52-4ef0-b2fd-08de2814ad43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rvWWtXRsNrLYMoKHXEGqrM9OsTmkdsB8w9AKUfKTOWGuNuPBVMV7ffek+LCw?=
 =?us-ascii?Q?MQT7D2Zz//o4XiXKyXfzOgJOw7HchPBvcsNXm1RbaGX9NZET+zvKqRODx+CY?=
 =?us-ascii?Q?hJ6QFlyhP7Wh8ZyNn10SyLPkWNtYYiulDiq4j/71O6fCxqpNqJ6FGsVLQMyA?=
 =?us-ascii?Q?VMFIXcPQgXDUGJgNW0vYmLQbyDb2p3T8uK1Gc67KYinNU63gy8MJD6o4tX7H?=
 =?us-ascii?Q?R8zc4E9bvGBtCTIL0wmeugoSp9dQgLjvikynh9SEbL5txvOur9VONcSToNvB?=
 =?us-ascii?Q?9vid+i1xKoPnpPQq+eEOep0ZTRQZewy/6VgcGYq2+fRD44qtiZcX5cqyxEQI?=
 =?us-ascii?Q?BC++QfhSMRuNSwAoyfueVKULDozdfXldzCIWTrSkOX8QGsndmBE820sqSxGt?=
 =?us-ascii?Q?DzuWT85LaYR6U1hXKsgdtBmXgg4BNgCmIJtbPWpZQEzJRhUFSWDJZRMR8Lzi?=
 =?us-ascii?Q?cFQoA+Hh5HucLCuM6jDwOMr3Aj9PdEXUkC4Y4XTB7ScUKHhDMoFdp+w2/p2Q?=
 =?us-ascii?Q?nOIoC9vFv+F0kFEhQHrxuEBBjU6lt6/d288hs+UMql2qDYkUSIjcKftjAcul?=
 =?us-ascii?Q?8zKGptRPWaA+nTRhJwCdKdjAxFEHTDXFl1fsTwPpHgNJU9ZgYUZfkOxMmGfy?=
 =?us-ascii?Q?K3ZBN5zi6UY0pLBQiTcfci3RYPKylfp0chMsvxLuHBPqr5ak1adFAeQwGOCa?=
 =?us-ascii?Q?kfecB2whp+9lbsLustofpZYhQU+BFXICqWxx0ZvGuKGNPqy0fveLKmXqYpbU?=
 =?us-ascii?Q?oZCuaG0OdTwiGkYIJ5XsdqnRVNpe7ecWbVztcgy/Cml9JIy0iSDK61c78rPc?=
 =?us-ascii?Q?FWOwOfZnGeENIqZ12gs2MZ04rDLtrPfkrbbEB2rEUh+30ctMDHxYCKbIsQeO?=
 =?us-ascii?Q?Rotie594bKgjE62oZ/9pTtJk0n9yrDY3ToOTp/9jr+KHkZREn1J8l3XrLkH3?=
 =?us-ascii?Q?wx7J0RWEZX6DD70ZpVwPhkYAE6lvioPdzEaBy5S8dIVNRS7nsUuW5ebeJCip?=
 =?us-ascii?Q?YQ1PxWe9uE9nIdS+MD2/DuO4QsqF1MtVY96vdRL94OCuedbUIskv8o3+rn54?=
 =?us-ascii?Q?Ex/QO7zhJy93L+JBhnyLv5DAmDUsa198cqBOSPK6LSf9+hh6aSYtTeCRwfmO?=
 =?us-ascii?Q?Wo8ZWl3GjXxO7Lnp+tbsTgwEMl40MMN1Z74+5qNb0I68Kb+zBszKTY2aUI1z?=
 =?us-ascii?Q?G+SLbbt41hWnwe0MG0GCc4kUStFLtNTVfyBsGRwCtusdvX1AAKeVfDZzjgkR?=
 =?us-ascii?Q?XO5T5deTWsQ0GUVnxJB+ycPvItlLGQZXiQLyKOrZDtxDomGg0ejMKvivIzXf?=
 =?us-ascii?Q?m+nlBT3dJFjd8sU2nVIePZYA6wDc9DHuv77E9iSJfrUZE7639Xi8UOlIvKtw?=
 =?us-ascii?Q?mEV49R6NbmGkmHvqxGF8Lr6hgXTD0eo93zw9BspHZK5BnWOP/vYEXgouBO4S?=
 =?us-ascii?Q?fM+DgIRfj1M4HeO0f6F4D9PlyHbzHdb/uYSOsGQWiDHNWsM6EYudRbYxjY0K?=
 =?us-ascii?Q?8UeRY2ioLEL0ZHFs8uvmJ/cbFo/cS28FBfaxvr2AzLfe5bqNAD9u2zZHcnYC?=
 =?us-ascii?Q?SwbKRXlJrML/czOfFtI=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:10:40.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 920db8e1-be52-4ef0-b2fd-08de2814ad43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6566

This patch series adds support for the TI VIP. VIP stands for Video
Input Port, it can be found on devices such as DRA7xx and provides
a parallel interface to a video source such as a sensor or TV decoder.

Each VIP can support two inputs (slices) and a SoC can be configured
with a variable number of VIP's. Each slice can support two ports
each connected to its own sub-device.

Changelog:
Changes in v6:
- Collect R/B from Rob
- Use latest v4l-utils (Hans) 
- Remove 'default n' from VIDEO_TI_VIP Kconfig option (Hans)
- Updated Kconfig dependencies with COMPILE_TEST, now depends on SOC_DRA7XX || COMPILE_TEST (Hans)
- In vip_s_std(), moved the standard validation check before the vb2_is_busy() check (Hans)
- In vip_s_fmt_vid_cap(), moved the vip_try_fmt_vid_cap() call before the vb2_is_busy() check (Hans)
- Put all vip_set_slice_path() calls on a single line for better readability (Hans)
- Clean up set_fmt_params and unset_fmt_params functions to make the logic easier to read (Hans)
- Add a vb2_is_busy check in vip_s_selection (Hans)
- Remove buffer count check in vip_queue_setup (Hans)
- For *nplanes is != 0 just check the size in vip_queue_setup (Hans)
- Remove read support (Hans)
- Change vip_register_subdev_notif() to vip_register_subdev_notify() (Hans)
- Also fixed issues reported by Coccinelle and W=1 build.


v4l2-compliance output: https://gist.github.com/Yemike-Abhilash-Chandra/36af73c5f6f43d3cf497eebf729e39a5
v4l2-compliance output with -s: https://gist.github.com/Yemike-Abhilash-Chandra/bccf57e5ef9775bec912edff66a5bffd

Test logs: https://gist.github.com/Yemike-Abhilash-Chandra/d4e775f688256feb8ae2d7ec91de4249
(Tested on mainline: 6.18-rc6 since next-20251119 was broken for AM57 due to some othe reason)

DT binding check results: https://gist.github.com/Yemike-Abhilash-Chandra/da9b144943225326e0209bf5e0627810
(No errors related to ti,vip.yaml)

Link for v5: https://lore.kernel.org/all/20251024094452.549186-1-y-abhilashchandra@ti.com/

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
 drivers/media/platform/ti/vpe/vip.c           | 3668 +++++++++++++++++
 drivers/media/platform/ti/vpe/vip.h           |  717 ++++
 drivers/media/platform/ti/vpe/vpdma.c         |   51 +-
 drivers/media/platform/ti/vpe/vpdma.h         |    6 +
 8 files changed, 4609 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,vip.yaml
 create mode 100644 drivers/media/platform/ti/vpe/vip.c
 create mode 100644 drivers/media/platform/ti/vpe/vip.h

-- 
2.34.1


