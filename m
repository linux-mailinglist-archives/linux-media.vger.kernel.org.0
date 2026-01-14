Return-Path: <linux-media+bounces-50702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EE6D1F80E
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47D963045DAF
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 14:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB71350D5E;
	Wed, 14 Jan 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f2iNCt8y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542322E0914
	for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768401341; cv=none; b=AJVrvfr3x+NQjMExhEh6jse+HzkPDZikJFAbvdcbCmLCM4Nxf5aqBiGv889W6zVZlS9f6jugoQNFAqWllcnVx3iDYBep/L/LG5VokShF6QIBTmaq6o1XvNpGWaqtAbyJ5ZkSaJpRVq6QXnvhnwTDTTJm9bmac9VyZoclEMSbK7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768401341; c=relaxed/simple;
	bh=z+V2zrNUbte3fYkGcXO/8hhOtJ/p0rrYmaK86hcQx64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cES7rBO4PE3Gh6HsuubtL3DCseu7QGNYmWbwZtyo0zN752wwRfhcOwwyb41LyC5iBPCt9L5rElDTzY6gxdYOZSy0F2p9uz+4BqcmYXOUxFWJIf7CPhRVnTBnLHXpRwiWXBnebiVYjtFdfnUrEd5ZZoUEA+ORG3H7ScvY8w4M+V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f2iNCt8y; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b79451206so5983418e87.1
        for <linux-media@vger.kernel.org>; Wed, 14 Jan 2026 06:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768401334; x=1769006134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IcFsOjfhuEwO4h5Iw9gaPK9Qsv5e/4U+YI2wir1vLyo=;
        b=f2iNCt8yNeKXISnsUPeroKtQgkxz/aUCxVo2BjcdLlWPbezn848pvX0sFndRWRNlKm
         MdFytHK1DYH9m/3gL71hIT2De28y2ku0qSl0LA6jnWu5V8gI/T/qQw5bEYaD4OMkPtfE
         rDNsOTJX7UYaDCk310OA3bosACPKatkETaxuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768401334; x=1769006134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcFsOjfhuEwO4h5Iw9gaPK9Qsv5e/4U+YI2wir1vLyo=;
        b=M9EuCZOKXzczgHaynHADl8AfSmgF8MdFe0G1WkczwJ3lr8Z+MY9Me8IQ8eB9E0Cidg
         zL/YxV78O1uxRrd+31An+SHDiialz0pUoRcCk3DxTYAqCLFUxovJJfGCqsOGTi1z6wpa
         8QLeJUtlF1LoUySd6OLC7NSXOrv8jzZLcQpRycLfc67bK3Sj53RWoPGwAxh6F3ta7Fu2
         myraAETV2CpFU8la5W0hm3xvxstpPP1ekPc/3nnzfCquVqwuX4M0SE8YK0wcEmmn0VpK
         UET78f+iAlbWstGQucjZXqqYYPFyro8pyc776biIeG0ZfGhBh3ElvlGN5hSrr1V7etrc
         bMKA==
X-Forwarded-Encrypted: i=1; AJvYcCUHvK5uwHlC2Jh998ZRZbdiXxVyOvVcG3QWR04Th5cll5x7J42+2n7wffQioeLF/lIqPUwr3WpAX7ERNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCsJFgpSt4u0fgNcoA1HBcN9bxIWwZVVNvXROBd0BqsKKep4W
	3Zm5PM8I/PiYQW4ygsGeQUKGQjR3u1jfn775SEAtrnIXZ/XWMqMiYNY9IsZznshgnQ==
X-Gm-Gg: AY/fxX6VNdu/GjyBFtcJvgd0cJwbWtQb2yck/EN4N1h225/3LMeRg4O8FjgyyT9uan3
	8CZU/pkchDrJWwMYeVhUA8yDEn4pLK1pME2XPaFDdGcG5hSKvtglTeuGVyNDgKyFgn3jYABfgRY
	vKtXakTbVVd5tgodEYflfn9r0amJdDUFHBOwBkxx17Kjgm+gKspZgYlMLXuG7ENFj7E2k6B6KnR
	8TXJHCuXKC6iQA6TlVJLO9g7jEg0m7OnpGZGG+K6knw8Mbb6kpjF6RvOWW+P/2/j5rNUSbkqayI
	kvr1vnW96/5wraDKpk079ib6mKzmvzupp7VeNqYYJJNYG6avzooreY1IW4ARZmP1R8JQ9Dmz4R1
	4z6pyjSGjWPOutF5VD3enO4/WQ9OgCGDLl57Y+CW0dzn2uEhKlTygfEgU6q1ESjPR1aI/9qYoT5
	6FyNXg+P8wWPIFvc6NshyeGKlia9iqQwH9mFGbJmG5CQzMi7ujj76nGVnz2a3arD+BIFJquf5do
	2I=
X-Received: by 2002:a05:6512:6c6:b0:59b:7b64:1d45 with SMTP id 2adb3069b0e04-59ba0f65ab2mr1190412e87.16.1768401333611;
        Wed, 14 Jan 2026 06:35:33 -0800 (PST)
Received: from ribalda.c.googlers.com.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba10209besm760779e87.39.2026.01.14.06.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:35:33 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH] v4l: Handle properly ERROR buffers
Date: Wed, 14 Jan 2026 14:34:38 +0000
Message-ID: <20260114143529.265163-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a buffers is flagged as erroneus ignore that frame.

Now that we are at it refactor a bit the code to remove code duplication
for the usrptr and mmap implementation.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 src/v4l.c | 73 +++++++++++++++----------------------------------------
 src/v4l.h |  3 +--
 2 files changed, 21 insertions(+), 55 deletions(-)

diff --git a/src/v4l.c b/src/v4l.c
index aa706f9..48357cb 100644
--- a/src/v4l.c
+++ b/src/v4l.c
@@ -414,9 +414,9 @@ unsigned char *cam_read(cam_t *cam)
 		convert_to_rgb24(cam, cam->tmp);
 	}
     } else if (cam->userptr) {
-            capture_buffers_userptr(cam, cam->pic_buf);
+            capture_buffers(cam, cam->pic_buf, V4L2_MEMORY_USERPTR);
     } else {
-            capture_buffers(cam, cam->pic_buf, cam->bytesperline);
+            capture_buffers(cam, cam->pic_buf, V4L2_MEMORY_MMAP);
     }
     if (ret)
         return NULL;
@@ -1587,14 +1587,10 @@ void start_streaming_userptr(cam_t *cam)
     }
 }
 
-void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
+static void deque_buffer(cam_t *cam, struct v4l2_buffer *buf, guint32 memory_type)
 {
-    char *msg;
-    unsigned char *inbuf;
     int r;
-    unsigned int y;
     fd_set fds;
-    struct v4l2_buffer buf;
     struct timeval tv;
 
     do {
@@ -1609,6 +1605,7 @@ void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
     } while ((r == -1 && (errno == EINTR)));
 
     if (r == -1) {
+        char *msg;
         msg = g_strdup_printf(_("Timeout while waiting for frames (%s)"),
                               cam->video_dev);
         error_dialog(msg);
@@ -1616,61 +1613,31 @@ void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len)
         exit(0);
     }
 
-    memset(&buf, 0, sizeof(buf));
-    buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-    buf.memory = V4L2_MEMORY_MMAP;
-    cam_ioctl(cam, VIDIOC_DQBUF, &buf);
-
-    if (len > buf.bytesused)
-        len = buf.bytesused;
+    memset(buf, 0, sizeof(*buf));
+    buf->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+    buf->memory = memory_type;
+    cam_ioctl(cam, VIDIOC_DQBUF, buf);
 
-    inbuf = cam->buffers[buf.index].start;
-    if (cam->use_libv4l) {
-	    for (y = 0; y < cam->height; y++) {
-		memcpy(outbuf, inbuf, cam->width * cam->bpp / 8);
-		outbuf += cam->width * cam->bpp / 8;
-		inbuf += cam->bytesperline;
-	    }
-    } else {
-	    convert_to_rgb24(cam, inbuf);
-    }
+    return;
+}
 
-    cam_ioctl(cam, VIDIOC_QBUF, &buf);
+static void deque_good_buffer(cam_t *cam, struct v4l2_buffer *buf, guint32 memory_type)
+{
+	while (TRUE) {
+		deque_buffer(cam, buf, memory_type);
+		if (!(buf->flags & V4L2_BUF_FLAG_ERROR))
+			break;
+		cam_ioctl(cam, VIDIOC_QBUF, &buf);
+	}
 }
 
-void capture_buffers_userptr(cam_t *cam, unsigned char *outbuf)
+void capture_buffers(cam_t *cam, unsigned char *outbuf, guint32 memory_type)
 {
-    char *msg;
     unsigned char *inbuf;
-    int r;
     unsigned int y;
-    fd_set fds;
     struct v4l2_buffer buf;
-    struct timeval tv;
-
-    do {
-        FD_ZERO(&fds);
-        FD_SET(cam->dev, &fds);
-
-        /* Timeout. */
-        tv.tv_sec = 2;
-        tv.tv_usec = 0;
-
-        r = select(cam->dev + 1, &fds, NULL, NULL, &tv);
-    } while ((r == -1 && (errno == EINTR)));
-
-    if (r == -1) {
-        msg = g_strdup_printf(_("Timeout while waiting for frames (%s)"),
-                              cam->video_dev);
-        error_dialog(msg);
-        g_free(msg);
-        exit(0);
-    }
 
-    memset(&buf, 0, sizeof(buf));
-    buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-    buf.memory = V4L2_MEMORY_USERPTR;
-    cam_ioctl(cam, VIDIOC_DQBUF, &buf);
+    deque_good_buffer(cam, &buf, memory_type);
 
     inbuf = cam->buffers[buf.index].start;
     if (cam->use_libv4l) {
diff --git a/src/v4l.h b/src/v4l.h
index cc69875..15ecd6c 100644
--- a/src/v4l.h
+++ b/src/v4l.h
@@ -167,10 +167,9 @@ void get_pic_info(cam_t *);
 void get_win_info(cam_t *);
 void get_supported_resolutions(cam_t *cam, gboolean all_supported);
 void start_streaming(cam_t *cam);
-void capture_buffers(cam_t *cam, unsigned char *outbuf, unsigned int len);
+void capture_buffers(cam_t *cam, unsigned char *outbuf, guint32 memory_type);
 void stop_streaming(cam_t *cam);
 void start_streaming_userptr(cam_t *cam);
-void capture_buffers_userptr(cam_t *cam, unsigned char *outbuf);
 void stop_streaming_userptr(cam_t *cam);
 
 #endif                          /* !CAMORAMA_V4L_H */
-- 
2.52.0.457.g6b5491de43-goog


