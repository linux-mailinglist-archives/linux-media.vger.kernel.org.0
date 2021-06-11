Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95A573A4592
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 17:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhFKPjB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 11:39:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43980 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbhFKPjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 11:39:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 467A11F447D9
Message-ID: <35c24063aec561ca9696ab696fda86d34c38016e.camel@collabora.com>
Subject: Re: [PATCH v2 05/12] media: hantro: merge Rockchip platform drivers
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Alex Bee <knaerzche@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 11 Jun 2021 12:36:39 -0300
In-Reply-To: <20210527154455.358869-6-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
         <20210527154455.358869-1-knaerzche@gmail.com>
         <20210527154455.358869-6-knaerzche@gmail.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alex,

This cleanup looks nice, thanks!

Just a comment about the clock rate and a minor typo.

On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
> Merge the two Rockchip platform drivers into one as it was suggested at
> [1] and [2].
> This will hopefully make it easier to add new variants (which are surely
> to come for Rockchip).
> Also rename from "rk3288" to "v(d/e)pu1" and "rk3399" to "v(d/e)pu2"
> where applicable, as this is the dicition the vendor uses and will
> also refelect the variants that get added later in this series. Rename
> from "rk3288" to "rockchip" if applicable to both hardware versions.
> 
> [1] https://patchwork.kernel.org/project/linux-rockchip/patch/20210107134101.195426-6-paul.kocialkowski@bootlin.com/
> [2] https://patchwork.kernel.org/project/linux-rockchip/patch/20210525152225.154302-5-knaerzche@gmail.com/
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
> 
>  Changes in v2:
>  - added patch
> 
>  drivers/staging/media/hantro/Makefile         |   9 +-
>  drivers/staging/media/hantro/hantro_hw.h      |  22 +-
>  drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 ----------
>  drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 -----------
>  ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
>  ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
>  ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
>  ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
>  .../staging/media/hantro/rockchip_vpu_hw.c    | 356 ++++++++++++++++++
>  9 files changed, 402 insertions(+), 478 deletions(-)
>  delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
>  delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
>  rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
>  create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
> 
[..]
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> new file mode 100644
> index 000000000000..175d0c5dfdbe
> --- /dev/null
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -0,0 +1,356 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
> + *     Jeffy Chen <jeffy.chen@rock-chips.com>
> + */
> +
> +#include <linux/clk.h>
> +
> +#include "hantro.h"
> +#include "hantro_jpeg.h"
> +#include "hantro_h1_regs.h"
> +#include "rockchip_vpu2_regs.h"
> +
> +#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> +

Something for later, could we bump this clock?

Rockchip uses 300MHz and 600MHz even for RK3288,
see arch/arm/boot/dts/rk3288.dtsi:

        vdpu: vdpu@ff9a0400 {
                compatible = "rockchip,vpu-decoder-rk3288", "rockchip,vpu-decoder-v1";
                reg = <0x0 0xff9a0400 0x0 0x400>;
                interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
                interrupt-names = "irq_dec";
                clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
                clock-names = "aclk_vcodec", "hclk_vcodec";
                rockchip,normal-rates = <300000000>, <0>;
                rockchip,advanced-rates = <600000000>, <0>;

On vdpu1 for instance, it switches to the "advanced-rate"
when width > 2560, which I think it's too naive for us.

At least on RK3566 I tested bumping this rate, while still
passing conformance tests.

> +/*
> + * Supported formats.
> + */
> +
> +static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUV420M,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_NV12M,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUYV,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_UYVY,
> +               .codec_mode = HANTRO_MODE_NONE,
> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_JPEG,
> +               .codec_mode = HANTRO_MODE_JPEG_ENC,
> +               .max_depth = 2,
> +               .header_size = JPEG_HEADER_SIZE,
> +               .frmsize = {
> +                       .min_width = 96,
> +                       .max_width = 8192,
> +                       .step_width = MB_DIM,
> +                       .min_height = 32,
> +                       .max_height = 8192,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +};
> +
> +static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_YUYV,
> +               .codec_mode = HANTRO_MODE_NONE,
> +       },
> +};
> +
> +static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
> +       {
> +               .fourcc = V4L2_PIX_FMT_NV12,
> +               .codec_mode = HANTRO_MODE_NONE,
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
> +               .codec_mode = HANTRO_MODE_H264_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 4096,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 2304,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
> +               .codec_mode = HANTRO_MODE_MPEG2_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 1920,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 1088,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
> +               .codec_mode = HANTRO_MODE_VP8_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 3840,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 2160,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +};
> +
> +static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
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
> +                       .max_width = 1920,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 1088,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +       {
> +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
> +               .codec_mode = HANTRO_MODE_VP8_DEC,
> +               .max_depth = 2,
> +               .frmsize = {
> +                       .min_width = 48,
> +                       .max_width = 3840,
> +                       .step_width = MB_DIM,
> +                       .min_height = 48,
> +                       .max_height = 2160,
> +                       .step_height = MB_DIM,
> +               },
> +       },
> +};
> +
> +static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
> +{
> +       struct hantro_dev *vpu = dev_id;
> +       enum vb2_buffer_state state;
> +       u32 status;
> +
> +       status = vepu_read(vpu, H1_REG_INTERRUPT);
> +       state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +       vepu_write(vpu, 0, H1_REG_INTERRUPT);
> +       vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> +
> +       hantro_irq_done(vpu, state);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
> +{
> +       struct hantro_dev *vpu = dev_id;
> +       enum vb2_buffer_state state;
> +       u32 status;
> +
> +       status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
> +       state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +       vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
> +       vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
> +
> +       hantro_irq_done(vpu, state);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
> +{
> +       struct hantro_dev *vpu = dev_id;
> +       enum vb2_buffer_state state;
> +       u32 status;
> +
> +       status = vepu_read(vpu, VEPU_REG_INTERRUPT);
> +       state = (status & VEPU_REG_INTERRUPT_FRAME_READY) ?
> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
> +
> +       vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
> +       vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
> +
> +       hantro_irq_done(vpu, state);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
> +{
> +       /* Bump ACLK to max. possible freq. to improve performance. */
> +       clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
> +       return 0;
> +}
> +
> +static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
> +       vepu_write(vpu, 0, H1_REG_ENC_CTRL);
> +       vepu_write(vpu, 0, H1_REG_AXI_CTRL);
> +}
> +
> +static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
> +       vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
> +       vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
> +}
> +
> +static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
> +{
> +       struct hantro_dev *vpu = ctx->dev;
> +
> +       vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
> +       vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
> +       vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
> +}
> +
> +/*
> + * Supported codec ops.
> + */
> +
> +static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
> +       [HANTRO_MODE_JPEG_ENC] = {
> +               .run = hantro_h1_jpeg_enc_run,
> +               .reset = rockchip_vpu1_enc_reset,
> +               .init = hantro_jpeg_enc_init,
> +               .done = hantro_jpeg_enc_done,
> +               .exit = hantro_jpeg_enc_exit,
> +       },
> +       [HANTRO_MODE_H264_DEC] = {
> +               .run = hantro_g1_h264_dec_run,
> +               .reset = hantro_g1_reset,
> +               .init = hantro_h264_dec_init,
> +               .exit = hantro_h264_dec_exit,
> +       },
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
> +};
> +
> +static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
> +       [HANTRO_MODE_JPEG_ENC] = {
> +               .run = rockchip_vpu2_jpeg_enc_run,
> +               .reset = rockchip_vpu2_enc_reset,
> +               .init = hantro_jpeg_enc_init,
> +               .exit = hantro_jpeg_enc_exit,
> +       },
> +       [HANTRO_MODE_MPEG2_DEC] = {
> +               .run = rockchip_vpu2_mpeg2_dec_run,
> +               .reset = rockchip_vpu2_dec_reset,
> +               .init = hantro_mpeg2_dec_init,
> +               .exit = hantro_mpeg2_dec_exit,
> +       },
> +       [HANTRO_MODE_VP8_DEC] = {
> +               .run = rockchip_vpu2_vp8_dec_run,
> +               .reset = rockchip_vpu2_dec_reset,
> +               .init = hantro_vp8_dec_init,
> +               .exit = hantro_vp8_dec_exit,
> +       },
> +};
> +
> +/*
> + * VPU variant.
> + */
> +
> +static const struct hantro_irq rockchip_vpu1_irqs[] = {
> +       { "vepu", rockchip_vpu1_vepu_irq },
> +       { "vdpu", hantro_g1_irq },
> +};
> +
> +static const struct hantro_irq rockchip_vpdu2_irqs[] = {

Typo: vpdu -> vdpu?

> +       { "vdpu", rockchip_vpu2_vdpu_irq },
> +};
> +

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel


