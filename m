Return-Path: <linux-media+bounces-29692-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC5A8184F
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9A1A1BA57BB
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 22:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EE625522E;
	Tue,  8 Apr 2025 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m4ENjWgo"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973622173D;
	Tue,  8 Apr 2025 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150439; cv=fail; b=CfinhiL3HJrFC30vhtELBniBlM16QEkSFuSuNMqwcN9bpxv3Mi2HpYmjyMWekemlS/u7XSWw2fo5OiNyGLo2gc6eFcvLML6xO7ophKPHFktP/LL4wHxIjXBsmRDqJU4aowiyqqvWePr05ykLuP1CU4KeaQW+LXWZh4RnahuI91M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150439; c=relaxed/simple;
	bh=pkQqaIl8W119Pbrf3TjTITIEniH2UJkIdTE1wwkK/CE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q893pJcKdIMDYSNDAQfx8jCzPSSwRgHIJTulKh8fTEo+dLonFcCWm0L7qi1aLH31SDlEt8JrmMp8/+OfAjhxaMJN89ppoqo4M8i8jdDvRbqT6UGvii5DBXoiXivgtj221q4J6dmsIFP3w9CgUY+c3a5hhWBaHCVIFlXaiwDXMIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m4ENjWgo; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRuTAmkKgns4nq2jhNXh1kK8+Nw85+p+u/0ONYHQQp2NoReAd5B6FBVPAC5j6gqfNz3/VzeeS+VtGABuXEomxuX3rv25ROahPC9ZCuF5fjVwL/zZ6uEoZ/qvZjLSlb8hO3dzdlbohvkRbhg4kLYcYAJ6xviLXv4SO9IvaZ84NXxHvvGFinajbHEXH98Usiy+lK4ijwEK7S8yEcgfVea7HfI+IqZKLlLoUr4HKV78V/BLhXzreJwx3HGGcm33AtxCFR5qFmQ7dzuwF8LbGpnIUZgjAXLRYc8SJCWsSGxqG1UQEFwhUSvyl6as0xxKY+iRjk3guipg4HVtHkTTywPYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjhhkpsfeAK2f5sWg/LUBJezV/y/O7XeXNNA73gGZMs=;
 b=YmsituDVpu39KhpThgh4wymVORUGkMzu6i5RNiq3mOerygiNAnqGj5wyKXcgPB/CIQBM0NhIA1eBjT5c0dLZVja4HIGL9ZwcxQj1bvxSW/vb8nzkmTG0mFl406Nkgc6DBH0Af+kb9GU2JlfZjXazTxYc3IKqNqYoOsQEhVUZGrMiGPC/GDFTPKd7gYZAeA+5/5IEmzatKeEMP6VTOvnUUnLnUxLuegfBXsb5V14i3ZJIB85R9M9c2tpJ3C1G2+YRGPE80dIyGreCMSBilc3S8RQ7QJTKgl6DBb9F/bdAPui6GifAdj3c0vJrPFaFlURXW6x8B5TCW6KvLDBjNkJ24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjhhkpsfeAK2f5sWg/LUBJezV/y/O7XeXNNA73gGZMs=;
 b=m4ENjWgovisTwRbJ1I/AyE9yU6UklWdCfMZhqyTL+EAoYQjMhZ7baQk8Tlz+1ycpUJe9j3Fb7ZY/nQhIrl9B4lc6GVIXLgaEbLEOjkZOjydbMAQU0F80lOgn5MHGkU9D9EfIL6lxsQNA+R/EgUKJuh2c61QUJAuYXJeh+o2jujI=
Received: from BY5PR20CA0016.namprd20.prod.outlook.com (2603:10b6:a03:1f4::29)
 by CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 22:13:51 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::59) by BY5PR20CA0016.outlook.office365.com
 (2603:10b6:a03:1f4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.32 via Frontend Transport; Tue,
 8 Apr 2025 22:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.0 via Frontend Transport; Tue, 8 Apr 2025 22:13:50 +0000
Received: from maple-stxh-linux-10.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Apr 2025 17:13:46 -0500
From: Pratap Nirujogi <pratap.nirujogi@amd.com>
To: <mchehab@kernel.org>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>, <hverkuil@xs4all.nl>,
	<bryan.odonoghue@linaro.org>, <krzk@kernel.org>,
	<dave.stevenson@raspberrypi.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<benjamin.chan@amd.com>, <bin.du@amd.com>, <grosikop@amd.com>,
	<king.li@amd.com>, <dantony@amd.com>, <vengutta@amd.com>, Bin Du
	<Bin.Du@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Subject: [PATCH v3] media: i2c: Add OV05C10 camera sensor driver
Date: Tue, 8 Apr 2025 18:12:01 -0400
Message-ID: <20250408221246.911508-1-pratap.nirujogi@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0493544d-da63-4615-5755-08dd76eaa45b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vJuEzk7aWoPcsMfsuBj7bcRIrjZY8KxyNvbJWaeC2mxpTpT8EvLuebR8gTMe?=
 =?us-ascii?Q?t6DzZwrnrdFjXl8Bi/fuCHAjv1FKGhvNJ0LKJNUM7YhPzMXO7M1kig4hSZYq?=
 =?us-ascii?Q?fM8uxTaW6anVGkuSfnRuRgXUtaeqzovRGYuFdZPBxVdsfqGOkDpy/SZrdgPb?=
 =?us-ascii?Q?sBX10JJ568xnj0q1ulczItevm3LyfxhSRkm40MBbZPAJKmM8chIk2Ddh+dxO?=
 =?us-ascii?Q?pPwLJhj/wdhJcchqMJVdmhUOlq/0vdIBZ3a1Kdw6mG/T7+is5ocwDB4TWukv?=
 =?us-ascii?Q?ogN7P0JYF4Lc2OmKjyWP1TL1vxxy0XWkmpc4jbsZIj8Wx5/2aQN1/ixXaiU9?=
 =?us-ascii?Q?QNaVq2//bPaikp6tQU0pbgR8l0+g4/BgFhDxxKaALPe5PotcyNRU5bxn9AWB?=
 =?us-ascii?Q?fu8gdy9x4tDtwQHvd/IYtM2XpO5k1Dqqep/SvYlSwJg7SPTQDtpdWJkz1ARb?=
 =?us-ascii?Q?V1RVUXP5D14bz880v5TBa5AgN/MMcC5ix09KD7dcCc8U4/aSdsvnQwG8OsKK?=
 =?us-ascii?Q?zl0nlgiLdROo2x8/mPGKR1R2vF7WgUX0bprQ/FvDrUz3ECMQkamHZGzGq4SP?=
 =?us-ascii?Q?ryp3SKEbGTDUO0PbZruZHyIvRb55pqq/GmUWz8NQK9ZLi6QgAIZFI6uieoOg?=
 =?us-ascii?Q?tL4XDFoAjznXN2Zi1hr089C6rkkWza2t9rBc++uajAbEnpZCSFu2sFUbw2jx?=
 =?us-ascii?Q?memOFZtZf4eghWfnF7USnTd2KZxay/MyQXmxbPB7KATBykunqKYAIz/wrI9b?=
 =?us-ascii?Q?cDs3uExgxcWPEkAN98zHrDoqnXUYGDgNteE2qsPtCYqxN51acl3AUHmDVSUE?=
 =?us-ascii?Q?VHEZPrjgCbSuZyDjY2nUOBsjCkyyZRtD5y+TxQoAKv3uIFZ+Xb2kJZ0gjMrR?=
 =?us-ascii?Q?RW/08JPV5j4ECE+eEzs0RBJK4octqNFUWNw5nnCULDCWClHM9PBwtNMB1WZL?=
 =?us-ascii?Q?+tKWH+BldAYG3JjRmbBz47xd/jSl7E5aGNlK+ANYYPgpvktsAc5ZWjYpAI5Q?=
 =?us-ascii?Q?rkz3/WITvrOUSgg8HTvDJfPF49oDy/qus0g98ts7ECMMfSgsGp6/S5k/oLhb?=
 =?us-ascii?Q?ZlOEQjIIPtlg35ieb/IO5BxgSqpYPov4L9ftunIGam6D6yHmbW6hQMieLBUe?=
 =?us-ascii?Q?TACf8OU4NIvTdl+TCbqXLvYNI3dTmNIzI/DnmOU7SD1IMaNUU79Jzz5qpmWU?=
 =?us-ascii?Q?ymJlHEj+LQlmJ8lzaDqzDzX2C/p3eFpycY2WAexvbfInEs+rvKUQqsRepOKL?=
 =?us-ascii?Q?BuXqwzQOCTNzVzU7A4NV5p17zh8IjmEYOiOaB17Do5F/EQDaOXl597BdPkDm?=
 =?us-ascii?Q?g4IbRyO7QA31xotBYQ6hD+cn2Y2byKwbBt9kZLe4C7IYnxjVwnDENIKNM9t1?=
 =?us-ascii?Q?W0PiFFMAyjt9+T7nNVWyGvejwjBrlP9dHXNr5FShwimGBZKMoUz6QXjfInJF?=
 =?us-ascii?Q?CTXgT3xsWx+cHHYvo/aERcb0VbIdKyVmtImHALe+O2dpgLMOdm2gwQs4O3s5?=
 =?us-ascii?Q?CBtMlJyWs33itC4SJ6v5qhvj7sZgCjNT1yNw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 22:13:50.6909
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0493544d-da63-4615-5755-08dd76eaa45b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655

From: Bin Du <Bin.Du@amd.com>

Add driver for OmniVision 5.2M OV05C10 sensor. This driver
supports only the full size normal 2888x1808@30fps 2-lane
sensor profile.

Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
Co-developed-by: Bin Du <bin.du@amd.com>
Signed-off-by: Bin Du <bin.du@amd.com>
Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
---
changes v2 -> v3:

* Update "refclk" property variable as "clock-frequency".
* Update sensor GPIO connector id name.
* Fix sensor v4l2 compliance issue.
* Fix license info.
* Address review comments.

 MAINTAINERS                 |    8 +
 drivers/media/i2c/Kconfig   |   10 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/ov05c10.c | 1061 +++++++++++++++++++++++++++++++++++
 4 files changed, 1080 insertions(+)
 create mode 100644 drivers/media/i2c/ov05c10.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..dc8d2bdc86ef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17807,6 +17807,14 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
 F:	drivers/media/i2c/ov02a10.c
 
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
index e576b213084d..70336ee2494e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -356,6 +356,16 @@ config VIDEO_OV02A10
 	  To compile this driver as a module, choose M here: the
 	  module will be called ov02a10.
 
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
index 6c23a4463527..a3ec22164389 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -83,6 +83,7 @@ obj-$(CONFIG_VIDEO_MT9V111) += mt9v111.o
 obj-$(CONFIG_VIDEO_OG01A1B) += og01a1b.o
 obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
 obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
+obj-$(CONFIG_VIDEO_OV05C10) += ov05c10.o
 obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
 obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
 obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
new file mode 100644
index 000000000000..9a1e493c4073
--- /dev/null
+++ b/drivers/media/i2c/ov05c10.c
@@ -0,0 +1,1061 @@
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
+#define PAGE_NUM_MASK			0xff000000
+#define PAGE_NUM_SHIFT			24
+#define REG_ADDR_MASK			0x00ffffff
+
+#define OV05C10_SYSCTL_PAGE		(0 << PAGE_NUM_SHIFT)
+#define OV05C10_CISCTL_PAGE		(1 << PAGE_NUM_SHIFT)
+#define OV05C10_ISPCTL_PAGE		(4 << PAGE_NUM_SHIFT)
+
+/* Chip ID */
+#define OV05C10_REG_CHIP_ID		(CCI_REG24(0x00) | OV05C10_SYSCTL_PAGE)
+#define OV05C10_CHIP_ID			0x43055610
+
+/* Control registers */
+#define OV05C10_REG_TRIGGER		(CCI_REG8(0x01) | OV05C10_CISCTL_PAGE)
+#define OV05C_REG_TRIGGER_START		BIT(0)
+
+/* Exposure control */
+#define OV05C10_REG_EXPOSURE		(CCI_REG24(0x02) | OV05C10_CISCTL_PAGE)
+#define OV05C10_EXPOSURE_MAX_MARGIN	33
+#define OV05C10_EXPOSURE_MIN		4
+#define OV05C10_EXPOSURE_STEP		1
+#define OV05C10_EXPOSURE_DEFAULT	0x40
+
+/* V_TIMING internal */
+#define OV05C10_REG_VTS			(CCI_REG16(0x05) | OV05C10_CISCTL_PAGE)
+#define OV05C10_VTS_30FPS		1860
+#define OV05C10_VTS_MAX			0x7fff
+
+/* Test Pattern Control */
+#define OV05C10_REG_TEST_PATTERN	(CCI_REG8(0x12) | OV05C10_ISPCTL_PAGE)
+#define OV05C10_TEST_PATTERN_ENABLE	BIT(0)
+#define OV05C10_REG_TEST_PATTERN_CTL	(CCI_REG8(0xf3) | OV05C10_ISPCTL_PAGE)
+#define OV05C10_REG_TEST_PATTERN_XXX	BIT(0)
+
+/* Digital gain control */
+#define OV05C10_REG_DGTL_GAIN_H		(CCI_REG8(0x21) | OV05C10_CISCTL_PAGE)
+#define OV05C10_REG_DGTL_GAIN_L		(CCI_REG8(0x22) | OV05C10_CISCTL_PAGE)
+
+#define OV05C10_DGTL_GAIN_MIN		0x40
+#define OV05C10_DGTL_GAIN_MAX		0xff
+#define OV05C10_DGTL_GAIN_DEFAULT	0x40
+#define OV05C10_DGTL_GAIN_STEP		1
+
+#define OV05C10_DGTL_GAIN_L_MASK	0xff
+#define OV05C10_DGTL_GAIN_H_SHIFT	8
+#define OV05C10_DGTL_GAIN_H_MASK	0xff00
+
+/* Analog gain control */
+#define OV05C10_REG_ANALOG_GAIN		(CCI_REG8(0x24) | OV05C10_CISCTL_PAGE)
+#define OV05C10_ANA_GAIN_MIN		0x80
+#define OV05C10_ANA_GAIN_MAX		0x07c0
+#define OV05C10_ANA_GAIN_STEP		1
+#define OV05C10_ANA_GAIN_DEFAULT	0x80
+
+/* H TIMING internal */
+#define OV05C10_REG_HTS			(CCI_REG16(0x37) | OV05C10_CISCTL_PAGE)
+#define OV05C10_HTS_30FPS		0x0280
+
+/* Page selection */
+#define OV05C10_REG_PAGE_CTL		CCI_REG8(0xfd)
+
+#define NUM_OF_PADS 1
+
+#define OV05C10_GET_PAGE_NUM(reg)	(((reg) & PAGE_NUM_MASK) >>\
+					 PAGE_NUM_SHIFT)
+#define OV05C10_GET_REG_ADDR(reg)	((reg) & REG_ADDR_MASK)
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
+static const s64 ov05c10_link_frequencies[] = {
+	925 * HZ_PER_MHZ,
+};
+
+/* 2888x1808 30fps, 1800mbps, 2lane, 24mhz */
+static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0x20),  0x00 },
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0x20),  0x0b },
+	{ CCI_REG8(0xc1),  0x09 },
+	{ CCI_REG8(0x21),  0x06 },
+	{ CCI_REG8(0x14),  0x78 },
+	{ CCI_REG8(0xe7),  0x03 },
+	{ CCI_REG8(0xe7),  0x00 },
+	{ CCI_REG8(0x21),  0x00 },
+	{ CCI_REG8(0xfd),  0x01 },
+	{ CCI_REG8(0x03),  0x00 },
+	{ CCI_REG8(0x04),  0x06 },
+	{ CCI_REG8(0x05),  0x07 },
+	{ CCI_REG8(0x06),  0x44 },
+	{ CCI_REG8(0x07),  0x08 },
+	{ CCI_REG8(0x1b),  0x01 },
+	{ CCI_REG8(0x24),  0xff },
+	{ CCI_REG8(0x32),  0x03 },
+	{ CCI_REG8(0x42),  0x5d },
+	{ CCI_REG8(0x43),  0x08 },
+	{ CCI_REG8(0x44),  0x81 },
+	{ CCI_REG8(0x46),  0x5f },
+	{ CCI_REG8(0x48),  0x18 },
+	{ CCI_REG8(0x49),  0x04 },
+	{ CCI_REG8(0x5c),  0x18 },
+	{ CCI_REG8(0x5e),  0x13 },
+	{ CCI_REG8(0x70),  0x15 },
+	{ CCI_REG8(0x77),  0x35 },
+	{ CCI_REG8(0x79),  0x00 },
+	{ CCI_REG8(0x7b),  0x08 },
+	{ CCI_REG8(0x7d),  0x08 },
+	{ CCI_REG8(0x7e),  0x08 },
+	{ CCI_REG8(0x7f),  0x08 },
+	{ CCI_REG8(0x90),  0x37 },
+	{ CCI_REG8(0x91),  0x05 },
+	{ CCI_REG8(0x92),  0x18 },
+	{ CCI_REG8(0x93),  0x27 },
+	{ CCI_REG8(0x94),  0x05 },
+	{ CCI_REG8(0x95),  0x38 },
+	{ CCI_REG8(0x9b),  0x00 },
+	{ CCI_REG8(0x9c),  0x06 },
+	{ CCI_REG8(0x9d),  0x28 },
+	{ CCI_REG8(0x9e),  0x06 },
+	{ CCI_REG8(0xb2),  0x0f },
+	{ CCI_REG8(0xb3),  0x29 },
+	{ CCI_REG8(0xbf),  0x3c },
+	{ CCI_REG8(0xc2),  0x04 },
+	{ CCI_REG8(0xc4),  0x00 },
+	{ CCI_REG8(0xca),  0x20 },
+	{ CCI_REG8(0xcb),  0x20 },
+	{ CCI_REG8(0xcc),  0x28 },
+	{ CCI_REG8(0xcd),  0x28 },
+	{ CCI_REG8(0xce),  0x20 },
+	{ CCI_REG8(0xcf),  0x20 },
+	{ CCI_REG8(0xd0),  0x2a },
+	{ CCI_REG8(0xd1),  0x2a },
+	{ CCI_REG8(0xfd),  0x0f },
+	{ CCI_REG8(0x00),  0x00 },
+	{ CCI_REG8(0x01),  0xa0 },
+	{ CCI_REG8(0x02),  0x48 },
+	{ CCI_REG8(0x07),  0x8f },
+	{ CCI_REG8(0x08),  0x70 },
+	{ CCI_REG8(0x09),  0x01 },
+	{ CCI_REG8(0x0b),  0x40 },
+	{ CCI_REG8(0x0d),  0x07 },
+	{ CCI_REG8(0x11),  0x33 },
+	{ CCI_REG8(0x12),  0x77 },
+	{ CCI_REG8(0x13),  0x66 },
+	{ CCI_REG8(0x14),  0x65 },
+	{ CCI_REG8(0x15),  0x37 },
+	{ CCI_REG8(0x16),  0xbf },
+	{ CCI_REG8(0x17),  0xff },
+	{ CCI_REG8(0x18),  0xff },
+	{ CCI_REG8(0x19),  0x12 },
+	{ CCI_REG8(0x1a),  0x10 },
+	{ CCI_REG8(0x1c),  0x77 },
+	{ CCI_REG8(0x1d),  0x77 },
+	{ CCI_REG8(0x20),  0x0f },
+	{ CCI_REG8(0x21),  0x0f },
+	{ CCI_REG8(0x22),  0x0f },
+	{ CCI_REG8(0x23),  0x0f },
+	{ CCI_REG8(0x2b),  0x20 },
+	{ CCI_REG8(0x2c),  0x20 },
+	{ CCI_REG8(0x2d),  0x04 },
+	{ CCI_REG8(0xfd),  0x03 },
+	{ CCI_REG8(0x9d),  0x0f },
+	{ CCI_REG8(0x9f),  0x40 },
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0x20),  0x1b },
+	{ CCI_REG8(0xfd),  0x04 },
+	{ CCI_REG8(0x19),  0x60 },
+	{ CCI_REG8(0xfd),  0x02 },
+	{ CCI_REG8(0x75),  0x05 },
+	{ CCI_REG8(0x7f),  0x06 },
+	{ CCI_REG8(0x9a),  0x03 },
+	{ CCI_REG8(0xa2),  0x07 },
+	{ CCI_REG8(0xa3),  0x10 },
+	{ CCI_REG8(0xa5),  0x02 },
+	{ CCI_REG8(0xa6),  0x0b },
+	{ CCI_REG8(0xa7),  0x48 },
+	{ CCI_REG8(0xfd),  0x07 },
+	{ CCI_REG8(0x42),  0x00 },
+	{ CCI_REG8(0x43),  0x80 },
+	{ CCI_REG8(0x44),  0x00 },
+	{ CCI_REG8(0x45),  0x80 },
+	{ CCI_REG8(0x46),  0x00 },
+	{ CCI_REG8(0x47),  0x80 },
+	{ CCI_REG8(0x48),  0x00 },
+	{ CCI_REG8(0x49),  0x80 },
+	{ CCI_REG8(0x00),  0xf7 },
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0xe7),  0x03 },
+	{ CCI_REG8(0xe7),  0x00 },
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0x93),  0x18 },
+	{ CCI_REG8(0x94),  0xff },
+	{ CCI_REG8(0x95),  0xbd },
+	{ CCI_REG8(0x96),  0x1a },
+	{ CCI_REG8(0x98),  0x04 },
+	{ CCI_REG8(0x99),  0x08 },
+	{ CCI_REG8(0x9b),  0x10 },
+	{ CCI_REG8(0x9c),  0x3f },
+	{ CCI_REG8(0xa1),  0x05 },
+	{ CCI_REG8(0xa4),  0x2f },
+	{ CCI_REG8(0xc0),  0x0c },
+	{ CCI_REG8(0xc1),  0x08 },
+	{ CCI_REG8(0xc2),  0x00 },
+	{ CCI_REG8(0xb6),  0x20 },
+	{ CCI_REG8(0xbb),  0x80 },
+	{ CCI_REG8(0xfd),  0x00 },
+	{ CCI_REG8(0xa0),  0x01 },
+	{ CCI_REG8(0xfd),  0x01 },
+};
+
+static const struct cci_reg_sequence mode_OV05C10_stream_on_regs[] = {
+	{ CCI_REG8(0xfd), 0x01 },
+	{ CCI_REG8(0x33), 0x03 },
+	{ CCI_REG8(0x01), 0x02 },
+	{ CCI_REG8(0xfd), 0x00 },
+	{ CCI_REG8(0x20), 0x1f },
+	{ CCI_REG8(0xfd), 0x01 },
+};
+
+static const struct cci_reg_sequence mode_OV05C10_stream_off_regs[] = {
+	{ CCI_REG8(0xfd), 0x00 },
+	{ CCI_REG8(0x20), 0x5b },
+	{ CCI_REG8(0xfd), 0x01 },
+	{ CCI_REG8(0x33), 0x02 },
+	{ CCI_REG8(0x01), 0x02 },
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
+/* Configurations for supported link frequencies */
+#define OV05C10_LINK_FREQ_900MHZ	(900 * HZ_PER_MHZ)
+
+/* Number of lanes supported */
+#define OV05C10_DATA_LANES		2
+
+/* Bits per sample of sensor output */
+#define OV05C10_BITS_PER_SAMPLE		10
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
+static const struct ov05c10_mode supported_mode = {
+	.width = MODE_WIDTH,
+	.height = MODE_HEIGHT,
+	.vts_def = OV05C10_VTS_30FPS,
+	.vts_min = OV05C10_VTS_30FPS,
+	.hts = 640,
+	.lanes = 2,
+	.reg_list = {
+		.num_of_regs = ARRAY_SIZE(ov05c10_2888x1808_regs),
+		.regs = ov05c10_2888x1808_regs,
+	},
+	.link_freq_index = OV05C10_LINK_FREQ_900MHZ_INDEX,
+};
+
+struct ov05c10 {
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
+	/* Current page for sensor register control */
+	int cur_page;
+};
+
+#define to_ov05c10(_sd)	container_of(_sd, struct ov05c10, sd)
+
+static int ov05c10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *frame_fmt;
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_TRY,
+		.format = {
+			.width = MODE_WIDTH,
+			.height = MODE_HEIGHT,
+			.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+			.field = V4L2_FIELD_NONE,
+		}
+	};
+
+	frame_fmt = v4l2_subdev_state_get_format(sd_state, 0);
+	*frame_fmt = fmt.format;
+	return 0;
+}
+
+static int ov05c10_switch_page(struct ov05c10 *ov05c10, u32 page, int *err)
+{
+	int ret = 0;
+
+	if (err && *err)
+		return *err;
+
+	if (page != ov05c10->cur_page) {
+		cci_write(ov05c10->regmap, OV05C10_REG_PAGE_CTL, page, &ret);
+		if (!ret)
+			ov05c10->cur_page = page;
+	}
+
+	if (err)
+		*err = ret;
+
+	return ret;
+}
+
+/* refer to the implementation of cci_read */
+static int ov05c10_reg_read(struct ov05c10 *ov05c10, u32 reg,
+			    u64 *val, int *err)
+{
+	u32 page;
+	u32 addr;
+	int ret = 0;
+
+	if (err && *err)
+		return *err;
+
+	page = OV05C10_GET_PAGE_NUM(reg);
+	addr = OV05C10_GET_REG_ADDR(reg);
+	ov05c10_switch_page(ov05c10, page, &ret);
+	cci_read(ov05c10->regmap, addr, val, &ret);
+	if (err)
+		*err = ret;
+
+	return ret;
+}
+
+/* refer to the implementation of cci_write */
+static int ov05c10_reg_write(struct ov05c10 *ov05c10, u32 reg,
+			     u64 val, int *err)
+{
+	u32 page;
+	u32 addr;
+	int ret = 0;
+
+	if (err && *err)
+		return *err;
+
+	page = OV05C10_GET_PAGE_NUM(reg);
+	addr = OV05C10_GET_REG_ADDR(reg);
+	ov05c10_switch_page(ov05c10, page, &ret);
+	cci_write(ov05c10->regmap, addr, val, &ret);
+	if (err)
+		*err = ret;
+
+	return ret;
+}
+
+static int ov05c10_update_vblank(struct ov05c10 *ov05c10, u32 vblank)
+{
+	const struct ov05c10_mode *mode = &supported_mode;
+	u64 val;
+	int ret = 0;
+
+	val = mode->height + vblank;
+	ov05c10_reg_write(ov05c10, OV05C10_REG_VTS, val, &ret);
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	return ret;
+}
+
+static int ov05c10_update_exposure(struct ov05c10 *ov05c10, u32 exposure)
+{
+	int ret = 0;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_EXPOSURE, exposure, &ret);
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	return ret;
+}
+
+static int ov05c10_update_analog_gain(struct ov05c10 *ov05c10, u32 a_gain)
+{
+	int ret = 0;
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_ANALOG_GAIN, a_gain, &ret);
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	return ret;
+}
+
+static int ov05c10_update_digital_gain(struct ov05c10 *ov05c10, u32 d_gain)
+{
+	u64 val;
+	int ret = 0;
+
+	val = d_gain & OV05C10_DGTL_GAIN_L_MASK;
+	ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_L, val, &ret);
+
+	val = (d_gain & OV05C10_DGTL_GAIN_H_MASK) >> OV05C10_DGTL_GAIN_H_SHIFT;
+	ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_H, val, &ret);
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	return ret;
+}
+
+static int ov05c10_enable_test_pattern(struct ov05c10 *ov05c10, u32 pattern)
+{
+	u64 val;
+	int ret = 0;
+
+	if (pattern) {
+		ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
+				 &val, &ret);
+		ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
+				  val | OV05C10_REG_TEST_PATTERN_XXX, &ret);
+		ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
+		val |= OV05C10_TEST_PATTERN_ENABLE;
+	} else {
+		ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
+		val &= ~OV05C10_TEST_PATTERN_ENABLE;
+	}
+
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN, val, &ret);
+	ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
+			  OV05C_REG_TRIGGER_START, &ret);
+
+	return ret;
+}
+
+static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ov05c10 *ov05c10 = container_of(ctrl->handler,
+					       struct ov05c10, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
+	const struct ov05c10_mode *mode = &supported_mode;
+	s64 max;
+	int ret = 0;
+
+	/* Propagate change of current control to all related controls */
+	if (ctrl->id == V4L2_CID_VBLANK) {
+		s64 cur_exp = ov05c10->exposure->cur.val;
+
+		/* Update max exposure while meeting expected vblanking */
+		max = mode->height + ctrl->val - OV05C10_EXPOSURE_MAX_MARGIN;
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
+	if (!pm_runtime_get_if_in_use(&client->dev))
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
+		dev_err(&client->dev,
+			"ctrl(id:0x%x,val:0x%x) is not handled\n",
+			ctrl->id, ctrl->val);
+		break;
+	}
+
+	pm_runtime_put(&client->dev);
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
+	/* ov05c10 driver currently only supports 1 mode*/
+	if (fse->index != 0)
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
+		return -EINVAL;
+
+	fse->min_width = supported_mode.width;
+	fse->max_width = fse->min_width;
+	fse->min_height = supported_mode.height;
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static void ov05c10_update_pad_format(const struct ov05c10_mode *mode,
+				      struct v4l2_subdev_format *fmt)
+{
+	fmt->format.width = mode->width;
+	fmt->format.height = mode->height;
+	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->format.field = V4L2_FIELD_NONE;
+}
+
+static int ov05c10_set_pad_format(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct v4l2_mbus_framefmt *framefmt;
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	const struct ov05c10_mode *mode;
+	s32 vblank_def;
+	s32 vblank_min;
+	s64 pixel_rate;
+	s64 link_freq;
+	s64 h_blank;
+
+	/* Only one raw bayer(GRBG) order is supported */
+	if (fmt->format.code != MEDIA_BUS_FMT_SGRBG10_1X10)
+		fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
+
+	mode = &supported_mode;
+	ov05c10_update_pad_format(mode, fmt);
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
+		*framefmt = fmt->format;
+	} else {
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
+	}
+
+	return 0;
+}
+
+static int ov05c10_start_streaming(struct ov05c10 *ov05c10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
+	const struct ov05c10_mode *mode = &supported_mode;
+	const struct ov05c10_reg_list *reg_list;
+	int ret = 0;
+
+	/* Apply default values of current mode */
+	reg_list = &mode->reg_list;
+	cci_multi_reg_write(ov05c10->regmap, reg_list->regs,
+			    reg_list->num_of_regs, &ret);
+	if (ret) {
+		dev_err(&client->dev, "fail to set mode, ret: %d\n", ret);
+		return ret;
+	}
+
+	/* Apply customized values from user */
+	ret =  __v4l2_ctrl_handler_setup(ov05c10->sd.ctrl_handler);
+	if (ret) {
+		dev_err(&client->dev, "failed to setup v4l2 handler %d\n", ret);
+		return ret;
+	}
+
+	cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_on_regs,
+			    ARRAY_SIZE(mode_OV05C10_stream_on_regs), &ret);
+	if (ret)
+		dev_err(&client->dev, "fail to start the streaming\n");
+
+	return ret;
+}
+
+static int ov05c10_stop_streaming(struct ov05c10 *ov05c10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
+	int ret = 0;
+
+	cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_off_regs,
+			    ARRAY_SIZE(mode_OV05C10_stream_off_regs), &ret);
+	if (ret)
+		dev_err(&client->dev, "fail to stop the streaming\n");
+
+	return ret;
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
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	int ret = 0;
+
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
+	ov05c10->cur_page = -1;
+
+	ret = ov05c10_start_streaming(ov05c10);
+	if (ret)
+		goto err_rpm_put;
+
+	return 0;
+
+err_rpm_put:
+	pm_runtime_put(&client->dev);
+	return ret;
+}
+
+static int ov05c10_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+
+	ov05c10_stop_streaming(ov05c10);
+	pm_runtime_put(&client->dev);
+
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
+static int ov05c10_init_controls(struct ov05c10 *ov05c10)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
+	const struct ov05c10_mode *mode = &supported_mode;
+	struct v4l2_fwnode_device_properties props;
+	struct v4l2_ctrl_handler *ctrl_hdlr;
+	s64 pixel_rate_max;
+	s64 exposure_max;
+	s64 vblank_def;
+	s64 vblank_min;
+	u32 max_items;
+	s64 hblank;
+	int ret;
+
+	ret = v4l2_ctrl_handler_init(&ov05c10->ctrl_handler, 10);
+	if (ret)
+		return ret;
+
+	ctrl_hdlr = &ov05c10->ctrl_handler;
+
+	max_items = ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
+	ov05c10->link_freq =
+		v4l2_ctrl_new_int_menu(ctrl_hdlr,
+				       NULL,
+				       V4L2_CID_LINK_FREQ,
+				       max_items,
+				       0,
+				       ov05c10_link_freq_menu_items);
+	if (ov05c10->link_freq)
+		ov05c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	pixel_rate_max =
+		link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
+					supported_mode.lanes);
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
+	hblank = (mode->hts > mode->width) ? (mode->hts - mode->width) : 0;
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
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		dev_err(&client->dev, "V4L2 control init failed (%d)\n", ret);
+		goto err_hdl_free;
+	}
+
+	ret = v4l2_fwnode_device_parse(&client->dev, &props);
+	if (ret)
+		goto err_hdl_free;
+
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_ops,
+					      &props);
+	if (ret)
+		goto err_hdl_free;
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
+static int ov05c10_parse_endpoint(struct device *dev,
+				  struct fwnode_handle *fwnode)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY
+	};
+	struct fwnode_handle *ep;
+	unsigned long bitmap;
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
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != supported_mode.lanes) {
+		dev_err(dev,
+			"number of CSI2 data lanes %d is not supported\n",
+			bus_cfg.bus.mipi_csi2.num_data_lanes);
+		ret = -EINVAL;
+		goto err_endpoint_free;
+	}
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       ov05c10_link_frequencies,
+				       ARRAY_SIZE(ov05c10_link_frequencies),
+				       &bitmap);
+	if (ret)
+		dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", ret);
+err_endpoint_free:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+
+	return ret;
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
+	struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
+
+	ret = fwnode_property_read_u32(fwnode, "clock-frequency", &clkfreq);
+	if (ret)
+		return  dev_err_probe(&client->dev, -EINVAL,
+				      "fail to get clock freq\n");
+	if (clkfreq != OV05C10_REF_CLK)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "fail invalid clock freq %u, %lu expected\n",
+				     clkfreq, OV05C10_REF_CLK);
+
+	ret = ov05c10_parse_endpoint(&client->dev, fwnode);
+	if (ret)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "fail to parse endpoint\n");
+
+	ov05c10->enable_gpio = devm_gpiod_get(&client->dev, "enable",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(ov05c10->enable_gpio))
+		return dev_err_probe(&client->dev,
+				     PTR_ERR(ov05c10->enable_gpio),
+				     "fail to get enable gpio\n");
+
+	v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
+
+	ov05c10->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(ov05c10->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(ov05c10->regmap),
+				     "fail to init cci\n");
+
+	ov05c10->cur_page = -1;
+
+	ret = ov05c10_init_controls(ov05c10);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "fail to init ctl\n");
+
+	ov05c10->sd.internal_ops = &ov05c10_internal_ops;
+	ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	ov05c10->sd.entity.ops = &ov05c10_subdev_entity_ops;
+	ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&ov05c10->sd.entity, NUM_OF_PADS,
+				     &ov05c10->pad);
+	if (ret)
+		goto err_hdl_free;
+
+	ret = v4l2_subdev_init_finalize(&ov05c10->sd);
+	if (ret < 0)
+		goto err_media_entity_cleanup;
+
+	ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
+	if (ret)
+		goto err_media_entity_cleanup;
+
+	pm_runtime_set_active(&client->dev);
+	pm_runtime_enable(&client->dev);
+	pm_runtime_idle(&client->dev);
+	pm_runtime_set_autosuspend_delay(&client->dev, 1000);
+	pm_runtime_use_autosuspend(&client->dev);
+	return 0;
+
+err_media_entity_cleanup:
+	media_entity_cleanup(&ov05c10->sd.entity);
+
+err_hdl_free:
+	v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
+
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
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static int ov05c10_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+
+	ov05c10_sensor_power_set(ov05c10, true);
+	return 0;
+}
+
+static int ov05c10_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+
+	ov05c10_sensor_power_set(ov05c10, false);
+	return 0;
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
+MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


