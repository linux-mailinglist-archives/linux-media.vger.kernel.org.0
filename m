Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D9155FDDD
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbiF2Kvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbiF2Kvq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5A425290;
        Wed, 29 Jun 2022 03:51:44 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B350B825;
        Wed, 29 Jun 2022 12:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499901;
        bh=REn+aPm9R6vafAPERqDHBfVn+g6jgvMp7SgG/JuYb0c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qcB916VAZGD9mbiH3K95C4HSpXPllLW8qDx/X1+qqp19th/4s+lZY6nYTE4ahRnju
         vCsz8LNqxN77UMZb1rbaWLBW4JEMg7XXPjcwhwRxTIgQz70Oe5ZOv+3bmj0T26x7ty
         I+d0ycajX4SSxW2iq2WTkdvzKQnw/CGZJ3hisZLY=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 3/7] v4l: vsp1: Add debugfs system v1.8
Date:   Wed, 29 Jun 2022 11:51:31 +0100
Message-Id: <20220629105135.2652773-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide a directory under the debugfs filesystem where extra
information can be requested when debugging the hardware.

Status information for the WPF is presented under info.
Registers can be inspected in regs

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Changelog:

v1.1
 - Fix the regs_local vsp1 pointer that is passed to get the device
   references

v1.2
 - Fix up the RPF extension so that it displays the RPF number on those
   specific regset entries

v1.3
- Fix regs_local buffer size (Currently consuming at least 6k)
- Add a 'reset wpf' hook
- Add in VI6_CMD register reads
- Add in MRESET and Dynamic clock control registers
- Provide decode for vi6_disp_irq_sta
- Remove LookUpTable registers as they are not available on all cells
- Provide IRQ Enable status as well as level status

v1.4
- Move debugfs init/clean to probe/remove
- use devname(dev) to create the VSP debugfs root dir
- Remove 'Hard PM lock' which kept VSP's permanantly clocked

V1.5:
 - Add 'pipe' reporting to start looking at other internals.
 - Also adds 'RPF' iterations to examine there
 - checkpatch.pl fixups (most of them at least)

v1.6:
 - Convert to seq_file usage (much nicer)
 - Temporarily drop HISTO registers until mainline catches up

1.7:
 - convert WPF IRQ STA/ENB decodes to seq_printf helpers
 - reformat the DISP helper spacing
 - convert to using decode_vi6_disp_irq_sta now it's relevant
 - Simplify DEBUGFS_RO_ATTR macro
 - Provide seq_file based vsp1_reg_decode()

1.8:
 - Rebase to 5.12
 - Remove registers not in mainline
 - Adapt to register updates which now take parameters
 - Make local functions static
 - Add Writeback mode decode
 - Fix newlines, don't repeat the register value

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/Makefile  |   1 +
 drivers/media/platform/renesas/vsp1/vsp1.h    |   4 +
 .../platform/renesas/vsp1/vsp1_debugfs.c      | 508 ++++++++++++++++++
 .../platform/renesas/vsp1/vsp1_debugfs.h      |  49 ++
 .../media/platform/renesas/vsp1/vsp1_drv.c    |   5 +
 5 files changed, 567 insertions(+)
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
 create mode 100644 drivers/media/platform/renesas/vsp1/vsp1_debugfs.h

diff --git a/drivers/media/platform/renesas/vsp1/Makefile b/drivers/media/platform/renesas/vsp1/Makefile
index 4bb4dcbef7b5..33c7250fd03b 100644
--- a/drivers/media/platform/renesas/vsp1/Makefile
+++ b/drivers/media/platform/renesas/vsp1/Makefile
@@ -6,5 +6,6 @@ vsp1-y					+= vsp1_clu.o vsp1_hsit.o vsp1_lut.o
 vsp1-y					+= vsp1_brx.o vsp1_sru.o vsp1_uds.o
 vsp1-y					+= vsp1_hgo.o vsp1_hgt.o vsp1_histo.o
 vsp1-y					+= vsp1_lif.o vsp1_uif.o
+vsp1-$(CONFIG_DEBUG_FS)			+= vsp1_debugfs.o
 
 obj-$(CONFIG_VIDEO_RENESAS_VSP1)	+= vsp1.o
diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 37cf33c7e6ca..1951d350b60a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -9,6 +9,7 @@
 #ifndef __VSP1_H__
 #define __VSP1_H__
 
+#include <linux/debugfs.h>
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -103,6 +104,9 @@ struct vsp1_device {
 	struct media_entity_operations media_ops;
 
 	struct vsp1_drm *drm;
+
+	struct debugfs_regset32 regset;
+	struct dentry *dbgroot;
 };
 
 int vsp1_device_get(struct vsp1_device *vsp1);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
new file mode 100644
index 000000000000..4e361fd4c445
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.c
@@ -0,0 +1,508 @@
+/*
+ * vsp1_debugfs.c  --  R-Car VSP1 driver debug support
+ *
+ * Copyright (C) 2016 Renesas Electronics Corporation
+ *
+ * Contact: Kieran Bingham (kieran.bingham@ideasonboard.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+
+#include "vsp1.h"
+#include "vsp1_rwpf.h"
+#include "vsp1_pipe.h"
+
+#include "vsp1_debugfs.h"
+
+/* -----------------------------------------------------------------------------
+ * Data Tables
+ */
+
+/*
+ * Register maps can be generated with something similar to this expression:
+ *  cat vsp1_regs.h | \
+ *	grep -E "#define VI6_.*0[xX][0-9a-fA-F]{4}$" | \
+ *	sed -r 's/^#define (VI6\w*).*$/\tVSP1_DBFS_REG(\1),/'
+ */
+
+/* Do not use __stringify() here as that will expand the macros */
+#define VSP1_DBFS_REG(reg) { #reg, reg, NULL }
+#define VSP1_DBFS_REG_DECODE(reg, func)  { #reg, reg, func }
+
+static void decode_vi6_status(struct seq_file *s, u32 val)
+{
+	seq_printf(s, " WPF0 = %s : WPF1 = %s",
+		   val & VI6_STATUS_SYS_ACT(0) ? "active" : "inactive",
+		   val & VI6_STATUS_SYS_ACT(1) ? "active" : "inactive");
+}
+
+static void decode_vi6_disp_irq_sta(struct seq_file *s, u32 val)
+{
+	seq_printf(s, " %s%s%s%s%s%s%s",
+		   val & VI6_DISP_IRQ_STA_DST ? " DST" : "",
+		   val & VI6_DISP_IRQ_STA_MAE ? " MAE" : "",
+		   val & VI6_DISP_IRQ_STA_LNE(0) ? " LNE(0)" : "",
+		   val & VI6_DISP_IRQ_STA_LNE(1) ? " LNE(1)" : "",
+		   val & VI6_DISP_IRQ_STA_LNE(2) ? " LNE(2)" : "",
+		   val & VI6_DISP_IRQ_STA_LNE(3) ? " LNE(3)" : "",
+		   val & VI6_DISP_IRQ_STA_LNE(4) ? " LNE(4)" : "");
+}
+
+static void decode_vi6_wpf_enb(struct seq_file *s, u32 enable)
+{
+	seq_printf(s, " %s%s%s",
+		   enable & VI6_WPF_IRQ_ENB_UNDE ? " UND" : "",
+		   enable & VI6_WPF_IRQ_ENB_DFEE ? " DFE" : "",
+		   enable & VI6_WPF_IRQ_ENB_FREE ? " FRE" : "");
+}
+
+static void decode_vi6_wpf_sta(struct seq_file *s, u32 status)
+{
+	seq_printf(s, " %s%s%s",
+		   status & VI6_WPF_IRQ_STA_UND ? " UND" : "",
+		   status & VI6_WPF_IRQ_STA_DFE ? " DFE" : "",
+		   status & VI6_WPF_IRQ_STA_FRE ? " FRE" : "");
+}
+
+static void decode_vi6_wpf_wrbck_ctrl(struct seq_file *s, u32 reg)
+{
+	seq_printf(s, " %s",
+		   reg & VI6_WPF_WRBCK_CTRL_WBMD ? " WBMD" : "");
+}
+
+/* RPF is a special case that defines multiple sets of the same registers */
+#define VSP1_DBFS_RPF_REG(reg, idx) \
+	{ #reg "[" #idx "]", (reg + idx * VI6_RPF_OFFSET), NULL }
+
+#define VSP1_DBFS_RPF(index) \
+	\
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRC_BSIZE, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRC_ESIZE, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_INFMT, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_DSWAP, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_LOC, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_ALPH_SEL, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_VRTCOL_SET, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_MSK_CTRL, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_MSK_SET0, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_MSK_SET1, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_CKEY_CTRL, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_CKEY_SET0, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_CKEY_SET1, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_PSTRIDE, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_ASTRIDE, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_ADDR_Y, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_ADDR_C0, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_ADDR_C1, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_SRCM_ADDR_AI, index), \
+	VSP1_DBFS_RPF_REG(VI6_RPF_MULT_ALPHA, index)
+
+static const struct debugfs_reg32 vsp1_regset[] = {
+	VSP1_DBFS_REG(VI6_CMD(0)),
+	VSP1_DBFS_REG(VI6_CMD(1)),
+
+	VSP1_DBFS_REG(VI6_CLK_DCSWT),
+
+	VSP1_DBFS_REG(VI6_SRESET),
+
+	VSP1_DBFS_REG_DECODE(VI6_STATUS, decode_vi6_status),
+
+	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_ENB(0), decode_vi6_wpf_enb),
+	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_ENB(1), decode_vi6_wpf_enb),
+	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_STA(0), decode_vi6_wpf_sta),
+	VSP1_DBFS_REG_DECODE(VI6_WPF_IRQ_STA(1), decode_vi6_wpf_sta),
+
+	VSP1_DBFS_REG(VI6_DISP_IRQ_ENB(0)),
+	VSP1_DBFS_REG(VI6_DISP_IRQ_ENB(1)),
+
+	VSP1_DBFS_REG_DECODE(VI6_DISP_IRQ_STA(0), decode_vi6_disp_irq_sta),
+	VSP1_DBFS_REG_DECODE(VI6_DISP_IRQ_STA(1), decode_vi6_disp_irq_sta),
+
+	VSP1_DBFS_REG(VI6_DL_CTRL),
+	VSP1_DBFS_REG(VI6_DL_SWAP),
+	VSP1_DBFS_REG(VI6_DL_EXT_CTRL(0)),
+	VSP1_DBFS_REG(VI6_DL_EXT_CTRL(1)),
+
+	VSP1_DBFS_REG(VI6_DL_BODY_SIZE),
+
+	VSP1_DBFS_RPF(0),
+	VSP1_DBFS_RPF(1),
+	VSP1_DBFS_RPF(2),
+	VSP1_DBFS_RPF(3),
+	VSP1_DBFS_RPF(4),
+
+	VSP1_DBFS_REG(VI6_WPF_SRCRPF),
+	VSP1_DBFS_REG(VI6_WPF_HSZCLIP),
+	VSP1_DBFS_REG(VI6_WPF_VSZCLIP),
+	VSP1_DBFS_REG(VI6_WPF_OUTFMT),
+	VSP1_DBFS_REG(VI6_WPF_DSWAP),
+	VSP1_DBFS_REG(VI6_WPF_RNDCTRL),
+	VSP1_DBFS_REG(VI6_WPF_ROT_CTRL),
+	VSP1_DBFS_REG(VI6_WPF_DSTM_STRIDE_Y),
+	VSP1_DBFS_REG(VI6_WPF_DSTM_STRIDE_C),
+	VSP1_DBFS_REG(VI6_WPF_DSTM_ADDR_Y),
+	VSP1_DBFS_REG(VI6_WPF_DSTM_ADDR_C0),
+	VSP1_DBFS_REG(VI6_WPF_DSTM_ADDR_C1),
+
+	VSP1_DBFS_REG_DECODE(VI6_WPF_WRBCK_CTRL(0), decode_vi6_wpf_wrbck_ctrl),
+
+	VSP1_DBFS_REG(VI6_DPR_RPF_ROUTE(0)),
+	VSP1_DBFS_REG(VI6_DPR_RPF_ROUTE(1)),
+	VSP1_DBFS_REG(VI6_DPR_RPF_ROUTE(2)),
+	VSP1_DBFS_REG(VI6_DPR_RPF_ROUTE(3)),
+	VSP1_DBFS_REG(VI6_DPR_RPF_ROUTE(4)),
+
+	VSP1_DBFS_REG(VI6_DPR_WPF_FPORCH(0)),
+	VSP1_DBFS_REG(VI6_DPR_WPF_FPORCH(1)),
+
+	VSP1_DBFS_REG(VI6_DPR_SRU_ROUTE),
+
+	VSP1_DBFS_REG(VI6_DPR_UDS_ROUTE(0)),
+
+	VSP1_DBFS_REG(VI6_DPR_LUT_ROUTE),
+	VSP1_DBFS_REG(VI6_DPR_CLU_ROUTE),
+	VSP1_DBFS_REG(VI6_DPR_HST_ROUTE),
+	VSP1_DBFS_REG(VI6_DPR_HSI_ROUTE),
+	VSP1_DBFS_REG(VI6_DPR_BRU_ROUTE),
+	VSP1_DBFS_REG(VI6_DPR_HGO_SMPPT),
+	VSP1_DBFS_REG(VI6_DPR_HGT_SMPPT),
+
+	VSP1_DBFS_REG(VI6_SRU_CTRL0),
+	VSP1_DBFS_REG(VI6_SRU_CTRL1),
+	VSP1_DBFS_REG(VI6_SRU_CTRL2),
+
+	VSP1_DBFS_REG(VI6_UDS_CTRL),
+	VSP1_DBFS_REG(VI6_UDS_SCALE),
+	VSP1_DBFS_REG(VI6_UDS_ALPTH),
+	VSP1_DBFS_REG(VI6_UDS_ALPVAL),
+	VSP1_DBFS_REG(VI6_UDS_PASS_BWIDTH),
+	VSP1_DBFS_REG(VI6_UDS_HPHASE),
+	VSP1_DBFS_REG(VI6_UDS_IPC),
+	VSP1_DBFS_REG(VI6_UDS_HSZCLIP),
+	VSP1_DBFS_REG(VI6_UDS_CLIP_SIZE),
+	VSP1_DBFS_REG(VI6_UDS_FILL_COLOR),
+
+	VSP1_DBFS_REG(VI6_LUT_CTRL),
+	VSP1_DBFS_REG(VI6_CLU_CTRL),
+	VSP1_DBFS_REG(VI6_HST_CTRL),
+	VSP1_DBFS_REG(VI6_HSI_CTRL),
+
+	VSP1_DBFS_REG(VI6_BRU_INCTRL),
+	VSP1_DBFS_REG(VI6_BRU_VIRRPF_SIZE),
+	VSP1_DBFS_REG(VI6_BRU_VIRRPF_LOC),
+	VSP1_DBFS_REG(VI6_BRU_VIRRPF_COL),
+
+	VSP1_DBFS_REG(VI6_BRU_CTRL(0)),
+	VSP1_DBFS_REG(VI6_BRU_CTRL(1)),
+	VSP1_DBFS_REG(VI6_BRU_CTRL(2)),
+	VSP1_DBFS_REG(VI6_BRU_CTRL(3)),
+	VSP1_DBFS_REG(VI6_BRU_CTRL(4)),
+
+	VSP1_DBFS_REG(VI6_BRU_BLD(0)),
+	VSP1_DBFS_REG(VI6_BRU_BLD(1)),
+	VSP1_DBFS_REG(VI6_BRU_BLD(2)),
+	VSP1_DBFS_REG(VI6_BRU_BLD(3)),
+	VSP1_DBFS_REG(VI6_BRU_BLD(4)),
+
+	VSP1_DBFS_REG(VI6_BRU_ROP),
+
+	VSP1_DBFS_REG(VI6_HGO_OFFSET),
+	VSP1_DBFS_REG(VI6_HGO_SIZE),
+	VSP1_DBFS_REG(VI6_HGO_MODE),
+	VSP1_DBFS_REG(VI6_HGO_LB_TH),
+	//VSP1_DBFS_REG(VI6_HGO_R_HISTO(0)),
+	VSP1_DBFS_REG(VI6_HGO_R_MAXMIN),
+	VSP1_DBFS_REG(VI6_HGO_R_SUM),
+	VSP1_DBFS_REG(VI6_HGO_R_LB_DET),
+	//VSP1_DBFS_REG(VI6_HGO_G_HISTO(0)),
+	VSP1_DBFS_REG(VI6_HGO_G_MAXMIN),
+	VSP1_DBFS_REG(VI6_HGO_G_SUM),
+	VSP1_DBFS_REG(VI6_HGO_G_LB_DET),
+	//VSP1_DBFS_REG(VI6_HGO_B_HISTO(0)),
+	VSP1_DBFS_REG(VI6_HGO_B_MAXMIN),
+	VSP1_DBFS_REG(VI6_HGO_B_SUM),
+	VSP1_DBFS_REG(VI6_HGO_B_LB_DET),
+	VSP1_DBFS_REG(VI6_HGO_REGRST),
+
+	VSP1_DBFS_REG(VI6_HGT_OFFSET),
+	VSP1_DBFS_REG(VI6_HGT_SIZE),
+	VSP1_DBFS_REG(VI6_HGT_MODE),
+	VSP1_DBFS_REG(VI6_HGT_LB_TH),
+	VSP1_DBFS_REG(VI6_HGT_MAXMIN),
+	VSP1_DBFS_REG(VI6_HGT_SUM),
+	VSP1_DBFS_REG(VI6_HGT_LB_DET),
+	VSP1_DBFS_REG(VI6_HGT_REGRST),
+
+	VSP1_DBFS_REG(VI6_LIF_CTRL),
+	VSP1_DBFS_REG(VI6_LIF_CSBTH),
+	VSP1_DBFS_REG(VI6_SECURITY_CTRL0),
+	VSP1_DBFS_REG(VI6_SECURITY_CTRL1),
+	VSP1_DBFS_REG(VI6_IP_VERSION),
+	/* VSP-D's don't have this and will segfault if you try to read them */
+	//VSP1_DBFS_REG(VI6_CLUT_TABLE),
+	//VSP1_DBFS_REG(VI6_LUT_TABLE),
+	//VSP1_DBFS_REG(VI6_CLU_ADDR),
+	//VSP1_DBFS_REG(VI6_CLU_DATA),
+};
+
+/*
+ * vsp1_reg_to_name
+ *
+ * Find the name of the register which matches the offset given.
+ * This function assumes that the regset has only unique offsets
+ * in the table.
+ */
+char *vsp1_reg_to_name(u32 offset)
+{
+	unsigned int i;
+	static char notfound[16];
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_regset); i++)
+		if (vsp1_regset[i].offset == offset)
+			return vsp1_regset[i].name;
+
+	snprintf(notfound, sizeof(notfound), "<0x%08x>", offset);
+	return notfound;
+}
+
+/*
+ * vsp1_reg_decode
+ *
+ * Find the name of the register which matches the offset given.
+ * This function assumes that the regset has only unique offsets
+ * in the table.
+ */
+static int vsp1_reg_decode(struct seq_file *s, u32 offset, u32 value)
+{
+	unsigned int i;
+	const struct debugfs_reg32 *reg = NULL;
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_regset); i++)
+		if (vsp1_regset[i].offset == offset) {
+			reg = &vsp1_regset[i];
+			break;
+		}
+
+	if (reg) {
+		seq_printf(s, "%0x08x : %s", value, reg->name);
+		if (reg->decode_reg)
+			reg->decode_reg(s, value);
+		seq_puts(s, "\n");
+	} else {
+		seq_printf(s, "%0x08x : <0x%08x not found>\n", value, offset);
+	}
+
+	return 0;
+}
+
+/*
+ * vsp1_reg_read_and_decode
+ *
+ * Read a register, and if available decode the value into a seq_buffer.
+ * Returns the value, and decode using seq_printf formatting, or just the value
+ * to the string buffer if no decoding is available.
+ */
+static void vsp1_reg_read_and_decode(struct vsp1_device *vsp1,
+				     struct seq_file *s,
+				     struct debugfs_reg32 *reg)
+{
+	u32 value = vsp1_read(vsp1, reg->offset);
+
+	if (reg->decode_reg)
+		return reg->decode_reg(s, value);
+
+	return seq_printf(s, "0x%08x", value);
+}
+
+/* -----------------------------------------------------------------------------
+ * Debugfs management
+ */
+
+static void vsp1_debugfs_print_vsp1_pipe(struct seq_file *seq,
+					 struct vsp1_pipeline *pipe, char *msg)
+{
+
+	if (!pipe) {
+		seq_printf(seq, "No Pipe @ %p : %s\n", pipe, msg);
+
+		return;
+	}
+
+	seq_printf(seq,	"%s Pipe %s\n", msg,
+			pipe->state == VSP1_PIPELINE_STOPPED ? "Stopped" :
+			pipe->state == VSP1_PIPELINE_STOPPING ? "Stopping" :
+			pipe->state == VSP1_PIPELINE_RUNNING ? "Running" : "X");
+
+	seq_printf(seq,	"stream_count: %d\n"
+			"buffers_ready: %d\n"
+			"sequence: %d\n"
+			"num_inputs: %d\n"
+			"partitions: %d\n",
+			pipe->stream_count,
+			pipe->buffers_ready,
+			pipe->sequence,
+			pipe->num_inputs,
+			pipe->partitions);
+
+}
+
+static int vsp1_debugfs_info(struct seq_file *s, void *p)
+{
+	struct vsp1_device *vsp1 = s->private;
+	unsigned int i;
+	u32 status;
+
+	/* Make sure all reads are with 'powered' device */
+	vsp1_device_get(vsp1);
+
+	seq_printf(s, "name: %s\n", vsp1->info->model ? vsp1->info->model : "");
+
+	status = vsp1_read(vsp1, VI6_STATUS);
+	seq_printf(s, "VI6_STATUS = 0x%08x : ", status);
+	decode_vi6_status(s, status);
+	seq_puts(s, "\n");
+
+	seq_printf(s, "VI6_WPF0_FRCNT = 0x%08x", vsp1_read(vsp1, VI6_WPF0_FRCNT));
+
+	for (i = 0; i < vsp1->info->wpf_count; ++i) {
+		struct vsp1_rwpf *wpf = vsp1->wpf[i];
+		u32 status;
+		u32 enable;
+
+		if (wpf == NULL)
+			continue;
+
+		enable = vsp1_read(vsp1, VI6_WPF_IRQ_ENB(i));
+		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
+
+		seq_printf(s, "VI6_WPF_IRQ_ENB(%d) = ", i);
+		decode_vi6_wpf_enb(s, enable);
+		seq_puts(s, "\n");
+
+		seq_printf(s, "VI6_WPF_IRQ_STA(%d) = ", i);
+		decode_vi6_wpf_sta(s, status);
+		seq_puts(s, "\n");
+
+		seq_printf(s, "WPF[%d]->entity->Pipe = %p\n", i, wpf->entity.pipe);
+		/* Report the WPF Pipe information */
+		vsp1_debugfs_print_vsp1_pipe(s, wpf->entity.pipe, "WPF");
+
+		status = vsp1_read(vsp1, VI6_DISP_IRQ_STA(i));
+		seq_printf(s, "VI6_DISP_IRQ_STA(%d) = ", i);
+		decode_vi6_disp_irq_sta(s, status);
+		seq_puts(s, "\n");
+	}
+
+	for (i = 0; i < vsp1->info->rpf_count; ++i) {
+		struct vsp1_rwpf *rpf = vsp1->rpf[i];
+
+		if (rpf == NULL)
+			continue;
+
+		seq_printf(s,
+			"RPF[%d]->entity.pipe = %p\n", i, rpf->entity.pipe);
+
+		vsp1_debugfs_print_vsp1_pipe(s, rpf->entity.pipe, "RPF");
+
+	}
+
+	vsp1_device_put(vsp1);
+
+	return 0;
+}
+DEBUGFS_RO_ATTR(vsp1_debugfs_info);
+
+static int vsp1_debugfs_regs(struct seq_file *s, void *p)
+{
+	struct vsp1_device *vsp1 = s->private;
+	unsigned int i;
+	u32 status;
+
+	/* Make sure all reads are with 'powered' device */
+	vsp1_device_get(vsp1);
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_regset); i++) {
+		const struct debugfs_reg32 *reg = &vsp1_regset[i];
+
+		status = vsp1_read(vsp1, reg->offset);
+
+		seq_printf(s, "0x%08x [%s]\n", status, reg->name);
+	}
+
+	vsp1_device_put(vsp1);
+
+	return 0;
+}
+DEBUGFS_RO_ATTR(vsp1_debugfs_regs);
+
+static int vsp1_debugfs_reset_wpf(struct seq_file *s, void *p)
+{
+	struct vsp1_device *vsp1 = s->private;
+	int ret;
+
+	/* Make sure all reads are with 'powered' device */
+	vsp1_device_get(vsp1);
+
+	/* Prints are 'before' and 'after' to preserve timing on output */
+	seq_puts(s, "Resetting WPF[0] : ");
+
+	ret = vsp1_reset_wpf(vsp1->wpf[0]->entity.vsp1,
+			     vsp1->wpf[0]->entity.index);
+	if (ret == 0)
+		seq_puts(s, "Success\n");
+	else
+		seq_puts(s, "Failed\n");
+
+	vsp1_device_put(vsp1);
+
+	return 0;
+}
+DEBUGFS_RO_ATTR(vsp1_debugfs_reset_wpf);
+
+/* Debugfs initialised after entities are created */
+int vsp1_debugfs_init(struct vsp1_device *vsp1)
+{
+	struct dentry *info_file;
+
+	vsp1->regset.regs = vsp1_regset;
+	vsp1->regset.base = vsp1->mmio;
+	vsp1->regset.nregs = ARRAY_SIZE(vsp1_regset);
+
+	vsp1->dbgroot = debugfs_create_dir(dev_name(vsp1->dev), NULL);
+	if (!vsp1->dbgroot)
+		return -ENOMEM;
+
+	/* dentry pointer discarded */
+	info_file = debugfs_create_file("info", 0444,
+						 vsp1->dbgroot,
+						 vsp1,
+						 &vsp1_debugfs_info_fops);
+
+	/* dentry pointer discarded */
+	info_file = debugfs_create_file("regs_local", 0444,
+						 vsp1->dbgroot,
+						 vsp1,
+						 &vsp1_debugfs_regs_fops);
+
+	/* dentry pointer discarded */
+	info_file = debugfs_create_file("reset_wpf0", 0444,
+						 vsp1->dbgroot,
+						 vsp1,
+						 &vsp1_debugfs_reset_wpf_fops);
+
+	debugfs_create_regset32("regs", 0444, vsp1->dbgroot, &vsp1->regset);
+
+	return 0;
+}
+
+void vsp1_debugfs_remove(struct vsp1_device *vsp1)
+{
+	debugfs_remove_recursive(vsp1->dbgroot);
+	vsp1_device_put(vsp1);
+}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h
new file mode 100644
index 000000000000..c2a7f232ed44
--- /dev/null
+++ b/drivers/media/platform/renesas/vsp1/vsp1_debugfs.h
@@ -0,0 +1,49 @@
+/*
+ * vsp1_debugfs.h  --  R-Car VSP1 DebugFS system
+ *
+ * Copyright (C) 2016 Renesas Corporation
+ *
+ * Contact: Kieran Bingham (kieran.bingham@ideasonboard.com)
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef __VSP1_DEBUGFS_H__
+#define __VSP1_DEBUGFS_H__
+
+/*
+ * Helper for creating seq_file operations
+ */
+#define DEBUGFS_RO_ATTR(name) \
+	static int name##_open(struct inode *inode, struct file *file) \
+	{ return single_open(file, name, inode->i_private); }      \
+	static const struct file_operations name##_fops = { \
+		.owner = THIS_MODULE, \
+		.open = name##_open, \
+		.llseek = seq_lseek, \
+		.read = seq_read, \
+		.release = single_release \
+	}
+
+#ifdef CONFIG_DEBUG_FS
+int vsp1_debugfs_init(struct vsp1_device *vsp1);
+void vsp1_debugfs_remove(struct vsp1_device *vsp1);
+char *vsp1_reg_to_name(u32 offset);
+#else
+static inline int vsp1_debugfs_init(struct vsp1_device *vsp1)
+{
+	return 0;
+}
+
+static inline void vsp1_debugfs_remove(struct vsp1_device *vsp1) { };
+
+static inline char *vsp1_reg_to_name(u32 offset)
+{
+	return "<>";
+}
+#endif /* CONFIG_DEBUG_FS */
+
+#endif /* __VSP1_DEBUGFS_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 392aced46758..29434dcd16b4 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -24,6 +24,7 @@
 #include "vsp1.h"
 #include "vsp1_brx.h"
 #include "vsp1_clu.h"
+#include "vsp1_debugfs.h"
 #include "vsp1_dl.h"
 #include "vsp1_drm.h"
 #include "vsp1_hgo.h"
@@ -897,6 +898,9 @@ static int vsp1_probe(struct platform_device *pdev)
 		goto done;
 	}
 
+	/* Register Debug File System before entities. */
+	vsp1_debugfs_init(vsp1);
+
 	/* Instantiate entities. */
 	ret = vsp1_create_entities(vsp1);
 	if (ret < 0) {
@@ -918,6 +922,7 @@ static int vsp1_remove(struct platform_device *pdev)
 	struct vsp1_device *vsp1 = platform_get_drvdata(pdev);
 
 	vsp1_destroy_entities(vsp1);
+	vsp1_debugfs_remove(vsp1);
 	rcar_fcp_put(vsp1->fcp);
 
 	pm_runtime_disable(&pdev->dev);
-- 
2.34.1

