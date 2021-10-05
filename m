Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44997422165
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbhJEJAK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhJEJAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982A2C061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:58:18 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66398E1E;
        Tue,  5 Oct 2021 10:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424297;
        bh=6yA7Wx3cOoYju5YADq+uqxHNA2+oI29xIN7IIUxpTaQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o+WKnqy8jg6evvMmqWvZ9BOvZj6rP82+GYmiHIpYH91nHiF6/UNIN7hmyfQRRq/aq
         PTOuc0L6E74+X1XhHx/kJT3kVUiGcAtXolN54+dXQE/plPFeC/VWBUoyqpdca2FYEC
         s9c79plZWjZlAkEbXtg+tTGJKNpD/ACGoWP2TH8k=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 03/36] media: subdev: pass also the active state to subdevs from ioctls
Date:   Tue,  5 Oct 2021 11:57:17 +0300
Message-Id: <20211005085750.138151-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At the moment when a subdev op is called, the TRY subdev state
(subdev_fh->state) is passed as a parameter even for ACTIVE case, or
alternatively a NULL can be passed for ACTIVE case. This used to make
sense, as the ACTIVE state was handled internally by the subdev drivers.

We now have a state for ACTIVE case in a standard place, and can pass
that alto to the drivers. This patch changes the subdev ioctls to either
pass the TRY or ACTIVE state to the subdev.

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
---
 drivers/media/v4l2-core/v4l2-subdev.c | 73 +++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index bcaf66a1e3d9..aa757cc28879 100644
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

