Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB3318A9FD
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 01:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgCSArR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 20:47:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47806 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbgCSArR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 20:47:17 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 712CAAE6;
        Thu, 19 Mar 2020 01:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584578833;
        bh=0rvvfbkeBrxMvufbcS/wmWXc3XdPpeEh5obb6mgcg8E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wPjLEB+S8jsox31RHeAnwVs1W8x6EvnzFqCqn+/l7r+ykZ8n9/8k19p9SP3gPKm1A
         Vul4GSldbZ1qspfBXSJNmJsmS4hC+G/1NKRzntOO4CRcvT8VrDcJjZvD0V4jTKVCgH
         jPidm01ILU5/7fcJ4JvUoTpaIwNZCNFkwCXRm++c=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 4/5] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Thu, 19 Mar 2020 02:47:00 +0200
Message-Id: <20200319004701.30416-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
References: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
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
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v5:

- Implement mbus_code filtering for format enumeration
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 64 +++-----------------------
 1 file changed, 7 insertions(+), 57 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 569e27b824c8..b39200fe90c9 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -597,6 +597,9 @@ static int enum_fmts(struct v4l2_fmtdesc *f, u32 type)
 {
 	unsigned int i, j;
 
+	if (f->mbus_code != 0 && f->mbus_code != MEDIA_BUS_FMT_FIXED)
+		return -EINVAL;
+
 	for (i = j = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (formats[i].type == type) {
 			if (j == f->index)
@@ -826,6 +829,9 @@ static int imgu_meta_enum_format(struct file *file, void *fh,
 	if (fmt->index > 0 || fmt->type != node->vbq.type)
 		return -EINVAL;
 
+	if (fmt->mbus_code != 0 && fmt->mbus_code != MEDIA_BUS_FMT_FIXED)
+		return -EINVAL;
+
 	strscpy(fmt->description, meta_fmts[i].name, sizeof(fmt->description));
 	fmt->pixelformat = meta_fmts[i].fourcc;
 
@@ -845,54 +851,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
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
@@ -965,14 +923,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
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
@@ -1086,7 +1036,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
 
-	vdev->device_caps = V4L2_CAP_STREAMING | cap;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | cap;
 }
 
 static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
-- 
Regards,

Laurent Pinchart

