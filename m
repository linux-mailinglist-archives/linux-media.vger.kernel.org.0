Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D1A6ED935
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 02:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232384AbjDYALE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 20:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbjDYALD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 20:11:03 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F806A69
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 17:10:56 -0700 (PDT)
Received: from localhost.localdomain (node-1w7jr9st5p2etziuntaazujnj.ipv6.telus.net [IPv6:2001:569:beb1:1500:c96f:992f:7c34:9ff])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: dbrouwer)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C9376603298;
        Tue, 25 Apr 2023 01:10:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1682381455;
        bh=9Kj1teMjASAU9SFgb6T2v3J35BQnyDPb3Oi979XBx3Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Z1uvOY30mmxJvyQrkpPrUqYLOrphTkyEEW2bKKXlTWowjtv/QrV0CYDmhQKi8nAy5
         YeoNBrg2YrfR7vYXW9wuzgAdYMCX4tpHgjDLY3p+16Rl7iW1zfFiiMeRpE/a6jO+sb
         sQqs9POWnULdxlSF7/Zt10WOOgcCH1f6YCoGkw44Zww0uJdvtn3V3cldHYQeDhP4WL
         7Fl5I/4w6AmDzUXHOyOufa5YNUJaCGqszoPqPZoX5t7jKkbUF/ZyWXSt6o1GowDTnH
         o9jqHul6aeHRNOZFpUccJcs4lpkDAVLuN5XUZLUB5T0BnVb77nhSiWsAUpoILpy3V0
         Og9tkEr3h3IFQ==
From:   Deborah Brouwer <deborah.brouwer@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Deborah Brouwer <deborah.brouwer@collabora.com>
Subject: [PATCH 11/13] media: bttv: refactor bttv_set_dma()
Date:   Mon, 24 Apr 2023 17:10:10 -0700
Message-Id: <61d01a118bc3458767e6fde0810fb761aa02c04a.1682379348.git.deborah.brouwer@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1682379348.git.deborah.brouwer@collabora.com>
References: <cover.1682379348.git.deborah.brouwer@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_PDS_OTHER_BAD_TLD,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
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
 drivers/media/pci/bt8xx/bttv-risc.c | 109 ++++++++++++++++++----------
 drivers/media/pci/bt8xx/bttvp.h     |   1 -
 2 files changed, 70 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/bt8xx/bttv-risc.c b/drivers/media/pci/bt8xx/bttv-risc.c
index 97248e340a28..697924b3dc11 100644
--- a/drivers/media/pci/bt8xx/bttv-risc.c
+++ b/drivers/media/pci/bt8xx/bttv-risc.c
@@ -360,56 +360,87 @@ bttv_apply_geo(struct bttv *btv, struct bttv_geometry *geo, int odd)
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
+static int bttv_set_capture_control(struct bttv *btv, int override)
+{
+	int capctl = 0;
+
+	if (btv->curr.top || btv->curr.bottom)
+		capctl = (BT848_CAP_CTL_CAPTURE_ODD |
+			  BT848_CAP_CTL_CAPTURE_EVEN);
 
-	btv->cap_ctl = 0;
-	if (NULL != btv->curr.top)      btv->cap_ctl |= 0x02;
-	if (NULL != btv->curr.bottom)   btv->cap_ctl |= 0x01;
-	if (NULL != btv->cvbi)          btv->cap_ctl |= 0x0c;
+	if (btv->cvbi)
+		capctl |= (BT848_CAP_CTL_CAPTURE_VBI_ODD |
+			   BT848_CAP_CTL_CAPTURE_VBI_EVEN);
 
-	capctl  = 0;
-	capctl |= (btv->cap_ctl & 0x03) ? 0x03 : 0x00;  /* capture  */
-	capctl |= (btv->cap_ctl & 0x0c) ? 0x0c : 0x00;  /* vbi data */
 	capctl |= override;
 
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
+void bttv_set_dma(struct bttv *btv, int override)
+{
+	int capctl = 0;
+
+	bttv_set_risc_status(btv);
+	bttv_set_irq_timer(btv);
+	capctl = bttv_set_capture_control(btv, override);
+
+	if (capctl)
+		bttv_start_dma(btv);
+	else
+		bttv_stop_dma(btv);
+
 	d2printk("%d: capctl=%x lirq=%d top=%08llx/%08llx even=%08llx/%08llx\n",
 		 btv->c.nr,capctl,btv->loop_irq,
 		 btv->cvbi         ? (unsigned long long)btv->cvbi->top.dma            : 0,
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

