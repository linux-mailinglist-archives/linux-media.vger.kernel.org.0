Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84A7F143C69
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 13:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAUL77 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 06:59:59 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39732 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgAUL77 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 06:59:59 -0500
Received: by mail-ed1-f66.google.com with SMTP id t17so2694772eds.6;
        Tue, 21 Jan 2020 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jSiX5zz2vTnaHZTIQllFhI97EGPFguXdFsKsb3rblZU=;
        b=YQF+nryIbreDYQKsT+Vq6cVYKB1amnD6IVTr+9uTtsF+yqoC3cfr4Z9t6vm3CGzgg1
         Rod6OvZ4ZO7hP1kac7Su+H8AmWibUMZ5SAJPijfaKgw9US5cVTDn7KWlyJxEJ5nEsosR
         yKkDmcMrUUSvJC97OpqSQ8ZvWxTAJtgb/htEkobsRFkYu/lcqPWl5jHhfbFLYW8G103L
         cu2owgWO9EynKOvZQmbtA4NkcUpC+THGqQiH9Un8VhxbiEpHqFALTYbSOhj7OjsMf11J
         fxPkAO79PugLl4Xfzk3WCljXb1zt8YjZBfSmX32gMYYzusJjJPfXFO0UvUMfiyTahVzD
         6XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jSiX5zz2vTnaHZTIQllFhI97EGPFguXdFsKsb3rblZU=;
        b=A8Y1NpSLoaegheqNS2UWxgyVWGs6MSAI4RlMsK/Bml9qFaAmBJnURXXbGQkrj/nKzX
         REoyg6PB+bNdkhzUtL3dX8EiaqJTJ+ybBjAbQZpp65t2oU/thZghcpES4NDDmhhn2R/Y
         XJLaA6WJfxQ/qxhvZ01ovuc9vy9JxgOrPYFyr/M7wpMlKaIIPxsSw2179Pvo3r3pQ3Nn
         fMuxis+0i0B7Nt3Hnko9xseg8OTEc728zS21YccZPcc9t6AwPFPIIR4cUwavNtErjFSr
         h6KVY4mabDPMrYILBr06DTSp5XGiUCeA0RhBETcP7KrP6VBxdMa3CI9yoQh1mF+xtamr
         iwvQ==
X-Gm-Message-State: APjAAAVPXz1gq6BpUP7RnomuCTmuHRoIUQ2H3Lhb5l/YR7+DwrNkZBWo
        kmYIbGkJBF/pCo/IHnwCPTEibBW9rsDI2KdozAo=
X-Google-Smtp-Source: APXvYqxcFMRXWdad6Y1h3Chdzl/WPDJb1l2gynDLkt+Yf+IZ7vOD0hP5KCX5RWVNMnIGdpPCR6KEIodoncuVQA3mijI=
X-Received: by 2002:aa7:ce13:: with SMTP id d19mr3426381edv.296.1579607997278;
 Tue, 21 Jan 2020 03:59:57 -0800 (PST)
MIME-Version: 1.0
References: <20200113055951.8718-1-hslester96@gmail.com> <20200121092350.466f62a8@litschi.hi.pengutronix.de>
In-Reply-To: <20200121092350.466f62a8@litschi.hi.pengutronix.de>
From:   Chuhong Yuan <hslester96@gmail.com>
Date:   Tue, 21 Jan 2020 19:59:46 +0800
Message-ID: <CANhBUQ25dp5kt3EGijLUC1LEjQon5wS8MHJqEiBNcAXSLdvjQw@mail.gmail.com>
Subject: Re: [PATCH v3] media: allegro: add missed checks in allegro_open()
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        LKML <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 21, 2020 at 4:23 PM Michael Tretter
<m.tretter@pengutronix.de> wrote:
>
> On Mon, 13 Jan 2020 13:59:51 +0800, Chuhong Yuan wrote:
> > allegro_open() misses checks for v4l2_m2m_ctx_init() and results of
> > v4l2_ctrl_new* calls.
> > Add checks and error handlers to fix the problems.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> > ---
> > Changes in v3:
> >   - Make code cleaner.
> >   - Add a check for handler->error.
> >
> >  .../staging/media/allegro-dvt/allegro-core.c  | 24 +++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/media/allegro-dvt/allegro-core.c b/drivers/staging/media/allegro-dvt/allegro-core.c
> > index 6f0cd0784786..e86001e42963 100644
> > --- a/drivers/staging/media/allegro-dvt/allegro-core.c
> > +++ b/drivers/staging/media/allegro-dvt/allegro-core.c
> > @@ -2270,15 +2270,12 @@ static int allegro_open(struct file *file)
> >       struct allegro_channel *channel = NULL;
> >       struct v4l2_ctrl_handler *handler;
> >       u64 mask;
> > +     int ret;
> >
> >       channel = kzalloc(sizeof(*channel), GFP_KERNEL);
> >       if (!channel)
> >               return -ENOMEM;
> >
> > -     v4l2_fh_init(&channel->fh, vdev);
> > -     file->private_data = &channel->fh;
> > -     v4l2_fh_add(&channel->fh);
> > -
> >       init_completion(&channel->completion);
> >
> >       channel->dev = dev;
> > @@ -2328,6 +2325,11 @@ static int allegro_open(struct file *file)
> >                       V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
> >                       1, 32,
> >                       1, 1);
> > +     if (handler->error != 0) {
> > +             ret = handler->error;
> > +             goto error;
> > +     }
> > +
> >       channel->fh.ctrl_handler = handler;
> >
> >       channel->mcu_channel_id = -1;
> > @@ -2341,7 +2343,21 @@ static int allegro_open(struct file *file)
> >       channel->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, channel,
> >                                               allegro_queue_init);
> >
> > +     if (IS_ERR(channel->fh.m2m_ctx)) {
> > +             ret = PTR_ERR(channel->fh.m2m_ctx);
> > +             goto error;
> > +     }
> > +
> > +     v4l2_fh_init(&channel->fh, vdev);
>
> This call sets channel->fh.ctrl_handler to vdev->ctrl_handler, which
> has previously been overriden by the driver to handler. Therefore, this
> patch breaks all controls. I think we should initialize channel->fh
> before setting any fields of this struct.
>

I'm not very clear about this issue.
In my second version, Hans replied that init could be moved before return 0.
I have sent this mail to him.

> Michael
>
> > +     file->private_data = &channel->fh;
> > +     v4l2_fh_add(&channel->fh);
> > +
> >       return 0;
> > +
> > +error:
> > +     v4l2_ctrl_handler_free(handler);
> > +     kfree(channel);
> > +     return ret;
> >  }
> >
> >  static int allegro_release(struct file *file)
