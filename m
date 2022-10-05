Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDA25F577C
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbiJEP3G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiJEP3A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:29:00 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7F6760C0
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:59 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so1064587wmb.3
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=01a+eYyocqSQT4oHgnQCSByq5FcmY7rLPJBSaZ0ZxC4=;
        b=DWI+ZDqo1zDs5557wPIGc8ZMPjyXgb4UDc1q1n8R9i9uVE9Zo3LfigQ0vp9Z76lOV/
         e0SFCedkQBRcaSKLzUZBMDG7Mtj4VY0I9ZIoiyLnkI2a6puB+yriOfg+9cCMfBqbx5wS
         qij0BKNPW6lY8IK2RmMSeu1Hs7ebhAgnD/ygMXMLQAdTArrAGT28VOBETP/wNjkwMCqM
         Sf8XALKPAhTfgCW0S4Jj4GF2uF+SC06NHKi3jCYFCyDa+DWApN3oH6KOTfglhKGQUttY
         oiHH4fSOvKWBASgFgiFFnpzskfLA7ddpLZeqlJAfoosZqONI+bbnxNPoEt4fjXooDxjb
         wCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=01a+eYyocqSQT4oHgnQCSByq5FcmY7rLPJBSaZ0ZxC4=;
        b=4IklzJUMBO7/nWEWJ1a/oMWSzDysQukx98JLFThM4drS4F8mdc4Yk7WtZunwb+1NS4
         fFePPTbWwa5uAoPNstgO2+u3lsIC0jft+maff76LH7Rp4+Q+ByUKJCvjkI9qYuqzOx0g
         5QmcCcaVVWEwLHizOZ6Jh7VZtYpkDyN03HP556tSJnXqTEIwhUzCZQmB9/AiOljAcBqy
         JwHJNbrszVsPZfyKAcke7nyW6rMPXvGYsjQQ96Oic40g9sfqSM2+wAsaQdaJhvbbUQhB
         R57zSgApcTLbG3YttN6idjlFWy+UJE3moxYitc8RN8klQ5TCyXA6aGtJC/g91XwrbBy1
         bDoQ==
X-Gm-Message-State: ACrzQf26Adnr/h4ZMkXN8GyR/zUnKjLmmBDPdCpUt/iHOSLrbR/9/Mmy
        yPFLCMqx/EQjoHztBtcKV2gygQ==
X-Google-Smtp-Source: AMsMyM6rdai+9U/8/oJ+TOFEHGJAfIoSaQ6PWI82A1OYE+WeHdlbjVWh/utGgNAHCOxyIl1XzJUWIQ==
X-Received: by 2002:a05:600c:3b1f:b0:3b4:b1fc:4797 with SMTP id m31-20020a05600c3b1f00b003b4b1fc4797mr3745647wms.129.1664983739104;
        Wed, 05 Oct 2022 08:28:59 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:58 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 13/16] media: i2c: ov9282: Add selection API calls for cropping info
Date:   Wed,  5 Oct 2022 16:28:06 +0100
Message-Id: <20221005152809.3785786-14-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As required by libcamera, add the relevant cropping targets
to report which portion of the sensor is being read out in
any mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8e86aa7e4b2a..d892f53fb1ea 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -67,6 +67,17 @@
 #define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
 				 OV9282_NUM_DATA_LANES / 10)
 
+/*
+ * OV9282 native and active pixel array size.
+ * 8 dummy rows/columns on each edge of a 1280x800 active array
+ */
+#define OV9282_NATIVE_WIDTH		1296U
+#define OV9282_NATIVE_HEIGHT		816U
+#define OV9282_PIXEL_ARRAY_LEFT		8U
+#define OV9282_PIXEL_ARRAY_TOP		8U
+#define OV9282_PIXEL_ARRAY_WIDTH	1280U
+#define OV9282_PIXEL_ARRAY_HEIGHT	800U
+
 #define OV9282_REG_MIN		0x00
 #define OV9282_REG_MAX		0xfffff
 
@@ -118,6 +129,7 @@ struct ov9282_mode {
 	u32 vblank_min;
 	u32 vblank_max;
 	u32 link_freq_idx;
+	struct v4l2_rect crop;
 	struct ov9282_reg_list reg_list;
 };
 
@@ -280,6 +292,16 @@ static const struct ov9282_mode supported_modes[] = {
 		.vblank_min = 41,
 		.vblank_max = 51540,
 		.link_freq_idx = 0,
+		.crop = {
+			/*
+			 * Note that this mode takes the top 720 lines from the
+			 * 800 of the sensor. It does not take a middle crop.
+			 */
+			.left = OV9282_PIXEL_ARRAY_LEFT,
+			.top = OV9282_PIXEL_ARRAY_TOP,
+			.width = 1280,
+			.height = 720
+		},
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -719,6 +741,58 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
 	return ov9282_set_pad_format(sd, sd_state, &fmt);
 }
 
+static const struct v4l2_rect *
+__ov9282_get_pad_crop(struct ov9282 *ov9282,
+		      struct v4l2_subdev_state *sd_state,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&ov9282->sd, sd_state, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &ov9282->cur_mode->crop;
+	}
+
+	return NULL;
+}
+
+static int ov9282_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP: {
+		struct ov9282 *ov9282 = to_ov9282(sd);
+
+		mutex_lock(&ov9282->mutex);
+		sel->r = *__ov9282_get_pad_crop(ov9282, sd_state, sel->pad,
+						sel->which);
+		mutex_unlock(&ov9282->mutex);
+
+		return 0;
+	}
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.top = 0;
+		sel->r.left = 0;
+		sel->r.width = OV9282_NATIVE_WIDTH;
+		sel->r.height = OV9282_NATIVE_HEIGHT;
+
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.top = OV9282_PIXEL_ARRAY_TOP;
+		sel->r.left = OV9282_PIXEL_ARRAY_LEFT;
+		sel->r.width = OV9282_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV9282_PIXEL_ARRAY_HEIGHT;
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
 /**
  * ov9282_start_streaming() - Start sensor stream
  * @ov9282: pointer to ov9282 device
@@ -963,6 +1037,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.enum_frame_size = ov9282_enum_frame_size,
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
+	.get_selection = ov9282_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.34.1

