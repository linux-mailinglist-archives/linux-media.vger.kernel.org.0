Return-Path: <linux-media+bounces-47401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA325C70DD3
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 20:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B54194E4308
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 19:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2181371DF4;
	Wed, 19 Nov 2025 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mQgOdslD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF5327C1E
	for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581038; cv=none; b=kMl4NmOcjv+AiMSzFcjoNZ/7Pci5x2Ha0cqMl7ngcgTCIPvOb5K9IHYmIsfHF2rVrKhucSNg5jm+ZA0tq/idf3hQ+3ugleG64NsySHC27vV6n8erAcuqfmcMB/tlNCSZy7398fBI5/iBAIUI/XbJua3zX4AesT9sQI3XoSCbqGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581038; c=relaxed/simple;
	bh=n8XOm9luf2fVsxqKyrBWhIZuOOg2rhp+w9xSWOV/plE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQlDpdhErTDvBYHlvTwZocHGmE/YTynOlysv2tKWBSO+Y+oreXW9XF6Q+rZpJlpmI6VKzxaEqpY5Iqg4Q7O3H6NuPjEtVrzefariYaUIASKE8Zx8UJaTcp8eFdH/CzBpLWqDmm3pWLyexwZtbeNkqYmIw1V22hbhenIL9SGdHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mQgOdslD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5958931c9c7so22100e87.2
        for <linux-media@vger.kernel.org>; Wed, 19 Nov 2025 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581033; x=1764185833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9t1hhYNW+A5BDerlrM2zvaB6QZgqTCpLkk7E6jVXaDE=;
        b=mQgOdslD9nPCwG9K3q8zYKNBqSnR9NiIbjnRUyi1hwl/ZqQBNidXW1M+iUuKqIamPV
         Ctz0G6VHyuPiuqdE7olOliRniJho3p+TfXcvoiVot1nD+TtziHgYFyVvoH3+wKsakH4H
         565pHVmC6BlTb+dMLmBTfwqDi8Q2ZwjyI3eHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581033; x=1764185833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9t1hhYNW+A5BDerlrM2zvaB6QZgqTCpLkk7E6jVXaDE=;
        b=AUvaek72ahAiUW8n90V/GWOcUvpenvbUgnoRUFlpXbWgOuGinINd92uAoIcVqpGuJk
         JylcI/x7GgxqpZtbISB8DbnDD343E7svRyYbaMXGquXiINzVcr4fBX5y+Twotdv3XjLv
         NIsTl9D10lE7iBS1iYZTEgCKhjm4Au98zrkqP3AtLkkJiiIIHMBsB8MftQUy/491KlqE
         VEHpIZe32utflpdpHVSM6m36+Zk8ma+aa6vmyRye2tePLKBP4nVOFeLu5eN1O3Nfhjnv
         N/mwTFhoXpls6ucPV8eWH05MBrypssTqNbu9kOF6CCs9gB9tArCVArjdXvRDIBm/eErp
         1ifA==
X-Gm-Message-State: AOJu0YzWMV4ssJ4aLy6t02km0Ntj9O3ABDwefD0HHT5srWQow3KHoSCE
	10YoQrxbVqRLxpGAKuvsTVFAEoyyNSIacxlh+EL01qJ0h02zL+BwxMj/eylmAnyPrw==
X-Gm-Gg: ASbGncvmSLaaq7qOlmnsDP6/MVH5+6kn/ukdroMflDLPpqDzFGNhaQRVWGoD6D92rM7
	+a+kIBSnTlIEMLfcXDvZ/jLpES8ChpUdU3ZBaXVJ/Y+WsUaqoiq/W55V7PX117X8cb5npZXBgBM
	qlQKUc0kl93mNPhQC6PiUbp22K7sWQM9rLngHP91XqG5OTAfHbm13v3YLNrnBbptI+rRu3mPrGW
	EKLYMYeU1nyXseLtQ7zbic1WyU1op2FzKgtF3+zrzFFiNsXCN1X43cqV6LUcAsMmhridqK7kAH5
	5viOuvEPACFU0OXugDxYhklWz/uLYN4sHmSJPLSai6qcrwdTQtk/TshJvICFsIsUySjrPjNOsiy
	KV2+8tTNdmt/EpLbpyreH3A+1wGLQ1aYuxCCqPEDVUdnW+MTT027Xogn1GSHqexk+1aUJzfVixa
	+hfBiCzN/bIGpcXkwWvm88wvLaSpiXXDnkZxexS9rysIPKmyWEKwoAo6ZzOPFO+A==
X-Google-Smtp-Source: AGHT+IEzy07FdaBjKY/dhcgvBozZKv1y77WZHmLiavxxJhCZh+QBPAxjEQ2BThdKmAn1PbL0E6rOzg==
X-Received: by 2002:a05:6512:3e15:b0:594:2f46:391c with SMTP id 2adb3069b0e04-5969e30c2ddmr20533e87.44.1763581033193;
        Wed, 19 Nov 2025 11:37:13 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:12 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:10 +0000
Subject: [PATCH v2 1/6] media: uvcvideo: Remove nodrop parameter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-1-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

We announced the deprecation intentions one year ago in the commit
commit 40ed9e9b2808 ("media: uvcvideo: Announce the user our deprecation
intentions").

We have not hear any complains, lets remove the nodrop parameter.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 19 -------------------
 drivers/media/usb/uvc/uvc_queue.c  | 25 -------------------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 -
 3 files changed, 45 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index ee4f54d6834962414979a046afc59c5036455124..71563d8f4bcf581694ccd4b665ff52b629caa0b6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -32,7 +32,6 @@
 
 unsigned int uvc_clock_param = CLOCK_MONOTONIC;
 unsigned int uvc_hw_timestamps_param;
-unsigned int uvc_no_drop_param = 1;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
@@ -2468,24 +2467,6 @@ MODULE_PARM_DESC(clock, "Video buffers timestamp clock");
 module_param_named(hwtimestamps, uvc_hw_timestamps_param, uint, 0644);
 MODULE_PARM_DESC(hwtimestamps, "Use hardware timestamps");
 
-static int param_set_nodrop(const char *val, const struct kernel_param *kp)
-{
-	pr_warn_once("uvcvideo: "
-		     DEPRECATED
-		     "nodrop parameter will be eventually removed.\n");
-	return param_set_bool(val, kp);
-}
-
-static const struct kernel_param_ops param_ops_nodrop = {
-	.set = param_set_nodrop,
-	.get = param_get_uint,
-};
-
-param_check_uint(nodrop, &uvc_no_drop_param);
-module_param_cb(nodrop, &param_ops_nodrop, &uvc_no_drop_param, 0644);
-__MODULE_PARM_TYPE(nodrop, "uint");
-MODULE_PARM_DESC(nodrop, "Don't drop incomplete frames");
-
 module_param_named(quirks, uvc_quirks_param, uint, 0644);
 MODULE_PARM_DESC(quirks, "Forced device quirks");
 module_param_named(trace, uvc_dbg_param, uint, 0644);
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 790184c9843d211d34fa7d66801631d5a07450bd..3bc54456b4d98ed50b1ea250ce8501e67141e1ef 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -331,34 +331,9 @@ struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
 	return nextbuf;
 }
 
-/*
- * uvc_queue_buffer_requeue: Requeue a buffer on our internal irqqueue
- *
- * Reuse a buffer through our internal queue without the need to 'prepare'.
- * The buffer will be returned to userspace through the uvc_buffer_queue call if
- * the device has been disconnected.
- */
-static void uvc_queue_buffer_requeue(struct uvc_video_queue *queue,
-		struct uvc_buffer *buf)
-{
-	buf->error = 0;
-	buf->state = UVC_BUF_STATE_QUEUED;
-	buf->bytesused = 0;
-	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, 0);
-
-	uvc_buffer_queue(&buf->buf.vb2_buf);
-}
-
 static void uvc_queue_buffer_complete(struct kref *ref)
 {
 	struct uvc_buffer *buf = container_of(ref, struct uvc_buffer, ref);
-	struct vb2_buffer *vb = &buf->buf.vb2_buf;
-	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
-
-	if (buf->error && !uvc_no_drop_param) {
-		uvc_queue_buffer_requeue(queue, buf);
-		return;
-	}
 
 	buf->state = buf->error ? UVC_BUF_STATE_ERROR : UVC_BUF_STATE_DONE;
 	vb2_set_plane_payload(&buf->buf.vb2_buf, 0, buf->bytesused);
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index ed7bad31f75ca474c1037d666d5310c78dd764df..9a86d7f1f6ea022dace87614030bf0fde0d260f0 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -659,7 +659,6 @@ static inline struct uvc_fh *to_uvc_fh(struct file *filp)
 #define UVC_WARN_XU_GET_RES	2
 
 extern unsigned int uvc_clock_param;
-extern unsigned int uvc_no_drop_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;

-- 
2.52.0.rc1.455.g30608eb744-goog


