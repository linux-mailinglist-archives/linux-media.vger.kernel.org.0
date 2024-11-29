Return-Path: <linux-media+bounces-22366-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7A9DECE1
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 22:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EC031632A5
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 21:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF48A1A3BD8;
	Fri, 29 Nov 2024 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y3YqLtQd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D5C189BAD
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732915373; cv=none; b=fQlcDkuIjhN2puPdj6Q9kbCD1xubR+MziT5sV6U01F4ku43W8Q51+6ybQ6Y/yGjhKpHLcq+wxykGegO+AsCoEPLWMtvbpWyJ6f8W09+nZHRCuDwXAkuIzKqblKzSpI6eQ1lEr6mNCWoqCTR4uyoNnbR744IDYoEnWXT92AuNNy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732915373; c=relaxed/simple;
	bh=80ZvND0vrv1LGQrThwq1XamSj43hNvKpegvZ/7CMUZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNlbYzc7Zg0xmPg/iqysSuMatopQbyOYB5fsMcslEJ4a1KWnJul3Rm+5c0vjHTX6ZHp7oHu2ZeDLTyccK3yVlEZdpPYKJuy8DSQqCtQr/GQ5Q48PrBOfUjdk+higu76qNyvIM/sRZdwWAfc69QwH31wJfaxk8nGfW8gc5ICF+BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y3YqLtQd; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2142214abd2so18133155ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732915369; x=1733520169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4e3sx4dJc7nOwA8uivkLR2rCCckmz0cOxuXR8yppGM=;
        b=Y3YqLtQdsOEgKbe23X4+ashFxWSpVra0ewWEs/AS6RK775mToh5U1fa64n01vNpZJ9
         Rd9eS9fDU+S9MyiYLI5QLTn5WDcP2yKQqfjDWrXP4bqHjOmAfhRqq1+2LP6rTOEXrHZK
         whQY4sLvEwB03Xg1pGsOlf81QKJUls9C7oDDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732915369; x=1733520169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4e3sx4dJc7nOwA8uivkLR2rCCckmz0cOxuXR8yppGM=;
        b=ng0iewOEcELHCAWvpQ5M3efNu11Ulg0DOZ4zTrPG6xnP0c0nnRQzlNnbeEtBOptk7l
         65sU609AKUN1FVUiPgswluEq5xwBSljjQSdUAKpatqCMUuN+WWFAgqf9Rm3loPGl4Ypw
         +mHa+ECqJ82f7UWtl03LCI66fBil0ZMn7Ka6r/xbtJIZkR7/5O8EXb2tIwtfWmXgLh89
         XSQFMuELpXqn2WSBn+SHyXySbAqmx5fwbsoyuNpwH9CGq0LDOQi/vI8dtMnvaRPTnMdC
         rmDWcduplkvjUhDCbgelhmbUKSG8bs2DJeK7hRPtV5d0mbl7kXOs/laaATIE6stBfmHS
         o3hw==
X-Forwarded-Encrypted: i=1; AJvYcCXzN+KF5SDeaTN3EE4fAqFVrRFD49oVrSSAfL1Qy+XXNyD7knJ+lutrmyoejHF+bCIe8nAJG1/e0yqNXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwocHHUaaYWi1TqCjZLeIDemFUtc2EQCKAUyc+ysdkSdOQ4J1ur
	IyO49ynE/yehF+IGizqB2IQu4z3YHzpQLKLI+ua9OFEcygUuxN73iU66uuX59OEmM3N0bma52as
	=
X-Gm-Gg: ASbGncsTPmkYfpQVpWyLbq0/olN38Fiu/JOYvhcX5jVlu9rbMt02FRQQH4TMv/1VTHW
	kL3UOhFV4lBocX47Saq+W9h0M5GmL60I6n8qlCz6ZZwUVgIWQ1FkBHoP4vAXNY0aFU3dYb1R47K
	auPS7/TJXoybI5si+xn1izrRDhUwXoP3cUSNUfhs7HkefJRWtQ2YKWRFK+7DCDPFm6SKor8C4+T
	/sqW3NJ6/jJJwstCGP+QuHGESqou1D/pK6pVSKStFzoHhsdZh1mxSSAMRZUtWoRXGaIVum++Mza
	j+Sy3RfFuIY9wP1q
X-Google-Smtp-Source: AGHT+IGe3tMamzBcR8Br0m82rSVAQlRnzXWmuApWfMY5BtYgCEbXJVtGZtgCt0IB6zJiuYQrhk6hDA==
X-Received: by 2002:a17:902:e881:b0:20b:6d8c:463 with SMTP id d9443c01a7336-21501d6459emr139979205ad.35.1732915369109;
        Fri, 29 Nov 2024 13:22:49 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c52b6sm34734745ad.254.2024.11.29.13.22.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 13:22:48 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7250c199602so1915574b3a.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:22:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWvyLagOpsJHLMzBD7XaX77j3S6TEztBL7d5BpdHDTIwIMLw0zSr6VP4iT9oVC60X10HnU88r8I5iQB5Q==@vger.kernel.org
X-Received: by 2002:a17:90b:1d86:b0:2ee:7c02:8f08 with SMTP id
 98e67ed59e1d1-2ee7c029c75mr874584a91.37.1732915365753; Fri, 29 Nov 2024
 13:22:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-1-510aab9570dd@chromium.org> <20241128221649.GE25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128221649.GE25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 22:22:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCv3xtV-AN1P_d+gPog8OJ9gBD9iD_AWi78s8oNJKzRuBg@mail.gmail.com>
Message-ID: <CANiDSCv3xtV-AN1P_d+gPog8OJ9gBD9iD_AWi78s8oNJKzRuBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 23:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 12:14:49PM +0000, Ricardo Ribalda wrote:
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
>
> s/). A/), a/
>
> > that it is properly handled.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 38 ++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  8 +++++++-
> >  3 files changed, 45 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4fe26e82e3d1..b6af4ff92cbd 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>
> How about adding
>
> static void uvc_ctrl_set_handle(struct uvc_control *ctrl, uvc_fh *handle)
> {
>         if (handle) {
>                 if (!ctrl->handle)
>                         handle->pending_async_ctrls++;
>                 ctrl->handle = handle;
>         } else if (ctrl->handle) {
>                 ctrl->handle = NULL;
>                 if (!WARN_ON(!handle->pending_async_ctrls))
>                         handle->pending_async_ctrls--;

handle is NULL here. Luckily smatch found it :)

I am rewriting it a bit.



>         }
> }
>
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
> This would become
>
>         handle = ctrl->handle;
>         uvc_ctrl_set_handle(ctrl, NULL);
>
> >
> >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -2046,8 +2051,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       mapping->set(mapping, value,
> >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > +             if (!ctrl->handle)
> > +                     handle->pending_async_ctrls++;
> >               ctrl->handle = handle;
> > +     }
>
> Here
>
>         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>                 uvc_ctrl_set_handle(ctrl, handle);
>
> >
> >       ctrl->dirty = 1;
> >       ctrl->modified = 1;
> > @@ -2770,6 +2778,32 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
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
> > +             for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +                     struct uvc_control *ctrl = &entity->controls[i];
> > +
> > +                     if (ctrl->handle != handle)
> > +                             continue;
> > +
> > +                     ctrl->handle = NULL;
> > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > +                             continue;
> > +                     handle->pending_async_ctrls--;
>
> And here
>
>                         uvc_ctrl_set_handle(ctrl, NULL);
>
> It seems less error-prone to centralize the logic. I'd add a
> lockdep_assert() in uvc_ctrl_set_handle(), but there's no easy access to
> the chain there.
>
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
> > index 07f9921d83f2..c68659b70221 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -337,7 +337,10 @@ struct uvc_video_chain {
> >       struct uvc_entity *processing;          /* Processing unit */
> >       struct uvc_entity *selector;            /* Selector unit */
> >
> > -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > +     struct mutex ctrl_mutex;                /*
> > +                                              * Protects ctrl.info and
> > +                                              * uvc_fh.pending_async_ctrls
> > +                                              */
> >
> >       struct v4l2_prio_state prio;            /* V4L2 priority state */
> >       u32 caps;                               /* V4L2 chain-wide caps */
> > @@ -612,6 +615,7 @@ struct uvc_fh {
> >       struct uvc_video_chain *chain;
> >       struct uvc_streaming *stream;
> >       enum uvc_handle_state state;
> > +     unsigned int pending_async_ctrls;
> >  };
> >
> >  struct uvc_driver {
> > @@ -797,6 +801,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
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

