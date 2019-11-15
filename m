Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6E1FE8F0
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbfKOX5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:20 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:51352 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727474AbfKOX5T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:19 -0500
X-Halon-ID: a5ba84a9-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a5ba84a9-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:16 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 6/6] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Sat, 16 Nov 2019 00:55:59 +0100
Message-Id: <20191115235559.806041-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
enum input and output callbacks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 30 ++------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 5f8ad5996aa37db4..bae0f7212e640ee2 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -845,28 +845,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
 	return 0;
 }
 
-static int imgu_vidioc_enum_input(struct file *file, void *fh,
-				  struct v4l2_input *input)
-{
-	if (input->index > 0)
-		return -EINVAL;
-	strscpy(input->name, "camera", sizeof(input->name));
-	input->type = V4L2_INPUT_TYPE_CAMERA;
-
-	return 0;
-}
-
-static int imgu_vidioc_enum_output(struct file *file, void *fh,
-				   struct v4l2_output *output)
-{
-	if (output->index > 0)
-		return -EINVAL;
-	strscpy(output->name, "camera", sizeof(output->name));
-	output->type = V4L2_INPUT_TYPE_CAMERA;
-
-	return 0;
-}
-
 /******************** function pointers ********************/
 
 static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
@@ -939,10 +917,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
 	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
 	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
 
-	.vidioc_enum_output = imgu_vidioc_enum_output,
-
-	.vidioc_enum_input = imgu_vidioc_enum_input,
-
 	/* buffer queue management */
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -1032,7 +1006,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 
 	switch (node) {
 	case IMGU_NODE_IN:
-		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
+		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 		break;
@@ -1051,7 +1025,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		imgu_css_meta_fmt_set(&f->fmt.meta);
 		break;
 	default:
-		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
-- 
2.24.0

