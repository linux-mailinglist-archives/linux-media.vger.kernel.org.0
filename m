Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7D75189CEA
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgCRNZs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:25:48 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:61950 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727090AbgCRNZr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:25:47 -0400
X-Halon-ID: e4da576f-691b-11ea-9f40-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id e4da576f-691b-11ea-9f40-0050569116f7;
        Wed, 18 Mar 2020 14:25:11 +0100 (CET)
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
Subject: [PATCH v5 3/4] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
Date:   Wed, 18 Mar 2020 14:25:12 +0100
Message-Id: <20200318132513.3089234-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318132513.3089234-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200318132513.3089234-1-niklas.soderlund+renesas@ragnatech.se>
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

---
* Changes since v4
- Set V4L2_CAP_IO_MC for all nodes unconditionally. The framework will
  disallow them for V4L2_CAP_META_* nodes.
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 58 +-------------------------
 1 file changed, 1 insertion(+), 57 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 09c8ede1457cad96..65332a0cb8bc93d1 100644
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
@@ -1086,7 +1030,7 @@ static void imgu_node_to_v4l2(u32 node, struct video_device *vdev,
 		vdev->ioctl_ops = &imgu_v4l2_ioctl_ops;
 	}
 
-	vdev->device_caps = V4L2_CAP_STREAMING | cap;
+	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC | cap;
 }
 
 static int imgu_v4l2_subdev_register(struct imgu_device *imgu,
-- 
2.25.1

