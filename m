Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F50B7D9473
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235075AbjJ0J7I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235028AbjJ0J7H (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E628192
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 044701BAE;
        Fri, 27 Oct 2023 11:58:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698400725;
        bh=Bvlzjk/HvaTZ65ZiRHsbKkD2tVYpue0hWKHCwdGt6L0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K7+UMCa+hQ+69/IuFeCM1k42jc2szPUDhXB7NOnhUDgk73NSNahTuWnviAU32Z+s6
         htnVjow+GcA2aZaUhVxl8k6WdZUvvPpLAAdZRbzXP9CzG4FqyHuVzBztABc+4Cm2xS
         aq3ixoO/CHrzOeFZo5Joh4cuZl7iqVXwHY3kXk1o=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v1 8/9] media: i2c: Fix references to pad config
Date:   Fri, 27 Oct 2023 12:58:52 +0300
Message-ID: <20231027095853.29057-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
References: <20231027095853.29057-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2 subdev operations have moved from operating on a
v4l2_subdev_pad_config to a v4l2_subdev_state a long time ago. Fix the
few remaining incorrect references to pad config in the I2C drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/imx334.c  | 8 ++++----
 drivers/media/i2c/imx335.c  | 8 ++++----
 drivers/media/i2c/imx412.c  | 8 ++++----
 drivers/media/i2c/ov9282.c  | 8 ++++----
 drivers/media/i2c/tvp7002.c | 6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 493a43b9fa36..42cf71c1f6fd 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -935,14 +935,14 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx334_init_pad_cfg() - Initialize sub-device pad configuration
+ * imx334_init_cfg() - Initialize sub-device state
  * @sd: pointer to imx334 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device state
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx334_init_pad_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state)
+static int imx334_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
 {
 	struct imx334 *imx334 = to_imx334(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -1190,7 +1190,7 @@ static const struct v4l2_subdev_video_ops imx334_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx334_pad_ops = {
-	.init_cfg = imx334_init_pad_cfg,
+	.init_cfg = imx334_init_cfg,
 	.enum_mbus_code = imx334_enum_mbus_code,
 	.enum_frame_size = imx334_enum_frame_size,
 	.get_fmt = imx334_get_pad_format,
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index eaa0e9c251ce..0432f059e913 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -618,14 +618,14 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx335_init_pad_cfg() - Initialize sub-device pad configuration
+ * imx335_init_cfg() - Initialize sub-device state
  * @sd: pointer to imx335 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx335_init_pad_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state)
+static int imx335_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
 {
 	struct imx335 *imx335 = to_imx335(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -835,7 +835,7 @@ static const struct v4l2_subdev_video_ops imx335_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx335_pad_ops = {
-	.init_cfg = imx335_init_pad_cfg,
+	.init_cfg = imx335_init_cfg,
 	.enum_mbus_code = imx335_enum_mbus_code,
 	.enum_frame_size = imx335_enum_frame_size,
 	.get_fmt = imx335_get_pad_format,
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index df6f84f81d1b..41d756a20f3c 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -770,14 +770,14 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * imx412_init_pad_cfg() - Initialize sub-device pad configuration
+ * imx412_init_cfg() - Initialize sub-device state
  * @sd: pointer to imx412 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_init_pad_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state)
+static int imx412_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
 {
 	struct imx412 *imx412 = to_imx412(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -997,7 +997,7 @@ static const struct v4l2_subdev_video_ops imx412_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
-	.init_cfg = imx412_init_pad_cfg,
+	.init_cfg = imx412_init_cfg,
 	.enum_mbus_code = imx412_enum_mbus_code,
 	.enum_frame_size = imx412_enum_frame_size,
 	.get_fmt = imx412_get_pad_format,
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 9baaa219a1ad..1707bc22ca91 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -876,14 +876,14 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 }
 
 /**
- * ov9282_init_pad_cfg() - Initialize sub-device pad configuration
+ * ov9282_init_cfg() - Initialize sub-device state
  * @sd: pointer to ov9282 V4L2 sub-device structure
  * @sd_state: V4L2 sub-device configuration
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int ov9282_init_pad_cfg(struct v4l2_subdev *sd,
-			       struct v4l2_subdev_state *sd_state)
+static int ov9282_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
 	struct v4l2_subdev_format fmt = { 0 };
@@ -1192,7 +1192,7 @@ static const struct v4l2_subdev_video_ops ov9282_video_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
-	.init_cfg = ov9282_init_pad_cfg,
+	.init_cfg = ov9282_init_cfg,
 	.enum_mbus_code = ov9282_enum_mbus_code,
 	.enum_frame_size = ov9282_enum_frame_size,
 	.get_fmt = ov9282_get_pad_format,
diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
index a2d7bc799849..30831b4b56d6 100644
--- a/drivers/media/i2c/tvp7002.c
+++ b/drivers/media/i2c/tvp7002.c
@@ -791,7 +791,7 @@ static const struct v4l2_ctrl_ops tvp7002_ctrl_ops = {
 /*
  * tvp7002_enum_mbus_code() - Enum supported digital video format on pad
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: V4L2 subdev state
  * @code: pointer to subdev enum mbus code struct
  *
  * Enumerate supported digital video formats for pad.
@@ -813,7 +813,7 @@ tvp7002_enum_mbus_code(struct v4l2_subdev *sd,
 /*
  * tvp7002_get_pad_format() - get video format on pad
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to subdev format struct
  *
  * get video format for pad.
@@ -837,7 +837,7 @@ tvp7002_get_pad_format(struct v4l2_subdev *sd,
 /*
  * tvp7002_set_pad_format() - set video format on pad
  * @sd: pointer to standard V4L2 sub-device structure
- * @cfg: pad configuration
+ * @sd_state: V4L2 subdev state
  * @fmt: pointer to subdev format struct
  *
  * set video format for pad.
-- 
Regards,

Laurent Pinchart

