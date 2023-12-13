Return-Path: <linux-media+bounces-2361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227F81156D
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 16:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174EA1C2115B
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 15:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A02DF2F85F;
	Wed, 13 Dec 2023 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SULKa2OL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFE8EB
	for <linux-media@vger.kernel.org>; Wed, 13 Dec 2023 07:00:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45CAC158A;
	Wed, 13 Dec 2023 15:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702479562;
	bh=2V11YmuJsX0f+5YeJkxL46aWwsd2SVuKxHU3nDm8bnk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SULKa2OLFGj0Jf1RdX1Lm4e84IH8vgN8IRv5b+n/qo+2DAc1lS/HXDdfdVYW7geV/
	 cAVvHEEZ6NCu+Yi5A++LW++bHGdmUey2ynHIJIPgg/9DfAEpMUaA0BZUgvkExf+1t6
	 agn1K26Z/25hBaegeK09Rv92rnS4OrVdiDvMvs/I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: [PATCH v6 3/8] media: v4l2-subdev: Add which field to struct v4l2_subdev_frame_interval
Date: Wed, 13 Dec 2023 17:00:05 +0200
Message-ID: <20231213150010.25593-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
References: <20231213150010.25593-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to a historical mishap, the v4l2_subdev_frame_interval structure
is the only part of the V4L2 subdev userspace API that doesn't contain a
'which' field. This prevents trying frame intervals using the subdev
'TRY' state mechanism.

Adding a 'which' field is simple as the structure has 8 reserved fields.
This would however break userspace as the field is currently set to 0,
corresponding to V4L2_SUBDEV_FORMAT_TRY, while the corresponding ioctls
currently operate on the 'ACTIVE' state. We thus need to add a new
subdev client cap, V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH, to
indicate that userspace is aware of this new field.

All drivers that implement the subdev .get_frame_interval() and
.set_frame_interval() operations are updated to return -EINVAL when
operating on the TRY state, preserving the current behaviour.

While at it, fix a bad copy&paste in the documentation of the struct
v4l2_subdev_frame_interval_enum 'which' field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # for tegra-video
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
Changes since v5:

- Address the alvium-csi2 driver

Changes since v4:

- Rename V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL in commit message too
- Add FIXME comment in drivers

Changes since v3:

- Rename V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL to
  V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH
- Use ULL for bit constant
- Address thp7312 driver
---
 .../media/v4l/vidioc-subdev-g-client-cap.rst  |  5 ++++
 .../v4l/vidioc-subdev-g-frame-interval.rst    | 17 ++++++++-----
 drivers/media/i2c/adv7180.c                   |  7 ++++++
 drivers/media/i2c/alvium-csi2.c               | 14 +++++++++++
 drivers/media/i2c/et8ek8/et8ek8_driver.c      | 14 +++++++++++
 drivers/media/i2c/imx214.c                    |  7 ++++++
 drivers/media/i2c/imx274.c                    | 14 +++++++++++
 drivers/media/i2c/max9286.c                   | 14 +++++++++++
 drivers/media/i2c/mt9m111.c                   | 14 +++++++++++
 drivers/media/i2c/mt9m114.c                   | 14 +++++++++++
 drivers/media/i2c/mt9v011.c                   | 14 +++++++++++
 drivers/media/i2c/mt9v111.c                   | 14 +++++++++++
 drivers/media/i2c/ov2680.c                    |  7 ++++++
 drivers/media/i2c/ov5640.c                    | 14 +++++++++++
 drivers/media/i2c/ov5648.c                    |  7 ++++++
 drivers/media/i2c/ov5693.c                    |  7 ++++++
 drivers/media/i2c/ov6650.c                    | 14 +++++++++++
 drivers/media/i2c/ov7251.c                    | 14 +++++++++++
 drivers/media/i2c/ov7670.c                    | 12 +++++++++
 drivers/media/i2c/ov772x.c                    | 14 +++++++++++
 drivers/media/i2c/ov8865.c                    |  7 ++++++
 drivers/media/i2c/ov9650.c                    | 14 +++++++++++
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      | 14 +++++++++++
 drivers/media/i2c/s5k5baf.c                   | 14 +++++++++++
 drivers/media/i2c/thp7312.c                   | 14 +++++++++++
 drivers/media/i2c/tvp514x.c                   | 12 +++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         | 25 ++++++++++++-------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  7 ++++++
 .../media/atomisp/i2c/atomisp-gc2235.c        |  7 ++++++
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  7 ++++++
 .../media/atomisp/i2c/atomisp-ov2722.c        |  7 ++++++
 drivers/staging/media/imx/imx-ic-prp.c        | 14 +++++++++++
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 14 +++++++++++
 drivers/staging/media/imx/imx-media-csi.c     | 14 +++++++++++
 drivers/staging/media/imx/imx-media-vdic.c    | 14 +++++++++++
 drivers/staging/media/tegra-video/csi.c       |  7 ++++++
 include/uapi/linux/v4l2-subdev.h              | 15 ++++++++---
 37 files changed, 425 insertions(+), 18 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
index 20f12a1cc0f7..810b6a859dc8 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-client-cap.rst
@@ -71,6 +71,11 @@ is unknown to the kernel.
         of 'stream' fields (referring to the stream number) with various
         ioctls. If this is not set (which is the default), the 'stream' fields
         will be forced to 0 by the kernel.
+    * - ``V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH``
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
index 7ed86030fb5c..409b9a37f018 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -469,6 +469,13 @@ static int adv7180_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct adv7180_state *state = to_state(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (state->curr_norm & V4L2_STD_525_60) {
 		fi->interval.numerator = 1001;
 		fi->interval.denominator = 30000;
diff --git a/drivers/media/i2c/alvium-csi2.c b/drivers/media/i2c/alvium-csi2.c
index a173abb0509f..34ff7fad3877 100644
--- a/drivers/media/i2c/alvium-csi2.c
+++ b/drivers/media/i2c/alvium-csi2.c
@@ -1654,6 +1654,13 @@ static int alvium_g_frame_interval(struct v4l2_subdev *sd,
 {
 	struct alvium_dev *alvium = sd_to_alvium(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval = alvium->frame_interval;
 
 	return 0;
@@ -1703,6 +1710,13 @@ static int alvium_s_frame_interval(struct v4l2_subdev *sd,
 	struct alvium_dev *alvium = sd_to_alvium(sd);
 	int ret;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (alvium->streaming)
 		return -EBUSY;
 
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 71fb5aebd3df..f548b1bb75fb 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1051,6 +1051,13 @@ static int et8ek8_get_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	memset(fi, 0, sizeof(*fi));
 	fi->interval = sensor->current_reglist->mode.timeperframe;
 
@@ -1064,6 +1071,13 @@ static int et8ek8_set_frame_interval(struct v4l2_subdev *subdev,
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 	struct et8ek8_reglist *reglist;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	reglist = et8ek8_reglist_find_mode_ival(&meta_reglist,
 						sensor->current_reglist,
 						&fi->interval);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 8e832a4e3544..b148b1bd2bc3 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -905,6 +905,13 @@ static int imx214_get_frame_interval(struct v4l2_subdev *subdev,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *fival)
 {
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fival->interval.numerator = 1;
 	fival->interval.denominator = IMX214_FPS;
 
diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 4040c642a36f..352da68b8b41 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1333,6 +1333,13 @@ static int imx274_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct stimx274 *imx274 = to_imx274(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval = imx274->frame_interval;
 	dev_dbg(&imx274->client->dev, "%s frame rate = %d / %d\n",
 		__func__, imx274->frame_interval.numerator,
@@ -1350,6 +1357,13 @@ static int imx274_set_frame_interval(struct v4l2_subdev *sd,
 	int min, max, def;
 	int ret;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	ret = pm_runtime_resume_and_get(&imx274->client->dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7e8cb53d31c3..d685d445cf23 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -874,6 +874,13 @@ static int max9286_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (interval->pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
@@ -888,6 +895,13 @@ static int max9286_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct max9286_priv *priv = sd_to_max9286(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (interval->pad != MAX9286_SRC_PAD)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 602954650f2e..ceeeb94c38d5 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1051,6 +1051,13 @@ static int mt9m111_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct mt9m111 *mt9m111 = container_of(sd, struct mt9m111, subdev);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval = mt9m111->frame_interval;
 
 	return 0;
@@ -1068,6 +1075,13 @@ static int mt9m111_set_frame_interval(struct v4l2_subdev *sd,
 	if (mt9m111->is_streaming)
 		return -EBUSY;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index dcd94299787c..427eae13ce26 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1592,6 +1592,13 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *ival = &interval->interval;
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	ival->numerator = 1;
@@ -1610,6 +1617,13 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	if (ival->numerator != 0 && ival->denominator != 0)
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 3485761428ba..8834ff8786e5 100644
--- a/drivers/media/i2c/mt9v011.c
+++ b/drivers/media/i2c/mt9v011.c
@@ -366,6 +366,13 @@ static int mt9v011_get_frame_interval(struct v4l2_subdev *sd,
 				      struct v4l2_subdev_state *sd_state,
 				      struct v4l2_subdev_frame_interval *ival)
 {
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	calc_fps(sd,
 		 &ival->interval.numerator,
 		 &ival->interval.denominator);
@@ -380,6 +387,13 @@ static int mt9v011_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	u16 speed;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	speed = calc_speed(sd, tpf->numerator, tpf->denominator);
 
 	mt9v011_write(sd, R0A_MT9V011_CLK_SPEED, speed);
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index 496be67c971b..b0b98ed3c150 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -730,6 +730,13 @@ static int mt9v111_set_frame_interval(struct v4l2_subdev *sd,
 			   tpf->denominator;
 	unsigned int max_fps;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (!tpf->numerator)
 		tpf->numerator = 1;
 
@@ -779,6 +786,13 @@ static int mt9v111_get_frame_interval(struct v4l2_subdev *sd,
 	struct mt9v111_dev *mt9v111 = sd_to_mt9v111(sd);
 	struct v4l2_fract *tpf = &ival->interval;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&mt9v111->stream_mutex);
 
 	tpf->numerator = 1;
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index e3ff64a9e6ca..39d321e2b7f9 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -558,6 +558,13 @@ static int ov2680_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov2680_dev *sensor = to_ov2680_dev(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->mode.frame_interval;
 	mutex_unlock(&sensor->lock);
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 336bfd1ffd32..5162d45fe73b 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3610,6 +3610,13 @@ static int ov5640_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3625,6 +3632,13 @@ static int ov5640_set_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index d0d7e9968f48..4b86d2631bd1 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2276,6 +2276,13 @@ static int ov5648_get_frame_interval(struct v4l2_subdev *subdev,
 	const struct ov5648_mode *mode;
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->mutex);
 
 	mode = sensor->state.mode;
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index a65645811fbc..8deb28b55983 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1013,6 +1013,13 @@ static int ov5693_get_frame_interval(struct v4l2_subdev *sd,
 				 ov5693->ctrls.vblank->val);
 	unsigned int fps = DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = fps;
 
diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index a4dc45bdf3d7..b65befb22a79 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -806,6 +806,13 @@ static int ov6650_get_frame_interval(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	ival->interval = priv->tpf;
 
 	dev_dbg(&client->dev, "Frame interval: %u/%u s\n",
@@ -823,6 +830,13 @@ static int ov6650_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	int div, ret;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (tpf->numerator == 0 || tpf->denominator == 0)
 		div = 1;  /* Reset to full rate */
 	else
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 10d6b5deed83..30f61e04ecaf 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1391,6 +1391,13 @@ static int ov7251_get_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov7251->lock);
 	fi->interval = ov7251->current_mode->timeperframe;
 	mutex_unlock(&ov7251->lock);
@@ -1406,6 +1413,13 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 	const struct ov7251_mode_info *new_mode;
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov7251->lock);
 	new_mode = ov7251_find_mode_by_ival(ov7251, &fi->interval);
 
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 463f20ece36e..0cb96b6c9990 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1160,6 +1160,12 @@ static int ov7670_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov7670_info *info = to_state(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	info->devtype->get_framerate(sd, &ival->interval);
 
@@ -1173,6 +1179,12 @@ static int ov7670_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	struct ov7670_info *info = to_state(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	return info->devtype->set_framerate(sd, tpf);
 }
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index a14a25946c5b..3e36a55274ef 100644
--- a/drivers/media/i2c/ov772x.c
+++ b/drivers/media/i2c/ov772x.c
@@ -724,6 +724,13 @@ static int ov772x_get_frame_interval(struct v4l2_subdev *sd,
 	struct ov772x_priv *priv = to_ov772x(sd);
 	struct v4l2_fract *tpf = &ival->interval;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	tpf->numerator = 1;
 	tpf->denominator = priv->fps;
 
@@ -739,6 +746,13 @@ static int ov772x_set_frame_interval(struct v4l2_subdev *sd,
 	unsigned int fps;
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	if (priv->streaming) {
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 02a595281c49..95ffe7536aa6 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2846,6 +2846,13 @@ static int ov8865_get_frame_interval(struct v4l2_subdev *subdev,
 	unsigned int framesize;
 	unsigned int fps;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->mutex);
 
 	mode = sensor->state.mode;
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index f528892c893f..66cd0e9ddc9a 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1107,6 +1107,13 @@ static int ov965x_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov965x *ov965x = to_ov965x(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&ov965x->lock);
 	fi->interval = ov965x->fiv->interval;
 	mutex_unlock(&ov965x->lock);
@@ -1156,6 +1163,13 @@ static int ov965x_set_frame_interval(struct v4l2_subdev *sd,
 	struct ov965x *ov965x = to_ov965x(sd);
 	int ret;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	v4l2_dbg(1, debug, sd, "Setting %d/%d frame interval\n",
 		 fi->interval.numerator, fi->interval.denominator);
 
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index 73ca50f49812..af8d01f78c32 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -872,6 +872,13 @@ static int s5c73m3_oif_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
@@ -923,6 +930,13 @@ static int s5c73m3_oif_set_frame_interval(struct v4l2_subdev *sd,
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 	int ret;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 2fd1ecfeb086..de079d2c9282 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1124,6 +1124,13 @@ static int s5k5baf_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&state->lock);
 	fi->interval.numerator = state->fiv;
 	fi->interval.denominator = 10000;
@@ -1162,6 +1169,13 @@ static int s5k5baf_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5k5baf *state = to_s5k5baf(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&state->lock);
 	__s5k5baf_set_frame_interval(state, fi);
 	mutex_unlock(&state->lock);
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index d4975b180704..ad4f2b794e1a 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -740,6 +740,13 @@ static int thp7312_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval.numerator = 1;
 	fi->interval.denominator = thp7312->current_rate->fps;
 
@@ -757,6 +764,13 @@ static int thp7312_set_frame_interval(struct v4l2_subdev *sd,
 	unsigned int best_delta = UINT_MAX;
 	unsigned int fps;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	/* Avoid divisions by 0, pick the highest frame if the interval is 0. */
 	fps = fi->interval.numerator
 	    ? DIV_ROUND_CLOSEST(fi->interval.denominator, fi->interval.numerator)
diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
index dee0cf992379..5a561e5bf659 100644
--- a/drivers/media/i2c/tvp514x.c
+++ b/drivers/media/i2c/tvp514x.c
@@ -746,6 +746,12 @@ tvp514x_get_frame_interval(struct v4l2_subdev *sd,
 	struct tvp514x_decoder *decoder = to_decoder(sd);
 	enum tvp514x_std current_std;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	/* get the current standard */
 	current_std = decoder->current_std;
@@ -765,6 +771,12 @@ tvp514x_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *timeperframe;
 	enum tvp514x_std current_std;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	timeperframe = &ival->interval;
 
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 405a4a2fa565..30131a37f2d5 100644
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
@@ -537,9 +536,16 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 		which = ((struct v4l2_subdev_selection *)arg)->which;
 		break;
 	case VIDIOC_SUBDEV_G_FRAME_INTERVAL:
-	case VIDIOC_SUBDEV_S_FRAME_INTERVAL:
-		which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
+		struct v4l2_subdev_frame_interval *fi = arg;
+
+		if (!(subdev_fh->client_caps &
+		      V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
+			fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+
+		which = fi->which;
 		break;
+	}
 	case VIDIOC_SUBDEV_G_ROUTING:
 	case VIDIOC_SUBDEV_S_ROUTING:
 		which = ((struct v4l2_subdev_routing *)arg)->which;
@@ -796,12 +802,12 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 	case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
 		struct v4l2_subdev_frame_interval *fi = arg;
 
-		if (ro_subdev)
-			return -EPERM;
-
 		if (!client_supports_streams)
 			fi->stream = 0;
 
+		if (fi->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
+			return -EPERM;
+
 		memset(fi->reserved, 0, sizeof(fi->reserved));
 		return v4l2_subdev_call(sd, pad, set_frame_interval, state, fi);
 	}
@@ -998,7 +1004,8 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
 			client_cap->capabilities &= ~V4L2_SUBDEV_CLIENT_CAP_STREAMS;
 
 		/* Filter out unsupported capabilities */
-		client_cap->capabilities &= V4L2_SUBDEV_CLIENT_CAP_STREAMS;
+		client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
+					     V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
 
 		subdev_fh->client_caps = client_cap->capabilities;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 006e8adac47b..5bcd634a2a44 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -500,6 +500,13 @@ static int gc0310_get_frame_interval(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_state *sd_state,
 				     struct v4l2_subdev_frame_interval *interval)
 {
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = GC0310_FPS;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index aa257322a700..bec4c5615864 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -704,6 +704,13 @@ static int gc2235_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct gc2235_device *dev = to_gc2235_sensor(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = dev->res->fps;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index 459c5b8233ce..20f02d18a8de 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1394,6 +1394,13 @@ static int mt9m114_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct mt9m114_device *dev = to_mt9m114_sensor(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = mt9m114_res[dev->res].fps;
 
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index b3ef04d7ccca..133e346ae51b 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -851,6 +851,13 @@ static int ov2722_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	interval->interval.numerator = 1;
 	interval->interval.denominator = dev->res->fps;
 
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index fb96f87e664e..2b80d54006b3 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -399,6 +399,13 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
@@ -415,6 +422,13 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 7bfe433cd322..17fd980c9d3c 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1209,6 +1209,13 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
@@ -1225,6 +1232,13 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 4308fdc9b58e..785aac881922 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -908,6 +908,13 @@ static int csi_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= CSI_NUM_PADS)
 		return -EINVAL;
 
@@ -928,6 +935,13 @@ static int csi_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *input_fi;
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	input_fi = &priv->frame_interval[CSI_SINK_PAD];
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index a51b37679239..09da4103a8db 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -786,6 +786,13 @@ static int vdic_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct vdic_priv *priv = v4l2_get_subdevdata(sd);
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= VDIC_NUM_PADS)
 		return -EINVAL;
 
@@ -806,6 +813,13 @@ static int vdic_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *input_fi, *output_fi;
 	int ret = 0;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&priv->lock);
 
 	input_fi = &priv->frame_interval[priv->active_input_pad];
diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index b1b666179be5..255cccd0c5fd 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -231,6 +231,13 @@ static int tegra_csi_get_frame_interval(struct v4l2_subdev *subdev,
 	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return -ENOIOCTLCMD;
 
+	/*
+	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
+	 * subdev active state API.
+	 */
+	if (vfi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	vfi->interval.numerator = 1;
 	vfi->interval.denominator = csi_chan->framerate;
 
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index f0fbb4a7c150..7048c51581c6 100644
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
@@ -239,7 +241,14 @@ struct v4l2_subdev_routing {
  * set (which is the default), the 'stream' fields will be forced to 0 by the
  * kernel.
  */
-#define V4L2_SUBDEV_CLIENT_CAP_STREAMS		(1ULL << 0)
+#define V4L2_SUBDEV_CLIENT_CAP_STREAMS			(1ULL << 0)
+
+/*
+ * The client is aware of the struct v4l2_subdev_frame_interval which field. If
+ * this is not set (which is the default), the which field is forced to
+ * V4L2_SUBDEV_FORMAT_ACTIVE by the kernel.
+ */
+#define V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH	(1ULL << 1)
 
 /**
  * struct v4l2_subdev_client_capability - Capabilities of the client accessing
-- 
Regards,

Laurent Pinchart


