Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1787F312F73
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 11:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhBHKt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 05:49:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbhBHKqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Feb 2021 05:46:15 -0500
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.eu [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954C4C061788
        for <linux-media@vger.kernel.org>; Mon,  8 Feb 2021 02:44:22 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 1C004634C87;
        Mon,  8 Feb 2021 12:43:51 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH 1/1] Documentation: media: Rework camera sensor, CSI-2, async doc syntax
Date:   Mon,  8 Feb 2021 12:44:19 +0200
Message-Id: <20210208104419.2805-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Improve syntax used for camera sensor, CSI-2 ReST and V4L2 async syntax
for better compatibility with newer Sphinx versions and use function
references where applicable.

Not all internal references still work as kerneldoc doesn't appear to
support macros the way they are now used by v4l2-async.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/camera-sensor.rst        |  2 +-
 Documentation/driver-api/media/csi2.rst       | 18 +++++------
 include/media/v4l2-async.h                    | 30 +++++++++----------
 3 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/Documentation/driver-api/media/camera-sensor.rst b/Documentation/driver-api/media/camera-sensor.rst
index 4e2efa6e8fa1..2e3d87052f0e 100644
--- a/Documentation/driver-api/media/camera-sensor.rst
+++ b/Documentation/driver-api/media/camera-sensor.rst
@@ -137,7 +137,7 @@ general, the device must be powered on at least when its registers are being
 accessed and when it is streaming.
 
 Existing camera sensor drivers may rely on the old
-:c:type:`v4l2_subdev_core_ops`->s_power() callback for bridge or ISP drivers to
+struct v4l2_subdev_core_ops->s_power() callback for bridge or ISP drivers to
 manage their power state. This is however **deprecated**. If you feel you need
 to begin calling an s_power from an ISP or a bridge driver, instead please add
 runtime PM support to the sensor driver you are using. Likewise, new drivers
diff --git a/Documentation/driver-api/media/csi2.rst b/Documentation/driver-api/media/csi2.rst
index c79df33bdeaa..f91f82821575 100644
--- a/Documentation/driver-api/media/csi2.rst
+++ b/Documentation/driver-api/media/csi2.rst
@@ -22,13 +22,13 @@ Transmitter drivers
 CSI-2 transmitter, such as a sensor or a TV tuner, drivers need to provide the
 CSI-2 receiver with information on the CSI-2 bus configuration. These include
 the ``V4L2_CID_LINK_FREQ`` control and
-(:c:type:`v4l2_subdev_video_ops`->s_stream() callback). These interface elements
+(struct v4l2_subdev_video_ops->s_stream() callback). These interface elements
 must be present on the sub-device representing the CSI-2 transmitter.
 
 The ``V4L2_CID_LINK_FREQ`` control is used to tell the receiver driver the
-frequency (and not the symbol rate) of the link. The
-:c:type:`v4l2_subdev_video_ops`->s_stream() callback provides an ability to
-start and stop the stream.
+frequency (and not the symbol rate) of the link. The struct
+v4l2_subdev_video_ops->s_stream() callback provides an ability to start and stop
+the stream.
 
 The pixel rate on the bus is calculated as follows::
 
@@ -83,12 +83,10 @@ cases.
 Receiver drivers
 ----------------
 
-Before the receiver driver may enable the CSI-2 transmitter by using
-the :c:type:`v4l2_subdev_video_ops`->s_stream(), it must have powered
-the transmitter up by using the
-:c:type:`v4l2_subdev_core_ops`->s_power() callback. This may take
-place either indirectly by using :c:func:`v4l2_pipeline_pm_get` or
-directly.
+Before the receiver driver may enable the CSI-2 transmitter by using the struct
+v4l2_subdev_video_ops->s_stream(), it must have powered the transmitter up by
+using the struct v4l2_subdev_core_ops->s_power() callback. This may take place
+either indirectly by using v4l2_pipeline_pm_get() or directly.
 
 Formats
 -------
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6f22daa6f067..741efd8b298a 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -129,11 +129,11 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  *
  * This function initializes the notifier @asd_list. It must be called
  * before adding a subdevice to a notifier, using one of:
- * @v4l2_async_notifier_add_fwnode_remote_subdev,
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_i2c_subdev,
- * @__v4l2_async_notifier_add_subdev or
- * @v4l2_async_notifier_parse_fwnode_endpoints.
+ * v4l2_async_notifier_add_fwnode_remote_subdev(),
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_i2c_subdev(),
+ * __v4l2_async_notifier_add_subdev() or
+ * v4l2_async_notifier_parse_fwnode_endpoints().
  */
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
@@ -145,9 +145,9 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
  * @asd: pointer to &struct v4l2_async_subdev
  *
  * \warning: Drivers should avoid using this function and instead use one of:
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_fwnode_remote_subdev or
- * @v4l2_async_notifier_add_i2c_subdev.
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_fwnode_remote_subdev() or
+ * v4l2_async_notifier_add_i2c_subdev().
  *
  * Call this function before registering a notifier to link the provided @asd to
  * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
@@ -198,7 +198,7 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  * function also gets a reference of the fwnode which is released later at
  * notifier cleanup time.
  *
- * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
+ * This is just like v4l2_async_notifier_add_fwnode_subdev(), but with the
  * exception that the fwnode refers to a local endpoint, not the remote one.
  */
 struct v4l2_async_subdev *
@@ -267,13 +267,13 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling
- * @v4l2_async_notifier_add_fwnode_remote_subdev,
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_i2c_subdev,
- * @__v4l2_async_notifier_add_subdev or
- * @v4l2_async_notifier_parse_fwnode_endpoints.
+ * v4l2_async_notifier_add_fwnode_remote_subdev(),
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_i2c_subdev(),
+ * __v4l2_async_notifier_add_subdev() or
+ * v4l2_async_notifier_parse_fwnode_endpoints().
  *
- * There is no harm from calling v4l2_async_notifier_cleanup in other
+ * There is no harm from calling v4l2_async_notifier_cleanup() in other
  * cases as long as its memory has been zeroed after it has been
  * allocated.
  */
-- 
2.29.2

