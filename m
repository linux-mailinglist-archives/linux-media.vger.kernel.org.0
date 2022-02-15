Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA59E4B7B03
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 00:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236611AbiBOXIL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 18:08:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243412AbiBOXIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 18:08:09 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA2F65E0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:58 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id e3so590803wra.0
        for <linux-media@vger.kernel.org>; Tue, 15 Feb 2022 15:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yIAKZBtnJQwKXWI1ucGmm1tOZicYz+1srhpP8quz3OY=;
        b=IYgHE7mLYLnJgTvwkQGc7edqQKDxjVmpv2tKZHfD8bEb4cv5FRfJ6lPmVuDGGis4pH
         Yt224WdmekPb5OspNO3C2hNIsBf4ysXCKL2+xHLDty7CulBfNS+FqOTaNnQgXzGq2mYV
         pAJ65MSlUsf34vT8IhGPnEtDufNjijZEFUiFgKKcwN1vrvSc6CJDFkyueQrr4XdgBvop
         b9TNtwsDAUVGWXcGxQf1/Y8vSjCH53jCPfSVYf0fbfeImbem38TonmeffSpAOGNl2rgb
         cyEP7USWEWpXDlxGuGbaxulD+4JVt6F7dNb9gn4BtIYIu4w5S2sNF9+ff8ZfpGllEpAH
         yH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yIAKZBtnJQwKXWI1ucGmm1tOZicYz+1srhpP8quz3OY=;
        b=fBOBdjN7XEnMXJwkF69868PNRpnUmppF9Hupu+27uMnUYIZbCiBE6w4khlzcOJMWQo
         DEmYhIxO/Rm2v2nkFAnE3NKUbDoLAwW53Oe0cV5jTbGAF9YGoxJkKhGeWSabUrBFBpVP
         5/SebCk52+oUeILHoIVjyRcAeyw747DzHBPHfEkpxT1tAozuhkBtTqvvtj9+CjXDu2hz
         GzHA9RH8CkaJ1eGamWRTynETC1HbeRfKMAS2luxSsjlodAKLNOlAVHFE6wRisZ7J/2qB
         d5as54Fg6RnoZ/Lpdtdwmfj7KehkM2o8dWfGc3PXykgfmRQm8wkufRCBDQ6BYE5xxJW/
         TxkQ==
X-Gm-Message-State: AOAM531IPFCytZINBpEBSFfkvj4ckgBXJEVAyMC73cYDZbnLUAdfQ3yY
        nKpov3z/ycFIwgHavGpY84XVSzYqTLZtwQ==
X-Google-Smtp-Source: ABdhPJxf7vfHdFxvVdhqLPG4HgXOs2Xj0GO19sRCIYz6rYek5e7wCnSx9c1X0xVWRDkL/ZtX18DQKg==
X-Received: by 2002:adf:e607:0:b0:1e4:b899:212f with SMTP id p7-20020adfe607000000b001e4b899212fmr146237wrm.173.1644966477110;
        Tue, 15 Feb 2022 15:07:57 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id w18sm16956590wrl.62.2022.02.15.15.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 15:07:56 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH 07/10] media: i2c: Add ov7251_detect_chip()
Date:   Tue, 15 Feb 2022 23:07:34 +0000
Message-Id: <20220215230737.1870630-8-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215230737.1870630-1-djrscally@gmail.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov7251.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 92605ecdfaa4..f137a1e87537 100644
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
 	int ret;
 	int i;
@@ -1578,34 +1610,10 @@ static int ov7251_probe(struct i2c_client *client)
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

