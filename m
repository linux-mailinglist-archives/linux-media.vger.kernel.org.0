Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B3A4EAA03
	for <lists+linux-media@lfdr.de>; Tue, 29 Mar 2022 11:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbiC2JEu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Mar 2022 05:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbiC2JEt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Mar 2022 05:04:49 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C220021FC59
        for <linux-media@vger.kernel.org>; Tue, 29 Mar 2022 02:03:06 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id DC1CF10000E;
        Tue, 29 Mar 2022 09:03:02 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        krzysztof.kozlowski@canonical.com,
        jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:OMNIVISION OV5670 SENSOR DRIVER)
Subject: [PATCH v3 7/8] media: i2c: ov5670: Implement init_cfg
Date:   Tue, 29 Mar 2022 11:01:32 +0200
Message-Id: <20220329090133.338073-8-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329090133.338073-1-jacopo@jmondi.org>
References: <20220329090133.338073-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement the .init_cfg() pad operation and initialize the default
format.

With .init_cfg() pad operation implemented the deprecated .open()
internal operation can now be dropped.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5670.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index b63b07d8ca2f..7f12b053cb0e 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -1956,27 +1956,6 @@ static int ov5670_write_reg_list(struct ov5670 *ov5670,
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
@@ -2176,6 +2155,25 @@ static int ov5670_init_controls(struct ov5670 *ov5670)
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
@@ -2497,6 +2495,7 @@ static const struct v4l2_subdev_video_ops ov5670_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov5670_pad_ops = {
+	.init_cfg = ov5670_init_cfg,
 	.enum_mbus_code = ov5670_enum_mbus_code,
 	.get_fmt = ov5670_get_pad_format,
 	.set_fmt = ov5670_set_pad_format,
@@ -2518,10 +2517,6 @@ static const struct media_entity_operations ov5670_subdev_entity_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct v4l2_subdev_internal_ops ov5670_internal_ops = {
-	.open = ov5670_open,
-};
-
 static int ov5670_regulators_probe(struct ov5670 *ov5670)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov5670->sd);
@@ -2630,7 +2625,6 @@ static int ov5670_probe(struct i2c_client *client)
 		goto error_mutex_destroy;
 	}
 
-	ov5670->sd.internal_ops = &ov5670_internal_ops;
 	ov5670->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 			    V4L2_SUBDEV_FL_HAS_EVENTS;
 	ov5670->sd.entity.ops = &ov5670_subdev_entity_ops;
-- 
2.35.1

