Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37BC1F0548
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2020 07:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFFFkU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Jun 2020 01:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgFFFkT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Jun 2020 01:40:19 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407FDC08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 22:40:18 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id p18so9072992eds.7
        for <linux-media@vger.kernel.org>; Fri, 05 Jun 2020 22:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMJkhQnWLIK0t2nhWF/2eUs4TMDM1FwvFYEyzsHbS2k=;
        b=oT9c+V5GfGutAJ8014uEjd++MW4JDywDazRZT9HiOfz/byK/B3E3HwW/7Be+dS9xhx
         JF48qTS+1CbxoUufXNEWn/DXWjQmAf0GrTQg9cHMlSeQLe7TeKhvk8BGD7XFv54oVEMq
         lcq4HZCIzNbchMlSci98gWrdFYNwBFSBHDu4KJJ0K8dNIl11lJhMRT80oaQNmpJ0JyaK
         Rsn2CLKZs5i32GWDaDniLn8H4xg0Pi4vVqspYlmQiXwri71Ew/GjLPxCjcAV4Mb7hs2J
         K0hjZ2S35SGjPcMZnqhl5h9/b8Tyl/9Zo87EGdVLFdju3320HRrskjJauYmNuvNZaGbY
         7mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMJkhQnWLIK0t2nhWF/2eUs4TMDM1FwvFYEyzsHbS2k=;
        b=cJJY19k+QmEK8eLav5Ys7vjTiPU1t9qNZtfOTtbOJH/XTzIDBq4AtZC88aVdUJikZf
         7ujpycj7pxOApiauzvAK+6pX/Wtw7Jbk2reW7Puiws+2Uu7/lhOFgriMvYKvu4sBmPnm
         23XSZ3ba0PCqsqnUbMrWSfQBlEPge8qGWiUrm8S0RKIRbdhnyFaJmkr3AN97GN4one7a
         vcC2gP7gAmRa2rsDseZHynn8zdG/HUGt20pFi3tN4rWTBF3eS+wzLCxJcnXP4j0emr4z
         7bqCDcqe7qenJZk+goV9m17vb/eBtpu2l8Iv8PGy1PFPONZRn1z+OZk64oH/xf/Fz4Zz
         3hJg==
X-Gm-Message-State: AOAM530SNzAK6EfDqu0lzzk+uAI0rRIx+CrwK86HOCXpS+XOLnD7bjSv
        Wilng2BRvpPij424oqPhImvGVyTuRaPnDzxKVMLgOUa4W+c=
X-Google-Smtp-Source: ABdhPJypPEN+3QTtet+AfbpuEfd0Jqz2YHf3qVsFbXVSBjLFnbM9Sv84m0UmAGLyMZleeanm+YT2sFXqR7xqGXtfFpM=
X-Received: by 2002:aa7:d483:: with SMTP id b3mr5079356edr.71.1591422016776;
 Fri, 05 Jun 2020 22:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200520171457.11937-1-jernej.skrabec@siol.net>
In-Reply-To: <20200520171457.11937-1-jernej.skrabec@siol.net>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 6 Jun 2020 02:40:05 -0300
Message-ID: <CAAEAJfD2MeaZrRqjYU9uD9cbJZE1JZUz0VeMw01YJSL+Vro-Hg@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: Add support for additional output formats
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Jernej,

Thanks for the patch.

On Wed, 20 May 2020 at 14:12, Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> If VPU supports untiled output, it actually supports several different
> YUV 4:2:0 layouts, namely NV12, NV21, YUV420 and YVU420.
>
> Add support for all of them.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 18 +++++++++++++++++-
>  .../staging/media/sunxi/cedrus/cedrus_video.c  | 18 ++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index daf5f244f93b..c119fd8c4b92 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -83,9 +83,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
>
>         switch (fmt->pixelformat) {
>         case V4L2_PIX_FMT_NV12:
> +       case V4L2_PIX_FMT_NV21:
> +       case V4L2_PIX_FMT_YUV420:
> +       case V4L2_PIX_FMT_YVU420:
>                 chroma_size = ALIGN(width, 16) * ALIGN(height, 16) / 2;
>
> -               reg = VE_PRIMARY_OUT_FMT_NV12;
> +               switch (fmt->pixelformat) {
> +               case V4L2_PIX_FMT_NV12:
> +                       reg = VE_PRIMARY_OUT_FMT_NV12;
> +                       break;
> +               case V4L2_PIX_FMT_NV21:
> +                       reg = VE_PRIMARY_OUT_FMT_NV21;
> +                       break;
> +               case V4L2_PIX_FMT_YUV420:
> +                       reg = VE_PRIMARY_OUT_FMT_YU12;
> +                       break;
> +               case V4L2_PIX_FMT_YVU420:
> +                       reg = VE_PRIMARY_OUT_FMT_YV12;
> +                       break;
> +               }
>                 cedrus_write(dev, VE_PRIMARY_OUT_FMT, reg);
>

I think it would result in a cleaner code if you extend
cedrus_format to include the hw_format.

Something along these lines (not a complete patch):

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 15cf1f10221b..618daaa65a82 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -48,10 +48,12 @@ static struct cedrus_format cedrus_formats[] = {
        },
        {
                .pixelformat    = V4L2_PIX_FMT_SUNXI_TILED_NV12,
+               .hw_format      = VE_PRIMARY_OUT_FMT_TILED_32_NV12,
                .directions     = CEDRUS_DECODE_DST,
        },
        {
                .pixelformat    = V4L2_PIX_FMT_NV12,
+               .hw_format      = VE_PRIMARY_OUT_FMT_NV12,
                .directions     = CEDRUS_DECODE_DST,
                .capabilities   = CEDRUS_CAPABILITY_UNTILED,
        },
@@ -274,6 +276,7 @@ static int cedrus_s_fmt_vid_cap(struct file *file,
void *priv,
 {
        struct cedrus_ctx *ctx = cedrus_file2ctx(file);
        struct cedrus_dev *dev = ctx->dev;
+       struct cedrus_format *fmt;
        struct vb2_queue *vq;
        int ret;

@@ -287,7 +290,10 @@ static int cedrus_s_fmt_vid_cap(struct file
*file, void *priv,

        ctx->dst_fmt = f->fmt.pix;

-       cedrus_dst_format_set(dev, &ctx->dst_fmt);
+       fmt = cedrus_find_format(ctx->dst_fmt.pixelformat,
+                                CEDRUS_DECODE_DST,
+                                dev->capabilities);
+       cedrus_dst_format_set(dev, fmt);

        return 0;
 }

So then in cedrus_dst_format_set() you can just
write VE_PRIMARY_OUT_FMT with fmt->hw_format.

>                 reg = chroma_size / 2;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> index 15cf1f10221b..016021d71df2 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
> @@ -55,6 +55,21 @@ static struct cedrus_format cedrus_formats[] = {
>                 .directions     = CEDRUS_DECODE_DST,
>                 .capabilities   = CEDRUS_CAPABILITY_UNTILED,
>         },
> +       {
> +               .pixelformat    = V4L2_PIX_FMT_NV21,
> +               .directions     = CEDRUS_DECODE_DST,
> +               .capabilities   = CEDRUS_CAPABILITY_UNTILED,
> +       },
> +       {
> +               .pixelformat    = V4L2_PIX_FMT_YUV420,
> +               .directions     = CEDRUS_DECODE_DST,
> +               .capabilities   = CEDRUS_CAPABILITY_UNTILED,
> +       },
> +       {
> +               .pixelformat    = V4L2_PIX_FMT_YVU420,
> +               .directions     = CEDRUS_DECODE_DST,
> +               .capabilities   = CEDRUS_CAPABILITY_UNTILED,
> +       },
>  };
>
>  #define CEDRUS_FORMATS_COUNT   ARRAY_SIZE(cedrus_formats)
> @@ -130,6 +145,9 @@ void cedrus_prepare_format(struct v4l2_pix_format *pix_fmt)
>                 break;
>
>         case V4L2_PIX_FMT_NV12:
> +       case V4L2_PIX_FMT_NV21:
> +       case V4L2_PIX_FMT_YUV420:
> +       case V4L2_PIX_FMT_YVU420:
>                 /* 16-aligned stride. */
>                 bytesperline = ALIGN(width, 16);
>
> --
> 2.26.2
>

Thanks,
Ezequiel
