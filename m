Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A45A6E8FA6
	for <lists+linux-media@lfdr.de>; Thu, 20 Apr 2023 12:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbjDTKNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Apr 2023 06:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234226AbjDTKNL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Apr 2023 06:13:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7769C5FFE
        for <linux-media@vger.kernel.org>; Thu, 20 Apr 2023 03:09:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20078E71;
        Thu, 20 Apr 2023 12:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681985390;
        bh=35QsGf5vrmxnK0Aosg4i+w60bBerm7e+j36iiU5p0m4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ncYBqRuDuUWPU1An/+/6w7CDxuPNZx3R/KAxyQ3dGM6cAmqCpPwyPbtg2iZfCKNW1
         fu6iWpM5LC/AGcmxWBGUvdVEABMHqLH0RR6+rPwyG4xOIsM+lIlGC/vlklbTw6Z2ZJ
         FJtZQNGKy2CPtbAD4spy2JHMaLCUux44Gu8DLews=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v1 2/4] media: uvcvideo: Rename uvc_format 'frame' field to 'frames'
Date:   Thu, 20 Apr 2023 13:09:56 +0300
Message-Id: <20230420100958.10631-3-laurent.pinchart@ideasonboard.com>
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

The uvc_format 'frame' field points to an array of frames. Rename it to
'frames' to make this clearer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_driver.c |  8 ++++----
 drivers/media/usb/uvc/uvc_v4l2.c   | 32 +++++++++++++++---------------
 drivers/media/usb/uvc/uvc_video.c  |  6 +++---
 drivers/media/usb/uvc/uvcvideo.h   |  2 +-
 4 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 77d4403b0b4f..16a6ab437c6a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -339,8 +339,8 @@ static int uvc_parse_format(struct uvc_device *dev,
 		ftype = 0;
 
 		/* Create a dummy frame descriptor. */
-		frame = &format->frame[0];
-		memset(&format->frame[0], 0, sizeof(format->frame[0]));
+		frame = &format->frames[0];
+		memset(&format->frames[0], 0, sizeof(format->frames[0]));
 		frame->bFrameIntervalType = 1;
 		frame->dwDefaultFrameInterval = 1;
 		frame->dwFrameInterval = *intervals;
@@ -370,7 +370,7 @@ static int uvc_parse_format(struct uvc_device *dev,
 	 */
 	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE &&
 	       buffer[2] == ftype) {
-		frame = &format->frame[format->nframes];
+		frame = &format->frames[format->nframes];
 		if (ftype != UVC_VS_FRAME_FRAME_BASED)
 			n = buflen > 25 ? buffer[25] : 0;
 		else
@@ -687,7 +687,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 		case UVC_VS_FORMAT_MJPEG:
 		case UVC_VS_FORMAT_DV:
 		case UVC_VS_FORMAT_FRAME_BASED:
-			format->frame = frame;
+			format->frames = frame;
 			ret = uvc_parse_format(dev, streaming, format,
 				&interval, buffer, buflen);
 			if (ret < 0)
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 6960d7ebd904..e7261b2543cb 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -255,14 +255,14 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 	maxd = (unsigned int)-1;
 
 	for (i = 0; i < format->nframes; ++i) {
-		u16 w = format->frame[i].wWidth;
-		u16 h = format->frame[i].wHeight;
+		u16 w = format->frames[i].wWidth;
+		u16 h = format->frames[i].wHeight;
 
 		d = min(w, rw) * min(h, rh);
 		d = w*h + rw*rh - 2*d;
 		if (d < maxd) {
 			maxd = d;
-			frame = &format->frame[i];
+			frame = &format->frames[i];
 		}
 
 		if (maxd == 0)
@@ -331,8 +331,8 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 			probe->bFormatIndex);
 
 	for (i = 0; i < format->nframes; ++i) {
-		if (probe->bFrameIndex == format->frame[i].bFrameIndex) {
-			frame = &format->frame[i];
+		if (probe->bFrameIndex == format->frames[i].bFrameIndex) {
+			frame = &format->frames[i];
 			break;
 		}
 	}
@@ -501,19 +501,19 @@ static int uvc_v4l2_set_streamparm(struct uvc_streaming *stream,
 	for (i = 0; i < format->nframes && maxd != 0; i++) {
 		u32 d, ival;
 
-		if (&format->frame[i] == stream->cur_frame)
+		if (&format->frames[i] == stream->cur_frame)
 			continue;
 
-		if (format->frame[i].wWidth != stream->cur_frame->wWidth ||
-		    format->frame[i].wHeight != stream->cur_frame->wHeight)
+		if (format->frames[i].wWidth != stream->cur_frame->wWidth ||
+		    format->frames[i].wHeight != stream->cur_frame->wHeight)
 			continue;
 
-		ival = uvc_try_frame_interval(&format->frame[i], interval);
+		ival = uvc_try_frame_interval(&format->frames[i], interval);
 		d = abs((s32)ival - interval);
 		if (d >= maxd)
 			continue;
 
-		frame = &format->frame[i];
+		frame = &format->frames[i];
 		probe.bFrameIndex = frame->bFrameIndex;
 		probe.dwFrameInterval = ival;
 		maxd = d;
@@ -1266,10 +1266,10 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 
 	/* Skip duplicate frame sizes */
 	for (i = 0, index = 0; i < format->nframes; i++) {
-		if (frame && frame->wWidth == format->frame[i].wWidth &&
-		    frame->wHeight == format->frame[i].wHeight)
+		if (frame && frame->wWidth == format->frames[i].wWidth &&
+		    frame->wHeight == format->frames[i].wHeight)
 			continue;
-		frame = &format->frame[i];
+		frame = &format->frames[i];
 		if (index == fsize->index)
 			break;
 		index++;
@@ -1307,9 +1307,9 @@ static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 
 	index = fival->index;
 	for (i = 0; i < format->nframes; i++) {
-		if (format->frame[i].wWidth == fival->width &&
-		    format->frame[i].wHeight == fival->height) {
-			frame = &format->frame[i];
+		if (format->frames[i].wWidth == fival->width &&
+		    format->frames[i].wHeight == fival->height) {
+			frame = &format->frames[i];
 			nintervals = frame->bFrameIntervalType ?: 1;
 			if (index < nintervals)
 				break;
diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index af540f435099..34c781b7dee2 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -176,8 +176,8 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 		return;
 
 	for (i = 0; i < format->nframes; ++i) {
-		if (format->frame[i].bFrameIndex == ctrl->bFrameIndex) {
-			frame = &format->frame[i];
+		if (format->frames[i].bFrameIndex == ctrl->bFrameIndex) {
+			frame = &format->frames[i];
 			break;
 		}
 	}
@@ -2179,7 +2179,7 @@ int uvc_video_init(struct uvc_streaming *stream)
 	 * descriptor is not found, use the first available frame.
 	 */
 	for (i = format->nframes; i > 0; --i) {
-		frame = &format->frame[i-1];
+		frame = &format->frames[i-1];
 		if (frame->bFrameIndex == probe->bFrameIndex)
 			break;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9c8bea8d405c..7b4bf52da19d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -265,7 +265,7 @@ struct uvc_format {
 	u32 flags;
 
 	unsigned int nframes;
-	struct uvc_frame *frame;
+	struct uvc_frame *frames;
 };
 
 struct uvc_streaming_header {
-- 
Regards,

Laurent Pinchart

