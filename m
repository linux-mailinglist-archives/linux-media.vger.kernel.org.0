Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E2E7D4450
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 02:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjJXAvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 20:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbjJXAvc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 20:51:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B5A0C0
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 17:51:27 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ACF82922;
        Tue, 24 Oct 2023 02:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698108674;
        bh=y7vacwG4Kfaar6AZqcRURFnA4en2ZsmeAPZSvT44KP0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mkuCpUJvLwHlNmXmwmrQURv+pfFnj1I6jF7i4y3IPtTJ4VjefDrSAVajQadz8/fd7
         sSXV++9HRkRAUIeixBiuekLzHfyKHwq8TwIJS9IiUoSTujIbORmW1ZJ2aBrHUq7g4n
         B0ysTSYih/Ttlmk5Sq/SjdhlWb2YmBxPE8dluCEk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Hans de Goede <hansg@kernel.org>
Subject: [RFC PATCH v1 2/4] media: v4l2-subdev: Add which field to struct v4l2_subdev_frame_interval
Date:   Tue, 24 Oct 2023 03:51:28 +0300
Message-ID: <20231024005130.28026-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
References: <20231024005130.28026-1-laurent.pinchart@ideasonboard.com>
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

Due to a historical mishap, the v4l2_subdev_frame_interval structure
is the only part of the V4L2 subdev userspace API that doesn't contain a
'which' field. This prevents trying frame intervals using the subdev
'TRY' state mechanism.

Add a 'which' field is simple as the structure has 8 reserved fields.
This would however break userspace as the field is currently set to 0,
corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
currently operate on the 'ACTIVE' state. We thus need to add a new
subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
that userspace is aware of this new field.

All drivers that implement the subdev .g_frame_interval() and
.s_frame_interval() operations are updated to return -EINVAL when
operating on the TRY state, preserving the current behaviour.

While at it, fix a bad copy&paste in the documentation of the struct
v4l2_subdev_frame_interval_enum 'which' field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/vidioc-subdev-g-client-cap.rst  |  5 +++++
 .../v4l/vidioc-subdev-g-frame-interval.rst    | 17 +++++++++------
 drivers/media/i2c/adv7180.c                   |  3 +++
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 ++++++
 drivers/media/i2c/imx214.c                    |  3 +++
 drivers/media/i2c/imx274.c                    |  6 ++++++
 drivers/media/i2c/max9286.c                   |  6 ++++++
 drivers/media/i2c/mt9m111.c                   |  6 ++++++
 drivers/media/i2c/mt9m114.c                   |  6 ++++++
 drivers/media/i2c/mt9v011.c                   |  6 ++++++
 drivers/media/i2c/mt9v111.c                   |  6 ++++++
 drivers/media/i2c/ov2680.c                    |  3 +++
 drivers/media/i2c/ov5640.c                    |  6 ++++++
 drivers/media/i2c/ov5648.c                    |  3 +++
 drivers/media/i2c/ov5693.c                    |  3 +++
 drivers/media/i2c/ov6650.c                    |  6 ++++++
 drivers/media/i2c/ov7251.c                    |  6 ++++++
 drivers/media/i2c/ov7670.c                    |  4 ++++
 drivers/media/i2c/ov772x.c                    |  6 ++++++
 drivers/media/i2c/ov8865.c                    |  3 +++
 drivers/media/i2c/ov9650.c                    |  6 ++++++
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  6 ++++++
 drivers/media/i2c/s5k5baf.c                   |  6 ++++++
 drivers/media/i2c/tvp514x.c                   |  4 ++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 21 ++++++++++++-------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  3 +++
 .../media/atomisp/i2c/atomisp-gc2235.c        |  3 +++
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  3 +++
 .../media/atomisp/i2c/atomisp-ov2722.c        |  3 +++
 drivers/staging/media/imx/imx-ic-prp.c        |  6 ++++++
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  6 ++++++
 drivers/staging/media/imx/imx-media-csi.c     |  6 ++++++
 drivers/staging/media/imx/imx-media-vdic.c    |  6 ++++++
 drivers/staging/media/tegra-video/csi.c       |  3 +++
 include/uapi/linux/v4l2-subdev.h              | 13 ++++++++++--
 35 files changed, 190 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
index 20f12a1cc0f7..f168140ebd59 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
@@ -71,6 +71,11 @@ is unknown to the kernel.
         of 'stream' fields (referring to the stream number) with various
         ioctls. If this is not set (which is the default), the 'stream' fields
         will be forced to 0 by the kernel.
+    * - ``V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL``
+      - The client is aware of the :c:type:`v4l2_subdev_frame_interval`
+        ``which`` field. If this is not set (which is the default), the
+        ``which`` field is forced to ``V4L2_SUBDEV_FORMAT_ACTIVE`` by the
+        kernel.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
index 842f962d2aea..41e0e2c8ecc3 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-frame-interval.rst
@@ -58,8 +58,9 @@ struct
 contains the current frame interval as would be returned by a
 ``VIDIOC_SUBDEV_G_FRAME_INTERVAL`` call.
 
-Calling ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` on a subdev device node that has been
-registered in read-only mode is not allowed. An error is returned and the errno
+If the subdev device node has been registered in read-only mode, calls to
+``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` are only valid if the ``which`` field is set
+to ``V4L2_SUBDEV_FORMAT_TRY``, otherwise an error is returned and the errno
 variable is set to ``-EPERM``.
 
 Drivers must not return an error solely because the requested interval
@@ -93,7 +94,11 @@ the same sub-device is not defined.
       - ``stream``
       - Stream identifier.
     * - __u32
-      - ``reserved``\ [8]
+      - ``which``
+      - Active or try frame interval, from enum
+	:ref:`v4l2_subdev_format_whence <v4l2-subdev-format-whence>`.
+    * - __u32
+      - ``reserved``\ [7]
       - Reserved for future extensions. Applications and drivers must set
 	the array to zero.
 
@@ -114,9 +119,9 @@ EBUSY
 EINVAL
     The struct
     :c:type:`v4l2_subdev_frame_interval`
-    ``pad`` references a non-existing pad, or the pad doesn't support
-    frame intervals.
+    ``pad`` references a non-existing pad, the ``which`` field references a
+    non-existing frame interval, or the pad doesn't support frame intervals.
 
 EPERM
     The ``VIDIOC_SUBDEV_S_FRAME_INTERVAL`` ioctl has been called on a read-only
-    subdevice.
+    subdevice and the ``which`` field is set to ``V4L2_SUBDEV_FORMAT_ACTIVE``.
diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 1bd8d9bbb82c..8bb8838eb566 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -469,6 +469,9 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct adv7180_state *state = to_state(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (state->curr_norm & V4L2_STD_525_60) {
 		fi->interval.numerator = 1001;
 		fi->interval.denominator = 30000;
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 949859aff1ec..240863b75491 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1052,6 +1052,9 @@ static int et8ek8_get_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	memset(fi, 0, sizeof(*fi));
 	fi->interval = sensor->current_reglist->mode.timeperframe;
 
@@ -1065,6 +1068,9 @@ static int et8ek8_set_frame_interval(struct v4l2_subdev *subdev,
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 	struct et8ek8_reglist *reglist;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	reglist = et8ek8_reglist_find_mode_ival(&meta_reglist,
 						sensor->current_reglist,
 						&fi->interval);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index c84de2700c0c..fbf3fcf5d61d 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -799,6 +799,9 @@ static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fival)
 {
+	if (fival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fival->interval.numerator = 1;
 	fival->interval.denominator = IMX214_FPS;
 
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 444a5a6d22cd..5ffddabc22a9 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1333,6 +1333,9 @@ static int imx274_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct stimx274 *imx274 = to_imx274(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval = imx274->frame_interval;
 	dev_dbg(&imx274->client->dev, "%s frame rate = %d / %d\n",
 		__func__, imx274->frame_interval.numerator,
@@ -1350,6 +1353,9 @@ static int imx274_set_frame_interval(struct v4l2_subdev *sd,
 	int min, max, def;
 	int ret;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	ret = pm_runtime_resume_and_get(&imx274->client->dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index ccf615a12b4f..a16c19bef879 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -874,6 +874,9 @@ static int max9286_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (interval->pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
@@ -888,6 +891,9 @@ static int max9286_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (interval->pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index c96ad4f58a88..d853aa631327 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1051,6 +1051,9 @@ static int mt9m111_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval = mt9m111->frame_interval;
 
 	return 0;
@@ -1068,6 +1071,9 @@ static int mt9m111_set_frame_interval(struct v4l2_subdev *sd,
 	if (mt9m111->is_streaming)
 		return -EBUSY;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c48e6e0e9292..19551c400dbd 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1588,6 +1588,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *ival = &interval->interval;
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	ival->numerator = 1;
@@ -1606,6 +1609,9 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	int ret = 0;
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	if (ival->numerator != 0 && ival->denominator != 0)
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 10229bcb034b..7a1bb836b092 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -366,6 +366,9 @@ static int mt9v011_get_frame_interval(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval *ival)
 {
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	calc_fps(sd,
 		 &ival->interval.numerator,
 		 &ival->interval.denominator);
@@ -380,6 +383,9 @@ static int mt9v011_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	u16 speed;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	speed = calc_speed(sd, tpf->numerator, tpf->denominator);
 
 	mt9v011_write(sd, R0A_MT9V011_CLK_SPEED, speed);
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 9dde019fc883..40c4f712f6df 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -730,6 +730,9 @@ static int mt9v111_set_frame_interval(struct v4l2_subdev *sd,
 			   tpf->denominator;
 	unsigned int max_fps;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (!tpf->numerator)
 		tpf->numerator = 1;
 
@@ -779,6 +782,9 @@ static int mt9v111_get_frame_interval(struct v4l2_subdev *sd,
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(sd);
 	struct v4l2_fract *tpf = &ival->interval;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&mt9v111->stream_mutex);
 
 	tpf->numerator = 1;
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e1024e23c9cb..c1a3f4f0f3da 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -558,6 +558,9 @@ static int ov2680_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->mode.frame_interval;
 	mutex_unlock(&sensor->lock);
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 6e7c19a2af82..84873c02b9a5 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3611,6 +3611,9 @@ static int ov5640_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3626,6 +3629,9 @@ static int ov5640_set_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 3c81953591d8..c1ce88540a42 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2276,6 +2276,9 @@ static int ov5648_get_frame_interval(struct v4l2_subdev *subdev,
 	const struct ov5648_mode *mode;
 	int ret = 0;
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->mutex);
 
 	mode = sensor->state.mode;
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index bff2f3fb9558..d8ff7c99fc72 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1013,6 +1013,9 @@ static int ov5693_get_frame_interval(struct v4l2_subdev *sd,
 				 ov5693->ctrls.vblank->val);
 	unsigned int fps = DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = fps;
 
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index abf9e0467659..edacfd359ec9 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -806,6 +806,9 @@ static int ov6650_get_frame_interval(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	ival->interval = priv->tpf;
 
 	dev_dbg(&client->dev, "Frame interval: %u/%u s\n",
@@ -823,6 +826,9 @@ static int ov6650_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	int div, ret;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (tpf->numerator == 0 || tpf->denominator == 0)
 		div = 1;  /* Reset to full rate */
 	else
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index d96cc26b918d..b4833f273250 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1391,6 +1391,9 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
 	mutex_unlock(&ov7251->lock);
@@ -1406,6 +1409,9 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	const struct ov7251_mode_info *new_mode;
 	int ret = 0;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 71175f918373..1056bccadb65 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1161,6 +1161,8 @@ static int ov7670_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov7670_info *info = to_state(sd);
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	info->devtype->get_framerate(sd, &ival->interval);
 
@@ -1174,6 +1176,8 @@ static int ov7670_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	struct ov7670_info *info = to_state(sd);
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	return info->devtype->set_framerate(sd, tpf);
 }
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index 59d3b8d006e4..4e226925020b 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -724,6 +724,9 @@ static int ov772x_get_frame_interval(struct v4l2_subdev *sd,
 	struct ov772x_priv *priv = to_ov772x(sd);
 	struct v4l2_fract *tpf = &ival->interval;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	tpf->numerator = 1;
 	tpf->denominator = priv->fps;
 
@@ -739,6 +742,9 @@ static int ov772x_set_frame_interval(struct v4l2_subdev *sd,
 	unsigned int fps;
 	int ret = 0;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	if (priv->streaming) {
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 0a9efa340771..d4d72536f722 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2846,6 +2846,9 @@ static int ov8865_get_frame_interval(struct v4l2_subdev *subdev,
 	unsigned int framesize;
 	unsigned int fps;
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->mutex);
 
 	mode = sensor->state.mode;
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index 6b2de4220cf4..5cf6bb2bee9c 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1107,6 +1107,9 @@ static int ov965x_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov965x *ov965x = to_ov965x(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov965x->lock);
 	fi->interval = ov965x->fiv->interval;
 	mutex_unlock(&ov965x->lock);
@@ -1156,6 +1159,9 @@ static int ov965x_set_frame_interval(struct v4l2_subdev *sd,
 	struct ov965x *ov965x = to_ov965x(sd);
 	int ret;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	v4l2_dbg(1, debug, sd, "Setting %d/%d frame interval\n",
 		 fi->interval.numerator, fi->interval.denominator);
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 236f63ac803d..c402bfea14ce 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -875,6 +875,9 @@ static int s5c73m3_oif_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
@@ -926,6 +929,9 @@ static int s5c73m3_oif_set_frame_interval(struct v4l2_subdev *sd,
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 	int ret;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 987d138fe022..5fc64cc04441 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1124,6 +1124,9 @@ static int s5k5baf_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&state->lock);
 	fi->interval.numerator = state->fiv;
 	fi->interval.denominator = 10000;
@@ -1162,6 +1165,9 @@ static int s5k5baf_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&state->lock);
 	__s5k5baf_set_frame_interval(state, fi);
 	mutex_unlock(&state->lock);
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index dee0cf992379..ae073a532eda 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -746,6 +746,8 @@ tvp514x_get_frame_interval(struct v4l2_subdev *sd,
 	struct tvp514x_decoder *decoder = to_decoder(sd);
 	enum tvp514x_std current_std;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	/* get the current standard */
 	current_std = decoder->current_std;
@@ -765,6 +767,8 @@ tvp514x_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *timeperframe;
 	enum tvp514x_std current_std;
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	timeperframe = &ival->interval;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 4104445c546e..c45d60a87701 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -291,9 +291,8 @@ static inline int check_frame_interval(struct v4l2_subdev *sd,
 	if (!fi)
 		return -EINVAL;
 
-	return check_pad(sd, fi->pad) ? :
-	       check_state(sd, state, V4L2_SUBDEV_FORMAT_ACTIVE, fi->pad,
-			   fi->stream);
+	return check_which(fi->which) ? : check_pad(sd, fi->pad) ? :
+	       check_state(sd, state, fi->which, fi->pad, fi->stream);
 }
 
 static int call_get_frame_interval(struct v4l2_subdev *sd,
@@ -538,7 +537,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 		break;
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL:
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL:
-		which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		which = ((struct v4l2_subdev_frame_interval *)arg)->which;
 		break;
 	case VIDIOC_SUBDEV_G_ROUTING:
 	case VIDIOC_SUBDEV_S_ROUTING:
@@ -789,6 +788,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 		if (!client_supports_streams)
 			fi->stream = 0;
 
+		if (!(subdev_fh->client_caps &
+		      V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL))
+			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, pad, get_frame_interval, state, fi);
 	}
@@ -796,12 +799,16 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (ro_subdev)
-			return -EPERM;
-
 		if (!client_supports_streams)
 			fi->stream = 0;
 
+		if (!(subdev_fh->client_caps &
+		      V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL))
+			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+		if (fi->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
+			return -EPERM;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, pad, set_frame_interval, state, fi);
 	}
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index a6f66b483e02..2bff44846f39 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -500,6 +500,9 @@ static int gc0310_get_frame_interval(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *interval)
 {
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = GC0310_FPS;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index 074f69e2b5e0..360341cecd62 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -704,6 +704,9 @@ static int gc2235_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = dev->res->fps;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 9f6404967e64..13b7797a7630 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1394,6 +1394,9 @@ static int mt9m114_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = mt9m114_res[dev->res].fps;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 5128c8ea6aed..6cc30e590a61 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -851,6 +851,9 @@ static int ov2722_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = dev->res->fps;
 
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 6088a1aaa695..df04afc1b58b 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -401,6 +401,9 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
@@ -417,6 +420,9 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 50e748cd10df..2a6f8c207a9c 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1211,6 +1211,9 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
@@ -1227,6 +1230,9 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 96e351c9bf03..6c457b4b3167 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -908,6 +908,9 @@ static int csi_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= CSI_NUM_PADS)
 		return -EINVAL;
 
@@ -928,6 +931,9 @@ static int csi_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *input_fi;
 	int ret = 0;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	input_fi = &priv->frame_interval[CSI_SINK_PAD];
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 3c5224a6b910..6e6b9a4dbff2 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -786,6 +786,9 @@ static int vdic_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= VDIC_NUM_PADS)
 		return -EINVAL;
 
@@ -806,6 +809,9 @@ static int vdic_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *input_fi, *output_fi;
 	int ret = 0;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	input_fi = &priv->frame_interval[priv->active_input_pad];
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7594ec6465f0..b1d18bb7d022 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -231,6 +231,9 @@ static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return -ENOIOCTLCMD;
 
+	if (vfi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	vfi->interval.numerator = 1;
 	vfi->interval.denominator = csi_chan->framerate;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 0401385fd8e9..c0ef7aeed721 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -116,13 +116,15 @@ struct v4l2_subdev_frame_size_enum {
  * @pad: pad number, as reported by the media API
  * @interval: frame interval in seconds
  * @stream: stream number, defined in subdev routing
+ * @which: interval type (from enum v4l2_subdev_format_whence)
  * @reserved: drivers and applications must zero this array
  */
 struct v4l2_subdev_frame_interval {
 	__u32 pad;
 	struct v4l2_fract interval;
 	__u32 stream;
-	__u32 reserved[8];
+	__u32 which;
+	__u32 reserved[7];
 };
 
 /**
@@ -133,7 +135,7 @@ struct v4l2_subdev_frame_interval {
  * @width: frame width in pixels
  * @height: frame height in pixels
  * @interval: frame interval in seconds
- * @which: format type (from enum v4l2_subdev_format_whence)
+ * @which: interval type (from enum v4l2_subdev_format_whence)
  * @stream: stream number, defined in subdev routing
  * @reserved: drivers and applications must zero this array
  */
@@ -241,6 +243,13 @@ struct v4l2_subdev_routing {
  */
 #define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1U << 0)
 
+/*
+ * The client is aware of the struct v4l2_subdev_frame_interval which field. If
+ * this is not set (which is the default), the which field is forced to
+ * V4L2_SUBDEV_FORMAT_ACTIVE by the kernel.
+ */
+#define V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL	(1U << 1)
+
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
  *					  the subdev
-- 
Regards,

Laurent Pinchart

