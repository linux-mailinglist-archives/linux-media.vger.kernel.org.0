Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0827E51CC74
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386564AbiEEXII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386552AbiEEXIB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:01 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B849660064
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:20 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j15so7891662wrb.2
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pFsplmqpkvecT13lJ82Se/URsi87L0nPXT/CCiqFbSI=;
        b=Gpf/jxQoLDuoYqNr5rFqYgWQTDdmjNb9xrJ0VwgtGm4qI5OZgCXPRBr1ymB8IFSb0m
         rouqytRq83Eyl4fMK1c7duL5sKVWMnT8XG2U+uilq468e3eoqMKnHWeNJhzdaj/vlliD
         FkvJAFGVFpYjDTD+N43DSXYPC/x89l35UKSxbEE/41q9IzE/9r2EsimTBzXO8Fh7t5I5
         ybDaPIGMFORPTMMGYNXoIJft6E7LLLrDeoZ3m7YJ4wb/EHESM1/w91qpkPbyB775BxOh
         hIGdpY60ybod9YsyWXWMLCBJ8BbAgkiRqRdS9yEgFu96rR1lSSnZe28RG5nVHSPF7WyM
         57qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pFsplmqpkvecT13lJ82Se/URsi87L0nPXT/CCiqFbSI=;
        b=Enu8cJANIE78SZhRpFEpbZWrk6/Ogocj0M/oYGh92Zvfw740gTZSjnEv5/K4Hn76kx
         OvbP2WUl6I6rgEvMX26lLGC3qDmv7ynZzdw+fjo6IMNmy781Bd0b7Mb5WRAwTw9VIA3S
         uo3fS5a3CGjS/zybRxUXcOR/+jOPlX2/EIupc/3QcA1yOVyrtNFdBbW6bvk2D5EX6gJG
         2E1SqXTX8ji65TDQua5VPY4e23HNRO6XtqAUEpYc3uLYvcJBZ2m3nzufNTH7jEAIZ6cm
         OuJCDbWPgu4Tkg8gqhgIRtpSMjtFYxOYIwxs1ArtWxxydstV8RALHYWjFsCHOPSQaJpZ
         BUaw==
X-Gm-Message-State: AOAM533pxcXxfOgwLzTm2h0+dHqSwRx/khIoEhsb/UY8e6wBGem+6xUB
        XT0JPCToK7v3yBlSkpca2bKacb5v/Aw=
X-Google-Smtp-Source: ABdhPJz+fL4tjj6UXP9DM5aYrbvAzC2aP8RKDZQFIOFa+KZt9vimwhGma/uPWE0IOWhyZQP0AHMCPQ==
X-Received: by 2002:a5d:4686:0:b0:20a:e8dc:fd99 with SMTP id u6-20020a5d4686000000b0020ae8dcfd99mr295488wrq.478.1651791859356;
        Thu, 05 May 2022 16:04:19 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:18 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 08/15] media: i2c: Add ov7251_detect_chip()
Date:   Fri,  6 May 2022 00:03:55 +0100
Message-Id: <20220505230402.449643-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- None

 drivers/media/i2c/ov7251.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 98848b3f62a9..88875275b7b4 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1439,11 +1439,43 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
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
 	unsigned int rate = 0, clk_rate = 0;
 	s64 pixel_rate;
 	int ret;
@@ -1586,34 +1618,10 @@ static int ov7251_probe(struct i2c_client *client)
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

