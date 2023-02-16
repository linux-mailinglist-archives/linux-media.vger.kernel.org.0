Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA89699043
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 10:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjBPJnG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 04:43:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjBPJmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 04:42:43 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE26A448E;
        Thu, 16 Feb 2023 01:42:28 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30DAC10B;
        Thu, 16 Feb 2023 10:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676540547;
        bh=eKxWdPFgEOGh5kPG01BBdnGLaOxx/dIjFRiz8NUtThE=;
        h=From:To:Cc:Subject:Date:From;
        b=EZKUwgJaw6MsJ8mB4OSaTsIzaRT8Pz9ebI9oNVmCOTW9XXe0QlhOPGb6baqx2gqH7
         fLTvA9M4HEUO8oMnuaDp9MIwPLkK7YYzKVT97n1XaWj47DKVT/CUYtRCeQ4FtYPGS3
         ALgBS+n1YdvqJz0MLdJIFbgkePSVYKacTz8yqOro=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH] media: renesas: vsp1: Align VSPD startup to HW manual
Date:   Thu, 16 Feb 2023 11:42:05 +0200
Message-Id: <20230216094205.151375-1-tomi.valkeinen+renesas@ideasonboard.com>
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

From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

The hardware manual states that after setting VI6_CMD0.STRCMD to 1, we
need to wait until VI6_DISP0_IRQ_STA.DST is set before proceeding. The
driver is missing this wait.

Add the wait with readl_poll_timeout, because:
1) The VI6_DISP0_IRQ_STA.DST bit is usually set more or less immediately
   after setting the VI6_CMD0.STRCMD (i.e. the first test passes).
2) While we have an interrupt handler, we never enable nor handle the
   VI6_DISP0_IRQ interrupts.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_drm.c    | 19 ++++++++++++++++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   |  7 ++++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |  2 +-
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index 5da1bc991750..767ebab65114 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
 #include <linux/slab.h>
 
 #include <media/media-entity.h>
@@ -648,7 +649,9 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	struct vsp1_pipeline *pipe;
 	unsigned long flags;
 	unsigned int i;
+	bool started;
 	int ret;
+	u32 v;
 
 	if (pipe_index >= vsp1->info->lif_count)
 		return -EINVAL;
@@ -757,11 +760,25 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 	if (ret < 0)
 		return ret;
 
+	/* Clear VI6_DISP_IRQ_STA_DST flag */
+	v = vsp1_read(vsp1, VI6_DISP_IRQ_STA(pipe->output->entity.index));
+	vsp1_write(vsp1, VI6_DISP_IRQ_STA(pipe->output->entity.index),
+		   ~v & VI6_DISP_IRQ_STA_DST);
+
 	/* Start the pipeline. */
 	spin_lock_irqsave(&pipe->irqlock, flags);
-	vsp1_pipeline_run(pipe);
+	started = vsp1_pipeline_run(pipe);
 	spin_unlock_irqrestore(&pipe->irqlock, flags);
 
+	if (started) {
+		/* Wait for VI6_DISP_IRQ_STA_DST flag */
+		ret = readl_poll_timeout(vsp1->mmio + VI6_DISP_IRQ_STA(pipe->output->entity.index),
+			v, v & VI6_DISP_IRQ_STA_DST, 1,  100 * USEC_PER_MSEC);
+		if (ret)
+			dev_warn(vsp1->dev,
+				 "Timeout waiting for VI6_DISP_IRQ_STA_DST\n");
+	}
+
 	dev_dbg(vsp1->dev, "%s: pipeline enabled\n", __func__);
 
 	return 0;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f8093ba9539e..87f97d2d5773 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -302,17 +302,22 @@ void vsp1_pipeline_init(struct vsp1_pipeline *pipe)
 }
 
 /* Must be called with the pipe irqlock held. */
-void vsp1_pipeline_run(struct vsp1_pipeline *pipe)
+bool vsp1_pipeline_run(struct vsp1_pipeline *pipe)
 {
 	struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
+	bool started = false;
 
 	if (pipe->state == VSP1_PIPELINE_STOPPED) {
 		vsp1_write(vsp1, VI6_CMD(pipe->output->entity.index),
 			   VI6_CMD_STRCMD);
 		pipe->state = VSP1_PIPELINE_RUNNING;
+
+		started = true;
 	}
 
 	pipe->buffers_ready = 0;
+
+	return started;
 }
 
 bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe)
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 674b5748d929..5a7b38efa67a 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -155,7 +155,7 @@ struct vsp1_pipeline {
 void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
 void vsp1_pipeline_init(struct vsp1_pipeline *pipe);
 
-void vsp1_pipeline_run(struct vsp1_pipeline *pipe);
+bool vsp1_pipeline_run(struct vsp1_pipeline *pipe);
 bool vsp1_pipeline_stopped(struct vsp1_pipeline *pipe);
 int vsp1_pipeline_stop(struct vsp1_pipeline *pipe);
 bool vsp1_pipeline_ready(struct vsp1_pipeline *pipe);
-- 
2.34.1

