Return-Path: <linux-media+bounces-29703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 505D3A819F5
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 02:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02DB53BE3F3
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 00:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9996D6F305;
	Wed,  9 Apr 2025 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TpJTd4O2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2B29A0;
	Wed,  9 Apr 2025 00:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159125; cv=none; b=gQJCX1wYQ2KqRVQ/4OGBks1WZ7ImnbWCS08WLYSZWuR6AzN1RG/+qui0h0esm7JU/OqNsyB9XtizxDOFmb4dcsH7FqjwnRjscZdONAAe62kjMFzDlltkgzi8zxMfa/K0mW+Lj1XBJKSYMp1iikQ+mgzJ88rMajfGW6ukN/aU3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159125; c=relaxed/simple;
	bh=N72pQNSJaLPIrDxoxjpwb665h6CDY7nNUWAAV3gIfGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UM4JnhuOBdUre/op/7ci+DcxbbH9LcTHqQ3AbC9eRv1aY04a79xjCD5e6ryZwkcKnjXPJlprtyq9yBG7sn7Y5V4XoCnv53QmHz75mR8Z/TJZQK+NXD0ZJOJID+eHIkOgs5ZmG40uo3saj8utnQlsba7TelivjzHNkB76pglRFA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TpJTd4O2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBE6983D;
	Wed,  9 Apr 2025 02:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159003;
	bh=N72pQNSJaLPIrDxoxjpwb665h6CDY7nNUWAAV3gIfGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TpJTd4O2/929oK2M8IAjy9HJqVhGaFAk0S/HsCadOKUWJ27iiZNlHmIpU8Y9JRgPb
	 CsmIudFCv4QeFEQURMzMD8DOP0L3YnGKR/lyM6PcgCg5oxDYL/FvEsS1cDtFdQU+Jd
	 FUXFsvpHpDV61H5/D1WMIUI5UZGAZNqdJtweW3Fo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 1/6] media: renesas: vsp1: Implement pixel format enumeration
Date: Wed,  9 Apr 2025 03:38:10 +0300
Message-ID: <20250409003815.10253-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250409003815.10253-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VSP1 driver is missing the ability to enumerate pixel formats on its
video nodes, which is supposed to be supported according to the V4L2
API. Implement the enumeration to fix this issue.

As the device is media controller-centric, also implement the ability to
filter pixel formats by media bus code, and report the missing
V4L2_CAP_IO_MC capability.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 103 ++++++++++++++----
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |   3 +
 .../media/platform/renesas/vsp1/vsp1_video.c  |  24 +++-
 3 files changed, 105 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index bb0739f684f3..16a78a00c6c9 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -138,14 +138,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 32, 0, 0 }, false, false, 1, 1, false },
-	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
-	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 24, 0, 0 }, false, false, 1, 1, false },
-	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
-	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 32, 0, 0 }, false, false, 1, 1, false },
 	{ V4L2_PIX_FMT_RGBX1010102, MEDIA_BUS_FMT_ARGB8888_1X32,
 	  VI6_FMT_RGB10_RGB10A2_A2RGB10,
 	  VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS,
@@ -162,10 +154,6 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
 	  1, { 16, 0, 0 }, false, false, 2, 1, false },
-	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
-	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
-	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
-	  1, { 16, 0, 0 }, false, true, 2, 1, false },
 	{ V4L2_PIX_FMT_YUYV, MEDIA_BUS_FMT_AYUV8_1X32,
 	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
 	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
@@ -222,6 +210,21 @@ static const struct vsp1_format_info vsp1_video_formats[] = {
 	  1, { 32, 0, 0 }, false, false, 2, 1, false },
 };
 
+static const struct vsp1_format_info vsp1_video_gen2_formats[] = {
+	{ V4L2_PIX_FMT_VYUY, MEDIA_BUS_FMT_AYUV8_1X32,
+	  VI6_FMT_YUYV_422, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 16, 0, 0 }, false, true, 2, 1, false },
+	{ V4L2_PIX_FMT_HSV24, MEDIA_BUS_FMT_AHSV8888_1X32,
+	  VI6_FMT_RGB_888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 24, 0, 0 }, false, false, 1, 1, false },
+	{ V4L2_PIX_FMT_HSV32, MEDIA_BUS_FMT_AHSV8888_1X32,
+	  VI6_FMT_ARGB_8888, VI6_RPF_DSWAP_P_LLS | VI6_RPF_DSWAP_P_LWS |
+	  VI6_RPF_DSWAP_P_WDS | VI6_RPF_DSWAP_P_BTS,
+	  1, { 32, 0, 0 }, false, false, 1, 1, false },
+};
+
 /**
  * vsp1_get_format_info - Retrieve format information for a 4CC
  * @vsp1: the VSP1 device
@@ -235,16 +238,6 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 {
 	unsigned int i;
 
-	/* Special case, the VYUY and HSV formats are supported on Gen2 only. */
-	if (vsp1->info->gen != 2) {
-		switch (fourcc) {
-		case V4L2_PIX_FMT_VYUY:
-		case V4L2_PIX_FMT_HSV24:
-		case V4L2_PIX_FMT_HSV32:
-			return NULL;
-		}
-	}
-
 	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
 		const struct vsp1_format_info *info = &vsp1_video_formats[i];
 
@@ -252,6 +245,72 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 			return info;
 	}
 
+	if (vsp1->info->gen == 2) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_gen2_formats[i];
+
+			if (info->fourcc == fourcc)
+				return info;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * vsp1_get_format_info_by_index - Enumerate format information
+ * @vsp1: the VSP1 device
+ * @index: the format index
+ * @code: media bus code to limit enumeration
+ *
+ * Return a pointer to the format information structure corresponding to the
+ * given index, or NULL if the index exceeds the supported formats list. If the
+ * @code parameter is not zero, only formats compatible with the media bus code
+ * will be enumerated.
+ */
+const struct vsp1_format_info *
+vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
+			      u32 code)
+{
+	unsigned int i;
+
+	if (!code) {
+		if (index < ARRAY_SIZE(vsp1_video_formats))
+			return &vsp1_video_formats[index];
+
+		if (vsp1->info->gen == 2) {
+			index -= ARRAY_SIZE(vsp1_video_formats);
+			if (index < ARRAY_SIZE(vsp1_video_gen2_formats))
+				return &vsp1_video_gen2_formats[index];
+		}
+
+		return NULL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_video_formats); ++i) {
+		const struct vsp1_format_info *info = &vsp1_video_formats[i];
+
+		if (info->mbus == code) {
+			if (!index)
+				return info;
+			index--;
+		}
+	}
+
+	if (vsp1->info->gen == 2) {
+		for (i = 0; i < ARRAY_SIZE(vsp1_video_gen2_formats); ++i) {
+			const struct vsp1_format_info *info =
+				&vsp1_video_gen2_formats[i];
+
+			if (info->mbus == code) {
+				if (!index)
+					return info;
+				index--;
+			}
+		}
+	}
+
 	return NULL;
 }
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 1ba7bdbad5a8..1d3d033af209 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -179,5 +179,8 @@ void vsp1_pipeline_calculate_partition(struct vsp1_pipeline *pipe,
 
 const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 						    u32 fourcc);
+const struct vsp1_format_info *
+vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
+			      u32 code);
 
 #endif /* __VSP1_PIPE_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index 03f4efd6b82b..da578993f472 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -888,7 +888,7 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
 
 	cap->capabilities = V4L2_CAP_DEVICE_CAPS | V4L2_CAP_STREAMING
-			  | V4L2_CAP_VIDEO_CAPTURE_MPLANE
+			  | V4L2_CAP_IO_MC | V4L2_CAP_VIDEO_CAPTURE_MPLANE
 			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
 
 
@@ -898,6 +898,22 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 	return 0;
 }
 
+static int vsp1_video_enum_format(struct file *file, void *fh,
+				  struct v4l2_fmtdesc *f)
+{
+	struct v4l2_fh *vfh = file->private_data;
+	struct vsp1_video *video = to_vsp1_video(vfh->vdev);
+	const struct vsp1_format_info *info;
+
+	info = vsp1_get_format_info_by_index(video->vsp1, f->index, f->mbus_code);
+	if (!info)
+		return -EINVAL;
+
+	f->pixelformat = info->fourcc;
+
+	return 0;
+}
+
 static int
 vsp1_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
 {
@@ -1013,6 +1029,8 @@ vsp1_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 
 static const struct v4l2_ioctl_ops vsp1_video_ioctl_ops = {
 	.vidioc_querycap		= vsp1_video_querycap,
+	.vidioc_enum_fmt_vid_cap	= vsp1_video_enum_format,
+	.vidioc_enum_fmt_vid_out	= vsp1_video_enum_format,
 	.vidioc_g_fmt_vid_cap_mplane	= vsp1_video_get_format,
 	.vidioc_s_fmt_vid_cap_mplane	= vsp1_video_set_format,
 	.vidioc_try_fmt_vid_cap_mplane	= vsp1_video_try_format,
@@ -1207,14 +1225,14 @@ struct vsp1_video *vsp1_video_create(struct vsp1_device *vsp1,
 		video->pad.flags = MEDIA_PAD_FL_SOURCE;
 		video->video.vfl_dir = VFL_DIR_TX;
 		video->video.device_caps = V4L2_CAP_VIDEO_OUTPUT_MPLANE |
-					   V4L2_CAP_STREAMING;
+					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	} else {
 		direction = "output";
 		video->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 		video->pad.flags = MEDIA_PAD_FL_SINK;
 		video->video.vfl_dir = VFL_DIR_RX;
 		video->video.device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
-					   V4L2_CAP_STREAMING;
+					   V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	}
 
 	mutex_init(&video->lock);
-- 
Regards,

Laurent Pinchart


