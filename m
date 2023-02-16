Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CEE69903E
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 10:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBPJmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 04:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjBPJm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 04:42:29 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76B441097;
        Thu, 16 Feb 2023 01:41:38 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72DF910B;
        Thu, 16 Feb 2023 10:41:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676540496;
        bh=Q0S64d9vQMYDFO/7cgnm2yubJSea0v1pDF/7puW+XZQ=;
        h=From:To:Cc:Subject:Date:From;
        b=DOnSDXfAZqT2dzuEMocGAS8JBQ5Y5A+AZiGN3DWHv2Bw9OV2fZFY+PV81Ej4I4Uum
         MtXerWTXqNH94KBb/k6Bli2lOSHyRHERF79mqucxAMq7kxQu2/S7AP+OhnnY5vOVda
         9vRCQHVnvQOBCj3iB2GXRJZolr9JwWy2fuTpEjqo=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4] media: renesas: vsp1: Add underrun debug print
Date:   Thu, 16 Feb 2023 11:41:15 +0200
Message-Id: <20230216094115.151189-1-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
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

Print underrun interrupts with ratelimited print.

Note that we don't enable the underrun interrupt. If we have underruns,
we don't want to get flooded with interrupts about them. It's enough to
see that an underrun happened at the end of a frame.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes in v4:
- Store underrun count in pipe

 drivers/media/platform/renesas/vsp1/vsp1_drm.c  |  3 +++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 11 ++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_pipe.h |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |  2 ++
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index c6f25200982c..5da1bc991750 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -710,6 +710,9 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		return 0;
 	}
 
+	/* Reset the underrun counter */
+	pipe->underrun_count = 0;
+
 	drm_pipe->width = cfg->width;
 	drm_pipe->height = cfg->height;
 	pipe->interlaced = cfg->interlaced;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 5710152d6511..ab8209e5b07a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -45,7 +45,8 @@
 
 static irqreturn_t vsp1_irq_handler(int irq, void *data)
 {
-	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
+	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
+		   VI6_WPF_IRQ_STA_UND;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
@@ -60,6 +61,14 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
 		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
 
+		if ((status & VI6_WPF_IRQ_STA_UND) && wpf->entity.pipe) {
+			wpf->entity.pipe->underrun_count++;
+
+			dev_warn_ratelimited(vsp1->dev,
+				"Underrun occurred at WPF%u (total underruns %u)\n",
+				i, wpf->entity.pipe->underrun_count);
+		}
+
 		if (status & VI6_WPF_IRQ_STA_DFE) {
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index ae646c9ef337..674b5748d929 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -148,6 +148,8 @@ struct vsp1_pipeline {
 	unsigned int partitions;
 	struct vsp1_partition *partition;
 	struct vsp1_partition *part_table;
+
+	u32 underrun_count;
 };
 
 void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index d94343ae57a1..7eca82e0ba7e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -32,10 +32,12 @@
 #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
 
 #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
+#define VI6_WPF_IRQ_ENB_UNDE		BIT(16)
 #define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
 #define VI6_WPF_IRQ_ENB_FREE		BIT(0)
 
 #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
+#define VI6_WPF_IRQ_STA_UND		BIT(16)
 #define VI6_WPF_IRQ_STA_DFE		BIT(1)
 #define VI6_WPF_IRQ_STA_FRE		BIT(0)
 
-- 
2.34.1

