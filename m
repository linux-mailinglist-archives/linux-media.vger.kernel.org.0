Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E255A9389
	for <lists+linux-media@lfdr.de>; Thu,  1 Sep 2022 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233929AbiIAJrS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Sep 2022 05:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233859AbiIAJrN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Sep 2022 05:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAD5135D01
        for <linux-media@vger.kernel.org>; Thu,  1 Sep 2022 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662025629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ox1Bu0FNjD+kmQOn+R/DatFDfJmuzy3NaJBsCEUy68A=;
        b=ZScV0oUiT/6MpQttUMPlxHQegdXJ/4Ic20KF6tfvVBXcqq7sMkTf0DQUlaA9TCz+nueHfR
        5iTXIqZ/uBrJIs9iJrE7JIpsB4ebDZhy5u3XiKBY8l+nW7Di3eoOW5wuhsXxDIxkxpDHAa
        oGvu6b/bvzWtTFM7sdL3nhD4IvC3pEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-GlKT1qKcPVKM_rvpt9oERA-1; Thu, 01 Sep 2022 05:47:03 -0400
X-MC-Unique: GlKT1qKcPVKM_rvpt9oERA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48FCA8AD0B1;
        Thu,  1 Sep 2022 09:46:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D087540334C;
        Thu,  1 Sep 2022 09:46:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 03/14] media: atomisp: Remove atomisp_file_fops and atomisp_file_ioctl_ops
Date:   Thu,  1 Sep 2022 11:46:15 +0200
Message-Id: <20220901094626.11513-4-hdegoede@redhat.com>
In-Reply-To: <20220901094626.11513-1-hdegoede@redhat.com>
References: <20220901094626.11513-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After the file-injection support removal, atomisp_video_pipe->type never
is V4L2_BUF_TYPE_VIDEO_OUTPUT anymore, so the V4L2_BUF_TYPE_VIDEO_OUTPUT
support path in atomisp_video_init() is never hit and this path is
the only user of atomisp_file_fops and atomisp_file_ioctl_ops.

Remove atomisp_file_fops and atomisp_file_ioctl_ops and all of
the functions which are only referenced by these ops structs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  84 ------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |   1 -
 .../staging/media/atomisp/pci/atomisp_fops.c  |  20 ---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 122 ------------------
 .../staging/media/atomisp/pci/atomisp_ioctl.h |   4 -
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   6 -
 6 files changed, 237 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index db6465756e49..8313724f06b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -4906,41 +4906,6 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 	return 0;
 }
 
-static int
-atomisp_try_fmt_file(struct atomisp_device *isp, struct v4l2_format *f)
-{
-	u32 width = f->fmt.pix.width;
-	u32 height = f->fmt.pix.height;
-	u32 pixelformat = f->fmt.pix.pixelformat;
-	enum v4l2_field field = f->fmt.pix.field;
-	u32 depth;
-
-	if (!atomisp_get_format_bridge(pixelformat)) {
-		dev_err(isp->dev, "Wrong output pixelformat\n");
-		return -EINVAL;
-	}
-
-	depth = atomisp_get_pixel_depth(pixelformat);
-
-	if (field == V4L2_FIELD_ANY) {
-		field = V4L2_FIELD_NONE;
-	} else if (field != V4L2_FIELD_NONE) {
-		dev_err(isp->dev, "Wrong output field\n");
-		return -EINVAL;
-	}
-
-	f->fmt.pix.field = field;
-	f->fmt.pix.width = clamp_t(u32,
-				   rounddown(width, (u32)ATOM_ISP_STEP_WIDTH),
-				   ATOM_ISP_MIN_WIDTH, ATOM_ISP_MAX_WIDTH);
-	f->fmt.pix.height = clamp_t(u32, rounddown(height,
-				    (u32)ATOM_ISP_STEP_HEIGHT),
-				    ATOM_ISP_MIN_HEIGHT, ATOM_ISP_MAX_HEIGHT);
-	f->fmt.pix.bytesperline = (width * depth) >> 3;
-
-	return 0;
-}
-
 enum mipi_port_id __get_mipi_port(struct atomisp_device *isp,
 				  enum atomisp_camera_port port)
 {
@@ -6078,55 +6043,6 @@ int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 	return 0;
 }
 
-int atomisp_set_fmt_file(struct video_device *vdev, struct v4l2_format *f)
-{
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	struct atomisp_sub_device *asd = pipe->asd;
-	struct v4l2_mbus_framefmt ffmt = {0};
-	const struct atomisp_format_bridge *format_bridge;
-	struct v4l2_subdev_fh fh;
-	int ret;
-
-	if (!asd) {
-		dev_err(isp->dev, "%s(): asd is NULL, device is %s\n",
-			__func__, vdev->name);
-		return -EINVAL;
-	}
-
-	v4l2_fh_init(&fh.vfh, vdev);
-
-	dev_dbg(isp->dev, "setting fmt %ux%u 0x%x for file inject\n",
-		f->fmt.pix.width, f->fmt.pix.height, f->fmt.pix.pixelformat);
-	ret = atomisp_try_fmt_file(isp, f);
-	if (ret) {
-		dev_err(isp->dev, "atomisp_try_fmt_file err: %d\n", ret);
-		return ret;
-	}
-
-	format_bridge = atomisp_get_format_bridge(f->fmt.pix.pixelformat);
-	if (!format_bridge) {
-		dev_dbg(isp->dev, "atomisp_get_format_bridge err! fmt:0x%x\n",
-			f->fmt.pix.pixelformat);
-		return -EINVAL;
-	}
-
-	pipe->pix = f->fmt.pix;
-	atomisp_css_input_set_mode(asd, IA_CSS_INPUT_MODE_FIFO);
-	atomisp_css_input_configure_port(asd,
-					 __get_mipi_port(isp, ATOMISP_CAMERA_PORT_PRIMARY), 2, 0xffff4,
-					 0, 0, 0, 0);
-	ffmt.width = f->fmt.pix.width;
-	ffmt.height = f->fmt.pix.height;
-	ffmt.code = format_bridge->mbus_code;
-
-	atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
-				V4L2_SUBDEV_FORMAT_ACTIVE,
-				ATOMISP_SUBDEV_PAD_SINK, &ffmt);
-
-	return 0;
-}
-
 int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 			      struct atomisp_shading_table *user_shading_table)
 {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index ebc729468f87..ed1ad5389104 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -269,7 +269,6 @@ int atomisp_try_fmt(struct video_device *vdev, struct v4l2_pix_format *f,
 		    bool *res_overflow);
 
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f);
-int atomisp_set_fmt_file(struct video_device *vdev, struct v4l2_format *f);
 
 int atomisp_set_shading_table(struct atomisp_sub_device *asd,
 			      struct atomisp_shading_table *shading_table);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 9ff0bcc04307..08b62fc65c76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -1269,14 +1269,6 @@ static int atomisp_mmap(struct file *file, struct vm_area_struct *vma)
 	return ret;
 }
 
-static int atomisp_file_mmap(struct file *file, struct vm_area_struct *vma)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	return videobuf_mmap_mapper(&pipe->outq, vma);
-}
-
 static __poll_t atomisp_poll(struct file *file,
 			     struct poll_table_struct *pt)
 {
@@ -1309,15 +1301,3 @@ const struct v4l2_file_operations atomisp_fops = {
 #endif
 	.poll = atomisp_poll,
 };
-
-const struct v4l2_file_operations atomisp_file_fops = {
-	.owner = THIS_MODULE,
-	.open = atomisp_open,
-	.release = atomisp_release,
-	.mmap = atomisp_file_mmap,
-	.unlocked_ioctl = video_ioctl2,
-#ifdef CONFIG_COMPAT
-	/* .compat_ioctl32 = atomisp_compat_ioctl32, */
-#endif
-	.poll = atomisp_poll,
-};
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 571a2df75238..345970ca4fcb 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -871,20 +871,6 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int atomisp_g_fmt_file(struct file *file, void *fh,
-			      struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	rt_mutex_lock(&isp->mutex);
-	f->fmt.pix = pipe->pix;
-	rt_mutex_unlock(&isp->mutex);
-
-	return 0;
-}
-
 static int atomisp_adjust_fmt(struct v4l2_format *f)
 {
 	const struct atomisp_format_bridge *format_bridge;
@@ -1018,19 +1004,6 @@ static int atomisp_s_fmt_cap(struct file *file, void *fh,
 	return ret;
 }
 
-static int atomisp_s_fmt_file(struct file *file, void *fh,
-			      struct v4l2_format *f)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	int ret;
-
-	rt_mutex_lock(&isp->mutex);
-	ret = atomisp_set_fmt_file(vdev, f);
-	rt_mutex_unlock(&isp->mutex);
-	return ret;
-}
-
 /*
  * Free videobuffer buffer priv data
  */
@@ -1258,22 +1231,6 @@ int atomisp_reqbufs(struct file *file, void *fh,
 	return ret;
 }
 
-static int atomisp_reqbufs_file(struct file *file, void *fh,
-				struct v4l2_requestbuffers *req)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	if (req->count == 0) {
-		mutex_lock(&pipe->outq.vb_lock);
-		atomisp_videobuf_free_queue(&pipe->outq);
-		mutex_unlock(&pipe->outq.vb_lock);
-		return 0;
-	}
-
-	return videobuf_reqbufs(&pipe->outq, req);
-}
-
 /* application query the status of a buffer */
 static int atomisp_querybuf(struct file *file, void *fh,
 			    struct v4l2_buffer *buf)
@@ -1284,15 +1241,6 @@ static int atomisp_querybuf(struct file *file, void *fh,
 	return videobuf_querybuf(&pipe->capq, buf);
 }
 
-static int atomisp_querybuf_file(struct file *file, void *fh,
-				 struct v4l2_buffer *buf)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-
-	return videobuf_querybuf(&pipe->outq, buf);
-}
-
 /*
  * Applications call the VIDIOC_QBUF ioctl to enqueue an empty (capturing) or
  * filled (output) buffer in the drivers incoming queue.
@@ -1473,48 +1421,6 @@ static int atomisp_qbuf(struct file *file, void *fh, struct v4l2_buffer *buf)
 	return ret;
 }
 
-static int atomisp_qbuf_file(struct file *file, void *fh,
-			     struct v4l2_buffer *buf)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
-	int ret;
-
-	rt_mutex_lock(&isp->mutex);
-	if (isp->isp_fatal_error) {
-		ret = -EIO;
-		goto error;
-	}
-
-	if (!buf || buf->index >= VIDEO_MAX_FRAME ||
-	    !pipe->outq.bufs[buf->index]) {
-		dev_err(isp->dev, "Invalid index for qbuf.\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
-	if (buf->memory != V4L2_MEMORY_MMAP) {
-		dev_err(isp->dev, "Unsupported memory method\n");
-		ret = -EINVAL;
-		goto error;
-	}
-
-	if (buf->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
-		dev_err(isp->dev, "Unsupported buffer type\n");
-		ret = -EINVAL;
-		goto error;
-	}
-	rt_mutex_unlock(&isp->mutex);
-
-	return videobuf_qbuf(&pipe->outq, buf);
-
-error:
-	rt_mutex_unlock(&isp->mutex);
-
-	return ret;
-}
-
 static int __get_frame_exp_id(struct atomisp_video_pipe *pipe,
 			      struct v4l2_buffer *buf)
 {
@@ -2882,24 +2788,6 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	return rval == -ENOIOCTLCMD ? 0 : rval;
 }
 
-static int atomisp_s_parm_file(struct file *file, void *fh,
-			       struct v4l2_streamparm *parm)
-{
-	struct video_device *vdev = video_devdata(file);
-	struct atomisp_device *isp = video_get_drvdata(vdev);
-
-	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
-		dev_err(isp->dev, "unsupported v4l2 buf type for output\n");
-		return -EINVAL;
-	}
-
-	rt_mutex_lock(&isp->mutex);
-	isp->sw_contex.file_input = true;
-	rt_mutex_unlock(&isp->mutex);
-
-	return 0;
-}
-
 static long atomisp_vidioc_default(struct file *file, void *fh,
 				   bool valid_prio, unsigned int cmd, void *arg)
 {
@@ -3230,13 +3118,3 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_s_parm = atomisp_s_parm,
 	.vidioc_g_parm = atomisp_g_parm,
 };
-
-const struct v4l2_ioctl_ops atomisp_file_ioctl_ops = {
-	.vidioc_querycap = atomisp_querycap,
-	.vidioc_g_fmt_vid_out = atomisp_g_fmt_file,
-	.vidioc_s_fmt_vid_out = atomisp_s_fmt_file,
-	.vidioc_s_parm = atomisp_s_parm_file,
-	.vidioc_reqbufs = atomisp_reqbufs_file,
-	.vidioc_querybuf = atomisp_querybuf_file,
-	.vidioc_qbuf = atomisp_qbuf_file,
-};
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index d85e0d697a4e..382b78275240 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -49,12 +49,8 @@ enum ia_css_pipe_id atomisp_get_css_pipe_id(struct atomisp_sub_device
 
 void atomisp_videobuf_free_buf(struct videobuf_buffer *vb);
 
-extern const struct v4l2_file_operations atomisp_file_fops;
-
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
-extern const struct v4l2_ioctl_ops atomisp_file_ioctl_ops;
-
 unsigned int atomisp_streaming_count(struct atomisp_device *isp);
 
 /* compat_ioctl for 32bit userland app and 64bit kernel */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5488a02200ed..672b3b68c613 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -442,12 +442,6 @@ int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
 		video->vdev.fops = &atomisp_fops;
 		video->vdev.ioctl_ops = &atomisp_ioctl_ops;
 		break;
-	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
-		direction = "input";
-		video->pad.flags = MEDIA_PAD_FL_SOURCE;
-		video->vdev.fops = &atomisp_file_fops;
-		video->vdev.ioctl_ops = &atomisp_file_ioctl_ops;
-		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.37.2

