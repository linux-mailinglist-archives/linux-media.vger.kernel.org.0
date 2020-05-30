Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A54B1E90FD
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 13:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgE3Lx6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 07:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728869AbgE3Lx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 07:53:58 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B985C03E969;
        Sat, 30 May 2020 04:53:58 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id x202so4584120oix.11;
        Sat, 30 May 2020 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/65NTMYX/j3YBnuSs/gKApQZ8J17N3wOZMF6uBosNrA=;
        b=JBg5KKuO/mDtvKMnrKxxmj7YPywAjDwXEI3+xN9I4/K5BuXb2mfpl2uGfmR/g0sX8i
         o10BqhbLEBhDAAqOJUi623UUQqgNSLFGyfSwF34xwCPhpPRXFFViv7STXKfLrEIowNhR
         SoBKw0be196TD1Qiimh2LJ5flrbv2PpgvGeC/kfIBaVM403dEFIafIcoJOhpOBk2CyDj
         L8yB2LlBDfygBuUIGGsJeBAQoKIk3bOXE0G4qd6OUjsP4k2FIHiDZeq6dzjabZe4veJk
         0g0M5mhpHTAqIX5mn/jFBF4yCuLxHc+5z5F20Y19bwrSUY/z9kJW8qeTGTBADjxDGbHR
         hx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/65NTMYX/j3YBnuSs/gKApQZ8J17N3wOZMF6uBosNrA=;
        b=A6pPKWgTajB2+Gwk4hn/wRhJFcJa2cOhcz/WdvlY0pcnwHPBvrX/Hx8Gof6zOErOy/
         05uKAMp5F+WpdLD4m18MojQz4XydEdNz/TUIfVuLi0ysiGOWcm9dsORjJI4IY+AyMQo8
         iyXsHptt7RL4o+8HN98BiZO8Gm2WVg857No2V028oshxXQN//cbswig+wGgTCPoNoZW1
         azAXX3/VGh8eT6kGX7akJuSdsoac1BjK+xhLGE1YZjcCn9POgb3x4jRKpDUib4MjLfXo
         AXipPmTCskuXYYjdOBEOwLgUdOitjd9Wdvrl+KM1v6omRwvSfzY21CI9RtWmSN6f7kVn
         PCXg==
X-Gm-Message-State: AOAM5302HxVLmxjrYd6u/QnbyoV1A4ODv2KRcV5+3Fy+BQxAABGimyeG
        tlOr0fOY8ApwceZ7vlgbG28DIMPVbRG7fV/1ZOu0ap2Ej4y6Ew==
X-Google-Smtp-Source: ABdhPJzzey/TAZkn8MSnDksNQYm9TOV+P+8mbCqxTn05wL8J7ayWjE37RfQKBncmXqpNxUxnHjP3lX8Sf5hLO7g0NMU=
X-Received: by 2002:a05:6808:106:: with SMTP id b6mr9557554oie.142.1590839637392;
 Sat, 30 May 2020 04:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200528132605.18339-1-bparrot@ti.com> <20200528132605.18339-3-bparrot@ti.com>
In-Reply-To: <20200528132605.18339-3-bparrot@ti.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 30 May 2020 12:53:31 +0100
Message-ID: <CA+V-a8v81jLNq=wBWg4uP+ud1g=Z-dtatYOPJ6tnFKV83q2VCQ@mail.gmail.com>
Subject: Re: [Patch 2/2] media: use v4l2_rect_enclosed helper
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benoit,

Thank you for the patch.

On Thu, May 28, 2020 at 2:26 PM Benoit Parrot <bparrot@ti.com> wrote:
>
> Several drivers implement the same enclosed_rectangle() function to
> check if a rectangle is enclosed into another. Replace this with the
> newly added v4l2_rect_enclosed() helper function.
>
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   | 19 +++----------------

For the above:
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar

>  .../media/platform/exynos4-is/fimc-capture.c  | 18 +++---------------
>  drivers/media/platform/exynos4-is/fimc-lite.c | 18 +++---------------
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   | 16 ++--------------
>  4 files changed, 11 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index 66079cc41f38..0fb9f9ba1219 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -26,6 +26,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-fwnode.h>
> +#include <media/v4l2-rect.h>
>
>  #include "am437x-vpfe.h"
>
> @@ -1987,20 +1988,6 @@ vpfe_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
>         return 0;
>  }
>
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -       if (a->left < b->left || a->top < b->top)
> -               return 0;
> -
> -       if (a->left + a->width > b->left + b->width)
> -               return 0;
> -
> -       if (a->top + a->height > b->top + b->height)
> -               return 0;
> -
> -       return 1;
> -}
> -
>  static int
>  vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>  {
> @@ -2025,10 +2012,10 @@ vpfe_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
>         r.left = clamp_t(unsigned int, r.left, 0, cr.width - r.width);
>         r.top  = clamp_t(unsigned int, r.top, 0, cr.height - r.height);
>
> -       if (s->flags & V4L2_SEL_FLAG_LE && !enclosed_rectangle(&r, &s->r))
> +       if (s->flags & V4L2_SEL_FLAG_LE && !v4l2_rect_enclosed(&r, &s->r))
>                 return -ERANGE;
>
> -       if (s->flags & V4L2_SEL_FLAG_GE && !enclosed_rectangle(&s->r, &r))
> +       if (s->flags & V4L2_SEL_FLAG_GE && !v4l2_rect_enclosed(&s->r, &r))
>                 return -ERANGE;
>
>         s->r = vpfe->crop = r;
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 705f182330ca..8b10741a847a 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -21,6 +21,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-rect.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
>
> @@ -1299,19 +1300,6 @@ static int fimc_cap_g_selection(struct file *file, void *fh,
>         return -EINVAL;
>  }
>
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -       if (a->left < b->left || a->top < b->top)
> -               return 0;
> -       if (a->left + a->width > b->left + b->width)
> -               return 0;
> -       if (a->top + a->height > b->top + b->height)
> -               return 0;
> -
> -       return 1;
> -}
> -
>  static int fimc_cap_s_selection(struct file *file, void *fh,
>                                 struct v4l2_selection *s)
>  {
> @@ -1334,11 +1322,11 @@ static int fimc_cap_s_selection(struct file *file, void *fh,
>         fimc_capture_try_selection(ctx, &rect, s->target);
>
>         if (s->flags & V4L2_SEL_FLAG_LE &&
> -           !enclosed_rectangle(&rect, &s->r))
> +           !v4l2_rect_enclosed(&rect, &s->r))
>                 return -ERANGE;
>
>         if (s->flags & V4L2_SEL_FLAG_GE &&
> -           !enclosed_rectangle(&s->r, &rect))
> +           !v4l2_rect_enclosed(&s->r, &rect))
>                 return -ERANGE;
>
>         s->r = rect;
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index 394e0818f2d5..9c666f663ab4 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -25,6 +25,7 @@
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-rect.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
>  #include <media/drv-intf/exynos-fimc.h>
> @@ -868,19 +869,6 @@ static int fimc_lite_reqbufs(struct file *file, void *priv,
>         return ret;
>  }
>
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -       if (a->left < b->left || a->top < b->top)
> -               return 0;
> -       if (a->left + a->width > b->left + b->width)
> -               return 0;
> -       if (a->top + a->height > b->top + b->height)
> -               return 0;
> -
> -       return 1;
> -}
> -
>  static int fimc_lite_g_selection(struct file *file, void *fh,
>                                  struct v4l2_selection *sel)
>  {
> @@ -922,11 +910,11 @@ static int fimc_lite_s_selection(struct file *file, void *fh,
>         fimc_lite_try_compose(fimc, &rect);
>
>         if ((sel->flags & V4L2_SEL_FLAG_LE) &&
> -           !enclosed_rectangle(&rect, &sel->r))
> +           !v4l2_rect_enclosed(&rect, &sel->r))
>                 return -ERANGE;
>
>         if ((sel->flags & V4L2_SEL_FLAG_GE) &&
> -           !enclosed_rectangle(&sel->r, &rect))
> +           !v4l2_rect_enclosed(&sel->r, &rect))
>                 return -ERANGE;
>
>         sel->r = rect;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 86bda3947110..9b22dd8e34f4 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -24,6 +24,7 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/v4l2-ioctl.h>
> +#include <media/v4l2-rect.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/videobuf2-dma-contig.h>
>
> @@ -1735,19 +1736,6 @@ static int exynos3250_jpeg_try_downscale(struct s5p_jpeg_ctx *ctx,
>         return 0;
>  }
>
> -/* Return 1 if rectangle a is enclosed in rectangle b, or 0 otherwise. */
> -static int enclosed_rectangle(struct v4l2_rect *a, struct v4l2_rect *b)
> -{
> -       if (a->left < b->left || a->top < b->top)
> -               return 0;
> -       if (a->left + a->width > b->left + b->width)
> -               return 0;
> -       if (a->top + a->height > b->top + b->height)
> -               return 0;
> -
> -       return 1;
> -}
> -
>  static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>                                    struct v4l2_rect *r)
>  {
> @@ -1780,7 +1768,7 @@ static int exynos3250_jpeg_try_crop(struct s5p_jpeg_ctx *ctx,
>         r->left = round_down(r->left, 2);
>         r->top = round_down(r->top, 2);
>
> -       if (!enclosed_rectangle(r, &base_rect))
> +       if (!v4l2_rect_enclosed(r, &base_rect))
>                 return -EINVAL;
>
>         ctx->crop_rect.left = r->left;
> --
> 2.17.1
>
