Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4842268365C
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbjAaTVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjAaTU6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:20:58 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1497115557
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:55 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so13257278wmb.2
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlBo0kZk8/xb90kgdTCjwFuYGgW4+Yg6DmE0UD6DHvk=;
        b=Rj3UqTy0hi43Lj3fLMMJ8+tfMeHCtk8rx+3qAkSYAgsD4c+W/h/AwD4EBEHHOle04o
         pIqVimw+VCNMvWKw9r7hp8Ua5oojvrpC72Do+lT9RuF5icxYZuo8LJhYEmwTChpk9W9A
         cg2mxPpCkx4fRMbYGrvhr4flKZwxb12R5/7J+J7ZXJ/3DT+ypVAE6UhXcLSemPYaHqrw
         puYiaNBzhuprH2jeWaA0g/xL32J9gaT2HfJPKwyGGgtCPmGQMGDW7AqbBYNlXIHIbSoV
         HFK/nxeg5nSSC9V3VwV8FXMRPSoycE0l5kr8WWOf+sW1r4lQ2BhElyROx80uirNd0Zm5
         btKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlBo0kZk8/xb90kgdTCjwFuYGgW4+Yg6DmE0UD6DHvk=;
        b=qgrvd5Tx1AZWsBFiXgbg1KQY2r+Q/kFJ9jDGZe9iD0U4fCO8j3BBG4Ijv1uSOcaKSK
         WL9VXAu7g/Hb6yAKQSOQX1Xim/sHn6DEmg49NIgqyNzck7xTlYm1vqVQG+UDbMbLsmSC
         X+htKjf2w42U2LjAbhJ4Y39xuLew2DREMGjjumer/1N5O/IGPhnwN+6EqasQKrSuiuF0
         MeiCcpEUs/AF+Y/ccFMH2JAe2ywmnOQLnz9PNqYlUv+uSkt83wNdtbaZ7xw8iNaW60UL
         a5CfvtjzQcve2KU9HJiX87WFnMGXjQ6/QaVtm4I7lXCdESZA596vxSYphukU3ks95JGJ
         9tFw==
X-Gm-Message-State: AO0yUKXjic/Q0L0Q3bDVv9WzlI3jtwrhzOJyODXSLFCumcSchl+ZD+y3
        pEsCK4PHTxeHPk8EN4xQVaUrm5dNti35wsHE
X-Google-Smtp-Source: AK7set/8y502DxetLX+LkXnM+cXrunj4RXFSXB72ksApSM1rwUhnxhVc7SJslQCvhj6qwyERXLUo6w==
X-Received: by 2002:a05:600c:35d6:b0:3dc:443e:3a8b with SMTP id r22-20020a05600c35d600b003dc443e3a8bmr14862613wmq.16.1675192854713;
        Tue, 31 Jan 2023 11:20:54 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:20:53 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 04/11] media: i2c: imx290: Fix the pixel rate at 148.5Mpix/s
Date:   Tue, 31 Jan 2023 19:20:09 +0000
Message-Id: <20230131192016.3476937-5-dave.stevenson@raspberrypi.com>
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

The datasheet lists the link frequency changes between
1080p and 720p modes. This is correct that the link frequency
changes as measured on an oscilloscope.

Link frequency is not necessarily the same as pixel rate.

The datasheet gives standard configurations for 1080p and 720p
modes at a number of frame rates.
Looking at the 1080p mode it gives:
HMAX = 0x898 = 2200
VMAX = 0x465 = 1125
2200 * 1125 * 60fps = 148.5MPix/s

Looking at the 720p mode it gives:
HMAX = 0xce4 = 3300
VMAX = 0x2ee = 750
3300 * 750 * 60fps = 148.5Mpix/s

This driver currently scales the pixel rate proportionally to the
link frequency, however the above shows that this is not the
correct thing to do, and currently all frame rate and exposure
calculations give incorrect results.

Correctly report the pixel rate as being 148.5MPix/s under any
mode.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 12946ca9d8d2..bd8729aed43c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -107,6 +107,7 @@
 
 #define IMX290_VMAX_DEFAULT				1125
 
+#define IMX290_PIXEL_RATE				148500000
 /*
  * The IMX290 pixel array is organized as follows:
  *
@@ -190,7 +191,6 @@ struct imx290 {
 
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *link_freq;
-	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 };
@@ -649,15 +649,8 @@ static void imx290_ctrl_update(struct imx290 *imx290,
 {
 	unsigned int hblank = mode->hmax - mode->width;
 	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
-	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode->link_freq_index];
-	u64 pixel_rate;
-
-	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = link_freq * 2 * imx290->nlanes;
-	do_div(pixel_rate, imx290_format_info(format->code)->bpp);
 
 	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
-	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
 
 	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
 	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
@@ -707,9 +700,9 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (imx290->link_freq)
 		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-					       V4L2_CID_PIXEL_RATE,
-					       1, INT_MAX, 1, 1);
+	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops, V4L2_CID_PIXEL_RATE,
+			  IMX290_PIXEL_RATE, IMX290_PIXEL_RATE, 1,
+			  IMX290_PIXEL_RATE);
 
 	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-- 
2.34.1

