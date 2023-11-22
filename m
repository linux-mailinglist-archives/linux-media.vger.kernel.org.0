Return-Path: <linux-media+bounces-718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 567DC7F3EEB
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 08:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A4B281DF8
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28611F611;
	Wed, 22 Nov 2023 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J4DQUqkm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4295F10C
	for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:35:41 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5cc66213a34so3616007b3.1
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700638540; x=1701243340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lUZAaiUOw0C5H3gndMumbia7PfIimHYq+ovFLumPTQE=;
        b=J4DQUqkmvE2pyXpQGK8Ogfc8mgDa3bLToXGsYi9Q8bX9+kUuYIGwdb7jMywLduwhe7
         El87pya8Wh8jcLvJpzyu+BDW5tbxmPjjyetQc6a4TPcJvdwwYs5trtRPesg0Z+jrR3pA
         k3fHKtI7bzj77NxUvJQCUdwSQuCGP/EY7MB8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700638540; x=1701243340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lUZAaiUOw0C5H3gndMumbia7PfIimHYq+ovFLumPTQE=;
        b=ehc8u5M2TW2wN3ddW7beZFxvwh2czCoatVzdOxYkN9i70zTiDH42q/oFigRMeTxr2P
         RbjzyIWYaelMc4eDbYSHQX7GLWL8PfkvHJSAwKnmWwu1+VgN0YI8YqNLaD+Fvqmk24Ou
         3SxBiLjg3RA9PxTrmi8s2bhP0wL5Vp+k93T0YFqYc2c0RaT59iOc8WMwEEZ5Tau7ewGD
         yE+dk1ri+4cvmuhdplcp/NCNJJKWUsQBIDEiOGXY7jeWamHZmzSscf11ZIIWR2Y4HqU9
         7xRF2LOPTWAB28HZQ+XsaUEwj5REzBeZ/aUPYiK300YuP23iB65Qr3IGC0ND+bgX/80J
         iaqg==
X-Gm-Message-State: AOJu0YyoG9HfyP8X/YtGQIilIm8hs/gXtbjyY8BHHbMiIUhquO6wFvSQ
	wy9sLEoi173UgMitJlwG6IjWHcKidFYQHa+UJO1UfQ==
X-Google-Smtp-Source: AGHT+IEq94znKSLlM1RSaNJxLcAOtT4E0zGEpySpPNwJvoVtUzbo14DhTg7dSiuO447vbHads1EQOw==
X-Received: by 2002:a81:8484:0:b0:5ca:e2d4:623a with SMTP id u126-20020a818484000000b005cae2d4623amr1574223ywf.12.1700638540238;
        Tue, 21 Nov 2023 23:35:40 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id n71-20020a0dcb4a000000b005cb5ab4093esm389485ywd.38.2023.11.21.23.35.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 23:35:39 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5cc66213a34so3615817b3.1
        for <linux-media@vger.kernel.org>; Tue, 21 Nov 2023 23:35:38 -0800 (PST)
X-Received: by 2002:a81:65d4:0:b0:59a:d42c:5d50 with SMTP id
 z203-20020a8165d4000000b0059ad42c5d50mr1265775ywb.52.1700638538563; Tue, 21
 Nov 2023 23:35:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org> <20231122072108.GA1465745@google.com>
In-Reply-To: <20231122072108.GA1465745@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 08:35:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCunwy4wYL3-J5KNp4cG4mGsq8FtoyJ6hOr3VK+9+L2LgA@mail.gmail.com>
Message-ID: <CANiDSCunwy4wYL3-J5KNp4cG4mGsq8FtoyJ6hOr3VK+9+L2LgA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: uvcvideo: Always use uvc_status_stop()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sergey

On Wed, 22 Nov 2023 at 08:21, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (23/11/21 19:53), Ricardo Ribalda wrote:
> > uvc_status_stop() handles properly the race conditions with the
> > asynchronous worker.
> > Let's use uvc_status_stop() for all the code paths that require stopping
> > it.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 4 ----
> >  drivers/media/usb/uvc/uvc_status.c | 2 +-
> >  2 files changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index e59a463c2761..8e22a07e3e7b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2765,10 +2765,6 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
> >       struct uvc_entity *entity;
> >       unsigned int i;
> >
> > -     /* Can be uninitialized if we are aborting on probe error. */
> > -     if (dev->async_ctrl.work.func)
> > -             cancel_work_sync(&dev->async_ctrl.work);
> > -
> >       /* Free controls and control mappings for all entities. */
> >       list_for_each_entry(entity, &dev->entities, list) {
> >               for (i = 0; i < entity->ncontrols; ++i) {
> > diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> > index a78a88c710e2..0208612a9f12 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -292,7 +292,7 @@ int uvc_status_init(struct uvc_device *dev)
> >
> >  void uvc_status_unregister(struct uvc_device *dev)
> >  {
> > -     usb_kill_urb(dev->int_urb);
> > +     uvc_status_stop(dev);
>
> Sort of feels like this needs dev->lock somewhere here. Should we move 3/3
> to the head of the series?
>
> The question is, can this be called in parallel with uvc_v4l2_release(),
> for instance?

I can be called in parallel with uvc_v4l2_release(), but
uvc_status_stop() is thread-safe and does not take any locks after:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=619d9b710cf06f7a00a17120ca92333684ac45a8

So this "should" be good. key-word here is should :P


>
> >       uvc_input_unregister(dev);
> >  }



-- 
Ricardo Ribalda

