Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAA94C8A14
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 11:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbiCAK4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 05:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbiCAK4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 05:56:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40D08BF0C
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 02:56:12 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60AC2A67;
        Tue,  1 Mar 2022 11:56:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646132171;
        bh=Hfqvdv678bdi33zolPb9iaZVz7nZ40uvAeCV4rlsjFk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XmPfyeMZBPNX7KRiSMysOL3cwZV60z7pLFHTXu2zAFgO1IjWJL+qOCKlWuaM6Hg8T
         EqqeUb18PVEav2GqIjtpBGfn5q3Imbs0Fk3pK1mWmoZQvb4vz1+uyUWRU0MKAPBI2J
         +N/uotBGkBonzDF8GN/ELS8ovUYMW8U31NDJoaKg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 3/6] media: subdev: pass also the active state to subdevs from ioctls
Date:   Tue,  1 Mar 2022 12:55:45 +0200
Message-Id: <20220301105548.305191-4-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
v4l2_subdev_lock_and_return_state() helper, introduced in a follow up
patch.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 64 ++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 11a06e0aca0c..b67bbce82612 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -345,6 +345,44 @@ const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
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
+	case VIDIOC_SUBDEV_G_FMT:
+	case VIDIOC_SUBDEV_S_FMT:
+		which = ((struct v4l2_subdev_format *)arg)->which;
+		break;
+	case VIDIOC_SUBDEV_G_CROP:
+	case VIDIOC_SUBDEV_S_CROP:
+		which = ((struct v4l2_subdev_crop *)arg)->which;
+		break;
+	case VIDIOC_SUBDEV_ENUM_MBUS_CODE:
+		which = ((struct v4l2_subdev_mbus_code_enum *)arg)->which;
+		break;
+	case VIDIOC_SUBDEV_ENUM_FRAME_SIZE:
+		which = ((struct v4l2_subdev_frame_size_enum *)arg)->which;
+		break;
+	case VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL:
+		which = ((struct v4l2_subdev_frame_interval_enum *)arg)->which;
+		break;
+	case VIDIOC_SUBDEV_G_SELECTION:
+	case VIDIOC_SUBDEV_S_SELECTION:
+		which = ((struct v4l2_subdev_selection *)arg)->which;
+		break;
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
@@ -352,8 +390,11 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
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
@@ -476,7 +517,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
+		return v4l2_subdev_call(sd, pad, get_fmt, state, format);
 	}
 
 	case VIDIOC_SUBDEV_S_FMT: {
@@ -487,7 +528,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(format->reserved, 0, sizeof(format->reserved));
 		memset(format->format.reserved, 0, sizeof(format->format.reserved));
-		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
+		return v4l2_subdev_call(sd, pad, set_fmt, state, format);
 	}
 
 	case VIDIOC_SUBDEV_G_CROP: {
@@ -501,7 +542,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.target = V4L2_SEL_TGT_CROP;
 
 		rval = v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->state, &sel);
+			sd, pad, get_selection, state, &sel);
 
 		crop->rect = sel.r;
 
@@ -523,7 +564,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		sel.r = crop->rect;
 
 		rval = v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->state, &sel);
+			sd, pad, set_selection, state, &sel);
 
 		crop->rect = sel.r;
 
@@ -534,7 +575,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_mbus_code_enum *code = arg;
 
 		memset(code->reserved, 0, sizeof(code->reserved));
-		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_mbus_code, state,
 					code);
 	}
 
@@ -542,7 +583,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_size_enum *fse = arg;
 
 		memset(fse->reserved, 0, sizeof(fse->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_frame_size, state,
 					fse);
 	}
 
@@ -567,7 +608,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 		struct v4l2_subdev_frame_interval_enum *fie = arg;
 
 		memset(fie->reserved, 0, sizeof(fie->reserved));
-		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
+		return v4l2_subdev_call(sd, pad, enum_frame_interval, state,
 					fie);
 	}
 
@@ -576,7 +617,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, get_selection, subdev_fh->state, sel);
+			sd, pad, get_selection, state, sel);
 	}
 
 	case VIDIOC_SUBDEV_S_SELECTION: {
@@ -587,7 +628,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
 
 		memset(sel->reserved, 0, sizeof(sel->reserved));
 		return v4l2_subdev_call(
-			sd, pad, set_selection, subdev_fh->state, sel);
+			sd, pad, set_selection, state, sel);
 	}
 
 	case VIDIOC_G_EDID: {
@@ -821,10 +862,13 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
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

