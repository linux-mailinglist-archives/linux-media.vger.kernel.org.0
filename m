Return-Path: <linux-media+bounces-22572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A989E2E01
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 22:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363772819A2
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 21:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A9120ADCE;
	Tue,  3 Dec 2024 21:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JbwLMK/U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B41CFA9
	for <linux-media@vger.kernel.org>; Tue,  3 Dec 2024 21:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733260925; cv=none; b=h7YIRfYWJCUz6/qv2yVeWExeNTRm4MCZKkMn0xWq+8MNvlfG2h697lvZuz7OeLVkhws0GmMJEKBrPVEw9zwUG7ajiOuXIv7N1/R3kaEgi6+/GdtJGqAZFE+c7727Iy7RuZp39h8hchHfd6BPknVOg18BJdAKFFBk3y1X7GlXzSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733260925; c=relaxed/simple;
	bh=tFBF6f89BajU89XxB7AxUC/UV/cJJiLYLD8Oma6mD1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTRP1JI66Ktj4+2FBbC1f2CTrz3Lahk2qADVR9VbJNOl2vs6wy4bxEzQ3JUStYVmYTxRAj68RZvLhp/OM1+ei4jm/vbIXNvSHs7njCTOzstxiFAuDE2ujc9/NBQriPH0Y6cYgUfJwKIW8uv4925eaLpoYuGwX/0riW5+5Ak2V68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JbwLMK/U; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7250906bc63so181833b3a.1
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733260923; x=1733865723; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=36UgWamiPzC0P1+rxa9FT5lzKClXSFQ1ZREByvYdJcg=;
        b=JbwLMK/UcTyehEjy6+AnZX1Pw2lY/UEUpgY3i+wZQ6sr58Rm/x5nBxgUTP721t8vjz
         SQvqG1GnZz7fbyhQTsbBVEaM+aVkFwpzUGqXDPeMe1NqJEzkIOCtoO6AepOHICq5YdQL
         bf1ODPrIoszBZaxU671ELBSc50lK1fZevGG0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733260923; x=1733865723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36UgWamiPzC0P1+rxa9FT5lzKClXSFQ1ZREByvYdJcg=;
        b=sOs+qhBvkOJabGoFod9RyzWvUDiQUGMEMR59kfIimyCxLOHCcvS8/7+HPY0pqRyVC8
         JLv7A7Cju86mffb8JMAekSWY2m62lpFM4VEJPpN11mLnoG95EEZXYZgVy0QrwFKY/Ycc
         hZRnsZW0Di4Ar/xkqfD4CLrqEJGc/IkNCyR4DWtJBOSyIB4Xg4+kIJ4ZxDTwDfVX3qCb
         mewkArkZgKeOxzNhCyWnsauyt9toFKfk6aayWJlXCAJl7TF2e462eeLwcMfmp4OcA3fy
         nboMjqXwemc3NYS/iOLg9ZSJfvwoAqt7DUwbGLzXdC4DiBQfD1h9reph4/kxpYQ9luUz
         l7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9AYyCsTJTNjqNeCQOaSjieUG8Y5HAmyL24k+0g8V8mnDBptVSKIXy+lrfevIJP/x+G7sHOkfzeuvbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+QLj98EJSmYD048JFIgn2RaLUPXyXIAKJ8iUP6ux7X54GmQI
	SgdB2wZHxIx/WoTU6jhy4nEqN/f8fRsiUMNXaV+05KU9Yp8m5cO37KwhvHzJasrqedsUhItcGU0
	=
X-Gm-Gg: ASbGncsJFWLFCZl5CdeYRQe+rdK+XxvWEUD/ZOFcBYV6tPvuZ7XtUPNC5xnODG6bRTq
	vZGUKTDiNJ8MPkDBqHzZFD6PZiVJ6HX1PIUFK9pjuNAuB6H+tFlwlP+mBG+lNOO9rpdjNlS5M/R
	bNZLn9bIDwD91hDLH9o9+TQFh5O3weqXPNe/LufIr1NJNWnd+t3ZMKpEDQnRgYViQru41gNeMMN
	xdkywCJZ1qs6Lv4PSCP+Vcn9ynYC4++d+XkQ24BADG5NMOyxpxasM6UxBUYF6vyhjNbCzvhVJdt
	sd7tz1iEKTgFIvqf
X-Google-Smtp-Source: AGHT+IGoC/fa1RbI+XDffL+XpS/sm2MAVVSV8CQmV7n1X+D2/GojlC9CGbmfosLxdsziJlPL3NRLxg==
X-Received: by 2002:a05:6a00:990:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-7257f8fd4cdmr6885432b3a.4.1733260923198;
        Tue, 03 Dec 2024 13:22:03 -0800 (PST)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176121asm10898365b3a.39.2024.12.03.13.22.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 13:22:01 -0800 (PST)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fcf8406d8bso181300a12.0
        for <linux-media@vger.kernel.org>; Tue, 03 Dec 2024 13:22:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX66Wpm7vHKaPi1PttIcVW/9ct2WULTGIPK7Ad6RH8hT/Mnc70MEYZMd/Tc9w1MOtpeithXPTX7FRZsWw==@vger.kernel.org
X-Received: by 2002:a17:90b:8f:b0:2ee:4b72:fb47 with SMTP id
 98e67ed59e1d1-2ee4b72fcfbmr30541408a91.6.1733260920876; Tue, 03 Dec 2024
 13:22:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org> <20241203203557.GC5196@pendragon.ideasonboard.com>
In-Reply-To: <20241203203557.GC5196@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 3 Dec 2024 22:21:49 +0100
X-Gmail-Original-Message-ID: <CANiDSCuyhd3TAP63+LAOjsO2VdGoWKCRspNLWpOU_GW_bwoMvQ@mail.gmail.com>
Message-ID: <CANiDSCuyhd3TAP63+LAOjsO2VdGoWKCRspNLWpOU_GW_bwoMvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 21:36, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Dec 02, 2024 at 02:24:36PM +0000, Ricardo Ribalda wrote:
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
> > operation), a counter has been introduced with some logic to make sure
> > that it is properly handled.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 52 ++++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
> >  3 files changed, 60 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 9a80a7d8e73a..af1e38f5c6e9 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1579,6 +1579,37 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >       uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > +static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> > +{
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > +
> > +     if (ctrl->handle)
> > +             dev_warn_ratelimited(&handle->stream->dev->udev->dev,
> > +                                  "UVC non compliance: Setting an async control with a pending operation.");
> > +
> > +     if (handle == ctrl->handle)
> > +             return;
> > +
> > +     if (ctrl->handle)
> > +             ctrl->handle->pending_async_ctrls--;
> > +
> > +     ctrl->handle = handle;
> > +     handle->pending_async_ctrls++;
> > +}
> > +
> > +static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> > +{
> > +     lockdep_assert_held(&handle->chain->ctrl_mutex);
> > +
> > +     if (ctrl->handle != handle) /* Nothing to do here.*/
> > +             return;
> > +
> > +     ctrl->handle = NULL;
> > +     if (WARN_ON(!handle->pending_async_ctrls))
> > +             return;
> > +     handle->pending_async_ctrls--;
> > +}
>
> get/put have strong connotations in the kernel, related to acquiring a
> reference to a given object, and releasing it. The usage here is
> different, and I think it makes the usage below confusing. I prefer the
> original single function.

I just uploaded a new version... not sure if it looks nicer though.

Regards!

>
> > +
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >                          struct uvc_control *ctrl, const u8 *data)
> >  {
> > @@ -1589,7 +1620,8 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >       mutex_lock(&chain->ctrl_mutex);
> >
> >       handle = ctrl->handle;
> > -     ctrl->handle = NULL;
> > +     if (handle)
> > +             uvc_ctrl_put_handle(handle, ctrl);
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -1865,7 +1897,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> >
> >               if (!rollback && handle &&
> >                   ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -                     ctrl->handle = handle;
> > +                     uvc_ctrl_get_handle(handle, ctrl);
> >       }
> >
> >       return 0;
> > @@ -2774,6 +2806,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> > +     list_for_each_entry(entity, &handle->chain->dev->entities, list)
>
>         list_for_each_entry(entity, &handle->chain->dev->entities, list) {
>
> > +             for (unsigned int i = 0; i < entity->ncontrols; ++i)
> > +                     uvc_ctrl_put_handle(handle, &entity->controls[i]);
>
>         }
>
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
> > index 07f9921d83f2..92ecdd188587 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -337,7 +337,11 @@ struct uvc_video_chain {
> >       struct uvc_entity *processing;          /* Processing unit */
> >       struct uvc_entity *selector;            /* Selector unit */
> >
> > -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > +     struct mutex ctrl_mutex;                /*
> > +                                              * Protects ctrl.info,
> > +                                              * ctrl.handle and
> > +                                              * uvc_fh.pending_async_ctrls
> > +                                              */
> >
> >       struct v4l2_prio_state prio;            /* V4L2 priority state */
> >       u32 caps;                               /* V4L2 chain-wide caps */
> > @@ -612,6 +616,7 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       enum uvc_handle_state state;
> > +     unsigned int pending_async_ctrls;
> >  };
> >
> >  struct uvc_driver {
> > @@ -797,6 +802,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                           u8 epaddr);
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

