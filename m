Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E234A1AFFE8
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 04:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgDTClu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 22:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725994AbgDTClt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 22:41:49 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB70CC061A0C;
        Sun, 19 Apr 2020 19:41:49 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k18so3397829pll.6;
        Sun, 19 Apr 2020 19:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=blhvOLLDLAP6GeZ9g7bUP9m/OATRO4YtQBZfr8RSMmQ=;
        b=rineVuYxcOrhAEvKxETAK5yAnVI1elqk795FPzhZUXgsf7cY3yQvq0mBOWRngbNK7k
         OUpLjEPaLRqgDrQJGNMIxBB5P98znsSywtHZDdD1pIiAQ1G9ujzLWyCzNZLIzJ9CkaoO
         XzDd/6s4ZsGtegzOM5fPQ2t9qkhLP29+38LXcODGZdwCRPHHDTrTC2v8X5uPrQgq+X4f
         myP9BbSxP0G8FkHSdnorPqNsi8xbJn/EqEH0fVPW96XlIPNPa9vBGsu10m3BhIwOHRZT
         vvjYO7p0GX/1wWFaCLpD/bkHMWaj8qsUbr76sLMxDkpBc5TMxBkcdRszpcKLdgqMJCBM
         vmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=blhvOLLDLAP6GeZ9g7bUP9m/OATRO4YtQBZfr8RSMmQ=;
        b=oiUHJORyzhwuQtlYrCvCCAjB/oYj311YF345hgcFOO2KOv4DT3BtH02F2fRBoLm4HQ
         2NgEAE5MTU5NtjN1hioabZ8vW/jHyr+L6nT4TQEawK5K45fT2b7evEcu80B9UCzM+Szg
         IoeTabfeVSgypvvButnt2yi12Rvt7+aqgnPKedQMpepQimBBUEKVz2dyYYBBi52i6O/j
         LkzEhg3UAsjX3SIycMJY/Ua6twso5poDcie+N5Ki+eIFHxLe49RAkecFJ2B9DSR3r3vw
         zCPxw2vD+ThK/+Am0JdIs3YwIOM6qRZcluvyfHj+vtazVM7bjq+sEuUAJKNqcnKSHW4Q
         kbMA==
X-Gm-Message-State: AGi0PubgV2WonaWKrkdNqcH3+4Tw/gJfCBR56GEU1tVs8bQk7dsXTD6h
        evv3rL+BJDCxdhmFoAeaFvU=
X-Google-Smtp-Source: APiQypLGg68xSQ0S673isbGRk0Wv+72araHhTNipBzjl4YU5IkxhSwefmphn1dhW76+SooKrQFga2Q==
X-Received: by 2002:a17:90b:14c1:: with SMTP id jz1mr10258005pjb.112.1587350508970;
        Sun, 19 Apr 2020 19:41:48 -0700 (PDT)
Received: from localhost.localdomain (c-24-130-6-48.hsd1.ca.comcast.net. [24.130.6.48])
        by smtp.googlemail.com with ESMTPSA id p16sm7599177pjz.2.2020.04.19.19.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 19:41:48 -0700 (PDT)
From:   Julian Meyer <julianmeyer2000@gmail.com>
Cc:     Julian Meyer <julianmeyer2000@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: read bulk URBs after maxPayloadSize
Date:   Sun, 19 Apr 2020 19:41:19 -0700
Message-Id: <20200420024119.380416-1-julianmeyer2000@gmail.com>
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

Signed-off-by: Julian Meyer <julianmeyer2000@gmail.com>
---
 drivers/media/usb/uvc/uvc_video.c | 85 +++++++++++++++++++++++--------
 1 file changed, 63 insertions(+), 22 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 8fa77a81dd7f..9e07cc516796 100644
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
+			return
+		}
+	}
 }
 
 static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
-- 
2.26.1

