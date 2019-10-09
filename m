Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DD0D0660
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 06:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfJIETF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 00:19:05 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34503 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbfJIETF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 00:19:05 -0400
Received: by mail-ed1-f65.google.com with SMTP id p10so757836edq.1
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeNM3zjEIiaayCi2HBeZAJ08J5xZy7j5lb8ADAS/0Kg=;
        b=D44aT+iVuM7FFPNgwJOiMi82sPscJIKOem7KOW574s1qnhFZ1uFtNkSRHCiHBAkpwd
         BzK6bLk4VxGOW/W3u8AI0A9FCE9jL5nNmfoZ7sDqwtUUhTooqbwAgLSOtbRvz35DzJ10
         NGwCifHAi18fffE36DwH2TH8qF31HDlGmwkC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeNM3zjEIiaayCi2HBeZAJ08J5xZy7j5lb8ADAS/0Kg=;
        b=WrV5ORIT3uMDHNc9EuVXHOiELRtKBnH0+c9LGL70I6PDCRYso2nSVJ+RulHXc3J7rQ
         89jO1S4PJxD58jtesrs4kdkRx3Qxr0soCLz0PtnImwFnbxJsjJU6ak0ztM4cGEm/uBi/
         S8NHWHo1FmLX7mj6rOel3avT0WmvrGTERHQQpR6pcCWnUxmdVT8qBmpcgZmvZrCFKioF
         T8RRwxdKLrx+tUB6C2jWY/+6NPhJ56nz2q2zaWio7QFV7BEaXQnq5AfjSDDFDeFVZwZw
         yRjjklsqusD/vJhH0mJZA3VX0GMrPQBukVUvXyqORdUbQPv8TvEy4gGEzdjBCkHkDjK2
         dcCA==
X-Gm-Message-State: APjAAAX/8JDqHNkj7v1GUN08t3Q5djo8ccRd2ssfNMaNIwtzxE1ZPV9y
        942qf1ys7+2894gXnFxhrP5Lu2PHyCTtcQ==
X-Google-Smtp-Source: APXvYqxduBhVcTBxBzu1wL7JNFz/DEdXGp4fMjwUl9yZexuDgXL+Q8btxWFquLlam63tHX0Ds3UJOQ==
X-Received: by 2002:a05:6402:19b4:: with SMTP id o20mr1200023edz.10.1570594741990;
        Tue, 08 Oct 2019 21:19:01 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id t30sm162516edt.91.2019.10.08.21.19.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 21:19:01 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id i16so704362wmd.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 21:19:01 -0700 (PDT)
X-Received: by 2002:a1c:e404:: with SMTP id b4mr948434wmh.90.1570594740815;
 Tue, 08 Oct 2019 21:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20191008123850.641-1-p.zabel@pengutronix.de> <CAHD77HmL-m9TgZJ7GO=E_gBW=Av9D68AY1FTuxBM2sUSQgNPSQ@mail.gmail.com>
 <1570545836.18914.10.camel@pengutronix.de>
In-Reply-To: <1570545836.18914.10.camel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 9 Oct 2019 13:18:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DfcEg7Vnvxpb0uwUqRC=jp_ZizefDxZ5XL=zM0Bg_XsA@mail.gmail.com>
Message-ID: <CAAFQd5DfcEg7Vnvxpb0uwUqRC=jp_ZizefDxZ5XL=zM0Bg_XsA@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: relax s_fmt(out) busy error
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sasha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Oct 8, 2019 at 11:44 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Tomasz,
>
> On Tue, 2019-10-08 at 23:05 +0900, Tomasz Figa wrote:
> > Hi Philipp,
> >
> > On Tue, Oct 8, 2019 at 9:38 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > >
> > > Setting the output format resets the capture queue, so we return -EBUSY
> > > while the capture queue has buffers allocated. If capture dimensions
> > > and pixel format don't change though, we can allow setting the output
> > > format without reallocating the capture queue.
> > >
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > > This applies on top of https://patchwork.linuxtv.org/patch/59337/
> > > ("media: hantro: Fix s_fmt for dynamic resolution changes").
> > > ---
> > >  drivers/staging/media/hantro/hantro_v4l2.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > > index 586d243cc3cc..05c3edce27a9 100644
> > > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > > @@ -368,7 +368,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> > >         struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
> > >         struct hantro_ctx *ctx = fh_to_ctx(priv);
> > >         struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> > > -       const struct hantro_fmt *formats;
> > > +       const struct hantro_fmt *raw_vpu_fmt, *formats;
> > >         unsigned int num_fmts;
> > >         int ret;
> > >
> > > @@ -394,8 +394,16 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
> > >                  */
> > >                 peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> > >                                           V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> > > -               if (vb2_is_busy(peer_vq))
> > > -                       return -EBUSY;
> > > +               if (vb2_is_busy(peer_vq)) {
> > > +                       formats = hantro_get_formats(ctx, &num_fmts);
> > > +                       raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts,
> > > +                                                            false);
> > > +
> > > +                       if (ctx->dst_fmt.width != pix_mp->width ||
> > > +                           ctx->dst_fmt.height != pix_mp->height ||
> > > +                           ctx->dst_fmt.pixelformat != raw_vpu_fmt->fourcc)
> >
> > First of all, thanks for the patch! I'd like to ask you to clarify a few things:
> > 1) What's the use case for S_FMT(OUTPUT) without changing neither
> > resolution nor pixelformat?
>
> Userspace that currently does not follow the stateless codec spec
> correctly, and allocates capture buffers before setting the output
> format because libva:
>
> https://github.com/bootlin/libva-v4l2-request/pull/26
>
> It would be better to lazily allocate the capture buffers when the
> context is spun up there, it just seemed strange that S_FMT(OUTPUT)
> would error even with identical parameters.
>

How does the userspace know the right resolution of buffers to
allocate? Note that in general there is no guarantee that it's equal
to stream coded size, as there may be driver-specific alignments
involved.

Regardless of that, in the stateful spec the resolution of the CAPTURE
queue can change even if the queue has buffers allocated already, i.e.
when there is a dynamic resolution change. Maybe we should be
consistent with that behavior and disallow only pixelformat changes?
That would require careful synchronization in the driver, though, to
reject any already queued incompatible buffers, but could speed up
handling of resolution changes thanks to the ability to have big
enough buffers preallocated.

> > 2) Is it correct to compare dst_fmt with pix_fmt? My understanding is
> > that width/height of the OUTPUT queue is the coded size of the stream
> > (a stream parameter), while width/height of the CAPTURE queue is the
> > frame buffer size, which can be different from the stream coded size.
> > Perhaps we should compare with ctx->src_fmt instead?
>
> A call to hantro_reset_raw_fmt() will set dst_fmt width/height to
> src_fmt width/height later in this function, so this should make no
> difference.

Okay, so basically the failure condition is whether the destination
format would change after this function. I guess it makes sense if we
decide to go with such behavior.

Comparing source and destination formats in the code is at least
confusing, though. It relies on the current driver behavior to use the
same framebuffer size as stream coded size, but they are not
equivalent in general. Perhaps we could have a comment there?

Best regards,
Tomasz
