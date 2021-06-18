Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC9D13AD017
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 18:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235764AbhFRQNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 12:13:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46020 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbhFRQM5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 12:12:57 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E3B13F0;
        Fri, 18 Jun 2021 18:10:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624032645;
        bh=ZUUnIZCdqI+fJJ51gDH4HLFyC6AaCU1jWFz/QYttD34=;
        h=From:To:Cc:Subject:Date:From;
        b=ow31FCrjmgvuzIJ0e48gt0Y/T5V+orHDkyZXDqj69Qgh5LgNEdL3wJWJSaRagDK8c
         ZRzG0DzQbx5Q2ZskD0el58FD8Q15LY0vkeC/Ab9U/1lB46daJ7a556CVupUCwnEys2
         1BJZsGNfHgR80RXUwm4+r5CBFgqAuJesDZ3LEjac=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] media: vsp1: Fix WPF macro names
Date:   Fri, 18 Jun 2021 17:10:41 +0100
Message-Id: <20210618161041.444987-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The WPF IRQ enable and status macros have been incorrectly named WFP.
Fix them accordingly, and update all uses of the macros.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/vsp1/vsp1_drv.c  | 4 ++--
 drivers/media/platform/vsp1/vsp1_regs.h | 8 ++++----
 drivers/media/platform/vsp1/vsp1_wpf.c  | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index de442d6c9926..1018786d0437 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -44,7 +44,7 @@
 
 static irqreturn_t vsp1_irq_handler(int irq, void *data)
 {
-	u32 mask = VI6_WFP_IRQ_STA_DFE | VI6_WFP_IRQ_STA_FRE;
+	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
@@ -59,7 +59,7 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
 		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
 
-		if (status & VI6_WFP_IRQ_STA_DFE) {
+		if (status & VI6_WPF_IRQ_STA_DFE) {
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
 		}
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index fe3130db1fa2..97942436868c 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -32,12 +32,12 @@
 #define VI6_STATUS_SYS_ACT(n)		BIT((n) + 8)
 
 #define VI6_WPF_IRQ_ENB(n)		(0x0048 + (n) * 12)
-#define VI6_WFP_IRQ_ENB_DFEE		BIT(1)
-#define VI6_WFP_IRQ_ENB_FREE		BIT(0)
+#define VI6_WPF_IRQ_ENB_DFEE		BIT(1)
+#define VI6_WPF_IRQ_ENB_FREE		BIT(0)
 
 #define VI6_WPF_IRQ_STA(n)		(0x004c + (n) * 12)
-#define VI6_WFP_IRQ_STA_DFE		BIT(1)
-#define VI6_WFP_IRQ_STA_FRE		BIT(0)
+#define VI6_WPF_IRQ_STA_DFE		BIT(1)
+#define VI6_WPF_IRQ_STA_FRE		BIT(0)
 
 #define VI6_DISP_IRQ_ENB(n)		(0x0078 + (n) * 60)
 #define VI6_DISP_IRQ_ENB_DSTE		BIT(8)
diff --git a/drivers/media/platform/vsp1/vsp1_wpf.c b/drivers/media/platform/vsp1/vsp1_wpf.c
index 208498fa6ed7..94e91d7bb56c 100644
--- a/drivers/media/platform/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/vsp1/vsp1_wpf.c
@@ -342,7 +342,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	/* Enable interrupts. */
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
-			   VI6_WFP_IRQ_ENB_DFEE);
+			   VI6_WPF_IRQ_ENB_DFEE);
 
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is
-- 
2.30.2

