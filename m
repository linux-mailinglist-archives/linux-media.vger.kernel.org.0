Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67F04511A91
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiD0NKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbiD0NKi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:10:38 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5686431C7FE
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 06:07:25 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id a10so1852412oif.9
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 06:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpc39l1ZfVnnSyYy9QENhp57eRuT771cO+BovJXUU+0=;
        b=MLRfmntP7Og5uoklCoQgDzGrxCQiBgrqOcozYiD7Ay3afZJfOkV7ONQwyomL/aSh9i
         +16y0hsknT/MsfPOOyYlpovOow5d7eJxTNFWSNLOV5n4p4jncxF41MjmyoPY3cOIXscK
         tnoJJfqpZObIHCZHjM30Q+NrAy9Iu/6BvhDi/5QASB7jRskNybsnHzLMlj0+KmbLevJx
         UQ2obEEJwnPqIhreyxZTc0BJDDixtAXEa/US3CrS0mI4jvPDmI/FIO49bOENUn+Y8xtK
         dw1S0mIMD0EO8f9b6CupxtnA7WUQAsu57q8Sm8g/lMEF6jvoIWWdJE10lxURuWGo8h3P
         46qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpc39l1ZfVnnSyYy9QENhp57eRuT771cO+BovJXUU+0=;
        b=a0Cq2w4D3EiXd/x//bb48/15gOQVyickvzaTDznCROW7UetCvV0uLA1HNjR1hFFBz1
         fwMoSfXk1Wo9k1QX3pMkPug6SwlMBeHVzh2SylRKmv25sXP7EKD7QEO3qc1oM9mUDC0b
         9TxIwJWfwAWy6CGzMyp/u7Y9tprYSU0UHi2vdltW2+Img/aV5hpsqD9mnSDxyV5RdEUc
         Hgsh0O4TIxG34DbrlXJVfNlm/vT/KLm0MHwq2dCwcOi0eJqjULjdDyAkImGqD3zDJiqG
         QwPmZirwdiHvf1mhKCtJMyz0++5A5iE+LaICxYhJKubJvO6UvghT1ura4LgaNyewfM2d
         BMDg==
X-Gm-Message-State: AOAM533iVLiySK3cJjxuzUJUqCDu5x4rP2s2llDdr34whopKxv9zTzaZ
        OirnjZO8WJZyvCEQ0bgZal4=
X-Google-Smtp-Source: ABdhPJz0jUJ+QsCdQXBURmAXYXCEIjybdEUBlxO5gA7vToQT7uKyWiBBPlHtllpRjEX05RZrRY+rqA==
X-Received: by 2002:a05:6808:1b0a:b0:323:1e56:f49f with SMTP id bx10-20020a0568081b0a00b003231e56f49fmr12590421oib.285.1651064844387;
        Wed, 27 Apr 2022 06:07:24 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:5756:6d03:cf3b:b0f0])
        by smtp.gmail.com with ESMTPSA id i1-20020a056870a68100b000e686d138a0sm583533oam.58.2022.04.27.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 06:07:23 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, otavio@ossystems.com.br,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: i2c: adv7180: Add support for the test patterns
Date:   Wed, 27 Apr 2022 10:07:06 -0300
Message-Id: <20220427130706.3019409-1-festevam@gmail.com>
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
Changes since v1:
- Remove the unused options from the test pattern (Sakari).
- Remove v4l_info() (Sakari).
- Forced the default value to be disabled.

 drivers/media/i2c/adv7180.c | 45 +++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4f5db195e66d..df4ad45ebffb 100644
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
+	unsigned int reg;
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
@@ -632,6 +672,11 @@ static int adv7180_init_controls(struct adv7180_state *state)
 			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
 	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
 
+	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
+				      V4L2_CID_TEST_PATTERN,
+				      ARRAY_SIZE(test_pattern_menu) - 1,
+				      0, 4, test_pattern_menu);
+
 	state->sd.ctrl_handler = &state->ctrl_hdl;
 	if (state->ctrl_hdl.error) {
 		int err = state->ctrl_hdl.error;
-- 
2.25.1

