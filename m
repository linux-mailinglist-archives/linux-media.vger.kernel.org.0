Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555853507C3
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 22:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236273AbhCaUEZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 16:04:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34050 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236391AbhCaUDw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 16:03:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id C6FA91F44E1C
Message-ID: <6fa233628cf4bd0cb63c9521dbca0a9652ac6cee.camel@collabora.com>
Subject: Re: [PATCH v3 8/9] media: hantro: add initial SAMA5D4 support
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Frank Rowand <frowand.list@gmail.com>
Date:   Wed, 31 Mar 2021 17:03:43 -0300
In-Reply-To: <20210331173520.184191-9-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
         <20210331173520.184191-9-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2021-03-31 at 18:35 +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The SoC features a Hantro G1 compatible video decoder, supporting the
> MPEG-2, VP8 and H264 codecs with resolutions up-to 1280x720.
> 
> Post-processing core is also available on the SoC.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: devicetree@vger.kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
> v2
>  - Split DT and defconfig changes to separate patches (Eze)
>  - s/Atmel/Microchip/ (Nicolas)
> 
> v3
>  - Drop the clk/irq names (RobH)
> ---
>  drivers/staging/media/hantro/Kconfig          |  10 +-
>  drivers/staging/media/hantro/Makefile         |   3 +
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_hw.h      |   1 +
>  .../staging/media/hantro/sama5d4_vdec_hw.c    | 117 ++++++++++++++++++
>  5 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
> 
> diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> index 5b6cf9f62b1a..20b1f6d7b69c 100644
> --- a/drivers/staging/media/hantro/Kconfig
> +++ b/drivers/staging/media/hantro/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config VIDEO_HANTRO
>         tristate "Hantro VPU driver"
> -       depends on ARCH_MXC || ARCH_ROCKCHIP || COMPILE_TEST
> +       depends on ARCH_MXC || ARCH_ROCKCHIP || ARCH_AT91 || COMPILE_TEST
>         depends on VIDEO_DEV && VIDEO_V4L2
>         select MEDIA_CONTROLLER
>         select MEDIA_CONTROLLER_REQUEST_API
> @@ -24,6 +24,14 @@ config VIDEO_HANTRO_IMX8M
>         help
>           Enable support for i.MX8M SoCs.
>  
> +config VIDEO_HANTRO_SAMA5D4
> +       bool "Hantro VDEC SAMA5D4 support"
> +       depends on VIDEO_HANTRO
> +       depends on ARCH_AT91 || COMPILE_TEST
> +       default y
> +       help
> +         Enable support for Microchip SAMA5D4 SoCs.
> +
>  config VIDEO_HANTRO_ROCKCHIP
>         bool "Hantro VPU Rockchip support"
>         depends on VIDEO_HANTRO
> diff --git a/drivers/staging/media/hantro/Makefile b/drivers/staging/media/hantro/Makefile
> index 3747a32799b2..f4b99901eeee 100644
> --- a/drivers/staging/media/hantro/Makefile
> +++ b/drivers/staging/media/hantro/Makefile
> @@ -22,6 +22,9 @@ hantro-vpu-y += \
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_IMX8M) += \
>                 imx8m_vpu_hw.o
>  
> +hantro-vpu-$(CONFIG_VIDEO_HANTRO_SAMA5D4) += \
> +               sama5d4_vdec_hw.o
> +
>  hantro-vpu-$(CONFIG_VIDEO_HANTRO_ROCKCHIP) += \
>                 rk3288_vpu_hw.o \
>                 rk3399_vpu_hw.o
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index d1294eb9cd07..74a3d9eab454 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -478,6 +478,9 @@ static const struct of_device_id of_hantro_match[] = {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> +#endif
> +#ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
> +       { .compatible = "microchip,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
>  #endif
>         { /* sentinel */ }
>  };
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 73c71bb2320c..4d39da1d1581 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -152,6 +152,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
>  extern const struct hantro_variant rk3328_vpu_variant;
>  extern const struct hantro_variant rk3288_vpu_variant;
>  extern const struct hantro_variant imx8mq_vpu_variant;
> +extern const struct hantro_variant sama5d4_vdec_variant;
>  
>  extern const struct hantro_postproc_regs hantro_g1_postproc_regs;
>  
> diff --git a/drivers/staging/media/hantro/sama5d4_vdec_hw.c b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> new file mode 100644
> index 000000000000..d52ac626f98a
> --- /dev/null
> +++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VDEC driver
> + *
> + * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
> + */
> +
> +#include "hantro.h"
> +
> +/*
> + * Supported formats.
> + */
> +
> +static const struct hantro_fmt sama5d4_vdec_postproc_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUYV,
> +               .codec_mode = HANTRO_MODE_NONE,
> +       },
> +};
> +
> +static const struct hantro_fmt sama5d4_vdec_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_NV12,
> +               .codec_mode = HANTRO_MODE_NONE,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
> +               .codec_mode = HANTRO_MODE_MPEG2_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 1280,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 720,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
> +               .codec_mode = HANTRO_MODE_VP8_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 1280,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 720,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .codec_mode = HANTRO_MODE_H264_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 1280,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 720,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +};
> +
> +static int sama5d4_hw_init(struct hantro_dev *vpu)
> +{
> +       return 0;
> +}
> +
> +/*
> + * Supported codec ops.
> + */
> +
> +static const struct hantro_codec_ops sama5d4_vdec_codec_ops[] = {
> +       [HANTRO_MODE_MPEG2_DEC] = {
> +               .run = hantro_g1_mpeg2_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_mpeg2_dec_init,
> +               .exit = hantro_mpeg2_dec_exit,
> +       },
> +       [HANTRO_MODE_VP8_DEC] = {
> +               .run = hantro_g1_vp8_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_vp8_dec_init,
> +               .exit = hantro_vp8_dec_exit,
> +       },
> +       [HANTRO_MODE_H264_DEC] = {
> +               .run = hantro_g1_h264_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_h264_dec_init,
> +               .exit = hantro_h264_dec_exit,
> +       },
> +};
> +
> +static const struct hantro_irq sama5d4_irqs[] = {
> +       { NULL, hantro_g1_irq },

As suggested I think you can have a name in here.

> +};
> +

I would add a comment here explaining why this has to be NULL.

Now that I see this in practice, I'm wondering if we should just
keep the name here, we don't have any NULL names and do
something like this in hantro_probe (in patch 6/9):

        /* If only one clock, we shouldn't have a clock name. */                 
        if (vpu->variant->num_clocks > 1) {                                      
                for (i = 0; i < vpu->variant->num_clocks; i++)                   
                        vpu->clocks[i].id = vpu->variant->clk_names[i];          
        }         

> +static const char * const sama5d4_clk_names[] = { NULL };
> +

Thanks,
Ezequiel

