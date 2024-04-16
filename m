Return-Path: <linux-media+bounces-9616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C70308A754F
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 22:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F0D0281BB7
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 20:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4144813A410;
	Tue, 16 Apr 2024 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWgqcOw/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E9C13A40B
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 20:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298312; cv=none; b=QaEWc76vN1kYdFsH9mPpoVFAPt+qOdKSf/R+PRzbHPLzRLQ1dOLBp1VV8g3Vi3gS9H1HTgMLWfh4ZXOpfSndvMjjs/ohnDNYvS7Wwz8A+FtKxrUs2eP9l8GBm753AQk21Pmb+ZWglr4gu3Ljvo+e+IlG17VvmktHghsEMDg/TaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298312; c=relaxed/simple;
	bh=9mmnGgKlFpAwkTMMmffsUVg4edQm7oWU0HzP2bY2BdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hk/10ErfxjtWbFdwfqnUTDJ2/b3qbnH7klkGLqoD02cWmgmu6LqeAx/rbwkWKuv+bm4HgO0m36Fj6qdLXvbfMmadBr9FcIsD9LSGEJvR+YfWc5oXC4anJX5iTOe8AYSXk7aU3W2WYD2A1z7Z8xIkI5BTyFT57LAWOgSpWc23yHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWgqcOw/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713298312; x=1744834312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9mmnGgKlFpAwkTMMmffsUVg4edQm7oWU0HzP2bY2BdY=;
  b=aWgqcOw/8V9bkJHjpwq5lXDgVJteaDgGbUd1RFGcymPACLe3wyyOOxx/
   2/cVWioZoqzqV0jX02VBqqD+PhvaY+hclGqqIbkYbMmvHIaGCV1NF1jGU
   xHMJIhSNNrl+91kcwvgSPO54T8tvW/QprPjKsk2RcA3MPhrUjYUxc9AS7
   gt2T/LtF3I/HU8+rstkndP07hEqKuu4bXVpvEKfkDJjKTNN/P7sBKefAj
   IuTPGONZxmS2hPjdKsR/gOuB3U1W+D0P+uBG4MzoO+Ez4nDW0gR+oLjd2
   s8zLKhZ+s/sZWqp+dKe+dW88M5dO3Q2wo7hpaqJnd1geXFp5+KEtVHSzL
   Q==;
X-CSE-ConnectionGUID: t4CZj4i3RbOI1g3Rk6VYFA==
X-CSE-MsgGUID: zQR2FYrXQXWh+brIQCoafw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8877615"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="8877615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:51 -0700
X-CSE-ConnectionGUID: z4V2yw/DS1SYdqKQJ/rnFA==
X-CSE-MsgGUID: ytTNgDnWQyuHMfxwL6YhIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; 
   d="scan'208";a="22447931"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 13:11:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id F30CB11F879;
	Tue, 16 Apr 2024 23:11:42 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	laurent.pinchart@ideasonboard.com,
	andriy.shevchenko@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	claus.stovgaard@gmail.com,
	tomi.valkeinen@ideasonboard.com,
	tfiga@chromium.org,
	senozhatsky@chromium.org,
	andreaskleist@gmail.com,
	bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	hongju.wang@intel.com
Subject: [PATCH v4 17/19] media: intel/ipu6: support line-based metadata capture support
Date: Tue, 16 Apr 2024 23:11:03 +0300
Message-Id: <20240416201105.781496-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
References: <20240416201105.781496-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Some camera sensor can output the embedded data in specific data type.
This patch adds the support for metadata capture in IPU6 ISYS driver.

Signed-off-by: Hongju Wang <hongju.wang@intel.com>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   5 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  33 +--
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |   5 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 203 +++++++++++++++---
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |   7 +-
 5 files changed, 212 insertions(+), 41 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index ad0616b96d3e..5f4d4e57d62c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -46,6 +46,11 @@ static const u32 csi2_supported_codes[] = {
 	MEDIA_BUS_FMT_SGBRG8_1X8,
 	MEDIA_BUS_FMT_SGRBG8_1X8,
 	MEDIA_BUS_FMT_SRGGB8_1X8,
+	MEDIA_BUS_FMT_META_8,
+	MEDIA_BUS_FMT_META_10,
+	MEDIA_BUS_FMT_META_12,
+	MEDIA_BUS_FMT_META_16,
+	MEDIA_BUS_FMT_META_24,
 	0
 };
 
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
index d332b4b3a0f6..6db60d9af3d2 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -35,11 +35,14 @@ static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
 	if (!*num_planes) {
 		use_fmt = true;
-		*num_planes = av->mpix.num_planes;
+		if (av->vfmt.type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			*num_planes = av->vfmt.fmt.pix_mp.num_planes;
+		else if (av->vfmt.type == V4L2_BUF_TYPE_META_CAPTURE)
+			*num_planes = 1;
 	}
 
 	for (i = 0; i < *num_planes; i++) {
-		size = av->mpix.plane_fmt[i].sizeimage;
+		size = ipu6_get_data_size(&av->vfmt, i);
 		if (use_fmt) {
 			sizes[i] = size;
 		} else if (sizes[i] < size) {
@@ -59,16 +62,17 @@ static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
+	u32 bytesperline = ipu6_get_bytes_per_line(&av->vfmt);
+	u32 height = ipu6_get_frame_height(&av->vfmt);
+	u32 size = ipu6_get_data_size(&av->vfmt, 0);
 
 	dev_dbg(dev, "buffer: %s: configured size %u, buffer size %lu\n",
-		av->vdev.name, av->mpix.plane_fmt[0].sizeimage,
-		vb2_plane_size(vb, 0));
+		av->vdev.name, size, vb2_plane_size(vb, 0));
 
-	if (av->mpix.plane_fmt[0].sizeimage > vb2_plane_size(vb, 0))
+	if (size > vb2_plane_size(vb, 0))
 		return -EINVAL;
 
-	vb2_set_plane_payload(vb, 0, av->mpix.plane_fmt[0].bytesperline *
-			      av->mpix.height);
+	vb2_set_plane_payload(vb, 0, bytesperline * height);
 	vb->planes[0].data_offset = 0;
 
 	return 0;
@@ -437,11 +441,12 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		return ret;
 	}
 
-	if (format.width != av->mpix.width ||
-	    format.height != av->mpix.height) {
-		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
-			av->mpix.width, av->mpix.height,
-			format.width, format.height);
+	if (format.width != ipu6_get_frame_width(&av->vfmt) ||
+	    format.height != ipu6_get_frame_height(&av->vfmt)) {
+		dev_err(dev, "wrong width or height %ux%u (%ux%u expected)\n",
+			ipu6_get_frame_width(&av->vfmt),
+			ipu6_get_frame_height(&av->vfmt), format.width,
+			format.height);
 		return -EINVAL;
 	}
 
@@ -525,8 +530,8 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	int nr_queues, ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
-		av->vdev.name, av->mpix.width, av->mpix.height,
-		av->pfmt->css_pixelformat);
+		av->vdev.name, ipu6_get_frame_width(&av->vfmt),
+		ipu6_get_frame_height(&av->vfmt), av->pfmt->css_pixelformat);
 
 	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
 	if (ret < 0) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index 7b85cc9929a5..5ef5a9b44be3 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -20,10 +20,12 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 {
 	switch (code) {
 	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_META_24:
 		return 24;
 	case MEDIA_BUS_FMT_RGB565_1X16:
 	case MEDIA_BUS_FMT_UYVY8_1X16:
 	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_META_16:
 		return 16;
 	case MEDIA_BUS_FMT_SBGGR16_1X16:
 	case MEDIA_BUS_FMT_SGBRG16_1X16:
@@ -34,16 +36,19 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
 	case MEDIA_BUS_FMT_SGBRG12_1X12:
 	case MEDIA_BUS_FMT_SGRBG12_1X12:
 	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_META_12:
 		return 12;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:
 	case MEDIA_BUS_FMT_SGRBG10_1X10:
 	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_META_10:
 		return 10;
 	case MEDIA_BUS_FMT_SBGGR8_1X8:
 	case MEDIA_BUS_FMT_SGBRG8_1X8:
 	case MEDIA_BUS_FMT_SGRBG8_1X8:
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_META_8:
 		return 8;
 	default:
 		WARN_ON(1);
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index f40d7e93ebe2..457085177327 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -93,6 +93,14 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
 	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
+	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8 },
+	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10 },
+	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12 },
+	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
 };
 
 static int video_open(struct file *file)
@@ -184,12 +192,12 @@ static int ipu6_isys_vidioc_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static int vidioc_g_fmt_vid_cap_mplane(struct file *file, void *fh,
-				       struct v4l2_format *fmt)
+static int vidioc_get_format(struct file *file, void *fh,
+			     struct v4l2_format *fmt)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	fmt->fmt.pix_mp = av->mpix;
+	*fmt = av->vfmt;
 
 	return 0;
 }
@@ -247,30 +255,114 @@ ipu6_isys_video_try_fmt_vid_mplane(struct ipu6_isys_video *av,
 	return pfmt;
 }
 
-static int vidioc_s_fmt_vid_cap_mplane(struct file *file, void *fh,
-				       struct v4l2_format *f)
+static const struct ipu6_isys_pixelformat *
+ipu6_isys_video_try_fmt_meta(struct ipu6_isys_video *av,
+			     struct v4l2_meta_format *meta)
+{
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_pixelformat(meta->dataformat);
+
+	memset(&av->vfmt, 0, sizeof(av->vfmt));
+	av->vfmt.type = V4L2_BUF_TYPE_META_CAPTURE;
+	av->pfmt = pfmt;
+
+	meta->dataformat = pfmt->pixelformat;
+	meta->width = clamp(meta->width, IPU6_ISYS_MIN_WIDTH,
+			    IPU6_ISYS_MAX_WIDTH);
+	meta->height = clamp(meta->height, IPU6_ISYS_MIN_HEIGHT,
+			     IPU6_ISYS_MAX_HEIGHT);
+
+	if (pfmt->bpp != pfmt->bpp_packed)
+		meta->bytesperline = meta->width *
+				     DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
+	else
+		meta->bytesperline =
+			DIV_ROUND_UP(meta->width * pfmt->bpp, BITS_PER_BYTE);
+
+	meta->bytesperline = ALIGN(meta->bytesperline, av->isys->line_align);
+	meta->buffersize =
+		max(max(meta->buffersize, meta->bytesperline * meta->height +
+			max(meta->bytesperline,
+			    av->isys->pdata->ipdata->isys_dma_overshoot)), 1U);
+
+	return pfmt;
+}
+
+static const struct ipu6_isys_pixelformat *
+ipu6_isys_video_try_fmt(struct ipu6_isys_video *av, struct v4l2_format *f)
+{
+	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return ipu6_isys_video_try_fmt_vid_mplane(av, &f->fmt.pix_mp);
+	else if (f->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return ipu6_isys_video_try_fmt_meta(av, &f->fmt.meta);
+	else
+		return &ipu6_isys_pfmts[0];
+}
+
+static int vidioc_set_format(struct file *file, void *fh,
+			     struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
 	if (av->aq.vbq.streaming)
 		return -EBUSY;
 
-	av->pfmt = ipu6_isys_video_try_fmt_vid_mplane(av, &f->fmt.pix_mp);
-	av->mpix = f->fmt.pix_mp;
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    f->type != V4L2_BUF_TYPE_META_CAPTURE)
+		return -EINVAL;
+
+	av->pfmt = ipu6_isys_video_try_fmt(av, f);
+	av->vfmt = *f;
 
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *fh,
-					 struct v4l2_format *f)
+static int vidioc_try_format(struct file *file, void *fh,
+			     struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	ipu6_isys_video_try_fmt_vid_mplane(av, &f->fmt.pix_mp);
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
+	    f->type != V4L2_BUF_TYPE_META_CAPTURE)
+		return -EINVAL;
+
+	ipu6_isys_video_try_fmt(av, f);
 
 	return 0;
 }
 
+static int vidioc_request_qbufs(struct file *file, void *priv,
+				struct v4l2_requestbuffers *p)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+	int ret;
+
+	av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->type);
+	av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->type);
+
+	ret = vb2_queue_change_type(&av->aq.vbq, p->type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_reqbufs(file, priv, p);
+}
+
+static int vidioc_create_bufs(struct file *file, void *priv,
+			      struct v4l2_create_buffers *p)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
+	int ret;
+
+	av->aq.vbq.is_multiplanar = V4L2_TYPE_IS_MULTIPLANAR(p->format.type);
+	av->aq.vbq.is_output = V4L2_TYPE_IS_OUTPUT(p->format.type);
+
+	ret = vb2_queue_change_type(&av->aq.vbq, p->format.type);
+	if (ret)
+		return ret;
+
+	return vb2_ioctl_create_bufs(file, priv, p);
+}
+
 static int link_validate(struct media_link *link)
 {
 	struct ipu6_isys_video *av =
@@ -306,11 +398,13 @@ static int link_validate(struct media_link *link)
 		goto unlock;
 	}
 
-	if (s_fmt->width != av->mpix.width ||
-	    s_fmt->height != av->mpix.height || s_fmt->code != av->pfmt->code) {
+	if (s_fmt->width != ipu6_get_frame_width(&av->vfmt) ||
+	    s_fmt->height != ipu6_get_frame_height(&av->vfmt) ||
+	    s_fmt->code != av->pfmt->code) {
 		dev_dbg(dev, "format mismatch %dx%d,%x != %dx%d,%x\n",
 			s_fmt->width, s_fmt->height, s_fmt->code,
-			av->mpix.width, av->mpix.height, av->pfmt->code);
+			ipu6_get_frame_width(&av->vfmt),
+			ipu6_get_frame_height(&av->vfmt), av->pfmt->code);
 		goto unlock;
 	}
 
@@ -394,10 +488,10 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 
 	output_pin = &cfg->output_pins[output_pins];
 	output_pin->input_pin_id = input_pins;
-	output_pin->output_res.width = av->mpix.width;
-	output_pin->output_res.height = av->mpix.height;
+	output_pin->output_res.width = ipu6_get_frame_width(&av->vfmt);
+	output_pin->output_res.height = ipu6_get_frame_height(&av->vfmt);
 
-	output_pin->stride = av->mpix.plane_fmt[0].bytesperline;
+	output_pin->stride = ipu6_get_bytes_per_line(&av->vfmt);
 	if (av->pfmt->bpp != av->pfmt->bpp_packed)
 		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
 	else
@@ -664,8 +758,8 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
 
-	av->watermark.width = av->mpix.width;
-	av->watermark.height = av->mpix.height;
+	av->watermark.width = ipu6_get_frame_width(&av->vfmt);
+	av->watermark.height = ipu6_get_frame_height(&av->vfmt);
 	av->watermark.sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
 	av->watermark.sram_gran_size = isys->pdata->ipdata->sram_gran_size;
 
@@ -990,11 +1084,15 @@ static const struct v4l2_ioctl_ops ioctl_ops_mplane = {
 	.vidioc_querycap = ipu6_isys_vidioc_querycap,
 	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
 	.vidioc_enum_framesizes = ipu6_isys_vidioc_enum_framesizes,
-	.vidioc_g_fmt_vid_cap_mplane = vidioc_g_fmt_vid_cap_mplane,
-	.vidioc_s_fmt_vid_cap_mplane = vidioc_s_fmt_vid_cap_mplane,
-	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_fmt_vid_cap_mplane,
-	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_g_fmt_vid_cap_mplane = vidioc_get_format,
+	.vidioc_s_fmt_vid_cap_mplane = vidioc_set_format,
+	.vidioc_try_fmt_vid_cap_mplane = vidioc_try_format,
+	.vidioc_enum_fmt_meta_cap = ipu6_isys_vidioc_enum_fmt,
+	.vidioc_g_fmt_meta_cap = vidioc_get_format,
+	.vidioc_s_fmt_meta_cap = vidioc_set_format,
+	.vidioc_try_fmt_meta_cap = vidioc_try_format,
+	.vidioc_reqbufs = vidioc_request_qbufs,
+	.vidioc_create_bufs = vidioc_create_bufs,
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
 	.vidioc_querybuf = vb2_ioctl_querybuf,
 	.vidioc_qbuf = vb2_ioctl_qbuf,
@@ -1196,7 +1294,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 
 	mutex_init(&av->mutex);
 	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
-			       V4L2_CAP_VIDEO_CAPTURE_MPLANE;
+			       V4L2_CAP_VIDEO_CAPTURE_MPLANE |
+			       V4L2_CAP_META_CAPTURE;
 	av->vdev.vfl_dir = VFL_DIR_RX;
 
 	ret = ipu6_isys_queue_init(&av->aq);
@@ -1217,8 +1316,8 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	av->vdev.queue = &av->aq.vbq;
 	av->vdev.lock = &av->mutex;
 
-	ipu6_isys_video_try_fmt_vid_mplane(av, &format.fmt.pix_mp);
-	av->mpix = format.fmt.pix_mp;
+	ipu6_isys_video_try_fmt(av, &format);
+	av->vfmt = format;
 
 	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
@@ -1248,3 +1347,55 @@ void ipu6_isys_video_cleanup(struct ipu6_isys_video *av)
 	media_entity_cleanup(&av->vdev.entity);
 	mutex_destroy(&av->mutex);
 }
+
+u32 ipu6_get_data_size(struct v4l2_format *vfmt, int plane)
+{
+	if (vfmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return vfmt->fmt.pix_mp.plane_fmt[plane].sizeimage;
+
+	if (vfmt->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return vfmt->fmt.meta.buffersize;
+
+	WARN_ON_ONCE(1);
+
+	return 0;
+}
+
+u32 ipu6_get_bytes_per_line(struct v4l2_format *vfmt)
+{
+	if (vfmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return vfmt->fmt.pix_mp.plane_fmt[0].bytesperline;
+
+	if (vfmt->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return vfmt->fmt.meta.bytesperline;
+
+	WARN_ON_ONCE(1);
+
+	return 0;
+}
+
+u32 ipu6_get_frame_width(struct v4l2_format *vfmt)
+{
+	if (vfmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return vfmt->fmt.pix_mp.width;
+
+	if (vfmt->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return vfmt->fmt.meta.width;
+
+	WARN_ON_ONCE(1);
+
+	return 0;
+}
+
+u32 ipu6_get_frame_height(struct v4l2_format *vfmt)
+{
+	if (vfmt->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return vfmt->fmt.pix_mp.height;
+
+	if (vfmt->type == V4L2_BUF_TYPE_META_CAPTURE)
+		return vfmt->fmt.meta.height;
+
+	WARN_ON_ONCE(1);
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 43bc3f73c070..b9cc7f691c7e 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -90,7 +90,7 @@ struct ipu6_isys_video {
 	struct mutex mutex;
 	struct media_pad pad;
 	struct video_device vdev;
-	struct v4l2_pix_format_mplane mpix;
+	struct v4l2_format vfmt;
 	const struct ipu6_isys_pixelformat *pfmt;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_csi2 *csi2;
@@ -129,4 +129,9 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 					  bool state);
 void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
 
+u32 ipu6_get_data_size(struct v4l2_format *vfmt, int plane);
+u32 ipu6_get_bytes_per_line(struct v4l2_format *vfmt);
+u32 ipu6_get_frame_width(struct v4l2_format *vfmt);
+u32 ipu6_get_frame_height(struct v4l2_format *vfmt);
+
 #endif /* IPU6_ISYS_VIDEO_H */
-- 
2.39.2


