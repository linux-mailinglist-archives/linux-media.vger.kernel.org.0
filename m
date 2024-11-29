Return-Path: <linux-media+bounces-22281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F5B9DBE38
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 01:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31409165006
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 00:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996479461;
	Fri, 29 Nov 2024 00:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kAB+pMgl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D51361
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 00:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732839705; cv=none; b=WooXocFGK340IEsKzMUiZ06lMGmClxc1PagxldK/sxBh4RAnqPWoedO/2wi/qbXf7BbqxhWK4TNgMtYcPJt4a4S2Yq3VIdTPNeUYMhGqtZwADv1Pz/dJEJ2WzWfGTLJPTo9hW9f8NFQM87VzETyv0Ihpf+N32h627Irka1P3FRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732839705; c=relaxed/simple;
	bh=0oqamsEkXX4bYHIVWICaGV7yM8vIVxO5+Ns44FFffEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpI8Ua+0+1+cAb27IQmwraXsLD/lZ4iECASu3E0MGhyYZhynS0nVV1Mfg+RoDXix0TTAXYSDH8L5HzaWv8mR7bx+LbLm/D6rxE90+7aAxlk9kPmM6hwoOepMEEnpkDsJGnK4BuDFZVdC4aqWTW7FAxLw54kVet3MemEdVql0Opk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kAB+pMgl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21288ce11d7so10932495ad.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732839702; x=1733444502; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e63Qh8yDCGpehSbTHGGffUHGEEyMaGUtLTTzMlKXbLM=;
        b=kAB+pMglOt8AGADoB7L0gV6Cv2hYwsIeVNz2uLqy32wkDfbQhQO40CkGEIs6r/8pYs
         9VSHKWPDfq6wRWm7u34gZVR/CkyqXTFNnbipc2BS7iI1E8hnFbEK1Y0uMZ5y/n6YuAkp
         01+zhvugu3QJbh3133wgTFzmaNJvrtZWD3yDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732839702; x=1733444502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e63Qh8yDCGpehSbTHGGffUHGEEyMaGUtLTTzMlKXbLM=;
        b=P/L0PaqZUpIiGk6mjOiF4H6n28u2+lknAMUKt1RC6SW6IGR6E7hIl2yohT9FzhFMYJ
         mGl2jFt/dnyMMdpFmVSQ1X1p97bf17HLsUM58skOujEjLn78hvYUBCFRWSZcAxZ0NovT
         xDSwzrnQIgkrkZwHspogYR4KvDN6Kh6ovEWU7/lIpF3OaVwAWNI/R4AgYLnYaj+QbqWq
         peQpJZUlLSX5TydCNZ1CtWa0jIw7ARk4UalJoBtPzTCn8Ca9D2jmtjbw081DuRzpQGYb
         gdPE0xJEKTmBhejcwQ4nJayfLsEEwupUwK4mClzygXf0ThFrAp5fZ3tiE4uLVv0CqAY9
         LRfg==
X-Forwarded-Encrypted: i=1; AJvYcCX4jrONWSB8q7Xy4Fg/ax6lzcSiAqxSB/C+NRCehSmbP0p8NmIh92gtSuin6VP2HbHPWHYxdFJ08Ko1gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRbAqj4XRHow7OSo8Qi/qxjYb4dVXFE8otCBlo33cf2+ItKhi
	Ea449I4NgDJ9TMg+OUndroW7sTqNMJW8OpoeqYyXlivVyiagEOR/BwmiPs9Yg+XCJIBQyGsfVVA
	=
X-Gm-Gg: ASbGncvYiVdrWuCd6GbeYyOziN6NKqQ5FO+XvXBht3jj4QsnqxTKFj1DYcfsdm9YPcr
	r6AEkV8OsOwHNphGrw6u4TkQ64hLoNpsxFmNBqRDXpq4l5d+2lMcnEZ9M0MhHDZeu4D1129WWOW
	Qv40OJuaRaWjIZsxoErt9CJuecZpQOOa0F4VUhxQabJ3+Ys8S26Hh9kLVU+dT6D6afINWb4dUFy
	HGC+4zW0vY2UsIu/FYzP7F5sHwhdhN3bfm0z7+om5UitlUlonG4wLICwk59zw8dcg48Ev4spMLc
	Cg/JJrrTfi4y
X-Google-Smtp-Source: AGHT+IH3XIpM8250bpcBB5dwiOVkqTNryteBi5vAk2X+HnNXvfJ2rJ9BSF5XEt0yYlsNm4HMpR77dA==
X-Received: by 2002:a17:903:2342:b0:210:c5ab:2420 with SMTP id d9443c01a7336-2150109650fmr115958315ad.5.1732839702066;
        Thu, 28 Nov 2024 16:21:42 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521989ee4sm19498965ad.183.2024.11.28.16.21.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 16:21:41 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee4f78493aso222069a91.3
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 16:21:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMpvGQjqv01Yn4VQ8tOZY4ydjU2/WAIjpiFFzOfrJM6Rre+JrJsIzuCQPuEtQnhsv3E+uQewntgKWlCQ==@vger.kernel.org
X-Received: by 2002:a17:90b:548f:b0:2ea:2a8d:dd2a with SMTP id
 98e67ed59e1d1-2ee095bff07mr10855096a91.27.1732839700516; Thu, 28 Nov 2024
 16:21:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-1-510aab9570dd@chromium.org> <20241128221649.GE25731@pendragon.ideasonboard.com>
 <CANiDSCuEPPoLjukjoO_BVVsRL22kebUnCxo3eTKJqMRg6J0fSw@mail.gmail.com> <20241128222807.GG25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128222807.GG25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 01:21:28 +0100
X-Gmail-Original-Message-ID: <CANiDSCt2SyDn48OsdNVV4aieWvpDBzEiAxboONprOuqkbBYf+Q@mail.gmail.com>
Message-ID: <CANiDSCt2SyDn48OsdNVV4aieWvpDBzEiAxboONprOuqkbBYf+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: uvcvideo: Remove dangling pointers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 23:28, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Nov 28, 2024 at 11:25:25PM +0100, Ricardo Ribalda wrote:
> > On Thu, 28 Nov 2024 at 23:17, Laurent Pinchart wrote:
> > > On Wed, Nov 27, 2024 at 12:14:49PM +0000, Ricardo Ribalda wrote:
> > > > When an async control is written, we copy a pointer to the file handle
> > > > that started the operation. That pointer will be used when the device is
> > > > done. Which could be anytime in the future.
> > > >
> > > > If the user closes that file descriptor, its structure will be freed,
> > > > and there will be one dangling pointer per pending async control, that
> > > > the driver will try to use.
> > > >
> > > > Clean all the dangling pointers during release().
> > > >
> > > > To avoid adding a performance penalty in the most common case (no async
> > > > operation). A counter has been introduced with some logic to make sure
> > >
> > > s/). A/), a/
> > >
> > > > that it is properly handled.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 38 ++++++++++++++++++++++++++++++++++++--
> > > >  drivers/media/usb/uvc/uvc_v4l2.c |  2 ++
> > > >  drivers/media/usb/uvc/uvcvideo.h |  8 +++++++-
> > > >  3 files changed, 45 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 4fe26e82e3d1..b6af4ff92cbd 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -1589,7 +1589,12 @@ void uvc_ctrl_status_event(struct uvc_video_chain *chain,
> > >
> > > How about adding
> >
> > SGTM.
> >
> > >
> > > static void uvc_ctrl_set_handle(struct uvc_control *ctrl, uvc_fh *handle)
> > > {
> > >         if (handle) {
> > >                 if (!ctrl->handle)
> > >                         handle->pending_async_ctrls++;
> > >                 ctrl->handle = handle;
> > >         } else if (ctrl->handle) {
> > >                 ctrl->handle = NULL;
> > >                 if (!WARN_ON(!handle->pending_async_ctrls))
> >
> > Unless you think otherwise. I will make this:
> >
> > WARN_ON(!handle->pending_async_ctrls);
> > if (handle->pending_async_ctrls)
> >    handle->pending_async_ctrls--;
>
> I'm fine with that, I went back and forth between the two.
>
> > The double negation is difficult to read. I am pretty sure the
> > compiler will do its magic and merge the two checks.
> >
> > >                         handle->pending_async_ctrls--;
> > >         }
> > > }

Now that I think about it. Now that we have inverted the patches 1 and
2 we need to add the following change to your function:

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d8d4bd2254ec..5ce9be812559 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1584,8 +1584,14 @@ static void uvc_ctrl_set_handle(struct
uvc_control *ctrl, struct uvc_fh *handle)
        /* chain->ctrl_mutex must be held. */

        if (handle) {
-               if (!ctrl->handle)
-                       handle->pending_async_ctrls++;
+               if (ctrl->handle) {
+                       if (ctrl->handle == handle)
+                               return;
+                       WARN_ON(!ctrl->handle->pending_async_ctrls);
+                       if (ctrl->handle->pending_async_ctrls)
+                               ctrl->handle->pending_async_ctrls--;
+               }
+               handle->pending_async_ctrls++;
                ctrl->handle = handle;
        } else if (ctrl->handle) {
                ctrl->handle = NULL;

Otherwise, if the control is handled by another fh,
pending_async_ctrls will be unbalanced.

> > >
> > > >       mutex_lock(&chain->ctrl_mutex);
> > > >
> > > >       handle = ctrl->handle;
> > > > -     ctrl->handle = NULL;
> > > > +     if (handle) {
> > > > +             ctrl->handle = NULL;
> > > > +             WARN_ON(!handle->pending_async_ctrls);
> > > > +             if (handle->pending_async_ctrls)
> > > > +                     handle->pending_async_ctrls--;
> > > > +     }
> > >
> > > This would become
> > >
> > >         handle = ctrl->handle;
> > >         uvc_ctrl_set_handle(ctrl, NULL);
> > >
> > > >
> > > >       list_for_each_entry(mapping, &ctrl->info.mappings, list) {
> > > >               s32 value = __uvc_ctrl_get_value(mapping, data);
> > > > @@ -2046,8 +2051,11 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> > > >       mapping->set(mapping, value,
> > > >               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> > > >
> > > > -     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > > > +     if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > > > +             if (!ctrl->handle)
> > > > +                     handle->pending_async_ctrls++;
> > > >               ctrl->handle = handle;
> > > > +     }
> > >
> > > Here
> > >
> > >         if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > >                 uvc_ctrl_set_handle(ctrl, handle);
> > >
> > > >
> > > >       ctrl->dirty = 1;
> > > >       ctrl->modified = 1;
> > > > @@ -2770,6 +2778,32 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> > > >       return 0;
> > > >  }
> > > >
> > > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> > > > +{
> > > > +     struct uvc_entity *entity;
> > > > +
> > > > +     guard(mutex)(&handle->chain->ctrl_mutex);
> > > > +
> > > > +     if (!handle->pending_async_ctrls)
> > > > +             return;
> > > > +
> > > > +     list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > > > +             for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > > > +                     struct uvc_control *ctrl = &entity->controls[i];
> > > > +
> > > > +                     if (ctrl->handle != handle)
> > > > +                             continue;
> > > > +
> > > > +                     ctrl->handle = NULL;
> > > > +                     if (WARN_ON(!handle->pending_async_ctrls))
> > > > +                             continue;
> > > > +                     handle->pending_async_ctrls--;
> > >
> > > And here
> > >
> > >                         uvc_ctrl_set_handle(ctrl, NULL);
> > >
> > > It seems less error-prone to centralize the logic. I'd add a
> > > lockdep_assert() in uvc_ctrl_set_handle(), but there's no easy access to
> > > the chain there.
> > >
> > > > +             }
> > > > +     }
> > > > +
> > > > +     WARN_ON(handle->pending_async_ctrls);
> > > > +}
> > > > +
> > > >  /*
> > > >   * Cleanup device controls.
> > > >   */
> > > > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > index 97c5407f6603..b425306a3b8c 100644
> > > > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > > > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > > > @@ -652,6 +652,8 @@ static int uvc_v4l2_release(struct file *file)
> > > >
> > > >       uvc_dbg(stream->dev, CALLS, "%s\n", __func__);
> > > >
> > > > +     uvc_ctrl_cleanup_fh(handle);
> > > > +
> > > >       /* Only free resources if this is a privileged handle. */
> > > >       if (uvc_has_privileges(handle))
> > > >               uvc_queue_release(&stream->queue);
> > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > > index 07f9921d83f2..c68659b70221 100644
> > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > @@ -337,7 +337,10 @@ struct uvc_video_chain {
> > > >       struct uvc_entity *processing;          /* Processing unit */
> > > >       struct uvc_entity *selector;            /* Selector unit */
> > > >
> > > > -     struct mutex ctrl_mutex;                /* Protects ctrl.info */
> > > > +     struct mutex ctrl_mutex;                /*
> > > > +                                              * Protects ctrl.info and
> > > > +                                              * uvc_fh.pending_async_ctrls
> > > > +                                              */
> > > >
> > > >       struct v4l2_prio_state prio;            /* V4L2 priority state */
> > > >       u32 caps;                               /* V4L2 chain-wide caps */
> > > > @@ -612,6 +615,7 @@ struct uvc_fh {
> > > >       struct uvc_video_chain *chain;
> > > >       struct uvc_streaming *stream;
> > > >       enum uvc_handle_state state;
> > > > +     unsigned int pending_async_ctrls;
> > > >  };
> > > >
> > > >  struct uvc_driver {
> > > > @@ -797,6 +801,8 @@ int uvc_ctrl_is_accessible(struct uvc_video_chain *chain, u32 v4l2_id,
> > > >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> > > >                     struct uvc_xu_control_query *xqry);
> > > >
> > > > +void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > > > +
> > > >  /* Utility functions */
> > > >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > > >                                           u8 epaddr);
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

