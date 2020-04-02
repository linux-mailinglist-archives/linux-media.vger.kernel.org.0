Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D11119BA23
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 04:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387643AbgDBCH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Apr 2020 22:07:26 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41416 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgDBCH0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Apr 2020 22:07:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id d24so745310pll.8;
        Wed, 01 Apr 2020 19:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C04Pozr5X0zQ8hwZJCbHw/2mlGec8iDEEJLF9AKa5RE=;
        b=J024Ym4KY/zQG+zxvuJ42YOHgDewx7cn4v4arvXhsryo3iiopJpxtcowV80i0fcjS9
         P8cdmgSt/z7VX7TrCggJDXeSqfWiqi6hLRvzMv+CFSSjxxQWxpC1cvpv0YiamcIctTgp
         ia6a4VVrSHpVDDQvcluAjJ8rwIQkBKm7tcTT3ACJq22HlLEI4tgPHYNVqiNYS6aGoQ/B
         3xFB5qHgiITquWu+JmJxdBMW8eC3VN92k3daFcisQgPBI3TcoynJcir7wo4P6K7eGMaI
         iD/2CKzyBRrPvHlCrkpf/JYCCDXkRbxToG0q+jH0rRSML2p0a5r9DOBGlFm8YWxswfBz
         JNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C04Pozr5X0zQ8hwZJCbHw/2mlGec8iDEEJLF9AKa5RE=;
        b=B3KR8/nNx87VG1y8OKQYln/Ga/7IsdzO8GxD154NBbhZJ3aDVRJlOdCXZjacIYqIhg
         2wiBTd2w0mM8f4ga8JpdpVoXzyGFF0IkLVXKzwmQNXYvzs4DGp7VTDBRc/IUJFQi04+5
         XdCa+2+Jk+i/FgHLrKM0P+BYZMzWCgmhZk8xfKA7D3fD+aRadvm0fR6UE0c5Yej1Y5qd
         LVe/1+RzLxEPXdSIDMtHusqg4l9bSn+WyaFalOjYuUwijxntEaeAk/aucjFUaSIM+B6T
         UZoCER7Xkemw0Z5DEnJCUU0IjkcXUFHWJEUOFgvLSfbPNjcfTR6BITI4OB/CGpwOivAA
         Atfg==
X-Gm-Message-State: AGi0PuZoJ96TO1u1zd23ET6w9A3rJk2LshfWatBOPT0bEpHdJWQ3XimI
        neWEXZDdd2oi/ZT5r8HtFAg=
X-Google-Smtp-Source: APiQypJc4HvDhspoLaeohepb0q/mGtKi/sn8HmIaEqFDZRzRDPvnBcWwuP2HerQ7mCqqKO9C01BewA==
X-Received: by 2002:a17:90a:3ad0:: with SMTP id b74mr1206771pjc.58.1585793244192;
        Wed, 01 Apr 2020 19:07:24 -0700 (PDT)
Received: from localhost.localdomain (c-24-130-6-48.hsd1.ca.comcast.net. [24.130.6.48])
        by smtp.googlemail.com with ESMTPSA id w29sm2370388pge.25.2020.04.01.19.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 19:07:23 -0700 (PDT)
From:   Julian Meyer <julianmeyer2000@gmail.com>
Cc:     Julian Meyer <julianmeyer2000@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: read bulk URBs after maxPayloadSize
Date:   Wed,  1 Apr 2020 19:06:48 -0700
Message-Id: <20200402020649.4583-1-julianmeyer2000@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This fixes a bug that caused certain Realtek cameras to crash.

The camera would send additional UVC payloads after the maxPayloadSize
was reached. This patch modifies uvc_video_decode_bulk such that it
continues reading payloads when it reaches the maxPayloadSize if there
is more data left.

Signed-off-by: Julian Meyer <julianmeyer2000@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 76 +++++++++++++++++++++----------
 1 file changed, 52 insertions(+), 24 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8fa77a81dd7f..32cc8b21705a 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1374,31 +1374,22 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 	}
 }
 
-static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+static void uvc_video_decode_bulk_single(struct uvc_streaming *stream,
+	struct uvc_buffer *buf, struct uvc_buffer *meta_buf,
+	struct uvc_urb *uvc_urb, u8 **mem, int *len)
 {
-	struct urb *urb = uvc_urb->urb;
-	struct uvc_streaming *stream = uvc_urb->stream;
-	u8 *mem;
-	int len, ret;
-
-	/*
-	 * Ignore ZLPs if they're not part of a frame, otherwise process them
-	 * to trigger the end of payload detection.
-	 */
-	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
-		return;
+	unsigned int bytes_left;
+	int ret;
 
-	mem = urb->transfer_buffer;
-	len = urb->actual_length;
-	stream->bulk.payload_size += len;
+	struct urb *urb = uvc_urb->urb;
+	unsigned int max_size = stream->bulk.max_payload_size;
 
 	/* If the URB is the first of its payload, decode and save the
 	 * header.
 	 */
 	if (stream->bulk.header_size == 0 && !stream->bulk.skip_payload) {
 		do {
-			ret = uvc_video_decode_start(stream, buf, mem, len);
+			ret = uvc_video_decode_start(stream, buf, *mem, *len);
 			if (ret == -EAGAIN)
 				uvc_video_next_buffers(stream, &buf, &meta_buf);
 		} while (ret == -EAGAIN);
@@ -1407,13 +1398,14 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		if (ret < 0 || buf == NULL) {
 			stream->bulk.skip_payload = 1;
 		} else {
-			memcpy(stream->bulk.header, mem, ret);
+			memcpy(stream->bulk.header, *mem, ret);
 			stream->bulk.header_size = ret;
 
-			uvc_video_decode_meta(stream, meta_buf, mem, ret);
+			uvc_video_decode_meta(stream, meta_buf, *mem, ret);
 
-			mem += ret;
-			len -= ret;
+			*mem += ret;
+			*len -= ret;
+			stream->bulk.payload_size += ret;
 		}
 	}
 
@@ -1423,14 +1415,26 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	 */
 
 	/* Prepare video data for processing. */
-	if (!stream->bulk.skip_payload && buf != NULL)
-		uvc_video_decode_data(uvc_urb, buf, mem, len);
+	if (!stream->bulk.skip_payload && buf != NULL) {
+		bytes_left = min((unsigned int) *len,
+			max_size - stream->bulk.payload_size);
+
+		stream->bulk.payload_size += bytes_left;
+
+		uvc_video_decode_data(uvc_urb, buf, *mem, bytes_left);
+
+		*len -= bytes_left;
+		*mem += bytes_left;
+	} else {
+		stream->bulk.payload_size += *len;
+		*len = 0;
+	}
 
 	/* Detect the payload end by a URB smaller than the maximum size (or
 	 * a payload size equal to the maximum) and process the header again.
 	 */
 	if (urb->actual_length < urb->transfer_buffer_length ||
-	    stream->bulk.payload_size >= stream->bulk.max_payload_size) {
+		stream->bulk.payload_size >= stream->bulk.max_payload_size) {
 		if (!stream->bulk.skip_payload && buf != NULL) {
 			uvc_video_decode_end(stream, buf, stream->bulk.header,
 				stream->bulk.payload_size);
@@ -1444,6 +1448,30 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 	}
 }
 
+static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
+			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+{
+	struct urb *urb = uvc_urb->urb;
+	struct uvc_streaming *stream = uvc_urb->stream;
+	u8 *mem;
+	int len;
+
+	/*
+	 * Ignore ZLPs if they're not part of a frame, otherwise process them
+	 * to trigger the end of payload detection.
+	 */
+	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
+		return;
+
+	mem = urb->transfer_buffer;
+	len = urb->actual_length;
+
+	while (len > 0) {
+		uvc_video_decode_bulk_single(stream, buf, meta_buf, uvc_urb,
+			&mem, &len);
+	}
+}
+
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
 	struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
 {
-- 
2.25.0

