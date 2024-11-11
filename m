Return-Path: <linux-media+bounces-21265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D29C43D8
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 18:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBB891F22E23
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 17:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F94F1AE014;
	Mon, 11 Nov 2024 17:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FMue2rJH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34211A9B3A
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 17:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346618; cv=none; b=SfBSKbl4FZJm+Z09jMhNt+MbJs79+XqGpm8HqLCg81MPeaKB1uoz+FSVCe4HYS4tthFay+gqBiLOQZ6UpVx6xjrNQO+hR06o6ER9xbmZfmJahF6FFS9PyaJ2Egl21ZBRlGZS7+cbsp/+H4DyN3lGPNNyEQVri81QZzmL1LL1Wc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346618; c=relaxed/simple;
	bh=D4id7VakC7hPHNlsGaJB5JUJdfd4//iCnmao+BNS7cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FsDfNNSAF3DaVPGRln3ae3dt1Dyzz8eTKA8KKudwsE7D1oRa3APHN41vYCrzlQqhOFLquqGqZeYE9dc0RKyDFFkr3Jp4mlhrrSekoi0gNyqgXVui2aKsXv6oOsWdo8sTdQnZAJIODv6IKvMjROSD60sNWlKxi4ubvP6XxeDAaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FMue2rJH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from isaac-ThinkPad-T16-Gen-2.local (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F2DBFF6;
	Mon, 11 Nov 2024 18:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731346597;
	bh=D4id7VakC7hPHNlsGaJB5JUJdfd4//iCnmao+BNS7cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FMue2rJHZ8OQsFCjImMvcSyzIfh3lo0C4GnCJi61vOm+YaZg+frg4iB8CvPbj0iBa
	 FK6Aa3Hgg6y6qL+uOmlIReoFBF4iIJ0H5h75p2yL2IbWSiQTPLaomml4oNtwQYePMX
	 TWC/tSOgxXw5Ky+RwlayEzlEAzYLJdpJsmMwy2rI=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v5 1/2] media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
Date: Mon, 11 Nov 2024 17:36:38 +0000
Message-ID: <20241111173639.25131-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111173639.25131-1-isaac.scott@ideasonboard.com>
References: <20241111173639.25131-1-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some cameras, such as the Sonix Technology Co. 292A exhibit issues when
running two parallel streams, causing USB packets to be dropped when an
H.264 stream posts a keyframe while an MJPEG stream is running
simultaneously. This occasionally causes the driver to erroneously
output two consecutive JPEG images as a single frame.

To fix this, we inspect the buffer, and trigger a new frame when we
find an SOI.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e00f38dd07d9..028f16dc189a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -21,6 +21,7 @@
 #include <linux/unaligned.h>
 
 #include <media/v4l2-common.h>
+#include <media/jpeg.h>
 
 #include "uvcvideo.h"
 
@@ -1117,6 +1118,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		struct uvc_buffer *buf, const u8 *data, int len)
 {
 	u8 fid;
+	u8 header_len;
 
 	/*
 	 * Sanity checks:
@@ -1129,6 +1131,8 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		return -EINVAL;
 	}
 
+	header_len = data[0];
+
 	fid = data[1] & UVC_STREAM_FID;
 
 	/*
@@ -1210,9 +1214,30 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		return -EAGAIN;
 	}
 
+	/*
+	 * Some cameras, when running two parallel streams (one MJPEG alongside
+	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
+	 * We can detect the end of a frame by checking for a new SOI marker, as
+	 * the SOI always lies on the packet boundary between two frames.
+	 */
+	if ((stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF) &&
+	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
+	     stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
+		const u8 *packet = ((const u8 *)data) + header_len;
+
+		if (len - header_len > 2 &&
+		    packet[0] == 0xff && packet[1] == JPEG_MARKER_SOI &&
+		    buf->bytesused != 0) {
+			buf->state = UVC_BUF_STATE_READY;
+			buf->error = 1;
+			stream->last_fid ^= UVC_STREAM_FID;
+			return -EAGAIN;
+		}
+	}
+
 	stream->last_fid = fid;
 
-	return data[0];
+	return header_len;
 }
 
 static inline enum dma_data_direction uvc_stream_dir(
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index b7d24a853ce4..116b1e383c25 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -76,6 +76,7 @@
 #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
+#define UVC_QUIRK_MJPEG_NO_EOF          0x00020000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.43.0


