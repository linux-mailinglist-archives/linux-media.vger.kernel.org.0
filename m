Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4AA1B15B5
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 21:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgDTTP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 15:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728124AbgDTTP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 15:15:26 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85096C061A0C;
        Mon, 20 Apr 2020 12:15:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id q18so2012511pgm.11;
        Mon, 20 Apr 2020 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+g1bCbCTkyk/c7kTkhmMn/kmWtzb9+Qt/j1GRRzc1c=;
        b=vBsO5evLKHsflZ4SoVoe9nS084P/3eltXjmd4kGhH4tESBKhyBRe6WM2/1uSV8SHyx
         8YIkpYtc6ht1v8CmbLhRTcE6ZhxvLr6e4Nde5tyhMCA4vRCSHYI701RuZZADjy1co1Zy
         zpXGxW7UC+Hwfbov6nGX6A1bnubptg41B6nnIHQpXsRW/GcffpdXPv3qIuhQ1uWvAxHk
         5N6AEy9rl+suYHKt2jlUnI+9lXDs+R+iginZ7QfaroDafPI1qgIypgINwo4pwto5eBNF
         f/jy2stQfpW0pnpI+eB4WyktkQohVAMywc6JC/992UwUsV3DXjT8cI0C0Oe/5za4dyjk
         +9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+g1bCbCTkyk/c7kTkhmMn/kmWtzb9+Qt/j1GRRzc1c=;
        b=mjiqfOuS1SAS9ob1lizZmlwjqbwCod+U7v0VRT78A0cTYggQsw6kdxmRODWTpkcTTY
         Qw+eRWssBHrEECUhGh+BJtOmkE6rwpnSlF6mh97GUbcL6F4YenLiNj9cfywKa4aqhduK
         Da0v2UTl9RzVWgZigN1+l5iEAEG6dsRo8dwqx9R+hylWWhDFzZxGKJJh0hMoHl/HbAqx
         GQooQGW6H8oWowyorEvuev5/gavbixL53lrqg/IiqS5U3wBmRpLGyhTaYAUd/U44jrFd
         Y6rAT9gbwtRz29eGgjquFBVMDSvcF+k+dYil7FILz9b1zZqNK11Z0m6atunntp6QM8q0
         YJGQ==
X-Gm-Message-State: AGi0PuZeWdo0+L0wWfo4hSnFoIg6jVH1ajuTyy6cJQi66Im0AULIczKA
        4x3slgkBy13sNqVGnVDnBXFu+Nz4PlGGdg==
X-Google-Smtp-Source: APiQypIp7hVXWLMIpBBXwX0XtgZtmExbO9jwQv8jLDTJb2XgrTRrYr4iJAc1evaYokmtec9NYC3FxA==
X-Received: by 2002:aa7:850f:: with SMTP id v15mr17639835pfn.204.1587410125953;
        Mon, 20 Apr 2020 12:15:25 -0700 (PDT)
Received: from localhost.localdomain (c-24-130-6-48.hsd1.ca.comcast.net. [24.130.6.48])
        by smtp.googlemail.com with ESMTPSA id q19sm259888pfh.34.2020.04.20.12.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 12:15:25 -0700 (PDT)
From:   Julian Meyer <julianmeyer2000@gmail.com>
Cc:     Julian Meyer <julianmeyer2000@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: uvcvideo: read bulk URBs after maxPayloadSize
Date:   Mon, 20 Apr 2020 12:15:06 -0700
Message-Id: <20200420191506.664877-1-julianmeyer2000@gmail.com>
X-Mailer: git-send-email 2.26.1
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

There are also various safeguards included to prevent the loop
from running forever. We'll try to start reading if there is
more data, but if we can't decode any more data, we exit the loop.

Signed-off-by: Julian Meyer <julianmeyer2000@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 85 +++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8fa77a81dd7f..5e1a6ce37724 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1374,31 +1374,24 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
 	}
 }
 
-static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
-			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+static int uvc_video_decode_bulk_single(struct uvc_streaming *stream,
+	struct uvc_buffer *buf, struct uvc_buffer *meta_buf,
+	struct uvc_urb *uvc_urb, u8 **mem, int *len)
 {
-	struct urb *urb = uvc_urb->urb;
-	struct uvc_streaming *stream = uvc_urb->stream;
-	u8 *mem;
-	int len, ret;
+	unsigned int bytes_left;
+	int ret;
 
-	/*
-	 * Ignore ZLPs if they're not part of a frame, otherwise process them
-	 * to trigger the end of payload detection.
-	 */
-	if (urb->actual_length == 0 && stream->bulk.header_size == 0)
-		return;
+	int length_removed = 0;
 
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
@@ -1407,13 +1400,15 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
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
+			length_removed += ret;
+			*len -= ret;
+			stream->bulk.payload_size += ret;
 		}
 	}
 
@@ -1423,8 +1418,22 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
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
+		length_removed = bytes_left;
+	} else {
+		stream->bulk.payload_size += *len;
+		length_removed = *len;
+		*len = 0;
+	}
 
 	/* Detect the payload end by a URB smaller than the maximum size (or
 	 * a payload size equal to the maximum) and process the header again.
@@ -1442,6 +1451,38 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
 		stream->bulk.skip_payload = 0;
 		stream->bulk.payload_size = 0;
 	}
+
+	return length_removed;
+}
+
+static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
+			struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
+{
+	struct urb *urb = uvc_urb->urb;
+	struct uvc_streaming *stream = uvc_urb->stream;
+	u8 *mem;
+	int len;
+	int len_processed;
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
+		len_processed = uvc_video_decode_bulk_single(stream, buf,
+			meta_buf, uvc_urb, &mem, &len);
+
+		// if we don't process anything, we break out of the decode loop
+		if (len_processed == 0) {
+			return;
+		}
+	}
 }
 
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
-- 
2.26.1

