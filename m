Return-Path: <linux-media+bounces-22399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA99DFAFC
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 08:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D934281B65
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 07:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F831F9402;
	Mon,  2 Dec 2024 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PCW+EESV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30B1E231E
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733123952; cv=none; b=N84i4TatcEJimFqISV6BVtqQ+cXAsEnctpWyRpB5Sec7nGigGGSLvVP3LjRGcY7yh7E0UQ2wSpgmNq7szgJcc63oeSqXMTlw53Me/0sC8rriQ7U/kwpaPMFVpSEcTlY6bCxeVxhMOvKAQj+Jul6LIoHE+rKwlgR46XywIgNz3wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733123952; c=relaxed/simple;
	bh=hf+j1g7yW69ryzI+X5FfA9uPgl1kewffZVhpIIVWCJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P14lmspa4MAWL4ILhubbQ/oZfwiFQBGpdaMDh3LmqiiUnPE0yL44j978VYVCPUr5SiIBsgLAK9n1HhW6O40Zs5NzuWHsi7Szq0z64tVtCAtSv5Kg/qqKB0QC0rdLh9o9Sd6n3Gfpiy4Zg/3oXGxyk/fE1dTqoWM1BRc8jkPCmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PCW+EESV; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so3487418b3a.3
        for <linux-media@vger.kernel.org>; Sun, 01 Dec 2024 23:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733123950; x=1733728750; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SPZJ5SXB7m8Dqvv2I1ZRy2n3cYkDrshlZ9d02Y7QxTY=;
        b=PCW+EESVFrtbQwec/vSF05/NipOlwMbI5x3Nj/iSys7kzggvMtDRVKkKp8VV/G0379
         LYwov9jpXQ5ItVLyHvWut+HMlirKIb5kMjo485AS9E7y+40trCbeNmCRG4I34wawL73+
         30SOyhQlL+hFpKy9VzEvPiCHk8F+HYmv6kD7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733123950; x=1733728750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPZJ5SXB7m8Dqvv2I1ZRy2n3cYkDrshlZ9d02Y7QxTY=;
        b=LHgcDP3PVYBauFIFNywwuoEQCmyheo+ey22Mm5aCc3L+Kb3zI4eo3kTBjTAUVC5s1e
         0hXqok4BaXnSPFzb03hgqJGAmD8tlCyCVroFaDSVdKObTjkPhZ0zdC0R5Z7xjbktIvCk
         1yBUsmYCGSGsTxr9HlrxzQx87j1oTy11B64NEwj/Oqfg1gwKK/jgTO26KkXvFGpe5hc+
         jvTDBibd+r+X9tB3Wczln6IabpUnYF59O42AF8zca4/tVo0b0euCK/oNcq5YZE6nWcV3
         Oe6l8PdClQ62NoXC/syo8xMeIoHk+Y+/u+NzoI9unn9Q/lA5T/WTdJ4sUiFwTAPVIs6w
         sV2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL4vLjEUhbu16qRu4Ql0nM32rfArjPpjTs9BLEl1WQGZ20K7n93OCxCNLnIvcH0QRsXzSqH2xivWLuhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46LiR96IYNrFeEn4SQSqLish0w93+GaF1aGiyfgndvxt6PgwQ
	fnKLi2uHuCRNARIZbeS96Qw5HetJYz3m+Ym/Iwp8skTXNLBLipmT46vCDzwNIAWH2oRviDBkkH0
	=
X-Gm-Gg: ASbGncuPE17WnyjxiWl/D03Ic6nIVNme5AMP2c5r4kA1l+gycSDESr3yyHOjNlCAv9Z
	YwOstGNpgRykXW739PMqJ+EkEdSLa42Q6NzAbfsnKpLRX0yb2qywtIskUuUk7XkxiyeJc+pKU96
	Xqr/hWVJNPoIyvLeGKa7lpinoW0F6gUCyWjiIhGUe47A4VWYM9w+WotbY5gdnLzLsH0F0Tu6Gj8
	KSNtTd7RwHKofTQy4plRcMHedYdNJajRwWuZ9exfcv8ofo2HPMqo+VS2R8EIJs0IFR4v9OVSpBS
	8W+RD6jBYcZX
X-Google-Smtp-Source: AGHT+IH9qo8H0wufC4P9DwkyDZ44rfPnzLDJbWavTyaf96DKaVOuDvPLxSvJXYz8Iw9SOYKFLwVQZQ==
X-Received: by 2002:a05:6a00:22d6:b0:71e:4296:2e with SMTP id d2e1a72fcca58-72530034bb8mr25182690b3a.11.1733123949676;
        Sun, 01 Dec 2024 23:19:09 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725417fc064sm7737527b3a.130.2024.12.01.23.19.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 23:19:08 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so1042166a91.3
        for <linux-media@vger.kernel.org>; Sun, 01 Dec 2024 23:19:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL2LGoZSXUQmbClZmiTV63oNXmnODMs0GytIhUIanQ0iZbxlPHAD/XA+fK4BxruD4XulpqD1wNlPWLrA==@vger.kernel.org
X-Received: by 2002:a17:90b:17d0:b0:2ee:8abd:7254 with SMTP id
 98e67ed59e1d1-2ee8abd742amr9239433a91.36.1733123947424; Sun, 01 Dec 2024
 23:19:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241129-uvc-fix-async-v4-0-f23784dba80f@chromium.org>
 <20241129-uvc-fix-async-v4-2-f23784dba80f@chromium.org> <CANiDSCv3986=KjwWOXsKGZ58+YMViHeHvam=ax7iKr=x_h_pRw@mail.gmail.com>
In-Reply-To: <CANiDSCv3986=KjwWOXsKGZ58+YMViHeHvam=ax7iKr=x_h_pRw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 08:18:54 +0100
X-Gmail-Original-Message-ID: <CANiDSCuWwVRdxUR4_Sxt8wCg+459p34t02AdOeD22LaG+AU2pw@mail.gmail.com>
Message-ID: <CANiDSCuWwVRdxUR4_Sxt8wCg+459p34t02AdOeD22LaG+AU2pw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 18:15, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> nit:
>
> After sleeping on it. I think this could be nicer expressed  with:
> uvc_ctrl_get_handle and uvc_ctrl_put_handle
>
> Let me know what do you prefer:
>
>
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 88ef8fdc2be2..d4a010cdf805 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1579,6 +1579,35 @@ static void uvc_ctrl_send_slave_event(struct
> uvc_video_chain *chain,
>         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
>  }
>
> +static int uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> +{
> +       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
We can even:  lockdep_assert_held(&handle->chain->ctrl_mutex);
> +
> +       if (handle == ctrl->handle) /* Nothing to do here. */
> +               return 0;
> +
> +       /* We can't change the original handler. */
> +       if (ctrl->handle)
> +               return -EBUSY;
> +
> +       ctrl->handle = handle;
> +       handle->pending_async_ctrls++;
> +       return 0;
> +}
> +
> +static void uvc_ctrl_put_handle(struct uvc_fh *handle, struct
> uvc_control *ctrl)
> +{
> +       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
> +
> +       if (!ctrl->handle) /* Nothing to do here.*/
> +               return;
> +
> +       ctrl->handle = NULL;
> +       if (WARN_ON(!handle->pending_async_ctrls))
> +               return;
> +       handle->pending_async_ctrls--;
> +}
> +
>  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>                            struct uvc_control *ctrl, const u8 *data)
>  {
> @@ -1589,7 +1618,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
>         mutex_lock(&chain->ctrl_mutex);
>
>         handle = ctrl->handle;
> -       ctrl->handle = NULL;
> +       uvc_ctrl_put_handle(handle, ctrl);
>
>         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
>                 s32 value = __uvc_ctrl_get_value(mapping, data);
> @@ -2046,8 +2075,8 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>         mapping->set(mapping, value,
>                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>
> -       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
> -               ctrl->handle = handle;
> +       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +               uvc_ctrl_get_handle(handle, ctrl);
>
>         ctrl->dirty = 1;
>         ctrl->modified = 1;
> @@ -2770,6 +2799,22 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
>         return 0;
>  }
>
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> +{
> +       struct uvc_entity *entity;
> +
> +       guard(mutex)(&handle->chain->ctrl_mutex);
> +
> +       if (!handle->pending_async_ctrls)
> +               return;
> +
> +       list_for_each_entry(entity, &handle->chain->dev->entities, list)
> +               for (unsigned int i = 0; i < entity->ncontrols; ++i)
> +                       uvc_ctrl_put_handle(handle, &entity->controls[i]);
> +
> +       WARN_ON(handle->pending_async_ctrls);
> +}
> +
>  /*
>   * Cleanup device controls.
>   */
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 97c5407f6603..b425306a3b8c 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
>
>         uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
>
> +       uvc_ctrl_cleanup_fh(handle);
> +
>         /* Only free resources if this is a privileged handle. */
>         if (uvc_has_privileges(handle))
>                 uvc_queue_release(&stream->queue);
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index ce688b80e986..e0e4f099a210 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -340,7 +340,11 @@ struct uvc_video_chain {
>         struct uvc_entity *processing;          /* Processing unit */
>         struct uvc_entity *selector;            /* Selector unit */
>
> -       struct mutex ctrl_mutex;                /* Protects ctrl.info */
> +       struct mutex ctrl_mutex;                /*
> +                                                * Protects ctrl.info,
> +                                                * ctrl.handle and
> +                                                * uvc_fh.pending_async_ctrls
> +                                                */
>
>         struct v4l2_prio_state prio;            /* V4L2 priority state */
>         u32 caps;                               /* V4L2 chain-wide caps */
> @@ -615,6 +619,7 @@ struct uvc_fh {
>         struct uvc_video_chain *chain;
>         struct uvc_streaming *stream;
>         enum uvc_handle_state state;
> +       unsigned int pending_async_ctrls;
>  };
>
>  struct uvc_driver {
> @@ -800,6 +805,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain
> *chain, u32 v4l2_id,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>                       struct uvc_xu_control_query *xqry);
>
> +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> +
>  /* Utility functions */
>  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
>                                             u8 epaddr);
>
> On Fri, 29 Nov 2024 at 22:30, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
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
> >  drivers/media/usb/uvc/uvc_ctrl.c | 54 ++++++++++++++++++++++++++++++++++++++--
> >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> >  drivers/media/usb/uvc/uvcvideo.h |  9 ++++++-
> >  3 files changed, 62 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 88ef8fdc2be2..bc96fb475b9c 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1579,6 +1579,33 @@ static void uvc_ctrl_send_slave_event(struct uvc_video_chain *chain,
> >         uvc_ctrl_send_event(chain, handle, ctrl, mapping, val, changes);
> >  }
> >
> > +static void uvc_ctrl_set_handle(struct uvc_control *ctrl, struct uvc_fh *handle)
> > +{
> > +       /* NOTE: We must own the chain->ctrl_mutex to run this function. */
> > +
> > +       if (handle) {
> > +               if (handle == ctrl->handle) /* Nothing to do here. */
> > +                       return;
> > +
> > +               /* We can't change the original handler. */
> > +               if (WARN_ON(ctrl->handle))
> > +                       return;
> > +
> > +               ctrl->handle = handle;
> > +               handle->pending_async_ctrls++;
> > +               return;
> > +       }
> > +
> > +       if (!ctrl->handle) /* Nothing to do here.*/
> > +               return;
> > +
> > +       handle = ctrl->handle;
> > +       ctrl->handle = NULL;
> > +       if (WARN_ON(!handle->pending_async_ctrls))
> > +               return;
> > +       handle->pending_async_ctrls--;
> > +}
> > +
> >  void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >                            struct uvc_control *ctrl, const u8 *data)
> >  {
> > @@ -1589,7 +1616,7 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> >         mutex_lock(&chain->ctrl_mutex);
> >
> >         handle = ctrl->handle;
> > -       ctrl->handle = NULL;
> > +       uvc_ctrl_set_handle(ctrl, NULL);
> >
> >         list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> >                 s32 value = __uvc_ctrl_get_value(mapping, data);
> > @@ -2047,7 +2074,7 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> >         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS && !ctrl->handle)
> > -               ctrl->handle = handle;
> > +               uvc_ctrl_set_handle(ctrl, handle);
> >
> >         ctrl->dirty = 1;
> >         ctrl->modified = 1;
> > @@ -2770,6 +2797,29 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >         return 0;
> >  }
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > +{
> > +       struct uvc_entity *entity;
> > +
> > +       guard(mutex)(&handle->chain->ctrl_mutex);
> > +
> > +       if (!handle->pending_async_ctrls)
> > +               return;
> > +
> > +       list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > +               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +                       struct uvc_control *ctrl = &entity->controls[i];
> > +
> > +                       if (ctrl->handle != handle)
> > +                               continue;
> > +
> > +                       uvc_ctrl_set_handle(ctrl, NULL);
> > +               }
> > +       }
> > +
> > +       WARN_ON(handle->pending_async_ctrls);
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
> >         uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> >
> > +       uvc_ctrl_cleanup_fh(handle);
> > +
> >         /* Only free resources if this is a privileged handle. */
> >         if (uvc_has_privileges(handle))
> >                 uvc_queue_release(&stream->queue);
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index ce688b80e986..e0e4f099a210 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -340,7 +340,11 @@ struct uvc_video_chain {
> >         struct uvc_entity *processing;          /* Processing unit */
> >         struct uvc_entity *selector;            /* Selector unit */
> >
> > -       struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > +       struct mutex ctrl_mutex;                /*
> > +                                                * Protects ctrl.info,
> > +                                                * ctrl.handle and
> > +                                                * uvc_fh.pending_async_ctrls
> > +                                                */
> >
> >         struct v4l2_prio_state prio;            /* V4L2 priority state */
> >         u32 caps;                               /* V4L2 chain-wide caps */
> > @@ -615,6 +619,7 @@ struct uvc_fh {
> >         struct uvc_video_chain *chain;
> >         struct uvc_streaming *stream;
> >         enum uvc_handle_state state;
> > +       unsigned int pending_async_ctrls;
> >  };
> >
> >  struct uvc_driver {
> > @@ -800,6 +805,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                       struct uvc_xu_control_query *xqry);
> >
> > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> >                                             u8 epaddr);
> >
> > --
> > 2.47.0.338.g60cca15819-goog
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

