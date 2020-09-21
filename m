Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1CC82720B7
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIUKY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgIUKUm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:20:42 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF95AC0613D2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:41 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q9so11566147wmj.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WRTqzJJg+xeFyFfTXb9h4oMkZlErrKKNyHHvPxytCac=;
        b=RzKgSVZTveGcrrBbh8a6VsUhN0pP15oopH+ApSNB4qnhDAHzNnhZKNFvaMQntZGQoS
         o1c3O0Rr8gtG/Vh3IXzjwF/LnR6UyHUdPFRTrdDH4X7cyIFAu4ACBaUaiU6NJg7UC4w4
         Ofc5dMYaIwXsk9HkT0K7fCGn3I/RGbH46THQ1IG1VhxDnaDLY4HBqqV12mh/+03+kVLY
         /XiV4ZL8Iq9GR7Xe3iuiLmZekW9Fqcw0tZuVV5gWhRC0RyIX+9zBVV/VZh4X/RJzzMf4
         V26VOvHITXLuQ3dOjC1ziJjeHGnPfAZLjnLLW0wrlIY/Btp8GIhMGB9eYwqR8jOPq8BE
         kD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WRTqzJJg+xeFyFfTXb9h4oMkZlErrKKNyHHvPxytCac=;
        b=WDcQMn/LOKMtYejjV2PdJf+SSkV7kqwQ+ri1nvY+QnUOETwJzx7KCYS/Mwxnn5Kz2n
         /nv/8ymbFeQNbB8TVbmB/s9d0Zydcf/g6TR/EjJzxorXkZ8wksen4Q54N4WSxphhkteb
         UTErmcOfqDNk2dLGtBCuy1Sv50yzVi1twG3c8XpTUQ57EntLVpuUX9rE/KtGC7jltKWq
         y9s8klSkDzhb0MJox6gWDMy3mZ1n5u7rNVhQQjWX1u7qdRAa6ilElzFB8ocHrg1wIIxZ
         TT3jQZ3KoJ9qWAF3tCz/PJ/+wwmpJw8MfkPs9kf0Oc6Rk0I3bRF1lKwvA5qYcuW9k+co
         OCEg==
X-Gm-Message-State: AOAM531FqbtccKRYw4LP8Gyc0P89Apd4oKs0FR26+9bw4QFlhXz09eJC
        xHO/WtyfQHdWHdgPODCkMQ+/yA==
X-Google-Smtp-Source: ABdhPJwCJZI3UAhS+JWbjghgWyntvCGr+4ArmwyqnRNGZMHH7YOzuyNrfFOi0+FOJEceyEH/QNID/w==
X-Received: by 2002:a7b:ca4a:: with SMTP id m10mr23069041wml.11.1600683640193;
        Mon, 21 Sep 2020 03:20:40 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:39 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 08/49] staging: media: zoran: convert all error dprintk to pci_err/pr_err
Date:   Mon, 21 Sep 2020 10:19:43 +0000
Message-Id: <1600683624-5863-9-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch converts all errors dprintk to pci_err/pr_err.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/videocodec.c   |  39 +--
 drivers/staging/media/zoran/zoran_card.c   |  96 ++----
 drivers/staging/media/zoran/zoran_device.c |  28 +-
 drivers/staging/media/zoran/zoran_driver.c | 334 +++++----------------
 drivers/staging/media/zoran/zoran_procfs.c |   4 +-
 drivers/staging/media/zoran/zr36016.c      |  39 +--
 drivers/staging/media/zoran/zr36050.c      |  10 +-
 drivers/staging/media/zoran/zr36060.c      |  24 +-
 8 files changed, 145 insertions(+), 429 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3a2f0c450a44..28031d3fd757 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -62,7 +62,7 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 	int res;
 
 	if (!master) {
-		dprintk(1, KERN_ERR "videocodec_attach: no data\n");
+		pr_err("%s: no data\n", __func__);
 		return NULL;
 	}
 
@@ -70,9 +70,7 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		master->name, master->flags, master->magic);
 
 	if (!h) {
-		dprintk(1,
-			KERN_ERR
-			"videocodec_attach: no device available\n");
+		pr_err("%s: no device available\n", __func__);
 		return NULL;
 	}
 
@@ -120,7 +118,7 @@ struct videocodec *videocodec_attach(struct videocodec_master *master)
 		h = h->next;
 	}
 
-	dprintk(1, KERN_ERR "videocodec_attach: no codec found!\n");
+	pr_err("%s: no codec found!\n", __func__);
 	return NULL;
 
  out_module_put:
@@ -138,7 +136,7 @@ int videocodec_detach(struct videocodec *codec)
 	int res;
 
 	if (!codec) {
-		dprintk(1, KERN_ERR "videocodec_detach: no data\n");
+		pr_err("%s: no data\n", __func__);
 		return -EINVAL;
 	}
 
@@ -146,8 +144,7 @@ int videocodec_detach(struct videocodec *codec)
 		codec->name, codec->type, codec->flags, codec->magic);
 
 	if (!h) {
-		dprintk(1,
-			KERN_ERR "videocodec_detach: no device left...\n");
+		pr_err("%s: no device left...\n", __func__);
 		return -ENXIO;
 	}
 
@@ -161,10 +158,7 @@ int videocodec_detach(struct videocodec *codec)
 					dprintk(3, "%s: '%s'\n", __func__, a->codec->name);
 					a->codec->master_data = NULL;
 				} else {
-					dprintk(1,
-						KERN_ERR
-						"videocodec_detach: '%s'\n",
-						a->codec->name);
+					pr_err("%s: '%s'\n", __func__, a->codec->name);
 					a->codec->master_data = NULL;
 				}
 				if (!prev) {
@@ -186,7 +180,7 @@ int videocodec_detach(struct videocodec *codec)
 		h = h->next;
 	}
 
-	dprintk(1, KERN_ERR "videocodec_detach: given codec not found!\n");
+	pr_err("%s: given codec not found!\n", __func__);
 	return -EINVAL;
 }
 EXPORT_SYMBOL(videocodec_detach);
@@ -196,7 +190,7 @@ int videocodec_register(const struct videocodec *codec)
 	struct codec_list *ptr, *h = codeclist_top;
 
 	if (!codec) {
-		dprintk(1, KERN_ERR "videocodec_register: no data!\n");
+		pr_err("%s: no data!\n", __func__);
 		return -EINVAL;
 	}
 
@@ -229,7 +223,7 @@ int videocodec_unregister(const struct videocodec *codec)
 	struct codec_list *prev = NULL, *h = codeclist_top;
 
 	if (!codec) {
-		dprintk(1, KERN_ERR "videocodec_unregister: no data!\n");
+		pr_err("%s: no data!\n", __func__);
 		return -EINVAL;
 	}
 
@@ -238,19 +232,14 @@ int videocodec_unregister(const struct videocodec *codec)
 		codec->name, codec->type, codec->flags, codec->magic);
 
 	if (!h) {
-		dprintk(1,
-			KERN_ERR
-			"videocodec_unregister: no device left...\n");
+		pr_err("%s: no device left...\n", __func__);
 		return -ENXIO;
 	}
 
 	while (h) {
 		if (codec == h->codec) {
 			if (h->attached) {
-				dprintk(1,
-					KERN_ERR
-					"videocodec: '%s' is used\n",
-					h->codec->name);
+				pr_err("videocodec: '%s' is used\n", h->codec->name);
 				return -EBUSY;
 			}
 			dprintk(3, "videocodec: unregister '%s' is ok.\n",
@@ -271,9 +260,7 @@ int videocodec_unregister(const struct videocodec *codec)
 		h = h->next;
 	}
 
-	dprintk(1,
-		KERN_ERR
-		"videocodec_unregister: given codec not found!\n");
+	pr_err("%s: given codec not found!\n", __func__);
 	return -EINVAL;
 }
 EXPORT_SYMBOL(videocodec_unregister);
@@ -322,7 +309,7 @@ static int __init videocodec_init(void)
 #ifdef CONFIG_PROC_FS
 	videocodec_proc_entry = proc_create_single("videocodecs", 0, NULL, proc_videocodecs_show);
 	if (!videocodec_proc_entry)
-		dprintk(1, KERN_ERR "videocodec: can't init procfs.\n");
+		pr_err("videocodec: can't init procfs.\n");
 #endif
 	return 0;
 }
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index fcf58d69de31..006f209c40ea 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -785,18 +785,13 @@ int zoran_check_jpg_settings(struct zoran *zr, struct zoran_jpg_settings *settin
 		}
 
 		if (!try && err0) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - error in params for decimation = 0\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - error in params for decimation = 0\n", __func__);
 			err++;
 		}
 		break;
 	default:
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - decimation = %d, must be 0, 1, 2 or 4\n",
-			ZR_DEVNAME(zr), __func__, settings->decimation);
+		pci_err(zr->pci_dev, "%s - decimation = %d, must be 0, 1, 2 or 4\n",
+			__func__, settings->decimation);
 		err++;
 		break;
 	}
@@ -870,8 +865,7 @@ void zoran_open_init_params(struct zoran *zr)
 	zr->jpg_settings.jpg_comp.jpeg_markers = V4L2_JPEG_MARKER_DHT | V4L2_JPEG_MARKER_DQT;
 	i = zoran_check_jpg_settings(zr, &zr->jpg_settings, 0);
 	if (i)
-		dprintk(1, KERN_ERR "%s: %s internal error\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s internal error\n", __func__);
 
 	clear_interrupt_counters(zr);
 	zr->testing = 0;
@@ -963,10 +957,6 @@ static int zr36057_init(struct zoran *zr)
 	zr->stat_com = kzalloc(BUZ_NUM_STAT_COM * 4, GFP_KERNEL);
 	zr->video_dev = video_device_alloc();
 	if (!zr->stat_com || !zr->video_dev) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - kmalloc (STAT_COM) failed\n",
-			ZR_DEVNAME(zr), __func__);
 		err = -ENOMEM;
 		goto exit_free;
 	}
@@ -1126,8 +1116,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	nr = zoran_num++;
 	if (nr >= BUZ_MAX) {
-		dprintk(1, KERN_ERR "%s: driver limited to %d card(s) maximum\n",
-			ZORAN_NAME, BUZ_MAX);
+		pci_err(pdev, "driver limited to %d card(s) maximum\n", BUZ_MAX);
 		return -ENOENT;
 	}
 
@@ -1166,23 +1155,14 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	/* Use auto-detected card type? */
 	if (card[nr] == -1) {
 		if (zr->revision < 2) {
-			dprintk(1,
-				KERN_ERR
-				"%s: No card type specified, please use the card=X module parameter\n",
-				ZR_DEVNAME(zr));
-			dprintk(1,
-				KERN_ERR
-				"%s: It is not possible to auto-detect ZR36057 based cards\n",
-				ZR_DEVNAME(zr));
+			pci_err(pdev, "No card type specified, please use the card=X module parameter\n");
+			pci_err(pdev, "It is not possible to auto-detect ZR36057 based cards\n");
 			goto zr_unreg;
 		}
 
 		card_num = ent->driver_data;
 		if (card_num >= NUM_CARDS) {
-			dprintk(1,
-				KERN_ERR
-				"%s: Unknown card, try specifying card=X module parameter\n",
-				ZR_DEVNAME(zr));
+			pci_err(pdev, "Unknown card, try specifying card=X module parameter\n");
 			goto zr_unreg;
 		}
 		dprintk(3,
@@ -1192,10 +1172,8 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	} else {
 		card_num = card[nr];
 		if (card_num >= NUM_CARDS || card_num < 0) {
-			dprintk(1,
-				KERN_ERR
-				"%s: User specified card type %d out of range (0 .. %d)\n",
-				ZR_DEVNAME(zr), card_num, NUM_CARDS - 1);
+			pci_err(pdev, "User specified card type %d out of range (0 .. %d)\n",
+				card_num, NUM_CARDS - 1);
 			goto zr_unreg;
 		}
 	}
@@ -1212,8 +1190,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	zr->zr36057_mem = pci_ioremap_bar(zr->pci_dev, 0);
 	if (!zr->zr36057_mem) {
-		dprintk(1, KERN_ERR "%s: %s() - ioremap failed\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(pdev, "%s() - ioremap failed\n", __func__);
 		goto zr_unreg;
 	}
 
@@ -1221,20 +1198,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			     IRQF_SHARED, ZR_DEVNAME(zr), zr);
 	if (result < 0) {
 		if (result == -EINVAL) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - bad irq number or handler\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(pdev, "%s - bad IRQ number or handler\n", __func__);
 		} else if (result == -EBUSY) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - IRQ %d busy, change your PnP config in BIOS\n",
-				ZR_DEVNAME(zr), __func__, zr->pci_dev->irq);
+			pci_err(pdev, "%s - IRQ %d busy, change your PnP config in BIOS\n",
+				__func__, zr->pci_dev->irq);
 		} else {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - can't assign irq, error code %d\n",
-				ZR_DEVNAME(zr), __func__, result);
+			pci_err(pdev, "%s - cannot assign IRQ, error code %d\n", __func__, result);
 		}
 		goto zr_unmap;
 	}
@@ -1254,8 +1223,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	dprintk(2, KERN_INFO "%s: Initializing i2c bus...\n", ZR_DEVNAME(zr));
 
 	if (zoran_register_i2c(zr) < 0) {
-		dprintk(1, KERN_ERR "%s: %s - can't initialize i2c bus\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(pdev, "%s - can't initialize i2c bus\n", __func__);
 		goto zr_free_irq;
 	}
 
@@ -1272,24 +1240,16 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		codec_name = codecid_to_modulename(zr->card.video_codec);
 		if (codec_name) {
 			result = request_module(codec_name);
-			if (result) {
-				dprintk(1,
-					KERN_ERR
-					"%s: failed to load modules %s: %d\n",
-					ZR_DEVNAME(zr), codec_name, result);
-			}
+			if (result)
+				pci_err(pdev, "failed to load modules %s: %d\n", codec_name, result);
 		}
 	}
 	if (zr->card.video_vfe) {
 		vfe_name = codecid_to_modulename(zr->card.video_vfe);
 		if (vfe_name) {
 			result = request_module(vfe_name);
-			if (result < 0) {
-				dprintk(1,
-					KERN_ERR
-					"%s: failed to load modules %s: %d\n",
-					ZR_DEVNAME(zr), vfe_name, result);
-			}
+			if (result < 0)
+				pci_err(pdev, "failed to load modules %s: %d\n", vfe_name, result);
 		}
 	}
 
@@ -1304,13 +1264,11 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			goto zr_unreg_i2c;
 		zr->codec = videocodec_attach(master_codec);
 		if (!zr->codec) {
-			dprintk(1, KERN_ERR "%s: %s - no codec found\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(pdev, "%s - no codec found\n", __func__);
 			goto zr_free_codec;
 		}
 		if (zr->codec->type != zr->card.video_codec) {
-			dprintk(1, KERN_ERR "%s: %s - wrong codec\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(pdev, "%s - wrong codec\n", __func__);
 			goto zr_detach_codec;
 		}
 	}
@@ -1320,13 +1278,11 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			goto zr_detach_codec;
 		zr->vfe = videocodec_attach(master_vfe);
 		if (!zr->vfe) {
-			dprintk(1, KERN_ERR "%s: %s - no VFE found\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(pdev, "%s - no VFE found\n", __func__);
 			goto zr_free_vfe;
 		}
 		if (zr->vfe->type != zr->card.video_vfe) {
-			dprintk(1, KERN_ERR "%s: %s = wrong VFE\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(pdev, "%s = wrong VFE\n", __func__);
 			goto zr_detach_vfe;
 		}
 	}
@@ -1421,9 +1377,7 @@ static int __init zoran_init(void)
 
 	res = pci_register_driver(&zoran_driver);
 	if (res) {
-		dprintk(1,
-			KERN_ERR
-			"%s: Unable to register ZR36057 driver\n", ZORAN_NAME);
+		pr_err("Unable to register ZR36057 driver\n");
 		return res;
 	}
 
diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 0985b16d5a55..d7c85787e9c0 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -315,8 +315,7 @@ static void zr36057_set_vfe(struct zoran *zr, int video_width, int video_height,
 	if (video_width < BUZ_MIN_WIDTH ||
 	    video_height < BUZ_MIN_HEIGHT ||
 	    video_width > Wa || video_height > Ha) {
-		dprintk(1, KERN_ERR "%s: set_vfe: w=%d h=%d not valid\n",
-			ZR_DEVNAME(zr), video_width, video_height);
+		pci_err(zr->pci_dev, "set_vfe: w=%d h=%d not valid\n", video_width, video_height);
 		return;
 	}
 
@@ -451,10 +450,7 @@ void zr36057_overlay(struct zoran *zr, int on)
 		    zr->vbuf_bytesperline;
 		btwrite(reg, ZR36057_VDTR);
 		if (reg & 3)
-			dprintk(1,
-				KERN_ERR
-				"%s: zr36057_overlay() - video_address not aligned\n",
-				ZR_DEVNAME(zr));
+			pci_err(zr->pci_dev, "zr36057_overlay() - video_address not aligned\n");
 		if (zr->overlay_settings.height > BUZ_MAX_HEIGHT / 2)
 			reg += zr->vbuf_bytesperline;
 		btwrite(reg, ZR36057_VDBR);
@@ -466,10 +462,7 @@ void zr36057_overlay(struct zoran *zr, int on)
 		if (zr->overlay_settings.height > BUZ_MAX_HEIGHT / 2)
 			reg += zr->vbuf_bytesperline;
 		if (reg & 3)
-			dprintk(1,
-				KERN_ERR
-				"%s: zr36057_overlay() - video_stride not aligned\n",
-				ZR_DEVNAME(zr));
+			pci_err(zr->pci_dev, "zr36057_overlay() - video_stride not aligned\n");
 		reg = (reg << ZR36057_VSSFGR_DispStride);
 		reg |= ZR36057_VSSFGR_VidOvf;	/* clear overflow status */
 		btwrite(reg, ZR36057_VSSFGR);
@@ -1187,8 +1180,8 @@ static void error_handler(struct zoran *zr, u32 astat, u32 stat)
 		int j;
 
 		frame = zr->jpg_pend[zr->jpg_dma_tail & BUZ_MASK_FRAME];
-		pr_err("%s: JPEG error stat=0x%08x(0x%08x) queue_state=%ld/%ld/%ld/%ld seq=%ld frame=%ld. Codec stopped. ",
-			ZR_DEVNAME(zr), stat, zr->last_isr,
+		pci_err(zr->pci_dev, "JPEG error stat=0x%08x(0x%08x) queue_state=%ld/%ld/%ld/%ld seq=%ld frame=%ld. Codec stopped. ",
+			stat, zr->last_isr,
 			zr->jpg_que_tail, zr->jpg_dma_tail,
 			zr->jpg_dma_head, zr->jpg_que_head,
 			zr->jpg_seq_num, frame);
@@ -1256,10 +1249,8 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 		while ((stat = count_reset_interrupt(zr))) {
 			if (count++ > 100) {
 				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
-				dprintk(1,
-					KERN_ERR
-					"%s: IRQ lockup while testing, isr=0x%08x, cleared int mask\n",
-					ZR_DEVNAME(zr), stat);
+				pci_err(zr->pci_dev, "IRQ lockup while testing, isr=0x%08x, cleared int mask\n",
+					stat);
 				wake_up_interruptible(&zr->test_q);
 			}
 		}
@@ -1419,10 +1410,7 @@ irqreturn_t zoran_irq(int irq, void *dev_id)
 				ZR_DEVNAME(zr), count);
 			if (count > 20) {
 				btand(~ZR36057_ICR_IntPinEn, ZR36057_ICR);
-				dprintk(2,
-					KERN_ERR
-					"%s: IRQ lockup, cleared int mask\n",
-					ZR_DEVNAME(zr));
+				pci_err(zr->pci_dev, "IRQ lockup, cleared int mask\n");
 				break;
 			}
 		}
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index cd8198183e6a..4082d5e53a24 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -218,10 +218,7 @@ static int v4l_fbuffer_alloc(struct zoran_fh *fh)
 		//udelay(20);
 		mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL | __GFP_NOWARN);
 		if (!mem) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - kmalloc for V4L buf %d failed\n",
-				ZR_DEVNAME(zr), __func__, i);
+			pci_err(zr->pci_dev, "%s - kmalloc for V4L buf %d failed\n", __func__, i);
 			v4l_fbuffer_free(fh);
 			return -ENOBUFS;
 		}
@@ -312,10 +309,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 
 		mem = (void *)get_zeroed_page(GFP_KERNEL);
 		if (!mem) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - get_zeroed_page (frag_tab) failed for buffer %d\n",
-				ZR_DEVNAME(zr), __func__, i);
+			pci_err(zr->pci_dev, "%s - get_zeroed_page (frag_tab) failed for buffer %d\n", __func__, i);
 			jpg_fbuffer_free(fh);
 			return -ENOBUFS;
 		}
@@ -325,10 +319,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 		if (fh->buffers.need_contiguous) {
 			mem = kmalloc(fh->buffers.buffer_size, GFP_KERNEL);
 			if (!mem) {
-				dprintk(1,
-					KERN_ERR
-					"%s: %s - kmalloc failed for buffer %d\n",
-					ZR_DEVNAME(zr), __func__, i);
+				pci_err(zr->pci_dev, "%s - kmalloc failed for buffer %d\n", __func__, i);
 				jpg_fbuffer_free(fh);
 				return -ENOBUFS;
 			}
@@ -343,10 +334,7 @@ static int jpg_fbuffer_alloc(struct zoran_fh *fh)
 			for (j = 0; j < fh->buffers.buffer_size / PAGE_SIZE; j++) {
 				mem = (void *)get_zeroed_page(GFP_KERNEL);
 				if (!mem) {
-					dprintk(1,
-						KERN_ERR
-						"%s: %s - get_zeroed_page failed for buffer %d\n",
-						ZR_DEVNAME(zr), __func__, i);
+					pci_err(zr->pci_dev, "%s - get_zeroed_page failed for buffer %d\n", __func__, i);
 					jpg_fbuffer_free(fh);
 					return -ENOBUFS;
 				}
@@ -433,10 +421,7 @@ static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
 
 	if (height < BUZ_MIN_HEIGHT || width < BUZ_MIN_WIDTH ||
 	    height > BUZ_MAX_HEIGHT || width > BUZ_MAX_WIDTH) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - wrong frame size (%dx%d)\n",
-			ZR_DEVNAME(zr), __func__, width, height);
+		pci_err(zr->pci_dev, "%s - wrong frame size (%dx%d)\n", __func__, width, height);
 		return -EINVAL;
 	}
 
@@ -444,20 +429,15 @@ static int zoran_v4l_set_format(struct zoran_fh *fh, int width, int height,
 
 	/* Check against available buffer size */
 	if (height * width * bpp > fh->buffers.buffer_size) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - video buffer size (%d kB) is too small\n",
-			ZR_DEVNAME(zr), __func__, fh->buffers.buffer_size >> 10);
+		pci_err(zr->pci_dev, "%s - video buffer size (%d kB) is too small\n",
+			__func__, fh->buffers.buffer_size >> 10);
 		return -EINVAL;
 	}
 
 	/* The video front end needs 4-byte alinged line sizes */
 
 	if ((bpp == 2 && (width & 1)) || (bpp == 3 && (width & 3))) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - wrong frame alignment\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - wrong frame alignment\n", __func__);
 		return -EINVAL;
 	}
 
@@ -476,19 +456,13 @@ static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
 	int res = 0;
 
 	if (!fh->buffers.allocated) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - buffers not yet allocated\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - buffers not yet allocated\n", __func__);
 		res = -ENOMEM;
 	}
 
 	/* No grabbing outside the buffer range! */
 	if (num >= fh->buffers.num_buffers || num < 0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - buffer %d is out of range\n",
-			ZR_DEVNAME(zr), __func__, num);
+		pci_err(zr->pci_dev, "%s - buffer %d is out of range\n", __func__, num);
 		res = -EINVAL;
 	}
 
@@ -499,10 +473,7 @@ static int zoran_v4l_queue_frame(struct zoran_fh *fh, int num)
 			zr->v4l_buffers = fh->buffers;
 			fh->buffers.active = ZORAN_ACTIVE;
 		} else {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - another session is already capturing\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - another session is already capturing\n", __func__);
 			res = -EBUSY;
 		}
 	}
@@ -555,27 +526,19 @@ static int v4l_sync(struct zoran_fh *fh, int frame)
 	unsigned long flags;
 
 	if (fh->buffers.active == ZORAN_FREE) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - no grab active for this session\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - no grab active for this session\n", __func__);
 		return -EINVAL;
 	}
 
 	/* check passed-in frame number */
 	if (frame >= fh->buffers.num_buffers || frame < 0) {
-		dprintk(1,
-			KERN_ERR "%s: %s - frame %d is invalid\n",
-			ZR_DEVNAME(zr), __func__, frame);
+		pci_err(zr->pci_dev, "%s - frame %d is invalid\n", __func__, frame);
 		return -EINVAL;
 	}
 
 	/* Check if is buffer was queued at all */
 	if (zr->v4l_buffers.buffer[frame].state == BUZ_STATE_USER) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - attempt to sync on a buffer which was not queued?\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - attempt to sync on a buffer which was not queued?\n", __func__);
 		return -EPROTO;
 	}
 
@@ -592,9 +555,7 @@ static int v4l_sync(struct zoran_fh *fh, int frame)
 
 	/* buffer should now be in BUZ_STATE_DONE */
 	if (zr->v4l_buffers.buffer[frame].state != BUZ_STATE_DONE)
-		dprintk(2,
-			KERN_ERR "%s: %s - internal state error\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - internal state error\n", __func__);
 
 	zr->v4l_buffers.buffer[frame].state = BUZ_STATE_USER;
 	fh->buffers.buffer[frame] = zr->v4l_buffers.buffer[frame];
@@ -627,19 +588,13 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 
 	/* Check if buffers are allocated */
 	if (!fh->buffers.allocated) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - buffers not yet allocated\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - buffers not yet allocated\n", __func__);
 		return -ENOMEM;
 	}
 
 	/* No grabbing outside the buffer range! */
 	if (num >= fh->buffers.num_buffers || num < 0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - buffer %d out of range\n",
-			ZR_DEVNAME(zr), __func__, num);
+		pci_err(zr->pci_dev, "%s - buffer %d out of range\n", __func__, num);
 		return -EINVAL;
 	}
 
@@ -648,10 +603,7 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 		zr->jpg_settings = fh->jpg_settings;
 	} else if (zr->codec_mode != mode) {
 		/* wrong codec mode active - invalid */
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - codec in wrong mode\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - codec in wrong mode\n", __func__);
 		return -EINVAL;
 	}
 
@@ -660,10 +612,7 @@ static int zoran_jpg_queue_frame(struct zoran_fh *fh, int num,
 			zr->jpg_buffers = fh->buffers;
 			fh->buffers.active = ZORAN_ACTIVE;
 		} else {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - another session is already capturing\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - another session is already capturing\n", __func__);
 			res = -EBUSY;
 		}
 	}
@@ -720,10 +669,7 @@ static int jpg_qbuf(struct zoran_fh *fh, int frame, enum zoran_codec_mode mode)
 	if (frame < 0) {
 		if (zr->codec_mode == mode) {
 			if (fh->buffers.active == ZORAN_FREE) {
-				dprintk(1,
-					KERN_ERR
-					"%s: %s(-1) - session not active\n",
-					ZR_DEVNAME(zr), __func__);
+				pci_err(zr->pci_dev, "%s(-1) - session not active\n", __func__);
 				return -EINVAL;
 			}
 			fh->buffers.active = zr->jpg_buffers.active = ZORAN_FREE;
@@ -731,10 +677,7 @@ static int jpg_qbuf(struct zoran_fh *fh, int frame, enum zoran_codec_mode mode)
 			zr36057_enable_jpg(zr, BUZ_MODE_IDLE);
 			return 0;
 		} else {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - stop streaming but not in streaming mode\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - stop streaming but not in streaming mode\n", __func__);
 			return -EINVAL;
 		}
 	}
@@ -761,18 +704,12 @@ static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
 	int frame;
 
 	if (fh->buffers.active == ZORAN_FREE) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - capture is not currently active\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - capture is not currently active\n", __func__);
 		return -EINVAL;
 	}
 	if (zr->codec_mode != BUZ_MODE_MOTION_DECOMPRESS &&
 	    zr->codec_mode != BUZ_MODE_MOTION_COMPRESS) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - codec not in streaming mode\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - codec not in streaming mode\n", __func__);
 		return -EINVAL;
 	}
 	mutex_unlock(&zr->lock);
@@ -786,10 +723,7 @@ static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
 		udelay(1);
 		zr->codec->control(zr->codec, CODEC_G_STATUS, sizeof(isr), &isr);
 		mutex_lock(&zr->lock);
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - timeout: codec isr=0x%02x\n",
-			ZR_DEVNAME(zr), __func__, isr);
+		pci_err(zr->pci_dev, "%s - timeout: codec isr=0x%02x\n", __func__, isr);
 
 		return -ETIME;
 	}
@@ -806,9 +740,7 @@ static int jpg_sync(struct zoran_fh *fh, struct zoran_sync *bs)
 
 	/* buffer should now be in BUZ_STATE_DONE */
 	if (zr->jpg_buffers.buffer[frame].state != BUZ_STATE_DONE)
-		dprintk(2,
-			KERN_ERR "%s: %s - internal state error\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - internal state error\n", __func__);
 
 	*bs = zr->jpg_buffers.buffer[frame].bs;
 	bs->frame = frame;
@@ -906,8 +838,7 @@ static int zoran_open(struct file *file)
 	mutex_lock(&zr->lock);
 
 	if (zr->user >= 2048) {
-		dprintk(1, KERN_ERR "%s: too many users (%d) on device\n",
-			ZR_DEVNAME(zr), zr->user);
+		pci_err(zr->pci_dev, "too many users (%d) on device\n", zr->user);
 		res = -EBUSY;
 		goto fail_unlock;
 	}
@@ -915,10 +846,6 @@ static int zoran_open(struct file *file)
 	/* now, create the open()-specific file_ops struct */
 	fh = kzalloc(sizeof(*fh), GFP_KERNEL);
 	if (!fh) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - allocation of zoran_fh failed\n",
-			ZR_DEVNAME(zr), __func__);
 		res = -ENOMEM;
 		goto fail_unlock;
 	}
@@ -930,10 +857,6 @@ static int zoran_open(struct file *file)
 	 */
 	fh->overlay_mask = kmalloc(array3_size((768 + 31) / 32, 576, 4), GFP_KERNEL);
 	if (!fh->overlay_mask) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - allocation of overlay_mask failed\n",
-			ZR_DEVNAME(zr), __func__);
 		res = -ENOMEM;
 		goto fail_fh;
 	}
@@ -1066,24 +989,17 @@ static int setup_fbuffer(struct zoran_fh *fh, void *base, const struct zoran_for
 #endif
 
 	if (!(fmt->flags & ZORAN_FORMAT_OVERLAY)) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - no valid overlay format given\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - no valid overlay format given\n", __func__);
 		return -EINVAL;
 	}
 	if (height <= 0 || width <= 0 || bytesperline <= 0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - invalid height/width/bpl value (%d|%d|%d)\n",
-			ZR_DEVNAME(zr), __func__, width, height, bytesperline);
+		pci_err(zr->pci_dev, "%s - invalid height/width/bpl value (%d|%d|%d)\n",
+			__func__, width, height, bytesperline);
 		return -EINVAL;
 	}
 	if (bytesperline & 3) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - bytesperline (%d) must be 4-byte aligned\n",
-			ZR_DEVNAME(zr), __func__, bytesperline);
+		pci_err(zr->pci_dev, "%s - bytesperline (%d) must be 4-byte aligned\n",
+			__func__, bytesperline);
 		return -EINVAL;
 	}
 
@@ -1108,26 +1024,17 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 	int on, end;
 
 	if (!zr->vbuf_base) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - frame buffer has to be set first\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - frame buffer has to be set first\n", __func__);
 		return -EINVAL;
 	}
 
 	if (!fh->overlay_settings.format) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - no overlay format set\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - no overlay format set\n", __func__);
 		return -EINVAL;
 	}
 
 	if (clipcount > 2048) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - invalid clipcount\n",
-			 ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - invalid clipcount\n", __func__);
 		return -EINVAL;
 	}
 
@@ -1155,10 +1062,7 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 	/* Check for invalid parameters */
 	if (width < BUZ_MIN_WIDTH || height < BUZ_MIN_HEIGHT ||
 	    width > BUZ_MAX_WIDTH || height > BUZ_MAX_HEIGHT) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - width = %d or height = %d invalid\n",
-			ZR_DEVNAME(zr), __func__, width, height);
+		pci_err(zr->pci_dev, "%s - width = %d or height = %d invalid\n", __func__, width, height);
 		return -EINVAL;
 	}
 
@@ -1199,10 +1103,6 @@ static int setup_window(struct zoran_fh *fh, int x, int y, int width, int height
 		vcp = vmalloc(array_size(sizeof(struct v4l2_clip),
 					 clipcount + 4));
 		if (!vcp) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - Alloc of clip mask failed\n",
-				ZR_DEVNAME(zr), __func__);
 			return -ENOMEM;
 		}
 		if (copy_from_user
@@ -1238,18 +1138,12 @@ static int setup_overlay(struct zoran_fh *fh, int on)
 	/* check whether we're touching someone else's overlay */
 	if (on && zr->overlay_active != ZORAN_FREE &&
 	    fh->overlay_active == ZORAN_FREE) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - overlay is already active for another session\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - overlay is already active for another session\n", __func__);
 		return -EBUSY;
 	}
 	if (!on && zr->overlay_active != ZORAN_FREE &&
 	    fh->overlay_active == ZORAN_FREE) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - you cannot cancel someone else's session\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - you cannot cancel someone else's session\n", __func__);
 		return -EPERM;
 	}
 
@@ -1265,17 +1159,11 @@ static int setup_overlay(struct zoran_fh *fh, int on)
 		zr->overlay_mask = NULL;
 	} else {
 		if (!zr->vbuf_base || !fh->overlay_settings.is_set) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - buffer or window not set\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - buffer or window not set\n", __func__);
 			return -EINVAL;
 		}
 		if (!fh->overlay_settings.format) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - no overlay format set\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - no overlay format set\n", __func__);
 			return -EINVAL;
 		}
 		zr->overlay_active = fh->overlay_active = ZORAN_LOCKED;
@@ -1308,10 +1196,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		/* check range */
 		if (num < 0 || num >= fh->buffers.num_buffers ||
 		    !fh->buffers.allocated) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - wrong number or buffers not allocated\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - wrong number or buffers not allocated\n", __func__);
 			return -EINVAL;
 		}
 
@@ -1352,10 +1237,7 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 		/* check range */
 		if (num < 0 || num >= fh->buffers.num_buffers ||
 		    !fh->buffers.allocated) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s - wrong number or buffers not allocated\n",
-				ZR_DEVNAME(zr), __func__);
+			pci_err(zr->pci_dev, "%s - wrong number or buffers not allocated\n", __func__);
 			return -EINVAL;
 		}
 
@@ -1387,10 +1269,8 @@ static int zoran_v4l2_buffer_status(struct zoran_fh *fh,
 
 	default:
 
-		dprintk(5,
-			KERN_ERR
-			"%s: %s - invalid buffer type|map_mode (%d|%d)\n",
-			ZR_DEVNAME(zr), __func__, buf->type, fh->map_mode);
+		pci_err(zr->pci_dev, "%s - invalid buffer type|map_mode (%d|%d)\n",
+		       __func__, buf->type, fh->map_mode);
 		return -EINVAL;
 	}
 
@@ -1407,17 +1287,12 @@ static int zoran_set_norm(struct zoran *zr, v4l2_std_id norm)
 
 	if (zr->v4l_buffers.active != ZORAN_FREE ||
 	    zr->jpg_buffers.active != ZORAN_FREE) {
-		dprintk(1,
-			KERN_WARNING
-			"%s: %s called while in playback/capture mode\n",
-			ZR_DEVNAME(zr), __func__);
+		pr_warn("%s: %s called while in playback/capture mode\n", ZR_DEVNAME(zr), __func__);
 		return -EBUSY;
 	}
 
 	if (!(norm & zr->card.norms)) {
-		dprintk(1,
-			KERN_ERR "%s: %s - unsupported norm %llx\n",
-			ZR_DEVNAME(zr), __func__, norm);
+		pci_err(zr->pci_dev, "%s - unsupported norm %llx\n", __func__, norm);
 		return -EINVAL;
 	}
 
@@ -1463,10 +1338,7 @@ static int zoran_set_input(struct zoran *zr, int input)
 	}
 
 	if (input < 0 || input >= zr->card.inputs) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - unsupported input %d\n",
-			ZR_DEVNAME(zr), __func__, input);
+		pci_err(zr->pci_dev, "%s - unsupported input %d\n", __func__, input);
 		return -EINVAL;
 	}
 
@@ -1741,8 +1613,7 @@ static int zoran_s_fmt_vid_out(struct file *file, void *__fh, struct v4l2_format
 		return -EINVAL;
 
 	if (fh->buffers.allocated) {
-		dprintk(1, KERN_ERR "%s: VIDIOC_S_FMT - cannot change capture mode\n",
-			ZR_DEVNAME(zr));
+		pci_err(zr->pci_dev, "VIDIOC_S_FMT - cannot change capture mode\n");
 		res = -EBUSY;
 		return res;
 	}
@@ -1818,15 +1689,14 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *__fh, struct v4l2_format
 		if (fmt->fmt.pix.pixelformat == zoran_formats[i].fourcc)
 			break;
 	if (i == NUM_FORMATS) {
-		dprintk(1, KERN_ERR "%s: VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
-			ZR_DEVNAME(zr), fmt->fmt.pix.pixelformat);
+		pci_err(zr->pci_dev, "VIDIOC_S_FMT - unknown/unsupported format 0x%x\n",
+			fmt->fmt.pix.pixelformat);
 		return -EINVAL;
 	}
 
 	if ((fh->map_mode != ZORAN_MAP_MODE_RAW && fh->buffers.allocated) ||
 	    fh->buffers.active != ZORAN_FREE) {
-		dprintk(1, KERN_ERR "%s: VIDIOC_S_FMT - cannot change capture mode\n",
-			ZR_DEVNAME(zr));
+		pci_err(zr->pci_dev, "VIDIOC_S_FMT - cannot change capture mode\n");
 		res = -EBUSY;
 		return res;
 	}
@@ -1884,8 +1754,8 @@ static int zoran_s_fbuf(struct file *file, void *__fh,
 		if (zoran_formats[i].fourcc == fb->fmt.pixelformat)
 			break;
 	if (i == NUM_FORMATS) {
-		dprintk(1, KERN_ERR "%s: VIDIOC_S_FBUF - format=0x%x (%4.4s) not allowed\n",
-			ZR_DEVNAME(zr), fb->fmt.pixelformat,
+		pci_err(zr->pci_dev, "VIDIOC_S_FBUF - format=0x%x (%4.4s) not allowed\n",
+			fb->fmt.pixelformat,
 			(char *)&printformat);
 		return -EINVAL;
 	}
@@ -1912,10 +1782,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 	int res = 0;
 
 	if (req->memory != V4L2_MEMORY_MMAP) {
-		dprintk(2,
-			KERN_ERR
-				"%s: only MEMORY_MMAP capture is supported, not %d\n",
-				ZR_DEVNAME(zr), req->memory);
+		pci_err(zr->pci_dev, "only MEMORY_MMAP capture is supported, not %d\n", req->memory);
 		return -EINVAL;
 	}
 
@@ -1923,10 +1790,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 		return zoran_streamoff(file, fh, req->type);
 
 	if (fh->buffers.allocated) {
-		dprintk(2,
-			KERN_ERR
-				"%s: VIDIOC_REQBUFS - buffers already allocated\n",
-				ZR_DEVNAME(zr));
+		pr_warn("%s: VIDIOC_REQBUFS - buffers already allocated\n", ZR_DEVNAME(zr));
 		res = -EBUSY;
 		return res;
 	}
@@ -1965,10 +1829,7 @@ static int zoran_reqbufs(struct file *file, void *__fh, struct v4l2_requestbuffe
 			return res;
 		}
 	} else {
-		dprintk(1,
-			KERN_ERR
-				"%s: VIDIOC_REQBUFS - unknown type %d\n",
-				ZR_DEVNAME(zr), req->type);
+		pci_err(zr->pci_dev, "VIDIOC_REQBUFS - unknown type %d\n", req->type);
 		res = -EINVAL;
 		return res;
 	}
@@ -1991,9 +1852,8 @@ static int zoran_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 	switch (fh->map_mode) {
 	case ZORAN_MAP_MODE_RAW:
 		if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-			dprintk(1, KERN_ERR
-				"%s: VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				ZR_DEVNAME(zr), buf->type, fh->map_mode);
+			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
+				buf->type, fh->map_mode);
 			res = -EINVAL;
 			return res;
 		}
@@ -2016,9 +1876,8 @@ static int zoran_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 		}
 
 		if (buf->type != buf_type) {
-			dprintk(1, KERN_ERR
-				"%s: VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				ZR_DEVNAME(zr), buf->type, fh->map_mode);
+			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
+				buf->type, fh->map_mode);
 			res = -EINVAL;
 			return res;
 		}
@@ -2033,9 +1892,7 @@ static int zoran_qbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 		break;
 
 	default:
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_QBUF - unsupported type %d\n",
-			ZR_DEVNAME(zr), buf->type);
+		pci_err(zr->pci_dev, "VIDIOC_QBUF - unsupported type %d\n", buf->type);
 		res = -EINVAL;
 		break;
 	}
@@ -2051,9 +1908,8 @@ static int zoran_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 	switch (fh->map_mode) {
 	case ZORAN_MAP_MODE_RAW:
 		if (buf->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-			dprintk(1, KERN_ERR
-				"%s: VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				ZR_DEVNAME(zr), buf->type, fh->map_mode);
+			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
+				buf->type, fh->map_mode);
 			res = -EINVAL;
 			return res;
 		}
@@ -2082,9 +1938,8 @@ static int zoran_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 			buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 
 		if (buf->type != buf_type) {
-			dprintk(1, KERN_ERR
-				"%s: VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
-				ZR_DEVNAME(zr), buf->type, fh->map_mode);
+			pci_err(zr->pci_dev, "VIDIOC_QBUF - invalid buf->type=%d for map_mode=%d\n",
+				buf->type, fh->map_mode);
 			res = -EINVAL;
 			return res;
 		}
@@ -2105,9 +1960,7 @@ static int zoran_dqbuf(struct file *file, void *__fh, struct v4l2_buffer *buf)
 	}
 
 	default:
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_DQBUF - unsupported type %d\n",
-			ZR_DEVNAME(zr), buf->type);
+		pci_err(zr->pci_dev, "VIDIOC_DQBUF - unsupported type %d\n", buf->type);
 		res = -EINVAL;
 		break;
 	}
@@ -2156,10 +2009,7 @@ static int zoran_streamon(struct file *file, void *__fh, enum v4l2_buf_type type
 		break;
 
 	default:
-		dprintk(1,
-			KERN_ERR
-			"%s: VIDIOC_STREAMON - invalid map mode %d\n",
-			ZR_DEVNAME(zr), fh->map_mode);
+		pci_err(zr->pci_dev, "VIDIOC_STREAMON - invalid map mode %d\n", fh->map_mode);
 		res = -EINVAL;
 		break;
 	}
@@ -2220,9 +2070,7 @@ static int zoran_streamoff(struct file *file, void *__fh, enum v4l2_buf_type typ
 			return res;
 		break;
 	default:
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_STREAMOFF - invalid map mode %d\n",
-			ZR_DEVNAME(zr), fh->map_mode);
+		pci_err(zr->pci_dev, "VIDIOC_STREAMOFF - invalid map mode %d\n", fh->map_mode);
 		res = -EINVAL;
 		break;
 	}
@@ -2333,9 +2181,7 @@ static int zoran_g_selection(struct file *file, void *__fh, struct v4l2_selectio
 		return -EINVAL;
 
 	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_G_SELECTION - subcapture only supported for compressed capture\n",
-			ZR_DEVNAME(zr));
+		pci_err(zr->pci_dev, "VIDIOC_G_SELECTION - subcapture only supported for compressed capture\n");
 		return -EINVAL;
 	}
 
@@ -2377,18 +2223,14 @@ static int zoran_s_selection(struct file *file, void *__fh, struct v4l2_selectio
 		return -EINVAL;
 
 	if (fh->map_mode == ZORAN_MAP_MODE_RAW) {
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_S_SELECTION - subcapture only supported for compressed capture\n",
-			ZR_DEVNAME(zr));
+		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - subcapture only supported for compressed capture\n");
 		return -EINVAL;
 	}
 
 	settings = fh->jpg_settings;
 
 	if (fh->buffers.allocated) {
-		dprintk(1, KERN_ERR
-			"%s: VIDIOC_S_SELECTION - cannot change settings while active\n",
-			ZR_DEVNAME(zr));
+		pci_err(zr->pci_dev, "VIDIOC_S_SELECTION - cannot change settings while active\n");
 		return -EBUSY;
 	}
 
@@ -2523,10 +2365,7 @@ static __poll_t zoran_poll(struct file *file, poll_table  *wait)
 		break;
 
 	default:
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - internal error, unknown map_mode=%d\n",
-			ZR_DEVNAME(zr), __func__, fh->map_mode);
+		pci_err(zr->pci_dev, "%s - internal error, unknown map_mode=%d\n", __func__, fh->map_mode);
 		res |= EPOLLERR;
 	}
 
@@ -2622,18 +2461,12 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 
 	if (!(vma->vm_flags & VM_SHARED) || !(vma->vm_flags & VM_READ) ||
 	    !(vma->vm_flags & VM_WRITE)) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s - no MAP_SHARED/PROT_{READ,WRITE} given\n",
-			ZR_DEVNAME(zr), __func__);
+		pci_err(zr->pci_dev, "%s - no MAP_SHARED/PROT_{READ,WRITE} given\n", __func__);
 		return -EINVAL;
 	}
 
 	if (!fh->buffers.allocated) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s(%s) - buffers not yet allocated\n",
-			ZR_DEVNAME(zr), __func__, mode_name(fh->map_mode));
+		pci_err(zr->pci_dev, "%s(%s) - buffers not yet allocated\n", __func__, mode_name(fh->map_mode));
 		res = -ENOMEM;
 		return res;
 	}
@@ -2644,10 +2477,8 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	    size % fh->buffers.buffer_size != 0 || first < 0 ||
 	    last < 0 || first >= fh->buffers.num_buffers ||
 	    last >= fh->buffers.buffer_size) {
-		dprintk(1,
-			KERN_ERR
-			"%s: %s(%s) - offset=%lu or size=%lu invalid for bufsize=%d and numbufs=%d\n",
-			ZR_DEVNAME(zr), __func__, mode_name(fh->map_mode), offset, size,
+		pci_err(zr->pci_dev, "%s(%s) - offset=%lu or size=%lu invalid for bufsize=%d and numbufs=%d\n",
+			__func__, mode_name(fh->map_mode), offset, size,
 			fh->buffers.buffer_size,
 			fh->buffers.num_buffers);
 		res = -EINVAL;
@@ -2657,10 +2488,7 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 	/* Check if any buffers are already mapped */
 	for (i = first; i <= last; i++) {
 		if (fh->buffers.buffer[i].map) {
-			dprintk(1,
-				KERN_ERR
-				"%s: %s(%s) - buffer %d already mapped\n",
-				ZR_DEVNAME(zr), __func__, mode_name(fh->map_mode), i);
+			pci_err(zr->pci_dev, "%s(%s) - buffer %d already mapped\n", __func__, mode_name(fh->map_mode), i);
 			res = -EBUSY;
 			return res;
 		}
@@ -2687,10 +2515,7 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 			page = fh->buffers.buffer[i].v4l.fbuffer_phys;
 			if (remap_pfn_range(vma, start, page >> PAGE_SHIFT,
 					    todo, PAGE_SHARED)) {
-				dprintk(1,
-					KERN_ERR
-					"%s: %s(V4L) - remap_pfn_range failed\n",
-					ZR_DEVNAME(zr), __func__);
+				pci_err(zr->pci_dev, "%s(V4L) - remap_pfn_range failed\n", __func__);
 				res = -EAGAIN;
 				return res;
 			}
@@ -2719,10 +2544,7 @@ static int zoran_mmap(struct file *file, struct vm_area_struct *vma)
 								>> PAGE_SHIFT;
 				if (remap_pfn_range(vma, start, page,
 						    todo, PAGE_SHARED)) {
-					dprintk(1,
-						KERN_ERR
-						"%s: %s(V4L) - remap_pfn_range failed\n",
-						ZR_DEVNAME(zr), __func__);
+					pci_err(zr->pci_dev, "%s(V4L) - remap_pfn_range failed\n", __func__);
 					res = -EAGAIN;
 					return res;
 				}
diff --git a/drivers/staging/media/zoran/zoran_procfs.c b/drivers/staging/media/zoran/zoran_procfs.c
index 13367e6f6620..98f9e0103d83 100644
--- a/drivers/staging/media/zoran/zoran_procfs.c
+++ b/drivers/staging/media/zoran/zoran_procfs.c
@@ -26,6 +26,7 @@
 #include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/printk.h>
 #include <linux/vmalloc.h>
 
 #include <linux/proc_fs.h>
@@ -192,8 +193,7 @@ int zoran_proc_init(struct zoran *zr)
 			"%s: procfs entry /proc/%s allocated. data=%p\n",
 			ZR_DEVNAME(zr), name, zr);
 	} else {
-		dprintk(1, KERN_ERR "%s: Unable to initialise /proc/%s\n",
-			ZR_DEVNAME(zr), name);
+		pr_err("%s: Unable to initialise /proc/%s\n", ZR_DEVNAME(zr), name);
 		return 1;
 	}
 #endif
diff --git a/drivers/staging/media/zoran/zr36016.c b/drivers/staging/media/zoran/zr36016.c
index 3219b63d6f72..a8190005bc4d 100644
--- a/drivers/staging/media/zoran/zr36016.c
+++ b/drivers/staging/media/zoran/zr36016.c
@@ -48,9 +48,7 @@ static u8 zr36016_read(struct zr36016 *ptr, u16 reg)
 	if (ptr->codec->master_data->readreg)
 		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xFF;
 	else
-		dprintk(1,
-			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing read!\n", ptr->name);
 
 	dprintk(4, "%s: reading from 0x%04x: %02x\n", ptr->name, reg, value);
 
@@ -65,10 +63,7 @@ static void zr36016_write(struct zr36016 *ptr, u16 reg, u8 value)
 	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
 	else
-		dprintk(1,
-			KERN_ERR
-			"%s: invalid I/O setup, nothing written!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing written!\n", ptr->name);
 }
 
 /* indirect read and write functions */
@@ -83,10 +78,7 @@ static u8 zr36016_readi(struct zr36016 *ptr, u16 reg)
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
 		value = (ptr->codec->master_data->readreg(ptr->codec, ZR016_IDATA)) & 0xFF;	// DATA
 	} else {
-		dprintk(1,
-			KERN_ERR
-			"%s: invalid I/O setup, nothing read (i)!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing read (i)!\n", ptr->name);
 	}
 
 	dprintk(4, "%s: reading indirect from 0x%04x: %02x\n", ptr->name, reg, value);
@@ -103,10 +95,7 @@ static void zr36016_writei(struct zr36016 *ptr, u16 reg, u8 value)
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IADDR, reg & 0x0F);	// ADDR
 		ptr->codec->master_data->writereg(ptr->codec, ZR016_IDATA, value & 0x0FF);	// DATA
 	} else {
-		dprintk(1,
-			KERN_ERR
-			"%s: invalid I/O setup, nothing written (i)!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing written (i)!\n", ptr->name);
 	}
 }
 
@@ -144,27 +133,19 @@ static int zr36016_basic_test(struct zr36016 *ptr)
 	// it back in both cases
 	zr36016_writei(ptr, ZR016I_PAX_LO, 0x00);
 	if (zr36016_readi(ptr, ZR016I_PAX_LO) != 0x0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, can't connect to vfe processor!\n",
-			ptr->name);
+		pr_err("%s: attach failed, can't connect to vfe processor!\n", ptr->name);
 		return -ENXIO;
 	}
 	zr36016_writei(ptr, ZR016I_PAX_LO, 0x0d0);
 	if (zr36016_readi(ptr, ZR016I_PAX_LO) != 0x0d0) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, can't connect to vfe processor!\n",
-			ptr->name);
+		pr_err("%s: attach failed, can't connect to vfe processor!\n", ptr->name);
 		return -ENXIO;
 	}
 	// we allow version numbers from 0-3, should be enough, though
 	zr36016_read_version(ptr);
 	if (ptr->version & 0x0c) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, suspicious version %d found...\n",
-			ptr->name, ptr->version);
+		pr_err("%s: attach failed, suspicious version %d found...\n", ptr->name,
+		       ptr->version);
 		return -ENXIO;
 	}
 
@@ -376,12 +357,12 @@ static int zr36016_setup(struct videocodec *codec)
 	dprintk(2, "zr36016: initializing VFE subsystem #%d.\n", zr36016_codecs);
 
 	if (zr36016_codecs == MAX_CODECS) {
-		dprintk(1, KERN_ERR "zr36016: Can't attach more codecs!\n");
+		pr_err("zr36016: Can't attach more codecs!\n");
 		return -ENOSPC;
 	}
 	//mem structure init
 	codec->data = ptr = kzalloc(sizeof(struct zr36016), GFP_KERNEL);
-	if (!ptr) {
+	if (!ptr)
 		return -ENOMEM;
 
 	snprintf(ptr->name, sizeof(ptr->name), "zr36016[%d]", zr36016_codecs);
diff --git a/drivers/staging/media/zoran/zr36050.c b/drivers/staging/media/zoran/zr36050.c
index dc7928d88099..f551631c18cd 100644
--- a/drivers/staging/media/zoran/zr36050.c
+++ b/drivers/staging/media/zoran/zr36050.c
@@ -448,8 +448,7 @@ static void zr36050_init(struct zr36050 *ptr)
 			ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
-			dprintk(1, KERN_ERR "%s: init aborted!\n",
-				ptr->name);
+			pr_err("%s: init aborted!\n", ptr->name);
 			return;	// something is wrong, its timed out!!!!
 		}
 
@@ -518,8 +517,7 @@ static void zr36050_init(struct zr36050 *ptr)
 			ptr->name, ptr->status1);
 
 		if ((ptr->status1 & 0x4) == 0) {
-			dprintk(1, KERN_ERR "%s: init aborted!\n",
-				ptr->name);
+			pr_err("%s: init aborted!\n", ptr->name);
 			return;	// something is wrong, its timed out!!!!
 		}
 
@@ -757,10 +755,8 @@ static int zr36050_setup(struct videocodec *codec)
 	}
 	//mem structure init
 	codec->data = ptr = kzalloc(sizeof(struct zr36050), GFP_KERNEL);
-	if (!ptr) {
-		dprintk(1, KERN_ERR "zr36050: Can't get enough memory!\n");
+	if (!ptr)
 		return -ENOMEM;
-	}
 
 	snprintf(ptr->name, sizeof(ptr->name), "zr36050[%d]",
 		 zr36050_codecs);
diff --git a/drivers/staging/media/zoran/zr36060.c b/drivers/staging/media/zoran/zr36060.c
index c04054f1306b..0a0916f5f8cd 100644
--- a/drivers/staging/media/zoran/zr36060.c
+++ b/drivers/staging/media/zoran/zr36060.c
@@ -59,9 +59,7 @@ static u8 zr36060_read(struct zr36060 *ptr, u16 reg)
 	if (ptr->codec->master_data->readreg)
 		value = (ptr->codec->master_data->readreg(ptr->codec, reg)) & 0xff;
 	else
-		dprintk(1,
-			KERN_ERR "%s: invalid I/O setup, nothing read!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing read!\n", ptr->name);
 
 	return value;
 }
@@ -74,10 +72,7 @@ static void zr36060_write(struct zr36060 *ptr, u16 reg, u8 value)
 	if (ptr->codec->master_data->writereg)
 		ptr->codec->master_data->writereg(ptr->codec, reg, value);
 	else
-		dprintk(1,
-			KERN_ERR
-			"%s: invalid I/O setup, nothing written!\n",
-			ptr->name);
+		pr_err("%s: invalid I/O setup, nothing written!\n", ptr->name);
 }
 
 /* =========================================================================
@@ -127,19 +122,13 @@ static int zr36060_basic_test(struct zr36060 *ptr)
 {
 	if ((zr36060_read(ptr, ZR060_IDR_DEV) != 0x33) &&
 	    (zr36060_read(ptr, ZR060_IDR_REV) != 0x01)) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, can't connect to jpeg processor!\n",
-			ptr->name);
+		pr_err("%s: attach failed, can't connect to jpeg processor!\n", ptr->name);
 		return -ENXIO;
 	}
 
 	zr36060_wait_end(ptr);
 	if (ptr->status & ZR060_CFSR_Busy) {
-		dprintk(1,
-			KERN_ERR
-			"%s: attach failed, jpeg processor failed (end flag)!\n",
-			ptr->name);
+		pr_err("%s: attach failed, jpeg processor failed (end flag)!\n", ptr->name);
 		return -EBUSY;
 	}
 
@@ -458,7 +447,7 @@ static void zr36060_init(struct zr36060 *ptr)
 	dprintk(2, "%s: Status after table preload: 0x%02x\n", ptr->name, ptr->status);
 
 	if (ptr->status & ZR060_CFSR_Busy) {
-		dprintk(1, KERN_ERR "%s: init aborted!\n", ptr->name);
+		pr_err("%s: init aborted!\n", ptr->name);
 		return;		// something is wrong, its timed out!!!!
 	}
 }
@@ -797,8 +786,7 @@ static int zr36060_setup(struct videocodec *codec)
 	dprintk(2, "zr36060: initializing MJPEG subsystem #%d.\n", zr36060_codecs);
 
 	if (zr36060_codecs == MAX_CODECS) {
-		dprintk(1,
-			KERN_ERR "zr36060: Can't attach more codecs!\n");
+		pr_err("zr36060: Can't attach more codecs!\n");
 		return -ENOSPC;
 	}
 	//mem structure init
-- 
2.26.2

