Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8C2634A1C
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 23:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbiKVWdQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 17:33:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235131AbiKVWdO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 17:33:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A99A13F2
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 14:33:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 82881133C;
        Tue, 22 Nov 2022 23:33:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669156390;
        bh=PTzzjYA6KCX+me59SAU7yS6pA3Nxb/SPcR+s7GM/DLM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZMdNoXloSryO6IvVN2iF6xQv6ct0Y8g59g9Bv/ZqTIuFlGSmb83WgYSfU9fXq3CbC
         B6/Qwhrh4s2wRCuEk876x7d04XDxrm3f/9wdIDJ2ixp9MIwKk/NpuI13NeS0m8w/nu
         d58X6Z6HPq/t56xGQXRjFX/zcj11Plk28D7Nvb4A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v1 03/15] media: i2c: imx290: Factor out control update code to a function
Date:   Wed, 23 Nov 2022 00:32:38 +0200
Message-Id: <20221122223250.21233-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
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
---
 drivers/media/i2c/imx290.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 4dbf218e7a63..eb295502d0c3 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -639,6 +639,21 @@ static const char * const imx290_test_pattern_menu[] = {
 	"000/555h Toggle Pattern",
 };
 
+static void imx290_ctrl_update(struct imx290 *imx290,
+			       const struct imx290_mode *mode)
+{
+	unsigned int hblank = mode->hmax - mode->width;
+	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
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
@@ -904,26 +919,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
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

