Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72ED96F3C69
	for <lists+linux-media@lfdr.de>; Tue,  2 May 2023 05:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbjEBD2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 May 2023 23:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233475AbjEBD2M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 May 2023 23:28:12 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D93A4206
        for <linux-media@vger.kernel.org>; Mon,  1 May 2023 20:28:09 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EF12E66032AB;
        Tue,  2 May 2023 04:28:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682998088;
        bh=P4HIra8pMSwSHezU+vBIcQ0D+Uzg6FuwFfWNjN+nMFs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KIUZboaktSxQS5qlxm2Q7SQKuCz//FcwVKmQco9b11wGWvuTJKOwcYeaTyHSGmBLr
         1HKM8k2/C0bd/I5HNYv2LzoK+xF4imWEjmUJU7w/To0/06G3/gXV1EMkUUY5Xw37vQ
         qKnJSsN3LNPhgJYXzNFFXQbbS5fecK1Tim2AHqMC8FUoQNVwqHI9iewe2HJagSCQ53
         NplBoSAms3PKngErm+43PdPBv8th47TVTHpst1oEPCj3P02rsMaAsUDjSXpmhx++G2
         qcXlx08/fHafNta5hWl2BwqBeet2P5tZeD4EIiPNrunLpFsvf0M76WOz+KgNqQazBj
         TCucyMV583elA==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH v2 11/13] media: bttv: refactor bttv_set_dma()
Date:   Mon,  1 May 2023 20:27:29 -0700
Message-Id: <6ea6ccdf7fe9d97b7793a8c40a6a9abc1b185b81.1682995256.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682995256.git.deborah.brouwer@collabora.com>
References: <cover.1682995256.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
2.39.2

