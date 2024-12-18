Return-Path: <linux-media+bounces-23732-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5C9F6FA2
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 22:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2B7F18922D9
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 21:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D3A1FECDE;
	Wed, 18 Dec 2024 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eKE19M5v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147D1FE47D
	for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557974; cv=none; b=X/8Ck3dEK3CrMo5bqiOQAU9sZpR/quwNSRg+NWQxiXgISmNOIWHeuRe7u0mUVpOvYeNoQ0IAIxrITFKxKNH9qnu6NGSnFwg+XWVC4BVd4gnvIcbYhlyRPV8427DvfE0O+gdvBYFGKYByLDnzxaqRGqLPebTAYD/1NyhwhesIfU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557974; c=relaxed/simple;
	bh=CBYJz7xst02f+rvRo7Dg+NiYrgBua5RnvZLDBzVCnsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZynSl2WzSMqdrWRJe/SwXhmnNmTFGI4AxSFEqIAHqRHIoorfHNR/HAU9IqMH1TY+Z16Li3sMzYCdWKnb6LwG8mjQqOGEzDzuMnhDqGeBVbjyAKxEU+Ju9CEy4ODpe/e+4PcxoqGePBG45GCK+pc9PRqvIRbnuwhK2/CwI882tHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eKE19M5v; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46792996074so586051cf.0
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2024 13:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734557971; x=1735162771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFJSV2Tib3aXPFdC1dC52bGWx6Vk7zubK7d/mVN0uIk=;
        b=eKE19M5vqMTzEbVuvMxrnLk6OB2M3swkonkIeHObHlNtfEcCdWUOFKXE3pRZUmZBxi
         5x3fyig7K1mxfUT5hsE9RHFrJK45XBgoIkJByEVTq8gwFExiCrmY2t+zaG/YkFx2S/uG
         QN177wtmc6FxfEz3tRoswYhegaufUsVnBINQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734557971; x=1735162771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFJSV2Tib3aXPFdC1dC52bGWx6Vk7zubK7d/mVN0uIk=;
        b=VxWzHKNeX8eJ9fXCZ84ufw5nOHmd5hwmFZT97N1ux8s19GWzjG2e/vTewjd21Db43r
         OtOtw62sIs6t05cdMjNRQDqzQEOhvy7ZJXsY+YIARKY/fxhbRC+pFii3CZs/EJK8gK/C
         wvtONXT+ZbxoEavyI58+Dh4/23VGidHlxWBv0PlEkKXonuXoqOPhbYczqmqeFdsaw0DH
         4EQuxiJ4OZBetLEe+Tx3fXVkV6QuMxG8CChBl5j7gFXyLK1mwB8q4PJPOBXZ632/ojUQ
         Iy5Mn/d7mljtu/BBKeRyVj1zfuwyfs1gF/S68YOVQpfT3wy+diWDA7QIXbwpGCpSxK2j
         HFLQ==
X-Gm-Message-State: AOJu0YyiAildM48eEffFT37WT4Ta/4dRmV9GXspUwoc+V8InMGXxI1cS
	iwJ0xFkLsEa2O3ImugMBG6xinE+pOhsfx0oM35ebTzJdouDRDbx45Zqif/7mYzueBGqYH43rPxw
	=
X-Gm-Gg: ASbGncsxA7B/rEU8oVTrEEoi44iRkTeEP2Z/nzSWEexKm5OXSSTmFK2eT4U1H62yivI
	/nxZFUmMTRYbFPeQRN4Q78O6DucqrbEXHmzIQ2XknjcBQnD94hmAucXnhgEhkofgRrxGl5k0f47
	sLfpfOzFtHa/TPWEw91XD/7PVMWrLuaCDU2LVNR2hhnKJLP+QAk6jharYWFNzk5haFVSAB3KZtw
	wJV2ytk9WiRUFG+nsV24+6vttn1Y4LrBZmUkwIR3B9g9ZrteyU+e2jGjhgGHmtTSYiw8/JyKHRN
	RoiBDqRGWciH5yoqNzn5SiQqvAo5A90=
X-Google-Smtp-Source: AGHT+IGrn06yZu7HqtlYKmaZmmEmMaEPVMY2NFIICkHpbTjFlQfDl6+x6KRZsyqz7MRrefukf9NQGQ==
X-Received: by 2002:a05:622a:58a:b0:467:6617:2ed4 with SMTP id d75a77b69052e-46908e74d07mr76408991cf.40.1734557971105;
        Wed, 18 Dec 2024 13:39:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2c6e312sm55176651cf.8.2024.12.18.13.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 13:39:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Dec 2024 21:39:10 +0000
Subject: [PATCH v2 3/4] media: uvcvideo: Allow changing noparam on the fly
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-uvc-deprecate-v2-3-ab814139e983@chromium.org>
References: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
In-Reply-To: <20241218-uvc-deprecate-v2-0-ab814139e983@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Right now the parameter value is read during video_registration and
cannot be changed afterwards, despite its permissions 0644, that makes
the user believe that the value can be written.

The parameter only affects the beviour of uvc_queue_buffer_complete(),
with only one check per buffer.

We can read the value directly from uvc_queue_buffer_complete() and
therefore allowing changing it with sysfs on the fly.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 drivers/media/usb/uvc/uvc_queue.c  | 6 ++----
 drivers/media/usb/uvc/uvcvideo.h   | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 091145743872..10812a841587 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1995,7 +1995,7 @@ int uvc_register_video_device(struct uvc_device *dev,
 	int ret;
 
 	/* Initialize the video buffers queue. */
-	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
+	ret = uvc_queue_init(queue, type);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index f8464f0aae1b..2ee142621042 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -208,8 +208,7 @@ static const struct vb2_ops uvc_meta_queue_qops = {
 	.stop_streaming = uvc_stop_streaming,
 };
 
-int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
-		    int drop_corrupted)
+int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
 {
 	int ret;
 
@@ -239,7 +238,6 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
 	mutex_init(&queue->mutex);
 	spin_lock_init(&queue->irqlock);
 	INIT_LIST_HEAD(&queue->irqqueue);
-	queue->flags = drop_corrupted ? UVC_QUEUE_DROP_CORRUPTED : 0;
 
 	return 0;
 }
@@ -472,7 +470,7 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
 
-	if ((queue->flags & UVC_QUEUE_DROP_CORRUPTED) && buf->error) {
+	if (buf->error && !uvc_no_drop_param) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 07f9921d83f2..ebbd8afcf136 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -316,7 +316,6 @@ struct uvc_buffer {
 };
 
 #define UVC_QUEUE_DISCONNECTED		(1 << 0)
-#define UVC_QUEUE_DROP_CORRUPTED	(1 << 1)
 
 struct uvc_video_queue {
 	struct vb2_queue queue;
@@ -674,8 +673,7 @@ extern struct uvc_driver uvc_driver;
 struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
 
 /* Video buffers queue management. */
-int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type,
-		   int drop_corrupted);
+int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
 void uvc_queue_release(struct uvc_video_queue *queue);
 int uvc_request_buffers(struct uvc_video_queue *queue,
 			struct v4l2_requestbuffers *rb);

-- 
2.47.1.613.gc27f4b7a9f-goog


