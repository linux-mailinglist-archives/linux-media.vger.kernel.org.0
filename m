Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066D82BAB1F
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 14:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgKTNaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 08:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbgKTNaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 08:30:07 -0500
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A5FC0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 05:29:59 -0800 (PST)
Received: by mail-qv1-xf44.google.com with SMTP id ek7so4638476qvb.6
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gYaPWkjXIV9gSa6+W51CdlgdUZ5KPh68pzPsap5YjEw=;
        b=DhX6L4qKyfGAyJZwgMMJKDrIB2Rqo6mO18ctAKQIkUX8JQMrPbQzqUQiyKRjzVpxGg
         nEzErv8JwAUdz+Ubs+5oClCTJthlf4yZXpTgf2R73vwyGFTjyMg2/hP4a9vkZ6VAm6Y/
         a+bjhBYQs5nfisD9MsnOYHCxCXpcLpIyuy26NwM+cWG+cWO0AAf0+hkMqCu8SaXdC5h7
         RhvgOumL1V1CiVp553xDD4IAnzhktFNEc7CSkqt55me8p5cuTszPKmdt6Kry3hnD6awe
         zIDCWkEMpSOx2a/dSatESvcuQ45akkowsJlBH2tJaViGPy4R7autDVUNBy0yTTiHaujT
         sM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gYaPWkjXIV9gSa6+W51CdlgdUZ5KPh68pzPsap5YjEw=;
        b=A/kavChHhBMCgVE0R9k3cUxe5Ahk6QC4dlAGM2gcpYBy/4XhO4funnSSxTzd7Rf8Sh
         dBkBWp6UkrJxQJAMYrV/48TwobCCv84x/0FUkhhz26xAzj0Xl+wZQPqDf6gRN4bpeSeW
         c9ox/+QU3BYULUfjffln8eH6OlEuhwsir47YRAtfmeYNgHKQS8Z2/A9HerL+sOlUUQP7
         wNuBZcryIvOJMDCbxmCSDprG5Od4I68yqwhcMa4Ep+p52NF5mNO2a2amIyoPa9CQb1WE
         XMn0SeMZcghcp2yKtRDPa4DACUiydaEnfjH8oIpB8RweHqCzy2V2PZp19h7UL/1+QlhR
         1VlA==
X-Gm-Message-State: AOAM532CkYlGFI3ZJ56sbQVM4/cORQjskFQJWstJ0NQDkFZr0FU1dR21
        UqZUThQ1tM7OXGqaVlAxxD8c42qwVUFYfQ==
X-Google-Smtp-Source: ABdhPJwLKOgI0sO9ZfQxTgSUIuNb1hy+p510EPW7VM5BJ2Gy6zOqNIWKCkdE2RmK5E4dFNIiMJp95Q==
X-Received: by 2002:a0c:e18f:: with SMTP id p15mr16789564qvl.12.1605878998719;
        Fri, 20 Nov 2020 05:29:58 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:142e:d32d:d52c:7d2a])
        by smtp.gmail.com with ESMTPSA id m5sm1870621qtp.51.2020.11.20.05.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 05:29:58 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     mchehab@kernel.org
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        geert@linux-m68k.org, mpe@ellerman.id.au,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: fsl-viu: Use the ioread/write32be() accessors
Date:   Fri, 20 Nov 2020 10:29:07 -0300
Message-Id: <20201120132907.25323-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since commit 29d750686331 ("media: fsl-viu: allow building it with
COMPILE_TEST") there were several attempts to fix build failures on
PPC, MICROBLAZE and M68K.

However, such errors are still present as reported by kbuild robot.

Fix the problem by using the ioread/write32be() accessors, which build
fine on all platforms.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Build tested it on x86/ARM and M68K.

 drivers/media/platform/fsl-viu.c | 119 ++++++++++++++-----------------
 1 file changed, 55 insertions(+), 64 deletions(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index ff625301e777..3ce0decb1826 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -31,12 +31,6 @@
 #define DRV_NAME		"fsl_viu"
 #define VIU_VERSION		"0.5.1"
 
-/* Allow building this driver with COMPILE_TEST */
-#if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE) && !defined(CONFIG_M68K)
-#define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
-#define in_be32(a)	ioread32be((void __iomem *)a)
-#endif
-
 #define BUFFER_TIMEOUT		msecs_to_jiffies(500)  /* 0.5 seconds */
 
 #define	VIU_VID_MEM_LIMIT	4	/* Video memory limit, in Mb */
@@ -250,8 +244,8 @@ static void viu_start_dma(struct viu_dev *dev)
 	dev->field = 0;
 
 	/* Enable DMA operation */
-	out_be32(&vr->status_cfg, SOFT_RST);
-	out_be32(&vr->status_cfg, INT_FIELD_EN);
+	iowrite32be(SOFT_RST, &vr->status_cfg);
+	iowrite32be(INT_FIELD_EN, &vr->status_cfg);
 }
 
 static void viu_stop_dma(struct viu_dev *dev)
@@ -260,27 +254,27 @@ static void viu_stop_dma(struct viu_dev *dev)
 	int cnt = 100;
 	u32 status_cfg;
 
-	out_be32(&vr->status_cfg, 0);
+	iowrite32be(0, &vr->status_cfg);
 
 	/* Clear pending interrupts */
-	status_cfg = in_be32(&vr->status_cfg);
+	status_cfg = ioread32be(&vr->status_cfg);
 	if (status_cfg & 0x3f0000)
-		out_be32(&vr->status_cfg, status_cfg & 0x3f0000);
+		iowrite32be(status_cfg & 0x3f0000, &vr->status_cfg);
 
 	if (status_cfg & DMA_ACT) {
 		do {
-			status_cfg = in_be32(&vr->status_cfg);
+			status_cfg = ioread32be(&vr->status_cfg);
 			if (status_cfg & INT_DMA_END_STATUS)
 				break;
 		} while (cnt--);
 
 		if (cnt < 0) {
 			/* timed out, issue soft reset */
-			out_be32(&vr->status_cfg, SOFT_RST);
-			out_be32(&vr->status_cfg, 0);
+			iowrite32be(SOFT_RST, &vr->status_cfg);
+			iowrite32be(0, &vr->status_cfg);
 		} else {
 			/* clear DMA_END and other pending irqs */
-			out_be32(&vr->status_cfg, status_cfg & 0x3f0000);
+			iowrite32be(status_cfg & 0x3f0000, &vr->status_cfg);
 		}
 	}
 
@@ -434,9 +428,9 @@ inline int buffer_activate(struct viu_dev *dev, struct viu_buf *buf)
 	if (!V4L2_FIELD_HAS_BOTH(buf->vb.field))
 		reg_val.dma_inc = 0;
 
-	out_be32(&vr->dma_inc, reg_val.dma_inc);
-	out_be32(&vr->picture_count, reg_val.picture_count);
-	out_be32(&vr->field_base_addr, reg_val.field_base_addr);
+	iowrite32be(reg_val.dma_inc, &vr->dma_inc);
+	iowrite32be(reg_val.picture_count, &vr->picture_count);
+	iowrite32be(reg_val.field_base_addr, &vr->picture_count);
 	mod_timer(&dev->vidq.timeout, jiffies + BUFFER_TIMEOUT);
 	return 0;
 }
@@ -696,9 +690,9 @@ static int verify_preview(struct viu_dev *dev, struct v4l2_window *win)
 
 inline void viu_activate_overlay(struct viu_reg __iomem *vr)
 {
-	out_be32(&vr->field_base_addr, reg_val.field_base_addr);
-	out_be32(&vr->dma_inc, reg_val.dma_inc);
-	out_be32(&vr->picture_count, reg_val.picture_count);
+	iowrite32be(reg_val.field_base_addr, &vr->field_base_addr);
+	iowrite32be(reg_val.dma_inc, &vr->dma_inc);
+	iowrite32be(reg_val.picture_count, &vr->picture_count);
 }
 
 static int viu_setup_preview(struct viu_dev *dev, struct viu_fh *fh)
@@ -976,14 +970,14 @@ inline void viu_activate_next_buf(struct viu_dev *dev,
 
 inline void viu_default_settings(struct viu_reg __iomem *vr)
 {
-	out_be32(&vr->luminance, 0x9512A254);
-	out_be32(&vr->chroma_r, 0x03310000);
-	out_be32(&vr->chroma_g, 0x06600F38);
-	out_be32(&vr->chroma_b, 0x00000409);
-	out_be32(&vr->alpha, 0x000000ff);
-	out_be32(&vr->req_alarm, 0x00000090);
+	iowrite32be(0x9512A254, &vr->luminance);
+	iowrite32be(0x03310000, &vr->chroma_r);
+	iowrite32be(0x06600F38, &vr->chroma_g);
+	iowrite32be(0x00000409, &vr->chroma_b);
+	iowrite32be(0x000000ff, &vr->alpha);
+	iowrite32be(0x00000090, &vr->req_alarm);
 	dprintk(1, "status reg: 0x%08x, field base: 0x%08x\n",
-		in_be32(&vr->status_cfg), in_be32(&vr->field_base_addr));
+		ioread32be(&vr->status_cfg), ioread32be(&vr->field_base_addr));
 }
 
 static void viu_overlay_intr(struct viu_dev *dev, u32 status)
@@ -1001,17 +995,15 @@ static void viu_overlay_intr(struct viu_dev *dev, u32 status)
 			if (status & FIELD_NO)
 				addr += reg_val.dma_inc;
 
-			out_be32(&vr->field_base_addr, addr);
-			out_be32(&vr->dma_inc, reg_val.dma_inc);
-			out_be32(&vr->status_cfg,
-				 (status & 0xffc0ffff) |
+			iowrite32be(addr, &vr->field_base_addr);
+			iowrite32be(reg_val.dma_inc, &vr->dma_inc);
+			iowrite32be((status & 0xffc0ffff) |
 				 (status & INT_ALL_STATUS) |
-				 reg_val.status_cfg);
+				 reg_val.status_cfg, &vr->status_cfg);
 		} else if (status & INT_VSYNC_STATUS) {
-			out_be32(&vr->status_cfg,
-				 (status & 0xffc0ffff) |
+			iowrite32be((status & 0xffc0ffff) |
 				 (status & INT_ALL_STATUS) |
-				 reg_val.status_cfg);
+				 reg_val.status_cfg, &vr->status_cfg);
 		}
 	}
 }
@@ -1057,12 +1049,11 @@ static void viu_capture_intr(struct viu_dev *dev, u32 status)
 				dprintk(1, "field 1, 0x%lx, dev field %d\n",
 					(unsigned long)addr, dev->field);
 			}
-			out_be32(&vr->field_base_addr, addr);
-			out_be32(&vr->dma_inc, reg_val.dma_inc);
-			out_be32(&vr->status_cfg,
-				 (status & 0xffc0ffff) |
+			iowrite32be(addr, &vr->field_base_addr);
+			iowrite32be(reg_val.dma_inc, &vr->dma_inc);
+			iowrite32be((status & 0xffc0ffff) |
 				 (status & INT_ALL_STATUS) |
-				 reg_val.status_cfg);
+				 reg_val.status_cfg, &vr->status_cfg);
 			return;
 		}
 	}
@@ -1074,7 +1065,7 @@ static void viu_capture_intr(struct viu_dev *dev, u32 status)
 		dprintk(1, "viu/0: [%p/%d] 0x%lx/0x%lx: dma complete\n",
 			buf, buf->vb.i,
 			(unsigned long)videobuf_to_dma_contig(&buf->vb),
-			(unsigned long)in_be32(&vr->field_base_addr));
+			(unsigned long)ioread32be(&vr->field_base_addr));
 
 		if (waitqueue_active(&buf->vb.done)) {
 			list_del(&buf->vb.queue);
@@ -1095,7 +1086,7 @@ static irqreturn_t viu_intr(int irq, void *dev_id)
 	u32 status;
 	u32 error;
 
-	status = in_be32(&vr->status_cfg);
+	status = ioread32be(&vr->status_cfg);
 
 	if (status & INT_ERROR_STATUS) {
 		dev->irqs.error_irq++;
@@ -1104,8 +1095,8 @@ static irqreturn_t viu_intr(int irq, void *dev_id)
 			dprintk(1, "Err: error(%d), times:%d!\n",
 				error >> 4, dev->irqs.error_irq);
 		/* Clear interrupt error bit and error flags */
-		out_be32(&vr->status_cfg,
-			 (status & 0xffc0ffff) | INT_ERROR_STATUS);
+		iowrite32be((status & 0xffc0ffff) | INT_ERROR_STATUS,
+			    &vr->status_cfg);
 	}
 
 	if (status & INT_DMA_END_STATUS) {
@@ -1134,9 +1125,9 @@ static irqreturn_t viu_intr(int irq, void *dev_id)
 	}
 
 	/* clear all pending irqs */
-	status = in_be32(&vr->status_cfg);
-	out_be32(&vr->status_cfg,
-		 (status & 0xffc0ffff) | (status & INT_ALL_STATUS));
+	status = ioread32be(&vr->status_cfg);
+	iowrite32be((status & 0xffc0ffff) | (status & INT_ALL_STATUS),
+		    &vr->status_cfg);
 
 	if (dev->ovenable) {
 		viu_overlay_intr(dev, status);
@@ -1205,14 +1196,14 @@ static int viu_open(struct file *file)
 
 	viu_default_settings(vr);
 
-	status_cfg = in_be32(&vr->status_cfg);
-	out_be32(&vr->status_cfg,
-		 status_cfg & ~(INT_VSYNC_EN | INT_HSYNC_EN |
+	status_cfg = ioread32be(&vr->status_cfg);
+	iowrite32be(status_cfg & ~(INT_VSYNC_EN | INT_HSYNC_EN |
 				INT_FIELD_EN | INT_VSTART_EN |
-				INT_DMA_END_EN | INT_ERROR_EN | INT_ECC_EN));
+				INT_DMA_END_EN | INT_ERROR_EN | INT_ECC_EN),
+		    &vr->status_cfg);
 
-	status_cfg = in_be32(&vr->status_cfg);
-	out_be32(&vr->status_cfg, status_cfg | INT_ALL_STATUS);
+	status_cfg = ioread32be(&vr->status_cfg);
+	iowrite32be(status_cfg | INT_ALL_STATUS, &vr->status_cfg);
 
 	spin_lock_init(&fh->vbq_lock);
 	videobuf_queue_dma_contig_init(&fh->vb_vidq, &viu_video_qops,
@@ -1292,16 +1283,16 @@ static int viu_release(struct file *file)
 
 static void viu_reset(struct viu_reg __iomem *reg)
 {
-	out_be32(&reg->status_cfg, 0);
-	out_be32(&reg->luminance, 0x9512a254);
-	out_be32(&reg->chroma_r, 0x03310000);
-	out_be32(&reg->chroma_g, 0x06600f38);
-	out_be32(&reg->chroma_b, 0x00000409);
-	out_be32(&reg->field_base_addr, 0);
-	out_be32(&reg->dma_inc, 0);
-	out_be32(&reg->picture_count, 0x01e002d0);
-	out_be32(&reg->req_alarm, 0x00000090);
-	out_be32(&reg->alpha, 0x000000ff);
+	iowrite32be(0, &reg->status_cfg);
+	iowrite32be(0x9512a254, &reg->luminance);
+	iowrite32be(0x03310000, &reg->chroma_r);
+	iowrite32be(0x06600f38, &reg->chroma_g);
+	iowrite32be(0x00000409, &reg->chroma_b);
+	iowrite32be(0, &reg->field_base_addr);
+	iowrite32be(0, &reg->dma_inc);
+	iowrite32be(0x01e002d0, &reg->picture_count);
+	iowrite32be(0x00000090, &reg->req_alarm);
+	iowrite32be(0x000000ff, &reg->alpha);
 }
 
 static int viu_mmap(struct file *file, struct vm_area_struct *vma)
-- 
2.17.1

