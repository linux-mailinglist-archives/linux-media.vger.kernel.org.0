Return-Path: <linux-media+bounces-37710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A18B048E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 771EF4A181B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 21:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966C724C060;
	Mon, 14 Jul 2025 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VxL9rjTw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5B23B604;
	Mon, 14 Jul 2025 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752526812; cv=fail; b=EwHHFaGSpXpnN/ilrcPgAdbabP9hlmYgt1MdJaQxO58RNwtKhhexhxKId6jWTqH2KR1eVdZlkRNQocZvEs5S0WScNj21/uSEHpY0tEx7m7isl6EvRnVtP+ekQnHk2tY0LHQ9irtFEMXcfJt9yhGtlVDgW6RfWoDBBbvmFJNBHrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752526812; c=relaxed/simple;
	bh=72aXGCOmhiUgDRAbvUM1dGPaj5q639jLJOuV8T5FfO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t6leawJ0HXR9BScxfSl9KNyYfJXuT3pxlnSQ9nmeerkPSB1J5ejfWPrxJuGnW4LDlpirz3odlLSpy58vPsoYXY3P1kmg6EnDPrFFmIvJs1IsQEk82OfLNpAbiyrJFz9NiFl8yGBZyq8KJvFSbLCF7ktv1Q83LtoGc9BD9aSwGzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VxL9rjTw; arc=fail smtp.client-ip=40.107.220.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DupNWyQo16Cz5u1iFRE1IFEh2glPfS4irclPTwpInvbQTysI7WqLW4/MY4J3woDM6EM9MDMossXSX7moAi1df6E1akMXBE5hZQE2tCjApoBrXKjCXfReOZDD0tx1I8c22+ZJER62VTBPL9mHpbPeM69mZRWqqGi8hp67s+jwti90tPqqpCNZV2D9BOQv/zVFWTirrQDVHAKWd3DhWpkBolFHRqMnJGk7BuSOOtwcSnv5NHlbdn5Cx8+J+seX8etk8kGv1WhnOgD/tdukaBQYD2ZkgmJGLlRu7gwgGl7kRJoyBD680y3r8lE2v4slGoq3G3vxtPdDg5iKkZqhrqtOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rNecS2m8O/2VChvrLKLymFdaY2L0n5ROn+O8M/1DsQ=;
 b=RTWaCJE6c/KjZuF3xpNLtYsUjgMtG3Qz5Ywb2FKqeCS65v+xWNxXydGNb4N+jeZgIPSWSYZYJGK00vtC5qi9ZnDlXKcRJdezcyuZYsEq02AM+JPyaFl7xX27liO9IPSZdy2B/yQSTomcienxCO4aK8yURBOysOxuvtc27wGsDHnfCSBlrTa6p1W3mtSP7X6RawisRvu5sWffczUZ2oBad6q8asCg5XW3hdz8ZGxZhcLi4cp0h/XbLM/S3cuNc4v4DGrYvWCF9ile2hHQ3XdKdq5WIQtQUn4o3kngR2ZBeeGMGeeQZ+qMszDAOJmSWd1uAZjpxwHTWAT8yHKRJfigzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rNecS2m8O/2VChvrLKLymFdaY2L0n5ROn+O8M/1DsQ=;
 b=VxL9rjTwC4x6p3NiMJvF8hfO9i7fc6dDWmx6/mSXd1nlD1UgBspYBuiCZ8ZmaligkUtfthNMeU7vfPjWgVhne6WvjhbSE2QutUsgT3kar9mdx6Kzvz5TNTFTKQt0KG1594Jl4nFTWNdouk2T19o4o7xganIN/JaVeMwApDnjFfM=
Received: from CH2PR19CA0006.namprd19.prod.outlook.com (2603:10b6:610:4d::16)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Mon, 14 Jul
 2025 20:59:52 +0000
Received: from CH3PEPF00000010.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::8f) by CH2PR19CA0006.outlook.office365.com
 (2603:10b6:610:4d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 20:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000010.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 20:59:52 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Jul 2025 15:59:49 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>, <kieran.bingham@ideasonboard.com>,
	<bryan.odonoghue@linaro.org>, <hao.yao@intel.com>,
	<mehdi.djait@linux.intel.com>, <dongcheng.yan@linux.intel.com>,
	<hverkuil@xs4all.nl>, <krzk@kernel.org>, <dave.stevenson@raspberrypi.com>,
	<hdegoede@redhat.com>, <jai.luthra@ideasonboard.com>,
	<tomi.valkeinen@ideasonboard.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <grosikop@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, <vengutta@amd.com>,
	<Phil.Jawich@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: [PATCH v4] media: i2c: Add OV05C10 camera sensor driver
Date: Mon, 14 Jul 2025 16:51:05 -0400
Message-ID: <20250714205805.1329403-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000010:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 73124d75-438f-49b1-da97-08ddc31960c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MYZdvCApYbm0lj/zvRpqFNoW1P/xEDImBLsgFn2sTkOWv7bzYNZuh7891ecg?=
 =?us-ascii?Q?hHKSmcRUCthGJiC13byqkGdhR3qnACNd0ecAF4bJaCjuzh8JW0VOR24IPBoC?=
 =?us-ascii?Q?tbVU5TjQ+dS38Md0gMqqN0QSibls3kCY1U+fKqtxswndmBLW/P2LtfRCWViy?=
 =?us-ascii?Q?wQ2+vKEUI/2Co5vh7KeO/5f5ibv0WDyROu8mXvuKF84iz6fDwcnbvKUH51/F?=
 =?us-ascii?Q?doM1F44PVEhPRT5Ur8EyOjmzbCtJqvSjrFSi6m2pq+P7nu0O15jOQkYQxd1C?=
 =?us-ascii?Q?0c5qCfHx1iKxOqK/hd6MQv9fXYQMXSQoWoEI6UXnpv5IdkmVQE0JA0nE7mbY?=
 =?us-ascii?Q?gGQgUKGuDBST04w6W9eV91Hj53gcTR5Z32a0b9dH7FaQFfbZVHVxCAQ4/Fx3?=
 =?us-ascii?Q?E3uTkp3qd3w3hAjI3NQ0hPP8BJlFHdlloZTVVtV8WHWUIL2EsiFSlNlYLT+m?=
 =?us-ascii?Q?4Vrl7cvyCujDu6XNFUnsbiqVB5SQFgeCVT+BiW5RAzGkvIMKRXPMZkQJoSOr?=
 =?us-ascii?Q?kuRP1oEuodSq4NbAfyViMxop+emx+P2SK/r1qiBJdxliiae7LOEENd7JrLSt?=
 =?us-ascii?Q?m3rUswenTF21AlcXlAyQAIVJYKdaRbioFgR8a4ud/RiQCF96tT7nNw1DONZM?=
 =?us-ascii?Q?+jNGT6iwztMUdxEYivdaqyk8vMM+JvwCHBLusqju0Xai0+k9errb5qsCfQXy?=
 =?us-ascii?Q?vYN+nr5Km933udUAFd6x+iaifaymSaL0MXy+KGnDH/lLt4WBd827QukL6uN2?=
 =?us-ascii?Q?G6ZtUusQdXxCuy7XMbH4ZKlrPbNCyi6CAFdsthhzS1eEUl8NsgWrckfoouiu?=
 =?us-ascii?Q?a+gGe+VLX8BQ4k6I6aSlBg/Bz0MmDXaUxU+yIp/AALv8nQwdWZscrfuq1LUk?=
 =?us-ascii?Q?GVUoSudq3TLfl43ZLEgrz1IboA7KOjIxf4eofNAuvcIId2wcfKJdJlhu3Ya9?=
 =?us-ascii?Q?7c8KjDdiutZ1Lt3SjAmYjimfvUCPWymR+77S55gLNfTfN6jBPyA14jIIlkA3?=
 =?us-ascii?Q?PI4Ti3+Wd1wd8VJHH0UJdhWuokyrxlAoQRAclm8uAg8lcnqDum3J85YTVJHu?=
 =?us-ascii?Q?9fVQPuKWwVb2/Q+iBDfadtBIHaCPfMysYkcrNvEd82QcRfhQj8YDyirdW0tN?=
 =?us-ascii?Q?XxuEagpJJbeT0NhrCyUOnEwMSpo4gbrvz+0FZ8ordIbYDTt1Brk2+QRQlSMs?=
 =?us-ascii?Q?vf2Q2nLu1JQ26ATh8pEU3SzULSMCiXlrUiWwHzTLD8PdjHEjblHoyDxTDEsB?=
 =?us-ascii?Q?dLzi8Vw5LdeZlI/i9V93G3vzM2gP+MrHPIYaQiEuEoWAEMLYtorDmVgdw5BQ?=
 =?us-ascii?Q?7lipe/XPi5XkLrFTn5M9/dJxY2fO7yFF8OajFgxESFzooNQsnm8bi58BHQuy?=
 =?us-ascii?Q?ClDRTRRSKJe7NLLAxxi89hO3l2jR4NzKGr9CdEMjK5lvJn/wsBatA13ldS6k?=
 =?us-ascii?Q?VKj1Qz0Ygdk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:59:52.1133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73124d75-438f-49b1-da97-08ddc31960c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000010.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

Add driver for OmniVision 5.2M OV05C10 sensor. This driver
supports only the full size normal 2888x1808@30fps 2-lane
sensor profile.

Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Co-developed-by: Bin Du <bin.du@amd.com>
Signed-off-by: Bin Du <bin.du@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
Changes v3 -> v4:

* Use link frequency@900MHz and remove redundant ov05c10_link_frequencies[] definition
* Remove ov05c10_switch_page(), include page switch logic in ov05c10_reg_read() and ov05c10_reg_write()
* Fix VTS and HTS related config issues
* Add CCI helper macros to embed page number in the CCI private bits 28-31
* Remove ov05c10_switch_page(), include page switch logic in ov05c10_reg_read() and ov05c10_reg_write()
* Inline single-use functions - ov05c10_update_pad_format(), ov05c10_start_streaming(), ov05c10_stop_streaming()
* Move ov05c10_test_pattern_menu just above ov05c10_init_controls()
* Move ov05c10_init_state() to the other subdev ops
* Move v4l2_i2c_subdev_init() just before ov05c10_init_controls() to keep all subdev initialization grouped
* Use cached cur_mode instead of accessing global const array ov05c10_supported_modes in ov05c10_update_vblank(), ov05c10_init_controls() and ov05c10_set_ctrl()
* Rename macro OV05C10_REG_TEST_PATTERN_XXX to OV05C10_REG_TEST_PATTERN_CTL
* Change val type from u64 to u32 in ov05c10_update_vblank() and ov05c10_update_digital_gain()
* Call OV05C10_REG_TRIGGER once in ov05c10_set_ctrl() instead of calling in every update control function
* Store a struct device *dev in struct ov05c10, and access it instead of client->dev all the time
* Remove unnecessary if conditions and just do the action unconditionally
* Add .colorspace = V4L2_COLORSPACE_RAW to define the colorspace used by the format
* Remove ov05c10_start_streaming() and ov05c10_stop_streaming(), and include the respective code in ov05c10_enable_streams() and ov05c10_disable_streams()
* Drop the supported_mode.lanes field and use OV05C10_DATA_LANES
* Use ov05c10->link_freq_bitmap to select which link frequencies to expose to userspace
* Use devm_v4l2_sensor_clk_get() to get clock-frequency
* In ov05c10_probe, modify runtime PM implementation to make sensor work normally in both CONFIG_PM enabled and disabled cases
* Grouped macro definitions with other related macros at top of file
* Couldn't update hardcoded register offset values with valid register names due to lack of info from sensor vendor
* Fix typo, naming, indentations and other cosmetic errors

Dependencies:

link: https://lore.kernel.org/linux-media/8ecbcafbd91b25ad5e188dbe127b921a1643027e.1750942967.git.mehdi.djait@linux.intel.com/

 MAINTAINERS                 |    8 +
 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov05c10.c | 1105 +++++++++++++++++++++++++++++++++++
 4 files changed, 1124 insertions(+)
 create mode 100644 drivers/media/i2c/ov05c10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 60bba48f5479..6aa6dcc78c07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18344,6 +18344,14 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
 F:	drivers/media/i2c/ov02e10.c
 
+OMNIVISION OV05C10 SENSOR DRIVER
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+M:	Bin Du <bin.du@amd.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/i2c/ov05c10.c
+
 OMNIVISION OV08D10 SENSOR DRIVER
 M:	Jimmy Su <jimmy.su@intel.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index e68202954a8f..1662fb29d75c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -377,6 +377,16 @@ config VIDEO_OV02C10
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov02c10.
 
+config VIDEO_OV05C10
+	tristate "OmniVision OV05C10 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV05C10 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called OV05C10.
+
 config VIDEO_OV08D10
         tristate "OmniVision OV08D10 sensor support"
         help
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 5873d29433ee..b4a1d721a7f2 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
 obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
 obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
+obj-$(CONFIG_VIDEO_OV05C10) += ov05c10.o
 obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
new file mode 100644
index 000000000000..c6385f4525bc
--- /dev/null
+++ b/drivers/media/i2c/ov05c10.c
@@ -0,0 +1,1105 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright (C) 2025 Advanced Micro Devices, Inc.
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/units.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+#define DRV_NAME			"ov05c10"
+#define OV05C10_REF_CLK			(24 * HZ_PER_MHZ)
+
+#define MODE_WIDTH  2888
+#define MODE_HEIGHT 1808
+
+/*
+ * Macros to define pages of register address with encoded
+ * into the higher private bits.
+ */
+#define OV05C10_REG_PAGE_SHIFT		(CCI_REG_PRIVATE_SHIFT)
+#define OV05C10_REG_PAGE_MASK		(CCI_REG_PRIVATE_MASK)
+#define OV05C10_PAGE_REG8(p, x)		(((p) << OV05C10_REG_PAGE_SHIFT) | (1 << CCI_REG_WIDTH_SHIFT) | (x))
+#define OV05C10_PAGE_REG16(p, x)	(((p) << OV05C10_REG_PAGE_SHIFT) | (2 << CCI_REG_WIDTH_SHIFT) | (x))
+#define OV05C10_PAGE_REG24(p, x)	(((p) << OV05C10_REG_PAGE_SHIFT) | (3 << CCI_REG_WIDTH_SHIFT) | (x))
+#define OV05C10_PAGE_GET(x)		FIELD_GET(OV05C10_REG_PAGE_MASK, x)
+
+/* Page selection */
+#define OV05C10_REG_PAGE_CTL		CCI_REG8(0xfd)
+
+/* Chip ID */
+#define OV05C10_REG_CHIP_ID		OV05C10_PAGE_REG24(0x00, 0x00)
+#define OV05C10_CHIP_ID			0x43055610
+
+/* Control registers */
+#define OV05C10_REG_TRIGGER		OV05C10_PAGE_REG8(0x01, 0x01)
+#define OV05C_REG_TRIGGER_START		BIT(0)
+
+/* Exposure control */
+#define OV05C10_REG_EXPOSURE		OV05C10_PAGE_REG24(0x01, 0x02)
+#define OV05C10_EXPOSURE_MAX_MARGIN	33
+#define OV05C10_EXPOSURE_MIN		4
+#define OV05C10_EXPOSURE_STEP		1
+#define OV05C10_EXPOSURE_DEFAULT	0x40
+
+/* V_TIMING internal */
+#define OV05C10_REG_VTS			OV05C10_PAGE_REG16(0x01, 0x05)
+#define OV05C10_REG_TIMING_VTS		OV05C10_PAGE_REG16(0x01, 0x35)
+#define OV05C10_VTS_30FPS		1860
+#define OV05C10_VTS_MAX			0x7fff
+
+/* Test Pattern Control */
+#define OV05C10_REG_TEST_PATTERN	OV05C10_PAGE_REG8(0x04, 0x12)
+#define OV05C10_TEST_PATTERN_ENABLE	BIT(0)
+#define OV05C10_REG_TEST_PATTERN_CTL	OV05C10_PAGE_REG8(0x04, 0xf3)
+#define OV05C10_REG_TEST_PATTERN_CTL_COLOR_BAR	BIT(0)
+
+/* Digital gain control */
+#define OV05C10_REG_DGTL_GAIN		OV05C10_PAGE_REG8(0x01, 0x21)
+
+#define OV05C10_DGTL_GAIN_MIN		0x40
+#define OV05C10_DGTL_GAIN_MAX		0xff
+#define OV05C10_DGTL_GAIN_DEFAULT	0x40
+#define OV05C10_DGTL_GAIN_STEP		1
+
+/* Analog gain control */
+#define OV05C10_REG_ANALOG_GAIN		OV05C10_PAGE_REG8(0x01, 0x24)
+#define OV05C10_ANA_GAIN_MIN		0x80
+#define OV05C10_ANA_GAIN_MAX		0x07c0
+#define OV05C10_ANA_GAIN_STEP		1
+#define OV05C10_ANA_GAIN_DEFAULT	0x80
+
+/* H TIMING internal */
+#define OV05C10_REG_HTS			OV05C10_PAGE_REG16(0x01, 0x37)
+#define OV05C10_HTS_30FPS		0x0280
+
+/* Page selection */
+#define OV05C10_REG_PAGE_CTL		CCI_REG8(0xfd)
+
+#define OV05C10_NUM_OF_PADS 1
+
+/* Configurations for supported link frequencies */
+#define OV05C10_LINK_FREQ_900MHZ	(900 * HZ_PER_MHZ)
+
+/* Number of lanes supported */
+#define OV05C10_DATA_LANES		2
+
+/* Bits per sample of sensor output */
+#define OV05C10_BITS_PER_SAMPLE		10
+
+enum {
+	OV05C10_LINK_FREQ_900MHZ_INDEX,
+};
+
+struct ov05c10_reg_list {
+	u32 num_of_regs;
+	const struct cci_reg_sequence *regs;
+};
+
+/* Mode : resolution and related config&values */
+struct ov05c10_mode {
+	/* Frame width */
+	u32 width;
+	/* Frame height */
+	u32 height;
+	/* number of lanes */
+	u32 lanes;
+
+	/* V-timing */
+	u32 vts_def;
+	u32 vts_min;
+
+	/* HTS */
+	u32 hts;
+
+	/* Index of Link frequency config to be used */
+	u32 link_freq_index;
+
+	/* Default register values */
+	struct ov05c10_reg_list reg_list;
+};
+
+/* 2888x1808 30fps, 1800mbps, 2lane, 24mhz */
+static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
+	{ OV05C10_PAGE_REG8(0x00, 0x20),  0x00 },
+	{ OV05C10_PAGE_REG8(0x00, 0x20),  0x0b },
+	{ OV05C10_PAGE_REG8(0x00, 0xc1),  0x09 },
+	{ OV05C10_PAGE_REG8(0x00, 0x21),  0x06 },
+	{ OV05C10_PAGE_REG8(0x00, 0x14),  0x78 },
+	{ OV05C10_PAGE_REG8(0x00, 0xe7),  0x03 },
+	{ OV05C10_PAGE_REG8(0x00, 0xe7),  0x00 },
+	{ OV05C10_PAGE_REG8(0x00, 0x21),  0x00 },
+	{ OV05C10_PAGE_REG8(0x01, 0x03),  0x00 },
+	{ OV05C10_PAGE_REG8(0x01, 0x04),  0x06 },
+	{ OV05C10_PAGE_REG8(0x01, 0x05),  0x07 },
+	{ OV05C10_PAGE_REG8(0x01, 0x06),  0x44 },
+	{ OV05C10_PAGE_REG8(0x01, 0x07),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x1b),  0x01 },
+	{ OV05C10_PAGE_REG8(0x01, 0x24),  0xff },
+	{ OV05C10_PAGE_REG8(0x01, 0x32),  0x03 },
+	{ OV05C10_PAGE_REG8(0x01, 0x42),  0x5d },
+	{ OV05C10_PAGE_REG8(0x01, 0x43),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x44),  0x81 },
+	{ OV05C10_PAGE_REG8(0x01, 0x46),  0x5f },
+	{ OV05C10_PAGE_REG8(0x01, 0x48),  0x18 },
+	{ OV05C10_PAGE_REG8(0x01, 0x49),  0x04 },
+	{ OV05C10_PAGE_REG8(0x01, 0x5c),  0x18 },
+	{ OV05C10_PAGE_REG8(0x01, 0x5e),  0x13 },
+	{ OV05C10_PAGE_REG8(0x01, 0x70),  0x15 },
+	{ OV05C10_PAGE_REG8(0x01, 0x77),  0x35 },
+	{ OV05C10_PAGE_REG8(0x01, 0x79),  0x00 },
+	{ OV05C10_PAGE_REG8(0x01, 0x7b),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x7d),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x7e),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x7f),  0x08 },
+	{ OV05C10_PAGE_REG8(0x01, 0x90),  0x37 },
+	{ OV05C10_PAGE_REG8(0x01, 0x91),  0x05 },
+	{ OV05C10_PAGE_REG8(0x01, 0x92),  0x18 },
+	{ OV05C10_PAGE_REG8(0x01, 0x93),  0x27 },
+	{ OV05C10_PAGE_REG8(0x01, 0x94),  0x05 },
+	{ OV05C10_PAGE_REG8(0x01, 0x95),  0x38 },
+	{ OV05C10_PAGE_REG8(0x01, 0x9b),  0x00 },
+	{ OV05C10_PAGE_REG8(0x01, 0x9c),  0x06 },
+	{ OV05C10_PAGE_REG8(0x01, 0x9d),  0x28 },
+	{ OV05C10_PAGE_REG8(0x01, 0x9e),  0x06 },
+	{ OV05C10_PAGE_REG8(0x01, 0xb2),  0x0f },
+	{ OV05C10_PAGE_REG8(0x01, 0xb3),  0x29 },
+	{ OV05C10_PAGE_REG8(0x01, 0xbf),  0x3c },
+	{ OV05C10_PAGE_REG8(0x01, 0xc2),  0x04 },
+	{ OV05C10_PAGE_REG8(0x01, 0xc4),  0x00 },
+	{ OV05C10_PAGE_REG8(0x01, 0xca),  0x20 },
+	{ OV05C10_PAGE_REG8(0x01, 0xcb),  0x20 },
+	{ OV05C10_PAGE_REG8(0x01, 0xcc),  0x28 },
+	{ OV05C10_PAGE_REG8(0x01, 0xcd),  0x28 },
+	{ OV05C10_PAGE_REG8(0x01, 0xce),  0x20 },
+	{ OV05C10_PAGE_REG8(0x01, 0xcf),  0x20 },
+	{ OV05C10_PAGE_REG8(0x01, 0xd0),  0x2a },
+	{ OV05C10_PAGE_REG8(0x01, 0xd1),  0x2a },
+	{ OV05C10_PAGE_REG8(0x0f, 0x00),  0x00 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x01),  0xa0 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x02),  0x48 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x07),  0x8f },
+	{ OV05C10_PAGE_REG8(0x0f, 0x08),  0x70 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x09),  0x01 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x0b),  0x40 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x0d),  0x07 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x11),  0x33 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x12),  0x77 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x13),  0x66 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x14),  0x65 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x15),  0x37 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x16),  0xbf },
+	{ OV05C10_PAGE_REG8(0x0f, 0x17),  0xff },
+	{ OV05C10_PAGE_REG8(0x0f, 0x18),  0xff },
+	{ OV05C10_PAGE_REG8(0x0f, 0x19),  0x12 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x1a),  0x10 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x1c),  0x77 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x1d),  0x77 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x20),  0x0f },
+	{ OV05C10_PAGE_REG8(0x0f, 0x21),  0x0f },
+	{ OV05C10_PAGE_REG8(0x0f, 0x22),  0x0f },
+	{ OV05C10_PAGE_REG8(0x0f, 0x23),  0x0f },
+	{ OV05C10_PAGE_REG8(0x0f, 0x2b),  0x20 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x2c),  0x20 },
+	{ OV05C10_PAGE_REG8(0x0f, 0x2d),  0x04 },
+	{ OV05C10_PAGE_REG8(0x03, 0x9d),  0x0f },
+	{ OV05C10_PAGE_REG8(0x03, 0x9f),  0x40 },
+	{ OV05C10_PAGE_REG8(0x00, 0x20),  0x1b },
+	{ OV05C10_PAGE_REG8(0x04, 0x19),  0x60 },
+	{ OV05C10_PAGE_REG8(0x02, 0x75),  0x05 },
+	{ OV05C10_PAGE_REG8(0x02, 0x7f),  0x06 },
+	{ OV05C10_PAGE_REG8(0x02, 0x9a),  0x03 },
+	{ OV05C10_PAGE_REG8(0x02, 0xa2),  0x07 },
+	{ OV05C10_PAGE_REG8(0x02, 0xa3),  0x10 },
+	{ OV05C10_PAGE_REG8(0x02, 0xa5),  0x02 },
+	{ OV05C10_PAGE_REG8(0x02, 0xa6),  0x0b },
+	{ OV05C10_PAGE_REG8(0x02, 0xa7),  0x48 },
+	{ OV05C10_PAGE_REG8(0x07, 0x42),  0x00 },
+	{ OV05C10_PAGE_REG8(0x07, 0x43),  0x80 },
+	{ OV05C10_PAGE_REG8(0x07, 0x44),  0x00 },
+	{ OV05C10_PAGE_REG8(0x07, 0x45),  0x80 },
+	{ OV05C10_PAGE_REG8(0x07, 0x46),  0x00 },
+	{ OV05C10_PAGE_REG8(0x07, 0x47),  0x80 },
+	{ OV05C10_PAGE_REG8(0x07, 0x48),  0x00 },
+	{ OV05C10_PAGE_REG8(0x07, 0x49),  0x80 },
+	{ OV05C10_PAGE_REG8(0x07, 0x00),  0xf7 },
+	{ OV05C10_PAGE_REG8(0x00, 0xe7),  0x03 },
+	{ OV05C10_PAGE_REG8(0x00, 0xe7),  0x00 },
+	{ OV05C10_PAGE_REG8(0x00, 0x93),  0x18 },
+	{ OV05C10_PAGE_REG8(0x00, 0x94),  0xff },
+	{ OV05C10_PAGE_REG8(0x00, 0x95),  0xbd },
+	{ OV05C10_PAGE_REG8(0x00, 0x96),  0x1a },
+	{ OV05C10_PAGE_REG8(0x00, 0x98),  0x04 },
+	{ OV05C10_PAGE_REG8(0x00, 0x99),  0x08 },
+	{ OV05C10_PAGE_REG8(0x00, 0x9b),  0x10 },
+	{ OV05C10_PAGE_REG8(0x00, 0x9c),  0x3f },
+	{ OV05C10_PAGE_REG8(0x00, 0xa1),  0x05 },
+	{ OV05C10_PAGE_REG8(0x00, 0xa4),  0x2f },
+	{ OV05C10_PAGE_REG8(0x00, 0xc0),  0x0c },
+	{ OV05C10_PAGE_REG8(0x00, 0xc1),  0x08 },
+	{ OV05C10_PAGE_REG8(0x00, 0xc2),  0x00 },
+	{ OV05C10_PAGE_REG8(0x00, 0xb6),  0x20 },
+	{ OV05C10_PAGE_REG8(0x00, 0xbb),  0x80 },
+	{ OV05C10_PAGE_REG8(0x00, 0xa0),  0x01 },
+};
+
+static const struct cci_reg_sequence mode_OV05C10_stream_on_regs[] = {
+	{ OV05C10_PAGE_REG8(0x01, 0x33), 0x03 },
+	{ OV05C10_PAGE_REG8(0x01, 0x01), 0x02 },
+	{ OV05C10_PAGE_REG8(0x00, 0x20), 0x1f },
+	{ OV05C10_PAGE_REG8(0x00, 0xfd), 0x01 },
+};
+
+static const struct cci_reg_sequence mode_OV05C10_stream_off_regs[] = {
+	{ OV05C10_PAGE_REG8(0x00, 0x20), 0x5b },
+	{ OV05C10_PAGE_REG8(0x01, 0x33), 0x02 },
+	{ OV05C10_PAGE_REG8(0x01, 0x01), 0x02 },
+};
+
+/*
+ * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
+ * data rate => double data rate; number of lanes => 2; bits per pixel => 10
+ */
+static u64 link_freq_to_pixel_rate(u64 f, u32 lane_nr)
+{
+	f *= 2 * lane_nr;
+	do_div(f, OV05C10_BITS_PER_SAMPLE);
+
+	return f;
+}
+
+/* Menu items for LINK_FREQ V4L2 control */
+static const s64 ov05c10_link_freq_menu_items[] = {
+	OV05C10_LINK_FREQ_900MHZ,
+};
+
+/* Mode configs, currently, only support 1 mode */
+static const struct ov05c10_mode ov05c10_supported_modes[] = {
+	{
+		.width = MODE_WIDTH,
+		.height = MODE_HEIGHT,
+		.vts_def = OV05C10_VTS_30FPS,
+		.vts_min = OV05C10_VTS_30FPS,
+		.hts = 640,
+		.lanes = 2,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(ov05c10_2888x1808_regs),
+			.regs = ov05c10_2888x1808_regs,
+		},
+		.link_freq_index = OV05C10_LINK_FREQ_900MHZ_INDEX,
+	},
+};
+
+struct ov05c10 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+
+	/* V4L2 control handler */
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	/* V4L2 Controls */
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *exposure;
+
+	struct regmap *regmap;
+
+	/* gpio descriptor */
+	struct gpio_desc *enable_gpio;
+
+	/* Pointer to current selected sensor mode */
+	const struct ov05c10_mode *cur_mode;
+
+	/* Menu bitmap for link_freq_ctrl */
+	unsigned long link_freq_bitmap;
+	struct clk *clk;
+
+	/* Current page for sensor register control */
+	int cur_page;
+	u32 page_ctrl_reg;
+};
+
+static inline struct ov05c10 *to_ov05c10(struct v4l2_subdev *_sd)
+{
+	return container_of(_sd, struct ov05c10, sd);
+}
+
+static int ov05c10_reg_read(struct ov05c10 *ov05c10,
+			    u32 reg, u64 *val, int *err)
+{
+	int ret;
+	u8 page;
+
+	page = OV05C10_PAGE_GET(reg);
+	if (page == ov05c10->cur_page)
+		goto read_reg;
+
+	/* switch to register page */
+	ret = cci_write(ov05c10->regmap, ov05c10->page_ctrl_reg, page, err);
+	if (ret) {
+		dev_err(ov05c10->sd.dev, "Error switch page reg 0x%04x: %d\n",
+			reg, ret);
+		ov05c10->cur_page = -1;
+		goto out;
+	}
+
+	ov05c10->cur_page = page;
+read_reg:
+	ret = cci_read(ov05c10->regmap, reg, val, err);
+out:
+	return ret;
+}
+
+static int ov05c10_reg_write(struct ov05c10 *ov05c10, u32 reg, u64 val, int *err)
+{
+	int ret;
+	u8 page;
+
+	page = OV05C10_PAGE_GET(reg);
+	if (page == ov05c10->cur_page)
+		goto write_reg;
+
+	/* switch to register page */
+	ret = cci_write(ov05c10->regmap, ov05c10->page_ctrl_reg, page, err);
+	if (ret) {
+		dev_err(ov05c10->sd.dev, "Error switch page reg 0x%04x: %d\n",
+			reg, ret);
+		ov05c10->cur_page = -1;
+		goto out;
+	}
+
+	ov05c10->cur_page = page;
+write_reg:
+	ret = cci_write(ov05c10->regmap, reg, val, err);
+out:
+	return ret;
+}
+
+static int ov05c10_cci_multi_reg_pwrite(struct ov05c10 *ov05c10,
+					const struct cci_reg_sequence *regs,
+					unsigned int num_regs, int *err)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < num_regs; i++) {
+		ret = ov05c10_reg_write(ov05c10, regs[i].reg, regs[i].val, err);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ov05c10_cci_update_pbits(struct ov05c10 *ov05c10, u32 reg, u64 mask,
+				    u64 val, int *err)
+{
+	int ret = 0;
+	u8 page;
+
+	page = OV05C10_PAGE_GET(reg);
+	if (page == ov05c10->cur_page)
+		goto update_bits;
+
+	/* switch to register page */
+	ret = cci_write(ov05c10->regmap, ov05c10->page_ctrl_reg, page, err);
+	if (ret) {
+		dev_err(ov05c10->sd.dev, "Error switch page reg 0x%04x: %d\n",
+			reg, ret);
+		ov05c10->cur_page = -1;
+		goto out;
+	}
+
+	ret = cci_update_bits(ov05c10->regmap, reg, mask, val, err);
+update_bits:
+	ov05c10->cur_page = page;
+out:
+	return ret;
+}
+
+static int ov05c10_update_vblank(struct ov05c10 *ov05c10, u32 vblank)
+{
+	const struct ov05c10_mode *mode = ov05c10->cur_mode;
+	u64 vts;
+	u32 val;
+	int ret = 0;
+
+	val = mode->height + vblank;
+	ov05c10_reg_read(ov05c10, OV05C10_REG_TIMING_VTS, &vts, &ret);
+	if (ret)
+		goto out;
+
+	val = (val > vts) ? val - vts : 0;
+	ov05c10_reg_write(ov05c10, OV05C10_REG_VTS, val, &ret);
+out:
+	return ret;
+}
+
+static int ov05c10_update_exposure(struct ov05c10 *ov05c10, u32 exposure)
+{
+	int ret = 0;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_EXPOSURE, exposure, &ret);
+
+	return ret;
+}
+
+static int ov05c10_update_analog_gain(struct ov05c10 *ov05c10, u32 a_gain)
+{
+	int ret = 0;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_ANALOG_GAIN, a_gain, &ret);
+
+	return ret;
+}
+
+static int ov05c10_update_digital_gain(struct ov05c10 *ov05c10, u32 d_gain)
+{
+	int ret = 0;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN, d_gain, &ret);
+
+	return ret;
+}
+
+static int ov05c10_enable_test_pattern(struct ov05c10 *ov05c10, u32 pattern)
+{
+	int ret = 0;
+
+	if (pattern) {
+		ov05c10_cci_update_pbits(ov05c10,
+					 OV05C10_REG_TEST_PATTERN_CTL,
+					 OV05C10_REG_TEST_PATTERN_CTL_COLOR_BAR,
+					 1,
+					 &ret);
+		if (ret)
+			goto out;
+	}
+
+	ov05c10_cci_update_pbits(ov05c10,
+				 OV05C10_REG_TEST_PATTERN,
+				 OV05C10_TEST_PATTERN_ENABLE,
+				 pattern ? 1 : 0,
+				 &ret);
+	if (ret)
+		goto out;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+out:
+	return ret;
+}
+
+static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov05c10 *ov05c10 = container_of(ctrl->handler,
+					       struct ov05c10, ctrl_handler);
+	int ret = 0;
+	s64 max;
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		s64 cur_exp = ov05c10->exposure->cur.val;
+
+		/* Update max exposure while meeting expected vblanking */
+		max = ov05c10->cur_mode->height + ctrl->val - OV05C10_EXPOSURE_MAX_MARGIN;
+		cur_exp = clamp(cur_exp, ov05c10->exposure->minimum, max);
+		ret = __v4l2_ctrl_modify_range(ov05c10->exposure,
+					       ov05c10->exposure->minimum,
+					       max, ov05c10->exposure->step,
+					       cur_exp);
+		if (!ret)
+			return ret;
+	}
+
+	/*
+	 * Applying V4L2 control value only happens
+	 * when power is up for streaming
+	 */
+	if (!pm_runtime_get_if_in_use(ov05c10->dev))
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ANALOGUE_GAIN:
+		ret = ov05c10_update_analog_gain(ov05c10, ctrl->val);
+		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = ov05c10_update_digital_gain(ov05c10, ctrl->val);
+		break;
+	case V4L2_CID_EXPOSURE:
+		ret = ov05c10_update_exposure(ov05c10, ctrl->val);
+		break;
+	case V4L2_CID_VBLANK:
+		ret = ov05c10_update_vblank(ov05c10, ctrl->val);
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = ov05c10_enable_test_pattern(ov05c10, ctrl->val);
+		break;
+	default:
+		ret = -ENOTTY;
+		dev_err(ov05c10->dev,
+			"ctrl(id:0x%x,val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		break;
+	}
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	pm_runtime_mark_last_busy(ov05c10->dev);
+	pm_runtime_put_autosuspend(ov05c10->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops ov05c10_ctrl_ops = {
+	.s_ctrl = ov05c10_set_ctrl,
+};
+
+static int ov05c10_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	/* Only one bayer order(GRBG) is supported */
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	return 0;
+}
+
+static int ov05c10_enum_frame_size(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index >= ARRAY_SIZE(ov05c10_supported_modes))
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+
+	fse->min_width = ov05c10_supported_modes[fse->index].width;
+	fse->max_width = fse->min_width;
+	fse->min_height = ov05c10_supported_modes[fse->index].height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static int ov05c10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+	const struct ov05c10_mode *mode;
+	s32 vblank_def;
+	s32 vblank_min;
+	s64 pixel_rate;
+	s64 link_freq;
+	s64 h_blank;
+
+	/* Only one raw bayer(GRBG) order is supported */
+	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	mode = v4l2_find_nearest_size(ov05c10_supported_modes,
+				      ARRAY_SIZE(ov05c10_supported_modes),
+				      width, height,
+				      fmt->format.width, fmt->format.height);
+
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+
+	framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	*framefmt = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		__v4l2_ctrl_s_ctrl(ov05c10->link_freq, mode->link_freq_index);
+		link_freq = ov05c10_link_freq_menu_items[mode->link_freq_index];
+		pixel_rate = link_freq_to_pixel_rate(link_freq,
+						     mode->lanes);
+		__v4l2_ctrl_s_ctrl_int64(ov05c10->pixel_rate, pixel_rate);
+
+		/* Update limits and set FPS to default */
+		vblank_def = mode->vts_def - mode->height;
+		vblank_min = mode->vts_min - mode->height;
+		__v4l2_ctrl_modify_range(ov05c10->vblank, vblank_min,
+					 OV05C10_VTS_MAX - mode->height,
+					 1, vblank_def);
+		__v4l2_ctrl_s_ctrl(ov05c10->vblank, vblank_def);
+		h_blank = mode->hts;
+		__v4l2_ctrl_modify_range(ov05c10->hblank, h_blank,
+					 h_blank, 1, h_blank);
+
+		ov05c10->cur_mode = mode;
+	}
+
+	return 0;
+}
+
+static void ov05c10_sensor_power_set(struct ov05c10 *ov05c10, bool on)
+{
+	if (on) {
+		gpiod_set_value(ov05c10->enable_gpio, 0);
+		usleep_range(10, 20);
+
+		gpiod_set_value(ov05c10->enable_gpio, 1);
+		usleep_range(1000, 2000);
+	} else {
+		gpiod_set_value(ov05c10->enable_gpio, 0);
+		usleep_range(10, 20);
+	}
+}
+
+static int ov05c10_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	const struct ov05c10_reg_list *reg_list;
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(ov05c10->dev);
+	if (ret < 0)
+		return ret;
+
+	/* Apply default values of current mode */
+	reg_list =  &ov05c10->cur_mode->reg_list;
+	ov05c10_cci_multi_reg_pwrite(ov05c10, reg_list->regs,
+				     reg_list->num_of_regs, &ret);
+	if (ret) {
+		dev_err(ov05c10->dev, "fail to set mode, ret: %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(ov05c10->sd.ctrl_handler);
+	if (ret) {
+		dev_err(ov05c10->dev, "failed to setup v4l2 handler %d\n", ret);
+		goto err_rpm_put;
+	}
+
+	ov05c10_cci_multi_reg_pwrite(ov05c10, mode_OV05C10_stream_on_regs,
+				     ARRAY_SIZE(mode_OV05C10_stream_on_regs), &ret);
+	if (ret) {
+		dev_err(ov05c10->dev, "fail to start the streaming\n");
+		goto err_rpm_put;
+	}
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(ov05c10->dev);
+	return ret;
+}
+
+static int ov05c10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	int ret = 0;
+
+	ov05c10_cci_multi_reg_pwrite(ov05c10, mode_OV05C10_stream_off_regs,
+				     ARRAY_SIZE(mode_OV05C10_stream_off_regs), &ret);
+	if (ret)
+		dev_err(ov05c10->dev, "fail to stop the streaming\n");
+
+	pm_runtime_put(ov05c10->dev);
+
+	return 0;
+}
+
+static int ov05c10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *frame_fmt;
+	static const struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = MODE_WIDTH,
+			.height = MODE_HEIGHT,
+			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+			.field = V4L2_FIELD_NONE,
+			.colorspace = V4L2_COLORSPACE_RAW,
+		}
+	};
+
+	frame_fmt = v4l2_subdev_state_get_format(sd_state, 0);
+	*frame_fmt = fmt.format;
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops ov05c10_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops ov05c10_pad_ops = {
+	.enum_mbus_code = ov05c10_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = ov05c10_set_pad_format,
+	.enum_frame_size = ov05c10_enum_frame_size,
+	.enable_streams = ov05c10_enable_streams,
+	.disable_streams = ov05c10_disable_streams,
+};
+
+static const struct v4l2_subdev_ops ov05c10_subdev_ops = {
+	.video = &ov05c10_video_ops,
+	.pad = &ov05c10_pad_ops,
+};
+
+static const struct media_entity_operations ov05c10_subdev_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops ov05c10_internal_ops = {
+	.init_state = ov05c10_init_state,
+};
+
+static const char * const ov05c10_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color Bar Type 1",
+	"Vertical Color Bar Type 2",
+	"Vertical Color Bar Type 3",
+	"Vertical Color Bar Type 4"
+};
+
+static int ov05c10_init_controls(struct ov05c10 *ov05c10)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &ov05c10->ctrl_handler;
+	const struct ov05c10_mode *mode = ov05c10->cur_mode;
+	struct v4l2_fwnode_device_properties props;
+	s64 pixel_rate_max;
+	s64 exposure_max;
+	s64 vblank_def;
+	s64 vblank_min;
+	u32 max_items;
+	s64 hblank;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(ov05c10->dev, &props);
+	if (ret)
+		goto err_hdl_free;
+
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	if (ret)
+		return ret;
+
+	max_items = ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
+	ov05c10->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr,
+				       NULL,
+				       V4L2_CID_LINK_FREQ,
+				       __fls(ov05c10->link_freq_bitmap),
+				       __ffs(ov05c10->link_freq_bitmap),
+				       ov05c10_link_freq_menu_items);
+	if (ov05c10->link_freq)
+		ov05c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate_max =
+		link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
+					mode->lanes);
+	ov05c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+						V4L2_CID_PIXEL_RATE,
+						0, pixel_rate_max,
+						1, pixel_rate_max);
+
+	vblank_def = mode->vts_def - mode->height;
+	vblank_min = mode->vts_min - mode->height;
+	ov05c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
+					    V4L2_CID_VBLANK,
+					    vblank_min,
+					    OV05C10_VTS_MAX - mode->height,
+					    1, vblank_def);
+
+	hblank = mode->hts - mode->width;
+	ov05c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
+					    V4L2_CID_HBLANK,
+					    hblank, hblank, 1, hblank);
+	if (ov05c10->hblank)
+		ov05c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	exposure_max = mode->vts_def - OV05C10_EXPOSURE_MAX_MARGIN;
+	ov05c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
+					      V4L2_CID_EXPOSURE,
+					      OV05C10_EXPOSURE_MIN,
+					      exposure_max,
+					      OV05C10_EXPOSURE_STEP,
+					      exposure_max);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OV05C10_ANA_GAIN_MIN, OV05C10_ANA_GAIN_MAX,
+			  OV05C10_ANA_GAIN_STEP, OV05C10_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  OV05C10_DGTL_GAIN_MIN, OV05C10_DGTL_GAIN_MAX,
+			  OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov05c10_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov05c10_test_pattern_menu) - 1,
+				     0, 0, ov05c10_test_pattern_menu);
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto err_hdl_free;
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(ov05c10->dev, "V4L2 control init failed (%d)\n", ret);
+		goto err_hdl_free;
+	}
+
+	ov05c10->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_hdl_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static int ov05c10_parse_endpoint(struct ov05c10 *ov05c10,
+				  struct fwnode_handle *fwnode)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct device *dev = ov05c10->dev;
+	struct fwnode_handle *ep;
+	int ret;
+
+	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
+	if (!ep) {
+		dev_err(dev, "Failed to get next endpoint\n");
+		return -ENXIO;
+	}
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return ret;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV05C10_DATA_LANES) {
+		dev_err(dev,
+			"number of CSI2 data lanes %d is not supported\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto err_endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       ov05c10_link_freq_menu_items,
+				       ARRAY_SIZE(ov05c10_link_freq_menu_items),
+				       &ov05c10->link_freq_bitmap);
+	if (ret)
+		dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", ret);
+err_endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
+}
+
+static int ov05c10_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	int ret;
+
+	ret = clk_prepare_enable(ov05c10->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock %d\n", ret);
+		goto error;
+	}
+
+	ov05c10_sensor_power_set(ov05c10, true);
+
+error:
+	return ret;
+}
+
+static int ov05c10_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+
+	ov05c10_sensor_power_set(ov05c10, false);
+	clk_disable_unprepare(ov05c10->clk);
+
+	return 0;
+}
+
+static int ov05c10_probe(struct i2c_client *client)
+{
+	struct ov05c10 *ov05c10;
+	u32 clkfreq;
+	int ret;
+
+	ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERNEL);
+	if (!ov05c10)
+		return -ENOMEM;
+
+	ov05c10->dev = &client->dev;
+	ov05c10->cur_mode = &ov05c10_supported_modes[0];
+
+	struct fwnode_handle *fwnode = dev_fwnode(ov05c10->dev);
+
+	ov05c10->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(ov05c10->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(ov05c10->clk),
+				     "failed to get clk\n");
+
+	clkfreq = clk_get_rate(ov05c10->clk);
+	if (clkfreq != OV05C10_REF_CLK)
+		return dev_err_probe(ov05c10->dev, -EINVAL,
+				     "fail invalid clock freq %u, %lu expected\n",
+				     clkfreq, OV05C10_REF_CLK);
+
+	ret = ov05c10_parse_endpoint(ov05c10, fwnode);
+	if (ret)
+		return dev_err_probe(ov05c10->dev, -EINVAL,
+				     "fail to parse endpoint\n");
+
+	ov05c10->enable_gpio = devm_gpiod_get(ov05c10->dev, "enable",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(ov05c10->enable_gpio))
+		return dev_err_probe(ov05c10->dev,
+				     PTR_ERR(ov05c10->enable_gpio),
+				     "fail to get enable gpio\n");
+
+	ov05c10->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(ov05c10->regmap))
+		return dev_err_probe(ov05c10->dev, PTR_ERR(ov05c10->regmap),
+				     "fail to init cci\n");
+
+	ov05c10->cur_page = -1;
+	ov05c10->page_ctrl_reg = OV05C10_REG_PAGE_CTL;
+
+	/*
+	 * Enable power management. The driver supports runtime PM, but needs to
+	 * work when runtime PM is disabled in the kernel. To that end, power
+	 * the sensor on manually here.
+	 */
+	ov05c10_sensor_power_set(ov05c10, true);
+
+	/*
+	 * Enable runtime PM with autosuspend. As the device has been powered
+	 * manually, mark it as active, and increase the usage count without
+	 * resuming the device.
+	 */
+	pm_runtime_set_active(ov05c10->dev);
+	pm_runtime_get_noresume(ov05c10->dev);
+	pm_runtime_enable(ov05c10->dev);
+	pm_runtime_set_autosuspend_delay(ov05c10->dev, 1000);
+	pm_runtime_use_autosuspend(ov05c10->dev);
+
+	v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
+
+	ret = ov05c10_runtime_resume(&client->dev);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "failed to power-on the sensor");
+
+	ret = ov05c10_init_controls(ov05c10);
+	if (ret) {
+		dev_err(ov05c10->dev, "fail to init ov05c10 ctl %d\n", ret);
+		goto err_pm;
+	}
+
+	ov05c10->sd.internal_ops = &ov05c10_internal_ops;
+	ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov05c10->sd.entity.ops = &ov05c10_subdev_entity_ops;
+	ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov05c10->sd.entity, OV05C10_NUM_OF_PADS,
+				     &ov05c10->pad);
+	if (ret) {
+		dev_err(ov05c10->dev, "fail to init ov05c10 pads %d\n", ret);
+		goto err_hdl_free;
+	}
+
+	ret = v4l2_subdev_init_finalize(&ov05c10->sd);
+	if (ret < 0) {
+		dev_err(ov05c10->dev, "fail to finalize ov05c10 subdev init %d\n", ret);
+		goto err_media_entity_cleanup;
+	}
+
+	ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
+	if (ret) {
+		dev_err(ov05c10->dev, "fail to register ov05c10 subdev %d\n", ret);
+		goto err_media_entity_cleanup;
+	}
+
+	return 0;
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&ov05c10->sd.entity);
+err_hdl_free:
+	v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
+err_pm:
+	pm_runtime_disable(ov05c10->dev);
+	pm_runtime_put_noidle(ov05c10->dev);
+	ov05c10_sensor_power_set(ov05c10, false);
+	return ret;
+}
+
+static void ov05c10_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
+
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		ov05c10_runtime_suspend(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(ov05c10_pm_ops, ov05c10_runtime_suspend,
+				 ov05c10_runtime_resume, NULL);
+
+static const struct i2c_device_id ov05c10_i2c_ids[] = {
+	{"ov05c10", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ov05c10_i2c_ids);
+
+static struct i2c_driver ov05c10_i2c_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.pm = pm_ptr(&ov05c10_pm_ops),
+	},
+	.id_table = ov05c10_i2c_ids,
+	.probe = ov05c10_probe,
+	.remove = ov05c10_remove,
+};
+
+module_i2c_driver(ov05c10_i2c_driver);
+
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
+MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
+MODULE_DESCRIPTION("OmniVision OV05C10 sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


