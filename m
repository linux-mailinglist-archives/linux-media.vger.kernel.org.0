Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B4778EF10
	for <lists+linux-media@lfdr.de>; Thu, 31 Aug 2023 15:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240931AbjHaN5p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Aug 2023 09:57:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235410AbjHaN5o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Aug 2023 09:57:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB60992
        for <linux-media@vger.kernel.org>; Thu, 31 Aug 2023 06:57:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54C511225;
        Thu, 31 Aug 2023 15:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693490175;
        bh=zT8rgmcAW0ih8/5QR042UA4KAdHSC9BfdcuYac9NbA4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lGk3haVvJhssa79Pm02KtMCTIqP/tlIQJLKu3OJ746ZDf2xswrGjA+gMsfMaq6WLl
         J7O3CFVrPOZ6bAe0te5Bn7joqVq+T0p1UabwdhKm+6OJeFiKAr53h5akIO2MmV7ezc
         VS3jWCKErctFETfD5vNFhiczBXR26zv58ssj2wvg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 2/3] media: i2c: imx219: Fix crop rectangle setting when changing format
Date:   Thu, 31 Aug 2023 16:57:46 +0300
Message-ID: <20230831135747.23148-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
References: <20230831135747.23148-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When moving the imx219 driver to the subdev active state, commit
e8a5b1df000e ("media: i2c: imx219: Use subdev active state") used the
pad crop rectangle stored in the subdev state to report the crop
rectangle of the active mode. That crop rectangle was however not set in
the state when setting the format, which resulted in reporting an
incorrect crop rectangle to userspace. Fix it.

Fixes: e8a5b1df000e ("media: i2c: imx219: Use subdev active state")
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 6f88e002c8d8..f19c828b6943 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -750,6 +750,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	const struct imx219_mode *mode;
 	int exposure_max, exposure_def, hblank;
 	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
 
 	mode = v4l2_find_nearest_size(supported_modes,
 				      ARRAY_SIZE(supported_modes),
@@ -757,11 +758,16 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
+
 	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
 
 	if (imx219->mode == mode && format->code == fmt->format.code)
 		return 0;
 
+	*format = fmt->format;
+	*crop = mode->crop;
+
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx219->mode = mode;
 		/* Update limits and set FPS to default */
@@ -788,8 +794,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 					 hblank);
 	}
 
-	*format = fmt->format;
-
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

