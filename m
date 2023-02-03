Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF80F68A2CC
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 20:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbjBCTSn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 14:18:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233642AbjBCTSi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 14:18:38 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F051073770
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 11:18:36 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a2so5267396wrd.6
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 11:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9whmx4oFFCwkxifzifzTesBa+oZIQxjzUQmNRhiSrrA=;
        b=kar8MaZELzLEwhvnhglu5dY4cY0rzpIHyKRXqx9+Sc1KVO0oT0fMpWQVyQEZ9nfa8N
         Mea91ExDa+HzvEOTMwwG1xFXDWC94evdF8Scdia86dCcaeR4f8ALo4Wc1Y6G5FQFMsdR
         pztInqumrSMZR2+NR8uc6tLLHrbEP/K6doWwivIGieEPaiS0VRsYGMKtDqn0oz6rwapQ
         U8jRjxJ+iQCUtDgTScaT1Kwps7PV8cGg84Br8eK/NYkyGHgSQdLMrFnXU1y6wcz8kjfq
         I/RPTnQh3KrRDPSjNY5lh4rPOfZj8rKDfXgKCa/R1qR4r8iCcMY2bTukgWeFhpgpQm1X
         AzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9whmx4oFFCwkxifzifzTesBa+oZIQxjzUQmNRhiSrrA=;
        b=rBG+d8ZdPMPtgKsyMGTmxW0RoZA2itbdfs2sAExVRW4Fbx6yWaOdmfXBz1zmSFioGu
         0+NqNF8or66qPOd91Q5oimcCUWuppepNK1zlUiS8h+opn5/KZAnSkqXJqXD6VfDZKJNf
         M2BCufnVxIqnMSU2O8FjGeNMUcNxgFsevgCwScPNBQoZwYGM9D2jt8bImpZCdy1MI8UU
         8G5k2faw6JcElq0rUahYF7tXaZa6x3pp22lKWi8OelG2z09CedF6hN7o0l+1bwDpHJGZ
         DlbLNaxHSjS2I2EWTJetxNU4XsLkZMBOVSIRwu4HIju2L6digMpnYmSZTQSq/64jcdP5
         7sBA==
X-Gm-Message-State: AO0yUKW1bWWqRz30Eg/MbD3YvRlEl3ey53EMDFXOl3+CWKWMAy1RlTAD
        5d60tMxKQf7T2FbXPqeKkRd57Q==
X-Google-Smtp-Source: AK7set8BNKA8DMcUFA9QM03kQyuy0wb4DehNCuBB1WTtNYbFeiWDjUKMK0wJSvjEVCyATLW5Y6/4Dg==
X-Received: by 2002:a05:6000:38e:b0:2bc:7fdd:9245 with SMTP id u14-20020a056000038e00b002bc7fdd9245mr10765620wrf.5.1675451916601;
        Fri, 03 Feb 2023 11:18:36 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
        by smtp.googlemail.com with ESMTPSA id f6-20020a5d5686000000b002c3daaef051sm1348637wrv.82.2023.02.03.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 11:18:36 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 07/13] media: i2c: imx290: Convert V4L2_CID_HBLANK to read/write
Date:   Fri,  3 Feb 2023 19:18:05 +0000
Message-Id: <20230203191811.947697-8-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
References: <20230203191811.947697-1-dave.stevenson@raspberrypi.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx290.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 2abe4cdab819..74eafed15613 100644
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
@@ -183,7 +184,7 @@ struct imx290_regval {
 struct imx290_mode {
 	u32 width;
 	u32 height;
-	u32 hmax;
+	u32 hmax_min;
 	u8 link_freq_index;
 
 	const struct imx290_regval *data;
@@ -426,7 +427,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -434,7 +435,7 @@ static const struct imx290_mode imx290_modes_2lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -445,7 +446,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
-		.hmax = 2200,
+		.hmax_min = 2200,
 		.link_freq_index = FREQ_INDEX_1080P,
 		.data = imx290_1080p_settings,
 		.data_size = ARRAY_SIZE(imx290_1080p_settings),
@@ -453,7 +454,7 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
 	{
 		.width = 1280,
 		.height = 720,
-		.hmax = 3300,
+		.hmax_min = 3300,
 		.link_freq_index = FREQ_INDEX_720P,
 		.data = imx290_720p_settings,
 		.data_size = ARRAY_SIZE(imx290_720p_settings),
@@ -707,6 +708,12 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -737,12 +744,14 @@ static void imx290_ctrl_update(struct imx290 *imx290,
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
 
@@ -799,10 +808,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
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
@@ -871,11 +881,6 @@ static int imx290_start_streaming(struct imx290 *imx290,
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

