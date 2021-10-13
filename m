Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DBA42C936
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 20:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239208AbhJMTA7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 15:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238912AbhJMTA3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 15:00:29 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8EDAC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:25 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k7so11467844wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 11:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCuCJfe1m2EBzP6uG/hjir3uZO33RFp6V2H2rUcCkfg=;
        b=nwkz5FHJqjhY71EanYsEZEn1qxRy5EmWN6Q7e5QkqnduaU7D6XDddsC1G6RWnFfIKF
         kns+vZnDzHrjg2F98Js4Iby1WFxmjSzBTC8Cf3lT7297mNv5SDPesLnQhSo3SkvO70UN
         J62nrMiFvuYi98Cp1JA6iE2x1lnHFUUFYSiJ6cIqkd4j5r3W38iUEYEN4fogJpDscf5s
         4pyZEK9hwra1CB3hiDRGW7q5glXE84uDK/unNRL3cY5gkL181lzfdkCIdggffLVDWkey
         5iTEDW5Uc6vvjE6BSDLi01nCLA/NgiiwkVVk731WHd/FTA8tliFN48TpXiYCVRLrxUBn
         peJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCuCJfe1m2EBzP6uG/hjir3uZO33RFp6V2H2rUcCkfg=;
        b=HfNl/OTZZMCB9JlotuADeKCHzu2EOmIgGq0kphavyrH+IPZBWIDIIQnnc7mHp1dEPe
         6VYTq34EaBDaNMqqW5W2FrA4Sd48uPx3OBpTQWcf3T+hwzkvbVGd+ARpNWOnTxGEHPqq
         Vyg0IEcgkoLeJzWWsy3Bew6zaF23WzuzIVzglF37RoWEPeXS8hh0AxqoVg/DWDfocX0W
         ngI2oexPrqv6L8Fptj7tfPqMHy+dM5qWcjE2NUitsm9aIg9TRwm782HbZrcvS+WE1Kim
         g6SM8i2eHNT86Gujeb+z6rBoqm3QokaTA94eomBWsbC/2TjSb/FbNIbDWNLmEauOqKaU
         HRhQ==
X-Gm-Message-State: AOAM533hJ3EH2fjuYZ8Yb4lww7C80Ydqka6cCez8Vzo+GYUZo78fAp9C
        e5a0LJaVSLorbZqATK3+LywdxA==
X-Google-Smtp-Source: ABdhPJz7opz1h2jfYo83FVcdcNhIOCcBVzmCE5sHQ1ScMKsCEWGNSKBtV/IISxT5+z9y8ljQ5uQe+Q==
X-Received: by 2002:a5d:58ca:: with SMTP id o10mr1053060wrf.358.1634151504493;
        Wed, 13 Oct 2021 11:58:24 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e8sm573059wrg.48.2021.10.13.11.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 11:58:24 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 10/10] staging: media: zoran: introduce zoran_i2c_init
Date:   Wed, 13 Oct 2021 18:58:12 +0000
Message-Id: <20211013185812.590931-11-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013185812.590931-1-clabbe@baylibre.com>
References: <20211013185812.590931-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reduces the size of the probe function by adding zoran_i2c_init/zoran_i2c_exit
functions.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 67 ++++++++++++++++++------
 1 file changed, 51 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 9bc5af34d909..fe4d867bf341 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -874,6 +874,53 @@ static int zoran_init_video_devices(struct zoran *zr)
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
+		pci_err(zr->pci_dev, "Fail to get decoder\n");
+		err = -EINVAL;
+		goto error_decoder;
+	}
+
+	if (zr->card.i2c_encoder) {
+		zr->encoder = v4l2_i2c_new_subdev(&zr->v4l2_dev, &zr->i2c_adapter,
+						  zr->card.i2c_encoder, 0,
+						  zr->card.addrs_encoder);
+		if (!zr->encoder) {
+			pci_err(zr->pci_dev, "Fail to get encoder\n");
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
@@ -1001,7 +1048,7 @@ static void zoran_remove(struct pci_dev *pdev)
 		videocodec_detach(zr->vfe);
 
 	/* unregister i2c bus */
-	zoran_unregister_i2c(zr);
+	zoran_i2c_exit(zr);
 	/* disable PCI bus-mastering */
 	zoran_set_pci_master(zr, 0);
 	/* put chip into reset */
@@ -1285,22 +1332,10 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
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
 
@@ -1377,7 +1412,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 zr_detach_codec:
 	videocodec_detach(zr->codec);
 zr_unreg_i2c:
-	zoran_unregister_i2c(zr);
+	zoran_i2c_exit(zr);
 zr_free_irq:
 	btwrite(0, ZR36057_SPGPPCR);
 	pci_free_irq(zr->pci_dev, 0, zr);
-- 
2.32.0

