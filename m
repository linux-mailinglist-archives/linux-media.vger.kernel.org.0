Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6CA3E0C84
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 04:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhHECta (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Aug 2021 22:49:30 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50124 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhHECt3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Aug 2021 22:49:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AFB251F43B23
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Yong Deng <yong.deng@magewell.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 2/4] media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
Date:   Wed,  4 Aug 2021 23:47:50 -0300
Message-Id: <20210805024752.8755-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805024752.8755-1-ezequiel@collabora.com>
References: <20210805024752.8755-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_PIX_FMT_HM12 format is actually a simple NV12 tiled format,
with 16x16 linear tiles. Rename the format and move its documentation
together with the other tiled NV12 formats.

Keep V4L2_PIX_FMT_HM12 for application compatibility.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 Documentation/admin-guide/media/ivtv.rst               |  2 +-
 .../userspace-api/media/drivers/cx2341x-uapi.rst       |  8 +++-----
 .../userspace-api/media/v4l/pixfmt-reserved.rst        |  8 --------
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst      |  6 ++++++
 .../userspace-api/media/videodev2.h.rst.exceptions     |  1 +
 drivers/media/pci/cx18/cx18-ioctl.c                    |  4 ++--
 drivers/media/pci/cx18/cx18-streams.c                  |  8 ++++----
 drivers/media/pci/ivtv/ivtv-ioctl.c                    |  8 ++++----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c     | 10 +++++-----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h     |  2 +-
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c   |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                   |  2 +-
 include/uapi/linux/videodev2.h                         |  3 ++-
 13 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/Documentation/admin-guide/media/ivtv.rst b/Documentation/admin-guide/media/ivtv.rst
index 7b8775d20214..101f16d0263e 100644
--- a/Documentation/admin-guide/media/ivtv.rst
+++ b/Documentation/admin-guide/media/ivtv.rst
@@ -159,7 +159,7 @@ whatever). Otherwise the device numbers can get confusing. The ivtv
   Read-only
 
   The raw YUV video output from the current video input. The YUV format
-  is non-standard (V4L2_PIX_FMT_HM12).
+  is a 16x16 linear tiled NV12 format (V4L2_PIX_FMT_NV12_16L16)
 
   Note that the YUV and PCM streams are not synchronized, so they are of
   limited use.
diff --git a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
index 8a7977af79d5..debde65fb8cd 100644
--- a/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
+++ b/Documentation/userspace-api/media/drivers/cx2341x-uapi.rst
@@ -7,9 +7,7 @@ Non-compressed file format
 --------------------------
 
 The cx23416 can produce (and the cx23415 can also read) raw YUV output. The
-format of a YUV frame is specific to this chip and is called HM12. 'HM' stands
-for 'Hauppauge Macroblock', which is a misnomer as 'Conexant Macroblock' would
-be more accurate.
+format of a YUV frame is 16x16 linear tiled NV12 (V4L2_PIX_FMT_NV12_16L16).
 
 The format is YUV 4:2:0 which uses 1 Y byte per pixel and 1 U and V byte per
 four pixels.
@@ -34,8 +32,8 @@ second line of 8 UV pairs of the top-left block, etc. After transmitting
 this block the first line of the block on the right to the first block is
 transmitted, etc.
 
-The code below is given as an example on how to convert HM12 to separate
-Y, U and V planes. This code assumes frames of 720x576 (PAL) pixels.
+The code below is given as an example on how to convert V4L2_PIX_FMT_NV12_16L16
+to separate Y, U and V planes. This code assumes frames of 720x576 (PAL) pixels.
 
 The width of a frame is always 720 pixels, regardless of the actual specified
 width.
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
index e762f911737a..adcad9454175 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
@@ -48,14 +48,6 @@ please make a proposal on the linux-media mailing list.
       - ``V4L2_PIX_FMT_HI240``
       - 'HI24'
       - 8 bit RGB format used by the BTTV driver.
-    * .. _V4L2-PIX-FMT-HM12:
-
-      - ``V4L2_PIX_FMT_HM12``
-      - 'HM12'
-      - YUV 4:2:0 format used by the IVTV driver.
-
-	The format is documented in the kernel sources in the file
-	``Documentation/userspace-api/media/drivers/cx2341x-uapi.rst``
     * .. _V4L2-PIX-FMT-CPIA1:
 
       - ``V4L2_PIX_FMT_CPIA1``
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index edeaf7628b28..884828f2272c 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -254,6 +254,7 @@ of the luma plane.
 
 .. _V4L2-PIX-FMT-NV12MT:
 .. _V4L2-PIX-FMT-NV12MT-16X16:
+.. _V4L2-PIX-FMT-NV12-16L16:
 .. _V4L2-PIX-FMT-NV12-32L32:
 
 Tiled NV12
@@ -278,6 +279,11 @@ If the vertical resolution is an odd number of macroblocks, the last row of
 macroblocks is stored in linear order. The layouts of the luma and chroma
 planes are identical.
 
+``V4L2_PIX_FMT_NV12_16L16`` stores pixel in 16x16 tiles, and stores
+tiles linearly in memory. The line stride and image height must be
+aligned to a multiple of 16. The layouts of the luma and chroma planes are
+identical.
+
 ``V4L2_PIX_FMT_NV12_32L32`` stores pixel in 32x32 tiles, and stores
 tiles linearly in memory. The line stride and image height must be
 aligned to a multiple of 32. The layouts of the luma and chroma planes are
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 982675a2342e..eb0b1cd37abd 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -187,6 +187,7 @@ replace define V4L2_CAP_IO_MC device-capabilities
 # V4L2 pix flags
 replace define V4L2_PIX_FMT_PRIV_MAGIC :c:type:`v4l2_pix_format`
 replace define V4L2_PIX_FMT_FLAG_PREMUL_ALPHA format-flags
+replace define V4L2_PIX_FMT_HM12 :c:type:`v4l2_pix_format`
 replace define V4L2_PIX_FMT_SUNXI_TILED_NV12 :c:type:`v4l2_pix_format`
 
 # V4L2 format flags
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 4864def20676..ce3f0141f94e 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -276,7 +276,7 @@ static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 	s->pixelformat = fmt->fmt.pix.pixelformat;
 	/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
 	   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-	if (s->pixelformat == V4L2_PIX_FMT_HM12) {
+	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16) {
 		s->vb_bytes_per_frame = h * 720 * 3 / 2;
 		s->vb_bytes_per_line = 720; /* First plane */
 	} else {
@@ -470,7 +470,7 @@ static int cx18_enum_fmt_vid_cap(struct file *file, void *fh,
 			.index = 0,
 			.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
 			.description = "HM12 (YUV 4:1:1)",
-			.pixelformat = V4L2_PIX_FMT_HM12,
+			.pixelformat = V4L2_PIX_FMT_NV12_16L16,
 		},
 		{
 			.index = 1,
diff --git a/drivers/media/pci/cx18/cx18-streams.c b/drivers/media/pci/cx18/cx18-streams.c
index c41bae118415..16d37ab48906 100644
--- a/drivers/media/pci/cx18/cx18-streams.c
+++ b/drivers/media/pci/cx18/cx18-streams.c
@@ -133,7 +133,7 @@ static int cx18_prepare_buffer(struct videobuf_queue *q,
 
 		/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
 		   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-		if (s->pixelformat == V4L2_PIX_FMT_HM12)
+		if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
 			s->vb_bytes_per_frame = height * 720 * 3 / 2;
 		else
 			s->vb_bytes_per_frame = height * 720 * 2;
@@ -155,7 +155,7 @@ static int cx18_prepare_buffer(struct videobuf_queue *q,
 
 		/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
 		   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-		if (s->pixelformat == V4L2_PIX_FMT_HM12)
+		if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
 			s->vb_bytes_per_frame = height * 720 * 3 / 2;
 		else
 			s->vb_bytes_per_frame = height * 720 * 2;
@@ -287,7 +287,7 @@ static void cx18_stream_init(struct cx18 *cx, int type)
 			s, &cx->serialize_lock);
 
 		/* Assume the previous pixel default */
-		s->pixelformat = V4L2_PIX_FMT_HM12;
+		s->pixelformat = V4L2_PIX_FMT_NV12_16L16;
 		s->vb_bytes_per_frame = cx->cxhdl.height * 720 * 3 / 2;
 		s->vb_bytes_per_line = 720;
 	}
@@ -733,7 +733,7 @@ static void cx18_stream_configure_mdls(struct cx18_stream *s)
 		 * Set the MDL size to the exact size needed for one frame.
 		 * Use enough buffers per MDL to cover the MDL size
 		 */
-		if (s->pixelformat == V4L2_PIX_FMT_HM12)
+		if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16)
 			s->mdl_size = 720 * s->cx->cxhdl.height * 3 / 2;
 		else
 			s->mdl_size = 720 * s->cx->cxhdl.height * 2;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index da19b2e95e6c..0cdf6b3210c2 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -339,7 +339,7 @@ static int ivtv_g_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 	pixfmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
 	pixfmt->field = V4L2_FIELD_INTERLACED;
 	if (id->type == IVTV_ENC_STREAM_TYPE_YUV) {
-		pixfmt->pixelformat = V4L2_PIX_FMT_HM12;
+		pixfmt->pixelformat = V4L2_PIX_FMT_NV12_16L16;
 		/* YUV size is (Y=(h*720) + UV=(h*(720/2))) */
 		pixfmt->sizeimage = pixfmt->height * 720 * 3 / 2;
 		pixfmt->bytesperline = 720;
@@ -417,7 +417,7 @@ static int ivtv_g_fmt_vid_out(struct file *file, void *fh, struct v4l2_format *f
 			pixfmt->field = V4L2_FIELD_ANY;
 			break;
 		}
-		pixfmt->pixelformat = V4L2_PIX_FMT_HM12;
+		pixfmt->pixelformat = V4L2_PIX_FMT_NV12_16L16;
 		pixfmt->bytesperline = 720;
 		pixfmt->width = itv->yuv_info.v4l2_src_w;
 		pixfmt->height = itv->yuv_info.v4l2_src_h;
@@ -917,7 +917,7 @@ static int ivtv_enum_fmt_vid_cap(struct file *file, void *fh, struct v4l2_fmtdes
 	static const struct v4l2_fmtdesc hm12 = {
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
 		.description = "HM12 (YUV 4:2:0)",
-		.pixelformat = V4L2_PIX_FMT_HM12,
+		.pixelformat = V4L2_PIX_FMT_NV12_16L16,
 	};
 	static const struct v4l2_fmtdesc mpeg = {
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
@@ -944,7 +944,7 @@ static int ivtv_enum_fmt_vid_out(struct file *file, void *fh, struct v4l2_fmtdes
 	static const struct v4l2_fmtdesc hm12 = {
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
 		.description = "HM12 (YUV 4:2:0)",
-		.pixelformat = V4L2_PIX_FMT_HM12,
+		.pixelformat = V4L2_PIX_FMT_NV12_16L16,
 	};
 	static const struct v4l2_fmtdesc mpeg = {
 		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT,
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index 27935f1e9555..68698fc51921 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -61,7 +61,7 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *csi,
 	     || sdev->csi.v4l2_ep.bus_type == V4L2_MBUS_BT656)
 	     && sdev->csi.v4l2_ep.bus.parallel.bus_width == 16) {
 		switch (pixformat) {
-		case V4L2_PIX_FMT_HM12:
+		case V4L2_PIX_FMT_NV12_16L16:
 		case V4L2_PIX_FMT_NV12:
 		case V4L2_PIX_FMT_NV21:
 		case V4L2_PIX_FMT_NV16:
@@ -124,7 +124,7 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *csi,
 	case V4L2_PIX_FMT_VYUY:
 		return (mbus_code == MEDIA_BUS_FMT_VYUY8_2X8);
 
-	case V4L2_PIX_FMT_HM12:
+	case V4L2_PIX_FMT_NV12_16L16:
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_NV16:
@@ -269,7 +269,7 @@ static enum csi_output_fmt get_csi_output_format(struct sun6i_csi_dev *sdev,
 	case V4L2_PIX_FMT_VYUY:
 		return buf_interlaced ? CSI_FRAME_RAW_8 : CSI_FIELD_RAW_8;
 
-	case V4L2_PIX_FMT_HM12:
+	case V4L2_PIX_FMT_NV12_16L16:
 		return buf_interlaced ? CSI_FRAME_MB_YUV420 :
 					CSI_FIELD_MB_YUV420;
 	case V4L2_PIX_FMT_NV12:
@@ -311,7 +311,7 @@ static enum csi_input_seq get_csi_input_seq(struct sun6i_csi_dev *sdev,
 		return 0;
 
 	switch (pixformat) {
-	case V4L2_PIX_FMT_HM12:
+	case V4L2_PIX_FMT_NV12_16L16:
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV16:
 	case V4L2_PIX_FMT_YUV420:
@@ -526,7 +526,7 @@ static void sun6i_csi_set_window(struct sun6i_csi_dev *sdev)
 
 	planar_offset[0] = 0;
 	switch (config->pixelformat) {
-	case V4L2_PIX_FMT_HM12:
+	case V4L2_PIX_FMT_NV12_16L16:
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_NV16:
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index c626821aaedb..3a38d107ae3f 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -105,7 +105,7 @@ static inline int sun6i_csi_get_bpp(unsigned int pixformat)
 	case V4L2_PIX_FMT_SGBRG12:
 	case V4L2_PIX_FMT_SGRBG12:
 	case V4L2_PIX_FMT_SRGGB12:
-	case V4L2_PIX_FMT_HM12:
+	case V4L2_PIX_FMT_NV12_16L16:
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV21:
 	case V4L2_PIX_FMT_YUV420:
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 07b2161392d2..33459892c1a9 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -48,7 +48,7 @@ static const u32 supported_pixformats[] = {
 	V4L2_PIX_FMT_YVYU,
 	V4L2_PIX_FMT_UYVY,
 	V4L2_PIX_FMT_VYUY,
-	V4L2_PIX_FMT_HM12,
+	V4L2_PIX_FMT_NV12_16L16,
 	V4L2_PIX_FMT_NV12,
 	V4L2_PIX_FMT_NV21,
 	V4L2_PIX_FMT_YUV420,
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index ed194e9da7b0..8731d65ad39e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1274,7 +1274,6 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV410:	descr = "Planar YUV 4:1:0"; break;
 	case V4L2_PIX_FMT_YUV420:	descr = "Planar YUV 4:2:0"; break;
 	case V4L2_PIX_FMT_HI240:	descr = "8-bit Dithered RGB (BTTV)"; break;
-	case V4L2_PIX_FMT_HM12:		descr = "YUV 4:2:0 (16x16 Macroblocks)"; break;
 	case V4L2_PIX_FMT_M420:		descr = "YUV 4:2:0 (M420)"; break;
 	case V4L2_PIX_FMT_NV12:		descr = "Y/CbCr 4:2:0"; break;
 	case V4L2_PIX_FMT_NV21:		descr = "Y/CrCb 4:2:0"; break;
@@ -1282,6 +1281,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
 	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
 	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
+	case V4L2_PIX_FMT_NV12_16L16:	descr = "Y/CbCr 4:2:0 (16x16 Linear)"; break;
 	case V4L2_PIX_FMT_NV12_32L32:   descr = "Y/CbCr 4:2:0 (32x32 Linear)"; break;
 	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 0188cd39468f..40fec00ce73a 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -601,7 +601,6 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
-#define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
 
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
@@ -628,6 +627,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_YVU444M v4l2_fourcc('Y', 'M', '4', '2') /* 24  YVU444 planar */
 
 /* Tiled YUV formats */
+#define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
@@ -2619,6 +2619,7 @@ struct v4l2_create_buffers {
 
 /* Deprecated definitions kept for backwards compatibility */
 #ifndef __KERNEL__
+#define V4L2_PIX_FMT_HM12 V4L2_PIX_FMT_NV12_16L16
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 V4L2_PIX_FMT_NV12_32L32
 #endif
 
-- 
2.32.0

