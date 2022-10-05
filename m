Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3FF5F577B
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbiJEP3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbiJEP27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:59 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF0D61709
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b4so19544863wrs.1
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XKiMujn/UlWa10V840tKoy+9zQnGra0wz3xwbR/Baao=;
        b=Zgrzdk9nuZpYHSJ62FGqdj+gRi+9OBjD8i2fK5WT+Q6n189fd1V9TgM8FCRwKv9xfh
         /6ALTt8/V5pjD/Kd8xPV8irHSPZqnaU2bHCKzArcTIOyfid7jJRtInWn1Pqllp5EHr1+
         kPD/MmCKcvyCh/ZI5gdAAHUhgUnMADx5LSwfah7xLWXR8h3Sg8pkbVK+Gpa2nO1D9V61
         b5LsRXCpt64y++KQ3j43YRETAKJ8LqfrakTlTdw3vpZsHrNIojGPleCMnJOjFqi97yKO
         zbrP6GWWbfaik+Wc/Y8z5A9jtaVSzJPhp20oyTEzEusGYv2z7mRAmw1MPj8AP8ve5w0k
         2dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XKiMujn/UlWa10V840tKoy+9zQnGra0wz3xwbR/Baao=;
        b=BhFVafdmHlfSBOtDN694cz16tjSI8BRm6EqpLlNIuHT9PwePZzoSYl/dFCKaMDkLNJ
         PYjlLf/lDqTD8G681j0W4dez38yRIGZOoI7F9O+Z19m5Fghj6OqnZpklCp2Vaar78ShB
         tTrFuGVyA2p3wQ1U5VN4l3U683kGoEWc3I4fELD6+0CM7rGk7t6D6LHFLBWtJ7FtI+RY
         +zBQjw+x4OxlOlwUoDG4t7rTkdHNFJHx9+ptuOwLP45izijpz69BbM51YFpNwKX/hTbP
         TsHonkw6S/jNsOu+n0ABD8Tvpnm9Q+JdxmI8RWsWhDbh5vukl9G2pVikflkIgdn79+IJ
         Rayg==
X-Gm-Message-State: ACrzQf2xg80suhR6rT6J1O5DoQ66HUnCtM1BTLq4EsEkYxAuX3PXCPZx
        I3avB1iNjiD9GyrvG4/SrIyL+A==
X-Google-Smtp-Source: AMsMyM4bwJZY3ACG771Q/zNuT+gfx7b0IBOgPAVimtMEV3L3ImiN8IrXh8D0CVpV99W6SpXL2eb7bw==
X-Received: by 2002:a05:6000:10d1:b0:22e:3bc5:c91c with SMTP id b17-20020a05600010d100b0022e3bc5c91cmr203914wrx.368.1664983737726;
        Wed, 05 Oct 2022 08:28:57 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:57 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 12/16] media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
Date:   Wed,  5 Oct 2022 16:28:05 +0100
Message-Id: <20221005152809.3785786-13-dave.stevenson@raspberrypi.com>
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

There's no reason why HBLANK has to be read-only as it
only changes the TIMING_HTS register in the sensor.

Remove the READ_ONLY flag, and add the relevant handling
for it.

The minimum value also varies based on whether continuous clock
mode is being used or not, so allow hblank_min to depend on
that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 12cbe401fd78..8e86aa7e4b2a 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -22,6 +22,9 @@
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
+#define OV9282_REG_TIMING_HTS	0x380c
+#define OV9282_TIMING_HTS_MAX	0x7fff
+
 /* Lines per frame */
 #define OV9282_REG_LPFR		0x380e
 
@@ -99,7 +102,8 @@ struct ov9282_reg_list {
  * struct ov9282_mode - ov9282 sensor mode structure
  * @width: Frame width
  * @height: Frame height
- * @hblank: Horizontal blanking in lines
+ * @hblank_min: Minimum horizontal blanking in lines for non-continuous[0] and
+ *		continuous[1] clock modes
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
@@ -109,7 +113,7 @@ struct ov9282_reg_list {
 struct ov9282_mode {
 	u32 width;
 	u32 height;
-	u32 hblank;
+	u32 hblank_min[2];
 	u32 vblank;
 	u32 vblank_min;
 	u32 vblank_max;
@@ -249,8 +253,6 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x3809, 0x00},
 	{0x380a, 0x02},
 	{0x380b, 0xd0},
-	{0x380c, 0x02},
-	{0x380d, 0xfd},
 	{0x3810, 0x00},
 	{0x3811, 0x08},
 	{0x3812, 0x00},
@@ -273,7 +275,7 @@ static const struct ov9282_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hblank = 250,
+		.hblank_min = { 250, 176 },
 		.vblank = 1022,
 		.vblank_min = 41,
 		.vblank_max = 51540,
@@ -399,15 +401,17 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
 static int ov9282_update_controls(struct ov9282 *ov9282,
 				  const struct ov9282_mode *mode)
 {
+	u32 hblank_min;
 	int ret;
 
 	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, mode->hblank);
-	if (ret)
-		return ret;
+	hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
+	ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
+					OV9282_TIMING_HTS_MAX - mode->width, 1,
+					hblank_min);
 
 	return __v4l2_ctrl_modify_range(ov9282->vblank_ctrl, mode->vblank_min,
 					mode->vblank_max, 1, mode->vblank);
@@ -539,6 +543,10 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VFLIP:
 		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
 		break;
+	case V4L2_CID_HBLANK:
+		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
+				       (ctrl->val + ov9282->cur_mode->width) >> 1);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -1033,6 +1041,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
 	const struct ov9282_mode *mode = ov9282->cur_mode;
 	struct v4l2_fwnode_device_properties props;
+	u32 hblank_min;
 	u32 lpfr;
 	int ret;
 
@@ -1091,14 +1100,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	if (ov9282->link_freq_ctrl)
 		ov9282->link_freq_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
+	hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
 	ov9282->hblank_ctrl = v4l2_ctrl_new_std(ctrl_hdlr,
 						&ov9282_ctrl_ops,
 						V4L2_CID_HBLANK,
-						OV9282_REG_MIN,
-						OV9282_REG_MAX,
-						1, mode->hblank);
-	if (ov9282->hblank_ctrl)
-		ov9282->hblank_ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+						hblank_min,
+						OV9282_TIMING_HTS_MAX - mode->width,
+						1, hblank_min);
 
 	ret = v4l2_fwnode_device_parse(ov9282->dev, &props);
 	if (!ret) {
-- 
2.34.1

