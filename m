Return-Path: <linux-media+bounces-10211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD78B34BC
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 11:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4748B1F22C62
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 09:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852E014389F;
	Fri, 26 Apr 2024 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gVxv2pSo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDB8143877
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125549; cv=none; b=GPVr5roN2hGJsPzVtSWyLVDFCBCHsjuffo181s8RbjzpJIBZ9DQB8N7bz+8FbbMsO3CWrcMNSQoPKjj8rHfWaPKcCAdIGlBkaZaf0JKEMsVUZ2x8mrZ3vqAaUn1vMKQj7g3CkYxsX7QUanAR7CgqBJAt3bFJjR/YIOXOAc0XNJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125549; c=relaxed/simple;
	bh=ZfDg6ThnPl03x0eI4Ok7aOXARcZMAcvp1PZmS8/uFug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oUHYWFLd0+hwWzyeg+Jljpa3sADO1DqOwzkEcmtxXJLD422IkT6bSF1A7QhVf9J2FSJaN+Dpl98iIXd1zqrySAjpoJfSNARELMY3QOXopfGEOy2Pkonu7ZHUVnGPqohBHcAJgutd/CTMm5PaeGMRKLTig9DqkGUV45rhgIQv0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gVxv2pSo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125547; x=1745661547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZfDg6ThnPl03x0eI4Ok7aOXARcZMAcvp1PZmS8/uFug=;
  b=gVxv2pSoXoNBSkInv6grwPwPKtnHc/eYxdwC6lwMCWnuD8UdScrGWjIx
   VzJEUE580g10jPwcdTFrvQijEXhczhoLNGtYH1AYNarSWMxhU+wqU+8oZ
   prMGQXwQp2nqZQhfwyXYa/kh5UeKeftzAgqeBKrcJsRZkFE6UOoZbwStb
   uZG6JMpZATIjSLoRAaThwWu62vl5hHPb2t8IJse883C0nOSGr+qp6DgU4
   xXoDOhPqTC+s2rEqIH8jJQwCNrJktfBr698vOAjo7K/BxdUngV9tLecho
   POjgWOdo5kkcmQTM0fTlSyRI0nYKdJ9Kh+2i9ArK0i0fq623Csc7vbkbU
   Q==;
X-CSE-ConnectionGUID: ERYQCAA7TlGY8hMfwQVkCw==
X-CSE-MsgGUID: tuRqVpaHQqiFVFrPImEb2w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409460"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:59:07 -0700
X-CSE-ConnectionGUID: VWnKWB4PRFW471wcIJtTqg==
X-CSE-MsgGUID: 4jRXhMBaRh2csTpd2XJjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30173052"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:59:02 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0F7191203ED;
	Fri, 26 Apr 2024 12:58:57 +0300 (EEST)
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
Subject: [PATCH v6 16/18] media: intel/ipu6: support line-based metadata capture support
Date: Fri, 26 Apr 2024 12:58:20 +0300
Message-Id: <20240426095822.946453-17-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
References: <20240426095822.946453-1-sakari.ailus@linux.intel.com>
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
Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   5 +
 .../media/pci/intel/ipu6/ipu6-isys-queue.c    |  45 +--
 .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |   5 +
 .../media/pci/intel/ipu6/ipu6-isys-video.c    | 310 +++++++++++++-----
 .../media/pci/intel/ipu6/ipu6-isys-video.h    |  11 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c      |   1 -
 6 files changed, 274 insertions(+), 103 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
index e8d93aa7fc6d..b9ce4324996d 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
@@ -42,6 +42,11 @@ static const u32 csi2_supported_codes[] = {
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
index b011293ad615..f8b5b96b21f0 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
@@ -28,7 +28,7 @@ static int queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
-	u32 size = av->pix_fmt.sizeimage;
+	u32 size = ipu6_isys_get_data_size(av);
 
 	/* num_planes == 0: we're being called through VIDIOC_REQBUFS */
 	if (!*num_planes) {
@@ -50,17 +50,17 @@ static int ipu6_isys_buf_prepare(struct vb2_buffer *vb)
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(vb->vb2_queue);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
+	u32 bytesperline = ipu6_isys_get_bytes_per_line(av);
+	u32 height = ipu6_isys_get_frame_height(av);
+	u32 size = ipu6_isys_get_data_size(av);
 
 	dev_dbg(dev, "buffer: %s: configured size %u, buffer size %lu\n",
-		av->vdev.name, av->pix_fmt.sizeimage,
-		vb2_plane_size(vb, 0));
+		av->vdev.name, size, vb2_plane_size(vb, 0));
 
-	if (av->pix_fmt.sizeimage > vb2_plane_size(vb, 0))
+	if (size > vb2_plane_size(vb, 0))
 		return -EINVAL;
 
-	vb2_set_plane_payload(vb, 0, av->pix_fmt.bytesperline *
-			      av->pix_fmt.height);
-	vb->planes[0].data_offset = 0;
+	vb2_set_plane_payload(vb, 0, bytesperline * height);
 
 	return 0;
 }
@@ -329,15 +329,12 @@ static void buf_queue(struct vb2_buffer *vb)
 	struct isys_fw_msgs *msg;
 	unsigned long flags;
 	dma_addr_t dma;
-	unsigned int i;
 	int ret;
 
 	dev_dbg(dev, "queue buffer %u for %s\n", vb->index, av->vdev.name);
 
-	for (i = 0; i < vb->num_planes; i++) {
-		dma = vb2_dma_contig_plane_dma_addr(vb, i);
-		dev_dbg(dev, "iova: plane %u iova %pad\n", i, &dma);
-	}
+	dma = vb2_dma_contig_plane_dma_addr(vb, 0);
+	dev_dbg(dev, "iova: iova %pad\n", &dma);
 
 	spin_lock_irqsave(&aq->lock, flags);
 	list_add(&ib->head, &aq->incoming);
@@ -410,7 +407,7 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 	struct media_pad *remote_pad =
 		media_pad_remote_pad_first(av->vdev.entity.pads);
 	struct v4l2_subdev *sd;
-	u32 r_stream;
+	u32 r_stream, code;
 	int ret;
 
 	if (!remote_pad)
@@ -428,17 +425,19 @@ static int ipu6_isys_link_fmt_validate(struct ipu6_isys_queue *aq)
 		return ret;
 	}
 
-	if (format.width != av->pix_fmt.width ||
-	    format.height != av->pix_fmt.height) {
-		dev_dbg(dev, "wrong width or height %ux%u (%ux%u expected)\n",
-			av->pix_fmt.width, av->pix_fmt.height,
-			format.width, format.height);
+	if (format.width != ipu6_isys_get_frame_width(av) ||
+	    format.height != ipu6_isys_get_frame_height(av)) {
+		dev_err(dev, "wrong width or height %ux%u (%ux%u expected)\n",
+			ipu6_isys_get_frame_width(av),
+			ipu6_isys_get_frame_height(av), format.width,
+			format.height);
 		return -EINVAL;
 	}
 
-	if (format.code != av->pfmt->code) {
+	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av))->code;
+	if (format.code != code) {
 		dev_dbg(dev, "wrong mbus code 0x%8.8x (0x%8.8x expected)\n",
-			av->pfmt->code, format.code);
+			code, format.code);
 		return -EINVAL;
 	}
 
@@ -510,14 +509,16 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
 	struct ipu6_isys_queue *aq = vb2_queue_to_isys_queue(q);
 	struct ipu6_isys_video *av = ipu6_isys_queue_to_video(aq);
 	struct device *dev = &av->isys->adev->auxdev.dev;
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
 	struct ipu6_isys_buffer_list __bl, *bl = NULL;
 	struct ipu6_isys_stream *stream;
 	struct media_entity *source_entity = NULL;
 	int nr_queues, ret;
 
 	dev_dbg(dev, "stream: %s: width %u, height %u, css pixelformat %u\n",
-		av->vdev.name, av->pix_fmt.width, av->pix_fmt.height,
-		av->pfmt->css_pixelformat);
+		av->vdev.name, ipu6_isys_get_frame_width(av),
+		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
 
 	ret = ipu6_isys_setup_video(av, &source_entity, &nr_queues);
 	if (ret < 0) {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
index cb2ef1572562..0a06de5c739c 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-subdev.c
@@ -20,25 +20,30 @@ unsigned int ipu6_isys_mbus_code_to_bpp(u32 code)
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
 	case MEDIA_BUS_FMT_SBGGR12_1X12:
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
index c186fa8e243e..37b744a8a0b9 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -85,6 +85,14 @@ const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGB565 },
 	{ V4L2_PIX_FMT_BGR24, 24, 24, MEDIA_BUS_FMT_RGB888_1X24,
 	  IPU6_FW_ISYS_FRAME_FORMAT_RGBA888 },
+	{ V4L2_META_FMT_GENERIC_8, 8, 8, MEDIA_BUS_FMT_META_8,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW8, true },
+	{ V4L2_META_FMT_GENERIC_CSI2_10, 10, 10, MEDIA_BUS_FMT_META_10,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW10, true },
+	{ V4L2_META_FMT_GENERIC_CSI2_12, 12, 12, MEDIA_BUS_FMT_META_12,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW12, true },
+	{ V4L2_META_FMT_GENERIC_CSI2_16, 16, 16, MEDIA_BUS_FMT_META_16,
+	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16, true },
 };
 
 static int video_open(struct file *file)
@@ -104,8 +112,8 @@ static int video_open(struct file *file)
 	return v4l2_fh_open(file);
 }
 
-static const struct ipu6_isys_pixelformat *
-ipu6_isys_get_pixelformat(u32 pixelformat)
+const struct ipu6_isys_pixelformat *
+ipu6_isys_get_isys_format(u32 pixelformat)
 {
 	unsigned int i;
 
@@ -133,27 +141,27 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
 static int ipu6_isys_vidioc_enum_fmt(struct file *file, void *fh,
 				     struct v4l2_fmtdesc *f)
 {
-	unsigned int i, found = 0;
+	unsigned int i, num_found;
 
-	if (f->index >= ARRAY_SIZE(ipu6_isys_pfmts))
-		return -EINVAL;
-
-	if (!f->mbus_code) {
-		f->flags = 0;
-		f->pixelformat = ipu6_isys_pfmts[f->index].pixelformat;
-		return 0;
-	}
+	for (i = 0, num_found = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
+		if ((ipu6_isys_pfmts[i].is_meta ||
+		     f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) &&
+		    (!ipu6_isys_pfmts[i].is_meta ||
+		     f->type != V4L2_BUF_TYPE_META_CAPTURE))
+			continue;
 
-	for (i = 0; i < ARRAY_SIZE(ipu6_isys_pfmts); i++) {
-		if (f->mbus_code != ipu6_isys_pfmts[i].code)
+		if (f->mbus_code && f->mbus_code != ipu6_isys_pfmts[i].code)
 			continue;
 
-		if (f->index == found) {
-			f->flags = 0;
-			f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
-			return 0;
+		if (num_found < f->index) {
+			num_found++;
+			continue;
 		}
-		found++;
+
+		f->flags = 0;
+		f->pixelformat = ipu6_isys_pfmts[i].pixelformat;
+
+		return 0;
 	}
 
 	return -EINVAL;
@@ -185,39 +193,43 @@ static int ipu6_isys_vidioc_enum_framesizes(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int vidioc_g_fmt_vid_cap(struct file *file, void *fh,
-				struct v4l2_format *fmt)
+static int ipu6_isys_vidioc_g_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	fmt->fmt.pix = av->pix_fmt;
+	f->fmt.pix = av->pix_fmt;
 
 	return 0;
 }
 
-static const struct ipu6_isys_pixelformat *
-ipu6_isys_video_try_fmt_vid(struct ipu6_isys_video *av,
-			    struct v4l2_pix_format *pix_fmt)
+static int ipu6_isys_vidioc_g_fmt_meta_cap(struct file *file, void *fh,
+					   struct v4l2_format *f)
 {
-	const struct ipu6_isys_pixelformat *pfmt =
-		ipu6_isys_get_pixelformat(pix_fmt->pixelformat);
+	struct ipu6_isys_video *av = video_drvdata(file);
+
+	f->fmt.meta = av->meta_fmt;
+
+	return 0;
+}
 
-	pix_fmt->pixelformat = pfmt->pixelformat;
+static void ipu6_isys_try_fmt_cap(struct ipu6_isys_video *av, u32 type,
+				  u32 *format, u32 *width, u32 *height,
+				  u32 *bytesperline, u32 *sizeimage)
+{
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(*format);
 
-	pix_fmt->width = clamp(pix_fmt->width, IPU6_ISYS_MIN_WIDTH,
-			    IPU6_ISYS_MAX_WIDTH);
-	pix_fmt->height = clamp(pix_fmt->height, IPU6_ISYS_MIN_HEIGHT,
-			     IPU6_ISYS_MAX_HEIGHT);
+	*format = pfmt->pixelformat;
+	*width = clamp(*width, IPU6_ISYS_MIN_WIDTH, IPU6_ISYS_MAX_WIDTH);
+	*height = clamp(*height, IPU6_ISYS_MIN_HEIGHT, IPU6_ISYS_MAX_HEIGHT);
 
 	if (pfmt->bpp != pfmt->bpp_packed)
-		pix_fmt->bytesperline =
-			pix_fmt->width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
+		*bytesperline = *width * DIV_ROUND_UP(pfmt->bpp, BITS_PER_BYTE);
 	else
-		pix_fmt->bytesperline =
-			DIV_ROUND_UP(pix_fmt->width * pfmt->bpp, BITS_PER_BYTE);
+		*bytesperline = DIV_ROUND_UP(*width * pfmt->bpp, BITS_PER_BYTE);
 
-	pix_fmt->bytesperline = ALIGN(pix_fmt->bytesperline,
-						av->isys->line_align);
+	*bytesperline = ALIGN(*bytesperline, av->isys->line_align);
 
 	/*
 	 * (height + 1) * bytesperline due to a hardware issue: the DMA unit
@@ -228,46 +240,110 @@ ipu6_isys_video_try_fmt_vid(struct ipu6_isys_video *av,
 	 * resolution it gives a bigger number. Use larger one to avoid
 	 * memory corruption.
 	 */
-	pix_fmt->sizeimage =
-		max(pix_fmt->sizeimage,
-		    pix_fmt->bytesperline * pix_fmt->height +
-		    max(pix_fmt->bytesperline,
-			av->isys->pdata->ipdata->isys_dma_overshoot));
+	*sizeimage = *bytesperline * *height +
+		max(*bytesperline,
+		    av->isys->pdata->ipdata->isys_dma_overshoot);
+}
 
-	pix_fmt->field = V4L2_FIELD_NONE;
+static void __ipu6_isys_vidioc_try_fmt_vid_cap(struct ipu6_isys_video *av,
+					       struct v4l2_format *f)
+{
+	ipu6_isys_try_fmt_cap(av, f->type, &f->fmt.pix.pixelformat,
+			      &f->fmt.pix.width, &f->fmt.pix.height,
+			      &f->fmt.pix.bytesperline, &f->fmt.pix.sizeimage);
+
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+	f->fmt.pix.colorspace = V4L2_COLORSPACE_RAW;
+	f->fmt.pix.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	f->fmt.pix.quantization = V4L2_QUANTIZATION_DEFAULT;
+	f->fmt.pix.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+}
 
-	pix_fmt->colorspace = V4L2_COLORSPACE_RAW;
-	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-	pix_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
-	pix_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+static int ipu6_isys_vidioc_try_fmt_vid_cap(struct file *file, void *fh,
+					    struct v4l2_format *f)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
 
-	return pfmt;
+	__ipu6_isys_vidioc_try_fmt_vid_cap(av, f);
+
+	return 0;
+}
+
+static int __ipu6_isys_vidioc_try_fmt_meta_cap(struct ipu6_isys_video *av,
+					       struct v4l2_format *f)
+{
+	ipu6_isys_try_fmt_cap(av, f->type, &f->fmt.meta.dataformat,
+			      &f->fmt.meta.width, &f->fmt.meta.height,
+			      &f->fmt.meta.bytesperline,
+			      &f->fmt.meta.buffersize);
+
+	return 0;
 }
 
-static int vidioc_s_fmt_vid_cap(struct file *file, void *fh,
-				struct v4l2_format *f)
+static int ipu6_isys_vidioc_try_fmt_meta_cap(struct file *file, void *fh,
+					     struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	if (av->aq.vbq.streaming)
-		return -EBUSY;
+	__ipu6_isys_vidioc_try_fmt_meta_cap(av, f);
+
+	return 0;
+}
+
+static int ipu6_isys_vidioc_s_fmt_vid_cap(struct file *file, void *fh,
+				      struct v4l2_format *f)
+{
+	struct ipu6_isys_video *av = video_drvdata(file);
 
-	av->pfmt = ipu6_isys_video_try_fmt_vid(av, &f->fmt.pix);
+	ipu6_isys_vidioc_try_fmt_vid_cap(file, fh, f);
 	av->pix_fmt = f->fmt.pix;
 
 	return 0;
 }
 
-static int vidioc_try_fmt_vid_cap(struct file *file, void *fh,
-				  struct v4l2_format *f)
+static int ipu6_isys_vidioc_s_fmt_meta_cap(struct file *file, void *fh,
+					   struct v4l2_format *f)
 {
 	struct ipu6_isys_video *av = video_drvdata(file);
 
-	ipu6_isys_video_try_fmt_vid(av, &f->fmt.pix);
+	ipu6_isys_vidioc_try_fmt_meta_cap(file, fh, f);
+	av->meta_fmt = f->fmt.meta;
 
 	return 0;
 }
 
+static int ipu6_isys_vidioc_reqbufs(struct file *file, void *priv,
+				    struct v4l2_requestbuffers *p)
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
+static int ipu6_isys_vidioc_create_bufs(struct file *file, void *priv,
+					struct v4l2_create_buffers *p)
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
@@ -277,7 +353,7 @@ static int link_validate(struct media_link *link)
 	struct v4l2_subdev *s_sd;
 	struct v4l2_mbus_framefmt *s_fmt;
 	struct media_pad *s_pad;
-	u32 s_stream;
+	u32 s_stream, code;
 	int ret = -EPIPE;
 
 	if (!link->source->entity)
@@ -303,11 +379,15 @@ static int link_validate(struct media_link *link)
 		goto unlock;
 	}
 
-	if (s_fmt->width != av->pix_fmt.width ||
-	    s_fmt->height != av->pix_fmt.height || s_fmt->code != av->pfmt->code) {
+	code = ipu6_isys_get_isys_format(ipu6_isys_get_format(av))->code;
+
+	if (s_fmt->width != ipu6_isys_get_frame_width(av) ||
+	    s_fmt->height != ipu6_isys_get_frame_height(av) ||
+	    s_fmt->code != code) {
 		dev_dbg(dev, "format mismatch %dx%d,%x != %dx%d,%x\n",
 			s_fmt->width, s_fmt->height, s_fmt->code,
-			av->pix_fmt.width, av->pix_fmt.height, av->pfmt->code);
+			ipu6_isys_get_frame_width(av),
+			ipu6_isys_get_frame_height(av), code);
 		goto unlock;
 	}
 
@@ -348,6 +428,8 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	struct ipu6_isys_stream *stream = av->stream;
 	struct ipu6_isys_queue *aq = &av->aq;
 	struct v4l2_mbus_framefmt fmt;
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
 	struct v4l2_rect v4l2_crop;
 	struct ipu6_isys *isys = av->isys;
 	struct device *dev = &isys->adev->auxdev.dev;
@@ -375,11 +457,11 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 	input_pin->input_res.width = fmt.width;
 	input_pin->input_res.height = fmt.height;
 	input_pin->dt = av->dt;
-	input_pin->bits_per_pix = av->pfmt->bpp_packed;
+	input_pin->bits_per_pix = pfmt->bpp_packed;
 	input_pin->mapped_dt = 0x40; /* invalid mipi data type */
 	input_pin->mipi_decompression = 0;
 	input_pin->capture_mode = IPU6_FW_ISYS_CAPTURE_MODE_REGULAR;
-	input_pin->mipi_store_mode = av->pfmt->bpp == av->pfmt->bpp_packed ?
+	input_pin->mipi_store_mode = pfmt->bpp == pfmt->bpp_packed ?
 		IPU6_FW_ISYS_MIPI_STORE_MODE_DISCARD_LONG_HEADER :
 		IPU6_FW_ISYS_MIPI_STORE_MODE_NORMAL;
 	input_pin->crop_first_and_last_lines = v4l2_crop.top & 1;
@@ -391,15 +473,15 @@ static int ipu6_isys_fw_pin_cfg(struct ipu6_isys_video *av,
 
 	output_pin = &cfg->output_pins[output_pins];
 	output_pin->input_pin_id = input_pins;
-	output_pin->output_res.width = av->pix_fmt.width;
-	output_pin->output_res.height = av->pix_fmt.height;
+	output_pin->output_res.width = ipu6_isys_get_frame_width(av);
+	output_pin->output_res.height = ipu6_isys_get_frame_height(av);
 
-	output_pin->stride = av->pix_fmt.bytesperline;
-	if (av->pfmt->bpp != av->pfmt->bpp_packed)
+	output_pin->stride = ipu6_isys_get_bytes_per_line(av);
+	if (pfmt->bpp != pfmt->bpp_packed)
 		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_RAW_SOC;
 	else
 		output_pin->pt = IPU6_FW_ISYS_PIN_TYPE_MIPI;
-	output_pin->ft = av->pfmt->css_pixelformat;
+	output_pin->ft = pfmt->css_pixelformat;
 	output_pin->send_irq = 1;
 	memset(output_pin->ts_offsets, 0, sizeof(output_pin->ts_offsets));
 	output_pin->s2m_pixel_soc_pixel_remapping =
@@ -661,8 +743,8 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 
 	esd = media_entity_to_v4l2_subdev(av->stream->source_entity);
 
-	av->watermark.width = av->pix_fmt.width;
-	av->watermark.height = av->pix_fmt.height;
+	av->watermark.width = ipu6_isys_get_frame_width(av);
+	av->watermark.height = ipu6_isys_get_frame_height(av);
 	av->watermark.sram_gran_shift = isys->pdata->ipdata->sram_gran_shift;
 	av->watermark.sram_gran_size = isys->pdata->ipdata->sram_gran_size;
 
@@ -698,7 +780,8 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 static void calculate_stream_datarate(struct ipu6_isys_video *av)
 {
 	struct video_stream_watermark *watermark = &av->watermark;
-	u32 bpp = av->pfmt->bpp;
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
 	u32 pages_per_line, pb_bytes_per_line, pixels_per_line, bytes_per_line;
 	u64 line_time_ns, stream_data_rate;
 	u16 shift, size;
@@ -709,7 +792,7 @@ static void calculate_stream_datarate(struct ipu6_isys_video *av)
 	pixels_per_line = watermark->width + watermark->hblank;
 	line_time_ns =  div_u64(pixels_per_line * NSEC_PER_SEC,
 				watermark->pixel_rate);
-	bytes_per_line = watermark->width * bpp / 8;
+	bytes_per_line = watermark->width * pfmt->bpp / 8;
 	pages_per_line = DIV_ROUND_UP(bytes_per_line, size);
 	pb_bytes_per_line = pages_per_line << shift;
 	stream_data_rate = div64_u64(pb_bytes_per_line * 1000, line_time_ns);
@@ -987,11 +1070,14 @@ static const struct v4l2_ioctl_ops ipu6_v4l2_ioctl_ops = {
 	.vidioc_querycap = ipu6_isys_vidioc_querycap,
 	.vidioc_enum_fmt_vid_cap = ipu6_isys_vidioc_enum_fmt,
 	.vidioc_enum_framesizes = ipu6_isys_vidioc_enum_framesizes,
-	.vidioc_g_fmt_vid_cap = vidioc_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = vidioc_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = vidioc_try_fmt_vid_cap,
-	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-	.vidioc_create_bufs = vb2_ioctl_create_bufs,
+	.vidioc_g_fmt_vid_cap = ipu6_isys_vidioc_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = ipu6_isys_vidioc_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = ipu6_isys_vidioc_try_fmt_vid_cap,
+	.vidioc_g_fmt_meta_cap = ipu6_isys_vidioc_g_fmt_meta_cap,
+	.vidioc_s_fmt_meta_cap = ipu6_isys_vidioc_s_fmt_meta_cap,
+	.vidioc_try_fmt_meta_cap = ipu6_isys_vidioc_try_fmt_meta_cap,
+	.vidioc_reqbufs = ipu6_isys_vidioc_reqbufs,
+	.vidioc_create_bufs = ipu6_isys_vidioc_create_bufs,
 	.vidioc_prepare_buf = vb2_ioctl_prepare_buf,
 	.vidioc_querybuf = vb2_ioctl_querybuf,
 	.vidioc_qbuf = vb2_ioctl_qbuf,
@@ -1090,6 +1176,8 @@ void ipu6_isys_fw_close(struct ipu6_isys *isys)
 int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 			  struct media_entity **source_entity, int *nr_queues)
 {
+	const struct ipu6_isys_pixelformat *pfmt =
+		ipu6_isys_get_isys_format(ipu6_isys_get_format(av));
 	struct device *dev = &av->isys->adev->auxdev.dev;
 	struct v4l2_mbus_frame_desc_entry entry;
 	struct v4l2_subdev_route *route = NULL;
@@ -1141,7 +1229,7 @@ int ipu6_isys_setup_video(struct ipu6_isys_video *av,
 					     *source_entity, &entry);
 	if (ret == -ENOIOCTLCMD) {
 		av->vc = 0;
-		av->dt = ipu6_isys_mbus_code_to_mipi(av->pfmt->code);
+		av->dt = ipu6_isys_mbus_code_to_mipi(pfmt->code);
 	} else if (!ret) {
 		dev_dbg(dev, "Framedesc: stream %u, len %u, vc %u, dt %#x\n",
 			entry.stream, entry.length, entry.bus.csi2.vc,
@@ -1189,11 +1277,18 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 			.height = 1080,
 		},
 	};
+	struct v4l2_format format_meta = {
+		.type = V4L2_BUF_TYPE_META_CAPTURE,
+		.fmt.pix = {
+			.width = 1920,
+			.height = 4,
+		},
+	};
 	int ret;
 
 	mutex_init(&av->mutex);
 	av->vdev.device_caps = V4L2_CAP_STREAMING | V4L2_CAP_IO_MC |
-			       V4L2_CAP_VIDEO_CAPTURE;
+			       V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE;
 	av->vdev.vfl_dir = VFL_DIR_RX;
 
 	ret = ipu6_isys_queue_init(&av->aq);
@@ -1214,8 +1309,10 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	av->vdev.queue = &av->aq.vbq;
 	av->vdev.lock = &av->mutex;
 
-	ipu6_isys_video_try_fmt_vid(av, &format.fmt.pix);
+	__ipu6_isys_vidioc_try_fmt_vid_cap(av, &format);
 	av->pix_fmt = format.fmt.pix;
+	__ipu6_isys_vidioc_try_fmt_meta_cap(av, &format_meta);
+	av->meta_fmt = format_meta.fmt.meta;
 
 	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
@@ -1245,3 +1342,58 @@ void ipu6_isys_video_cleanup(struct ipu6_isys_video *av)
 	media_entity_cleanup(&av->vdev.entity);
 	mutex_destroy(&av->mutex);
 }
+
+u32 ipu6_isys_get_format(struct ipu6_isys_video *av)
+{
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return av->pix_fmt.pixelformat;
+
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		return av->meta_fmt.dataformat;
+
+	return 0;
+}
+
+u32 ipu6_isys_get_data_size(struct ipu6_isys_video *av)
+{
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return av->pix_fmt.sizeimage;
+
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		return av->meta_fmt.buffersize;
+
+	return 0;
+}
+
+u32 ipu6_isys_get_bytes_per_line(struct ipu6_isys_video *av)
+{
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return av->pix_fmt.bytesperline;
+
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		return av->meta_fmt.bytesperline;
+
+	return 0;
+}
+
+u32 ipu6_isys_get_frame_width(struct ipu6_isys_video *av)
+{
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return av->pix_fmt.width;
+
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		return av->meta_fmt.width;
+
+	return 0;
+}
+
+u32 ipu6_isys_get_frame_height(struct ipu6_isys_video *av)
+{
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return av->pix_fmt.height;
+
+	if (av->aq.vbq.type == V4L2_BUF_TYPE_META_CAPTURE)
+		return av->meta_fmt.height;
+
+	return 0;
+}
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
index 7b4e80678fec..fbc3c54da473 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.h
@@ -29,6 +29,7 @@ struct ipu6_isys_pixelformat {
 	u32 bpp_packed;
 	u32 code;
 	u32 css_pixelformat;
+	bool is_meta;
 };
 
 struct sequence_info {
@@ -91,7 +92,7 @@ struct ipu6_isys_video {
 	struct media_pad pad;
 	struct video_device vdev;
 	struct v4l2_pix_format pix_fmt;
-	const struct ipu6_isys_pixelformat *pfmt;
+	struct v4l2_meta_format meta_fmt;
 	struct ipu6_isys *isys;
 	struct ipu6_isys_csi2 *csi2;
 	struct ipu6_isys_stream *stream;
@@ -108,6 +109,8 @@ struct ipu6_isys_video {
 extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts[];
 extern const struct ipu6_isys_pixelformat ipu6_isys_pfmts_packed[];
 
+const struct ipu6_isys_pixelformat *
+ipu6_isys_get_isys_format(u32 pixelformat);
 int ipu6_isys_video_prepare_stream(struct ipu6_isys_video *av,
 				   struct media_entity *source_entity,
 				   int nr_queues);
@@ -129,4 +132,10 @@ void ipu6_isys_configure_stream_watermark(struct ipu6_isys_video *av,
 					  bool state);
 void ipu6_isys_update_stream_watermark(struct ipu6_isys_video *av, bool state);
 
+u32 ipu6_isys_get_format(struct ipu6_isys_video *av);
+u32 ipu6_isys_get_data_size(struct ipu6_isys_video *av);
+u32 ipu6_isys_get_bytes_per_line(struct ipu6_isys_video *av);
+u32 ipu6_isys_get_frame_width(struct ipu6_isys_video *av);
+u32 ipu6_isys_get_frame_height(struct ipu6_isys_video *av);
+
 #endif /* IPU6_ISYS_VIDEO_H */
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index d3918e26f631..5992138c7290 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -249,7 +249,6 @@ static int isys_register_video_devices(struct ipu6_isys *isys)
 			av->isys = isys;
 			av->aq.vbq.buf_struct_size =
 				sizeof(struct ipu6_isys_video_buffer);
-			av->pfmt = &ipu6_isys_pfmts[0];
 
 			ret = ipu6_isys_video_init(av);
 			if (ret)
-- 
2.39.2


