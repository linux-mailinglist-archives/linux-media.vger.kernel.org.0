Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54F1F42C927
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbhJMTA2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238826AbhJMTA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:26 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391E6C061753
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id o20so11655122wro.3
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkJ4cziLX4onCvAcIGYJLg+49tXxNFwoBxX9uTdyC70=;
        b=XV+BOcJtF1hZeTxKarHMaQL9Ni43gVuKWBwRDss9l9yjAOMPAv47nhVVoJIUyzfOML
         v6U7UxtweoyWZx+3aeLEF4KIkfIji4dVsfuvNeQ1G6Qcm41tCO2o42PPKFHJGetILi9S
         WhYKyDYo+R2RtI5AHU1vDe2TcFuCCvbPeUnyzPuH7vDpuQXAx/5U4t+ZDPSJYKJiQQur
         Vdu9SaG45DTZm1g7lexw/wppRvP2/9ftrZATN2qzSdYE1q61Sl/9Jw0XL0FXYx0Nzlpm
         9N9Sb88FOoF4KKgDMGJmIqjFb2le8rX3C/WZe3Yj1LE3qNZjL0u1uQ6xRRf/CAmKEVcM
         u9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkJ4cziLX4onCvAcIGYJLg+49tXxNFwoBxX9uTdyC70=;
        b=e/kiTJc7+4pJqS1bjmcs4IFvFETgSQjJLgXSr8Fko+XD0WeXaXjgGSybA3Cw/N54dF
         wW44lQbVpscMw60xfICThw1bYHf/DVGDTPAaLrJUXR6lsj+mx54lNbSbGwg3R5EKltpF
         2cKz9YkVCBCHxcgNR2b6NRnXNDyQSYaCTHW/CZB/KCtM0oxaOIwIyGBWj75+7MSc9Qx5
         M40Uqw1QK6sFtDcTzDpSZlv6LvvRNxUkjgcJq454NXsvr4w3dCi+n4YI6mheZpu9fJAZ
         pZs8dEOJyrIUXgHmOJyy/yYx8lc+Zc/1ClH2Re3Zv1P+pOIHLN/luODFNbKJTyYVZX00
         SRaA==
X-Gm-Message-State: AOAM531s7bb7/z5NWR1wIkqhEOxmUq6Wz4bXYtUljMLYD0ILtww1GXnT
        tJvHpIUr2q82KAVKkWz6BQ4jtg==
X-Google-Smtp-Source: ABdhPJzuFm4/bPvGn8Pv1Kj2vVWDnqqDFfIjX15GZ8PVSP7VWr+CFnw8Xr6HVydapFAHpcDu5+9HiQ==
X-Received: by 2002:a5d:6982:: with SMTP id g2mr1018418wru.51.1634151500819;
        Wed, 13 Oct 2021 11:58:20 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:20 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 04/10] staging: media: zoran: add debugfs
Date:   Wed, 13 Oct 2021 18:58:06 +0000
Message-Id: <20211013185812.590931-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add debugfs for displaying zoran debug and stats information.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/Kconfig      |  9 ++++++
 drivers/staging/media/zoran/zoran.h      |  4 +++
 drivers/staging/media/zoran/zoran_card.c | 41 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/drivers/staging/media/zoran/Kconfig b/drivers/staging/media/zoran/Kconfig
index 7874842033ca..06f79b91cda7 100644
--- a/drivers/staging/media/zoran/Kconfig
+++ b/drivers/staging/media/zoran/Kconfig
@@ -74,3 +74,12 @@ config VIDEO_ZORAN_AVS6EYES
 	select VIDEO_KS0127 if MEDIA_SUBDRV_AUTOSELECT
 	help
 	  Support for the AverMedia 6 Eyes video surveillance card.
+
+config VIDEO_ZORAN_DEBUG
+	bool "Enable zoran debugfs"
+	depends on VIDEO_ZORAN
+	depends on DEBUG_FS
+	help
+	  Say y to enable zoran debug file.
+	  This will create /sys/kernel/debug/CARD_NAME/debug for displaying
+	  stats and debug information.
diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index b1ad2a2b914c..c37d064ff11d 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -18,6 +18,7 @@
 #ifndef _BUZ_H_
 #define _BUZ_H_
 
+#include <linux/debugfs.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/videobuf2-core.h>
@@ -295,6 +296,9 @@ struct zoran {
 	struct list_head queued_bufs;
 	spinlock_t queued_bufs_lock; /* Protects queued_bufs */
 	struct zr_buffer *inuse[BUZ_NUM_STAT_COM * 2];
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+	struct dentry *dbgfs_dir;
+#endif
 };
 
 static inline struct zoran *to_zoran(struct v4l2_device *v4l2_dev)
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index f1465fbf98af..6f29986a3fc2 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -945,6 +945,8 @@ static void zoran_remove(struct pci_dev *pdev)
 	if (!zr->initialized)
 		goto exit_free;
 
+	debugfs_remove_recursive(zr->dbgfs_dir);
+
 	zoran_queue_exit(zr);
 
 	/* unregister videocodec bus */
@@ -1051,6 +1053,39 @@ static const struct v4l2_ctrl_ops zoran_video_ctrl_ops = {
 	.s_ctrl = zoran_video_set_ctrl,
 };
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
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
+#endif
+
 /*
  *   Scan for a Buz card (actually for the PCI controller ZR36057),
  *   request the irq and map the io memory
@@ -1286,6 +1321,12 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	zr->map_mode = ZORAN_MAP_MODE_RAW;
 
+#ifdef CONFIG_VIDEO_ZORAN_DEBUG
+	zr->dbgfs_dir = debugfs_create_dir(ZR_DEVNAME(zr), NULL);
+	debugfs_create_file("debug", 0444,
+					      zr->dbgfs_dir, zr,
+					      &zoran_debugfs_fops);
+#endif
 	return 0;
 
 zr_detach_vfe:
-- 
2.32.0

