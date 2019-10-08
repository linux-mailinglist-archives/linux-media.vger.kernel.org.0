Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC9C3CFBDD
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 16:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725848AbfJHOFf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 10:05:35 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53622 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfJHOFf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Oct 2019 10:05:35 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so3304713wmd.3
        for <linux-media@vger.kernel.org>; Tue, 08 Oct 2019 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kB7CXHxY+LEohqVACzEbI+Cwu0afTssdvtku42P9xuA=;
        b=kk7HWWMzQxstheQd2mCyWR1/mtPcukPha8E57ox7yH0wlwg+YehAg4jWhv3XxcYCvf
         j+uHUeJvxamKg0NB6UCW+Ac0NwiYhRfkh+BJbeGyX/zzV+/gtR3TpG06SlSiZpSsr2MX
         rFHmlUSR3Y47OJqcY2jTBXjNAbnT2N14IUUoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kB7CXHxY+LEohqVACzEbI+Cwu0afTssdvtku42P9xuA=;
        b=N4yafkBjexd/tXWqPBJKEgqpAIsd4Co+0UJn8vfKZK6ibC2SA9NbnDUHoHHom8w/gm
         EOtIqFFoFsC0DSWFpzDd+tUWhVZntxJsJ6E59fOORw/pBYekT0WwzlVjpUhOHpyMc2q2
         a2dcBWGfwi5jGC+A1OrpXavcmpMNdqBsHf1Tk+rUC/MgSkQyXoVm+q1j8VksyGBNJUL7
         Q63wRm3IlfCCcgUREMmZehcABcAAYXmQlbspv3zxB7/ompDQcF3W7jHjfwDwtPp9+9ln
         AegM+z49ctRxwdCiBt1eBbJgKwuE9Yh8iMKMO/RB2DyJAHcRChKqhakH4z+w8CfgSGpp
         zLNg==
X-Gm-Message-State: APjAAAVNnWqub3G1LGrZJ+U+ekp+MPnVguG06LPOUQY/ComJT2DwgaSo
        TBlm0HP0OMUI6bfMzq0u57K18YavLFyYd747MTYb0w==
X-Google-Smtp-Source: APXvYqxq8wkACfaIUCGva2V6JazWqz2yG8lCIkLKZgXK5OIc0ADxkevF2Cs1fxW8RFLG9Uk6Q0ryv3hwyri58rBOg+k=
X-Received: by 2002:a1c:658b:: with SMTP id z133mr4056667wmb.130.1570543532138;
 Tue, 08 Oct 2019 07:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191008123850.641-1-p.zabel@pengutronix.de>
In-Reply-To: <20191008123850.641-1-p.zabel@pengutronix.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Oct 2019 23:05:21 +0900
Message-ID: <CAHD77HmL-m9TgZJ7GO=E_gBW=Av9D68AY1FTuxBM2sUSQgNPSQ@mail.gmail.com>
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

Hi Philipp,

On Tue, Oct 8, 2019 at 9:38 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Setting the output format resets the capture queue, so we return -EBUSY
> while the capture queue has buffers allocated. If capture dimensions
> and pixel format don't change though, we can allow setting the output
> format without reallocating the capture queue.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> This applies on top of https://patchwork.linuxtv.org/patch/59337/
> ("media: hantro: Fix s_fmt for dynamic resolution changes").
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 586d243cc3cc..05c3edce27a9 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -368,7 +368,7 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>         struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
>         struct hantro_ctx *ctx = fh_to_ctx(priv);
>         struct vb2_queue *vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -       const struct hantro_fmt *formats;
> +       const struct hantro_fmt *raw_vpu_fmt, *formats;
>         unsigned int num_fmts;
>         int ret;
>
> @@ -394,8 +394,16 @@ vidioc_s_fmt_out_mplane(struct file *file, void *priv, struct v4l2_format *f)
>                  */
>                 peer_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>                                           V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> -               if (vb2_is_busy(peer_vq))
> -                       return -EBUSY;
> +               if (vb2_is_busy(peer_vq)) {
> +                       formats = hantro_get_formats(ctx, &num_fmts);
> +                       raw_vpu_fmt = hantro_get_default_fmt(formats, num_fmts,
> +                                                            false);
> +
> +                       if (ctx->dst_fmt.width != pix_mp->width ||
> +                           ctx->dst_fmt.height != pix_mp->height ||
> +                           ctx->dst_fmt.pixelformat != raw_vpu_fmt->fourcc)

First of all, thanks for the patch! I'd like to ask you to clarify a few things:
1) What's the use case for S_FMT(OUTPUT) without changing neither
resolution nor pixelformat?
2) Is it correct to compare dst_fmt with pix_fmt? My understanding is
that width/height of the OUTPUT queue is the coded size of the stream
(a stream parameter), while width/height of the CAPTURE queue is the
frame buffer size, which can be different from the stream coded size.
Perhaps we should compare with ctx->src_fmt instead?

Best regards,
Tomasz
