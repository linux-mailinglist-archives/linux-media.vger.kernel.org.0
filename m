Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7327E51CC6F
	for <lists+linux-media@lfdr.de>; Fri,  6 May 2022 01:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386554AbiEEXIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 May 2022 19:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386556AbiEEXIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 May 2022 19:08:02 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 840B55EDC4
        for <linux-media@vger.kernel.org>; Thu,  5 May 2022 16:04:21 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id i5so7855977wrc.13
        for <linux-media@vger.kernel.org>; Thu, 05 May 2022 16:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P/x5gHPCt1r6N6iyOGsSDffQ/m5QgUd4Lz8AY2HmEWM=;
        b=fSbrniFUPHoVtOU92fkTc4wz0fERRvzOfCRjxVIECtpHHSo9z+TTRoeohMV81/sgPH
         XeYWzPjXNNRHp+sSu7a6hOFLFygFm6mQ6Es2ONcAf4+YDuEhcWT2c3ZCaxsU9TbWGMyo
         sEBW241n2i76+m9c1vqvH21tmlGiOi04E1pHGqjJmcS7nlVz6FThyREc4ISKgU7JXVXK
         QNUnK8pnfsO/E6l+hx5qjMa7GXlka3/3/nai4F/7jEqpBvA+cAXXoqJfAbngQUFBnXwh
         y2mthEFoqv0Wd0tAXKWnN+YWFbvIbpi/mH7PDo8YOojx46ayzW2L+8FIY/0x3+hNuKBi
         sJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P/x5gHPCt1r6N6iyOGsSDffQ/m5QgUd4Lz8AY2HmEWM=;
        b=pfOn93YKDfo72VzNdUpK3l11JQ1OB1PjKKR14o1unhnN3/Ois03EErZ84/Dtw6HVA3
         D/FZbwG6N/iMr1kiG10cy0YGF36fa6BbVMXtbK/I9goHbMJ+SuNHrBIQ4T6r6MEUitgC
         1mHSxZnIPlrCNMutqbA3s/dbdRYrl6T63I0UZSopXQnzC/3Z26fKnLhZax8CsbGSCPPy
         ZGqMcGrPOgWaeKHT+bGruASsfldVUJP7rYPgOdyg15Dy7ZpLzOZhC46ATH64P2YcDoLs
         tq4XB5g7UvrPLC9fYoaDwoAyC8wQifdiazT1QTvIHw3rPAReDhOYp90fLcHDjP/N0mqF
         DNOA==
X-Gm-Message-State: AOAM530aFRJD2RQtuV9ZDwm/Lx0lu6ibkGRMfThf/FwiuBOlqgM/81XN
        hkhw2ureQmN1E3EYfMnJSTrlg+dL85Y=
X-Google-Smtp-Source: ABdhPJz+yHdAO1TIdt+C60KhfZ0eYwrm8K0Txqxhs0AA1K/1KHZG/FyAsWvtD9YPm5TbVp4xZWNnfA==
X-Received: by 2002:a05:6000:156a:b0:20c:64e3:948f with SMTP id 10-20020a056000156a00b0020c64e3948fmr300296wrz.436.1651791861139;
        Thu, 05 May 2022 16:04:21 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c339400b003942a244f33sm6782130wmp.12.2022.05.05.16.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 16:04:20 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v4 10/15] media: i2c: Remove .s_power() from ov7251
Date:   Fri,  6 May 2022 00:03:57 +0100
Message-Id: <20220505230402.449643-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505230402.449643-1-djrscally@gmail.com>
References: <20220505230402.449643-1-djrscally@gmail.com>
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
Changes in v4:

	- None

Changes in v3:

	- None

Changes in v2:

	- Set the global init registers as part of ov7251_set_power_on() (Sakari)

 drivers/media/i2c/ov7251.c | 53 +++++++-------------------------------
 1 file changed, 10 insertions(+), 43 deletions(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 1713c6e22ccd..a1326d03bcdd 100644
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

