Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB63683663
	for <lists+linux-media@lfdr.de>; Tue, 31 Jan 2023 20:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjAaTVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Jan 2023 14:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjAaTVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Jan 2023 14:21:18 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DD859E44
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:07 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so11474497wmq.0
        for <linux-media@vger.kernel.org>; Tue, 31 Jan 2023 11:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXag4SScz1IWoq6CjWg2NhccWObAjwUcn/IapGcRwP8=;
        b=E0njOo/egkeNjKFlL4b6ek6ARSF8TKUj5qbzX+TdIMtXMcHWsODy8zOrEJ8/c567VK
         lDOxM/nFhcEFaVe+WKXrC1PRmE8GtOQNlc82osKtpA8B0N3G+7EQwySRru9tkEsIgYrS
         NLhqGt1cMw1RVk2Zwe4bJa/TLuCFIsIbigy02CnnUBD/cgosCWJsFTDqsYb+CZ+cM4Yt
         LPBWQHFmuVdCkLoR7GqVase3A7klqv11P+gCVMSgPCrz0Q47ca+RMkRw1IJgHu8oP60X
         vJZxWQLBUUAIJnjV+TvL5n5vfOi7/XbGdgkWEXT2ydsVo3ytsDvaEdsXDGbm4sRrIiJK
         1jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXag4SScz1IWoq6CjWg2NhccWObAjwUcn/IapGcRwP8=;
        b=ZyFHds/MAPSk+BLTVuInUu5ol00g1MPmyBcGtVQ6vPrXKcuN1VLP+5OKeyAfpos96U
         BEKVT+RZkb2qH6qEocFu57o3wenU/dyTrEllxo2ndYAfReNU33C8UPWx8Vo1tzuWoCHJ
         pSolgQVzaDfAG6HRAxgf69Y6U2w9hOnVGUKgiQ5rMa8hMPHLe6+DprhwkhUcLXndi1/R
         Ylw1UVqtWckY0/4txU+DXTEtodldtjBfLRGRkvC1Y5GuFK9M4u4jFU1GckENRnpYiQ0b
         qPo7YAfS0INJflxnxKP7EENP+RjTYv6RqpCnihx+gKTV3bx16nng01HkjhZBASX3Y6DV
         +cuw==
X-Gm-Message-State: AO0yUKV5czhgHrRPJ3Bfdj19rIchx3IU2PUIsZnpR7BYrDZtQN/rVxio
        oJMIQ8JSfkwO/3oGBHDYArwy5A==
X-Google-Smtp-Source: AK7set+W34BOhdUBH/EuggPZEsldVXz2DrgK54z6obFviOZh8umUJdtdMP5UYgq1cs8UegFupeaP9g==
X-Received: by 2002:a05:600c:3492:b0:3dc:5984:a16c with SMTP id a18-20020a05600c349200b003dc5984a16cmr8795936wmq.31.1675192865840;
        Tue, 31 Jan 2023 11:21:05 -0800 (PST)
Received: from dave-Ubuntu2204.. (194.15.169.217.in-addr.arpa. [217.169.15.194])
        by smtp.googlemail.com with ESMTPSA id x9-20020a05600c21c900b003dc434b39c7sm3527512wmj.0.2023.01.31.11.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 11:21:05 -0800 (PST)
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 11/11] media: i2c: imx290: Add support for H & V Flips
Date:   Tue, 31 Jan 2023 19:20:16 +0000
Message-Id: <20230131192016.3476937-12-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sensor supports H & V flips, so add the relevant hooks for
V4L2_CID_HFLIP and V4L2_CID_VFLIP to configure them.

Note that the Bayer order is maintained as the readout area
shifts by 1 pixel in the appropriate direction (note the
comment about the top margin being 8 pixels whilst the bottom
margin is 9). The V4L2_SEL_TGT_CROP region is therefore
adjusted appropriately.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 7f6746f74040..d2b7534f2c51 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -227,6 +227,8 @@ struct imx290 {
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *hflip;
+	struct v4l2_ctrl *vflip;
 };
 
 static inline struct imx290 *to_imx290(struct v4l2_subdev *_sd)
@@ -801,6 +803,24 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 				   NULL);
 		break;
 
+	case V4L2_CID_HFLIP:
+	case V4L2_CID_VFLIP:
+	{
+		u32 reg;
+
+		/* WINMODE is in bits [6:4], so need to read-modify-write */
+		ret = imx290_read(imx290, IMX290_CTRL_07, &reg);
+		if (ret)
+			break;
+		reg &= ~(IMX290_HREVERSE | IMX290_VREVERSE);
+		if (imx290->hflip->val)
+			reg |= IMX290_HREVERSE;
+		if (imx290->vflip->val)
+			reg |= IMX290_VREVERSE;
+		ret = imx290_write(imx290, IMX290_CTRL_07, reg, NULL);
+		break;
+	}
+
 	default:
 		ret = -EINVAL;
 		break;
@@ -853,7 +873,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	if (ret < 0)
 		return ret;
 
-	v4l2_ctrl_handler_init(&imx290->ctrls, 9);
+	v4l2_ctrl_handler_init(&imx290->ctrls, 11);
 
 	/*
 	 * The sensor has an analog gain and a digital gain, both controlled
@@ -909,6 +929,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
 					   V4L2_CID_VBLANK, 1, 1, 1, 1);
 
+	imx290->hflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					  V4L2_CID_HFLIP, 0, 1, 1, 0);
+	imx290->vflip = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
+					  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 	v4l2_ctrl_new_fwnode_properties(&imx290->ctrls, &imx290_ctrl_ops,
 					&props);
 
@@ -1030,6 +1055,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put_autosuspend(imx290->dev);
 	}
 
+	/* vflip and hflip cannot change during streaming */
+	__v4l2_ctrl_grab(imx290->vflip, enable);
+	__v4l2_ctrl_grab(imx290->hflip, enable);
 unlock:
 	v4l2_subdev_unlock_state(state);
 	return ret;
@@ -1115,6 +1143,7 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 				struct v4l2_subdev_state *sd_state,
 				struct v4l2_subdev_selection *sel)
 {
+	struct imx290 *imx290 = to_imx290(sd);
 	struct v4l2_mbus_framefmt *format;
 
 	switch (sel->target) {
@@ -1122,9 +1151,11 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
 
 		sel->r.top = IMX920_PIXEL_ARRAY_MARGIN_TOP
-			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2;
+			   + (IMX290_PIXEL_ARRAY_RECORDING_HEIGHT - format->height) / 2
+			   + imx290->vflip->val;
 		sel->r.left = IMX920_PIXEL_ARRAY_MARGIN_LEFT
-			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2;
+			    + (IMX290_PIXEL_ARRAY_RECORDING_WIDTH - format->width) / 2
+			    + imx290->hflip->val;
 		sel->r.width = format->width;
 		sel->r.height = format->height;
 
-- 
2.34.1

