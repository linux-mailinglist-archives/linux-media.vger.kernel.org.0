Return-Path: <linux-media+bounces-66067-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rPUoEfuXQ2pscwoAu9opvQ
	(envelope-from <linux-media+bounces-66067-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:18:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D119A6E2B9F
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 12:18:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=YdaSvtFH;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66067-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66067-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BF70301E02C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338C83EF649;
	Tue, 30 Jun 2026 10:17:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04CB3EF647
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 10:17:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814655; cv=none; b=nsFhVyGJnPc5VjFhnw3FE13B1k8FhSO9eDgvWRegeI9gp2p0ViQ26XL5T3RUb1tSKH5WY6I/XgebUkb5mkiaNMhq6dBPgYb6pTQP6fG0yRCNqtw9bhpbDdXOJr53TeAgD0qHVNpNQzUMKdBPtP5VWY1dMPcdha9Rcm3ZSoCv4kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814655; c=relaxed/simple;
	bh=I1Qm67onnUx3+aBNG1G7KSZ0V2hHxDazuuRE58dDFu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5GDPcdmLp+w1gYHDqbYDn5NqqlG2+SsUZFsNzg4fVdpUXhwNCCbKPYibJYkeJpQyNX4OYKC1z6ARqHwOO2O4fOFco9id7f1CsoXK0PgSzzljTZQr/lNVrCRgRk74J9tkfY543XCS+iY3gVHKNx/zIfB94trmaZrMHx3UqimE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YdaSvtFH; arc=none smtp.client-ip=209.85.208.51
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so3869374a12.0
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782814647; x=1783419447; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kenl4z+b5ADFgQxBu4DhaPDSzuS0lZBClA4yc0iErsI=;
        b=YdaSvtFHA/JRP5CTQPiEtVKGlUxtnHsH0jtjZCbZXTSuejApfAmbX7uKBK4vEOYaOE
         3q3NifyczT9Gi90iboD37c3VJAKnxu9xBqahEvos+uY4ClRQOZMeFm6sdXtuhqdiQ5+O
         cZsSgIWR0WrZY4CbmXmjtf7n2gpXgKoW2VpOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782814647; x=1783419447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kenl4z+b5ADFgQxBu4DhaPDSzuS0lZBClA4yc0iErsI=;
        b=aTVmTFOeY9VhYGFNLWpFZsu1pbgSdFmTILRzsYyB1b1JhCz9T4+bTTnIzawKvqdIq0
         zLz+/Vwjol/GElHFRu9eE61mJ67IQ+i2+uR31SUm7Z5LrRZ0z9PQjUa6rHEWSMgCHQ+d
         +h2ION8HEQs+juuMrycYH5ShfG6n3XNS/F0aPRz+0/WQOklXb3op2EeN+K8KGGMjKRhf
         +BQqgUtWgwyHh9CdYMGQ0ETPmifDV9Arxo9CYbHwS8pz9h4NYdVmWuC5/FLgAdbr55rG
         BlqJSFGsTAoyWH5xDTBRjPAJi1f6vppXuNrTI3/bS2bAlR5E646+MGENEn2rwDyJpPGD
         V3sA==
X-Forwarded-Encrypted: i=1; AHgh+RqnwWDaS/QgSIRn0zF2y76iDsmebObC610t/QEGXk6YkI5FBf98yN0ksICi13wxtfZR4whqH4YPzuvCTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkeztXq48WRKCVuolE6Zmd/NXfRIekC6Qsj6TIQ32/3R6Yy8C
	JyaYKs+g9/xJ+ERwd2rOPa8ImnWOKmcRa/5psVoYB6r5spvrjuI+gtsB/VBQOR/XJJ1FPfY6Iv5
	vUZkneruz
X-Gm-Gg: AfdE7cmHTRkM+c+f2MemAQd94Eiva8NAUynH9aTgHaDCNIEQNbT5sS4tgc6yyRwV3fI
	t2xQuVANOPkuwCIVN3TzeUA1j2nCTP8ypHA8eKtccpSX+QEyNJ46a6ubVzsyJ7hMq7NEdfQSDaq
	p8Ml0mp0piMMI++3k0wqMW7n44ZQLvRkNaRKTruUnAASu0OJW6oj03qVqRKjsUDmgdG5eBQf8SS
	9BNkUXhN7FEKWWlMKPkrKmK2s9h83tqYIWSOMUydE+PQS9fqdliFOvUcohUJSe+7CWUn7q5JPcS
	EJHP3KVpJjM+mQsZN6iTyqS59El+heCK7W/L/1aplhAAcTMelbBq1UykIi4bnhWejw2JsvqJ/5s
	mnRZGqPpNm2LaCj8XQspbfUn3C3XdjS5zcwF09GAckS2mABflGXujnw46nkIH+PvLgAj4DMkwrH
	PWsj3QmE+kA78Knq+jDEqUh8OhrZl1tV5Cl9GoZxFUwlVVQIIb6lNtvbzn0fIR
X-Received: by 2002:a05:6402:3587:b0:697:edf5:20cf with SMTP id 4fb4d7f45d1cf-69879dab55dmr1277566a12.14.1782814646660;
        Tue, 30 Jun 2026 03:17:26 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69885c9e8e8sm244045a12.16.2026.06.30.03.17.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:17:25 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c127ec4447cso188708466b.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 03:17:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6SMQWQ4+8IvqFNeJvCTBeg/V83I6T0zk6lmJrfKrnkPfnXOlYWwkpCoCYZKEwHz5LCryqXpQUsH9w9w==@vger.kernel.org
X-Received: by 2002:a17:906:3b5a:b0:c11:fd32:33a2 with SMTP id
 a640c23a62f3a-c12872d677bmr95588266b.34.1782814644604; Tue, 30 Jun 2026
 03:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
 <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org> <a0e4d412-f0bf-4415-9e4b-2c6347bf8c69@kernel.org>
In-Reply-To: <a0e4d412-f0bf-4415-9e4b-2c6347bf8c69@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Jun 2026 12:17:11 +0200
X-Gmail-Original-Message-ID: <CANiDSCtv_ZmTWUzbuxuEy0JmLmFs2Wqj31O3neGZ4ee=p065-g@mail.gmail.com>
X-Gm-Features: AVVi8CcQvEIh8vdS6YSwyEb--6mLCsTlu9WGcgR5xhasRxc1tv3K3sQYopg7UBw
Message-ID: <CANiDSCtv_ZmTWUzbuxuEy0JmLmFs2Wqj31O3neGZ4ee=p065-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Fix race condition for meta
 buffer list
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66067-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:email,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email,chromium.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D119A6E2B9F

Hi Hans,

Thanks for the prompt reply.

On Tue, 30 Jun 2026 at 11:47, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 29-Jun-26 19:31, Ricardo Ribalda wrote:
> > queue->irqueue contains a list of the buffers owned by the driver. The
> > list is protected by queue->irqlock. uvc_queue_get_current_buffer()
> > returns a pointer to the current buffer in that list, but does not
> > remove the buffer from it. This can lead to race conditions.
> >
> > Inspecting the code, it seems that the candidate for such race is
> > uvc_queue_return_buffers(). For the capture queue, that function is
> > called with the device streamoff, so no race can occur. On the other
> > hand, the metadata queue, could trigger a race condition, because
> > stop_streaming can be called with the device in any streaming state.
> >
> > We can solve this issue introducing a flag, stream->meta.in_flight,
> > protected with a spinlock. When there is a buffer in flight that can
> > write into metadata the flag is raised, notifying the stop streaming
> > that it needs to wait.
> >
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
> > Cc: stable@vger.kernel.org
> > Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> First of all thank you for looking into fixing this.
>
> I'm sorry, but this feels more like a band-aid then a proper fix.
>
> How about adding a started bool to struct uvc_streaming which gets
> set to 1 by uvc_video_start_streaming() and 0 by uvc_video_stop_streaming().
>
> And then call uvc_video_stop_streaming() from either
> uvc_stop_streaming_video() or uvc_stop_streaming_meta()
> depending on which one gets called first ?
>
> With a mutex protecting the started bool and being held
> over calling uvc_video_stop_streaming() ?
>
> So stop the actual hw streaming when either of the
> 2 possible /dev/video0 nodes gets its vb2_ops.stop_streaming
> callback called?
>
> And to this before draining the buffer queue.
>
> That seems cleaner then this approach?

Assuming /dev/video0 is the video node and /dev/video1 is the meta device.

Currently, we support something like:

1) yavta -c /dev/video0 &
2) yavta --capture=2 /dev/video1
3) yavta --capture=2 /dev/video1
4) kill %1


If I understood correctly, your proposal would cause the camera to
stop streaming when step 2 completes.

I think this risks breaking use cases.

As I see it, the issue is that the camera's live capture cycle is
controlled solely by video0. We need some kind of synchronization
mechanism with video1 if we do not want to change the behaviour and
risk breaking apps.

>
> Regards,
>
> Hans
>
> p.s.
>
> 1. It is tempting to also apply the same approach to
> vb2_ops.start_streaming, but allowing the meta queue to be
> the one to start streaming will likely cause issues. E.g.
> the streaming code assumes having a meta-queue active is
> optional, but not the other way around.
>
> TL;DR: vb2_ops.start_streaming should stay as is.
>
> 2. While looking into this I noticed that struct uvc_streaming
> already has an active member, but unless I'm missing something
> that ever only gets initialized to 0. So I think that can be
> dropped. (If you re-use this please change it to a bool, no
> need to have it atomic while protected by a mutex).

I will send a patch to fix this. Thanks for noticing :)

>
>
>
> > ---
> >  drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
> >  drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
> >  drivers/media/usb/uvc/uvcvideo.h  |  2 ++
> >  3 files changed, 45 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > index 3c002c8f442f..af9dbfcf6f53 100644
> > --- a/drivers/media/usb/uvc/uvc_queue.c
> > +++ b/drivers/media/usb/uvc/uvc_queue.c
> > @@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
> >  static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> >  {
> >       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > +     struct uvc_streaming *stream = queue->stream;
> >
> >       lockdep_assert_irqs_enabled();
> >
> > +     spin_lock_irq(&stream->meta.irqlock);
> > +     while (stream->meta.in_flight) {
> > +             spin_unlock_irq(&stream->meta.irqlock);
> > +             schedule();
> > +             spin_lock_irq(&stream->meta.irqlock);
> > +     }
> > +     stream->meta.in_flight = true;
> > +     spin_unlock_irq(&stream->meta.irqlock);
> > +
> >       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > +
> > +     scoped_guard(spinlock_irq, &stream->meta.irqlock) {
> > +             stream->meta.in_flight = false;
> > +     }
> >  }
> >
> >  static const struct vb2_ops uvc_queue_qops = {
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index fc3536a4399f..f6b55b3a3308 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> >       urb->transfer_buffer_length = stream->urb_size - len;
> >  }
> >
> > +static struct uvc_buffer *
> > +uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
> > +{
> > +     struct uvc_video_queue *queue = &stream->meta.queue;
> > +     struct uvc_buffer *buf;
> > +
> > +     buf = uvc_queue_get_current_buffer(queue);
> > +     if (!buf)
> > +             return NULL;
> > +
> > +     guard(spinlock_irqsave)(&stream->meta.irqlock);
> > +
> > +     if (stream->meta.in_flight)
> > +             return NULL;
> > +
> > +     stream->meta.in_flight = true;
> > +
> > +     return buf;
> > +}
> > +
> >  static void uvc_video_complete(struct urb *urb)
> >  {
> >       struct uvc_urb *uvc_urb = urb->context;
> > @@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
> >       buf = uvc_queue_get_current_buffer(queue);
> >
> >       if (vb2_qmeta)
> > -             buf_meta = uvc_queue_get_current_buffer(qmeta);
> > +             buf_meta = uvc_video_get_current_meta_buffer(stream);
> >
> >       /* Re-initialise the URB async work. */
> >       uvc_urb->async_operations = 0;
> > @@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
> >        */
> >       stream->decode(uvc_urb, buf, buf_meta);
> >
> > +     if (buf_meta) {
> > +             scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
> > +                     stream->meta.in_flight = false;
> > +             }
> > +     }
> > +
> >       /* If no async work is needed, resubmit the URB immediately. */
> >       if (!uvc_urb->async_operations) {
> >               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> > @@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> >       for_each_uvc_urb(uvc_urb, stream)
> >               INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
> >
> > +     spin_lock_init(&stream->meta.irqlock);
> > +
> >       return 0;
> >  }
> >
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b6bcee4a222f..6f1a3381d392 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -484,6 +484,8 @@ struct uvc_streaming {
> >               struct uvc_video_queue queue;
> >               u32 format;
> >               u32 buffersize;
> > +             bool in_flight;
> > +             spinlock_t irqlock; /* Protects in_flight. */
> >       } meta;
> >
> >       /* Context data used by the bulk completion handler. */
> >
>


-- 
Ricardo Ribalda

