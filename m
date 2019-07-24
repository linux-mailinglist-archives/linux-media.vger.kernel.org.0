Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9CC873206
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfGXOoq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:44:46 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43336 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGXOoq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:44:46 -0400
Received: by mail-ot1-f67.google.com with SMTP id j11so23842796otp.10
        for <linux-media@vger.kernel.org>; Wed, 24 Jul 2019 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EYTa9zTpBd0rDlVSnXXXT9+2WV+g/KiscX6irS4rcjo=;
        b=gOWmqGcGE3Swkwb4SBpZgTQqo4lPf/4G7a6/58k9LIYQRwoEOmYoAEmwcaapvhCRrE
         CumCNaeRKgQ0RYOlEVdLvPEzJx1S2z+3gCriQqqCAPTN2rZDl+aMBDidF989VGwSeYc5
         bvPRO0lLumcT5xyZdW2El9oQnI7R5Pe2KfFJOP/HpN9C8SLodriliPyEUK6UPP6x3Khe
         ahr7bBoHufHYpM80sE1MwqDuwc7C5x7lTwf1GknAXjI4Tfxd7acHEtWYBFATj9abekuj
         YUfTsyKbiTd+WmvUZKIb1wSX4dRYd6ZhRx4UnENmetyDhqBip0kJPVrRY3U4eB9JT7Rs
         4acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EYTa9zTpBd0rDlVSnXXXT9+2WV+g/KiscX6irS4rcjo=;
        b=ISsMJvtfByVMZa8sIAVmYaVWQ6Qo28XUqQB6qsy3eI6Et0qG2bb7nCwdjJtqKnXmy+
         SfXa5tKVLkmcje1QVRbcYCWgzU42r4iYtKiKiAZPRn7wXXEeSgw6gIujAWFlweRjyuPF
         ImjC8mz1Yt8PIOQqvf5kOE6p/Un6B7H+/6qrBYyTPBeIiuFiMVuYLPPa4gsB43FXYgaD
         BCy6STkvqegOV1K6dT1tSKNplx1PabNlvtKf5VjIIFOncWmobPDBjM/rqBLLpns3H7oB
         tAFv9aQDnT8N3YnnbYS5AFRKzC1Kq2s8XyKtRuPH2ZOlloJ65t2Ke3/UA55ksImvONxe
         tYoQ==
X-Gm-Message-State: APjAAAUQfRmkEkMEA/UE7jtZf6CRlogeQSC/zXiUBkTiV+tPaBZeCsU1
        xHppxYHmcV0cF6Sjvvyd5OStld3D//ym37C6hz5p5FSxASw=
X-Google-Smtp-Source: APXvYqzk2zPYnj6usmQu3SCkvrsmH9zgveyPbVxMDCNC3wYRqDdw7doxSYPNwm2JLTWKpXm/rarz3Nb6spfurhn66zg=
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr63367471otc.44.1563979485142;
 Wed, 24 Jul 2019 07:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <050788b0-d4a6-2c05-333a-edfb95b90a4b@xs4all.nl>
In-Reply-To: <050788b0-d4a6-2c05-333a-edfb95b90a4b@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 24 Jul 2019 15:44:18 +0100
Message-ID: <CA+V-a8uh7HCzatQBBD-ksxhfQXz7XL_ZTkAFRqNnsEZC3uh-Sg@mail.gmail.com>
Subject: Re: [PATCH] davinci/vpfe_capture.c: drop unused format descriptions
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Jul 23, 2019 at 1:58 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Simplify vpfe_pixel_format to just contain the pixelformat and bpp fields.
> All others are unused.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Regards,
--Prabhakar Lad

> index 852fc357e19d..916ed743d716 100644
> --- a/drivers/media/platform/davinci/vpfe_capture.c
> +++ b/drivers/media/platform/davinci/vpfe_capture.c
> @@ -119,57 +119,27 @@ static const struct vpfe_standard vpfe_standards[] = {
>  /* Used when raw Bayer image from ccdc is directly captured to SDRAM */
>  static const struct vpfe_pixel_format vpfe_pix_fmts[] = {
>         {
> -               .fmtdesc = {
> -                       .index = 0,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "Bayer GrRBGb 8bit A-Law compr.",
> -                       .pixelformat = V4L2_PIX_FMT_SBGGR8,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_SBGGR8,
>                 .bpp = 1,
>         },
>         {
> -               .fmtdesc = {
> -                       .index = 1,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "Bayer GrRBGb - 16bit",
> -                       .pixelformat = V4L2_PIX_FMT_SBGGR16,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_SBGGR16,
>                 .bpp = 2,
>         },
>         {
> -               .fmtdesc = {
> -                       .index = 2,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "Bayer GrRBGb 8bit DPCM compr.",
> -                       .pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_SGRBG10DPCM8,
>                 .bpp = 1,
>         },
>         {
> -               .fmtdesc = {
> -                       .index = 3,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "YCbCr 4:2:2 Interleaved UYVY",
> -                       .pixelformat = V4L2_PIX_FMT_UYVY,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_UYVY,
>                 .bpp = 2,
>         },
>         {
> -               .fmtdesc = {
> -                       .index = 4,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "YCbCr 4:2:2 Interleaved YUYV",
> -                       .pixelformat = V4L2_PIX_FMT_YUYV,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_YUYV,
>                 .bpp = 2,
>         },
>         {
> -               .fmtdesc = {
> -                       .index = 5,
> -                       .type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -                       .description = "Y/CbCr 4:2:0 - Semi planar",
> -                       .pixelformat = V4L2_PIX_FMT_NV12,
> -               },
> +               .pixelformat = V4L2_PIX_FMT_NV12,
>                 .bpp = 1,
>         },
>  };
> @@ -183,7 +153,7 @@ static const struct vpfe_pixel_format *vpfe_lookup_pix_format(u32 pix_format)
>         int i;
>
>         for (i = 0; i < ARRAY_SIZE(vpfe_pix_fmts); i++) {
> -               if (pix_format == vpfe_pix_fmts[i].fmtdesc.pixelformat)
> +               if (pix_format == vpfe_pix_fmts[i].pixelformat)
>                         return &vpfe_pix_fmts[i];
>         }
>         return NULL;
> @@ -782,7 +752,7 @@ static const struct vpfe_pixel_format *
>         temp = 0;
>         found = 0;
>         while (ccdc_dev->hw_ops.enum_pix(&pix, temp) >= 0) {
> -               if (vpfe_pix_fmt->fmtdesc.pixelformat == pix) {
> +               if (vpfe_pix_fmt->pixelformat == pix) {
>                         found = 1;
>                         break;
>                 }
> @@ -899,7 +869,6 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
>  {
>         struct vpfe_device *vpfe_dev = video_drvdata(file);
>         const struct vpfe_pixel_format *pix_fmt;
> -       int temp_index;
>         u32 pix;
>
>         v4l2_dbg(1, debug, &vpfe_dev->v4l2_dev, "vpfe_enum_fmt_vid_cap\n");
> @@ -910,9 +879,7 @@ static int vpfe_enum_fmt_vid_cap(struct file *file, void  *priv,
>         /* Fill in the information about format */
>         pix_fmt = vpfe_lookup_pix_format(pix);
>         if (pix_fmt) {
> -               temp_index = fmt->index;
> -               *fmt = pix_fmt->fmtdesc;
> -               fmt->index = temp_index;
> +               fmt->pixelformat = fmt->pixelformat;
>                 return 0;
>         }
>         return -EINVAL;
> diff --git a/include/media/davinci/vpfe_capture.h b/include/media/davinci/vpfe_capture.h
> index 2c5b3eacf527..4ad53031e2f7 100644
> --- a/include/media/davinci/vpfe_capture.h
> +++ b/include/media/davinci/vpfe_capture.h
> @@ -32,7 +32,7 @@
>  #define CAPTURE_DRV_NAME               "vpfe-capture"
>
>  struct vpfe_pixel_format {
> -       struct v4l2_fmtdesc fmtdesc;
> +       u32 pixelformat;
>         /* bytes per pixel */
>         int bpp;
>  };
>
