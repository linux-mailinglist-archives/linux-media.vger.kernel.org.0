Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDED350AC23
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442684AbiDUXp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442679AbiDUXp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:45:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A4438DAF
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:43:07 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C07AB8F1;
        Fri, 22 Apr 2022 01:42:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650584575;
        bh=ukobYvrMzh2AvSlSOHnNb2JpnYhVLnDjMMaL9Fp54L0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nfi6jtkcV5OdrXg5xWoFaaftxtSZyDwAyyA0EMsCXRQxZBpWhZvgDqhal0b3GI3Kq
         ZL7puGZIbTTwDCtLT3XtfpCOhPeOHPsr0mhAFzsS4Mu7DbvjoXnKJA2YjlX7505/uR
         OXzem9a36sGnQtJtOVajiUtnz7NJsgR1THfY4LRw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v4 17/21] media: rkisp1: debug: Consolidate reg dumps for shadow registers
Date:   Fri, 22 Apr 2022 02:42:36 +0300
Message-Id: <20220421234240.1694-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend the rkisp1_debug_register structure and the
rkisp1_debug_dump_regs() function to support shadow registers, and
replace the manual registers dump implementation in
rkisp1_debug_dump_rsz_regs_show() with a call to
rkisp1_debug_dump_regs().

Support for printing register values in decimal is dropped, as it was
actually confusing to print resizer register expressed as fixed-point
values in decimal.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../platform/rockchip/rkisp1/rkisp1-debug.c   | 83 ++++++++-----------
 1 file changed, 33 insertions(+), 50 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
index d6cfbfaba3cb..2c226f20f525 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
@@ -19,16 +19,20 @@
 
 struct rkisp1_debug_register {
 	u32 reg;
+	u32 shd;
 	const char * const name;
 };
 
-#define RKISP1_DEBUG_REG(name)	{ RKISP1_CIF_##name, #name }
+#define RKISP1_DEBUG_REG(name)		{ RKISP1_CIF_##name, 0, #name }
+#define RKISP1_DEBUG_SHD_REG(name) { \
+	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
+}
 
-static int rkisp1_debug_dump_regs(struct seq_file *m,
+static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
+				  struct seq_file *m, unsigned int offset,
 				  const struct rkisp1_debug_register *regs)
 {
-	struct rkisp1_device *rkisp1 = m->private;
-	u32 val;
+	u32 val, shd;
 	int ret;
 
 	ret = pm_runtime_get_if_in_use(rkisp1->dev);
@@ -36,8 +40,15 @@ static int rkisp1_debug_dump_regs(struct seq_file *m,
 		return ret ? : -ENODATA;
 
 	for ( ; regs->name; ++regs) {
-		val = rkisp1_read(rkisp1, regs->reg);
-		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+		val = rkisp1_read(rkisp1, offset + regs->reg);
+
+		if (regs->shd) {
+			shd = rkisp1_read(rkisp1, offset + regs->shd);
+			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
+				   val, shd);
+		} else {
+			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
+		}
 	}
 
 	pm_runtime_put(rkisp1->dev);
@@ -61,8 +72,9 @@ static int rkisp1_debug_dump_core_regs_show(struct seq_file *m, void *p)
 		RKISP1_DEBUG_REG(MI_DMA_STATUS),
 		{ /* Sentinel */ },
 	};
+	struct rkisp1_device *rkisp1 = m->private;
 
-	return rkisp1_debug_dump_regs(m, registers);
+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_core_regs);
 
@@ -76,59 +88,30 @@ static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
 		RKISP1_DEBUG_REG(ISP_ERR),
 		{ /* Sentinel */ },
 	};
+	struct rkisp1_device *rkisp1 = m->private;
 
-	return rkisp1_debug_dump_regs(m, registers);
+	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
 
-#define RKISP1_DEBUG_RSZ_REG_DEC(name) { \
-	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, false \
-}
-
-#define RKISP1_DEBUG_RSZ_REG_HEX(name) { \
-	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, true \
-}
-
 static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
 {
-	static const struct {
-		u32 reg;
-		u32 shadow;
-		const char * const name;
-		bool hex;
-	} registers[] = {
-		RKISP1_DEBUG_RSZ_REG_HEX(RSZ_CTRL),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HY),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCB),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCR),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VY),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VC),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HY),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HC),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VY),
-		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VC),
+	static const struct rkisp1_debug_register registers[] = {
+		RKISP1_DEBUG_SHD_REG(RSZ_CTRL),
+		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HY),
+		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HCB),
+		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HCR),
+		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_VY),
+		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_VC),
+		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_HY),
+		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_HC),
+		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VY),
+		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VC),
 		{ /* Sentinel */ },
 	};
-
 	struct rkisp1_resizer *rsz = m->private;
-	typeof(registers[0]) *reg;
-	u32 val, shd;
-	int ret;
 
-	ret = pm_runtime_get_if_in_use(rsz->rkisp1->dev);
-	if (ret <= 0)
-		return ret ? : -ENODATA;
-
-	for (reg = registers; reg->name; ++reg) {
-		val = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->reg);
-		shd = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->shadow);
-		seq_printf(m, reg->hex ? "%14s: 0x%08x/0x%08x\n" : "%14s: %u/%u\n",
-			   reg->name, val, shd);
-	}
-
-	pm_runtime_put(rsz->rkisp1->dev);
-
-	return 0;
+	return rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
 }
 DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
 
-- 
Regards,

Laurent Pinchart

