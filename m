Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C067ACA89
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbjIXPdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjIXPdU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF95AC6
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:13 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C01263360;
        Sun, 24 Sep 2023 17:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569492;
        bh=wqAM+gBAzgot2hh2m4BKULFUEKpkzSqVunH1xMBOYJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IjF5qsYtTiEy+/noy0HGs8UFi1YGSYkI2I2TD42H/cqzMEv2q6X6444xfSARUo/rX
         kJtWHQ0jvk47Trrpgsjg+9geisEZ47cj5sryNY52YfCkaEnAM4Spm2vTMAJvsXbpk4
         eNR6LbySrqtZqFlsBWVARv+5dOOiLjPUam+fYN00=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 10/20] media: i2c: imx219: Infer binning settings from format and crop
Date:   Sun, 24 Sep 2023 18:32:59 +0300
Message-ID: <20230924153309.12423-11-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
References: <20230924153309.12423-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Compare the format and crop rectangle dimensions to infer binning
settings, instead of storing the binning mode in the imx219_mode
structure. This removes duplicate information from the mode.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 562cfee87b24..bc836cd13ef5 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -161,9 +161,6 @@ struct imx219_mode {
 
 	/* V-timing */
 	unsigned int vts_def;
-
-	/* 2x2 binning is used */
-	bool binning;
 };
 
 static const struct cci_reg_sequence imx219_common_regs[] = {
@@ -305,7 +302,6 @@ static const struct imx219_mode supported_modes[] = {
 			.height = 2464
 		},
 		.vts_def = IMX219_VTS_15FPS,
-		.binning = false,
 	},
 	{
 		/* 1080P 30fps cropped */
@@ -318,7 +314,6 @@ static const struct imx219_mode supported_modes[] = {
 			.height = 1080
 		},
 		.vts_def = IMX219_VTS_30FPS_1080P,
-		.binning = false,
 	},
 	{
 		/* 2x2 binned 30fps mode */
@@ -331,7 +326,6 @@ static const struct imx219_mode supported_modes[] = {
 			.height = 2464
 		},
 		.vts_def = IMX219_VTS_30FPS_BINNED,
-		.binning = true,
 	},
 	{
 		/* 640x480 30fps mode */
@@ -344,7 +338,6 @@ static const struct imx219_mode supported_modes[] = {
 			.height = 960
 		},
 		.vts_def = IMX219_VTS_30FPS_640x480,
-		.binning = true,
 	},
 };
 
@@ -648,7 +641,7 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	cci_write(imx219->regmap, IMX219_REG_Y_ADD_END_A,
 		  crop->top - IMX219_PIXEL_ARRAY_TOP + crop->height - 1, &ret);
 
-	if (!imx219->mode->binning)
+	if (format->width == crop->width && format->height == crop->height)
 		bin_mode = IMX219_BINNING_NONE;
 	else if (bpp == 8)
 		bin_mode = IMX219_BINNING_2X2_ANALOG;
-- 
Regards,

Laurent Pinchart

