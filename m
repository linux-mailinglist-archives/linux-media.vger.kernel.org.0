Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A379A51B1E1
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378998AbiEDWe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378988AbiEDWe0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:26 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0ECB2D1F0
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id i20-20020a05600c355400b0039456976dcaso1801345wmq.1
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P1QaVmRJwjnZ2MMq/nBSQV6D5HxzClMsYDbecLw36iM=;
        b=XwL7y4wF5rduiDiOFUQEY+paA6pTmohOZ50RCWP1KL3jIEUXG3f0xfeZvRfE4uZNN2
         z6h1PbqP8TX3fA+xxG8H8Pm1rKkP86ayKykQpEg24Cb1nwTHCJWQe92z+3nQ1Lo1QpM4
         2cvtO2GoAy9qqTnksRIv7yzrtrkmwhLfFTphTC1cbVYDleEjNLy/9zoI2+TDIaubgsWg
         YIKA/Wf7onD1WOCye7d/vxIkk8I5/nOpntHrbidLnNR8Px8Y1g6ysRmsKk/eKsrSbtvA
         nA8A3hILCyWOYLeMj6StDDoZqc2IdpeJBWLEPNPcvIgfJtKNAK0Dac+fSdxQ+2BV/DR5
         imEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P1QaVmRJwjnZ2MMq/nBSQV6D5HxzClMsYDbecLw36iM=;
        b=ZHpplxPqymPz3U7sw/LRMZHu9J5PQR2JEtN3SVY5A9hjtxz5E4Od0r4CqCuyDhyRL8
         0gAVNwqMDixoP7H8wAjzaot54FT0cOI78icuH45M3mwMKMlMbAszoNi2fjjdCsS3OgAW
         AGvCNFDE1UJf5OPMFsL1vxBibB47HVnhbyod8WS5RIRY0+3w7OkzQmqt5PqvZUlfWZ3c
         2rizHdG3CPvcW5P6amiopO51j6Xf8d01zW/caGqR7o4ue2o2KS1fuytEacJOAma5bjeN
         Qvjz3//m28fyWl9YEYdSU22JPTugM4kbwAG5x+hNLE2Eo76kRW0MY0iDgMnv7DqqfcIQ
         G8aQ==
X-Gm-Message-State: AOAM533j691O2IXoVZCxvlsgBFjhVLePFTtGqJY1AVH+yYRcfB3jiRzg
        BvmT1Z+vgAvXUiBA/8Vmy1kQrYZfKS8=
X-Google-Smtp-Source: ABdhPJxLPw2NId/q65eP1+zxSCCwhOYxHM9EE6rqHbpDkfmGSHhHy60xDfkB/4YXQV/jsNM/rU3K6w==
X-Received: by 2002:a05:600c:3d96:b0:38f:fbc6:da44 with SMTP id bi22-20020a05600c3d9600b0038ffbc6da44mr1465171wmb.93.1651703445418;
        Wed, 04 May 2022 15:30:45 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:44 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 05/15] media: i2c: Remove per-mode frequencies from ov7251
Date:   Wed,  4 May 2022 23:30:17 +0100
Message-Id: <20220504223027.3480287-6-djrscally@gmail.com>
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

Each of the defined modes in the ov7251 driver uses the same link
frequency and pixel rate; just drop those members of the modes and
set the controls to read only during initialisation. Add a new
table defining the supported pixel rates to substitue for the values
hardcoded in the modes.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

Changes in v2:

	- New patch

 drivers/media/i2c/ov7251.c | 43 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f1965c8adbd7..f21119064b2d 100644
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
@@ -1317,6 +1295,7 @@ static int ov7251_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct ov7251 *ov7251;
 	u8 chip_id_high, chip_id_low, chip_rev;
+	s64 pixel_rate;
 	int ret;
 
 	ov7251 = devm_kzalloc(dev, sizeof(struct ov7251), GFP_KERNEL);
@@ -1398,17 +1377,23 @@ static int ov7251_probe(struct i2c_client *client)
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

