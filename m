Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3F9E7ACA93
	for <lists+linux-media@lfdr.de>; Sun, 24 Sep 2023 17:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjIXPdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Sep 2023 11:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjIXPde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Sep 2023 11:33:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C297100
        for <linux-media@vger.kernel.org>; Sun, 24 Sep 2023 08:33:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49E1D34B5;
        Sun, 24 Sep 2023 17:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695569503;
        bh=/VYefFYo7Ei3LHFbpfgJo1YIP1TLHfv6OSt3SgNYank=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eP7eFcbxvKPYwVt/qjoQIbPm+7pO0lgDKVn7cHR28+XYAkD3OEXUKWR75MgCW4IPz
         TfCOjGo4XTGiE0Pya/3MiW5HcXoo6EGfzTLKekh8Sf0aam6VWVtHLFICmTy/WjOrae
         Bgc4iHuPJZRbjnazKP1f56/OOA7lOcaK8Tx3DzO0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v4 19/20] media: i2c: imx219: Name all subdev state variables 'state'
Date:   Sun, 24 Sep 2023 18:33:08 +0300
Message-ID: <20230924153309.12423-20-laurent.pinchart@ideasonboard.com>
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

Subdev state variables are named with a mix of 'state' and 'sd_state'
through the driver. To improve consistency, name them all 'state'.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx219.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 2b88c5b8a7bf..358a6d77d88c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -774,7 +774,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 }
 
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -788,7 +788,7 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx219_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -810,7 +810,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -827,7 +827,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 
-	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+	format = v4l2_subdev_get_pad_format(sd, state, 0);
 	*format = fmt->format;
 
 	/*
@@ -837,7 +837,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
 	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
 
-	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
 	crop->width = format->width * bin_h;
 	crop->height = format->height * bin_v;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
@@ -872,12 +872,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 }
 
 static int imx219_get_selection(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_state *state,
 				struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
-		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+		sel->r = *v4l2_subdev_get_pad_crop(sd, state, 0);
 		return 0;
 	}
 
-- 
Regards,

Laurent Pinchart

