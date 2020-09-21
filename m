Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9192720BB
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgIUKYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgIUKUl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:41 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9960C0613D1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:39 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z9so12015769wmk.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UkASDZ+EoW5yLxxyokbShueZVjU0CI78zVzwUXWhixk=;
        b=B7YShZ+MIXwhWBnzLnBMYjmy8yKv1nUZm/hpsYzBOh1vs+6mcJ1LK0RfbN4uPO/9K0
         LNCTy4oWvonx/wYHGq0gjCGV/DB5KeiBXL0Nk8rUwQ+wrL8CDEnGkNyq9cvf16D6NZRD
         lBY+CZl+dsuHkB/EZKGqYoxp2ZjOphVAgUycV/Q20EusEO95hMoHx8Lhkmm1DOKyY439
         SW0JboO98wi0pAsHc0Dsq8oulSR6B/Xn1eWccPoxr2s4YhGjXgNMJvpmkW7eIIiaAHLR
         GKdM8u6f5XfBELzs8PemQ6O6rst7VHaoz74O44h+Vl+CQsnBeHccUmppSGwLnbDcbal4
         4FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UkASDZ+EoW5yLxxyokbShueZVjU0CI78zVzwUXWhixk=;
        b=Y0vyWhVppVUJ+SAFKFiljpZmTavnVuNY5HZPf3dUEw186RViBm4FtP0M++qb0plF06
         mz0m1EGdhFx9rVUb92LTMFTOOChGRla6m5xzjJ0uf5fbmJe/EOx4Qal0kZixl2gIp8rI
         QLL4697cVlTcESPzq7M6jGXTHAGrxJ8NGs/Iu0rbcOjMINRDU6FHZAnv3qXMzfIuSaZ7
         cATtpyNfYbIXKFiuL8OukSSR3dCPxFMToSvahDtmlBEfiBbIyOy0N8V62tNzjhyi0zfM
         zRcH1TGQxBkInwgDNcrBevBw8KIEQON4IXisHiMR5dRs+o9qN3FXISalrnEUtTG7BLgt
         7uLg==
X-Gm-Message-State: AOAM5318R4dY6gfZGnDsYycAmAT6dm6RcYJJQ6vEzvdPm7k1SMwbn6Md
        XiI1OJTl6UVyuHgMz4/THdmkDuI15VkcNg==
X-Google-Smtp-Source: ABdhPJzYJiqUDPKXh0Iqlq/b04X5JAGdsDNoxrsu0USoW7J21Oodcn4V8UN+MWBhEonogMrror6khQ==
X-Received: by 2002:a1c:4c0d:: with SMTP id z13mr28167319wmf.113.1600683637525;
        Mon, 21 Sep 2020 03:20:37 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:36 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 05/49] staging: media: zoran: fix checkpatch issue
Date:   Mon, 21 Sep 2020 10:19:40 +0000
Message-Id: <1600683624-5863-6-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix a lot of style issue found by checkpatch.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c   | 116 ++-----
 drivers/staging/media/zoran/videocodec.h   |  75 +----
 drivers/staging/media/zoran/zoran.h        |  52 ++-
 drivers/staging/media/zoran/zoran_card.c   | 319 +++++++-----------
 drivers/staging/media/zoran/zoran_card.h   |  11 +-
 drivers/staging/media/zoran/zoran_device.c | 372 ++++++++-------------
 drivers/staging/media/zoran/zoran_device.h |  40 +--
 drivers/staging/media/zoran/zoran_driver.c | 257 ++++++--------
 drivers/staging/media/zoran/zoran_procfs.c |  28 +-
 drivers/staging/media/zoran/zr36016.c      | 166 +++------
 drivers/staging/media/zoran/zr36016.h      |  17 +-
 drivers/staging/media/zoran/zr36050.c      | 116 ++-----
 drivers/staging/media/zoran/zr36050.h      |  26 +-
 drivers/staging/media/zoran/zr36057.h      |  96 +++---
 drivers/staging/media/zoran/zr36060.c      | 314 ++++++-----------
 drivers/staging/media/zoran/zr36060.h      | 111 +++---
 16 files changed, 740 insertions(+), 1376 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 044ef8455ba8..3a2f0c450a44 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * VIDEO MOTION CODECs internal API for video devices
  *
@@ -5,22 +6,6 @@
  * bound to a master device.
  *
  * (c) 2002 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: videocodec.c,v 1.1.2.8 2003/03/29 07:16:04 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #define VIDEOCODEC_VERSION "v0.2"
@@ -69,8 +54,7 @@ static struct codec_list *codeclist_top;
 /* function prototypes of the master/slave interface */
 /* ================================================= */
 
-struct videocodec *
-videocodec_attach (struct videocodec_master *master)
+struct videocodec *videocodec_attach(struct videocodec_master *master)
 {
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a, *ptr;
@@ -82,8 +66,7 @@ videocodec_attach (struct videocodec_master *master)
 		return NULL;
 	}
 
-	dprintk(2,
-		"videocodec_attach: '%s', flags %lx, magic %lx\n",
+	dprintk(2, "%s: '%s', flags %lx, magic %lx\n", __func__,
 		master->name, master->flags, master->magic);
 
 	if (!h) {
@@ -97,50 +80,35 @@ videocodec_attach (struct videocodec_master *master)
 		// attach only if the slave has at least the flags
 		// expected by the master
 		if ((master->flags & h->codec->flags) == master->flags) {
-			dprintk(4, "videocodec_attach: try '%s'\n",
-				h->codec->name);
+			dprintk(4, "%s: try '%s'\n", __func__, h->codec->name);
 
 			if (!try_module_get(h->codec->owner))
 				return NULL;
 
-			codec = kmemdup(h->codec, sizeof(struct videocodec),
-					GFP_KERNEL);
-			if (!codec) {
-				dprintk(1,
-					KERN_ERR
-					"videocodec_attach: no mem\n");
+			codec = kmemdup(h->codec, sizeof(struct videocodec), GFP_KERNEL);
+			if (!codec)
 				goto out_module_put;
-			}
 
 			res = strlen(codec->name);
-			snprintf(codec->name + res, sizeof(codec->name) - res,
-				 "[%d]", h->attached);
+			snprintf(codec->name + res, sizeof(codec->name) - res, "[%d]", h->attached);
 			codec->master_data = master;
 			res = codec->setup(codec);
 			if (res == 0) {
-				dprintk(3, "videocodec_attach '%s'\n",
-					codec->name);
-				ptr = kzalloc(sizeof(struct attached_list), GFP_KERNEL);
-				if (!ptr) {
-					dprintk(1,
-						KERN_ERR
-						"videocodec_attach: no memory\n");
+				dprintk(3, "%s: '%s'\n", __func__, codec->name);
+				ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
+				if (!ptr)
 					goto out_kfree;
-				}
 				ptr->codec = codec;
 
 				a = h->list;
 				if (!a) {
 					h->list = ptr;
-					dprintk(4,
-						"videocodec: first element\n");
+					dprintk(4, "videocodec: first element\n");
 				} else {
 					while (a->next)
 						a = a->next;	// find end
 					a->next = ptr;
-					dprintk(4,
-						"videocodec: in after '%s'\n",
-						h->codec->name);
+					dprintk(4, "videocodec: in after '%s'\n", h->codec->name);
 				}
 
 				h->attached += 1;
@@ -161,9 +129,9 @@ videocodec_attach (struct videocodec_master *master)
 	kfree(codec);
 	return NULL;
 }
+EXPORT_SYMBOL(videocodec_attach);
 
-int
-videocodec_detach (struct videocodec *codec)
+int videocodec_detach(struct videocodec *codec)
 {
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a, *prev;
@@ -174,8 +142,7 @@ videocodec_detach (struct videocodec *codec)
 		return -EINVAL;
 	}
 
-	dprintk(2,
-		"videocodec_detach: '%s', type: %x, flags %lx, magic %lx\n",
+	dprintk(2, "%s: '%s', type: %x, flags %lx, magic %lx\n", __func__,
 		codec->name, codec->type, codec->flags, codec->magic);
 
 	if (!h) {
@@ -191,9 +158,7 @@ videocodec_detach (struct videocodec *codec)
 			if (codec == a->codec) {
 				res = a->codec->unset(a->codec);
 				if (res >= 0) {
-					dprintk(3,
-						"videocodec_detach: '%s'\n",
-						a->codec->name);
+					dprintk(3, "%s: '%s'\n", __func__, a->codec->name);
 					a->codec->master_data = NULL;
 				} else {
 					dprintk(1,
@@ -202,14 +167,12 @@ videocodec_detach (struct videocodec *codec)
 						a->codec->name);
 					a->codec->master_data = NULL;
 				}
-				if (prev == NULL) {
+				if (!prev) {
 					h->list = a->next;
-					dprintk(4,
-						"videocodec: delete first\n");
+					dprintk(4, "videocodec: delete first\n");
 				} else {
 					prev->next = a->next;
-					dprintk(4,
-						"videocodec: delete middle\n");
+					dprintk(4, "videocodec: delete middle\n");
 				}
 				module_put(a->codec->owner);
 				kfree(a->codec);
@@ -226,9 +189,9 @@ videocodec_detach (struct videocodec *codec)
 	dprintk(1, KERN_ERR "videocodec_detach: given codec not found!\n");
 	return -EINVAL;
 }
+EXPORT_SYMBOL(videocodec_detach);
 
-int
-videocodec_register (const struct videocodec *codec)
+int videocodec_register(const struct videocodec *codec)
 {
 	struct codec_list *ptr, *h = codeclist_top;
 
@@ -241,11 +204,9 @@ videocodec_register (const struct videocodec *codec)
 		"videocodec: register '%s', type: %x, flags %lx, magic %lx\n",
 		codec->name, codec->type, codec->flags, codec->magic);
 
-	ptr = kzalloc(sizeof(struct codec_list), GFP_KERNEL);
-	if (!ptr) {
-		dprintk(1, KERN_ERR "videocodec_register: no memory\n");
+	ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
 		return -ENOMEM;
-	}
 	ptr->codec = codec;
 
 	if (!h) {
@@ -261,9 +222,9 @@ videocodec_register (const struct videocodec *codec)
 
 	return 0;
 }
+EXPORT_SYMBOL(videocodec_register);
 
-int
-videocodec_unregister (const struct videocodec *codec)
+int videocodec_unregister(const struct videocodec *codec)
 {
 	struct codec_list *prev = NULL, *h = codeclist_top;
 
@@ -294,7 +255,7 @@ videocodec_unregister (const struct videocodec *codec)
 			}
 			dprintk(3, "videocodec: unregister '%s' is ok.\n",
 				h->codec->name);
-			if (prev == NULL) {
+			if (!prev) {
 				codeclist_top = h->next;
 				dprintk(4,
 					"videocodec: delete first element\n");
@@ -315,6 +276,7 @@ videocodec_unregister (const struct videocodec *codec)
 		"videocodec_unregister: given codec not found!\n");
 	return -EINVAL;
 }
+EXPORT_SYMBOL(videocodec_unregister);
 
 #ifdef CONFIG_PROC_FS
 static int proc_videocodecs_show(struct seq_file *m, void *v)
@@ -327,12 +289,12 @@ static int proc_videocodecs_show(struct seq_file *m, void *v)
 
 	while (h) {
 		seq_printf(m, "S %32s %04x %08lx %08lx (TEMPLATE)\n",
-			      h->codec->name, h->codec->type,
+			   h->codec->name, h->codec->type,
 			      h->codec->flags, h->codec->magic);
 		a = h->list;
 		while (a) {
 			seq_printf(m, "M %32s %04x %08lx %08lx (%s)\n",
-				      a->codec->master_data->name,
+				   a->codec->master_data->name,
 				      a->codec->master_data->type,
 				      a->codec->master_data->flags,
 				      a->codec->master_data->magic,
@@ -349,39 +311,29 @@ static int proc_videocodecs_show(struct seq_file *m, void *v)
 /* ===================== */
 /* hook in driver module */
 /* ===================== */
-static int __init
-videocodec_init (void)
+static int __init videocodec_init(void)
 {
 #ifdef CONFIG_PROC_FS
 	static struct proc_dir_entry *videocodec_proc_entry;
 #endif
 
-	printk(KERN_INFO "Linux video codec intermediate layer: %s\n",
-	       VIDEOCODEC_VERSION);
+	pr_info("Linux video codec intermediate layer: %s\n", VIDEOCODEC_VERSION);
 
 #ifdef CONFIG_PROC_FS
-	videocodec_proc_entry = proc_create_single("videocodecs", 0, NULL,
-			proc_videocodecs_show);
-	if (!videocodec_proc_entry) {
+	videocodec_proc_entry = proc_create_single("videocodecs", 0, NULL, proc_videocodecs_show);
+	if (!videocodec_proc_entry)
 		dprintk(1, KERN_ERR "videocodec: can't init procfs.\n");
-	}
 #endif
 	return 0;
 }
 
-static void __exit
-videocodec_exit (void)
+static void __exit videocodec_exit(void)
 {
 #ifdef CONFIG_PROC_FS
 	remove_proc_entry("videocodecs", NULL);
 #endif
 }
 
-EXPORT_SYMBOL(videocodec_attach);
-EXPORT_SYMBOL(videocodec_detach);
-EXPORT_SYMBOL(videocodec_register);
-EXPORT_SYMBOL(videocodec_unregister);
-
 module_init(videocodec_init);
 module_exit(videocodec_exit);
 
diff --git a/drivers/staging/media/zoran/videocodec.h b/drivers/staging/media/zoran/videocodec.h
index 8ed5a0f7ac01..553af4ad431e 100644
--- a/drivers/staging/media/zoran/videocodec.h
+++ b/drivers/staging/media/zoran/videocodec.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * VIDEO MOTION CODECs internal API for video devices
  *
@@ -5,22 +6,6 @@
  * bound to a master device.
  *
  * (c) 2002 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: videocodec.h,v 1.1.2.4 2003/01/14 21:15:03 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 /* =================== */
@@ -64,7 +49,6 @@
    device dependent and vary between MJPEG/MPEG/WAVELET/... devices. (!!!!)
    ----------------------------------------------------------------------------
 */
-
 
 /* ========================================== */
 /* description of the videocodec_io structure */
@@ -111,7 +95,7 @@
 		the calls include frame numbers and flags (even/odd/...)
 		if needed and a flag which allows blocking until its ready
 */
-
+
 /* ============== */
 /* user interface */
 /* ============== */
@@ -131,7 +115,6 @@ M                       zr36055[0] 0001 0000c001 00000000 (zr36050[0])
 M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
 
 */
-
 
 /* =============================================== */
 /* special defines for the videocodec_io structure */
@@ -207,10 +190,9 @@ M                       zr36055[1] 0001 0000c001 00000000 (zr36050[1])
 #define CODEC_G_FLAG           0x8000	/* this is how 'get' is detected */
 
 /* types of transfer, directly user space or a kernel buffer (image-fn.'s) */
-/*  -> used in get_image, put_image                                        */
+/*  -> used in get_image, put_image */
 #define CODEC_TRANSFER_KERNEL 0	/* use "memcopy" */
 #define CODEC_TRANSFER_USER   1	/* use "to/from_user" */
-
 
 /* ========================= */
 /* the structures itself ... */
@@ -267,46 +249,27 @@ struct videocodec {
 	void *data;		/* private slave data */
 
 	/* attach/detach client functions (indirect call) */
-	int (*setup) (struct videocodec * codec);
-	int (*unset) (struct videocodec * codec);
+	int (*setup)(struct videocodec *codec);
+	int (*unset)(struct videocodec *codec);
 
 	/* main functions, every client needs them for sure! */
 	// set compression or decompression (or freeze, stop, standby, etc)
-	int (*set_mode) (struct videocodec * codec,
-			 int mode);
+	int (*set_mode)(struct videocodec *codec, int mode);
 	// setup picture size and norm (for the codec's video frontend)
-	int (*set_video) (struct videocodec * codec,
-			  struct tvnorm * norm,
-			  struct vfe_settings * cap,
-			  struct vfe_polarity * pol);
+	int (*set_video)(struct videocodec *codec, struct tvnorm *norm,
+			 struct vfe_settings *cap, struct vfe_polarity *pol);
 	// other control commands, also mmap setup etc.
-	int (*control) (struct videocodec * codec,
-			int type,
-			int size,
-			void *data);
+	int (*control)(struct videocodec *codec, int type, int size, void *data);
 
 	/* additional setup/query/processing (may be NULL pointer) */
 	// interrupt setup / handling (for irq's delivered by master)
-	int (*setup_interrupt) (struct videocodec * codec,
-				long mode);
-	int (*handle_interrupt) (struct videocodec * codec,
-				 int source,
-				 long flag);
+	int (*setup_interrupt)(struct videocodec *codec, long mode);
+	int (*handle_interrupt)(struct videocodec *codec, int source, long flag);
 	// picture interface (if any)
-	long (*put_image) (struct videocodec * codec,
-			   int tr_type,
-			   int block,
-			   long *fr_num,
-			   long *flag,
-			   long size,
-			   void *buf);
-	long (*get_image) (struct videocodec * codec,
-			   int tr_type,
-			   int block,
-			   long *fr_num,
-			   long *flag,
-			   long size,
-			   void *buf);
+	long (*put_image)(struct videocodec *codec, int tr_type, int block,
+			  long *fr_num, long *flag, long size, void *buf);
+	long (*get_image)(struct videocodec *codec, int tr_type, int block,
+			  long *fr_num, long *flag, long size, void *buf);
 };
 
 struct videocodec_master {
@@ -318,13 +281,9 @@ struct videocodec_master {
 
 	void *data;		/* private master data */
 
-	 __u32(*readreg) (struct videocodec * codec,
-			  __u16 reg);
-	void (*writereg) (struct videocodec * codec,
-			  __u16 reg,
-			  __u32 value);
+	__u32 (*readreg)(struct videocodec *codec, __u16 reg);
+	void (*writereg)(struct videocodec *codec, __u16 reg, __u32 value);
 };
-
 
 /* ================================================= */
 /* function prototypes of the master/slave interface */
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index e84fb604a689..eac8e49a080f 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * zoran - Iomega Buz driver
  *
@@ -12,16 +13,6 @@
  * bttv - Bt848 frame grabber driver
  * Copyright (C) 1996,97,98 Ralph  Metzler (rjkm@thp.uni-koeln.de)
  *                        & Marcus Metzler (mocm@thp.uni-koeln.de)
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _BUZ_H_
@@ -141,11 +132,12 @@ struct zoran_format {
 	__u32 flags;
 	__u32 vfespfr;
 };
+
 /* flags */
-#define ZORAN_FORMAT_COMPRESSED 1<<0
-#define ZORAN_FORMAT_OVERLAY    1<<1
-#define ZORAN_FORMAT_CAPTURE	1<<2
-#define ZORAN_FORMAT_PLAYBACK	1<<3
+#define ZORAN_FORMAT_COMPRESSED BIT(0)
+#define ZORAN_FORMAT_OVERLAY BIT(1)
+#define ZORAN_FORMAT_CAPTURE BIT(2)
+#define ZORAN_FORMAT_PLAYBACK BIT(3)
 
 /* overlay-settings */
 struct zoran_overlay_settings {
@@ -205,7 +197,7 @@ struct zoran_buffer_col {
 	enum zoran_lock_activity active;	/* feature currently in use? */
 	unsigned int num_buffers, buffer_size;
 	struct zoran_buffer buffer[MAX_FRAME];	/* buffers */
-	u8 allocated;		/* Flag if buffers are allocated  */
+	u8 allocated;		/* Flag if buffers are allocated */
 	u8 need_contiguous;	/* Flag if contiguous buffers are needed */
 	/* only applies to jpg buffers, raw buffers are always contiguous */
 };
@@ -262,7 +254,7 @@ struct card_info {
 	/* avs6eyes mux setting */
 	u8 input_mux;
 
-	void (*init) (struct zoran * zr);
+	void (*init)(struct zoran *zr);
 };
 
 struct zoran {
@@ -300,10 +292,10 @@ struct zoran {
 	v4l2_std_id norm;
 
 	/* Current buffer params */
-	void    *vbuf_base;
-	int     vbuf_height, vbuf_width;
-	int     vbuf_depth;
-	int     vbuf_bytesperline;
+	void *vbuf_base;
+	int vbuf_height, vbuf_width;
+	int vbuf_depth;
+	int vbuf_bytesperline;
 
 	struct zoran_overlay_settings overlay_settings;
 	u32 *overlay_mask;	/* overlay mask */
@@ -336,11 +328,11 @@ struct zoran {
 	/* (dma_head - dma_tail) is number active in DMA, must be <= BUZ_NUM_STAT_COM */
 	/* (value & BUZ_MASK_STAT_COM) corresponds to index in stat_com table */
 	unsigned long jpg_que_head;	/* Index where to put next buffer which is queued */
-	unsigned long jpg_dma_head;	/* Index of next buffer which goes into stat_com  */
-	unsigned long jpg_dma_tail;	/* Index of last buffer in stat_com               */
-	unsigned long jpg_que_tail;	/* Index of last buffer in queue                  */
-	unsigned long jpg_seq_num;	/* count of frames since grab/play started        */
-	unsigned long jpg_err_seq;	/* last seq_num before error                      */
+	unsigned long jpg_dma_head;	/* Index of next buffer which goes into stat_com */
+	unsigned long jpg_dma_tail;	/* Index of last buffer in stat_com */
+	unsigned long jpg_que_tail;	/* Index of last buffer in queue */
+	unsigned long jpg_seq_num;	/* count of frames since grab/play started */
+	unsigned long jpg_err_seq;	/* last seq_num before error */
 	unsigned long jpg_err_shift;
 	unsigned long jpg_queued_num;	/* count of frames queued since grab/play started */
 
@@ -392,11 +384,11 @@ static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
 
 /* There was something called _ALPHA_BUZ that used the PCI address instead of
  * the kernel iomapped address for btread/btwrite.  */
-#define btwrite(dat,adr)    writel((dat), zr->zr36057_mem+(adr))
-#define btread(adr)         readl(zr->zr36057_mem+(adr))
+#define btwrite(dat, adr)    writel((dat), zr->zr36057_mem + (adr))
+#define btread(adr)         readl(zr->zr36057_mem + (adr))
 
-#define btand(dat,adr)      btwrite((dat) & btread(adr), adr)
-#define btor(dat,adr)       btwrite((dat) | btread(adr), adr)
-#define btaor(dat,mask,adr) btwrite((dat) | ((mask) & btread(adr)), adr)
+#define btand(dat, adr)      btwrite((dat) & btread(adr), adr)
+#define btor(dat, adr)       btwrite((dat) | btread(adr), adr)
+#define btaor(dat, mask, adr) btwrite((dat) | ((mask) & btread(adr)), adr)
 
 #endif
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index d2f82894e8ee..960257cd43d6 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran zr36057/zr36067 PCI controller driver, for the
  * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
@@ -6,16 +7,6 @@
  * This part handles card-specific data and detection
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/delay.h>
@@ -51,25 +42,21 @@
 
 extern const struct zoran_format zoran_formats[];
 
-static int card[BUZ_MAX] = { [0 ... (BUZ_MAX-1)] = -1 };
+static int card[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(card, int, NULL, 0444);
 MODULE_PARM_DESC(card, "Card type");
 
 /*
-   The video mem address of the video card.
-   The driver has a little database for some videocards
-   to determine it from there. If your video card is not in there
-   you have either to give it to the driver as a parameter
-   or set in in a VIDIOCSFBUF ioctl
+ * The video mem address of the video card. The driver has a little database for some videocards
+ * to determine it from there. If your video card is not in there you have either to give it to
+ * the driver as a parameter or set in in a VIDIOCSFBUF ioctl
  */
 
 static unsigned long vidmem;	/* default = 0 - Video memory base address */
 module_param_hw(vidmem, ulong, iomem, 0444);
 MODULE_PARM_DESC(vidmem, "Default video memory base address");
 
-/*
-   Default input and video norm at startup of the driver.
-*/
+/* Default input and video norm at startup of the driver. */
 
 static unsigned int default_input;	/* default 0 = Composite, 1 = S-Video */
 module_param(default_input, uint, 0444);
@@ -86,7 +73,7 @@ module_param(default_norm, int, 0444);
 MODULE_PARM_DESC(default_norm, "Default norm (0=PAL, 1=NTSC, 2=SECAM)");
 
 /* /dev/videoN, -1 for autodetect */
-static int video_nr[BUZ_MAX] = { [0 ... (BUZ_MAX-1)] = -1 };
+static int video_nr[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(video_nr, int, NULL, 0444);
 MODULE_PARM_DESC(video_nr, "Video device number (-1=Auto)");
 
@@ -104,8 +91,9 @@ MODULE_PARM_DESC(jpg_nbufs, "Maximum number of JPG buffers to use");
 module_param(jpg_bufsize, int, 0644);
 MODULE_PARM_DESC(jpg_bufsize, "Maximum size per JPG buffer (in kB)");
 
-int pass_through = 0;		/* 1=Pass through TV signal when device is not used */
-				/* 0=Show color bar when device is not used (LML33: only if lml33dpath=1) */
+/* 1=Pass through TV signal when device is not used */
+/* 0=Show color bar when device is not used (LML33: only if lml33dpath=1) */
+int pass_through;
 module_param(pass_through, int, 0644);
 MODULE_PARM_DESC(pass_through,
 		 "Pass TV signal through to TV-out when idling");
@@ -138,98 +126,73 @@ MODULE_DEVICE_TABLE(pci, zr36067_pci_tbl);
 static unsigned int zoran_num;		/* number of cards found */
 
 /* videocodec bus functions ZR36060 */
-static u32
-zr36060_read (struct videocodec *codec,
-	      u16                reg)
+static u32 zr36060_read(struct videocodec *codec, u16 reg)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 	__u32 data;
 
-	if (post_office_wait(zr)
-	    || post_office_write(zr, 0, 1, reg >> 8)
-	    || post_office_write(zr, 0, 2, reg & 0xff)) {
+	if (post_office_wait(zr) || post_office_write(zr, 0, 1, reg >> 8) ||
+	    post_office_write(zr, 0, 2, reg & 0xff))
 		return -1;
-	}
 
 	data = post_office_read(zr, 0, 3) & 0xff;
 	return data;
 }
 
-static void
-zr36060_write (struct videocodec *codec,
-	       u16                reg,
-	       u32                val)
+static void zr36060_write(struct videocodec *codec, u16 reg, u32 val)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 
-	if (post_office_wait(zr)
-	    || post_office_write(zr, 0, 1, reg >> 8)
-	    || post_office_write(zr, 0, 2, reg & 0xff)) {
+	if (post_office_wait(zr) || post_office_write(zr, 0, 1, reg >> 8) ||
+	    post_office_write(zr, 0, 2, reg & 0xff))
 		return;
-	}
 
 	post_office_write(zr, 0, 3, val & 0xff);
 }
 
 /* videocodec bus functions ZR36050 */
-static u32
-zr36050_read (struct videocodec *codec,
-	      u16                reg)
+static u32 zr36050_read(struct videocodec *codec, u16 reg)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 	__u32 data;
 
-	if (post_office_wait(zr)
-	    || post_office_write(zr, 1, 0, reg >> 2)) {	// reg. HIGHBYTES
+	if (post_office_wait(zr) || post_office_write(zr, 1, 0, reg >> 2))	// reg. HIGHBYTES
 		return -1;
-	}
 
 	data = post_office_read(zr, 0, reg & 0x03) & 0xff;	// reg. LOWBYTES + read
 	return data;
 }
 
-static void
-zr36050_write (struct videocodec *codec,
-	       u16                reg,
-	       u32                val)
+static void zr36050_write(struct videocodec *codec, u16 reg, u32 val)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 
-	if (post_office_wait(zr)
-	    || post_office_write(zr, 1, 0, reg >> 2)) {	// reg. HIGHBYTES
+	if (post_office_wait(zr) || post_office_write(zr, 1, 0, reg >> 2))	// reg. HIGHBYTES
 		return;
-	}
 
 	post_office_write(zr, 0, reg & 0x03, val & 0xff);	// reg. LOWBYTES + wr. data
 }
 
 /* videocodec bus functions ZR36016 */
-static u32
-zr36016_read (struct videocodec *codec,
-	      u16                reg)
+static u32 zr36016_read(struct videocodec *codec, u16 reg)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 	__u32 data;
 
-	if (post_office_wait(zr)) {
+	if (post_office_wait(zr))
 		return -1;
-	}
 
 	data = post_office_read(zr, 2, reg & 0x03) & 0xff;	// read
 	return data;
 }
 
 /* hack for in zoran_device.c */
-void
-zr36016_write (struct videocodec *codec,
-	       u16                reg,
-	       u32                val)
+void zr36016_write(struct videocodec *codec, u16 reg, u32 val)
 {
-	struct zoran *zr = (struct zoran *) codec->master_data->data;
+	struct zoran *zr = (struct zoran *)codec->master_data->data;
 
-	if (post_office_wait(zr)) {
+	if (post_office_wait(zr))
 		return;
-	}
 
 	post_office_write(zr, 2, reg & 0x03, val & 0x0ff);	// wr. data
 }
@@ -238,8 +201,7 @@ zr36016_write (struct videocodec *codec,
  * Board specific information
  */
 
-static void
-dc10_init (struct zoran *zr)
+static void dc10_init(struct zoran *zr)
 {
 	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
 
@@ -250,14 +212,12 @@ dc10_init (struct zoran *zr)
 	GPIO(zr, 7, 0);
 }
 
-static void
-dc10plus_init (struct zoran *zr)
+static void dc10plus_init(struct zoran *zr)
 {
 	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
 }
 
-static void
-buz_init (struct zoran *zr)
+static void buz_init(struct zoran *zr)
 {
 	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
 
@@ -267,16 +227,14 @@ buz_init (struct zoran *zr)
 	pci_write_config_dword(zr->pci_dev, 0xe8, 0xc0200000);
 }
 
-static void
-lml33_init (struct zoran *zr)
+static void lml33_init(struct zoran *zr)
 {
 	dprintk(3, KERN_DEBUG "%s: %s\n", ZR_DEVNAME(zr), __func__);
 
 	GPIO(zr, 2, 1);		// Set Composite input/output
 }
 
-static void
-avs6eyes_init (struct zoran *zr)
+static void avs6eyes_init(struct zoran *zr)
 {
 	// AverMedia 6-Eyes original driver by Christer Weinigel
 
@@ -296,11 +254,9 @@ avs6eyes_init (struct zoran *zr)
 	GPIO(zr, 5, mux & 2);   /* MUX S1 */
 	GPIO(zr, 6, 0); /* ? */
 	GPIO(zr, 7, mux & 4);   /* MUX S2 */
-
 }
 
-static char *
-codecid_to_modulename (u16 codecid)
+static char *codecid_to_modulename(u16 codecid)
 {
 	char *name = NULL;
 
@@ -328,24 +284,27 @@ static struct tvnorm f60sqpixel = { 780, 640, 51, 716, 525, 480, 12 };
 static struct tvnorm f50ccir601 = { 864, 720, 75, 804, 625, 576, 18 };
 static struct tvnorm f60ccir601 = { 858, 720, 57, 788, 525, 480, 16 };
 
-static struct tvnorm f50ccir601_lml33 = { 864, 720, 75+34, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601_lml33 = { 858, 720, 57+34, 788, 525, 480, 16 };
+static struct tvnorm f50ccir601_lml33 = { 864, 720, 75 + 34, 804, 625, 576, 18 };
+static struct tvnorm f60ccir601_lml33 = { 858, 720, 57 + 34, 788, 525, 480, 16 };
 
 /* The DC10 (57/16/50) uses VActive as HSync, so HStart must be 0 */
 static struct tvnorm f50sqpixel_dc10 = { 944, 768, 0, 880, 625, 576, 0 };
 static struct tvnorm f60sqpixel_dc10 = { 780, 640, 0, 716, 525, 480, 12 };
 
-/* FIXME: I cannot swap U and V in saa7114, so i do one
- * pixel left shift in zoran (75 -> 74)
- * (Maxim Yevtyushkin <max@linuxmedialabs.com>) */
-static struct tvnorm f50ccir601_lm33r10 = { 864, 720, 74+54, 804, 625, 576, 18 };
-static struct tvnorm f60ccir601_lm33r10 = { 858, 720, 56+54, 788, 525, 480, 16 };
+/*
+ * FIXME: I cannot swap U and V in saa7114, so i do one pixel left shift in zoran (75 -> 74)
+ * (Maxim Yevtyushkin <max@linuxmedialabs.com>)
+ */
+static struct tvnorm f50ccir601_lm33r10 = { 864, 720, 74 + 54, 804, 625, 576, 18 };
+static struct tvnorm f60ccir601_lm33r10 = { 858, 720, 56 + 54, 788, 525, 480, 16 };
 
-/* FIXME: The ks0127 seem incapable of swapping U and V, too, which is why I
- * copy Maxim's left shift hack for the 6 Eyes.
+/*
+ * FIXME: The ks0127 seem incapable of swapping U and V, too, which is why I copy Maxim's left
+ * shift hack for the 6 Eyes.
  *
  * Christer's driver used the unshifted norms, though...
- * /Sam  */
+ * /Sam
+ */
 static struct tvnorm f50ccir601_avs6eyes = { 864, 720, 74, 804, 625, 576, 18 };
 static struct tvnorm f60ccir601_avs6eyes = { 858, 720, 56, 788, 525, 480, 16 };
 
@@ -375,7 +334,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 2, "S-Video" },
 			{ 0, "Internal/comp" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 			&f50sqpixel_dc10,
 			&f60sqpixel_dc10,
@@ -405,7 +364,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 				{ 7, "S-Video" },
 				{ 5, "Internal/comp" }
 			},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 				&f50sqpixel,
 				&f60sqpixel,
@@ -434,7 +393,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 7, "S-Video" },
 			{ 5, "Internal/comp" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 			&f50sqpixel,
 			&f60sqpixel,
@@ -465,7 +424,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 2, "S-Video" },
 			{ 0, "Internal/comp" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 			&f50sqpixel_dc10,
 			&f60sqpixel_dc10,
@@ -496,7 +455,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 2, "S-Video" },
 			{ 0, "Internal/comp" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 			&f50sqpixel_dc10,
 			&f60sqpixel_dc10,
@@ -525,7 +484,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 0, "Composite" },
 			{ 7, "S-Video" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL,
 		.tvn = {
 			&f50ccir601_lml33,
 			&f60ccir601_lml33,
@@ -554,7 +513,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 0, "Composite" },
 			{ 7, "S-Video" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL,
 		.tvn = {
 			&f50ccir601_lm33r10,
 			&f60ccir601_lm33r10,
@@ -583,7 +542,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{ 3, "Composite" },
 			{ 7, "S-Video" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL|V4L2_STD_SECAM,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL | V4L2_STD_SECAM,
 		.tvn = {
 			&f50ccir601,
 			&f60ccir601,
@@ -601,8 +560,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 	}, {
 		.type = AVS6EYES,
 		.name = "6-Eyes",
-		/* AverMedia chose not to brand the 6-Eyes. Thus it
-		   can't be autodetected, and requires card=x. */
+/* AverMedia chose not to brand the 6-Eyes. Thus it can't be autodetected, and requires card=x. */
 		.i2c_decoder = "ks0127",
 		.addrs_decoder = ks0127_addrs,
 		.i2c_encoder = "bt866",
@@ -622,7 +580,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 			{10, "S-Video 3" },
 			{15, "YCbCr" }
 		},
-		.norms = V4L2_STD_NTSC|V4L2_STD_PAL,
+		.norms = V4L2_STD_NTSC | V4L2_STD_PAL,
 		.tvn = {
 			&f50ccir601_avs6eyes,
 			&f60ccir601_avs6eyes,
@@ -645,27 +603,23 @@ static struct card_info zoran_cards[NUM_CARDS] = {
  * I2C functions
  */
 /* software I2C functions */
-static int
-zoran_i2c_getsda (void *data)
+static int zoran_i2c_getsda(void *data)
 {
-	struct zoran *zr = (struct zoran *) data;
+	struct zoran *zr = (struct zoran *)data;
 
 	return (btread(ZR36057_I2CBR) >> 1) & 1;
 }
 
-static int
-zoran_i2c_getscl (void *data)
+static int zoran_i2c_getscl(void *data)
 {
-	struct zoran *zr = (struct zoran *) data;
+	struct zoran *zr = (struct zoran *)data;
 
 	return btread(ZR36057_I2CBR) & 1;
 }
 
-static void
-zoran_i2c_setsda (void *data,
-		  int   state)
+static void zoran_i2c_setsda(void *data, int state)
 {
-	struct zoran *zr = (struct zoran *) data;
+	struct zoran *zr = (struct zoran *)data;
 
 	if (state)
 		zr->i2cbr |= 2;
@@ -674,11 +628,9 @@ zoran_i2c_setsda (void *data,
 	btwrite(zr->i2cbr, ZR36057_I2CBR);
 }
 
-static void
-zoran_i2c_setscl (void *data,
-		  int   state)
+static void zoran_i2c_setscl(void *data, int state)
 {
-	struct zoran *zr = (struct zoran *) data;
+	struct zoran *zr = (struct zoran *)data;
 
 	if (state)
 		zr->i2cbr |= 1;
@@ -696,8 +648,7 @@ static const struct i2c_algo_bit_data zoran_i2c_bit_data_template = {
 	.timeout = 100,
 };
 
-static int
-zoran_register_i2c (struct zoran *zr)
+static int zoran_register_i2c(struct zoran *zr)
 {
 	zr->i2c_algo = zoran_i2c_bit_data_template;
 	zr->i2c_algo.data = zr;
@@ -709,18 +660,14 @@ zoran_register_i2c (struct zoran *zr)
 	return i2c_bit_add_bus(&zr->i2c_adapter);
 }
 
-static void
-zoran_unregister_i2c (struct zoran *zr)
+static void zoran_unregister_i2c(struct zoran *zr)
 {
 	i2c_del_adapter(&zr->i2c_adapter);
 }
 
 /* Check a zoran_params struct for correctness, insert default params */
-
-int
-zoran_check_jpg_settings (struct zoran              *zr,
-			  struct zoran_jpg_settings *settings,
-			  int try)
+int zoran_check_jpg_settings(struct zoran *zr,
+			     struct zoran_jpg_settings *settings, int try)
 {
 	int err = 0, err0 = 0;
 
@@ -877,8 +824,7 @@ zoran_check_jpg_settings (struct zoran              *zr,
 	return 0;
 }
 
-void
-zoran_open_init_params (struct zoran *zr)
+void zoran_open_init_params(struct zoran *zr)
 {
 	int i;
 
@@ -903,14 +849,12 @@ zoran_open_init_params (struct zoran *zr)
 	zr->v4l_pend_head = 0;
 	zr->v4l_sync_tail = 0;
 	zr->v4l_buffers.active = ZORAN_FREE;
-	for (i = 0; i < VIDEO_MAX_FRAME; i++) {
+	for (i = 0; i < VIDEO_MAX_FRAME; i++)
 		zr->v4l_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-	}
 	zr->v4l_buffers.allocated = 0;
 
-	for (i = 0; i < BUZ_MAX_FRAME; i++) {
+	for (i = 0; i < BUZ_MAX_FRAME; i++)
 		zr->jpg_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-	}
 	zr->jpg_buffers.active = ZORAN_FREE;
 	zr->jpg_buffers.allocated = 0;
 	/* Set necessary params and call zoran_check_jpg_settings to set the defaults */
@@ -938,7 +882,7 @@ zoran_open_init_params (struct zoran *zr)
 	zr->testing = 0;
 }
 
-static void test_interrupts (struct zoran *zr)
+static void test_interrupts(struct zoran *zr)
 {
 	DEFINE_WAIT(wait);
 	int timeout, icr;
@@ -955,15 +899,14 @@ static void test_interrupts (struct zoran *zr)
 	btwrite(0x78000000, ZR36057_ISR);
 	zr->testing = 0;
 	dprintk(5, KERN_INFO "%s: Testing interrupts...\n", ZR_DEVNAME(zr));
-	if (timeout) {
+	if (timeout)
 		dprintk(1, ": time spent: %d\n", 1 * HZ - timeout);
-	}
 	if (zr36067_debug > 1)
 		print_interrupts(zr);
 	btwrite(icr, ZR36057_ICR);
 }
 
-static int zr36057_init (struct zoran *zr)
+static int zr36057_init(struct zoran *zr)
 {
 	int j, err;
 
@@ -981,7 +924,7 @@ static int zr36057_init (struct zoran *zr)
 	zr->jpg_buffers.allocated = 0;
 	zr->v4l_buffers.allocated = 0;
 
-	zr->vbuf_base = (void *) vidmem;
+	zr->vbuf_base = (void *)vidmem;
 	zr->vbuf_width = 0;
 	zr->vbuf_height = 0;
 	zr->vbuf_depth = 0;
@@ -1000,7 +943,7 @@ static int zr36057_init (struct zoran *zr)
 		zr->norm = V4L2_STD_SECAM;
 		zr->timing = zr->card.tvn[2];
 	}
-	if (zr->timing == NULL) {
+	if (!zr->timing) {
 		dprintk(1,
 			KERN_WARNING
 			"%s: %s - default TV standard not supported by hardware. PAL will be used.\n",
@@ -1009,11 +952,11 @@ static int zr36057_init (struct zoran *zr)
 		zr->timing = zr->card.tvn[0];
 	}
 
-	if (default_input > zr->card.inputs-1) {
+	if (default_input > zr->card.inputs - 1) {
 		dprintk(1,
 			KERN_WARNING
 			"%s: default_input value %d out of range (0-%d)\n",
-			ZR_DEVNAME(zr), default_input, zr->card.inputs-1);
+			ZR_DEVNAME(zr), default_input, zr->card.inputs - 1);
 		default_input = 0;
 	}
 	zr->input = default_input;
@@ -1021,8 +964,7 @@ static int zr36057_init (struct zoran *zr)
 	/* default setup (will be repeated at every open) */
 	zoran_open_init_params(zr);
 
-	/* allocate memory *before* doing anything to the hardware
-	 * in case allocation fails */
+	/* allocate memory *before* doing anything to the hardware in case allocation fails */
 	zr->stat_com = kzalloc(BUZ_NUM_STAT_COM * 4, GFP_KERNEL);
 	zr->video_dev = video_device_alloc();
 	if (!zr->stat_com || !zr->video_dev) {
@@ -1033,20 +975,19 @@ static int zr36057_init (struct zoran *zr)
 		err = -ENOMEM;
 		goto exit_free;
 	}
-	for (j = 0; j < BUZ_NUM_STAT_COM; j++) {
+	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
-	}
 
-	/*
-	 *   Now add the template and register the device unit.
-	 */
+	/* Now add the template and register the device unit. */
 	*zr->video_dev = zoran_template;
 	zr->video_dev->v4l2_dev = &zr->v4l2_dev;
 	zr->video_dev->lock = &zr->lock;
 	strscpy(zr->video_dev->name, ZR_DEVNAME(zr), sizeof(zr->video_dev->name));
-	/* It's not a mem2mem device, but you can both capture and output from
-	   one and the same device. This should really be split up into two
-	   device nodes, but that's a job for another day. */
+	/*
+	 * It's not a mem2mem device, but you can both capture and output from one and the same
+	 * device. This should really be split up into two device nodes, but that's a job for
+	 * another day.
+	 */
 	zr->video_dev->vfl_dir = VFL_DIR_M2M;
 	err = video_register_device(zr->video_dev, VFL_TYPE_GRABBER, video_nr[zr->id]);
 	if (err < 0)
@@ -1113,8 +1054,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	kfree(zr);
 }
 
-void
-zoran_vdev_release (struct video_device *vdev)
+void zoran_vdev_release(struct video_device *vdev)
 {
 	kfree(vdev);
 }
@@ -1124,17 +1064,14 @@ static struct videocodec_master *zoran_setup_videocodec(struct zoran *zr,
 {
 	struct videocodec_master *m = NULL;
 
-	m = kmalloc(sizeof(struct videocodec_master), GFP_KERNEL);
-	if (!m) {
-		dprintk(1, KERN_ERR "%s: %s - no memory\n",
-			ZR_DEVNAME(zr), __func__);
+	m = kmalloc(sizeof(*m), GFP_KERNEL);
+	if (!m)
 		return m;
-	}
 
-	/* magic and type are unused for master struct. Makes sense only at
-	   codec structs.
-	   In the past, .type were initialized to the old V4L1 .hardware
-	   value, as VID_HARDWARE_ZR36067
+	/*
+	 * magic and type are unused for master struct. Makes sense only at codec structs.
+	 * In the past, .type were initialized to the old V4L1 .hardware value,
+	 * as VID_HARDWARE_ZR36067
 	 */
 	m->magic = 0L;
 	m->type = 0;
@@ -1143,8 +1080,7 @@ static struct videocodec_master *zoran_setup_videocodec(struct zoran *zr,
 	strscpy(m->name, ZR_DEVNAME(zr), sizeof(m->name));
 	m->data = zr;
 
-	switch (type)
-	{
+	switch (type) {
 	case CODEC_TYPE_ZR36060:
 		m->readreg = zr36060_read;
 		m->writereg = zr36060_write;
@@ -1169,8 +1105,10 @@ static void zoran_subdev_notify(struct v4l2_subdev *sd, unsigned int cmd, void *
 {
 	struct zoran *zr = to_zoran(sd->v4l2_dev);
 
-	/* Bt819 needs to reset its FIFO buffer using #FRST pin and
-	   LML33 card uses GPIO(7) for that. */
+	/*
+	 * Bt819 needs to reset its FIFO buffer using #FRST pin and
+	 * LML33 card uses GPIO(7) for that.
+	 */
 	if (cmd == BT819_FIFO_RESET_LOW)
 		GPIO(zr, 7, 0);
 	else if (cmd == BT819_FIFO_RESET_HIGH)
@@ -1192,7 +1130,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	char *codec_name, *vfe_name;
 	unsigned int nr;
 
-
 	nr = zoran_num++;
 	if (nr >= BUZ_MAX) {
 		dprintk(1, KERN_ERR "%s: driver limited to %d card(s) maximum\n",
@@ -1200,12 +1137,10 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return -ENOENT;
 	}
 
-	zr = kzalloc(sizeof(struct zoran), GFP_KERNEL);
-	if (!zr) {
-		dprintk(1, KERN_ERR "%s: %s - kzalloc failed\n",
-			ZORAN_NAME, __func__);
+	zr = kzalloc(sizeof(*zr), GFP_KERNEL);
+	if (!zr)
 		return -ENOMEM;
-	}
+
 	zr->v4l2_dev.notify = zoran_subdev_notify;
 	if (v4l2_device_register(&pdev->dev, &zr->v4l2_dev))
 		goto zr_free_mem;
@@ -1271,14 +1206,16 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		}
 	}
 
-	/* even though we make this a non pointer and thus
+	/*
+	 * even though we make this a non pointer and thus
 	 * theoretically allow for making changes to this struct
 	 * on a per-individual card basis at runtime, this is
 	 * strongly discouraged. This structure is intended to
-	 * keep general card information, no settings or anything */
+	 * keep general card information, no settings or anything
+	 */
 	zr->card = zoran_cards[card_num];
-	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)),
-		 "%s[%u]", zr->card.name, zr->id);
+	snprintf(ZR_DEVNAME(zr), sizeof(ZR_DEVNAME(zr)), "%s[%u]",
+		 zr->card.name, zr->id);
 
 	zr->zr36057_mem = pci_ioremap_bar(zr->pci_dev, 0);
 	if (!zr->zr36057_mem) {
@@ -1316,14 +1253,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (latency != need_latency) {
 		dprintk(2, KERN_INFO "%s: Changing PCI latency from %d to %d\n",
 			ZR_DEVNAME(zr), latency, need_latency);
-		pci_write_config_byte(zr->pci_dev, PCI_LATENCY_TIMER,
-				      need_latency);
+		pci_write_config_byte(zr->pci_dev, PCI_LATENCY_TIMER, need_latency);
 	}
 
 	zr36057_restart(zr);
 	/* i2c */
-	dprintk(2, KERN_INFO "%s: Initializing i2c bus...\n",
-		ZR_DEVNAME(zr));
+	dprintk(2, KERN_INFO "%s: Initializing i2c bus...\n", ZR_DEVNAME(zr));
 
 	if (zoran_register_i2c(zr) < 0) {
 		dprintk(1, KERN_ERR "%s: %s - can't initialize i2c bus\n",
@@ -1331,18 +1266,16 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto zr_free_irq;
 	}
 
-	zr->decoder = v4l2_i2c_new_subdev(&zr->v4l2_dev,
-		&zr->i2c_adapter, zr->card.i2c_decoder,
-		0, zr->card.addrs_decoder);
+	zr->decoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
+					  zr->card.i2c_decoder, 0,
+					  zr->card.addrs_decoder);
 
 	if (zr->card.i2c_encoder)
-		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev,
-			&zr->i2c_adapter, zr->card.i2c_encoder,
-			0, zr->card.addrs_encoder);
+		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
+						  zr->card.i2c_encoder, 0,
+						  zr->card.addrs_encoder);
 
-	dprintk(2,
-		KERN_INFO "%s: Initializing videocodec bus...\n",
-		ZR_DEVNAME(zr));
+	dprintk(2, KERN_INFO "%s: Initializing videocodec bus...\n", ZR_DEVNAME(zr));
 
 	if (zr->card.video_codec) {
 		codec_name = codecid_to_modulename(zr->card.video_codec);
@@ -1457,16 +1390,14 @@ static int __init zoran_init(void)
 {
 	int res;
 
-	printk(KERN_INFO "Zoran MJPEG board driver version %s\n",
-	       ZORAN_VERSION);
+	pr_info("Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
 
 	/* check the parameters we have been given, adjust if necessary */
 	if (v4l_nbufs < 2)
 		v4l_nbufs = 2;
 	if (v4l_nbufs > VIDEO_MAX_FRAME)
 		v4l_nbufs = VIDEO_MAX_FRAME;
-	/* The user specifies the in KB, we want them in byte
-	 * (and page aligned) */
+	/* The user specifies the in KB, we want them in byte (and page aligned) */
 	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
 	if (v4l_bufsize < 32768)
 		v4l_bufsize = 32768;
@@ -1491,19 +1422,17 @@ static int __init zoran_init(void)
 	}
 
 	/* some mainboards might not do PCI-PCI data transfer well */
-	if (pci_pci_problems & (PCIPCI_FAIL|PCIAGP_FAIL|PCIPCI_ALIMAGIK)) {
+	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK)) {
 		dprintk(1,
 			KERN_WARNING
-			"%s: chipset does not support reliable PCI-PCI DMA\n",
-			ZORAN_NAME);
+			"%s: chipset does not support reliable PCI-PCI DMA\n", ZORAN_NAME);
 	}
 
 	res = pci_register_driver(&zoran_driver);
 	if (res) {
 		dprintk(1,
 			KERN_ERR
-			"%s: Unable to register ZR36057 driver\n",
-			ZORAN_NAME);
+			"%s: Unable to register ZR36057 driver\n", ZORAN_NAME);
 		return res;
 	}
 
diff --git a/drivers/staging/media/zoran/zoran_card.h b/drivers/staging/media/zoran/zoran_card.h
index 53ed511ce546..4af8cb91d03a 100644
--- a/drivers/staging/media/zoran/zoran_card.h
+++ b/drivers/staging/media/zoran/zoran_card.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Zoran zr36057/zr36067 PCI controller driver, for the
  * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
@@ -6,16 +7,6 @@
  * This part handles card-specific data and detection
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef __ZORAN_CARD_H__
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 79da964c678b..cbacfa4ea2d0 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran zr36057/zr36067 PCI controller driver, for the
  * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
@@ -6,16 +7,6 @@
  * This part handles device access (PCI/I2C/codec/...)
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/types.h>
@@ -39,16 +30,16 @@
 #include <linux/wait.h>
 
 #include <asm/byteorder.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #include "videocodec.h"
 #include "zoran.h"
 #include "zoran_device.h"
 #include "zoran_card.h"
 
-#define IRQ_MASK ( ZR36057_ISR_GIRQ0 | \
-		   ZR36057_ISR_GIRQ1 | \
-		   ZR36057_ISR_JPEGRepIRQ )
+#define IRQ_MASK (ZR36057_ISR_GIRQ0 | \
+		  ZR36057_ISR_GIRQ1 | \
+		  ZR36057_ISR_JPEGRepIRQ)
 
 static bool lml33dpath;		/* default = 0
 				 * 1 will use digital path in capture
@@ -58,14 +49,13 @@ static bool lml33dpath;		/* default = 0
 				 * on TV monitor connected to the output.
 				 * However, due to absence of 75 Ohm
 				 * load on Bt819 input, there will be
-				 * some image imperfections */
+				 * some image imperfections
+				 */
 
 module_param(lml33dpath, bool, 0644);
-MODULE_PARM_DESC(lml33dpath,
-		 "Use digital path capture mode (on LML33 cards)");
+MODULE_PARM_DESC(lml33dpath, "Use digital path capture mode (on LML33 cards)");
 
-static void
-zr36057_init_vfe (struct zoran *zr);
+static void zr36057_init_vfe(struct zoran *zr);
 
 /*
  * General Purpose I/O and Guest bus access
@@ -76,22 +66,20 @@ zr36057_init_vfe (struct zoran *zr);
  * GPIO bit number in the card_info structure is set to 0.
  */
 
-void
-GPIO (struct zoran *zr,
-      int           bit,
-      unsigned int  value)
+void GPIO(struct zoran *zr, int bit, unsigned int value)
 {
 	u32 reg;
 	u32 mask;
 
 	/* Make sure the bit number is legal
 	 * A bit number of -1 (lacking) gives a mask of 0,
-	 * making it harmless */
+	 * making it harmless
+	 */
 	mask = (1 << (24 + bit)) & 0xff000000;
 	reg = btread(ZR36057_GPPGCR1) & ~mask;
-	if (value) {
+	if (value)
 		reg |= mask;
-	}
+
 	btwrite(reg, ZR36057_GPPGCR1);
 	udelay(1);
 }
@@ -100,8 +88,7 @@ GPIO (struct zoran *zr,
  * Wait til post office is no longer busy
  */
 
-int
-post_office_wait (struct zoran *zr)
+int post_office_wait(struct zoran *zr)
 {
 	u32 por;
 
@@ -119,11 +106,8 @@ post_office_wait (struct zoran *zr)
 	return 0;
 }
 
-int
-post_office_write (struct zoran *zr,
-		   unsigned int  guest,
-		   unsigned int  reg,
-		   unsigned int  value)
+int post_office_write(struct zoran *zr, unsigned int guest,
+		      unsigned int reg, unsigned int value)
 {
 	u32 por;
 
@@ -135,18 +119,14 @@ post_office_write (struct zoran *zr,
 	return post_office_wait(zr);
 }
 
-int
-post_office_read (struct zoran *zr,
-		  unsigned int  guest,
-		  unsigned int  reg)
+int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg)
 {
 	u32 por;
 
 	por = ZR36057_POR_POTime | ((guest & 7) << 20) | ((reg & 7) << 16);
 	btwrite(por, ZR36057_POR);
-	if (post_office_wait(zr) < 0) {
+	if (post_office_wait(zr) < 0)
 		return -1;
-	}
 
 	return btread(ZR36057_POR) & 0xFF;
 }
@@ -155,33 +135,27 @@ post_office_read (struct zoran *zr,
  * detect guests
  */
 
-static void
-dump_guests (struct zoran *zr)
+static void dump_guests(struct zoran *zr)
 {
 	if (zr36067_debug > 2) {
 		int i, guest[8];
 
-		for (i = 1; i < 8; i++) {	// Don't read jpeg codec here
+		for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
 			guest[i] = post_office_read(zr, i, 0);
-		}
 
-		printk(KERN_INFO "%s: Guests: %*ph\n",
-		       ZR_DEVNAME(zr), 8, guest);
+		pr_info("%s: Guests: %*ph\n", ZR_DEVNAME(zr), 8, guest);
 	}
 }
 
-void
-detect_guest_activity (struct zoran *zr)
+void detect_guest_activity(struct zoran *zr)
 {
 	int timeout, i, j, res, guest[8], guest0[8], change[8][3];
 	ktime_t t0, t1;
 
 	dump_guests(zr);
-	printk(KERN_INFO "%s: Detecting guests activity, please wait...\n",
-	       ZR_DEVNAME(zr));
-	for (i = 1; i < 8; i++) {	// Don't read jpeg codec here
+	pr_info("%s: Detecting guests activity, please wait...\n", ZR_DEVNAME(zr));
+	for (i = 1; i < 8; i++) /* Don't read jpeg codec here */
 		guest0[i] = guest[i] = post_office_read(zr, i, 0);
-	}
 
 	timeout = 0;
 	j = 0;
@@ -205,44 +179,40 @@ detect_guest_activity (struct zoran *zr)
 			break;
 	}
 
-	printk(KERN_INFO "%s: Guests: %*ph\n", ZR_DEVNAME(zr), 8, guest0);
+	pr_info("%s: Guests: %*ph\n", ZR_DEVNAME(zr), 8, guest0);
 
 	if (j == 0) {
-		printk(KERN_INFO "%s: No activity detected.\n", ZR_DEVNAME(zr));
+		pr_info("%s: No activity detected.\n", ZR_DEVNAME(zr));
 		return;
 	}
-	for (i = 0; i < j; i++) {
-		printk(KERN_INFO "%s: %6d: %d => 0x%02x\n", ZR_DEVNAME(zr),
-		       change[i][0], change[i][1], change[i][2]);
-	}
+	for (i = 0; i < j; i++)
+		pr_info("%s: %6d: %d => 0x%02x\n", ZR_DEVNAME(zr),
+			change[i][0], change[i][1], change[i][2]);
 }
 
 /*
  * JPEG Codec access
  */
 
-void
-jpeg_codec_sleep (struct zoran *zr,
-		  int           sleep)
+void jpeg_codec_sleep(struct zoran *zr, int sleep)
 {
 	GPIO(zr, zr->card.gpio[ZR_GPIO_JPEG_SLEEP], !sleep);
 	if (!sleep) {
 		dprintk(3,
-			KERN_DEBUG
-			"%s: jpeg_codec_sleep() - wake GPIO=0x%08x\n",
-			ZR_DEVNAME(zr), btread(ZR36057_GPPGCR1));
+			KERN_INFO
+			"%s: %s() - wake GPIO=0x%08x\n",
+			ZR_DEVNAME(zr), __func__, btread(ZR36057_GPPGCR1));
 		udelay(500);
 	} else {
 		dprintk(3,
-			KERN_DEBUG
-			"%s: jpeg_codec_sleep() - sleep GPIO=0x%08x\n",
-			ZR_DEVNAME(zr), btread(ZR36057_GPPGCR1));
+			KERN_INFO
+			"%s: %s() - sleep GPIO=0x%08x\n",
+			ZR_DEVNAME(zr), __func__, btread(ZR36057_GPPGCR1));
 		udelay(2);
 	}
 }
 
-int
-jpeg_codec_reset (struct zoran *zr)
+int jpeg_codec_reset(struct zoran *zr)
 {
 	/* Take the codec out of sleep */
 	jpeg_codec_sleep(zr, 0);
@@ -266,10 +236,7 @@ jpeg_codec_reset (struct zoran *zr)
  *   trying to understand this without the ZR36057 manual in front of
  *   you [AC].
  */
-
-static void
-zr36057_adjust_vfe (struct zoran          *zr,
-		    enum zoran_codec_mode  mode)
+static void zr36057_adjust_vfe(struct zoran *zr, enum zoran_codec_mode mode)
 {
 	u32 reg;
 
@@ -277,9 +244,9 @@ zr36057_adjust_vfe (struct zoran          *zr,
 	case BUZ_MODE_MOTION_DECOMPRESS:
 		btand(~ZR36057_VFESPFR_ExtFl, ZR36057_VFESPFR);
 		reg = btread(ZR36057_VFEHCR);
-		if ((reg & (1 << 10)) && zr->card.type != LML33R10) {
+		if ((reg & (1 << 10)) && zr->card.type != LML33R10)
 			reg += ((1 << 10) | 1);
-		}
+
 		btwrite(reg, ZR36057_VFEHCR);
 		break;
 	case BUZ_MODE_MOTION_COMPRESS:
@@ -292,9 +259,9 @@ zr36057_adjust_vfe (struct zoran          *zr,
 		else
 			btor(ZR36057_VFESPFR_ExtFl, ZR36057_VFESPFR);
 		reg = btread(ZR36057_VFEHCR);
-		if (!(reg & (1 << 10)) && zr->card.type != LML33R10) {
+		if (!(reg & (1 << 10)) && zr->card.type != LML33R10)
 			reg -= ((1 << 10) | 1);
-		}
+
 		btwrite(reg, ZR36057_VFEHCR);
 		break;
 	}
@@ -304,21 +271,18 @@ zr36057_adjust_vfe (struct zoran          *zr,
  * set geometry
  */
 
-static void
-zr36057_set_vfe (struct zoran              *zr,
-		 int                        video_width,
-		 int                        video_height,
-		 const struct zoran_format *format)
+static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
+			    const struct zoran_format *format)
 {
 	struct tvnorm *tvn;
-	unsigned HStart, HEnd, VStart, VEnd;
-	unsigned DispMode;
-	unsigned VidWinWid, VidWinHt;
-	unsigned hcrop1, hcrop2, vcrop1, vcrop2;
-	unsigned Wa, We, Ha, He;
-	unsigned X, Y, HorDcm, VerDcm;
+	unsigned int HStart, HEnd, VStart, VEnd;
+	unsigned int DispMode;
+	unsigned int VidWinWid, VidWinHt;
+	unsigned int hcrop1, hcrop2, vcrop1, vcrop2;
+	unsigned int Wa, We, Ha, He;
+	unsigned int X, Y, HorDcm, VerDcm;
 	u32 reg;
-	unsigned mask_line_size;
+	unsigned int mask_line_size;
 
 	tvn = zr->timing;
 
@@ -394,13 +358,13 @@ zr36057_set_vfe (struct zoran              *zr,
 	if (!(zr->norm & V4L2_STD_NTSC))
 		reg |= ZR36057_VFESPFR_ExtFl;	// NEEDED!!!!!!! Wolfgang
 	reg |= ZR36057_VFESPFR_TopField;
-	if (HorDcm >= 48) {
+	if (HorDcm >= 48)
 		reg |= 3 << ZR36057_VFESPFR_HFilter;	/* 5 tap filter */
-	} else if (HorDcm >= 32) {
+	else if (HorDcm >= 32)
 		reg |= 2 << ZR36057_VFESPFR_HFilter;	/* 4 tap filter */
-	} else if (HorDcm >= 16) {
+	else if (HorDcm >= 16)
 		reg |= 1 << ZR36057_VFESPFR_HFilter;	/* 3 tap filter */
-	}
+
 	reg |= format->vfespfr;
 	btwrite(reg, ZR36057_VFESPFR);
 
@@ -442,9 +406,7 @@ zr36057_set_vfe (struct zoran              *zr,
  * Switch overlay on or off
  */
 
-void
-zr36057_overlay (struct zoran *zr,
-		 int           on)
+void zr36057_overlay(struct zoran *zr, int on)
 {
 	u32 reg;
 
@@ -462,7 +424,7 @@ zr36057_overlay (struct zoran *zr,
 		 * All error messages are internal driver checking only! */
 
 		/* video display top and bottom registers */
-		reg = (long) zr->vbuf_base +
+		reg = (long)zr->vbuf_base +
 		    zr->overlay_settings.x *
 		    ((zr->overlay_settings.format->depth + 7) / 8) +
 		    zr->overlay_settings.y *
@@ -512,10 +474,10 @@ zr36057_overlay (struct zoran *zr,
 void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count)
 {
 	struct zoran *zr = fh->zr;
-	unsigned mask_line_size = (BUZ_MAX_WIDTH + 31) / 32;
+	unsigned int mask_line_size = (BUZ_MAX_WIDTH + 31) / 32;
 	u32 *mask;
 	int x, y, width, height;
-	unsigned i, j, k;
+	unsigned int i, j, k;
 
 	/* fill mask with one bits */
 	memset(fh->overlay_mask, ~0, mask_line_size * 4 * BUZ_MAX_HEIGHT);
@@ -536,20 +498,16 @@ void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count)
 			height += y;
 			y = 0;
 		}
-		if (x + width > fh->overlay_settings.width) {
+		if (x + width > fh->overlay_settings.width)
 			width = fh->overlay_settings.width - x;
-		}
-		if (y + height > fh->overlay_settings.height) {
+		if (y + height > fh->overlay_settings.height)
 			height = fh->overlay_settings.height - y;
-		}
 
 		/* ignore degenerate clips */
-		if (height <= 0) {
+		if (height <= 0)
 			continue;
-		}
-		if (width <= 0) {
+		if (width <= 0)
 			continue;
-		}
 
 		/* apply clip for each scan line */
 		for (j = 0; j < height; ++j) {
@@ -558,17 +516,14 @@ void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count)
 			mask = fh->overlay_mask + (y + j) * mask_line_size;
 			for (k = 0; k < width; ++k) {
 				mask[(x + k) / 32] &=
-				    ~((u32) 1 << (x + k) % 32);
+				    ~((u32)1 << (x + k) % 32);
 			}
 		}
 	}
 }
 
 /* Enable/Disable uncompressed memory grabbing of the 36057 */
-
-void
-zr36057_set_memgrab (struct zoran *zr,
-		     int           mode)
+void zr36057_set_memgrab(struct zoran *zr, int mode)
 {
 	if (mode) {
 		/* We only check SnapShot and not FrameGrab here.  SnapShot==1
@@ -614,8 +569,7 @@ zr36057_set_memgrab (struct zoran *zr,
 	}
 }
 
-int
-wait_grab_pending (struct zoran *zr)
+int wait_grab_pending(struct zoran *zr)
 {
 	unsigned long flags;
 
@@ -625,7 +579,7 @@ wait_grab_pending (struct zoran *zr)
 		return 0;
 
 	wait_event_interruptible(zr->v4l_capq,
-			(zr->v4l_pend_tail == zr->v4l_pend_head));
+				 (zr->v4l_pend_tail == zr->v4l_pend_head));
 	if (signal_pending(current))
 		return -ERESTARTSYS;
 
@@ -642,16 +596,12 @@ wait_grab_pending (struct zoran *zr)
  *                                                                           *
  *****************************************************************************/
 
-static inline void
-set_frame (struct zoran *zr,
-	   int           val)
+static inline void set_frame(struct zoran *zr, int val)
 {
 	GPIO(zr, zr->card.gpio[ZR_GPIO_JPEG_FRAME], val);
 }
 
-static void
-set_videobus_dir (struct zoran *zr,
-		  int           val)
+static void set_videobus_dir(struct zoran *zr, int val)
 {
 	switch (zr->card.type) {
 	case LML33:
@@ -668,8 +618,7 @@ set_videobus_dir (struct zoran *zr,
 	}
 }
 
-static void
-init_jpeg_queue (struct zoran *zr)
+static void init_jpeg_queue(struct zoran *zr)
 {
 	int i;
 
@@ -684,17 +633,14 @@ init_jpeg_queue (struct zoran *zr)
 	zr->jpg_err_seq = 0;
 	zr->jpg_err_shift = 0;
 	zr->jpg_queued_num = 0;
-	for (i = 0; i < zr->jpg_buffers.num_buffers; i++) {
+	for (i = 0; i < zr->jpg_buffers.num_buffers; i++)
 		zr->jpg_buffers.buffer[i].state = BUZ_STATE_USER;	/* nothing going on */
-	}
-	for (i = 0; i < BUZ_NUM_STAT_COM; i++) {
+
+	for (i = 0; i < BUZ_NUM_STAT_COM; i++)
 		zr->stat_com[i] = cpu_to_le32(1);	/* mark as unavailable to zr36057 */
-	}
 }
 
-static void
-zr36057_set_jpg (struct zoran          *zr,
-		 enum zoran_codec_mode  mode)
+static void zr36057_set_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 {
 	struct tvnorm *tvn;
 	u32 reg;
@@ -706,7 +652,6 @@ zr36057_set_jpg (struct zoran          *zr,
 
 	/* MJPEG compression mode */
 	switch (mode) {
-
 	case BUZ_MODE_MOTION_COMPRESS:
 	default:
 		reg = ZR36057_JMC_MJPGCmpMode;
@@ -726,7 +671,6 @@ zr36057_set_jpg (struct zoran          *zr,
 	case BUZ_MODE_STILL_DECOMPRESS:
 		reg = ZR36057_JMC_JPGExpMode;
 		break;
-
 	}
 	reg |= ZR36057_JMC_JPG;
 	if (zr->jpg_settings.field_per_buff == 1)
@@ -773,7 +717,6 @@ zr36057_set_jpg (struct zoran          *zr,
 	/* FIFO threshold (FIFO is 160. double words) */
 	/* NOTE: decimal values here */
 	switch (mode) {
-
 	case BUZ_MODE_STILL_COMPRESS:
 	case BUZ_MODE_MOTION_COMPRESS:
 		if (zr->card.type != BUZ)
@@ -790,35 +733,36 @@ zr36057_set_jpg (struct zoran          *zr,
 	default:
 		reg = 80;
 		break;
-
 	}
 	btwrite(reg, ZR36057_JCFT);
 	zr36057_adjust_vfe(zr, mode);
-
 }
 
-void
-print_interrupts (struct zoran *zr)
+void print_interrupts(struct zoran *zr)
 {
 	int res, noerr = 0;
 
-	printk(KERN_INFO "%s: interrupts received:", ZR_DEVNAME(zr));
-	if ((res = zr->field_counter) < -1 || res > 1) {
+	pr_info("%s: interrupts received:", ZR_DEVNAME(zr));
+	res = zr->field_counter;
+	if (res < -1 || res > 1)
 		printk(KERN_CONT " FD:%d", res);
-	}
-	if ((res = zr->intr_counter_GIRQ1) != 0) {
+	res = zr->intr_counter_GIRQ1;
+	if (res != 0) {
 		printk(KERN_CONT " GIRQ1:%d", res);
 		noerr++;
 	}
-	if ((res = zr->intr_counter_GIRQ0) != 0) {
+	res = zr->intr_counter_GIRQ0;
+	if (res != 0) {
 		printk(KERN_CONT " GIRQ0:%d", res);
 		noerr++;
 	}
-	if ((res = zr->intr_counter_CodRepIRQ) != 0) {
+	res = zr->intr_counter_CodRepIRQ;
+	if (res != 0) {
 		printk(KERN_CONT " CodRepIRQ:%d", res);
 		noerr++;
 	}
-	if ((res = zr->intr_counter_JPEGRepIRQ) != 0) {
+	res = zr->intr_counter_JPEGRepIRQ;
+	if (res != 0) {
 		printk(KERN_CONT " JPEGRepIRQ:%d", res);
 		noerr++;
 	}
@@ -833,14 +777,12 @@ print_interrupts (struct zoran *zr)
 	printk(KERN_CONT " queue_state=%ld/%ld/%ld/%ld", zr->jpg_que_tail,
 	       zr->jpg_dma_tail, zr->jpg_dma_head, zr->jpg_que_head);
 	//}
-	if (!noerr) {
+	if (!noerr)
 		printk(KERN_CONT ": no interrupts detected.");
-	}
 	printk(KERN_CONT "\n");
 }
 
-void
-clear_interrupt_counters (struct zoran *zr)
+void clear_interrupt_counters(struct zoran *zr)
 {
 	zr->intr_counter_GIRQ1 = 0;
 	zr->intr_counter_GIRQ0 = 0;
@@ -859,12 +801,12 @@ clear_interrupt_counters (struct zoran *zr)
 	zr->JPEG_min_missed = 0x7fffffff;
 }
 
-static u32
-count_reset_interrupt (struct zoran *zr)
+static u32 count_reset_interrupt(struct zoran *zr)
 {
 	u32 isr;
 
-	if ((isr = btread(ZR36057_ISR) & 0x78000000)) {
+	isr = btread(ZR36057_ISR) & 0x78000000;
+	if (isr) {
 		if (isr & ZR36057_ISR_GIRQ1) {
 			btwrite(ZR36057_ISR_GIRQ1, ZR36057_ISR);
 			zr->intr_counter_GIRQ1++;
@@ -885,8 +827,7 @@ count_reset_interrupt (struct zoran *zr)
 	return isr;
 }
 
-void
-jpeg_start (struct zoran *zr)
+void jpeg_start(struct zoran *zr)
 {
 	int reg;
 
@@ -902,9 +843,7 @@ jpeg_start (struct zoran *zr)
 	/* clear IRQs */
 	btwrite(IRQ_MASK, ZR36057_ISR);
 	/* enable the JPEG IRQs */
-	btwrite(zr->card.jpeg_int |
-			ZR36057_ICR_JPEGRepIRQ |
-			ZR36057_ICR_IntPinEn,
+	btwrite(zr->card.jpeg_int | ZR36057_ICR_JPEGRepIRQ | ZR36057_ICR_IntPinEn,
 		ZR36057_ICR);
 
 	set_frame(zr, 0);	// \FRAME
@@ -936,9 +875,7 @@ jpeg_start (struct zoran *zr)
 	dprintk(3, KERN_DEBUG "%s: jpeg_start\n", ZR_DEVNAME(zr));
 }
 
-void
-zr36057_enable_jpg (struct zoran          *zr,
-		    enum zoran_codec_mode  mode)
+void zr36057_enable_jpg(struct zoran *zr, enum zoran_codec_mode mode)
 {
 	struct vfe_settings cap;
 	int field_size =
@@ -955,7 +892,6 @@ zr36057_enable_jpg (struct zoran          *zr,
 	cap.quality = zr->jpg_settings.jpg_comp.quality;
 
 	switch (mode) {
-
 	case BUZ_MODE_MOTION_COMPRESS: {
 		struct jpeg_app_marker app;
 		struct jpeg_com_marker com;
@@ -1062,13 +998,11 @@ zr36057_enable_jpg (struct zoran          *zr,
 
 		dprintk(2, KERN_INFO "%s: enable_jpg(IDLE)\n", ZR_DEVNAME(zr));
 		break;
-
 	}
 }
 
 /* when this is called the spinlock must be held */
-void
-zoran_feed_stat_com (struct zoran *zr)
+void zoran_feed_stat_com(struct zoran *zr)
 {
 	/* move frames from pending queue to DMA */
 
@@ -1080,7 +1014,6 @@ zoran_feed_stat_com (struct zoran *zr)
 
 	while ((zr->jpg_dma_head - zr->jpg_dma_tail) < max_stat_com &&
 	       zr->jpg_dma_head < zr->jpg_que_head) {
-
 		frame = zr->jpg_pend[zr->jpg_dma_head & BUZ_MASK_FRAME];
 		if (zr->jpg_settings.TmpDcm == 1) {
 			/* fill 1 stat_com entry */
@@ -1103,15 +1036,13 @@ zoran_feed_stat_com (struct zoran *zr)
 		}
 		zr->jpg_buffers.buffer[frame].state = BUZ_STATE_DMA;
 		zr->jpg_dma_head++;
-
 	}
 	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS)
 		zr->jpg_queued_num++;
 }
 
 /* when this is called the spinlock must be held */
-static void
-zoran_reap_stat_com (struct zoran *zr)
+static void zoran_reap_stat_com(struct zoran *zr)
 {
 	/* move frames from DMA queue to done queue */
 
@@ -1125,9 +1056,9 @@ zoran_reap_stat_com (struct zoran *zr)
 	/* In motion decompress we don't have a hardware frame counter,
 	 * we just count the interrupts here */
 
-	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS) {
+	if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS)
 		zr->jpg_seq_num++;
-	}
+
 	while (zr->jpg_dma_tail < zr->jpg_dma_head) {
 		if (zr->jpg_settings.TmpDcm == 1)
 			i = (zr->jpg_dma_tail -
@@ -1138,9 +1069,9 @@ zoran_reap_stat_com (struct zoran *zr)
 
 		stat_com = le32_to_cpu(zr->stat_com[i]);
 
-		if ((stat_com & 1) == 0) {
+		if ((stat_com & 1) == 0)
 			return;
-		}
+
 		frame = zr->jpg_pend[zr->jpg_dma_tail & BUZ_MASK_FRAME];
 		buffer = &zr->jpg_buffers.buffer[frame];
 		buffer->bs.ts = ktime_get_ns();
@@ -1196,10 +1127,7 @@ static void zoran_restart(struct zoran *zr)
 	}
 }
 
-static void
-error_handler (struct zoran *zr,
-	       u32           astat,
-	       u32           stat)
+static void error_handler(struct zoran *zr, u32 astat, u32 stat)
 {
 	int i;
 
@@ -1255,13 +1183,12 @@ error_handler (struct zoran *zr,
 		int j;
 
 		frame = zr->jpg_pend[zr->jpg_dma_tail & BUZ_MASK_FRAME];
-		printk(KERN_ERR
-		       "%s: JPEG error stat=0x%08x(0x%08x) queue_state=%ld/%ld/%ld/%ld seq=%ld frame=%ld. Codec stopped. ",
-		       ZR_DEVNAME(zr), stat, zr->last_isr,
-		       zr->jpg_que_tail, zr->jpg_dma_tail,
-		       zr->jpg_dma_head, zr->jpg_que_head,
-		       zr->jpg_seq_num, frame);
-		printk(KERN_INFO "stat_com frames:");
+		pr_err("%s: JPEG error stat=0x%08x(0x%08x) queue_state=%ld/%ld/%ld/%ld seq=%ld frame=%ld. Codec stopped. ",
+			ZR_DEVNAME(zr), stat, zr->last_isr,
+			zr->jpg_que_tail, zr->jpg_dma_tail,
+			zr->jpg_dma_head, zr->jpg_que_head,
+			zr->jpg_seq_num, frame);
+		pr_info("stat_com frames:");
 		for (j = 0; j < BUZ_NUM_STAT_COM; j++) {
 			for (i = 0; i < zr->jpg_buffers.num_buffers; i++) {
 				if (le32_to_cpu(zr->stat_com[j]) == zr->jpg_buffers.buffer[i].jpg.frag_tab_bus)
@@ -1312,18 +1239,13 @@ error_handler (struct zoran *zr,
 	zoran_restart(zr);
 }
 
-irqreturn_t
-zoran_irq (int             irq,
-	   void           *dev_id)
+irqreturn_t zoran_irq(int irq, void *dev_id)
 {
 	u32 stat, astat;
-	int count;
-	struct zoran *zr;
+	int count = 0;
+	struct zoran *zr = dev_id;
 	unsigned long flags;
 
-	zr = dev_id;
-	count = 0;
-
 	if (zr->testing) {
 		/* Testing interrupts */
 		spin_lock_irqsave(&zr->spinlock, flags);
@@ -1347,13 +1269,9 @@ zoran_irq (int             irq,
 		/* get/clear interrupt status bits */
 		stat = count_reset_interrupt(zr);
 		astat = stat & IRQ_MASK;
-		if (!astat) {
+		if (!astat)
 			break;
-		}
-		dprintk(4,
-			KERN_DEBUG
-			"zoran_irq: astat: 0x%08x, mask: 0x%08x\n",
-			astat, btread(ZR36057_ICR));
+		pr_debug("%s: astat: 0x%08x, mask: 0x%08x\n", __func__, astat, btread(ZR36057_ICR));
 		if (astat & zr->card.vsync_int) {	// SW
 
 			if (zr->codec_mode == BUZ_MODE_MOTION_DECOMPRESS ||
@@ -1362,9 +1280,11 @@ zoran_irq (int             irq,
 				zr->JPEG_missed++;
 			}
 			//post_office_read(zr,1,0);
-			/* Interrupts may still happen when
+			/*
+			 * Interrupts may still happen when
 			 * zr->v4l_memgrab_active is switched off.
-			 * We simply ignore them */
+			 * We simply ignore them
+			 */
 
 			if (zr->v4l_memgrab_active) {
 				/* A lot more checks should be here ... */
@@ -1419,20 +1339,20 @@ zoran_irq (int             irq,
 					reg |= ZR36057_VSSFGR_FrameGrab;
 					btwrite(reg, ZR36057_VSSFGR);
 
-					btor(ZR36057_VDCR_VidEn,
-					     ZR36057_VDCR);
+					btor(ZR36057_VDCR_VidEn, ZR36057_VDCR);
 				}
 			}
 
-			/* even if we don't grab, we do want to increment
-			 * the sequence counter to see lost frames */
+			/*
+			 * even if we don't grab, we do want to increment
+			 * the sequence counter to see lost frames
+			 */
 			zr->v4l_grab_seq++;
 		}
 #if (IRQ_MASK & ZR36057_ISR_CodRepIRQ)
 		if (astat & ZR36057_ISR_CodRepIRQ) {
 			zr->intr_counter_CodRepIRQ++;
-			IDEBUG(printk(KERN_DEBUG "%s: ZR36057_ISR_CodRepIRQ\n",
-				ZR_DEVNAME(zr)));
+			IDEBUG(printk(KERN_DEBUG "%s: ZR36057_ISR_CodRepIRQ\n", ZR_DEVNAME(zr)));
 			btand(~ZR36057_ICR_CodRepIRQ, ZR36057_ICR);
 		}
 #endif				/* (IRQ_MASK & ZR36057_ISR_CodRepIRQ) */
@@ -1445,23 +1365,16 @@ zoran_irq (int             irq,
 				char sv[BUZ_NUM_STAT_COM + 1];
 				int i;
 
-				printk(KERN_INFO
-				       "%s: first frame ready: state=0x%08x odd_even=%d field_per_buff=%d delay=%d\n",
-				       ZR_DEVNAME(zr), stat,
-				       zr->jpg_settings.odd_even,
-				       zr->jpg_settings.field_per_buff,
-				       zr->JPEG_missed);
+				pr_info("%s: first frame ready: state=0x%08x odd_even=%d field_per_buff=%d delay=%d\n",
+					ZR_DEVNAME(zr), stat, zr->jpg_settings.odd_even,
+				       zr->jpg_settings.field_per_buff, zr->JPEG_missed);
 
 				for (i = 0; i < BUZ_NUM_STAT_COM; i++)
 					sv[i] = le32_to_cpu(zr->stat_com[i]) & 1 ? '1' : '0';
 				sv[BUZ_NUM_STAT_COM] = 0;
-				printk(KERN_INFO
-				       "%s: stat_com=%s queue_state=%ld/%ld/%ld/%ld\n",
-				       ZR_DEVNAME(zr), sv,
-				       zr->jpg_que_tail,
-				       zr->jpg_dma_tail,
-				       zr->jpg_dma_head,
-				       zr->jpg_que_head);
+				pr_info("%s: stat_com=%s queue_state=%ld/%ld/%ld/%ld\n",
+					ZR_DEVNAME(zr), sv, zr->jpg_que_tail, zr->jpg_dma_tail,
+				       zr->jpg_dma_head, zr->jpg_que_head);
 			} else {
 				/* Get statistics */
 				if (zr->JPEG_missed > zr->JPEG_max_missed)
@@ -1473,12 +1386,9 @@ zoran_irq (int             irq,
 			if (zr36067_debug > 2 && zr->frame_num < 6) {
 				int i;
 
-				printk(KERN_INFO "%s: seq=%ld stat_com:",
-				       ZR_DEVNAME(zr), zr->jpg_seq_num);
-				for (i = 0; i < 4; i++) {
-					printk(KERN_CONT " %08x",
-					       le32_to_cpu(zr->stat_com[i]));
-				}
+				pr_info("%s: seq=%ld stat_com:", ZR_DEVNAME(zr), zr->jpg_seq_num);
+				for (i = 0; i < 4; i++)
+					printk(KERN_CONT " %08x", le32_to_cpu(zr->stat_com[i]));
 				printk(KERN_CONT "\n");
 			}
 			zr->frame_num++;
@@ -1519,9 +1429,7 @@ zoran_irq (int             irq,
 	return IRQ_HANDLED;
 }
 
-void
-zoran_set_pci_master (struct zoran *zr,
-		      int           set_master)
+void zoran_set_pci_master(struct zoran *zr, int set_master)
 {
 	if (set_master) {
 		pci_set_master(zr->pci_dev);
@@ -1534,21 +1442,19 @@ zoran_set_pci_master (struct zoran *zr,
 	}
 }
 
-void
-zoran_init_hardware (struct zoran *zr)
+void zoran_init_hardware(struct zoran *zr)
 {
 	/* Enable bus-mastering */
 	zoran_set_pci_master(zr, 1);
 
 	/* Initialize the board */
-	if (zr->card.init) {
+	if (zr->card.init)
 		zr->card.init(zr);
-	}
 
 	decoder_call(zr, core, init, 0);
 	decoder_call(zr, video, s_std, zr->norm);
 	decoder_call(zr, video, s_routing,
-		zr->card.input[zr->input].muxsel, 0, 0);
+		     zr->card.input[zr->input].muxsel, 0, 0);
 
 	encoder_call(zr, core, init, 0);
 	encoder_call(zr, video, s_std_output, zr->norm);
@@ -1569,8 +1475,7 @@ zoran_init_hardware (struct zoran *zr)
 	btwrite(IRQ_MASK, ZR36057_ISR);	// Clears interrupts
 }
 
-void
-zr36057_restart (struct zoran *zr)
+void zr36057_restart(struct zoran *zr)
 {
 	btwrite(0, ZR36057_SPGPPCR);
 	mdelay(1);
@@ -1590,8 +1495,7 @@ zr36057_restart (struct zoran *zr)
  * initialize video front end
  */
 
-static void
-zr36057_init_vfe (struct zoran *zr)
+static void zr36057_init_vfe(struct zoran *zr)
 {
 	u32 reg;
 
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index 816d48b09be9..24be19a61b6d 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Zoran zr36057/zr36067 PCI controller driver, for the
  * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
@@ -6,50 +7,28 @@
  * This part handles card-specific data and detection
  *
  * Copyright (C) 2000 Serguei Miridonov <mirsev@cicese.mx>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef __ZORAN_DEVICE_H__
 #define __ZORAN_DEVICE_H__
 
 /* general purpose I/O */
-extern void GPIO(struct zoran *zr,
-		 int bit,
-		 unsigned int value);
+extern void GPIO(struct zoran *zr, int bit, unsigned int value);
 
 /* codec (or actually: guest bus) access */
 extern int post_office_wait(struct zoran *zr);
-extern int post_office_write(struct zoran *zr,
-			     unsigned guest,
-			     unsigned reg,
-			     unsigned value);
-extern int post_office_read(struct zoran *zr,
-			    unsigned guest,
-			    unsigned reg);
+extern int post_office_write(struct zoran *zr, unsigned int guest, unsigned int reg, unsigned int value);
+extern int post_office_read(struct zoran *zr, unsigned int guest, unsigned int reg);
 
 extern void detect_guest_activity(struct zoran *zr);
 
-extern void jpeg_codec_sleep(struct zoran *zr,
-			     int sleep);
+extern void jpeg_codec_sleep(struct zoran *zr, int sleep);
 extern int jpeg_codec_reset(struct zoran *zr);
 
 /* zr360x7 access to raw capture */
-extern void zr36057_overlay(struct zoran *zr,
-			    int on);
-extern void write_overlay_mask(struct zoran_fh *fh,
-			       struct v4l2_clip *vp,
-			       int count);
-extern void zr36057_set_memgrab(struct zoran *zr,
-				int mode);
+extern void zr36057_overlay(struct zoran *zr, int on);
+extern void write_overlay_mask(struct zoran_fh *fh, struct v4l2_clip *vp, int count);
+extern void zr36057_set_memgrab(struct zoran *zr, int mode);
 extern int wait_grab_pending(struct zoran *zr);
 
 /* interrupts */
@@ -64,8 +43,7 @@ extern void zr36057_enable_jpg(struct zoran *zr,
 extern void zoran_feed_stat_com(struct zoran *zr);
 
 /* general */
-extern void zoran_set_pci_master(struct zoran *zr,
-				 int set_master);
+extern void zoran_set_pci_master(struct zoran *zr, int set_master);
 extern void zoran_init_hardware(struct zoran *zr);
 extern void zr36057_restart(struct zoran *zr);
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index c998aa4dc73b..fd4795468069 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran zr36057/zr36067 PCI controller driver, for the
  * Pinnacle/Miro DC10/DC10+/DC30/DC30+, Iomega Buz, Linux
@@ -27,17 +28,6 @@
  * bttv - Bt848 frame grabber driver
  * Copyright (C) 1996,97,98 Ralph  Metzler (rjkm@thp.uni-koeln.de)
  *                        & Marcus Metzler (mocm@thp.uni-koeln.de)
- *
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/init.h>
@@ -61,7 +51,7 @@
 #include "videocodec.h"
 
 #include <asm/byteorder.h>
-#include <asm/io.h>
+#include <linux/io.h>
 #include <linux/uaccess.h>
 #include <linux/proc_fs.h>
 
@@ -70,7 +60,6 @@
 #include "zoran_device.h"
 #include "zoran_card.h"
 
-
 const struct zoran_format zoran_formats[] = {
 	{
 		.name = "15-bit RGB LE",
@@ -79,7 +68,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 15,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB555|ZR36057_VFESPFR_ErrDif|
+		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ErrDif |
 			   ZR36057_VFESPFR_LittleEndian,
 	}, {
 		.name = "15-bit RGB BE",
@@ -88,7 +77,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 15,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB555|ZR36057_VFESPFR_ErrDif,
+		.vfespfr = ZR36057_VFESPFR_RGB555 | ZR36057_VFESPFR_ErrDif,
 	}, {
 		.name = "16-bit RGB LE",
 		.fourcc = V4L2_PIX_FMT_RGB565,
@@ -96,7 +85,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB565|ZR36057_VFESPFR_ErrDif|
+		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ErrDif |
 			   ZR36057_VFESPFR_LittleEndian,
 	}, {
 		.name = "16-bit RGB BE",
@@ -105,7 +94,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB565|ZR36057_VFESPFR_ErrDif,
+		.vfespfr = ZR36057_VFESPFR_RGB565 | ZR36057_VFESPFR_ErrDif,
 	}, {
 		.name = "24-bit RGB",
 		.fourcc = V4L2_PIX_FMT_BGR24,
@@ -113,7 +102,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 24,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB888|ZR36057_VFESPFR_Pack24,
+		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_Pack24,
 	}, {
 		.name = "32-bit RGB LE",
 		.fourcc = V4L2_PIX_FMT_BGR32,
@@ -121,7 +110,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 32,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_RGB888|ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_RGB888 | ZR36057_VFESPFR_LittleEndian,
 	}, {
 		.name = "32-bit RGB BE",
 		.fourcc = V4L2_PIX_FMT_RGB32,
@@ -145,7 +134,7 @@ const struct zoran_format zoran_formats[] = {
 		.depth = 16,
 		.flags = ZORAN_FORMAT_CAPTURE |
 			 ZORAN_FORMAT_OVERLAY,
-		.vfespfr = ZR36057_VFESPFR_YUV422|ZR36057_VFESPFR_LittleEndian,
+		.vfespfr = ZR36057_VFESPFR_YUV422 | ZR36057_VFESPFR_LittleEndian,
 	}, {
 		.name = "Hardware-encoded Motion-JPEG",
 		.fourcc = V4L2_PIX_FMT_MJPEG,
@@ -156,13 +145,15 @@ const struct zoran_format zoran_formats[] = {
 			 ZORAN_FORMAT_COMPRESSED,
 	}
 };
+
 #define NUM_FORMATS ARRAY_SIZE(zoran_formats)
 
-	/* small helper function for calculating buffersizes for v4l2
+	/*
+	 * small helper function for calculating buffersizes for v4l2
 	 * we calculate the nearest higher power-of-two, which
-	 * will be the recommended buffersize */
-static __u32
-zoran_v4l2_calc_bufsize (struct zoran_jpg_settings *settings)
+	 * will be the recommended buffersize
+	 */
+static __u32 zoran_v4l2_calc_bufsize(struct zoran_jpg_settings *settings)
 {
 	__u8 div = settings->VerDcm * settings->HorDcm * settings->TmpDcm;
 	__u32 num = (1024 * 512) / (div);
@@ -192,12 +183,14 @@ static void map_mode_raw(struct zoran_fh *fh)
 	fh->buffers.buffer_size = v4l_bufsize;
 	fh->buffers.num_buffers = v4l_nbufs;
 }
+
 static void map_mode_jpg(struct zoran_fh *fh, int play)
 {
 	fh->map_mode = play ? ZORAN_MAP_MODE_JPG_PLAY : ZORAN_MAP_MODE_JPG_REC;
 	fh->buffers.buffer_size = jpg_bufsize;
 	fh->buffers.num_buffers = jpg_nbufs;
 }
+
 static inline const char *mode_name(enum zoran_map_mode mode)
 {
 	return mode == ZORAN_MAP_MODE_RAW ? "V4L" : "JPG";
@@ -223,8 +216,7 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 				ZR_DEVNAME(zr), __func__, i);
 
 		//udelay(20);
-		mem = kmalloc(fh->buffers.buffer_size,
-			      GFP_KERNEL | __GFP_NOWARN);
+		mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL | __GFP_NOWARN);
 		if (!mem) {
 			dprintk(1,
 				KERN_ERR
@@ -332,7 +324,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 
 		if (fh->buffers.need_contiguous) {
 			mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL);
-			if (mem == NULL) {
+			if (!mem) {
 				dprintk(1,
 					KERN_ERR
 					"%s: %s - kmalloc failed for buffer %d\n",
@@ -350,7 +342,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 			/* jpg_bufsize is already page aligned */
 			for (j = 0; j < fh->buffers.buffer_size / PAGE_SIZE; j++) {
 				mem = (void *)get_zeroed_page(GFP_KERNEL);
-				if (mem == NULL) {
+				if (!mem) {
 					dprintk(1,
 						KERN_ERR
 						"%s: %s - get_zeroed_page failed for buffer %d\n",
@@ -431,11 +423,8 @@ static void jpg_fbuffer_free(struct zoran_fh *fh)
  *   V4L Buffer grabbing
  */
 
-static int
-zoran_v4l_set_format (struct zoran_fh           *fh,
-		      int                        width,
-		      int                        height,
-		      const struct zoran_format *format)
+static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
+				const struct zoran_format *format)
 {
 	struct zoran *zr = fh->zr;
 	int bpp;
@@ -534,7 +523,7 @@ static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
 				KERN_WARNING
 				"%s: %s - queueing buffer %d in state DONE!?\n",
 				ZR_DEVNAME(zr), __func__, num);
-			/* fall through */
+			/* fallthrough */
 		case BUZ_STATE_USER:
 			/* since there is at least one unused buffer there's room for at least
 			 * one more pend[] entry */
@@ -593,7 +582,7 @@ static int v4l_sync(struct zoran_fh *fh, int frame)
 	mutex_unlock(&zr->lock);
 	/* wait on this buffer to get ready */
 	if (!wait_event_interruptible_timeout(zr->v4l_capq,
-		(zr->v4l_buffers.buffer[frame].state != BUZ_STATE_PEND), 10*HZ)) {
+		(zr->v4l_buffers.buffer[frame].state != BUZ_STATE_PEND), 10 * HZ)) {
 		mutex_lock(&zr->lock);
 		return -ETIME;
 	}
@@ -629,7 +618,6 @@ static int v4l_sync(struct zoran_fh *fh, int frame)
 /*
  *   Queue a MJPEG buffer for capture/playback
  */
-
 static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 				 enum zoran_codec_mode mode)
 {
@@ -694,7 +682,7 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 				KERN_WARNING
 				"%s: %s - queuing frame in BUZ_STATE_DONE state!?\n",
 				ZR_DEVNAME(zr), __func__);
-			/* fall through */
+			/* fallthrough */
 		case BUZ_STATE_USER:
 			/* since there is at least one unused buffer there's room for at
 			 *least one more pend[] entry */
@@ -751,10 +739,11 @@ static int jpg_qbuf(struct zoran_fh *fh, int frame, enum zoran_codec_mode mode)
 		}
 	}
 
-	if ((res = zoran_jpg_queue_frame(fh, frame, mode)))
+	res = zoran_jpg_queue_frame(fh, frame, mode);
+	if (res)
 		return res;
 
-	/* Start the jpeg codec when the first frame is queued  */
+	/* Start the jpeg codec when the first frame is queued */
 	if (!res && zr->jpg_que_head == 1)
 		jpeg_start(zr);
 
@@ -788,15 +777,14 @@ static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
 	}
 	mutex_unlock(&zr->lock);
 	if (!wait_event_interruptible_timeout(zr->jpg_capq,
-			(zr->jpg_que_tail != zr->jpg_dma_tail ||
+					      (zr->jpg_que_tail != zr->jpg_dma_tail ||
 			 zr->jpg_dma_tail == zr->jpg_dma_head),
-			10*HZ)) {
+			10 * HZ)) {
 		int isr;
 
 		btand(~ZR36057_JMC_Go_en, ZR36057_JMC);
 		udelay(1);
-		zr->codec->control(zr->codec, CODEC_G_STATUS,
-					   sizeof(isr), &isr);
+		zr->codec->control(zr->codec, CODEC_G_STATUS, sizeof(isr), &isr);
 		mutex_lock(&zr->lock);
 		dprintk(1,
 			KERN_ERR
@@ -804,7 +792,6 @@ static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
 			ZR_DEVNAME(zr), __func__, isr);
 
 		return -ETIME;
-
 	}
 	mutex_lock(&zr->lock);
 	if (signal_pending(current))
@@ -907,7 +894,6 @@ static void zoran_close_end_session(struct zoran_fh *fh)
 /*
  *   Open a zoran card. Right now the flags stuff is just playing
  */
-
 static int zoran_open(struct file *file)
 {
 	struct zoran *zr = video_drvdata(file);
@@ -927,7 +913,7 @@ static int zoran_open(struct file *file)
 	}
 
 	/* now, create the open()-specific file_ops struct */
-	fh = kzalloc(sizeof(struct zoran_fh), GFP_KERNEL);
+	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 	if (!fh) {
 		dprintk(1,
 			KERN_ERR
@@ -938,10 +924,11 @@ static int zoran_open(struct file *file)
 	}
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 
-	/* used to be BUZ_MAX_WIDTH/HEIGHT, but that gives overflows
-	 * on norm-change! */
-	fh->overlay_mask =
-	    kmalloc(array3_size((768 + 31) / 32, 576, 4), GFP_KERNEL);
+	/*
+	 * used to be BUZ_MAX_WIDTH/HEIGHT, but that gives overflows
+	 * on norm-change!
+	 */
+	fh->overlay_mask = kmalloc(array3_size((768 + 31) / 32, 576, 4), GFP_KERNEL);
 	if (!fh->overlay_mask) {
 		dprintk(1,
 			KERN_ERR
@@ -984,8 +971,7 @@ static int zoran_open(struct file *file)
 	return res;
 }
 
-static int
-zoran_close(struct file  *file)
+static int zoran_close(struct file *file)
 {
 	struct zoran_fh *fh = file->private_data;
 	struct zoran *zr = fh->zr;
@@ -1041,12 +1027,8 @@ zoran_close(struct file  *file)
 	return 0;
 }
 
-static int setup_fbuffer(struct zoran_fh *fh,
-	       void                      *base,
-	       const struct zoran_format *fmt,
-	       int                        width,
-	       int                        height,
-	       int                        bytesperline)
+static int setup_fbuffer(struct zoran_fh *fh, void *base, const struct zoran_format *fmt,
+			 int width, int height, int bytesperline)
 {
 	struct zoran *zr = fh->zr;
 
@@ -1054,9 +1036,11 @@ static int setup_fbuffer(struct zoran_fh *fh,
 	if (!capable(CAP_SYS_ADMIN) && !capable(CAP_SYS_RAWIO))
 		return -EPERM;
 
-	/* Don't allow frame buffer overlay if PCI or AGP is buggy, or on
+	/*
+	 * Don't allow frame buffer overlay if PCI or AGP is buggy, or on
 	   ALi Magik (that needs very low latency while the card needs a
-	   higher value always) */
+	   higher value always)
+	 */
 
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
 		return -ENXIO;
@@ -1103,7 +1087,7 @@ static int setup_fbuffer(struct zoran_fh *fh,
 		return -EINVAL;
 	}
 
-	zr->vbuf_base = (void *) ((unsigned long) base & ~3);
+	zr->vbuf_base = (void *)((unsigned long)base & ~3);
 	zr->vbuf_height = height;
 	zr->vbuf_width = width;
 	zr->vbuf_depth = fmt->depth;
@@ -1116,21 +1100,13 @@ static int setup_fbuffer(struct zoran_fh *fh,
 	return 0;
 }
 
-
-static int setup_window(struct zoran_fh *fh,
-			int x,
-			int y,
-			int width,
-			int height,
-			struct v4l2_clip __user *clips,
-			unsigned int clipcount,
-			void __user *bitmap)
+static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height,
+			struct v4l2_clip __user *clips, unsigned int clipcount, void __user *bitmap)
 {
 	struct zoran *zr = fh->zr;
 	struct v4l2_clip *vcp = NULL;
 	int on, end;
 
-
 	if (!zr->vbuf_base) {
 		dprintk(1,
 			KERN_ERR
@@ -1222,7 +1198,7 @@ static int setup_window(struct zoran_fh *fh,
 		/* write our own bitmap from the clips */
 		vcp = vmalloc(array_size(sizeof(struct v4l2_clip),
 					 clipcount + 4));
-		if (vcp == NULL) {
+		if (!vcp) {
 			dprintk(1,
 				KERN_ERR
 				"%s: %s - Alloc of clip mask failed\n",
@@ -1280,8 +1256,10 @@ static int setup_overlay(struct zoran_fh *fh, int on)
 	if (on == 0) {
 		zr->overlay_active = fh->overlay_active = ZORAN_FREE;
 		zr->v4l_overlay_active = 0;
-		/* When a grab is running, the video simply
-		 * won't be switched on any more */
+		/*
+		 * When a grab is running, the video simply
+		 * won't be switched on any more
+		 */
 		if (!zr->v4l_memgrab_active)
 			zr36057_overlay(zr, 0);
 		zr->overlay_mask = NULL;
@@ -1306,8 +1284,10 @@ static int setup_overlay(struct zoran_fh *fh, int on)
 		zr->overlay_settings = fh->overlay_settings;
 		if (!zr->v4l_memgrab_active)
 			zr36057_overlay(zr, 1);
-		/* When a grab is running, the video will be
-		 * switched on when grab is finished */
+		/*
+		 * When a grab is running, the video will be
+		 * switched on when grab is finished
+		 */
 	}
 
 	/* Make sure the changes come into effect */
@@ -1421,9 +1401,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 	return 0;
 }
 
-static int
-zoran_set_norm (struct zoran *zr,
-		v4l2_std_id norm)
+static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 {
 	int on;
 
@@ -1450,8 +1428,10 @@ zoran_set_norm (struct zoran *zr,
 	else
 		zr->timing = zr->card.tvn[0];
 
-	/* We switch overlay off and on since a change in the
-	 * norm needs different VFE settings */
+	/*
+	 * We switch overlay off and on since a change in the
+	 * norm needs different VFE settings
+	 */
 	on = zr->overlay_active && !zr->v4l_memgrab_active;
 	if (on)
 		zr36057_overlay(zr, 0);
@@ -1468,13 +1448,10 @@ zoran_set_norm (struct zoran *zr,
 	return 0;
 }
 
-static int
-zoran_set_input (struct zoran *zr,
-		 int           input)
+static int zoran_set_input(struct zoran *zr, int input)
 {
-	if (input == zr->input) {
+	if (input == zr->input)
 		return 0;
-	}
 
 	if (zr->v4l_buffers.active != ZORAN_FREE ||
 	    zr->jpg_buffers.active != ZORAN_FREE) {
@@ -1495,8 +1472,7 @@ zoran_set_input (struct zoran *zr,
 
 	zr->input = input;
 
-	decoder_call(zr, video, s_routing,
-			zr->card.input[input].muxsel, 0, 0);
+	decoder_call(zr, video, s_routing, zr->card.input[input].muxsel, 0, 0);
 
 	return 0;
 }
@@ -1512,8 +1488,7 @@ static int zoran_querycap(struct file *file, void *__fh, struct v4l2_capability
 
 	strscpy(cap->card, ZR_DEVNAME(zr), sizeof(cap->card));
 	strscpy(cap->driver, "zoran", sizeof(cap->driver));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
-		 pci_name(zr->pci_dev));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s", pci_name(zr->pci_dev));
 	cap->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_CAPTURE |
 			   V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_VIDEO_OVERLAY;
 	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
@@ -1539,7 +1514,7 @@ static int zoran_enum_fmt(struct zoran *zr, struct v4l2_fmtdesc *fmt, int flag)
 }
 
 static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
-					    struct v4l2_fmtdesc *f)
+				  struct v4l2_fmtdesc *f)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1548,7 +1523,7 @@ static int zoran_enum_fmt_vid_cap(struct file *file, void *__fh,
 }
 
 static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
-					    struct v4l2_fmtdesc *f)
+				  struct v4l2_fmtdesc *f)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1557,7 +1532,7 @@ static int zoran_enum_fmt_vid_out(struct file *file, void *__fh,
 }
 
 static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
-					    struct v4l2_fmtdesc *f)
+				      struct v4l2_fmtdesc *f)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1566,7 +1541,7 @@ static int zoran_enum_fmt_vid_overlay(struct file *file, void *__fh,
 }
 
 static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+			       struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 
@@ -1588,7 +1563,7 @@ static int zoran_g_fmt_vid_out(struct file *file, void *__fh,
 }
 
 static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+			       struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1611,7 +1586,7 @@ static int zoran_g_fmt_vid_cap(struct file *file, void *__fh,
 }
 
 static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+				   struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1629,7 +1604,7 @@ static int zoran_g_fmt_vid_overlay(struct file *file, void *__fh,
 }
 
 static int zoran_try_fmt_vid_overlay(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+				     struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1647,7 +1622,7 @@ static int zoran_try_fmt_vid_overlay(struct file *file, void *__fh,
 }
 
 static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+				 struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1711,7 +1686,7 @@ static int zoran_try_fmt_vid_out(struct file *file, void *__fh,
 }
 
 static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+				 struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1729,20 +1704,19 @@ static int zoran_try_fmt_vid_cap(struct file *file, void *__fh,
 		return -EINVAL;
 
 	bpp = DIV_ROUND_UP(zoran_formats[i].depth, 8);
-	v4l_bound_align_image(
-		&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH, bpp == 2 ? 1 : 2,
+	v4l_bound_align_image(&fmt->fmt.pix.width, BUZ_MIN_WIDTH, BUZ_MAX_WIDTH, bpp == 2 ? 1 : 2,
 		&fmt->fmt.pix.height, BUZ_MIN_HEIGHT, BUZ_MAX_HEIGHT, 0, 0);
 	return 0;
 }
 
 static int zoran_s_fmt_vid_overlay(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+				   struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	int res;
 
 	dprintk(3, "x=%d, y=%d, w=%d, h=%d, cnt=%d, map=0x%p\n",
-			fmt->fmt.win.w.left, fmt->fmt.win.w.top,
+		fmt->fmt.win.w.left, fmt->fmt.win.w.top,
 			fmt->fmt.win.w.width,
 			fmt->fmt.win.w.height,
 			fmt->fmt.win.clipcount,
@@ -1755,7 +1729,7 @@ static int zoran_s_fmt_vid_overlay(struct file *file, void *__fh,
 }
 
 static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+			       struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1764,9 +1738,9 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 	int res = 0;
 
 	dprintk(3, "size=%dx%d, fmt=0x%x (%4.4s)\n",
-			fmt->fmt.pix.width, fmt->fmt.pix.height,
+		fmt->fmt.pix.width, fmt->fmt.pix.height,
 			fmt->fmt.pix.pixelformat,
-			(char *) &printformat);
+			(char *)&printformat);
 	if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_MJPEG)
 		return -EINVAL;
 
@@ -1836,7 +1810,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh,
 }
 
 static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
-					struct v4l2_format *fmt)
+			       struct v4l2_format *fmt)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1858,7 +1832,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 	if ((fh->map_mode != ZORAN_MAP_MODE_RAW && fh->buffers.allocated) ||
 	    fh->buffers.active != ZORAN_FREE) {
 		dprintk(1, KERN_ERR "%s: VIDIOC_S_FMT - cannot change capture mode\n",
-				ZR_DEVNAME(zr));
+			ZR_DEVNAME(zr));
 		res = -EBUSY;
 		return res;
 	}
@@ -1886,7 +1860,7 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh,
 }
 
 static int zoran_g_fbuf(struct file *file, void *__fh,
-		struct v4l2_framebuffer *fb)
+			struct v4l2_framebuffer *fb)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1906,7 +1880,7 @@ static int zoran_g_fbuf(struct file *file, void *__fh,
 }
 
 static int zoran_s_fbuf(struct file *file, void *__fh,
-		const struct v4l2_framebuffer *fb)
+			const struct v4l2_framebuffer *fb)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -1932,11 +1906,8 @@ static int zoran_s_fbuf(struct file *file, void *__fh,
 static int zoran_overlay(struct file *file, void *__fh, unsigned int on)
 {
 	struct zoran_fh *fh = __fh;
-	int res;
 
-	res = setup_overlay(fh, on);
-
-	return res;
+	return setup_overlay(fh, on);
 }
 
 static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type type);
@@ -1949,7 +1920,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 
 	if (req->memory != V4L2_MEMORY_MMAP) {
 		dprintk(2,
-				KERN_ERR
+			KERN_ERR
 				"%s: only MEMORY_MMAP capture is supported, not %d\n",
 				ZR_DEVNAME(zr), req->memory);
 		return -EINVAL;
@@ -1960,7 +1931,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 
 	if (fh->buffers.allocated) {
 		dprintk(2,
-				KERN_ERR
+			KERN_ERR
 				"%s: VIDIOC_REQBUFS - buffers already allocated\n",
 				ZR_DEVNAME(zr));
 		res = -EBUSY;
@@ -2002,7 +1973,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 		}
 	} else {
 		dprintk(1,
-				KERN_ERR
+			KERN_ERR
 				"%s: VIDIOC_REQBUFS - unknown type %d\n",
 				ZR_DEVNAME(zr), req->type);
 		res = -EINVAL;
@@ -2014,11 +1985,8 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 static int zoran_querybuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 {
 	struct zoran_fh *fh = __fh;
-	int res;
 
-	res = zoran_v4l2_buffer_status(fh, buf, buf->index);
-
-	return res;
+	return zoran_v4l2_buffer_status(fh, buf, buf->index);
 }
 
 static int zoran_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
@@ -2189,7 +2157,7 @@ static int zoran_streamon(struct file *file, void *__fh, enum v4l2_buf_type type
 		zr->jpg_buffers.active = fh->buffers.active = ZORAN_LOCKED;
 
 		if (zr->jpg_que_head != zr->jpg_que_tail) {
-			/* Start the jpeg codec when the first frame is queued  */
+			/* Start the jpeg codec when the first frame is queued */
 			jpeg_start(zr);
 		}
 		break;
@@ -2224,10 +2192,8 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 
 		spin_lock_irqsave(&zr->spinlock, flags);
 		/* unload capture */
-		if (zr->v4l_memgrab_active) {
-
+		if (zr->v4l_memgrab_active)
 			zr36057_set_memgrab(zr, 0);
-		}
 
 		for (i = 0; i < fh->buffers.num_buffers; i++)
 			zr->v4l_buffers.buffer[i].state = BUZ_STATE_USER;
@@ -2254,7 +2220,7 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 			return res;
 
 		res = jpg_qbuf(fh, -1,
-			     (fh->map_mode == ZORAN_MAP_MODE_JPG_REC) ?
+			       (fh->map_mode == ZORAN_MAP_MODE_JPG_REC) ?
 			     BUZ_MODE_MOTION_COMPRESS :
 			     BUZ_MODE_MOTION_DECOMPRESS);
 		if (res)
@@ -2269,6 +2235,7 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 	}
 	return res;
 }
+
 static int zoran_g_std(struct file *file, void *__fh, v4l2_std_id *std)
 {
 	struct zoran_fh *fh = __fh;
@@ -2293,7 +2260,7 @@ static int zoran_s_std(struct file *file, void *__fh, v4l2_std_id std)
 }
 
 static int zoran_enum_input(struct file *file, void *__fh,
-				 struct v4l2_input *inp)
+			    struct v4l2_input *inp)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -2301,8 +2268,7 @@ static int zoran_enum_input(struct file *file, void *__fh,
 	if (inp->index >= zr->card.inputs)
 		return -EINVAL;
 
-	strscpy(inp->name, zr->card.input[inp->index].name,
-		sizeof(inp->name));
+	strscpy(inp->name, zr->card.input[inp->index].name, sizeof(inp->name));
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	inp->std = V4L2_STD_ALL;
 
@@ -2337,7 +2303,7 @@ static int zoran_s_input(struct file *file, void *__fh, unsigned int input)
 }
 
 static int zoran_enum_output(struct file *file, void *__fh,
-				  struct v4l2_output *outp)
+			     struct v4l2_output *outp)
 {
 	if (outp->index != 0)
 		return -EINVAL;
@@ -2451,9 +2417,10 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 }
 
 static int zoran_g_jpegcomp(struct file *file, void *__fh,
-					struct v4l2_jpegcompression *params)
+			    struct v4l2_jpegcompression *params)
 {
 	struct zoran_fh *fh = __fh;
+
 	memset(params, 0, sizeof(*params));
 
 	params->quality = fh->jpg_settings.jpg_comp.quality;
@@ -2473,7 +2440,7 @@ static int zoran_g_jpegcomp(struct file *file, void *__fh,
 }
 
 static int zoran_s_jpegcomp(struct file *file, void *__fh,
-					const struct v4l2_jpegcompression *params)
+			    const struct v4l2_jpegcompression *params)
 {
 	struct zoran_fh *fh = __fh;
 	struct zoran *zr = fh->zr;
@@ -2502,9 +2469,7 @@ static int zoran_s_jpegcomp(struct file *file, void *__fh,
 	return res;
 }
 
-static __poll_t
-zoran_poll (struct file *file,
-	    poll_table  *wait)
+static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 {
 	struct zoran_fh *fh = file->private_data;
 	struct zoran *zr = fh->zr;
@@ -2577,7 +2542,6 @@ zoran_poll (struct file *file,
 	return res;
 }
 
-
 /*
  * This maps the buffers to user space.
  *
@@ -2590,15 +2554,14 @@ zoran_poll (struct file *file,
  * the buffer accordingly (zoran_vm_close())
  */
 
-static void
-zoran_vm_open (struct vm_area_struct *vma)
+static void zoran_vm_open(struct vm_area_struct *vma)
 {
 	struct zoran_mapping *map = vma->vm_private_data;
+
 	atomic_inc(&map->count);
 }
 
-static void
-zoran_vm_close (struct vm_area_struct *vma)
+static void zoran_vm_close(struct vm_area_struct *vma)
 {
 	struct zoran_mapping *map = vma->vm_private_data;
 	struct zoran_fh *fh = map->fh;
@@ -2616,9 +2579,8 @@ zoran_vm_close (struct vm_area_struct *vma)
 
 	/* Any buffers still mapped? */
 	for (i = 0; i < fh->buffers.num_buffers; i++) {
-		if (fh->buffers.buffer[i].map) {
+		if (fh->buffers.buffer[i].map)
 			return;
-		}
 	}
 
 	dprintk(3, KERN_INFO "%s: %s - free %s buffers\n", ZR_DEVNAME(zr),
@@ -2650,9 +2612,7 @@ static const struct vm_operations_struct zoran_vm_ops = {
 	.close = zoran_vm_close,
 };
 
-static int
-zoran_mmap (struct file           *file,
-	    struct vm_area_struct *vma)
+static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	struct zoran_fh *fh = file->private_data;
 	struct zoran *zr = fh->zr;
@@ -2716,7 +2676,7 @@ zoran_mmap (struct file           *file,
 	}
 
 	/* map these buffers */
-	map = kmalloc(sizeof(struct zoran_mapping), GFP_KERNEL);
+	map = kmalloc(sizeof(*map), GFP_KERNEL);
 	if (!map) {
 		res = -ENOMEM;
 		return res;
@@ -2735,7 +2695,7 @@ zoran_mmap (struct file           *file,
 				todo = fh->buffers.buffer_size;
 			page = fh->buffers.buffer[i].v4l.fbuffer_phys;
 			if (remap_pfn_range(vma, start, page >> PAGE_SHIFT,
-							todo, PAGE_SHARED)) {
+					    todo, PAGE_SHARED)) {
 				dprintk(1,
 					KERN_ERR
 					"%s: %s(V4L) - remap_pfn_range failed\n",
@@ -2767,7 +2727,7 @@ zoran_mmap (struct file           *file,
 				page = virt_to_phys(bus_to_virt(pos))
 								>> PAGE_SHIFT;
 				if (remap_pfn_range(vma, start, page,
-							todo, PAGE_SHARED)) {
+						    todo, PAGE_SHARED)) {
 					dprintk(1,
 						KERN_ERR
 						"%s: %s(V4L) - remap_pfn_range failed\n",
@@ -2786,7 +2746,6 @@ zoran_mmap (struct file           *file,
 			fh->buffers.buffer[i].map = map;
 			if (size == 0)
 				break;
-
 		}
 	}
 	return res;
diff --git a/drivers/staging/media/zoran/zoran_procfs.c b/drivers/staging/media/zoran/zoran_procfs.c
index 78ac8f853748..13367e6f6620 100644
--- a/drivers/staging/media/zoran/zoran_procfs.c
+++ b/drivers/staging/media/zoran/zoran_procfs.c
@@ -83,14 +83,11 @@ static const struct procfs_params_zr36067 zr67[] = {
 	{NULL, 0, 0, 0},
 };
 
-static void
-setparam (struct zoran *zr,
-	  char         *name,
-	  char         *sval)
+static void setparam(struct zoran *zr, char *name, char *sval)
 {
 	int i = 0, reg0, reg, val;
 
-	while (zr67[i].name != NULL) {
+	while (zr67[i].name) {
 		if (!strncmp(name, zr67[i].name, strlen(zr67[i].name))) {
 			reg = reg0 = btread(zr67[i].reg);
 			reg &= ~(zr67[i].mask << zr67[i].bit);
@@ -119,19 +116,20 @@ static int zoran_show(struct seq_file *p, void *v)
 
 	seq_printf(p, "ZR36067 registers:\n");
 	for (i = 0; i < 0x130; i += 16)
-		seq_printf(p, "%03X %08X  %08X  %08X  %08X \n", i,
-			   btread(i), btread(i+4), btread(i+8), btread(i+12));
+		seq_printf(p, "%03X %08X  %08X  %08X  %08X\n", i,
+			   btread(i), btread(i + 4), btread(i + 8), btread(i + 12));
 	return 0;
 }
 
 static int zoran_open(struct inode *inode, struct file *file)
 {
 	struct zoran *data = PDE_DATA(inode);
+
 	return single_open(file, zoran_show, data);
 }
 
 static ssize_t zoran_write(struct file *file, const char __user *buffer,
-			size_t count, loff_t *ppos)
+			   size_t count, loff_t *ppos)
 {
 	struct zoran *zr = PDE_DATA(file_inode(file));
 	char *string, *sp;
@@ -142,14 +140,10 @@ static ssize_t zoran_write(struct file *file, const char __user *buffer,
 
 	string = sp = vmalloc(count + 1);
 	if (!string) {
-		dprintk(1,
-			KERN_ERR
-			"%s: write_proc: can not allocate memory\n",
-			ZR_DEVNAME(zr));
 		return -ENOMEM;
 	}
 	if (copy_from_user(string, buffer, count)) {
-		vfree (string);
+		vfree(string);
 		return -EFAULT;
 	}
 	string[count] = 0;
@@ -185,15 +179,14 @@ static const struct file_operations zoran_operations = {
 };
 #endif
 
-int
-zoran_proc_init (struct zoran *zr)
+int zoran_proc_init(struct zoran *zr)
 {
 #ifdef CONFIG_PROC_FS
 	char name[8];
 
 	snprintf(name, 7, "zoran%d", zr->id);
 	zr->zoran_proc = proc_create_data(name, 0, NULL, &zoran_operations, zr);
-	if (zr->zoran_proc != NULL) {
+	if (zr->zoran_proc) {
 		dprintk(2,
 			KERN_INFO
 			"%s: procfs entry /proc/%s allocated. data=%p\n",
@@ -207,8 +200,7 @@ zoran_proc_init (struct zoran *zr)
 	return 0;
 }
 
-void
-zoran_proc_cleanup (struct zoran *zr)
+void zoran_proc_cleanup(struct zoran *zr)
 {
 #ifdef CONFIG_PROC_FS
 	char name[8];
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 8736b9d8d97e..3219b63d6f72 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -1,39 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran ZR36016 basic configuration functions
  *
  * Copyright (C) 2001 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: zr36016.c,v 1.1.2.14 2003/08/20 19:46:55 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
-#define ZR016_VERSION "v0.7"
-
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
-
-#include <linux/types.h>
-#include <linux/wait.h>
-
-/* I/O commands, error codes */
-#include <asm/io.h>
-
-/* v4l  API */
 
 /* headerfile of this module */
 #include "zr36016.h"
@@ -66,40 +40,31 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
    ========================================================================= */
 
 /* read and write functions */
-static u8
-zr36016_read (struct zr36016 *ptr,
-	      u16             reg)
+static u8 zr36016_read(struct zr36016 *ptr, u16 reg)
 {
 	u8 value = 0;
 
-	// just in case something is wrong...
+	/* just in case something is wrong... */
 	if (ptr->codec->master_data->readreg)
-		value =
-		    (ptr->codec->master_data->
-		     readreg(ptr->codec, reg)) & 0xFF;
+		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xFF;
 	else
 		dprintk(1,
 			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
 			ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg,
-		value);
+	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
 
 	return value;
 }
 
-static void
-zr36016_write (struct zr36016 *ptr,
-	       u16             reg,
-	       u8              value)
+static void zr36016_write(struct zr36016 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value,
-		reg);
+	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
 
 	// just in case something is wrong...
-	if (ptr->codec->master_data->writereg) {
+	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
-	} else
+	else
 		dprintk(1,
 			KERN_ERR
 			"%s: invalid I/O setup, nothing written!\n",
@@ -109,45 +74,40 @@ zr36016_write (struct zr36016 *ptr,
 /* indirect read and write functions */
 /* the 016 supports auto-addr-increment, but
  * writing it all time cost not much and is safer... */
-static u8
-zr36016_readi (struct zr36016 *ptr,
-	       u16             reg)
+static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 {
 	u8 value = 0;
 
-	// just in case something is wrong...
-	if ((ptr->codec->master_data->writereg) &&
-	    (ptr->codec->master_data->readreg)) {
+	/* just in case something is wrong... */
+	if ((ptr->codec->master_data->writereg) && (ptr->codec->master_data->readreg)) {
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
 		value = (ptr->codec->master_data->readreg(ptr->codec, ZR016_IDATA)) & 0xFF;	// DATA
-	} else
+	} else {
 		dprintk(1,
 			KERN_ERR
 			"%s: invalid I/O setup, nothing read (i)!\n",
 			ptr->name);
+	}
 
-	dprintk(4, "%s: reading indirect from 0x%04x: %02x\n", ptr->name,
-		reg, value);
+	dprintk(4, "%s: reading indirect from 0x%04x: %02x\n", ptr->name, reg, value);
 	return value;
 }
 
-static void
-zr36016_writei (struct zr36016 *ptr,
-		u16             reg,
-		u8              value)
+static void zr36016_writei(struct zr36016 *ptr, u16 reg, u8 value)
 {
 	dprintk(4, "%s: writing indirect 0x%02x to 0x%04x\n", ptr->name,
 		value, reg);
 
-	// just in case something is wrong...
+	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg) {
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IDATA, value & 0x0FF);	// DATA
-	} else
+	} else {
 		dprintk(1,
 			KERN_ERR
 			"%s: invalid I/O setup, nothing written (i)!\n",
 			ptr->name);
+	}
 }
 
 /* =========================================================================
@@ -157,8 +117,7 @@ zr36016_writei (struct zr36016 *ptr,
    ========================================================================= */
 
 /* version kept in datastructure */
-static u8
-zr36016_read_version (struct zr36016 *ptr)
+static u8 zr36016_read_version(struct zr36016 *ptr)
 {
 	ptr->version = zr36016_read(ptr, 0) >> 4;
 	return ptr->version;
@@ -170,11 +129,11 @@ zr36016_read_version (struct zr36016 *ptr)
    basic test of "connectivity", writes/reads to/from PAX-Lo register
    ========================================================================= */
 
-static int
-zr36016_basic_test (struct zr36016 *ptr)
+static int zr36016_basic_test(struct zr36016 *ptr)
 {
 	if (debug) {
 		int i;
+
 		zr36016_writei(ptr, ZR016I_PAX_LO, 0x55);
 		dprintk(1, KERN_INFO "%s: registers: ", ptr->name);
 		for (i = 0; i <= 0x0b; i++)
@@ -219,16 +178,16 @@ zr36016_basic_test (struct zr36016 *ptr)
    ========================================================================= */
 
 #if 0
-static int zr36016_pushit (struct zr36016 *ptr,
-			   u16             startreg,
+static int zr36016_pushit(struct zr36016 *ptr,
+			  u16             startreg,
 			   u16             len,
 			   const char     *data)
 {
-	int i=0;
+	int i = 0;
 
 	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n",
-		ptr->name, startreg,len);
-	while (i<len) {
+		ptr->name, startreg, len);
+	while (i < len) {
 		zr36016_writei(ptr, startreg++,  data[i++]);
 	}
 
@@ -242,8 +201,7 @@ static int zr36016_pushit (struct zr36016 *ptr,
    //TODO//
    ========================================================================= */
 
-static void
-zr36016_init (struct zr36016 *ptr)
+static void zr36016_init(struct zr36016 *ptr)
 {
 	// stop any processing
 	zr36016_write(ptr, ZR016_GOSTOP, 0);
@@ -283,11 +241,9 @@ zr36016_init (struct zr36016 *ptr)
 
 /* set compression/expansion mode and launches codec -
    this should be the last call from the master before starting processing */
-static int
-zr36016_set_mode (struct videocodec *codec,
-		  int                mode)
+static int zr36016_set_mode(struct videocodec *codec, int mode)
 {
-	struct zr36016 *ptr = (struct zr36016 *) codec->data;
+	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
 	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
 
@@ -301,13 +257,10 @@ zr36016_set_mode (struct videocodec *codec,
 }
 
 /* set picture size */
-static int
-zr36016_set_video (struct videocodec   *codec,
-		   struct tvnorm       *norm,
-		   struct vfe_settings *cap,
-		   struct vfe_polarity *pol)
+static int zr36016_set_video(struct videocodec *codec, struct tvnorm *norm,
+		   struct vfe_settings *cap, struct vfe_polarity *pol)
 {
-	struct zr36016 *ptr = (struct zr36016 *) codec->data;
+	struct zr36016 *ptr = (struct zr36016 *)codec->data;
 
 	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) call\n",
 		ptr->name, norm->HStart, norm->VStart,
@@ -339,17 +292,12 @@ zr36016_set_video (struct videocodec   *codec,
 }
 
 /* additional control functions */
-static int
-zr36016_control (struct videocodec *codec,
-		 int                type,
-		 int                size,
-		 void              *data)
+static int zr36016_control(struct videocodec *codec, int type, int size, void *data)
 {
-	struct zr36016 *ptr = (struct zr36016 *) codec->data;
-	int *ival = (int *) data;
+	struct zr36016 *ptr = (struct zr36016 *)codec->data;
+	int *ival = (int *)data;
 
-	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
-		size);
+	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type, size);
 
 	switch (type) {
 	case CODEC_G_STATUS:	/* get last status - we don't know it ... */
@@ -393,16 +341,14 @@ zr36016_control (struct videocodec *codec,
    Deinitializes Zoran's JPEG processor
    ========================================================================= */
 
-static int
-zr36016_unset (struct videocodec *codec)
+static int zr36016_unset(struct videocodec *codec)
 {
 	struct zr36016 *ptr = codec->data;
 
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name,
-			ptr->num);
+		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -422,29 +368,23 @@ zr36016_unset (struct videocodec *codec)
    (the given size is determined by the processor with the video interface)
    ========================================================================= */
 
-static int
-zr36016_setup (struct videocodec *codec)
+static int zr36016_setup(struct videocodec *codec)
 {
 	struct zr36016 *ptr;
 	int res;
 
-	dprintk(2, "zr36016: initializing VFE subsystem #%d.\n",
-		zr36016_codecs);
+	dprintk(2, "zr36016: initializing VFE subsystem #%d.\n", zr36016_codecs);
 
 	if (zr36016_codecs == MAX_CODECS) {
-		dprintk(1,
-			KERN_ERR "zr36016: Can't attach more codecs!\n");
+		dprintk(1, KERN_ERR "zr36016: Can't attach more codecs!\n");
 		return -ENOSPC;
 	}
 	//mem structure init
 	codec->data = ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
-	if (NULL == ptr) {
-		dprintk(1, KERN_ERR "zr36016: Can't get enough memory!\n");
+	if (!ptr) {
 		return -ENOMEM;
-	}
 
-	snprintf(ptr->name, sizeof(ptr->name), "zr36016[%d]",
-		 zr36016_codecs);
+	snprintf(ptr->name, sizeof(ptr->name), "zr36016[%d]", zr36016_codecs);
 	ptr->num = zr36016_codecs++;
 	ptr->codec = codec;
 
@@ -462,8 +402,7 @@ zr36016_setup (struct videocodec *codec)
 	ptr->ydec = 0;
 	zr36016_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec v%d attached and running\n",
-		ptr->name, ptr->version);
+	dprintk(1, KERN_INFO "%s: codec v%d attached and running\n", ptr->name, ptr->version);
 
 	return 0;
 }
@@ -471,33 +410,31 @@ zr36016_setup (struct videocodec *codec)
 static const struct videocodec zr36016_codec = {
 	.owner = THIS_MODULE,
 	.name = "zr36016",
-	.magic = 0L,		// magic not used
+	.magic = 0L,		/* magic not used */
 	.flags =
 	    CODEC_FLAG_HARDWARE | CODEC_FLAG_VFE | CODEC_FLAG_ENCODER |
 	    CODEC_FLAG_DECODER,
 	.type = CODEC_TYPE_ZR36016,
-	.setup = zr36016_setup,	// functionality
+	.setup = zr36016_setup,	/* functionality */
 	.unset = zr36016_unset,
 	.set_mode = zr36016_set_mode,
 	.set_video = zr36016_set_video,
 	.control = zr36016_control,
-	// others are not used
+	/* others are not used */
 };
 
 /* =========================================================================
    HOOK IN DRIVER AS KERNEL MODULE
    ========================================================================= */
 
-static int __init
-zr36016_init_module (void)
+static int __init zr36016_init_module(void)
 {
 	//dprintk(1, "ZR36016 driver %s\n",ZR016_VERSION);
 	zr36016_codecs = 0;
 	return videocodec_register(&zr36016_codec);
 }
 
-static void __exit
-zr36016_cleanup_module (void)
+static void __exit zr36016_cleanup_module(void)
 {
 	if (zr36016_codecs) {
 		dprintk(1,
@@ -511,6 +448,5 @@ module_init(zr36016_init_module);
 module_exit(zr36016_cleanup_module);
 
 MODULE_AUTHOR("Wolfgang Scherr <scherr@net4you.at>");
-MODULE_DESCRIPTION("Driver module for ZR36016 video frontends "
-		   ZR016_VERSION);
+MODULE_DESCRIPTION("Driver module for ZR36016 video frontends");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/zr36016.h b/drivers/staging/media/zoran/zr36016.h
index 784bcf5727b8..1475f971cc24 100644
--- a/drivers/staging/media/zoran/zr36016.h
+++ b/drivers/staging/media/zoran/zr36016.h
@@ -1,23 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Zoran ZR36016 basic configuration functions - header file
  *
  * Copyright (C) 2001 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: zr36016.h,v 1.1.2.3 2003/01/14 21:18:07 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #ifndef ZR36016_H
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index 5ebfc16672f3..dc7928d88099 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran ZR36050 basic configuration functions
  *
  * Copyright (C) 2001 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: zr36050.c,v 1.1.2.11 2003/08/03 14:54:53 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #define ZR050_VERSION "v0.7.1"
@@ -64,36 +49,27 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
    ========================================================================= */
 
 /* read and write functions */
-static u8
-zr36050_read (struct zr36050 *ptr,
-	      u16             reg)
+static u8 zr36050_read(struct zr36050 *ptr, u16 reg)
 {
 	u8 value = 0;
 
-	// just in case something is wrong...
+	/* just in case something is wrong... */
 	if (ptr->codec->master_data->readreg)
-		value = (ptr->codec->master_data->readreg(ptr->codec,
-							  reg)) & 0xFF;
+		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xFF;
 	else
 		dprintk(1,
-			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
-			ptr->name);
+			KERN_ERR "%s: invalid I/O setup, nothing read!\n", ptr->name);
 
-	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg,
-		value);
+	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
 
 	return value;
 }
 
-static void
-zr36050_write (struct zr36050 *ptr,
-	       u16             reg,
-	       u8              value)
+static void zr36050_write(struct zr36050 *ptr, u16 reg, u8 value)
 {
-	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value,
-		reg);
+	dprintk(4, "%s: writing 0x%02x to 0x%04x\n", ptr->name, value, reg);
 
-	// just in case something is wrong...
+	/* just in case something is wrong... */
 	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
 	else
@@ -110,8 +86,7 @@ zr36050_write (struct zr36050 *ptr,
    ========================================================================= */
 
 /* status is kept in datastructure */
-static u8
-zr36050_read_status1 (struct zr36050 *ptr)
+static u8 zr36050_read_status1(struct zr36050 *ptr)
 {
 	ptr->status1 = zr36050_read(ptr, ZR050_STATUS_1);
 
@@ -126,8 +101,7 @@ zr36050_read_status1 (struct zr36050 *ptr)
    ========================================================================= */
 
 /* scale factor is kept in datastructure */
-static u16
-zr36050_read_scalefactor (struct zr36050 *ptr)
+static u16 zr36050_read_scalefactor(struct zr36050 *ptr)
 {
 	ptr->scalefact = (zr36050_read(ptr, ZR050_SF_HI) << 8) |
 			 (zr36050_read(ptr, ZR050_SF_LO) & 0xFF);
@@ -143,8 +117,7 @@ zr36050_read_scalefactor (struct zr36050 *ptr)
    wait if codec is ready to proceed (end of processing) or time is over
    ========================================================================= */
 
-static void
-zr36050_wait_end (struct zr36050 *ptr)
+static void zr36050_wait_end(struct zr36050 *ptr)
 {
 	int i = 0;
 
@@ -165,8 +138,7 @@ zr36050_wait_end (struct zr36050 *ptr)
    basic test of "connectivity", writes/reads to/from memory the SOF marker
    ========================================================================= */
 
-static int
-zr36050_basic_test (struct zr36050 *ptr)
+static int zr36050_basic_test(struct zr36050 *ptr)
 {
 	zr36050_write(ptr, ZR050_SOF_IDX, 0x00);
 	zr36050_write(ptr, ZR050_SOF_IDX + 1, 0x00);
@@ -207,19 +179,14 @@ zr36050_basic_test (struct zr36050 *ptr)
    simple loop for pushing the init datasets
    ========================================================================= */
 
-static int
-zr36050_pushit (struct zr36050 *ptr,
-		u16             startreg,
-		u16             len,
-		const char     *data)
+static int zr36050_pushit(struct zr36050 *ptr, u16 startreg, u16 len, const char *data)
 {
 	int i = 0;
 
 	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
 		startreg, len);
-	while (i < len) {
+	while (i < len)
 		zr36050_write(ptr, startreg++, data[i++]);
-	}
 
 	return i;
 }
@@ -338,8 +305,7 @@ static const char zr36050_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 /* SOF (start of frame) segment depends on width, height and sampling ratio
 			 of each color component */
 
-static int
-zr36050_set_sof (struct zr36050 *ptr)
+static int zr36050_set_sof(struct zr36050 *ptr)
 {
 	char sof_data[34];	// max. size of register set
 	int i;
@@ -370,8 +336,7 @@ zr36050_set_sof (struct zr36050 *ptr)
 /* SOS (start of scan) segment depends on the used scan components
 			of each color component */
 
-static int
-zr36050_set_sos (struct zr36050 *ptr)
+static int zr36050_set_sos(struct zr36050 *ptr)
 {
 	char sos_data[16];	// max. size of register set
 	int i;
@@ -398,8 +363,7 @@ zr36050_set_sos (struct zr36050 *ptr)
 
 /* DRI (define restart interval) */
 
-static int
-zr36050_set_dri (struct zr36050 *ptr)
+static int zr36050_set_dri(struct zr36050 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
@@ -421,8 +385,7 @@ zr36050_set_dri (struct zr36050 *ptr)
 
    ... sorry for the spaghetti code ...
    ========================================================================= */
-static void
-zr36050_init (struct zr36050 *ptr)
+static void zr36050_init(struct zr36050 *ptr)
 {
 	int sum = 0;
 	long bitcnt, tmp;
@@ -577,11 +540,9 @@ zr36050_init (struct zr36050 *ptr)
 
 /* set compression/expansion mode and launches codec -
    this should be the last call from the master before starting processing */
-static int
-zr36050_set_mode (struct videocodec *codec,
-		  int                mode)
+static int zr36050_set_mode(struct videocodec *codec, int mode)
 {
-	struct zr36050 *ptr = (struct zr36050 *) codec->data;
+	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 
 	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
 
@@ -595,13 +556,10 @@ zr36050_set_mode (struct videocodec *codec,
 }
 
 /* set picture size (norm is ignored as the codec doesn't know about it) */
-static int
-zr36050_set_video (struct videocodec   *codec,
-		   struct tvnorm       *norm,
-		   struct vfe_settings *cap,
-		   struct vfe_polarity *pol)
+static int zr36050_set_video(struct videocodec *codec, struct tvnorm *norm,
+		   struct vfe_settings *cap, struct vfe_polarity *pol)
 {
-	struct zr36050 *ptr = (struct zr36050 *) codec->data;
+	struct zr36050 *ptr = (struct zr36050 *)codec->data;
 	int size;
 
 	dprintk(2, "%s: set_video %d.%d, %d/%d-%dx%d (0x%x) q%d call\n",
@@ -630,21 +588,17 @@ zr36050_set_video (struct videocodec   *codec,
 	ptr->real_code_vol = size >> 3; /* in bytes */
 
 	/* Set max_block_vol here (previously in zr36050_init, moved
-	 * here for consistency with zr36060 code */
+ * here for consistency with zr36060 code */
 	zr36050_write(ptr, ZR050_MBCV, ptr->max_block_vol);
 
 	return 0;
 }
 
 /* additional control functions */
-static int
-zr36050_control (struct videocodec *codec,
-		 int                type,
-		 int                size,
-		 void              *data)
+static int zr36050_control(struct videocodec *codec, int type, int size, void *data)
 {
-	struct zr36050 *ptr = (struct zr36050 *) codec->data;
-	int *ival = (int *) data;
+	struct zr36050 *ptr = (struct zr36050 *)codec->data;
+	int *ival = (int *)data;
 
 	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
 		size);
@@ -760,8 +714,7 @@ zr36050_control (struct videocodec *codec,
    Deinitializes Zoran's JPEG processor
    ========================================================================= */
 
-static int
-zr36050_unset (struct videocodec *codec)
+static int zr36050_unset(struct videocodec *codec)
 {
 	struct zr36050 *ptr = codec->data;
 
@@ -789,8 +742,7 @@ zr36050_unset (struct videocodec *codec)
    (the given size is determined by the processor with the video interface)
    ========================================================================= */
 
-static int
-zr36050_setup (struct videocodec *codec)
+static int zr36050_setup(struct videocodec *codec)
 {
 	struct zr36050 *ptr;
 	int res;
@@ -805,7 +757,7 @@ zr36050_setup (struct videocodec *codec)
 	}
 	//mem structure init
 	codec->data = ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
-	if (NULL == ptr) {
+	if (!ptr) {
 		dprintk(1, KERN_ERR "zr36050: Can't get enough memory!\n");
 		return -ENOMEM;
 	}
@@ -868,16 +820,14 @@ static const struct videocodec zr36050_codec = {
    HOOK IN DRIVER AS KERNEL MODULE
    ========================================================================= */
 
-static int __init
-zr36050_init_module (void)
+static int __init zr36050_init_module(void)
 {
 	//dprintk(1, "ZR36050 driver %s\n",ZR050_VERSION);
 	zr36050_codecs = 0;
 	return videocodec_register(&zr36050_codec);
 }
 
-static void __exit
-zr36050_cleanup_module (void)
+static void __exit zr36050_cleanup_module(void)
 {
 	if (zr36050_codecs) {
 		dprintk(1,
diff --git a/drivers/staging/media/zoran/zr36050.h b/drivers/staging/media/zoran/zr36050.h
index 9236486d3c2b..8f972d045b58 100644
--- a/drivers/staging/media/zoran/zr36050.h
+++ b/drivers/staging/media/zoran/zr36050.h
@@ -1,23 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Zoran ZR36050 basic configuration functions - header file
  *
  * Copyright (C) 2001 Wolfgang Scherr <scherr@net4you.at>
- *
- * $Id: zr36050.h,v 1.1.2.2 2003/01/14 21:18:22 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #ifndef ZR36050_H
@@ -85,10 +70,10 @@ struct zr36050 {
 #define ZR050_ACT_MH              0x01b
 #define ZR050_ACT_ML              0x01c
 #define ZR050_ACT_LO              0x01d
-#define ZR050_ACV_TRUN_HI         0x01e
-#define ZR050_ACV_TRUN_MH         0x01f
-#define ZR050_ACV_TRUN_ML         0x020
-#define ZR050_ACV_TRUN_LO         0x021
+#define ZR050_ACV_TURN_HI         0x01e
+#define ZR050_ACV_TURN_MH         0x01f
+#define ZR050_ACV_TURN_ML         0x020
+#define ZR050_ACV_TURN_LO         0x021
 #define ZR050_STATUS_0            0x02e
 #define ZR050_STATUS_1            0x02f
 
@@ -145,7 +130,6 @@ struct zr36050 {
 #define ZR050_OP_NSCN_8              0xE0
 #define ZR050_OP_OVF                 0x10
 
-
 /* zr36050 markers-enable register bits */
 
 #define ZR050_ME_APP                 0x80
diff --git a/drivers/staging/media/zoran/zr36057.h b/drivers/staging/media/zoran/zr36057.h
index c8acb21dcb5c..b0ec4a7ffda2 100644
--- a/drivers/staging/media/zoran/zr36057.h
+++ b/drivers/staging/media/zoran/zr36057.h
@@ -1,41 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * zr36057.h - zr36057 register offsets
  *
  * Copyright (C) 1998 Dave Perks <dperks@ibm.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #ifndef _ZR36057_H_
 #define _ZR36057_H_
 
-
 /* Zoran ZR36057 registers */
 
 #define ZR36057_VFEHCR          0x000	/* Video Front End, Horizontal Configuration Register */
-#define ZR36057_VFEHCR_HSPol            (1<<30)
+#define ZR36057_VFEHCR_HSPol             BIT(30)
 #define ZR36057_VFEHCR_HStart           10
 #define ZR36057_VFEHCR_HEnd		0
 #define ZR36057_VFEHCR_Hmask		0x3ff
 
 #define ZR36057_VFEVCR          0x004	/* Video Front End, Vertical Configuration Register */
-#define ZR36057_VFEVCR_VSPol            (1<<30)
+#define ZR36057_VFEVCR_VSPol             BIT(30)
 #define ZR36057_VFEVCR_VStart           10
 #define ZR36057_VFEVCR_VEnd		0
 #define ZR36057_VFEVCR_Vmask		0x3ff
 
 #define ZR36057_VFESPFR         0x008	/* Video Front End, Scaler and Pixel Format Register */
-#define ZR36057_VFESPFR_ExtFl           (1<<26)
-#define ZR36057_VFESPFR_TopField        (1<<25)
-#define ZR36057_VFESPFR_VCLKPol         (1<<24)
+#define ZR36057_VFESPFR_ExtFl            BIT(26)
+#define ZR36057_VFESPFR_TopField         BIT(25)
+#define ZR36057_VFESPFR_VCLKPol          BIT(24)
 #define ZR36057_VFESPFR_HFilter         21
 #define ZR36057_VFESPFR_HorDcm          14
 #define ZR36057_VFESPFR_VerDcm          8
@@ -54,14 +44,14 @@
 
 #define ZR36057_VSSFGR          0x014	/* Video Stride, Status, and Frame Grab Register */
 #define ZR36057_VSSFGR_DispStride       16
-#define ZR36057_VSSFGR_VidOvf           (1<<8)
-#define ZR36057_VSSFGR_SnapShot         (1<<1)
-#define ZR36057_VSSFGR_FrameGrab        (1<<0)
+#define ZR36057_VSSFGR_VidOvf            BIT(8)
+#define ZR36057_VSSFGR_SnapShot          BIT(1)
+#define ZR36057_VSSFGR_FrameGrab         BIT(0)
 
 #define ZR36057_VDCR            0x018	/* Video Display Configuration Register */
-#define ZR36057_VDCR_VidEn              (1<<31)
+#define ZR36057_VDCR_VidEn               BIT(31)
 #define ZR36057_VDCR_MinPix             24
-#define ZR36057_VDCR_Triton             (1<<24)
+#define ZR36057_VDCR_Triton              BIT(24)
 #define ZR36057_VDCR_VidWinHt           12
 #define ZR36057_VDCR_VidWinWid          0
 
@@ -70,60 +60,60 @@
 #define ZR36057_MMBR            0x020	/* Masking Map "Bottom" Register */
 
 #define ZR36057_OCR             0x024	/* Overlay Control Register */
-#define ZR36057_OCR_OvlEnable           (1 << 15)
+#define ZR36057_OCR_OvlEnable            BIT(15)
 #define ZR36057_OCR_MaskStride          0
 
 #define ZR36057_SPGPPCR         0x028	/* System, PCI, and General Purpose Pins Control Register */
-#define ZR36057_SPGPPCR_SoftReset	(1<<24)
+#define ZR36057_SPGPPCR_SoftReset	 BIT(24)
 
 #define ZR36057_GPPGCR1         0x02c	/* General Purpose Pins and GuestBus Control Register (1) */
 
 #define ZR36057_MCSAR           0x030	/* MPEG Code Source Address Register */
 
 #define ZR36057_MCTCR           0x034	/* MPEG Code Transfer Control Register */
-#define ZR36057_MCTCR_CodTime           (1 << 30)
-#define ZR36057_MCTCR_CEmpty            (1 << 29)
-#define ZR36057_MCTCR_CFlush            (1 << 28)
+#define ZR36057_MCTCR_CodTime            BIT(30)
+#define ZR36057_MCTCR_CEmpty             BIT(29)
+#define ZR36057_MCTCR_CFlush             BIT(28)
 #define ZR36057_MCTCR_CodGuestID	20
 #define ZR36057_MCTCR_CodGuestReg	16
 
 #define ZR36057_MCMPR           0x038	/* MPEG Code Memory Pointer Register */
 
 #define ZR36057_ISR             0x03c	/* Interrupt Status Register */
-#define ZR36057_ISR_GIRQ1               (1<<30)
-#define ZR36057_ISR_GIRQ0               (1<<29)
-#define ZR36057_ISR_CodRepIRQ           (1<<28)
-#define ZR36057_ISR_JPEGRepIRQ          (1<<27)
+#define ZR36057_ISR_GIRQ1                BIT(30)
+#define ZR36057_ISR_GIRQ0                BIT(29)
+#define ZR36057_ISR_CodRepIRQ            BIT(28)
+#define ZR36057_ISR_JPEGRepIRQ           BIT(27)
 
 #define ZR36057_ICR             0x040	/* Interrupt Control Register */
-#define ZR36057_ICR_GIRQ1               (1<<30)
-#define ZR36057_ICR_GIRQ0               (1<<29)
-#define ZR36057_ICR_CodRepIRQ           (1<<28)
-#define ZR36057_ICR_JPEGRepIRQ          (1<<27)
-#define ZR36057_ICR_IntPinEn            (1<<24)
+#define ZR36057_ICR_GIRQ1                BIT(30)
+#define ZR36057_ICR_GIRQ0                BIT(29)
+#define ZR36057_ICR_CodRepIRQ            BIT(28)
+#define ZR36057_ICR_JPEGRepIRQ           BIT(27)
+#define ZR36057_ICR_IntPinEn             BIT(24)
 
 #define ZR36057_I2CBR           0x044	/* I2C Bus Register */
-#define ZR36057_I2CBR_SDA		(1<<1)
-#define ZR36057_I2CBR_SCL		(1<<0)
+#define ZR36057_I2CBR_SDA		 BIT(1)
+#define ZR36057_I2CBR_SCL		 BIT(0)
 
 #define ZR36057_JMC             0x100	/* JPEG Mode and Control */
-#define ZR36057_JMC_JPG                 (1 << 31)
+#define ZR36057_JMC_JPG                  BIT(31)
 #define ZR36057_JMC_JPGExpMode          (0 << 29)
-#define ZR36057_JMC_JPGCmpMode          (1 << 29)
+#define ZR36057_JMC_JPGCmpMode           BIT(29)
 #define ZR36057_JMC_MJPGExpMode         (2 << 29)
 #define ZR36057_JMC_MJPGCmpMode         (3 << 29)
-#define ZR36057_JMC_RTBUSY_FB           (1 << 6)
-#define ZR36057_JMC_Go_en               (1 << 5)
-#define ZR36057_JMC_SyncMstr            (1 << 4)
-#define ZR36057_JMC_Fld_per_buff        (1 << 3)
-#define ZR36057_JMC_VFIFO_FB            (1 << 2)
-#define ZR36057_JMC_CFIFO_FB            (1 << 1)
-#define ZR36057_JMC_Stll_LitEndian      (1 << 0)
+#define ZR36057_JMC_RTBUSY_FB            BIT(6)
+#define ZR36057_JMC_Go_en                BIT(5)
+#define ZR36057_JMC_SyncMstr             BIT(4)
+#define ZR36057_JMC_Fld_per_buff         BIT(3)
+#define ZR36057_JMC_VFIFO_FB             BIT(2)
+#define ZR36057_JMC_CFIFO_FB             BIT(1)
+#define ZR36057_JMC_Stll_LitEndian       BIT(0)
 
 #define ZR36057_JPC             0x104	/* JPEG Process Control */
-#define ZR36057_JPC_P_Reset             (1 << 7)
-#define ZR36057_JPC_CodTrnsEn           (1 << 5)
-#define ZR36057_JPC_Active              (1 << 0)
+#define ZR36057_JPC_P_Reset              BIT(7)
+#define ZR36057_JPC_CodTrnsEn            BIT(5)
+#define ZR36057_JPC_Active               BIT(0)
 
 #define ZR36057_VSP             0x108	/* Vertical Sync Parameters */
 #define ZR36057_VSP_VsyncSize           16
@@ -142,7 +132,7 @@
 #define ZR36057_FVAP_PAY                0
 
 #define ZR36057_FPP             0x118	/* Field Process Parameters */
-#define ZR36057_FPP_Odd_Even            (1 << 0)
+#define ZR36057_FPP_Odd_Even             BIT(0)
 
 #define ZR36057_JCBA            0x11c	/* JPEG Code Base Address */
 
@@ -155,9 +145,9 @@
 #define ZR36057_GCR2            0x12c	/* GuestBus Control Register (2) */
 
 #define ZR36057_POR             0x200	/* Post Office Register */
-#define ZR36057_POR_POPen               (1<<25)
-#define ZR36057_POR_POTime              (1<<24)
-#define ZR36057_POR_PODir               (1<<23)
+#define ZR36057_POR_POPen                BIT(25)
+#define ZR36057_POR_POTime               BIT(24)
+#define ZR36057_POR_PODir                BIT(23)
 
 #define ZR36057_STR             0x300	/* "Still" Transfer Register */
 
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index 2c2e8130fc96..c04054f1306b 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Zoran ZR36060 basic configuration functions
  *
  * Copyright (C) 2002 Laurent Pinchart <laurent.pinchart@skynet.be>
- *
- * $Id: zr36060.c,v 1.1.2.22 2003/05/06 09:35:36 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #define ZR060_VERSION "v0.7"
@@ -31,7 +16,7 @@
 #include <linux/wait.h>
 
 /* I/O commands, error codes */
-#include <asm/io.h>
+#include <linux/io.h>
 
 /* headerfile of this module */
 #include "zr36060.h"
@@ -39,8 +24,7 @@
 /* codec io API */
 #include "videocodec.h"
 
-/* it doesn't make sense to have more than 20 or so,
-  just to prevent some unwanted loops */
+/* it doesn't make sense to have more than 20 or so, just to prevent some unwanted loops */
 #define MAX_CODECS 20
 
 /* amount of chips attached via this driver */
@@ -62,38 +46,28 @@ MODULE_PARM_DESC(debug, "Debug level (0-4)");
 	} while (0)
 
 /* =========================================================================
-   Local hardware I/O functions:
-
-   read/write via codec layer (registers are located in the master device)
-   ========================================================================= */
+ * Local hardware I/O functions:
+ * read/write via codec layer (registers are located in the master device)
+ * =========================================================================
+ */
 
-/* read and write functions */
-static u8
-zr36060_read (struct zr36060 *ptr,
-	      u16             reg)
+static u8 zr36060_read(struct zr36060 *ptr, u16 reg)
 {
 	u8 value = 0;
 
 	// just in case something is wrong...
 	if (ptr->codec->master_data->readreg)
-		value = (ptr->codec->master_data->readreg(ptr->codec,
-							  reg)) & 0xff;
+		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xff;
 	else
 		dprintk(1,
 			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
 			ptr->name);
 
-	//dprintk(4, "%s: reading from 0x%04x: %02x\n",ptr->name,reg,value);
-
 	return value;
 }
 
-static void
-zr36060_write(struct zr36060 *ptr,
-	      u16             reg,
-	      u8              value)
+static void zr36060_write(struct zr36060 *ptr, u16 reg, u8 value)
 {
-	//dprintk(4, "%s: writing 0x%02x to 0x%04x\n",ptr->name,value,reg);
 	dprintk(4, "0x%02x @0x%04x\n", value, reg);
 
 	// just in case something is wrong...
@@ -107,14 +81,13 @@ zr36060_write(struct zr36060 *ptr,
 }
 
 /* =========================================================================
-   Local helper function:
-
-   status read
-   ========================================================================= */
+ * Local helper function:
+ * status read
+ * =========================================================================
+ */
 
 /* status is kept in datastructure */
-static u8
-zr36060_read_status (struct zr36060 *ptr)
+static u8 zr36060_read_status(struct zr36060 *ptr)
 {
 	ptr->status = zr36060_read(ptr, ZR060_CFSR);
 
@@ -122,15 +95,8 @@ zr36060_read_status (struct zr36060 *ptr)
 	return ptr->status;
 }
 
-/* =========================================================================
-   Local helper function:
-
-   scale factor read
-   ========================================================================= */
-
 /* scale factor is kept in datastructure */
-static u16
-zr36060_read_scalefactor (struct zr36060 *ptr)
+static u16 zr36060_read_scalefactor(struct zr36060 *ptr)
 {
 	ptr->scalefact = (zr36060_read(ptr, ZR060_SF_HI) << 8) |
 			 (zr36060_read(ptr, ZR060_SF_LO) & 0xFF);
@@ -140,14 +106,8 @@ zr36060_read_scalefactor (struct zr36060 *ptr)
 	return ptr->scalefact;
 }
 
-/* =========================================================================
-   Local helper function:
-
-   wait if codec is ready to proceed (end of processing) or time is over
-   ========================================================================= */
-
-static void
-zr36060_wait_end (struct zr36060 *ptr)
+/* wait if codec is ready to proceed (end of processing) or time is over */
+static void zr36060_wait_end(struct zr36060 *ptr)
 {
 	int i = 0;
 
@@ -162,14 +122,8 @@ zr36060_wait_end (struct zr36060 *ptr)
 	}
 }
 
-/* =========================================================================
-   Local helper function:
-
-   basic test of "connectivity", writes/reads to/from memory the SOF marker
-   ========================================================================= */
-
-static int
-zr36060_basic_test (struct zr36060 *ptr)
+/* Basic test of "connectivity", writes/reads to/from memory the SOF marker */
+static int zr36060_basic_test(struct zr36060 *ptr)
 {
 	if ((zr36060_read(ptr, ZR060_IDR_DEV) != 0x33) &&
 	    (zr36060_read(ptr, ZR060_IDR_REV) != 0x01)) {
@@ -192,40 +146,29 @@ zr36060_basic_test (struct zr36060 *ptr)
 	return 0;		/* looks good! */
 }
 
-/* =========================================================================
-   Local helper function:
-
-   simple loop for pushing the init datasets
-   ========================================================================= */
-
-static int
-zr36060_pushit (struct zr36060 *ptr,
-		u16             startreg,
-		u16             len,
-		const char     *data)
+/* simple loop for pushing the init datasets */
+static int zr36060_pushit(struct zr36060 *ptr, u16 startreg, u16 len, const char *data)
 {
 	int i = 0;
 
 	dprintk(4, "%s: write data block to 0x%04x (len=%d)\n", ptr->name,
 		startreg, len);
-	while (i < len) {
+	while (i < len)
 		zr36060_write(ptr, startreg++, data[i++]);
-	}
 
 	return i;
 }
 
 /* =========================================================================
-   Basic datasets:
-
-   jpeg baseline setup data (you find it on lots places in internet, or just
-   extract it from any regular .jpg image...)
-
-   Could be variable, but until it's not needed it they are just fixed to save
-   memory. Otherwise expand zr36060 structure with arrays, push the values to
-   it and initialize from there, as e.g. the linux zr36057/60 driver does it.
-   ========================================================================= */
-
+ * Basic datasets:
+ * jpeg baseline setup data (you find it on lots places in internet, or just
+ * extract it from any regular .jpg image...)
+ *
+ * Could be variable, but until it's not needed it they are just fixed to save
+ * memory. Otherwise expand zr36060 structure with arrays, push the values to
+ * it and initialize from there, as e.g. the linux zr36057/60 driver does it.
+ * =========================================================================
+ */
 static const char zr36060_dqt[0x86] = {
 	0xff, 0xdb,		//Marker: DQT
 	0x00, 0x84,		//Length: 2*65+2
@@ -317,20 +260,8 @@ static const char zr36060_ta[8] = { 0, 1, 1, 0, 0, 0, 0, 0 };	//table idx's AC
 static const char zr36060_decimation_h[8] = { 2, 1, 1, 0, 0, 0, 0, 0 };
 static const char zr36060_decimation_v[8] = { 1, 1, 1, 0, 0, 0, 0, 0 };
 
-/* =========================================================================
-   Local helper functions:
-
-   calculation and setup of parameter-dependent JPEG baseline segments
-   (needed for compression only)
-   ========================================================================= */
-
-/* ------------------------------------------------------------------------- */
-
-/* SOF (start of frame) segment depends on width, height and sampling ratio
-			 of each color component */
-
-static int
-zr36060_set_sof (struct zr36060 *ptr)
+/* SOF (start of frame) segment depends on width, height and sampling ratio of each color component */
+static int zr36060_set_sof(struct zr36060 *ptr)
 {
 	char sof_data[34];	// max. size of register set
 	int i;
@@ -357,13 +288,8 @@ zr36060_set_sof (struct zr36060 *ptr)
 			      (3 * NO_OF_COMPONENTS) + 10, sof_data);
 }
 
-/* ------------------------------------------------------------------------- */
-
-/* SOS (start of scan) segment depends on the used scan components
-			of each color component */
-
-static int
-zr36060_set_sos (struct zr36060 *ptr)
+/* SOS (start of scan) segment depends on the used scan components of each color component */
+static int zr36060_set_sos(struct zr36060 *ptr)
 {
 	char sos_data[16];	// max. size of register set
 	int i;
@@ -387,12 +313,8 @@ zr36060_set_sos (struct zr36060 *ptr)
 			      sos_data);
 }
 
-/* ------------------------------------------------------------------------- */
-
 /* DRI (define restart interval) */
-
-static int
-zr36060_set_dri (struct zr36060 *ptr)
+static int zr36060_set_dri(struct zr36060 *ptr)
 {
 	char dri_data[6];	// max. size of register set
 
@@ -406,16 +328,10 @@ zr36060_set_dri (struct zr36060 *ptr)
 	return zr36060_pushit(ptr, ZR060_DRI_IDX, 6, dri_data);
 }
 
-/* =========================================================================
-   Setup function:
-
-   Setup compression/decompression of Zoran's JPEG processor
-   ( see also zoran 36060 manual )
-
-   ... sorry for the spaghetti code ...
-   ========================================================================= */
-static void
-zr36060_init (struct zr36060 *ptr)
+/* Setup compression/decompression of Zoran's JPEG processor ( see also zoran 36060 manual )
+ * ... sorry for the spaghetti code ...
+ */
+static void zr36060_init(struct zr36060 *ptr)
 {
 	int sum = 0;
 	long bitcnt, tmp;
@@ -430,9 +346,7 @@ zr36060_init (struct zr36060 *ptr)
 
 		/* Compression with or without variable scale factor */
 		/*FIXME: What about ptr->bitrate_ctrl? */
-		zr36060_write(ptr, ZR060_CMR,
-			      ZR060_CMR_Comp | ZR060_CMR_Pass2 |
-			      ZR060_CMR_BRB);
+		zr36060_write(ptr, ZR060_CMR, ZR060_CMR_Comp | ZR060_CMR_Pass2 | ZR060_CMR_BRB);
 
 		/* Must be zero */
 		zr36060_write(ptr, ZR060_MBZ, 0x00);
@@ -455,26 +369,19 @@ zr36060_init (struct zr36060 *ptr)
 		sum += zr36060_set_sos(ptr);
 		sum += zr36060_set_dri(ptr);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
-		 * (see table init section above) */
-		sum +=
-		    zr36060_pushit(ptr, ZR060_DQT_IDX, sizeof(zr36060_dqt),
-				   zr36060_dqt);
-		sum +=
-		    zr36060_pushit(ptr, ZR060_DHT_IDX, sizeof(zr36060_dht),
-				   zr36060_dht);
+/* setup the fixed jpeg tables - maybe variable, though - (see table init section above) */
+		sum += zr36060_pushit(ptr, ZR060_DQT_IDX, sizeof(zr36060_dqt), zr36060_dqt);
+		sum += zr36060_pushit(ptr, ZR060_DHT_IDX, sizeof(zr36060_dht), zr36060_dht);
 		zr36060_write(ptr, ZR060_APP_IDX, 0xff);
 		zr36060_write(ptr, ZR060_APP_IDX + 1, 0xe0 + ptr->app.appn);
 		zr36060_write(ptr, ZR060_APP_IDX + 2, 0x00);
 		zr36060_write(ptr, ZR060_APP_IDX + 3, ptr->app.len + 2);
-		sum += zr36060_pushit(ptr, ZR060_APP_IDX + 4, 60,
-				      ptr->app.data) + 4;
+		sum += zr36060_pushit(ptr, ZR060_APP_IDX + 4, 60, ptr->app.data) + 4;
 		zr36060_write(ptr, ZR060_COM_IDX, 0xff);
 		zr36060_write(ptr, ZR060_COM_IDX + 1, 0xfe);
 		zr36060_write(ptr, ZR060_COM_IDX + 2, 0x00);
 		zr36060_write(ptr, ZR060_COM_IDX + 3, ptr->com.len + 2);
-		sum += zr36060_pushit(ptr, ZR060_COM_IDX + 4, 60,
-				      ptr->com.data) + 4;
+		sum += zr36060_pushit(ptr, ZR060_COM_IDX + 4, 60, ptr->com.data) + 4;
 
 		/* setup misc. data for compression (target code sizes) */
 
@@ -536,10 +443,8 @@ zr36060_init (struct zr36060 *ptr)
 		/* setup misc. data for expansion */
 		zr36060_write(ptr, ZR060_MER, 0);
 
-		/* setup the fixed jpeg tables - maybe variable, though -
-		 * (see table init section above) */
-		zr36060_pushit(ptr, ZR060_DHT_IDX, sizeof(zr36060_dht),
-			       zr36060_dht);
+/* setup the fixed jpeg tables - maybe variable, though - (see table init section above) */
+		zr36060_pushit(ptr, ZR060_DHT_IDX, sizeof(zr36060_dht), zr36060_dht);
 
 		/* Setup the Video Frontend */
 		//zr36060_write(ptr, ZR060_VCR, ZR060_VCR_FIExt);
@@ -548,11 +453,9 @@ zr36060_init (struct zr36060 *ptr)
 	}
 
 	/* Load the tables */
-	zr36060_write(ptr, ZR060_LOAD,
-		      ZR060_LOAD_SyncRst | ZR060_LOAD_Load);
+	zr36060_write(ptr, ZR060_LOAD, ZR060_LOAD_SyncRst | ZR060_LOAD_Load);
 	zr36060_wait_end(ptr);
-	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name,
-		ptr->status);
+	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
 
 	if (ptr->status & ZR060_CFSR_Busy) {
 		dprintk(1, KERN_ERR "%s: init aborted!\n", ptr->name);
@@ -561,22 +464,21 @@ zr36060_init (struct zr36060 *ptr)
 }
 
 /* =========================================================================
-   CODEC API FUNCTIONS
-
-   this functions are accessed by the master via the API structure
-   ========================================================================= */
+ * CODEC API FUNCTIONS
+ * this functions are accessed by the master via the API structure
+ * =========================================================================
+ */
 
-/* set compression/expansion mode and launches codec -
-   this should be the last call from the master before starting processing */
-static int
-zr36060_set_mode (struct videocodec *codec,
-		  int                mode)
+/* set compressiion/expansion mode and launches codec -
+ * this should be the last call from the master before starting processing
+ */
+static int zr36060_set_mode(struct videocodec *codec, int mode)
 {
-	struct zr36060 *ptr = (struct zr36060 *) codec->data;
+	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 
 	dprintk(2, "%s: set_mode %d call\n", ptr->name, mode);
 
-	if ((mode != CODEC_DO_EXPANSION) && (mode != CODEC_DO_COMPRESSION))
+	if (mode != CODEC_DO_EXPANSION && mode != CODEC_DO_COMPRESSION)
 		return -EINVAL;
 
 	ptr->mode = mode;
@@ -586,13 +488,10 @@ zr36060_set_mode (struct videocodec *codec,
 }
 
 /* set picture size (norm is ignored as the codec doesn't know about it) */
-static int
-zr36060_set_video (struct videocodec   *codec,
-		   struct tvnorm       *norm,
-		   struct vfe_settings *cap,
-		   struct vfe_polarity *pol)
+static int zr36060_set_video(struct videocodec *codec, struct tvnorm *norm,
+			     struct vfe_settings *cap, struct vfe_polarity *pol)
 {
-	struct zr36060 *ptr = (struct zr36060 *) codec->data;
+	struct zr36060 *ptr = (struct zr36060 *)codec->data;
 	u32 reg;
 	int size;
 
@@ -601,7 +500,8 @@ zr36060_set_video (struct videocodec   *codec,
 
 	/* if () return -EINVAL;
 	 * trust the master driver that it knows what it does - so
-	 * we allow invalid startx/y and norm for now ... */
+	 * we allow invalid startx/y and norm for now ...
+	 */
 	ptr->width = cap->width / (cap->decimation & 0xff);
 	ptr->height = cap->height / (cap->decimation >> 8);
 
@@ -611,7 +511,7 @@ zr36060_set_video (struct videocodec   *codec,
 	 * meaning of their zr360x7 counterparts with the same names
 	 * N.b. for VSPol this is only true if FIVEdge = 0 (default,
 	 * left unchanged here - in accordance with datasheet).
-	*/
+	 */
 	reg = (!pol->vsync_pol ? ZR060_VPR_VSPol : 0)
 	    | (!pol->hsync_pol ? ZR060_VPR_HSPol : 0)
 	    | (pol->field_pol ? ZR060_VPR_FIPol : 0)
@@ -725,7 +625,8 @@ zr36060_set_video (struct videocodec   *codec,
 	 * ratio 1:2. Setting low_bitrate (insmod option) sets
 	 * it to 1:4 (instead of 1:2, zr36060 max) as limit because the
 	 * buz can't handle more at decimation=1... Use low_bitrate if
-	 * you have a Buz, unless you know what you're doing */
+	 * you have a Buz, unless you know what you're doing
+	 */
 	size = size * cap->quality / (low_bitrate ? 400 : 200);
 	/* Lower limit (arbitrary, 1 KB) */
 	if (size < 8192)
@@ -738,7 +639,8 @@ zr36060_set_video (struct videocodec   *codec,
 
 	/* the MBCVR is the *maximum* block volume, according to the
 	 * JPEG ISO specs, this shouldn't be used, since that allows
-	 * for the best encoding quality. So set it to it's max value */
+	 * for the best encoding quality. So set it to it's max value
+	 */
 	reg = ptr->max_block_vol;
 	zr36060_write(ptr, ZR060_MBCVR, reg);
 
@@ -746,14 +648,10 @@ zr36060_set_video (struct videocodec   *codec,
 }
 
 /* additional control functions */
-static int
-zr36060_control (struct videocodec *codec,
-		 int                type,
-		 int                size,
-		 void              *data)
+static int zr36060_control(struct videocodec *codec, int type, int size, void *data)
 {
-	struct zr36060 *ptr = (struct zr36060 *) codec->data;
-	int *ival = (int *) data;
+	struct zr36060 *ptr = (struct zr36060 *)codec->data;
+	int *ival = (int *)data;
 
 	dprintk(2, "%s: control %d call with %d byte\n", ptr->name, type,
 		size);
@@ -862,21 +760,18 @@ zr36060_control (struct videocodec *codec,
 }
 
 /* =========================================================================
-   Exit and unregister function:
-
-   Deinitializes Zoran's JPEG processor
-   ========================================================================= */
-
-static int
-zr36060_unset (struct videocodec *codec)
+ * Exit and unregister function:
+ * Deinitializes Zoran's JPEG processor
+ * =========================================================================
+ */
+static int zr36060_unset(struct videocodec *codec)
 {
 	struct zr36060 *ptr = codec->data;
 
 	if (ptr) {
 		/* do wee need some codec deinit here, too ???? */
 
-		dprintk(1, "%s: finished codec #%d\n", ptr->name,
-			ptr->num);
+		dprintk(1, "%s: finished codec #%d\n", ptr->name, ptr->num);
 		kfree(ptr);
 		codec->data = NULL;
 
@@ -888,22 +783,18 @@ zr36060_unset (struct videocodec *codec)
 }
 
 /* =========================================================================
-   Setup and registry function:
-
-   Initializes Zoran's JPEG processor
-
-   Also sets pixel size, average code size, mode (compr./decompr.)
-   (the given size is determined by the processor with the video interface)
-   ========================================================================= */
-
-static int
-zr36060_setup (struct videocodec *codec)
+ * Setup and registry function:
+ * Initializes Zoran's JPEG processor
+ * Also sets pixel size, average code size, mode (compr./decompr.)
+ * (the given size is determined by the processor with the video interface)
+ * =========================================================================
+ */
+static int zr36060_setup(struct videocodec *codec)
 {
 	struct zr36060 *ptr;
 	int res;
 
-	dprintk(2, "zr36060: initializing MJPEG subsystem #%d.\n",
-		zr36060_codecs);
+	dprintk(2, "zr36060: initializing MJPEG subsystem #%d.\n", zr36060_codecs);
 
 	if (zr36060_codecs == MAX_CODECS) {
 		dprintk(1,
@@ -911,14 +802,11 @@ zr36060_setup (struct videocodec *codec)
 		return -ENOSPC;
 	}
 	//mem structure init
-	codec->data = ptr = kzalloc(sizeof(struct zr36060), GFP_KERNEL);
-	if (NULL == ptr) {
-		dprintk(1, KERN_ERR "zr36060: Can't get enough memory!\n");
+	codec->data = ptr = kzalloc(sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
 		return -ENOMEM;
-	}
 
-	snprintf(ptr->name, sizeof(ptr->name), "zr36060[%d]",
-		 zr36060_codecs);
+	snprintf(ptr->name, sizeof(ptr->name), "zr36060[%d]", zr36060_codecs);
 	ptr->num = zr36060_codecs++;
 	ptr->codec = codec;
 
@@ -932,8 +820,7 @@ zr36060_setup (struct videocodec *codec)
 	memcpy(ptr->h_samp_ratio, zr36060_decimation_h, 8);
 	memcpy(ptr->v_samp_ratio, zr36060_decimation_v, 8);
 
-	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag
-				 * (what is the difference?) */
+	ptr->bitrate_ctrl = 0;	/* 0 or 1 - fixed file size flag (what is the difference?) */
 	ptr->mode = CODEC_DO_COMPRESSION;
 	ptr->width = 384;
 	ptr->height = 288;
@@ -950,8 +837,7 @@ zr36060_setup (struct videocodec *codec)
 
 	zr36060_init(ptr);
 
-	dprintk(1, KERN_INFO "%s: codec attached and running\n",
-		ptr->name);
+	dprintk(1, KERN_INFO "%s: codec attached and running\n", ptr->name);
 
 	return 0;
 }
@@ -972,20 +858,13 @@ static const struct videocodec zr36060_codec = {
 	// others are not used
 };
 
-/* =========================================================================
-   HOOK IN DRIVER AS KERNEL MODULE
-   ========================================================================= */
-
-static int __init
-zr36060_init_module (void)
+static int __init zr36060_init_module(void)
 {
-	//dprintk(1, "zr36060 driver %s\n",ZR060_VERSION);
 	zr36060_codecs = 0;
 	return videocodec_register(&zr36060_codec);
 }
 
-static void __exit
-zr36060_cleanup_module (void)
+static void __exit zr36060_cleanup_module(void)
 {
 	if (zr36060_codecs) {
 		dprintk(1,
@@ -1001,6 +880,5 @@ module_init(zr36060_init_module);
 module_exit(zr36060_cleanup_module);
 
 MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@skynet.be>");
-MODULE_DESCRIPTION("Driver module for ZR36060 jpeg processors "
-		   ZR060_VERSION);
+MODULE_DESCRIPTION("Driver module for ZR36060 jpeg processors " ZR060_VERSION);
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/media/zoran/zr36060.h b/drivers/staging/media/zoran/zr36060.h
index 82911757ba78..9289a9921c03 100644
--- a/drivers/staging/media/zoran/zr36060.h
+++ b/drivers/staging/media/zoran/zr36060.h
@@ -1,23 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  * Zoran ZR36060 basic configuration functions - header file
  *
  * Copyright (C) 2002 Laurent Pinchart <laurent.pinchart@skynet.be>
- *
- * $Id: zr36060.h,v 1.1.1.1.2.3 2003/01/14 21:18:47 rbultje Exp $
- *
- * ------------------------------------------------------------------------
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * ------------------------------------------------------------------------
  */
 
 #ifndef ZR36060_H
@@ -86,10 +71,10 @@ struct zr36060 {
 #define ZR060_ACT_MH			0x01b
 #define ZR060_ACT_ML			0x01c
 #define ZR060_ACT_LO			0x01d
-#define ZR060_ACV_TRUN_HI		0x01e
-#define ZR060_ACV_TRUN_MH		0x01f
-#define ZR060_ACV_TRUN_ML		0x020
-#define ZR060_ACV_TRUN_LO		0x021
+#define ZR060_ACV_TURN_HI		0x01e
+#define ZR060_ACV_TURN_MH		0x01f
+#define ZR060_ACV_TURN_ML		0x020
+#define ZR060_ACV_TURN_LO		0x021
 #define ZR060_IDR_DEV			0x022
 #define ZR060_IDR_REV			0x023
 #define ZR060_TCR_HI			0x024
@@ -139,78 +124,78 @@ struct zr36060 {
 
 /* ZR36060 LOAD register bits */
 
-#define ZR060_LOAD_Load			(1 << 7)
-#define ZR060_LOAD_SyncRst		(1 << 0)
+#define ZR060_LOAD_Load			 BIT(7)
+#define ZR060_LOAD_SyncRst		 BIT(0)
 
 /* ZR36060 Code FIFO Status register bits */
 
-#define ZR060_CFSR_Busy			(1 << 7)
-#define ZR060_CFSR_CBusy		(1 << 2)
+#define ZR060_CFSR_Busy			 BIT(7)
+#define ZR060_CFSR_CBusy		 BIT(2)
 #define ZR060_CFSR_CFIFO		(3 << 0)
 
 /* ZR36060 Code Interface register */
 
-#define ZR060_CIR_Code16		(1 << 7)
-#define ZR060_CIR_Endian		(1 << 6)
-#define ZR060_CIR_CFIS			(1 << 2)
-#define ZR060_CIR_CodeMstr		(1 << 0)
+#define ZR060_CIR_Code16		 BIT(7)
+#define ZR060_CIR_Endian		 BIT(6)
+#define ZR060_CIR_CFIS			 BIT(2)
+#define ZR060_CIR_CodeMstr		 BIT(0)
 
 /* ZR36060 Codec Mode register */
 
-#define ZR060_CMR_Comp			(1 << 7)
-#define ZR060_CMR_ATP			(1 << 6)
-#define ZR060_CMR_Pass2			(1 << 5)
-#define ZR060_CMR_TLM			(1 << 4)
-#define ZR060_CMR_BRB			(1 << 2)
-#define ZR060_CMR_FSF			(1 << 1)
+#define ZR060_CMR_Comp			 BIT(7)
+#define ZR060_CMR_ATP			 BIT(6)
+#define ZR060_CMR_Pass2			 BIT(5)
+#define ZR060_CMR_TLM			 BIT(4)
+#define ZR060_CMR_BRB			 BIT(2)
+#define ZR060_CMR_FSF			 BIT(1)
 
 /* ZR36060 Markers Enable register */
 
-#define ZR060_MER_App			(1 << 7)
-#define ZR060_MER_Com			(1 << 6)
-#define ZR060_MER_DRI			(1 << 5)
-#define ZR060_MER_DQT			(1 << 4)
-#define ZR060_MER_DHT			(1 << 3)
+#define ZR060_MER_App			 BIT(7)
+#define ZR060_MER_Com			 BIT(6)
+#define ZR060_MER_DRI			 BIT(5)
+#define ZR060_MER_DQT			 BIT(4)
+#define ZR060_MER_DHT			 BIT(3)
 
 /* ZR36060 Interrupt Mask register */
 
-#define ZR060_IMR_EOAV			(1 << 3)
-#define ZR060_IMR_EOI			(1 << 2)
-#define ZR060_IMR_End			(1 << 1)
-#define ZR060_IMR_DataErr		(1 << 0)
+#define ZR060_IMR_EOAV			 BIT(3)
+#define ZR060_IMR_EOI			 BIT(2)
+#define ZR060_IMR_End			 BIT(1)
+#define ZR060_IMR_DataErr		 BIT(0)
 
 /* ZR36060 Interrupt Status register */
 
 #define ZR060_ISR_ProCnt		(3 << 6)
-#define ZR060_ISR_EOAV			(1 << 3)
-#define ZR060_ISR_EOI			(1 << 2)
-#define ZR060_ISR_End			(1 << 1)
-#define ZR060_ISR_DataErr		(1 << 0)
+#define ZR060_ISR_EOAV			 BIT(3)
+#define ZR060_ISR_EOI			 BIT(2)
+#define ZR060_ISR_End			 BIT(1)
+#define ZR060_ISR_DataErr		 BIT(0)
 
 /* ZR36060 Video Control register */
 
-#define ZR060_VCR_Video8		(1 << 7)
-#define ZR060_VCR_Range			(1 << 6)
-#define ZR060_VCR_FIDet			(1 << 3)
-#define ZR060_VCR_FIVedge		(1 << 2)
-#define ZR060_VCR_FIExt			(1 << 1)
-#define ZR060_VCR_SyncMstr		(1 << 0)
+#define ZR060_VCR_Video8		 BIT(7)
+#define ZR060_VCR_Range			 BIT(6)
+#define ZR060_VCR_FIDet			 BIT(3)
+#define ZR060_VCR_FIVedge		 BIT(2)
+#define ZR060_VCR_FIExt			 BIT(1)
+#define ZR060_VCR_SyncMstr		 BIT(0)
 
 /* ZR36060 Video Polarity register */
 
-#define ZR060_VPR_VCLKPol		(1 << 7)
-#define ZR060_VPR_PValPol		(1 << 6)
-#define ZR060_VPR_PoePol		(1 << 5)
-#define ZR060_VPR_SImgPol		(1 << 4)
-#define ZR060_VPR_BLPol			(1 << 3)
-#define ZR060_VPR_FIPol			(1 << 2)
-#define ZR060_VPR_HSPol			(1 << 1)
-#define ZR060_VPR_VSPol			(1 << 0)
+#define ZR060_VPR_VCLKPol		 BIT(7)
+#define ZR060_VPR_PValPol		 BIT(6)
+#define ZR060_VPR_PoePol		 BIT(5)
+#define ZR060_VPR_SImgPol		 BIT(4)
+#define ZR060_VPR_BLPol			 BIT(3)
+#define ZR060_VPR_FIPol			 BIT(2)
+#define ZR060_VPR_HSPol			 BIT(1)
+#define ZR060_VPR_VSPol			 BIT(0)
 
 /* ZR36060 Scaling register */
 
-#define ZR060_SR_VScale			(1 << 2)
-#define ZR060_SR_HScale2		(1 << 0)
+#define ZR060_SR_VScale			 BIT(2)
+#define ZR060_SR_HScale2		 BIT(0)
 #define ZR060_SR_HScale4		(2 << 0)
 
 #endif				/*fndef ZR36060_H */
-- 
2.26.2

