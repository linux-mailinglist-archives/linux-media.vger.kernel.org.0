Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D235108C2
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 21:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351350AbiDZTSB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 15:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350998AbiDZTSA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 15:18:00 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2763D19E3ED
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 12:14:52 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id a10so21759879oif.9
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 12:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mELlujlXAzqfLBLWJd7J46Ie557cyxQesxgCO7iDk5Q=;
        b=n16rLTSSI7G1RTMN+WAi+49XfkFBLkTAYaPnCCypA18xW3LbKcgcEyCgTflOrEK9Jz
         LMRR/au8bToW/RhJVovBY4qIgBvDzApjbzGdc6nM8FArgkgZngY0RxQb+ws1BBwON9RL
         7DpMQWxdK5JmumxkvZA3jv2NNL+h5OXlOKCyNMYlonoybR577dM4qK7/oustcLckCpuP
         WLFVaPOKZzgeZHT33EEgLkIYFPi3MhdnQ88Ow4t53MGHwmv/ifhGTYkRYS33FeFfllgC
         M+ALEa162n0iv8Fn36e6P7Zg6Zk7GZESll2xdNMHnFiAkZXWJrkG2paxyZ+SGUFFZ6Qa
         fu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mELlujlXAzqfLBLWJd7J46Ie557cyxQesxgCO7iDk5Q=;
        b=RNcmHYME9TrfeW62ztjB8rL9nycOWgCrmx+6ry4w7zAFWLcQY8A+kOvMsuqTbU7yBK
         ZzsOKJJ7HXix987svSmQfGrcxwMwQMF9y0jjYFfkR4Rgb5TJ7CVlsd2AdU7VJGSNHhHd
         ynw8wA2yBJtMSUYOlkPXSpRgUGN/HQRTtDtVtStlwmFz2gFWfJGWL+3JeclbzU/xI3To
         VmYp5/snvlr3Xdj9YpX8SoNCV11xrMUowE5WvW/5jJfwVXuhLjoqiI3E0R+PnsuIz2Rg
         1udlcQtJimiyMgNRtY9HJCIMY1Mj1Yzi5Z2+SW5dpmRTI0FIhaiDO8d7ZyXglUKsCGol
         hm2A==
X-Gm-Message-State: AOAM531c4qum7+3OfKTzFHQUNzUyDnQ19M68f3GIeEFg4kl3zZiP8fiL
        h1xLTONfQCcOWooHwY4UJyHx+SnY2bs=
X-Google-Smtp-Source: ABdhPJwlYiAeBjTSOySFo827tgIJcmJa7cseZKSX7n9xCQQIgIsC5V/xqSV/bmnvZikH+4lpAxcsOw==
X-Received: by 2002:a05:6808:180f:b0:322:bb72:ed33 with SMTP id bh15-20020a056808180f00b00322bb72ed33mr15822103oib.36.1651000491451;
        Tue, 26 Apr 2022 12:14:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:1bff:e925:51a3:1b22])
        by smtp.gmail.com with ESMTPSA id o6-20020a4a84c6000000b0035e5906bcc4sm4129140oog.4.2022.04.26.12.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 12:14:50 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, otavio@ossystems.com.br,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: i2c: adv7180: Add support for the test patterns
Date:   Tue, 26 Apr 2022 16:14:41 -0300
Message-Id: <20220426191441.2666653-1-festevam@gmail.com>
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
	5:	"Boundary box"
	6	"Disable"

Tested on a imx6q board with an ADV7280.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/adv7180.c | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4f5db195e66d..09e01ef99694 100644
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
 
@@ -549,6 +552,37 @@ static int adv7180_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
+static const char * const test_pattern_menu[] = {
+	"Single color",
+	"Color bars",
+	"Luma ramp",
+	"reserved",
+	"reserved",
+	"Boundary box",
+	"Disable",
+};
+
+static int adv7180_test_pattern(struct adv7180_state *state, int value)
+{
+	unsigned int reg;
+
+	v4l_info(state->client, "Testing pattern: %s\n", test_pattern_menu[value]);
+	adv7180_write(state, ADV7180_REG_ANALOG_CLAMP_CTL, value);
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
@@ -592,6 +626,9 @@ static int adv7180_s_ctrl(struct v4l2_ctrl *ctrl)
 			adv7180_write(state, ADV7180_REG_FLCONTROL, 0x00);
 		}
 		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = adv7180_test_pattern(state, val);
+		break;
 	default:
 		ret = -EINVAL;
 	}
@@ -632,6 +669,11 @@ static int adv7180_init_controls(struct adv7180_state *state)
 			  ADV7180_HUE_MAX, 1, ADV7180_HUE_DEF);
 	v4l2_ctrl_new_custom(&state->ctrl_hdl, &adv7180_ctrl_fast_switch, NULL);
 
+	v4l2_ctrl_new_std_menu_items(&state->ctrl_hdl, &adv7180_ctrl_ops,
+				      V4L2_CID_TEST_PATTERN,
+				      ARRAY_SIZE(test_pattern_menu) - 1,
+				      0, 0, test_pattern_menu);
+
 	state->sd.ctrl_handler = &state->ctrl_hdl;
 	if (state->ctrl_hdl.error) {
 		int err = state->ctrl_hdl.error;
-- 
2.25.1

