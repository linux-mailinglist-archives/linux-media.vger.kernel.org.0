Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3900C1388BF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 00:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387492AbgALXZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 18:25:28 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:19561 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387484AbgALXZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 18:25:28 -0500
X-Halon-ID: cee40af9-3592-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id cee40af9-3592-11ea-a00b-005056917a89;
        Mon, 13 Jan 2020 00:25:26 +0100 (CET)
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
Subject: [PATCH v3 5/5] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Mon, 13 Jan 2020 00:24:58 +0100
Message-Id: <20200112232458.2844506-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
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
index 2f6b5bee39898715..e2f48f4c61245309 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -843,28 +843,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
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
@@ -931,10 +909,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
 	.vidioc_s_fmt_vid_out_mplane = imgu_vidioc_s_fmt,
 	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
 
-	.vidioc_enum_output = imgu_vidioc_enum_output,
-
-	.vidioc_enum_input = imgu_vidioc_enum_input,
-
 	/* buffer queue management */
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -986,7 +960,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 
 	switch (node) {
 	case IMGU_NODE_IN:
-		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE;
+		cap = V4L2_CAP_VIDEO_OUTPUT_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 		break;
@@ -1005,7 +979,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		imgu_css_meta_fmt_set(&f->fmt.meta);
 		break;
 	default:
-		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+		cap = V4L2_CAP_VIDEO_CAPTURE_MPLANE | V4L2_CAP_IO_MC;
 		f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
-- 
2.24.1

