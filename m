Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A273A611738
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiJ1QPY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiJ1QOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095C815729
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:56 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id jb18so3490044wmb.4
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FJ9mleB6XkLTEv65iMsussIL/SXB9Uukk3TmGWfOuw=;
        b=LgWW38CHE6ju++7MHmXUCWerT5MQMdYh4+G4A1eDB1qx21fG/+0kOTcnsynF8YKMf7
         IJ1LUw8y2eJ/KOeP21fgP4PNsdcvCI1Ag0ltjAh5oyyrmP1cjRuyarLfHirpEUeh/P/w
         E++iRNKvBNaLJlLzFjQn5xOvT9Ks7wlrqn59YVYOzXy6VjTK/OKpex78t/s61jXKc8Rf
         GXHrB/hU3u8E1rkeZWZWV4Zt1/HF/Ls3s2cL72l0Jvx0127FW4wLUQptTBJWWQTGqdny
         GaGa9K54ey0ZdsxXlgUADFNm98VLGuXHSXhPT5jDV+LZlNJANWP8pvpBwFfQgCxLKxXy
         snew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FJ9mleB6XkLTEv65iMsussIL/SXB9Uukk3TmGWfOuw=;
        b=uLkVEPUTRERqhsJUfBKCyHjZfjiNxzYqSkoTE63UYbM938atGbdTe0oqSfST5mc4ks
         z2Cy0DTiaJpnsb4x+ePG0BFLV2dhjpGsKrBHICI3hN1hCK4l3rYeoesVqC71fm/k0C/X
         4katwHUTUB5PwBiIm5Y+SCGkKvP9pMM/enVtcYzedj1EQuJlu4ih1HeB7/iczuEAc646
         z2e0MrN3Fz4pzlX3gAxN7DrJZBH7H79SbLMPJTq24WjOoFV0z1AjlaD3krCUE4Qpy4fk
         qqEuuiQPsnxo18YnhZwjr1Ysij/XMgJcJXTpjhjFdKV+00xHkrsK+QRoojvQ0pKz3odI
         N0Hw==
X-Gm-Message-State: ACrzQf1TkcFi72VNpcE2XW5XOj39AeGVInYAXTDM6LczYchBXBlKFXpp
        1aNRNmM9ooYNNj9bHO/+9RqPNQ==
X-Google-Smtp-Source: AMsMyM6z7rWNvJOzEvrkhbfu/ZGNo55xFYVEZ/j+bkQRsD3HaxV7HSutTelB3bL8hhBSgkCbl8AyaQ==
X-Received: by 2002:a05:600c:34cc:b0:3c6:fb65:24cc with SMTP id d12-20020a05600c34cc00b003c6fb6524ccmr3523wmq.1.1666973574631;
        Fri, 28 Oct 2022 09:12:54 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:54 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 12/16] media: i2c: ov9282: Make V4L2_CID_HBLANK r/w
Date:   Fri, 28 Oct 2022 17:08:58 +0100
Message-Id: <20221028160902.2696973-13-dave.stevenson@raspberrypi.com>
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

There's no reason why HBLANK has to be read-only as it
only changes the TIMING_HTS register in the sensor.

Remove the READ_ONLY flag, and add the relevant handling
for it.

The minimum value also varies based on whether continuous clock
mode is being used or not, so allow hblank_min to depend on
that.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov9282.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index cfb6e72d8931..2313d5e717f3 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -21,6 +21,9 @@
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
+#define OV9282_REG_TIMING_HTS	0x380c
+#define OV9282_TIMING_HTS_MAX	0x7fff
+
 /* Lines per frame */
 #define OV9282_REG_LPFR		0x380e
 
@@ -90,7 +93,8 @@ struct ov9282_reg_list {
  * struct ov9282_mode - ov9282 sensor mode structure
  * @width: Frame width
  * @height: Frame height
- * @hblank: Horizontal blanking in lines
+ * @hblank_min: Minimum horizontal blanking in lines for non-continuous[0] and
+ *		continuous[1] clock modes
  * @vblank: Vertical blanking in lines
  * @vblank_min: Minimum vertical blanking in lines
  * @vblank_max: Maximum vertical blanking in lines
@@ -100,7 +104,7 @@ struct ov9282_reg_list {
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
 	[MODE_1280_720] = {
 		.width = 1280,
 		.height = 720,
-		.hblank = 250,
+		.hblank_min = { 250, 176 },
 		.vblank = 1022,
 		.vblank_min = 41,
 		.vblank_max = 51540,
@@ -397,13 +399,17 @@ static int ov9282_write_regs(struct ov9282 *ov9282,
 static int ov9282_update_controls(struct ov9282 *ov9282,
 				  const struct ov9282_mode *mode)
 {
+	u32 hblank_min;
 	int ret;
 
 	ret = __v4l2_ctrl_s_ctrl(ov9282->link_freq_ctrl, mode->link_freq_idx);
 	if (ret)
 		return ret;
 
-	ret = __v4l2_ctrl_s_ctrl(ov9282->hblank_ctrl, mode->hblank);
+	hblank_min = mode->hblank_min[ov9282->noncontinuous_clock ? 0 : 1];
+	ret =  __v4l2_ctrl_modify_range(ov9282->hblank_ctrl, hblank_min,
+					OV9282_TIMING_HTS_MAX - mode->width, 1,
+					hblank_min);
 	if (ret)
 		return ret;
 
@@ -538,6 +544,10 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1004,6 +1014,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	struct v4l2_ctrl_handler *ctrl_hdlr = &ov9282->ctrl_handler;
 	const struct ov9282_mode *mode = ov9282->cur_mode;
 	struct v4l2_fwnode_device_properties props;
+	u32 hblank_min;
 	u32 lpfr;
 	int ret;
 
@@ -1062,14 +1073,13 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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

