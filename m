Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17BF351D7F
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238617AbhDAS2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239832AbhDASRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 14:17:02 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4CCC08EC8C;
        Thu,  1 Apr 2021 06:54:33 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id u29so1233091vsi.12;
        Thu, 01 Apr 2021 06:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9YN9zXNomeSa8zgMHt4nu1nHi8hK42B6gBCp4A4AQUU=;
        b=lk4BE+K2BogRlcumIr04ephtlCBMvU2cD2rfbYN93LUFSKKwDyv66Yvn8xpZ8wXmAn
         926UsOMJCkxKytUdrzmYNjs9BIu9VuesZtkND8kN+5vwd1hhFT7nOKNQOJ2j5jkXfTMj
         XsDdbMnlJivXDjR11yk9Br0obiV022ggoNf0/WNdOsMERM0xA/OOK7OIc3PXPmyTfWCr
         ldqGHg9Im9oMCZe7bYNVeSAjxNeJw3RdatSHcGOOkXTrASeeq5myCaQGOL71Y3k+gdwN
         2ripBsglWcdd2hsnhC910eRfoBcYkPvyTrev2q1AYcBQZnYQopUP1RbTbEd7UAWAFug+
         QlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9YN9zXNomeSa8zgMHt4nu1nHi8hK42B6gBCp4A4AQUU=;
        b=GXi26+sV1CN5v8xCuU84t8iIaLnf1U/ZsvYbBjyXZiq8g2R7MVQJ7obVePcqBqznu3
         gbi5YBEaESOM+/wWxPo8YGy5OX9qqFGlH2DnoJX/4SIuKCROOGbTlRujCQGscCMJRwLq
         EYlC+tLaV92N/sc35YVvKWoc/KJ2BE1QDy0LuIqU1udmDi63LTprrlSQ1wT76E0uBL5p
         8LjG1QzshZSLQ/N20WV3ZbNWHBdF2QQxCFV63vHjVyt6XwvnThbc0tDJv8WFksmO41KW
         qWq2UigRnEsjP1gQzdCiVeZbb86MJA2sK98jcXfhE9tXNZbL0xITk7VYADPzp/lRit9R
         bOSw==
X-Gm-Message-State: AOAM5313pg5QdiChwcPLUJl2LwAqYLPKHIuHb7oXpIyaMnBK0T6ngaNr
        r+HB7YhgwlzevteRZ2xohkwaBOMQwJBencePAmo=
X-Google-Smtp-Source: ABdhPJypiak9kzs2HUWq465nnHzj2dfmzTis4aE/AcnfRBjr2trPyMXUjhIhNpSAuIX9q8vwUhq8le6DpCvu43NnQZg=
X-Received: by 2002:a05:6102:2c7:: with SMTP id h7mr4933185vsh.31.1617285272339;
 Thu, 01 Apr 2021 06:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
 <20210331173520.184191-9-emil.l.velikov@gmail.com> <6fa233628cf4bd0cb63c9521dbca0a9652ac6cee.camel@collabora.com>
In-Reply-To: <6fa233628cf4bd0cb63c9521dbca0a9652ac6cee.camel@collabora.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 1 Apr 2021 14:54:21 +0100
Message-ID: <CACvgo511x1=G9Am2jKTdaFMKLL2xhaYO+DefEFFdp8sUf9140w@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] media: hantro: add initial SAMA5D4 support
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     kernel@collabora.com, Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-media@vger.kernel.org,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 31 Mar 2021 at 21:03, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> On Wed, 2021-03-31 at 18:35 +0100, Emil Velikov wrote:
> > From: Emil Velikov <emil.velikov@collabora.com>
> >
> > The SoC features a Hantro G1 compatible video decoder, supporting the
> > MPEG-2, VP8 and H264 codecs with resolutions up-to 1280x720.
> >
> > Post-processing core is also available on the SoC.
> >
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: devicetree@vger.kernel.org>
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> > ---
> > v2
> >  - Split DT and defconfig changes to separate patches (Eze)
> >  - s/Atmel/Microchip/ (Nicolas)
> >
> > v3
> >  - Drop the clk/irq names (RobH)
> > ---
> >  drivers/staging/media/hantro/Kconfig          |  10 +-
> >  drivers/staging/media/hantro/Makefile         |   3 +
> >  drivers/staging/media/hantro/hantro_drv.c     |   3 +
> >  drivers/staging/media/hantro/hantro_hw.h      |   1 +
> >  .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
> >  5 files changed, 133 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
> >
> > diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> > index 5b6cf9f62b1a..20b1f6d7b69c 100644
> > --- a/drivers/staging/media/hantro/Kconfig
> > +++ b/drivers/staging/media/hantro/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  config VIDEO_HANTRO
> >         tristate "Hantro VPU driver"
> > -       depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
> > +       depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || COMPILE_TEST
> >         depends on VIDEO_DEV && VIDEO_V4L2
> >         select MEDIA_CONTROLLER
> >         select MEDIA_CONTROLLER_REQUEST_API
> > @@ -24,6 +24,14 @@ config VIDEO_HANTRO_IMX8M
> >         help
> >           Enable support for i.MX8M SoCs.
> >
> > +config VIDEO_HANTRO_SAMA5D4
> > +       bool "Hantro VDEC SAMA5D4 support"
> > +       depends on VIDEO_HANTRO
> > +       depends on ARCH_AT91 || COMPILE_TEST
> > +       default y
> > +       help
> > +         Enable support for Microchip SAMA5D4 SoCs.
> > +
> >  config VIDEO_HANTRO_ROCKCHIP
> >         bool "Hantro VPU Rockchip support"
> >         depends on VIDEO_HANTRO
> > diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> > index 3747a32799b2..f4b99901eeee 100644
> > --- a/drivers/staging/media/hantro/Makefile
> > +++ b/drivers/staging/media/hantro/Makefile
> > @@ -22,6 +22,9 @@ hantro-vpu-y += \
> >  hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
> >                 imx8m_vpu_hw.o
> >
> > +hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
> > +               sama5d4_vdec_hw.o
> > +
> >  hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
> >                 rk3288_vpu_hw.o \
> >                 rk3399_vpu_hw.o
> > diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> > index d1294eb9cd07..74a3d9eab454 100644
> > --- a/drivers/staging/media/hantro/hantro_drv.c
> > +++ b/drivers/staging/media/hantro/hantro_drv.c
> > @@ -478,6 +478,9 @@ static const struct of_device_id of_hantro_match[] = {
> >  #endif
> >  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> >         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> > +#endif
> > +#ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
> > +       { .compatible = "microchip,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
> >  #endif
> >         { /* sentinel */ }
> >  };
> > diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> > index 73c71bb2320c..4d39da1d1581 100644
> > --- a/drivers/staging/media/hantro/hantro_hw.h
> > +++ b/drivers/staging/media/hantro/hantro_hw.h
> > @@ -152,6 +152,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
> >  extern const struct hantro_variant rk3328_vpu_variant;
> >  extern const struct hantro_variant rk3288_vpu_variant;
> >  extern const struct hantro_variant imx8mq_vpu_variant;
> > +extern const struct hantro_variant sama5d4_vdec_variant;
> >
> >  extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
> >
> > diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> > new file mode 100644
> > index 000000000000..d52ac626f98a
> > --- /dev/null
> > +++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> > @@ -0,0 +1,117 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Hantro VDEC driver
> > + *
> > + * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
> > + */
> > +
> > +#include "hantro.h"
> > +
> > +/*
> > + * Supported formats.
> > + */
> > +
> > +static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_YUYV,
> > +               .codec_mode = HANTRO_MODE_NONE,
> > +       },
> > +};
> > +
> > +static const struct hantro_fmt sama5d4_vdec_fmts[] = {
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_NV12,
> > +               .codec_mode = HANTRO_MODE_NONE,
> > +       },
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
> > +               .codec_mode = HANTRO_MODE_MPEG2_DEC,
> > +               .max_depth = 2,
> > +               .frmsize = {
> > +                       .min_width = 48,
> > +                       .max_width = 1280,
> > +                       .step_width = MB_DIM,
> > +                       .min_height = 48,
> > +                       .max_height = 720,
> > +                       .step_height = MB_DIM,
> > +               },
> > +       },
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
> > +               .codec_mode = HANTRO_MODE_VP8_DEC,
> > +               .max_depth = 2,
> > +               .frmsize = {
> > +                       .min_width = 48,
> > +                       .max_width = 1280,
> > +                       .step_width = MB_DIM,
> > +                       .min_height = 48,
> > +                       .max_height = 720,
> > +                       .step_height = MB_DIM,
> > +               },
> > +       },
> > +       {
> > +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> > +               .codec_mode = HANTRO_MODE_H264_DEC,
> > +               .max_depth = 2,
> > +               .frmsize = {
> > +                       .min_width = 48,
> > +                       .max_width = 1280,
> > +                       .step_width = MB_DIM,
> > +                       .min_height = 48,
> > +                       .max_height = 720,
> > +                       .step_height = MB_DIM,
> > +               },
> > +       },
> > +};
> > +
> > +static int sama5d4_hw_init(struct hantro_dev *vpu)
> > +{
> > +       return 0;
> > +}
> > +
> > +/*
> > + * Supported codec ops.
> > + */
> > +
> > +static const struct hantro_codec_ops sama5d4_vdec_codec_ops[] = {
> > +       [HANTRO_MODE_MPEG2_DEC] = {
> > +               .run = hantro_g1_mpeg2_dec_run,
> > +               .reset = hantro_g1_reset,
> > +               .init = hantro_mpeg2_dec_init,
> > +               .exit = hantro_mpeg2_dec_exit,
> > +       },
> > +       [HANTRO_MODE_VP8_DEC] = {
> > +               .run = hantro_g1_vp8_dec_run,
> > +               .reset = hantro_g1_reset,
> > +               .init = hantro_vp8_dec_init,
> > +               .exit = hantro_vp8_dec_exit,
> > +       },
> > +       [HANTRO_MODE_H264_DEC] = {
> > +               .run = hantro_g1_h264_dec_run,
> > +               .reset = hantro_g1_reset,
> > +               .init = hantro_h264_dec_init,
> > +               .exit = hantro_h264_dec_exit,
> > +       },
> > +};
> > +
> > +static const struct hantro_irq sama5d4_irqs[] = {
> > +       { NULL, hantro_g1_irq },
>
> As suggested I think you can have a name in here.
>
> > +};
> > +
>
> I would add a comment here explaining why this has to be NULL.
>
> Now that I see this in practice, I'm wondering if we should just
> keep the name here, we don't have any NULL names and do
> something like this in hantro_probe (in patch 6/9):
>
>         /* If only one clock, we shouldn't have a clock name. */
>         if (vpu->variant->num_clocks > 1) {
>                 for (i = 0; i < vpu->variant->num_clocks; i++)
>                         vpu->clocks[i].id = vpu->variant->clk_names[i];
>         }
>
Keeping the names within the driver, while doing a num_{clk,irc} in
hantro sounds like the better option. Will send v4 in a few minutes.

Thanks
-Emil
