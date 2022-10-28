Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDC7611744
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJ1QPi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230321AbiJ1QOz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:55 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7908F1F8137
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:58 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so5693952wms.1
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GttpLELLpWw2JHGHgE1C0hoW9jnug4HdbMelLQAyY04=;
        b=kNeDFmdNd1uktBztkWS/M2IAt6fKDK2tVDTT3dmJ5CkSxFJMvuReLK9TYSCr9y9h5r
         R9XdOhXp3c3Hs+I6jJ3e1Di7rZM8RrHBsqqRQ2kb6+QpemisNs/tglKXThfbqs82Kin4
         vqALalky8GE775BSik8Zb1Zbp2+VABcujF59efWcZgjMjvRHlp6VuzIuGxpqLCTkHaqA
         T5Okp3Qp37evDUNUG0Cc+yg3yG0JdJxcMLx6Vvnbv4lULqkqgJK/WnTIARUp/eHYNM5d
         EiMjS2QtPkniM7NOwMFRmGz3SUO8e8tFijSAuT2Y4sbrqRavQKx0lDXj5jBTShqhARET
         3Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GttpLELLpWw2JHGHgE1C0hoW9jnug4HdbMelLQAyY04=;
        b=dxZH2mKvlIOoRurRtsDqWDYU7d6en/P7bSf7UWtYvgWN1SDK0pmIVXJP+N5QcoBdln
         E8M4g+rKJ8UJYVlINF48BkfYzv5m81d8DAKB7SBXfff1xIoz4OjrBS01lCXMnK4+b+xQ
         8ltm9m8bjpfco/yCcAUUqt7SWV++LImiuIP1RgqWQCJ6CEml3OqGtdi3J4vq16hEdD2Y
         ADW4r2yr1mkGb3PK28hNRpwmbdMB9kKA8QyxHLWci0yo6B2wSN7zBtWXPD7O4veBnBz0
         ar2dpKnxfnZXNH3O3OwE3pSHWI8k08g04zItdqoYwRUVNpGGlcKaqNqSSmcv59BTiQYb
         AXew==
X-Gm-Message-State: ACrzQf0OpnuFZv/lLeiNnVfEbJroWpsK8rCQmg0uOkJM3ZhATSxWSA82
        DEW3sYH7wyzMFmh9zL5qbRkV5w==
X-Google-Smtp-Source: AMsMyM5EX2Gjj+fw8VZQCe5oBhvq345/tSyFz1qCcAZaW8EyMHGu3iwno16mAzz2kWsW7lZxHFTCAA==
X-Received: by 2002:a1c:3503:0:b0:3c6:fb2a:b115 with SMTP id c3-20020a1c3503000000b003c6fb2ab115mr39356wma.10.1666973577013;
        Fri, 28 Oct 2022 09:12:57 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:56 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 15/16] media: i2c: ov9282: Add support for 8bit readout
Date:   Fri, 28 Oct 2022 17:09:01 +0100
Message-Id: <20221028160902.2696973-16-dave.stevenson@raspberrypi.com>
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

The sensor supports 8 or 10 bit readout modes, but the
driver only supported 10 bit.

Add 8 bit readout.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 95 +++++++++++++++++++++++++++++++-------
 1 file changed, 78 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c169b532ec8b..e2a98f480b58 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -21,6 +21,10 @@
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
+#define OV9282_REG_PLL_CTRL_0D	0x030d
+#define OV9282_PLL_CTRL_0D_RAW8		0x60
+#define OV9282_PLL_CTRL_0D_RAW10	0x50
+
 #define OV9282_REG_TIMING_HTS	0x380c
 #define OV9282_TIMING_HTS_MAX	0x7fff
 
@@ -48,6 +52,10 @@
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
 
+#define OV9282_REG_ANA_CORE_2	0x3662
+#define OV9282_ANA_CORE2_RAW8	0x07
+#define OV9282_ANA_CORE2_RAW10	0x05
+
 #define OV9282_REG_TIMING_FORMAT_1	0x3820
 #define OV9282_REG_TIMING_FORMAT_2	0x3821
 #define OV9282_FLIP_BIT			BIT(2)
@@ -63,8 +71,10 @@
 #define OV9282_NUM_DATA_LANES	2
 
 /* Pixel rate */
-#define OV9282_PIXEL_RATE	(OV9282_LINK_FREQ * 2 * \
-				 OV9282_NUM_DATA_LANES / 10)
+#define OV9282_PIXEL_RATE_10BIT		(OV9282_LINK_FREQ * 2 * \
+					 OV9282_NUM_DATA_LANES / 10)
+#define OV9282_PIXEL_RATE_8BIT		(OV9282_LINK_FREQ * 2 * \
+					 OV9282_NUM_DATA_LANES / 8)
 
 /*
  * OV9282 native and active pixel array size.
@@ -140,6 +150,7 @@ struct ov9282_mode {
  * @again_ctrl: Pointer to analog gain control
  * @vblank: Vertical blanking in lines
  * @cur_mode: Pointer to current selected sensor mode
+ * @code: Mbus code currently selected
  * @mutex: Mutex for serializing sensor controls
  * @streaming: Flag indicating streaming state
  */
@@ -158,9 +169,11 @@ struct ov9282 {
 		struct v4l2_ctrl *exp_ctrl;
 		struct v4l2_ctrl *again_ctrl;
 	};
+	struct v4l2_ctrl *pixel_rate;
 	u32 vblank;
 	bool noncontinuous_clock;
 	const struct ov9282_mode *cur_mode;
+	u32 code;
 	struct mutex mutex;
 	bool streaming;
 };
@@ -178,7 +191,6 @@ static const s64 link_freq[] = {
  */
 static const struct ov9282_reg common_regs[] = {
 	{0x0302, 0x32},
-	{0x030d, 0x50},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
 	{0x3004, 0x00},
@@ -516,19 +528,29 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
  * @mode: pointer to ov9282_mode sensor mode
+ * @fmt: pointer to the requested mode
  *
  * Return: 0 if successful, error code otherwise.
  */
 static int ov9282_update_controls(struct ov9282 *ov9282,
-				  const struct ov9282_mode *mode)
+				  const struct ov9282_mode *mode,
+				  const struct v4l2_subdev_format *fmt)
 {
 	u32 hblank_min;
+	s64 pixel_rate;
 	int ret;
 
 	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
 	if (ret)
 		return ret;
 
+	pixel_rate = (fmt->format.code == MEDIA_BUS_FMT_Y10_1X10) ?
+		OV9282_PIXEL_RATE_10BIT : OV9282_PIXEL_RATE_8BIT;
+	ret = __v4l2_ctrl_modify_range(ov9282->pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret)
+		return ret;
+
 	hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
 	ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
 					OV9282_TIMING_HTS_MAX - mode->width, 1,
@@ -698,10 +720,16 @@ static int ov9282_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
-	if (code->index > 0)
+	switch (code->index) {
+	case 0:
+		code->code = MEDIA_BUS_FMT_Y10_1X10;
+		break;
+	case 1:
+		code->code = MEDIA_BUS_FMT_Y8_1X8;
+		break;
+	default:
 		return -EINVAL;
-
-	code->code = MEDIA_BUS_FMT_Y10_1X10;
+	}
 
 	return 0;
 }
@@ -721,7 +749,8 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
 	if (fsize->index >= ARRAY_SIZE(supported_modes))
 		return -EINVAL;
 
-	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10)
+	if (fsize->code != MEDIA_BUS_FMT_Y10_1X10 &&
+	    fsize->code != MEDIA_BUS_FMT_Y8_1X8)
 		return -EINVAL;
 
 	fsize->min_width = supported_modes[fsize->index].width;
@@ -737,15 +766,17 @@ static int ov9282_enum_frame_size(struct v4l2_subdev *sd,
  *                            from selected sensor mode
  * @ov9282: pointer to ov9282 device
  * @mode: pointer to ov9282_mode sensor mode
+ * @code: mbus code to be stored
  * @fmt: V4L2 sub-device format need to be filled
  */
 static void ov9282_fill_pad_format(struct ov9282 *ov9282,
 				   const struct ov9282_mode *mode,
+				   u32 code,
 				   struct v4l2_subdev_format *fmt)
 {
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
-	fmt->format.code = MEDIA_BUS_FMT_Y10_1X10;
+	fmt->format.code = code;
 	fmt->format.field = V4L2_FIELD_NONE;
 	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
 	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
@@ -775,7 +806,8 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
-		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, fmt);
+		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, ov9282->code,
+				       fmt);
 	}
 
 	mutex_unlock(&ov9282->mutex);
@@ -797,6 +829,7 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 	const struct ov9282_mode *mode;
+	u32 code;
 	int ret = 0;
 
 	mutex_lock(&ov9282->mutex);
@@ -806,7 +839,12 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
-	ov9282_fill_pad_format(ov9282, mode, fmt);
+	if (fmt->format.code == MEDIA_BUS_FMT_Y8_1X8)
+		code = MEDIA_BUS_FMT_Y8_1X8;
+	else
+		code = MEDIA_BUS_FMT_Y10_1X10;
+
+	ov9282_fill_pad_format(ov9282, mode, code, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
@@ -814,9 +852,11 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
-		ret = ov9282_update_controls(ov9282, mode);
-		if (!ret)
+		ret = ov9282_update_controls(ov9282, mode, fmt);
+		if (!ret) {
 			ov9282->cur_mode = mode;
+			ov9282->code = code;
+		}
 	}
 
 	mutex_unlock(&ov9282->mutex);
@@ -838,7 +878,8 @@ static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
 	struct v4l2_subdev_format fmt = { 0 };
 
 	fmt.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
-	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE], &fmt);
+	ov9282_fill_pad_format(ov9282, &supported_modes[DEFAULT_MODE],
+			       ov9282->code, &fmt);
 
 	return ov9282_set_pad_format(sd, sd_state, &fmt);
 }
@@ -903,7 +944,17 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
  */
 static int ov9282_start_streaming(struct ov9282 *ov9282)
 {
+	const struct ov9282_reg bitdepth_regs[2][2] = {
+		{
+			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
+			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
+		}, {
+			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW8},
+			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
+		}
+	};
 	const struct ov9282_reg_list *reg_list;
+	int bitdepth_index;
 	int ret;
 
 	/* Write common registers */
@@ -914,6 +965,13 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 		return ret;
 	}
 
+	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
+	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
+	if (ret) {
+		dev_err(ov9282->dev, "fail to write bitdepth regs");
+		return ret;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
 	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
@@ -1235,9 +1293,11 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 			  0, 1, 1, 1);
 
 	/* Read only controls */
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
-			  OV9282_PIXEL_RATE);
+	ov9282->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE,
+					       OV9282_PIXEL_RATE_10BIT,
+					       OV9282_PIXEL_RATE_10BIT, 1,
+					       OV9282_PIXEL_RATE_10BIT);
 
 	ov9282->link_freq_ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 							&ov9282_ctrl_ops,
@@ -1319,6 +1379,7 @@ static int ov9282_probe(struct i2c_client *client)
 
 	/* Set default mode to first mode */
 	ov9282->cur_mode = &supported_modes[DEFAULT_MODE];
+	ov9282->code = MEDIA_BUS_FMT_Y10_1X10;
 	ov9282->vblank = ov9282->cur_mode->vblank;
 
 	ret = ov9282_init_controls(ov9282);
-- 
2.34.1

