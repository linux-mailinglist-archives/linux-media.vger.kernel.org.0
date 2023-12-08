Return-Path: <linux-media+bounces-2011-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358980ABDB
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 19:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABB63B20C28
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 18:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AA247A78;
	Fri,  8 Dec 2023 18:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oElnFZYG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC87390;
	Fri,  8 Dec 2023 10:16:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62161EBA;
	Fri,  8 Dec 2023 19:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1702059362;
	bh=t04KEEKZb7Yx9VDryJ6tG8mjqFUVZCx4cl3792wpvYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oElnFZYG0rg7NQoY6P5/U3br82e1deheCSO74ibyzs26xUQcAAkMDrzKrFheDDakG
	 +mPy1BtAoFriBiUnV2j6xsGFjEp50Xm7ZWClmKXf8nmqMdIbdSNvhL1d8Wtrn2grv8
	 8oWE6ojS8NsY364yUQnlgO3rSrwRRnXx+yhzPdsU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Leon Luo <leonl@leopardimaging.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 3/8] media: v4l2-subdev: Add which field to struct v4l2_subdev_frame_interval
Date: Fri,  8 Dec 2023 20:16:43 +0200
Message-ID: <20231208181648.13568-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
References: <20231208181442.13356-1-laurent.pinchart@ideasonboard.com>
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
subdev client cap, V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL, to indicate
that userspace is aware of this new field.

All drivers that implement the subdev .get_frame_interval() and
.set_frame_interval() operations are updated to return -EINVAL when
operating on the TRY state, preserving the current behaviour.

While at it, fix a bad copy&paste in the documentation of the struct
v4l2_subdev_frame_interval_enum 'which' field.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de> # for imx-media
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
Changes since v3:

- Rename V4L2_SUBDEV_CLIENT_CAP_WHICH_INTERVAL to
  V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH
- Use ULL for bit constant
- Address thp7312 driver
---
 .../media/v4l/vidioc-subdev-g-client-cap.rst  |  5 ++++
 .../v4l/vidioc-subdev-g-frame-interval.rst    | 17 ++++++++-----
 drivers/media/i2c/adv7180.c                   |  3 +++
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |  6 +++++
 drivers/media/i2c/imx214.c                    |  3 +++
 drivers/media/i2c/imx274.c                    |  6 +++++
 drivers/media/i2c/max9286.c                   |  6 +++++
 drivers/media/i2c/mt9m111.c                   |  6 +++++
 drivers/media/i2c/mt9m114.c                   |  6 +++++
 drivers/media/i2c/mt9v011.c                   |  6 +++++
 drivers/media/i2c/mt9v111.c                   |  6 +++++
 drivers/media/i2c/ov2680.c                    |  3 +++
 drivers/media/i2c/ov5640.c                    |  6 +++++
 drivers/media/i2c/ov5648.c                    |  3 +++
 drivers/media/i2c/ov5693.c                    |  3 +++
 drivers/media/i2c/ov6650.c                    |  6 +++++
 drivers/media/i2c/ov7251.c                    |  6 +++++
 drivers/media/i2c/ov7670.c                    |  4 +++
 drivers/media/i2c/ov772x.c                    |  6 +++++
 drivers/media/i2c/ov8865.c                    |  3 +++
 drivers/media/i2c/ov9650.c                    |  6 +++++
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  6 +++++
 drivers/media/i2c/s5k5baf.c                   |  6 +++++
 drivers/media/i2c/thp7312.c                   |  6 +++++
 drivers/media/i2c/tvp514x.c                   |  4 +++
 drivers/media/v4l2-core/v4l2-subdev.c         | 25 ++++++++++++-------
 .../media/atomisp/i2c/atomisp-gc0310.c        |  3 +++
 .../media/atomisp/i2c/atomisp-gc2235.c        |  3 +++
 .../media/atomisp/i2c/atomisp-mt9m114.c       |  3 +++
 .../media/atomisp/i2c/atomisp-ov2722.c        |  3 +++
 drivers/staging/media/imx/imx-ic-prp.c        |  6 +++++
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  6 +++++
 drivers/staging/media/imx/imx-media-csi.c     |  6 +++++
 drivers/staging/media/imx/imx-media-vdic.c    |  6 +++++
 drivers/staging/media/tegra-video/csi.c       |  3 +++
 include/uapi/linux/v4l2-subdev.h              | 15 ++++++++---
 36 files changed, 199 insertions(+), 18 deletions(-)

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
index 7ed86030fb5c..e1eec9f86539 100644
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
index 71fb5aebd3df..359ed943533c 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1051,6 +1051,9 @@ static int et8ek8_get_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	memset(fi, 0, sizeof(*fi));
 	fi->interval = sensor->current_reglist->mode.timeperframe;
 
@@ -1064,6 +1067,9 @@ static int et8ek8_set_frame_interval(struct v4l2_subdev *subdev,
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 	struct et8ek8_reglist *reglist;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	reglist = et8ek8_reglist_find_mode_ival(&meta_reglist,
 						sensor->current_reglist,
 						&fi->interval);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 624efc8834f3..80d14bc6f1ca 100644
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
index 4040c642a36f..9f9fb3c488e2 100644
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
index 7e8cb53d31c3..16f81479d411 100644
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
index 602954650f2e..a30c17594b8e 100644
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
index dcd94299787c..5e0d85b3d158 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1592,6 +1592,9 @@ static int mt9m114_ifp_get_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *ival = &interval->interval;
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	ival->numerator = 1;
@@ -1610,6 +1613,9 @@ static int mt9m114_ifp_set_frame_interval(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	int ret = 0;
 
+	if (interval->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(sensor->ifp.hdl.lock);
 
 	if (ival->numerator != 0 && ival->denominator != 0)
diff --git a/drivers/media/i2c/mt9v011.c b/drivers/media/i2c/mt9v011.c
index 3485761428ba..bc8c0591e4ae 100644
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
index 496be67c971b..b62624771e7b 100644
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
index e3ff64a9e6ca..5455e7afd1b3 100644
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
index 336bfd1ffd32..2d75a67a3aff 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3610,6 +3610,9 @@ static int ov5640_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	mutex_lock(&sensor->lock);
 	fi->interval = sensor->frame_interval;
 	mutex_unlock(&sensor->lock);
@@ -3625,6 +3628,9 @@ static int ov5640_set_frame_interval(struct v4l2_subdev *sd,
 	const struct ov5640_mode_info *mode;
 	int frame_rate, ret = 0;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != 0)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index d0d7e9968f48..f02a7e263aee 100644
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
index a65645811fbc..ce49176560d4 100644
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
index a4dc45bdf3d7..4ef2b7db315e 100644
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
index 10d6b5deed83..08f5f2d0538d 100644
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
index 463f20ece36e..7874a8dd7cf0 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1160,6 +1160,8 @@ static int ov7670_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct ov7670_info *info = to_state(sd);
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	info->devtype->get_framerate(sd, &ival->interval);
 
@@ -1173,6 +1175,8 @@ static int ov7670_set_frame_interval(struct v4l2_subdev *sd,
 	struct v4l2_fract *tpf = &ival->interval;
 	struct ov7670_info *info = to_state(sd);
 
+	if (ival->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
 
 	return info->devtype->set_framerate(sd, tpf);
 }
diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
index a14a25946c5b..d9a73871f7a3 100644
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
index 02a595281c49..7a25dcd900f2 100644
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
index f528892c893f..08be6c4fc6d5 100644
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
index 73ca50f49812..71a51794ced4 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -872,6 +872,9 @@ static int s5c73m3_oif_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
@@ -923,6 +926,9 @@ static int s5c73m3_oif_set_frame_interval(struct v4l2_subdev *sd,
 	struct s5c73m3 *state = oif_sd_to_s5c73m3(sd);
 	int ret;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad != OIF_SOURCE_PAD)
 		return -EINVAL;
 
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 2fd1ecfeb086..6b1a2c4946a9 100644
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
diff --git a/drivers/media/i2c/thp7312.c b/drivers/media/i2c/thp7312.c
index d4975b180704..49eda07f1c96 100644
--- a/drivers/media/i2c/thp7312.c
+++ b/drivers/media/i2c/thp7312.c
@@ -740,6 +740,9 @@ static int thp7312_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct thp7312_device *thp7312 = to_thp7312_dev(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	fi->interval.numerator = 1;
 	fi->interval.denominator = thp7312->current_rate->fps;
 
@@ -757,6 +760,9 @@ static int thp7312_set_frame_interval(struct v4l2_subdev *sd,
 	unsigned int best_delta = UINT_MAX;
 	unsigned int fps;
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	/* Avoid divisions by 0, pick the highest frame if the interval is 0. */
 	fps = fi->interval.numerator
 	    ? DIV_ROUND_CLOSEST(fi->interval.denominator, fi->interval.numerator)
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
index 08c908988f7d..b9ce3e41d52c 100644
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
index 006e8adac47b..3a032e1a06f8 100644
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
index aa257322a700..a2bbe2864049 100644
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
index 459c5b8233ce..b4be6d3120b1 100644
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
index b3ef04d7ccca..64e1addfc1c5 100644
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
index fb96f87e664e..26c758b67bf2 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -399,6 +399,9 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
@@ -415,6 +418,9 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 7bfe433cd322..94a8ace3fa7f 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -1209,6 +1209,9 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
@@ -1225,6 +1228,9 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 {
 	struct prp_priv *priv = sd_to_priv(sd);
 
+	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index 4308fdc9b58e..9af5a0d5ace4 100644
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
index a51b37679239..d34e11d925a1 100644
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
index b1b666179be5..a2ce8d025eaf 100644
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


