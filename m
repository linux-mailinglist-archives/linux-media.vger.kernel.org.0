Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AD747FAB0
	for <lists+linux-media@lfdr.de>; Mon, 27 Dec 2021 08:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhL0HG3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Dec 2021 02:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhL0HG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Dec 2021 02:06:29 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCEDBC06173E
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:06:28 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id i5so10507331uaq.10
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4FLR5aRa6nhcAgyU88oGHnr22kyfHCN3jOQK5fS/Kkc=;
        b=M0PfZbMlw980hwdVk9JbyWaetJDLPWLwxYeBHJdEl2uuiJ8GnjnEPfcxX0K8CQR/n4
         V4QK4xZ5M1mZXcLBSs7h6N1U4dRbPnw31gHEJs57N/bhAM6moXrSxwLfv2P+yF3k81zp
         9BTuY0mt3jxwVqUh25JSB2TvEHEtVAxQXrOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4FLR5aRa6nhcAgyU88oGHnr22kyfHCN3jOQK5fS/Kkc=;
        b=7B2keKMQky+onwQqKLIAcwGh8JigxHTYgLPYUfDiuBKrQhzOuPkZkYwY/Rj8hGcMs/
         PhwoLJ4XzefaorwIOLUvPuYovh46SpEiK7XgYNu8k7gw811sc6WM1oVFqG64W3PlDz7e
         Z6yTtbhOB7QQDysjYx2OWRbAbKXcViGxszg4DRpJwWlnCUR37+8Qmil+ZIhnbl+XlfQR
         MGuKwr+jtmL1RPFGePy/6G+4oR/VT9JezDiM0tyE36RyPodNyzveXZXvKHhhKdHc7x7R
         VSB/0PyyDS6bw5xfcLKov8oh73KBa2poMe6bz8Lv/JLi5vT9IGGAd30kYEYMhYv/JeN1
         ieQQ==
X-Gm-Message-State: AOAM533ODQicOhzVUsyNzGFsk/KhxIle3/qk2qWjugXsvxC/PIRuI+bD
        obojLROp05+VL0KlzgprKTM32oHPYR7uFA==
X-Google-Smtp-Source: ABdhPJx2kjPddioVU8bBGiDvD+2KoT9BUcB5Qe6Sh1BCFpG6WJh67mTKSQM/eokMKTIuvFTekDYHoA==
X-Received: by 2002:a67:f799:: with SMTP id j25mr4103593vso.75.1640588788011;
        Sun, 26 Dec 2021 23:06:28 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id m62sm62357uam.0.2021.12.26.23.06.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Dec 2021 23:06:27 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p37so25305252uae.8
        for <linux-media@vger.kernel.org>; Sun, 26 Dec 2021 23:06:27 -0800 (PST)
X-Received: by 2002:a05:6102:3218:: with SMTP id r24mr4753042vsf.74.1640588787493;
 Sun, 26 Dec 2021 23:06:27 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com> <20211117130635.11633-6-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-6-dafna.hirschfeld@collabora.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 27 Dec 2021 16:06:16 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXyV7K3NuSLCWApC_TNjhFW=+3Eb_7d2028Nyno7fnkMA@mail.gmail.com>
Message-ID: <CAPBb6MXyV7K3NuSLCWApC_TNjhFW=+3Eb_7d2028Nyno7fnkMA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] media: mtk-vcodec: replace func vidioc_try_fmt
 with two funcs for out/cap
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        courbot@chromium.org, Dafna Hirschfeld <dafna3@gmail.com>,
        eizan@chromium.org, houlong.wei@mediatek.com,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= 
        <maoguang.meng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        minghsiu.tsai@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 10:07 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The function vidioc_try_fmt has a big 'if-else' for
> the capture and output cases. There is hardly any code
> outside of that condition. It is therefore better to split
> that functions into two different functions, one for each case.
>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Makes much more sense that way, thanks!

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 149 +++++++++---------
>  1 file changed, 72 insertions(+), 77 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index fb3cf804c96a..be28f2401839 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -263,87 +263,82 @@ static struct mtk_q_data *mtk_venc_get_q_data(struct mtk_vcodec_ctx *ctx,
>         return &ctx->q_data[MTK_Q_DATA_DST];
>  }
>
> +static void vidioc_try_fmt_cap(struct v4l2_format *f)
> +{
> +       f->fmt.pix_mp.field = V4L2_FIELD_NONE;
> +       f->fmt.pix_mp.num_planes = 1;
> +       f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
> +       f->fmt.pix_mp.flags = 0;
> +}
> +
>  /* V4L2 specification suggests the driver corrects the format struct if any of
>   * the dimensions is unsupported
>   */
> -static int vidioc_try_fmt(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
> -                         const struct mtk_video_fmt *fmt)
> +static int vidioc_try_fmt_out(struct mtk_vcodec_ctx *ctx, struct v4l2_format *f,
> +                             const struct mtk_video_fmt *fmt)
>  {
>         struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
> +       int tmp_w, tmp_h;
> +       unsigned int max_width, max_height;
>
>         pix_fmt_mp->field = V4L2_FIELD_NONE;
>
> -       if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> -               pix_fmt_mp->num_planes = 1;
> -               pix_fmt_mp->plane_fmt[0].bytesperline = 0;
> -       } else if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> -               int tmp_w, tmp_h;
> -               unsigned int max_width, max_height;
> -
> -               if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
> -                       max_width = MTK_VENC_4K_MAX_W;
> -                       max_height = MTK_VENC_4K_MAX_H;
> -               } else {
> -                       max_width = MTK_VENC_HD_MAX_W;
> -                       max_height = MTK_VENC_HD_MAX_H;
> -               }
> +       if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) {
> +               max_width = MTK_VENC_4K_MAX_W;
> +               max_height = MTK_VENC_4K_MAX_H;
> +       } else {
> +               max_width = MTK_VENC_HD_MAX_W;
> +               max_height = MTK_VENC_HD_MAX_H;
> +       }
>
> -               pix_fmt_mp->height = clamp(pix_fmt_mp->height,
> -                                       MTK_VENC_MIN_H,
> -                                       max_height);
> -               pix_fmt_mp->width = clamp(pix_fmt_mp->width,
> -                                       MTK_VENC_MIN_W,
> -                                       max_width);
> +       pix_fmt_mp->height = clamp(pix_fmt_mp->height, MTK_VENC_MIN_H, max_height);
> +       pix_fmt_mp->width = clamp(pix_fmt_mp->width, MTK_VENC_MIN_W, max_width);
>
> -               /* find next closer width align 16, heign align 32, size align
> -                * 64 rectangle
> -                */
> -               tmp_w = pix_fmt_mp->width;
> -               tmp_h = pix_fmt_mp->height;
> -               v4l_bound_align_image(&pix_fmt_mp->width,
> -                                       MTK_VENC_MIN_W,
> -                                       max_width, 4,
> -                                       &pix_fmt_mp->height,
> -                                       MTK_VENC_MIN_H,
> -                                       max_height, 5, 6);
> -
> -               if (pix_fmt_mp->width < tmp_w &&
> -                       (pix_fmt_mp->width + 16) <= max_width)
> -                       pix_fmt_mp->width += 16;
> -               if (pix_fmt_mp->height < tmp_h &&
> -                       (pix_fmt_mp->height + 32) <= max_height)
> -                       pix_fmt_mp->height += 32;
> -
> -               mtk_v4l2_debug(0,
> -                       "before resize width=%d, height=%d, after resize width=%d, height=%d, sizeimage=%d %d",
> -                       tmp_w, tmp_h, pix_fmt_mp->width,
> -                       pix_fmt_mp->height,
> -                       pix_fmt_mp->plane_fmt[0].sizeimage,
> -                       pix_fmt_mp->plane_fmt[1].sizeimage);
> -
> -               pix_fmt_mp->num_planes = fmt->num_planes;
> -               pix_fmt_mp->plane_fmt[0].sizeimage =
> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> -               pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> -
> -               if (pix_fmt_mp->num_planes == 2) {
> -                       pix_fmt_mp->plane_fmt[1].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> -                       pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> -                       pix_fmt_mp->plane_fmt[1].bytesperline =
> -                                                       pix_fmt_mp->width;
> -                       pix_fmt_mp->plane_fmt[2].bytesperline = 0;
> -               } else if (pix_fmt_mp->num_planes == 3) {
> -                       pix_fmt_mp->plane_fmt[1].sizeimage =
> -                       pix_fmt_mp->plane_fmt[2].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> -                       pix_fmt_mp->plane_fmt[1].bytesperline =
> -                               pix_fmt_mp->plane_fmt[2].bytesperline =
> -                               pix_fmt_mp->width / 2;
> -               }
> +       /* find next closer width align 16, heign align 32, size align
> +        * 64 rectangle
> +        */
> +       tmp_w = pix_fmt_mp->width;
> +       tmp_h = pix_fmt_mp->height;
> +       v4l_bound_align_image(&pix_fmt_mp->width,
> +                             MTK_VENC_MIN_W,
> +                             max_width, 4,
> +                             &pix_fmt_mp->height,
> +                             MTK_VENC_MIN_H,
> +                             max_height, 5, 6);
> +
> +       if (pix_fmt_mp->width < tmp_w && (pix_fmt_mp->width + 16) <= max_width)
> +               pix_fmt_mp->width += 16;
> +       if (pix_fmt_mp->height < tmp_h && (pix_fmt_mp->height + 32) <= max_height)
> +               pix_fmt_mp->height += 32;
> +
> +       mtk_v4l2_debug(0, "before resize w=%d, h=%d, after resize w=%d, h=%d, sizeimage=%d %d",
> +                      tmp_w, tmp_h, pix_fmt_mp->width,
> +                      pix_fmt_mp->height,
> +                      pix_fmt_mp->plane_fmt[0].sizeimage,
> +                      pix_fmt_mp->plane_fmt[1].sizeimage);
> +
> +       pix_fmt_mp->num_planes = fmt->num_planes;
> +       pix_fmt_mp->plane_fmt[0].sizeimage =
> +                       pix_fmt_mp->width * pix_fmt_mp->height +
> +                       ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> +       pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> +
> +       if (pix_fmt_mp->num_planes == 2) {
> +               pix_fmt_mp->plane_fmt[1].sizeimage =
> +                       (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> +                       (ALIGN(pix_fmt_mp->width, 16) * 16);
> +               pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> +               pix_fmt_mp->plane_fmt[1].bytesperline =
> +                                               pix_fmt_mp->width;
> +               pix_fmt_mp->plane_fmt[2].bytesperline = 0;
> +       } else if (pix_fmt_mp->num_planes == 3) {
> +               pix_fmt_mp->plane_fmt[1].sizeimage =
> +               pix_fmt_mp->plane_fmt[2].sizeimage =
> +                       (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> +                       ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> +               pix_fmt_mp->plane_fmt[1].bytesperline =
> +                       pix_fmt_mp->plane_fmt[2].bytesperline =
> +                       pix_fmt_mp->width / 2;
>         }
>
>         pix_fmt_mp->flags = 0;
> @@ -432,9 +427,7 @@ static int vidioc_venc_s_fmt_cap(struct file *file, void *priv,
>         }
>
>         q_data->fmt = fmt;
> -       ret = vidioc_try_fmt(ctx, f, q_data->fmt);
> -       if (ret)
> -               return ret;
> +       vidioc_try_fmt_cap(f);
>
>         q_data->coded_width = f->fmt.pix_mp.width;
>         q_data->coded_height = f->fmt.pix_mp.height;
> @@ -494,7 +487,7 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
>                 f->fmt.pix.pixelformat = fmt->fourcc;
>         }
>
> -       ret = vidioc_try_fmt(ctx, f, fmt);
> +       ret = vidioc_try_fmt_out(ctx, f, fmt);
>         if (ret)
>                 return ret;
>
> @@ -572,7 +565,9 @@ static int vidioc_try_fmt_vid_cap_mplane(struct file *file, void *priv,
>         f->fmt.pix_mp.quantization = ctx->quantization;
>         f->fmt.pix_mp.xfer_func = ctx->xfer_func;
>
> -       return vidioc_try_fmt(ctx, f, fmt);
> +       vidioc_try_fmt_cap(f);
> +
> +       return 0;
>  }
>
>  static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
> @@ -594,7 +589,7 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
>                 f->fmt.pix_mp.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>         }
>
> -       return vidioc_try_fmt(ctx, f, fmt);
> +       return vidioc_try_fmt_out(ctx, f, fmt);
>  }
>
>  static int vidioc_venc_g_selection(struct file *file, void *priv,
> --
> 2.17.1
>
