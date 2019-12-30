Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC0112CC95
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2019 06:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbfL3FL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Dec 2019 00:11:58 -0500
Received: from mga12.intel.com ([192.55.52.136]:58464 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfL3FL6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Dec 2019 00:11:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Dec 2019 21:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,373,1571727600"; 
   d="scan'208";a="243763322"
Received: from ipu5-build.bj.intel.com ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 29 Dec 2019 21:11:57 -0800
From:   Bingbu Cao <bingbu.cao@intel.com>
To:     linux-media@vger.kernel.org
Cc:     sakari.ailus@linux.intel.com, tfiga@chromium.org,
        bingbu.cao@linux.intel.com
Subject: [PATCH] media: staging/intel-ipu3: make imgu use fixed running mode
Date:   Mon, 30 Dec 2019 13:17:04 +0800
Message-Id: <1577683024-25937-1-git-send-email-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the imgu running mode need user to set by v4l2 ctrl.
However, imgu only support 2 pipes and 2 operation modes - video and
still. This patch make the first imgu subdev running as video and second
one running as still, it will make the user understand easily, it can
also cover current camera use cases requirement. The running mode is set
during subdev registering, no race-condition after change, so it is safe
to change the mode data type to integer.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 Documentation/media/v4l-drivers/ipu3.rst        |  6 +--
 drivers/staging/media/ipu3/include/intel-ipu3.h |  4 --
 drivers/staging/media/ipu3/ipu3-v4l2.c          | 64 +++----------------------
 drivers/staging/media/ipu3/ipu3.h               |  4 +-
 4 files changed, 11 insertions(+), 67 deletions(-)

diff --git a/Documentation/media/v4l-drivers/ipu3.rst b/Documentation/media/v4l-drivers/ipu3.rst
index e4904ab44e60..50bd264a3408 100644
--- a/Documentation/media/v4l-drivers/ipu3.rst
+++ b/Documentation/media/v4l-drivers/ipu3.rst
@@ -234,9 +234,9 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
 Firmware binary selection
 -------------------------
 
-The firmware binary is selected using the V4L2_CID_INTEL_IPU3_MODE, currently
-defined in drivers/staging/media/ipu3/include/intel-ipu3.h . "VIDEO" and "STILL"
-modes are available.
+The firmware binary is selected according to the running mode of imgu. There are
+2 modes are available - "video" and "still". "ipu3-imgu video" are running under
+"video" mode and "ipu3-imgu still" is running under "still" mode.
 
 Processing the image in raw Bayer format
 ----------------------------------------
diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 08eaa0bad0de..d30d9d6c92db 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -12,10 +12,6 @@
 #define V4L2_META_FMT_IPU3_PARAMS	v4l2_fourcc('i', 'p', '3', 'p') /* IPU3 processing parameters */
 #define V4L2_META_FMT_IPU3_STAT_3A	v4l2_fourcc('i', 'p', '3', 's') /* IPU3 3A statistics */
 
-/* from include/uapi/linux/v4l2-controls.h */
-#define V4L2_CID_INTEL_IPU3_BASE	(V4L2_CID_USER_BASE + 0x10c0)
-#define V4L2_CID_INTEL_IPU3_MODE	(V4L2_CID_INTEL_IPU3_BASE + 1)
-
 /******************* ipu3_uapi_stats_3a *******************/
 
 #define IPU3_UAPI_MAX_STRIPES				2
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed434..4d9c3dde5036 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -67,8 +67,6 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
 
 	dev_dbg(dev, "%s %d for pipe %u", __func__, enable, pipe);
-	/* grab ctrl after streamon and return after off */
-	v4l2_ctrl_grab(imgu_sd->ctrl, enable);
 
 	if (!enable) {
 		imgu_sd->active = false;
@@ -96,7 +94,7 @@ static int imgu_subdev_s_stream(struct v4l2_subdev *sd, int enable)
 	if (imgu_pipe->nodes[IMGU_NODE_VF].enabled)
 		css_pipe->vf_output_en = true;
 
-	if (atomic_read(&imgu_sd->running_mode) == IPU3_RUNNING_MODE_VIDEO)
+	if (imgu_sd->running_mode == IPU3_RUNNING_MODE_VIDEO)
 		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_VIDEO;
 	else
 		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_CAPTURE;
@@ -668,7 +666,7 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 	if (imgu_pipe->nodes[IMGU_NODE_VF].enabled)
 		css_pipe->vf_output_en = true;
 
-	if (atomic_read(&imgu_sd->running_mode) == IPU3_RUNNING_MODE_VIDEO)
+	if (imgu_sd->running_mode == IPU3_RUNNING_MODE_VIDEO)
 		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_VIDEO;
 	else
 		css_pipe->pipe_id = IPU3_CSS_PIPE_ID_CAPTURE;
@@ -1011,44 +1009,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_meta_ioctl_ops = {
 	.vidioc_expbuf = vb2_ioctl_expbuf,
 };
 
-static int imgu_sd_s_ctrl(struct v4l2_ctrl *ctrl)
-{
-	struct imgu_v4l2_subdev *imgu_sd =
-		container_of(ctrl->handler, struct imgu_v4l2_subdev, ctrl_handler);
-	struct imgu_device *imgu = v4l2_get_subdevdata(&imgu_sd->subdev);
-	struct device *dev = &imgu->pci_dev->dev;
-
-	dev_dbg(dev, "set val %d to ctrl 0x%8x for subdev %u",
-		ctrl->val, ctrl->id, imgu_sd->pipe);
-
-	switch (ctrl->id) {
-	case V4L2_CID_INTEL_IPU3_MODE:
-		atomic_set(&imgu_sd->running_mode, ctrl->val);
-		return 0;
-	default:
-		return -EINVAL;
-	}
-}
-
-static const struct v4l2_ctrl_ops imgu_subdev_ctrl_ops = {
-	.s_ctrl = imgu_sd_s_ctrl,
-};
-
-static const char * const imgu_ctrl_mode_strings[] = {
-	"Video mode",
-	"Still mode",
-};
-
-static const struct v4l2_ctrl_config imgu_subdev_ctrl_mode = {
-	.ops = &imgu_subdev_ctrl_ops,
-	.id = V4L2_CID_INTEL_IPU3_MODE,
-	.name = "IPU3 Pipe Mode",
-	.type = V4L2_CTRL_TYPE_MENU,
-	.max = ARRAY_SIZE(imgu_ctrl_mode_strings) - 1,
-	.def = IPU3_RUNNING_MODE_VIDEO,
-	.qmenu = imgu_ctrl_mode_strings,
-};
-
 /******************** Framework registration ********************/
 
 /* helper function to config node's video properties */
@@ -1094,7 +1054,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 				     unsigned int pipe)
 {
 	int i, r;
-	struct v4l2_ctrl_handler *hdl = &imgu_sd->ctrl_handler;
 	struct imgu_media_pipe *imgu_pipe = &imgu->imgu_pipe[pipe];
 
 	/* Initialize subdev media entity */
@@ -1118,18 +1077,10 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 	imgu_sd->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
 				V4L2_SUBDEV_FL_HAS_EVENTS;
 	snprintf(imgu_sd->subdev.name, sizeof(imgu_sd->subdev.name),
-		 "%s %u", IMGU_NAME, pipe);
+		 "%s %s", IMGU_NAME, pipe ? "still" : "video");
 	v4l2_set_subdevdata(&imgu_sd->subdev, imgu);
-	atomic_set(&imgu_sd->running_mode, IPU3_RUNNING_MODE_VIDEO);
-	v4l2_ctrl_handler_init(hdl, 1);
-	imgu_sd->subdev.ctrl_handler = hdl;
-	imgu_sd->ctrl = v4l2_ctrl_new_custom(hdl, &imgu_subdev_ctrl_mode, NULL);
-	if (hdl->error) {
-		r = hdl->error;
-		dev_err(&imgu->pci_dev->dev,
-			"failed to create subdev v4l2 ctrl with err %d", r);
-		goto fail_subdev;
-	}
+	imgu_sd->running_mode =
+		pipe ? IPU3_RUNNING_MODE_STILL : IPU3_RUNNING_MODE_VIDEO;
 	r = v4l2_device_register_subdev(&imgu->v4l2_dev, &imgu_sd->subdev);
 	if (r) {
 		dev_err(&imgu->pci_dev->dev,
@@ -1141,7 +1092,6 @@ static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
 	return 0;
 
 fail_subdev:
-	v4l2_ctrl_handler_free(imgu_sd->subdev.ctrl_handler);
 	media_entity_cleanup(&imgu_sd->subdev.entity);
 
 	return r;
@@ -1236,8 +1186,8 @@ static int imgu_v4l2_node_setup(struct imgu_device *imgu, unsigned int pipe,
 	}
 
 	/* Initialize vdev */
-	snprintf(vdev->name, sizeof(vdev->name), "%s %u %s",
-		 IMGU_NAME, pipe, node->name);
+	snprintf(vdev->name, sizeof(vdev->name), "%s %s %s",
+		 IMGU_NAME, pipe ? "still" : "video", node->name);
 	vdev->release = video_device_release_empty;
 	vdev->fops = &imgu_v4l2_fops;
 	vdev->lock = &node->lock;
diff --git a/drivers/staging/media/ipu3/ipu3.h b/drivers/staging/media/ipu3/ipu3.h
index 73b123b2b8a2..63db6fe544ef 100644
--- a/drivers/staging/media/ipu3/ipu3.h
+++ b/drivers/staging/media/ipu3/ipu3.h
@@ -96,9 +96,7 @@ struct imgu_v4l2_subdev {
 		struct v4l2_rect bds; /* bayer-domain scaled resolution*/
 		struct v4l2_rect gdc; /* gdc output resolution */
 	} rect;
-	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_ctrl *ctrl;
-	atomic_t running_mode;
+	unsigned int running_mode;
 	bool active;
 };
 
-- 
2.7.4

