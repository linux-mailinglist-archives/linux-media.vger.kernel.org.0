Return-Path: <linux-media+bounces-31350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C9AA3C35
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 01:29:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3D13B3813
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 23:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F62DAF9B;
	Tue, 29 Apr 2025 23:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="p36qQdu2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE12DAF82;
	Tue, 29 Apr 2025 23:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969364; cv=none; b=WldYoq0vGI3UCMG7Zs8DtlYmCG1NgPWASW/9V/3e13FELtl+POIuo7WuKHxJ92BG+uQRbGpiGvPoCobkhskKoQBVhuLjFSWSOGoHuvjw9JA7wNjwJnZP5Vr1z1LX5z3d7A9z5MNc8hL/7VzJ36UQqdjeN4ZwNJTthUHWuw3xRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969364; c=relaxed/simple;
	bh=pZ7T98gGex0AkabijYNbR9ZbBp3ryIuf6IY4pK9VspI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBMYOU+a5ENhYsEeQRkgvoMnsN4weBVStOx3NzfuJNnYXuMXPDVX2u0+aIT8CGRPvz5Y8ia4YXMS0ng1Xuw4li2aOsNBFZ36Iu1K3uRVx6Xe6a6dDHpJ3FiW4+tEcZp/yMhWlGfk/w8+2HOHc+O9k7i9DzROLz9WuULevVV4tzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=p36qQdu2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B044725;
	Wed, 30 Apr 2025 01:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745969352;
	bh=pZ7T98gGex0AkabijYNbR9ZbBp3ryIuf6IY4pK9VspI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p36qQdu2C8WTfmcZaqcce7gQkpWkCxvO6Ky9VIDVGc4pH0b//lT+dNEwjzJYPKl06
	 MqIT2W8/SYeubsds0F0EKen/lsUrZzvm9J3//AXKHm/G0MBzgPxwIl5FuyKOyCyi6P
	 UBd31Gbzy/lJIG4u2jtGFUBFxJErv+a5Vym6tVbQ=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 5/9] media: renesas: vsp1: Report colour space information to userspace
Date: Wed, 30 Apr 2025 02:29:00 +0300
Message-ID: <20250429232904.26413-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsp1 driver implements very partial colour space support: it
hardcodes the colorspace field on all video devices and subdevices to
V4L2_COLORSPACE_SRGB, regardless of the configured format. The
xfer_func, ycbcr_enc and quantization fields are not set (except for
hsv_enc for HSV formats on video devices). This doesn't match the
hardware configuration, which handles YUV data as encoding in BT.601
with limited range.

As a first step towards colour space configuration, keep the colour
space fields hardcoded, but set them based on the selected format type
(RGB, YUV or HSV).

While at it, remove an extra blank line.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Drop unneeded colorspace adjustements when propagating RWPF formats
---
 .../media/platform/renesas/vsp1/vsp1_brx.c    |  9 +++-
 .../media/platform/renesas/vsp1/vsp1_entity.c | 22 +++++++++-
 .../media/platform/renesas/vsp1/vsp1_entity.h |  2 +
 .../media/platform/renesas/vsp1/vsp1_hsit.c   | 11 ++++-
 .../media/platform/renesas/vsp1/vsp1_pipe.c   | 44 +++++++++++++++++++
 .../media/platform/renesas/vsp1/vsp1_pipe.h   |  2 +
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 11 ++++-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  9 +++-
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  9 +++-
 .../media/platform/renesas/vsp1/vsp1_video.c  |  7 +--
 10 files changed, 115 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 5dee0490c593..5fc2e5a3bb30 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -15,6 +15,7 @@
 #include "vsp1.h"
 #include "vsp1_brx.h"
 #include "vsp1_dl.h"
+#include "vsp1_entity.h"
 #include "vsp1_pipe.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_video.h"
@@ -108,6 +109,8 @@ static void brx_try_format(struct vsp1_brx *brx,
 		if (fmt->code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
 		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
 			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
+
+		vsp1_entity_adjust_color_space(fmt);
 		break;
 
 	default:
@@ -115,13 +118,17 @@ static void brx_try_format(struct vsp1_brx *brx,
 		format = v4l2_subdev_state_get_format(sd_state,
 						      BRX_PAD_SINK(0));
 		fmt->code = format->code;
+
+		fmt->colorspace = format->colorspace;
+		fmt->xfer_func = format->xfer_func;
+		fmt->ycbcr_enc = format->ycbcr_enc;
+		fmt->quantization = format->quantization;
 		break;
 	}
 
 	fmt->width = clamp(fmt->width, BRX_MIN_SIZE, BRX_MAX_SIZE);
 	fmt->height = clamp(fmt->height, BRX_MIN_SIZE, BRX_MAX_SIZE);
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 }
 
 static int brx_set_format(struct v4l2_subdev *subdev,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 8b8945bd8f10..9f93ae86b1da 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -99,6 +99,20 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 						 dl, dlb);
 }
 
+void vsp1_entity_adjust_color_space(struct v4l2_mbus_framefmt *format)
+{
+	u8 xfer_func = format->xfer_func;
+	u8 ycbcr_enc = format->ycbcr_enc;
+	u8 quantization = format->quantization;
+
+	vsp1_adjust_color_space(format->code, &format->colorspace, &xfer_func,
+				&ycbcr_enc, &quantization);
+
+	format->xfer_func = xfer_func;
+	format->ycbcr_enc = ycbcr_enc;
+	format->quantization = quantization;
+}
+
 /* -----------------------------------------------------------------------------
  * V4L2 Subdevice Operations
  */
@@ -329,7 +343,13 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
 	format->height = clamp_t(unsigned int, fmt->format.height,
 				 min_height, max_height);
 	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
+
+	format->colorspace = fmt->format.colorspace;
+	format->xfer_func = fmt->format.xfer_func;
+	format->ycbcr_enc = fmt->format.ycbcr_enc;
+	format->quantization = fmt->format.quantization;
+
+	vsp1_entity_adjust_color_space(format);
 
 	fmt->format = *format;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
index 1bcc9e27dfdc..ce4a09610164 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
@@ -170,6 +170,8 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
 				     struct vsp1_dl_list *dl,
 				     struct vsp1_dl_body *dlb);
 
+void vsp1_entity_adjust_color_space(struct v4l2_mbus_framefmt *format);
+
 struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad);
 
 int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 8ba2a7c7305c..1fcd1967d3b2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -14,6 +14,7 @@
 
 #include "vsp1.h"
 #include "vsp1_dl.h"
+#include "vsp1_entity.h"
 #include "vsp1_hsit.h"
 
 #define HSIT_MIN_SIZE				4U
@@ -96,7 +97,13 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 	format->height = clamp_t(unsigned int, fmt->format.height,
 				 HSIT_MIN_SIZE, HSIT_MAX_SIZE);
 	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
+
+	format->colorspace = fmt->format.colorspace;
+	format->xfer_func = fmt->format.xfer_func;
+	format->ycbcr_enc = fmt->format.ycbcr_enc;
+	format->quantization = fmt->format.quantization;
+
+	vsp1_entity_adjust_color_space(format);
 
 	fmt->format = *format;
 
@@ -106,6 +113,8 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 	format->code = hsit->inverse ? MEDIA_BUS_FMT_ARGB8888_1X32
 		     : MEDIA_BUS_FMT_AHSV8888_1X32;
 
+	vsp1_entity_adjust_color_space(format);
+
 done:
 	mutex_unlock(&hsit->entity.lock);
 	return ret;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
index f7b133536704..b9ab6c9c96df 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
@@ -346,6 +346,50 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 	return NULL;
 }
 
+/**
+ * vsp1_adjust_color_space - Adjust color space fields in a format
+ * @code: the media bus code
+ * @colorspace: the colorspace
+ * @xfer_func: the transfer function
+ * @encoding: the encoding
+ * @quantization: the quantization
+ *
+ * This function adjusts all color space fields of a video device of subdev
+ * format structure, taking into account the requested format, requested color
+ * space and limitations of the VSP1. It should be used in the video device and
+ * subdev set format handlers.
+ *
+ * For now, simply hardcode the color space fields to the VSP1 defaults based
+ * on the media bus code.
+ */
+void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
+			     u8 *encoding, u8 *quantization)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_ARGB8888_1X32:
+	default:
+		*colorspace = V4L2_COLORSPACE_SRGB;
+		*xfer_func = V4L2_XFER_FUNC_SRGB;
+		*encoding = V4L2_YCBCR_ENC_601;
+		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
+		break;
+
+	case MEDIA_BUS_FMT_AHSV8888_1X32:
+		*colorspace = V4L2_COLORSPACE_SRGB;
+		*xfer_func = V4L2_XFER_FUNC_SRGB;
+		*encoding = V4L2_HSV_ENC_256;
+		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
+		break;
+
+	case MEDIA_BUS_FMT_AYUV8_1X32:
+		*colorspace = V4L2_COLORSPACE_SMPTE170M;
+		*xfer_func = V4L2_XFER_FUNC_709;
+		*encoding = V4L2_YCBCR_ENC_601;
+		*quantization = V4L2_QUANTIZATION_LIM_RANGE;
+		break;
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Pipeline Management
  */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
index 1d3d033af209..c88a3f0d5b1e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
@@ -182,5 +182,7 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
 const struct vsp1_format_info *
 vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
 			      u32 code);
+void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
+			     u8 *encoding, u8 *quantization);
 
 #endif /* __VSP1_PIPE_H__ */
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 1b4bac7b7cfa..4e8bcf6a59ad 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -10,6 +10,7 @@
 #include <media/v4l2-subdev.h>
 
 #include "vsp1.h"
+#include "vsp1_entity.h"
 #include "vsp1_rwpf.h"
 #include "vsp1_video.h"
 
@@ -90,6 +91,8 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 		else
 			format->code = sink_format->code;
 
+		vsp1_entity_adjust_color_space(format);
+
 		fmt->format = *format;
 		goto done;
 	}
@@ -100,7 +103,13 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
 	format->height = clamp_t(unsigned int, fmt->format.height,
 				 RWPF_MIN_HEIGHT, rwpf->max_height);
 	format->field = V4L2_FIELD_NONE;
-	format->colorspace = V4L2_COLORSPACE_SRGB;
+
+	format->colorspace = fmt->format.colorspace;
+	format->xfer_func = fmt->format.xfer_func;
+	format->ycbcr_enc = fmt->format.ycbcr_enc;
+	format->quantization = fmt->format.quantization;
+
+	vsp1_entity_adjust_color_space(format);
 
 	fmt->format = *format;
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
index 1759ce642e6e..bba2872afaf2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
@@ -14,6 +14,7 @@
 
 #include "vsp1.h"
 #include "vsp1_dl.h"
+#include "vsp1_entity.h"
 #include "vsp1_pipe.h"
 #include "vsp1_sru.h"
 
@@ -178,6 +179,8 @@ static void sru_try_format(struct vsp1_sru *sru,
 		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
 			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
 
+		vsp1_entity_adjust_color_space(fmt);
+
 		fmt->width = clamp(fmt->width, SRU_MIN_SIZE, SRU_MAX_SIZE);
 		fmt->height = clamp(fmt->height, SRU_MIN_SIZE, SRU_MAX_SIZE);
 		break;
@@ -187,6 +190,11 @@ static void sru_try_format(struct vsp1_sru *sru,
 		format = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
 		fmt->code = format->code;
 
+		fmt->colorspace = format->colorspace;
+		fmt->xfer_func = format->xfer_func;
+		fmt->ycbcr_enc = format->ycbcr_enc;
+		fmt->quantization = format->quantization;
+
 		/*
 		 * We can upscale by 2 in both direction, but not independently.
 		 * Compare the input and output rectangles areas (avoiding
@@ -211,7 +219,6 @@ static void sru_try_format(struct vsp1_sru *sru,
 	}
 
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 }
 
 static int sru_set_format(struct v4l2_subdev *subdev,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
index c5a38478cf8c..2db473b6f83c 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
@@ -14,6 +14,7 @@
 
 #include "vsp1.h"
 #include "vsp1_dl.h"
+#include "vsp1_entity.h"
 #include "vsp1_pipe.h"
 #include "vsp1_uds.h"
 
@@ -177,6 +178,8 @@ static void uds_try_format(struct vsp1_uds *uds,
 		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
 			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
 
+		vsp1_entity_adjust_color_space(fmt);
+
 		fmt->width = clamp(fmt->width, UDS_MIN_SIZE, UDS_MAX_SIZE);
 		fmt->height = clamp(fmt->height, UDS_MIN_SIZE, UDS_MAX_SIZE);
 		break;
@@ -186,6 +189,11 @@ static void uds_try_format(struct vsp1_uds *uds,
 		format = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
 		fmt->code = format->code;
 
+		fmt->colorspace = format->colorspace;
+		fmt->xfer_func = format->xfer_func;
+		fmt->ycbcr_enc = format->ycbcr_enc;
+		fmt->quantization = format->quantization;
+
 		uds_output_limits(format->width, &minimum, &maximum);
 		fmt->width = clamp(fmt->width, minimum, maximum);
 		uds_output_limits(format->height, &minimum, &maximum);
@@ -194,7 +202,6 @@ static void uds_try_format(struct vsp1_uds *uds,
 	}
 
 	fmt->field = V4L2_FIELD_NONE;
-	fmt->colorspace = V4L2_COLORSPACE_SRGB;
 }
 
 static int uds_set_format(struct v4l2_subdev *subdev,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
index da578993f472..68d495c20a84 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
@@ -127,12 +127,10 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
 		info = vsp1_get_format_info(video->vsp1, VSP1_VIDEO_DEF_FORMAT);
 
 	pix->pixelformat = info->fourcc;
-	pix->colorspace = V4L2_COLORSPACE_SRGB;
 	pix->field = V4L2_FIELD_NONE;
 
-	if (info->fourcc == V4L2_PIX_FMT_HSV24 ||
-	    info->fourcc == V4L2_PIX_FMT_HSV32)
-		pix->hsv_enc = V4L2_HSV_ENC_256;
+	vsp1_adjust_color_space(info->mbus, &pix->colorspace, &pix->xfer_func,
+				&pix->ycbcr_enc, &pix->quantization);
 
 	memset(pix->reserved, 0, sizeof(pix->reserved));
 
@@ -891,7 +889,6 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
 			  | V4L2_CAP_IO_MC | V4L2_CAP_VIDEO_CAPTURE_MPLANE
 			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
 
-
 	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
 	strscpy(cap->card, video->video.name, sizeof(cap->card));
 
-- 
Regards,

Laurent Pinchart


