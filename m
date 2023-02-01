Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE18686B3F
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbjBAQMJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:12:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjBAQMG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:12:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED107642D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:12:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9129A61706
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44917C4339C;
        Wed,  1 Feb 2023 16:12:03 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH 7/8] cx18: reorder fmt_vid_cap functions in cx18-ioctl.c
Date:   Wed,  1 Feb 2023 17:11:52 +0100
Message-Id: <20230201161153.883376-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
References: <20230201161153.883376-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

No actual code changed, this just reorders functions so that the
g/try/s_fmt_vid_cap functions are all together rather than mixed in
with the vbi format functions.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 195 ++++++++++++++--------------
 1 file changed, 98 insertions(+), 97 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index 549aa5e3c898..7403980e4ce1 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -49,6 +49,104 @@ static const struct v4l2_fmtdesc cx18_formats_mpeg[] = {
 	},
 };
 
+static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
+				struct v4l2_format *fmt)
+{
+	struct cx18_open_id *id = fh2id(fh);
+	struct cx18 *cx = id->cx;
+	struct cx18_stream *s = &cx->streams[id->type];
+	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
+
+	pixfmt->width = cx->cxhdl.width;
+	pixfmt->height = cx->cxhdl.height;
+	pixfmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	pixfmt->field = V4L2_FIELD_INTERLACED;
+	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
+		pixfmt->pixelformat = s->pixelformat;
+		pixfmt->sizeimage = s->vb_bytes_per_frame;
+		pixfmt->bytesperline = s->vb_bytes_per_line;
+	} else {
+		pixfmt->pixelformat = V4L2_PIX_FMT_MPEG;
+		pixfmt->sizeimage = 128 * 1024;
+		pixfmt->bytesperline = 0;
+	}
+	return 0;
+}
+
+static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
+				struct v4l2_format *fmt)
+{
+	struct cx18_open_id *id = fh2id(fh);
+	struct cx18 *cx = id->cx;
+	int w = fmt->fmt.pix.width;
+	int h = fmt->fmt.pix.height;
+	int min_h = 2;
+
+	w = min(w, 720);
+	w = max(w, 2);
+
+	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
+		if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_NV12_16L16 &&
+		    fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_UYVY)
+			fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
+		/* YUV height must be a multiple of 32 */
+		h &= ~0x1f;
+		min_h = 32;
+	} else {
+		fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
+	}
+
+	h = min(h, cx->is_50hz ? 576 : 480);
+	h = max(h, min_h);
+
+	fmt->fmt.pix.width = w;
+	fmt->fmt.pix.height = h;
+	return 0;
+}
+
+static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
+				struct v4l2_format *fmt)
+{
+	struct cx18_open_id *id = fh2id(fh);
+	struct cx18 *cx = id->cx;
+	struct v4l2_subdev_format format = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct cx18_stream *s = &cx->streams[id->type];
+	int ret;
+	int w, h;
+
+	ret = cx18_try_fmt_vid_cap(file, fh, fmt);
+	if (ret)
+		return ret;
+	w = fmt->fmt.pix.width;
+	h = fmt->fmt.pix.height;
+
+	if (cx->cxhdl.width == w && cx->cxhdl.height == h &&
+	    s->pixelformat == fmt->fmt.pix.pixelformat)
+		return 0;
+
+	if (atomic_read(&cx->ana_capturing) > 0)
+		return -EBUSY;
+
+	s->pixelformat = fmt->fmt.pix.pixelformat;
+	/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
+	   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
+	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16) {
+		s->vb_bytes_per_frame = h * 720 * 3 / 2;
+		s->vb_bytes_per_line = 720; /* First plane */
+	} else {
+		s->vb_bytes_per_frame = h * 720 * 2;
+		s->vb_bytes_per_line = 1440; /* Packed */
+	}
+
+	format.format.width = cx->cxhdl.width = w;
+	format.format.height = cx->cxhdl.height = h;
+	format.format.code = MEDIA_BUS_FMT_FIXED;
+	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, &format);
+	return cx18_g_fmt_vid_cap(file, fh, fmt);
+}
+
 u16 cx18_service2vbi(int type)
 {
 	switch (type) {
@@ -153,29 +251,6 @@ u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt)
 	return set;
 }
 
-static int cx18_g_fmt_vid_cap(struct file *file, void *fh,
-				struct v4l2_format *fmt)
-{
-	struct cx18_open_id *id = fh2id(fh);
-	struct cx18 *cx = id->cx;
-	struct cx18_stream *s = &cx->streams[id->type];
-	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
-
-	pixfmt->width = cx->cxhdl.width;
-	pixfmt->height = cx->cxhdl.height;
-	pixfmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
-	pixfmt->field = V4L2_FIELD_INTERLACED;
-	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
-		pixfmt->pixelformat = s->pixelformat;
-		pixfmt->sizeimage = s->vb_bytes_per_frame;
-		pixfmt->bytesperline = s->vb_bytes_per_line;
-	} else {
-		pixfmt->pixelformat = V4L2_PIX_FMT_MPEG;
-		pixfmt->sizeimage = 128 * 1024;
-		pixfmt->bytesperline = 0;
-	}
-	return 0;
-}
 
 static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
@@ -221,37 +296,6 @@ static int cx18_g_fmt_sliced_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
-				struct v4l2_format *fmt)
-{
-	struct cx18_open_id *id = fh2id(fh);
-	struct cx18 *cx = id->cx;
-	int w = fmt->fmt.pix.width;
-	int h = fmt->fmt.pix.height;
-	int min_h = 2;
-
-	w = min(w, 720);
-	w = max(w, 2);
-
-	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
-		if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_NV12_16L16 &&
-		    fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_UYVY)
-			fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
-		/* YUV height must be a multiple of 32 */
-		h &= ~0x1f;
-		min_h = 32;
-	} else {
-		fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
-	}
-
-	h = min(h, cx->is_50hz ? 576 : 480);
-	h = max(h, min_h);
-
-	fmt->fmt.pix.width = w;
-	fmt->fmt.pix.height = h;
-	return 0;
-}
-
 static int cx18_try_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
@@ -277,49 +321,6 @@ static int cx18_try_fmt_sliced_vbi_cap(struct file *file, void *fh,
 	return 0;
 }
 
-static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
-				struct v4l2_format *fmt)
-{
-	struct cx18_open_id *id = fh2id(fh);
-	struct cx18 *cx = id->cx;
-	struct v4l2_subdev_format format = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-	};
-	struct cx18_stream *s = &cx->streams[id->type];
-	int ret;
-	int w, h;
-
-	ret = cx18_try_fmt_vid_cap(file, fh, fmt);
-	if (ret)
-		return ret;
-	w = fmt->fmt.pix.width;
-	h = fmt->fmt.pix.height;
-
-	if (cx->cxhdl.width == w && cx->cxhdl.height == h &&
-	    s->pixelformat == fmt->fmt.pix.pixelformat)
-		return 0;
-
-	if (atomic_read(&cx->ana_capturing) > 0)
-		return -EBUSY;
-
-	s->pixelformat = fmt->fmt.pix.pixelformat;
-	/* HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
-	   UYUV YUV size is (Y=(h*720) + UV=(h*(720))) */
-	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16) {
-		s->vb_bytes_per_frame = h * 720 * 3 / 2;
-		s->vb_bytes_per_line = 720; /* First plane */
-	} else {
-		s->vb_bytes_per_frame = h * 720 * 2;
-		s->vb_bytes_per_line = 1440; /* Packed */
-	}
-
-	format.format.width = cx->cxhdl.width = w;
-	format.format.height = cx->cxhdl.height = h;
-	format.format.code = MEDIA_BUS_FMT_FIXED;
-	v4l2_subdev_call(cx->sd_av, pad, set_fmt, NULL, &format);
-	return cx18_g_fmt_vid_cap(file, fh, fmt);
-}
-
 static int cx18_s_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
-- 
2.39.0

