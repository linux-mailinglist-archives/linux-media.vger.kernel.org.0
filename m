Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F155F577A
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 17:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230473AbiJEP3E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 11:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbiJEP26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 11:28:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF25072B42
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 08:28:57 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id a10so14146004wrm.12
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=SJoBZQnUO4yW4+5QLRqRFjHqllPrldbqWp5Kd5yEpHE=;
        b=iWxKTQHDSFybHr2tnwpzYrfaein13S2bTn/0ol9UEMzoMEbcz+mwztpw+DJNcAPdLi
         agrWuiWrh7AIuOuE6OjPZiCnGkbwmnZcfY/dcHq43qGkuv1uj9MdVjcdX3cTtbrHULHS
         OPlKTfywmi3ypTMBWoMGP4oZHPw1AbEjXRi3N4CaL02Vwj6kOzgX2cpjDoUrqZnay/PA
         CO8Z1iCwEeT+ojH+r5Ch+axdPEGZm4iAvlTIym98O8qDld5gQJAG8SSVaOnJLg6urZdc
         4pPAaTE1ut3uhHrY5Uc6r7b6bPqzqbWoGLFV721MJ5vvNzd2wR9HcLK5nN7+z17TWgOA
         FGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SJoBZQnUO4yW4+5QLRqRFjHqllPrldbqWp5Kd5yEpHE=;
        b=nu+8KPcF42+Oxfl2EkXhLdWxHk08WdPJCifRpHDI6I9xqS0V76UKSgg8pNrLIIgb4j
         tJ22IKkNjmstcyEjjGgun8m+YIGmNsNIWv8vcY7uLk6EdorpZ90N0KB8qx0aElFaX4ef
         T0G9OdLjJhhrAu3B59viuXxl1UhMCZUohIFmJbHL+aRLAi9g3mck1FyEmug4eqEXx5BS
         4ypOtYU2lsaC6liwLPlyTd+0mFNl2RSCWLP1QFAqqMyhhoiovrvvjaNIR1AlU7eNprnE
         uhs4o5ZZhYYBh+kdYWEvuyI7MlyLfTRZqTpZERUCql1ud5aHWeYs7DPwsHK77w9xAloC
         Dh6A==
X-Gm-Message-State: ACrzQf2klLMTUPmh1g6PjwdV5GCH2WUPqxUf/b9INLJsZCLFvCCPfa4j
        3kXwx3TJ0xgt1D9eVbqqL5jaqw==
X-Google-Smtp-Source: AMsMyM6V29OVrQiBqb3PO1tfdFHAO0F+r2w3ZWSDpYQPyp+CPwn9p0jcI/VMPxilVHwjX71fEwslqA==
X-Received: by 2002:a5d:5148:0:b0:22e:53bd:31c5 with SMTP id u8-20020a5d5148000000b0022e53bd31c5mr180625wrt.241.1664983736529;
        Wed, 05 Oct 2022 08:28:56 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id y14-20020adfe6ce000000b0022c96d3b6f2sm19747237wrm.54.2022.10.05.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 08:28:55 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 11/16] media: i2c: ov9282: Add HFLIP and VFLIP support
Date:   Wed,  5 Oct 2022 16:28:04 +0100
Message-Id: <20221005152809.3785786-12-dave.stevenson@raspberrypi.com>
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

Adds support for V4L2_CID_HFLIP and V4L2_CID_VFLIP to allow
flipping the image.

The driver previously enabled H & V flips in the register table,
therefore the controls default to the same settings to avoid
changing the behaviour.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 52 +++++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 5ddef6e2b3ac..12cbe401fd78 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -46,6 +46,10 @@
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
 
+#define OV9282_REG_TIMING_FORMAT_1	0x3820
+#define OV9282_REG_TIMING_FORMAT_2	0x3821
+#define OV9282_FLIP_BIT			BIT(2)
+
 #define OV9282_REG_MIPI_CTRL00	0x4800
 #define OV9282_GATED_CLOCK	BIT(5)
 
@@ -440,6 +444,38 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	return ret;
 }
 
+static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
+				  &current_val);
+	if (!ret) {
+		if (value)
+			current_val |= OV9282_FLIP_BIT;
+		else
+			current_val &= ~OV9282_FLIP_BIT;
+		return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
+					current_val);
+	}
+	return ret;
+}
+
+static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
+				  &current_val);
+	if (!ret) {
+		if (value)
+			current_val |= OV9282_FLIP_BIT;
+		else
+			current_val &= ~OV9282_FLIP_BIT;
+		return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
+					current_val);
+	}
+	return ret;
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -484,7 +520,6 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
-
 		exposure = ctrl->val;
 		analog_gain = ov9282->again_ctrl->val;
 
@@ -493,12 +528,17 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 
 		ret = ov9282_update_exp_gain(ov9282, exposure, analog_gain);
 
-
 		break;
 	case V4L2_CID_VBLANK:
 		lpfr = ov9282->vblank + ov9282->cur_mode->height;
 		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
 		break;
+	case V4L2_CID_HFLIP:
+		ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
+		break;
+	case V4L2_CID_VFLIP:
+		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
+		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
 		ret = -EINVAL;
@@ -996,7 +1036,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -1030,6 +1070,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 						mode->vblank_max,
 						1, mode->vblank);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_VFLIP,
+			  0, 1, 1, 1);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_HFLIP,
+			  0, 1, 1, 1);
+
 	/* Read only controls */
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov9282_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  OV9282_PIXEL_RATE, OV9282_PIXEL_RATE, 1,
-- 
2.34.1

