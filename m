Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B0517C32B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2020 17:40:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCFQk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Mar 2020 11:40:26 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:31402 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726300AbgCFQkZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Mar 2020 11:40:25 -0500
X-Halon-ID: 28463a20-5fc9-11ea-aa6d-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 28463a20-5fc9-11ea-aa6d-005056917f90;
        Fri, 06 Mar 2020 17:40:16 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 3/3] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Fri,  6 Mar 2020 17:39:35 +0100
Message-Id: <20200306163935.805333-4-niklas.soderlund@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
vidioc_enum_{input,output}, vidioc_g_{input,output} and
vidioc_s_{input,output} callbacks.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 60 +-------------------------
 1 file changed, 2 insertions(+), 58 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 09c8ede1457cad96..2c42be3d995621e3 100644
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
2.25.1

