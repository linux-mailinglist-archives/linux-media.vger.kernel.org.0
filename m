Return-Path: <linux-media+bounces-22458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E59FB9E061B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 906C6B85C32
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8EB20A5E5;
	Mon,  2 Dec 2024 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OxRqgO1o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F0207A0B
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150977; cv=none; b=nNR5b7X/+HKIr0D2+zaCtavyk3Rn7njEg0q5IG8TCvfSlTIxUdbcN/T9wMYIZ0jQ9q8c2sgHlPw6F1CDoy1itLrO+gkj+cTJ2GsygHdxp5n9kJvtIzJfg/TwCE/XZCVOsw3zz4HmmEdnvxI6p14KSpdE3tR0x/Fr64qSOYb5j50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150977; c=relaxed/simple;
	bh=2m9GEJVF/yr5wEzb8uE3X2lDkqsav3aOKC6bdyMfmYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIRqndGKh7S/BjXkFgCWDQzUT94yh8QbMErFO2UJUR+7SzvpFgyfT53lE5Iqcbk2go/dUIYvDFWV98Zd6TNKd/Biy5MguPDwh4ZtEHOW1TM5MJL9tml4BA3EeMtoJaCMFGv0upwwJsLdltRlsfp+lcMokgKNQmAjriVETvuXP5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OxRqgO1o; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7251ace8bc0so3692831b3a.0
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733150975; x=1733755775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7HoIuRb1js2kiTuc3xiIAH76Um1J8d7m/3jS2ThDmu8=;
        b=OxRqgO1oW/zSvWILGuEikisfwnmqVKE3zMsyZvZOuuXeSHAuQS+L5+KHIAmHv4ukjO
         jBBe4Z23Gnfi0UqWwOr8TuNkBDK4nZXrjGTF/e8W5D5L69qimAPi65k7PILuuFC+pECv
         q8/aY+IRbn3jBAbZujYdSwLOJWh9Hb3MFmj0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150975; x=1733755775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HoIuRb1js2kiTuc3xiIAH76Um1J8d7m/3jS2ThDmu8=;
        b=SqjLdDSHQoNF/d30goX3ulIzTMe9keh9d4qZeVyEQD4/pED2L00tyuk1KDGFKJ/oJm
         xakVyMwoUTmv++JVetDGn70eg3ovVL45NRcawB9+JRWIVjkgYw6EQGp9V1x/FBwOwMAX
         fI0yscm+cyzI40QeGzu/J8g0m5fk/NjoKr6fjKq1/+9Fg7Z8fyXQauTeRdmYy/X4JtVz
         xVPCEJtCe07Zfd6IgI+eKuuegAJ4KWH/ugrDM8jsfOHVnA1QtAkCQWfXJCczpQrIdgS/
         G2ARmDqoGILL+WckRQKzyDDi70KFP1N0NxYEJjkgohx/jSREpDF1KHMp4Zf+TgVyabtB
         3KwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifT4zRC18xaGU+O3rE8txovbwAAzBRXMsks6kAD6GTipntSIiVWopSJEYGXCywtZYPPyIJa4L0pPBOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hoIESKVqtQ37dSE7xjra41x0eq/5SfBsgQ6NxqB5HzsJDaxO
	dd8gxdA4UVPU6FhAVFohEzCnjSgRoRfb/3KtzV5ykbpzfDlWcpWHpvtKxRTGYiAbBNIPWAWRpNo
	=
X-Gm-Gg: ASbGncvUV8rWFap2iaPF1UzmJ7m0PFoRs8P2F6EanALj6SosvMXboCGdOBjIdx7JU5C
	jlWccJOlsr6AyuzK9rIved7vG1v85bE+yRORLIAj4TY58O/RmoCeM8Vz6w1b2hrYEpBPKPMJNj+
	luxx9ozsrI4cd7aK9gcRrVF57mBdLLpKhDtw68TPBOIqnYuzh+a1FTTpIoslcVjVltmgqU0rTlB
	v63NzTRyIjZIH2RxTNXbyWhPac5MZu5U2twDRUWcBYm/tm3YXECvrqyM4ATQzRC58U9zroMV0WK
	j4v5/gpLiZGg
X-Google-Smtp-Source: AGHT+IHU22vWmhYPWXzA8wV8u+Q5pXGUhx2cVpPpsGxT71RZuSn2ZniGRfRn6Mgek50SOahWzRZNQg==
X-Received: by 2002:a17:902:ccc5:b0:215:9d48:46f9 with SMTP id d9443c01a7336-2159d484a42mr49489075ad.21.1733150975134;
        Mon, 02 Dec 2024 06:49:35 -0800 (PST)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f627sm8841987b3a.64.2024.12.02.06.49.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:49:33 -0800 (PST)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e9ff7a778cso3908206a91.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:49:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDJzLUT2wDCL0ltmPV5pVF1s2xW8QjjpTXrRlhez3L8JYrDvtnHRHjlt/ABkKWBguOkiBnqJ/6K6+rPA==@vger.kernel.org
X-Received: by 2002:a17:90a:b115:b0:2ee:843c:3170 with SMTP id
 98e67ed59e1d1-2ee843c36e7mr13753754a91.3.1733150972698; Mon, 02 Dec 2024
 06:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-2-6658c1fe312b@chromium.org> <79da5e62-acb0-4bf5-a1c0-f2000fae0167@redhat.com>
In-Reply-To: <79da5e62-acb0-4bf5-a1c0-f2000fae0167@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 2 Dec 2024 15:49:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCu3BjC1JsnmgX5eEapBpzHw+HZUw58iiyVfe4KqEDCWVA@mail.gmail.com>
Message-ID: <CANiDSCu3BjC1JsnmgX5eEapBpzHw+HZUw58iiyVfe4KqEDCWVA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: uvcvideo: Remove dangling pointers
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans


On Mon, 2 Dec 2024 at 15:44, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
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
>
> Maybe simplify this to:

I do not think that we can do that simplification.

If we do that, the original file handle `pending_async_ctrls` value
will be out of sync.

Let me know if you do not agree to delete your reviewed-by


Thanks!
>
> static void uvc_ctrl_get_handle(struct uvc_fh *handle, struct uvc_control *ctrl)
> {
>         lockdep_assert_held(&handle->chain->ctrl_mutex);
>
>         if (!ctrl->handle)
>                 handle->pending_async_ctrls++;
>         else
>                 dev_warn_ratelimited(&handle->stream->dev->udev->dev,
>                                      "UVC non compliance: Setting an async control with a pending operation.");
>
>         ctrl->handle = handle;
> }
>
> ?
>
> Otherwise the patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>



>
> Regards,
>
> Hans
>
>
>
>
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
> > +             for (unsigned int i = 0; i < entity->ncontrols; ++i)
> > +                     uvc_ctrl_put_handle(handle, &entity->controls[i]);
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


-- 
Ricardo Ribalda

