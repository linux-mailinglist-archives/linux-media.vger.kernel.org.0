Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17C1F61173C
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiJ1QPX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbiJ1QOg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:36 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A719C6562
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:44 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id v130-20020a1cac88000000b003bcde03bd44so6881075wme.5
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYMzRFBY8rMeXFOhCy9Ay0b//t6qEd1yKgrgKU9jdLY=;
        b=B0/jGMBzl+XqL3LfUglpUSpcwVgLPkdZJSW4A1KzEqq9eJw+PCWtbWAZ2OBQXOZwhS
         UT0goyHsOnn6RAvFbAZ/7zLZnfiGkJ6AT86RhA9g5FgTctT4f4bKNgM7pDmnp6TL+Hz9
         iuukXTaJQP0AhG/agf5Dbjr2iEPDnlWvtPuUfh7aUe3TOf2C1HxtFYy3kDNf76RY9JxH
         LqJanWtaF1UI/SVM8syi6ceOSZA2W2HLrt3zby11FK3nwjsDMAx23BqrI4Aul7F27vXG
         wO0a6KqOzN9q5L+TCUkR/q/iQgbLTUuczg2qKcYM4lAMRDEFj1zpN/D2FCxpoClcH0Hy
         Nnkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYMzRFBY8rMeXFOhCy9Ay0b//t6qEd1yKgrgKU9jdLY=;
        b=uO4G0X3VL56dPMYUoYafNBC1NTYVJtKRwfwUYjd6+/iuRtmBuG3u9ruxwOxpci2rEo
         uv2CmRkpxUg1sAITDjX0Cr39MBXBUEJebqNVUPGyEIAwx6kEGMxmCo6ZWrgEXu9vPdwd
         vZBFgLGFV3/X7jgRpTsPEVgds3AbKS2AvFsCqEBLxFsWigw9jEZzRZW6u6cCkVkY+9pr
         5In/le5X0WDqK/oHfyECSvuylE3/w7ur9ncw2JaEWikha7/GpkiwKU9M+y9Ps3iLbTOJ
         3uF1GIzO/7NWmwsgVPW6Rmb28jpc07zkB0wa0MGUoi5401s7GO6rPHy6xhSeYKIxl5or
         1oNw==
X-Gm-Message-State: ACrzQf1NDEJrvtxY8piRu0Zo4+KhS52EjnJ2IwKqxkEeR4tQJnJynNZF
        8lpOJ6Iz6cyiq2zwY7aZYd1P1g==
X-Google-Smtp-Source: AMsMyM7oHH6Jtios1Hn4idfmzyiuJSx9MAaQV9m6+vO1v6kK328onl/K0mBcfAexOHff907AU72KMQ==
X-Received: by 2002:a05:600c:1d87:b0:3cf:543a:4d72 with SMTP id p7-20020a05600c1d8700b003cf543a4d72mr5850130wms.126.1666973563231;
        Fri, 28 Oct 2022 09:12:43 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:42 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 02/16] media: i2c: ov9282: Split registers into common and mode specific
Date:   Fri, 28 Oct 2022 17:08:48 +0100
Message-Id: <20221028160902.2696973-3-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently only one mode is supported, so all registers were
dropped in one list.
In preparation for adding more modes, split out the common registers
from those which configure the mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 77 +++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 30 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 0c604050b4e5..6999ce869a1b 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -147,8 +147,8 @@ static const s64 link_freq[] = {
 	OV9282_LINK_FREQ,
 };
 
-/* Sensor mode registers */
-static const struct ov9282_reg mode_1280x720_regs[] = {
+/* Common registers */
+static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
 	{0x030d, 0x50},
 	{0x030e, 0x02},
@@ -179,13 +179,49 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x372d, 0x22},
 	{0x3731, 0x80},
 	{0x3732, 0x30},
-	{0x3778, 0x00},
 	{0x377d, 0x22},
 	{0x3788, 0x02},
 	{0x3789, 0xa4},
 	{0x378a, 0x00},
 	{0x378b, 0x4a},
 	{0x3799, 0x20},
+	{0x3881, 0x42},
+	{0x38a8, 0x02},
+	{0x38a9, 0x80},
+	{0x38b1, 0x00},
+	{0x38c4, 0x00},
+	{0x38c5, 0xc0},
+	{0x38c6, 0x04},
+	{0x38c7, 0x80},
+	{0x3920, 0xff},
+	{0x4010, 0x40},
+	{0x4043, 0x40},
+	{0x4307, 0x30},
+	{0x4317, 0x00},
+	{0x4501, 0x00},
+	{0x450a, 0x08},
+	{0x4601, 0x04},
+	{0x470f, 0x00},
+	{0x4f07, 0x00},
+	{0x4800, 0x20},
+	{0x5000, 0x9f},
+	{0x5001, 0x00},
+	{0x5e00, 0x00},
+	{0x5d00, 0x07},
+	{0x5d01, 0x00},
+	{0x0101, 0x01},
+	{0x1000, 0x03},
+	{0x5a08, 0x84},
+};
+
+struct ov9282_reg_list common_regs_list = {
+	.num_of_regs = ARRAY_SIZE(common_regs),
+	.regs = common_regs,
+};
+
+/* Sensor mode registers */
+static const struct ov9282_reg mode_1280x720_regs[] = {
+	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -208,40 +244,13 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3815, 0x11},
 	{0x3820, 0x3c},
 	{0x3821, 0x84},
-	{0x3881, 0x42},
-	{0x38a8, 0x02},
-	{0x38a9, 0x80},
-	{0x38b1, 0x00},
-	{0x38c4, 0x00},
-	{0x38c5, 0xc0},
-	{0x38c6, 0x04},
-	{0x38c7, 0x80},
-	{0x3920, 0xff},
 	{0x4003, 0x40},
 	{0x4008, 0x02},
 	{0x4009, 0x05},
 	{0x400c, 0x00},
 	{0x400d, 0x03},
-	{0x4010, 0x40},
-	{0x4043, 0x40},
-	{0x4307, 0x30},
-	{0x4317, 0x00},
-	{0x4501, 0x00},
 	{0x4507, 0x00},
 	{0x4509, 0x80},
-	{0x450a, 0x08},
-	{0x4601, 0x04},
-	{0x470f, 0x00},
-	{0x4f07, 0x00},
-	{0x4800, 0x20},
-	{0x5000, 0x9f},
-	{0x5001, 0x00},
-	{0x5e00, 0x00},
-	{0x5d00, 0x07},
-	{0x5d01, 0x00},
-	{0x0101, 0x01},
-	{0x1000, 0x03},
-	{0x5a08, 0x84},
 };
 
 /* Supported sensor mode configurations */
@@ -653,6 +662,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	const struct ov9282_reg_list *reg_list;
 	int ret;
 
+	/* Write common registers */
+	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
+				common_regs_list.num_of_regs);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write common registers");
+		return ret;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
 	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
-- 
2.34.1

