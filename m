Return-Path: <linux-media+bounces-12348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FD8D64CF
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 16:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCABE28AAE2
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 14:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900B86CDCC;
	Fri, 31 May 2024 14:49:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC4612EB;
	Fri, 31 May 2024 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166977; cv=none; b=dUsmOJ2esb8i5hU9YucPJiUZrV9O3zCWkm8M1JhKCN0ZTztl3fEaUCXwf7CpBGZpS8XLjon8jqL64pBhfZovM5/r3DB8umUD5EXSQTKmPc8oXdCfv4OgSH5jAVmJ2LghIKskb3zEA5gTQKK+AL5dENHe5v2wcdnPL2R8jtH+gJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166977; c=relaxed/simple;
	bh=k2dTbUgL2xrvU2m0TLwYcJBI7SipedC4gdovXsfzdrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5rBlOpMRDD/8JQitnQ/52rxFj8RKPGNraL8bT7aLBo7CbChBdj2wQodx7O69DcNOxoqt5bD+zvbFOewrXhHEpsA5mNSUurzTAo0QHekdgyLDMAxq90YcvY1T1EnOtIvi/7yqec2zTKoZpw+QHw8be5hKciSLBnHXSFky8xjvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from mgb4.. (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id D6AB04CD68;
	Fri, 31 May 2024 16:49:26 +0200 (CEST)
From: tumic@gpxsee.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
Subject: [PATCH v6 1/4] media: mgb4: Add support for YUV image formats
Date: Fri, 31 May 2024 16:49:18 +0200
Message-ID: <20240531144921.2104-2-tumic@gpxsee.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531144921.2104-1-tumic@gpxsee.org>
References: <20240531144921.2104-1-tumic@gpxsee.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Tůma <martin.tuma@digiteqautomotive.com>

Recent mgb4 firmwares support YUV in addition to the RGB image format. Enable
YUV in the driver when the FW supports it.

Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
---
 drivers/media/pci/mgb4/mgb4_io.h   |   7 ++
 drivers/media/pci/mgb4/mgb4_vin.c  | 107 ++++++++++++++++++++++------
 drivers/media/pci/mgb4/mgb4_vout.c | 109 +++++++++++++++++++++++------
 3 files changed, 183 insertions(+), 40 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_io.h b/drivers/media/pci/mgb4/mgb4_io.h
index 8698db1be4a9..204613a6685c 100644
--- a/drivers/media/pci/mgb4/mgb4_io.h
+++ b/drivers/media/pci/mgb4/mgb4_io.h
@@ -30,4 +30,11 @@ static inline struct mgb4_frame_buffer *to_frame_buffer(struct vb2_v4l2_buffer *
 	return container_of(vbuf, struct mgb4_frame_buffer, vb);
 }
 
+static inline bool has_yuv(struct mgb4_regs *video)
+{
+	u32 status = mgb4_read_reg(video, 0xD0);
+
+	return (status & (1U << 8));
+}
+
 #endif
diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index 2cd78c539889..7fb14e867e8d 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -186,8 +186,11 @@ static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 		       struct device *alloc_devs[])
 {
 	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(q);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	u32 config = mgb4_read_reg(video, vindev->config->regs.config);
+	u32 pixelsize = (config & (1U << 16)) ? 2 : 4;
 	unsigned int size = (vindev->timings.bt.width + vindev->padding)
-	 * vindev->timings.bt.height * 4;
+			    * vindev->timings.bt.height * pixelsize;
 
 	/*
 	 * If I/O reconfiguration is in process, do not allow to start
@@ -220,9 +223,12 @@ static int buffer_init(struct vb2_buffer *vb)
 static int buffer_prepare(struct vb2_buffer *vb)
 {
 	struct mgb4_vin_dev *vindev = vb2_get_drv_priv(vb->vb2_queue);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
 	struct device *dev = &vindev->mgbdev->pdev->dev;
+	u32 config = mgb4_read_reg(video, vindev->config->regs.config);
+	u32 pixelsize = (config & (1U << 16)) ? 2 : 4;
 	unsigned int size = (vindev->timings.bt.width + vindev->padding)
-	 * vindev->timings.bt.height * 4;
+			    * vindev->timings.bt.height * pixelsize;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(dev, "buffer too small (%lu < %u)\n",
@@ -359,22 +365,30 @@ static int vidioc_querycap(struct file *file, void *priv,
 static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f)
 {
-	if (f->index != 0)
-		return -EINVAL;
-
-	f->pixelformat = V4L2_PIX_FMT_ABGR32;
+	struct mgb4_vin_dev *vindev = video_drvdata(file);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
 
-	return 0;
+	if (f->index == 0) {
+		f->pixelformat = V4L2_PIX_FMT_ABGR32;
+		return 0;
+	} else if (f->index == 1 && has_yuv(video)) {
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		return 0;
+	} else {
+		return -EINVAL;
+	}
 }
 
 static int vidioc_enum_frameintervals(struct file *file, void *priv,
 				      struct v4l2_frmivalenum *ival)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
 
 	if (ival->index != 0)
 		return -EINVAL;
-	if (ival->pixel_format != V4L2_PIX_FMT_ABGR32)
+	if (!(ival->pixel_format == V4L2_PIX_FMT_ABGR32 ||
+	      ((has_yuv(video) && ival->pixel_format == V4L2_PIX_FMT_YUYV))))
 		return -EINVAL;
 	if (ival->width != vindev->timings.bt.width ||
 	    ival->height != vindev->timings.bt.height)
@@ -393,13 +407,29 @@ static int vidioc_enum_frameintervals(struct file *file, void *priv,
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	u32 config = mgb4_read_reg(video, vindev->config->regs.config);
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
 	f->fmt.pix.width = vindev->timings.bt.width;
 	f->fmt.pix.height = vindev->timings.bt.height;
 	f->fmt.pix.field = V4L2_FIELD_NONE;
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
-	f->fmt.pix.bytesperline = (f->fmt.pix.width + vindev->padding) * 4;
+
+	if (config & (1U << 16)) {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+		if (config & (1U << 20)) {
+			f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
+		} else {
+			if (config & (1U << 19))
+				f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
+			else
+				f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+		}
+		f->fmt.pix.bytesperline = (f->fmt.pix.width + vindev->padding) * 2;
+	} else {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+		f->fmt.pix.bytesperline = (f->fmt.pix.width + vindev->padding) * 4;
+	}
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
 
 	return 0;
@@ -408,14 +438,30 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
+	struct mgb4_regs *video = &vindev->mgbdev->video;
+	u32 pixelsize;
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
 	f->fmt.pix.width = vindev->timings.bt.width;
 	f->fmt.pix.height = vindev->timings.bt.height;
 	f->fmt.pix.field = V4L2_FIELD_NONE;
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
-	f->fmt.pix.bytesperline = max(f->fmt.pix.width * 4,
-				      ALIGN_DOWN(f->fmt.pix.bytesperline, 4));
+
+	if (has_yuv(video) && f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUYV) {
+		pixelsize = 2;
+		if (!(f->fmt.pix.colorspace == V4L2_COLORSPACE_REC709 ||
+		      f->fmt.pix.colorspace == V4L2_COLORSPACE_SMPTE170M))
+			f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+	} else {
+		pixelsize = 4;
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+	}
+
+	if (f->fmt.pix.bytesperline > f->fmt.pix.width * pixelsize &&
+	    f->fmt.pix.bytesperline < f->fmt.pix.width * pixelsize * 2)
+		f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
+						pixelsize);
+	else
+		f->fmt.pix.bytesperline = f->fmt.pix.width * pixelsize;
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
 
 	return 0;
@@ -425,13 +471,36 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 	struct mgb4_regs *video = &vindev->mgbdev->video;
+	u32 config, pixelsize;
 
 	if (vb2_is_busy(&vindev->queue))
 		return -EBUSY;
 
 	vidioc_try_fmt(file, priv, f);
 
-	vindev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width * 4)) / 4;
+	config = mgb4_read_reg(video, vindev->config->regs.config);
+	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUYV) {
+		pixelsize = 2;
+		config |= 1U << 16;
+
+		if (f->fmt.pix.colorspace == V4L2_COLORSPACE_REC709) {
+			config |= 1U << 20;
+			config |= 1U << 19;
+		} else if (f->fmt.pix.colorspace == V4L2_COLORSPACE_SMPTE170M) {
+			config &= ~(1U << 20);
+			config |= 1U << 19;
+		} else {
+			config &= ~(1U << 20);
+			config &= ~(1U << 19);
+		}
+	} else {
+		pixelsize = 4;
+		config &= ~(1U << 16);
+	}
+	mgb4_write_reg(video, vindev->config->regs.config, config);
+
+	vindev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width
+			   * pixelsize)) / pixelsize;
 	mgb4_write_reg(video, vindev->config->regs.padding, vindev->padding);
 	set_loopback_padding(vindev, vindev->padding);
 
@@ -467,7 +536,8 @@ static int vidioc_enum_framesizes(struct file *file, void *fh,
 {
 	struct mgb4_vin_dev *vindev = video_drvdata(file);
 
-	if (fsize->index != 0 || fsize->pixel_format != V4L2_PIX_FMT_ABGR32)
+	if (fsize->index != 0 || !(fsize->pixel_format == V4L2_PIX_FMT_ABGR32 ||
+				   fsize->pixel_format == V4L2_PIX_FMT_YUYV))
 		return -EINVAL;
 
 	fsize->discrete.width = vindev->timings.bt.width;
@@ -499,9 +569,6 @@ static int vidioc_parm(struct file *file, void *priv,
 		.denominator = 125000000,
 	};
 
-	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
-		return -EINVAL;
-
 	parm->parm.capture.readbuffers = 2;
 	parm->parm.capture.capability = V4L2_CAP_TIMEPERFRAME;
 	parm->parm.capture.timeperframe = timeperframe;
diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/mgb4/mgb4_vout.c
index 241353ee77a5..2ee9606d9072 100644
--- a/drivers/media/pci/mgb4/mgb4_vout.c
+++ b/drivers/media/pci/mgb4/mgb4_vout.c
@@ -59,7 +59,11 @@ static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 		       struct device *alloc_devs[])
 {
 	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(q);
-	unsigned int size;
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	u32 config = mgb4_read_reg(video, voutdev->config->regs.config);
+	u32 pixelsize = (config & (1U << 16)) ? 2 : 4;
+	unsigned int size = (voutdev->width + voutdev->padding) * voutdev->height
+			    * pixelsize;
 
 	/*
 	 * If I/O reconfiguration is in process, do not allow to start
@@ -69,8 +73,6 @@ static int queue_setup(struct vb2_queue *q, unsigned int *nbuffers,
 	if (test_bit(0, &voutdev->mgbdev->io_reconfig))
 		return -EBUSY;
 
-	size = (voutdev->width + voutdev->padding) * voutdev->height * 4;
-
 	if (*nplanes)
 		return sizes[0] < size ? -EINVAL : 0;
 	*nplanes = 1;
@@ -93,9 +95,11 @@ static int buffer_prepare(struct vb2_buffer *vb)
 {
 	struct mgb4_vout_dev *voutdev = vb2_get_drv_priv(vb->vb2_queue);
 	struct device *dev = &voutdev->mgbdev->pdev->dev;
-	unsigned int size;
-
-	size = (voutdev->width + voutdev->padding) * voutdev->height * 4;
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	u32 config = mgb4_read_reg(video, voutdev->config->regs.config);
+	u32 pixelsize = (config & (1U << 16)) ? 2 : 4;
+	unsigned int size = (voutdev->width + voutdev->padding) * voutdev->height
+			    * pixelsize;
 
 	if (vb2_plane_size(vb, 0) < size) {
 		dev_err(dev, "buffer too small (%lu < %u)\n",
@@ -194,24 +198,47 @@ static int vidioc_querycap(struct file *file, void *priv,
 static int vidioc_enum_fmt(struct file *file, void *priv,
 			   struct v4l2_fmtdesc *f)
 {
-	if (f->index != 0)
-		return -EINVAL;
-
-	f->pixelformat = V4L2_PIX_FMT_ABGR32;
+	struct mgb4_vin_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
 
-	return 0;
+	if (f->index == 0) {
+		f->pixelformat = V4L2_PIX_FMT_ABGR32;
+		return 0;
+	} else if (f->index == 1 && has_yuv(video)) {
+		f->pixelformat = V4L2_PIX_FMT_YUYV;
+		return 0;
+	} else {
+		return -EINVAL;
+	}
 }
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	u32 config = mgb4_read_reg(video, voutdev->config->regs.config);
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
 	f->fmt.pix.width = voutdev->width;
 	f->fmt.pix.height = voutdev->height;
 	f->fmt.pix.field = V4L2_FIELD_NONE;
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
-	f->fmt.pix.bytesperline = (f->fmt.pix.width + voutdev->padding) * 4;
+
+	if (config & (1U << 16)) {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
+		if (config & (1U << 20)) {
+			f->fmt.pix.colorspace = V4L2_COLORSPACE_REC709;
+		} else {
+			if (config & (1U << 19))
+				f->fmt.pix.colorspace = V4L2_COLORSPACE_SMPTE170M;
+			else
+				f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+		}
+		f->fmt.pix.bytesperline = (f->fmt.pix.width + voutdev->padding) * 2;
+	} else {
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+		f->fmt.pix.bytesperline = (f->fmt.pix.width + voutdev->padding) * 4;
+	}
+
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
 
 	return 0;
@@ -220,14 +247,30 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
+	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	u32 pixelsize;
 
-	f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
 	f->fmt.pix.width = voutdev->width;
 	f->fmt.pix.height = voutdev->height;
 	f->fmt.pix.field = V4L2_FIELD_NONE;
-	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
-	f->fmt.pix.bytesperline = max(f->fmt.pix.width * 4,
-				      ALIGN_DOWN(f->fmt.pix.bytesperline, 4));
+
+	if (has_yuv(video) && f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUYV) {
+		pixelsize = 2;
+		if (!(f->fmt.pix.colorspace == V4L2_COLORSPACE_REC709 ||
+		      f->fmt.pix.colorspace == V4L2_COLORSPACE_SMPTE170M))
+			f->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
+	} else {
+		pixelsize = 4;
+		f->fmt.pix.pixelformat = V4L2_PIX_FMT_ABGR32;
+		f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+	}
+
+	if (f->fmt.pix.bytesperline > f->fmt.pix.width * pixelsize &&
+	    f->fmt.pix.bytesperline < f->fmt.pix.width * pixelsize * 2)
+		f->fmt.pix.bytesperline = ALIGN(f->fmt.pix.bytesperline,
+						pixelsize);
+	else
+		f->fmt.pix.bytesperline = f->fmt.pix.width * pixelsize;
 	f->fmt.pix.sizeimage = f->fmt.pix.bytesperline * f->fmt.pix.height;
 
 	return 0;
@@ -237,13 +280,39 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct mgb4_vout_dev *voutdev = video_drvdata(file);
 	struct mgb4_regs *video = &voutdev->mgbdev->video;
+	u32 config, pixelsize;
+	int ret;
 
 	if (vb2_is_busy(&voutdev->queue))
 		return -EBUSY;
 
-	vidioc_try_fmt(file, priv, f);
+	ret = vidioc_try_fmt(file, priv, f);
+	if (ret < 0)
+		return ret;
+
+	config = mgb4_read_reg(video, voutdev->config->regs.config);
+	if (f->fmt.pix.pixelformat == V4L2_PIX_FMT_YUYV) {
+		pixelsize = 2;
+		config |= 1U << 16;
+
+		if (f->fmt.pix.colorspace == V4L2_COLORSPACE_REC709) {
+			config |= 1U << 20;
+			config |= 1U << 19;
+		} else if (f->fmt.pix.colorspace == V4L2_COLORSPACE_SMPTE170M) {
+			config &= ~(1U << 20);
+			config |= 1U << 19;
+		} else {
+			config &= ~(1U << 20);
+			config &= ~(1U << 19);
+		}
+	} else {
+		pixelsize = 4;
+		config &= ~(1U << 16);
+	}
+	mgb4_write_reg(video, voutdev->config->regs.config, config);
 
-	voutdev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width * 4)) / 4;
+	voutdev->padding = (f->fmt.pix.bytesperline - (f->fmt.pix.width
+			    * pixelsize)) / pixelsize;
 	mgb4_write_reg(video, voutdev->config->regs.padding, voutdev->padding);
 
 	return 0;
-- 
2.45.1


