Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8411A68D716
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 13:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbjBGMpG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 07:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231888AbjBGMpB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 07:45:01 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07029EC9;
        Tue,  7 Feb 2023 04:44:59 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C3624AF;
        Tue,  7 Feb 2023 13:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675773897;
        bh=8dkC9XGiOaMX1q2pOqTM3dEwRIgtDFgwNebApVaPNJ0=;
        h=From:To:Cc:Subject:Date:From;
        b=vUltiSGmBvZQmEB1DAfyDbXzu1zOzcYbQKfA/fiMNOJQEZ6czx0QX34C0CRuFT6ee
         Pu4znwZdPb3NEaJkvxwiQNHfu5PwvH2GkdBwRfBw4Ec06IXyelIWm0hEP1Kyo0WIb7
         OrgJjJ6L/yDDq1/WMmddFVi86bYR6/MfyP9MoMpI=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH] media: renesas: vsp1: Add underrun debug print
Date:   Tue,  7 Feb 2023 14:44:40 +0200
Message-Id: <20230207124440.123910-1-tomi.valkeinen@ideasonboard.com>
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Print underrun interrupts with ratelimited print.

Note that we don't enable the underrun interrupt. If we have underruns,
we don't want to get flooded with interrupts about them. It's enough to
see that an underrun happened at the end of a frame.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 8 +++++++-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 5710152d6511..b24437b5b945 100644
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
@@ -60,6 +61,11 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
 		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
 
+		if (status & VI6_WPF_IRQ_STA_UND) {
+			dev_warn_ratelimited(vsp1->dev,
+					     "Underrun occurred at WPF%u\n", i);
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
 
-- 
2.34.1

