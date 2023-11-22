Return-Path: <linux-media+bounces-768-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA8D7F42E6
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 10:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE4C11F21D58
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D287E5914B;
	Wed, 22 Nov 2023 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CrQm3wm1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AC01A2
	for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:54:07 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-41cc75c55f0so5345291cf.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700646846; x=1701251646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gqpYEFiVYvZlFazdN/UQMK6Ht63BG7ibp8wzUAhE94Q=;
        b=CrQm3wm1OwJfjag1w8DQg4Dk+3Jj85l4erIOutyZp7vjr0djhCg2kNQvMHSbCE+36C
         UrvKBgBff0Bq84m2ddnKNI1Izy2HpkbwpCUeL6DV9Lu/ycc01gP3UR8HbYtXLMQK6rm+
         7sl/tuyzP/Ed2Abd89lh8MOBRn1e8PdIE5XUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646846; x=1701251646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqpYEFiVYvZlFazdN/UQMK6Ht63BG7ibp8wzUAhE94Q=;
        b=YmgzGwA3KFA7MD01qy1Oeol0Lw4fXpRICahV9L+n+glYArEUi0IVQv5ZLACsI2JaF+
         Pcb6rMpIS+r94oso5PtiGLcZrBxkyr2f3GtKuWbLTrhIoxu/mzkR8yCKJGEk4PiJxR4b
         RiCKUrctHyHjwY63R19/xmz0xKcuS+Zceb6lvQ8NvmDvjgnzWH2K2vrO0gl1qpS9OCFy
         Mt9upgZF0mLw2D7pdgDVeDe22sN2B1sHZELTVdls8Nq9jBepuOVIs/YA6EyD4Wt2B0Kx
         tiPBg+eEjcNbmLin78zv6lA3gS603Czl2DSCaSstCLv8jKfYRBRdlKLOr4+KCZQ8bSYc
         i3DQ==
X-Gm-Message-State: AOJu0YyxfrJyOzVKOWcugvJ2zRax3UzJe40LxT0yiizq3AVEKnrp4scv
	DsWgCngE4P7wiK8vtzO42F42EPfKaJTpOUBxa/aXuA==
X-Google-Smtp-Source: AGHT+IHCNrrWx92FMem7IGALOwA4e406p8Cl3SmILP8+MnTfvJ5kv7+WFRvXNjGWQP98N/64A1Tocw==
X-Received: by 2002:ac8:5e50:0:b0:423:6f55:3bbe with SMTP id i16-20020ac85e50000000b004236f553bbemr2556299qtx.32.1700646846212;
        Wed, 22 Nov 2023 01:54:06 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id x12-20020ac84a0c000000b004181a8a3e2dsm4300313qtq.41.2023.11.22.01.54.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 01:54:05 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-677fba00a49so5518646d6.1
        for <linux-media@vger.kernel.org>; Wed, 22 Nov 2023 01:54:05 -0800 (PST)
X-Received: by 2002:a05:6214:1782:b0:66f:ac87:73b7 with SMTP id
 ct2-20020a056214178200b0066fac8773b7mr8770176qvb.15.1700646844595; Wed, 22
 Nov 2023 01:54:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121-guenter-mini-v3-0-d8a5eae2312b@chromium.org>
 <20231121-guenter-mini-v3-1-d8a5eae2312b@chromium.org> <20231122072108.GA1465745@google.com>
 <CANiDSCunwy4wYL3-J5KNp4cG4mGsq8FtoyJ6hOr3VK+9+L2LgA@mail.gmail.com>
In-Reply-To: <CANiDSCunwy4wYL3-J5KNp4cG4mGsq8FtoyJ6hOr3VK+9+L2LgA@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Nov 2023 10:53:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCs9BZWOjDM6fxz-ipXqDAm9==aRw9giKRnk1XXyc1J35A@mail.gmail.com>
Message-ID: <CANiDSCs9BZWOjDM6fxz-ipXqDAm9==aRw9giKRnk1XXyc1J35A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] media: uvcvideo: Always use uvc_status_stop()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Paul <seanpaul@chromium.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sergey

On Wed, 22 Nov 2023 at 08:35, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Sergey
>
> On Wed, 22 Nov 2023 at 08:21, Sergey Senozhatsky
> <senozhatsky@chromium.org> wrote:
> >
> > On (23/11/21 19:53), Ricardo Ribalda wrote:
> > > uvc_status_stop() handles properly the race conditions with the
> > > asynchronous worker.
> > > Let's use uvc_status_stop() for all the code paths that require stopping
> > > it.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c   | 4 ----
> > >  drivers/media/usb/uvc/uvc_status.c | 2 +-
> > >  2 files changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index e59a463c2761..8e22a07e3e7b 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -2765,10 +2765,6 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
> > >       struct uvc_entity *entity;
> > >       unsigned int i;
> > >
> > > -     /* Can be uninitialized if we are aborting on probe error. */
> > > -     if (dev->async_ctrl.work.func)
> > > -             cancel_work_sync(&dev->async_ctrl.work);
> > > -
> > >       /* Free controls and control mappings for all entities. */
> > >       list_for_each_entry(entity, &dev->entities, list) {
> > >               for (i = 0; i < entity->ncontrols; ++i) {
> > > diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> > > index a78a88c710e2..0208612a9f12 100644
> > > --- a/drivers/media/usb/uvc/uvc_status.c
> > > +++ b/drivers/media/usb/uvc/uvc_status.c
> > > @@ -292,7 +292,7 @@ int uvc_status_init(struct uvc_device *dev)
> > >
> > >  void uvc_status_unregister(struct uvc_device *dev)
> > >  {
> > > -     usb_kill_urb(dev->int_urb);
> > > +     uvc_status_stop(dev);
> >
> > Sort of feels like this needs dev->lock somewhere here. Should we move 3/3
> > to the head of the series?
> >
> > The question is, can this be called in parallel with uvc_v4l2_release(),
> > for instance?
>
> I can be called in parallel with uvc_v4l2_release(), but
> uvc_status_stop() is thread-safe and does not take any locks after:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=619d9b710cf06f7a00a17120ca92333684ac45a8
>
> So this "should" be good. key-word here is should :P

To be on the safe side I am not going to run the async work on the
release path. will send a new revision

>
>
> >
> > >       uvc_input_unregister(dev);
> > >  }
>
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

