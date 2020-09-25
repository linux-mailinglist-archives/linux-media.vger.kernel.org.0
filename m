Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528D92790C7
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729928AbgIYSfv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbgIYSfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:50 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD69C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:50 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id x16so2526107pgj.3
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=K8Piu36n8kI6NGxtrhiBCuhJ0SQecvfxM4Cy3XDLzpA=;
        b=Gpx70jsaQHTBVvufLbZA6gUPMPu7xho4yZHEM6lh0UPgJYacEzb+09vsYReF6E6Aku
         RyMlz9VcITkmzHX4lorkUdEnlNCZckwfkX/18ssFLuC5YoVNGkqSTBXMHaIZUEA3vEKX
         aQyTrSsCrEaO+0SW5mIf2XBB0yUBzzXuA5x85ULczNLorgAa+7QG3m72tvr1vhplvS2r
         RMDiilH8IyXfZFiuQ09grjsRMt7fbi7YCjjAd49eIjQ94OB1ckhD7HkSDCCjL+4Ss4vD
         +oeL6mmTR/krkIMMWoCp8Yv2ReOLiGm6L857hrbvMgTaq3zFlSqBg5S6Zsr5iM038i5N
         y6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=K8Piu36n8kI6NGxtrhiBCuhJ0SQecvfxM4Cy3XDLzpA=;
        b=ToCpYq1JlXGaiA5jzcVlf8qjStZYoIhQCh8ENI8jxkib43v6I6QkpdspLvnUB0e4wB
         o7BtxtzCy/evHsKO5Gq6+sxw4lt43cwHGrXmWyKuPWvxKl1Xh4U3l+NxjYw9jHFz3XYa
         wGrA0BcgLx0SJJQ+d33Ar9RQwzvfbsrkV496f5j9CyZlMulf5gXbesrfg1Mhwv9qEAFr
         FQQDWvj2SnRiL03RBY5moCjlOtPYJy0Zu4LaUXmbkAbe8KD1V5Mbfs4tEOLUaS9Cc8wu
         JNgFiDj4EA2DB+gbbB+tbPgnmOOz+OhFyS09oBExdrOK46b50khzMmucTUWOxggSmAnE
         N7aQ==
X-Gm-Message-State: AOAM531nlhR4tnMQjbDL6X2PDdMzr4L9kGdquD58ey4HjzkWVqTX5/JP
        2+aKxAA5LsGlQVtxz9XILtILvg==
X-Google-Smtp-Source: ABdhPJz6SEB2YCl2YpmOs2xarmmXKUzN4FX7ttd0V5Tq5pVLCbLUVF90F6j+UGUUG6pTyGIUP6bd0Q==
X-Received: by 2002:a17:902:b682:b029:d1:e5e7:bdeb with SMTP id c2-20020a170902b682b02900d1e5e7bdebmr696083pls.75.1601058949365;
        Fri, 25 Sep 2020 11:35:49 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:48 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 46/47] staging: media: zoran: convert to vb2
Date:   Fri, 25 Sep 2020 18:30:56 +0000
Message-Id: <1601058657-14042-47-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is it! the ultimate last step, the vb2 conversion.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig        |    2 +-
 drivers/staging/media/zoran/zoran.h        |   83 +-
 drivers/staging/media/zoran/zoran_card.c   |   45 +-
 drivers/staging/media/zoran/zoran_device.c |  488 ++-----
 drivers/staging/media/zoran/zoran_driver.c | 1453 +-------------------
 5 files changed, 137 insertions(+), 1934 deletions(-)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index ddf38a931c01..492507030276 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -1,6 +1,6 @@
 config VIDEO_ZORAN
 	tristate "Zoran ZR36057/36067 Video For Linux (Deprecated)"
-	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2 && VIRT_TO_BUS
+	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2
 	depends on !ALPHA
 	select VIDEOBUF2_DMA_CONTIG
 	help
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index fd27d1968e60..372fadfd9a01 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -20,7 +20,6 @@
 
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
-#include <media/v4l2-fh.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-dma-contig.h>
@@ -29,13 +28,6 @@
 #define ZR_NORM_NTSC 1
 #define ZR_NORM_SECAM 2
 
-struct zoran_sync {
-	unsigned long frame;	/* number of buffer that has been free'd */
-	unsigned long length;	/* number of code bytes in buffer (capture only) */
-	unsigned long seq;	/* frame sequence number */
-	u64 ts;			/* timestamp */
-};
-
 struct zr_buffer {
 	/* common v4l buffer stuff -- must be first */
 	struct vb2_v4l2_buffer          vbuf;
@@ -111,18 +103,10 @@ enum zoran_codec_mode {
 	BUZ_MODE_STILL_DECOMPRESS	/* still frame conversion */
 };
 
-enum zoran_buffer_state {
-	BUZ_STATE_USER,		/* buffer is owned by application */
-	BUZ_STATE_PEND,		/* buffer is queued in pend[] ready to feed to I/O */
-	BUZ_STATE_DMA,		/* buffer is queued in dma[] for I/O */
-	BUZ_STATE_DONE		/* buffer is ready to return to application */
-};
-
 enum zoran_map_mode {
 	ZORAN_MAP_MODE_NONE,
 	ZORAN_MAP_MODE_RAW,
 	ZORAN_MAP_MODE_JPG_REC,
-#define ZORAN_MAP_MODE_JPG ZORAN_MAP_MODE_JPG_REC
 	ZORAN_MAP_MODE_JPG_PLAY,
 };
 
@@ -174,45 +158,6 @@ struct zoran_jpg_settings {
 	struct v4l2_jpegcompression jpg_comp;	/* JPEG-specific capture settings */
 };
 
-struct zoran_fh;
-
-struct zoran_mapping {
-	struct zoran_fh *fh;
-	atomic_t count;
-};
-
-struct zoran_buffer {
-	struct zoran_mapping *map;
-	enum zoran_buffer_state state;	/* state: unused/pending/dma/done */
-	struct zoran_sync bs;		/* DONE: info to return to application */
-	union {
-		struct {
-			__le32 *frag_tab;	/* addresses of frag table */
-			u32 frag_tab_bus;	/* same value cached to save time in ISR */
-		} jpg;
-		struct {
-			char *fbuffer;		/* virtual address of frame buffer */
-			unsigned long fbuffer_phys;/* physical address of frame buffer */
-			unsigned long fbuffer_bus;/* bus address of frame buffer */
-		} v4l;
-	};
-};
-
-enum zoran_lock_activity {
-	ZORAN_FREE,		/* free for use */
-	ZORAN_ACTIVE,		/* active but unlocked */
-	ZORAN_LOCKED,		/* locked */
-};
-
-/* buffer collections */
-struct zoran_buffer_col {
-	enum zoran_lock_activity active;	/* feature currently in use? */
-	unsigned int num_buffers;
-	struct zoran_buffer buffer[MAX_FRAME];	/* buffers */
-	u8 allocated;		/* Flag if buffers are allocated */
-	u8 need_contiguous;	/* Flag if contiguous buffers are needed */
-	/* only applies to jpg buffers, raw buffers are always contiguous */
-};
 
 struct zoran;
 
@@ -220,10 +165,6 @@ struct zoran;
 struct zoran_fh {
 	struct v4l2_fh fh;
 	struct zoran *zr;
-
-	enum zoran_map_mode map_mode;		/* Flag which bufferset will map by next mmap() */
-
-	struct zoran_buffer_col buffers;	/* buffers' info */
 };
 
 struct card_info {
@@ -281,7 +222,6 @@ struct zoran {
 	struct mutex lock;	/* file ops serialize lock */
 
 	u8 initialized;		/* flag if zoran has been correctly initialized */
-	int user;		/* number of current users */
 	struct card_info card;
 	const struct tvnorm *timing;
 
@@ -300,28 +240,12 @@ struct zoran {
 	/* Current buffer params */
 	unsigned int buffer_size;
 
-	wait_queue_head_t v4l_capq;
-
-	int v4l_memgrab_active;	/* Memory grab is activated */
-
-	int v4l_grab_frame;	/* Frame number being currently grabbed */
-#define NO_GRAB_ACTIVE (-1)
-	unsigned long v4l_grab_seq;	/* Number of frames grabbed */
 	struct zoran_v4l_settings v4l_settings;	/* structure with a lot of things to play with */
 
-	/* V4L grab queue of frames pending */
-	unsigned long v4l_pend_head;
-	unsigned long v4l_pend_tail;
-	unsigned long v4l_sync_tail;
-	int v4l_pend[V4L_MAX_FRAME];
-	struct zoran_buffer_col v4l_buffers;	/* V4L buffers' info */
-
 	/* Buz MJPEG parameters */
 	enum zoran_codec_mode codec_mode;	/* status of codec */
 	struct zoran_jpg_settings jpg_settings;	/* structure with a lot of things to play with */
 
-	wait_queue_head_t jpg_capq;	/* wait here for grab to finish */
-
 	/* grab queue counts/indices, mask with BUZ_MASK_STAT_COM before using as index */
 	/* (dma_head - dma_tail) is number active in DMA, must be <= BUZ_NUM_STAT_COM */
 	/* (value & BUZ_MASK_STAT_COM) corresponds to index in stat_com table */
@@ -338,13 +262,8 @@ struct zoran {
 	/* zr36057's code buffer table */
 	__le32 *stat_com;		/* stat_com[i] is indexed by dma_head/tail & BUZ_MASK_STAT_COM */
 
-	/* (value & BUZ_MASK_FRAME) corresponds to index in pend[] queue */
-	int jpg_pend[BUZ_MAX_FRAME];
-
-	/* array indexed by frame number */
-	struct zoran_buffer_col jpg_buffers;	/* MJPEG buffers' info */
-
 	/* Additional stuff for testing */
+	unsigned int ghost_int;
 	int jpeg_error;
 	int intr_counter_GIRQ1;
 	int intr_counter_GIRQ0;
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index fe52be4292fe..84a5d52517cd 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -10,25 +10,17 @@
  */
 
 #include <linux/delay.h>
-
-#include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/vmalloc.h>
 #include <linux/slab.h>
 
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 #include <linux/videodev2.h>
 #include <linux/spinlock.h>
-#include <linux/sem.h>
-#include <linux/kmod.h>
-#include <linux/wait.h>
 
 #include <linux/pci.h>
 #include <linux/interrupt.h>
-#include <linux/mutex.h>
 #include <linux/io.h>
 #include <media/v4l2-common.h>
 #include <media/i2c/bt819.h>
@@ -814,29 +806,12 @@ void zoran_open_init_params(struct zoran *zr)
 {
 	int i;
 
-	zr->v4l_memgrab_active = 0;
-	zr->v4l_grab_frame = NO_GRAB_ACTIVE;
-	zr->v4l_grab_seq = 0;
 	zr->v4l_settings.width = 192;
 	zr->v4l_settings.height = 144;
 	zr->v4l_settings.format = &zoran_formats[7];	/* YUY2 - YUV-4:2:2 packed */
-	zr->v4l_settings.bytesperline =
-	    zr->v4l_settings.width *
-	    ((zr->v4l_settings.format->depth + 7) / 8);
-
-	/* DMA ring stuff for V4L */
-	zr->v4l_pend_tail = 0;
-	zr->v4l_pend_head = 0;
-	zr->v4l_sync_tail = 0;
-	zr->v4l_buffers.active = ZORAN_FREE;
-	for (i = 0; i < VIDEO_MAX_FRAME; i++)
-		zr->v4l_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-	zr->v4l_buffers.allocated = 0;
-
-	for (i = 0; i < BUZ_MAX_FRAME; i++)
-		zr->jpg_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-	zr->jpg_buffers.active = ZORAN_FREE;
-	zr->jpg_buffers.allocated = 0;
+	zr->v4l_settings.bytesperline = zr->v4l_settings.width *
+		((zr->v4l_settings.format->depth + 7) / 8);
+
 	/* Set necessary params and call zoran_check_jpg_settings to set the defaults */
 	zr->jpg_settings.decimation = 1;
 	zr->jpg_settings.jpg_comp.quality = 50;	/* default compression factor 8 */
@@ -868,14 +843,6 @@ static int zr36057_init(struct zoran *zr)
 
 	pci_info(zr->pci_dev, "initializing card[%d]\n", zr->id);
 
-	/* default setup of all parameters which will persist between opens */
-	zr->user = 0;
-
-	init_waitqueue_head(&zr->v4l_capq);
-	init_waitqueue_head(&zr->jpg_capq);
-	zr->jpg_buffers.allocated = 0;
-	zr->v4l_buffers.allocated = 0;
-
 	/* Avoid nonsense settings from user for default input/norm */
 	if (default_norm < 0 || default_norm > 2)
 		default_norm = 0;
@@ -951,8 +918,6 @@ static int zr36057_init(struct zoran *zr)
 	video_set_drvdata(zr->video_dev, zr);
 
 	zoran_init_hardware(zr);
-	if (zr36067_debug > 2)
-		detect_guest_activity(zr);
 	if (!pass_through) {
 		decoder_call(zr, video, s_stream, 0);
 		encoder_call(zr, video, s_routing, 2, 0, 0);
@@ -1279,10 +1244,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	/* take care of Natoma chipset and a revision 1 zr36057 */
-	if ((pci_pci_problems & PCIPCI_NATOMA) && zr->revision <= 1) {
-		zr->jpg_buffers.need_contiguous = 1;
+	if ((pci_pci_problems & PCIPCI_NATOMA) && zr->revision <= 1)
 		pci_info(zr->pci_dev, "ZR36057/Natoma bug, max. buffer size is 128K\n");
-	}
 
 	if (zr36057_init(zr) < 0)
 		goto zr_detach_vfe;
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index c090d7166caa..1fe91e16658b 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -12,9 +12,6 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/vmalloc.h>
-#include <linux/ktime.h>
-#include <linux/sched/signal.h>
 
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
@@ -22,13 +19,12 @@
 #include <linux/videodev2.h>
 #include <media/v4l2-common.h>
 #include <linux/spinlock.h>
-#include <linux/sem.h>
 
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/wait.h>
+#include <linux/dma-mapping.h>
 
-#include <asm/byteorder.h>
 #include <linux/io.h>
 
 #include "videocodec.h"
@@ -54,6 +50,7 @@ static bool lml33dpath;		/* default = 0
 module_param(lml33dpath, bool, 0644);
 MODULE_PARM_DESC(lml33dpath, "Use digital path capture mode (on LML33 cards)");
 
+int zr_set_buf(struct zoran *zr);
 /*
  * initialize video front end
  */
@@ -114,6 +111,7 @@ int post_office_wait(struct zoran *zr)
 //      while (((por = btread(ZR36057_POR)) & (ZR36057_POR_POPen | ZR36057_POR_POTime)) == ZR36057_POR_POPen) {
 	while ((por = btread(ZR36057_POR)) & ZR36057_POR_POPen) {
 		/* wait for something to happen */
+		/* TODO add timeout */
 	}
 	if ((por & ZR36057_POR_POTime) && !zr->card.gws_not_connected) {
 		/* In LML33/BUZ \GWS line is not connected, so it has always timeout set */
@@ -422,42 +420,16 @@ void zr36057_set_memgrab(struct zoran *zr, int mode)
 		zr36057_set_vfe(zr, zr->v4l_settings.width,
 				zr->v4l_settings.height,
 				zr->v4l_settings.format);
-
-		zr->v4l_memgrab_active = 1;
 	} else {
 		/* switch off VSync interrupts */
 		btand(~zr->card.vsync_int, ZR36057_ICR);	// SW
 
-		zr->v4l_memgrab_active = 0;
-		zr->v4l_grab_frame = NO_GRAB_ACTIVE;
-
 		/* re-enable grabbing to screen if it was running */
 		btand(~ZR36057_VDCR_VidEn, ZR36057_VDCR);
 		btand(~ZR36057_VSSFGR_SnapShot, ZR36057_VSSFGR);
 	}
 }
 
-int wait_grab_pending(struct zoran *zr)
-{
-	unsigned long flags;
-
-	/* wait until all pending grabs are finished */
-
-	if (!zr->v4l_memgrab_active)
-		return 0;
-
-	wait_event_interruptible(zr->v4l_capq,
-				 (zr->v4l_pend_tail == zr->v4l_pend_head));
-	if (signal_pending(current))
-		return -ERESTARTSYS;
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-	zr36057_set_memgrab(zr, 0);
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
-	return 0;
-}
-
 /*****************************************************************************
  *                                                                           *
  *  Set up the Buz-specific MJPEG part                                       *
@@ -501,9 +473,6 @@ static void init_jpeg_queue(struct zoran *zr)
 	zr->jpg_err_seq = 0;
 	zr->jpg_err_shift = 0;
 	zr->jpg_queued_num = 0;
-	for (i = 0; i < zr->jpg_buffers.num_buffers; i++)
-		zr->jpg_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-
 	for (i = 0; i < BUZ_NUM_STAT_COM; i++)
 		zr->stat_com[i] = cpu_to_le32(1);	/* mark as unavailable to zr36057 */
 }
@@ -605,50 +574,6 @@ static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 	zr36057_adjust_vfe(zr, mode);
 }
 
-void print_interrupts(struct zoran *zr)
-{
-	int res, noerr = 0;
-
-	pr_info("%s: interrupts received:", ZR_DEVNAME(zr));
-	res = zr->field_counter;
-	if (res < -1 || res > 1)
-		printk(KERN_CONT " FD:%d", res);
-	res = zr->intr_counter_GIRQ1;
-	if (res != 0) {
-		printk(KERN_CONT " GIRQ1:%d", res);
-		noerr++;
-	}
-	res = zr->intr_counter_GIRQ0;
-	if (res != 0) {
-		printk(KERN_CONT " GIRQ0:%d", res);
-		noerr++;
-	}
-	res = zr->intr_counter_CodRepIRQ;
-	if (res != 0) {
-		printk(KERN_CONT " CodRepIRQ:%d", res);
-		noerr++;
-	}
-	res = zr->intr_counter_JPEGRepIRQ;
-	if (res != 0) {
-		printk(KERN_CONT " JPEGRepIRQ:%d", res);
-		noerr++;
-	}
-	if (zr->JPEG_max_missed) {
-		printk(KERN_CONT " JPEG delays: max=%d min=%d", zr->JPEG_max_missed,
-		       zr->JPEG_min_missed);
-	}
-	if (zr->END_event_missed) {
-		printk(KERN_CONT " ENDs missed: %d", zr->END_event_missed);
-	}
-	//if (zr->jpg_queued_num) {
-	printk(KERN_CONT " queue_state=%ld/%ld/%ld/%ld", zr->jpg_que_tail,
-	       zr->jpg_dma_tail, zr->jpg_dma_head, zr->jpg_que_head);
-	//}
-	if (!noerr)
-		printk(KERN_CONT ": no interrupts detected.");
-	printk(KERN_CONT "\n");
-}
-
 void clear_interrupt_counters(struct zoran *zr)
 {
 	zr->intr_counter_GIRQ1 = 0;
@@ -870,37 +795,61 @@ void zoran_feed_stat_com(struct zoran *zr)
 {
 	/* move frames from pending queue to DMA */
 
-	int frame, i, max_stat_com;
+	int i, max_stat_com;
+	struct zr_buffer *buf;
+	struct vb2_v4l2_buffer *vbuf;
+	dma_addr_t phys_addr = 0;
+	unsigned long flags;
+	unsigned long payload;
 
 	max_stat_com =
 	    (zr->jpg_settings.TmpDcm ==
 	     1) ? BUZ_NUM_STAT_COM : (BUZ_NUM_STAT_COM >> 1);
 
-	while ((zr->jpg_dma_head - zr->jpg_dma_tail) < max_stat_com &&
-	       zr->jpg_dma_head < zr->jpg_que_head) {
-		frame = zr->jpg_pend[zr->jpg_dma_head & BUZ_MASK_FRAME];
+	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
+	while ((zr->jpg_dma_head - zr->jpg_dma_tail) < max_stat_com) {
+		buf = list_first_entry_or_null(&zr->queued_bufs, struct zr_buffer, queue);
+		if (!buf) {
+			pci_err(zr->pci_dev, "No buffer available to queue\n");
+			spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+			return;
+		}
+		list_del(&buf->queue);
+		zr->buf_in_reserve--;
+		vbuf = &buf->vbuf;
+		vbuf->vb2_buf.state = VB2_BUF_STATE_ACTIVE;
+		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+		payload = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
+		if (payload == 0)
+			payload = zr->buffer_size;
 		if (zr->jpg_settings.TmpDcm == 1) {
 			/* fill 1 stat_com entry */
 			i = (zr->jpg_dma_head -
 			     zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
 			if (!(zr->stat_com[i] & cpu_to_le32(1)))
 				break;
-			zr->stat_com[i] =
-			    cpu_to_le32(zr->jpg_buffers.buffer[frame].jpg.frag_tab_bus);
+			zr->stat_comb[i * 2] = cpu_to_le32(phys_addr);
+			zr->stat_comb[i * 2 + 1] = cpu_to_le32((payload >> 1) | 1);
+			zr->inuse[i] = buf;
+			zr->stat_com[i] = cpu_to_le32(zr->p_scb + i * 2 * 4);
 		} else {
 			/* fill 2 stat_com entries */
 			i = ((zr->jpg_dma_head -
 			      zr->jpg_err_shift) & 1) * 2;
 			if (!(zr->stat_com[i] & cpu_to_le32(1)))
 				break;
-			zr->stat_com[i] =
-			    cpu_to_le32(zr->jpg_buffers.buffer[frame].jpg.frag_tab_bus);
-			zr->stat_com[i + 1] =
-			    cpu_to_le32(zr->jpg_buffers.buffer[frame].jpg.frag_tab_bus);
+			zr->stat_com[i] = cpu_to_le32(zr->p_scb + i * 2 * 4);
+			zr->stat_com[i + 1] = cpu_to_le32(zr->p_scb + i * 2 * 4);
+
+			zr->stat_comb[i * 2] = cpu_to_le32(phys_addr);
+			zr->stat_comb[i * 2 + 1] = cpu_to_le32((payload >> 1) | 1);
+
+			zr->inuse[i] = buf;
+			zr->inuse[i + 1] = NULL;
 		}
-		zr->jpg_buffers.buffer[frame].state = BUZ_STATE_DMA;
 		zr->jpg_dma_head++;
 	}
+	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS)
 		zr->jpg_queued_num++;
 }
@@ -914,8 +863,10 @@ static void zoran_reap_stat_com(struct zoran *zr)
 	u32 stat_com;
 	unsigned int seq;
 	unsigned int dif;
-	struct zoran_buffer *buffer;
-	int frame;
+	unsigned long flags;
+	struct zr_buffer *buf;
+	unsigned int size = 0;
+	u32 fcnt;
 
 	/* In motion decompress we don't have a hardware frame counter,
 	 * we just count the interrupts here */
@@ -923,347 +874,78 @@ static void zoran_reap_stat_com(struct zoran *zr)
 	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS)
 		zr->jpg_seq_num++;
 
+	spin_lock_irqsave(&zr->queued_bufs_lock, flags);
 	while (zr->jpg_dma_tail < zr->jpg_dma_head) {
 		if (zr->jpg_settings.TmpDcm == 1)
-			i = (zr->jpg_dma_tail -
-			     zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
+			i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
 		else
-			i = ((zr->jpg_dma_tail -
-			      zr->jpg_err_shift) & 1) * 2 + 1;
+			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2 + 1;
 
 		stat_com = le32_to_cpu(zr->stat_com[i]);
-
-		if ((stat_com & 1) == 0)
+		if ((stat_com & 1) == 0) {
+			spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 			return;
+		}
+
+		fcnt = (stat_com & GENMASK(31, 24)) >> 24;
+		size = (stat_com & GENMASK(22, 1)) >> 1;
 
-		frame = zr->jpg_pend[zr->jpg_dma_tail & BUZ_MASK_FRAME];
-		buffer = &zr->jpg_buffers.buffer[frame];
-		buffer->bs.ts = ktime_get_ns();
+		buf = zr->inuse[i];
+		buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
 
 		if (zr->codec_mode == BUZ_MODE_MOTION_COMPRESS) {
-			buffer->bs.length = (stat_com & 0x7fffff) >> 1;
+			vb2_set_plane_payload(&buf->vbuf.vb2_buf, 0, size);
 
 			/* update sequence number with the help of the counter in stat_com */
-
-			seq = ((stat_com >> 24) + zr->jpg_err_seq) & 0xff;
+			seq = (fcnt + zr->jpg_err_seq) & 0xff;
 			dif = (seq - zr->jpg_seq_num) & 0xff;
 			zr->jpg_seq_num += dif;
-		} else {
-			buffer->bs.length = 0;
 		}
-		buffer->bs.seq =
-		    zr->jpg_settings.TmpDcm ==
+		buf->vbuf.sequence = zr->jpg_settings.TmpDcm ==
 		    2 ? (zr->jpg_seq_num >> 1) : zr->jpg_seq_num;
-		buffer->state = BUZ_STATE_DONE;
-
-		zr->jpg_dma_tail++;
-	}
-}
-
-static void zoran_restart(struct zoran *zr)
-{
-	/* Now the stat_comm buffer is ready for restart */
-	unsigned int status = 0;
-	int mode;
-
-	if (zr->codec_mode == BUZ_MODE_MOTION_COMPRESS) {
-		decoder_call(zr, video, g_input_status, &status);
-		mode = CODEC_DO_COMPRESSION;
-	} else {
-		status = V4L2_IN_ST_NO_SIGNAL;
-		mode = CODEC_DO_EXPANSION;
-	}
-	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS ||
-	    !(status & V4L2_IN_ST_NO_SIGNAL)) {
-		/********** RESTART code *************/
-		jpeg_codec_reset(zr);
-		zr->codec->set_mode(zr->codec, mode);
-		zr36057_set_jpg(zr, zr->codec_mode);
-		jpeg_start(zr);
-
-		if (zr->num_errors <= 8)
-			pci_info(zr->pci_dev, "Restart\n");
-
-		zr->JPEG_missed = 0;
-		zr->JPEG_error = 2;
-		/********** End RESTART code ***********/
-	}
-}
-
-static void error_handler(struct zoran *zr, u32 astat, u32 stat)
-{
-	int i;
-
-	/* This is JPEG error handling part */
-	if (zr->codec_mode != BUZ_MODE_MOTION_COMPRESS &&
-	    zr->codec_mode != BUZ_MODE_MOTION_DECOMPRESS) {
-		return;
-	}
-
-	if ((stat & 1) == 0 &&
-	    zr->codec_mode == BUZ_MODE_MOTION_COMPRESS &&
-	    zr->jpg_dma_tail - zr->jpg_que_tail >= zr->jpg_buffers.num_buffers) {
-		/* No free buffers... */
-		zoran_reap_stat_com(zr);
-		zoran_feed_stat_com(zr);
-		wake_up_interruptible(&zr->jpg_capq);
-		zr->JPEG_missed = 0;
-		return;
-	}
-
-	if (zr->JPEG_error == 1) {
-		zoran_restart(zr);
-		return;
-	}
-
-	/*
-	 * First entry: error just happened during normal operation
-	 *
-	 * In BUZ_MODE_MOTION_COMPRESS:
-	 *
-	 * Possible glitch in TV signal. In this case we should
-	 * stop the codec and wait for good quality signal before
-	 * restarting it to avoid further problems
-	 *
-	 * In BUZ_MODE_MOTION_DECOMPRESS:
-	 *
-	 * Bad JPEG frame: we have to mark it as processed (codec crashed
-	 * and was not able to do it itself), and to remove it from queue.
-	 */
-	btand(~ZR36057_JMC_Go_en, ZR36057_JMC);
-	udelay(1);
-	stat = stat | (post_office_read(zr, 7, 0) & 3) << 8;
-	btwrite(0, ZR36057_JPC);
-	btor(ZR36057_MCTCR_CFlush, ZR36057_MCTCR);
-	jpeg_codec_reset(zr);
-	jpeg_codec_sleep(zr, 1);
-	zr->JPEG_error = 1;
-	zr->num_errors++;
-
-	/* Report error */
-	if (zr36067_debug > 1 && zr->num_errors <= 8) {
-		long frame;
-		int j;
-
-		frame = zr->jpg_pend[zr->jpg_dma_tail & BUZ_MASK_FRAME];
-		pci_err(zr->pci_dev, "JPEG error stat=0x%08x(0x%08x) queue_state=%ld/%ld/%ld/%ld seq=%ld frame=%ld. Codec stopped. ",
-			stat, zr->last_isr,
-			zr->jpg_que_tail, zr->jpg_dma_tail,
-			zr->jpg_dma_head, zr->jpg_que_head,
-			zr->jpg_seq_num, frame);
-		pr_info("stat_com frames:");
-		for (j = 0; j < BUZ_NUM_STAT_COM; j++) {
-			for (i = 0; i < zr->jpg_buffers.num_buffers; i++) {
-				if (le32_to_cpu(zr->stat_com[j]) == zr->jpg_buffers.buffer[i].jpg.frag_tab_bus)
-					printk(KERN_CONT "% d->%d", j, i);
-			}
-		}
-		printk(KERN_CONT "\n");
-	}
-	/* Find an entry in stat_com and rotate contents */
-	if (zr->jpg_settings.TmpDcm == 1)
-		i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
-	else
-		i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2;
-	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS) {
-		/* Mimic zr36067 operation */
-		zr->stat_com[i] |= cpu_to_le32(1);
+		zr->inuse[i] = NULL;
 		if (zr->jpg_settings.TmpDcm != 1)
-			zr->stat_com[i + 1] |= cpu_to_le32(1);
-		/* Refill */
-		zoran_reap_stat_com(zr);
-		zoran_feed_stat_com(zr);
-		wake_up_interruptible(&zr->jpg_capq);
-		/* Find an entry in stat_com again after refill */
-		if (zr->jpg_settings.TmpDcm == 1)
-			i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
+			buf->vbuf.field = zr->jpg_settings.odd_even ?
+				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM;
 		else
-			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2;
-	}
-	if (i) {
-		/* Rotate stat_comm entries to make current entry first */
-		int j;
-		__le32 bus_addr[BUZ_NUM_STAT_COM];
-
-		/* Here we are copying the stat_com array, which
-		 * is already in little endian format, so
-		 * no endian conversions here
-		 */
-		memcpy(bus_addr, zr->stat_com, sizeof(bus_addr));
+			buf->vbuf.field = zr->jpg_settings.odd_even ?
+				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT;
+		vb2_buffer_done(&buf->vbuf.vb2_buf, VB2_BUF_STATE_DONE);
 
-		for (j = 0; j < BUZ_NUM_STAT_COM; j++)
-			zr->stat_com[j] = bus_addr[(i + j) & BUZ_MASK_STAT_COM];
-
-		zr->jpg_err_shift += i;
-		zr->jpg_err_shift &= BUZ_MASK_STAT_COM;
+		zr->jpg_dma_tail++;
 	}
-	if (zr->codec_mode == BUZ_MODE_MOTION_COMPRESS)
-		zr->jpg_err_seq = zr->jpg_seq_num;	/* + 1; */
-	zoran_restart(zr);
+	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 }
 
 irqreturn_t zoran_irq(int irq, void *dev_id)
 {
-	u32 stat, astat;
-	int count = 0;
 	struct zoran *zr = dev_id;
-	unsigned long flags;
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-	while (1) {
-		/* get/clear interrupt status bits */
-		stat = count_reset_interrupt(zr);
-		astat = stat & IRQ_MASK;
-		if (!astat)
-			break;
-		pr_debug("%s: astat: 0x%08x, mask: 0x%08x\n", __func__, astat, btread(ZR36057_ICR));
-		if (astat & zr->card.vsync_int) {	// SW
-
-			if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS ||
-			    zr->codec_mode == BUZ_MODE_MOTION_COMPRESS) {
-				/* count missed interrupts */
-				zr->JPEG_missed++;
-			}
-			//post_office_read(zr,1,0);
-			/*
-			 * Interrupts may still happen when
-			 * zr->v4l_memgrab_active is switched off.
-			 * We simply ignore them
-			 */
-
-			if (zr->v4l_memgrab_active) {
-				/* A lot more checks should be here ... */
-				if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot) == 0)
-					pci_warn(zr->pci_dev, "BuzIRQ with SnapShot off ???\n");
-
-				if (zr->v4l_grab_frame != NO_GRAB_ACTIVE) {
-					/* There is a grab on a frame going on, check if it has finished */
-					if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_FrameGrab) == 0) {
-						/* it is finished, notify the user */
-
-						zr->v4l_buffers.buffer[zr->v4l_grab_frame].state = BUZ_STATE_DONE;
-						zr->v4l_buffers.buffer[zr->v4l_grab_frame].bs.seq = zr->v4l_grab_seq;
-						zr->v4l_buffers.buffer[zr->v4l_grab_frame].bs.ts = ktime_get_ns();
-						zr->v4l_grab_frame = NO_GRAB_ACTIVE;
-						zr->v4l_pend_tail++;
-					}
-				}
-
-				if (zr->v4l_grab_frame == NO_GRAB_ACTIVE)
-					wake_up_interruptible(&zr->v4l_capq);
-
-				/* Check if there is another grab queued */
-
-				if (zr->v4l_grab_frame == NO_GRAB_ACTIVE &&
-				    zr->v4l_pend_tail != zr->v4l_pend_head) {
-					int frame = zr->v4l_pend[zr->v4l_pend_tail & V4L_MASK_FRAME];
-					u32 reg;
-
-					zr->v4l_grab_frame = frame;
-
-					/* Set zr36057 video front end and enable video */
-
-					/* Buffer address */
-
-					reg = zr->v4l_buffers.buffer[frame].v4l.fbuffer_bus;
-					btwrite(reg, ZR36057_VDTR);
-					if (zr->v4l_settings.height > BUZ_MAX_HEIGHT / 2)
-						reg += zr->v4l_settings.bytesperline;
-					btwrite(reg, ZR36057_VDBR);
-
-					/* video stride, status, and frame grab register */
-					reg = 0;
-					if (zr->v4l_settings.height > BUZ_MAX_HEIGHT / 2)
-						reg += zr->v4l_settings.bytesperline;
-					reg = (reg << ZR36057_VSSFGR_DispStride);
-					reg |= ZR36057_VSSFGR_VidOvf;
-					reg |= ZR36057_VSSFGR_SnapShot;
-					reg |= ZR36057_VSSFGR_FrameGrab;
-					btwrite(reg, ZR36057_VSSFGR);
-
-					btor(ZR36057_VDCR_VidEn, ZR36057_VDCR);
-				}
-			}
-
-			/*
-			 * even if we don't grab, we do want to increment
-			 * the sequence counter to see lost frames
-			 */
-			zr->v4l_grab_seq++;
-		}
-#if (IRQ_MASK & ZR36057_ISR_CodRepIRQ)
-		if (astat & ZR36057_ISR_CodRepIRQ) {
-			zr->intr_counter_CodRepIRQ++;
-			IDEBUG(printk(KERN_DEBUG "%s: ZR36057_ISR_CodRepIRQ\n", ZR_DEVNAME(zr)));
-			btand(~ZR36057_ICR_CodRepIRQ, ZR36057_ICR);
-		}
-#endif				/* (IRQ_MASK & ZR36057_ISR_CodRepIRQ) */
-
-#if (IRQ_MASK & ZR36057_ISR_JPEGRepIRQ)
-		if ((astat & ZR36057_ISR_JPEGRepIRQ) &&
-		    (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS ||
-		     zr->codec_mode == BUZ_MODE_MOTION_COMPRESS)) {
-			if (zr36067_debug > 1 && (!zr->frame_num || zr->JPEG_error)) {
-				char sv[BUZ_NUM_STAT_COM + 1];
-				int i;
-
-				pr_info("%s: first frame ready: state=0x%08x odd_even=%d field_per_buff=%d delay=%d\n",
-					ZR_DEVNAME(zr), stat, zr->jpg_settings.odd_even,
-				       zr->jpg_settings.field_per_buff, zr->JPEG_missed);
-
-				for (i = 0; i < BUZ_NUM_STAT_COM; i++)
-					sv[i] = le32_to_cpu(zr->stat_com[i]) & 1 ? '1' : '0';
-				sv[BUZ_NUM_STAT_COM] = 0;
-				pr_info("%s: stat_com=%s queue_state=%ld/%ld/%ld/%ld\n",
-					ZR_DEVNAME(zr), sv, zr->jpg_que_tail, zr->jpg_dma_tail,
-				       zr->jpg_dma_head, zr->jpg_que_head);
-			} else {
-				/* Get statistics */
-				if (zr->JPEG_missed > zr->JPEG_max_missed)
-					zr->JPEG_max_missed = zr->JPEG_missed;
-				if (zr->JPEG_missed < zr->JPEG_min_missed)
-					zr->JPEG_min_missed = zr->JPEG_missed;
-			}
-
-			if (zr36067_debug > 2 && zr->frame_num < 6) {
-				int i;
+	u32 stat, astat;
 
-				pr_info("%s: seq=%ld stat_com:", ZR_DEVNAME(zr), zr->jpg_seq_num);
-				for (i = 0; i < 4; i++)
-					printk(KERN_CONT " %08x", le32_to_cpu(zr->stat_com[i]));
-				printk(KERN_CONT "\n");
-			}
-			zr->frame_num++;
-			zr->JPEG_missed = 0;
-			zr->JPEG_error = 0;
-			zoran_reap_stat_com(zr);
-			zoran_feed_stat_com(zr);
-			wake_up_interruptible(&zr->jpg_capq);
+	stat = count_reset_interrupt(zr);
+	astat = stat & IRQ_MASK;
+	if (astat & zr->card.vsync_int) {
+		if (zr->running == ZORAN_MAP_MODE_RAW) {
+			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_SnapShot) == 0)
+				pci_warn(zr->pci_dev, "BuzIRQ with SnapShot off ???\n");
+			if ((btread(ZR36057_VSSFGR) & ZR36057_VSSFGR_FrameGrab) == 0)
+				zr_set_buf(zr);
+			return IRQ_HANDLED;
 		}
-#endif				/* (IRQ_MASK & ZR36057_ISR_JPEGRepIRQ) */
-
-		/* DATERR, too many fields missed, error processing */
-		if ((astat & zr->card.jpeg_int) ||
-		    zr->JPEG_missed > 25 ||
-		    zr->JPEG_error == 1	||
-		    ((zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS) &&
-		     (zr->frame_num && (zr->JPEG_missed > zr->jpg_settings.field_per_buff)))) {
-			error_handler(zr, astat, stat);
-		}
-
-		count++;
-		if (count > 10) {
-			pci_warn(zr->pci_dev, "irq loop %d\n", count);
-			if (count > 20) {
-				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
-				pci_err(zr->pci_dev, "IRQ lockup, cleared int mask\n");
-				break;
+		if (astat & ZR36057_ISR_JPEGRepIRQ) {
+			if (zr->codec_mode != BUZ_MODE_MOTION_DECOMPRESS &&
+			    zr->codec_mode != BUZ_MODE_MOTION_COMPRESS) {
+				pci_err(zr->pci_dev, "JPG IRQ when not in good mode\n");
+				return IRQ_HANDLED;
 			}
+		zr->frame_num++;
+		zoran_reap_stat_com(zr);
+		zoran_feed_stat_com(zr);
+		return IRQ_HANDLED;
 		}
-		zr->last_isr = stat;
+		/* unused interrupts */
 	}
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
+	zr->ghost_int++;
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index a6fb41d03186..c5b2ccb00ca9 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -35,7 +35,6 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
-#include <linux/vmalloc.h>
 #include <linux/wait.h>
 
 #include <linux/interrupt.h>
@@ -50,7 +49,6 @@
 #include <media/v4l2-event.h>
 #include "videocodec.h"
 
-#include <asm/byteorder.h>
 #include <linux/io.h>
 #include <linux/uaccess.h>
 
@@ -159,234 +157,8 @@ static __u32 zoran_v4l2_calc_bufsize(struct zoran_jpg_settings *settings)
 		return jpg_bufsize;
 	if (result < 8192)
 		return 8192;
-	return result;
-}
-
-/* forward references */
-static void v4l_fbuffer_free(struct zoran_fh *fh);
-static void jpg_fbuffer_free(struct zoran_fh *fh);
-
-/* Set mapping mode */
-static void map_mode_raw(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-	fh->map_mode = ZORAN_MAP_MODE_RAW;
-	zr->buffer_size = v4l_bufsize;
-	fh->buffers.num_buffers = v4l_nbufs;
-}
-
-static void map_mode_jpg(struct zoran_fh *fh, int play)
-{
-	struct zoran *zr = fh->zr;
-
-	fh->map_mode = play ? ZORAN_MAP_MODE_JPG_PLAY : ZORAN_MAP_MODE_JPG_REC;
-	zr->buffer_size = jpg_bufsize;
-	fh->buffers.num_buffers = jpg_nbufs;
-}
-
-static inline const char *mode_name(enum zoran_map_mode mode)
-{
-	return mode == ZORAN_MAP_MODE_RAW ? "V4L" : "JPG";
-}
-
-/*
- *   Allocate the V4L grab buffers
- *
- *   These have to be pysically contiguous.
- */
-
-static int v4l_fbuffer_alloc(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-	int i, off;
-	unsigned char *mem;
-
-	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (fh->buffers.buffer[i].v4l.fbuffer)
-			pci_warn(zr->pci_dev, "%s - buffer %d already allocated!?\n", __func__, i);
-
-		//udelay(20);
-		mem = kmalloc(zr->buffer_size, GFP_KERNEL | __GFP_NOWARN);
-		if (!mem) {
-			pci_err(zr->pci_dev, "%s - kmalloc for V4L buf %d failed\n", __func__, i);
-			v4l_fbuffer_free(fh);
-			return -ENOBUFS;
-		}
-		fh->buffers.buffer[i].v4l.fbuffer = mem;
-		fh->buffers.buffer[i].v4l.fbuffer_phys = virt_to_phys(mem);
-		fh->buffers.buffer[i].v4l.fbuffer_bus = virt_to_bus(mem);
-		for (off = 0; off < zr->buffer_size;
-		     off += PAGE_SIZE)
-			SetPageReserved(virt_to_page(mem + off));
-		pci_info(zr->pci_dev, "%s - V4L frame %d mem %p (bus: 0x%llx)\n", __func__, i, mem,
-			 (unsigned long long)virt_to_bus(mem));
-	}
-
-	fh->buffers.allocated = 1;
-
-	return 0;
-}
-
-/* free the V4L grab buffers */
-static void v4l_fbuffer_free(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-	int i, off;
-	unsigned char *mem;
-
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
-
-	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (!fh->buffers.buffer[i].v4l.fbuffer)
-			continue;
-
-		mem = fh->buffers.buffer[i].v4l.fbuffer;
-		for (off = 0; off < zr->buffer_size;
-		     off += PAGE_SIZE)
-			ClearPageReserved(virt_to_page(mem + off));
-		kfree(fh->buffers.buffer[i].v4l.fbuffer);
-		fh->buffers.buffer[i].v4l.fbuffer = NULL;
-	}
 
-	fh->buffers.allocated = 0;
-}
-
-/*
- *   Allocate the MJPEG grab buffers.
- *
- *   If a Natoma chipset is present and this is a revision 1 zr36057,
- *   each MJPEG buffer needs to be physically contiguous.
- *   (RJ: This statement is from Dave Perks' original driver,
- *   I could never check it because I have a zr36067)
- *
- *   RJ: The contents grab buffers needs never be accessed in the driver.
- *       Therefore there is no need to allocate them with vmalloc in order
- *       to get a contiguous virtual memory space.
- *       I don't understand why many other drivers first allocate them with
- *       vmalloc (which uses internally also get_zeroed_page, but delivers you
- *       virtual addresses) and then again have to make a lot of efforts
- *       to get the physical address.
- *
- *   Ben Capper:
- *       On big-endian architectures (such as ppc) some extra steps
- *       are needed. When reading and writing to the stat_com array
- *       and fragment buffers, the device expects to see little-
- *       endian values. The use of cpu_to_le32() and le32_to_cpu()
- *       in this function (and one or two others in zoran_device.c)
- *       ensure that these values are always stored in little-endian
- *       form, regardless of architecture. The zr36057 does Very Bad
- *       Things on big endian architectures if the stat_com array
- *       and fragment buffers are not little-endian.
- */
-
-static int jpg_fbuffer_alloc(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-	int i, j, off;
-	u8 *mem;
-
-	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (fh->buffers.buffer[i].jpg.frag_tab)
-			pci_warn(zr->pci_dev, "%s - buffer %d already allocated!?\n", __func__, i);
-
-		/* Allocate fragment table for this buffer */
-
-		mem = (void *)get_zeroed_page(GFP_KERNEL);
-		if (!mem) {
-			pci_err(zr->pci_dev, "%s - get_zeroed_page (frag_tab) failed for buffer %d\n", __func__, i);
-			jpg_fbuffer_free(fh);
-			return -ENOBUFS;
-		}
-		fh->buffers.buffer[i].jpg.frag_tab = (__le32 *)mem;
-		fh->buffers.buffer[i].jpg.frag_tab_bus = virt_to_bus(mem);
-
-		if (fh->buffers.need_contiguous) {
-			mem = kmalloc(zr->buffer_size, GFP_KERNEL);
-			if (!mem) {
-				pci_err(zr->pci_dev, "%s - kmalloc failed for buffer %d\n", __func__, i);
-				jpg_fbuffer_free(fh);
-				return -ENOBUFS;
-			}
-			fh->buffers.buffer[i].jpg.frag_tab[0] =
-				cpu_to_le32(virt_to_bus(mem));
-			fh->buffers.buffer[i].jpg.frag_tab[1] =
-				cpu_to_le32((zr->buffer_size >> 1) | 1);
-			for (off = 0; off < zr->buffer_size; off += PAGE_SIZE)
-				SetPageReserved(virt_to_page(mem + off));
-		} else {
-			/* jpg_bufsize is already page aligned */
-			for (j = 0; j < zr->buffer_size / PAGE_SIZE; j++) {
-				mem = (void *)get_zeroed_page(GFP_KERNEL);
-				if (!mem) {
-					pci_err(zr->pci_dev, "%s - get_zeroed_page failed for buffer %d\n", __func__, i);
-					jpg_fbuffer_free(fh);
-					return -ENOBUFS;
-				}
-
-				fh->buffers.buffer[i].jpg.frag_tab[2 * j] =
-					cpu_to_le32(virt_to_bus(mem));
-				fh->buffers.buffer[i].jpg.frag_tab[2 * j + 1] =
-					cpu_to_le32((PAGE_SIZE >> 2) << 1);
-				SetPageReserved(virt_to_page(mem));
-			}
-
-			fh->buffers.buffer[i].jpg.frag_tab[2 * j - 1] |= cpu_to_le32(1);
-		}
-	}
-
-	pci_dbg(zr->pci_dev, "%s - %d KB allocated\n", __func__,
-		(fh->buffers.num_buffers * zr->buffer_size) >> 10);
-
-	fh->buffers.allocated = 1;
-
-	return 0;
-}
-
-/* free the MJPEG grab buffers */
-static void jpg_fbuffer_free(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-	int i, j, off;
-	unsigned char *mem;
-	__le32 frag_tab;
-	struct zoran_buffer *buffer;
-
-	pci_dbg(zr->pci_dev, "%s\n", __func__);
-
-	for (i = 0, buffer = &fh->buffers.buffer[0];
-	     i < fh->buffers.num_buffers; i++, buffer++) {
-		if (!buffer->jpg.frag_tab)
-			continue;
-
-		if (fh->buffers.need_contiguous) {
-			frag_tab = buffer->jpg.frag_tab[0];
-
-			if (frag_tab) {
-				mem = bus_to_virt(le32_to_cpu(frag_tab));
-				for (off = 0; off < zr->buffer_size; off += PAGE_SIZE)
-					ClearPageReserved(virt_to_page(mem + off));
-				kfree(mem);
-				buffer->jpg.frag_tab[0] = 0;
-				buffer->jpg.frag_tab[1] = 0;
-			}
-		} else {
-			for (j = 0; j < zr->buffer_size / PAGE_SIZE; j++) {
-				frag_tab = buffer->jpg.frag_tab[2 * j];
-
-				if (!frag_tab)
-					break;
-				ClearPageReserved(virt_to_page(bus_to_virt(le32_to_cpu(frag_tab))));
-				free_page((unsigned long)bus_to_virt(le32_to_cpu(frag_tab)));
-				buffer->jpg.frag_tab[2 * j] = 0;
-				buffer->jpg.frag_tab[2 * j + 1] = 0;
-			}
-		}
-
-		free_page((unsigned long)buffer->jpg.frag_tab);
-		buffer->jpg.frag_tab = NULL;
-	}
-
-	fh->buffers.allocated = 0;
+	return result;
 }
 
 /*
@@ -431,561 +203,8 @@ static int zoran_v4l_set_format(struct zoran *zr, int width, int height,
 	return 0;
 }
 
-static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
-{
-	struct zoran *zr = fh->zr;
-	unsigned long flags;
-	int res = 0;
-
-	if (!fh->buffers.allocated) {
-		pci_err(zr->pci_dev, "%s - buffers not yet allocated\n", __func__);
-		res = -ENOMEM;
-	}
-
-	/* No grabbing outside the buffer range! */
-	if (num >= fh->buffers.num_buffers || num < 0) {
-		pci_err(zr->pci_dev, "%s - buffer %d is out of range\n", __func__, num);
-		res = -EINVAL;
-	}
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-
-	if (fh->buffers.active == ZORAN_FREE) {
-		if (zr->v4l_buffers.active == ZORAN_FREE) {
-			zr->v4l_buffers = fh->buffers;
-			fh->buffers.active = ZORAN_ACTIVE;
-		} else {
-			pci_err(zr->pci_dev, "%s - another session is already capturing\n", __func__);
-			res = -EBUSY;
-		}
-	}
-
-	/* make sure a grab isn't going on currently with this buffer */
-	if (!res) {
-		switch (zr->v4l_buffers.buffer[num].state) {
-		default:
-		case BUZ_STATE_PEND:
-			if (zr->v4l_buffers.active == ZORAN_FREE) {
-				fh->buffers.active = ZORAN_FREE;
-				zr->v4l_buffers.allocated = 0;
-			}
-			res = -EBUSY;	/* what are you doing? */
-			break;
-		case BUZ_STATE_DONE:
-			pci_warn(zr->pci_dev, "%s - queueing buffer %d in state DONE!?\n", __func__, num);
-			/* fallthrough */
-		case BUZ_STATE_USER:
-			/* since there is at least one unused buffer there's room for at least
-			 * one more pend[] entry */
-			zr->v4l_pend[zr->v4l_pend_head++ & V4L_MASK_FRAME] = num;
-			zr->v4l_buffers.buffer[num].state = BUZ_STATE_PEND;
-			zr->v4l_buffers.buffer[num].bs.length =
-			    zr->v4l_settings.bytesperline *
-			    zr->v4l_settings.height;
-			fh->buffers.buffer[num] = zr->v4l_buffers.buffer[num];
-			break;
-		}
-	}
-
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
-	if (!res && zr->v4l_buffers.active == ZORAN_FREE)
-		zr->v4l_buffers.active = fh->buffers.active;
-
-	return res;
-}
-
-/*
- * Sync on a V4L buffer
- */
-
-static int v4l_sync(struct zoran_fh *fh, int frame)
-{
-	struct zoran *zr = fh->zr;
-	unsigned long flags;
-
-	if (fh->buffers.active == ZORAN_FREE) {
-		pci_err(zr->pci_dev, "%s - no grab active for this session\n", __func__);
-		return -EINVAL;
-	}
-
-	/* check passed-in frame number */
-	if (frame >= fh->buffers.num_buffers || frame < 0) {
-		pci_err(zr->pci_dev, "%s - frame %d is invalid\n", __func__, frame);
-		return -EINVAL;
-	}
-
-	/* Check if is buffer was queued at all */
-	if (zr->v4l_buffers.buffer[frame].state == BUZ_STATE_USER) {
-		pci_err(zr->pci_dev, "%s - attempt to sync on a buffer which was not queued?\n", __func__);
-		return -EPROTO;
-	}
-
-	mutex_unlock(&zr->lock);
-	/* wait on this buffer to get ready */
-	if (!wait_event_interruptible_timeout(zr->v4l_capq,
-		(zr->v4l_buffers.buffer[frame].state != BUZ_STATE_PEND), 10 * HZ)) {
-		mutex_lock(&zr->lock);
-		return -ETIME;
-	}
-	mutex_lock(&zr->lock);
-	if (signal_pending(current))
-		return -ERESTARTSYS;
-
-	/* buffer should now be in BUZ_STATE_DONE */
-	if (zr->v4l_buffers.buffer[frame].state != BUZ_STATE_DONE)
-		pci_err(zr->pci_dev, "%s - internal state error\n", __func__);
-
-	zr->v4l_buffers.buffer[frame].state = BUZ_STATE_USER;
-	fh->buffers.buffer[frame] = zr->v4l_buffers.buffer[frame];
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-
-	/* Check if streaming capture has finished */
-	if (zr->v4l_pend_tail == zr->v4l_pend_head) {
-		zr36057_set_memgrab(zr, 0);
-		if (zr->v4l_buffers.active == ZORAN_ACTIVE) {
-			fh->buffers.active = zr->v4l_buffers.active = ZORAN_FREE;
-			zr->v4l_buffers.allocated = 0;
-		}
-	}
-
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
-	return 0;
-}
-
-/*
- *   Queue a MJPEG buffer for capture/playback
- */
-static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
-				 enum zoran_codec_mode mode)
-{
-	struct zoran *zr = fh->zr;
-	unsigned long flags;
-	int res = 0;
-
-	/* Check if buffers are allocated */
-	if (!fh->buffers.allocated) {
-		pci_err(zr->pci_dev, "%s - buffers not yet allocated\n", __func__);
-		return -ENOMEM;
-	}
-
-	/* No grabbing outside the buffer range! */
-	if (num >= fh->buffers.num_buffers || num < 0) {
-		pci_err(zr->pci_dev, "%s - buffer %d out of range\n", __func__, num);
-		return -EINVAL;
-	}
-
-	/* what is the codec mode right now? */
-	if (zr->codec_mode != BUZ_MODE_IDLE && zr->codec_mode != mode) {
-		/* wrong codec mode active - invalid */
-		pci_err(zr->pci_dev, "%s - codec in wrong mode\n", __func__);
-		return -EINVAL;
-	}
-
-	if (fh->buffers.active == ZORAN_FREE) {
-		if (zr->jpg_buffers.active == ZORAN_FREE) {
-			zr->jpg_buffers = fh->buffers;
-			fh->buffers.active = ZORAN_ACTIVE;
-		} else {
-			pci_err(zr->pci_dev, "%s - another session is already capturing\n", __func__);
-			res = -EBUSY;
-		}
-	}
-
-	if (!res && zr->codec_mode == BUZ_MODE_IDLE) {
-		/* Ok load up the jpeg codec */
-		zr36057_enable_jpg(zr, mode);
-	}
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-
-	if (!res) {
-		switch (zr->jpg_buffers.buffer[num].state) {
-		case BUZ_STATE_DONE:
-			pci_warn(zr->pci_dev, "%s - queuing frame in BUZ_STATE_DONE state!?\n", __func__);
-			/* fallthrough */
-		case BUZ_STATE_USER:
-			/* since there is at least one unused buffer there's room for at
-			 *least one more pend[] entry */
-			zr->jpg_pend[zr->jpg_que_head++ & BUZ_MASK_FRAME] = num;
-			zr->jpg_buffers.buffer[num].state = BUZ_STATE_PEND;
-			fh->buffers.buffer[num] = zr->jpg_buffers.buffer[num];
-			zoran_feed_stat_com(zr);
-			break;
-		default:
-		case BUZ_STATE_DMA:
-		case BUZ_STATE_PEND:
-			if (zr->jpg_buffers.active == ZORAN_FREE) {
-				fh->buffers.active = ZORAN_FREE;
-				zr->jpg_buffers.allocated = 0;
-			}
-			res = -EBUSY;	/* what are you doing? */
-			break;
-		}
-	}
-
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
-	if (!res && zr->jpg_buffers.active == ZORAN_FREE)
-		zr->jpg_buffers.active = fh->buffers.active;
-
-	return res;
-}
-
-static int jpg_qbuf(struct zoran_fh *fh, int frame, enum zoran_codec_mode mode)
-{
-	struct zoran *zr = fh->zr;
-	int res = 0;
-
-	/* Does the user want to stop streaming? */
-	if (frame < 0) {
-		if (zr->codec_mode == mode) {
-			if (fh->buffers.active == ZORAN_FREE) {
-				pci_err(zr->pci_dev, "%s(-1) - session not active\n", __func__);
-				return -EINVAL;
-			}
-			fh->buffers.active = zr->jpg_buffers.active = ZORAN_FREE;
-			zr->jpg_buffers.allocated = 0;
-			zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
-			return 0;
-		} else {
-			pci_err(zr->pci_dev, "%s - stop streaming but not in streaming mode\n", __func__);
-			return -EINVAL;
-		}
-	}
-
-	res = zoran_jpg_queue_frame(fh, frame, mode);
-	if (res)
-		return res;
-
-	/* Start the jpeg codec when the first frame is queued */
-	if (!res && zr->jpg_que_head == 1)
-		jpeg_start(zr);
-
-	return res;
-}
-
-/*
- *   Sync on a MJPEG buffer
- */
-
-static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
-{
-	struct zoran *zr = fh->zr;
-	unsigned long flags;
-	int frame;
-
-	if (fh->buffers.active == ZORAN_FREE) {
-		pci_err(zr->pci_dev, "%s - capture is not currently active\n", __func__);
-		return -EINVAL;
-	}
-	if (zr->codec_mode != BUZ_MODE_MOTION_DECOMPRESS &&
-	    zr->codec_mode != BUZ_MODE_MOTION_COMPRESS) {
-		pci_err(zr->pci_dev, "%s - codec not in streaming mode\n", __func__);
-		return -EINVAL;
-	}
-	mutex_unlock(&zr->lock);
-	if (!wait_event_interruptible_timeout(zr->jpg_capq,
-					      (zr->jpg_que_tail != zr->jpg_dma_tail ||
-			 zr->jpg_dma_tail == zr->jpg_dma_head),
-			10 * HZ)) {
-		int isr;
-
-		btand(~ZR36057_JMC_Go_en, ZR36057_JMC);
-		udelay(1);
-		zr->codec->control(zr->codec, CODEC_G_STATUS, sizeof(isr), &isr);
-		mutex_lock(&zr->lock);
-		pci_err(zr->pci_dev, "%s - timeout: codec isr=0x%02x\n", __func__, isr);
-
-		return -ETIME;
-	}
-	mutex_lock(&zr->lock);
-	if (signal_pending(current))
-		return -ERESTARTSYS;
-
-	spin_lock_irqsave(&zr->spinlock, flags);
-
-	if (zr->jpg_dma_tail != zr->jpg_dma_head)
-		frame = zr->jpg_pend[zr->jpg_que_tail++ & BUZ_MASK_FRAME];
-	else
-		frame = zr->jpg_pend[zr->jpg_que_tail & BUZ_MASK_FRAME];
-
-	/* buffer should now be in BUZ_STATE_DONE */
-	if (zr->jpg_buffers.buffer[frame].state != BUZ_STATE_DONE)
-		pci_err(zr->pci_dev, "%s - internal state error\n", __func__);
-
-	*bs = zr->jpg_buffers.buffer[frame].bs;
-	bs->frame = frame;
-	zr->jpg_buffers.buffer[frame].state = BUZ_STATE_USER;
-	fh->buffers.buffer[frame] = zr->jpg_buffers.buffer[frame];
-
-	spin_unlock_irqrestore(&zr->spinlock, flags);
-
-	return 0;
-}
-
-static void zoran_open_init_session(struct zoran_fh *fh)
-{
-	int i;
-
-	/* Per default, map the V4L Buffers */
-	map_mode_raw(fh);
-
-	/* buffers */
-	memset(&fh->buffers, 0, sizeof(fh->buffers));
-	for (i = 0; i < MAX_FRAME; i++) {
-		fh->buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-		fh->buffers.buffer[i].bs.frame = i;
-	}
-	fh->buffers.allocated = 0;
-	fh->buffers.active = ZORAN_FREE;
-}
-
-static void zoran_close_end_session(struct zoran_fh *fh)
-{
-	struct zoran *zr = fh->zr;
-
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		/* v4l capture */
-		if (fh->buffers.active != ZORAN_FREE) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&zr->spinlock, flags);
-			zr36057_set_memgrab(zr, 0);
-			zr->v4l_buffers.allocated = 0;
-			zr->v4l_buffers.active = fh->buffers.active = ZORAN_FREE;
-			spin_unlock_irqrestore(&zr->spinlock, flags);
-		}
-
-		/* v4l buffers */
-		if (fh->buffers.allocated)
-			v4l_fbuffer_free(fh);
-	} else {
-		/* jpg capture */
-		if (fh->buffers.active != ZORAN_FREE) {
-			zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
-			zr->jpg_buffers.allocated = 0;
-			zr->jpg_buffers.active = fh->buffers.active = ZORAN_FREE;
-		}
-
-		/* jpg buffers */
-		if (fh->buffers.allocated)
-			jpg_fbuffer_free(fh);
-	}
-}
-
-/*
- *   Open a zoran card. Right now the flags stuff is just playing
- */
-static int zoran_open(struct file *file)
-{
-	struct zoran *zr = video_drvdata(file);
-	struct zoran_fh *fh;
-	int res, first_open = 0;
-
-	pci_info(zr->pci_dev, "%s(%s, pid=[%d]), users(-)=%d\n", __func__, current->comm,
-		 task_pid_nr(current), zr->user + 1);
-
-	mutex_lock(&zr->lock);
-
-	if (zr->user >= 2048) {
-		pci_err(zr->pci_dev, "too many users (%d) on device\n", zr->user);
-		res = -EBUSY;
-		goto fail_unlock;
-	}
-
-	/* now, create the open()-specific file_ops struct */
-	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
-	if (!fh) {
-		res = -ENOMEM;
-		goto fail_unlock;
-	}
-	v4l2_fh_init(&fh->fh, video_devdata(file));
-
-	if (zr->user++ == 0)
-		first_open = 1;
-
-	/* default setup - TODO: look at flags */
-	if (first_open) {	/* First device open */
-		zr36057_restart(zr);
-		zoran_open_init_params(zr);
-		zoran_init_hardware(zr);
-
-		btor(ZR36057_ICR_IntPinEn, ZR36057_ICR);
-	}
-
-	/* set file_ops stuff */
-	file->private_data = fh;
-	fh->zr = zr;
-	zoran_open_init_session(fh);
-	v4l2_fh_add(&fh->fh);
-	mutex_unlock(&zr->lock);
-
-	return 0;
-
-fail_unlock:
-	mutex_unlock(&zr->lock);
-
-	pci_info(zr->pci_dev, "open failed (%d), users(-)=%d\n", res, zr->user);
-
-	return res;
-}
-
-static int zoran_close(struct file *file)
-{
-	struct zoran_fh *fh = file->private_data;
-	struct zoran *zr = fh->zr;
-
-	pci_info(zr->pci_dev, "%s(%s, pid=[%d]), users(+)=%d\n", __func__, current->comm,
-		 task_pid_nr(current), zr->user - 1);
-
-	/* kernel locks (fs/device.c), so don't do that ourselves
-	 * (prevents deadlocks) */
-	mutex_lock(&zr->lock);
-
-	zoran_close_end_session(fh);
-
-	if (zr->user-- == 1) {	/* Last process */
-		/* Clean up JPEG process */
-		wake_up_interruptible(&zr->jpg_capq);
-		zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
-		zr->jpg_buffers.allocated = 0;
-		zr->jpg_buffers.active = ZORAN_FREE;
-
-		/* disable interrupts */
-		btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
-
-		if (zr36067_debug > 1)
-			print_interrupts(zr);
-
-		/* capture off */
-		wake_up_interruptible(&zr->v4l_capq);
-		zr36057_set_memgrab(zr, 0);
-		zr->v4l_buffers.allocated = 0;
-		zr->v4l_buffers.active = ZORAN_FREE;
-		zoran_set_pci_master(zr, 0);
-
-		if (!pass_through) {	/* Switch to color bar */
-			decoder_call(zr, video, s_stream, 0);
-			encoder_call(zr, video, s_routing, 2, 0, 0);
-		}
-	}
-	mutex_unlock(&zr->lock);
-
-	v4l2_fh_del(&fh->fh);
-	v4l2_fh_exit(&fh->fh);
-	kfree(fh);
-
-	pci_dbg(zr->pci_dev, "%s done\n", __func__);
-
-	return 0;
-}
-
-/* get the status of a buffer in the clients buffer queue */
-static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
-				    struct v4l2_buffer *buf, int num)
-{
-	struct zoran *zr = fh->zr;
-	unsigned long flags;
-
-	buf->flags = V4L2_BUF_FLAG_MAPPED | V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:
-		/* check range */
-		if (num < 0 || num >= fh->buffers.num_buffers ||
-		    !fh->buffers.allocated) {
-			pci_err(zr->pci_dev, "%s - wrong number or buffers not allocated\n", __func__);
-			return -EINVAL;
-		}
-
-		spin_lock_irqsave(&zr->spinlock, flags);
-		pci_dbg(zr->pci_dev, "%s() - raw active=%c, buffer %d: state=%c, map=%c\n", __func__,
-			"FAL"[fh->buffers.active], num,
-			"UPMD"[zr->v4l_buffers.buffer[num].state],
-			fh->buffers.buffer[num].map ? 'Y' : 'N');
-		spin_unlock_irqrestore(&zr->spinlock, flags);
-
-		buf->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-		buf->length = zr->buffer_size;
-
-		/* get buffer */
-		buf->bytesused = fh->buffers.buffer[num].bs.length;
-		if (fh->buffers.buffer[num].state == BUZ_STATE_DONE ||
-		    fh->buffers.buffer[num].state == BUZ_STATE_USER) {
-			buf->sequence = fh->buffers.buffer[num].bs.seq;
-			buf->flags |= V4L2_BUF_FLAG_DONE;
-			v4l2_buffer_set_timestamp(buf, fh->buffers.buffer[num].bs.ts);
-		} else {
-			buf->flags |= V4L2_BUF_FLAG_QUEUED;
-		}
-
-		if (zr->v4l_settings.height <= BUZ_MAX_HEIGHT / 2)
-			buf->field = V4L2_FIELD_TOP;
-		else
-			buf->field = V4L2_FIELD_INTERLACED;
-
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-
-		/* check range */
-		if (num < 0 || num >= fh->buffers.num_buffers ||
-		    !fh->buffers.allocated) {
-			pci_err(zr->pci_dev, "%s - wrong number or buffers not allocated\n", __func__);
-			return -EINVAL;
-		}
-
-		buf->type = (fh->map_mode == ZORAN_MAP_MODE_JPG_REC) ?
-			      V4L2_BUF_TYPE_VIDEO_CAPTURE :
-			      V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		buf->length = zr->buffer_size;
-
-		/* these variables are only written after frame has been captured */
-		if (fh->buffers.buffer[num].state == BUZ_STATE_DONE ||
-		    fh->buffers.buffer[num].state == BUZ_STATE_USER) {
-			buf->sequence = fh->buffers.buffer[num].bs.seq;
-			v4l2_buffer_set_timestamp(buf, fh->buffers.buffer[num].bs.ts);
-			buf->bytesused = fh->buffers.buffer[num].bs.length;
-			buf->flags |= V4L2_BUF_FLAG_DONE;
-		} else {
-			buf->flags |= V4L2_BUF_FLAG_QUEUED;
-		}
-
-		/* which fields are these? */
-		if (zr->jpg_settings.TmpDcm != 1)
-			buf->field = zr->jpg_settings.odd_even ?
-				V4L2_FIELD_TOP : V4L2_FIELD_BOTTOM;
-		else
-			buf->field = zr->jpg_settings.odd_even ?
-				V4L2_FIELD_SEQ_TB : V4L2_FIELD_SEQ_BT;
-
-		break;
-
-	default:
-
-		pci_err(zr->pci_dev, "%s - invalid buffer type|map_mode (%d|%d)\n",
-		       __func__, buf->type, fh->map_mode);
-		return -EINVAL;
-	}
-
-	buf->memory = V4L2_MEMORY_MMAP;
-	buf->index = num;
-	buf->m.offset = buf->length * num;
-
-	return 0;
-}
-
 static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 {
-	if (zr->v4l_buffers.active != ZORAN_FREE ||
-	    zr->jpg_buffers.active != ZORAN_FREE) {
-		pr_warn("%s: %s called while in playback/capture mode\n", ZR_DEVNAME(zr), __func__);
-		return -EBUSY;
-	}
 
 	if (!(norm & zr->card.norms)) {
 		pci_err(zr->pci_dev, "%s - unsupported norm %llx\n", __func__, norm);
@@ -1013,12 +232,6 @@ static int zoran_set_input(struct zoran *zr, int input)
 	if (input == zr->input)
 		return 0;
 
-	if (zr->v4l_buffers.active != ZORAN_FREE ||
-	    zr->jpg_buffers.active != ZORAN_FREE) {
-		pci_warn(zr->pci_dev, "%s called while in playback/capture mode\n", __func__);
-		return -EBUSY;
-	}
-
 	if (input < 0 || input >= zr->card.inputs) {
 		pci_err(zr->pci_dev, "%s - unsupported input %d\n", __func__, input);
 		return -EINVAL;
@@ -1119,12 +332,10 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 			       struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-
-	if (fh->map_mode != ZORAN_MAP_MODE_RAW)
-		return zoran_g_fmt_vid_out(file, fh, fmt);
+	struct zoran *zr = video_drvdata(file);
 
+	if (zr->map_mode != ZORAN_MAP_MODE_RAW)
+		return zoran_g_fmt_vid_out(file, __fh, fmt);
 	fmt->fmt.pix.width = zr->v4l_settings.width;
 	fmt->fmt.pix.height = zr->v4l_settings.height;
 	fmt->fmt.pix.sizeimage = zr->buffer_size;
@@ -1205,13 +416,12 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 				 struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	int bpp;
 	int i;
 
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
-		return zoran_try_fmt_vid_out(file, fh, fmt);
+		return zoran_try_fmt_vid_out(file, __fh, fmt);
 
 	for (i = 0; i < NUM_FORMATS; i++)
 		if (zoran_formats[i].fourcc == fmt->fmt.pix.pixelformat)
@@ -1238,8 +448,7 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 			       struct v4l2_format *fmt)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	__le32 printformat = __cpu_to_le32(fmt->fmt.pix.pixelformat);
 	struct zoran_jpg_settings settings;
 	int res = 0;
@@ -1251,12 +460,6 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_MJPEG)
 		return -EINVAL;
 
-	if (fh->buffers.allocated) {
-		pci_err(zr->pci_dev, "VIDIOC_S_FMT - cannot change capture mode\n");
-		res = -EBUSY;
-		return res;
-	}
-
 	if (!fmt->fmt.pix.height || !fmt->fmt.pix.width)
 		return -EINVAL;
 
@@ -1299,7 +502,11 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	/* it's ok, so set them */
 	zr->jpg_settings = settings;
 
-	map_mode_jpg(fh, fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	if (fmt->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		zr->map_mode = ZORAN_MAP_MODE_JPG_REC;
+	else
+		zr->map_mode = ZORAN_MAP_MODE_JPG_PLAY;
+
 	zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
 
 	/* tell the user what we actually did */
@@ -1339,13 +546,6 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 		return -EINVAL;
 	}
 
-	if ((fh->map_mode != ZORAN_MAP_MODE_RAW && fh->buffers.allocated) ||
-	    fh->buffers.active != ZORAN_FREE) {
-		pci_err(zr->pci_dev, "VIDIOC_S_FMT - cannot change capture mode\n");
-		res = -EBUSY;
-		return res;
-	}
-
 	fmt->fmt.pix.pixelformat = zoran_formats[i].fourcc;
 	if (fmt->fmt.pix.height > BUZ_MAX_HEIGHT)
 		fmt->fmt.pix.height = BUZ_MAX_HEIGHT;
@@ -1356,7 +556,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	if (fmt->fmt.pix.width < BUZ_MIN_WIDTH)
 		fmt->fmt.pix.width = BUZ_MIN_WIDTH;
 
-	map_mode_raw(fh);
+	zr->map_mode = ZORAN_MAP_MODE_RAW;
 
 	res = zoran_v4l_set_format(zr, fmt->fmt.pix.width, fmt->fmt.pix.height,
 				   &zoran_formats[i]);
@@ -1374,309 +574,6 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	return res;
 }
 
-static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type);
-
-static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffers *req)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0;
-
-	if (req->memory != V4L2_MEMORY_MMAP) {
-		pci_err(zr->pci_dev, "only MEMORY_MMAP capture is supported, not %d\n", req->memory);
-		return -EINVAL;
-	}
-
-	if (req->count == 0)
-		return zoran_streamoff(file, fh, req->type);
-
-	if (fh->buffers.allocated) {
-		pr_warn("%s: VIDIOC_REQBUFS - buffers already allocated\n", ZR_DEVNAME(zr));
-		res = -EBUSY;
-		return res;
-	}
-
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW &&
-	    req->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		/* control user input */
-		if (req->count < 2)
-			req->count = 2;
-		if (req->count > v4l_nbufs)
-			req->count = v4l_nbufs;
-
-		/* The next mmap will map the V4L buffers */
-		map_mode_raw(fh);
-		fh->buffers.num_buffers = req->count;
-
-		if (v4l_fbuffer_alloc(fh)) {
-			res = -ENOMEM;
-			return res;
-		}
-	} else if (fh->map_mode == ZORAN_MAP_MODE_JPG_REC ||
-		   fh->map_mode == ZORAN_MAP_MODE_JPG_PLAY) {
-		/* we need to calculate size ourselves now */
-		if (req->count < 4)
-			req->count = 4;
-		if (req->count > jpg_nbufs)
-			req->count = jpg_nbufs;
-
-		/* The next mmap will map the MJPEG buffers */
-		map_mode_jpg(fh, req->type == V4L2_BUF_TYPE_VIDEO_OUTPUT);
-		fh->buffers.num_buffers = req->count;
-		zr->buffer_size = zoran_v4l2_calc_bufsize(&zr->jpg_settings);
-
-		if (jpg_fbuffer_alloc(fh)) {
-			res = -ENOMEM;
-			return res;
-		}
-	} else {
-		pci_err(zr->pci_dev, "VIDIOC_REQBUFS - unknown type %d\n", req->type);
-		res = -EINVAL;
-		return res;
-	}
-	return res;
-}
-
-static int zoran_querybuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct zoran_fh *fh = __fh;
-
-	return zoran_v4l2_buffer_status(fh, buf, buf->index);
-}
-
-static int zoran_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0, codec_mode, buf_type;
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:
-		if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				buf->type, fh->map_mode);
-			res = -EINVAL;
-			return res;
-		}
-
-		res = zoran_v4l_queue_frame(fh, buf->index);
-		if (res)
-			return res;
-		if (!zr->v4l_memgrab_active && fh->buffers.active == ZORAN_LOCKED)
-			zr36057_set_memgrab(zr, 1);
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-		if (fh->map_mode == ZORAN_MAP_MODE_JPG_PLAY) {
-			buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-			codec_mode = BUZ_MODE_MOTION_DECOMPRESS;
-		} else {
-			buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-			codec_mode = BUZ_MODE_MOTION_COMPRESS;
-		}
-
-		if (buf->type != buf_type) {
-			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				buf->type, fh->map_mode);
-			res = -EINVAL;
-			return res;
-		}
-
-		res = zoran_jpg_queue_frame(fh, buf->index, codec_mode);
-		if (res != 0)
-			return res;
-		if (zr->codec_mode == BUZ_MODE_IDLE &&
-		    fh->buffers.active == ZORAN_LOCKED)
-			zr36057_enable_jpg(zr, codec_mode);
-
-		break;
-
-	default:
-		pci_err(zr->pci_dev, "VIDIOC_QBUF - unsupported type %d\n", buf->type);
-		res = -EINVAL;
-		break;
-	}
-	return res;
-}
-
-static int zoran_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0, buf_type, num = -1;	/* compiler borks here (?) */
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:
-		if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				buf->type, fh->map_mode);
-			res = -EINVAL;
-			return res;
-		}
-
-		num = zr->v4l_pend[zr->v4l_sync_tail & V4L_MASK_FRAME];
-		if (file->f_flags & O_NONBLOCK &&
-		    zr->v4l_buffers.buffer[num].state != BUZ_STATE_DONE) {
-			res = -EAGAIN;
-			return res;
-		}
-		res = v4l_sync(fh, num);
-		if (res)
-			return res;
-		zr->v4l_sync_tail++;
-		res = zoran_v4l2_buffer_status(fh, buf, num);
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-	{
-		struct zoran_sync bs;
-
-		if (fh->map_mode == ZORAN_MAP_MODE_JPG_PLAY)
-			buf_type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
-		else
-			buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-
-		if (buf->type != buf_type) {
-			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				buf->type, fh->map_mode);
-			res = -EINVAL;
-			return res;
-		}
-
-		num = zr->jpg_pend[zr->jpg_que_tail & BUZ_MASK_FRAME];
-
-		if (file->f_flags & O_NONBLOCK &&
-		    zr->jpg_buffers.buffer[num].state != BUZ_STATE_DONE) {
-			res = -EAGAIN;
-			return res;
-		}
-		bs.frame = 0; /* suppress compiler warning */
-		res = jpg_sync(fh, &bs);
-		if (res)
-			return res;
-		res = zoran_v4l2_buffer_status(fh, buf, bs.frame);
-		break;
-	}
-
-	default:
-		pci_err(zr->pci_dev, "VIDIOC_DQBUF - unsupported type %d\n", buf->type);
-		res = -EINVAL;
-		break;
-	}
-	return res;
-}
-
-static int zoran_streamon(struct file *file, void *__fh, enum v4l2_buf_type type)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int res = 0;
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:	/* raw capture */
-		if (zr->v4l_buffers.active != ZORAN_ACTIVE ||
-		    fh->buffers.active != ZORAN_ACTIVE) {
-			res = -EBUSY;
-			return res;
-		}
-
-		zr->v4l_buffers.active = fh->buffers.active = ZORAN_LOCKED;
-
-		zr->v4l_sync_tail = zr->v4l_pend_tail;
-		if (!zr->v4l_memgrab_active &&
-		    zr->v4l_pend_head != zr->v4l_pend_tail) {
-			zr36057_set_memgrab(zr, 1);
-		}
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-		/* what is the codec mode right now? */
-		if (zr->jpg_buffers.active != ZORAN_ACTIVE ||
-		    fh->buffers.active != ZORAN_ACTIVE) {
-			res = -EBUSY;
-			return res;
-		}
-
-		zr->jpg_buffers.active = fh->buffers.active = ZORAN_LOCKED;
-
-		if (zr->jpg_que_head != zr->jpg_que_tail) {
-			/* Start the jpeg codec when the first frame is queued */
-			jpeg_start(zr);
-		}
-		break;
-
-	default:
-		pci_err(zr->pci_dev, "VIDIOC_STREAMON - invalid map mode %d\n", fh->map_mode);
-		res = -EINVAL;
-		break;
-	}
-	return res;
-}
-
-static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type)
-{
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
-	int i, res = 0;
-	unsigned long flags;
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:	/* raw capture */
-		if (fh->buffers.active == ZORAN_FREE &&
-		    zr->v4l_buffers.active != ZORAN_FREE) {
-			res = -EPERM;	/* stay off other's settings! */
-			return res;
-		}
-		if (zr->v4l_buffers.active == ZORAN_FREE)
-			return res;
-
-		spin_lock_irqsave(&zr->spinlock, flags);
-		/* unload capture */
-		if (zr->v4l_memgrab_active)
-			zr36057_set_memgrab(zr, 0);
-
-		for (i = 0; i < fh->buffers.num_buffers; i++)
-			zr->v4l_buffers.buffer[i].state = BUZ_STATE_USER;
-		fh->buffers = zr->v4l_buffers;
-
-		zr->v4l_buffers.active = fh->buffers.active = ZORAN_FREE;
-
-		zr->v4l_grab_seq = 0;
-		zr->v4l_pend_head = zr->v4l_pend_tail = 0;
-		zr->v4l_sync_tail = 0;
-
-		spin_unlock_irqrestore(&zr->spinlock, flags);
-
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-		if (fh->buffers.active == ZORAN_FREE &&
-		    zr->jpg_buffers.active != ZORAN_FREE) {
-			res = -EPERM;	/* stay off other's settings! */
-			return res;
-		}
-		if (zr->jpg_buffers.active == ZORAN_FREE)
-			return res;
-
-		res = jpg_qbuf(fh, -1,
-			       (fh->map_mode == ZORAN_MAP_MODE_JPG_REC) ?
-			     BUZ_MODE_MOTION_COMPRESS :
-			     BUZ_MODE_MOTION_DECOMPRESS);
-		if (res)
-			return res;
-		break;
-	default:
-		pci_err(zr->pci_dev, "VIDIOC_STREAMOFF - invalid map mode %d\n", fh->map_mode);
-		res = -EINVAL;
-		break;
-	}
-	return res;
-}
-
 static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -1690,11 +587,10 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 	struct zoran *zr = video_drvdata(file);
 	int res = 0;
 
-	res = zoran_set_norm(zr, std);
-	if (res)
-		return res;
+	if (zr->running != ZORAN_MAP_MODE_NONE)
+		return -EBUSY;
 
-	res = wait_grab_pending(zr);
+	res = zoran_set_norm(zr, std);
 	return res;
 }
 
@@ -1729,12 +625,10 @@ static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 	struct zoran *zr = video_drvdata(file);
 	int res;
 
-	res = zoran_set_input(zr, input);
-	if (res)
-		return res;
+	if (zr->running != ZORAN_MAP_MODE_NONE)
+		return -EBUSY;
 
-	/* Make sure the changes come into effect */
-	res = wait_grab_pending(zr);
+	res = zoran_set_input(zr, input);
 	return res;
 }
 
@@ -1746,11 +640,12 @@ static int zoran_enum_output(struct file *file, void *__fh,
 
 	outp->index = 0;
 	outp->type = V4L2_OUTPUT_TYPE_ANALOGVGAOVERLAY;
+	outp->std = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM;
+	outp->capabilities = V4L2_OUT_CAP_STD;
 	strscpy(outp->name, "Autodetect", sizeof(outp->name));
 
 	return 0;
 }
-
 static int zoran_g_output(struct file *file, void *__fh, unsigned int *output)
 {
 	*output = 0;
@@ -1765,19 +660,14 @@ static int zoran_s_output(struct file *file, void *__fh, unsigned int output)
 
 	return 0;
 }
-
 /* cropping (sub-frame capture) */
 static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selection *sel)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
-	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		pci_err(zr->pci_dev, "VIDIOC_G_SELECTION - subcapture only supported for compressed capture\n");
+	    sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
+		pci_err(zr->pci_dev, "%s invalid combinaison\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1806,8 +696,7 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 
 static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selection *sel)
 {
-	struct zoran_fh *fh = __fh;
-	struct zoran *zr = fh->zr;
+	struct zoran *zr = video_drvdata(file);
 	struct zoran_jpg_settings settings;
 	int res;
 
@@ -1821,18 +710,13 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
+	if (zr->map_mode == ZORAN_MAP_MODE_RAW) {
 		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - subcapture only supported for compressed capture\n");
 		return -EINVAL;
 	}
 
 	settings = zr->jpg_settings;
 
-	if (fh->buffers.allocated) {
-		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - cannot change settings while active\n");
-		return -EBUSY;
-	}
-
 	/* move into a form that we understand */
 	settings.img_x = sel->r.left;
 	settings.img_y = sel->r.top;
@@ -1849,260 +733,6 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 	return res;
 }
 
-static __poll_t zoran_poll(struct file *file, poll_table  *wait)
-{
-	struct zoran_fh *fh = file->private_data;
-	struct zoran *zr = fh->zr;
-	__poll_t res = v4l2_ctrl_poll(file, wait);
-	int frame;
-	unsigned long flags;
-
-	/* we should check whether buffers are ready to be synced on
-	 * (w/o waits - O_NONBLOCK) here
-	 * if ready for read (sync), return EPOLLIN|EPOLLRDNORM,
-	 * if ready for write (sync), return EPOLLOUT|EPOLLWRNORM,
-	 * if error, return EPOLLERR,
-	 * if no buffers queued or so, return EPOLLNVAL
-	 */
-
-	switch (fh->map_mode) {
-	case ZORAN_MAP_MODE_RAW:
-		poll_wait(file, &zr->v4l_capq, wait);
-		frame = zr->v4l_pend[zr->v4l_sync_tail & V4L_MASK_FRAME];
-
-		spin_lock_irqsave(&zr->spinlock, flags);
-		pci_dbg(zr->pci_dev, "%s() raw - active=%c, sync_tail=%lu/%c, pend_tail=%lu, pend_head=%lu\n",
-			__func__,
-			"FAL"[fh->buffers.active], zr->v4l_sync_tail,
-			"UPMD"[zr->v4l_buffers.buffer[frame].state],
-			zr->v4l_pend_tail, zr->v4l_pend_head);
-		/* Process is the one capturing? */
-		if (fh->buffers.active != ZORAN_FREE &&
-		    /* Buffer ready to DQBUF? */
-		    zr->v4l_buffers.buffer[frame].state == BUZ_STATE_DONE)
-			res |= EPOLLIN | EPOLLRDNORM;
-		spin_unlock_irqrestore(&zr->spinlock, flags);
-
-		break;
-
-	case ZORAN_MAP_MODE_JPG_REC:
-	case ZORAN_MAP_MODE_JPG_PLAY:
-		poll_wait(file, &zr->jpg_capq, wait);
-		frame = zr->jpg_pend[zr->jpg_que_tail & BUZ_MASK_FRAME];
-
-		spin_lock_irqsave(&zr->spinlock, flags);
-		pci_dbg(zr->pci_dev, "%s() jpg - active=%c, que_tail=%lu/%c, que_head=%lu, dma=%lu/%lu\n",
-			__func__,
-			"FAL"[fh->buffers.active], zr->jpg_que_tail,
-			"UPMD"[zr->jpg_buffers.buffer[frame].state],
-			zr->jpg_que_head, zr->jpg_dma_tail, zr->jpg_dma_head);
-		if (fh->buffers.active != ZORAN_FREE &&
-		    zr->jpg_buffers.buffer[frame].state == BUZ_STATE_DONE) {
-			if (fh->map_mode == ZORAN_MAP_MODE_JPG_REC)
-				res |= EPOLLIN | EPOLLRDNORM;
-			else
-				res |= EPOLLOUT | EPOLLWRNORM;
-		}
-		spin_unlock_irqrestore(&zr->spinlock, flags);
-
-		break;
-
-	default:
-		pci_err(zr->pci_dev, "%s - internal error, unknown map_mode=%d\n", __func__, fh->map_mode);
-		res |= EPOLLERR;
-	}
-
-	return res;
-}
-
-/*
- * This maps the buffers to user space.
- *
- * Depending on the state of fh->map_mode
- * the V4L or the MJPEG buffers are mapped
- * per buffer or all together
- *
- * Note that we need to connect to some
- * unmap signal event to unmap the de-allocate
- * the buffer accordingly (zoran_vm_close())
- */
-
-static void zoran_vm_open(struct vm_area_struct *vma)
-{
-	struct zoran_mapping *map = vma->vm_private_data;
-
-	atomic_inc(&map->count);
-}
-
-static void zoran_vm_close(struct vm_area_struct *vma)
-{
-	struct zoran_mapping *map = vma->vm_private_data;
-	struct zoran_fh *fh = map->fh;
-	struct zoran *zr = fh->zr;
-	int i;
-
-	pci_info(zr->pci_dev, "%s - munmap(%s)\n", ZR_DEVNAME(zr), mode_name(fh->map_mode));
-
-	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (fh->buffers.buffer[i].map == map)
-			fh->buffers.buffer[i].map = NULL;
-	}
-	kfree(map);
-
-	/* Any buffers still mapped? */
-	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (fh->buffers.buffer[i].map)
-			return;
-	}
-
-	pci_info(zr->pci_dev, "%s - free %s buffers\n", __func__, mode_name(fh->map_mode));
-
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		if (fh->buffers.active != ZORAN_FREE) {
-			unsigned long flags;
-
-			spin_lock_irqsave(&zr->spinlock, flags);
-			zr36057_set_memgrab(zr, 0);
-			zr->v4l_buffers.allocated = 0;
-			zr->v4l_buffers.active = fh->buffers.active = ZORAN_FREE;
-			spin_unlock_irqrestore(&zr->spinlock, flags);
-		}
-		v4l_fbuffer_free(fh);
-	} else {
-		if (fh->buffers.active != ZORAN_FREE) {
-			jpg_qbuf(fh, -1, zr->codec_mode);
-			zr->jpg_buffers.allocated = 0;
-			zr->jpg_buffers.active = fh->buffers.active = ZORAN_FREE;
-		}
-		jpg_fbuffer_free(fh);
-	}
-}
-
-static const struct vm_operations_struct zoran_vm_ops = {
-	.open = zoran_vm_open,
-	.close = zoran_vm_close,
-};
-
-static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct zoran_fh *fh = file->private_data;
-	struct zoran *zr = fh->zr;
-	unsigned long size = (vma->vm_end - vma->vm_start);
-	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
-	int i, j;
-	unsigned long page, start = vma->vm_start, todo, pos, fraglen;
-	int first, last;
-	struct zoran_mapping *map;
-	int res = 0;
-
-	pci_info(zr->pci_dev, "%s(%s) of 0x%08lx-0x%08lx (size=%lu)\n", __func__,
-		 mode_name(fh->map_mode), vma->vm_start, vma->vm_end, size);
-
-	if (!(vma->vm_flags & VM_SHARED) || !(vma->vm_flags & VM_READ) ||
-	    !(vma->vm_flags & VM_WRITE)) {
-		pci_err(zr->pci_dev, "%s - no MAP_SHARED/PROT_{READ,WRITE} given\n", __func__);
-		return -EINVAL;
-	}
-
-	if (!fh->buffers.allocated) {
-		pci_err(zr->pci_dev, "%s(%s) - buffers not yet allocated\n", __func__, mode_name(fh->map_mode));
-		res = -ENOMEM;
-		return res;
-	}
-
-	first = offset / zr->buffer_size;
-	last = first - 1 + size / zr->buffer_size;
-	if (offset % zr->buffer_size != 0 ||
-	    size % zr->buffer_size != 0 || first < 0 ||
-	    last < 0 || first >= fh->buffers.num_buffers ||
-	    last >= zr->buffer_size) {
-		pci_err(zr->pci_dev, "%s(%s) - offset=%lu or size=%lu invalid for bufsize=%d and numbufs=%d\n",
-			__func__, mode_name(fh->map_mode), offset, size,
-			zr->buffer_size,
-			fh->buffers.num_buffers);
-		res = -EINVAL;
-		return res;
-	}
-
-	/* Check if any buffers are already mapped */
-	for (i = first; i <= last; i++) {
-		if (fh->buffers.buffer[i].map) {
-			pci_err(zr->pci_dev, "%s(%s) - buffer %d already mapped\n", __func__, mode_name(fh->map_mode), i);
-			res = -EBUSY;
-			return res;
-		}
-	}
-
-	/* map these buffers */
-	map = kmalloc(sizeof(*map), GFP_KERNEL);
-	if (!map) {
-		res = -ENOMEM;
-		return res;
-	}
-	map->fh = fh;
-	atomic_set(&map->count, 1);
-
-	vma->vm_ops = &zoran_vm_ops;
-	vma->vm_flags |= VM_DONTEXPAND;
-	vma->vm_private_data = map;
-
-	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		for (i = first; i <= last; i++) {
-			todo = size;
-			if (todo > zr->buffer_size)
-				todo = zr->buffer_size;
-			page = fh->buffers.buffer[i].v4l.fbuffer_phys;
-			if (remap_pfn_range(vma, start, page >> PAGE_SHIFT,
-					    todo, PAGE_SHARED)) {
-				pci_err(zr->pci_dev, "%s(V4L) - remap_pfn_range failed\n", __func__);
-				res = -EAGAIN;
-				return res;
-			}
-			size -= todo;
-			start += todo;
-			fh->buffers.buffer[i].map = map;
-			if (size == 0)
-				break;
-		}
-	} else {
-		for (i = first; i <= last; i++) {
-			for (j = 0;
-			     j < zr->buffer_size / PAGE_SIZE;
-			     j++) {
-				fraglen =
-				    (le32_to_cpu(fh->buffers.buffer[i].jpg.
-				     frag_tab[2 * j + 1]) & ~1) << 1;
-				todo = size;
-				if (todo > fraglen)
-					todo = fraglen;
-				pos =
-				    le32_to_cpu(fh->buffers.
-				    buffer[i].jpg.frag_tab[2 * j]);
-				/* should just be pos on i386 */
-				page = virt_to_phys(bus_to_virt(pos))
-								>> PAGE_SHIFT;
-				if (remap_pfn_range(vma, start, page,
-						    todo, PAGE_SHARED)) {
-					pci_err(zr->pci_dev, "%s(V4L) - remap_pfn_range failed\n", __func__);
-					res = -EAGAIN;
-					return res;
-				}
-				size -= todo;
-				start += todo;
-				if (size == 0)
-					break;
-				if (le32_to_cpu(fh->buffers.buffer[i].jpg.
-				    frag_tab[2 * j + 1]) & 1)
-					break;	/* was last fragment */
-			}
-			fh->buffers.buffer[i].map = map;
-			if (size == 0)
-				break;
-		}
-	}
-	return res;
-}
-
 static int zoran_g_parm(struct file *file, void *priv, struct v4l2_streamparm *parm)
 {
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
@@ -2129,12 +759,14 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 	.vidioc_s_output		    = zoran_s_output,*/
 	.vidioc_g_std			    = zoran_g_std,
 	.vidioc_s_std			    = zoran_s_std,
-	.vidioc_reqbufs			    = zoran_reqbufs,
-	.vidioc_querybuf		    = zoran_querybuf,
-	.vidioc_qbuf			    = zoran_qbuf,
-	.vidioc_dqbuf			    = zoran_dqbuf,
-	.vidioc_streamon		    = zoran_streamon,
-	.vidioc_streamoff		    = zoran_streamoff,
+	.vidioc_create_bufs		    = vb2_ioctl_create_bufs,
+	.vidioc_reqbufs			    = vb2_ioctl_reqbufs,
+	.vidioc_querybuf		    = vb2_ioctl_querybuf,
+	.vidioc_qbuf			    = vb2_ioctl_qbuf,
+	.vidioc_dqbuf			    = vb2_ioctl_dqbuf,
+	.vidioc_expbuf                      = vb2_ioctl_expbuf,
+	.vidioc_streamon		    = vb2_ioctl_streamon,
+	.vidioc_streamoff		    = vb2_ioctl_streamoff,
 	.vidioc_enum_fmt_vid_cap	    = zoran_enum_fmt_vid_cap,
 /*	.vidioc_enum_fmt_vid_out	    = zoran_enum_fmt_vid_out,*/
 	.vidioc_g_fmt_vid_cap		    = zoran_g_fmt_vid_cap,
@@ -2149,11 +781,13 @@ static const struct v4l2_ioctl_ops zoran_ioctl_ops = {
 
 static const struct v4l2_file_operations zoran_fops = {
 	.owner = THIS_MODULE,
-	.open = zoran_open,
-	.release = zoran_close,
 	.unlocked_ioctl = video_ioctl2,
-	.mmap = zoran_mmap,
-	.poll = zoran_poll,
+	.open		= v4l2_fh_open,
+	.release	= vb2_fop_release,
+	.read		= vb2_fop_read,
+	.write		= vb2_fop_write,
+	.mmap		= vb2_fop_mmap,
+	.poll		= vb2_fop_poll,
 };
 
 const struct video_device zoran_template = {
@@ -2177,11 +811,13 @@ static int zr_vb2_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers, unsi
 	if (*nbuffers < vq->min_buffers_needed)
 		*nbuffers = vq->min_buffers_needed;
 
-	if (*nplanes)
+	if (*nplanes) {
 		if (sizes[0] < size)
 			return -EINVAL;
 		else
 			return 0;
+	}
+
 	*nplanes = 1;
 	sizes[0] = size;
 
@@ -2207,7 +843,10 @@ static int zr_vb2_prepare(struct vb2_buffer *vb)
 {
 	struct zoran *zr = vb2_get_drv_priv(vb->vb2_queue);
 
+	if (vb2_plane_size(vb, 0) < zr->buffer_size)
+		return -EINVAL;
 	zr->prepared++;
+
 	return 0;
 }
 
-- 
2.26.2

