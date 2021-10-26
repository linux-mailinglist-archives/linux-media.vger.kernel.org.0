Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6685A43BAEC
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238839AbhJZThB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238832AbhJZTgu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:50 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FC5C061224
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:25 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m22so225111wrb.0
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hut926V20OH93089sBQ+FiKkhdXp4O3nTh6QgQgaA7A=;
        b=hwYicRb0OS5eN08waXU1zgwff1mW40qKsbV1jA3ufWbrmPO0WPZiu72m7rqcxsy29H
         SPQtiQW+kgnSXoLcG0ldncL9HAIPxArkazHr780V9pJdqzC4MES8yYAuzAllVfdEjaXB
         1YP10luLrWQx065ohS933ohmOdpnlL9iZhfuILLvxTR80aEzydOcNW3epM8WL0x+yeM0
         t1HKtKNv76Qlo7rM7Yb6AS5I0mIk/UgnqHMDXHONZ7EsqvUGKfJTwxo39xp+uNbdBSxA
         AuVAjPPY16D5/oh0ke7fI/D5y1/XGulQKI+5/11KkwqkyOtkDRUtLInTAdpOY3h1SV8i
         PvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hut926V20OH93089sBQ+FiKkhdXp4O3nTh6QgQgaA7A=;
        b=BOz5GQYj61LmB843XqUWRgKLdlfAegOTcT9JL3DXDGzOKExzNsVOeax2bqaABwmJlp
         Fh2OHHWH/+jadqofqgEp2AVV6q+zfMxnRxhM05m0ljh58GvD/pPQoI/hlGdeiauR0CkG
         JZk2Xtq5kcFBd3Eo8HMDZLh8NCJIzI8Pmv/HhaJF+GZomyqxsq/teVo0CADszn58WYvN
         EsDPYhS75z4aIocia4C/37phGlJVuyqzWZ6lFQMrFqsPAWsksXVOMj0oKZp30v52YDlm
         PM0ri02XWR29wwS53ieRjUGVejIrlTc8SfHdOohBWBQd8oWwN7RCobJWTJbjsbkkD1Xu
         Jv3g==
X-Gm-Message-State: AOAM531RrmTYinIlvrX8uc6oMtX173WQVSNTaY1HesDFS1yNLqCfC5uD
        nX7ccKmHea+3RfTjEYWcyUQAPw==
X-Google-Smtp-Source: ABdhPJxScYyps8hFP9WRzxmofVYYVvklo7tQfqY4/lmq/LcdjqhV/KDBvBqcjIf8Fov710lMLMuqEg==
X-Received: by 2002:adf:f84b:: with SMTP id d11mr640730wrq.51.1635276863965;
        Tue, 26 Oct 2021 12:34:23 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:23 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 04/14] staging: media: zoran: add debugfs
Date:   Tue, 26 Oct 2021 19:34:06 +0000
Message-Id: <20211026193416.1176797-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add debugfs for displaying zoran debug and stats information.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig      |  1 +
 drivers/staging/media/zoran/zoran.h      |  2 ++
 drivers/staging/media/zoran/zoran_card.c | 36 ++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 7874842033ca..6d6e4c93f873 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -2,6 +2,7 @@ config VIDEO_ZORAN
 	tristate "Zoran ZR36057/36067 Video For Linux (Deprecated)"
 	depends on PCI && I2C_ALGOBIT && VIDEO_V4L2
 	depends on !ALPHA
+	depends on DEBUG_FS
 	select VIDEOBUF2_DMA_CONTIG
 	help
 	  Say Y for support for MJPEG capture cards based on the Zoran
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index b1ad2a2b914c..981cb63ac9af 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -18,6 +18,7 @@
 #ifndef _BUZ_H_
 #define _BUZ_H_
 
+#include <linux/debugfs.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -295,6 +296,7 @@ struct zoran {
 	struct list_head queued_bufs;
 	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
 	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
+	struct dentry *dbgfs_dir;
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f1465fbf98af..28a3363a8838 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -945,6 +945,8 @@ static void zoran_remove(struct pci_dev *pdev)
 	if (!zr->initialized)
 		goto exit_free;
 
+	debugfs_remove_recursive(zr->dbgfs_dir);
+
 	zoran_queue_exit(zr);
 
 	/* unregister videocodec bus */
@@ -1051,6 +1053,37 @@ static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
 	.s_ctrl = zoran_video_set_ctrl,
 };
 
+static int zoran_debugfs_show(struct seq_file *seq, void *v)
+{
+	struct zoran *zr = seq->private;
+
+	seq_printf(seq, "Running mode %x\n", zr->running);
+	seq_printf(seq, "Codec mode %x\n", zr->codec_mode);
+	seq_printf(seq, "Norm %llx\n", zr->norm);
+	seq_printf(seq, "Input %d\n", zr->input);
+	seq_printf(seq, "Buffersize %d\n", zr->buffer_size);
+
+	seq_printf(seq, "V4L width %dx%d\n", zr->v4l_settings.width, zr->v4l_settings.height);
+	seq_printf(seq, "V4L bytesperline %d\n", zr->v4l_settings.bytesperline);
+
+	seq_printf(seq, "JPG decimation %u\n", zr->jpg_settings.decimation);
+	seq_printf(seq, "JPG hor_dcm %u\n", zr->jpg_settings.hor_dcm);
+	seq_printf(seq, "JPG ver_dcm %u\n", zr->jpg_settings.ver_dcm);
+	seq_printf(seq, "JPG tmp_dcm %u\n", zr->jpg_settings.tmp_dcm);
+	seq_printf(seq, "JPG odd_even %u\n", zr->jpg_settings.odd_even);
+	seq_printf(seq, "JPG crop %dx%d %d %d\n",
+		zr->jpg_settings.img_x,
+		zr->jpg_settings.img_y,
+		zr->jpg_settings.img_width,
+		zr->jpg_settings.img_height);
+
+	seq_printf(seq, "Prepared %u\n", zr->prepared);
+	seq_printf(seq, "Queued %u\n", zr->queued);
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(zoran_debugfs);
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1286,6 +1319,9 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	zr->map_mode = ZORAN_MAP_MODE_RAW;
 
+	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
+	debugfs_create_file("debug", 0444, zr->dbgfs_dir, zr,
+			    &zoran_debugfs_fops);
 	return 0;
 
 zr_detach_vfe:
-- 
2.32.0

