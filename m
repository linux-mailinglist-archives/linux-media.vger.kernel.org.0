Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF5A22DFA0
	for <lists+linux-media@lfdr.de>; Sun, 26 Jul 2020 16:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgGZOM1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Jul 2020 10:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgGZOM1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Jul 2020 10:12:27 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFDE6C0619D2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 07:12:25 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id rk21so14498725ejb.2
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2020 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PPMiJgFzo9ZIJYgNx86saSChFjlRAXu2tMc2m1Uoe1Y=;
        b=H6d0DOtyBHKqlX/E03kTziSn3mJRXqLM1D8CLIbdk1+/lBMpNwugjZdnPG4q8mvaKu
         Wj6BFJHyQIRRQjf6KndUZLr0TN+Ta7/Sy/vYdMdmI3KLoVJiYhZlCB/BovpY7hRWZyia
         +/zK6F7h0PeXz5nHVRiy6ERQKohJr6J/JZ9VADPgdy2Xeo2nqwXlfiCyWVyJsnezKt7L
         3jopl3eNpzv7efAtgDRxvlFzMYI2HglDnd/tvSu1v+CiGLaEbU9LKT6cs7kXeUwZxqyD
         UITH1SqZzL3HtMVNrGVJqmvpbV4cJ7BUxv93LltN7GtRvYgvliuC8Xu1jk90bPayrH5M
         4tWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PPMiJgFzo9ZIJYgNx86saSChFjlRAXu2tMc2m1Uoe1Y=;
        b=cza2JB8xB9ERuiSfSuy3M3T0fsFxaXZkAwg2M0yb89mIIJgPD/n7fdU1VJMaVtDaVY
         2pI/70olKPBPw4KPxUvyCsFj7ygT7g+V3GV6rhu4mqn3k7dz2BttKzXMicbXugpiu2Je
         +d6jzloHD80RFY4W/PZnXH5HPB//Wzqha8AzbpH0FVbhbjGl/bVZA2y4hPGJ6wMGneTW
         rQRLrGQW8sdgdjQVd21jGWw4QS4BWnQX6eb3S69RXotbCp4D+6FFCavCTktkuYjK9TtI
         4HOXZUrwY4QwonfSEjA70Xh0BXIWm9bGCoUPYO0MHgUlaxsIBgbg0vpzceYzoRD3Lz+r
         9a9g==
X-Gm-Message-State: AOAM5304pKWkvusa4CjmCXKBX2pMfyPorT2EHQIMkDgcS3FdhzdaU7gw
        eqM2ufKpq6NTc7mgh4rojwuQeknsrNpp18dykeA9dA==
X-Google-Smtp-Source: ABdhPJw1RxCXtmTwXo6Z+gbbu2dHmARHw8n6ksYDeTi32XJDWaCt+YzRAmyRdSSBQIvyWOiBQsGh8U21ZRZ3X7dauUk=
X-Received: by 2002:a17:906:140e:: with SMTP id p14mr13571434ejc.430.1595772744342;
 Sun, 26 Jul 2020 07:12:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200725155208.897908-1-ezequiel@collabora.com>
 <20200725155208.897908-3-ezequiel@collabora.com> <783c2943-e601-23f1-1c23-aa8f67140ac1@kwiboo.se>
In-Reply-To: <783c2943-e601-23f1-1c23-aa8f67140ac1@kwiboo.se>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sun, 26 Jul 2020 11:12:13 -0300
Message-ID: <CAAEAJfBa2uEgi0R5e+C=uJ-6wwMsReYRg_DgN8YoyMoUQP0QhQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hantro: postproc: Fix motion vector space allocation
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, 26 Jul 2020 at 04:42, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> On 2020-07-25 17:52, Ezequiel Garcia wrote:
> > When the post-processor is enabled, the driver allocates
> > "shadow buffers" which are used for the decoder core,
> > and exposes the post-processed buffers to userspace.
> >
> > For this reason, extra motion vector space has to
> > be allocated on the shadow buffers, which the driver
> > wasn't doing. Fix this.
> >
> > This fix removes artifacts on high profile bitstreams,
> > found on certain platforms.
> >
> > While here, fix the MV layout comment, since the multicore
> > (MC) word is found before the MV buffer.
>
> If this is the case then the mv offset currently used is probably
> wrong for multicore hantro blocks.
>

Oh, yes, my bad.

> The imx-vpu-hantro reference code mentions the following for H.264,
>
>   allocate 32 bytes for multicore status fields
>   locate it after picture and direct MV
>
> and for VP8 it locate it directly after picture.
>
> The Rockchip hantro devices I have is not multicore (to my knowledge),
> is the iMX8M hantro a multicore block?
>

Newer cores (newer than G1 and G2) specify the MC status before the
MV buffer, and I was too quick to assume it was the case also for G1.

I'll get a v2.

Thanks for the catch,
Ezequiel

> Best regards,
> Jonas
>
> >
> > Fixes: 8c2d66b036c77 ("media: hantro: Support color conversion via post-processing")
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/staging/media/hantro/hantro_hw.h       | 4 ++--
> >  drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > index f066de6b592d..989564485ca1 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -200,10 +200,10 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
> >        * +---------------------------+
> >        * | UV-plane  128 bytes x MBs |
> >        * +---------------------------+
> > -      * | MV buffer  64 bytes x MBs |
> > -      * +---------------------------+
> >        * | MC sync          32 bytes |
> >        * +---------------------------+
> > +      * | MV buffer  64 bytes x MBs |
> > +      * +---------------------------+
> >        */
> >       return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
> >  }
> > diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
> > index 44062ffceaea..6d2a8f2a8f0b 100644
> > --- a/drivers/staging/media/hantro/hantro_postproc.c
> > +++ b/drivers/staging/media/hantro/hantro_postproc.c
> > @@ -118,7 +118,9 @@ int hantro_postproc_alloc(struct hantro_ctx *ctx)
> >       unsigned int num_buffers = cap_queue->num_buffers;
> >       unsigned int i, buf_size;
> >
> > -     buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage;
> > +     buf_size = ctx->dst_fmt.plane_fmt[0].sizeimage +
> > +                hantro_h264_mv_size(ctx->dst_fmt.width,
> > +                                    ctx->dst_fmt.height);
> >
> >       for (i = 0; i < num_buffers; ++i) {
> >               struct hantro_aux_buf *priv = &ctx->postproc.dec_q[i];
> >
