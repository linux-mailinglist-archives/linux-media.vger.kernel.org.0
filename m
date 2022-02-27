Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB9FF4C5CC5
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 17:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbiB0QC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 11:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbiB0QC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 11:02:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184D252E2C
        for <linux-media@vger.kernel.org>; Sun, 27 Feb 2022 08:01:51 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5078F993;
        Sun, 27 Feb 2022 17:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645977700;
        bh=NhVNyN/Hqu9OJYLxGrtpiTI30hGwggbAJZF6AFwFqHk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RM7PG0xcggtVaFqTKWyG9+/TRyXumYmRVPIsJyCWDHj/2fL+V8Z91hBew9BrULkPE
         C653ji+fRON3vadibAKQRWh2jLxlahqaoSHx2kK0IwjD51JVeRvd+RbCuVLYGbzBSO
         6HT/y9MUa/w0qYvBJbON643PQ6GOdTJFQxvnxVls=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 14/16] media: rkisp1: debug: Add debugfs files to dump core and ISP registers
Date:   Sun, 27 Feb 2022 18:01:14 +0200
Message-Id: <20220227160116.18556-15-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
References: <20220227160116.18556-1-laurent.pinchart@ideasonboard.com>
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

It's useful to dumb the value of registers for debugging purpose. Add
two debugfs files to dump key core and ISP registers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 8be4ac134cc9..c7872d8dc3df 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -16,6 +16,63 @@
 #include "rkisp1-common.h"
 #include "rkisp1-regs.h"
 
+struct rkisp1_debug_register {
+	u32 offset;
+	const char * const name;
+};
+
+#define RKISP1_DEBUG_REG(name)	{ RKISP1_CIF_##name, #name }
+
+static int rkisp1_debug_dump_regs(struct seq_file *m,
+				  const struct rkisp1_debug_register *regs)
+{
+	struct rkisp1_device *rkisp1 = m->private;
+	u32 val;
+
+	for ( ; regs->name; ++regs) {
+		val = rkisp1_read(rkisp1, regs->offset);
+		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+	}
+
+	return 0;
+}
+
+static int rkisp1_debug_dump_core_regs_show(struct seq_file *m, void *p)
+{
+	static const struct rkisp1_debug_register registers[] = {
+		RKISP1_DEBUG_REG(VI_CCL),
+		RKISP1_DEBUG_REG(VI_ICCL),
+		RKISP1_DEBUG_REG(VI_IRCL),
+		RKISP1_DEBUG_REG(VI_DPCL),
+		RKISP1_DEBUG_REG(MI_CTRL),
+		RKISP1_DEBUG_REG(MI_BYTE_CNT),
+		RKISP1_DEBUG_REG(MI_CTRL_SHD),
+		RKISP1_DEBUG_REG(MI_RIS),
+		RKISP1_DEBUG_REG(MI_STATUS),
+		RKISP1_DEBUG_REG(MI_DMA_CTRL),
+		RKISP1_DEBUG_REG(MI_DMA_STATUS),
+		{ /* Sentinel */ },
+	};
+
+	return rkisp1_debug_dump_regs(m, registers);
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_core_regs);
+
+static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
+{
+	static const struct rkisp1_debug_register registers[] = {
+		RKISP1_DEBUG_REG(ISP_CTRL),
+		RKISP1_DEBUG_REG(ISP_ACQ_PROP),
+		RKISP1_DEBUG_REG(ISP_FLAGS_SHD),
+		RKISP1_DEBUG_REG(ISP_RIS),
+		RKISP1_DEBUG_REG(ISP_ERR),
+		{ /* Sentinel */ },
+	};
+
+	return rkisp1_debug_dump_regs(m, registers);
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
+
 #define RKISP1_DEBUG_DATA_COUNT_BINS	32
 #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
 
@@ -60,6 +117,7 @@ DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
 void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_debug *debug = &rkisp1->debug;
+	struct dentry *regs_dir;
 
 	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
 
@@ -88,6 +146,13 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			     &debug->frame_drop[RKISP1_SELFPATH]);
 	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
 			    &rkisp1_debug_input_status_fops);
+
+	regs_dir = debugfs_create_dir("regs", debug->debugfs_dir);
+
+	debugfs_create_file("core", 0444, regs_dir, rkisp1,
+			    &rkisp1_debug_dump_core_regs_fops);
+	debugfs_create_file("isp", 0444, regs_dir, rkisp1,
+			    &rkisp1_debug_dump_isp_regs_fops);
 }
 
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
-- 
Regards,

Laurent Pinchart

