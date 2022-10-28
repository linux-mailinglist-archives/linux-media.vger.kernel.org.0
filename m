Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3388B611741
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiJ1QP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbiJ1QOy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:54 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C14A1FB78F
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so4172039wmb.0
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLONcpe1wBJCaR5ji2PqPS5DxS7tp+cxzI4V/jr+aEU=;
        b=qGVxZ0+OFzyPmVbOaWzWvXHZc+UGU71z+vVCzDhu8M8SAquqHzxzlBMIKz0e4XffiJ
         6O0SzpgzJ+k6jLCLJ1Fda6fRgLpx7EdPFdaza3fwnpb7vmBA1vcr6XoBaCMkARevK1ks
         K6hbhaFWjs6yXwDXnJHD2S+pLmJcIhlAR5bKcofQK7LDH/oljm5obGpGSjF8cbjh21Bh
         s/v8+MNqqK+KaHr/fGR2BGa+GQpIHLSQcQxVRRHRnMQTQEQsvmx2ajYNIcbrYL9jTD9z
         ulyjZ8hPK/i+Xdi8Hd2RsWCWCtY9qn1eixLwqU039g+RWYxNV21kKSzcmZ6oHwk4EOaI
         PYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLONcpe1wBJCaR5ji2PqPS5DxS7tp+cxzI4V/jr+aEU=;
        b=Crxkr0hqn/+3fl71siiFml8Fphs2lopjl8JmLqRDKXbL+cl14YiygMt2D7Vf5gMd/T
         j+zth6Ji7yFWfarlKuPF9gfCqq6pu5Wbep1kknPH88LC6kZ3lM/LspJa/H3DEFbCsro6
         MvlmV5o+xlM7KubXbbh6bvcrzsFJTnqJ6aSnDp08j1dasxKpsy2AXYAT4sp18a0PcmTK
         9nnLMQTOg7Efwx9z8phN9HnMeoi0/N6MiMdTwi2eRkJlYolrZU1NdRGMj8zR1W9t6Hhn
         7bNB5pdDno4vHV8feCIcNMcimPEXUMis5QCUAAdnHyFuGHNX7uZ2sin4As1VciGQKdwL
         W/nQ==
X-Gm-Message-State: ACrzQf2CSDvlAu8a81NukhpmoG+/opHdNYIkxjOcDZgNFa4/x8YC//BN
        iF7noKjjO1WEE/sAFRgbwv2ulw==
X-Google-Smtp-Source: AMsMyM5VO7rkpJaqUWXnWPQ215Z0U+w2yj9wM8eqHLoYdvWA+s+DNe/07CrcK0KgmVh5ahRIxzovTg==
X-Received: by 2002:a05:600c:3d92:b0:3c7:12c6:a99f with SMTP id bi18-20020a05600c3d9200b003c712c6a99fmr11161wmb.136.1666973575506;
        Fri, 28 Oct 2022 09:12:55 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:54 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 13/16] media: i2c: ov9282: Add selection API calls for cropping info
Date:   Fri, 28 Oct 2022 17:08:59 +0100
Message-Id: <20221028160902.2696973-14-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
References: <20221028160902.2696973-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
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
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 75 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 2313d5e717f3..a520d9fef0cb 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -66,6 +66,17 @@
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
 
@@ -109,6 +120,7 @@ struct ov9282_mode {
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
@@ -720,6 +742,58 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
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
@@ -938,6 +1012,7 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.enum_frame_size = ov9282_enum_frame_size,
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
+	.get_selection = ov9282_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.34.1

