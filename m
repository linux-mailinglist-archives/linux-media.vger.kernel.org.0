Return-Path: <linux-media+bounces-41988-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADFB48BFE
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 13:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C123A81B0
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 11:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90ABC2FF66D;
	Mon,  8 Sep 2025 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHRAwj8V"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1A2FB61F
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 11:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330217; cv=none; b=O9br5K8lQIRsmKGmcrTetADLjtsCNYwgsFolKGrNyMSw0kjxpWmKdLR9OBVRIaCqjvZievDOxcZElU/uxUcZKvYvLXlkxBkMgokQO0NNqDqAfgEFV7cEOAxwMmMn/SRRDZyqv5r/JyHBAsm7P1C9CBRKvnXw0wV4xC7d8weoXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330217; c=relaxed/simple;
	bh=cfWhoISSKUd4/HPy52q/po+E/bDHAKEDdFs6svXqglY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnfT1cRmfsgQV4UzxAQp383tYhpczImPbvAquHyYfirllA3+s7Ve6MMlDbA1E7gNjFZGiwlur8nOcJ4p3Pee6svAtvDEGYkS55dJfcUak2CNBMEubtB+Vs/fHT2GS0b4VGL6rmtEO3Y5TDv+JNJ+4a2uKL6R6qFSUe0+swOCdiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QHRAwj8V; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5608d792558so4804442e87.0
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 04:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757330212; x=1757935012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CvMgIa6NfN/+40OPhd/GGuBzxDir3sztObXR4PANXWM=;
        b=QHRAwj8V5q4DfFXFuQDwG+WpvfGQpSu0jgFxD3zMO7imIfGi4cKM6zAEouoxT+u8Nr
         x0hyGHXyadDd4aerHy4UJBbXVha7fWYx/O5SMDCJ1679L9JZs8Fgnp+hU+XMl6TX5Qva
         TaNriIc4ffoD4qDaflaEDaOaaaQAS0A+ZZosg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330212; x=1757935012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvMgIa6NfN/+40OPhd/GGuBzxDir3sztObXR4PANXWM=;
        b=mJ0/XroDvyVA3s3jsU9SElksJcoai6cF7vkRMQp0pcw4l+CMq9arWA8Rp/Apf9iYW3
         dsHATk6yOeCyJopF9sJNT7adOxVY64UDV5HW6bhxO5bSlp5lUWJbJncyoZTiwmhvZjfz
         +Ye7rrX1HlZf4B9Z1A2v39fEFmRrUNGREdgFVVDkykYtfitlpYtF3drjlOpVB0f7tPdT
         Yrg0Bxv4PvpojJp9OnuYmxIdkfYqDSLGqIvmLgFQrQIIrnGpvJ/ig8BrDzogtIH9/1io
         qPY8v1e79GU9RzrtdloPRerEKpwvYcAx1sBeJc8+HtMnqxojgyClOgH+89HvRuvsL3QO
         KNkg==
X-Forwarded-Encrypted: i=1; AJvYcCUaw4RPYoKOgwZBbved0nI0ZD+2GwBS/5A4j3u0VyrvWF0Q7uqL0imjtA3Baok4wRQjX4DIOQlhTHAPtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7cjeHXIpC5h1T8uu7wRJUbLxbxOemrHWFk31wPQCedd66Vxg
	oGx8j7ul/VWE0XXs6BqAI/Ra5x5whQ8znCuxkYrvKLFm5wNbIUfUW83E4g+9vKAzp+t4YgNy2P6
	YpOg=
X-Gm-Gg: ASbGncsKuiF1ytpGAjOd2g0pMvCaWulBXZSiZOfMSOYBBt5A53FQH3r6nXyhdYI/EcJ
	sfv119RrBaTjAsZ3t6tYdNggs8vd/VdDHmhgxO79Q+v80Ny1m7ETnwViADYgBeRpVnjF3WUFoFV
	v9AedMGxFEHxCPfXVV91+YJtxAxUvpOcKdmIesBF9hZ65NQeONb4bPiPqBUA3qwuVlQZYMGbPgz
	ejG8i7NQ9RJopdppErbVxdNKDObypoG2wfPFMPMkrZlak836mEPh/fqT6xspaOAmPBvdZPljrfZ
	2NW3cN4L2HCwDe9aF2hh1K22E0zXAVkemoG3j580Wim9bOCG1LiPdlkxdhqPSrjEIg7Bq4Em+Af
	37BYD8MloeWxeoT6jyZWv2JJrDhv+BGSMG58reE7viKYmP8CzG0IZ0mUlnWyBEnglwdO01rY=
X-Google-Smtp-Source: AGHT+IEITqv8kyuSHif1Zzw3I3Gdbk41d8P4bbYFZt6r7krZeiP/KS5kpmX9BZQNHLkWEZzSu7Pk3A==
X-Received: by 2002:a05:6512:3a8b:b0:55f:6a68:c44a with SMTP id 2adb3069b0e04-5625eb94e96mr2084515e87.2.1757330212307;
        Mon, 08 Sep 2025 04:16:52 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace7e45sm3442304e87.77.2025.09.08.04.16.51
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 04:16:51 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f753ec672so4823641e87.2
        for <linux-media@vger.kernel.org>; Mon, 08 Sep 2025 04:16:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwqd1/T3HcM++QKWJ6iUqREdld2FDs0YcEmGPBwjDV0q0FadSD2U+1oIe7oODSc0j2qeI0VY+wdkkdXw==@vger.kernel.org
X-Received: by 2002:a05:6512:3b0c:b0:55f:43ff:9a3c with SMTP id
 2adb3069b0e04-5626219494fmr2120190e87.57.1757330210831; Mon, 08 Sep 2025
 04:16:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-uvc-racemeta-v1-1-360de2e15a9a@chromium.org>
 <20250908102532.GC26062@pendragon.ideasonboard.com> <CANiDSCsFCADj9NHURG8FV-1mTj8XhtksEqtk75-i3C3e6YyXUQ@mail.gmail.com>
In-Reply-To: <CANiDSCsFCADj9NHURG8FV-1mTj8XhtksEqtk75-i3C3e6YyXUQ@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 8 Sep 2025 13:16:38 +0200
X-Gmail-Original-Message-ID: <CANiDSCuxMmD7M9XJLVmd1rRewqYqHq5WjtY4xgKggWBzsxn5Rw@mail.gmail.com>
X-Gm-Features: Ac12FXy6gFyE4Yc92qPG5qcDG7hibk6B9s1zcf6lKd5iwGt2IuCqWJomMhM-jFM
Message-ID: <CANiDSCuxMmD7M9XJLVmd1rRewqYqHq5WjtY4xgKggWBzsxn5Rw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix race condition for meta buffer list
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sept 2025 at 12:57, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Laurent
>
> On Mon, 8 Sept 2025 at 12:25, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Ricardo,
> >
> > Thank you for the patch.
> >
> > On Mon, Jul 14, 2025 at 10:23:45AM +0000, Ricardo Ribalda wrote:
> > > queue->irqueue contains a list of the buffers owned by the driver. The
> > > list is protected by queue->irqlock. uvc_queue_get_current_buffer()
> > > returns a pointer to the current buffer in that list, but does not
> > > remove the buffer from it. This can lead to race conditions.
> > >
> > > Inspecting the code, it seems that the candidate for such race is
> > > uvc_queue_return_buffers(). For the capture queue, that function is
> > > called with the device streamoff, so no race can occur. On the other
> > > hand, the metadata queue, could trigger a race condition, because
> > > stop_streaming can be called with the device in any streaming state.
> > >
> > > We can solve this issue modifying the way the metadata buffer
> > > lifetime works. We can keep the queue->irqlock while the use the current
> > > metadata buffer.
> > >
> > > The core of this change is uvc_video_decode_meta(), it now obtains the
> > > buffer and holds the spinlock instead of getting the buffer as an
> > > argument.
> > >
> > > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
> > > Cc: stable@vger.kernel.org
> > > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_isight.c |  3 +-
> > >  drivers/media/usb/uvc/uvc_queue.c  |  4 +-
> > >  drivers/media/usb/uvc/uvc_video.c  | 92 ++++++++++++++++++++++----------------
> > >  drivers/media/usb/uvc/uvcvideo.h   |  8 ++--
> > >  4 files changed, 62 insertions(+), 45 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_isight.c b/drivers/media/usb/uvc/uvc_isight.c
> > > index 43cda5e760a345af56186603e2f0594b814cdbcb..f0e71744d25cab98184335b46569b31ba1346e12 100644
> > > --- a/drivers/media/usb/uvc/uvc_isight.c
> > > +++ b/drivers/media/usb/uvc/uvc_isight.c
> > > @@ -98,8 +98,7 @@ static int isight_decode(struct uvc_video_queue *queue, struct uvc_buffer *buf,
> > >       return 0;
> > >  }
> > >
> > > -void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
> > > -                     struct uvc_buffer *meta_buf)
> > > +void uvc_video_decode_isight(struct uvc_urb *uvc_urb, struct uvc_buffer *buf)
> > >  {
> > >       struct urb *urb = uvc_urb->urb;
> > >       struct uvc_streaming *stream = uvc_urb->stream;
> > > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > > index 790184c9843d211d34fa7d66801631d5a07450bd..e184e3ae0f59f142a683263168724bca64509628 100644
> > > --- a/drivers/media/usb/uvc/uvc_queue.c
> > > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > > @@ -310,9 +310,11 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
> > >   * Buffers may span multiple packets, and even URBs, therefore the active buffer
> > >   * remains on the queue until the EOF marker.
> > >   */
> > > -static struct uvc_buffer *
> > > +struct uvc_buffer *
> > >  __uvc_queue_get_current_buffer(struct uvc_video_queue *queue)
> > >  {
> > > +     lockdep_assert_held(&queue->irqlock);
> > > +
> > >       if (list_empty(&queue->irqqueue))
> > >               return NULL;
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > index 2e377e7b9e81599aca19b800a171cc16a09c1e8a..d6777090d0f892ffe93696c915acd4ec171ca798 100644
> > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > @@ -1428,9 +1428,11 @@ static int uvc_video_encode_data(struct uvc_streaming *stream,
> > >   * previous header.
> > >   */
> > >  static void uvc_video_decode_meta(struct uvc_streaming *stream,
> > > -                               struct uvc_buffer *meta_buf,
> > >                                 const u8 *mem, unsigned int length)
> > >  {
> > > +     struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
> > > +     struct uvc_video_queue *qmeta = &stream->meta.queue;
> > > +     struct uvc_buffer *meta_buf;
> > >       struct uvc_meta_buf *meta;
> > >       size_t len_std = 2;
> > >       bool has_pts, has_scr;
> > > @@ -1439,7 +1441,13 @@ static void uvc_video_decode_meta(struct uvc_streaming *stream,
> > >       ktime_t time;
> > >       const u8 *scr;
> > >
> > > -     if (!meta_buf || length == 2)
> > > +     if (!vb2_qmeta || length <= 2)
> > > +             return;
> > > +
> > > +     guard(spinlock_irqsave)(&qmeta->irqlock);
> >
> > This keeps the spinlock held for longer than I would like. We should
> > really try to minimize the amount of work performed with a spinlock
> > held.
>
> We are using meta_buf the whole function, which can disappear if  the
> user closes the metadata file descriptor.
>
> Besides memcopying meta_buf, how would you suggest reducing the
> spinlock held time?

Actually, it can be slightly improved....

But I am not sure if holding and releasing the spinlock twice will be
any better....


Let me know if you prefer the previous version or this one.

Regards

diff --git a/drivers/media/usb/uvc/uvc_video.c
b/drivers/media/usb/uvc/uvc_video.c
index 178f1e40c189..fa96789e6089 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1430,11 +1430,12 @@ static void uvc_video_decode_meta(struct
uvc_streaming *stream,
        if (!vb2_qmeta || length <= 2)
                return;

-       guard(spinlock_irqsave)(&qmeta->irqlock);
-
-       meta_buf = __uvc_queue_get_current_buffer(qmeta);
-       if (!meta_buf)
+       spin_lock_irq(&qmeta->irqlock);
+       if (list_empty(qmeta->irqqueue)) {
+               spin_unlock_irq(&qmeta->irqlock);
                return;
+       }
+       spin_unlock_irq(&qmeta->irqlock);

        has_pts = mem[1] & UVC_STREAM_PTS;
        has_scr = mem[1] & UVC_STREAM_SCR;
@@ -1456,27 +1457,38 @@ static void uvc_video_decode_meta(struct
uvc_streaming *stream,
                                  !memcmp(scr, stream->clock.last_scr, 6)))
                return;

+       if (has_scr)
+               memcpy(stream->clock.last_scr, scr, 6);
+
+       local_irq_save(flags);
+       time = uvc_video_get_time();
+       sof = usb_get_current_frame_number(stream->dev->udev);
+       local_irq_restore(flags);
+
+       spin_lock_irq(&qmeta->irqlock);
+
+       meta_buf = __uvc_queue_get_current_buffer(qmeta);
+       if (!meta_buf) {
+               spin_unlock_irq(&qmeta->irqlock);
+               return;
+       }
+
        if (meta_buf->length - meta_buf->bytesused <
            length + sizeof(meta->ns) + sizeof(meta->sof)) {
                meta_buf->error = 1;
+               spin_unlock_irq(&qmeta->irqlock);
                return;
        }

        meta = (struct uvc_meta_buf *)((u8 *)meta_buf->mem +
meta_buf->bytesused);
-       local_irq_save(flags);
-       time = uvc_video_get_time();
-       sof = usb_get_current_frame_number(stream->dev->udev);
-       local_irq_restore(flags);
        put_unaligned(ktime_to_ns(time), &meta->ns);
        put_unaligned(sof, &meta->sof);

-       if (has_scr)
-               memcpy(stream->clock.last_scr, scr, 6);
-
        meta->length = mem[0];
        meta->flags  = mem[1];
        memcpy(meta->buf, &mem[2], length - 2);
        meta_buf->bytesused += length + sizeof(meta->ns) + sizeof(meta->sof);
+       spin_unlock_irq(&qmeta->irqlock);

        uvc_dbg(stream->dev, FRAME,
                "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS
%u, STC %u frame SOF %u\n",



>
> Regards!
>
>
> >
> > > +
> > > +     meta_buf = __uvc_queue_get_current_buffer(qmeta);
> > > +     if (!meta_buf)
> > >               return;
> > >
> > >       has_pts = mem[1] & UVC_STREAM_PTS;
> > > @@ -1512,30 +1520,48 @@ static void uvc_video_validate_buffer(const struct uvc_streaming *stream,
> > >   * Completion handler for video URBs.
> > >   */
> > >
> > > -static void uvc_video_next_buffers(struct uvc_streaming *stream,
> > > -             struct uvc_buffer **video_buf, struct uvc_buffer **meta_buf)
> > > +static void uvc_video_next_meta(struct uvc_streaming *stream,
> > > +                             struct uvc_buffer *video_buf)
> > >  {
> > > -     uvc_video_validate_buffer(stream, *video_buf);
> > > +     struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
> > > +     struct uvc_video_queue *qmeta = &stream->meta.queue;
> > > +     struct uvc_buffer *meta_buf;
> > > +     struct vb2_v4l2_buffer *vb2_meta;
> > > +     const struct vb2_v4l2_buffer *vb2_video;
> > >
> > > -     if (*meta_buf) {
> > > -             struct vb2_v4l2_buffer *vb2_meta = &(*meta_buf)->buf;
> > > -             const struct vb2_v4l2_buffer *vb2_video = &(*video_buf)->buf;
> > > +     if (!vb2_qmeta)
> > > +             return;
> > >
> > > -             vb2_meta->sequence = vb2_video->sequence;
> > > -             vb2_meta->field = vb2_video->field;
> > > -             vb2_meta->vb2_buf.timestamp = vb2_video->vb2_buf.timestamp;
> > > +     guard(spinlock_irqsave)(&qmeta->irqlock);
> > >
> > > -             (*meta_buf)->state = UVC_BUF_STATE_READY;
> > > -             if (!(*meta_buf)->error)
> > > -                     (*meta_buf)->error = (*video_buf)->error;
> > > -             *meta_buf = uvc_queue_next_buffer(&stream->meta.queue,
> > > -                                               *meta_buf);
> > > -     }
> > > -     *video_buf = uvc_queue_next_buffer(&stream->queue, *video_buf);
> > > +     meta_buf = __uvc_queue_get_current_buffer(qmeta);
> > > +     if (!meta_buf)
> > > +             return;
> > > +     list_del(&meta_buf->queue);
> > > +
> > > +     vb2_meta = &meta_buf->buf;
> > > +     vb2_video = &video_buf->buf;
> > > +
> > > +     vb2_meta->sequence = vb2_video->sequence;
> > > +     vb2_meta->field = vb2_video->field;
> > > +     vb2_meta->vb2_buf.timestamp = vb2_video->vb2_buf.timestamp;
> > > +     meta_buf->state = UVC_BUF_STATE_READY;
> > > +     if (!meta_buf->error)
> > > +             meta_buf->error = video_buf->error;
> > > +
> > > +     uvc_queue_buffer_release(meta_buf);
> > > +}
> > > +
> > > +static struct uvc_buffer *uvc_video_next_buffer(struct uvc_streaming *stream,
> > > +                                             struct uvc_buffer *video_buf)
> > > +{
> > > +     uvc_video_validate_buffer(stream, video_buf);
> > > +     uvc_video_next_meta(stream, video_buf);
> > > +     return uvc_queue_next_buffer(&stream->queue, video_buf);
> > >  }
> > >
> > >  static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
> > > -                     struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> > > +                               struct uvc_buffer *buf)
> > >  {
> > >       struct urb *urb = uvc_urb->urb;
> > >       struct uvc_streaming *stream = uvc_urb->stream;
> > > @@ -1559,13 +1585,13 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
> > >                       ret = uvc_video_decode_start(stream, buf, mem,
> > >                               urb->iso_frame_desc[i].actual_length);
> > >                       if (ret == -EAGAIN)
> > > -                             uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > +                             buf = uvc_video_next_buffer(stream, buf);
> > >               } while (ret == -EAGAIN);
> > >
> > >               if (ret < 0)
> > >                       continue;
> > >
> > > -             uvc_video_decode_meta(stream, meta_buf, mem, ret);
> > > +             uvc_video_decode_meta(stream, mem, ret);
> > >
> > >               /* Decode the payload data. */
> > >               uvc_video_decode_data(uvc_urb, buf, mem + ret,
> > > @@ -1576,12 +1602,12 @@ static void uvc_video_decode_isoc(struct uvc_urb *uvc_urb,
> > >                       urb->iso_frame_desc[i].actual_length);
> > >
> > >               if (buf->state == UVC_BUF_STATE_READY)
> > > -                     uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > +                     buf = uvc_video_next_buffer(stream, buf);
> > >       }
> > >  }
> > >
> > >  static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> > > -                     struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> > > +                               struct uvc_buffer *buf)
> > >  {
> > >       struct urb *urb = uvc_urb->urb;
> > >       struct uvc_streaming *stream = uvc_urb->stream;
> > > @@ -1607,7 +1633,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> > >               do {
> > >                       ret = uvc_video_decode_start(stream, buf, mem, len);
> > >                       if (ret == -EAGAIN)
> > > -                             uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > +                             buf = uvc_video_next_buffer(stream, buf);
> > >               } while (ret == -EAGAIN);
> > >
> > >               /* If an error occurred skip the rest of the payload. */
> > > @@ -1617,7 +1643,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> > >                       memcpy(stream->bulk.header, mem, ret);
> > >                       stream->bulk.header_size = ret;
> > >
> > > -                     uvc_video_decode_meta(stream, meta_buf, mem, ret);
> > > +                     uvc_video_decode_meta(stream, mem, ret);
> > >
> > >                       mem += ret;
> > >                       len -= ret;
> > > @@ -1644,7 +1670,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> > >                       uvc_video_decode_end(stream, buf, stream->bulk.header,
> > >                               stream->bulk.payload_size);
> > >                       if (buf->state == UVC_BUF_STATE_READY)
> > > -                             uvc_video_next_buffers(stream, &buf, &meta_buf);
> > > +                             buf = uvc_video_next_buffer(stream, buf);
> > >               }
> > >
> > >               stream->bulk.header_size = 0;
> > > @@ -1654,7 +1680,7 @@ static void uvc_video_decode_bulk(struct uvc_urb *uvc_urb,
> > >  }
> > >
> > >  static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> > > -     struct uvc_buffer *buf, struct uvc_buffer *meta_buf)
> > > +                               struct uvc_buffer *buf)
> > >  {
> > >       struct urb *urb = uvc_urb->urb;
> > >       struct uvc_streaming *stream = uvc_urb->stream;
> > > @@ -1707,8 +1733,6 @@ static void uvc_video_complete(struct urb *urb)
> > >       struct uvc_video_queue *qmeta = &stream->meta.queue;
> > >       struct vb2_queue *vb2_qmeta = stream->meta.vdev.queue;
> > >       struct uvc_buffer *buf = NULL;
> > > -     struct uvc_buffer *buf_meta = NULL;
> > > -     unsigned long flags;
> > >       int ret;
> > >
> > >       switch (urb->status) {
> > > @@ -1734,14 +1758,6 @@ static void uvc_video_complete(struct urb *urb)
> > >
> > >       buf = uvc_queue_get_current_buffer(queue);
> > >
> > > -     if (vb2_qmeta) {
> > > -             spin_lock_irqsave(&qmeta->irqlock, flags);
> > > -             if (!list_empty(&qmeta->irqqueue))
> > > -                     buf_meta = list_first_entry(&qmeta->irqqueue,
> > > -                                                 struct uvc_buffer, queue);
> > > -             spin_unlock_irqrestore(&qmeta->irqlock, flags);
> > > -     }
> > > -
> > >       /* Re-initialise the URB async work. */
> > >       uvc_urb->async_operations = 0;
> > >
> > > @@ -1755,7 +1771,7 @@ static void uvc_video_complete(struct urb *urb)
> > >        * Process the URB headers, and optionally queue expensive memcpy tasks
> > >        * to be deferred to a work queue.
> > >        */
> > > -     stream->decode(uvc_urb, buf, buf_meta);
> > > +     stream->decode(uvc_urb, buf);
> > >
> > >       /* If no async work is needed, resubmit the URB immediately. */
> > >       if (!uvc_urb->async_operations) {
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 757254fc4fe930ae61c9d0425f04d4cd074a617e..bb41477ce4ff5cdbf27bc9d830b63a60645e3fa1 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -479,8 +479,7 @@ struct uvc_streaming {
> > >       unsigned int frozen : 1;
> > >       struct uvc_video_queue queue;
> > >       struct workqueue_struct *async_wq;
> > > -     void (*decode)(struct uvc_urb *uvc_urb, struct uvc_buffer *buf,
> > > -                    struct uvc_buffer *meta_buf);
> > > +     void (*decode)(struct uvc_urb *uvc_urb, struct uvc_buffer *buf);
> > >
> > >       struct {
> > >               struct video_device vdev;
> > > @@ -694,6 +693,8 @@ int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
> > >  void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect);
> > >  struct uvc_buffer *uvc_queue_next_buffer(struct uvc_video_queue *queue,
> > >                                        struct uvc_buffer *buf);
> > > +struct uvc_buffer *
> > > +__uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
> > >  struct uvc_buffer *uvc_queue_get_current_buffer(struct uvc_video_queue *queue);
> > >  void uvc_queue_buffer_release(struct uvc_buffer *buf);
> > >  static inline int uvc_queue_streaming(struct uvc_video_queue *queue)
> > > @@ -802,8 +803,7 @@ u16 uvc_endpoint_max_bpi(struct usb_device *dev, struct usb_host_endpoint *ep);
> > >
> > >  /* Quirks support */
> > >  void uvc_video_decode_isight(struct uvc_urb *uvc_urb,
> > > -                          struct uvc_buffer *buf,
> > > -                          struct uvc_buffer *meta_buf);
> > > +                          struct uvc_buffer *buf);
> > >
> > >  /* debugfs and statistics */
> > >  void uvc_debugfs_init(void);
> > >
> > > ---
> > > base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
> > > change-id: 20250714-uvc-racemeta-fee2e69bbfcd
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

