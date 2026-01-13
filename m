Return-Path: <linux-media+bounces-50562-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0BAD19195
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 14:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CD6E3012BE4
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 13:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32703904C2;
	Tue, 13 Jan 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jzCe1YSK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB838A2BA
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310992; cv=none; b=IMdTySDHpdEle/+zln9tp++8u09tTnyO5QHp4G5leiAAJRW0bRgKfXzpj5G3ZEVywScEEXcXNGwSHmTd34tXBnA548qb66eakVyBkvFny4DpO3I7FZnLf+bn0/xj4F10Q28PzDJw3MagUzf0mIGm40lVyknf/Dzx8+xwoj+qvGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310992; c=relaxed/simple;
	bh=yk+k15/kONnHA2pWo6yWBi0KbSTA6yIY4xKJUh+2fy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u71WN26hwq6+twbcdNbupX1jFHYZRfJCMMtUr2zzDTm9/dDlkxn+hF1NnXH8VZAA6dsgUa8J9A2OzeoW25izdiqYpEhkZPmkaFO6tASYHN6h49RPxa/QFle9fGvbQvgZdy/ndB1WSLQcaCp0Z669zytZ7pUM5CrXM0600vVYCTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jzCe1YSK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-382f4aa8dd1so58730421fa.3
        for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 05:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768310989; x=1768915789; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VNcpmp049cwvNnkFMeC3Ph6yiyttTigm+jxViGl4TEs=;
        b=jzCe1YSKRWLcJMKxE5U+RciJ/YgmoD/gv5UC+6mKu3wFEAKkuBa49d7f+FrB1okoNY
         7G2M2Xh9/kKmLVHHngCF8ZbKuZLPIDzpHNaakGVXwMUOP6uMQJzGJ7aok5ol2g/gQse1
         VRwwdQprzm13d8JmsKirMcovDdhI4GeueuSHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768310989; x=1768915789;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNcpmp049cwvNnkFMeC3Ph6yiyttTigm+jxViGl4TEs=;
        b=w2OqNFIjgtaV1BOpaHIqVy5yU8JcrzBBZOpExmnjIissW4yYlzyt0r5BpupFwv5lJK
         sV7eGE+IAGDL/AEgMZoPtrVeXGLy1yYoz4cqwr/JRsmIJZ551xWii4Jr++3Kb4eg7s0b
         bWYVxq1AL+Carr9VBKmxPETjlXBWEJeH7EjTz+5v3idtLV7ES0k4hnsIDUIoskh/hNMt
         Zr/J5cGg5dPITDlwJoz9mCjx7hu+XbjT/r91myBj7tUJHFp0+nCuBs7pmFCD9ZjFosbv
         KrdMadttImKAI8ZJN07ON7+yxhtFPWZn6pj2js6mRSH2FSlzO/25cQyzagQj+31oXX04
         Ld7Q==
X-Gm-Message-State: AOJu0Yy4TTXtLj525rm5Z4eh9o3WsZsn/Kq7Isge4QGEmoojy9sy1+jN
	h3i3IXaqqKRXSy3qUxv759Zsg+KLhrET0upbt0CFl0pnjFatlqNhloy8f/IwHXM9+A==
X-Gm-Gg: AY/fxX5NhDSnfddfsnBWClS2pTPKGAqZZrziyb4Cfi4GSdPTw8znLseSxvNQvqxI7mO
	choJFUt0QJklsZ0MyNCOs7e8mSXEcylxHx31GaSRMkjGEUzqK60h3o/bLPfbdA6eGQRseJfGNdo
	QgClcWTQmRl0oJ5qOH22MGJ0/A2uSRXDL32KcFE2I3y0Mtda7xaGj7jdLihhmXVrzt10DV4ljNt
	XA7zxBz7aY/2MSERv41DoKXHq8MqaM3tuYzZdEuKHCiW6yir2Fuakcu9Nk0gzrves1Ncd4Sd9Ls
	jC2X9QZwXs7yvGiEwKOpzwfu2U8fbK/HB/I8f7vieXirfhM4kyFKC+d7Osv0Yu+lpHtGDaqUnTn
	MSYdBLb9cFUVxCDC9nmUqnMAk+nqnXH/fRGCDUAiIq0p+UlqUgNPSJo1Wkr2tSQvmwaXLscZ9aT
	SOyxiBic5VIuHr49IUD6xkm6lJKo/0y5kVtuh2w79M1RmzmLxUiEImI1swxO9QfkY91lKIzw==
X-Google-Smtp-Source: AGHT+IFOVig0IBnYwhgjOZMAYwAq/Bb1GpKssCl8ODuWRD31uHsKf4tWLrdFhQMIqX3lLZ7QoLpXOQ==
X-Received: by 2002:a05:651c:30c9:b0:37e:644a:49ad with SMTP id 38308e7fff4ca-382ff81edb8mr77708121fa.29.1768310988525;
        Tue, 13 Jan 2026 05:29:48 -0800 (PST)
Received: from ribalda.c.googlers.com (181.105.228.35.bc.googleusercontent.com. [35.228.105.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382ffe2b913sm35905571fa.33.2026.01.13.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:29:47 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Jan 2026 13:29:46 +0000
Subject: [PATCH] Revert "media: uvcvideo: Remove nodrop parameter"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-uvc-revert-v1-1-0a873393774c@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMpIZmkC/x2MQQqAIBAAvyJ7bkENDPpKdIh1rb1YaEkg/j3pO
 DAzFTIn4QyzqpC4SJYzdjCDAjq2uDOK7wxWW6eNGfEphF3kdCN5pz1NwTgm6MGVOMj7z5a1tQ+
 mUMz5XAAAAA==
X-Change-ID: 20260113-uvc-revert-cd60dc7f16ec
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ralf Jung <post@ralfj.de>, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This reverts commit 27ccc44a511b0cd76dc607e2a4893b876192ee1b.

A user has reported that the Zoom Video Conferencing tool is not capable
of handling invalid frames. Due to this, he has to continue using this
parameter.

We will keep working with Zoom so they can handle invalid frames
correctly, but for this cycle the safest option is to revert this
parameter drop.

Fixes: 27ccc44a511b ("media: uvcvideo: Remove nodrop parameter")
Reported-by: Ralf Jung <post@ralfj.de>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121718
Closes: https://lore.kernel.org/linux-media/uboug5ectzm4s32yfgopjbcxq2uhsoc4kluaby7a4b7nzfjave@boco7oocnftr/
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 19 +++++++++++++++++++
 drivers/media/usb/uvc/uvc_queue.c  | 25 +++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 45 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..ee4f54d6834962414979a046afc59c5036455124 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -32,6 +32,7 @@
 
 unsigned int uvc_clock_param = CLOCK_MONOTONIC;
 unsigned int uvc_hw_timestamps_param;
+unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
@@ -2467,6 +2468,24 @@ MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
 module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
 MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
 
+static int param_set_nodrop(const char *val, const struct kernel_param *kp)
+{
+	pr_warn_once("uvcvideo: "
+		     DEPRECATED
+		     "nodrop parameter will be eventually removed.\n");
+	return param_set_bool(val, kp);
+}
+
+static const struct kernel_param_ops param_ops_nodrop = {
+	.set = param_set_nodrop,
+	.get = param_get_uint,
+};
+
+param_check_uint(nodrop, &uvc_no_drop_param);
+module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
+__MODULE_PARM_TYPE(nodrop, "uint");
+MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
+
 module_param_named(quirks, uvc_quirks_param, uint, 0644);
 MODULE_PARM_DESC(quirks, "Forced device quirks");
 module_param_named(trace, uvc_dbg_param, uint, 0644);
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3bc54456b4d98ed50b1ea250ce8501e67141e1ef..681a74ed09fb1f109d2b21bf490e8b26eeec0a3e 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -331,9 +331,34 @@ struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
 	return nextbuf;
 }
 
+/*
+ * uvc_queue_buffer_requeue: Requeue a buffer on our internal irqqueue
+ *
+ * Reuse a buffer through our internal queue without the need to 'prepare'.
+ * The buffer will be returned to userspace through the uvc_buffer_queue call if
+ * the device has been disconnected.
+ */
+static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
+				     struct uvc_buffer *buf)
+{
+	buf->error = 0;
+	buf->state = UVC_BUF_STATE_QUEUED;
+	buf->bytesused = 0;
+	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
+
+	uvc_buffer_queue(&buf->buf.vb2_buf);
+}
+
 static void uvc_queue_buffer_complete(struct kref *ref)
 {
 	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
+	struct vb2_buffer *vb = &buf->buf.vb2_buf;
+	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (buf->error && !uvc_no_drop_param) {
+		uvc_queue_buffer_requeue(queue, buf);
+		return;
+	}
 
 	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
 	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 911016047687f7c74fa1bf0dd0ecf2d072361346..d583425893a5f716185153a07aae9bfe20182964 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -659,6 +659,7 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_XU_GET_RES	2
 
 extern unsigned int uvc_clock_param;
+extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;

---
base-commit: 3aa9296a23ec41a8424e9a2346eea59fb6cb7d8c
change-id: 20260113-uvc-revert-cd60dc7f16ec

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


