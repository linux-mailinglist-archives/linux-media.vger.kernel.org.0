Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF4CE51CC70
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386567AbiEEXIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386560AbiEEXIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:06 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DF860064
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:25 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 125-20020a1c1983000000b003941f354c62so3451526wmz.0
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EIQSEG3+wGcsjDuomAoboBMgPUdN7Q2cDoJ9+phCwvA=;
        b=BSD0oQVLj1lqwXQ5ETdpZSOpIvWFeMreNECmj75npOEsZvg1rQeR/ar6895XKM2Ey6
         IN9WNS4PkWfn8Ov+VVyjUFTlaVdqZzoRQn1JwNq9qH0xXK8n6Rzguc8hoer6I+GG4oeP
         3Vkliieaxh6ImxN4WS78yEqr3pKsXP9WLKh7aML4u7xH+jQmQMA/6djLebxrD/kCsWhL
         h8OBuFHPDKIpIXUeXlFtSyaT3Rex7M38dKPISdyOUBng/1P0vaYMgBb8nea+IIezZgFX
         GkG2OGtjx3qtUsE0gAtzAHl8IeZ97iigsohwoQWR381fqRO6yKof8Rk21GFLNcKkrNz0
         BqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EIQSEG3+wGcsjDuomAoboBMgPUdN7Q2cDoJ9+phCwvA=;
        b=tAe5yPFMGXYvSRy+HNuR0N+vgSODnqweUbAeJJOy3b0zI4hYsgoy7geJcB00fJAE9T
         5Ljt/zNYe5xM5KmTs4ZWDwC/oXbN3SKEAHcixSaKp1ml9oRRyDNOVaqxr+FEj7YqG0Do
         UEB7FohIE2MKbmu010vgm1id9cJkNmuxA+DJt4SkNY2+5EhWUbm1KmIvn7AHvcsqHmL4
         /eSjh4SWWnqvvsbqf/LB79xA+bld789sllDuz6HQ+7HMIA8wsrcGpHA0EJIK7iCE1cXw
         5nHeIqDxB5+lcVF5J1cVcKoTpCVNshiCOmeoK79TK4/dMD55hUflODLSrAv7yb8UjgBe
         KWmg==
X-Gm-Message-State: AOAM532JPTRM0Y0w9DE5B1MqABnJ5mR5td0gtWZSpf8Qe2JWYLNYc6yK
        8Fu2fdwA4pdOcRI74VhIKOu6gDWFfaw=
X-Google-Smtp-Source: ABdhPJwCfhaUXumGDhZnx93eCKpucl1oRRR9YZku5YD5evt/KSbj13UyhKtc7SZMU3XpVfHNmoNdXg==
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id q22-20020a1ce916000000b0037cf44f0573mr7011354wmc.179.1651791863698;
        Thu, 05 May 2022 16:04:23 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:23 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 13/15] media: i2c: add ov7251_init_ctrls()
Date:   Fri,  6 May 2022 00:04:00 +0100
Message-Id: <20220505230402.449643-14-djrscally@gmail.com>
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

V4L2 controls initialisation takes up a sizeable portion of the
driver's .probe() function. To keep things neat, move it to a
dedicated function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v4:

	- None

Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 93 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 54c883753207..e50514bbb345 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1485,12 +1485,58 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
 	return 0;
 }
 
+static int ov7251_init_ctrls(struct ov7251 *ov7251)
+{
+	s64 pixel_rate;
+
+	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
+	ov7251->ctrls.lock = &ov7251->lock;
+
+	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+	ov7251->exposure = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					     V4L2_CID_EXPOSURE, 1, 32, 1, 32);
+	ov7251->gain = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
+					 V4L2_CID_GAIN, 16, 1023, 1, 16);
+	v4l2_ctrl_new_std_menu_items(&ov7251->ctrls, &ov7251_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
+				     0, 0, ov7251_test_pattern_menu);
+
+	pixel_rate = pixel_rates[ov7251->link_freq_idx];
+	ov7251->pixel_clock = v4l2_ctrl_new_std(&ov7251->ctrls,
+						&ov7251_ctrl_ops,
+						V4L2_CID_PIXEL_RATE,
+						pixel_rate, INT_MAX,
+						pixel_rate, pixel_rate);
+	ov7251->link_freq = v4l2_ctrl_new_int_menu(&ov7251->ctrls,
+						   &ov7251_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   ARRAY_SIZE(link_freq) - 1,
+						   ov7251->link_freq_idx,
+						   link_freq);
+	if (ov7251->link_freq)
+		ov7251->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (ov7251->pixel_clock)
+		ov7251->pixel_clock->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	ov7251->sd.ctrl_handler = &ov7251->ctrls;
+
+	if (ov7251->ctrls.error) {
+		v4l2_ctrl_handler_free(&ov7251->ctrls);
+		return ov7251->ctrls.error;
+	}
+
+	return 0;
+}
+
 static int ov7251_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	unsigned int rate = 0, clk_rate = 0;
-	s64 pixel_rate;
 	int ret;
 	int i;
 
@@ -1571,46 +1617,10 @@ static int ov7251_probe(struct i2c_client *client)
 
 	mutex_init(&ov7251->lock);
 
-	v4l2_ctrl_handler_init(&ov7251->ctrls, 7);
-	ov7251->ctrls.lock = &ov7251->lock;
-
-	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-			  V4L2_CID_HFLIP, 0, 1, 1, 0);
-	v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-			  V4L2_CID_VFLIP, 0, 1, 1, 0);
-	ov7251->exposure = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-					     V4L2_CID_EXPOSURE, 1, 32, 1, 32);
-	ov7251->gain = v4l2_ctrl_new_std(&ov7251->ctrls, &ov7251_ctrl_ops,
-					 V4L2_CID_GAIN, 16, 1023, 1, 16);
-	v4l2_ctrl_new_std_menu_items(&ov7251->ctrls, &ov7251_ctrl_ops,
-				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
-				     0, 0, ov7251_test_pattern_menu);
-
-	pixel_rate = pixel_rates[ov7251->link_freq_idx];
-	ov7251->pixel_clock = v4l2_ctrl_new_std(&ov7251->ctrls,
-						&ov7251_ctrl_ops,
-						V4L2_CID_PIXEL_RATE,
-						pixel_rate, INT_MAX,
-						pixel_rate, pixel_rate);
-	ov7251->link_freq = v4l2_ctrl_new_int_menu(&ov7251->ctrls,
-						   &ov7251_ctrl_ops,
-						   V4L2_CID_LINK_FREQ,
-						   ARRAY_SIZE(link_freq) - 1,
-						   ov7251->link_freq_idx,
-						   link_freq);
-	if (ov7251->link_freq)
-		ov7251->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	if (ov7251->pixel_clock)
-		ov7251->pixel_clock->flags |= V4L2_CTRL_FLAG_READ_ONLY;
-
-	ov7251->sd.ctrl_handler = &ov7251->ctrls;
-
-	if (ov7251->ctrls.error) {
-		dev_err(dev, "%s: control initialization error %d\n",
-			__func__, ov7251->ctrls.error);
-		ret = ov7251->ctrls.error;
-		goto free_ctrl;
+	ret = ov7251_init_ctrls(ov7251);
+	if (ret) {
+		dev_err_probe(dev, ret, "error during v4l2 ctrl init\n");
+		goto destroy_mutex;
 	}
 
 	v4l2_i2c_subdev_init(&ov7251->sd, client, &ov7251_subdev_ops);
@@ -1684,6 +1694,7 @@ static int ov7251_probe(struct i2c_client *client)
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
+destroy_mutex:
 	mutex_destroy(&ov7251->lock);
 
 	return ret;
-- 
2.25.1

