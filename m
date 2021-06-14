Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010E83A6C9F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 19:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhFNRF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 13:05:28 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]:33400 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233795AbhFNRF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 13:05:26 -0400
Received: by mail-wr1-f53.google.com with SMTP id a20so15349898wrc.0;
        Mon, 14 Jun 2021 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=H7yznGHlzfPxvDpvZSbqFd5fVDqQ5LFFKjpUq3W88rg=;
        b=eQzf6PJn6Zk1h/GN3B0JmHx0rAjPNLihmapVuV7mJKiCo3bhpaST/DcK68HSBsBf9D
         yXYoRlPQkhGh3DRxeuzzAxfmsYyrhLaB/feUN0ym1TwyNSPGph3eElvlw6WFShiRbv+F
         gEzkzGHGMzREQQYj1bWXp/OaIyT91fhFtlxzaDrfxZ5uPlDM8SuSgfs4t23tCSMxl1Sh
         g5S4L/6o3NA1Zbhld8CYwXiaT6/hdC3x0+UScFFW3LwOplSe/SwcCWC4ohHo12nFmxEx
         xJEhu/wWEZAqtt3N6VDjte7t4Phs80dBzqkWap2LdIUEMzXxNck81+EJqwGOnjk0dXwj
         oL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=H7yznGHlzfPxvDpvZSbqFd5fVDqQ5LFFKjpUq3W88rg=;
        b=dmvpqw/BGXjA8XRpjZZx3b3gbdQEYr35y85QzPbZpupPfwRZSuiCda4c+leNllIPIt
         KPWfpVTOaPg9egJg7b6f42gz6nnnZrpydmLMGBA9NCssOaznpqFmZhPWit06Hs88GkEz
         /5lE9qYXld4OyA2bf3hgbfh3QVCLoy7EhhIhTwcZ3ggraxmHYd+w2kj0i06f9dQZF+H2
         4+5oWXRt1oPiG38qe0XoAylbG+ZaWktNV5QC1F03nlJiEMmY6M0zi6WwooDtoRavwYJ8
         KSYDBX1z2w0/i4T8k/y6+H32TKV9UsId8rOxpU5bzCRNOONayCcLsLJtt0MRnGS2Hwzz
         6ssw==
X-Gm-Message-State: AOAM530Tt4sGco50yzCLlnXiCFmqmfxm5ZddWz0bH5GkzHVqQejCVMrd
        jjpWsGrCsW+3AHsp4s5sLA==
X-Google-Smtp-Source: ABdhPJy7b4eSjTkgfw/IxRkzpfMfUcVmAIq1umEwAkfPgPl7K9B+Fd5iZM/qYWqycRgOBXrogfGRjw==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr19591862wrs.421.1623690142709;
        Mon, 14 Jun 2021 10:02:22 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id u15sm374626wmq.1.2021.06.14.10.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 10:02:22 -0700 (PDT)
Subject: Re: [PATCH v2 05/12] media: hantro: merge Rockchip platform drivers
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210527154455.358869-1-knaerzche@gmail.com>
 <20210527154455.358869-6-knaerzche@gmail.com>
 <35c24063aec561ca9696ab696fda86d34c38016e.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <f591c11d-3c9d-961d-ce72-6c7cf8e0d403@gmail.com>
Date:   Mon, 14 Jun 2021 19:02:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <35c24063aec561ca9696ab696fda86d34c38016e.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 11.06.21 um 17:36 schrieb Ezequiel Garcia:
> Hi Alex,
>
> This cleanup looks nice, thanks!
>
> Just a comment about the clock rate and a minor typo.
>
> On Thu, 2021-05-27 at 17:44 +0200, Alex Bee wrote:
>> Merge the two Rockchip platform drivers into one as it was suggested at
>> [1] and [2].
>> This will hopefully make it easier to add new variants (which are surely
>> to come for Rockchip).
>> Also rename from "rk3288" to "v(d/e)pu1" and "rk3399" to "v(d/e)pu2"
>> where applicable, as this is the dicition the vendor uses and will
>> also refelect the variants that get added later in this series. Rename
>> from "rk3288" to "rockchip" if applicable to both hardware versions.
>>
>> [1] https://patchwork.kernel.org/project/linux-rockchip/patch/20210107134101.195426-6-paul.kocialkowski@bootlin.com/
>> [2] https://patchwork.kernel.org/project/linux-rockchip/patch/20210525152225.154302-5-knaerzche@gmail.com/
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> ---
>>
>>   Changes in v2:
>>   - added patch
>>
>>   drivers/staging/media/hantro/Makefile         |   9 +-
>>   drivers/staging/media/hantro/hantro_hw.h      |  22 +-
>>   drivers/staging/media/hantro/rk3288_vpu_hw.c  | 208 ----------
>>   drivers/staging/media/hantro/rk3399_vpu_hw.c  | 222 -----------
>>   ...jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} |  30 +-
>>   ...eg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} |  25 +-
>>   ...w_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} |   2 +-
>>   ...rk3399_vpu_regs.h => rockchip_vpu2_regs.h} |   6 +-
>>   .../staging/media/hantro/rockchip_vpu_hw.c    | 356 ++++++++++++++++++
>>   9 files changed, 402 insertions(+), 478 deletions(-)
>>   delete mode 100644 drivers/staging/media/hantro/rk3288_vpu_hw.c
>>   delete mode 100644 drivers/staging/media/hantro/rk3399_vpu_hw.c
>>   rename drivers/staging/media/hantro/{rk3399_vpu_hw_jpeg_enc.c => rockchip_vpu2_hw_jpeg_enc.c} (87%)
>>   rename drivers/staging/media/hantro/{rk3399_vpu_hw_mpeg2_dec.c => rockchip_vpu2_hw_mpeg2_dec.c} (93%)
>>   rename drivers/staging/media/hantro/{rk3399_vpu_hw_vp8_dec.c => rockchip_vpu2_hw_vp8_dec.c} (99%)
>>   rename drivers/staging/media/hantro/{rk3399_vpu_regs.h => rockchip_vpu2_regs.h} (99%)
>>   create mode 100644 drivers/staging/media/hantro/rockchip_vpu_hw.c
>>
> [..]
>> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
>> new file mode 100644
>> index 000000000000..175d0c5dfdbe
>> --- /dev/null
>> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
>> @@ -0,0 +1,356 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Hantro VPU codec driver
>> + *
>> + * Copyright (C) 2018 Rockchip Electronics Co., Ltd.
>> + *     Jeffy Chen <jeffy.chen@rock-chips.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +
>> +#include "hantro.h"
>> +#include "hantro_jpeg.h"
>> +#include "hantro_h1_regs.h"
>> +#include "rockchip_vpu2_regs.h"
>> +
>> +#define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
>> +
> Something for later, could we bump this clock?
>
> Rockchip uses 300MHz and 600MHz even for RK3288,
> see arch/arm/boot/dts/rk3288.dtsi:
>
>          vdpu: vdpu@ff9a0400 {
>                  compatible = "rockchip,vpu-decoder-rk3288", "rockchip,vpu-decoder-v1";
>                  reg = <0x0 0xff9a0400 0x0 0x400>;
>                  interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>                  interrupt-names = "irq_dec";
>                  clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
>                  clock-names = "aclk_vcodec", "hclk_vcodec";
>                  rockchip,normal-rates = <300000000>, <0>;
>                  rockchip,advanced-rates = <600000000>, <0>;
>
> On vdpu1 for instance, it switches to the "advanced-rate"
> when width > 2560, which I think it's too naive for us.
>
> At least on RK3566 I tested bumping this rate, while still
> passing conformance tests.

Yes, RK3288's can (and maybe also should) run at 600 MHz (since we are 
sugesting to "Bump ACLK to max. possible freq. to improve performance." 
currently) - but I never ran conformance tests after setting this rate, tbh.

I'm also not sure, VDPU2 (RK3399) variant supports VP8 up to 3840x2160p. 
It would be the only codec supported up that frame size (we already 
know, that H.264 is supported up to 1920x1088, even if it is not 
supported currently by upstream hantro driver) and TRM says the hantro 
IP block is a "1080P encoder/decoder Processing Core", without saying 
anything specific per codec.

Both should be checked and addressed in a upcoming series.

>> +/*
>> + * Supported formats.
>> + */
>> +
>> +static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_YUV420M,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420P,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV12M,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUV420SP,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_YUYV,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_YUYV422,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_UYVY,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +               .enc_fmt = ROCKCHIP_VPU_ENC_FMT_UYVY422,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_JPEG,
>> +               .codec_mode = HANTRO_MODE_JPEG_ENC,
>> +               .max_depth = 2,
>> +               .header_size = JPEG_HEADER_SIZE,
>> +               .frmsize = {
>> +                       .min_width = 96,
>> +                       .max_width = 8192,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 32,
>> +                       .max_height = 8192,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct hantro_fmt rockchip_vpu1_postproc_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_YUYV,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +       },
>> +};
>> +
>> +static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV12,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_H264_SLICE,
>> +               .codec_mode = HANTRO_MODE_H264_DEC,
>> +               .max_depth = 2,
>> +               .frmsize = {
>> +                       .min_width = 48,
>> +                       .max_width = 4096,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 2304,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
>> +               .codec_mode = HANTRO_MODE_MPEG2_DEC,
>> +               .max_depth = 2,
>> +               .frmsize = {
>> +                       .min_width = 48,
>> +                       .max_width = 1920,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 1088,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
>> +               .codec_mode = HANTRO_MODE_VP8_DEC,
>> +               .max_depth = 2,
>> +               .frmsize = {
>> +                       .min_width = 48,
>> +                       .max_width = 3840,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 2160,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +};
>> +
>> +static const struct hantro_fmt rk3399_vpu_dec_fmts[] = {
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_NV12,
>> +               .codec_mode = HANTRO_MODE_NONE,
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
>> +               .codec_mode = HANTRO_MODE_MPEG2_DEC,
>> +               .max_depth = 2,
>> +               .frmsize = {
>> +                       .min_width = 48,
>> +                       .max_width = 1920,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 1088,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +       {
>> +               .fourcc = V4L2_PIX_FMT_VP8_FRAME,
>> +               .codec_mode = HANTRO_MODE_VP8_DEC,
>> +               .max_depth = 2,
>> +               .frmsize = {
>> +                       .min_width = 48,
>> +                       .max_width = 3840,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 2160,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +};
>> +
>> +static irqreturn_t rockchip_vpu1_vepu_irq(int irq, void *dev_id)
>> +{
>> +       struct hantro_dev *vpu = dev_id;
>> +       enum vb2_buffer_state state;
>> +       u32 status;
>> +
>> +       status = vepu_read(vpu, H1_REG_INTERRUPT);
>> +       state = (status & H1_REG_INTERRUPT_FRAME_RDY) ?
>> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +
>> +       vepu_write(vpu, 0, H1_REG_INTERRUPT);
>> +       vepu_write(vpu, 0, H1_REG_AXI_CTRL);
>> +
>> +       hantro_irq_done(vpu, state);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t rockchip_vpu2_vdpu_irq(int irq, void *dev_id)
>> +{
>> +       struct hantro_dev *vpu = dev_id;
>> +       enum vb2_buffer_state state;
>> +       u32 status;
>> +
>> +       status = vdpu_read(vpu, VDPU_REG_INTERRUPT);
>> +       state = (status & VDPU_REG_INTERRUPT_DEC_IRQ) ?
>> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +
>> +       vdpu_write(vpu, 0, VDPU_REG_INTERRUPT);
>> +       vdpu_write(vpu, 0, VDPU_REG_AXI_CTRL);
>> +
>> +       hantro_irq_done(vpu, state);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
>> +{
>> +       struct hantro_dev *vpu = dev_id;
>> +       enum vb2_buffer_state state;
>> +       u32 status;
>> +
>> +       status = vepu_read(vpu, VEPU_REG_INTERRUPT);
>> +       state = (status & VEPU_REG_INTERRUPT_FRAME_READY) ?
>> +               VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>> +
>> +       vepu_write(vpu, 0, VEPU_REG_INTERRUPT);
>> +       vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
>> +
>> +       hantro_irq_done(vpu, state);
>> +
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
>> +{
>> +       /* Bump ACLK to max. possible freq. to improve performance. */
>> +       clk_set_rate(vpu->clocks[0].clk, RK3288_ACLK_MAX_FREQ);
>> +       return 0;
>> +}
>> +
>> +static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)
>> +{
>> +       struct hantro_dev *vpu = ctx->dev;
>> +
>> +       vepu_write(vpu, H1_REG_INTERRUPT_DIS_BIT, H1_REG_INTERRUPT);
>> +       vepu_write(vpu, 0, H1_REG_ENC_CTRL);
>> +       vepu_write(vpu, 0, H1_REG_AXI_CTRL);
>> +}
>> +
>> +static void rockchip_vpu2_dec_reset(struct hantro_ctx *ctx)
>> +{
>> +       struct hantro_dev *vpu = ctx->dev;
>> +
>> +       vdpu_write(vpu, VDPU_REG_INTERRUPT_DEC_IRQ_DIS, VDPU_REG_INTERRUPT);
>> +       vdpu_write(vpu, 0, VDPU_REG_EN_FLAGS);
>> +       vdpu_write(vpu, 1, VDPU_REG_SOFT_RESET);
>> +}
>> +
>> +static void rockchip_vpu2_enc_reset(struct hantro_ctx *ctx)
>> +{
>> +       struct hantro_dev *vpu = ctx->dev;
>> +
>> +       vepu_write(vpu, VEPU_REG_INTERRUPT_DIS_BIT, VEPU_REG_INTERRUPT);
>> +       vepu_write(vpu, 0, VEPU_REG_ENCODE_START);
>> +       vepu_write(vpu, 0, VEPU_REG_AXI_CTRL);
>> +}
>> +
>> +/*
>> + * Supported codec ops.
>> + */
>> +
>> +static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>> +       [HANTRO_MODE_JPEG_ENC] = {
>> +               .run = hantro_h1_jpeg_enc_run,
>> +               .reset = rockchip_vpu1_enc_reset,
>> +               .init = hantro_jpeg_enc_init,
>> +               .done = hantro_jpeg_enc_done,
>> +               .exit = hantro_jpeg_enc_exit,
>> +       },
>> +       [HANTRO_MODE_H264_DEC] = {
>> +               .run = hantro_g1_h264_dec_run,
>> +               .reset = hantro_g1_reset,
>> +               .init = hantro_h264_dec_init,
>> +               .exit = hantro_h264_dec_exit,
>> +       },
>> +       [HANTRO_MODE_MPEG2_DEC] = {
>> +               .run = hantro_g1_mpeg2_dec_run,
>> +               .reset = hantro_g1_reset,
>> +               .init = hantro_mpeg2_dec_init,
>> +               .exit = hantro_mpeg2_dec_exit,
>> +       },
>> +       [HANTRO_MODE_VP8_DEC] = {
>> +               .run = hantro_g1_vp8_dec_run,
>> +               .reset = hantro_g1_reset,
>> +               .init = hantro_vp8_dec_init,
>> +               .exit = hantro_vp8_dec_exit,
>> +       },
>> +};
>> +
>> +static const struct hantro_codec_ops rk3399_vpu_codec_ops[] = {
>> +       [HANTRO_MODE_JPEG_ENC] = {
>> +               .run = rockchip_vpu2_jpeg_enc_run,
>> +               .reset = rockchip_vpu2_enc_reset,
>> +               .init = hantro_jpeg_enc_init,
>> +               .exit = hantro_jpeg_enc_exit,
>> +       },
>> +       [HANTRO_MODE_MPEG2_DEC] = {
>> +               .run = rockchip_vpu2_mpeg2_dec_run,
>> +               .reset = rockchip_vpu2_dec_reset,
>> +               .init = hantro_mpeg2_dec_init,
>> +               .exit = hantro_mpeg2_dec_exit,
>> +       },
>> +       [HANTRO_MODE_VP8_DEC] = {
>> +               .run = rockchip_vpu2_vp8_dec_run,
>> +               .reset = rockchip_vpu2_dec_reset,
>> +               .init = hantro_vp8_dec_init,
>> +               .exit = hantro_vp8_dec_exit,
>> +       },
>> +};
>> +
>> +/*
>> + * VPU variant.
>> + */
>> +
>> +static const struct hantro_irq rockchip_vpu1_irqs[] = {
>> +       { "vepu", rockchip_vpu1_vepu_irq },
>> +       { "vdpu", hantro_g1_irq },
>> +};
>> +
>> +static const struct hantro_irq rockchip_vpdu2_irqs[] = {
> Typo: vpdu -> vdpu?
Will fix it in v3.
>
>> +       { "vdpu", rockchip_vpu2_vdpu_irq },
>> +};
>> +
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>
> Thanks,
> Ezequiel
>
Alex
