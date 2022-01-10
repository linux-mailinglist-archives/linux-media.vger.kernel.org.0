Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6FF48A36F
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 00:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345637AbiAJXLe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 18:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242456AbiAJXLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 18:11:33 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233BAC06173F
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 15:11:33 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j11so49967372lfg.3
        for <linux-media@vger.kernel.org>; Mon, 10 Jan 2022 15:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LqRAcmp1HX3rvfpRkvMEy8daluIHzCnYWs4Hefmttx4=;
        b=Z47yoAUaAHeuLsXgqLcwVvrxxDv0vCKtR9XNFWCVYMlyL+jHL1Fcm7mxgrJFFVlbOV
         bVP8YpJ0M//kp/bkIRU3pwZQNt/LfXDTOlvQRWIEVWYO7LH4XcUD8PdiGe3s8AsMVD9o
         jrBzfJIdsQsZBjIP+VrQqz0i4uAgToPF3r5bJr+d9+x1p5g0moDpC3fgqKzGMkf77QTn
         BSOpqZ2ylfSG0szTpE+0qT0KkKQIWGHleS400QfW6wGLcbr5eT3+7Nc6kKdpilU9dsK6
         blonk80pXLZXombEBmaACTkZQzqggKj9hl7e9+qLwD4SsfRDBDbzW2QE2FPYlV2QezTx
         NZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LqRAcmp1HX3rvfpRkvMEy8daluIHzCnYWs4Hefmttx4=;
        b=aRA6YdxzlLcI1qv/JlXbAxyJHHhuWN2HTSuUG6yLtVhuVOObgKjkYYGAxGTC8nnUgi
         /mvoKZVe5SFnLiQGhBHOISjhFZR3gcTZ0dnI3IRwj/WuozvEI3pHDiIb+Z1CQgmIsvmH
         o+o3aEcBn2kBPkG0dhOxE9KibDtD2PLirHKImab5e2dIpI/QeHa9cX5L0tKMGqZc5lCD
         dWV7/vbNq5EU52bQVc7L/4HJoMzpDm8idU7L72spwTBmbe4Snfb2l7B6yPhEIQNWL+Si
         ko7RAFb/zdnz3xIUa0bXUcE5OH6QYs1n0vdhLQio342UM4BQ1zbf6zj6Zj8hToMTBCZa
         ts7g==
X-Gm-Message-State: AOAM532Q90czqXvNIbyB3iUTsny/uNG4sX/rK9AZv7KrANsLCS1lcJHm
        tpzSPoUDTCFVGCMQKh2zkfTdUiy/CTPS5iVDfTvdTg==
X-Google-Smtp-Source: ABdhPJyrP2Hr4DURvIRYer4vuyczBD+ua98jrqGWjgTj0wU+xPapJ20x7PXc3hpEl00hI5VsLZ7sY/az6bYFy2zfucM=
X-Received: by 2002:a05:6512:3baa:: with SMTP id g42mr1406031lfv.651.1641856291142;
 Mon, 10 Jan 2022 15:11:31 -0800 (PST)
MIME-Version: 1.0
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 10 Jan 2022 15:11:18 -0800
Message-ID: <CAKwvOdnfX1DzgkzCPY7N4LiJDJTGxsKNQbRMmmkt7o5z5O-W9w@mail.gmail.com>
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        hverkuil@xs4all.nl
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 10, 2022 at 2:48 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> are directly passed to printk family of functions.

I would rephrase the below statement...

> This could result in an
> unaligned access albeit no such possibility appears to exist at the
> moment i.e. this clang warning appears to be a false positive.

...to:

warning: taking address of packed member 'pixelformat' of class or
structure 'v4l2_pix_format_mplane' may result in an unaligned pointer
value [-Waddress-of-packed-member]

The warning is correct; because `struct v4l2_pix_format_mplane` is
__packed, it's members also have __aligned(1).  Taking the address of
such members results in the use of underaligned pointers which is UB
and may be caught by UBSAN or fault on architectures without unaligned
loads should the struct instance happen to be allocated without any
natural alignment.

>
> Address the warning by copying the pixelformat or dataformat value to a
> local variable first.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e927e1e0f0dd ("v4l: ioctl: Use %p4cc printk modifier to print FourCC codes")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Andy, Nick,
>
> How about this one?
>
> I believe it does address the clang warning although I haven't tested it.

LGTM. Thanks Sakari and Andy for pursuing this. Just a minor nit on my
side about the framing of this warning being a false positive; I don't
think it is.  With that amended,

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Kind regards,
> Sakari
>
>  drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9ac557b8e146..642cb90f457c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -279,8 +279,8 @@ static void v4l_print_format(const void *arg, bool write_only)
>         const struct v4l2_vbi_format *vbi;
>         const struct v4l2_sliced_vbi_format *sliced;
>         const struct v4l2_window *win;
> -       const struct v4l2_sdr_format *sdr;
>         const struct v4l2_meta_format *meta;
> +       u32 pixelformat;
>         u32 planes;
>         unsigned i;
>
> @@ -299,8 +299,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>         case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>         case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>                 mp = &p->fmt.pix_mp;
> +               pixelformat = mp->pixelformat;
>                 pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> -                       mp->width, mp->height, &mp->pixelformat,
> +                       mp->width, mp->height, &pixelformat,
>                         prt_names(mp->field, v4l2_field_names),
>                         mp->colorspace, mp->num_planes, mp->flags,
>                         mp->ycbcr_enc, mp->quantization, mp->xfer_func);
> @@ -343,14 +344,15 @@ static void v4l_print_format(const void *arg, bool write_only)
>                 break;
>         case V4L2_BUF_TYPE_SDR_CAPTURE:
>         case V4L2_BUF_TYPE_SDR_OUTPUT:
> -               sdr = &p->fmt.sdr;
> -               pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
> +               pixelformat = p->fmt.sdr.pixelformat;
> +               pr_cont(", pixelformat=%p4cc\n", &pixelformat);
>                 break;
>         case V4L2_BUF_TYPE_META_CAPTURE:
>         case V4L2_BUF_TYPE_META_OUTPUT:
>                 meta = &p->fmt.meta;
> +               pixelformat = meta->dataformat;
>                 pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -                       &meta->dataformat, meta->buffersize);
> +                       &pixelformat, meta->buffersize);
>                 break;
>         }
>  }
> --
> 2.30.2
>


--
Thanks,
~Nick Desaulniers
