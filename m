Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AC42B88BF
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 00:52:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgKRXsy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 18:48:54 -0500
Received: from mail-eopbgr680054.outbound.protection.outlook.com ([40.107.68.54]:18436
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726081AbgKRXsr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 18:48:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUcL6zf2PKft5VLZl9K3r/1QGhoE32esvIKb1WO3QphP0vLyzls4wFvYmtPI1GSlClazZNsQM2rQI2iQ+jCFuSB53R7Bxjmqi8orCx+lm6yfN9onHu/IfuXJSV/oTH64ZUIQMkJdhvNJtWuy9CMzHM1IL78oN9LymZLUJmdtSShohPosa7M3BZfeeAt57fOr3Q6v0oLtDtXrncObC+jUPY+2EMzYsCUrpzmcXlH4f3DZLrMs61BAD2Y4gTLs7qZfW+RqJ+cv6ncS5v+wEdf5SPshS78SvG68iY67zQf0nRLHHOIBNsery99b7FE874CPKY4+XN78AkMbZiJoIsd10w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FL8b4X6+6JSxDXtGh7kQMUd6Ck0PZpmGzKEr8QyyrE=;
 b=L9cFAVC7K5sGcYsK7IIxgad2APdphB0F+vnjGQ7g/Fql5T1IplNa9PPZFnWiS2PPxZzAv/aSQ95onYU4NVO6iSD7CAMVn+NpsmDsCxzoAuua1XJlc37nqV6qxq0xjse7Q/UN58YZlruI9Trr4vs/TVmMMAekcWhdsbF4wo7qGTq++aEBu0SSrpwcYVHoebMSmgmpgp9k5ptr5kXiTk7oBlq1GzjXSXmmH6FoLbegZLbtztDKJ1Nt76AV3+GbYAqCmq1RXAa9pIjuRoPvaWD48vt6u60F1E483NzV3wLV0IDURysr/Vke1lCqXBY+TaNOzaeQkLZS5A+v/J8V9KoDMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FL8b4X6+6JSxDXtGh7kQMUd6Ck0PZpmGzKEr8QyyrE=;
 b=Al8AF/MHm0Z3kW2urmTekGZ+Z/DTGgKPN/IUQ/C3csWXmlgNCvsAxNwYc/soL/ROv7113TQ+uwCJqRWKksYLe1ds0ricBJm/adIqliN94U6cDZQ14ne/w5FhVu6Z4czHex4ByqbStFUo4JSAZ1DUcRP7L6EcHqmdYtMHWPrF9oc=
Received: from SA9PR03CA0020.namprd03.prod.outlook.com (2603:10b6:806:20::25)
 by SA2PR02MB7739.namprd02.prod.outlook.com (2603:10b6:806:14d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 18 Nov
 2020 23:48:31 +0000
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:20:cafe::f) by SA9PR03CA0020.outlook.office365.com
 (2603:10b6:806:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 23:48:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 23:48:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 18 Nov 2020 15:48:11 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 18 Nov 2020 15:48:11 -0800
Envelope-to: michal.simek@xilinx.com,
 derek.kiernan@xilinx.com,
 dragan.cvetic@xilinx.com,
 rajan.vaja@xilinx.com,
 tejas.patel@xilinx.com,
 manish.narani@xilinx.com,
 ravi.patel@xilinx.com,
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
        id 1kfXBL-0000Wz-BL; Wed, 18 Nov 2020 15:48:11 -0800
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
        Wendy Liang <wendy.liang@xilinx.com>
Subject: [PATCH v2 6/9] misc: xilinx-ai-engine: add request and release tiles
Date:   Wed, 18 Nov 2020 15:48:06 -0800
Message-ID: <1605743289-26575-7-git-send-email-wendy.liang@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
References: <1605743289-26575-1-git-send-email-wendy.liang@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33309dc6-6ca7-4edb-835d-08d88c1c74ad
X-MS-TrafficTypeDiagnostic: SA2PR02MB7739:
X-Microsoft-Antispam-PRVS: <SA2PR02MB77393F39C8B2ED36E9485219B0E10@SA2PR02MB7739.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEWMvl0R7WXB7vhrw6epMzs8cIIW3QL6Zw31w8eAm/QG7cDNfxZri53Zuhtm3BL+CiS9Qdr85d6n2fSZXEldEuLzLMcApvx0AtJtMc6RCJuwIN1FC4UT+4UiEbWs5j6hZNuPRUKci4D4hycjSHpPAe0HSbM5FRxfJW74fYB57qng5pw6/3qirq/GHK0JTVwRdic3INq8GcLf46Gv53gH/OcZ0T3M62BN1flfI6twJ40+8MFphLk/O6OG9XmmiGA1p1wOQcP8wm72fEULqxyfYVjPHovWQZxqQsYsqMXmGPU09K3A9cP3+ibl6T7gNlKzomP7itBimD5ri70K53UCKFrQPhX6yobImqx39VI990CvIORfZzCZSOH+geCvDJQ0PacxsLXZdehd3SAymE5DJRmgP28crn0GYcqtoaQI+q19eHMAkCeQ8Xn4OfzxG8bY
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966005)(186003)(54906003)(36756003)(44832011)(36906005)(8936002)(9786002)(82740400003)(356005)(107886003)(47076004)(7416002)(7636003)(8676002)(478600001)(426003)(336012)(110136005)(2906002)(83380400001)(4326008)(6666004)(70586007)(2616005)(30864003)(70206006)(7696005)(6636002)(82310400003)(26005)(316002)(5660300002)(921005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 23:48:31.6626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33309dc6-6ca7-4edb-835d-08d88c1c74ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7739
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add request/release and related clock gating functions to AI engine
driver:
* scanning when the partition is being requested to know which tiles
  are in use.
* check if a tile is gated or not
* tiles requesting and releasing ioctl so that user application can
  enable/disable tiles at runtime.

Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/misc/xilinx-ai-engine/Makefile             |   1 +
 drivers/misc/xilinx-ai-engine/ai-engine-aie.c      | 227 ++++++++++++++++++-
 drivers/misc/xilinx-ai-engine/ai-engine-clock.c    | 244 +++++++++++++++++++++
 drivers/misc/xilinx-ai-engine/ai-engine-dev.c      |  19 +-
 drivers/misc/xilinx-ai-engine/ai-engine-internal.h |  34 +++
 drivers/misc/xilinx-ai-engine/ai-engine-part.c     |  32 +++
 drivers/misc/xilinx-ai-engine/ai-engine-res.c      |  51 +++++
 include/uapi/linux/xlnx-ai-engine.h                |  31 +++
 8 files changed, 631 insertions(+), 8 deletions(-)
 create mode 100644 drivers/misc/xilinx-ai-engine/ai-engine-clock.c

diff --git a/drivers/misc/xilinx-ai-engine/Makefile b/drivers/misc/xilinx-ai-engine/Makefile
index 1b743fa..2e67b25 100644
--- a/drivers/misc/xilinx-ai-engine/Makefile
+++ b/drivers/misc/xilinx-ai-engine/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_XILINX_AIE)	+= xilinx-aie.o
 
 xilinx-aie-$(CONFIG_XILINX_AIE) := ai-engine-aie.o \
+				   ai-engine-clock.o \
 				   ai-engine-dev.o \
 				   ai-engine-dma.o \
 				   ai-engine-mem.o \
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
index 19c262d..ff721b3 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-aie.c
@@ -41,6 +41,9 @@
 #define AIE_SHIMPL_SHIMRST_MASK			0x1U
 #define AIE_SHIMPL_COLRST_MASK			0x1U
 #define AIE_SHIMPL_CLKCNTR_COLBUF_MASK		0x1U
+#define AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK		BIT(1)
+#define AIE_TILE_CLKCNTR_COLBUF_MASK		BIT(0)
+#define AIE_TILE_CLKCNTR_NEXTCLK_MASK		BIT(1)
 
 /*
  * AI engine SHIM reset ID.
@@ -221,10 +224,232 @@ static int aie_reset_shim(struct aie_device *adev, struct aie_range *range)
 	return 0;
 }
 
+static int aie_init_part_clk_state(struct aie_partition *apart)
+{
+	int ret, num_tiles;
+
+	num_tiles = apart->range.size.col * (apart->range.size.row - 1);
+
+	ret = aie_resource_initialize(&apart->cores_clk_state, num_tiles);
+	if (ret) {
+		dev_err(&apart->dev,
+			"failed to initialize cores clock state resource.\n");
+		return ret;
+	}
+
+	ret = aie_resource_initialize(&apart->tiles_inuse, num_tiles);
+	if (ret) {
+		dev_err(&apart->dev,
+			"failed to initialize tiles in use resource.\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aie_scan_part_clocks(struct aie_partition *apart)
+{
+	struct aie_device *adev = apart->adev;
+	struct aie_range *range = &apart->range;
+	struct aie_location loc;
+
+	/* Clear the bitmap of cores and memories clock state */
+	aie_resource_put_region(&apart->cores_clk_state, 0,
+				apart->cores_clk_state.total);
+
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		for (loc.row = range->start.row;
+		     loc.row < range->start.row + range->size.row - 1;
+		     loc.row++) {
+			void __iomem *va;
+			u32 val, nbitpos;
+
+			/*
+			 * Reading registers of the current tile to see the next
+			 * tile is clock gated.
+			 */
+			nbitpos = loc.col * (range->size.row - 1) + loc.row;
+
+			if (aie_get_tile_type(&loc) != AIE_TILE_TYPE_TILE) {
+				/* Checks shim tile for next core tile */
+				va = adev->base +
+				     aie_cal_regoff(adev, loc,
+						    AIE_SHIMPL_CLKCNTR_REGOFF);
+				val = ioread32(va);
+
+				/*
+				 * check if the clock buffer and the next clock
+				 * tile is set, if one of them is not set, the
+				 * tiles of the column are clock gated.
+				 */
+				if (!(val & AIE_SHIMPL_CLKCNTR_COLBUF_MASK) ||
+				    !(val & AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK))
+					break;
+
+				/* Set next tile in the row clock state on */
+				aie_resource_set(&apart->cores_clk_state,
+						 nbitpos, 1);
+				continue;
+			}
+
+			/* Checks core tile for next tile */
+			va = adev->base +
+			     aie_cal_regoff(adev, loc,
+					    AIE_TILE_CORE_CLKCNTR_REGOFF);
+			val = ioread32(va);
+
+			/*
+			 * If the next tile is gated, skip the rest of the
+			 * column.
+			 */
+			if (!(val & AIE_TILE_CLKCNTR_NEXTCLK_MASK))
+				break;
+
+			aie_resource_set(&apart->cores_clk_state, nbitpos, 1);
+		}
+	}
+
+	/*
+	 * Set the tiles in use bitmap.
+	 * In case of scanning, tiles which are powered on are considered as
+	 * tiles in use.
+	 */
+	bitmap_copy(apart->tiles_inuse.bitmap, apart->cores_clk_state.bitmap,
+		    apart->tiles_inuse.total);
+
+	return 0;
+}
+
+/* aie_set_col_clocks() - set clocks of a range of tiles of a column
+ * @apart: AI engine partition
+ * @range: range of tiles of a column
+ * @enable: true to enable the clock, false to disable
+ * @return: 0 for success, negative value of errors.
+ */
+static int aie_set_col_clocks(struct aie_partition *apart,
+			      struct aie_range *range, bool enable)
+{
+	struct aie_location ploc;
+	u32 startbit;
+
+	/*
+	 * check if the range is of single column. only single column is allowed.
+	 * check if the start row is tile row, only tile rows are allowed.
+	 */
+	if (range->size.col != 1 || range->start.row < 1)
+		return -EINVAL;
+
+	ploc.col = range->start.col;
+	for (ploc.row = range->start.row - 1;
+	     ploc.row < range->start.row + range->size.row - 1;
+	     ploc.row++) {
+		struct aie_device *adev = apart->adev;
+
+		if (!ploc.row) {
+			void __iomem *va;
+			u32 val = 0;
+
+			/*
+			 * Configure SHIM clock registers to gate or
+			 * ungate next tile.
+			 */
+			if (enable)
+				val = AIE_SHIMPL_CLKCNTR_COLBUF_MASK |
+				      AIE_SHIMPL_CLKCNTR_NEXTCLK_MASK;
+			va = adev->base +
+			     aie_cal_regoff(adev, ploc,
+					    AIE_SHIMPL_CLKCNTR_REGOFF);
+			iowrite32(val, va);
+		} else {
+			void __iomem *va;
+			u32 val = 0;
+
+			/*
+			 * Configure core tile clock registers to gate
+			 * or ungate next tile.
+			 */
+			if (enable)
+				val = AIE_TILE_CLKCNTR_COLBUF_MASK |
+				      AIE_TILE_CLKCNTR_NEXTCLK_MASK;
+			va = adev->base +
+			     aie_cal_regoff(adev, ploc,
+					    AIE_TILE_CORE_CLKCNTR_REGOFF);
+			iowrite32(val, va);
+		}
+
+		/* If the tile clock is not on, jump to next column */
+		if (!enable)
+			break;
+	}
+
+	/* Update clock state bitmap */
+	startbit = range->start.col * (apart->range.size.row - 1) +
+		   range->start.row - 1;
+	if (enable)
+		aie_resource_set(&apart->cores_clk_state, startbit,
+				 range->size.row);
+	else
+		aie_resource_clear(&apart->cores_clk_state, startbit,
+				   range->size.row);
+
+	return 0;
+}
+
+static int aie_set_part_clocks(struct aie_partition *apart)
+{
+	struct aie_range *range = &apart->range, lrange;
+	struct aie_location loc;
+
+	/*
+	 * The tiles below the highest tile whose clock is on, need to have the
+	 * clock on. The first for loop is to scan the clock states bitmap to
+	 * see which tiles are required to be clocked on, and update the bitmap
+	 * to make sure the tiles below are also required to be clocked on.
+	 */
+	for (loc.col = range->start.col;
+	     loc.col < range->start.col + range->size.col;
+	     loc.col++) {
+		u32 startbit, inuse_toprow = 0, clk_toprow = 0;
+
+		startbit = loc.col * (range->size.row - 1);
+
+		for (loc.row = range->start.row + 1;
+		     loc.row < range->start.row + range->size.row;
+		     loc.row++) {
+			u32 bit = startbit + loc.row - 1;
+
+			if (aie_resource_testbit(&apart->tiles_inuse, bit))
+				inuse_toprow = loc.row;
+			if (aie_resource_testbit(&apart->cores_clk_state, bit))
+				clk_toprow = loc.row;
+		}
+
+		/* Update clock states of a column */
+		lrange.start.col = loc.col;
+		lrange.size.col = 1;
+		if (inuse_toprow < clk_toprow) {
+			lrange.start.row = inuse_toprow + 1;
+			lrange.size.row = clk_toprow - inuse_toprow;
+			aie_set_col_clocks(apart, &lrange, false);
+		} else  if (inuse_toprow > clk_toprow) {
+			lrange.start.row = clk_toprow + 1;
+			lrange.size.row = inuse_toprow - clk_toprow;
+			aie_set_col_clocks(apart, &lrange, true);
+		}
+	}
+
+	return 0;
+}
+
 static const struct aie_tile_operations aie_ops = {
 	.get_tile_type = aie_get_tile_type,
 	.get_mem_info = aie_get_mem_info,
 	.reset_shim = aie_reset_shim,
+	.init_part_clk_state = aie_init_part_clk_state,
+	.scan_part_clocks = aie_scan_part_clocks,
+	.set_part_clocks = aie_set_part_clocks,
 };
 
 /**
@@ -250,7 +475,7 @@ int aie_device_init(struct aie_device *adev)
 	adev->kernel_regs = aie_kernel_regs;
 	adev->col_rst = &aie_col_rst;
 	adev->col_clkbuf = &aie_col_clkbuf;
-	adev->shim_dma = &aiev1_shimdma;
+	adev->shim_dma = &aie_shimdma;
 
 	/* Get the columns resource */
 	/* Get number of columns from AI engine memory resource */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-clock.c b/drivers/misc/xilinx-ai-engine/ai-engine-clock.c
new file mode 100644
index 0000000..d490ad5
--- /dev/null
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-clock.c
@@ -0,0 +1,244 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Xilinx AI Engine device driver
+ *
+ * Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#include "ai-engine-internal.h"
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+/**
+ * aie_part_get_clk_state_bit() - return bit position of the clock state of a
+ *				  tile
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ * @return: bit position for success, negative value for failure
+ */
+static int aie_part_get_clk_state_bit(struct aie_partition *apart,
+				      struct aie_location *loc)
+{
+	if (apart->adev->ops->get_tile_type(loc) != AIE_TILE_TYPE_TILE)
+		return -EINVAL;
+
+	return loc->col * (apart->range.size.row - 1) + loc->row - 1;
+}
+
+/**
+ * aie_part_scan_clk_state() - scan the clock states of tiles of the AI engine
+ *			       partition
+ * @apart: AI engine partition
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will scan the clock status of both the memory and core
+ * modules.
+ */
+int aie_part_scan_clk_state(struct aie_partition *apart)
+{
+	return apart->adev->ops->scan_part_clocks(apart);
+}
+
+/**
+ * aie_part_check_clk_enable_loc() - return if clock of a tile is enabled
+ * @apart: AI engine partition
+ * @loc: AI engine tile location
+ * @return: true for enabled, false for disabled
+ */
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc)
+{
+	int bit;
+
+	if (apart->adev->ops->get_tile_type(loc) != AIE_TILE_TYPE_TILE)
+		return true;
+
+	bit = aie_part_get_clk_state_bit(apart, loc);
+	return aie_resource_testbit(&apart->cores_clk_state, bit);
+}
+
+/**
+ * aie_part_request_tiles() - request tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to request. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be requested
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will enable clocks of the specified tiles.
+ */
+static int aie_part_request_tiles(struct aie_partition *apart, int num_tiles,
+				  struct aie_location *locs)
+{
+	if (num_tiles == 0) {
+		aie_resource_set(&apart->tiles_inuse, 0,
+				 apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs)
+			return -EINVAL;
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_set(&apart->tiles_inuse, bit, 1);
+		}
+	}
+
+	return apart->adev->ops->set_part_clocks(apart);
+}
+
+/**
+ * aie_part_release_tiles() - release tiles from an AI engine partition.
+ * @apart: AI engine partition
+ * @num_tiles: number of tiles to release. If it is 0, it means all tiles
+ * @locs: the AI engine tiles locations array which will be released
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will disable clocks of the specified tiles.
+ */
+static int aie_part_release_tiles(struct aie_partition *apart, int num_tiles,
+				  struct aie_location *locs)
+{
+	if (num_tiles == 0) {
+		aie_resource_clear(&apart->tiles_inuse, 0,
+				   apart->tiles_inuse.total);
+	} else {
+		u32 n;
+
+		if (!locs)
+			return -EINVAL;
+
+		for (n = 0; n < num_tiles; n++) {
+			int bit = aie_part_get_clk_state_bit(apart, &locs[n]);
+
+			if (bit >= 0)
+				aie_resource_clear(&apart->tiles_inuse, bit, 1);
+		}
+	}
+
+	return apart->adev->ops->set_part_clocks(apart);
+}
+
+/**
+ * aie_part_request_tiles_from_user() - request tiles from an AI engine
+ *					partition from user
+ * @apart: AI engine partition
+ * @user_args: user AI engine request tiles argument
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will request tiles from user request.
+ */
+int aie_part_request_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args)
+{
+	struct aie_tiles_array args;
+	struct aie_location *locs = NULL;
+	int ret;
+
+	if (copy_from_user(&args, user_args, sizeof(args)))
+		return -EFAULT;
+
+	if (args.num_tiles) {
+		u32 i;
+
+		locs = kmalloc_array(args.num_tiles, sizeof(*locs),
+				     GFP_KERNEL);
+		if (!locs)
+			return -ENOMEM;
+
+		if (copy_from_user(locs, (void __user *)args.locs,
+				   args.num_tiles * sizeof(*locs))) {
+			kfree(locs);
+			return -EFAULT;
+		}
+
+		/* update the location to absolute location */
+		for (i = 0; i < args.num_tiles; i++) {
+			if (locs[i].col > apart->range.size.col ||
+			    locs[i].row > apart->range.size.row) {
+				dev_err(&apart->dev,
+					"failed to request tiles, invalid tile(%u,%u).\n",
+					locs[i].col, locs[i].row);
+				kfree(locs);
+				return -EINVAL;
+			}
+			locs[i].col += apart->range.start.col;
+			locs[i].row += apart->range.start.row;
+		}
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		kfree(locs);
+		return ret;
+	}
+
+	ret = aie_part_request_tiles(apart, args.num_tiles, locs);
+	mutex_unlock(&apart->mlock);
+
+	kfree(locs);
+	return ret;
+}
+
+/**
+ * aie_part_release_tiles_from_user() - release tiles from an AI engine
+ *					partition from user
+ * @apart: AI engine partition
+ * @user_args: user AI engine request tiles argument
+ * @return: 0 for success, negative value for failure.
+ *
+ * This function will release tiles from user request.
+ */
+int aie_part_release_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args)
+{
+	struct aie_tiles_array args;
+	struct aie_location *locs = NULL;
+	int ret;
+
+	if (copy_from_user(&args, user_args, sizeof(args)))
+		return -EFAULT;
+
+	if (args.num_tiles) {
+		int i;
+
+		locs = kmalloc_array(args.num_tiles, sizeof(*locs),
+				     GFP_KERNEL);
+		if (!locs)
+			return -ENOMEM;
+
+		if (copy_from_user(locs, (void __user *)args.locs,
+				   args.num_tiles * sizeof(*locs))) {
+			kfree(locs);
+			return -EFAULT;
+		}
+
+		/* update the location to absolute location */
+		for (i = 0; i < args.num_tiles; i++) {
+			if (locs[i].col > apart->range.size.col ||
+			    locs[i].row > apart->range.size.row) {
+				dev_err(&apart->dev,
+					"failed to release tiles, invalid tile(%u,%u).\n",
+					locs[i].col, locs[i].row);
+				kfree(locs);
+				return -EINVAL;
+			}
+			locs[i].col += apart->range.start.col;
+			locs[i].row += apart->range.start.row;
+		}
+	}
+
+	ret = mutex_lock_interruptible(&apart->mlock);
+	if (ret) {
+		kfree(locs);
+		return ret;
+	}
+
+	ret = aie_part_release_tiles(apart, args.num_tiles, locs);
+	mutex_unlock(&apart->mlock);
+
+	kfree(locs);
+	return ret;
+}
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
index 38a1ded..7e69ff4 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-dev.c
@@ -200,17 +200,22 @@ struct aie_partition *aie_request_partition(struct aie_device *adev,
 	} else {
 		/*
 		 * TBD:
-		 * 1. setup NOC AXI MM config to only generate error events
-		 *    for slave error and decode error.
-		 * 2. scan to see which tiles have been clock gated.
+		 * setup NOC AXI MM config to only generate error events
+		 * for slave error and decode error.
 		 *
 		 * This needs to be done before the AI engine partition is
 		 * exported for user to access.
 		 */
-		apart->status = XAIE_PART_STATUS_INUSE;
-		apart->cntrflag = req->flag;
-
-		mutex_unlock(&apart->mlock);
+		/* scan to setup the initial clock state for tiles */
+		ret = aie_part_scan_clk_state(apart);
+		if (ret) {
+			mutex_unlock(&apart->mlock);
+			apart = ERR_PTR(ret);
+		} else {
+			apart->status = XAIE_PART_STATUS_INUSE;
+			apart->cntrflag = req->flag;
+			mutex_unlock(&apart->mlock);
+		}
 	}
 	mutex_unlock(&adev->mlock);
 
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
index bf3a09c..131d22a 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-internal.h
@@ -112,6 +112,22 @@ struct aie_dma_attr {
  * @get_tile_type: get type of tile based on tile operation
  * @get_mem_info: get different types of memories information
  * @reset_shim: reset shim, it will assert and then release SHIM reset
+ * @init_part_clk_state: initialize clock states software structure which is a
+ *			 bitmap for the AI engine partition. The clock states
+ *			 structure is the structure used to keep track of if
+ *			 the modules in the AI engine partition are gated.
+ * @scan_part_clocks: scan partition modules to check whether the modules are
+ *		      clock gated or not, and update the soft clock states
+ *		      structure. It is required to be called when the partition
+ *		      is requested so that the driver knows which modules are
+ *		      clock gated when the partition is requested. This function
+ *		      expects the caller to apply partition lock before calling
+ *		      this function.
+ * @set_part_clocks: set partition modules clocks gate registers based on the
+ *		     partition clock states bitmap. This function expects the
+ *		     caller to apply partition lock before calling this
+ *		     function. The caller function will need to set the bitmap
+ *		     on which tiles are required to be clocked on.
  *
  * Different AI engine device version has its own device
  * operation.
@@ -121,6 +137,9 @@ struct aie_tile_operations {
 	unsigned int (*get_mem_info)(struct aie_range *range,
 				     struct aie_part_mem *pmem);
 	int (*reset_shim)(struct aie_device *adev, struct aie_range *range);
+	int (*init_part_clk_state)(struct aie_partition *apart);
+	int (*scan_part_clocks)(struct aie_partition *apart);
+	int (*set_part_clocks)(struct aie_partition *apart);
 };
 
 /**
@@ -185,6 +204,8 @@ struct aie_device {
  * @range: range of partition
  * @mlock: protection for AI engine partition operations
  * @dev: device for the AI engine partition
+ * @cores_clk_state: bitmap to indicate the power state of core modules
+ * @tiles_inuse: bitmap to indicate if a tile is in use
  * @partition_id: partition id. Partition ID is the identifier
  *		  of the AI engine partition in the system.
  * @status: indicate if the partition is in use
@@ -199,6 +220,8 @@ struct aie_partition {
 	struct aie_range range;
 	struct mutex mlock; /* protection for AI engine partition operations */
 	struct device dev;
+	struct aie_resource cores_clk_state;
+	struct aie_resource tiles_inuse;
 	u32 partition_id;
 	u32 status;
 	u32 cntrflag;
@@ -308,6 +331,9 @@ int aie_resource_check_region(struct aie_resource *res, u32 start,
 int aie_resource_get_region(struct aie_resource *res, u32 start,
 			    u32 count);
 void aie_resource_put_region(struct aie_resource *res, int start, u32 count);
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count);
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count);
+bool aie_resource_testbit(struct aie_resource *res, u32 bit);
 
 const struct file_operations *aie_part_get_fops(void);
 u8 aie_part_in_use(struct aie_partition *apart);
@@ -331,5 +357,13 @@ long aie_part_set_dmabuf_bd(struct aie_partition *apart,
 			    void __user *user_args);
 void aie_part_release_dmabufs(struct aie_partition *apart);
 
+int aie_part_scan_clk_state(struct aie_partition *apart);
+bool aie_part_check_clk_enable_loc(struct aie_partition *apart,
+				   struct aie_location *loc);
+int aie_part_request_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args);
+int aie_part_release_tiles_from_user(struct aie_partition *apart,
+				     void __user *user_args);
+
 int aie_device_init(struct aie_device *adev);
 #endif /* AIE_INTERNAL_H */
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-part.c b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
index dcfb9ec..54450b6 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-part.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-part.c
@@ -94,6 +94,27 @@ static int aie_part_reg_validation(struct aie_partition *apart, size_t offset,
 		return -EINVAL;
 	}
 
+	/*
+	 * We check if a tile is gated before trying to access the tile.
+	 * As we mmap() the registers as read only to enable faster status
+	 * enquiry, and mmap() memories as write/read to faster memory access,
+	 * user can still access the clock gated tiles from userspace by
+	 * accessing the mmapped space.
+	 * Accessing the gated tiles can cause decode error. With PDI flow,
+	 * the PDI sets up the SHIM NOC AXI MM to only generate AI engine error
+	 * even instead of generating the NSU error. but for non PDI flow, as
+	 * the AXI MM register are protected register, until we have EEMI API
+	 * to update the AXI MM register, access the gated tiles can cause NSU
+	 * errors.
+	 * TODO: To solve this, we need to either request EEMI to configure
+	 * AXI MM or split the mmapped space into tiles based lists.
+	 */
+	if (!aie_part_check_clk_enable_loc(apart, &loc)) {
+		dev_err(&apart->dev,
+			"Tile(%u,%d) is gated.\n", loc.col, loc.row);
+		return -EINVAL;
+	}
+
 	if (!is_write)
 		return 0;
 
@@ -304,6 +325,10 @@ static long aie_part_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
 		return aie_part_detach_dmabuf_req(apart, argp);
 	case AIE_SET_SHIMDMA_DMABUF_BD_IOCTL:
 		return aie_part_set_dmabuf_bd(apart, argp);
+	case AIE_REQUEST_TILES_IOCTL:
+		return aie_part_request_tiles_from_user(apart, argp);
+	case AIE_RELEASE_TILES_IOCTL:
+		return aie_part_release_tiles_from_user(apart, argp);
 	default:
 		dev_err(&apart->dev, "Invalid ioctl command %u.\n", cmd);
 		ret = -EINVAL;
@@ -343,6 +368,7 @@ static void aie_part_release_device(struct device *dev)
 				apart->range.size.col);
 	list_del(&apart->node);
 	mutex_unlock(&adev->mlock);
+	aie_resource_uninitialize(&apart->cores_clk_state);
 	put_device(apart->dev.parent);
 }
 
@@ -466,6 +492,12 @@ static struct aie_partition *aie_create_partition(struct aie_device *adev,
 		return ERR_PTR(ret);
 	}
 
+	ret = adev->ops->init_part_clk_state(apart);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
 	ret = mutex_lock_interruptible(&adev->mlock);
 	if (ret) {
 		put_device(dev);
diff --git a/drivers/misc/xilinx-ai-engine/ai-engine-res.c b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
index 36f08bf..b0c0741 100644
--- a/drivers/misc/xilinx-ai-engine/ai-engine-res.c
+++ b/drivers/misc/xilinx-ai-engine/ai-engine-res.c
@@ -112,3 +112,54 @@ void aie_resource_put_region(struct aie_resource *res, int start, u32 count)
 		return;
 	bitmap_clear(res->bitmap, start, count);
 }
+
+/**
+ * aie_resource_set() - set the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to set
+ * @return: 0 for success and negative value for failure
+ *
+ * This function sets the specified number bits in the resource.
+ */
+int aie_resource_set(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_set(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_clear() - clear the AI engine resource bits
+ * @res: pointer to AI engine resource
+ * @start: start bit to set
+ * @count: number of bits to clear
+ * @return: 0 for success and negative value for failure
+ *
+ * This function clears the specified number bits in the resource.
+ */
+int aie_resource_clear(struct aie_resource *res, u32 start, u32 count)
+{
+	if (!res || !res->bitmap || !count || start + count > res->total)
+		return -EINVAL;
+
+	bitmap_clear(res->bitmap, start, count);
+	return 0;
+}
+
+/**
+ * aie_resource_testbit() - test if a bit is set in a AI engine resource
+ * @res: pointer to AI engine resource
+ * @bit: bit to check
+ * @return: true for set, false for not set
+ */
+bool aie_resource_testbit(struct aie_resource *res, u32 bit)
+{
+	if (!res || !res->bitmap || bit >= res->total)
+		return false;
+
+	/* Locate the unsigned long the required bit belongs to */
+	return test_bit(bit, res->bitmap);
+}
diff --git a/include/uapi/linux/xlnx-ai-engine.h b/include/uapi/linux/xlnx-ai-engine.h
index 9080f57..5db5e31f 100644
--- a/include/uapi/linux/xlnx-ai-engine.h
+++ b/include/uapi/linux/xlnx-ai-engine.h
@@ -144,6 +144,16 @@ struct aie_dmabuf_bd_args {
 	__u32 bd_id;
 };
 
+/**
+ * struct aie_tiles_array - AIE tiles array
+ * @locs: tiles locations array
+ * @num_tiles: number of tiles in the tiles locations array
+ */
+struct aie_tiles_array {
+	struct aie_location *locs;
+	__u32 num_tiles;
+};
+
 #define AIE_IOCTL_BASE 'A'
 
 /* AI engine device IOCTL operations */
@@ -202,4 +212,25 @@ struct aie_dmabuf_bd_args {
 #define AIE_SET_SHIMDMA_DMABUF_BD_IOCTL	_IOW(AIE_IOCTL_BASE, 0x10, \
 					     struct aie_dmabuf_bd_args)
 
+/**
+ * DOC: AIE_REQUEST_TILES_IOCTL - request AI engine tiles
+ *
+ * This ioctl is used to request tiles.
+ * When requested the AI engine partition, the kernel driver will scan the
+ * partition to track which tiles are enabled or not. After that, if user
+ * want to request for more tiles, it will use this ioctl to request more
+ * tiles.
+ * If the aie_tiles_array is empty, it means it will request for all tiles
+ * in the partition.
+ */
+#define AIE_REQUEST_TILES_IOCTL		_IOW(AIE_IOCTL_BASE, 0xe, \
+					     struct aie_tiles_array)
+
+/**
+ * DOC: AIE_RELEASE_TILES_IOCTL - release AI engine tiles
+ *
+ * This ioctl is used to release tiles
+ */
+#define AIE_RELEASE_TILES_IOCTL		_IOW(AIE_IOCTL_BASE, 0xf, \
+					     struct aie_tiles_array)
 #endif
-- 
2.7.4

