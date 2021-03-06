Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CF132F9B3
	for <lists+linux-media@lfdr.de>; Sat,  6 Mar 2021 12:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhCFL0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Mar 2021 06:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhCFLZj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 6 Mar 2021 06:25:39 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FDA7C06175F
        for <linux-media@vger.kernel.org>; Sat,  6 Mar 2021 03:25:38 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 6F1931F46561
Message-ID: <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>, kernel@collabora.com,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Date:   Sat, 06 Mar 2021 08:25:26 -0300
In-Reply-To: <20210305183924.1754026-8-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
         <20210305183924.1754026-8-emil.l.velikov@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

(adding another Nicolas)

Hi Emil,

Thanks a lot for the patch.

On Fri, 2021-03-05 at 18:39 +0000, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> The SoC features a Hantro G1 compatible video decoder.
> 
> Cc: Ezequiel Garcia <ezequiel@collabora.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  arch/arm/boot/dts/sama5d4.dtsi                |   9 ++

Usually device-tree changes go to their own patch.

The new compatible string "atmel,sama5d4-vdec" needs
an update to the DT bindings, see Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
for an example.

DT bindings change should also go to a separate
patch, see Documentation/devicetree/bindings/submitting-patches.rst.

>  arch/arm/configs/sama5_defconfig              |   3 +

Better if config changes are a separate patch.

But also, the driver is in staging and we haven't enabled
in ARM64 defconfig. Let's leave that decision to the machine
maintainer to decide.

>  drivers/staging/media/hantro/Kconfig          |  10 +-
>  drivers/staging/media/hantro/Makefile         |   3 +
>  drivers/staging/media/hantro/hantro_drv.c     |   3 +
>  drivers/staging/media/hantro/hantro_hw.h      |   1 +
>  .../staging/media/hantro/sama5d4_vdec_hw.c    | 118 ++++++++++++++++++
>  7 files changed, 146 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c
> 
> diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
> index 05c55875835d..deaf1f6cc784 100644
> --- a/arch/arm/boot/dts/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/sama5d4.dtsi
> @@ -101,6 +101,15 @@ nfc_sram: sram@100000 {
>                         ranges = <0 0x100000 0x2400>;
>                 };
>  
> +               vdec0: vdec@00300000 {
> +                       compatible = "atmel,sama5d4-vdec";
> +                       reg = <0x00300000 0x100000>;
> +                       interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
> +                       interrupt-names = "vdec";
> +                       clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
> +                       clock-names = "vdec_clk";
> +               };
> +
>                 usb0: gadget@400000 {
>                         compatible = "atmel,sama5d3-udc";
>                         reg = <0x00400000 0x100000
> diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
> index 0dca50c64503..10806f38abfb 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -200,6 +200,9 @@ CONFIG_RTC_DRV_AT91RM9200=y
>  CONFIG_DMADEVICES=y
>  CONFIG_AT_HDMAC=y
>  CONFIG_AT_XDMAC=y
> +CONFIG_STAGING=y
> +CONFIG_STAGING_MEDIA=y
> +CONFIG_VIDEO_HANTRO=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_IIO=y
>  CONFIG_AT91_ADC=y
> diff --git a/drivers/staging/media/hantro/Kconfig b/drivers/staging/media/hantro/Kconfig
> index 5b6cf9f62b1a..43762c8164e0 100644
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
> +         Enable support for Atmel SAMA5D4 SoCs.
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
> index e5f200e64993..19f1202574a2 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -478,6 +478,9 @@ static const struct of_device_id of_hantro_match[] = {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>         { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
> +#endif
> +#ifdef CONFIG_VIDEO_HANTRO_SAMA5D4
> +       { .compatible = "atmel,sama5d4-vdec", .data = &sama5d4_vdec_variant, },
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
> index 000000000000..9cf1068d986b
> --- /dev/null
> +++ b/drivers/staging/media/hantro/sama5d4_vdec_hw.c
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VDEC driver
> + *
> + * Copyright (C) 2021 Collabora Ltd, Emil Velikov <emil.velikov@collabora.com>
> + */
> +
> +#include "hantro.h"
> +
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

I haven't found information on how the series
was tested in the cover letter, could you add that to the next
iteration?

Please test the YUYV post-processed output and MPEG-2 decoding as well.

Also add the fluster score on this platform, and while here you could
give a pass at v4l2-compliance, which should pass without failures.
Note that you need to use v4l2-compliance HEAD from git.

https://git.linuxtv.org/v4l-utils.git

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

Ah, the hantro_variant.init ops is not optional, but
if this VPU has no hw-specific init, then it should be.

In any case, we might get rid of it soon: Benjamin's work
will hopefully remove the i.MX8M need for ctrl_base.

And then the static clk_set_rate() in Rockchip variants could
be replaced with some dynamic rate using devfreq.

Thanks!
Ezequiel

