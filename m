Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 639544C3A21
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234368AbiBYAIx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbiBYAIv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:51 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35FB14A214
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:20 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s13so2030141wrb.6
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjwCnixQ6naZ1BlTQDcmulbhoLUgbDdxxRG+E3CFEx8=;
        b=bOJLH83/Wk7Z+S6IDaiK+V2ZShBbVyZbtzEz6onlwUZdpsuUAwXklc+oG//2HsjdQ3
         6gkU92uRICRtgN8y/XilfvNg5FAf5QevAZ5xB8cZKJzGca+88zZnJvP3Q4IsMqzSvoGl
         zU1tGI+A8RaFJ9JEG2EaewUlhAWJbWSkO9aN5X88tt4LzbhO8WkOgCbxMzpKnJfGlc26
         vyG2ui+3g0oEcY9NqMZ6IeAg1U7jHz9IHBlgM8IbALU+KhLNtmb9yO7sEyVqKgRxQpGP
         I6xgMbfUIIjK8njkLGzBdkM+90s2tAAmNZMN8eSJZ9ZgpSZ0iYNwukK4lU4cGf3c+8lr
         8MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjwCnixQ6naZ1BlTQDcmulbhoLUgbDdxxRG+E3CFEx8=;
        b=AdFJTnWqUvMCNtye5+ozNE5lRPa4YSiDAN3dDUH2ckfXCJERqdoe2MDiXkX58QQQ1X
         lYil1k+zDOVqAZROsFg1TNLeR4BjZ+EssLaIR1f6WKXH+WjA1CcFT6fgTL2HU3LLuMMN
         ESgxuoqn6l7LJ1sDPIq1GGLryc68g17tqxIPVIfoEi1t8QBabeLaHBOQ5AkfKfoIDClc
         Nq1CchGmmr1fOjuwniqUmyG0JMb2298P8jPkUMWumG8CW8N4bllWu0xdhMtClSlnZkKA
         SUFAujIoa721aB74pdhmSqvNiTT1ZReu11s/pJE+lF6e+af7EudSwiev5y3VnAmOWsbM
         mE5w==
X-Gm-Message-State: AOAM532ln+Fq8hL7mgLGNkNJFfYLtK6cdKNMtSyULtzeK6puTPXzCEi6
        3K8YTuMqmgiUW2mQPFwhErVRG9JT9BAZTQ==
X-Google-Smtp-Source: ABdhPJzEAhb3veonNhAGtOZFQuxztNd9N3tiJrYb2AmilXZsqYaSYF+FPQlJlLypxs3HlnqzKJWbog==
X-Received: by 2002:a05:6000:1868:b0:1ea:9118:52da with SMTP id d8-20020a056000186800b001ea911852damr4212802wri.381.1645747699251;
        Thu, 24 Feb 2022 16:08:19 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:18 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 05/11] media: i2c: Remove per-mode frequencies from ov7251
Date:   Fri, 25 Feb 2022 00:07:47 +0000
Message-Id: <20220225000753.511996-6-djrscally@gmail.com>
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

Each of the defined modes in the ov7251 driver uses the same link
frequency and pixel rate; just drop those members of the modes and
set the controls to read only during initialisation. Add a new
table defining the supported pixel rates to substitue for the values
hardcoded in the modes.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- New patch

 drivers/media/i2c/ov7251.c | 43 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 613b2c80a2a8..90bf6a868741 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -526,7 +526,11 @@ static const struct reg_value ov7251_setting_vga_90fps[] = {
 };
 
 static const s64 link_freq[] = {
-	240000000,
+	[OV7251_LINK_FREQ_240_MHZ] = 240000000,
+};
+
+static const s64 pixel_rates[] = {
+	[OV7251_LINK_FREQ_240_MHZ] = 48000000,
 };
 
 static const struct ov7251_mode_info ov7251_mode_info_data[] = {
@@ -535,8 +539,6 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 		.height = 480,
 		.data = ov7251_setting_vga_30fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_30fps),
-		.pixel_clock = 48000000,
-		.link_freq = 0, /* an index in link_freq[] */
 		.exposure_max = 1704,
 		.exposure_def = 504,
 		.timeperframe = {
@@ -549,8 +551,6 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 		.height = 480,
 		.data = ov7251_setting_vga_60fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_60fps),
-		.pixel_clock = 48000000,
-		.link_freq = 0, /* an index in link_freq[] */
 		.exposure_max = 840,
 		.exposure_def = 504,
 		.timeperframe = {
@@ -563,8 +563,6 @@ static const struct ov7251_mode_info ov7251_mode_info_data[] = {
 		.height = 480,
 		.data = ov7251_setting_vga_90fps,
 		.data_size = ARRAY_SIZE(ov7251_setting_vga_90fps),
-		.pixel_clock = 48000000,
-		.link_freq = 0, /* an index in link_freq[] */
 		.exposure_max = 552,
 		.exposure_def = 504,
 		.timeperframe = {
@@ -1059,16 +1057,6 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 	__crop->height = new_mode->height;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
-		ret = __v4l2_ctrl_s_ctrl_int64(ov7251->pixel_clock,
-					       new_mode->pixel_clock);
-		if (ret < 0)
-			goto exit;
-
-		ret = __v4l2_ctrl_s_ctrl(ov7251->link_freq,
-					 new_mode->link_freq);
-		if (ret < 0)
-			goto exit;
-
 		ret = __v4l2_ctrl_modify_range(ov7251->exposure,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
@@ -1199,16 +1187,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
 	if (new_mode != ov7251->current_mode) {
-		ret = __v4l2_ctrl_s_ctrl_int64(ov7251->pixel_clock,
-					       new_mode->pixel_clock);
-		if (ret < 0)
-			goto exit;
-
-		ret = __v4l2_ctrl_s_ctrl(ov7251->link_freq,
-					 new_mode->link_freq);
-		if (ret < 0)
-			goto exit;
-
 		ret = __v4l2_ctrl_modify_range(ov7251->exposure,
 					       1, new_mode->exposure_max,
 					       1, new_mode->exposure_def);
@@ -1318,6 +1296,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
+	s64 pixel_rate;
 	int ret;
 
 	ov7251 = devm_kzalloc(dev, sizeof(struct ov7251), GFP_KERNEL);
@@ -1399,17 +1378,23 @@ static int ov7251_probe(struct i2c_client *client)
 				     V4L2_CID_TEST_PATTERN,
 				     ARRAY_SIZE(ov7251_test_pattern_menu) - 1,
 				     0, 0, ov7251_test_pattern_menu);
+
+	pixel_rate = pixel_rates[ov7251->link_freq_idx];
 	ov7251->pixel_clock = v4l2_ctrl_new_std(&ov7251->ctrls,
 						&ov7251_ctrl_ops,
 						V4L2_CID_PIXEL_RATE,
-						1, INT_MAX, 1, 1);
+						pixel_rate, INT_MAX,
+						pixel_rate, pixel_rate);
 	ov7251->link_freq = v4l2_ctrl_new_int_menu(&ov7251->ctrls,
 						   &ov7251_ctrl_ops,
 						   V4L2_CID_LINK_FREQ,
 						   ARRAY_SIZE(link_freq) - 1,
-						   0, link_freq);
+						   ov7251->link_freq_idx,
+						   link_freq);
 	if (ov7251->link_freq)
 		ov7251->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	if (ov7251->pixel_clock)
+		ov7251->pixel_clock->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	ov7251->sd.ctrl_handler = &ov7251->ctrls;
 
-- 
2.25.1

