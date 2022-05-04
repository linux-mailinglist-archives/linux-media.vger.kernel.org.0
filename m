Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28E351B1ED
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379021AbiEDWeg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379019AbiEDWe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:27 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7002845044
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:49 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p189so1636493wmp.3
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lR/4TCkX9OV73mGGmdOCPAEMmFMS8+DFUJpyrEVk3XU=;
        b=JJ2okBiXR8lIGrlgJ/4qEO5u1wqHR/1wklQ6IhqbzfFFbUOltkWw4YYF4kuHtiid0M
         SAD4UUX5xYCJ8YwZ03tBEbV2SxVZDW+I1zmE2DjXZS8MK+OTL9b5TnsQoqZy1jqPQVNL
         qJcZp84PDO+nrEjIMZvRfHeCUsVe3B6iVnG1CAMGShLe2g3jmvgFFpa4SFIeDwyXET64
         hSoRfwVboK/WztTsnMNwFOLvBvpdEqaTsMvnSdVpmAgFTqpxxsyiW8jgw1MyfZVXCyYC
         vaYzosiks81G0xOFPJlUFiHEJfTF+Xvhb/nRwRWAg/T1m5jVjRR8L+owfw1j0DmrYiI6
         EVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lR/4TCkX9OV73mGGmdOCPAEMmFMS8+DFUJpyrEVk3XU=;
        b=CZNY2JKtaIMgzTiU7G3tocV2+I+/le4tW7al9XFm+pwU98WSmW3ExmdRXjoFiUzH6S
         oz2RfpRvrjbGu/9cpIVxAsSk/Es6RTLRZUi1OtmbOFzM6TeUXVKySZxGmqSTCz+9Z52v
         gH514kjEGRG9hDDAf8UhTYbm8SwgUwTf9GvmgrlebZo+p+2j3VEeY6B8/1QczOg+cXVG
         aJlsDSh7AmCMXHEYrffq45oT4+7GPa+tK+pkjArO2Xm/OzHhsB2b1nSN57RcmkRr2lGl
         Yeuh5UrR8xVD6hOxjIQ0fJK9h6AdUG3lysX0hAIVZCPXoccyxWQnykCBJWHXuE95UP3n
         YQ+A==
X-Gm-Message-State: AOAM530rtySQIVi5+Srx77tDAfUfGQbM0SHCnLJEdlIhZqHLpGg5LAI1
        BeGRVSl5/LAaXvAW0Aa4aV9cqO6P/bs=
X-Google-Smtp-Source: ABdhPJxB/bNBYa/7CrUthErhBPDfTRIcsXEjAZPM18cLEoinD6NyYEfZqPE+PE/++XQMHRjyl0ypJw==
X-Received: by 2002:a7b:cd04:0:b0:38e:d7a4:1548 with SMTP id f4-20020a7bcd04000000b0038ed7a41548mr1440541wmj.73.1651703448101;
        Wed, 04 May 2022 15:30:48 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:47 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 08/15] media: i2c: Add ov7251_detect_chip()
Date:   Wed,  4 May 2022 23:30:20 +0100
Message-Id: <20220504223027.3480287-9-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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
Changes in v3:

	- None

Changes in v2:

	- None

 drivers/media/i2c/ov7251.c | 62 +++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 9a026354a1bd..ff31629839f9 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1441,11 +1441,43 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
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
@@ -1588,34 +1620,10 @@ static int ov7251_probe(struct i2c_client *client)
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

