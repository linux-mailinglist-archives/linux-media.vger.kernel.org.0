Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B387B43BAF7
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238872AbhJZThQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238826AbhJZTg5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032C3C06122F
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o14so88319wra.12
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uoSsJQeMeV1S/aZ9+Qs931neAcHv5KnV5JpeQ9wVWNQ=;
        b=zoncekyvgQdz8sdslj8a/F/YZns0bOfqRyTIskaCrzEw9ARpCfdgmWNF4UyAz5lSAZ
         7YVvzo4HoZJDD7mX14zaueX2XgE6fy6CRImoDwqW69pgm+6a16z6v9iPJPqC0LEAJy7k
         kE3BQ3o3tB7KUI7e5RdKtCK7GG5IM17adXdRpBD80UgKRrh1EGwoumi3RcHpV85V0hK/
         gv7wWbJdUl2CHhkEGj0VcDcYQIoBOZh8aQdvc/DIgNT/j4N+3U089GGVG82r498+Rfcw
         IrEVtWMvZ+y2eB7yo6PDg7mRRHs1YGyPfutZkFNQVXeO2Lu+eN94nafA7NstsqYoFJpC
         HFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uoSsJQeMeV1S/aZ9+Qs931neAcHv5KnV5JpeQ9wVWNQ=;
        b=c+3QitmsiYHnY7JGtIZ/HDwGAntMuPtAyP6EdsRr9Yv/FT++D/uV1p27T9/E+GYSSi
         z6IDV4siwk03WZbTJV5N8rcPgsHW0hgclCBRSwQ+BjJOK5sqZZvK8AT15B1ySY7yYKFX
         8RQOgCzO4Cikri5PDS+SAa8Lm91LuXucUIBNuM3V6ORDcfmUVssl1oAARbYAWsEvMDUI
         FhAsnnhooTS9snIsaNaP0Rp8vLGJgez7FVITqLMuYO8vfmoT3hishi5hJfCkShoeQf1V
         qZFrhRso1OCyRQMdpzfYzpHtQly1LDZV5+69K6AQAPwIBL+OFBX60zIpP7BY79e/BSiP
         ayDg==
X-Gm-Message-State: AOAM530eR5HBD8McLdEFB1Zzl8aBoVi9sBa/T6wmqKB/UluDBiCmfvL5
        fUFklJJrpyL6q/e92WWFRMXhDQ==
X-Google-Smtp-Source: ABdhPJy1oa/u6Ir1S7LcDA2qR5KGVM7qXTb1NRVCpl3PG4+V4XkKsEr37UT+DVc9RgZb3ap9ROmAig==
X-Received: by 2002:adf:ef51:: with SMTP id c17mr28826283wrp.28.1635276867661;
        Tue, 26 Oct 2021 12:34:27 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:27 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 10/14] staging: media: zoran: introduce zoran_i2c_init
Date:   Tue, 26 Oct 2021 19:34:12 +0000
Message-Id: <20211026193416.1176797-11-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduces the size of the probe function by adding zoran_i2c_init/zoran_i2c_exit
functions.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 73 ++++++++++++++++++------
 1 file changed, 54 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 19eb3150074a..a00ad40244d0 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -931,6 +931,53 @@ static int zoran_init_video_devices(struct zoran *zr)
 	return err;
 }
 
+/*
+ * v4l2_device_unregister() will care about removing zr->encoder/zr->decoder
+ * via v4l2_i2c_subdev_unregister()
+ */
+static int zoran_i2c_init(struct zoran *zr)
+{
+	int err;
+
+	pci_info(zr->pci_dev, "Initializing i2c bus...\n");
+
+	err = zoran_register_i2c(zr);
+	if (err) {
+		pci_err(zr->pci_dev, "%s - cannot initialize i2c bus\n", __func__);
+		return err;
+	}
+
+	zr->decoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
+					  zr->card.i2c_decoder, 0,
+					  zr->card.addrs_decoder);
+	if (!zr->decoder) {
+		pci_err(zr->pci_dev, "Fail to get decoder %s\n", zr->card.i2c_decoder);
+		err = -EINVAL;
+		goto error_decoder;
+	}
+
+	if (zr->card.i2c_encoder) {
+		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
+						  zr->card.i2c_encoder, 0,
+						  zr->card.addrs_encoder);
+		if (!zr->encoder) {
+			pci_err(zr->pci_dev, "Fail to get encoder %s\n", zr->card.i2c_encoder);
+			err = -EINVAL;
+			goto error_decoder;
+		}
+	}
+	return 0;
+
+error_decoder:
+	zoran_unregister_i2c(zr);
+	return err;
+}
+
+static void zoran_i2c_exit(struct zoran *zr)
+{
+	zoran_unregister_i2c(zr);
+}
+
 void zoran_open_init_params(struct zoran *zr)
 {
 	int i;
@@ -1059,7 +1106,7 @@ static void zoran_remove(struct pci_dev *pdev)
 	videocodec_exit(zr);
 
 	/* unregister i2c bus */
-	zoran_unregister_i2c(zr);
+	zoran_i2c_exit(zr);
 	/* disable PCI bus-mastering */
 	zoran_set_pci_master(zr, 0);
 	/* put chip into reset */
@@ -1340,22 +1387,10 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	}
 
 	zr36057_restart(zr);
-	/* i2c */
-	pci_info(zr->pci_dev, "Initializing i2c bus...\n");
 
-	if (zoran_register_i2c(zr) < 0) {
-		pci_err(pdev, "%s - can't initialize i2c bus\n", __func__);
+	err = zoran_i2c_init(zr);
+	if (err)
 		goto zr_free_irq;
-	}
-
-	zr->decoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
-					  zr->card.i2c_decoder, 0,
-					  zr->card.addrs_decoder);
-
-	if (zr->card.i2c_encoder)
-		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
-						  zr->card.i2c_encoder, 0,
-						  zr->card.addrs_encoder);
 
 	pci_info(zr->pci_dev, "Initializing videocodec bus...\n");
 	err = videocodec_init(zr);
@@ -1370,15 +1405,15 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (zr->card.video_codec != 0) {
 		master_codec = zoran_setup_videocodec(zr, zr->card.video_codec);
 		if (!master_codec)
-			goto zr_unreg_i2c;
+			goto zr_unreg_videocodec;
 		zr->codec = videocodec_attach(master_codec);
 		if (!zr->codec) {
 			pci_err(pdev, "%s - no codec found\n", __func__);
-			goto zr_unreg_i2c;
+			goto zr_unreg_videocodec;
 		}
 		if (zr->codec->type != zr->card.video_codec) {
 			pci_err(pdev, "%s - wrong codec\n", __func__);
-			goto zr_detach_codec;
+			goto zr_unreg_videocodec;
 		}
 	}
 	if (zr->card.video_vfe != 0) {
@@ -1417,7 +1452,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 zr_unreg_videocodec:
 	videocodec_exit(zr);
 zr_unreg_i2c:
-	zoran_unregister_i2c(zr);
+	zoran_i2c_exit(zr);
 zr_free_irq:
 	btwrite(0, ZR36057_SPGPPCR);
 	pci_free_irq(zr->pci_dev, 0, zr);
-- 
2.32.0

