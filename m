Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413E951B1E3
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379016AbiEDWek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379020AbiEDWec (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:32 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0545F2B242
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:54 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id x18so3838908wrc.0
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m//43Rp7njXORy91OJCD5DVgj0T57kwW6CzMCnhDzqE=;
        b=dNAKk2lRalsl6nVQZ2G3QRIbIb4c1zmr7+vrJBpW/lTGzDadPtgQxg1/+55O01HoqD
         BcY8FRY7P7dRlxybxukhQ8VTLFcYNYgUDekF3j/C/BUmpQb5T04f6cFUiQiR3GrokPbi
         IfoGwWlGOqxHyy+IU7k1ECXhDWyMZJL8I7AAPbKRmKeOAFsb5x2o/9cf8/CLhmq8uFnz
         sXv6GWMqzopKij57zSTiYgfj8mzgG2rkUX84KK//B2GGM3a8IJJ/EXsmRkajJ+fCJSY8
         yKwOw+VyJHL0FTINmMVrxyNrMCcZjrg07/3EZKVMgRRMN+wbA19g59Cpj2Pmjy6o+2Pe
         fDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m//43Rp7njXORy91OJCD5DVgj0T57kwW6CzMCnhDzqE=;
        b=FLsF73zkOe+J/DQYacw1MSRIJj7k9QANGb6bAk8JU4mbWKeSOC1nxnFfPdT6j5JfI3
         bIPl3uWxW7PTXO4HemQHgKpKNWqKE/xxqLaVnY2MsKaLD7yqbdGMeQAMAOX3cl6Giqy2
         gXW8E1+5AYy6McmAX3j6fuTHuWDkcmHBz3QDSCnmwM3lGNuNSQoVhxk/tp2fDV/BlKmo
         jAdSkPabnYHLEx/bNsK5gfZXzIz4DsU5TRURAPMg88VDgEpYe4bM6uq0REvq8jAoz81y
         issLNU5/6Or3h016FpWd39DmHetMj/4feo31+KTSB8ghjYDxJ3IVTn9YeJhYvuIWZiHQ
         ARRw==
X-Gm-Message-State: AOAM532GfT+5sTX2z9Bik7zz1I4O5YEFKfKAy2/z1wJjHMOtI0ky+53T
        cgzLL3bg1yNQtzJAiWFHlPMiTYVLef0=
X-Google-Smtp-Source: ABdhPJz7mOj4asuIG00+XTOamd90hr1n/r80CVxRO7GGVfl4IEZCHlzGAH9q2CfgzAoguLZ77U8oWw==
X-Received: by 2002:a5d:64e7:0:b0:20c:5b42:a93c with SMTP id g7-20020a5d64e7000000b0020c5b42a93cmr14759645wri.619.1651703452541;
        Wed, 04 May 2022 15:30:52 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:52 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 13/15] media: i2c: add ov7251_init_ctrls()
Date:   Wed,  4 May 2022 23:30:25 +0100
Message-Id: <20220504223027.3480287-14-djrscally@gmail.com>
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

V4L2 controls initialisation takes up a sizeable portion of the
driver's .probe() function. To keep things neat, move it to a
dedicated function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- New patch

 drivers/media/i2c/ov7251.c | 93 +++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 40e42d19cddd..b7d89ad49887 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1487,12 +1487,58 @@ static int ov7251_detect_chip(struct ov7251 *ov7251)
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
 
@@ -1573,46 +1619,10 @@ static int ov7251_probe(struct i2c_client *client)
 
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
@@ -1686,6 +1696,7 @@ static int ov7251_probe(struct i2c_client *client)
 	media_entity_cleanup(&ov7251->sd.entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&ov7251->ctrls);
+destroy_mutex:
 	mutex_destroy(&ov7251->lock);
 
 	return ret;
-- 
2.25.1

