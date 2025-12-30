Return-Path: <linux-media+bounces-49668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15EECE90A8
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 09:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF66E3021E51
	for <lists+linux-media@lfdr.de>; Tue, 30 Dec 2025 08:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7352B30101F;
	Tue, 30 Dec 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="K/s9cejV"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6028466C;
	Tue, 30 Dec 2025 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083559; cv=fail; b=tIkbmutg9XHOrkJP1O6XejjC37f545G085Ue8AG5m33jcDFUJZbHx8Q32hXs4J7oCk6AhU7tdBIMulec/naAeelHiokCA7IyLqyX3y60rp+lZNoI0QD41px0jJFe1teAxeIea8vo2V2iy191r84gLW+0CPKGiPy42W/pIM5wuMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083559; c=relaxed/simple;
	bh=h6aYo/fpJ/jxtkzfvkOSo9KFzPrDtO88J3DG4FjxXzc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=txRMlENfXJS1DskKswIRkmBjByKiS94GigYR3NeukqPkJemYl7om762w4HWrxKO+f/INPDqUJZgY032XpQKQ2oGDuTvx4UmK9dvWrEhHTG2AfvahOrAA/t+UEbj/T7ozIs4UBS+ngRIo5wP1xQJgKXIVWXFixERxgPt8YiglJRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=K/s9cejV; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iokv6T6iFEPQcxO7SUa2TTH88w9CGT1VlnYnRd6Fgbd3h5j5dTzbOzG92bcKWf2COd2MSyvnoK35dCiyzMzSdeEHvoMvJxO1+vxfa2NJZuQ30nesNt8AlQH08f0fdlN891XTjoXxnEbNbwmk/EMxhbW3uYtUItJw/GFflthmwM7Uxop4tliitJCPPgnIXBt4YBZo8+kRSTRbH/cN/PZFQk0VpI4zO/Sqr0zzIMem6/jKFyCETPHi12yte0ZFlQWufUkv+6oG+T/Z7VbAal4MHhauZqU7sAUh9plpQxbYxnOSORHkjjxOc0zal5dMj6tWJz44sDvqZuhy8Tzv3DR6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/9R5rPGjp0bY4A/qR+irfHG/h+yT6F6XSUMJ1D6wRs=;
 b=RRGV6sTzsKBjC3ZZR1naZUXeuumFI9Qkbh0I8NuDXKXNVioECYUzbhhcELrcTYUtHE1sMzR0T7vMzoeyX2D2/hCoosMAIyGmPT8suoCLesS0mhDYyDZK0uxE4HPDfFolyeYs5XJS7Fl4udLxXB88Zee7i140isI47jrNhSmlU7+30qFAkpzAjd/HH9UXUu7OEcZ0jqQ/H2WHwRNwN3P7bGZ4n0V0Oqw3NPHAOtZrZHiakR7OrIEPXGd5xvqcqQ85u3rMpqwqjtsdu/ggueJTqZTpHXUlcOhQIjcn/k6ezCI4JRRfXRJjwPVaN97RUTepsJvp1iQv3B0NymhYtbKXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/9R5rPGjp0bY4A/qR+irfHG/h+yT6F6XSUMJ1D6wRs=;
 b=K/s9cejV+ziuD9orKrVukX/IaoC4IW6aDnaBv9r2HogO0eKS98exmqVH7+EIpBvgbVPur4TW2zOMjMuB0AvLsn66iJTseOZj+C/86zFocW7E3WYHoCOgBetsvApsrSnGxc6VDu5O+MVXRGMmlF8RLEK6ukrIxnHNeIzbtFZDXHE=
Received: from SJ0PR03CA0042.namprd03.prod.outlook.com (2603:10b6:a03:33e::17)
 by SA1PR10MB5866.namprd10.prod.outlook.com (2603:10b6:806:22b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 08:32:33 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::d9) by SJ0PR03CA0042.outlook.office365.com
 (2603:10b6:a03:33e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Tue,
 30 Dec 2025 08:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.0 via Frontend Transport; Tue, 30 Dec 2025 08:32:31 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:28 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Dec
 2025 02:32:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 30 Dec 2025 02:32:28 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BU8WL9T579464;
	Tue, 30 Dec 2025 02:32:21 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v9 00/19] media: cadence,ti: CSI2RX Multistream Support
Date: Tue, 30 Dec 2025 14:02:01 +0530
Message-ID: <20251230083220.2405247-1-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|SA1PR10MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 257d2310-7f59-4068-0c35-08de477df994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1rBgVq2bHViXlIKj9PcDYiYrJXqhqu8mK9wAQYsiKsZoj+v4OfFyCF2iMbsu?=
 =?us-ascii?Q?YLhE54NjygPA4q9HCN6nSPlDJ7Mq4xN6xaLtLV5smRhAvsbVYFYIWvWw2DhL?=
 =?us-ascii?Q?4p68MamNeYiPve6VAirC4ErKGyyZm6eb/WNanhopr65Zsc9nanNM5IPFmYGd?=
 =?us-ascii?Q?2urZcvJaoHTH9vPYDW9OuSpPQrtIh9ZIEuae2K0++B63a5U1zHGZyDGF9BdD?=
 =?us-ascii?Q?iIktW0ZatTBwNIVuowLqdMl6U4Q732CSJVTvci6gyIWy9XrqfEoFGlx7hLU3?=
 =?us-ascii?Q?ebC8T85/Kc5u/0P3qaYwY7dNNFM75MtalTZw9TzFh8HKFuQ//p/aIvICQQ8+?=
 =?us-ascii?Q?36SieJRSAfRofZLE9mPQ0EChF+kzbM9Y5fCjIzvxEc9oUgaFi2cAf0ojcgET?=
 =?us-ascii?Q?9Tub1ZnqQq+PCTXP1MdOIdTacSMbAK3dOeSRKg2bkGkLw+qOAa95SBZLuiJi?=
 =?us-ascii?Q?K9snkyg91I64Qvtp39zKfo92RU39siS71NUcZj3q6+V1r5jVVP0f/Spo3CnF?=
 =?us-ascii?Q?22zyNRqIRLFfxBH76uhnKAjH3csNuWzRMi1/85mTxPNwBduDhG7Y63t25zuy?=
 =?us-ascii?Q?OTSOZKvfFVfUm4eClvllDczuXHkxtUZIq701JcJMjmdn0k0f6ncWs1x/5Lxl?=
 =?us-ascii?Q?uciZEzBkC9H9BVdJyytE2E9EUxq+sllT70NAPmoI3JuNwbgWj/WIwgp8oF6j?=
 =?us-ascii?Q?r1TDPlDdSvCi/NVaj6EDgr9X2qJvvd2K+362Eh7x1JNqdnO7RTCDMmM4ujA/?=
 =?us-ascii?Q?PyWXPy7ti2JnUHIEjvavSkWNdk1v0zrAuQlB+jSjfT+yVohCNqqc7lDSyvBl?=
 =?us-ascii?Q?FP0NmdaY/siM3yHJxXqxQb+NcAxqCZKeLmRSBAnv/ZsiDh2wUb2aRyDSaw3D?=
 =?us-ascii?Q?uGAV7ibqcxgkU/TFcImBCV+WMNm9aGs0sXPcejdkKR4iGMHx8O5+UI5pOw/c?=
 =?us-ascii?Q?iU7nQ/xdYVvZj5QpD7lwgUGbroP1Y2UHkhnIfg+jul04g7yd8v8R9Ken8J3K?=
 =?us-ascii?Q?xSKB35voK/WAMG477n6j43qpJTT4NL6vOOoh1ql3QFcfoyQdueUE+iSc4k14?=
 =?us-ascii?Q?1uA4rA2aZxqBruBToLRJGcv/oqZPB09XOPUphvVkn0TWSSS2tHDzCSu6Oc8n?=
 =?us-ascii?Q?GH068WCw9ntHEbxmFjE3J0ekSXE3vKQk2e31/ZSYsm5KqwQwrP8+QwJ3AfrK?=
 =?us-ascii?Q?UJ346AHvqGM2VwaEXYRb4G+18kNltnVIg8hTjA+bRxM2dOrM8FcHEXWph0Uu?=
 =?us-ascii?Q?tVFWw/NYco1bur5sfm3Sl6g3semqdUSdNQ2z7U7hPCouylL4b2igGhT4rBG0?=
 =?us-ascii?Q?7UCjrLBKGHq6rVTXQMnJwsYkaW4wl7ALuSg/X3Uqy+o/ttenIWAodEFzAMmq?=
 =?us-ascii?Q?k6DgREPIO+bsYjuZ3ODft5cLk6iitK0LR19I+LXuuM4X31u44lX2okN9/gDu?=
 =?us-ascii?Q?UujG1a+gTCjpfw+UthIwD7/I0bGdmZh0QmnZlavTbPNL5O6aWY4GgGYvik+J?=
 =?us-ascii?Q?zT1KKimAg5msNLtyGKZMT6uydPIB5/DIIcyyXYJUsEKRs2+Zw0zIKaXobyly?=
 =?us-ascii?Q?Mh4aPRRXYry8O0UOAQw=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 08:32:31.5734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257d2310-7f59-4068-0c35-08de477df994
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5866

This series adds multi-stream support and PM support for Cadence CSI2RX
and TI CSI2RX SHIM drivers.

PM patches are picked from:
https://lore.kernel.org/all/20250902-ti_csi_pm-v2-0-59a3be199940@ideasonboard.com/

PATCH 01 :    Remove word size alignment restriction on frame width
PATCH 02-09:  Support multiple DMA contexts/video nodes in TI CSI2RX
PATCH 10-11:  Use get_frame_desc to propagate virtual channel
              information across Cadence and TI CSI-RX subdevs
PATCH 12-13:  Use new multi-stream APIs across the drivers to support
              multiplexed cameras from sources like UB960 (FPDLink)
PATCH 14:     Optimize stream on by submitting all queued buffers to DMA
PATCH 15-16:  Change the drain architecture to support multi-stream,
              implement completion barriers for last drain
PATCH 17-19:  Runtime PM and System PM support for CSI-RX.

Testing for this series has been done on top of media tree with 4x IMX219
camera modules connected to TI's AM62A using V3 Link fusion mini board.

Runtime PM and System PM has been tested with IMX219 camera module
connect to TI's AM62.

Overlay and defconfig changes for the same can be found below:
https://github.com/RISHI27-dot/linux/commits/u/multistream_v9

v4l2-compliance results:
https://gist.github.com/Rishikesh-D/6bc8ab1f7dcb1b3bb4813473aacf3f4f

---
Changes in v9:

# New patches in v9:
[PATCH v9 08/18] media: staging: starfive: Move to .enable/disable_streams API
- Remove the s_stream API and use the enable/disable_streams API in stf
  drivers
[PATCH v9 16/19] media: ti: j721e-csi2rx: Return the partial frame as error
- Return the next frame after drain to usersapce as VB2_BUF_STATE_ERROR

# Changes:
[PATCH v9 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
- Ad R-by Tomi
[PATCH v9 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
- Squash [PATCH v8 08/18] into this patch so that we dont have to use
  s_stream
- Use BIT_U64() instead of BIT()
[PATCH v9 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
- Use BIT_U64() instead of BIT()
[PATCH v9 11/19] media: ti: j721e-csi2rx: add support for processing virtual channels
- Update to commit message to s/hardcoded/VC0/
- Remove the mention of caching VC data from the commit message as that
  is done in 13/19
- Update the commit message to s/per stream/single stream/
[PATCH v9 12/19] media: cadence: csi2rx: add multistream support
- Remove the s_stream fallback
[PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
- Move the code that is accessing the state from .start_streaming() call
  to .enabel_streams() call
- Remove the check for V4L2_SUBDEV_ROUTE_FL_ACTIVE
- Change the logic of for_each_active_route() usage to break the loop
  when the route is found
- Change the format variable to static const
- Update the commit message to s/4/32 for number of possible streams
[PATCH v9 17/19] media: cadence: csi2rx: Support runtime PM
- Shift to goto based error handing in the .enable_streams() function
[PATCH v9 18/19] media: ti: j721e-csi2rx: Support runtime suspend
- Make varialbe i and ret unsigned
- Move runtime_enable() call before notifier_register() in the .probe()
- In the .remove() function if the runtime PM state is active, set it to
  suspended and remove the pm_runtime_set_suspended() call at the end.
- Drop the call to init_dma() from init/cleanup_ctx()
- Remove pm_runtime_set_active() and pm_request_idle() from .probe()

Link to (v8):
https://lore.kernel.org/all/20251112115459.2479225-1-r-donadkar@ti.com/#t
---
Changes in v8:

# New patches in v8:
[PATCH v8 07/18] media: cadence: csi2rx: Move to .enable/disable_streams API
[PATCH v8 08/18] media: ti: j721e-csi2rx: Move to .enable/disable_streams API
- Remove the s_stream API and use the enable/disable_streams API right
  after adding the subdev for core device

Changes:
[PATCH v8 01/18] media: ti: j721e-csi2rx: Remove word size alignment on frame width
- Remove define for PSIL_WORD_SIZE_BYTES.
[PATCH v8 06/18] media: ti: j721e-csi2rx: add a subdev for the core device
- Use v4l2_subdev_state_get_format() instead of using the get_fmt from the 
  subdev pad ops in the ti_csi2rx_link_validate() function.
[PATCH v8 11/18] media: ti: j721e-csi2rx: add support for processing virtual channels
- Move routing support form this patch to PATCH 13/18.
[PATCH v8 12/18] media: cadence: csi2rx: add multistream support
- Move support for enable/disable_streams() API that was added in this patch to
  PATCH 07/18 earlier in this series.
- Remove the mutex from the driver
[PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
- Move support for enable/disable_streams() API that was added in this patch to
  PATCH 08/18 earlier in this series.
- Remove csi->mutex protection inside enable/disable_streams() function calls to
  solve circular locking dependency warning.
- Mention that DT filtering is also supported in the commit message.

Link to (v7):
https://lore.kernel.org/all/20250911102832.1583440-1-r-donadkar@ti.com/#t

---
Changes in v7:

[PATCH v6 03/16] media: ti: j721e-csi2rx: separate out device and context
- Resolve bisect test fail because of undefined 'csi' variable
- Resolve bisect test fail because of 'vdev' not being in scope when used
[PATCH v6 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Resolve compiler warning regarding missing error code 'ret'
[PATCH v6 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- Remove unused variable

Link to (v6):
https://lore.kernel.org/all/20250908134729.3940366-1-r-donadkar@ti.com/

---
Changes in v6:

# New patches in v6:

[PATCH v6 14/16] media: cadence: csi2rx: Support runtime PM
[PATCH v6 15/16] media: ti: j721e-csi2rx: Support runtime suspend
[PATCH v6 16/16] media: ti: j721e-csi2rx: Support system suspend
using pm_notifier

# Changes in patches from v5:
[PATCH v5 01/16] media: ti: j721e-csi2rx: Remove word size alignment
on frame width
- Remove restrictions on minimum frame width in ti_csi2rx_fill_fmt()
- Add Reviewed-by from Abhilash
[PATCH v5 02/16] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v5 03/16] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v5 04/16] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v5 05/16] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v5 06/16] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v5 07/16] media: ti: j721e-csi2rx: get number of contexts from device tree
- Solve compilation warnings
[PATCH v5 08/16] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v5 09/16] media: ti: j721e-csi2rx: add support for processing virtual channels
- Remove unnecessary call to v4l2_unlock_state()
[PATCH v5 10/16] media: cadence: csi2rx: add multistream support
- No change
[PATCH v5 11/16] media: ti: j721e-csi2rx: add multistream support
- No change
[PATCH v5 12/16] media: ti: j721e-csi2rx: Submit all available buffers
- No change
[PATCH v5 13/16] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Squash implementation of completion barriers for last drain cycle
- Make struct completion per ctx

Link to (v5):
https://lore.kernel.org/all/20250825142522.1826188-1-r-donadkar@ti.com/

---
Changes in v5:

# New patches in v5:

[PATCH v5 01/14] media: ti: j721e-csi2rx: Remove word size alignment
[PATCH v5 14/14] media: ti: j721e-csi2rx: Wait for the last drain

# Changes in patches from v4:

[PATCH v4 01/12] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
- No change
[PATCH v4 02/12] media: ti: j721e-csi2rx: separate out device and context
- No change
[PATCH v4 03/12] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
- No change
[PATCH v4 04/12] media: ti: j721e-csi2rx: allocate DMA channel based on context index
- No change
[PATCH v4 05/12] media: ti: j721e-csi2rx: add a subdev for the core device
- No change
[PATCH v4 06/12] media: ti: j721e-csi2rx: get number of contexts from device tree
- No change
[PATCH v4 07/12] media: cadence: csi2rx: add get_frame_desc wrapper
- No change
[PATCH v4 08/12] media: ti: j721e-csi2rx: add support for processing virtual channels
- No change
[PATCH v4 09/12] media: cadence: csi2rx: add multistream support
- No change
[PATCH v4 10/12] media: ti: j721e-csi2rx: add multistream support
- Serialize stream stop
- Remove the break statement to avoid early return in the loop, as
  reported by Sjoerd
[PATCH v4 11/12] media: ti: j721e-csi2rx: Submit all available buffers
- Delete the list node on DMA error to avoid kernel panic
[PATCH v4 12/12] media: ti: j721e-csi2rx: Change the drain architecture for multistream
- Mention about next frame after drain being bogus

Link to (v4):
  https://lore.kernel.org/all/20250514112527.1983068-1-r-donadkar@ti.com/

Changes in v4:

[PATCH 01/13] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  - No change
[PATCH 02/13] media: ti: j721e-csi2rx: separate out device and context
  - Add ctx identifier in the dev_err() message
  - No change
[PATCH 03/13] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  - Reduced the name string lenght from 32 chars to 5 chars
[PATCH 04/13] media: ti: j721e-csi2rx: allocate DMA channel based on context index
  - No change
[PATCH 05/13] media: ti: j721e-csi2rx: add a subdev for the core device
  - Add .enum_mbus_code callback
  - Replace statically allocated struct with a global static const struct
    v4l2_mbus_framefmt and used that in the _init_state() function
[PATCH 06/13] media: ti: j721e-csi2rx: get number of contexts from device tree
  - Fix the drain buffer being leaked
  - If the shows more number of ctx than the TI_CSI2RX_MAX_CTX, return an error
    instead of warning
[PATCH 07/13] media: cadence: csi2rx: add get_frame_desc wrapper
  - No change
[PATCH 08/13] media: ti: j721e-csi2rx: add support for processing virtual channels
  - Call ti_csi2rx_get_vc() only once on first stream start and cache the VC data in
    the driver, use the corresponding VC in all subsequent stream starts.
[PATCH 09/13] media: cadence: csi2rx: Use new enable stream APIs
[PATCH 10/13] media: cadence: csi2rx: Enable multi-stream support
  - Squash the above two patches into
    [PATCH v4 09/12] media: cadence: csi2rx: add multistream support
  - Use already obtained csi2rx->source_pad in enable_streams() and
    disable_streams() call
  - Update commit message with the reason for using a custom helper for s_stream
    instead of v4l2_subdev_s_stream_helper()
  - Use v4l2_get_link_freq() variant that takes pad of the source as its first
    argument instead of the one that takes v4l2_ctrl_handler
  - Call v4l2_get_link_freq() with bpp = 0 to prevent fallback to V4L2_CID_PIXEL_RATE
    in multi-stream case
  - Use lock guards to simplify error handling
  - Call csi2rx_update_vc_select() at first stream start before enabling the controller
[PATCH 11/13] media: ti: j721e-csi2rx: add multistream support
  - No change
[PATCH 12/13] media: ti: j721e-csi2rx: Submit all available buffers
  - No change
[PATCH 13/13] media: ti: j721e-csi2rx: Change the drain architecture for multistream
  - Fix checkpatch warning
  - Change commit message to give a better description of the patch

Link to (v3):
  https://lore.kernel.org/all/20250417065554.437541-1-r-donadkar@ti.com/

Changes in v3:

- Drop [PATCH v2 01/13] media: cadence: csi2rx: Support runtime PM from
  v2, support for runtime PM will be added in a separate series:
  https://lore.kernel.org/all/20250224-ti_csi_pm-v1-0-8f8c29ef646d@ideasonboard.com/
- Change the drain architecture to prevent FIFO overflow in multistream
  usecases.
- With the new drain architecture, we don't need the the driver to wait
  for userspace to start streaming on all "actively routed" video nodes
  before starting streaming on the source. So, revert back to the capture
  architecture where streams can be started and stopped independent
  to each other.

Link to (v2):
  https://lore.kernel.org/r/20240627-multistream-v2-0-6ae96c54c1c3@ti.com

Changes in v2:

- Change the multi-camera capture architecture to be similar to that of
  Tomi's RPi5 FE series, where the driver will wait for userspace to
  start streaming on all "actively routed" video nodes before starting
  streaming on the source. This simplifies things a lot from the HW
  perspective, which might run into deadlocks due to a shared FIFO
  between multiple DMA channels.

- Drop a few fixes that were posted separately and are already merged
- Fix dtschema warnings reported by Rob on [02/13]
- Fix warnings for uninitialized `used_vc` variable in cdns-csi2rx.c
- Return -EBUSY if someone updates routes for j721e-csi2rx subdev while
  streaming
- Only allow single-streams to be routed to the source pads (linked to
  video nodes) of the j721e-csi2rx device
- Squash the patches marked "SQUASH" in the v1 RFC series

Changhuang Liang (1):
  media: cadence: csi2rx: Support runtime PM

Jai Luthra (9):
  dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
  media: ti: j721e-csi2rx: separate out device and context
  media: ti: j721e-csi2rx: add a subdev for the core device
  media: ti: j721e-csi2rx: add support for processing virtual channels
  media: cadence: csi2rx: add multistream support
  media: ti: j721e-csi2rx: add multistream support
  media: ti: j721e-csi2rx: Submit all available buffers
  media: ti: j721e-csi2rx: Support runtime suspend
  media: ti: j721e-csi2rx: Support system suspend using pm_notifier

Pratyush Yadav (4):
  media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
  media: ti: j721e-csi2rx: allocate DMA channel based on context index
  media: ti: j721e-csi2rx: get number of contexts from device tree
  media: cadence: csi2rx: add get_frame_desc wrapper

Rishikesh Donadkar (5):
  media: ti: j721e-csi2rx: Remove word size alignment on frame width
  media: cadence: csi2rx: Move to .enable/disable_streams API
  media: staging: starfive: Move to enabel-disable streams in starfive
    drivers
  media: ti: j721e-csi2rx: Change the drain architecture for multistream
  media: ti: j721e-csi2rx: Return the partial frame as error

 .../bindings/media/ti,j721e-csi2rx-shim.yaml  |   39 +-
 drivers/media/platform/cadence/Kconfig        |    1 +
 drivers/media/platform/cadence/cdns-csi2rx.c  |  480 +++++--
 drivers/media/platform/ti/Kconfig             |    1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 1200 ++++++++++++-----
 .../staging/media/starfive/camss/stf-isp.c    |   43 +-
 .../staging/media/starfive/camss/stf-video.c  |    4 +-
 7 files changed, 1311 insertions(+), 457 deletions(-)

-- 
2.34.1


