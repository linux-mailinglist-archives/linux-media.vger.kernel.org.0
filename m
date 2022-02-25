Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 514B94C3A24
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235035AbiBYAIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbiBYAIy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B55F14562A
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:23 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id s13so2030241wrb.6
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gtexmTF7iAzwBQml2a/LaIYAccUirTFqnqgi2qHcXv0=;
        b=EG2JhitasINNRO3s2Fa93O+h+k6Ld3ef7YfIJVO7VNgRLyLzaeIYq3TkypxhhPyWGB
         2yfv/8eC+vvvDUcFzvMYP7TgWLwMnXeyJ6+kn9vCsZ1dZLuTQw6o7fUC4JGTWwjQRfu2
         J5E4H8Gd2G8gQ6kubJe9OZB0ieAcpNmMbssLG4jUTNK3SX2i3biNo8nEblxBkz41Bo27
         I+oW7fh+MzglDYSg2lB4FyQnQUSc6pl+vyeyj8bP1QYPLuH66jaLPr+K/TDoHqmVC6kl
         tz4umZbDE4TXO80Jbj7GiOJk5ZTvvy3NaqqrSvYiyXBgXT1spaOqI5ud1EOxrVLVWuql
         6FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gtexmTF7iAzwBQml2a/LaIYAccUirTFqnqgi2qHcXv0=;
        b=g7jFFAqM88moblisaZyRt1m2h/1geiQrGmeLUNexUDe9hlyatfPrrV4O3rV9hr9N17
         zChD/Y9r8+xlEWQiujxqQROJU9EixJiSA7d3z1kzqMM4FFsUqekbksfwT4FbufUkJVyz
         jTV/GKqn3z7q7FlkoSAdbajeAX/FUf/gVVlwsHC2hdjAhMzijh3JeiVhAyHqT3KAUT2h
         sn7nmNqA5sPIlDOZvQ+ssqFemwmyKlTTl8M01kZj1xtsMvWK5cXWXKl0tdO+xr/5LBRD
         WP5fTa/g+K02mVqFo7RaoD5KxqbM7bqf/3c9N/+DM5+UuN7X465Ya9lCPO9ijHnsSpWC
         lbdA==
X-Gm-Message-State: AOAM531ZSf6vlWuW45wueFKQap0jk3IlvzvZqcbccjJ2tUmlTAUYR4bl
        FYHBaOftNN5WJ9MiUkivEY1479C+DyIq3w==
X-Google-Smtp-Source: ABdhPJyZAC80yXunuzsfBVesuIwOJXJjbH8ioWzqgMKzzSEG9mwkBuwOyDjcuXYnLWcfAZHT6Wc2uw==
X-Received: by 2002:adf:f1ca:0:b0:1ed:e2d7:b5f3 with SMTP id z10-20020adff1ca000000b001ede2d7b5f3mr4147035wro.75.1645747701877;
        Thu, 24 Feb 2022 16:08:21 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:21 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 08/11] media: i2c: Add ov7251_detect_chip()
Date:   Fri, 25 Feb 2022 00:07:50 +0000
Message-Id: <20220225000753.511996-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

.probe() is quite busy for this driver; make it cleaner by moving the
chip verification to a dedicated function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- None

 drivers/media/i2c/ov7251.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d4843e797568..0c6970b01c6b 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1442,11 +1442,43 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 	return ret;
 }
 
+static int ov7251_detect_chip(struct ov7251 *ov7251)
+{
+	u8 chip_id_high, chip_id_low, chip_rev;
+	int ret;
+
+	ret = ov7251_read_reg(ov7251, OV7251_CHIP_ID_HIGH, &chip_id_high);
+	if (ret < 0 || chip_id_high != OV7251_CHIP_ID_HIGH_BYTE)
+		return dev_err_probe(ov7251->dev, -ENODEV,
+				     "could not read ID high\n");
+
+	ret = ov7251_read_reg(ov7251, OV7251_CHIP_ID_LOW, &chip_id_low);
+	if (ret < 0 || chip_id_low != OV7251_CHIP_ID_LOW_BYTE)
+		return dev_err_probe(ov7251->dev, -ENODEV,
+				     "could not read ID low\n");
+
+	ret = ov7251_read_reg(ov7251, OV7251_SC_GP_IO_IN1, &chip_rev);
+	if (ret < 0)
+		return dev_err_probe(ov7251->dev, -ENODEV,
+				     "could not read revision\n");
+	chip_rev >>= 4;
+
+	dev_info(ov7251->dev,
+		 "OV7251 revision %x (%s) detected at address 0x%02x\n",
+		 chip_rev,
+		 chip_rev == 0x4 ? "1A / 1B" :
+		 chip_rev == 0x5 ? "1C / 1D" :
+		 chip_rev == 0x6 ? "1E" :
+		 chip_rev == 0x7 ? "1F" : "unknown",
+		 ov7251->i2c_client->addr);
+
+	return 0;
+}
+
 static int ov7251_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
-	u8 chip_id_high, chip_id_low, chip_rev;
 	unsigned int rate = 0;
 	s64 pixel_rate;
 	int ret;
@@ -1585,34 +1617,10 @@ static int ov7251_probe(struct i2c_client *client)
 		goto free_entity;
 	}
 
-	ret = ov7251_read_reg(ov7251, OV7251_CHIP_ID_HIGH, &chip_id_high);
-	if (ret < 0 || chip_id_high != OV7251_CHIP_ID_HIGH_BYTE) {
-		dev_err(dev, "could not read ID high\n");
-		ret = -ENODEV;
-		goto power_down;
-	}
-	ret = ov7251_read_reg(ov7251, OV7251_CHIP_ID_LOW, &chip_id_low);
-	if (ret < 0 || chip_id_low != OV7251_CHIP_ID_LOW_BYTE) {
-		dev_err(dev, "could not read ID low\n");
-		ret = -ENODEV;
-		goto power_down;
-	}
-
-	ret = ov7251_read_reg(ov7251, OV7251_SC_GP_IO_IN1, &chip_rev);
-	if (ret < 0) {
-		dev_err(dev, "could not read revision\n");
-		ret = -ENODEV;
+	ret = ov7251_detect_chip(ov7251);
+	if (ret)
 		goto power_down;
-	}
-	chip_rev >>= 4;
 
-	dev_info(dev, "OV7251 revision %x (%s) detected at address 0x%02x\n",
-		 chip_rev,
-		 chip_rev == 0x4 ? "1A / 1B" :
-		 chip_rev == 0x5 ? "1C / 1D" :
-		 chip_rev == 0x6 ? "1E" :
-		 chip_rev == 0x7 ? "1F" : "unknown",
-		 client->addr);
 
 	ret = ov7251_read_reg(ov7251, OV7251_PRE_ISP_00,
 			      &ov7251->pre_isp_00);
-- 
2.25.1

