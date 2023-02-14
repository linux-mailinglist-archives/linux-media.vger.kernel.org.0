Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14AB6969F8
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 17:42:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232047AbjBNQmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 11:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjBNQmq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 11:42:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FC826CED;
        Tue, 14 Feb 2023 08:42:30 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E679F3D7;
        Tue, 14 Feb 2023 17:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676392948;
        bh=oGQ9C374e9M8rLPkAAf7KKNHwc2fIZq4DrPLiTr4H9I=;
        h=From:To:Cc:Subject:Date:From;
        b=YQL9LQK58501SipjGknGPZOSM6BsK7HFWBHzDi3N0CvvL6Yt5ms7gpWF63kNLvK4S
         cm4admm2Fh1RJXAub0XpRq4nygQ/Aaeozu7pTz7ds9DXYbmKgiftBPIpKQ0nxEhF9/
         rHcxLJXMPXNEijcu+o3cSkhrB8LndJf9xnGt4wso=
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v3] media: renesas: vsp1: Add underrun debug print
Date:   Tue, 14 Feb 2023 18:42:23 +0200
Message-Id: <20230214164223.184920-1-tomi.valkeinen+renesas@ideasonboard.com>
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
---

Changes in v3:
- Reset underrun counter when enabling VSP

I have to say I'm not familiar enough with the VSP driver to say if
these are the correct places where to reset the counters. There's also a
possibility of a race, but my assumption is that we cannot get underrun
interrupts for the WPF we are currently enabling.

Also, I realized the underrun counter could be moved to struct
vsp1_rwpf, but as that's used also for RPF, I didn't do that change.

 drivers/media/platform/renesas/vsp1/vsp1.h       |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_drm.c   |  3 +++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c   | 11 ++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h  |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_video.c |  3 +++
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 2f6f0c6ae555..9eb023f4fee8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -107,6 +107,8 @@ struct vsp1_device {
 	struct media_entity_operations media_ops;
 
 	struct vsp1_drm *drm;
+
+	u32 underrun_count[VSP1_MAX_WPF];
 };
 
 int vsp1_device_get(struct vsp1_device *vsp1);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
index c6f25200982c..e3b4e993787c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
@@ -710,6 +710,9 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
 		return 0;
 	}
 
+	/* Reset the underrun counter */
+	vsp1->underrun_count[pipe->output->entity.index] = 0;
+
 	drm_pipe->width = cfg->width;
 	drm_pipe->height = cfg->height;
 	pipe->interlaced = cfg->interlaced;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 5710152d6511..f9be0fda1659 100644
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
 
+		if (status & VI6_WPF_IRQ_STA_UND) {
+			vsp1->underrun_count[i]++;
+
+			dev_warn_ratelimited(vsp1->dev,
+				"Underrun occurred at WPF%u (total underruns %u)\n",
+				i, vsp1->underrun_count[i]);
+		}
+
 		if (status & VI6_WPF_IRQ_STA_DFE) {
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
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
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 544012fd1fe9..6eca2b9c8dee 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -1062,6 +1062,9 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (ret < 0)
 		goto err_stop;
 
+	/* Reset the underrun counter */
+	video->vsp1->underrun_count[pipe->output->entity.index] = 0;
+
 	/* Start the queue. */
 	ret = vb2_streamon(&video->queue, type);
 	if (ret < 0)
-- 
2.34.1

