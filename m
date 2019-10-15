Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A7BD78C6
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732824AbfJOOhF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:37:05 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:58381 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732807AbfJOOhE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:37:04 -0400
X-Halon-ID: 0f0ca5d2-ef59-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0f0ca5d2-ef59-11e9-837a-0050569116f7;
        Tue, 15 Oct 2019 16:35:40 +0200 (CEST)
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
Subject: [PATCH 3/3] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Tue, 15 Oct 2019 16:35:52 +0200
Message-Id: <20191015143552.317669-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
enum, get and set input callbacks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 60 +-------------------------
 1 file changed, 2 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed4343a2a..bae0f7212e640ee2 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -845,54 +845,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
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
-static int imgu_vidioc_g_input(struct file *file, void *fh, unsigned int *input)
-{
-	*input = 0;
-
-	return 0;
-}
-
-static int imgu_vidioc_s_input(struct file *file, void *fh, unsigned int input)
-{
-	return input == 0 ? 0 : -EINVAL;
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
-static int imgu_vidioc_g_output(struct file *file, void *fh,
-				unsigned int *output)
-{
-	*output = 0;
-
-	return 0;
-}
-
-static int imgu_vidioc_s_output(struct file *file, void *fh,
-				unsigned int output)
-{
-	return output == 0 ? 0 : -EINVAL;
-}
-
 /******************** function pointers ********************/
 
 static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
@@ -965,14 +917,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
 	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
 	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
 
-	.vidioc_enum_output = imgu_vidioc_enum_output,
-	.vidioc_g_output = imgu_vidioc_g_output,
-	.vidioc_s_output = imgu_vidioc_s_output,
-
-	.vidioc_enum_input = imgu_vidioc_enum_input,
-	.vidioc_g_input = imgu_vidioc_g_input,
-	.vidioc_s_input = imgu_vidioc_s_input,
-
 	/* buffer queue management */
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -1062,7 +1006,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 
 	switch (node) {
 	case IMGU_NODE_IN:
-		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
+		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 		break;
@@ -1081,7 +1025,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		imgu_css_meta_fmt_set(&f->fmt.meta);
 		break;
 	default:
-		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
-- 
2.23.0

