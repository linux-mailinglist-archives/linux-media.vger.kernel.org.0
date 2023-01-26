Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 187F767CB2C
	for <lists+linux-media@lfdr.de>; Thu, 26 Jan 2023 13:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbjAZMrU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Jan 2023 07:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232925AbjAZMrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158F76C100
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 04:47:06 -0800 (PST)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32FC612EF;
        Thu, 26 Jan 2023 13:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674737217;
        bh=lrr6L5YLONkNwE9d9XUrOKsFugVnbmXQItS0mH4vxtc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vla/DuaqPEN9KdxZOUMeS6gzbBJ6GJnoc+AfMBWN0t0vgj+LJWzHK+mOyNkQb5WZS
         IlmrMFxVHbovuGZzKzbCmRBzvgIO/0gnD2JaTKe61lO9zOZd4cnspGMjuc9le9HpVC
         AgOfPVuzyhVlFvBIrC3LvERs7O0H4dXz7uqrHo7I=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v5 7/9] media: i2c: ov5670: Implement init_cfg
Date:   Thu, 26 Jan 2023 13:46:30 +0100
Message-Id: <20230126124632.45842-8-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
References: <20230126124632.45842-1-jacopo.mondi@ideasonboard.com>
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

Implement the .init_cfg() pad operation and initialize the default
format with the default full resolution mode 2592x1944.

With .init_cfg() pad operation implemented the deprecated .open()
internal operation can now be dropped.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/ov5670.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index 12091a5c992e..8f4350898b36 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1962,27 +1962,6 @@ static int ov5670_write_reg_list(struct ov5670 *ov5670,
 	return ov5670_write_regs(ov5670, r_list->regs, r_list->num_of_regs);
 }
 
-/* Open sub-device */
-static int ov5670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-{
-	struct ov5670 *ov5670 = to_ov5670(sd);
-	struct v4l2_mbus_framefmt *try_fmt =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
-
-	mutex_lock(&ov5670->mutex);
-
-	/* Initialize try_fmt */
-	try_fmt->width = ov5670->cur_mode->width;
-	try_fmt->height = ov5670->cur_mode->height;
-	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
-	try_fmt->field = V4L2_FIELD_NONE;
-
-	/* No crop or compose */
-	mutex_unlock(&ov5670->mutex);
-
-	return 0;
-}
-
 static int ov5670_update_digital_gain(struct ov5670 *ov5670, u32 d_gain)
 {
 	int ret;
@@ -2182,6 +2161,25 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
 	return ret;
 }
 
+static int ov5670_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_framefmt *fmt =
+				v4l2_subdev_get_try_format(sd, state, 0);
+	const struct ov5670_mode *default_mode = &supported_modes[0];
+
+	fmt->width = default_mode->width;
+	fmt->height = default_mode->height;
+	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SRGB);
+	fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SRGB);
+
+	return 0;
+}
+
 static int ov5670_enum_mbus_code(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
 				 struct v4l2_subdev_mbus_code_enum *code)
@@ -2512,6 +2510,7 @@ static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
+	.init_cfg = ov5670_init_cfg,
 	.enum_mbus_code = ov5670_enum_mbus_code,
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
@@ -2533,10 +2532,6 @@ static const struct media_entity_operations ov5670_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
-	.open = ov5670_open,
-};
-
 static int ov5670_regulators_probe(struct ov5670 *ov5670)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
@@ -2645,7 +2640,6 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_mutex_destroy;
 	}
 
-	ov5670->sd.internal_ops = &ov5670_internal_ops;
 	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;
-- 
2.39.0

