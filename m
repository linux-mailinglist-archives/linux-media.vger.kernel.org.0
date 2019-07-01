Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 697565B5CC
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2019 09:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfGAHl2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Jul 2019 03:41:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45747 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGAHl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Jul 2019 03:41:28 -0400
Received: by mail-ot1-f66.google.com with SMTP id x21so12477415otq.12
        for <linux-media@vger.kernel.org>; Mon, 01 Jul 2019 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v3oIq3dDtzEVDxgD3/B8bX9oppYaRumwIgjjoGY5ycU=;
        b=bZFB3ATA4rylZbQ1aDPPY/gg+UgCokevRUTf5RGBxBCylgyH0NI1MZB6co/YoG/MlA
         trrWqRQ+fMKfZhsX3d4dlFUDYfEAy43J2woN0UGF4Sj4rTavLfFrVa7Ts4lHX2RRJQuH
         /+yzu5lSbdk4e1u7IO5auCBhv5DXGtPOdLcQ/cVR+pZQzqPb4iRTf5Tmtz7ywu9HJkeH
         L4kL04FaUaR5WuYyWrdT+NF46Kyjzk7jjBj84ckJcXghlT8QBaB27S436b6ot17yhBJI
         yZkEIGTCd8mbzVJCFgWKZ67fynwqrlhP9d7BP5uLCHMsRKBnUsIsiRcfPK5hXE7lYsjb
         rSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v3oIq3dDtzEVDxgD3/B8bX9oppYaRumwIgjjoGY5ycU=;
        b=E9zLMuxxNCiQS1OcxuTZTOO4c9PPny8riuZresSI7ojgxGLY34paU00Q5IoEM+ben3
         60Z0qAweQluH1r9qupGr3/dANbABb9HDXLZonh0g37nYRPsGjVpsewW+7z7SQ1xl4zGm
         d5AXA8w+tGOwwQBALB4+6Wq8W3Z7mvpcUe0D0wnrSGdCLFeSZOXAGuUGkcwxb1DiYlFi
         ZX1eBBjkNAa2m8AZe1Cx4f8Lh+X7VhxrJQGYhu5uqNX/w6+xswUeIY0mRj6Hb46wT0eS
         cWuj8TvoWDC1yrOusDvZjQkX1s2RX3kIt2aGffAynURQJJFZHx9L6hlGv4aW+RiaOzJd
         mNcQ==
X-Gm-Message-State: APjAAAWOIO+/tK/9tnb8XMWaTKcV938VRewjW1RjFZUpqbXRQgsVZwKO
        7hOmOMkMRblnEpQb4Wy/L2FEO/taIFnuYpIjzFk=
X-Google-Smtp-Source: APXvYqw3Uo59CDyE66j4PbX7k5L125xpMJXBSb1jL1pT+TuS+I6UEFKO8m3oIwYXXPZxO1o2yjaOV+587jYQW1OWJWs=
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr19521979otc.44.1561966885244;
 Mon, 01 Jul 2019 00:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190626112748.31730-1-hverkuil-cisco@xs4all.nl> <20190626112748.31730-6-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190626112748.31730-6-hverkuil-cisco@xs4all.nl>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 1 Jul 2019 08:40:58 +0100
Message-ID: <CA+V-a8sLHndhKh=qtncj9AhEa87o8WisOiypSEjgCSZkwX-TSQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] media/platform: don't set description in ENUM_FMT
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Benoit Parrot <bparrot@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,


Thank you for the patch.

On Wed, Jun 26, 2019 at 12:27 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> The V4L2 core sets the format description and flags for the driver in order
> to ensure consistent naming.
>
> So drop the strscpy of the description in drivers. Also remove any
> description strings in driver-internal structures since those are
> no longer needed.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Jacopo Mondi <jacopo@jmondi.org>
> Cc: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/platform/am437x/am437x-vpfe.c   | 18 ++-----------
>  drivers/media/platform/davinci/vpbe_display.c | 14 ++--------
>  drivers/media/platform/davinci/vpif_capture.c | 11 ++------
>  drivers/media/platform/davinci/vpif_display.c |  4 ---

For the above,

Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar Lad

>  drivers/media/platform/exynos-gsc/gsc-core.c  | 22 ---------------
>  drivers/media/platform/exynos-gsc/gsc-core.h  |  2 --
>  .../media/platform/exynos4-is/fimc-capture.c  |  3 ---
>  drivers/media/platform/exynos4-is/fimc-core.c | 20 --------------
>  .../platform/exynos4-is/fimc-isp-video.c      |  1 -
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  3 ---
>  drivers/media/platform/exynos4-is/fimc-lite.c |  8 ------
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  1 -
>  drivers/media/platform/m2m-deinterlace.c      |  4 ---
>  .../media/platform/marvell-ccic/mcam-core.c   | 10 -------
>  drivers/media/platform/mx2_emmaprp.c          |  4 ---
>  drivers/media/platform/omap/omap_vout.c       |  7 -----
>  .../media/platform/s3c-camif/camif-capture.c  | 11 +++-----
>  drivers/media/platform/s3c-camif/camif-core.c |  6 -----
>  drivers/media/platform/s3c-camif/camif-core.h |  1 -
>  drivers/media/platform/s5p-g2d/g2d.c          |  6 -----
>  drivers/media/platform/s5p-g2d/g2d.h          |  1 -
>  drivers/media/platform/s5p-jpeg/jpeg-core.c   | 27 -------------------
>  drivers/media/platform/s5p-jpeg/jpeg-core.h   |  2 --
>  .../media/platform/s5p-mfc/s5p_mfc_common.h   |  1 -
>  drivers/media/platform/s5p-mfc/s5p_mfc_dec.c  | 15 -----------
>  drivers/media/platform/s5p-mfc/s5p_mfc_enc.c  | 10 -------
>  drivers/media/platform/sh_veu.c               | 19 ++++++-------
>  drivers/media/platform/sh_vou.c               | 12 ++-------
>  drivers/media/platform/ti-vpe/vpe.c           | 12 ---------
>  drivers/media/platform/via-camera.c           |  4 ---
>  drivers/media/platform/xilinx/xilinx-dma.c    |  2 --
>  drivers/media/platform/xilinx/xilinx-vip.c    | 16 +++++------
>  drivers/media/platform/xilinx/xilinx-vip.h    |  2 --
>  include/media/drv-intf/exynos-fimc.h          |  2 --
>  34 files changed, 28 insertions(+), 253 deletions(-)
>
> diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
> index fe7b937eb5f2..7582c26f8459 100644
> --- a/drivers/media/platform/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/am437x/am437x-vpfe.c
> @@ -76,7 +76,6 @@ struct bus_format {
>
>  /*
>   * struct vpfe_fmt - VPFE media bus format information
> - * @name: V4L2 format description
>   * @code: V4L2 media bus format code
>   * @shifted: V4L2 media bus format code for the same pixel layout but
>   *     shifted to be 8 bits per pixel. =0 if format is not shiftable.
> @@ -86,7 +85,6 @@ struct bus_format {
>   * @supported: Indicates format supported by subdev
>   */
>  struct vpfe_fmt {
> -       const char *name;
>         u32 fourcc;
>         u32 code;
>         struct bus_format l;
> @@ -97,7 +95,6 @@ struct vpfe_fmt {
>
>  static struct vpfe_fmt formats[] = {
>         {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .code           = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .l.width        = 10,
> @@ -106,7 +103,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 2,
>                 .supported      = false,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CbYCrY",
>                 .fourcc         = V4L2_PIX_FMT_UYVY,
>                 .code           = MEDIA_BUS_FMT_UYVY8_2X8,
>                 .l.width        = 10,
> @@ -115,7 +111,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 2,
>                 .supported      = false,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_YVYU,
>                 .code           = MEDIA_BUS_FMT_YVYU8_2X8,
>                 .l.width        = 10,
> @@ -124,7 +119,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 2,
>                 .supported      = false,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CrYCbY",
>                 .fourcc         = V4L2_PIX_FMT_VYUY,
>                 .code           = MEDIA_BUS_FMT_VYUY8_2X8,
>                 .l.width        = 10,
> @@ -133,7 +127,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 2,
>                 .supported      = false,
>         }, {
> -               .name           = "RAW8 BGGR",
>                 .fourcc         = V4L2_PIX_FMT_SBGGR8,
>                 .code           = MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .l.width        = 10,
> @@ -142,7 +135,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 1,
>                 .supported      = false,
>         }, {
> -               .name           = "RAW8 GBRG",
>                 .fourcc         = V4L2_PIX_FMT_SGBRG8,
>                 .code           = MEDIA_BUS_FMT_SGBRG8_1X8,
>                 .l.width        = 10,
> @@ -151,7 +143,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 1,
>                 .supported      = false,
>         }, {
> -               .name           = "RAW8 GRBG",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG8,
>                 .code           = MEDIA_BUS_FMT_SGRBG8_1X8,
>                 .l.width        = 10,
> @@ -160,7 +151,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 1,
>                 .supported      = false,
>         }, {
> -               .name           = "RAW8 RGGB",
>                 .fourcc         = V4L2_PIX_FMT_SRGGB8,
>                 .code           = MEDIA_BUS_FMT_SRGGB8_1X8,
>                 .l.width        = 10,
> @@ -169,7 +159,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 1,
>                 .supported      = false,
>         }, {
> -               .name           = "RGB565 (LE)",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .code           = MEDIA_BUS_FMT_RGB565_2X8_LE,
>                 .l.width        = 10,
> @@ -178,7 +167,6 @@ static struct vpfe_fmt formats[] = {
>                 .s.bpp          = 2,
>                 .supported      = false,
>         }, {
> -               .name           = "RGB565 (BE)",
>                 .fourcc         = V4L2_PIX_FMT_RGB565X,
>                 .code           = MEDIA_BUS_FMT_RGB565_2X8_BE,
>                 .l.width        = 10,
> @@ -1540,12 +1528,10 @@ static int vpfe_enum_fmt(struct file *file, void  *priv,
>         if (!fmt)
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
> -       f->type = vpfe->fmt.type;
>
> -       vpfe_dbg(1, vpfe, "vpfe_enum_format: mbus index: %d code: %x pixelformat: %s [%s]\n",
> -               f->index, fmt->code, print_fourcc(fmt->fourcc), fmt->name);
> +       vpfe_dbg(1, vpfe, "vpfe_enum_format: mbus index: %d code: %x pixelformat: %s\n",
> +                f->index, fmt->code, print_fourcc(fmt->fourcc));
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
> index 000b191c42d8..ed10a9bbf96b 100644
> --- a/drivers/media/platform/davinci/vpbe_display.c
> +++ b/drivers/media/platform/davinci/vpbe_display.c
> @@ -792,7 +792,6 @@ static int vpbe_display_enum_fmt(struct file *file, void  *priv,
>  {
>         struct vpbe_layer *layer = video_drvdata(file);
>         struct vpbe_device *vpbe_dev = layer->disp_dev->vpbe_dev;
> -       unsigned int index = 0;
>
>         v4l2_dbg(1, debug, &vpbe_dev->v4l2_dev,
>                                 "VIDIOC_ENUM_FMT, layer id = %d\n",
> @@ -803,19 +802,10 @@ static int vpbe_display_enum_fmt(struct file *file, void  *priv,
>         }
>
>         /* Fill in the information about format */
> -       index = fmt->index;
> -       memset(fmt, 0, sizeof(*fmt));
> -       fmt->index = index;
> -       fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       if (index == 0) {
> -               strscpy(fmt->description, "YUV 4:2:2 - UYVY",
> -                       sizeof(fmt->description));
> +       if (fmt->index == 0)
>                 fmt->pixelformat = V4L2_PIX_FMT_UYVY;
> -       } else {
> -               strscpy(fmt->description, "Y/CbCr 4:2:0",
> -                       sizeof(fmt->description));
> +       else
>                 fmt->pixelformat = V4L2_PIX_FMT_NV12;
> -       }
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index f0f7ef638c56..621d28470d2b 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -938,17 +938,10 @@ static int vpif_enum_fmt_vid_cap(struct file *file, void  *priv,
>         }
>
>         /* Fill in the information about format */
> -       if (ch->vpifparams.iface.if_type == VPIF_IF_RAW_BAYER) {
> -               fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -               strscpy(fmt->description, "Raw Mode -Bayer Pattern GrRBGb",
> -                       sizeof(fmt->description));
> +       if (ch->vpifparams.iface.if_type == VPIF_IF_RAW_BAYER)
>                 fmt->pixelformat = V4L2_PIX_FMT_SBGGR8;
> -       } else {
> -               fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> -               strscpy(fmt->description, "YCbCr4:2:2 Semi-Planar",
> -                       sizeof(fmt->description));
> +       else
>                 fmt->pixelformat = V4L2_PIX_FMT_NV16;
> -       }
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> index a69897c68a50..be32f87001cd 100644
> --- a/drivers/media/platform/davinci/vpif_display.c
> +++ b/drivers/media/platform/davinci/vpif_display.c
> @@ -601,11 +601,7 @@ static int vpif_enum_fmt_vid_out(struct file *file, void  *priv,
>                 return -EINVAL;
>
>         /* Fill in the information about format */
> -       fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       strscpy(fmt->description, "YCbCr4:2:2 YC Planar",
> -               sizeof(fmt->description));
>         fmt->pixelformat = V4L2_PIX_FMT_YUV422P;
> -       fmt->flags = 0;
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.c b/drivers/media/platform/exynos-gsc/gsc-core.c
> index 854869f0024e..f6650b45bc3d 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.c
> @@ -27,21 +27,18 @@
>
>  static const struct gsc_fmt gsc_formats[] = {
>         {
> -               .name           = "RGB565",
>                 .pixelformat    = V4L2_PIX_FMT_RGB565X,
>                 .depth          = { 16 },
>                 .color          = GSC_RGB,
>                 .num_planes     = 1,
>                 .num_comp       = 1,
>         }, {
> -               .name           = "BGRX-8-8-8-8, 32 bpp",
>                 .pixelformat    = V4L2_PIX_FMT_BGR32,
>                 .depth          = { 32 },
>                 .color          = GSC_RGB,
>                 .num_planes     = 1,
>                 .num_comp       = 1,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .pixelformat    = V4L2_PIX_FMT_YUYV,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -51,7 +48,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_comp       = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CbYCrY",
>                 .pixelformat    = V4L2_PIX_FMT_UYVY,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -61,7 +57,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_comp       = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CrYCbY",
>                 .pixelformat    = V4L2_PIX_FMT_VYUY,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -71,7 +66,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_comp       = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .pixelformat    = V4L2_PIX_FMT_YVYU,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -81,7 +75,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_comp       = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
>         }, {
> -               .name           = "YUV 4:4:4 planar, YCbYCr",
>                 .pixelformat    = V4L2_PIX_FMT_YUV32,
>                 .depth          = { 32 },
>                 .color          = GSC_YUV444,
> @@ -90,7 +83,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 1,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/Cb/Cr",
>                 .pixelformat    = V4L2_PIX_FMT_YUV422P,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -99,7 +91,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 3,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/CbCr",
>                 .pixelformat    = V4L2_PIX_FMT_NV16,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -108,7 +99,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:2 non-contig, Y/CbCr",
>                 .pixelformat    = V4L2_PIX_FMT_NV16M,
>                 .depth          = { 8, 8 },
>                 .color          = GSC_YUV422,
> @@ -117,7 +107,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 2,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/CrCb",
>                 .pixelformat    = V4L2_PIX_FMT_NV61,
>                 .depth          = { 16 },
>                 .color          = GSC_YUV422,
> @@ -126,7 +115,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:2 non-contig, Y/CrCb",
>                 .pixelformat    = V4L2_PIX_FMT_NV61M,
>                 .depth          = { 8, 8 },
>                 .color          = GSC_YUV422,
> @@ -135,7 +123,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 2,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:0 planar, YCbCr",
>                 .pixelformat    = V4L2_PIX_FMT_YUV420,
>                 .depth          = { 12 },
>                 .color          = GSC_YUV420,
> @@ -144,7 +131,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 3,
>         }, {
> -               .name           = "YUV 4:2:0 planar, YCrCb",
>                 .pixelformat    = V4L2_PIX_FMT_YVU420,
>                 .depth          = { 12 },
>                 .color          = GSC_YUV420,
> @@ -154,7 +140,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_comp       = 3,
>
>         }, {
> -               .name           = "YUV 4:2:0 planar, Y/CbCr",
>                 .pixelformat    = V4L2_PIX_FMT_NV12,
>                 .depth          = { 12 },
>                 .color          = GSC_YUV420,
> @@ -163,7 +148,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:0 planar, Y/CrCb",
>                 .pixelformat    = V4L2_PIX_FMT_NV21,
>                 .depth          = { 12 },
>                 .color          = GSC_YUV420,
> @@ -172,7 +156,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 1,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 2p, Y/CrCb",
>                 .pixelformat    = V4L2_PIX_FMT_NV21M,
>                 .depth          = { 8, 4 },
>                 .color          = GSC_YUV420,
> @@ -181,7 +164,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 2,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 2p, Y/CbCr",
>                 .pixelformat    = V4L2_PIX_FMT_NV12M,
>                 .depth          = { 8, 4 },
>                 .color          = GSC_YUV420,
> @@ -190,7 +172,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 2,
>                 .num_comp       = 2,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 3p, Y/Cb/Cr",
>                 .pixelformat    = V4L2_PIX_FMT_YUV420M,
>                 .depth          = { 8, 2, 2 },
>                 .color          = GSC_YUV420,
> @@ -199,7 +180,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 3,
>                 .num_comp       = 3,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 3p, Y/Cr/Cb",
>                 .pixelformat    = V4L2_PIX_FMT_YVU420M,
>                 .depth          = { 8, 2, 2 },
>                 .color          = GSC_YUV420,
> @@ -208,7 +188,6 @@ static const struct gsc_fmt gsc_formats[] = {
>                 .num_planes     = 3,
>                 .num_comp       = 3,
>         }, {
> -               .name           = "YUV 4:2:0 n.c. 2p, Y/CbCr tiled",
>                 .pixelformat    = V4L2_PIX_FMT_NV12MT_16X16,
>                 .depth          = { 8, 4 },
>                 .color          = GSC_YUV420,
> @@ -335,7 +314,6 @@ int gsc_enum_fmt(struct v4l2_fmtdesc *f)
>         if (!fmt)
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->pixelformat;
>
>         return 0;
> diff --git a/drivers/media/platform/exynos-gsc/gsc-core.h b/drivers/media/platform/exynos-gsc/gsc-core.h
> index 8ea49ca004fd..0e114f114c24 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-core.h
> +++ b/drivers/media/platform/exynos-gsc/gsc-core.h
> @@ -105,7 +105,6 @@ enum gsc_yuv_fmt {
>  /**
>   * struct gsc_fmt - the driver's internal color format data
>   * @mbus_code: Media Bus pixel code, -1 if not applicable
> - * @name: format description
>   * @pixelformat: the fourcc code for this format, 0 if not applicable
>   * @yorder: Y/C order
>   * @corder: Chrominance order control
> @@ -116,7 +115,6 @@ enum gsc_yuv_fmt {
>   */
>  struct gsc_fmt {
>         u32 mbus_code;
> -       char    *name;
>         u32     pixelformat;
>         u32     color;
>         u32     yorder;
> diff --git a/drivers/media/platform/exynos4-is/fimc-capture.c b/drivers/media/platform/exynos4-is/fimc-capture.c
> index 84b91e248c5a..ab91e8e0b41c 100644
> --- a/drivers/media/platform/exynos4-is/fimc-capture.c
> +++ b/drivers/media/platform/exynos4-is/fimc-capture.c
> @@ -741,10 +741,7 @@ static int fimc_cap_enum_fmt(struct file *file, void *priv,
>                                f->index);
>         if (!fmt)
>                 return -EINVAL;
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
> -       if (fmt->fourcc == MEDIA_BUS_FMT_JPEG_1X8)
> -               f->flags |= V4L2_FMT_FLAG_COMPRESSED;
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/exynos4-is/fimc-core.c b/drivers/media/platform/exynos4-is/fimc-core.c
> index 7006f54bfee2..cde60fbb23a8 100644
> --- a/drivers/media/platform/exynos4-is/fimc-core.c
> +++ b/drivers/media/platform/exynos4-is/fimc-core.c
> @@ -36,7 +36,6 @@ static char *fimc_clocks[MAX_FIMC_CLOCKS] = {
>
>  static struct fimc_fmt fimc_formats[] = {
>         {
> -               .name           = "RGB565",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_RGB565,
> @@ -44,7 +43,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 1,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "BGR666",
>                 .fourcc         = V4L2_PIX_FMT_BGR666,
>                 .depth          = { 32 },
>                 .color          = FIMC_FMT_RGB666,
> @@ -52,7 +50,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 1,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "BGRA8888, 32 bpp",
>                 .fourcc         = V4L2_PIX_FMT_BGR32,
>                 .depth          = { 32 },
>                 .color          = FIMC_FMT_RGB888,
> @@ -60,7 +57,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 1,
>                 .flags          = FMT_FLAGS_M2M | FMT_HAS_ALPHA,
>         }, {
> -               .name           = "ARGB1555",
>                 .fourcc         = V4L2_PIX_FMT_RGB555,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_RGB555,
> @@ -68,7 +64,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 1,
>                 .flags          = FMT_FLAGS_M2M_OUT | FMT_HAS_ALPHA,
>         }, {
> -               .name           = "ARGB4444",
>                 .fourcc         = V4L2_PIX_FMT_RGB444,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_RGB444,
> @@ -76,11 +71,9 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 1,
>                 .flags          = FMT_FLAGS_M2M_OUT | FMT_HAS_ALPHA,
>         }, {
> -               .name           = "YUV 4:4:4",
>                 .mbus_code      = MEDIA_BUS_FMT_YUV10_1X30,
>                 .flags          = FMT_FLAGS_WRITEBACK,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_YCBYCR422,
> @@ -89,7 +82,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .flags          = FMT_FLAGS_M2M | FMT_FLAGS_CAM,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CbYCrY",
>                 .fourcc         = V4L2_PIX_FMT_UYVY,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_CBYCRY422,
> @@ -98,7 +90,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
>                 .flags          = FMT_FLAGS_M2M | FMT_FLAGS_CAM,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CrYCbY",
>                 .fourcc         = V4L2_PIX_FMT_VYUY,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_CRYCBY422,
> @@ -107,7 +98,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
>                 .flags          = FMT_FLAGS_M2M | FMT_FLAGS_CAM,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_YVYU,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_YCRYCB422,
> @@ -116,7 +106,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
>                 .flags          = FMT_FLAGS_M2M | FMT_FLAGS_CAM,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV422P,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_YCBYCR422,
> @@ -124,7 +113,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 3,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV16,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_YCBYCR422,
> @@ -132,7 +120,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 2,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:2 planar, Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV61,
>                 .depth          = { 16 },
>                 .color          = FIMC_FMT_YCRYCB422,
> @@ -140,7 +127,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 2,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:0 planar, YCbCr",
>                 .fourcc         = V4L2_PIX_FMT_YUV420,
>                 .depth          = { 12 },
>                 .color          = FIMC_FMT_YCBCR420,
> @@ -148,7 +134,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 3,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:0 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12,
>                 .depth          = { 12 },
>                 .color          = FIMC_FMT_YCBCR420,
> @@ -156,7 +141,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 2,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 2p, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12M,
>                 .color          = FIMC_FMT_YCBCR420,
>                 .depth          = { 8, 4 },
> @@ -164,7 +148,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 2,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 3p, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV420M,
>                 .color          = FIMC_FMT_YCBCR420,
>                 .depth          = { 8, 2, 2 },
> @@ -172,7 +155,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 3,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "YUV 4:2:0 non-contig. 2p, tiled",
>                 .fourcc         = V4L2_PIX_FMT_NV12MT,
>                 .color          = FIMC_FMT_YCBCR420,
>                 .depth          = { 8, 4 },
> @@ -180,7 +162,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .colplanes      = 2,
>                 .flags          = FMT_FLAGS_M2M,
>         }, {
> -               .name           = "JPEG encoded data",
>                 .fourcc         = V4L2_PIX_FMT_JPEG,
>                 .color          = FIMC_FMT_JPEG,
>                 .depth          = { 8 },
> @@ -189,7 +170,6 @@ static struct fimc_fmt fimc_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_JPEG_1X8,
>                 .flags          = FMT_FLAGS_CAM | FMT_FLAGS_COMPRESSED,
>         }, {
> -               .name           = "S5C73MX interleaved UYVY/JPEG",
>                 .fourcc         = V4L2_PIX_FMT_S5C_UYVY_JPG,
>                 .color          = FIMC_FMT_YUYV_JPEG,
>                 .depth          = { 8 },
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> index 2226a13ac89b..ec7a97e7582d 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
> @@ -365,7 +365,6 @@ static int isp_video_enum_fmt(struct file *file, void *priv,
>         if (WARN_ON(fmt == NULL))
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
>
>         return 0;
> diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
> index 9a48c0f69320..dfb8285e4f0b 100644
> --- a/drivers/media/platform/exynos4-is/fimc-isp.c
> +++ b/drivers/media/platform/exynos4-is/fimc-isp.c
> @@ -36,21 +36,18 @@ module_param_named(debug_isp, fimc_isp_debug, int, S_IRUGO | S_IWUSR);
>
>  static const struct fimc_fmt fimc_isp_formats[FIMC_ISP_NUM_FORMATS] = {
>         {
> -               .name           = "RAW8 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG8,
>                 .depth          = { 8 },
>                 .color          = FIMC_FMT_RAW8,
>                 .memplanes      = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_SGRBG8_1X8,
>         }, {
> -               .name           = "RAW10 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG10,
>                 .depth          = { 10 },
>                 .color          = FIMC_FMT_RAW10,
>                 .memplanes      = 1,
>                 .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
>         }, {
> -               .name           = "RAW12 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG12,
>                 .depth          = { 12 },
>                 .color          = FIMC_FMT_RAW12,
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index e71342756d88..91580b59e972 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -42,7 +42,6 @@ module_param(debug, int, 0644);
>
>  static const struct fimc_fmt fimc_lite_formats[] = {
>         {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .colorspace     = V4L2_COLORSPACE_JPEG,
>                 .depth          = { 16 },
> @@ -51,7 +50,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .flags          = FMT_FLAGS_YUV,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CbYCrY",
>                 .fourcc         = V4L2_PIX_FMT_UYVY,
>                 .colorspace     = V4L2_COLORSPACE_JPEG,
>                 .depth          = { 16 },
> @@ -60,7 +58,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_UYVY8_2X8,
>                 .flags          = FMT_FLAGS_YUV,
>         }, {
> -               .name           = "YUV 4:2:2 packed, CrYCbY",
>                 .fourcc         = V4L2_PIX_FMT_VYUY,
>                 .colorspace     = V4L2_COLORSPACE_JPEG,
>                 .depth          = { 16 },
> @@ -69,7 +66,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_VYUY8_2X8,
>                 .flags          = FMT_FLAGS_YUV,
>         }, {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_YVYU,
>                 .colorspace     = V4L2_COLORSPACE_JPEG,
>                 .depth          = { 16 },
> @@ -78,7 +74,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_YVYU8_2X8,
>                 .flags          = FMT_FLAGS_YUV,
>         }, {
> -               .name           = "RAW8 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG8,
>                 .colorspace     = V4L2_COLORSPACE_SRGB,
>                 .depth          = { 8 },
> @@ -87,7 +82,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_SGRBG8_1X8,
>                 .flags          = FMT_FLAGS_RAW_BAYER,
>         }, {
> -               .name           = "RAW10 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG10,
>                 .colorspace     = V4L2_COLORSPACE_SRGB,
>                 .depth          = { 16 },
> @@ -96,7 +90,6 @@ static const struct fimc_fmt fimc_lite_formats[] = {
>                 .mbus_code      = MEDIA_BUS_FMT_SGRBG10_1X10,
>                 .flags          = FMT_FLAGS_RAW_BAYER,
>         }, {
> -               .name           = "RAW12 (GRBG)",
>                 .fourcc         = V4L2_PIX_FMT_SGRBG12,
>                 .colorspace     = V4L2_COLORSPACE_SRGB,
>                 .depth          = { 16 },
> @@ -670,7 +663,6 @@ static int fimc_lite_enum_fmt(struct file *file, void *priv,
>                 return -EINVAL;
>
>         fmt = &fimc_lite_formats[f->index];
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
>
>         return 0;
> diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
> index 62e876fc3555..c70c2cbe3eb1 100644
> --- a/drivers/media/platform/exynos4-is/fimc-m2m.c
> +++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
> @@ -247,7 +247,6 @@ static int fimc_m2m_enum_fmt(struct file *file, void *priv,
>         if (!fmt)
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
>         return 0;
>  }
> diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> index beb7fd7442fb..e9310eeec6cf 100644
> --- a/drivers/media/platform/m2m-deinterlace.c
> +++ b/drivers/media/platform/m2m-deinterlace.c
> @@ -37,7 +37,6 @@ module_param(debug, bool, 0644);
>         v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: " fmt, __func__, ## arg)
>
>  struct deinterlace_fmt {
> -       char    *name;
>         u32     fourcc;
>         /* Types the format can be used for */
>         u32     types;
> @@ -45,12 +44,10 @@ struct deinterlace_fmt {
>
>  static struct deinterlace_fmt formats[] = {
>         {
> -               .name   = "YUV 4:2:0 Planar",
>                 .fourcc = V4L2_PIX_FMT_YUV420,
>                 .types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
>         },
>         {
> -               .name   = "YUYV 4:2:2",
>                 .fourcc = V4L2_PIX_FMT_YUYV,
>                 .types  = MEM2MEM_CAPTURE | MEM2MEM_OUTPUT,
>         },
> @@ -470,7 +467,6 @@ static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
>         if (i < NUM_FORMATS) {
>                 /* Format found */
>                 fmt = &formats[i];
> -               strscpy(f->description, fmt->name, sizeof(f->description));
>                 f->pixelformat = fmt->fourcc;
>                 return 0;
>         }
> diff --git a/drivers/media/platform/marvell-ccic/mcam-core.c b/drivers/media/platform/marvell-ccic/mcam-core.c
> index dc30c48d4671..30ac454e702e 100644
> --- a/drivers/media/platform/marvell-ccic/mcam-core.c
> +++ b/drivers/media/platform/marvell-ccic/mcam-core.c
> @@ -98,56 +98,48 @@ MODULE_PARM_DESC(buffer_mode,
>         container_of(notifier, struct mcam_camera, notifier)
>
>  static struct mcam_format_struct {
> -       __u8 *desc;
>         __u32 pixelformat;
>         int bpp;   /* Bytes per pixel */
>         bool planar;
>         u32 mbus_code;
>  } mcam_formats[] = {
>         {
> -               .desc           = "YUYV 4:2:2",
>                 .pixelformat    = V4L2_PIX_FMT_YUYV,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .bpp            = 2,
>                 .planar         = false,
>         },
>         {
> -               .desc           = "YVYU 4:2:2",
>                 .pixelformat    = V4L2_PIX_FMT_YVYU,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .bpp            = 2,
>                 .planar         = false,
>         },
>         {
> -               .desc           = "YUV 4:2:0 PLANAR",
>                 .pixelformat    = V4L2_PIX_FMT_YUV420,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .bpp            = 1,
>                 .planar         = true,
>         },
>         {
> -               .desc           = "YVU 4:2:0 PLANAR",
>                 .pixelformat    = V4L2_PIX_FMT_YVU420,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .bpp            = 1,
>                 .planar         = true,
>         },
>         {
> -               .desc           = "XRGB 444",
>                 .pixelformat    = V4L2_PIX_FMT_XRGB444,
>                 .mbus_code      = MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE,
>                 .bpp            = 2,
>                 .planar         = false,
>         },
>         {
> -               .desc           = "RGB 565",
>                 .pixelformat    = V4L2_PIX_FMT_RGB565,
>                 .mbus_code      = MEDIA_BUS_FMT_RGB565_2X8_LE,
>                 .bpp            = 2,
>                 .planar         = false,
>         },
>         {
> -               .desc           = "Raw RGB Bayer",
>                 .pixelformat    = V4L2_PIX_FMT_SBGGR8,
>                 .mbus_code      = MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .bpp            = 1,
> @@ -1369,8 +1361,6 @@ static int mcam_vidioc_enum_fmt_vid_cap(struct file *filp,
>  {
>         if (fmt->index >= N_MCAM_FMTS)
>                 return -EINVAL;
> -       strscpy(fmt->description, mcam_formats[fmt->index].desc,
> -               sizeof(fmt->description));
>         fmt->pixelformat = mcam_formats[fmt->index].pixelformat;
>         return 0;
>  }
> diff --git a/drivers/media/platform/mx2_emmaprp.c b/drivers/media/platform/mx2_emmaprp.c
> index 333324c75027..4d4225ab1589 100644
> --- a/drivers/media/platform/mx2_emmaprp.c
> +++ b/drivers/media/platform/mx2_emmaprp.c
> @@ -145,7 +145,6 @@ module_param(debug, bool, 0644);
>  #define PRP_INTR_ST_CH2OVF     (1 << 8)
>
>  struct emmaprp_fmt {
> -       char    *name;
>         u32     fourcc;
>         /* Types the format can be used for */
>         u32     types;
> @@ -153,12 +152,10 @@ struct emmaprp_fmt {
>
>  static struct emmaprp_fmt formats[] = {
>         {
> -               .name   = "YUV 4:2:0 Planar",
>                 .fourcc = V4L2_PIX_FMT_YUV420,
>                 .types  = MEM2MEM_CAPTURE,
>         },
>         {
> -               .name   = "4:2:2, packed, YUYV",
>                 .fourcc = V4L2_PIX_FMT_YUYV,
>                 .types  = MEM2MEM_OUTPUT,
>         },
> @@ -409,7 +406,6 @@ static int enum_fmt(struct v4l2_fmtdesc *f, u32 type)
>         if (i < NUM_FORMATS) {
>                 /* Format found */
>                 fmt = &formats[i];
> -               strscpy(f->description, fmt->name, sizeof(f->description) - 1);
>                 f->pixelformat = fmt->fourcc;
>                 return 0;
>         }
> diff --git a/drivers/media/platform/omap/omap_vout.c b/drivers/media/platform/omap/omap_vout.c
> index cb6a9e3946b6..1f6742536c46 100644
> --- a/drivers/media/platform/omap/omap_vout.c
> +++ b/drivers/media/platform/omap/omap_vout.c
> @@ -114,14 +114,12 @@ static const struct v4l2_fmtdesc omap_formats[] = {
>                  *      Byte 0                    Byte 1
>                  *      g2 g1 g0 b4 b3 b2 b1 b0   r4 r3 r2 r1 r0 g5 g4 g3
>                  */
> -               .description = "RGB565, le",
>                 .pixelformat = V4L2_PIX_FMT_RGB565,
>         },
>         {
>                 /* Note:  V4L2 defines RGB32 as: RGB-8-8-8-8  we use
>                  *  this for RGB24 unpack mode, the last 8 bits are ignored
>                  * */
> -               .description = "RGB32, le",
>                 .pixelformat = V4L2_PIX_FMT_RGB32,
>         },
>         {
> @@ -129,15 +127,12 @@ static const struct v4l2_fmtdesc omap_formats[] = {
>                  *        this for RGB24 packed mode
>                  *
>                  */
> -               .description = "RGB24, le",
>                 .pixelformat = V4L2_PIX_FMT_RGB24,
>         },
>         {
> -               .description = "YUYV (YUV 4:2:2), packed",
>                 .pixelformat = V4L2_PIX_FMT_YUYV,
>         },
>         {
> -               .description = "UYVY, packed",
>                 .pixelformat = V4L2_PIX_FMT_UYVY,
>         },
>  };
> @@ -1060,8 +1055,6 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *fh,
>                 return -EINVAL;
>
>         fmt->flags = omap_formats[index].flags;
> -       strscpy(fmt->description, omap_formats[index].description,
> -               sizeof(fmt->description));
>         fmt->pixelformat = omap_formats[index].pixelformat;
>
>         return 0;
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index c3fc94ef251e..93813d593a1d 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -688,10 +688,7 @@ static int s3c_camif_vidioc_enum_fmt(struct file *file, void *priv,
>         if (!fmt)
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
> -
> -       pr_debug("fmt(%d): %s\n", f->index, f->description);
>         return 0;
>  }
>
> @@ -805,10 +802,10 @@ static int s3c_camif_vidioc_s_fmt(struct file *file, void *priv,
>         if (vp->owner == NULL)
>                 vp->owner = priv;
>
> -       pr_debug("%ux%u. payload: %u. fmt: %s. %d %d. sizeimage: %d. bpl: %d\n",
> -               out_frame->f_width, out_frame->f_height, vp->payload, fmt->name,
> -               pix->width * pix->height * fmt->depth, fmt->depth,
> -               pix->sizeimage, pix->bytesperline);
> +       pr_debug("%ux%u. payload: %u. fmt: 0x%08x. %d %d. sizeimage: %d. bpl: %d\n",
> +                out_frame->f_width, out_frame->f_height, vp->payload,
> +                fmt->fourcc, pix->width * pix->height * fmt->depth,
> +                fmt->depth, pix->sizeimage, pix->bytesperline);
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
> index b05ce0149ca1..f0acd6edcbba 100644
> --- a/drivers/media/platform/s3c-camif/camif-core.c
> +++ b/drivers/media/platform/s3c-camif/camif-core.c
> @@ -42,7 +42,6 @@ static char *camif_clocks[CLK_MAX_NUM] = {
>
>  static const struct camif_fmt camif_formats[] = {
>         {
> -               .name           = "YUV 4:2:2 planar, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV422P,
>                 .depth          = 16,
>                 .ybpp           = 1,
> @@ -51,7 +50,6 @@ static const struct camif_fmt camif_formats[] = {
>                 .flags          = FMT_FL_S3C24XX_CODEC |
>                                   FMT_FL_S3C64XX,
>         }, {
> -               .name           = "YUV 4:2:0 planar, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV420,
>                 .depth          = 12,
>                 .ybpp           = 1,
> @@ -60,7 +58,6 @@ static const struct camif_fmt camif_formats[] = {
>                 .flags          = FMT_FL_S3C24XX_CODEC |
>                                   FMT_FL_S3C64XX,
>         }, {
> -               .name           = "YVU 4:2:0 planar, Y/Cr/Cb",
>                 .fourcc         = V4L2_PIX_FMT_YVU420,
>                 .depth          = 12,
>                 .ybpp           = 1,
> @@ -69,7 +66,6 @@ static const struct camif_fmt camif_formats[] = {
>                 .flags          = FMT_FL_S3C24XX_CODEC |
>                                   FMT_FL_S3C64XX,
>         }, {
> -               .name           = "RGB565, 16 bpp",
>                 .fourcc         = V4L2_PIX_FMT_RGB565X,
>                 .depth          = 16,
>                 .ybpp           = 2,
> @@ -78,7 +74,6 @@ static const struct camif_fmt camif_formats[] = {
>                 .flags          = FMT_FL_S3C24XX_PREVIEW |
>                                   FMT_FL_S3C64XX,
>         }, {
> -               .name           = "XRGB8888, 32 bpp",
>                 .fourcc         = V4L2_PIX_FMT_RGB32,
>                 .depth          = 32,
>                 .ybpp           = 4,
> @@ -87,7 +82,6 @@ static const struct camif_fmt camif_formats[] = {
>                 .flags          = FMT_FL_S3C24XX_PREVIEW |
>                                   FMT_FL_S3C64XX,
>         }, {
> -               .name           = "BGR666",
>                 .fourcc         = V4L2_PIX_FMT_BGR666,
>                 .depth          = 32,
>                 .ybpp           = 4,
> diff --git a/drivers/media/platform/s3c-camif/camif-core.h b/drivers/media/platform/s3c-camif/camif-core.h
> index be5e7357dffc..b3e7ddd313f2 100644
> --- a/drivers/media/platform/s3c-camif/camif-core.h
> +++ b/drivers/media/platform/s3c-camif/camif-core.h
> @@ -92,7 +92,6 @@ enum img_fmt {
>   * @ybpp:      number of luminance bytes per pixel
>   */
>  struct camif_fmt {
> -       char *name;
>         u32 fourcc;
>         u32 color;
>         u16 colplanes;
> diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> index 152d192d5c3f..0c41bfcace7b 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/s5p-g2d/g2d.c
> @@ -29,31 +29,26 @@
>
>  static struct g2d_fmt formats[] = {
>         {
> -               .name   = "XRGB_8888",
>                 .fourcc = V4L2_PIX_FMT_RGB32,
>                 .depth  = 32,
>                 .hw     = COLOR_MODE(ORDER_XRGB, MODE_XRGB_8888),
>         },
>         {
> -               .name   = "RGB_565",
>                 .fourcc = V4L2_PIX_FMT_RGB565X,
>                 .depth  = 16,
>                 .hw     = COLOR_MODE(ORDER_XRGB, MODE_RGB_565),
>         },
>         {
> -               .name   = "XRGB_1555",
>                 .fourcc = V4L2_PIX_FMT_RGB555X,
>                 .depth  = 16,
>                 .hw     = COLOR_MODE(ORDER_XRGB, MODE_XRGB_1555),
>         },
>         {
> -               .name   = "XRGB_4444",
>                 .fourcc = V4L2_PIX_FMT_RGB444,
>                 .depth  = 16,
>                 .hw     = COLOR_MODE(ORDER_XRGB, MODE_XRGB_4444),
>         },
>         {
> -               .name   = "PACKED_RGB_888",
>                 .fourcc = V4L2_PIX_FMT_RGB24,
>                 .depth  = 24,
>                 .hw     = COLOR_MODE(ORDER_XRGB, MODE_PACKED_RGB_888),
> @@ -308,7 +303,6 @@ static int vidioc_enum_fmt(struct file *file, void *prv, struct v4l2_fmtdesc *f)
>                 return -EINVAL;
>         fmt = &formats[f->index];
>         f->pixelformat = fmt->fourcc;
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         return 0;
>  }
>
> diff --git a/drivers/media/platform/s5p-g2d/g2d.h b/drivers/media/platform/s5p-g2d/g2d.h
> index def0ec0dabeb..c2309c1370da 100644
> --- a/drivers/media/platform/s5p-g2d/g2d.h
> +++ b/drivers/media/platform/s5p-g2d/g2d.h
> @@ -61,7 +61,6 @@ struct g2d_ctx {
>  };
>
>  struct g2d_fmt {
> -       char    *name;
>         u32     fourcc;
>         int     depth;
>         u32     hw;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.c b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> index 8cc730eccb6c..8b9f0cfd6c9d 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.c
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.c
> @@ -38,7 +38,6 @@
>
>  static struct s5p_jpeg_fmt sjpeg_formats[] = {
>         {
> -               .name           = "JPEG JFIF",
>                 .fourcc         = V4L2_PIX_FMT_JPEG,
>                 .flags          = SJPEG_FMT_FLAG_ENC_CAPTURE |
>                                   SJPEG_FMT_FLAG_DEC_OUTPUT |
> @@ -47,7 +46,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                                   SJPEG_FMT_FLAG_EXYNOS4,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -60,7 +58,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -73,7 +70,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCbYCr",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -86,7 +82,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_YVYU,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -99,7 +94,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_YVYU,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -112,7 +106,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_UYVY,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -125,7 +118,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 packed, YCrYCb",
>                 .fourcc         = V4L2_PIX_FMT_VYUY,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -138,7 +130,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "RGB565",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -151,7 +142,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "RGB565",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -164,7 +154,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "RGB565X",
>                 .fourcc         = V4L2_PIX_FMT_RGB565X,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -177,7 +166,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "RGB565",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .depth          = 16,
>                 .colplanes      = 1,
> @@ -189,7 +177,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "ARGB8888, 32 bpp",
>                 .fourcc         = V4L2_PIX_FMT_RGB32,
>                 .depth          = 32,
>                 .colplanes      = 1,
> @@ -202,7 +189,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "ARGB8888, 32 bpp",
>                 .fourcc         = V4L2_PIX_FMT_RGB32,
>                 .depth          = 32,
>                 .colplanes      = 1,
> @@ -215,7 +201,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "YUV 4:4:4 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV24,
>                 .depth          = 24,
>                 .colplanes      = 2,
> @@ -228,7 +213,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "YUV 4:4:4 planar, Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV42,
>                 .depth          = 24,
>                 .colplanes      = 2,
> @@ -241,7 +225,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_444,
>         },
>         {
> -               .name           = "YUV 4:2:2 planar, Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV61,
>                 .depth          = 16,
>                 .colplanes      = 2,
> @@ -254,7 +237,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:2 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV16,
>                 .depth          = 16,
>                 .colplanes      = 2,
> @@ -267,7 +249,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_422,
>         },
>         {
> -               .name           = "YUV 4:2:0 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12,
>                 .depth          = 12,
>                 .colplanes      = 2,
> @@ -280,7 +261,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12,
>                 .depth          = 12,
>                 .colplanes      = 2,
> @@ -293,7 +273,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 planar, Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12,
>                 .depth          = 12,
>                 .colplanes      = 2,
> @@ -306,7 +285,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 planar, Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV21,
>                 .depth          = 12,
>                 .colplanes      = 2,
> @@ -319,7 +297,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 planar, Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV21,
>                 .depth          = 12,
>                 .colplanes      = 2,
> @@ -333,7 +310,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 contiguous 3-planar, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV420,
>                 .depth          = 12,
>                 .colplanes      = 3,
> @@ -346,7 +322,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "YUV 4:2:0 contiguous 3-planar, Y/Cb/Cr",
>                 .fourcc         = V4L2_PIX_FMT_YUV420,
>                 .depth          = 12,
>                 .colplanes      = 3,
> @@ -359,7 +334,6 @@ static struct s5p_jpeg_fmt sjpeg_formats[] = {
>                 .subsampling    = V4L2_JPEG_CHROMA_SUBSAMPLING_420,
>         },
>         {
> -               .name           = "Gray",
>                 .fourcc         = V4L2_PIX_FMT_GREY,
>                 .depth          = 8,
>                 .colplanes      = 1,
> @@ -1317,7 +1291,6 @@ static int enum_fmt(struct s5p_jpeg_ctx *ctx,
>         if (i >= n)
>                 return -EINVAL;
>
> -       strscpy(f->description, sjpeg_formats[i].name, sizeof(f->description));
>         f->pixelformat = sjpeg_formats[i].fourcc;
>
>         return 0;
> diff --git a/drivers/media/platform/s5p-jpeg/jpeg-core.h b/drivers/media/platform/s5p-jpeg/jpeg-core.h
> index 144c102ff05f..7fabe743e6dd 100644
> --- a/drivers/media/platform/s5p-jpeg/jpeg-core.h
> +++ b/drivers/media/platform/s5p-jpeg/jpeg-core.h
> @@ -153,7 +153,6 @@ struct s5p_jpeg_variant {
>
>  /**
>   * struct jpeg_fmt - driver's internal color format data
> - * @name:      format description
>   * @fourcc:    the fourcc code, 0 if not applicable
>   * @depth:     number of bits per pixel
>   * @colplanes: number of color planes (1 for packed formats)
> @@ -162,7 +161,6 @@ struct s5p_jpeg_variant {
>   * @flags:     flags describing format applicability
>   */
>  struct s5p_jpeg_fmt {
> -       char    *name;
>         u32     fourcc;
>         int     depth;
>         int     colplanes;
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> index 5dc086516360..96d1ecd1521b 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_common.h
> @@ -718,7 +718,6 @@ struct s5p_mfc_ctx {
>   *                     used by the MFC
>   */
>  struct s5p_mfc_fmt {
> -       char *name;
>         u32 fourcc;
>         u32 codec_mode;
>         enum s5p_mfc_fmt_type type;
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> index 4017c8b471f4..e7f186f90894 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
> @@ -29,7 +29,6 @@
>
>  static struct s5p_mfc_fmt formats[] = {
>         {
> -               .name           = "4:2:0 2 Planes 16x16 Tiles",
>                 .fourcc         = V4L2_PIX_FMT_NV12MT_16X16,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -37,7 +36,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6_BIT | MFC_V7_BIT,
>         },
>         {
> -               .name           = "4:2:0 2 Planes 64x32 Tiles",
>                 .fourcc         = V4L2_PIX_FMT_NV12MT,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -45,7 +43,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5_BIT,
>         },
>         {
> -               .name           = "4:2:0 2 Planes Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12M,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -53,7 +50,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6PLUS_BITS,
>         },
>         {
> -               .name           = "4:2:0 2 Planes Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV21M,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -61,7 +57,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6PLUS_BITS,
>         },
>         {
> -               .name           = "H264 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_H264,
>                 .codec_mode     = S5P_MFC_CODEC_H264_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -69,7 +64,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "H264/MVC Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_H264_MVC,
>                 .codec_mode     = S5P_MFC_CODEC_H264_MVC_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -77,7 +71,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6PLUS_BITS,
>         },
>         {
> -               .name           = "H263 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_H263,
>                 .codec_mode     = S5P_MFC_CODEC_H263_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -85,7 +78,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "MPEG1 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_MPEG1,
>                 .codec_mode     = S5P_MFC_CODEC_MPEG2_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -93,7 +85,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "MPEG2 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_MPEG2,
>                 .codec_mode     = S5P_MFC_CODEC_MPEG2_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -101,7 +92,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "MPEG4 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_MPEG4,
>                 .codec_mode     = S5P_MFC_CODEC_MPEG4_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -109,7 +99,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "XviD Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_XVID,
>                 .codec_mode     = S5P_MFC_CODEC_MPEG4_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -117,7 +106,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "VC1 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_G,
>                 .codec_mode     = S5P_MFC_CODEC_VC1_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -125,7 +113,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "VC1 RCV Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_VC1_ANNEX_L,
>                 .codec_mode     = S5P_MFC_CODEC_VC1RCV_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -133,7 +120,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "VP8 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_VP8,
>                 .codec_mode     = S5P_MFC_CODEC_VP8_DEC,
>                 .type           = MFC_FMT_DEC,
> @@ -297,7 +283,6 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
>         if (i == ARRAY_SIZE(formats))
>                 return -EINVAL;
>         fmt = &formats[i];
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
>         return 0;
>  }
> diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> index 97e76480e942..d33c03b0a1d4 100644
> --- a/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> +++ b/drivers/media/platform/s5p-mfc/s5p_mfc_enc.c
> @@ -32,7 +32,6 @@
>
>  static struct s5p_mfc_fmt formats[] = {
>         {
> -               .name           = "4:2:0 2 Planes 16x16 Tiles",
>                 .fourcc         = V4L2_PIX_FMT_NV12MT_16X16,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -40,7 +39,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6_BIT | MFC_V7_BIT,
>         },
>         {
> -               .name           = "4:2:0 2 Planes 64x32 Tiles",
>                 .fourcc         = V4L2_PIX_FMT_NV12MT,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -48,7 +46,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5_BIT,
>         },
>         {
> -               .name           = "4:2:0 2 Planes Y/CbCr",
>                 .fourcc         = V4L2_PIX_FMT_NV12M,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -56,7 +53,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "4:2:0 2 Planes Y/CrCb",
>                 .fourcc         = V4L2_PIX_FMT_NV21M,
>                 .codec_mode     = S5P_MFC_CODEC_NONE,
>                 .type           = MFC_FMT_RAW,
> @@ -64,7 +60,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V6PLUS_BITS,
>         },
>         {
> -               .name           = "H264 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_H264,
>                 .codec_mode     = S5P_MFC_CODEC_H264_ENC,
>                 .type           = MFC_FMT_ENC,
> @@ -72,7 +67,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "MPEG4 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_MPEG4,
>                 .codec_mode     = S5P_MFC_CODEC_MPEG4_ENC,
>                 .type           = MFC_FMT_ENC,
> @@ -80,7 +74,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "H263 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_H263,
>                 .codec_mode     = S5P_MFC_CODEC_H263_ENC,
>                 .type           = MFC_FMT_ENC,
> @@ -88,7 +81,6 @@ static struct s5p_mfc_fmt formats[] = {
>                 .versions       = MFC_V5PLUS_BITS,
>         },
>         {
> -               .name           = "VP8 Encoded Stream",
>                 .fourcc         = V4L2_PIX_FMT_VP8,
>                 .codec_mode     = S5P_MFC_CODEC_VP8_ENC,
>                 .type           = MFC_FMT_ENC,
> @@ -1333,8 +1325,6 @@ static int vidioc_enum_fmt(struct file *file, struct v4l2_fmtdesc *f,
>
>                 if (j == f->index) {
>                         fmt = &formats[i];
> -                       strscpy(f->description, fmt->name,
> -                               sizeof(f->description));
>                         f->pixelformat = fmt->fourcc;
>                         return 0;
>                 }
> diff --git a/drivers/media/platform/sh_veu.c b/drivers/media/platform/sh_veu.c
> index 5a9ba05c996e..26360af2325e 100644
> --- a/drivers/media/platform/sh_veu.c
> +++ b/drivers/media/platform/sh_veu.c
> @@ -86,7 +86,6 @@ struct sh_veu_file {
>  };
>
>  struct sh_veu_format {
> -       char *name;
>         u32 fourcc;
>         unsigned int depth;
>         unsigned int ydepth;
> @@ -144,14 +143,14 @@ enum sh_veu_fmt_idx {
>   * aligned for NV24.
>   */
>  static const struct sh_veu_format sh_veu_fmt[] = {
> -       [SH_VEU_FMT_NV12]   = { .ydepth = 8, .depth = 12, .name = "NV12", .fourcc = V4L2_PIX_FMT_NV12 },
> -       [SH_VEU_FMT_NV16]   = { .ydepth = 8, .depth = 16, .name = "NV16", .fourcc = V4L2_PIX_FMT_NV16 },
> -       [SH_VEU_FMT_NV24]   = { .ydepth = 8, .depth = 24, .name = "NV24", .fourcc = V4L2_PIX_FMT_NV24 },
> -       [SH_VEU_FMT_RGB332] = { .ydepth = 8, .depth = 8, .name = "RGB332", .fourcc = V4L2_PIX_FMT_RGB332 },
> -       [SH_VEU_FMT_RGB444] = { .ydepth = 16, .depth = 16, .name = "RGB444", .fourcc = V4L2_PIX_FMT_RGB444 },
> -       [SH_VEU_FMT_RGB565] = { .ydepth = 16, .depth = 16, .name = "RGB565", .fourcc = V4L2_PIX_FMT_RGB565 },
> -       [SH_VEU_FMT_RGB666] = { .ydepth = 32, .depth = 32, .name = "BGR666", .fourcc = V4L2_PIX_FMT_BGR666 },
> -       [SH_VEU_FMT_RGB24]  = { .ydepth = 24, .depth = 24, .name = "RGB24", .fourcc = V4L2_PIX_FMT_RGB24 },
> +       [SH_VEU_FMT_NV12]   = { .ydepth = 8, .depth = 12, .fourcc = V4L2_PIX_FMT_NV12 },
> +       [SH_VEU_FMT_NV16]   = { .ydepth = 8, .depth = 16, .fourcc = V4L2_PIX_FMT_NV16 },
> +       [SH_VEU_FMT_NV24]   = { .ydepth = 8, .depth = 24, .fourcc = V4L2_PIX_FMT_NV24 },
> +       [SH_VEU_FMT_RGB332] = { .ydepth = 8, .depth = 8, .fourcc = V4L2_PIX_FMT_RGB332 },
> +       [SH_VEU_FMT_RGB444] = { .ydepth = 16, .depth = 16, .fourcc = V4L2_PIX_FMT_RGB444 },
> +       [SH_VEU_FMT_RGB565] = { .ydepth = 16, .depth = 16, .fourcc = V4L2_PIX_FMT_RGB565 },
> +       [SH_VEU_FMT_RGB666] = { .ydepth = 32, .depth = 32, .fourcc = V4L2_PIX_FMT_BGR666 },
> +       [SH_VEU_FMT_RGB24]  = { .ydepth = 24, .depth = 24, .fourcc = V4L2_PIX_FMT_RGB24 },
>  };
>
>  #define DEFAULT_IN_VFMT (struct sh_veu_vfmt){                                          \
> @@ -359,8 +358,6 @@ static int sh_veu_enum_fmt(struct v4l2_fmtdesc *f, const int *fmt, int fmt_num)
>         if (f->index >= fmt_num)
>                 return -EINVAL;
>
> -       strscpy(f->description, sh_veu_fmt[fmt[f->index]].name,
> -               sizeof(f->description));
>         f->pixelformat = sh_veu_fmt[fmt[f->index]].fourcc;
>         return 0;
>  }
> diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
> index 5799aa4b9323..4fc1b4e11b70 100644
> --- a/drivers/media/platform/sh_vou.c
> +++ b/drivers/media/platform/sh_vou.c
> @@ -138,7 +138,6 @@ static void sh_vou_reg_ab_set(struct sh_vou_device *vou_dev, unsigned int reg,
>
>  struct sh_vou_fmt {
>         u32             pfmt;
> -       char            *desc;
>         unsigned char   bpp;
>         unsigned char   bpl;
>         unsigned char   rgb;
> @@ -152,7 +151,6 @@ static struct sh_vou_fmt vou_fmt[] = {
>                 .pfmt   = V4L2_PIX_FMT_NV12,
>                 .bpp    = 12,
>                 .bpl    = 1,
> -               .desc   = "YVU420 planar",
>                 .yf     = 0,
>                 .rgb    = 0,
>         },
> @@ -160,7 +158,6 @@ static struct sh_vou_fmt vou_fmt[] = {
>                 .pfmt   = V4L2_PIX_FMT_NV16,
>                 .bpp    = 16,
>                 .bpl    = 1,
> -               .desc   = "YVYU planar",
>                 .yf     = 1,
>                 .rgb    = 0,
>         },
> @@ -168,7 +165,6 @@ static struct sh_vou_fmt vou_fmt[] = {
>                 .pfmt   = V4L2_PIX_FMT_RGB24,
>                 .bpp    = 24,
>                 .bpl    = 3,
> -               .desc   = "RGB24",
>                 .pkf    = 2,
>                 .rgb    = 1,
>         },
> @@ -176,7 +172,6 @@ static struct sh_vou_fmt vou_fmt[] = {
>                 .pfmt   = V4L2_PIX_FMT_RGB565,
>                 .bpp    = 16,
>                 .bpl    = 2,
> -               .desc   = "RGB565",
>                 .pkf    = 3,
>                 .rgb    = 1,
>         },
> @@ -184,7 +179,6 @@ static struct sh_vou_fmt vou_fmt[] = {
>                 .pfmt   = V4L2_PIX_FMT_RGB565X,
>                 .bpp    = 16,
>                 .bpl    = 2,
> -               .desc   = "RGB565 byteswapped",
>                 .pkf    = 3,
>                 .rgb    = 1,
>         },
> @@ -398,9 +392,6 @@ static int sh_vou_enum_fmt_vid_out(struct file *file, void  *priv,
>
>         dev_dbg(vou_dev->v4l2_dev.dev, "%s()\n", __func__);
>
> -       fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
> -       strscpy(fmt->description, vou_fmt[fmt->index].desc,
> -               sizeof(fmt->description));
>         fmt->pixelformat = vou_fmt[fmt->index].pfmt;
>
>         return 0;
> @@ -494,7 +485,8 @@ static void sh_vou_configure_geometry(struct sh_vou_device *vou_dev,
>         if (h_idx)
>                 vouvcr |= (1 << 14) | vou_scale_v_fld[h_idx - 1];
>
> -       dev_dbg(vou_dev->v4l2_dev.dev, "%s: scaling 0x%x\n", fmt->desc, vouvcr);
> +       dev_dbg(vou_dev->v4l2_dev.dev, "0x%08x: scaling 0x%x\n",
> +               fmt->pfmt, vouvcr);
>
>         /* To produce a colour bar for testing set bit 23 of VOUVCR */
>         sh_vou_reg_ab_write(vou_dev, VOUVCR, vouvcr);
> diff --git a/drivers/media/platform/ti-vpe/vpe.c b/drivers/media/platform/ti-vpe/vpe.c
> index 3f90f9413da1..a23eeba52723 100644
> --- a/drivers/media/platform/ti-vpe/vpe.c
> +++ b/drivers/media/platform/ti-vpe/vpe.c
> @@ -227,7 +227,6 @@ static const struct vpe_port_data port_data[11] = {
>
>  /* driver info for each of the supported video formats */
>  struct vpe_fmt {
> -       char    *name;                  /* human-readable name */
>         u32     fourcc;                 /* standard format identifier */
>         u8      types;                  /* CAPTURE and/or OUTPUT */
>         u8      coplanar;               /* set for unpacked Luma and Chroma */
> @@ -237,7 +236,6 @@ struct vpe_fmt {
>
>  static struct vpe_fmt vpe_formats[] = {
>         {
> -               .name           = "NV16 YUV 422 co-planar",
>                 .fourcc         = V4L2_PIX_FMT_NV16,
>                 .types          = VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
>                 .coplanar       = 1,
> @@ -246,7 +244,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "NV12 YUV 420 co-planar",
>                 .fourcc         = V4L2_PIX_FMT_NV12,
>                 .types          = VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
>                 .coplanar       = 1,
> @@ -255,7 +252,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "YUYV 422 packed",
>                 .fourcc         = V4L2_PIX_FMT_YUYV,
>                 .types          = VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
>                 .coplanar       = 0,
> @@ -263,7 +259,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "UYVY 422 packed",
>                 .fourcc         = V4L2_PIX_FMT_UYVY,
>                 .types          = VPE_FMT_TYPE_CAPTURE | VPE_FMT_TYPE_OUTPUT,
>                 .coplanar       = 0,
> @@ -271,7 +266,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "RGB888 packed",
>                 .fourcc         = V4L2_PIX_FMT_RGB24,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -279,7 +273,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "ARGB32",
>                 .fourcc         = V4L2_PIX_FMT_RGB32,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -287,7 +280,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "BGR888 packed",
>                 .fourcc         = V4L2_PIX_FMT_BGR24,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -295,7 +287,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "ABGR32",
>                 .fourcc         = V4L2_PIX_FMT_BGR32,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -303,7 +294,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "RGB565",
>                 .fourcc         = V4L2_PIX_FMT_RGB565,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -311,7 +301,6 @@ static struct vpe_fmt vpe_formats[] = {
>                                   },
>         },
>         {
> -               .name           = "RGB5551",
>                 .fourcc         = V4L2_PIX_FMT_RGB555,
>                 .types          = VPE_FMT_TYPE_CAPTURE,
>                 .coplanar       = 0,
> @@ -1517,7 +1506,6 @@ static int __enum_fmt(struct v4l2_fmtdesc *f, u32 type)
>         if (!fmt)
>                 return -EINVAL;
>
> -       strscpy(f->description, fmt->name, sizeof(f->description));
>         f->pixelformat = fmt->fourcc;
>         return 0;
>  }
> diff --git a/drivers/media/platform/via-camera.c b/drivers/media/platform/via-camera.c
> index 038de7a2027a..d5f811820be9 100644
> --- a/drivers/media/platform/via-camera.c
> +++ b/drivers/media/platform/via-camera.c
> @@ -142,13 +142,11 @@ static struct via_camera *via_cam_info;
>   * now this information must be managed at this level too.
>   */
>  static struct via_format {
> -       __u8 *desc;
>         __u32 pixelformat;
>         int bpp;   /* Bytes per pixel */
>         u32 mbus_code;
>  } via_formats[] = {
>         {
> -               .desc           = "YUYV 4:2:2",
>                 .pixelformat    = V4L2_PIX_FMT_YUYV,
>                 .mbus_code      = MEDIA_BUS_FMT_YUYV8_2X8,
>                 .bpp            = 2,
> @@ -860,8 +858,6 @@ static int viacam_enum_fmt_vid_cap(struct file *filp, void *priv,
>  {
>         if (fmt->index >= N_VIA_FMTS)
>                 return -EINVAL;
> -       strscpy(fmt->description, via_formats[fmt->index].desc,
> -               sizeof(fmt->description));
>         fmt->pixelformat = via_formats[fmt->index].pixelformat;
>         return 0;
>  }
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index c9d5fdb2d407..7bd2600cdc9a 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -524,8 +524,6 @@ xvip_dma_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>                 return -EINVAL;
>
>         f->pixelformat = dma->format.pixelformat;
> -       strscpy(f->description, dma->fmtinfo->description,
> -               sizeof(f->description));
>
>         return 0;
>  }
> diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
> index 08a825c3a3f6..6ad61b08a31a 100644
> --- a/drivers/media/platform/xilinx/xilinx-vip.c
> +++ b/drivers/media/platform/xilinx/xilinx-vip.c
> @@ -25,21 +25,21 @@
>
>  static const struct xvip_video_format xvip_video_formats[] = {
>         { XVIP_VF_YUV_422, 8, NULL, MEDIA_BUS_FMT_UYVY8_1X16,
> -         2, V4L2_PIX_FMT_YUYV, "4:2:2, packed, YUYV" },
> +         2, V4L2_PIX_FMT_YUYV },
>         { XVIP_VF_YUV_444, 8, NULL, MEDIA_BUS_FMT_VUY8_1X24,
> -         3, V4L2_PIX_FMT_YUV444, "4:4:4, packed, YUYV" },
> +         3, V4L2_PIX_FMT_YUV444 },
>         { XVIP_VF_RBG, 8, NULL, MEDIA_BUS_FMT_RBG888_1X24,
> -         3, 0, NULL },
> +         3, 0 },
>         { XVIP_VF_MONO_SENSOR, 8, "mono", MEDIA_BUS_FMT_Y8_1X8,
> -         1, V4L2_PIX_FMT_GREY, "Greyscale 8-bit" },
> +         1, V4L2_PIX_FMT_GREY },
>         { XVIP_VF_MONO_SENSOR, 8, "rggb", MEDIA_BUS_FMT_SRGGB8_1X8,
> -         1, V4L2_PIX_FMT_SRGGB8, "Bayer 8-bit RGGB" },
> +         1, V4L2_PIX_FMT_SRGGB8 },
>         { XVIP_VF_MONO_SENSOR, 8, "grbg", MEDIA_BUS_FMT_SGRBG8_1X8,
> -         1, V4L2_PIX_FMT_SGRBG8, "Bayer 8-bit GRBG" },
> +         1, V4L2_PIX_FMT_SGRBG8 },
>         { XVIP_VF_MONO_SENSOR, 8, "gbrg", MEDIA_BUS_FMT_SGBRG8_1X8,
> -         1, V4L2_PIX_FMT_SGBRG8, "Bayer 8-bit GBRG" },
> +         1, V4L2_PIX_FMT_SGBRG8 },
>         { XVIP_VF_MONO_SENSOR, 8, "bggr", MEDIA_BUS_FMT_SBGGR8_1X8,
> -         1, V4L2_PIX_FMT_SBGGR8, "Bayer 8-bit BGGR" },
> +         1, V4L2_PIX_FMT_SBGGR8 },
>  };
>
>  /**
> diff --git a/drivers/media/platform/xilinx/xilinx-vip.h b/drivers/media/platform/xilinx/xilinx-vip.h
> index ba939dd52818..47da39211ae4 100644
> --- a/drivers/media/platform/xilinx/xilinx-vip.h
> +++ b/drivers/media/platform/xilinx/xilinx-vip.h
> @@ -108,7 +108,6 @@ struct xvip_device {
>   * @code: media bus format code
>   * @bpp: bytes per pixel (when stored in memory)
>   * @fourcc: V4L2 pixel format FCC identifier
> - * @description: format description, suitable for userspace
>   */
>  struct xvip_video_format {
>         unsigned int vf_code;
> @@ -117,7 +116,6 @@ struct xvip_video_format {
>         unsigned int code;
>         unsigned int bpp;
>         u32 fourcc;
> -       const char *description;
>  };
>
>  const struct xvip_video_format *xvip_get_format_by_code(unsigned int code);
> diff --git a/include/media/drv-intf/exynos-fimc.h b/include/media/drv-intf/exynos-fimc.h
> index 54c214737142..bb846e167325 100644
> --- a/include/media/drv-intf/exynos-fimc.h
> +++ b/include/media/drv-intf/exynos-fimc.h
> @@ -90,7 +90,6 @@ struct fimc_source_info {
>  /**
>   * struct fimc_fmt - color format data structure
>   * @mbus_code: media bus pixel code, -1 if not applicable
> - * @name: format description
>   * @fourcc: fourcc code for this format, 0 if not applicable
>   * @color: the driver's private color format id
>   * @memplanes: number of physically non-contiguous data planes
> @@ -102,7 +101,6 @@ struct fimc_source_info {
>   */
>  struct fimc_fmt {
>         u32 mbus_code;
> -       char    *name;
>         u32     fourcc;
>         u32     color;
>         u16     memplanes;
> --
> 2.20.1
>
