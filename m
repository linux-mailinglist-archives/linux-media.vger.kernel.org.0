Return-Path: <linux-media+bounces-33935-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9DACB52A
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 17:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B8EB9E5BC1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 14:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416C22253FB;
	Mon,  2 Jun 2025 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z/TiNLeE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FA4224AF1
	for <linux-media@vger.kernel.org>; Mon,  2 Jun 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875123; cv=none; b=KKagmrQiBGwnGnFztj1byt7wYv7ZDEdPn9vx91Vu54hW2WmHHUjx2M7nQkI8vNpZEYUcpmfcaU5imK5E76+b2QIcZxKZ4L+U2MXFGbDLlP6vPBe9l6wjxvk4WAIdQOFdfWxbjIUZ9U18JjZ6BVBIDk7u6PT4JHdJ9IWExR4i2uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875123; c=relaxed/simple;
	bh=poPgeSp9ZmGZQ6GeaEB5A104ggQ242XLyEILS9Dvwck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Auyz16Lb4QZOXqGUhv+VkBuTpgINuE20LN9xtpUGudKuItZmDNyLzNQaCkOVybKiZie5BJf4jLBgdXeZuIgwRRmqnaYrCUiHdksbIN6xQzRrj121hpQmcqMcTWPLoKRBt2ANJPEiyMOeDCqEfG7eRsMK77AvKXQOizCHQWjFXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z/TiNLeE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso5458887e87.2
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748875119; x=1749479919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DM2pVl85i85Pi3qXUGu2fRylJB2o+wDvgXnwohKyoNM=;
        b=Z/TiNLeEbX/K8/s69GTdjXp2o80NstNylvP/u6R23LbxzRwW3xQN+GVZyFTDOwGsY9
         MZ6meFc07ZB6mk5knWhzUUudJe2ezaAH0SYmjBnKePHhlIl4tpyXWUcLYfiTeIS9yTwj
         pOvRCma5W6RqWvBz1Z+DJrooXobCNb10PVix8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875119; x=1749479919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DM2pVl85i85Pi3qXUGu2fRylJB2o+wDvgXnwohKyoNM=;
        b=UULoIFD+Oul7AQSSePTZhHUE7Pblu9A/VQNZutkPfLoXjSOVV5nra5lHq7HYWYMXa6
         d66G3mWnmqlFr1g/r/19hoM8iRj+Wp9TK7OlBezjnionxaCE4et+F2pPKOaXHLDAHs4b
         h1CnwIlG5oSalzycHeMQpYjMBWR0mV/RYtfTPu60uop9nZhFIsBKn5Ip6sEi9FrH40kn
         O4pRSpWhwwznX5KeXOTGvNLgTX+m7nFGiJtMBzYQp10S5JPwSCXWPqNStjRw8409BmfB
         ge9uey4d0VadKCdAcNbb/irrL9jfLTIKu8qmJdaN8xYxRYOH4au6lh+jJlpDpyr7whxO
         e8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOVYmf8ufPmn4+Q55O0AfGY1upeoJO9Ss4C+XcG7LRbJjlVR5fs3Ru612FS3Lbi6/a379C6279f6p4tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaMamYhg2HfxQyk40NBAZalRgxoKMnijHWybJZ5q3xvox4oYB7
	fD7ZhKukytfDDaNv243nRW5mawKJ3+4iKleCEyjTT/XqpeQx5F2a+CvivkHaKGomo5ItqMtYghR
	PnGs=
X-Gm-Gg: ASbGnctvkGLKer57hM8pMKyR/mCoqepYvvwTTRi0gWVdMA5aurDOF9mQmheekSHuiYH
	/Y5x88mBmA1dU5i/E1/Lgx5YV5Mtf2A+I5fAD50EztgVUK9Fr1J6EtwMMg6lfLD3DNYnwLZjMB9
	U1KHXgBqvdu/hwetB9TWJRrHsgCAPNqjQ0bR7SzsK33b+tetcilAKkSLArSxfFk048UG3rUHT1d
	HzskLeUF9ozUFYbKXpfP18Qdnk3ZaMSkU90SM5x/UVFf1wBkikB2t3jH0w+pB2oU7Vca19dReau
	ZbxKdEJsCmmeKu9GadEHfxwJPyg7udwJWXogkZmdo6gh6loeWUfCb4lKsL4Ese9bMhaL7eMoXsv
	+zzte2QWI14Lwvmkb/YhmuHme
X-Google-Smtp-Source: AGHT+IFDhHx5iMs5q6iYRCKErPoG6aEd5X1ZM9YKnuyBDp7l5nGO5CtQbfbn8Z+1GsdnJnk0/2alIw==
X-Received: by 2002:a05:6512:39c3:b0:553:3770:c907 with SMTP id 2adb3069b0e04-55342f51a5amr2277370e87.10.1748875119468;
        Mon, 02 Jun 2025 07:38:39 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55350cab5b7sm133414e87.52.2025.06.02.07.38.37
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:38:38 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5534f3722caso660993e87.0
        for <linux-media@vger.kernel.org>; Mon, 02 Jun 2025 07:38:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3Itg9iJIo68hnywybldYg9bb9MIAN24B51PyOcoAQL+EUsuYS4yDWEaOnM325lSO5VmK437s+vOCKPA==@vger.kernel.org
X-Received: by 2002:a05:6512:6d2:b0:553:2f40:3704 with SMTP id
 2adb3069b0e04-55342f5be5dmr2332489e87.13.1748875117227; Mon, 02 Jun 2025
 07:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602-uvc-fop-v2-0-508a293eae81@chromium.org>
 <20250602-uvc-fop-v2-3-508a293eae81@chromium.org> <dba66347-7b6c-49b5-8d31-166845efd1a0@jjverkuil.nl>
 <CANiDSCttXAu0bJHG7L=Y4Y0LqfRQa=Y-wC8PKr1Pv7Hwpq6Txg@mail.gmail.com>
 <663123d4-9ac4-4c8d-bc88-d4e197786199@jjverkuil.nl> <20250602140235.GE23515@pendragon.ideasonboard.com>
In-Reply-To: <20250602140235.GE23515@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Jun 2025 16:38:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
X-Gm-Features: AX0GCFu2aSQuRkg0kAhurtLY6wLhvHv6d-nNMYEXGrKxT0LacwjkIkLOKyQOL4E
Message-ID: <CANiDSCtyyJ9fHko5r2eFK06V7Mhrti1zTBfQ2h_GmNF5EDcU+w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Remove stream->is_streaming field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent, Hi Hans
> > If this isn't fixed, then at least add a comment explaining why you test for
> > != V4L2_BUF_TYPE_META_CAPTURE before calling uvc_pm_put. It's not obvious.
>
> Agreed.

Maybe this is better than a comment?

diff --git a/drivers/media/usb/uvc/uvc_queue.c
b/drivers/media/usb/uvc/uvc_queue.c
index 72c5494dee9f..7f9d731df32c 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -39,8 +39,6 @@ static inline struct uvc_buffer
*uvc_vbuf_to_buffer(struct vb2_v4l2_buffer *buf)

 /*
  * Return all queued buffers to videobuf2 in the requested state.
- *
- * This function must be called with the queue spinlock held.
  */
 static void uvc_queue_return_buffers(struct uvc_video_queue *queue,
                               enum uvc_buffer_state state)
@@ -49,6 +47,8 @@ static void uvc_queue_return_buffers(struct
uvc_video_queue *queue,
                                        ? VB2_BUF_STATE_ERROR
                                        : VB2_BUF_STATE_QUEUED;

+       spin_lock_irq(&queue->irqlock);
+
        while (!list_empty(&queue->irqqueue)) {
                struct uvc_buffer *buf = list_first_entry(&queue->irqqueue,
                                                          struct uvc_buffer,
@@ -57,6 +57,8 @@ static void uvc_queue_return_buffers(struct
uvc_video_queue *queue,
                buf->state = state;
                vb2_buffer_done(&buf->buf.vb2_buf, vb2_state);
        }
+
+       spin_unlock_irq(&queue->irqlock);
 }

 /* -----------------------------------------------------------------------------
@@ -157,7 +159,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
                uvc_video_clock_update(stream, vbuf, buf);
 }

-static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
+static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
 {
        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
        struct uvc_streaming *stream = uvc_queue_to_stream(queue);
@@ -171,25 +173,29 @@ static int uvc_start_streaming(struct vb2_queue
*vq, unsigned int count)
        if (ret == 0)
                return 0;

-       spin_lock_irq(&queue->irqlock);
        uvc_queue_return_buffers(queue, UVC_BUF_STATE_QUEUED);
-       spin_unlock_irq(&queue->irqlock);

        return ret;
 }

-static void uvc_stop_streaming(struct vb2_queue *vq)
+static void uvc_stop_streaming_meta(struct vb2_queue *vq)
 {
        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);

        lockdep_assert_irqs_enabled();

-       if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
-               uvc_video_stop_streaming(uvc_queue_to_stream(queue));
+       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+}
+
+static void uvc_stop_streaming_video(struct vb2_queue *vq)
+{
+       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
+
+       lockdep_assert_irqs_enabled();
+
+       uvc_video_stop_streaming(uvc_queue_to_stream(queue));

-       spin_lock_irq(&queue->irqlock);
        uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
-       spin_unlock_irq(&queue->irqlock);
 }

 static const struct vb2_ops uvc_queue_qops = {
@@ -197,15 +203,15 @@ static const struct vb2_ops uvc_queue_qops = {
        .buf_prepare = uvc_buffer_prepare,
        .buf_queue = uvc_buffer_queue,
        .buf_finish = uvc_buffer_finish,
-       .start_streaming = uvc_start_streaming,
-       .stop_streaming = uvc_stop_streaming,
+       .start_streaming = uvc_start_streaming_video,
+       .stop_streaming = uvc_stop_streaming_video,
 };

 static const struct vb2_ops uvc_meta_queue_qops = {
        .queue_setup = uvc_queue_setup,
        .buf_prepare = uvc_buffer_prepare,
        .buf_queue = uvc_buffer_queue,
-       .stop_streaming = uvc_stop_streaming,
+       .stop_streaming = uvc_stop_streaming_meta,
 };

 int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)



-- 
Ricardo Ribalda

