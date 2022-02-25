Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A595E4C3A26
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 01:08:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbiBYAI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 19:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbiBYAIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 19:08:55 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA4914562A
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:24 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so726830wmp.5
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 16:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nb5BAI2VzVzrGhGd/kyZXqTaeZY4l2jUEOkjs/CNQWM=;
        b=iYzUd/VFrZndaQRbdmqrKS2u2dCqd48lnPgoKsad+N1yzig/PQiMU6paucOSImnwaL
         1p1mgZT5xSDQl00L7Ocn+f8hY2SE/7+tAHbP7PI6oXTKhuceBoNCvi+dPrx3CVgTBbKb
         xHMFc7dnT/lH6HwBEWBL3h+MxdAauZd8fXicbmBitH7QEGCvcvWBYQO8lAnsdZuh+lYu
         RqUqUN15kQPWFae6h/1PszHamzoDtEUoEaRLuvIDoer6EKN72yLosQmlowfmeRsIdl6f
         DJzEY0SDY0B72os8cHs2lUaGCmNk+2g1xy/Q7Sk6TNlKSURyFJUivqd/1+9zI/sQINxO
         0saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nb5BAI2VzVzrGhGd/kyZXqTaeZY4l2jUEOkjs/CNQWM=;
        b=bslGg3xxlh+uEhK4aUIcvLyQ7Y2Vu2EmK9W/obFU1eA5sP5RoGKxTCDMIjrBwjXFGI
         gzaskxJrp8LdVmmrcjer3xO8HIDbDi+101XANtNPer6+pM4zNHOka0fARJfkGD7KLfnK
         JehJ8a6FiQPdE3nyaQ9jJ4SIG4TEaegehoPRaa8qmd4Il0EGnfBgNnO1gOnpB4BtBRh8
         frpCGdWFHC7UCiiVsBUr8h04Q0DiNGlVYtaRd3eTWwu9Osvhn/PDJF4O8BjcufjcAvXN
         w9FHgayv7D3/sMTtHyPw5nRWWc8gHIA2aeXl8OzGnQJSYO/yLLBGHCCl6B70p9pUeX6d
         KipA==
X-Gm-Message-State: AOAM5317OkTtL5obg1mgvF9KqMPl6NiyuUK/qEiYSbr4GR/+VCgk9FTi
        1xj4wQJZlbmrADv3vmiIYbQ7lsikDMWMXw==
X-Google-Smtp-Source: ABdhPJwGxJiyDDhrXf9R1Lh4RtLwc9bDi8pHiKeZ0tiAGRCXTu3AVLWtZOGniR5sdyaYVrM/AUbJNQ==
X-Received: by 2002:a7b:c932:0:b0:381:c66:fff2 with SMTP id h18-20020a7bc932000000b003810c66fff2mr414599wml.42.1645747703539;
        Thu, 24 Feb 2022 16:08:23 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id a3-20020adfe5c3000000b001e68a5e1c20sm742668wrn.4.2022.02.24.16.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 16:08:23 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 10/11] media: i2c: Remove .s_power() from ov7251
Date:   Fri, 25 Feb 2022 00:07:52 +0000
Message-Id: <20220225000753.511996-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225000753.511996-1-djrscally@gmail.com>
References: <20220225000753.511996-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The .s_power() callback is deprecated, and now that we have pm_runtime
functionality in the driver there's no further use for it. Delete the
function.

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v2:

	- Set the global init registers as part of ov7251_set_power_on() (Sakari)

 drivers/media/i2c/ov7251.c | 53 +++++++-------------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 724f651212f1..e41d8ea5b712 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -910,7 +910,16 @@ static int ov7251_set_power_on(struct device *dev)
 			       DIV_ROUND_UP(ov7251->xclk_freq, 1000));
 	usleep_range(wait_us, wait_us + 1000);
 
-	return 0;
+	ret = ov7251_set_register_array(ov7251,
+					ov7251_global_init_setting,
+					ARRAY_SIZE(ov7251_global_init_setting));
+	if (ret < 0) {
+		dev_err(ov7251->dev, "error during global init\n");
+		ov7251_regulators_disable(ov7251);
+		return ret;
+	}
+
+	return ret;
 }
 
 static int ov7251_set_power_off(struct device *dev)
@@ -926,43 +935,6 @@ static int ov7251_set_power_off(struct device *dev)
 	return 0;
 }
 
-static int ov7251_s_power(struct v4l2_subdev *sd, int on)
-{
-	struct ov7251 *ov7251 = to_ov7251(sd);
-	int ret = 0;
-
-	mutex_lock(&ov7251->lock);
-
-	/* If the power state is not modified - no work to do. */
-	if (ov7251->power_on == !!on)
-		goto exit;
-
-	if (on) {
-		ret = ov7251_set_power_on(ov7251->dev);
-		if (ret < 0)
-			goto exit;
-
-		ret = ov7251_set_register_array(ov7251,
-					ov7251_global_init_setting,
-					ARRAY_SIZE(ov7251_global_init_setting));
-		if (ret < 0) {
-			dev_err(ov7251->dev, "could not set init registers\n");
-			ov7251_set_power_off(ov7251->dev);
-			goto exit;
-		}
-
-		ov7251->power_on = true;
-	} else {
-		ov7251_set_power_off(ov7251->dev);
-		ov7251->power_on = false;
-	}
-
-exit:
-	mutex_unlock(&ov7251->lock);
-
-	return ret;
-}
-
 static int ov7251_set_hflip(struct ov7251 *ov7251, s32 value)
 {
 	u8 val = ov7251->timing_format2;
@@ -1387,10 +1359,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	return ret;
 }
 
-static const struct v4l2_subdev_core_ops ov7251_core_ops = {
-	.s_power = ov7251_s_power,
-};
-
 static const struct v4l2_subdev_video_ops ov7251_video_ops = {
 	.s_stream = ov7251_s_stream,
 	.g_frame_interval = ov7251_get_frame_interval,
@@ -1408,7 +1376,6 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
 };
 
 static const struct v4l2_subdev_ops ov7251_subdev_ops = {
-	.core = &ov7251_core_ops,
 	.video = &ov7251_video_ops,
 	.pad = &ov7251_subdev_pad_ops,
 };
-- 
2.25.1

