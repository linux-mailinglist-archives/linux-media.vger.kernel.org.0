Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB8E66C2E8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 15:56:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbjAPO4X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 09:56:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232533AbjAPOz6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 09:55:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCA312202C
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 06:44:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F164610B1;
        Mon, 16 Jan 2023 15:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673880298;
        bh=ihX+WGIzDOdgiiJerX7c0/pF2m/OEbk9OpPRnb0+esg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PUqTElRlRBih7Hh3PSZ/7w6dMXRnU68a+z8uRvQy46/caSfW+GuJuaRPMIjQAqY23
         0P2dlEpIoMK3ityvOPfY1K9QUjnvUt35UmofEb4D6ZYjA2HOvmU1jk7lLWv3CPjiGa
         6mLvbMBGiMjSeQRFYamPfOBno0P9ZzyDPw3eAqY8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v3 03/17] media: i2c: imx290: Factor out control update code to a function
Date:   Mon, 16 Jan 2023 16:44:40 +0200
Message-Id: <20230116144454.1012-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
References: <20230116144454.1012-1-laurent.pinchart@ideasonboard.com>
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

Move the control update code to a separate function to group it with all
the control-related code and make imx290_set_fmt() more readable.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes since v1:

- Correctly handle the case where imx290_ctrl_update() gets called
  before controls are initialized
---
 drivers/media/i2c/imx290.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 5529bd39238f..991e7285c40c 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -639,6 +639,28 @@ static const char * const imx290_test_pattern_menu[] = {
 	"000/555h Toggle Pattern",
 };
 
+static void imx290_ctrl_update(struct imx290 *imx290,
+			       const struct imx290_mode *mode)
+{
+	unsigned int hblank = mode->hmax - mode->width;
+	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
+
+	/*
+	 * This function may be called from imx290_set_fmt() before controls
+	 * get created by imx290_ctrl_init(). Return immediately in that case.
+	 */
+	if (!imx290->ctrls.lock)
+		return;
+
+	__v4l2_ctrl_s_ctrl(imx290->link_freq,
+			   imx290_get_link_freq_index(imx290));
+	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
+				 imx290_calc_pixel_rate(imx290));
+
+	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
+	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
+}
+
 static int imx290_ctrl_init(struct imx290 *imx290)
 {
 	struct v4l2_fwnode_device_properties props;
@@ -904,26 +926,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 		imx290->current_mode = mode;
 		imx290->bpp = imx290_formats[i].bpp;
 
-		if (imx290->link_freq)
-			__v4l2_ctrl_s_ctrl(imx290->link_freq,
-					   imx290_get_link_freq_index(imx290));
-		if (imx290->pixel_rate)
-			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
-						 imx290_calc_pixel_rate(imx290));
-
-		if (imx290->hblank) {
-			unsigned int hblank = mode->hmax - mode->width;
-
-			__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank,
-						 1, hblank);
-		}
-
-		if (imx290->vblank) {
-			unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
-
-			__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank,
-						 1, vblank);
-		}
+		imx290_ctrl_update(imx290, mode);
 	}
 
 	*format = fmt->format;
-- 
Regards,

Laurent Pinchart

