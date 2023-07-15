Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3960D75463E
	for <lists+linux-media@lfdr.de>; Sat, 15 Jul 2023 04:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjGOCQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Jul 2023 22:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbjGOCQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Jul 2023 22:16:43 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B212D68
        for <linux-media@vger.kernel.org>; Fri, 14 Jul 2023 19:16:42 -0700 (PDT)
Received: from db550.. (node-1w7jr9st5p2esmclet71ntnwp.ipv6.telus.net [IPv6:2001:569:beb1:1500:6f9d:3a5c:4d25:e949])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C6B716607064;
        Sat, 15 Jul 2023 03:16:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1689387401;
        bh=qx8atbQ8HHyvjS48TQIWW6DRlKyJaI4oTcXL66ehq0Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GWHDHeUF9xfgwcs5Nv5WgpLIUPMb9TNeIQZLYv/Vb+If2R0V7S4MpQn3G8x3sMk5g
         SPrqfIk9cs7jNPsVG/yl8oWDpvdk2FFh2KyE+bgoZUT0LZhZc6uunLVBuVrWAXwt9U
         A2PNDhmg4yQIOC+UfddtunPQWLn8QhEXoXxn0sXQIfBhm9xJVD4LrvfhZO1WhuPwKA
         tKLyt9t1JfgfEpi7sQbJE1s/v8J1eyRsU5DZabQX5fCLK4qSHLVyULU6IcqcEHCnF1
         ILN4SKP21tpiziiudCPUFN+JwC1wh31uxYmBg1ojNxFvd5jp6WCyckvPGeX0en1xIU
         Z/39Mks/k6vKA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, deborahbrouwer3563@gmail.com,
        Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v3 11/13] media: bttv: refactor bttv_set_dma()
Date:   Fri, 14 Jul 2023 19:16:07 -0700
Message-Id: <597cfa14973acb246dcb6b1467b8cd95c8e4e610.1689379982.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1689379982.git.deborah.brouwer@collabora.com>
References: <cover.1689379982.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Break bttv_set_dma() into several smaller, separate functions so it is
easier to read the risc and dma code. Replace numeric values with
descriptive macros. Also remove the unused field btv->cap_ctl.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
---
 drivers/media/pci/bt8xx/bttv-risc.c | 111 ++++++++++++++++++----------
 drivers/media/pci/bt8xx/bttvp.h     |   1 -
 2 files changed, 71 insertions(+), 41 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 97248e340a28..3e0dac56de54 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -360,21 +360,80 @@ bttv_apply_geo(struct bttv *btv, struct bttv_geometry *geo, int odd)
 /* ---------------------------------------------------------- */
 /* risc group / risc main loop / dma management               */
 
-void
-bttv_set_dma(struct bttv *btv, int override)
+static void bttv_set_risc_status(struct bttv *btv)
 {
-	unsigned long cmd;
-	int capctl;
+	unsigned long cmd = BT848_RISC_JUMP;
+	/*
+	 * The value of btv->loop_irq sets or resets the RISC_STATUS for video
+	 * and/or vbi by setting the value of bits [23:16] in the first dword
+	 * of the JUMP instruction:
+	 * video risc: set (1) and reset (~1)
+	 * vbi risc: set(4) and reset (~4)
+	 */
+	if (btv->loop_irq) {
+		cmd |= BT848_RISC_IRQ;
+		cmd |= (btv->loop_irq  & 0x0f) << 16;
+		cmd |= (~btv->loop_irq & 0x0f) << 20;
+	}
+	btv->main.cpu[RISC_SLOT_LOOP] = cpu_to_le32(cmd);
+}
+
+static void bttv_set_irq_timer(struct bttv *btv)
+{
+	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi)
+		mod_timer(&btv->timeout, jiffies + BTTV_TIMEOUT);
+	else
+		del_timer(&btv->timeout);
+}
+
+static int bttv_set_capture_control(struct bttv *btv, int start_capture)
+{
+	int capctl = 0;
+
+	if (btv->curr.top || btv->curr.bottom)
+		capctl = BT848_CAP_CTL_CAPTURE_ODD |
+			 BT848_CAP_CTL_CAPTURE_EVEN;
+
+	if (btv->cvbi)
+		capctl |= BT848_CAP_CTL_CAPTURE_VBI_ODD |
+			  BT848_CAP_CTL_CAPTURE_VBI_EVEN;
+
+	capctl |= start_capture;
+
+	btaor(capctl, ~0x0f, BT848_CAP_CTL);
+
+	return capctl;
+}
+
+static void bttv_start_dma(struct bttv *btv)
+{
+	if (btv->dma_on)
+		return;
+	btwrite(btv->main.dma, BT848_RISC_STRT_ADD);
+	btor(0x3, BT848_GPIO_DMA_CTL);
+	btv->dma_on = 1;
+}
+
+static void bttv_stop_dma(struct bttv *btv)
+{
+	if (!btv->dma_on)
+		return;
+	btand(~0x3, BT848_GPIO_DMA_CTL);
+	btv->dma_on = 0;
+}
+
+void bttv_set_dma(struct bttv *btv, int start_capture)
+{
+	int capctl = 0;
 
-	btv->cap_ctl = 0;
-	if (NULL != btv->curr.top)      btv->cap_ctl |= 0x02;
-	if (NULL != btv->curr.bottom)   btv->cap_ctl |= 0x01;
-	if (NULL != btv->cvbi)          btv->cap_ctl |= 0x0c;
+	bttv_set_risc_status(btv);
+	bttv_set_irq_timer(btv);
+	capctl = bttv_set_capture_control(btv, start_capture);
 
-	capctl  = 0;
-	capctl |= (btv->cap_ctl & 0x03) ? 0x03 : 0x00;  /* capture  */
-	capctl |= (btv->cap_ctl & 0x0c) ? 0x0c : 0x00;  /* vbi data */
-	capctl |= override;
+	if (capctl)
+		bttv_start_dma(btv);
+	else
+		bttv_stop_dma(btv);
 
 	d2printk("%d: capctl=%x lirq=%d top=%08llx/%08llx even=%08llx/%08llx\n",
 		 btv->c.nr,capctl,btv->loop_irq,
@@ -382,34 +441,6 @@ bttv_set_dma(struct bttv *btv, int override)
 		 btv->curr.top     ? (unsigned long long)btv->curr.top->top.dma        : 0,
 		 btv->cvbi         ? (unsigned long long)btv->cvbi->bottom.dma         : 0,
 		 btv->curr.bottom  ? (unsigned long long)btv->curr.bottom->bottom.dma  : 0);
-
-	cmd = BT848_RISC_JUMP;
-	if (btv->loop_irq) {
-		cmd |= BT848_RISC_IRQ;
-		cmd |= (btv->loop_irq  & 0x0f) << 16;
-		cmd |= (~btv->loop_irq & 0x0f) << 20;
-	}
-	if (btv->curr.frame_irq || btv->loop_irq || btv->cvbi) {
-		mod_timer(&btv->timeout, jiffies+BTTV_TIMEOUT);
-	} else {
-		del_timer(&btv->timeout);
-	}
-	btv->main.cpu[RISC_SLOT_LOOP] = cpu_to_le32(cmd);
-
-	btaor(capctl, ~0x0f, BT848_CAP_CTL);
-	if (capctl) {
-		if (btv->dma_on)
-			return;
-		btwrite(btv->main.dma, BT848_RISC_STRT_ADD);
-		btor(3, BT848_GPIO_DMA_CTL);
-		btv->dma_on = 1;
-	} else {
-		if (!btv->dma_on)
-			return;
-		btand(~3, BT848_GPIO_DMA_CTL);
-		btv->dma_on = 0;
-	}
-	return;
 }
 
 int
diff --git a/drivers/media/pci/bt8xx/bttvp.h b/drivers/media/pci/bt8xx/bttvp.h
index bce2401de9bd..b750dfbc75cc 100644
--- a/drivers/media/pci/bt8xx/bttvp.h
+++ b/drivers/media/pci/bt8xx/bttvp.h
@@ -430,7 +430,6 @@ struct bttv {
 	int                     loop_irq;
 	int                     new_input;
 
-	unsigned long cap_ctl;
 	unsigned long dma_on;
 	struct timer_list timeout;
 	struct bttv_suspend_state state;
-- 
2.40.1

