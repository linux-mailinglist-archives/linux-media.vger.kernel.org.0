Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0B5353509
	for <lists+linux-media@lfdr.de>; Sat,  3 Apr 2021 20:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236662AbhDCSI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Apr 2021 14:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236660AbhDCSI0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Apr 2021 14:08:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CFAC06178C;
        Sat,  3 Apr 2021 11:08:21 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id F34191F4580F
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 03/10] media: uapi: mpeg2: Cleanup flags
Date:   Sat,  3 Apr 2021 15:07:49 -0300
Message-Id: <20210403180756.175881-4-ezequiel@collabora.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210403180756.175881-1-ezequiel@collabora.com>
References: <20210403180756.175881-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Our current MPEG-2 uAPI uses 1-byte fields for MPEG-2
boolean syntax elements. Clean these by adding a 'flags'
field and flag macro for each boolean syntax element.

A follow-up change will refactor this uAPI so we don't need
to add padding fields just yet.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Tested-by: Jonas Karlman <jonas@kwiboo.se>
---
 .../media/v4l/ext-ctrls-codec.rst             |  77 +-
 drivers/media/v4l2-core/v4l2-async-core.c     | 880 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  14 +-
 .../media/hantro/hantro_g1_mpeg2_dec.c        |  76 +-
 .../media/hantro/rk3399_vpu_hw_mpeg2_dec.c    |  76 +-
 .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |  38 +-
 include/media/mpeg2-ctrls.h                   |  36 +-
 7 files changed, 1055 insertions(+), 142 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-async-core.c

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d9546f0aa2e8..7d5ac7fb6579 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1654,13 +1654,28 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``profile_and_level_indication``
       - The current profile and level indication as extracted from the
 	bitstream.
-    * - __u8
-      - ``progressive_sequence``
-      - Indication that all the frames for the sequence are progressive instead
-	of interlaced.
     * - __u8
       - ``chroma_format``
       - The chrominance sub-sampling format (1: 4:2:0, 2: 4:2:2, 3: 4:4:4).
+    * - __u32
+      - ``flags``
+      - See :ref:`MPEG-2 Sequence Flags <mpeg2_sequence_flags>`.
+
+.. _mpeg2_sequence_flags:
+
+``MPEG-2 Sequence Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE``
+      - 0x00000001
+      - Indication that all the frames for the sequence are progressive instead
+	of interlaced.
 
 .. c:type:: v4l2_mpeg2_picture
 
@@ -1693,29 +1708,45 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
       - ``picture_structure``
       - Picture structure (1: interlaced top field, 2: interlaced bottom field,
 	3: progressive frame).
-    * - __u8
-      - ``top_field_first``
-      - If set to 1 and interlaced stream, top field is output first.
-    * - __u8
-      - ``frame_pred_frame_dct``
-      - If set to 1, only frame-DCT and frame prediction are used.
-    * - __u8
-      - ``concealment_motion_vectors``
-      -  If set to 1, motion vectors are coded for intra macroblocks.
-    * - __u8
-      - ``q_scale_type``
+    * - __u32
+      - ``flags``
+      - See :ref:`MPEG-2 Picture Flags <mpeg2_picture_flags>`.
+
+
+.. _mpeg2_picture_flags:
+
+``MPEG-2 Picture Flags``
+
+.. cssclass:: longtable
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 2
+
+    * - ``V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST``
+      - 0x00000001
+      - If set and it's an interlaced stream, top field is output first.
+    * - ``V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT``
+      - 0x00000002
+      - If set only frame-DCT and frame prediction are used.
+    * - ``V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV``
+      - 0x00000004
+      -  If set motion vectors are coded for intra macroblocks.
+    * - ``V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE``
+      - 0x00000008
       - This flag affects the inverse quantization process.
-    * - __u8
-      - ``intra_vlc_format``
+    * - ``V4L2_MPEG2_PIC_FLAG_INTRA_VLC``
+      - 0x00000010
       - This flag affects the decoding of transform coefficient data.
-    * - __u8
-      - ``alternate_scan``
+    * - ``V4L2_MPEG2_PIC_FLAG_ALT_SCAN``
+      - 0x00000020
       - This flag affects the decoding of transform coefficient data.
-    * - __u8
-      - ``repeat_first_field``
+    * - ``V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST``
+      - 0x00000040
       - This flag affects the decoding process of progressive frames.
-    * - __u16
-      - ``progressive_frame``
+    * - ``V4L2_MPEG2_PIC_FLAG_PROGRESSIVE``
+      - 0x00000080
       - Indicates whether the current frame is progressive.
 
 .. raw:: latex
diff --git a/drivers/media/v4l2-core/v4l2-async-core.c b/drivers/media/v4l2-core/v4l2-async-core.c
new file mode 100644
index 000000000000..cd9e78c63791
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-async-core.c
@@ -0,0 +1,880 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * V4L2 asynchronous subdevice registration API
+ *
+ * Copyright (C) 2012-2013, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+static int v4l2_async_notifier_call_bound(struct v4l2_async_notifier *n,
+					  struct v4l2_subdev *subdev,
+					  struct v4l2_async_subdev *asd)
+{
+	if (!n->ops || !n->ops->bound)
+		return 0;
+
+	return n->ops->bound(n, subdev, asd);
+}
+
+static void v4l2_async_notifier_call_unbind(struct v4l2_async_notifier *n,
+					    struct v4l2_subdev *subdev,
+					    struct v4l2_async_subdev *asd)
+{
+	if (!n->ops || !n->ops->unbind)
+		return;
+
+	n->ops->unbind(n, subdev, asd);
+}
+
+static int v4l2_async_notifier_call_complete(struct v4l2_async_notifier *n)
+{
+	if (!n->ops || !n->ops->complete)
+		return 0;
+
+	return n->ops->complete(n);
+}
+
+static bool match_i2c(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+{
+#if IS_ENABLED(CONFIG_I2C)
+	struct i2c_client *client = i2c_verify_client(sd->dev);
+
+	return client &&
+		asd->match.i2c.adapter_id == client->adapter->nr &&
+		asd->match.i2c.address == client->addr;
+#else
+	return false;
+#endif
+}
+
+static bool match_fwnode(struct v4l2_async_notifier *notifier,
+			 struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
+{
+	struct fwnode_handle *other_fwnode;
+	struct fwnode_handle *dev_fwnode;
+	bool asd_fwnode_is_ep;
+	bool sd_fwnode_is_ep;
+	struct device *dev;
+
+	/*
+	 * Both the subdev and the async subdev can provide either an endpoint
+	 * fwnode or a device fwnode. Start with the simple case of direct
+	 * fwnode matching.
+	 */
+	if (sd->fwnode == asd->match.fwnode)
+		return true;
+
+	/*
+	 * Check the same situation for any possible secondary assigned to the
+	 * subdev's fwnode
+	 */
+	if (!IS_ERR_OR_NULL(sd->fwnode->secondary) &&
+	    sd->fwnode->secondary == asd->match.fwnode)
+		return true;
+
+	/*
+	 * Otherwise, check if the sd fwnode and the asd fwnode refer to an
+	 * endpoint or a device. If they're of the same type, there's no match.
+	 * Technically speaking this checks if the nodes refer to a connected
+	 * endpoint, which is the simplest check that works for both OF and
+	 * ACPI. This won't make a difference, as drivers should not try to
+	 * match unconnected endpoints.
+	 */
+	sd_fwnode_is_ep = fwnode_graph_is_endpoint(sd->fwnode);
+	asd_fwnode_is_ep = fwnode_graph_is_endpoint(asd->match.fwnode);
+
+	if (sd_fwnode_is_ep == asd_fwnode_is_ep)
+		return false;
+
+	/*
+	 * The sd and asd fwnodes are of different types. Get the device fwnode
+	 * parent of the endpoint fwnode, and compare it with the other fwnode.
+	 */
+	if (sd_fwnode_is_ep) {
+		dev_fwnode = fwnode_graph_get_port_parent(sd->fwnode);
+		other_fwnode = asd->match.fwnode;
+	} else {
+		dev_fwnode = fwnode_graph_get_port_parent(asd->match.fwnode);
+		other_fwnode = sd->fwnode;
+	}
+
+	fwnode_handle_put(dev_fwnode);
+
+	if (dev_fwnode != other_fwnode)
+		return false;
+
+	/*
+	 * We have a heterogeneous match. Retrieve the struct device of the side
+	 * that matched on a device fwnode to print its driver name.
+	 */
+	if (sd_fwnode_is_ep)
+		dev = notifier->v4l2_dev ? notifier->v4l2_dev->dev
+		    : notifier->sd->dev;
+	else
+		dev = sd->dev;
+
+	if (dev && dev->driver) {
+		if (sd_fwnode_is_ep)
+			dev_warn(dev, "Driver %s uses device fwnode, incorrect match may occur\n",
+				 dev->driver->name);
+		dev_notice(dev, "Consider updating driver %s to match on endpoints\n",
+			   dev->driver->name);
+	}
+
+	return true;
+}
+
+static LIST_HEAD(subdev_list);
+static LIST_HEAD(notifier_list);
+static DEFINE_MUTEX(list_lock);
+
+static struct v4l2_async_subdev *
+v4l2_async_find_match(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd)
+{
+	bool (*match)(struct v4l2_async_notifier *notifier,
+		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd);
+	struct v4l2_async_subdev *asd;
+
+	list_for_each_entry(asd, &notifier->waiting, list) {
+		/* bus_type has been verified valid before */
+		switch (asd->match_type) {
+		case V4L2_ASYNC_MATCH_I2C:
+			match = match_i2c;
+			break;
+		case V4L2_ASYNC_MATCH_FWNODE:
+			match = match_fwnode;
+			break;
+		default:
+			/* Cannot happen, unless someone breaks us */
+			WARN_ON(true);
+			return NULL;
+		}
+
+		/* match cannot be NULL here */
+		if (match(notifier, sd, asd))
+			return asd;
+	}
+
+	return NULL;
+}
+
+/* Compare two async sub-device descriptors for equivalence */
+static bool asd_equal(struct v4l2_async_subdev *asd_x,
+		      struct v4l2_async_subdev *asd_y)
+{
+	if (asd_x->match_type != asd_y->match_type)
+		return false;
+
+	switch (asd_x->match_type) {
+	case V4L2_ASYNC_MATCH_I2C:
+		return asd_x->match.i2c.adapter_id ==
+			asd_y->match.i2c.adapter_id &&
+			asd_x->match.i2c.address ==
+			asd_y->match.i2c.address;
+	case V4L2_ASYNC_MATCH_FWNODE:
+		return asd_x->match.fwnode == asd_y->match.fwnode;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+/* Find the sub-device notifier registered by a sub-device driver. */
+static struct v4l2_async_notifier *
+v4l2_async_find_subdev_notifier(struct v4l2_subdev *sd)
+{
+	struct v4l2_async_notifier *n;
+
+	list_for_each_entry(n, &notifier_list, list)
+		if (n->sd == sd)
+			return n;
+
+	return NULL;
+}
+
+/* Get v4l2_device related to the notifier if one can be found. */
+static struct v4l2_device *
+v4l2_async_notifier_find_v4l2_dev(struct v4l2_async_notifier *notifier)
+{
+	while (notifier->parent)
+		notifier = notifier->parent;
+
+	return notifier->v4l2_dev;
+}
+
+/*
+ * Return true if all child sub-device notifiers are complete, false otherwise.
+ */
+static bool
+v4l2_async_notifier_can_complete(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_subdev *sd;
+
+	if (!list_empty(&notifier->waiting))
+		return false;
+
+	list_for_each_entry(sd, &notifier->done, async_list) {
+		struct v4l2_async_notifier *subdev_notifier =
+			v4l2_async_find_subdev_notifier(sd);
+
+		if (subdev_notifier &&
+		    !v4l2_async_notifier_can_complete(subdev_notifier))
+			return false;
+	}
+
+	return true;
+}
+
+/*
+ * Complete the master notifier if possible. This is done when all async
+ * sub-devices have been bound; v4l2_device is also available then.
+ */
+static int
+v4l2_async_notifier_try_complete(struct v4l2_async_notifier *notifier)
+{
+	/* Quick check whether there are still more sub-devices here. */
+	if (!list_empty(&notifier->waiting))
+		return 0;
+
+	/* Check the entire notifier tree; find the root notifier first. */
+	while (notifier->parent)
+		notifier = notifier->parent;
+
+	/* This is root if it has v4l2_dev. */
+	if (!notifier->v4l2_dev)
+		return 0;
+
+	/* Is everything ready? */
+	if (!v4l2_async_notifier_can_complete(notifier))
+		return 0;
+
+	return v4l2_async_notifier_call_complete(notifier);
+}
+
+static int
+v4l2_async_notifier_try_all_subdevs(struct v4l2_async_notifier *notifier);
+
+static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
+				   struct v4l2_device *v4l2_dev,
+				   struct v4l2_subdev *sd,
+				   struct v4l2_async_subdev *asd)
+{
+	struct v4l2_async_notifier *subdev_notifier;
+	int ret;
+
+	ret = v4l2_device_register_subdev(v4l2_dev, sd);
+	if (ret < 0)
+		return ret;
+
+	ret = v4l2_async_notifier_call_bound(notifier, sd, asd);
+	if (ret < 0) {
+		v4l2_device_unregister_subdev(sd);
+		return ret;
+	}
+
+	/* Remove from the waiting list */
+	list_del(&asd->list);
+	sd->asd = asd;
+	sd->notifier = notifier;
+
+	/* Move from the global subdevice list to notifier's done */
+	list_move(&sd->async_list, &notifier->done);
+
+	/*
+	 * See if the sub-device has a notifier. If not, return here.
+	 */
+	subdev_notifier = v4l2_async_find_subdev_notifier(sd);
+	if (!subdev_notifier || subdev_notifier->parent)
+		return 0;
+
+	/*
+	 * Proceed with checking for the sub-device notifier's async
+	 * sub-devices, and return the result. The error will be handled by the
+	 * caller.
+	 */
+	subdev_notifier->parent = notifier;
+
+	return v4l2_async_notifier_try_all_subdevs(subdev_notifier);
+}
+
+/* Test all async sub-devices in a notifier for a match. */
+static int
+v4l2_async_notifier_try_all_subdevs(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_device *v4l2_dev =
+		v4l2_async_notifier_find_v4l2_dev(notifier);
+	struct v4l2_subdev *sd;
+
+	if (!v4l2_dev)
+		return 0;
+
+again:
+	list_for_each_entry(sd, &subdev_list, async_list) {
+		struct v4l2_async_subdev *asd;
+		int ret;
+
+		asd = v4l2_async_find_match(notifier, sd);
+		if (!asd)
+			continue;
+
+		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
+		if (ret < 0)
+			return ret;
+
+		/*
+		 * v4l2_async_match_notify() may lead to registering a
+		 * new notifier and thus changing the async subdevs
+		 * list. In order to proceed safely from here, restart
+		 * parsing the list from the beginning.
+		 */
+		goto again;
+	}
+
+	return 0;
+}
+
+static void v4l2_async_cleanup(struct v4l2_subdev *sd)
+{
+	v4l2_device_unregister_subdev(sd);
+	/*
+	 * Subdevice driver will reprobe and put the subdev back
+	 * onto the list
+	 */
+	list_del_init(&sd->async_list);
+	sd->asd = NULL;
+}
+
+/* Unbind all sub-devices in the notifier tree. */
+static void
+v4l2_async_notifier_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_subdev *sd, *tmp;
+
+	list_for_each_entry_safe(sd, tmp, &notifier->done, async_list) {
+		struct v4l2_async_notifier *subdev_notifier =
+			v4l2_async_find_subdev_notifier(sd);
+
+		if (subdev_notifier)
+			v4l2_async_notifier_unbind_all_subdevs(subdev_notifier);
+
+		v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
+		v4l2_async_cleanup(sd);
+
+		list_move(&sd->async_list, &subdev_list);
+	}
+
+	notifier->parent = NULL;
+}
+
+/* See if an async sub-device can be found in a notifier's lists. */
+static bool
+__v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
+				       struct v4l2_async_subdev *asd)
+{
+	struct v4l2_async_subdev *asd_y;
+	struct v4l2_subdev *sd;
+
+	list_for_each_entry(asd_y, &notifier->waiting, list)
+		if (asd_equal(asd, asd_y))
+			return true;
+
+	list_for_each_entry(sd, &notifier->done, async_list) {
+		if (WARN_ON(!sd->asd))
+			continue;
+
+		if (asd_equal(asd, sd->asd))
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Find out whether an async sub-device was set up already or
+ * whether it exists in a given notifier before @this_index.
+ * If @this_index < 0, search the notifier's entire @asd_list.
+ */
+static bool
+v4l2_async_notifier_has_async_subdev(struct v4l2_async_notifier *notifier,
+				     struct v4l2_async_subdev *asd,
+				     int this_index)
+{
+	struct v4l2_async_subdev *asd_y;
+	int j = 0;
+
+	lockdep_assert_held(&list_lock);
+
+	/* Check that an asd is not being added more than once. */
+	list_for_each_entry(asd_y, &notifier->asd_list, asd_list) {
+		if (this_index >= 0 && j++ >= this_index)
+			break;
+		if (asd_equal(asd, asd_y))
+			return true;
+	}
+
+	/* Check that an asd does not exist in other notifiers. */
+	list_for_each_entry(notifier, &notifier_list, list)
+		if (__v4l2_async_notifier_has_async_subdev(notifier, asd))
+			return true;
+
+	return false;
+}
+
+static int v4l2_async_notifier_asd_valid(struct v4l2_async_notifier *notifier,
+					 struct v4l2_async_subdev *asd,
+					 int this_index)
+{
+	struct device *dev =
+		notifier->v4l2_dev ? notifier->v4l2_dev->dev : NULL;
+
+	if (!asd)
+		return -EINVAL;
+
+	switch (asd->match_type) {
+	case V4L2_ASYNC_MATCH_I2C:
+	case V4L2_ASYNC_MATCH_FWNODE:
+		if (v4l2_async_notifier_has_async_subdev(notifier, asd,
+							 this_index)) {
+			dev_dbg(dev, "subdev descriptor already listed in this or other notifiers\n");
+			return -EEXIST;
+		}
+		break;
+	default:
+		dev_err(dev, "Invalid match type %u on %p\n",
+			asd->match_type, asd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier)
+{
+	INIT_LIST_HEAD(&notifier->asd_list);
+}
+EXPORT_SYMBOL(v4l2_async_notifier_init);
+
+static int __v4l2_async_notifier_register(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_async_subdev *asd;
+	int ret, i = 0;
+
+	INIT_LIST_HEAD(&notifier->waiting);
+	INIT_LIST_HEAD(&notifier->done);
+
+	mutex_lock(&list_lock);
+
+	list_for_each_entry(asd, &notifier->asd_list, asd_list) {
+		ret = v4l2_async_notifier_asd_valid(notifier, asd, i++);
+		if (ret)
+			goto err_unlock;
+
+		list_add_tail(&asd->list, &notifier->waiting);
+	}
+
+	ret = v4l2_async_notifier_try_all_subdevs(notifier);
+	if (ret < 0)
+		goto err_unbind;
+
+	ret = v4l2_async_notifier_try_complete(notifier);
+	if (ret < 0)
+		goto err_unbind;
+
+	/* Keep also completed notifiers on the list */
+	list_add(&notifier->list, &notifier_list);
+
+	mutex_unlock(&list_lock);
+
+	return 0;
+
+err_unbind:
+	/*
+	 * On failure, unbind all sub-devices registered through this notifier.
+	 */
+	v4l2_async_notifier_unbind_all_subdevs(notifier);
+
+err_unlock:
+	mutex_unlock(&list_lock);
+
+	return ret;
+}
+
+int v4l2_async_notifier_register(struct v4l2_device *v4l2_dev,
+				 struct v4l2_async_notifier *notifier)
+{
+	int ret;
+
+	if (WARN_ON(!v4l2_dev || notifier->sd))
+		return -EINVAL;
+
+	notifier->v4l2_dev = v4l2_dev;
+
+	ret = __v4l2_async_notifier_register(notifier);
+	if (ret)
+		notifier->v4l2_dev = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL(v4l2_async_notifier_register);
+
+int v4l2_async_subdev_notifier_register(struct v4l2_subdev *sd,
+					struct v4l2_async_notifier *notifier)
+{
+	int ret;
+
+	if (WARN_ON(!sd || notifier->v4l2_dev))
+		return -EINVAL;
+
+	notifier->sd = sd;
+
+	ret = __v4l2_async_notifier_register(notifier);
+	if (ret)
+		notifier->sd = NULL;
+
+	return ret;
+}
+EXPORT_SYMBOL(v4l2_async_subdev_notifier_register);
+
+static void
+__v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
+{
+	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
+		return;
+
+	v4l2_async_notifier_unbind_all_subdevs(notifier);
+
+	notifier->sd = NULL;
+	notifier->v4l2_dev = NULL;
+
+	list_del(&notifier->list);
+}
+
+void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier)
+{
+	mutex_lock(&list_lock);
+
+	__v4l2_async_notifier_unregister(notifier);
+
+	mutex_unlock(&list_lock);
+}
+EXPORT_SYMBOL(v4l2_async_notifier_unregister);
+
+static void __v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_async_subdev *asd, *tmp;
+
+	if (!notifier || !notifier->asd_list.next)
+		return;
+
+	list_for_each_entry_safe(asd, tmp, &notifier->asd_list, asd_list) {
+		switch (asd->match_type) {
+		case V4L2_ASYNC_MATCH_FWNODE:
+			fwnode_handle_put(asd->match.fwnode);
+			break;
+		default:
+			break;
+		}
+
+		list_del(&asd->asd_list);
+		kfree(asd);
+	}
+}
+
+void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
+{
+	mutex_lock(&list_lock);
+
+	__v4l2_async_notifier_cleanup(notifier);
+
+	mutex_unlock(&list_lock);
+}
+EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
+
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+				   struct v4l2_async_subdev *asd)
+{
+	int ret;
+
+	mutex_lock(&list_lock);
+
+	ret = v4l2_async_notifier_asd_valid(notifier, asd, -1);
+	if (ret)
+		goto unlock;
+
+	list_add_tail(&asd->asd_list, &notifier->asd_list);
+
+unlock:
+	mutex_unlock(&list_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
+
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
+					struct fwnode_handle *fwnode,
+					unsigned int asd_struct_size)
+{
+	struct v4l2_async_subdev *asd;
+	int ret;
+
+	asd = kzalloc(asd_struct_size, GFP_KERNEL);
+	if (!asd)
+		return ERR_PTR(-ENOMEM);
+
+	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.fwnode = fwnode_handle_get(fwnode);
+
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
+	if (ret) {
+		fwnode_handle_put(fwnode);
+		kfree(asd);
+		return ERR_PTR(ret);
+	}
+
+	return asd;
+}
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_fwnode_subdev);
+
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					       struct fwnode_handle *endpoint,
+					       unsigned int asd_struct_size)
+{
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *remote;
+
+	remote = fwnode_graph_get_remote_port_parent(endpoint);
+	if (!remote)
+		return ERR_PTR(-ENOTCONN);
+
+	asd = __v4l2_async_notifier_add_fwnode_subdev(notif, remote,
+						      asd_struct_size);
+	/*
+	 * Calling __v4l2_async_notifier_add_fwnode_subdev grabs a refcount,
+	 * so drop the one we got in fwnode_graph_get_remote_port_parent.
+	 */
+	fwnode_handle_put(remote);
+	return asd;
+}
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_fwnode_remote_subdev);
+
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
+				     int adapter_id, unsigned short address,
+				     unsigned int asd_struct_size)
+{
+	struct v4l2_async_subdev *asd;
+	int ret;
+
+	asd = kzalloc(asd_struct_size, GFP_KERNEL);
+	if (!asd)
+		return ERR_PTR(-ENOMEM);
+
+	asd->match_type = V4L2_ASYNC_MATCH_I2C;
+	asd->match.i2c.adapter_id = adapter_id;
+	asd->match.i2c.address = address;
+
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
+	if (ret) {
+		kfree(asd);
+		return ERR_PTR(ret);
+	}
+
+	return asd;
+}
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_i2c_subdev);
+
+int v4l2_async_register_subdev(struct v4l2_subdev *sd)
+{
+	struct v4l2_async_notifier *subdev_notifier;
+	struct v4l2_async_notifier *notifier;
+	int ret;
+
+	/*
+	 * No reference taken. The reference is held by the device
+	 * (struct v4l2_subdev.dev), and async sub-device does not
+	 * exist independently of the device at any point of time.
+	 */
+	if (!sd->fwnode && sd->dev)
+		sd->fwnode = dev_fwnode(sd->dev);
+
+	mutex_lock(&list_lock);
+
+	INIT_LIST_HEAD(&sd->async_list);
+
+	list_for_each_entry(notifier, &notifier_list, list) {
+		struct v4l2_device *v4l2_dev =
+			v4l2_async_notifier_find_v4l2_dev(notifier);
+		struct v4l2_async_subdev *asd;
+
+		if (!v4l2_dev)
+			continue;
+
+		asd = v4l2_async_find_match(notifier, sd);
+		if (!asd)
+			continue;
+
+		ret = v4l2_async_match_notify(notifier, v4l2_dev, sd, asd);
+		if (ret)
+			goto err_unbind;
+
+		ret = v4l2_async_notifier_try_complete(notifier);
+		if (ret)
+			goto err_unbind;
+
+		goto out_unlock;
+	}
+
+	/* None matched, wait for hot-plugging */
+	list_add(&sd->async_list, &subdev_list);
+
+out_unlock:
+	mutex_unlock(&list_lock);
+
+	return 0;
+
+err_unbind:
+	/*
+	 * Complete failed. Unbind the sub-devices bound through registering
+	 * this async sub-device.
+	 */
+	subdev_notifier = v4l2_async_find_subdev_notifier(sd);
+	if (subdev_notifier)
+		v4l2_async_notifier_unbind_all_subdevs(subdev_notifier);
+
+	if (sd->asd)
+		v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
+	v4l2_async_cleanup(sd);
+
+	mutex_unlock(&list_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(v4l2_async_register_subdev);
+
+void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
+{
+	if (!sd->async_list.next)
+		return;
+
+	mutex_lock(&list_lock);
+
+	__v4l2_async_notifier_unregister(sd->subdev_notifier);
+	__v4l2_async_notifier_cleanup(sd->subdev_notifier);
+	kfree(sd->subdev_notifier);
+	sd->subdev_notifier = NULL;
+
+	if (sd->asd) {
+		struct v4l2_async_notifier *notifier = sd->notifier;
+
+		list_add(&sd->asd->list, &notifier->waiting);
+
+		v4l2_async_notifier_call_unbind(notifier, sd, sd->asd);
+	}
+
+	v4l2_async_cleanup(sd);
+
+	mutex_unlock(&list_lock);
+}
+EXPORT_SYMBOL(v4l2_async_unregister_subdev);
+
+static void print_waiting_subdev(struct seq_file *s,
+				 struct v4l2_async_subdev *asd)
+{
+	switch (asd->match_type) {
+	case V4L2_ASYNC_MATCH_I2C:
+		seq_printf(s, " [i2c] dev=%d-%04x\n", asd->match.i2c.adapter_id,
+			   asd->match.i2c.address);
+		break;
+	case V4L2_ASYNC_MATCH_FWNODE: {
+		struct fwnode_handle *devnode, *fwnode = asd->match.fwnode;
+
+		devnode = fwnode_graph_is_endpoint(fwnode) ?
+			  fwnode_graph_get_port_parent(fwnode) :
+			  fwnode_handle_get(fwnode);
+
+		seq_printf(s, " [fwnode] dev=%s, node=%pfw\n",
+			   devnode->dev ? dev_name(devnode->dev) : "nil",
+			   fwnode);
+
+		fwnode_handle_put(devnode);
+		break;
+	}
+	}
+}
+
+static const char *
+v4l2_async_notifier_name(struct v4l2_async_notifier *notifier)
+{
+	if (notifier->v4l2_dev)
+		return notifier->v4l2_dev->name;
+	else if (notifier->sd)
+		return notifier->sd->name;
+	else
+		return "nil";
+}
+
+static int pending_subdevs_show(struct seq_file *s, void *data)
+{
+	struct v4l2_async_notifier *notif;
+	struct v4l2_async_subdev *asd;
+
+	mutex_lock(&list_lock);
+
+	list_for_each_entry(notif, &notifier_list, list) {
+		seq_printf(s, "%s:\n", v4l2_async_notifier_name(notif));
+		list_for_each_entry(asd, &notif->waiting, list)
+			print_waiting_subdev(s, asd);
+	}
+
+	mutex_unlock(&list_lock);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(pending_subdevs);
+
+static struct dentry *v4l2_async_debugfs_dir;
+
+static int __init v4l2_async_init(void)
+{
+	v4l2_async_debugfs_dir = debugfs_create_dir("v4l2-async", NULL);
+	debugfs_create_file("pending_async_subdevices", 0444,
+			    v4l2_async_debugfs_dir, NULL,
+			    &pending_subdevs_fops);
+
+	return 0;
+}
+
+static void __exit v4l2_async_exit(void)
+{
+	debugfs_remove_recursive(v4l2_async_debugfs_dir);
+}
+
+subsys_initcall(v4l2_async_init);
+module_exit(v4l2_async_exit);
+
+MODULE_AUTHOR("Guennadi Liakhovetski <g.liakhovetski@gmx.de>");
+MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
+MODULE_AUTHOR("Ezequiel Garcia <ezequiel@collabora.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 5d92a2b33a6e..99064683cfb5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1691,7 +1691,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		/* interlaced top field */
 		p_mpeg2_slice_params->picture.picture_structure = 1;
 		p_mpeg2_slice_params->picture.picture_coding_type =
-					V4L2_MPEG2_PICTURE_CODING_TYPE_I;
+					V4L2_MPEG2_PIC_CODING_TYPE_I;
 		break;
 	case V4L2_CTRL_TYPE_MPEG2_QUANTISATION:
 		p_mpeg2_quant = p;
@@ -1901,18 +1901,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		}
 
 		switch (p_mpeg2_slice_params->picture.picture_structure) {
-		case 1: /* interlaced top field */
-		case 2: /* interlaced bottom field */
-		case 3: /* progressive */
+		case V4L2_MPEG2_PIC_TOP_FIELD:
+		case V4L2_MPEG2_PIC_BOTTOM_FIELD:
+		case V4L2_MPEG2_PIC_FRAME:
 			break;
 		default:
 			return -EINVAL;
 		}
 
 		switch (p_mpeg2_slice_params->picture.picture_coding_type) {
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_I:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
-		case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+		case V4L2_MPEG2_PIC_CODING_TYPE_I:
+		case V4L2_MPEG2_PIC_CODING_TYPE_P:
+		case V4L2_MPEG2_PIC_CODING_TYPE_B:
 			break;
 		default:
 			return -EINVAL;
diff --git a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
index dedb5c502ae0..6ef7ded863b2 100644
--- a/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/hantro_g1_mpeg2_dec.c
@@ -77,10 +77,6 @@
 
 #define G1_REG_APF_THRESHOLD(v)		(((v) << 0) & GENMASK(13, 0))
 
-#define PICT_TOP_FIELD     1
-#define PICT_BOTTOM_FIELD  2
-#define PICT_FRAME         3
-
 static void
 hantro_g1_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 				     struct hantro_ctx *ctx)
@@ -96,19 +92,19 @@ static void
 hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 				struct vb2_buffer *src_buf,
 				struct vb2_buffer *dst_buf,
-				const struct v4l2_mpeg2_sequence *sequence,
-				const struct v4l2_mpeg2_picture *picture,
+				const struct v4l2_mpeg2_sequence *seq,
+				const struct v4l2_mpeg2_picture *pic,
 				const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
 
-	switch (picture->picture_coding_type) {
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+	switch (pic->picture_coding_type) {
+	case V4L2_MPEG2_PIC_CODING_TYPE_B:
 		backward_addr = hantro_get_ref(ctx,
 					       slice_params->backward_ref_ts);
 		fallthrough;
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+	case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		forward_addr = hantro_get_ref(ctx,
 					      slice_params->forward_ref_ts);
 	}
@@ -121,7 +117,7 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 	addr = hantro_get_dec_buf_addr(ctx, dst_buf);
 	current_addr = addr;
 
-	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+	if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD)
 		addr += ALIGN(ctx->dst_fmt.width, 16);
 	vdpu_write_relaxed(vpu, addr, G1_REG_DEC_OUT_BASE);
 
@@ -131,18 +127,18 @@ hantro_g1_mpeg2_dec_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx,
 		backward_addr = current_addr;
 
 	/* Set forward ref frame (top/bottom field) */
-	if (picture->picture_structure == PICT_FRAME ||
-	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
-	    (picture->picture_structure == PICT_TOP_FIELD &&
-	     picture->top_field_first) ||
-	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
-	     !picture->top_field_first)) {
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME ||
+	    pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD &&
+	     pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST) ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD &&
+	     !(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST))) {
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) {
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD) {
 		vdpu_write_relaxed(vpu, current_addr, G1_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, G1_REG_REFER1_BASE);
 	}
@@ -157,8 +153,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -169,8 +165,8 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	reg = G1_REG_DEC_AXI_RD_ID(0) |
 	      G1_REG_DEC_TIMEOUT_E(1) |
@@ -190,11 +186,11 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = G1_REG_DEC_MODE(5) |
 	      G1_REG_RLC_MODE_E(0) |
-	      G1_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      G1_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      G1_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      G1_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      G1_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      G1_REG_PIC_INTERLACE_E(!(seq->flags & V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE)) |
+	      G1_REG_PIC_FIELDMODE_E(pic->picture_structure != V4L2_MPEG2_PIC_FRAME) |
+	      G1_REG_PIC_B_E(pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) |
+	      G1_REG_PIC_INTER_E(pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_I) |
+	      G1_REG_PIC_TOPFIELD_E(pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) |
 	      G1_REG_FWD_INTERLACE_E(0) |
 	      G1_REG_FILTERING_DIS(1) |
 	      G1_REG_WRITE_MVS_E(0) |
@@ -203,27 +199,27 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = G1_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
 	      G1_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
-	      G1_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      G1_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	      G1_REG_ALT_SCAN_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      G1_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(4));
 
 	reg = G1_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      G1_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      G1_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      G1_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      G1_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      G1_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	      G1_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
+	      G1_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
+	      G1_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
+	      G1_REG_INTRA_VLC_TAB(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC) |
+	      G1_REG_FRAME_PRED_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(5));
 
 	reg = G1_REG_INIT_QP(1) |
 	      G1_REG_STREAM_LEN(slice_params->bit_size >> 3);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(6));
 
-	reg = G1_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
-	      G1_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
-	      G1_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
-	      G1_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
-	      G1_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	reg = G1_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      G1_REG_FCODE_FWD_HOR(pic->f_code[0][0]) |
+	      G1_REG_FCODE_FWD_VER(pic->f_code[0][1]) |
+	      G1_REG_FCODE_BWD_HOR(pic->f_code[1][0]) |
+	      G1_REG_FCODE_BWD_VER(pic->f_code[1][1]) |
 	      G1_REG_MV_ACCURACY_FWD(1) |
 	      G1_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, G1_SWREG(18));
@@ -239,7 +235,7 @@ void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	hantro_g1_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					&dst_buf->vb2_buf,
-					sequence, picture, slice_params);
+					seq, pic, slice_params);
 
 	hantro_end_prepare_run(ctx);
 
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
index 61a54549774d..ff54398f6643 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw_mpeg2_dec.c
@@ -79,10 +79,6 @@
 #define VDPU_REG_MV_ACCURACY_FWD(v)	((v) ? BIT(2) : 0)
 #define VDPU_REG_MV_ACCURACY_BWD(v)	((v) ? BIT(1) : 0)
 
-#define PICT_TOP_FIELD     1
-#define PICT_BOTTOM_FIELD  2
-#define PICT_FRAME         3
-
 static void
 rk3399_vpu_mpeg2_dec_set_quantisation(struct hantro_dev *vpu,
 				      struct hantro_ctx *ctx)
@@ -99,19 +95,19 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 				 struct hantro_ctx *ctx,
 				 struct vb2_buffer *src_buf,
 				 struct vb2_buffer *dst_buf,
-				 const struct v4l2_mpeg2_sequence *sequence,
-				 const struct v4l2_mpeg2_picture *picture,
+				 const struct v4l2_mpeg2_sequence *seq,
+				 const struct v4l2_mpeg2_picture *pic,
 				 const struct v4l2_ctrl_mpeg2_slice_params *slice_params)
 {
 	dma_addr_t forward_addr = 0, backward_addr = 0;
 	dma_addr_t current_addr, addr;
 
-	switch (picture->picture_coding_type) {
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_B:
+	switch (pic->picture_coding_type) {
+	case V4L2_MPEG2_PIC_CODING_TYPE_B:
 		backward_addr = hantro_get_ref(ctx,
 					       slice_params->backward_ref_ts);
 		fallthrough;
-	case V4L2_MPEG2_PICTURE_CODING_TYPE_P:
+	case V4L2_MPEG2_PIC_CODING_TYPE_P:
 		forward_addr = hantro_get_ref(ctx,
 					      slice_params->forward_ref_ts);
 	}
@@ -124,7 +120,7 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 	addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	current_addr = addr;
 
-	if (picture->picture_structure == PICT_BOTTOM_FIELD)
+	if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD)
 		addr += ALIGN(ctx->dst_fmt.width, 16);
 	vdpu_write_relaxed(vpu, addr, VDPU_REG_DEC_OUT_BASE);
 
@@ -134,18 +130,18 @@ rk3399_vpu_mpeg2_dec_set_buffers(struct hantro_dev *vpu,
 		backward_addr = current_addr;
 
 	/* Set forward ref frame (top/bottom field) */
-	if (picture->picture_structure == PICT_FRAME ||
-	    picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B ||
-	    (picture->picture_structure == PICT_TOP_FIELD &&
-	     picture->top_field_first) ||
-	    (picture->picture_structure == PICT_BOTTOM_FIELD &&
-	     !picture->top_field_first)) {
+	if (pic->picture_structure == V4L2_MPEG2_PIC_FRAME ||
+	    pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD &&
+	     pic->flags & V4L2_MPEG2_PIC_TOP_FIELD) ||
+	    (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD &&
+	     !(pic->flags & V4L2_MPEG2_PIC_TOP_FIELD))) {
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_TOP_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) {
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER1_BASE);
-	} else if (picture->picture_structure == PICT_BOTTOM_FIELD) {
+	} else if (pic->picture_structure == V4L2_MPEG2_PIC_BOTTOM_FIELD) {
 		vdpu_write_relaxed(vpu, current_addr, VDPU_REG_REFER0_BASE);
 		vdpu_write_relaxed(vpu, forward_addr, VDPU_REG_REFER1_BASE);
 	}
@@ -160,8 +156,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	u32 reg;
 
 	src_buf = hantro_get_src_buf(ctx);
@@ -171,8 +167,8 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	slice_params = hantro_get_ctrl(ctx,
 				       V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS);
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	reg = VDPU_REG_DEC_ADV_PRE_DIS(0) |
 	      VDPU_REG_DEC_SCMD_DIS(0) |
@@ -207,11 +203,11 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(56));
 
 	reg = VDPU_REG_RLC_MODE_E(0) |
-	      VDPU_REG_PIC_INTERLACE_E(!sequence->progressive_sequence) |
-	      VDPU_REG_PIC_FIELDMODE_E(picture->picture_structure != PICT_FRAME) |
-	      VDPU_REG_PIC_B_E(picture->picture_coding_type == V4L2_MPEG2_PICTURE_CODING_TYPE_B) |
-	      VDPU_REG_PIC_INTER_E(picture->picture_coding_type != V4L2_MPEG2_PICTURE_CODING_TYPE_I) |
-	      VDPU_REG_PIC_TOPFIELD_E(picture->picture_structure == PICT_TOP_FIELD) |
+	      VDPU_REG_PIC_INTERLACE_E(!(seq->flags & V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE)) |
+	      VDPU_REG_PIC_FIELDMODE_E(pic->picture_structure != V4L2_MPEG2_PIC_FRAME) |
+	      VDPU_REG_PIC_B_E(pic->picture_coding_type == V4L2_MPEG2_PIC_CODING_TYPE_B) |
+	      VDPU_REG_PIC_INTER_E(pic->picture_coding_type != V4L2_MPEG2_PIC_CODING_TYPE_I) |
+	      VDPU_REG_PIC_TOPFIELD_E(pic->picture_structure == V4L2_MPEG2_PIC_TOP_FIELD) |
 	      VDPU_REG_FWD_INTERLACE_E(0) |
 	      VDPU_REG_WRITE_MVS_E(0) |
 	      VDPU_REG_DEC_TIMEOUT_E(1) |
@@ -220,23 +216,23 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	reg = VDPU_REG_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
 	      VDPU_REG_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |
-	      VDPU_REG_ALT_SCAN_E(picture->alternate_scan) |
-	      VDPU_REG_TOPFIELDFIRST_E(picture->top_field_first);
+	      VDPU_REG_ALT_SCAN_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      VDPU_REG_TOPFIELDFIRST_E(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(120));
 
 	reg = VDPU_REG_STRM_START_BIT(slice_params->data_bit_offset) |
-	      VDPU_REG_QSCALE_TYPE(picture->q_scale_type) |
-	      VDPU_REG_CON_MV_E(picture->concealment_motion_vectors) |
-	      VDPU_REG_INTRA_DC_PREC(picture->intra_dc_precision) |
-	      VDPU_REG_INTRA_VLC_TAB(picture->intra_vlc_format) |
-	      VDPU_REG_FRAME_PRED_DCT(picture->frame_pred_frame_dct);
+	      VDPU_REG_QSCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE) |
+	      VDPU_REG_CON_MV_E(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV) |
+	      VDPU_REG_INTRA_DC_PREC(pic->intra_dc_precision) |
+	      VDPU_REG_INTRA_VLC_TAB(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC) |
+	      VDPU_REG_FRAME_PRED_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(122));
 
-	reg = VDPU_REG_ALT_SCAN_FLAG_E(picture->alternate_scan) |
-	      VDPU_REG_FCODE_FWD_HOR(picture->f_code[0][0]) |
-	      VDPU_REG_FCODE_FWD_VER(picture->f_code[0][1]) |
-	      VDPU_REG_FCODE_BWD_HOR(picture->f_code[1][0]) |
-	      VDPU_REG_FCODE_BWD_VER(picture->f_code[1][1]) |
+	reg = VDPU_REG_ALT_SCAN_FLAG_E(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN) |
+	      VDPU_REG_FCODE_FWD_HOR(pic->f_code[0][0]) |
+	      VDPU_REG_FCODE_FWD_VER(pic->f_code[0][1]) |
+	      VDPU_REG_FCODE_BWD_HOR(pic->f_code[1][0]) |
+	      VDPU_REG_FCODE_BWD_VER(pic->f_code[1][1]) |
 	      VDPU_REG_MV_ACCURACY_FWD(1) |
 	      VDPU_REG_MV_ACCURACY_BWD(1);
 	vdpu_write_relaxed(vpu, reg, VDPU_SWREG(136));
@@ -245,7 +241,7 @@ void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx)
 
 	rk3399_vpu_mpeg2_dec_set_buffers(vpu, ctx, &src_buf->vb2_buf,
 					 &dst_buf->vb2_buf,
-					 sequence, picture, slice_params);
+					 seq, pic, slice_params);
 
 	/* Kick the watchdog and start decoding */
 	hantro_end_prepare_run(ctx);
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
index e3154f631858..e39a17d28c7d 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_mpeg2.c
@@ -51,8 +51,8 @@ static void cedrus_mpeg2_irq_disable(struct cedrus_ctx *ctx)
 static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 {
 	const struct v4l2_ctrl_mpeg2_slice_params *slice_params;
-	const struct v4l2_mpeg2_sequence *sequence;
-	const struct v4l2_mpeg2_picture *picture;
+	const struct v4l2_mpeg2_sequence *seq;
+	const struct v4l2_mpeg2_picture *pic;
 	const struct v4l2_ctrl_mpeg2_quantisation *quantisation;
 	dma_addr_t src_buf_addr, dst_luma_addr, dst_chroma_addr;
 	dma_addr_t fwd_luma_addr, fwd_chroma_addr;
@@ -66,8 +66,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	u32 reg;
 
 	slice_params = run->mpeg2.slice_params;
-	sequence = &slice_params->sequence;
-	picture = &slice_params->picture;
+	seq = &slice_params->sequence;
+	pic = &slice_params->picture;
 
 	quantisation = run->mpeg2.quantisation;
 
@@ -94,19 +94,19 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set MPEG picture header. */
 
-	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(picture->picture_coding_type);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 0, picture->f_code[0][0]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 1, picture->f_code[0][1]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 0, picture->f_code[1][0]);
-	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, picture->f_code[1][1]);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(picture->intra_dc_precision);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(picture->picture_structure);
-	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(picture->top_field_first);
-	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(picture->frame_pred_frame_dct);
-	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(picture->concealment_motion_vectors);
-	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(picture->q_scale_type);
-	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(picture->intra_vlc_format);
-	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(picture->alternate_scan);
+	reg = VE_DEC_MPEG_MP12HDR_SLICE_TYPE(pic->picture_coding_type);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 0, pic->f_code[0][0]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(0, 1, pic->f_code[0][1]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 0, pic->f_code[1][0]);
+	reg |= VE_DEC_MPEG_MP12HDR_F_CODE(1, 1, pic->f_code[1][1]);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_DC_PRECISION(pic->intra_dc_precision);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_PICTURE_STRUCTURE(pic->picture_structure);
+	reg |= VE_DEC_MPEG_MP12HDR_TOP_FIELD_FIRST(pic->flags & V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST);
+	reg |= VE_DEC_MPEG_MP12HDR_FRAME_PRED_FRAME_DCT(pic->flags & V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT);
+	reg |= VE_DEC_MPEG_MP12HDR_CONCEALMENT_MOTION_VECTORS(pic->flags & V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV);
+	reg |= VE_DEC_MPEG_MP12HDR_Q_SCALE_TYPE(pic->flags & V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE);
+	reg |= VE_DEC_MPEG_MP12HDR_INTRA_VLC_FORMAT(pic->flags & V4L2_MPEG2_PIC_FLAG_INTRA_VLC);
+	reg |= VE_DEC_MPEG_MP12HDR_ALTERNATE_SCAN(pic->flags & V4L2_MPEG2_PIC_FLAG_ALT_SCAN);
 	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_FORWARD_VECTOR(0);
 	reg |= VE_DEC_MPEG_MP12HDR_FULL_PEL_BACKWARD_VECTOR(0);
 
@@ -114,8 +114,8 @@ static void cedrus_mpeg2_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 
 	/* Set frame dimensions. */
 
-	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(sequence->horizontal_size);
-	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(sequence->vertical_size);
+	reg = VE_DEC_MPEG_PICCODEDSIZE_WIDTH(seq->horizontal_size);
+	reg |= VE_DEC_MPEG_PICCODEDSIZE_HEIGHT(seq->vertical_size);
 
 	cedrus_write(dev, VE_DEC_MPEG_PICCODEDSIZE, reg);
 
diff --git a/include/media/mpeg2-ctrls.h b/include/media/mpeg2-ctrls.h
index 8ea2c7f3a172..d3190979d574 100644
--- a/include/media/mpeg2-ctrls.h
+++ b/include/media/mpeg2-ctrls.h
@@ -18,10 +18,7 @@
 #define V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS 0x0103
 #define	V4L2_CTRL_TYPE_MPEG2_QUANTISATION 0x0104
 
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_I	1
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_P	2
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_B	3
-#define V4L2_MPEG2_PICTURE_CODING_TYPE_D	4
+#define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE		0x0001
 
 struct v4l2_mpeg2_sequence {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence header */
@@ -31,10 +28,29 @@ struct v4l2_mpeg2_sequence {
 
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Sequence extension */
 	__u16	profile_and_level_indication;
-	__u8	progressive_sequence;
 	__u8	chroma_format;
+
+	__u32	flags;
 };
 
+#define V4L2_MPEG2_PIC_CODING_TYPE_I			1
+#define V4L2_MPEG2_PIC_CODING_TYPE_P			2
+#define V4L2_MPEG2_PIC_CODING_TYPE_B			3
+#define V4L2_MPEG2_PIC_CODING_TYPE_D			4
+
+#define V4L2_MPEG2_PIC_TOP_FIELD			0x1
+#define V4L2_MPEG2_PIC_BOTTOM_FIELD			0x2
+#define V4L2_MPEG2_PIC_FRAME				0x3
+
+#define V4L2_MPEG2_PIC_FLAG_TOP_FIELD_FIRST		0x0001
+#define V4L2_MPEG2_PIC_FLAG_FRAME_PRED_DCT		0x0002
+#define V4L2_MPEG2_PIC_FLAG_CONCEALMENT_MV		0x0004
+#define V4L2_MPEG2_PIC_FLAG_Q_SCALE_TYPE		0x0008
+#define V4L2_MPEG2_PIC_FLAG_INTRA_VLC			0x0010
+#define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
+#define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
+#define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
+
 struct v4l2_mpeg2_picture {
 	/* ISO/IEC 13818-2, ITU-T Rec. H.262: Picture header */
 	__u8	picture_coding_type;
@@ -43,14 +59,8 @@ struct v4l2_mpeg2_picture {
 	__u8	f_code[2][2];
 	__u8	intra_dc_precision;
 	__u8	picture_structure;
-	__u8	top_field_first;
-	__u8	frame_pred_frame_dct;
-	__u8	concealment_motion_vectors;
-	__u8	q_scale_type;
-	__u8	intra_vlc_format;
-	__u8	alternate_scan;
-	__u8	repeat_first_field;
-	__u16	progressive_frame;
+
+	__u32	flags;
 };
 
 struct v4l2_ctrl_mpeg2_slice_params {
-- 
2.30.0

