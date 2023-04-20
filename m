Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74FC96E8FA1
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 12:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234342AbjDTKNc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 06:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234328AbjDTKNH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 06:13:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2DD5FE1
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 03:09:53 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB9A675B;
        Thu, 20 Apr 2023 12:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681985384;
        bh=+9mjgAbuaYh2iArWfy1LrllwjzTGlH+62sFFiw+800M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NgKfHjrNG3IcUkzh/IeUvAxLnx3oJpAxWr6BcIoDBBlRyijvwt695TJlLXtl70pGz
         bhB/if+lSFgX105eekTo87OQX4geYnHFBPLGVdGukV7dJIxDfDq6Czx6BJ8ndaX4j3
         OE9sNFKl7zDTcUhWaL1VkSWydvg30RY/yvYXq8ao=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 1/4] media: uvcvideo: Rename uvc_streaming 'format' field to 'formats'
Date:   Thu, 20 Apr 2023 13:09:55 +0300
Message-Id: <20230420100958.10631-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com>
References: <20230420100958.10631-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The uvc_streaming 'format' field points to an array of formats. Rename
it to 'formats' to make this clearer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  4 ++--
 drivers/media/usb/uvc/uvc_v4l2.c   | 16 ++++++++--------
 drivers/media/usb/uvc/uvc_video.c  |  6 +++---
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 25b8199f4e82..77d4403b0b4f 100644
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
 	streaming->nformats = nformats;
 
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
index 50f171e7381b..9c8bea8d405c 100644
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

