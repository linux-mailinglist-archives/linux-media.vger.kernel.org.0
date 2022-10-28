Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEFB611742
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 18:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJ1QPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Oct 2022 12:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiJ1QOx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Oct 2022 12:14:53 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE441DE3F2
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:55 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so4149054wmq.4
        for <linux-media@vger.kernel.org>; Fri, 28 Oct 2022 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PQieUrDD2lIc9ALkRj84U8GRwSZ71VOFhAis5UCITI=;
        b=N3I8VHwEtz39IIV0134f1AMrP2yHLI6f9sYldNBuvXL7ewATsTd4K+UmtT9wlB2jNa
         X61vX6tMb3NG71uMlmwQVZuvsmJC526oLVdEg7LtYhmPkvZpQCUdTADwYOokaiwlUnpa
         SM/iclnK/rYJs//4cH6z9XSUpYxLLGs/o+2bbZMOP8MOcq/+TCIfuJnnq+vkfTtLbFk3
         Cnn1F9k8e5QHicomw+vr9hY24sDsIno/fY9GiaqM9BydETN96yNMIEBP5ymfhUNPMMDV
         5aXzZpKLQcEKA0FyJp41CAEBzK6wVlTPFYTU8oZwO8tMvArgcDj1PAE5Rz7RbFRuwwFE
         5CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PQieUrDD2lIc9ALkRj84U8GRwSZ71VOFhAis5UCITI=;
        b=4oYH/71sCfJuboxKb1SBpa9zUdv3jNTKKBuvXBd8/O38HsaIyE0K3QBRQxg/UlLlwM
         K5QUGI9HI4m6AHy2j2N0Spv0xTdGj3SdDMpToFPMey43JTXy3zT37zwacDnUwkGxWKGF
         BlrGcQCVlzQLuujBUmbvzFsbD+dL5bzybsoEMMC5kQPxT2nr6GXR/ts4lA4Z8OmfJdD0
         SennS/4BTi6gTHKPwoJ8f/Y5NBl6V0KhB6xu6V6ZBN9R3z8bb+HRfYmAO7QCR1+q7G2s
         +BGWpL74aKsKBgkPfxrxB6DubI1lW4eWV9YYJEIocZHLnE9NiLtTaNyj1lDEJJmPAot7
         SxNQ==
X-Gm-Message-State: ACrzQf12EjK0LvTGTyEXhlrC8FueejNjiHD/S9KrkI3gkBggs2bRyHrj
        efU1gb3czExK/sWIbgOx/cYrIg==
X-Google-Smtp-Source: AMsMyM7i5aQjs9/MkRiG+jEVxRHA9sgiCNhj1ZU4a5OsyLEoTwg5waaFjE8aV9xdqBwxJj43w5MYvg==
X-Received: by 2002:a1c:f71a:0:b0:3cf:61fd:21f0 with SMTP id v26-20020a1cf71a000000b003cf61fd21f0mr935708wmh.40.1666973573843;
        Fri, 28 Oct 2022 09:12:53 -0700 (PDT)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id bh17-20020a05600c3d1100b003cf47fdead5sm4731928wmb.30.2022.10.28.09.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:12:53 -0700 (PDT)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi, jacopo@jmondi.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 11/16] media: i2c: ov9282: Add HFLIP and VFLIP support
Date:   Fri, 28 Oct 2022 17:08:57 +0100
Message-Id: <20221028160902.2696973-12-dave.stevenson@raspberrypi.com>
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

Adds support for V4L2_CID_HFLIP and V4L2_CID_VFLIP to allow
flipping the image.

The driver previously enabled H & V flips in the register table,
therefore the controls default to the same settings to avoid
changing the behaviour.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/ov9282.c | 52 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index e964461ff1d3..cfb6e72d8931 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -45,6 +45,10 @@
 /* Group hold register */
 #define OV9282_REG_HOLD		0x3308
 
+#define OV9282_REG_TIMING_FORMAT_1	0x3820
+#define OV9282_REG_TIMING_FORMAT_2	0x3821
+#define OV9282_FLIP_BIT			BIT(2)
+
 #define OV9282_REG_MIPI_CTRL00	0x4800
 #define OV9282_GATED_CLOCK	BIT(5)
 
@@ -438,6 +442,40 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	return ret;
 }
 
+static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
+				  &current_val);
+	if (ret)
+		return ret;
+
+	if (value)
+		current_val |= OV9282_FLIP_BIT;
+	else
+		current_val &= ~OV9282_FLIP_BIT;
+
+	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
+				current_val);
+}
+
+static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
+{
+	u32 current_val;
+	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
+				  &current_val);
+	if (ret)
+		return ret;
+
+	if (value)
+		current_val |= OV9282_FLIP_BIT;
+	else
+		current_val &= ~OV9282_FLIP_BIT;
+
+	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
+				current_val);
+}
+
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -494,6 +532,12 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -963,7 +1007,7 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
 	u32 lpfr;
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
 	if (ret)
 		return ret;
 
@@ -997,6 +1041,12 @@ static int ov9282_init_controls(struct ov9282 *ov9282)
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

