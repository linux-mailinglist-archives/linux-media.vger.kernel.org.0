Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E944DE95C
	for <lists+linux-media@lfdr.de>; Sat, 19 Mar 2022 17:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243672AbiCSQdL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Mar 2022 12:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243665AbiCSQdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Mar 2022 12:33:10 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A295423F9CD
        for <linux-media@vger.kernel.org>; Sat, 19 Mar 2022 09:31:49 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0CD0C2A45;
        Sat, 19 Mar 2022 17:31:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647707497;
        bh=nj/blFB/n9OM+/afYrTTRQo6QXh/7cSgfL9P07S2rqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Og+xD3k5LAEPQSPxi/uq+aDg+8K7myDE1tK7h0OxRJwRPVNSaOt0H8IV+2N6ZWD6y
         F9WITXD/F1GxXmGHP2HbdZfn0CH5/t5jkzzkv8X6u3FdfoEvD6Eu4whkdFSjj4u1eS
         3wpE5I5R5N0UAatF5uAZPjH3S4e26Ol1Mxk2WqU0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v3 16/17] media: rkisp1: debug: Move resizer register dump to debugfs
Date:   Sat, 19 Mar 2022 18:30:59 +0200
Message-Id: <20220319163100.3083-17-laurent.pinchart@ideasonboard.com>
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

The debugfs support already includes support to dump core and ISP
registers. Move the resizer register dump there too to make the
userspace interface consistent.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 48 +++++++++++++++++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c | 37 --------------
 2 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index 97be529a74e8..c89779daf319 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -81,6 +81,50 @@ static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
 
+#define RKISP1_DEBUG_RSZ_REG_DEC(name) { \
+	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, false \
+}
+
+#define RKISP1_DEBUG_RSZ_REG_HEX(name) { \
+	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, true \
+}
+
+static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
+{
+	static const struct {
+		u32 reg;
+		u32 shadow;
+		const char * const name;
+		bool hex;
+	} registers[] = {
+		RKISP1_DEBUG_RSZ_REG_HEX(RSZ_CTRL),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HY),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCB),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCR),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VY),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VC),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HY),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HC),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VY),
+		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VC),
+		{ /* Sentinel */ },
+	};
+
+	struct rkisp1_resizer *rsz = m->private;
+	typeof(registers[0]) *reg;
+	u32 val, shd;
+
+	for (reg = registers; reg->name; ++reg) {
+		val = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->reg);
+		shd = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->shadow);
+		seq_printf(m, reg->hex ? "%14s: 0x%08x/0x%08x\n" : "%14s: %u/%u\n",
+			   reg->name, val, shd);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
+
 #define RKISP1_DEBUG_DATA_COUNT_BINS	32
 #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
 
@@ -168,6 +212,10 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 			    &rkisp1_debug_dump_core_regs_fops);
 	debugfs_create_file("isp", 0444, regs_dir, rkisp1,
 			    &rkisp1_debug_dump_isp_regs_fops);
+	debugfs_create_file("mrsz", 0444, regs_dir, &rkisp1->resizer_devs[0],
+			    &rkisp1_debug_dump_rsz_regs_fops);
+	debugfs_create_file("srsz", 0444, regs_dir, &rkisp1->resizer_devs[1],
+			    &rkisp1_debug_dump_rsz_regs_fops);
 }
 
 void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index ac1b357a2a3a..1c07985c810d 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -203,41 +203,6 @@ static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz)
  * Resizer hw configs
  */
 
-static void rkisp1_rsz_dump_regs(struct rkisp1_resizer *rsz)
-{
-	dev_dbg(rsz->rkisp1->dev,
-		"RSZ_CTRL 0x%08x/0x%08x\n"
-		"RSZ_SCALE_HY %d/%d\n"
-		"RSZ_SCALE_HCB %d/%d\n"
-		"RSZ_SCALE_HCR %d/%d\n"
-		"RSZ_SCALE_VY %d/%d\n"
-		"RSZ_SCALE_VC %d/%d\n"
-		"RSZ_PHASE_HY %d/%d\n"
-		"RSZ_PHASE_HC %d/%d\n"
-		"RSZ_PHASE_VY %d/%d\n"
-		"RSZ_PHASE_VC %d/%d\n",
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_CTRL_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HY),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HY_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCB),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCB_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCR),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_HCR_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VY),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VY_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VC),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_SCALE_VC_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HY),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HY_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HC),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_HC_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VY),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VY_SHD),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VC),
-		rkisp1_rsz_read(rsz, RKISP1_CIF_RSZ_PHASE_VC_SHD));
-}
-
 static void rkisp1_rsz_update_shadow(struct rkisp1_resizer *rsz,
 				     enum rkisp1_shadow_regs_when when)
 {
@@ -386,8 +351,6 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 
 	/* set values in the hw */
 	rkisp1_rsz_config_regs(rsz, &sink_y, &sink_c, &src_y, &src_c, when);
-
-	rkisp1_rsz_dump_regs(rsz);
 }
 
 /* ----------------------------------------------------------------------------
-- 
Regards,

Laurent Pinchart

