Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB1B611739
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbiJ1QPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiJ1QOh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:37 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23129DF68
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:49 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id y10so3518590wma.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/je66IiGVgC9A+utpVJnpRaQP1n7ybCAbgw5Pm2x/Wc=;
        b=lquWS5WOwiyIohW8+EcJ46EZb+7Bg2wlVGPOFnAAQcQV5IE6cWm/IeJpQW1DZeEql3
         QqZAhY22wiV7L/7t0jXfWQH84Thi8A+LYVwLbcrgc0uC7hziFFEjXy7S7ORiaRsqbkoj
         4T5UiLfLGL6laTXfrSh2YVbnIHkub8bLr3Q7GVx1FFoVkKBCx/fTWox++4Eg0zMdbUiS
         vKcXmlbGL+Dy+e9rR1VzLzqTSny17m5+aurjPDbHKrnxYrCpOhUesWqXmZI6nOq9wBKv
         z8oVxU3MFjfFHcKnc6C2/RE13KPlaP3a+mMv2OjhImSlkTOzP1VzSPwLQyvVny82QVHc
         uXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/je66IiGVgC9A+utpVJnpRaQP1n7ybCAbgw5Pm2x/Wc=;
        b=tHqg72K9Q/A4RLc/MZH/+jXxjw7pMQov2kUhLOHYigtr0uLXc+rLsV/Ud8KzBfBb2U
         kHyYe7fNn+1/PBzayTOO9xJU1HikyNZ2iqI2SYRIZA/ZU2WFeZ3aj86eL+MapiQH1bBJ
         jy5hBM/SSYbdH5RFmIqVeWBQLYmLvHqfnJJzuBXmMatD2ukgDyQcBc/i8nCmy3kmx31B
         2G4zmrK3O/N1dQQbPK9Bayn7/wMO1lUBbh+x//RQPLckqjORPpes14gqlVt0GsJucveJ
         VA5stlxjkvi+Y7IqX5W6+LAsBMqPu9eguvgRp/SvowuSYESZO8JVmh9T+CZ6tnXobe2z
         PxRQ==
X-Gm-Message-State: ACrzQf2h7ZB6JuxiR2NYRPVlZ0jCDkUloJFnGKYCbJFVG+kmbTGaZzHE
        UO5MQO63axphIyjQKJ+Bh8OMhQ==
X-Google-Smtp-Source: AMsMyM4ul5pkMXo0h38HYfpA5laienDYpPszMB5HtBpaalJi0wSQP7l54u7f3wOzS43dm6EjwhziSg==
X-Received: by 2002:a05:600c:3585:b0:3b4:a308:1581 with SMTP id p5-20020a05600c358500b003b4a3081581mr10281089wmq.77.1666973567670;
        Fri, 28 Oct 2022 09:12:47 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:47 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 05/16] media: i2c: ov9281: Support more than 1 mode.
Date:   Fri, 28 Oct 2022 17:08:51 +0100
Message-Id: <20221028160902.2696973-6-dave.stevenson@raspberrypi.com>
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

The driver currently has multiple assumptions that there is
only one supported mode.

Convert supported_mode to an array, and fix up all references
to correctly look at that array.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 46 +++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 123aa20951b7..1524189cf3e5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -217,6 +217,10 @@ struct ov9282_reg_list common_regs_list = {
 	.regs = common_regs,
 };
 
+#define MODE_1280_720		0
+
+#define DEFAULT_MODE		MODE_1280_720
+
 /* Sensor mode registers */
 static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3778, 0x00},
@@ -252,17 +256,19 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
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
+	[MODE_1280_720] = {
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
 
@@ -526,15 +532,15 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_frame_size_enum *fsize)
 {
-	if (fsize->index > 0)
+	if (fsize->index >= ARRAY_SIZE(supported_modes))
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
@@ -609,7 +615,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov9282->mutex);
 
-	mode = &supported_mode;
+	mode = v4l2_find_nearest_size(supported_modes,
+				      ARRAY_SIZE(supported_modes),
+				      width, height,
+				      fmt->format.width,
+				      fmt->format.height);
 	ov9282_fill_pad_format(ov9282, mode, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
@@ -642,7 +652,7 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	ov9282_fill_pad_format(ov9282, &supported_mode, &fmt);
+	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE], &fmt);
 
 	return ov9282_set_pad_format(sd, sd_state, &fmt);
 }
@@ -1043,8 +1053,8 @@ static int ov9282_probe(struct i2c_client *client)
 		goto error_power_off;
 	}
 
-	/* Set default mode to max resolution */
-	ov9282->cur_mode = &supported_mode;
+	/* Set default mode to first mode */
+	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
 	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
-- 
2.34.1

