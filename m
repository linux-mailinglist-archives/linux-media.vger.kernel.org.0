Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4374DE95B
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243663AbiCSQdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243666AbiCSQdI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:33:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA7823F9E2
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:47 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48E932A35;
        Sat, 19 Mar 2022 17:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707496;
        bh=iP+j7vcreAqX5sNCfjpOyRLUonV1gD6hdqRs/H+2JAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XQjQmhVSOx9Irrx5TeZ5PyUgh47pcQlMQhSrE1Oz9RpTh97JRWVwoXdSj6KSKJL/R
         CpnkifBbagIMr8Ej5f2+pu02hjrZGkLf86x7VPnlBYPdsCkkQA3B/1Cthsc1ZoOuR0
         l8nS7pdqrJXKUHJcsX8WIfGlfJ9wZujrsCIWrmcw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 15/17] media: rkisp1: debug: Add debugfs files to dump core and ISP registers
Date:   Sat, 19 Mar 2022 18:30:58 +0200
Message-Id: <20220319163100.3083-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
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
Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index da3ed0ab697a..97be529a74e8 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -17,6 +17,70 @@
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
+	int ret;
+
+	ret = pm_runtime_get_if_in_use(rkisp1->dev);
+	if (ret)
+		return ret;
+
+	for ( ; regs->name; ++regs) {
+		val = rkisp1_read(rkisp1, regs->offset);
+		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+	}
+
+	pm_runtime_put(rkisp1->dev);
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
 
@@ -68,6 +132,7 @@ DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
 void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_debug *debug = &rkisp1->debug;
+	struct dentry *regs_dir;
 
 	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
 
@@ -96,6 +161,13 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
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

