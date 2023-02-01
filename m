Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A73F686BB4
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbjBAQ3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjBAQ3I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:29:08 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C812113
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:29:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A55346187D
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 16:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577CBC4339B;
        Wed,  1 Feb 2023 16:29:02 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Andy Walls <awalls@md.metrocast.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 8/8] cx18: fix format compliance issues
Date:   Wed,  1 Feb 2023 17:28:50 +0100
Message-Id: <20230201162850.886563-9-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
References: <20230201162850.886563-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This properly fills in all the format fields and calculates the
width and height correctly.

Esp. the minimum width and height was wrong.

When changing the standard the width and height also have to be
reset to the corresponding default width/height for the chosen
standard.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/cx18/cx18-ioctl.c | 71 ++++++++++++++++++-----------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index a6c98daa0ca9..1817b9ed042c 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -78,29 +78,43 @@ static int cx18_try_fmt_vid_cap(struct file *file, void *fh,
 {
 	struct cx18_open_id *id = fh2id(fh);
 	struct cx18 *cx = id->cx;
-	int w = fmt->fmt.pix.width;
-	int h = fmt->fmt.pix.height;
-	int min_h = 2;
+	struct v4l2_pix_format *pixfmt = &fmt->fmt.pix;
+	int w = pixfmt->width;
+	int h = pixfmt->height;
 
 	w = min(w, 720);
-	w = max(w, 2);
+	w = max(w, 720 / 16);
+
+	h = min(h, cx->is_50hz ? 576 : 480);
+	h = max(h, (cx->is_50hz ? 576 : 480) / 8);
 
 	if (id->type == CX18_ENC_STREAM_TYPE_YUV) {
-		if (fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_NV12_16L16 &&
-		    fmt->fmt.pix.pixelformat != V4L2_PIX_FMT_UYVY)
-			fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_UYVY;
+		if (pixfmt->pixelformat != V4L2_PIX_FMT_NV12_16L16 &&
+		    pixfmt->pixelformat != V4L2_PIX_FMT_UYVY)
+			pixfmt->pixelformat = V4L2_PIX_FMT_UYVY;
 		/* YUV height must be a multiple of 32 */
-		h &= ~0x1f;
-		min_h = 32;
+		h = round_up(h, 32);
+		/*
+		 * HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
+		 * UYUV YUV size is (Y=(h*720) + UV=(h*(720)))
+		 */
+		if (pixfmt->pixelformat == V4L2_PIX_FMT_NV12_16L16) {
+			pixfmt->sizeimage = h * 720 * 3 / 2;
+			pixfmt->bytesperline = 720; /* First plane */
+		} else {
+			pixfmt->sizeimage = h * 720 * 2;
+			pixfmt->bytesperline = 1440; /* Packed */
+		}
 	} else {
-		fmt->fmt.pix.pixelformat = V4L2_PIX_FMT_MPEG;
+		pixfmt->pixelformat = V4L2_PIX_FMT_MPEG;
+		pixfmt->sizeimage = 128 * 1024;
+		pixfmt->bytesperline = 0;
 	}
 
-	h = min(h, cx->is_50hz ? 576 : 480);
-	h = max(h, min_h);
-
-	fmt->fmt.pix.width = w;
-	fmt->fmt.pix.height = h;
+	pixfmt->width = w;
+	pixfmt->height = h;
+	pixfmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	pixfmt->field = V4L2_FIELD_INTERLACED;
 	return 0;
 }
 
@@ -130,17 +144,8 @@ static int cx18_s_fmt_vid_cap(struct file *file, void *fh,
 		return -EBUSY;
 
 	s->pixelformat = fmt->fmt.pix.pixelformat;
-	/*
-	 * HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
-	 * UYUV YUV size is (Y=(h*720) + UV=(h*(720)))
-	 */
-	if (s->pixelformat == V4L2_PIX_FMT_NV12_16L16) {
-		s->vb_bytes_per_frame = h * 720 * 3 / 2;
-		s->vb_bytes_per_line = 720; /* First plane */
-	} else {
-		s->vb_bytes_per_frame = h * 720 * 2;
-		s->vb_bytes_per_line = 1440; /* Packed */
-	}
+	s->vb_bytes_per_frame = fmt->fmt.pix.sizeimage;
+	s->vb_bytes_per_line = fmt->fmt.pix.bytesperline;
 
 	format.format.width = cx->cxhdl.width = w;
 	format.format.height = cx->cxhdl.height = h;
@@ -253,7 +258,6 @@ u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt)
 	return set;
 }
 
-
 static int cx18_g_fmt_vbi_cap(struct file *file, void *fh,
 				struct v4l2_format *fmt)
 {
@@ -614,6 +618,19 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 	cx2341x_handler_set_50hz(&cx->cxhdl, cx->is_50hz);
 	cx->cxhdl.width = 720;
 	cx->cxhdl.height = cx->is_50hz ? 576 : 480;
+	/*
+	 * HM12 YUV size is (Y=(h*720) + UV=(h*(720/2)))
+	 * UYUV YUV size is (Y=(h*720) + UV=(h*(720)))
+	 */
+	if (cx->streams[CX18_ENC_STREAM_TYPE_YUV].pixelformat == V4L2_PIX_FMT_NV12_16L16) {
+		cx->streams[CX18_ENC_STREAM_TYPE_YUV].vb_bytes_per_frame =
+			cx->cxhdl.height * 720 * 3 / 2;
+		cx->streams[CX18_ENC_STREAM_TYPE_YUV].vb_bytes_per_line = 720;
+	} else {
+		cx->streams[CX18_ENC_STREAM_TYPE_YUV].vb_bytes_per_frame =
+			cx->cxhdl.height * 720 * 2;
+		cx->streams[CX18_ENC_STREAM_TYPE_YUV].vb_bytes_per_line = 1440;
+	}
 	cx->vbi.count = cx->is_50hz ? 18 : 12;
 	cx->vbi.start[0] = cx->is_50hz ? 6 : 10;
 	cx->vbi.start[1] = cx->is_50hz ? 318 : 273;
-- 
2.39.0

