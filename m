Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC517835CD
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 00:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbjHUWat (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Aug 2023 18:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbjHUWat (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Aug 2023 18:30:49 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EE9198
        for <linux-media@vger.kernel.org>; Mon, 21 Aug 2023 15:30:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66F2287E0;
        Tue, 22 Aug 2023 00:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692656943;
        bh=no4f11jdo6D/pdtmAgTJzpwIesjuSk585mc6h6jjr+Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o+l1PvSLPjphW/YJRV0FMR5axyg997GRclJWvbakmuQuhlxp84ftiZR5br84mUqE1
         dO6impYisWrctf+f1bNNIKEeA5yyBb2VshxL8SLvNKyh6Q+LJdiV1NYj90APr/N5qx
         W+PGlTBT8yabVBVx2vEcW3JaY+01AYgYERHMhgGQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 17/18] media: i2c: imx219: Name all subdev state variables 'state'
Date:   Tue, 22 Aug 2023 01:30:00 +0300
Message-ID: <20230821223001.28480-18-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
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

Subdev state variables are named with a mix of 'state' and 'sd_state'
through the driver. To improve consistency, name them all 'state'.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx219.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 4140d9b78e4c..e2f0d3782e7c 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -760,7 +760,7 @@ static void imx219_update_pad_format(struct imx219 *imx219,
 }
 
 static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -774,7 +774,7 @@ static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int imx219_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -796,7 +796,7 @@ static int imx219_enum_frame_size(struct v4l2_subdev *sd,
 }
 
 static int imx219_set_pad_format(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_state *state,
 				 struct v4l2_subdev_format *fmt)
 {
 	struct imx219 *imx219 = to_imx219(sd);
@@ -813,7 +813,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 
-	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+	format = v4l2_subdev_get_pad_format(sd, state, 0);
 	*format = fmt->format;
 
 	/*
@@ -823,7 +823,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin = min3(IMX219_PIXEL_ARRAY_WIDTH / format->width,
 		   IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
 
-	crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
+	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
 	crop->width = format->width * bin;
 	crop->height = format->height * bin;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
@@ -858,12 +858,12 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
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

