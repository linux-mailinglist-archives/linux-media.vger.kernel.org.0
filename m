Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9C78E5F6
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 10:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbfHOIMU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 04:12:20 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44259 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfHOIMU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 04:12:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id w4so4119571ote.11
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xpaG+xC9+eTVxuVsh3kiCnDFWmLYVk0lsMMmwvLclvA=;
        b=QKaUxUVGT5ukAklbumD6jcHNGzhB6GlBAHDreZF5IT0Cdn2vCDI+ehemrkiU+6VAiX
         K2FMNI83KOGIHT7GciktBeeSrgig4CYlJ/BObJ/tn8SaEN1EKAl1X8f2We5TK9qg3N5G
         SxhEoCt+kyjQByQL0lnZ9R9+tK0fopWU2Megs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xpaG+xC9+eTVxuVsh3kiCnDFWmLYVk0lsMMmwvLclvA=;
        b=jod5iq84qDYxKDGdw2uSfzN3s6mrZf9MULlN5UQhIpBsneLiud/VfcH6gdnGt6FoK0
         1yFHWrjtwpGGQn7bqXRi2dhp/xqCePhOjUe1Jnyz0a33YFgav2RA4rZIJRYCSabQ1A/I
         xWkspbCbtovcKzTvN/csK+O2mSJ53jBI5BsYXNYjaruJkJz1avBdjr6+5+XYPSbVWuV5
         zt8H71wwlBF/IhxKO8RFVyMRs/oc4E0RUsji4k/ELdWZ4vn4Pxy+4vPITw1Mjx6xFUg5
         f0IHZlEml0qaezQn6tfoDNWQFw9uINm6LW+Qb/Li+80rYouf6lXvGoMuSEfgsscIrwZN
         ROJw==
X-Gm-Message-State: APjAAAUXuf7uyUyH6QPj1wy2xYInOOqHI9Lvu0isGh4lALTojUgFbHac
        1AhV1YmSPbw6mW7sxwA5vmQ4TZMAkUc=
X-Google-Smtp-Source: APXvYqwQD7pIX7gY+vyWxiDT41ORh12GgJFtoklKcuT7G8Q1ibbxqermL9Jq+jRtazzSuFxYAIRjmQ==
X-Received: by 2002:a9d:7643:: with SMTP id o3mr2749063otl.49.1565856738716;
        Thu, 15 Aug 2019 01:12:18 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 13sm841228otv.14.2019.08.15.01.12.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 01:12:18 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id p124so952089oig.5
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 01:12:17 -0700 (PDT)
X-Received: by 2002:aca:f057:: with SMTP id o84mr828689oih.71.1565856737264;
 Thu, 15 Aug 2019 01:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190812110513.23774-1-hverkuil-cisco@xs4all.nl> <20190812110513.23774-6-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190812110513.23774-6-hverkuil-cisco@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 15 Aug 2019 17:12:05 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUiZTKk2R2twAdDfb=O+Js9zKUCyO9B8v-NipfCDDHeUg@mail.gmail.com>
Message-ID: <CAPBb6MUiZTKk2R2twAdDfb=O+Js9zKUCyO9B8v-NipfCDDHeUg@mail.gmail.com>
Subject: Re: [PATCHv2 05/12] media: mtk-vcodec: flag OUTPUT formats with V4L2_FMT_FLAG_DYN_RESOLUTION
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Jourdan <mjourdan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 12, 2019 at 8:06 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> From: Maxime Jourdan <mjourdan@baylibre.com>
>
> Tag all the coded formats where the mtk-vcodec decoder supports dynamic
> resolution switching.
>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

From our use of this driver in Chrome this seems to be correct.

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 4 ++++
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 90d1a67db7e5..26a55c3e807e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -29,16 +29,19 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
>                 .fourcc = V4L2_PIX_FMT_H264,
>                 .type = MTK_FMT_DEC,
>                 .num_planes = 1,
> +               .flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc = V4L2_PIX_FMT_VP8,
>                 .type = MTK_FMT_DEC,
>                 .num_planes = 1,
> +               .flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc = V4L2_PIX_FMT_VP9,
>                 .type = MTK_FMT_DEC,
>                 .num_planes = 1,
> +               .flags = V4L2_FMT_FLAG_DYN_RESOLUTION,
>         },
>         {
>                 .fourcc = V4L2_PIX_FMT_MT21C,
> @@ -948,6 +951,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, bool output_queue)
>
>         fmt = &mtk_video_formats[i];
>         f->pixelformat = fmt->fourcc;
> +       f->flags = fmt->flags;
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index c95de5d08dda..9fd56dee7fd1 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -99,6 +99,7 @@ struct mtk_video_fmt {
>         u32     fourcc;
>         enum mtk_fmt_type       type;
>         u32     num_planes;
> +       u32     flags;
>  };
>
>  /**
> --
> 2.20.1
>
