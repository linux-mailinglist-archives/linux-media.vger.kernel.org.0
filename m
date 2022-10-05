Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04DB65F5774
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiJEP24 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJEP2x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:53 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716344B9BE
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:52 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f11so23837793wrm.6
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=u48U+IK6M8Tybj3w4BxGG2Sv9mA9uX0DERliKfCIBNY=;
        b=NHg9TtYaq0rrPvOlmB5+4d+h4ZDpNoaTGGFElByWHEp1c2K8FFybHy9gNOvkyEFxyD
         LY191gTj0NdsWYL83BiQ/dqe/2GAvR//yWX94nBWcIVzexoUtASa9qAHgH6a/06+3t29
         CLW2JnuRKQFvwJK43FlcJyTCSBWe7xcNDYM45cQDEbMRVQCwFYsvsUsGuIPP6ob5zopb
         jp5EkCqult6plA8P7civb3ny0LgSnfZVwHyPHVyfNcbVdVq8EX+Cu6BV5rr+GHSSrhEi
         tNX8wfOymbmTHCg2tI93aozl7iKfj7wuUgHlM7pRnGCIWaPVspgPfFrINcPs3RgD6s4V
         tMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u48U+IK6M8Tybj3w4BxGG2Sv9mA9uX0DERliKfCIBNY=;
        b=SiXH7UQFgQGMNvPWCQaPmCpNErkZeYKpBa6lS9xNgYK6Lr7oGuVS4M2pbe/TxfbGca
         sJ4gyAEz0TeGkYmWgo9WQfRwu6DzQMFKzcnWVnHyNDYeDr8PrGoa1eLEY0uo+aNjpQhx
         in8DWA/57ntxesyRO2aLHaFGzvB/isgvlGqDy8P9YskgE4/kmBc3YrHc17lICsGv6SO/
         pjPWY85mdaPGJ8dvp+kCiKiVwrny6cixljnmmKpQp50VWJ8NRJjzd0A6D5qfiRke9ZZx
         HzMBSylk3IbiFwJLgXEtXL6T62hKvsB9PxrDp2zRs0PvQRMTSD2FCBh7iRrSqdQ+epLl
         TaqA==
X-Gm-Message-State: ACrzQf3vGyZ7bzisCnRAMYEfXRWZAvqueSbQx5FK8/ig6F1qRqiJwmrr
        H75U0qRxYcAF8VJhIXj1C8Iaqg==
X-Google-Smtp-Source: AMsMyM5j+kvw+TCPZZzqCe4vQUe9r0j7FrqZ4Livtql+ttRsCgz0kvoeo4XdIaLd3u/6rkk50ke8JQ==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id d1-20020a5d4f81000000b0021e2cd725dfmr180206wru.439.1664983730710;
        Wed, 05 Oct 2022 08:28:50 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:49 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 05/16] media: i2c: ov9281: Support more than 1 mode.
Date:   Wed,  5 Oct 2022 16:27:58 +0100
Message-Id: <20221005152809.3785786-6-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
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

The driver currently has multiple assumptions that there is
only one supported mode.

Convert supported_mode to an array, and fix up all references
to correctly look at that array.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 44 ++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 798ff8ba50bd..f7823d584522 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -262,20 +262,24 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 };
 
 /* Supported sensor mode configurations */
-static const struct ov9282_mode supported_mode = {
-	.width = 1280,
-	.height = 720,
-	.hblank = 250,
-	.vblank = 1022,
-	.vblank_min = 151,
-	.vblank_max = 51540,
-	.link_freq_idx = 0,
-	.reg_list = {
-		.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
-		.regs = mode_1280x720_regs,
+static const struct ov9282_mode supported_modes[] = {
+	{
+		.width = 1280,
+		.height = 720,
+		.hblank = 250,
+		.vblank = 1022,
+		.vblank_min = 151,
+		.vblank_max = 51540,
+		.link_freq_idx = 0,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
+			.regs = mode_1280x720_regs,
+		},
 	},
 };
 
+#define OV9282_NUM_MODES ARRAY_SIZE(supported_modes)
+
 /**
  * to_ov9282() - ov9282 V4L2 sub-device to ov9282 device.
  * @subdev: pointer to ov9282 V4L2 sub-device
@@ -536,15 +540,15 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
 {
-	if (fsize->index > 0)
+	if (fsize->index >= OV9282_NUM_MODES)
 		return -EINVAL;
 
 	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
 		return -EINVAL;
 
-	fsize->min_width = supported_mode.width;
+	fsize->min_width = supported_modes[fsize->index].width;
 	fsize->max_width = fsize->min_width;
-	fsize->min_height = supported_mode.height;
+	fsize->min_height = supported_modes[fsize->index].height;
 	fsize->max_height = fsize->min_height;
 
 	return 0;
@@ -619,7 +623,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov9282->mutex);
 
-	mode = &supported_mode;
+	mode = v4l2_find_nearest_size(supported_modes,
+				      OV9282_NUM_MODES,
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
 	ov9282_fill_pad_format(ov9282, mode, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
@@ -652,7 +660,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
+	ov9282_fill_pad_format(ov9282, &supported_modes[0], &fmt);
 
 	return ov9282_set_pad_format(sd, sd_state, &fmt);
 }
@@ -1081,8 +1089,8 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	/* Set default mode to max resolution */
-	ov9282->cur_mode = &supported_mode;
+	/* Set default mode to first mode */
+	ov9282->cur_mode = &supported_modes[0];
 	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
-- 
2.34.1

