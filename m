Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 462B4511AD7
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236850AbiD0NyI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236671AbiD0Nxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:53:46 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E552C192B5
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 06:50:34 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id m11so1985338oib.11
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWVgmBSVUcBJHGwRdpdI3D/aK4X2HZJo5vmHXL3d1+c=;
        b=PCvmi5c8mfJP4/8Wd/QArPmQhqTwaQRnGEiUAQhLfJpz8wuIpJmy6vGK/caqUsnWuG
         BOhhxVCA8vorNiYKtRJjSTozJZSjOp2NLn5FiSswdo5Msb7+Uhhnroof0cYD/6S2tuOU
         iCA1O0UXjRpZ+jZ7iETqbWGYimHJoWkcZWMgvfQSZiH+eLYsNb92BeT045OpTxwxxSdi
         KEROqe541cDwjn/eARAUiQ1Cp38PsXijFhGqCCp6jRk/GHoyWJOz9dvMTnyNWdVI1HvX
         G8SbnMu1xj558QVQshdo/Mf2jMg7OLJq/YRZYexgi2sP+THNT7GogiN7soApLK2UfLbU
         GZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qWVgmBSVUcBJHGwRdpdI3D/aK4X2HZJo5vmHXL3d1+c=;
        b=TGoVYT93JMamQniBZ6ef3g0/ChmzdfS2iEgT8Ae1bAm3i4CFnh51yXefqIKDPBKDdY
         L+u5mus3+CqYOKz9y4SCRYXPJG1L78duqzh/8UXGvx5Gx2T5Us4gJ6BzIlLuid9UFS9S
         psjjLKYdBrx+FRnXheKCblmlJM9RCuqi1QCiuj8WVKN1WFV6jPXIWzR5kyA0o58phNLr
         dhQDvj3baYQuWyLrT3RyyKfs9bdr66LqDJREqpO9TbPYnJHcYgs3YVrCPV4+4v/G8+o5
         GP+SWkr9Qeci5CRYssTfvVRfUK5wEB21FDKSnyPXmiTVzP0exaxbzQ0TYvXf/7arI+jv
         U2qA==
X-Gm-Message-State: AOAM530d0FjROldL1a40hbde+NVrjLzO02fzIsXo5vllWguGpsJraIgy
        t/s0VkPiISCo1nZ+bKsjFT4=
X-Google-Smtp-Source: ABdhPJzJrh3eRjXp16Diiif+yLM3UlLeJhIrFwTGJ/dvbdTlnR9b2FdnGxtQpaax6Af4zg9/7kETHg==
X-Received: by 2002:a05:6808:219a:b0:325:93fc:e0fd with SMTP id be26-20020a056808219a00b0032593fce0fdmr529403oib.241.1651067434254;
        Wed, 27 Apr 2022 06:50:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5756:6d03:cf3b:b0f0])
        by smtp.gmail.com with ESMTPSA id t15-20020a05683019ef00b00605dbaeb67esm628953ott.53.2022.04.27.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 06:50:33 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, otavio@ossystems.com.br,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] media: i2c: adv7180: Add support for the test patterns
Date:   Wed, 27 Apr 2022 10:50:25 -0300
Message-Id: <20220427135025.3036234-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ADV7180 has a built-in mechanism to generate some video patterns,
which is very useful for debug/bring-up activities.

Add support for it.

The test_pattern parameter can be one of the following values:

	0:	"Single color"
	1:	"Color bars"
	2:	"Luma ramp"
	3:	"Boundary box"
	4:	"Disable"

Tested on a imx6q board with an ADV7280.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Avoid undefined reg value for values greater than 4. (Sakari)
- Use ARRAY_SIZE() macro for the default, instead of harcoding it. (Sakari).

 drivers/media/i2c/adv7180.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4f5db195e66d..e3a57c178c6b 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -66,6 +66,9 @@
 #define ADV7180_HUE_DEF		0
 #define ADV7180_HUE_MAX		128
 
+#define ADV7180_REG_DEF_VALUE_Y	0x000c
+#define ADV7180_DEF_VAL_EN		0x1
+#define ADV7180_DEF_VAL_AUTO_EN	0x2
 #define ADV7180_REG_CTRL		0x000e
 #define ADV7180_CTRL_IRQ_SPACE		0x20
 
@@ -549,6 +552,40 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
+static const char * const test_pattern_menu[] = {
+	"Single color",
+	"Color bars",
+	"Luma ramp",
+	"Boundary box",
+	"Disable",
+};
+
+static int adv7180_test_pattern(struct adv7180_state *state, int value)
+{
+	unsigned int reg = 0;
+
+	/* Map menu value into register value */
+	if (value < 3)
+		reg = value;
+	if (value == 3)
+		reg = 5;
+
+	adv7180_write(state, ADV7180_REG_ANALOG_CLAMP_CTL, reg);
+
+	if (value == ARRAY_SIZE(test_pattern_menu) - 1) {
+		reg = adv7180_read(state, ADV7180_REG_DEF_VALUE_Y);
+		reg &= ~ADV7180_DEF_VAL_EN;
+		adv7180_write(state, ADV7180_REG_DEF_VALUE_Y, reg);
+		return 0;
+	}
+
+	reg = adv7180_read(state, ADV7180_REG_DEF_VALUE_Y);
+	reg |= ADV7180_DEF_VAL_EN | ADV7180_DEF_VAL_AUTO_EN;
+	adv7180_write(state, ADV7180_REG_DEF_VALUE_Y, reg);
+
+	return 0;
+}
+
 static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct v4l2_subdev *sd = to_adv7180_sd(ctrl);
@@ -592,6 +629,9 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 			adv7180_write(state, ADV7180_REG_FLCONTROL, 0x00);
 		}
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = adv7180_test_pattern(state, val);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -632,6 +672,12 @@ static int adv7180_init_controls(struct adv7180_state *state)
 			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
 	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
 
+	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
+				      V4L2_CID_TEST_PATTERN,
+				      ARRAY_SIZE(test_pattern_menu) - 1,
+				      0, ARRAY_SIZE(test_pattern_menu) - 1,
+				      test_pattern_menu);
+
 	state->sd.ctrl_handler = &state->ctrl_hdl;
 	if (state->ctrl_hdl.error) {
 		int err = state->ctrl_hdl.error;
-- 
2.25.1

