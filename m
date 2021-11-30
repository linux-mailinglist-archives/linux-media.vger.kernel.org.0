Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18F4463653
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237427AbhK3OUI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:08 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242046AbhK3OT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:57 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22A13144E;
        Tue, 30 Nov 2021 15:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281795;
        bh=7L9LV8fY/q38axcbUdEIYudO93K63HyoDaxLyp60Csc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o/9pYOXYZfbqU2ATKHuNRA61kSt0yG/4Vsq/rJsEv+Dqxj4unw9k9FAAr+3UdF9Sq
         jd9p8tjn2Pj90yofkDTH5h/1O8b+qPdTZKnN4Qj6TdkqYmemXBxXd+WcFJQzBBR/Pn
         5eaRaQoTwlN+vhNUDaxWMAgd7d1p8sQZC4KQMuD4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 03/38] media: subdev: pass also the active state to subdevs from ioctls
Date:   Tue, 30 Nov 2021 16:15:01 +0200
Message-Id: <20211130141536.891878-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At the moment when a subdev op is called, the TRY subdev state
(subdev_fh->state) is passed as a parameter even for the ACTIVE case, or
alternatively a NULL can be passed for ACTIVE case. This used to make
sense, as the ACTIVE state was handled internally by the subdev drivers.

We now have a state for the ACTIVE case in a standard place, and can
pass that also to the drivers. This patch changes the subdev ioctls to
either pass the TRY or ACTIVE state to the subdev.

Unfortunately many drivers call ops from other subdevs, and implicitly
pass NULL as the state, so this is just a partial solution. A coccinelle
spatch could perhaps be created which fixes the drivers' subdev calls.

For all current upstream drivers this doesn't matter, as they do not
expect to get a valid state for ACTIVE case. But future drivers which
support multiplexed streaming and routing will depend on getting a state
for both active and try cases.

For new drivers we can mandate that the pipelines where the drivers are
used need to pass the state properly, or preferably, not call such
subdev ops at all.

However, if an existing subdev driver is changed to support multiplexed
streams, the driver has to consider cases where its ops will be called
with NULL state. The problem can easily be solved by using the
v4l2_subdev_validate_and_lock_state() helper, introduced in a follow up
patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index de160140d63b..3289875d9ec1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -353,6 +353,53 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
 EXPORT_SYMBOL(v4l2_subdev_call_wrappers);
 
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
+
+static struct v4l2_subdev_state *
+subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
+		       unsigned int cmd, void *arg)
+{
+	u32 which;
+
+	switch (cmd) {
+	default:
+		return NULL;
+
+	case VIDIOC_SUBDEV_G_FMT:
+	case VIDIOC_SUBDEV_S_FMT: {
+		which = ((struct v4l2_subdev_format *)arg)->which;
+		break;
+	}
+	case VIDIOC_SUBDEV_G_CROP:
+	case VIDIOC_SUBDEV_S_CROP: {
+		which = ((struct v4l2_subdev_crop *)arg)->which;
+		break;
+	}
+	case VIDIOC_SUBDEV_ENUM_MBUS_CODE: {
+		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
+		break;
+	}
+	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE: {
+		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
+		break;
+	}
+
+	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL: {
+		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
+		break;
+	}
+
+	case VIDIOC_SUBDEV_G_SELECTION:
+	case VIDIOC_SUBDEV_S_SELECTION: {
+		which = ((struct v4l2_subdev_selection *)arg)->which;
+		break;
+	}
+	}
+
+	return which == V4L2_SUBDEV_FORMAT_TRY ?
+			     subdev_fh->state :
+			     v4l2_subdev_get_active_state(sd);
+}
+
 static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 {
 	struct video_device *vdev = video_devdata(file);
@@ -360,8 +407,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 	struct v4l2_fh *vfh = file->private_data;
 	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
+	struct v4l2_subdev_state *state;
 	int rval;
 
+	state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
+
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
@@ -484,7 +534,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -495,7 +545,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -509,7 +559,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->state, &sel);
+			sd, pad, get_selection, state, &sel);
 
 		crop->rect = sel.r;
 
@@ -531,7 +581,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.r = crop->rect;
 
 		rval = v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->state, &sel);
+			sd, pad, set_selection, state, &sel);
 
 		crop->rect = sel.r;
 
@@ -542,7 +592,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
 		memset(code->reserved, 0, sizeof(code->reserved));
-		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
 					code);
 	}
 
@@ -550,7 +600,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
 		memset(fse->reserved, 0, sizeof(fse->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
 					fse);
 	}
 
@@ -575,7 +625,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
 		memset(fie->reserved, 0, sizeof(fie->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
 					fie);
 	}
 
@@ -584,7 +634,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->state, sel);
+			sd, pad, get_selection, state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -595,7 +645,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->state, sel);
+			sd, pad, set_selection, state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -829,10 +879,13 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
 		struct v4l2_subdev *sd =
 			media_entity_to_v4l2_subdev(pad->entity);
+		struct v4l2_subdev_state *state;
+
+		state = v4l2_subdev_get_active_state(sd);
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
-		return v4l2_subdev_call(sd, pad, get_fmt, NULL, fmt);
+		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
 	}
 
 	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
-- 
2.25.1

