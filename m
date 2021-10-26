Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A3443BAF4
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238914AbhJZThJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238866AbhJZTg6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:58 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38316C061348
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:30 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id z14so141174wrg.6
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc85KOSJveTQ5eUslKSoOpG1/P3POvZ1CMxkHgm/5RE=;
        b=a+Tw8M7KiCpS/uDFd7J9rLnYg5xQG+jIr8gHWlt7uBoI2Ze2b529Ooc8auhvLEBw2J
         U9uwY3Z169oyZTp9rk7nyosnea1+4NUTBkVXClvA+4EuoIWCOKFUqQ2LJ+rqJSveyCjF
         RhruVOlM/5zqpnMr5hnfzpQEnVC5pefBRa/n2XtluPjW7L+cBjSS0B25LqPcoin/VQoB
         krlSlhffMJZKfwWfuqyaBKiiyzoAddrLpoFbeRoYOB6/tefaWxXgMFaxCcUr98wji4TS
         5xp4Q+wzJBGjtectV8G3RmkfufOhz5merWf3RxJlGiTOMEUq7/hrXelqgIaaNksJxTrB
         MSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc85KOSJveTQ5eUslKSoOpG1/P3POvZ1CMxkHgm/5RE=;
        b=fJKu2hVhb0XD5/uMqaTlrgPzbLD9155Eb8JVVYys7vFm9GdNvJHN4BM02g2Sfr/boc
         yaSei1xIOGgJIZUT0BiOA12gwlDz8zhXCJALhrP9urORkJjGt/7rrcAZWjH0ci18EDs+
         rUWqjQDlLiQOxSAyvMAy5ggHq5ZAyvTHSKtkwFPp9XmV6mw+Iya7FIq7ImXA6d1tE9ps
         EpkR2QucADQzo6mgAt3SywoqYudTID5kMKXFwsGSBB5yvYPqoPccPw9mOyE9nLhVmJRL
         Oq3tJcS0riAFy9r3e1VzmOwYzTWY/xTDA/nuUbjCh23e4tor8Vp9BHscCd+0Y6wkBsi8
         btVw==
X-Gm-Message-State: AOAM531mz60+ANfAzlzuX0CqCES35JgaYFfXBPgfJMgL1PbOVrWWZ4bI
        5WKeuWPTUGjo2mr2rpuaeiWiuQ==
X-Google-Smtp-Source: ABdhPJwbZ1HH6HexlbirMtB7l7gse7d6xFzByPgFEx1knA/2CtOxerTTlACrZAh3dncNeE4NahIf3A==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr34769077wrc.201.1635276868867;
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 12/14] staging: media: zoran: clean unused code
Date:   Tue, 26 Oct 2021 19:34:14 +0000
Message-Id: <20211026193416.1176797-13-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It remains some unused code from old zoran buffer handling.
Let's remove them.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran.h        | 14 ---------
 drivers/staging/media/zoran/zoran_card.c   | 36 ----------------------
 drivers/staging/media/zoran/zoran_device.h |  2 --
 drivers/staging/media/zoran/zoran_driver.c |  2 --
 4 files changed, 54 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index c36b33f42b16..654c95fa5aba 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -54,22 +54,8 @@ static inline struct zr_buffer *vb2_to_zr_buffer(struct vb2_buffer *vb)
 #define BUZ_NUM_STAT_COM    4
 #define BUZ_MASK_STAT_COM   3
 
-#define BUZ_MAX_FRAME     256	/* Must be a power of 2 */
-#define BUZ_MASK_FRAME    255	/* Must be BUZ_MAX_FRAME-1 */
-
 #define BUZ_MAX_INPUT       16
 
-#if VIDEO_MAX_FRAME <= 32
-#   define   V4L_MAX_FRAME   32
-#elif VIDEO_MAX_FRAME <= 64
-#   define   V4L_MAX_FRAME   64
-#else
-#   error   "Too many video frame buffers to handle"
-#endif
-#define   V4L_MASK_FRAME   (V4L_MAX_FRAME - 1)
-
-#define MAX_FRAME (BUZ_MAX_FRAME > VIDEO_MAX_FRAME ? BUZ_MAX_FRAME : VIDEO_MAX_FRAME)
-
 #include "zr36057.h"
 
 enum card_type {
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 4ea2fbf189b9..59df1e7691f9 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -60,20 +60,6 @@ static int video_nr[BUZ_MAX] = { [0 ... (BUZ_MAX - 1)] = -1 };
 module_param_array(video_nr, int, NULL, 0444);
 MODULE_PARM_DESC(video_nr, "Video device number (-1=Auto)");
 
-int v4l_nbufs = 4;
-int v4l_bufsize = 864;		/* Everybody should be able to work with this setting */
-module_param(v4l_nbufs, int, 0644);
-MODULE_PARM_DESC(v4l_nbufs, "Maximum number of V4L buffers to use");
-module_param(v4l_bufsize, int, 0644);
-MODULE_PARM_DESC(v4l_bufsize, "Maximum size per V4L buffer (in kB)");
-
-int jpg_nbufs = 32;
-int jpg_bufsize = 512;		/* max size for 100% quality full-PAL frame */
-module_param(jpg_nbufs, int, 0644);
-MODULE_PARM_DESC(jpg_nbufs, "Maximum number of JPG buffers to use");
-module_param(jpg_bufsize, int, 0644);
-MODULE_PARM_DESC(jpg_bufsize, "Maximum size per JPG buffer (in kB)");
-
 /* 1=Pass through TV signal when device is not used */
 /* 0=Show color bar when device is not used (LML33: only if lml33dpath=1) */
 int pass_through;
@@ -1253,28 +1239,6 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_info(pdev, "Zoran MJPEG board driver version %s\n", ZORAN_VERSION);
 
-	/* check the parameters we have been given, adjust if necessary */
-	if (v4l_nbufs < 2)
-		v4l_nbufs = 2;
-	if (v4l_nbufs > VIDEO_MAX_FRAME)
-		v4l_nbufs = VIDEO_MAX_FRAME;
-	/* The user specifies the in KB, we want them in byte (and page aligned) */
-	v4l_bufsize = PAGE_ALIGN(v4l_bufsize * 1024);
-	if (v4l_bufsize < 32768)
-		v4l_bufsize = 32768;
-	/* 2 MB is arbitrary but sufficient for the maximum possible images */
-	if (v4l_bufsize > 2048 * 1024)
-		v4l_bufsize = 2048 * 1024;
-	if (jpg_nbufs < 4)
-		jpg_nbufs = 4;
-	if (jpg_nbufs > BUZ_MAX_FRAME)
-		jpg_nbufs = BUZ_MAX_FRAME;
-	jpg_bufsize = PAGE_ALIGN(jpg_bufsize * 1024);
-	if (jpg_bufsize < 8192)
-		jpg_bufsize = 8192;
-	if (jpg_bufsize > (512 * 1024))
-		jpg_bufsize = 512 * 1024;
-
 	/* some mainboards might not do PCI-PCI data transfer well */
 	if (pci_pci_problems & (PCIPCI_FAIL | PCIAGP_FAIL | PCIPCI_ALIMAGIK))
 		pci_warn(pdev, "%s: chipset does not support reliable PCI-PCI DMA\n",
diff --git a/drivers/staging/media/zoran/zoran_device.h b/drivers/staging/media/zoran/zoran_device.h
index 6c5d70238228..322b04c55d41 100644
--- a/drivers/staging/media/zoran/zoran_device.h
+++ b/drivers/staging/media/zoran/zoran_device.h
@@ -47,9 +47,7 @@ extern void zr36057_restart(struct zoran *zr);
 
 extern const struct zoran_format zoran_formats[];
 
-extern int v4l_nbufs;
 extern int v4l_bufsize;
-extern int jpg_nbufs;
 extern int jpg_bufsize;
 extern int pass_through;
 
diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 551db338c7f7..31993c266976 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -153,8 +153,6 @@ static __u32 zoran_v4l2_calc_bufsize(struct zoran_jpg_settings *settings)
 		result <<= 1;
 	}
 
-	if (result > jpg_bufsize)
-		return jpg_bufsize;
 	if (result < 8192)
 		return 8192;
 
-- 
2.32.0

