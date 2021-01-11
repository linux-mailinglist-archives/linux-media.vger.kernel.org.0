Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23A62F11F9
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 12:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbhAKL4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 06:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbhAKL4p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 06:56:45 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE9AC061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 03:56:05 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id z5so17470122iob.11
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 03:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uA3TKz8uECHG3k4yaFsUscxG5WEGEfU+DDgmBoAkS/o=;
        b=cIvAbCgayxCKoOYNityjL7wT9stWwPvV5eiCz7X38vD43GczvDqDpmuctteU9QyQ+e
         Km9UDE+qcaQ+wrWWNECGFkMSGJXhz5AW0uKH50716CeXLrfWfAe0i4OFHhFv79uQxpSy
         gnOsEH9u8HNzIAWUO1mhanlP45jDlmTwtKBbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uA3TKz8uECHG3k4yaFsUscxG5WEGEfU+DDgmBoAkS/o=;
        b=DnCIW3jFqjz7wcUCyTUyRVNSwWFpwBzfX2SywVrorkcLrgWNc/qAq3pe4Xl0uRqcFR
         wLda9tjzv30z+/t9OwX6TRHu3z7ob1t/Z8JpBg0uAfiYp8dMH8iSZDYjxuTN6ui0+bhv
         JsNw+y32WPR2BGFgfmr+JXPIbLxLwflpz9FyWGRlmXIzid4u7lg4aecL4KIvOqUmdwop
         97HJCOybMgTmmE+XpcMujZfwvaWEdO7LRgdgPdUPS8b11ec01VzsGWB+R3Ls0FpgHeLs
         m43uhGQfMl3+sZf/X3Cx85J/BtSTua3bju9ATrf55ed9bYtooe1Z3mg03KY9datJcmUs
         vt0g==
X-Gm-Message-State: AOAM533TM0WxI2HeWJICDz+bFUDv5K7qFzHd0EsPUUd0NjhHfaL0RCvN
        sKqdwIYCiAtY3YnQsudhO94VtEuO4WAwTA==
X-Google-Smtp-Source: ABdhPJwuSNcNUL7NBUH0sSgnkwcDGIVfSPkhRZJFpbSb2VNnWC/BUEAmd6frY+bzWPa0JSuuGG0zww==
X-Received: by 2002:a5e:dc0d:: with SMTP id b13mr14390654iok.31.1610366164068;
        Mon, 11 Jan 2021 03:56:04 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id x3sm13295236ila.29.2021.01.11.03.56.03
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 03:56:03 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id m23so17553240ioy.2
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 03:56:03 -0800 (PST)
X-Received: by 2002:a02:c042:: with SMTP id u2mr13813149jam.32.1610366162852;
 Mon, 11 Jan 2021 03:56:02 -0800 (PST)
MIME-Version: 1.0
References: <20210111113529.45488-1-ribalda@chromium.org> <ef218bf2bd948961079237686b58a00ca1b125bf.camel@collabora.com>
In-Reply-To: <ef218bf2bd948961079237686b58a00ca1b125bf.camel@collabora.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 11 Jan 2021 12:55:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCsX3k7xeC7Sr2T2SxHqspay+i054rAuv-NYCQpFRNuGeg@mail.gmail.com>
Message-ID: <CANiDSCsX3k7xeC7Sr2T2SxHqspay+i054rAuv-NYCQpFRNuGeg@mail.gmail.com>
Subject: Re: [PATCH] hantro: Format IOCTLs compliance fixes
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-rockchip@lists.infradead.org, devel@driverdev.osuosl.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel

On Mon, Jan 11, 2021 at 12:48 PM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> Hi Ricardo,
>
> On Mon, 2021-01-11 at 12:35 +0100, Ricardo Ribalda wrote:
> > Clear the reserved fields.
> >
> > Fixes:
> >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > test VIDIOC_TRY_FMT: FAIL
> >   fail: v4l2-test-formats.cpp(482): pix_mp.plane_fmt[0].reserved not zeroed
> > test VIDIOC_S_FMT: FAIL
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/staging/media/hantro/hantro_v4l2.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> > index b668a82d40ad..9b384fbffc93 100644
> > --- a/drivers/staging/media/hantro/hantro_v4l2.c
> > +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> > @@ -239,6 +239,7 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> >         const struct hantro_fmt *fmt, *vpu_fmt;
> >         bool capture = V4L2_TYPE_IS_CAPTURE(type);
> >         bool coded;
> > +       int i;
> >
> >         coded = capture == ctx->is_encoder;
> >
> > @@ -293,6 +294,10 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
> >                         pix_mp->width * pix_mp->height * fmt->max_depth;
> >         }
> >
> > +       for (i = 0; i < pix_mp->num_planes; i++)
> > +               memset(pix_mp->plane_fmt[i].reserved, 0,
> > +                      sizeof(pix_mp->plane_fmt[i].reserved));
> > +
>
> This looks like something that should be handled at the core,
> probably in drivers/media/v4l2-core/v4l2-ioctl.c::v4l_try_fmt().

The core does clear the reserved field from v4l2_pix_format_mplane,
but not the reserved field for every plane. I can try to add it to the
core as well. At least these drivers have code duplication:

git grep reserved | grep memset | grep plane_fmt
drivers/media/pci/intel/ipu3/ipu3-cio2.c:
memset(mpix->plane_fmt[0].reserved, 0,
drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c:
memset(pix_mp->plane_fmt[i].reserved, 0,
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c:
memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c:
memset(&(pix_fmt_mp->plane_fmt[i].reserved[0]), 0x0,
drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c:
memset(&(pix->plane_fmt[i].reserved[0]), 0x0,
drivers/media/platform/rcar_fdp1.c:
memset(pix->plane_fmt[i].reserved, 0,
drivers/media/platform/rcar_fdp1.c:
memset(pix->plane_fmt[2].reserved, 0,
drivers/media/platform/rcar_jpu.c:
memset(pix->plane_fmt[0].reserved, 0,
drivers/media/platform/rcar_jpu.c:
memset(pix->plane_fmt[i].reserved, 0,
drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c:
memset(pix->plane_fmt[i].reserved, 0,
drivers/media/platform/ti-vpe/vpe.c:
memset(plane_fmt->reserved, 0, sizeof(plane_fmt->reserved));
drivers/media/test-drivers/vicodec/vicodec-core.c:
memset(pix_mp->plane_fmt[0].reserved, 0,
drivers/staging/media/hantro/hantro_v4l2.c:
memset(pix_mp->plane_fmt[i].reserved, 0,
drivers/staging/media/ipu3/ipu3-v4l2.c: memset(pixm->plane_fmt[0].reserved, 0,

>
> Thanks,
> Ezequiel
>


-- 
Ricardo Ribalda
