Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6339232C
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 01:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234802AbhEZXXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 19:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbhEZXXl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 19:23:41 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E29FC061574;
        Wed, 26 May 2021 16:22:08 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t15so3484639edr.11;
        Wed, 26 May 2021 16:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rnslKlGnPBQU92fjFQCpIwpzZm9Y+S8gYr50qAQ52sc=;
        b=GhCnKlk4UAlkTySILsxJ6U/gm6JA1bVEokaNnut17QC1gwTI8RmczPAQ/Cdds6beQv
         AorZRYNgxZ0e0h/YDy5iXWAL8aTojI9dULKAmut+0bxvmhqILOklSpgwf7A/WyhX0MX0
         u1QKkFqwj2YxMMfWL0gSnUjKYF+IgS/C9+fQa3Hr14r9FuAkZa7YpJ1Ny2+IfxTCkA9N
         BgZ4gFt0Xrq7RyGkktUz6UftmbiKrK5Hl+yVecHeYWjU+a7J2lFXHDdbtZn1gre5EhEn
         3vtU2GJAzPds/IFLDOo9SrZ9al6k+KOcVx2c6w97qldT/u4MkDv0ZYpbR0T8BAqcscUB
         NJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rnslKlGnPBQU92fjFQCpIwpzZm9Y+S8gYr50qAQ52sc=;
        b=uQDqMXjMZXV7IG21/ejiUQkDhFOLV+ry/bASjH+h3CwYrnFwRB7Db2w50gQ7DXRdqU
         +f1r4akknr4emliSbJqHTM6a6f0XyRz3Wx40XFNauML7GSay0tfJqamxZwawXF+nGiLC
         EbBsGDMuUMoiB5fXoIqdjgp7lrKqWg230FNtTb8+5EOnGQkgiy7VqscDBDJ0XGtjX7mh
         biZOS9WUqd8DdCoN6qBuSRfdzAbuEcfqPDJkv2LUosB4Khk+UGobSxmRoq320b7OpOv9
         nVnIX0D8bG/rf2e7BCrk28q0vvOAHpnfjyQ+yA00a/CR+6S0EQAmJ1C7nX/d4Lak34pU
         6GDg==
X-Gm-Message-State: AOAM531P4H7z49/1tfv7flzj1DmOhPsTwJ8LYGyHauSSu5X8/gZrPG2G
        e21CZfxnwvZcDD8SDJ2ncJ710s6WH8NT
X-Google-Smtp-Source: ABdhPJw/cNqOZNLrWBmlZ3XZzBxVJ/ihteS5HuAOOOSCPkR5lcXLAXc08kv9x+uIT85Dy+dpU6WMCw==
X-Received: by 2002:a05:6402:176b:: with SMTP id da11mr736799edb.234.1622071326860;
        Wed, 26 May 2021 16:22:06 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:e00:bdfb:c34e:3af8:76da? ([2a02:810b:f40:e00:bdfb:c34e:3af8:76da])
        by smtp.gmail.com with ESMTPSA id gt5sm201006ejb.49.2021.05.26.16.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 16:22:06 -0700 (PDT)
Subject: Re: [PATCH 04/10] media: hantro: add support for Rockchip RK3066
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210525152225.154302-5-knaerzche@gmail.com>
 <3b9a076c1c426a14ed10da743fdb86c1bf2eb603.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <fd0e0872-c661-def7-2c12-a268281bfd9b@gmail.com>
Date:   Thu, 27 May 2021 01:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3b9a076c1c426a14ed10da743fdb86c1bf2eb603.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

thanks for your feedback.

Am 26.05.21 um 12:32 schrieb Ezequiel Garcia:
> Hi Alex,
>
> Thanks for the patch.
>
> On Tue, 2021-05-25 at 17:22 +0200, Alex Bee wrote:
>> RK3066's VPU IP block is the predecessor from what RK3288 has.
>> The hardware differences are:
>>    - supports decoding frame sizes up to 1920x1088 only
>>    - doesn't have the 'G1_REG_SOFT_RESET' register
>>      (requires another .reset callback for hantro_codec_ops,
>>       since writing this register will result in non-working
>>       IP block)
>>    - has one ACLK/HCLK per vdpu/vepu
>>    - ACLKs can be clocked up to 300 MHz only
>>    - no MMU
>>      (no changes required: CMA will be transparently used)
>>
>> Add a new RK3066 variant which reflect this differences. This variant
>> can be used for RK3188 as well.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> ---
>>   drivers/staging/media/hantro/hantro_drv.c    |   1 +
>>   drivers/staging/media/hantro/hantro_hw.h     |   1 +
>>   drivers/staging/media/hantro/rk3288_vpu_hw.c | 116 +++++++++++++++++++
>>   3 files changed, 118 insertions(+)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index 2f6b01c7a6a0..38ea7b24036e 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -489,6 +489,7 @@ static const struct of_device_id of_hantro_match[] = {
>>          { .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>>          { .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>>          { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>> +       { .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
>>   #endif
>>   #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>>          { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index 3d8b53567f16..de2bc367a15a 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -163,6 +163,7 @@ enum hantro_enc_fmt {
>>   extern const struct hantro_variant rk3399_vpu_variant;
>>   extern const struct hantro_variant rk3328_vpu_variant;
>>   extern const struct hantro_variant rk3288_vpu_variant;
>> +extern const struct hantro_variant rk3066_vpu_variant;
>>   extern const struct hantro_variant imx8mq_vpu_variant;
>>   extern const struct hantro_variant sama5d4_vdec_variant;
>>   
>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> index fefd45269e52..29805c4bd92f 100644
>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> @@ -10,8 +10,10 @@
>>   
>>   #include "hantro.h"
>>   #include "hantro_jpeg.h"
>> +#include "hantro_g1_regs.h"
>>   #include "hantro_h1_regs.h"
>>   
>> +#define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>>   #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
>>   
>>   /*
>> @@ -62,6 +64,52 @@ static const struct hantro_fmt rk3288_vpu_postproc_fmts[] = {
>>          },
>>   };
>>   
>> +static const struct hantro_fmt rk3066_vpu_dec_fmts[] = {
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
>> +                       .max_width = 1920,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 1088,
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
>> +                       .max_width = 1920,
>> +                       .step_width = MB_DIM,
>> +                       .min_height = 48,
>> +                       .max_height = 1088,
>> +                       .step_height = MB_DIM,
>> +               },
>> +       },
>> +};
>> +
>>   static const struct hantro_fmt rk3288_vpu_dec_fmts[] = {
>>          {
>>                  .fourcc = V4L2_PIX_FMT_NV12,
>> @@ -126,6 +174,14 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
>>          return IRQ_HANDLED;
>>   }
>>   
>> +static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>> +{
>> +       /* Bump ACLKs to max. possible freq. to improve performance. */
>> +       clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
>> +       clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
>> +       return 0;
>> +}
>> +
>>   static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
>>   {
>>          /* Bump ACLK to max. possible freq. to improve performance. */
>> @@ -133,6 +189,14 @@ static int rk3288_vpu_hw_init(struct hantro_dev *vpu)
>>          return 0;
>>   }
>>   
>> +static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
>> +{
>> +       struct hantro_dev *vpu = ctx->dev;
>> +
>> +       vdpu_write(vpu, G1_REG_INTERRUPT_DEC_IRQ_DIS, G1_REG_INTERRUPT);
>> +       vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
>> +}
>> +
>>   static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
>>   {
>>          struct hantro_dev *vpu = ctx->dev;
>> @@ -145,6 +209,33 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
>>   /*
>>    * Supported codec ops.
>>    */
>> +static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>> +       [HANTRO_MODE_JPEG_ENC] = {
>> +               .run = hantro_h1_jpeg_enc_run,
>> +               .reset = rk3288_vpu_enc_reset,
>> +               .init = hantro_jpeg_enc_init,
>> +               .done = hantro_jpeg_enc_done,
>> +               .exit = hantro_jpeg_enc_exit,
>> +       },
>> +       [HANTRO_MODE_H264_DEC] = {
>> +               .run = hantro_g1_h264_dec_run,
>> +               .reset = rk3066_vpu_dec_reset,
>> +               .init = hantro_h264_dec_init,
>> +               .exit = hantro_h264_dec_exit,
>> +       },
>> +       [HANTRO_MODE_MPEG2_DEC] = {
>> +               .run = hantro_g1_mpeg2_dec_run,
>> +               .reset = rk3066_vpu_dec_reset,
>> +               .init = hantro_mpeg2_dec_init,
>> +               .exit = hantro_mpeg2_dec_exit,
>> +       },
>> +       [HANTRO_MODE_VP8_DEC] = {
>> +               .run = hantro_g1_vp8_dec_run,
>> +               .reset = rk3066_vpu_dec_reset,
>> +               .init = hantro_vp8_dec_init,
>> +               .exit = hantro_vp8_dec_exit,
>> +       },
>> +};
>>   
>>   static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>>          [HANTRO_MODE_JPEG_ENC] = {
>> @@ -183,10 +274,35 @@ static const struct hantro_irq rk3288_irqs[] = {
>>          { "vdpu", hantro_g1_irq },
>>   };
>>   
>> +static const char * const rk3066_clk_names[] = {
>> +       "aclk_vdpu", "hclk_vdpu",
>> +       "aclk_vepu", "hclk_vepu"
>> +};
>> +
>>   static const char * const rk3288_clk_names[] = {
>>          "aclk", "hclk"
>>   };
>>   
>> +const struct hantro_variant rk3066_vpu_variant = {
>> +       .enc_offset = 0x0,
>> +       .enc_fmts = rk3288_vpu_enc_fmts,
>> +       .num_enc_fmts = ARRAY_SIZE(rk3288_vpu_enc_fmts),
>> +       .dec_offset = 0x400,
> Having decoder and encoder supported by a single devicetree
> node was done for RK3288 to cope with some bug in the hardware
> that was effectively linking the decoder and the encoder.
>
> AFAIK, Rockchip has fixed this, so unless there's a strong
> need, I prefer we keep them separated, with one DT node
> for the g1 decoder and one for the h1 encoder.
>
> Thanks!
> Ezequiel
>
I just checked it: despite it looks like we could use the decoder and 
encoder separately

(separate clocks for decoder / encoder) the VPU block won't work (SoC 
crashes),

if not all 4 clocks are enabled for neither decoding nor encoding.

I'd prefer the other way also, but it seems not possible.

Alex.

