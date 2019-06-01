Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 376CE3203D
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 19:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbfFARvs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 13:51:48 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:32788 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARvs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 13:51:48 -0400
Received: by mail-qk1-f195.google.com with SMTP id p18so8532507qkk.0
        for <linux-media@vger.kernel.org>; Sat, 01 Jun 2019 10:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E8aBgCs0cgW9VjIrxTvjzpo/jcx08bX9n2Xw93Iuv4M=;
        b=FLr+5Cpzacgn0CKelkyrVLdGGJKik81xPekStaerfSGvesHwpGaFJF3rzKI8CFcWFH
         hjHqa1fbpUJW6LsFkWvsQsP/w9U77HeIMVNmfN6NX7I1RoBr59kfLt1ctc8AyMWNbW63
         yyk0xUHqIw8vYENDwwVenKmpavA2lyG1k59vZTBk+/X4yQxzrd7GE4vee/Yzjq0wkzJz
         Zrdp21VmdAa3azZvmAsvgD5OuKVAglvHvvxWookp1W4RrVZkKWFQx3EfIRuGzg6KlaHE
         NPO6Pxw+jl6ZpxZY7XNAwCE8mi8BxuJjVgOqp6ErQPOdxWYSMl4lCcSMsU6EhA89tWXp
         RMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E8aBgCs0cgW9VjIrxTvjzpo/jcx08bX9n2Xw93Iuv4M=;
        b=ZbN+PhrhvOfTb3zVfO3IX1VlKipScEsbDOmi9kI/N1R61jFqIJgoWq0meRibjpa/9k
         9SikPNGJnCgNhxoSK3aR8tnsFSu2oRR1j/ZF/3o8XXBRKAGcahrSnmDzCVBwwFLNJ/gD
         hNkfgtNq4l0MASODi4C5sCMtBqiO0M0Xne7RvHQuuiqKNImTqWdDvl0h+sI1QtJjVEvl
         7Pofcq+P0WLtsO22FqwPwa+RrwFrJzfFtgHEqr2IDzsmgOp6a2tZlTCxNELXL+FnUOuE
         5tSAVCdzXMTJaNw1m1VJWxxwCcahOAhdS1VKokApGPZ3aHEv7cE+4dVp/qaGy7OQdQo/
         UZJQ==
X-Gm-Message-State: APjAAAX4h/gtSaDQLn+E0205/G0fxVPOPd2zJQJDnrWqy5ekMGkdRJQZ
        +W3gOSRjyF/E61IX1uRUiYg=
X-Google-Smtp-Source: APXvYqwD8uS+LVmX1ZCuaW708jWqiYEbcj8IeSPOJNoVskBNcng0e8W5bM5pchj9RJoOi6VthuzGew==
X-Received: by 2002:a37:68ca:: with SMTP id d193mr3259259qkc.240.1559411506625;
        Sat, 01 Jun 2019 10:51:46 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id v8sm1558977qkj.77.2019.06.01.10.51.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 10:51:45 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] media: imx7-media-csi: Use u32 for storing register reads
Date:   Sat,  1 Jun 2019 14:51:39 -0300
Message-Id: <20190601175140.16305-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601175140.16305-1-festevam@gmail.com>
References: <20190601175140.16305-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI registers are 32-bit, so using u32 type is more suitable
for storing the values from register reads.

Switch from 'unsigned long' to 'u32' type.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 8abdf253696d..7abea8681062 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -217,9 +217,9 @@ static void imx7_csi_hw_reset(struct imx7_csi *csi)
 	imx7_csi_reg_write(csi, CSICR3_RESET_VAL, CSI_CSICR3);
 }
 
-static unsigned long imx7_csi_irq_clear(struct imx7_csi *csi)
+static u32 imx7_csi_irq_clear(struct imx7_csi *csi)
 {
-	unsigned long isr;
+	u32 isr;
 
 	isr = imx7_csi_reg_read(csi, CSI_CSISR);
 	imx7_csi_reg_write(csi, isr, CSI_CSISR);
@@ -245,7 +245,7 @@ static void imx7_csi_init_interface(struct imx7_csi *csi)
 
 static void imx7_csi_hw_enable_irq(struct imx7_csi *csi)
 {
-	unsigned long cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
+	u32 cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 
 	cr1 |= BIT_SOF_INTEN;
 	cr1 |= BIT_RFF_OR_INT;
@@ -261,7 +261,7 @@ static void imx7_csi_hw_enable_irq(struct imx7_csi *csi)
 
 static void imx7_csi_hw_disable_irq(struct imx7_csi *csi)
 {
-	unsigned long cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
+	u32 cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 
 	cr1 &= ~BIT_SOF_INTEN;
 	cr1 &= ~BIT_RFF_OR_INT;
@@ -274,7 +274,7 @@ static void imx7_csi_hw_disable_irq(struct imx7_csi *csi)
 
 static void imx7_csi_hw_enable(struct imx7_csi *csi)
 {
-	unsigned long cr = imx7_csi_reg_read(csi, CSI_CSICR18);
+	u32 cr = imx7_csi_reg_read(csi, CSI_CSICR18);
 
 	cr |= BIT_CSI_HW_ENABLE;
 
@@ -283,7 +283,7 @@ static void imx7_csi_hw_enable(struct imx7_csi *csi)
 
 static void imx7_csi_hw_disable(struct imx7_csi *csi)
 {
-	unsigned long cr = imx7_csi_reg_read(csi, CSI_CSICR18);
+	u32 cr = imx7_csi_reg_read(csi, CSI_CSICR18);
 
 	cr &= ~BIT_CSI_HW_ENABLE;
 
@@ -292,7 +292,7 @@ static void imx7_csi_hw_disable(struct imx7_csi *csi)
 
 static void imx7_csi_dma_reflash(struct imx7_csi *csi)
 {
-	unsigned long cr3 = imx7_csi_reg_read(csi, CSI_CSICR18);
+	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR18);
 
 	cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
 	cr3 |= BIT_DMA_REFLASH_RFF;
@@ -301,7 +301,7 @@ static void imx7_csi_dma_reflash(struct imx7_csi *csi)
 
 static void imx7_csi_rx_fifo_clear(struct imx7_csi *csi)
 {
-	unsigned long cr1;
+	u32 cr1;
 
 	cr1 = imx7_csi_reg_read(csi, CSI_CSICR1);
 	imx7_csi_reg_write(csi, cr1 & ~BIT_FCC, CSI_CSICR1);
@@ -319,7 +319,7 @@ static void imx7_csi_buf_stride_set(struct imx7_csi *csi, u32 stride)
 
 static void imx7_csi_deinterlace_enable(struct imx7_csi *csi, bool enable)
 {
-	unsigned long cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
+	u32 cr18 = imx7_csi_reg_read(csi, CSI_CSICR18);
 
 	if (enable)
 		cr18 |= BIT_DEINTERLACE_EN;
@@ -331,8 +331,8 @@ static void imx7_csi_deinterlace_enable(struct imx7_csi *csi, bool enable)
 
 static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 {
-	unsigned long cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
-	unsigned long cr2 = imx7_csi_reg_read(csi, CSI_CSICR2);
+	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
+	u32 cr2 = imx7_csi_reg_read(csi, CSI_CSICR2);
 
 	/* Burst Type of DMA Transfer from RxFIFO. INCR16 */
 	cr2 |= 0xC0000000;
@@ -348,7 +348,7 @@ static void imx7_csi_dmareq_rff_enable(struct imx7_csi *csi)
 
 static void imx7_csi_dmareq_rff_disable(struct imx7_csi *csi)
 {
-	unsigned long cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
+	u32 cr3 = imx7_csi_reg_read(csi, CSI_CSICR3);
 
 	cr3 &= ~BIT_DMA_REQ_EN_RFF;
 	cr3 &= ~BIT_HRESP_ERR_EN;
@@ -647,7 +647,7 @@ static void imx7_csi_vb2_buf_done(struct imx7_csi *csi)
 static irqreturn_t imx7_csi_irq_handler(int irq, void *data)
 {
 	struct imx7_csi *csi =  data;
-	unsigned long status;
+	u32 status;
 
 	spin_lock(&csi->irqlock);
 
-- 
2.17.1

