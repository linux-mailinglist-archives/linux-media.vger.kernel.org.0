Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2A62B88A8
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 00:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgKRXsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 18:48:38 -0500
Received: from mail-dm6nam08on2086.outbound.protection.outlook.com ([40.107.102.86]:19168
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727307AbgKRXsg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 18:48:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bKAReIRIL6EElfPKSh+rRkBxMmrvD287o6WWcaJ58jsKadjYT4pRynXHZZypOkqDE64VJyQG6bYd5gi02hsjsG8jJP9YhVPc+mEXJ+whpeFJ8ZmSPDawI5NUaISxIGrCQOZE5R1mgv2elf5GNRTZt5LdJYs4SQ9AC+7qQ4QBs6w8S1YTFBIiHScmNsDqH4g4ZIb++g1CdpzB+tDFLhZrGgvaPfibbWgfPSq0R0jAr5Z9VrRPucjv2UvjpFNXHEOBsAul2DCf03ESzwxQLpykmLApw9c3+dPScwp4bjfZFJFHzsksILT6gig7kkM8nu9zTVjgxdH6G8ANK98m4CqgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7c9L0z3gGiBG4ChGRNtqcgLpx8C+7e5/1Sr2r46GfQ=;
 b=SmGCmexFglZMsFcsdTQi/hKnk4poPZ4TuVxHCPXr8k8Vu40im50x8rBtxEHxGA6+u93tkNYvFZnLbSAVNczsGP2EkKtEzpX4ve5SWT+oAYs0ncG34lHcRPfufy+Q/PWLNsbxuOvmsdEI45nHjjn/FqEIq43Qjg6JjmRX7BK0cc79HGGgHEnTpcLDf1bSYCljbPNVybKHEwgKY7Bj/FNRWWkdDU/1JS9QGgfgACfUn9TfRlec+WA/NIMLeK5mxXDIc3x8/zMJ5LnUbrEqk/TnK50vzoSeh7vyvVP3otbDvs2ft49uLJySOz+iFlOTJdZtDjXl1E5Ty2J3G0zMPxBN1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7c9L0z3gGiBG4ChGRNtqcgLpx8C+7e5/1Sr2r46GfQ=;
 b=W6bVUXcN7BSKoo7GzZG55KLOYZx/TACqe6c39lM+vvanFtA6h7DaWM/vmN/pMO0NGFOan/H7NWJJcPvB1msHntk8VxCiixXwLIiWBR+N8CAng6eGkz53wPl6guidXGVF3klqHA6tIzSP3zhBogG8DSAf7oEOy8zUV/yCbAUI6nQ=
Received: from DM6PR12CA0022.namprd12.prod.outlook.com (2603:10b6:5:1c0::35)
 by SN6PR02MB4767.namprd02.prod.outlook.com (2603:10b6:805:9f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 23:48:26 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::39) by DM6PR12CA0022.outlook.office365.com
 (2603:10b6:5:1c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com,
 derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com,
 manish.narani@xilinx.com,
 ravi.patel@xilinx.com,
 nishad.saraf@xilinx.com,
 wendy.liang@xilinx.com,
 robh+dt@kernel.org,
 arnd@arndb.de,
 gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org,
 christian.koenig@amd.com,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Received: from [172.19.2.167] (port=36324 helo=xsjjliang50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <wendy.liang@xilinx.com>)
        id 1kfXBL-0000Wz-EU; Wed, 18 Nov 2020 15:48:11 -0800
From:   Wendy Liang <wendy.liang@xilinx.com>
To:     <robh+dt@kernel.org>, <michal.simek@xilinx.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <sumit.semwal@linaro.org>,
        <christian.koenig@amd.com>, <derek.kiernan@xilinx.com>,
        <dragan.cvetic@xilinx.com>, <rajan.vaja@xilinx.com>,
        <tejas.patel@xilinx.com>, <manish.narani@xilinx.com>,
        <ravi.patel@xilinx.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        Nishad Saraf <nishad.saraf@xilinx.com>,
        Wendy Liang <wendy.liang@xilinx.com>
Subject: [PATCH v2 9/9] misc: xilinx-ai-engine: Add support for servicing error interrupts
Date:   Wed, 18 Nov 2020 15:48:09 -0800
Message-ID: <1605743289-26575-10-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23fcfe82-a371-4128-9711-08d88c1c7175
X-MS-TrafficTypeDiagnostic: SN6PR02MB4767:
X-Microsoft-Antispam-PRVS: <SN6PR02MB4767A6736B9CC03A3E1E9CE3B0E10@SN6PR02MB4767.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5wPNoZNdWKj/77OeKYOnSIqBpHDT0IFXmLtQajjdba2USu2RHh7bqPKqoW0nqToS3nwkBl1JLWE9k20NVrX4YnOuq7igqGOnKQT9FmdsXG1WWdur+Ig2boKtBFAzr+5iMbQSYgKWF7XCSNWTxa2XaCJUpT9jty86sEMpwK5Ix84cw2hZo4CL0cofiROc27qGDLKiEH4DwKrdv4xBMSDXgs6XMkxUv4+Hly1j5W4c96kVSBdpPsTwQqxnlBlBLWsP7kH24U0HQoGiQnEEU0cBuZWvtDnAhkLyOfybHQ8+db8oYVsR6iMnTQdphrct/KM2PYwoGCMejPr8Ras6H036WpuJnin5pif4D4eSoK9qgcqNEdpcfoyrspnGq5SA7gC+MfKlmA6PcIbES7BFSO48MOM1dFRObGJy7LPOtlyz1hi1attdMXr8jKgokEe84J70luQuaNYIMssB80HNcddm3sl2xIiW0fI2TYoQGf5EIJ896GDaISs+upAc7R6cm+Y
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(46966005)(316002)(70206006)(82740400003)(44832011)(8936002)(2616005)(36906005)(2906002)(70586007)(426003)(921005)(47076004)(336012)(7636003)(7416002)(356005)(30864003)(82310400003)(83380400001)(186003)(36756003)(7696005)(9786002)(54906003)(478600001)(107886003)(110136005)(6636002)(4326008)(26005)(8676002)(5660300002)(102446001)(579004)(414714003)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:26.2800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fcfe82-a371-4128-9711-08d88c1c7175
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4767
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Nishad Saraf <nishad.saraf@xilinx.com>

AI engine errors events can be routed to generate interrupt. The
errors events routing will be done during AI engine configuration.
At runtime, Linux kernel AI engine driver monitors the interrupt and
backtracks errors events.
As error events from 400 AIE tiles and 50 shim tiles are channeled on
a single interrupt line, backtracking the source the interrupt to an
AIE module is required. To keep the top-half interrupt short,
backtracking is deferred to bottom half by scheduling a task in shared
workqueue.

Signed-off-by: Nishad Saraf <nishad.saraf@xilinx.com>
Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 121 ++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      |  14 +
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h | 144 +++++
 .../misc/xilinx-ai-engine/ai-engine-interrupt.c    | 659 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  44 ++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      |  54 ++
 7 files changed, 1037 insertions(+)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 2e67b25..9607ecb 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -9,6 +9,7 @@ xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
 				   ai-engine-clock.o \
 				   ai-engine-dev.o \
 				   ai-engine-dma.o \
+				   ai-engine-interrupt.o \
 				   ai-engine-mem.o \
 				   ai-engine-part.o \
 				   ai-engine-res.o \
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index ff721b3..af0f997 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -33,7 +33,10 @@
 #define AIE_SHIMPL_CLKCNTR_REGOFF		0x00036040U
 #define AIE_SHIMPL_COLRESET_REGOFF		0x00036048U
 #define AIE_SHIMPL_RESET_REGOFF			0x0003604cU
+#define AIE_SHIMPL_GROUP_ERROR_REGOFF		0x0003450cU
 #define AIE_TILE_CORE_CLKCNTR_REGOFF		0x00036040U
+#define AIE_TILE_CORE_GROUP_ERROR_REGOFF	0x00034510U
+#define AIE_TILE_MEM_GROUP_ERROR_REGOFF		0x00014514U
 
 /*
  * Register masks
@@ -93,11 +96,27 @@ static const struct aie_tile_regs aie_kernel_regs[] = {
 	 .soff = AIE_SHIMPL_CLKCNTR_REGOFF,
 	 .eoff = AIE_SHIMPL_CLKCNTR_REGOFF,
 	},
+	/* SHIM group error enable */
+	{.attribute = (AIE_TILE_TYPE_SHIMPL | AIE_TILE_TYPE_SHIMNOC) <<
+		      AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	 .soff = AIE_SHIMPL_GROUP_ERROR_REGOFF,
+	 .eoff = AIE_SHIMPL_GROUP_ERROR_REGOFF,
+	},
 	/* Tile clock control */
 	{.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
 	 .soff = AIE_TILE_CORE_CLKCNTR_REGOFF,
 	 .eoff = AIE_TILE_CORE_CLKCNTR_REGOFF,
 	},
+	/* Tile group error for core module */
+	{.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	 .soff = AIE_TILE_CORE_GROUP_ERROR_REGOFF,
+	 .eoff = AIE_TILE_CORE_GROUP_ERROR_REGOFF,
+	},
+	/* Tile group error for memory module */
+	{.attribute = AIE_TILE_TYPE_TILE << AIE_REGS_ATTR_TILE_TYPE_SHIFT,
+	 .soff = AIE_TILE_MEM_GROUP_ERROR_REGOFF,
+	 .eoff = AIE_TILE_MEM_GROUP_ERROR_REGOFF,
+	},
 };
 
 static const struct aie_single_reg_field aie_col_rst = {
@@ -128,6 +147,103 @@ static const struct aie_dma_attr aie_shimdma = {
 	.bd_len = 0x14U,
 };
 
+static const struct aie_event_attr aie_pl_event = {
+	.bc_event = {
+		.mask = GENMASK(6, 0),
+		.regoff = 0x0U,
+	},
+	.group_error = {
+		.mask = GENMASK(10, 0),
+		.regoff = 0xcU,
+	},
+	.bc_regoff = 0x34010U,
+	.status_regoff = 0x34200U,
+	.group_regoff = 0x34500U,
+	.base_error_event = 62U,
+	.num_broadcasts = 16U,
+	.base_bc_event = 107U,
+	.num_events = 128U,
+};
+
+static const struct aie_event_attr aie_mem_event = {
+	.bc_event = {
+		.mask = GENMASK(6, 0),
+		.regoff = 0x0U,
+	},
+	.group_error = {
+		.mask = GENMASK(13, 0),
+		.regoff = 0x14U,
+	},
+	.bc_regoff = 0x14010U,
+	.status_regoff = 0x14200U,
+	.group_regoff = 0x14500U,
+	.base_error_event = 87U,
+	.num_broadcasts = 16U,
+	.base_bc_event = 107U,
+	.num_events = 128U,
+};
+
+static const struct aie_event_attr aie_core_event = {
+	.bc_event = {
+		.mask = GENMASK(6, 0),
+		.regoff = 0x0U,
+	},
+	.group_error = {
+		.mask = GENMASK(21, 0),
+		.regoff = 0x10U,
+	},
+	.bc_regoff = 0x34010U,
+	.status_regoff = 0x34200U,
+	.group_regoff = 0x34500U,
+	.base_error_event = 48U,
+	.num_broadcasts = 16U,
+	.base_bc_event = 107U,
+	.num_events = 128U,
+};
+
+static const struct aie_l1_intr_ctrl_attr aie_l1_intr_ctrl = {
+	.swa_status = {
+		.mask = GENMASK(19, 0),
+		.regoff = 0xcU,
+	},
+	.swb_status = {
+		.mask = GENMASK(19, 0),
+		.regoff = 0x3cU,
+	},
+	.swa_event = {
+		.mask = GENMASK(6, 0),
+		.regoff = 0x14U,
+	},
+	.swb_event = {
+		.mask = GENMASK(6, 0),
+		.regoff = 0x44U,
+	},
+	.regoff = 0x35000U,
+	.event_lsb = 8,
+	.num_broadcasts = 0x14U,
+};
+
+static const struct aie_l2_intr_ctrl_attr aie_l2_intr_ctrl = {
+	.mask = {
+		.mask = GENMASK(15, 0),
+		.regoff = 0x0U,
+	},
+	.enable = {
+		.mask = GENMASK(15, 0),
+		.regoff = 0x4U,
+	},
+	.disable = {
+		.mask = GENMASK(15, 0),
+		.regoff = 0x8U,
+	},
+	.status = {
+		.mask = GENMASK(15, 0),
+		.regoff = 0xcU,
+	},
+	.regoff = 0x15000U,
+	.num_broadcasts = 0x10U,
+};
+
 static u32 aie_get_tile_type(struct aie_location *loc)
 {
 	if (loc->row)
@@ -476,6 +592,11 @@ int aie_device_init(struct aie_device *adev)
 	adev->col_rst = &aie_col_rst;
 	adev->col_clkbuf = &aie_col_clkbuf;
 	adev->shim_dma = &aie_shimdma;
+	adev->pl_events = &aie_pl_event;
+	adev->mem_events = &aie_mem_event;
+	adev->core_events = &aie_core_event;
+	adev->l1_ctrl = &aie_l1_intr_ctrl;
+	adev->l2_ctrl = &aie_l2_intr_ctrl;
 
 	/* Get the columns resource */
 	/* Get number of columns from AI engine memory resource */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 78eae90..13abeca 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -14,6 +14,7 @@
 #include <linux/firmware/xlnx-zynqmp.h>
 #include <linux/fs.h>
 #include <linux/idr.h>
+#include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -402,6 +403,19 @@ static int xilinx_ai_engine_probe(struct platform_device *pdev)
 	of_xilinx_ai_engine_part_probe(adev);
 	dev_info(&pdev->dev, "Xilinx AI Engine device(cols=%u) probed\n",
 		 adev->cols_res.total);
+
+	INIT_WORK(&adev->backtrack, aie_array_backtrack);
+
+	adev->irq = platform_get_irq_byname(pdev, "interrupt1");
+	if (adev->irq < 0)
+		goto free_ida;
+
+	ret = devm_request_threaded_irq(dev, adev->irq, NULL, aie_interrupt,
+					IRQF_ONESHOT, dev_name(dev), adev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to request AIE IRQ.\n");
+		goto free_ida;
+	}
 	return 0;
 
 free_ida:
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index b21b7025..3b680f7 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -15,6 +15,7 @@
 #include <linux/dma-buf.h>
 #include <linux/file.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
@@ -45,6 +46,55 @@
 #define VERSAL_ES1_REV_ID		0x0
 #define VERSAL_ES2_REV_ID		0x1
 
+#define AIE_NPI_ERROR_ID		BIT(1)
+
+/* Macros relevant to interrupts */
+#define AIE_INTR_L2_CTRL_MASK_WIDTH	32
+
+/**
+ * enum aie_module_type - identifies different hardware modules within a
+ *			  tile type. AIE tile may have memory and core
+ *			  module. While a PL or shim tile may have PL module.
+ * @AIE_MEM_MOD: comprises of the following sub-modules,
+ *			* data memory.
+ *			* tile DMA.
+ *			* lock module.
+ *			* events, event broadcast and event actions.
+ *			* tracing and profiling.
+ * @AIE_CORE_MOD: comprises of the following sub-modules,
+ *			* AIE core.
+ *			* program Memory.
+ *			* events, event broadcast and event actions.
+ *			* tracing and profiling.
+ *			* AXI-MM and AXI-S tile interconnects.
+ * @AIE_PL_MOD: comprises of the following sub-modules,
+ *			* PL interface.
+ *			* AXI-MM and AXI-S tile interconnects.
+ *			* Level 1 interrupt controllers.
+ *			* events, event broadcast and event actions.
+ *			* tracing and profiling.
+ * @AIE_NOC_MOD: comprises of the following sub-modules,
+ *			* interface from NoC Slave Unit (NSU)
+ *			  (bridge to AXI-MM switch)
+ *			* interfaces to NoC NoC Master Unit (NMU)
+ *				* shim DMA & locks
+ *				* NoC stream interface
+ */
+enum aie_module_type {
+	AIE_MEM_MOD,
+	AIE_CORE_MOD,
+	AIE_PL_MOD,
+	AIE_NOC_MOD,
+};
+
+/*
+ * enum aie_shim_switch_type - identifies different switches in shim tile.
+ */
+enum aie_shim_switch_type {
+	AIE_SHIM_SWITCH_A,
+	AIE_SHIM_SWITCH_B
+};
+
 /**
  * struct aie_tile_regs - contiguous range of AI engine register
  *			  within an AI engine tile
@@ -157,6 +207,75 @@ struct aie_resource {
 };
 
 /**
+ * struct aie_event_attr - AI Engine event attributes structure.
+ * @bc_event: broadcast event attribute to capture event mask value and
+ *	      register offset from @bc_regoff.
+ * @group_error: group error attribute to capture error group mask value and
+ *		 register offset value from @group_regoff.
+ * @bc_regoff: base broadcast register offset.
+ * @status_regoff: base status register offset.
+ * @group_regoff: base group error register offset.
+ * @base_error_event: event ID of first error event in a group error.
+ * @num_broadcasts: total number of broadcast events.
+ * @base_bc_event: broadcast 0 vent ID
+ * @num_events: total number of events.
+ */
+struct aie_event_attr {
+	struct aie_single_reg_field bc_event;
+	struct aie_single_reg_field group_error;
+	u32 bc_regoff;
+	u32 status_regoff;
+	u32 group_regoff;
+	u32 base_error_event;
+	u32 num_broadcasts;
+	u32 base_bc_event;
+	u32 num_events;
+};
+
+/**
+ * struct aie_l1_intr_ctrl_attr - AI engine level 1 interrupt controller
+ *				  attributes structure.
+ * @mask: level 1 interrupt controller mask attribute.
+ * @swa_status: switch A level 1 interrupt controller status attribute.
+ * @swb_status: switch A level 1 interrupt controller status attribute.
+ * @swa_event: switch A level 1 interrupt controller event attribute.
+ * @swb_event: switch A level 1 interrupt controller event attribute.
+ * @regoff: base level 1 interrupt controller register offset.
+ * @event_lsb: lsb of IRQ event within IRQ event switch register.
+ * @num_broadcasts: total number of broadcast signals to level 1 interrupt
+ *		    controller.
+ */
+struct aie_l1_intr_ctrl_attr {
+	struct aie_single_reg_field swa_status;
+	struct aie_single_reg_field swb_status;
+	struct aie_single_reg_field swa_event;
+	struct aie_single_reg_field swb_event;
+	u32 regoff;
+	u32 event_lsb;
+	u32 num_broadcasts;
+};
+
+/**
+ * struct aie_l2_intr_ctrl_attr - AI engine level 2 interrupt controller
+ *				  attributes structure.
+ * @mask: level 2 interrupt controller mask attribute.
+ * @enable: level 2 interrupt controller enable attribute.
+ * @disable: level 2 interrupt controller disable attribute.
+ * @status: level 2 interrupt controller status attribute.
+ * @regoff: level 2 interrupt controller register offset.
+ * @num_broadcasts: total number of broadcast signals to level 2 interrupt
+ *		    controller.
+ */
+struct aie_l2_intr_ctrl_attr {
+	struct aie_single_reg_field mask;
+	struct aie_single_reg_field enable;
+	struct aie_single_reg_field disable;
+	struct aie_single_reg_field status;
+	u32 regoff;
+	u32 num_broadcasts;
+};
+
+/**
  * struct aie_device - AI engine device structure
  * @partitions: list of partitions requested
  * @cdev: cdev for the AI engine
@@ -169,6 +288,11 @@ struct aie_resource {
  * @col_rst: column reset attribute
  * @col_clkbuf: column clock buffer attribute
  * @shim_dma: SHIM DMA attribute
+ * @pl_events: pl module event attribute
+ * @mem_events: memory module event attribute
+ * @core_events: core module event attribute
+ * @l1_ctrl: level 1 interrupt controller attribute
+ * @l2_ctrl: level 2 interrupt controller attribute
  * @size: size of the AI engine address space
  * @array_shift: array address shift
  * @col_shift: column address shift
@@ -176,6 +300,8 @@ struct aie_resource {
  * @cols_res: AI engine columns resources to indicate
  *	      while columns are occupied by partitions.
  * @num_kernel_regs: number of kernel only registers range
+ * @irq: Linux IRQ number
+ * @backtrack: workqueue to backtrack interrupt
  * @version: AI engine device version
  * @pm_node_id: AI Engine platform management node ID
  */
@@ -191,12 +317,19 @@ struct aie_device {
 	const struct aie_single_reg_field *col_rst;
 	const struct aie_single_reg_field *col_clkbuf;
 	const struct aie_dma_attr *shim_dma;
+	const struct aie_event_attr *pl_events;
+	const struct aie_event_attr *mem_events;
+	const struct aie_event_attr *core_events;
+	const struct aie_l1_intr_ctrl_attr *l1_ctrl;
+	const struct aie_l2_intr_ctrl_attr *l2_ctrl;
 	size_t size;
 	struct aie_resource cols_res;
 	u32 array_shift;
 	u32 col_shift;
 	u32 row_shift;
 	u32 num_kernel_regs;
+	int irq;
+	struct work_struct backtrack;
 	int version;
 	u32 pm_node_id;
 };
@@ -212,6 +345,7 @@ struct aie_device {
  * @dev: device for the AI engine partition
  * @cores_clk_state: bitmap to indicate the power state of core modules
  * @tiles_inuse: bitmap to indicate if a tile is in use
+ * @l2_mask: level 2 interrupt controller mask bitmap
  * @partition_id: partition id. Partition ID is the identifier
  *		  of the AI engine partition in the system.
  * @status: indicate if the partition is in use
@@ -228,6 +362,7 @@ struct aie_partition {
 	struct device dev;
 	struct aie_resource cores_clk_state;
 	struct aie_resource tiles_inuse;
+	struct aie_resource l2_mask;
 	u32 partition_id;
 	u32 status;
 	u32 cntrflag;
@@ -339,7 +474,12 @@ int aie_resource_get_region(struct aie_resource *res, u32 start,
 void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
 int aie_resource_set(struct aie_resource *res, u32 start, u32 count);
 int aie_resource_clear(struct aie_resource *res, u32 start, u32 count);
+int aie_resource_clear_all(struct aie_resource *res);
 bool aie_resource_testbit(struct aie_resource *res, u32 bit);
+int aie_resource_cpy_from_arr32(struct aie_resource *res, u32 start,
+				const u32 *src, u32 nbits);
+int aie_resource_cpy_to_arr32(struct aie_resource *res, u32 start, u32 *dst,
+			      u32 nbits);
 
 const struct file_operations *aie_part_get_fops(void);
 u8 aie_part_in_use(struct aie_partition *apart);
@@ -372,4 +512,8 @@ int aie_part_release_tiles_from_user(struct aie_partition *apart,
 				     void __user *user_args);
 
 int aie_device_init(struct aie_device *adev);
+
+void aie_array_backtrack(struct work_struct *work);
+irqreturn_t aie_interrupt(int irq, void *data);
+
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c b/drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
new file mode 100644
index 0000000..1726291
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-interrupt.c
@@ -0,0 +1,659 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device driver
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+#include <linux/bitmap.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+#include "ai-engine-internal.h"
+#include "linux/xlnx-ai-engine.h"
+
+#define AIE_ARRAY_TILE_ERROR_BC_ID		0U
+#define AIE_SHIM_TILE_ERROR_IRQ_ID		16U
+
+/**
+ * aie_get_broadcast_event() - get event ID being broadcast on given
+ *			       broadcast line.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @bc_id: broadcast ID.
+ * @return: event ID.
+ */
+static u8 aie_get_broadcast_event(struct aie_partition *apart,
+				  struct aie_location *loc,
+				  enum aie_module_type module, u8 bc_id)
+{
+	const struct aie_event_attr *event_mod;
+	u32 bcoff, regoff;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	bcoff = event_mod->bc_regoff + event_mod->bc_event.regoff + bc_id * 4U;
+	regoff = aie_cal_regoff(apart->adev, *loc, bcoff);
+	return ioread32(apart->adev->base + regoff);
+}
+
+/**
+ * aie_read_event_status() - get the status of event status registers.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @reg: array to store event status register values.
+ */
+static void aie_read_event_status(struct aie_partition *apart,
+				  struct aie_location *loc,
+				  enum aie_module_type module, u32 *reg)
+{
+	const struct aie_event_attr *event_mod;
+	u8 offset;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	for (offset = 0; offset < (event_mod->num_events / 32); offset++) {
+		u32 status_off = event_mod->status_regoff + offset * 4U;
+		u32 regoff = aie_cal_regoff(apart->adev, *loc, status_off);
+
+		reg[offset] = ioread32(apart->adev->base + regoff);
+	}
+}
+
+/**
+ * aie_check_group_errors_enabled() - get error events enabled in group error.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @return: bitmap of enabled error events.
+ */
+static u32 aie_check_group_errors_enabled(struct aie_partition *apart,
+					  struct aie_location *loc,
+					  enum aie_module_type module)
+{
+	const struct aie_event_attr *event_mod;
+	u32 groff, regoff;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	groff = event_mod->group_regoff + event_mod->group_error.regoff;
+	regoff = aie_cal_regoff(apart->adev, *loc, groff);
+	return ioread32(apart->adev->base + regoff);
+}
+
+/**
+ * aie_set_error_event() - enable/disable error events in group error.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @bitmap: error event to enable/disable in group errors.
+ */
+static void aie_set_error_event(struct aie_partition *apart,
+				struct aie_location *loc,
+				enum aie_module_type module, u32 bitmap)
+{
+	const struct aie_event_attr *event_mod;
+	u32 groff, regoff;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	groff = event_mod->group_regoff + event_mod->group_error.regoff;
+	regoff = aie_cal_regoff(apart->adev, *loc, groff);
+	iowrite32(bitmap, apart->adev->base + regoff);
+}
+
+/**
+ * aie_get_error_event() - map group error status bit to actual error
+ *			   event number.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @index: event index within group errors.
+ * @return: true event ID.
+ */
+static u32 aie_get_error_event(struct aie_partition *apart,
+			       struct aie_location *loc,
+			       enum aie_module_type module, u8 index)
+{
+	const struct aie_event_attr *event_mod;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	return event_mod->base_error_event + index;
+}
+
+/**
+ * aie_get_bc_event() - get the broadcast event ID.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @module: module type.
+ * @bc_id: broadcast line ID.
+ * @return: broadcast event ID.
+ */
+static u32 aie_get_bc_event(struct aie_partition *apart,
+			    struct aie_location *loc,
+			    enum aie_module_type module, u8 bc_id)
+{
+	const struct aie_event_attr *event_mod;
+
+	if (module == AIE_CORE_MOD)
+		event_mod = apart->adev->core_events;
+	else if (module == AIE_MEM_MOD)
+		event_mod = apart->adev->mem_events;
+	else
+		event_mod = apart->adev->pl_events;
+
+	return event_mod->base_bc_event + bc_id;
+}
+
+/**
+ * aie_get_l1_event() - get event ID being broadcast on level 1 IRQ.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @sw: switch type.
+ * @irq_id: IRQ event ID to be read.
+ * @return: true event ID.
+ */
+static u8 aie_get_l1_event(struct aie_partition *apart,
+			   struct aie_location *loc,
+			   enum aie_shim_switch_type sw, u8 irq_id)
+{
+	const struct aie_l1_intr_ctrl_attr *intr_ctrl = apart->adev->l1_ctrl;
+	u32 l1off, l1mask, regoff, reg_value;
+
+	if (sw == AIE_SHIM_SWITCH_A) {
+		l1off = intr_ctrl->regoff + intr_ctrl->swa_event.regoff;
+		l1mask = intr_ctrl->swa_event.mask;
+	} else {
+		l1off = intr_ctrl->regoff + intr_ctrl->swb_event.regoff;
+		l1mask = intr_ctrl->swb_event.mask;
+	}
+
+	regoff = aie_cal_regoff(apart->adev, *loc, l1off);
+	reg_value = ioread32(apart->adev->base + regoff);
+	reg_value &= l1mask << (irq_id * intr_ctrl->event_lsb);
+	reg_value >>= (irq_id * intr_ctrl->event_lsb);
+	return reg_value;
+}
+
+/**
+ * aie_clear_l1_intr() - clear level 1 interrupt controller status.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @sw: switch type.
+ * @irq_id: IRQ ID to be cleared.
+ */
+static void aie_clear_l1_intr(struct aie_partition *apart,
+			      struct aie_location *loc,
+			      enum aie_shim_switch_type sw, u8 irq_id)
+{
+	const struct aie_l1_intr_ctrl_attr *intr_ctrl = apart->adev->l1_ctrl;
+	u32 l1off, regoff;
+
+	if (sw == AIE_SHIM_SWITCH_A)
+		l1off = intr_ctrl->regoff + intr_ctrl->swa_status.regoff;
+	else
+		l1off = intr_ctrl->regoff + intr_ctrl->swb_status.regoff;
+
+	regoff = aie_cal_regoff(apart->adev, *loc, l1off);
+	iowrite32(BIT(irq_id), apart->adev->base + regoff);
+}
+
+/**
+ * aie_get_l1_status() - get level 1 interrupt controller status value.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @sw: switch type.
+ * @return: status value.
+ */
+static u32 aie_get_l1_status(struct aie_partition *apart,
+			     struct aie_location *loc,
+			     enum aie_shim_switch_type sw)
+{
+	const struct aie_l1_intr_ctrl_attr *intr_ctrl = apart->adev->l1_ctrl;
+	u32 l1off, regoff;
+
+	if (sw == AIE_SHIM_SWITCH_A)
+		l1off = intr_ctrl->regoff + intr_ctrl->swa_status.regoff;
+	else
+		l1off = intr_ctrl->regoff + intr_ctrl->swb_status.regoff;
+
+	regoff = aie_cal_regoff(apart->adev, *loc, l1off);
+	return ioread32(apart->adev->base + regoff);
+}
+
+/**
+ * aie_clear_l2_intr() - clear level 2 interrupt controller status.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @bitmap_irq: IRQ bitmap. IRQ lines corresponding to set bits will be
+ *		cleared.
+ */
+static void aie_clear_l2_intr(struct aie_partition *apart,
+			      struct aie_location *loc, u32 bitmap_irq)
+{
+	const struct aie_l2_intr_ctrl_attr *intr_ctrl = apart->adev->l2_ctrl;
+	u32 l2off = intr_ctrl->regoff + intr_ctrl->status.regoff;
+	u32 regoff = aie_cal_regoff(apart->adev, *loc, l2off);
+
+	iowrite32(bitmap_irq, apart->adev->base + regoff);
+}
+
+/**
+ * aie_get_l2_status() - get level 2 interrupt controller status value.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @return: status value.
+ */
+static u32 aie_get_l2_status(struct aie_partition *apart,
+			     struct aie_location *loc)
+{
+	const struct aie_l2_intr_ctrl_attr *intr_ctrl = apart->adev->l2_ctrl;
+	u32 l2off = intr_ctrl->regoff + intr_ctrl->status.regoff;
+	u32 regoff = aie_cal_regoff(apart->adev, *loc, l2off);
+
+	return ioread32(apart->adev->base + regoff);
+}
+
+/**
+ * aie_get_l2_mask() - get level 2 interrupt controller mask value.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @return: mask value.
+ */
+static u32 aie_get_l2_mask(struct aie_partition *apart,
+			   struct aie_location *loc)
+{
+	const struct aie_l2_intr_ctrl_attr *intr_ctrl = apart->adev->l2_ctrl;
+	u32 l2off = intr_ctrl->regoff + intr_ctrl->mask.regoff;
+	u32 regoff = aie_cal_regoff(apart->adev, *loc, l2off);
+
+	return ioread32(apart->adev->base + regoff);
+}
+
+/**
+ * aie_enable_l2_ctrl() - enable interrupts to level 2 interrupt controller.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @bit_map: bitmap of broadcast lines to enable.
+ */
+static void aie_enable_l2_ctrl(struct aie_partition *apart,
+			       struct aie_location *loc, u32 bit_map)
+{
+	const struct aie_l2_intr_ctrl_attr *intr_ctrl = apart->adev->l2_ctrl;
+	u32 l2off = intr_ctrl->regoff + intr_ctrl->enable.regoff;
+	u32 regoff = aie_cal_regoff(apart->adev, *loc, l2off);
+
+	bit_map &= intr_ctrl->enable.mask;
+	iowrite32(bit_map, apart->adev->base + regoff);
+}
+
+/**
+ * aie_disable_l2_ctrl() - disable interrupts to level 2 interrupt controller.
+ * @apart: AIE partition pointer.
+ * @loc: pointer to tile location.
+ * @bit_map: bitmap of broadcast lines to disable.
+ */
+static void aie_disable_l2_ctrl(struct aie_partition *apart,
+				struct aie_location *loc, u32 bit_map)
+{
+	const struct aie_l2_intr_ctrl_attr *intr_ctrl = apart->adev->l2_ctrl;
+	u32 l2off = intr_ctrl->regoff + intr_ctrl->disable.regoff;
+	u32 regoff = aie_cal_regoff(apart->adev, *loc, l2off);
+
+	bit_map &= intr_ctrl->disable.mask;
+	iowrite32(bit_map, apart->adev->base + regoff);
+}
+
+/**
+ * aie_tile_backtrack() - if error was asserted on a broadcast line in
+ *			  the given array tile,
+ *				* disable the error from the group errors
+ * @apart: AIE partition pointer.
+ * @loc: tile location.
+ * @module: module type.
+ * @sw: switch type.
+ * @bc_id: broadcast ID.
+ * @return: true if error was asserted, else return false.
+ */
+static bool aie_tile_backtrack(struct aie_partition *apart,
+			       struct aie_location loc,
+			       enum aie_module_type module,
+			       enum aie_shim_switch_type sw, u8 bc_id)
+{
+	unsigned long grenabled;
+	u32 status[4];
+	u8 n, grevent, eevent;
+	bool ret = false;
+
+	if (module == AIE_PL_MOD)
+		grevent = aie_get_l1_event(apart, &loc, sw, bc_id);
+	else
+		grevent = aie_get_broadcast_event(apart, &loc, module, bc_id);
+
+	aie_read_event_status(apart, &loc, module, status);
+
+	if (!(status[grevent / 32] & BIT(grevent % 32)))
+		return ret;
+
+	grenabled = aie_check_group_errors_enabled(apart, &loc, module);
+	for_each_set_bit(n, &grenabled, 32) {
+		eevent = aie_get_error_event(apart, &loc, module, n);
+		if (!(status[eevent / 32] & BIT(eevent % 32)))
+			continue;
+		grenabled &= ~BIT(n);
+		ret = true;
+		dev_err_ratelimited(&apart->adev->dev,
+				    "Asserted tile error event %d at col %d row %d\n",
+				    eevent, loc.col, loc.row);
+	}
+	aie_set_error_event(apart, &loc, module, grenabled);
+
+	return ret;
+}
+
+/**
+ * aie_map_l2_to_l1() - map the status bit set in level 2 interrupt controller
+ *		        to a level 1 interrupt controller.
+ * @apart: AIE partition pointer.
+ * @set_pos: position of level 2 set bit.
+ * @l2_col: level 2 interrupt controller column ID.
+ * @l1_col: pointer to return corresponding level 1 column ID.
+ * @sw: pointer to return the level 1 interrupt controller switch ID.
+ *
+ * This API implementation is tightly coupled with the level 2 to level 1
+ * static mapping created when AIE application CDOs are generated.
+ */
+static void aie_map_l2_to_l1(struct aie_partition *apart, u32 set_pos,
+			     u32 l2_col, u32 *l1_col,
+			     enum aie_shim_switch_type *sw)
+{
+	if (l2_col + 3 >= apart->range.start.col + apart->range.size.col) {
+		*l1_col = l2_col + (set_pos % 6) / 2;
+		*sw = (set_pos % 6) % 2;
+	} else if (l2_col % 2 == 0) {
+		/* set bit position could be 0 - 5 */
+		*l1_col = l2_col - (2 - (set_pos % 6) / 2);
+		*sw = (set_pos % 6) % 2;
+	} else {
+		/* set bit position could be 0 - 1 */
+		*l1_col = l2_col;
+		*sw = set_pos;
+	}
+}
+
+/**
+ * aie_l1_backtrack() - backtrack AIE array tiles or shim tile based on
+ *			the level 2 status bit set.
+ * @apart: AIE partition pointer.
+ * @loc: tile location of level 2 interrupt controller.
+ * @set_pos: set bit position in level 2 controller status.
+ * @return: true if error was asserted, else return false.
+ */
+static bool aie_l1_backtrack(struct aie_partition *apart,
+			     struct aie_location loc, u32 set_pos)
+{
+	struct aie_location l1_ctrl;
+	enum aie_shim_switch_type sw;
+	unsigned long status;
+	u32 srow = apart->range.start.row + 1;
+	u32 erow = apart->range.start.row + apart->range.size.row;
+	bool ret = false;
+
+	/*
+	 * Based on the set status bit find which level 1 interrupt
+	 * controller has generated an interrupt
+	 */
+	l1_ctrl.row = 0;
+	aie_map_l2_to_l1(apart, set_pos, loc.col, &l1_ctrl.col, &sw);
+
+	status = aie_get_l1_status(apart, &l1_ctrl, sw);
+
+	/* For now, support error broadcasts only */
+	if (status & BIT(AIE_ARRAY_TILE_ERROR_BC_ID)) {
+		struct aie_location temp;
+		enum aie_module_type module;
+		u32 bc_event;
+
+		if (sw == AIE_SHIM_SWITCH_A)
+			module = AIE_CORE_MOD;
+		else
+			module = AIE_MEM_MOD;
+
+		aie_clear_l1_intr(apart, &l1_ctrl, sw,
+				  AIE_ARRAY_TILE_ERROR_BC_ID);
+
+		temp.row = srow;
+		temp.col = l1_ctrl.col;
+		bc_event = aie_get_bc_event(apart, &temp, module,
+					    AIE_ARRAY_TILE_ERROR_BC_ID);
+		for (; temp.row < erow; temp.row++) {
+			u32 reg[4];
+
+			if (!aie_part_check_clk_enable_loc(apart, &temp))
+				break;
+
+			if (aie_tile_backtrack(apart, temp, module, sw,
+					       AIE_ARRAY_TILE_ERROR_BC_ID))
+				ret = true;
+
+			aie_read_event_status(apart, &temp, module, reg);
+			if (!(reg[bc_event / 32] & BIT(bc_event % 32)))
+				break;
+		}
+	}
+
+	if (status & BIT(AIE_SHIM_TILE_ERROR_IRQ_ID)) {
+		aie_clear_l1_intr(apart, &l1_ctrl, sw,
+				  AIE_SHIM_TILE_ERROR_IRQ_ID);
+		if (aie_tile_backtrack(apart, l1_ctrl, AIE_PL_MOD, sw,
+				       AIE_SHIM_TILE_ERROR_IRQ_ID))
+			ret = true;
+	}
+	return ret;
+}
+
+/**
+ * aie_l2_backtrack() - iterate through each level 2 interrupt controller
+ *			in a given partition and backtrack its
+ *			corresponding level 1 interrupt controller.
+ * @apart: AIE partition pointer
+ */
+static void aie_l2_backtrack(struct aie_partition *apart)
+{
+	struct aie_location loc;
+	unsigned long l2_mask = 0;
+	u32 n, ttype, l2_bitmap_offset = 0;
+	int ret;
+	bool sched_work = false;
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		dev_err_ratelimited(&apart->dev,
+				    "Failed to acquire lock. Process was interrupted by fatal signals\n");
+		return;
+	}
+
+	for (loc.col = apart->range.start.col, loc.row = 0;
+	     loc.col < apart->range.start.col + apart->range.size.col;
+	     loc.col++) {
+		ttype = apart->adev->ops->get_tile_type(&loc);
+		if (ttype != AIE_TILE_TYPE_SHIMNOC)
+			continue;
+
+		aie_resource_cpy_to_arr32(&apart->l2_mask, l2_bitmap_offset *
+					  32, (u32 *)&l2_mask, 32);
+		l2_bitmap_offset++;
+
+		for_each_set_bit(n, &l2_mask,
+				 apart->adev->l2_ctrl->num_broadcasts)
+			aie_l1_backtrack(apart, loc, n);
+
+		aie_enable_l2_ctrl(apart, &loc, l2_mask);
+	}
+
+	/*
+	 * Level 2 interrupt registers are edge-triggered. As a result,
+	 * re-enabling level 2 won't trigger an interrupt for the already
+	 * latched interrupts at level 1 controller.
+	 */
+	for (loc.col = apart->range.start.col, loc.row = 0;
+	     loc.col < apart->range.start.col + apart->range.size.col;
+	     loc.col++) {
+		if (aie_get_l1_status(apart, &loc, AIE_SHIM_SWITCH_A) ||
+		    aie_get_l1_status(apart, &loc, AIE_SHIM_SWITCH_B)) {
+			mutex_unlock(&apart->mlock);
+			sched_work = true;
+			schedule_work(&apart->adev->backtrack);
+			break;
+		}
+	}
+
+	if (!sched_work)
+		mutex_unlock(&apart->mlock);
+}
+
+/**
+ * aie_part_backtrack() - backtrack a individual.
+ * @apart: AIE partition pointer.
+ */
+static void aie_part_backtrack(struct aie_partition *apart)
+{
+	aie_l2_backtrack(apart);
+}
+
+/**
+ * aie_array_backtrack() - backtrack each partition to find the source of error
+ *			   interrupt.
+ * @work: pointer to the work structure.
+ *
+ * This task will re-enable IRQ after errors in all partitions has been
+ * serviced.
+ */
+void aie_array_backtrack(struct work_struct *work)
+{
+	struct aie_device *adev;
+	struct aie_partition *apart;
+	int ret;
+
+	adev = container_of(work, struct aie_device, backtrack);
+
+	ret = mutex_lock_interruptible(&adev->mlock);
+	if (ret) {
+		dev_err_ratelimited(&adev->dev,
+				    "Failed to acquire lock. Process was interrupted by fatal signals\n");
+		return;
+	}
+
+	list_for_each_entry(apart, &adev->partitions, node)
+		aie_part_backtrack(apart);
+
+	mutex_unlock(&adev->mlock);
+}
+
+/**
+ * aie_interrupt() - interrupt handler for AIE.
+ * @irq: Interrupt number.
+ * @data: AI engine device structure.
+ * @return: IRQ_HANDLED.
+ *
+ * This thread function disables level 2 interrupt controllers and schedules a
+ * task in workqueue to backtrack the source of error interrupt. Disabled
+ * interrupts are re-enabled after successful completion of bottom half.
+ */
+irqreturn_t aie_interrupt(int irq, void *data)
+{
+	struct aie_device *adev = data;
+	struct aie_partition *apart;
+	int ret;
+	bool sched_work = false;
+
+	ret = mutex_lock_interruptible(&adev->mlock);
+	if (ret) {
+		dev_err(&adev->dev,
+			"Failed to acquire lock. Process was interrupted by fatal signals\n");
+		return IRQ_NONE;
+	}
+
+	list_for_each_entry(apart, &adev->partitions, node) {
+		struct aie_location loc;
+		u32 ttype, l2_mask, l2_status, l2_bitmap_offset  = 0;
+
+		ret = mutex_lock_interruptible(&apart->mlock);
+		if (ret) {
+			dev_err(&apart->dev,
+				"Failed to acquire lock. Process was interrupted by fatal signals\n");
+			return IRQ_NONE;
+		}
+
+		for (loc.col = apart->range.start.col, loc.row = 0;
+		     loc.col < apart->range.start.col + apart->range.size.col;
+		     loc.col++) {
+			ttype = apart->adev->ops->get_tile_type(&loc);
+			if (ttype != AIE_TILE_TYPE_SHIMNOC)
+				continue;
+
+			l2_mask = aie_get_l2_mask(apart, &loc);
+			if (l2_mask) {
+				aie_resource_cpy_from_arr32(&apart->l2_mask,
+							    l2_bitmap_offset  *
+							    32, &l2_mask, 32);
+				aie_disable_l2_ctrl(apart, &loc, l2_mask);
+			}
+			l2_bitmap_offset++;
+
+			l2_status = aie_get_l2_status(apart, &loc);
+			if (l2_status) {
+				aie_clear_l2_intr(apart, &loc, l2_status);
+				sched_work = true;
+			} else {
+				aie_enable_l2_ctrl(apart, &loc, l2_mask);
+			}
+		}
+		mutex_unlock(&apart->mlock);
+	}
+
+	/* For ES1 silicon, interrupts are latched in NPI */
+	if (adev->version == VERSAL_ES1_REV_ID) {
+		ret = zynqmp_pm_clear_aie_npi_isr(adev->pm_node_id,
+						  AIE_NPI_ERROR_ID);
+		if (ret < 0)
+			dev_err(&adev->dev, "Failed to clear NPI ISR\n");
+	}
+
+	mutex_unlock(&adev->mlock);
+
+	if (sched_work)
+		schedule_work(&adev->backtrack);
+
+	return IRQ_HANDLED;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index 54450b6..0670d0ad 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -247,6 +247,9 @@ static int aie_part_release(struct inode *inode, struct file *filp)
 	aie_part_clean(apart);
 
 	apart->status = 0;
+
+	aie_resource_clear_all(&apart->l2_mask);
+
 	mutex_unlock(&apart->mlock);
 
 	return 0;
@@ -369,6 +372,7 @@ static void aie_part_release_device(struct device *dev)
 	list_del(&apart->node);
 	mutex_unlock(&adev->mlock);
 	aie_resource_uninitialize(&apart->cores_clk_state);
+	aie_resource_uninitialize(&apart->l2_mask);
 	put_device(apart->dev.parent);
 }
 
@@ -408,6 +412,39 @@ static int aie_part_create_mems_info(struct aie_partition *apart)
 }
 
 /**
+ * aie_part_create_l2_bitmap() - create bitmaps to record mask and status
+ *				 values for level 2 interrupt controllers.
+ * @apart: AI engine partition
+ * @return: 0 for success, and negative value for failure.
+ */
+static int aie_part_create_l2_bitmap(struct aie_partition *apart)
+{
+	struct aie_location loc;
+	u8 num_l2_ctrls = 0;
+	int ret;
+
+	loc.row = 0;
+	for (loc.col = apart->range.start.col;
+	     loc.col < apart->range.start.col + apart->range.size.col;
+	     loc.col++) {
+		u32 ttype = apart->adev->ops->get_tile_type(&loc);
+
+		if (ttype == AIE_TILE_TYPE_SHIMNOC)
+			num_l2_ctrls++;
+	}
+
+	ret = aie_resource_initialize(&apart->l2_mask, num_l2_ctrls *
+				      AIE_INTR_L2_CTRL_MASK_WIDTH);
+	if (ret) {
+		dev_err(&apart->dev,
+			"failed to initialize l2 mask resource.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
  * aie_create_partition() - create AI engine partition instance
  * @adev: AI engine device
  * @range: AI engine partition range to check. A range describes a group
@@ -498,6 +535,13 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = aie_part_create_l2_bitmap(apart);
+	if (ret < 0) {
+		dev_err(&apart->dev, "Failed to allocate l2 bitmap.\n");
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = mutex_lock_interruptible(&adev->mlock);
 	if (ret) {
 		put_device(dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-res.c b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
index b0c0741..f1bb75b 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-res.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
@@ -132,6 +132,44 @@ int aie_resource_set(struct aie_resource *res, u32 start, u32 count)
 }
 
 /**
+ * aie_resource_cpy_from_arr32() - copies nbits from u32[] to bitmap.
+ * @res: pointer to AI engine resource
+ * @start: start bit in bitmap
+ * @src: source buffer
+ * @nbits: number of bits to copy from u32[]
+ * @return: 0 for success and negative value for failure
+ */
+int aie_resource_cpy_from_arr32(struct aie_resource *res, u32 start,
+				const u32 *src, u32 nbits)
+{
+	if (!res || !res->bitmap || !nbits || start + nbits  > res->total ||
+	    !src)
+		return -EINVAL;
+
+	bitmap_from_arr32(res->bitmap + BIT_WORD(start), src, nbits);
+	return 0;
+}
+
+/**
+ * aie_resource_cpy_to_arr32() - copies nbits to u32[] from bitmap.
+ * @res: pointer to AI engine resource
+ * @start: start bit in bitmap
+ * @dst: destination buffer
+ * @nbits: number of bits to copy to u32[]
+ * @return: 0 for success and negative value for failure
+ */
+int aie_resource_cpy_to_arr32(struct aie_resource *res, u32 start, u32 *dst,
+			      u32 nbits)
+{
+	if (!res || !res->bitmap || !nbits || start + nbits  > res->total ||
+	    !dst)
+		return -EINVAL;
+
+	bitmap_to_arr32(dst, res->bitmap + BIT_WORD(start), nbits);
+	return 0;
+}
+
+/**
  * aie_resource_clear() - clear the AI engine resource bits
  * @res: pointer to AI engine resource
  * @start: start bit to set
@@ -150,6 +188,22 @@ int aie_resource_clear(struct aie_resource *res, u32 start, u32 count)
 }
 
 /**
+ * aie_resource_clear_all() - clear all the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @return: 0 for success and negative value for failure
+ *
+ * This function clears all the bits in the resource.
+ */
+int aie_resource_clear_all(struct aie_resource *res)
+{
+	if (!res || !res->bitmap)
+		return -EINVAL;
+
+	bitmap_clear(res->bitmap, 0, res->total);
+	return 0;
+}
+
+/**
  * aie_resource_testbit() - test if a bit is set in a AI engine resource
  * @res: pointer to AI engine resource
  * @bit: bit to check
-- 
2.7.4

