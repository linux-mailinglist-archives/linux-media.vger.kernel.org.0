Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F72E55FDEC
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiF2Kvr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232882AbiF2Kvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6BB2654D;
        Wed, 29 Jun 2022 03:51:44 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64DDB6F0;
        Wed, 29 Jun 2022 12:51:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499900;
        bh=gbwcAtFhgYh3ZS7hLicXTXvT/aorH0lPG8r5PnlH3jE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G7BDB8iD26AKOXZqNhzQB2dQv4jReyLkG0hka+cNMfJs3iGbhKQGMdQ7mcGk9uvJd
         Lwjh12otRFRk6ZuW4gz7ATfZo8FsTL3U4/6wmZI2UidvyOHHybuEJ4ExitxnsQMhiI
         uSZ2mVrRtKSdM4G6AvPpKBenUi5SXPiW/gvVbM4k=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 2/7] v4l: vsp1: Provide WPF underflow error detection and reporting
Date:   Wed, 29 Jun 2022 11:51:30 +0100
Message-Id: <20220629105135.2652773-3-kieran.bingham+renesas@ideasonboard.com>
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

In erroneous conditions, the WPF can assert an underrun interrupt. This
usually represents a mis-configured pipeline, or bus priority issue. It
is likely that in the event of this interrupt being asserted the
hardware is no longer operational. A device error message at the least
is useful in this scenario

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 8 +++++++-
 drivers/media/platform/renesas/vsp1/vsp1_regs.h | 2 ++
 drivers/media/platform/renesas/vsp1/vsp1_wpf.c  | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 1f73c48eb738..392aced46758 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -44,7 +44,8 @@
 
 static irqreturn_t vsp1_irq_handler(int irq, void *data)
 {
-	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
+	u32 mask = VI6_WPF_IRQ_STA_UND | VI6_WPF_IRQ_STA_DFE |
+		   VI6_WPF_IRQ_STA_FRE;
 	struct vsp1_device *vsp1 = data;
 	irqreturn_t ret = IRQ_NONE;
 	unsigned int i;
@@ -63,6 +64,11 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
 			vsp1_pipeline_frame_end(wpf->entity.pipe);
 			ret = IRQ_HANDLED;
 		}
+
+		if (status & VI6_WPF_IRQ_STA_UND) {
+			dev_err(vsp1->dev, "WPF[%d] Underflow error\n", i);
+			ret = IRQ_HANDLED;
+		}
 	}
 
 	return ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index fae7286eb01e..632c43bb4cbd 100644
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
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
index 94e91d7bb56c..28f01f98fd6b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
@@ -342,7 +342,7 @@ static void wpf_configure_stream(struct vsp1_entity *entity,
 	/* Enable interrupts. */
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_STA(index), 0);
 	vsp1_dl_body_write(dlb, VI6_WPF_IRQ_ENB(index),
-			   VI6_WPF_IRQ_ENB_DFEE);
+			   VI6_WPF_IRQ_ENB_DFEE | VI6_WPF_IRQ_ENB_UNDE);
 
 	/*
 	 * Configure writeback for display pipelines (the wpf writeback flag is
-- 
2.34.1

