Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95ABD1B28AB
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729006AbgDUN56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:57:58 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:37919 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728974AbgDUN55 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:57:57 -0400
X-Halon-ID: 138ae39d-83d8-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 138ae39d-83d8-11ea-aeed-005056917f90;
        Tue, 21 Apr 2020 15:57:45 +0200 (CEST)
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
Subject: [PATCH v8 5/6] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Tue, 21 Apr 2020 15:57:42 +0200
Message-Id: <20200421135743.1381930-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index afbb4636e714d5b5..4dc8d9165f634325 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -605,6 +605,9 @@ static int enum_fmts(struct v4l2_fmtdesc *f, u32 type)
 {
 	unsigned int i, j;
 
+	if (f->mbus_code != 0 && f->mbus_code != MEDIA_BUS_FMT_FIXED)
+		return -EINVAL;
+
 	for (i = j = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (formats[i].type == type) {
 			if (j == f->index)
@@ -834,6 +837,9 @@ static int imgu_meta_enum_format(struct file *file, void *fh,
 	if (fmt->index > 0 || fmt->type != node->vbq.type)
 		return -EINVAL;
 
+	if (fmt->mbus_code != 0 && fmt->mbus_code != MEDIA_BUS_FMT_FIXED)
+		return -EINVAL;
+
 	strscpy(fmt->description, meta_fmts[i].name, sizeof(fmt->description));
 	fmt->pixelformat = meta_fmts[i].fourcc;
 
@@ -853,54 +859,6 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
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
@@ -973,14 +931,6 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
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
@@ -1094,7 +1044,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
 
-	vdev->device_caps = V4L2_CAP_STREAMING | cap;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | cap;
 }
 
 static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
-- 
2.26.0

