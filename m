Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDC12720A7
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgIUKXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgIUKUs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:48 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0DCFC0613D6
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l9so12023355wme.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XQtRtjHSNQiSv0g3mZwkcnE0Fkjc1fIWl4XCgS/r66c=;
        b=slyncmICmXdEhhWYEdsc+ean+2FXOU4MeBJKJmPo2//+IaYRB3AfzhfeHPRPoYmjcU
         /rK6AcQZekKH1tayoc7buUtGimhtDhst9KvohiUoWsxOYew2qxZKBurKJ6n8guxtd/Gm
         jsCVWoymfh3+RcpdH9ybo64Lr5V3alaPCfxDi3BVTmwrfWi7toQhMnjWq8+0K0mYpOT7
         QP8kd9PMMb/Zff/N3U8eLFvWZnubKaM4LRKIdxFqb8WjXuX3eQxCGBPOPJFXS4scOKQ6
         TBfMIbhGnuIeNHt578xdco7ka9XxF/X+NEfLiGkbz1J6+Oa88foumPYueZhAR/jNPAxi
         cv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XQtRtjHSNQiSv0g3mZwkcnE0Fkjc1fIWl4XCgS/r66c=;
        b=fhvK0Qvc4EdyqqSajl8/ukcMxyEZxbrGasWLNPBhRIWqje7DiHsQstvU4kS19DYMVO
         H7BZLwT79u9uB0tH2Uk+s89fneqU1J351FKigiWbshWWNidyO91lgiIs00s++yEj0FxJ
         QmCMoh7rE+KOwbv8ZOv/HWqMtdAbw584GvNx/K7yS2vpgoUf5/yoy/foDjrH9VYIgJhd
         udV5vs/m4rVT5f6wjqrv/azsNPRFtE9paLgbkcTLpq1OBplIsDYT7KLWnfB2KXmyHJu+
         07Zm7E5mx/E5y7jcEUJdxNPPL8qB7f8mCSmM/AOS36XFBCNocMhiBAugSW6EOXxiuTvt
         oyjA==
X-Gm-Message-State: AOAM533pR1/Bf+sA1ZFkjG0mqLcKn7klSJ2AOV48XUUW+PyLG6dphphT
        HMqEbN5jr9RTyb26oyRMcBid5w==
X-Google-Smtp-Source: ABdhPJzLqCAqD/VEfG70gkysoerYVRtzTxtVm9b+0uuTk5ona1L4qr25Ge+YWXB4ngJw2k5ewFF6kQ==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr29087223wmb.35.1600683642386;
        Mon, 21 Sep 2020 03:20:42 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:41 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 10/49] staging: media: zoran: convert dprintk info to pci_info
Date:   Mon, 21 Sep 2020 10:19:45 +0000
Message-Id: <1600683624-5863-11-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch convert dprintk(info) to pci_info (or pci_dbg if the message
is not important).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 46 +++++++---------------
 drivers/staging/media/zoran/zoran_device.c | 27 ++++---------
 drivers/staging/media/zoran/zoran_driver.c | 34 ++++++----------
 3 files changed, 36 insertions(+), 71 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 26f58e687333..fd633265761c 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -887,9 +887,9 @@ static void test_interrupts(struct zoran *zr)
 	btwrite(0, ZR36057_ICR);
 	btwrite(0x78000000, ZR36057_ISR);
 	zr->testing = 0;
-	dprintk(5, KERN_INFO "%s: Testing interrupts...\n", ZR_DEVNAME(zr));
+	pci_info(zr->pci_dev, "Testing interrupts...\n");
 	if (timeout)
-		dprintk(1, ": time spent: %d\n", 1 * HZ - timeout);
+		pci_info(zr->pci_dev, ": time spent: %d\n", 1 * HZ - timeout);
 	if (zr36067_debug > 1)
 		print_interrupts(zr);
 	btwrite(icr, ZR36057_ICR);
@@ -899,10 +899,7 @@ static int zr36057_init(struct zoran *zr)
 {
 	int j, err;
 
-	dprintk(1,
-		KERN_INFO
-		"%s: %s - initializing card[%d], zr=%p\n",
-		ZR_DEVNAME(zr), __func__, zr->id, zr);
+	pci_info(zr->pci_dev, "initializing card[%d]\n", zr->id);
 
 	/* default setup of all parameters which will persist between opens */
 	zr->user = 0;
@@ -1134,18 +1131,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto zr_unreg;
 	zr->revision = zr->pci_dev->revision;
 
-	dprintk(1,
-		KERN_INFO
-		"%s: Zoran ZR360%c7 (rev %d), irq: %d, memory: 0x%08llx\n",
-		ZR_DEVNAME(zr), zr->revision < 2 ? '5' : '6', zr->revision,
-		zr->pci_dev->irq, (uint64_t)pci_resource_start(zr->pci_dev, 0));
-	if (zr->revision >= 2) {
-		dprintk(1,
-			KERN_INFO
-			"%s: Subsystem vendor=0x%04x id=0x%04x\n",
-			ZR_DEVNAME(zr), zr->pci_dev->subsystem_vendor,
-			zr->pci_dev->subsystem_device);
-	}
+	pci_info(zr->pci_dev, "Zoran ZR360%c7 (rev %d), irq: %d, memory: 0x%08llx\n",
+		 zr->revision < 2 ? '5' : '6', zr->revision,
+		 zr->pci_dev->irq, (uint64_t)pci_resource_start(zr->pci_dev, 0));
+	if (zr->revision >= 2)
+		pci_info(zr->pci_dev, "Subsystem vendor=0x%04x id=0x%04x\n",
+			 zr->pci_dev->subsystem_vendor, zr->pci_dev->subsystem_device);
 
 	/* Use auto-detected card type? */
 	if (card[nr] == -1) {
@@ -1208,14 +1199,13 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			     &latency);
 	need_latency = zr->revision > 1 ? 32 : 48;
 	if (latency != need_latency) {
-		dprintk(2, KERN_INFO "%s: Changing PCI latency from %d to %d\n",
-			ZR_DEVNAME(zr), latency, need_latency);
+		pci_info(zr->pci_dev, "Changing PCI latency from %d to %d\n", latency, need_latency);
 		pci_write_config_byte(zr->pci_dev, PCI_LATENCY_TIMER, need_latency);
 	}
 
 	zr36057_restart(zr);
 	/* i2c */
-	dprintk(2, KERN_INFO "%s: Initializing i2c bus...\n", ZR_DEVNAME(zr));
+	pci_info(zr->pci_dev, "Initializing i2c bus...\n");
 
 	if (zoran_register_i2c(zr) < 0) {
 		pci_err(pdev, "%s - can't initialize i2c bus\n", __func__);
@@ -1229,7 +1219,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
 						  zr->card.i2c_encoder, 0, zr->card.addrs_encoder);
 
-	dprintk(2, KERN_INFO "%s: Initializing videocodec bus...\n", ZR_DEVNAME(zr));
+	pci_info(zr->pci_dev, "Initializing videocodec bus...\n");
 
 	if (zr->card.video_codec) {
 		codec_name = codecid_to_modulename(zr->card.video_codec);
@@ -1285,9 +1275,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* take care of Natoma chipset and a revision 1 zr36057 */
 	if ((pci_pci_problems & PCIPCI_NATOMA) && zr->revision <= 1) {
 		zr->jpg_buffers.need_contiguous = 1;
-		dprintk(1, KERN_INFO
-			"%s: ZR36057/Natoma bug, max. buffer size is 128K\n",
-			ZR_DEVNAME(zr));
+		pci_info(zr->pci_dev, "ZR36057/Natoma bug, max. buffer size is 128K\n");
 	}
 
 	if (zr36057_init(zr) < 0)
@@ -1356,12 +1344,8 @@ static int __init zoran_init(void)
 	if (jpg_bufsize > (512 * 1024))
 		jpg_bufsize = 512 * 1024;
 	/* Use parameter for vidmem or try to find a video card */
-	if (vidmem) {
-		dprintk(1,
-			KERN_INFO
-			"%s: Using supplied video memory base address @ 0x%lx\n",
-			ZORAN_NAME, vidmem);
-	}
+	if (vidmem)
+		pr_info("%s: Using supplied video memory base address @ 0x%lx\n", ZORAN_NAME, vidmem);
 
 	/* some mainboards might not do PCI-PCI data transfer well */
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index a04fbae30745..1f625e1e8477 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -118,8 +118,7 @@ int post_office_wait(struct zoran *zr)
 	}
 	if ((por & ZR36057_POR_POTime) && !zr->card.gws_not_connected) {
 		/* In LML33/BUZ \GWS line is not connected, so it has always timeout set */
-		dprintk(1, KERN_INFO "%s: pop timeout %08x\n", ZR_DEVNAME(zr),
-			por);
+		pci_info(zr->pci_dev, "pop timeout %08x\n", por);
 		return -1;
 	}
 
@@ -218,16 +217,10 @@ void jpeg_codec_sleep(struct zoran *zr, int sleep)
 {
 	GPIO(zr, zr->card.gpio[ZR_GPIO_JPEG_SLEEP], !sleep);
 	if (!sleep) {
-		dprintk(3,
-			KERN_INFO
-			"%s: %s() - wake GPIO=0x%08x\n",
-			ZR_DEVNAME(zr), __func__, btread(ZR36057_GPPGCR1));
+		pci_dbg(zr->pci_dev, "%s() - wake GPIO=0x%08x\n", __func__, btread(ZR36057_GPPGCR1));
 		udelay(500);
 	} else {
-		dprintk(3,
-			KERN_INFO
-			"%s: %s() - sleep GPIO=0x%08x\n",
-			ZR_DEVNAME(zr), __func__, btread(ZR36057_GPPGCR1));
+		pci_dbg(zr->pci_dev, "%s() - sleep GPIO=0x%08x\n", __func__, btread(ZR36057_GPPGCR1));
 		udelay(2);
 	}
 }
@@ -309,8 +302,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	Wa = tvn->Wa;
 	Ha = tvn->Ha;
 
-	dprintk(2, KERN_INFO "%s: set_vfe() - width = %d, height = %d\n",
-		ZR_DEVNAME(zr), video_width, video_height);
+	pci_info(zr->pci_dev, "set_vfe() - width = %d, height = %d\n", video_width, video_height);
 
 	if (video_width < BUZ_MIN_WIDTH ||
 	    video_height < BUZ_MIN_HEIGHT ||
@@ -940,8 +932,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		zr36057_set_jpg(zr, mode);	// \P_Reset, ... Video param, FIFO
 
 		clear_interrupt_counters(zr);
-		dprintk(2, KERN_INFO "%s: enable_jpg(MOTION_COMPRESS)\n",
-			ZR_DEVNAME(zr));
+		pci_info(zr->pci_dev, "enable_jpg(MOTION_COMPRESS)\n");
 		break;
 	}
 
@@ -968,8 +959,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		zr36057_set_jpg(zr, mode);	// \P_Reset, ... Video param, FIFO
 
 		clear_interrupt_counters(zr);
-		dprintk(2, KERN_INFO "%s: enable_jpg(MOTION_DECOMPRESS)\n",
-			ZR_DEVNAME(zr));
+		pci_info(zr->pci_dev, "enable_jpg(MOTION_DECOMPRESS)\n");
 		break;
 
 	case BUZ_MODE_IDLE:
@@ -994,7 +984,7 @@ void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 		decoder_call(zr, video, s_stream, 1);
 		encoder_call(zr, video, s_routing, 0, 0, 0);
 
-		dprintk(2, KERN_INFO "%s: enable_jpg(IDLE)\n", ZR_DEVNAME(zr));
+		pci_info(zr->pci_dev, "enable_jpg(IDLE)\n");
 		break;
 	}
 }
@@ -1112,8 +1102,7 @@ static void zoran_restart(struct zoran *zr)
 		jpeg_start(zr);
 
 		if (zr->num_errors <= 8)
-			dprintk(2, KERN_INFO "%s: Restart\n",
-				ZR_DEVNAME(zr));
+			pci_info(zr->pci_dev, "Restart\n");
 
 		zr->JPEG_missed = 0;
 		zr->JPEG_error = 2;
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 3b061c3e4a82..02c1f69d073e 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -225,11 +225,8 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 		for (off = 0; off < fh->buffers.buffer_size;
 		     off += PAGE_SIZE)
 			SetPageReserved(virt_to_page(mem + off));
-		dprintk(4,
-			KERN_INFO
-			"%s: %s - V4L frame %d mem %p (bus: 0x%llx)\n",
-			ZR_DEVNAME(zr), __func__, i, mem,
-			(unsigned long long)virt_to_bus(mem));
+		pci_info(zr->pci_dev, "%s - V4L frame %d mem %p (bus: 0x%llx)\n", __func__, i, mem,
+			 (unsigned long long)virt_to_bus(mem));
 	}
 
 	fh->buffers.allocated = 1;
@@ -244,7 +241,7 @@ static void v4l_fbuffer_free(struct zoran_fh *fh)
 	int i, off;
 	unsigned char *mem;
 
-	dprintk(4, KERN_INFO "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 
 	for (i = 0; i < fh->buffers.num_buffers; i++) {
 		if (!fh->buffers.buffer[i].v4l.fbuffer)
@@ -820,8 +817,8 @@ static int zoran_open(struct file *file)
 	struct zoran_fh *fh;
 	int res, first_open = 0;
 
-	dprintk(2, KERN_INFO "%s: %s(%s, pid=[%d]), users(-)=%d\n",
-		ZR_DEVNAME(zr), __func__, current->comm, task_pid_nr(current), zr->user + 1);
+	pci_info(zr->pci_dev, "%s(%s, pid=[%d]), users(-)=%d\n", __func__, current->comm,
+		 task_pid_nr(current), zr->user + 1);
 
 	mutex_lock(&zr->lock);
 
@@ -876,8 +873,7 @@ static int zoran_open(struct file *file)
 fail_unlock:
 	mutex_unlock(&zr->lock);
 
-	dprintk(2, KERN_INFO "%s: open failed (%d), users(-)=%d\n",
-		ZR_DEVNAME(zr), res, zr->user);
+	pci_info(zr->pci_dev, "open failed (%d), users(-)=%d\n", res, zr->user);
 
 	return res;
 }
@@ -887,8 +883,8 @@ static int zoran_close(struct file *file)
 	struct zoran_fh *fh = file->private_data;
 	struct zoran *zr = fh->zr;
 
-	dprintk(2, KERN_INFO "%s: %s(%s, pid=[%d]), users(+)=%d\n",
-		ZR_DEVNAME(zr), __func__, current->comm, task_pid_nr(current), zr->user - 1);
+	pci_info(zr->pci_dev, "%s(%s, pid=[%d]), users(+)=%d\n", __func__, current->comm,
+		 task_pid_nr(current), zr->user - 1);
 
 	/* kernel locks (fs/device.c), so don't do that ourselves
 	 * (prevents deadlocks) */
@@ -933,7 +929,7 @@ static int zoran_close(struct file *file)
 	kfree(fh->overlay_mask);
 	kfree(fh);
 
-	dprintk(4, KERN_INFO "%s: %s done\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s done\n", __func__);
 
 	return 0;
 }
@@ -2381,8 +2377,7 @@ static void zoran_vm_close(struct vm_area_struct *vma)
 	struct zoran *zr = fh->zr;
 	int i;
 
-	dprintk(3, KERN_INFO "%s: %s - munmap(%s)\n", ZR_DEVNAME(zr),
-		__func__, mode_name(fh->map_mode));
+	pci_info(zr->pci_dev, "%s - munmap(%s)\n", ZR_DEVNAME(zr), mode_name(fh->map_mode));
 
 	for (i = 0; i < fh->buffers.num_buffers; i++) {
 		if (fh->buffers.buffer[i].map == map)
@@ -2396,8 +2391,7 @@ static void zoran_vm_close(struct vm_area_struct *vma)
 			return;
 	}
 
-	dprintk(3, KERN_INFO "%s: %s - free %s buffers\n", ZR_DEVNAME(zr),
-		__func__, mode_name(fh->map_mode));
+	pci_info(zr->pci_dev, "%s - free %s buffers\n", __func__, mode_name(fh->map_mode));
 
 	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
 		if (fh->buffers.active != ZORAN_FREE) {
@@ -2437,10 +2431,8 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	struct zoran_mapping *map;
 	int res = 0;
 
-	dprintk(3,
-		KERN_INFO "%s: %s(%s) of 0x%08lx-0x%08lx (size=%lu)\n",
-		ZR_DEVNAME(zr), __func__,
-		mode_name(fh->map_mode), vma->vm_start, vma->vm_end, size);
+	pci_info(zr->pci_dev, "%s(%s) of 0x%08lx-0x%08lx (size=%lu)\n", __func__,
+		 mode_name(fh->map_mode), vma->vm_start, vma->vm_end, size);
 
 	if (!(vma->vm_flags & VM_SHARED) || !(vma->vm_flags & VM_READ) ||
 	    !(vma->vm_flags & VM_WRITE)) {
-- 
2.26.2

