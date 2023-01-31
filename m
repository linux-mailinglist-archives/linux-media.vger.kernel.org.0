Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544C668365E
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbjAaTVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjAaTVK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:10 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E4D459E59
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:01 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so5888021wms.1
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH2m6BhNR1uDXlk7bsxUU9DHWcuEsawDHjnKOH5ul0Q=;
        b=pzyU8Gc+Cr1YndkNKnbwJBp7PInVg9cNURZvI+svHboxz6aOAUih7YT1xIQlCnWIYJ
         9HJg5347CqK787gl8UjVrjh4hTFgMXYw95nE1wO36eF05pYoxCHKPaTIxN8bfJiqKJm5
         9F/Ejbg4Q5GbcCrx73vqXr2hDY/K9ELH0j9cveb8F19qfOAkXbwNv7UNmVosLuhMmo6U
         3fjjssQv2JwaoL0FJevzQ8WW2IrXy1+YUU6pIdV9K6p5TXwpEtaObogqTh23AF53kqEc
         94hILru1e+RaZDPxmWMo1clo0XWnXlWPQ5ib/L5li8AkTsBHhvM6UiePeK3Vtw4p6Xlx
         yx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH2m6BhNR1uDXlk7bsxUU9DHWcuEsawDHjnKOH5ul0Q=;
        b=YfHjzdj84Gzlfyx3tnm12NNYiaDoKEIRue66OBs84K59ccrxhwevDiaVqzaxWON1CF
         Xv0sl8yJSaASKtsx032U+oG0//3+WP9Nr8AVfKcVl0bd4vVbskwExZBKgsWnch3Nn0OT
         l6lXUxvtFkSNcXpmoHgA9wR1J1/ygM6yT+Gp/4TJ3Xx39qOcaLJjntz9Dxf8pNUSROVE
         gvnXuEixyx2vAI2cFF7IEhgRbS3rcpQERcSwXhkTB3f2R3XuOY2gdakRn7y7jqP/NJxO
         DFjy3ZadqETsQzm6rOwwIGsKoJqP6soGE1mH4u5ZAEdR+beDt8g93TV6q/uUdvQy9fy0
         Z7cA==
X-Gm-Message-State: AO0yUKViDFBupH9DLS/PZrjMPqAJwjKrHeJk07gNpgX5rP0EqyloFaeN
        tLo2CQbB88PcT5X6oV2thdbogsZ6AZ8IhZJF
X-Google-Smtp-Source: AK7set9q5zpQFp5aZC9veoh9czoaoB24cRbCPPmlXpJGCnH8ur6+I4XwGFTbHLY0TSmLDaHLnh7rXA==
X-Received: by 2002:a05:600c:705:b0:3cf:85f7:bbc4 with SMTP id i5-20020a05600c070500b003cf85f7bbc4mr720561wmn.2.1675192859715;
        Tue, 31 Jan 2023 11:20:59 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:58 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 07/11] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
Date:   Tue, 31 Jan 2023 19:20:12 +0000
Message-Id: <20230131192016.3476937-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
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

The driver exposed V4L2_CID_HBLANK as a read only control to allow
for exposure calculations and determination of the frame rate.

Convert to a read/write control so that the frame rate can be
controlled.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 9ddd6382b127..9006be6e5e7c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -47,6 +47,7 @@
 #define IMX290_GAIN					IMX290_REG_8BIT(0x3014)
 #define IMX290_VMAX					IMX290_REG_24BIT(0x3018)
 #define IMX290_HMAX					IMX290_REG_16BIT(0x301c)
+#define IMX290_HMAX_MAX					0xffff
 #define IMX290_SHS1					IMX290_REG_24BIT(0x3020)
 #define IMX290_WINWV_OB					IMX290_REG_8BIT(0x303a)
 #define IMX290_WINPV					IMX290_REG_16BIT(0x303c)
@@ -167,7 +168,7 @@ struct imx290_regval {
 struct imx290_mode {
 	u32 width;
 	u32 height;
-	u32 hmax;
+	u32 hmax_min;
 	u8 link_freq_index;
 
 	const struct imx290_regval *data;
@@ -410,7 +411,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -418,7 +419,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -429,7 +430,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -437,7 +438,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -686,6 +687,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		break;
 
+	case V4L2_CID_HBLANK:
+		ret = imx290_write(imx290, IMX290_HMAX,
+				   ctrl->val + imx290->current_mode->width,
+				   NULL);
+		break;
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -716,12 +723,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 			       const struct v4l2_mbus_framefmt *format,
 			       const struct imx290_mode *mode)
 {
-	unsigned int hblank = mode->hmax - mode->width;
+	unsigned int hblank_min = mode->hmax_min - mode->width;
+	unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
 
-	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
+	__v4l2_ctrl_modify_range(imx290->hblank, hblank_min, hblank_max, 1,
+				 hblank_min);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
 }
 
@@ -778,10 +787,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 				     ARRAY_SIZE(imx290_test_pattern_menu) - 1,
 				     0, 0, imx290_test_pattern_menu);
 
+	/*
+	 * Actual range will be set from imx290_ctrl_update later in the probe.
+	 */
 	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_HBLANK, 1, 1, 1, 1);
-	if (imx290->hblank)
-		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
@@ -850,11 +860,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
 		return ret;
 	}
 
-	ret = imx290_write(imx290, IMX290_HMAX, imx290->current_mode->hmax,
-			   NULL);
-	if (ret)
-		return ret;
-
 	/* Apply customized values from user */
 	ret = __v4l2_ctrl_handler_setup(imx290->sd.ctrl_handler);
 	if (ret) {
-- 
2.34.1

