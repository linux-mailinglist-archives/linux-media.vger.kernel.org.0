Return-Path: <linux-media+bounces-22158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245B49DA5AD
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 11:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B60A9165BDE
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22D4197A8E;
	Wed, 27 Nov 2024 10:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="er9cd2ch"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8044E191F99
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703046; cv=none; b=jFnmaIkfuWNWA+godsmJ4NFIC1WhsDKvdBBVxhYT901FqoeCZGAJfQwAtSG9gvCs1A7+OqGlPUaJ3JVBGStLuSko0gNzxln+izZqXUYKkG9+5fhIrCoDhB/EfYEkUkHgd304/xmlE86P9U0wVHsnP67Purw1hKIHYWpgQw55Jj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703046; c=relaxed/simple;
	bh=s/29r5n/PffnCPwFdcBMy5Ksy9kXK58eqgRjZWRApcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P0V2sz1HrZ5oerUnnA0PKUWf1QF8vPTTMAGOpl07Q+8R18TeRGqQ6o8lf/z64Lbd+Yg4qll3Q5uxlq/d1Z8LfrbK4ToTIztwXmxnhN+VXZ50L8nWqIp2tKvfuU/Sm7rnhKHZMzjg73iCubztRJ9qkjtMjSxOf/Y6kVtFGPoll/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=er9cd2ch; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29aea31a833so993074fac.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 02:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732703043; x=1733307843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I0bQ1CUfBZuSK4RB9yLrSNIGe1uMoD/kYv5gCJtf/9U=;
        b=er9cd2chbFxvNXWNqx8LgMKBzoSsj4A2BR6GwnZII85I9S9vofS2jC9Jok7z+++f7b
         K3syJIznRCdtw+Ch/CaudX/tvA7SAq1Ffq4A4SlbmzymB7H5XbrO+bXC8lMOtB+bpDLx
         hqBAqIwO75ropfJ/BpMdJYCfOg+XUdUNeyJQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732703043; x=1733307843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0bQ1CUfBZuSK4RB9yLrSNIGe1uMoD/kYv5gCJtf/9U=;
        b=ljsqGtowdgc1Gf3BpdFWuo/am1AN95GEicFIDjxLLAmdJslxqUkaj6jXof3ue4r5OG
         Ympipd0KYKnrZKNRn6HmTg1sV8c8nLmutAY4xYWvXllob3ZEYHSLTXQzr0lTvbBYuUaY
         KZLv7WQLEqJNaLYs+EBLL4eD2pYgSbsyxUDdZA67VM/86Cxtfjaun2JX7MLlE94HpGQf
         17z+qLlOVwqoxJOUPZ1gUK2OVNrgQcdjB+y/8dwMnCpIUGuLGfJUS3lgI/2wWdndv6rE
         ySHYAqC8slavUCECrCTxRMAACbsTNfFQx9l/7q3R1Uk4pU0sL36sLUuBNH6WG2MrC8vJ
         an6w==
X-Forwarded-Encrypted: i=1; AJvYcCXqMzspCf9Omgry8gD9jp+8jCVRpB4BhFsviw3YCl09MY23yOSPxQ+tuBHj1ygc1qpj4dc3nXTP2sI57w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaJru9OdaNrzrGvXvUQXlUaLIQhh7v0Fx39issQWHZURJgIcnk
	ZAY9DiYFYDz/W+uu8E/D66jfQuUqBjUeltCCWCVJf5CPaPfbW3nDNCR18MjvRl606Sz3Nb0yvJM
	=
X-Gm-Gg: ASbGnctoo7ZFaZfrd2LGOWCyLMNZO+vB8ASViBpenU0LIjm3GGPvBNhqumDF530hYiZ
	8yvAN5+aIQgggxUvQR+5S8N8ssmc8rzcV9PyTJk47phbDv2HVfW2NawSDRqEexXJNh6JY7Hdlgo
	MMwVaR47OBoKpuZ88mnUcYwAoR416BGBLp8vOxHytEgoqP4FMYFz9Km/82qmCymG7DJvcjTpIf4
	Wnq/tX/yjrofYXnpgisPcaIeLVQJhcmp3yct7JQnrOKaRj5sUnE1Fty6S0TVwxHNV+n4LwsiQ+w
	+Q9pqloRIR8IIMsj
X-Google-Smtp-Source: AGHT+IGYj+TQ1lT3n8e39/7wcBl5Bl0cztY6S/0T2sdeFg8vuGDZv2Kq+Pk98VcNszfzqj3q3q7YXQ==
X-Received: by 2002:a05:6870:828a:b0:287:6f4:1ac5 with SMTP id 586e51a60fabf-29dc418fdfamr2310144fac.20.1732703043462;
        Wed, 27 Nov 2024 02:24:03 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d56d96fsm4786796fac.1.2024.11.27.02.24.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:24:01 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3ea45abb4e1so1489356b6e.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 02:24:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOPOQLhlhu0fGP4xVUi283k80Op3j9ylyizfVz1BhteBAPCGUUtOolNM6/chDeSLTA320Qt3ma//MxgA==@vger.kernel.org
X-Received: by 2002:a05:6808:1b0a:b0:3e7:b956:976f with SMTP id
 5614622812f47-3ea6dbc8c56mr3367948b6e.11.1732703039945; Wed, 27 Nov 2024
 02:23:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-2-eb8722531b8c@chromium.org> <20241127093506.GE31095@pendragon.ideasonboard.com>
In-Reply-To: <20241127093506.GE31095@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 11:23:48 +0100
X-Gmail-Original-Message-ID: <CANiDSCtAxfnKbfEBedaDMvMJX49axeENp=gYPF65pKtgt5_XcQ@mail.gmail.com>
Message-ID: <CANiDSCtAxfnKbfEBedaDMvMJX49axeENp=gYPF65pKtgt5_XcQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:35, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 07:46:11AM +0000, Ricardo Ribalda wrote:
> > When an async control is written, we copy a pointer to the file handle
> > that started the operation. That pointer will be used when the device is
> > done. Which could be anytime in the future.
> >
> > If the user closes that file descriptor, its structure will be freed,
> > and there will be one dangling pointer per pending async control, that
> > the driver will try to use.
> >
> > Clean all the dangling pointers during release().
> >
> > To avoid adding a performance penalty in the most common case (no async
> > operation). A counter has been introduced with some logic to make sure
> > that it is properly handled.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 40 ++++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  3 +++
> >  3 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 5d3a28edf7f0..51a53ad25e9c 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >       mutex_lock(&chain->ctrl_mutex);
> >
> >       handle = ctrl->handle;
> > -     ctrl->handle = NULL;
> > +     if (handle) {
> > +             ctrl->handle = NULL;
> > +             WARN_ON(!handle->pending_async_ctrls);
> > +             if (handle->pending_async_ctrls)
> > +                     handle->pending_async_ctrls--;
> > +     }
>
> There's at least one other location where ctrl->handle is reset to NULL.

That assignment is not needed. I added a patch to remove it in the next version.

>
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -2050,8 +2055,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       mapping->set(mapping, value,
> >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > +             if (!ctrl->handle)
> > +                     handle->pending_async_ctrls++;
> >               ctrl->handle = handle;
>
> Is this protected by ctrl_mutex ?

yes, uvc_ctrl_set is only called by uvc_ioctl_s_try_ext_ctrls that
calls uvc_ctrl_begin

I will send another patch to add an annotation to the function to make
it explicit.

>
> Please be careful about locking and race conditions, taking the time to
> double check will help getting your patches merged faster.
>
> > +     }
> >
> >       ctrl->dirty = 1;
> >       ctrl->modified = 1;
> > @@ -2774,6 +2782,34 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >       return 0;
> >  }
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > +{
> > +     struct uvc_entity *entity;
> > +
> > +     guard(mutex)(&handle->chain->ctrl_mutex);
> > +
> > +     if (!handle->pending_async_ctrls)
> > +             return;
> > +
> > +     list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > +             int i;
>
> unsigned int
>
> I wonder if these days you could event write
>
>                 for (unsigned int i = 0; i < entity->ncontrols; ++i) {
>
> > +
> > +             for (i = 0; i < entity->ncontrols; ++i) {
> > +                     struct uvc_control *ctrl = &entity->controls[i];
> > +
> > +                     if (!ctrl->handle || ctrl->handle != handle)
>
> Given that handle can't be null, you can write
>
>                         if (ctrl->handle != handle)
>
> > +                             continue;
> > +
> > +                     ctrl->handle = NULL;
> > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > +                             continue;
>
> Is this needed ? If we find more controls for this handle than
> pending_async_ctrls, decrementing it below 0 will case the WARN_ON() at
> the end of this function to trigger, isn't that enough ?

I want to know if the warning is triggered because I have too many
pending_async_ctrls or too little.


>
> > +                     handle->pending_async_ctrls--;
> > +             }
> > +     }
> > +
> > +     WARN_ON(handle->pending_async_ctrls);
> > +}
> > +
> >  /*
> >   * Cleanup device controls.
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 97c5407f6603..b425306a3b8c 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> >
> >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> >
> > +     uvc_ctrl_cleanup_fh(handle);
> > +
> >       /* Only free resources if this is a privileged handle. */
> >       if (uvc_has_privileges(handle))
> >               uvc_queue_release(&stream->queue);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 07f9921d83f2..2f8a9c48e32a 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -612,6 +612,7 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       enum uvc_handle_state state;
> > +     unsigned int pending_async_ctrls; /* Protected by ctrl_mutex. */
>
> The kernel does it the other way around, it lists in the documentation
> of the lock what data it protects.
>
> >  };
> >
> >  struct uvc_driver {
> > @@ -797,6 +798,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                           u8 epaddr);
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

