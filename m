Return-Path: <linux-media+bounces-25359-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFAA20FDB
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 18:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D891672AE
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2025 17:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B671E98F4;
	Tue, 28 Jan 2025 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+/GGqgI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591ED1E3DD7;
	Tue, 28 Jan 2025 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738086838; cv=none; b=V90jFjixA1ve6MQyc6uBJJnJJHfEs+cbwkpxG6wDNFfvvmtJpRrK7LEAx7GVJlSU5/d3fzCrYCMm4nkfutMQOxY08kVqxXjbLKIXhKm/E2QI9q3v+hw2ZWbRHGnbr5dJFBpyPIML05CrR/JWLzvr9bxupmerIKWApg9P6qjIUQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738086838; c=relaxed/simple;
	bh=kX34bMnrXPylaW7TtWjc3e0ISXH1s9L87EhIy0KKvw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SpNYEsAk8AJEeepzYtKtUvIwkkl4GzLbFR/ztQ66TX8WREw1eCjHQwpG22Wq4diJdoAFd2nvsnBARE/Oa0OaB3IYznr5NMg0HQ5qkSILgcySVSs4JUc9gBHYSPI+18zN0XjbZz9aJ3fD4v1CyOr8xCntO7aCPKS2L91BU7SnnmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+/GGqgI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A16C4CED3;
	Tue, 28 Jan 2025 17:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086837;
	bh=kX34bMnrXPylaW7TtWjc3e0ISXH1s9L87EhIy0KKvw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+/GGqgI+M5uPxTURnz7rORvEOiFsQxq5f6uqjF1PuEqfFBB3R7EgC+dJYCcpBbSv
	 xkMsdB7s0KHbhjB3mVITvIhUWZb5WNaGG/QkrBMkM9W8SqHsALJKlCgjLDPNfn5opm
	 YoXaeYd7Z9jJftT/7hegHG3XMlgg/FkHCTM+swyszLOOZK1Wo0ItVb7oKHqssS7rHm
	 ah9YPC+cGOawlEFxkjXXvkYGlyccBxVGqWPTsj6EOn58L4GNj+XIofRw2jnYSG15su
	 TcE9igqD0t0TC4lmm334HAYM5R5GYVMPdpKA2Dm/kwdxG+ZUUlEYkfGGJH2m/Icu3k
	 x62xZwi9bSJgQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 06/15] media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
Date: Tue, 28 Jan 2025 12:53:37 -0500
Message-Id: <20250128175346.1197097-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Isaac Scott <isaac.scott@ideasonboard.com>

[ Upstream commit c2eda35e675b6ea4a0a21a4b1167b121571a9036 ]

Some cameras, such as the Sonix Technology Co. 292A, exhibit issues when
running two parallel streams, causing USB packets to be dropped when an
H.264 stream posts a keyframe while an MJPEG stream is running
simultaneously. This occasionally causes the driver to erroneously
output two consecutive JPEG images as a single frame.

To fix this, we inspect the buffer, and trigger a new frame when we
find an SOI.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20241128145144.61475-2-isaac.scott@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_video.c | 27 ++++++++++++++++++++++++++-
 drivers/media/usb/uvc/uvcvideo.h  |  1 +
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index e00f38dd07d93..6d800a0997493 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -20,6 +20,7 @@
 #include <linux/atomic.h>
 #include <linux/unaligned.h>
 
+#include <media/jpeg.h>
 #include <media/v4l2-common.h>
 
 #include "uvcvideo.h"
@@ -1116,6 +1117,7 @@ static void uvc_video_stats_stop(struct uvc_streaming *stream)
 static int uvc_video_decode_start(struct uvc_streaming *stream,
 		struct uvc_buffer *buf, const u8 *data, int len)
 {
+	u8 header_len;
 	u8 fid;
 
 	/*
@@ -1129,6 +1131,7 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		return -EINVAL;
 	}
 
+	header_len = data[0];
 	fid = data[1] & UVC_STREAM_FID;
 
 	/*
@@ -1210,9 +1213,31 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 		return -EAGAIN;
 	}
 
+	/*
+	 * Some cameras, when running two parallel streams (one MJPEG alongside
+	 * another non-MJPEG stream), are known to lose the EOF packet for a frame.
+	 * We can detect the end of a frame by checking for a new SOI marker, as
+	 * the SOI always lies on the packet boundary between two frames for
+	 * these devices.
+	 */
+	if (stream->dev->quirks & UVC_QUIRK_MJPEG_NO_EOF &&
+	    (stream->cur_format->fcc == V4L2_PIX_FMT_MJPEG ||
+	    stream->cur_format->fcc == V4L2_PIX_FMT_JPEG)) {
+		const u8 *packet = data + header_len;
+
+		if (len >= header_len + 2 &&
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
index 07f9921d83f2d..a73a8d3596aa0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -76,6 +76,7 @@
 #define UVC_QUIRK_NO_RESET_RESUME	0x00004000
 #define UVC_QUIRK_DISABLE_AUTOSUSPEND	0x00008000
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
+#define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
-- 
2.39.5


