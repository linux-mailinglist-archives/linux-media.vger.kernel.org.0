Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB59451B1F7
	for <lists+linux-media@lfdr.de>; Thu,  5 May 2022 00:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379024AbiEDWeh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 18:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378994AbiEDWe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 18:34:28 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236A32AC44
        for <linux-media@vger.kernel.org>; Wed,  4 May 2022 15:30:51 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v64-20020a1cac43000000b0038cfd1b3a6dso4044012wme.5
        for <linux-media@vger.kernel.org>; Wed, 04 May 2022 15:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tq+RMuUoE1noa08mcL25WjEJMokzB1c27qqkEs8mGPw=;
        b=YO4SWRNVvwlNSZPgV35UeSy0QsGR5dBYLVpof7AYFgG3itwYFo7X8bWlUVGbtFlSC8
         Fj4CUuNh8XD41MJldOWkcCxXwxM3FKlELe5LAkSfYtsos3Q/s2a8wxKZYHFcYQvDXrtv
         YSeZDUyvXVpKWIJdnKjnLkevXJDPQatlA8TrQSUPQgpSQsBbeCQ67kTlGBNBcrTLQwVo
         aD+92tUCtmx/WK5spzifp3Tv7nZ5GJLrcw7ilSyln6IK/mD0wNww1aHGOE78HpC3Nxav
         ocY1vRtSRg0WizRN77WUueYcg7YYWIRsOqZP2izLJTbZ5hOfO40RshINUfilFjl2pY/A
         g3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tq+RMuUoE1noa08mcL25WjEJMokzB1c27qqkEs8mGPw=;
        b=MBTUkCaO6fiQfBs3UMWY8DKx/pb+dWoeGmedVImmpROFllwFx8y+T8JzTZBkpd+eds
         hfzoQGCO/gtzW5RJ/bf9Rci0C5rbtk5iGxTLKO3v4dzDq0CUJm6gktCOXj5eauC7FqqY
         wCwP6grPzG5cXTypHp1Zkk/B5orWyrQgCNd1idxSkotjgoIV1OLPANIRK5dx1XGEF87F
         ocO4DPsMza6nxA74q14N9M+aClNJDOwRbb/uRZaVEg5iZ2qPThOZQEFG+lCUfrAXYtyj
         /4QKIiumjsAuUShzfT1Qtfoh8QLfkTZpNqrg89Nva9w7YhemuNoUxSyAu1Fp8+5R6j9o
         g2LQ==
X-Gm-Message-State: AOAM533gLWrmGrnx4YiMQRHBvRpt8WgwKab1J0KQq6f1rhT/fsbloxR9
        8WxVi0wQf1dm3Mx78Iy50N2y1OvYhpU=
X-Google-Smtp-Source: ABdhPJxteo3PvsUKrbOMP2eyO7zaNKtbuVA+ap4KE3deSZa5UOWcxPsPVXQuG8zGtmYSaXZS2ybQ6g==
X-Received: by 2002:a05:600c:a45:b0:346:5e67:cd54 with SMTP id c5-20020a05600c0a4500b003465e67cd54mr1463314wmq.127.1651703449749;
        Wed, 04 May 2022 15:30:49 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id h29-20020adfaa9d000000b0020c5253d913sm12501442wrc.95.2022.05.04.15.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 15:30:49 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v3 10/15] media: i2c: Remove .s_power() from ov7251
Date:   Wed,  4 May 2022 23:30:22 +0100
Message-Id: <20220504223027.3480287-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504223027.3480287-1-djrscally@gmail.com>
References: <20220504223027.3480287-1-djrscally@gmail.com>
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
Changes in v3:

	- None

Changes in v2:

	- Set the global init registers as part of ov7251_set_power_on() (Sakari)

 drivers/media/i2c/ov7251.c | 53 +++++++-------------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index a9e890181200..4f8c797839f6 100644
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

