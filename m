Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E06CC279077
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbgIYScS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729778AbgIYScR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:32:17 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF929C0613D3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:17 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l126so4003503pfd.5
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9j2EjSExBaDYpSG5PMQav+nc+GMq7pLGOD37JjeqkUw=;
        b=LVWq5rBxm0dhmNSokc3FjTVR563pgrF0P57SLt4easTHL8qwZd7JMxYbisqpDlJ0i6
         oBRSd/OeOiOf2NnRwLDpF75i2K9W97wlYg16JSjBccc6c6dDTp7GiFdN0FgbcCF5rY16
         EzNBPr17DgrRC3A2cRlqt4zSpPqfcZal44AilenYnydxTJWDj/K7VZyOX8SKu9tPD7Oo
         D5mAKLMQT3VnYfjbmNoABU2hZVZZYDTzRWtIjQBpiC1ygOMMmW+/kXkvIBgfJWRVW5mQ
         v34eeFeMxnaOxYGbsCQca3kLpsyyaeknWYKnLheRAb7IhbEaGYFb9ToxWUesF3tOgpuN
         3DDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9j2EjSExBaDYpSG5PMQav+nc+GMq7pLGOD37JjeqkUw=;
        b=IyPaSPJj73/1eqEtcydx0ssIP6QeBrYpj3JSLxs9Xt5AqJeRp/qAdF05FUf73JAsik
         6j4N5Z7goVuf+CLejHALi/Nt1ZioSoNm8YEnZgY+QCrkrpnNfUzAyDaitb/oOUyKjwEX
         C644fHXcfhie8iy9Nw6z+m3KrFi0VWDu1HunL9wn96a0OgfQQP239Mg+6n3Vy6O4bDNd
         hcVf+hxVq+FBTlcv7/tb5kPZ+CmWzTe9xEvZ9xlcm1muHPpI1nvtiLcyyk30bIOAc8+T
         h3latEf9V8PHBphButGKOiE8LHnWtr6lgSVMwkWbP6+C/78x8vulRkNUAcMJW5HbFCEe
         5uXA==
X-Gm-Message-State: AOAM531woYtEDG/wMbX5YcprVE2dbVouBZZPpdS2qvzerUmUFWGRCJok
        tCjEv5mNkw7RypIPvZBQB4ekig==
X-Google-Smtp-Source: ABdhPJwq7Dpx4GzU7DXoLHUXA9hhEmMiLKGinAtLEZflA4UPbdODTT/gQbtlmTAHM+EEOH9dU2TQNQ==
X-Received: by 2002:a17:902:e9d2:b029:d1:e5e7:be63 with SMTP id 18-20020a170902e9d2b02900d1e5e7be63mr665366plk.61.1601058737282;
        Fri, 25 Sep 2020 11:32:17 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.32.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:32:16 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 10/47] staging: media: zoran: convert dprintk debug
Date:   Fri, 25 Sep 2020 18:30:20 +0000
Message-Id: <1601058657-14042-11-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch convert dprintk(debug) to pci_dbg.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c   | 30 ++++++++--------------
 drivers/staging/media/zoran/zoran_card.h   |  6 -----
 drivers/staging/media/zoran/zoran_device.c |  2 +-
 drivers/staging/media/zoran/zoran_driver.c | 28 ++++++++------------
 4 files changed, 21 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f2387f4906c0..e9c0dc1c0313 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -203,7 +203,7 @@ void zr36016_write(struct videocodec *codec, u16 reg, u32 val)
 
 static void dc10_init(struct zoran *zr)
 {
-	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 
 	/* Pixel clock selection */
 	GPIO(zr, 4, 0);
@@ -214,12 +214,12 @@ static void dc10_init(struct zoran *zr)
 
 static void dc10plus_init(struct zoran *zr)
 {
-	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 }
 
 static void buz_init(struct zoran *zr)
 {
-	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 
 	/* some stuff from Iomega */
 	pci_write_config_dword(zr->pci_dev, 0xfc, 0x90680f15);
@@ -229,7 +229,7 @@ static void buz_init(struct zoran *zr)
 
 static void lml33_init(struct zoran *zr)
 {
-	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 
 	GPIO(zr, 2, 1);		// Set Composite input/output
 }
@@ -671,15 +671,11 @@ int zoran_check_jpg_settings(struct zoran *zr,
 {
 	int err = 0, err0 = 0;
 
-	dprintk(4,
-		KERN_DEBUG
-		"%s: %s - dec: %d, Hdcm: %d, Vdcm: %d, Tdcm: %d\n",
-		ZR_DEVNAME(zr), __func__, settings->decimation, settings->HorDcm,
+	pci_dbg(zr->pci_dev, "%s - dec: %d, Hdcm: %d, Vdcm: %d, Tdcm: %d\n",
+		__func__, settings->decimation, settings->HorDcm,
 		settings->VerDcm, settings->TmpDcm);
-	dprintk(4,
-		KERN_DEBUG
-		"%s: %s - x: %d, y: %d, w: %d, y: %d\n",
-		ZR_DEVNAME(zr), __func__, settings->img_x, settings->img_y,
+	pci_dbg(zr->pci_dev, "%s - x: %d, y: %d, w: %d, y: %d\n", __func__,
+		settings->img_x, settings->img_y,
 		settings->img_width, settings->img_height);
 	/* Check decimation, set default values for decimation = 1, 2, 4 */
 	switch (settings->decimation) {
@@ -709,10 +705,7 @@ int zoran_check_jpg_settings(struct zoran *zr,
 	case 4:
 
 		if (zr->card.type == DC10_new) {
-			dprintk(1,
-				KERN_DEBUG
-				"%s: %s - HDec by 4 is not supported on the DC10\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_dbg(zr->pci_dev, "%s - HDec by 4 is not supported on the DC10\n", __func__);
 			err0++;
 			break;
 		}
@@ -1157,10 +1150,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			pci_err(pdev, "Unknown card, try specifying card=X module parameter\n");
 			goto zr_unreg;
 		}
-		dprintk(3,
-			KERN_DEBUG
-			"%s: %s() - card %s detected\n",
-			ZR_DEVNAME(zr), __func__, zoran_cards[card_num].name);
+		pci_info(zr->pci_dev, "%s() - card %s detected\n", __func__, zoran_cards[card_num].name);
 	} else {
 		card_num = card[nr];
 		if (card_num >= NUM_CARDS || card_num < 0) {
diff --git a/drivers/staging/media/zoran/zoran_card.h b/drivers/staging/media/zoran/zoran_card.h
index 4af8cb91d03a..8e0d634cb30f 100644
--- a/drivers/staging/media/zoran/zoran_card.h
+++ b/drivers/staging/media/zoran/zoran_card.h
@@ -14,12 +14,6 @@
 
 extern int zr36067_debug;
 
-#define dprintk(num, format, args...) \
-	do { \
-		if (zr36067_debug >= num) \
-			printk(format, ##args); \
-	} while (0)
-
 /* Anybody who uses more than four? */
 #define BUZ_MAX 4
 
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 013d44801e68..61b4cfccc168 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -874,7 +874,7 @@ void jpeg_start(struct zoran *zr)
 
 	set_frame(zr, 1);	// /FRAME
 
-	dprintk(3, KERN_DEBUG "%s: jpeg_start\n", ZR_DEVNAME(zr));
+	pci_dbg(zr->pci_dev, "jpeg_start\n");
 }
 
 void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 226a99d002c0..21a258b7be13 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -341,9 +341,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 		}
 	}
 
-	dprintk(4,
-		KERN_DEBUG "%s: %s - %d KB allocated\n",
-		ZR_DEVNAME(zr), __func__,
+	pci_dbg(zr->pci_dev, "%s - %d KB allocated\n", __func__,
 		(fh->buffers.num_buffers * fh->buffers.buffer_size) >> 10);
 
 	fh->buffers.allocated = 1;
@@ -360,7 +358,7 @@ static void jpg_fbuffer_free(struct zoran_fh *fh)
 	__le32 frag_tab;
 	struct zoran_buffer *buffer;
 
-	dprintk(4, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
+	pci_dbg(zr->pci_dev, "%s\n", __func__);
 
 	for (i = 0, buffer = &fh->buffers.buffer[0];
 	     i < fh->buffers.num_buffers; i++, buffer++) {
@@ -1185,10 +1183,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		}
 
 		spin_lock_irqsave(&zr->spinlock, flags);
-		dprintk(3,
-			KERN_DEBUG
-			"%s: %s() - raw active=%c, buffer %d: state=%c, map=%c\n",
-			ZR_DEVNAME(zr), __func__,
+		pci_dbg(zr->pci_dev, "%s() - raw active=%c, buffer %d: state=%c, map=%c\n", __func__,
 			"FAL"[fh->buffers.active], num,
 			"UPMD"[zr->v4l_buffers.buffer[num].state],
 			fh->buffers.buffer[num].map ? 'Y' : 'N');
@@ -1566,9 +1561,10 @@ static int zoran_s_fmt_vid_overlay(struct file *file, void *__fh,
 				   struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
+	struct zoran *zr = fh->zr;
 	int res;
 
-	dprintk(3, "x=%d, y=%d, w=%d, h=%d, cnt=%d, map=0x%p\n",
+	pci_dbg(zr->pci_dev, "x=%d, y=%d, w=%d, h=%d, cnt=%d, map=0x%p\n",
 		fmt->fmt.win.w.left, fmt->fmt.win.w.top,
 			fmt->fmt.win.w.width,
 			fmt->fmt.win.w.height,
@@ -1590,7 +1586,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	struct zoran_jpg_settings settings;
 	int res = 0;
 
-	dprintk(3, "size=%dx%d, fmt=0x%x (%4.4s)\n",
+	pci_dbg(zr->pci_dev, "size=%dx%d, fmt=0x%x (%4.4s)\n",
 		fmt->fmt.pix.width, fmt->fmt.pix.height,
 			fmt->fmt.pix.pixelformat,
 			(char *)&printformat);
@@ -2312,10 +2308,8 @@ static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 		frame = zr->v4l_pend[zr->v4l_sync_tail & V4L_MASK_FRAME];
 
 		spin_lock_irqsave(&zr->spinlock, flags);
-		dprintk(3,
-			KERN_DEBUG
-			"%s: %s() raw - active=%c, sync_tail=%lu/%c, pend_tail=%lu, pend_head=%lu\n",
-			ZR_DEVNAME(zr), __func__,
+		pci_dbg(zr->pci_dev, "%s() raw - active=%c, sync_tail=%lu/%c, pend_tail=%lu, pend_head=%lu\n",
+			__func__,
 			"FAL"[fh->buffers.active], zr->v4l_sync_tail,
 			"UPMD"[zr->v4l_buffers.buffer[frame].state],
 			zr->v4l_pend_tail, zr->v4l_pend_head);
@@ -2334,10 +2328,8 @@ static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 		frame = zr->jpg_pend[zr->jpg_que_tail & BUZ_MASK_FRAME];
 
 		spin_lock_irqsave(&zr->spinlock, flags);
-		dprintk(3,
-			KERN_DEBUG
-			"%s: %s() jpg - active=%c, que_tail=%lu/%c, que_head=%lu, dma=%lu/%lu\n",
-			ZR_DEVNAME(zr), __func__,
+		pci_dbg(zr->pci_dev, "%s() jpg - active=%c, que_tail=%lu/%c, que_head=%lu, dma=%lu/%lu\n",
+			__func__,
 			"FAL"[fh->buffers.active], zr->jpg_que_tail,
 			"UPMD"[zr->jpg_buffers.buffer[frame].state],
 			zr->jpg_que_head, zr->jpg_dma_tail, zr->jpg_dma_head);
-- 
2.26.2

