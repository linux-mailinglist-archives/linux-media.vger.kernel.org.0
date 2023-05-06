Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46C906F8FBD
	for <lists+linux-media@lfdr.de>; Sat,  6 May 2023 09:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjEFHOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 May 2023 03:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbjEFHO2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 May 2023 03:14:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105EA11617
        for <linux-media@vger.kernel.org>; Sat,  6 May 2023 00:14:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 928276B8;
        Sat,  6 May 2023 09:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1683357257;
        bh=OIg1T2yT4JWNjaErl4nAyJUQNJd+5lkZxB2laKla0sQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I6FEZB80riHitmeHqD4tuGCNz8Yn/aCpsDdlfLX+xB7klFvIJkAZBg2eXYTh8nFva
         f0a8RUzxQH9KqWr8la9I33CjuBsBM9B02ySm/Zw97/P5Vx+NSmCifORONV4H3Z/Iaq
         8BZawO6Yfs0HukQr7vTm60Ig/eRC6B/FaSoN4+RM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 1/7] media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
Date:   Sat,  6 May 2023 10:14:21 +0300
Message-Id: <20230506071427.28108-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
References: <20230506071427.28108-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc_streaming 'format' field points to an array of formats. Rename
it to 'formats' to make this clearer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 16 ++++++++--------
 drivers/media/usb/uvc/uvc_video.c  |  6 +++---
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index d631ce4f9f7b..6a4b3423b3b7 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -184,7 +184,7 @@ static void uvc_stream_delete(struct uvc_streaming *stream)
 
 	usb_put_intf(stream->intf);
 
-	kfree(stream->format);
+	kfree(stream->formats);
 	kfree(stream->header.bmaControls);
 	kfree(stream);
 }
@@ -677,7 +677,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	frame = (struct uvc_frame *)&format[nformats];
 	interval = (u32 *)&frame[nframes];
 
-	streaming->format = format;
+	streaming->formats = format;
 	streaming->nformats = 0;
 
 	/* Parse the format descriptors. */
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 35453f81c1d9..6960d7ebd904 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -235,7 +235,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	 * format otherwise.
 	 */
 	for (i = 0; i < stream->nformats; ++i) {
-		format = &stream->format[i];
+		format = &stream->formats[i];
 		if (format->fcc == fmt->fmt.pix.pixelformat)
 			break;
 	}
@@ -319,8 +319,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	 * accepted the requested format as-is.
 	 */
 	for (i = 0; i < stream->nformats; ++i) {
-		if (probe->bFormatIndex == stream->format[i].index) {
-			format = &stream->format[i];
+		if (probe->bFormatIndex == stream->formats[i].index) {
+			format = &stream->formats[i];
 			break;
 		}
 	}
@@ -708,7 +708,7 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
 	fmt->index = index;
 	fmt->type = type;
 
-	format = &stream->format[fmt->index];
+	format = &stream->formats[fmt->index];
 	fmt->flags = 0;
 	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
 		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
@@ -1256,8 +1256,8 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 
 	/* Look for the given pixel format */
 	for (i = 0; i < stream->nformats; i++) {
-		if (stream->format[i].fcc == fsize->pixel_format) {
-			format = &stream->format[i];
+		if (stream->formats[i].fcc == fsize->pixel_format) {
+			format = &stream->formats[i];
 			break;
 		}
 	}
@@ -1297,8 +1297,8 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 
 	/* Look for the given pixel format and frame size */
 	for (i = 0; i < stream->nformats; i++) {
-		if (stream->format[i].fcc == fival->pixel_format) {
-			format = &stream->format[i];
+		if (stream->formats[i].fcc == fival->pixel_format) {
+			format = &stream->formats[i];
 			break;
 		}
 	}
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index d4b023d4de7c..af540f435099 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -166,8 +166,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	}
 
 	for (i = 0; i < stream->nformats; ++i) {
-		if (stream->format[i].index == ctrl->bFormatIndex) {
-			format = &stream->format[i];
+		if (stream->formats[i].index == ctrl->bFormatIndex) {
+			format = &stream->formats[i];
 			break;
 		}
 	}
@@ -2161,7 +2161,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 	 * available format otherwise.
 	 */
 	for (i = stream->nformats; i > 0; --i) {
-		format = &stream->format[i-1];
+		format = &stream->formats[i-1];
 		if (format->index == probe->bFormatIndex)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a596c8d894a..05fec637417d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -438,7 +438,7 @@ struct uvc_streaming {
 	enum v4l2_buf_type type;
 
 	unsigned int nformats;
-	struct uvc_format *format;
+	struct uvc_format *formats;
 
 	struct uvc_streaming_control ctrl;
 	struct uvc_format *def_format;
-- 
Regards,

Laurent Pinchart

