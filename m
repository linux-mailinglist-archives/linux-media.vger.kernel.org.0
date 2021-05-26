Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32007392332
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 01:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhEZX3f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 19:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234832AbhEZX3f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 19:29:35 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E9BC061574;
        Wed, 26 May 2021 16:28:02 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id f18so5050508ejq.10;
        Wed, 26 May 2021 16:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4EeJCBha5dFMScflX6CEjsoHdXByNHW6tUeVOLomuKU=;
        b=Nz0/7VXjE7tPbYFTrPLUmiPq9EPvsLJJ9+D+ggOLvtnCSavC70KfhXdEnmv83LbnjP
         +jBpMd6U1gI5W9MaCQO5/jaq+g/bOUJ5uDMiT3VoBh8cUV96+5dACBAtiZvRphuVk1WU
         /DSL0WWOj+KfbtPUU2hruECvjw1WEh8+wK1lVpG2o0S8azMU2XoSGOh40nU/8UHoYLK6
         upgfHnWPLpuzfJbiDgB+5HfzuAzkhRkM+dnOnTJ+xdgZ0WiQH4DGVnG69R4sGNx44xfO
         x09UA83qj6eiJcl7BPjevhYmN4BNripGqD0H1JGy9t582EEKyXnOFCb/X0G9udjxqdFy
         q0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4EeJCBha5dFMScflX6CEjsoHdXByNHW6tUeVOLomuKU=;
        b=hV9n1KlqnHXeBw6FIUC1/pVBePCsCKpelDbVW30pnPsNGCyfLtUpKsEQQW39Do1sCB
         y6XHZT/Lk3kNt62lFiJOeek3KY4/pAYoM1d92n/NMdMu2zWAZc0S16AvcAkaqpwRWQbB
         jiKmbFF5ZO/EvyqdQlKTXdhtn0cXZa/+736NNluYiP0jEkMqzMfpksvDzPP8//It5QhR
         8IYbXSnhPmdCrmkj76541fJQo5XaCfJbRWfnfn2js3OX+tRSKWmOzaLvkWTwGSf2yptj
         +2hSTfHyOnmOEfrwYRdiIRgpQPlKENyGf0MsrzxJyXrYIGpAFmOJofxkOYfhQjB1l3L/
         aN7Q==
X-Gm-Message-State: AOAM5331XVehfsph1NCo8fT6YV7H16c3NyiFRDv+toTZeEQTqOx2ykyH
        7q2yHcPh6MOdLAVReQlMrg==
X-Google-Smtp-Source: ABdhPJw4YaTREGs8ooQ14ALjQWeNSAltV66oWzBjzmGD+DMf+860UZ5GCUogoksdjCn5WHzsYuqeiw==
X-Received: by 2002:a17:906:1305:: with SMTP id w5mr731708ejb.404.1622071680848;
        Wed, 26 May 2021 16:28:00 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:e00:bdfb:c34e:3af8:76da? ([2a02:810b:f40:e00:bdfb:c34e:3af8:76da])
        by smtp.gmail.com with ESMTPSA id h9sm152648edr.10.2021.05.26.16.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 16:28:00 -0700 (PDT)
Subject: Re: [PATCH 05/10] media: hantro: add support for Rockchip RK3036
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-staging@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <20210525152225.154302-6-knaerzche@gmail.com>
 <b65236f3b8bbf35411b536df8b260d9f8a9dbd80.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <2640d65e-772b-6af4-f4be-8ed090693c22@gmail.com>
Date:   Thu, 27 May 2021 01:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b65236f3b8bbf35411b536df8b260d9f8a9dbd80.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 26.05.21 um 12:28 schrieb Ezequiel Garcia:
> Hi Alex,
>
> Thanks a lot for the patch.
>
> On Tue, 2021-05-25 at 17:22 +0200, Alex Bee wrote:
>> RK3036's VPU IP block is the same as RK3288 has, except that it doesn't
>> have an encoder, decoding is supported up to 1920x1088 only and the axi
>> clock can be set to 300 MHz max.
>>
>> Add a new RK3036 variant which reflect this differences.
>>
>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>> ---
>>   drivers/staging/media/hantro/hantro_drv.c    |  1 +
>>   drivers/staging/media/hantro/hantro_hw.h     |  1 +
>>   drivers/staging/media/hantro/rk3288_vpu_hw.c | 49 ++++++++++++++++++++
>>   3 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>> index 38ea7b24036e..4f3c08e85bb8 100644
>> --- a/drivers/staging/media/hantro/hantro_drv.c
>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>> @@ -490,6 +490,7 @@ static const struct of_device_id of_hantro_match[] = {
>>          { .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>>          { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>>          { .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
>> +       { .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
>>   #endif
>>   #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>>          { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>> index de2bc367a15a..d8d6b0d3c3b3 100644
>> --- a/drivers/staging/media/hantro/hantro_hw.h
>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>> @@ -164,6 +164,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
>>   extern const struct hantro_variant rk3328_vpu_variant;
>>   extern const struct hantro_variant rk3288_vpu_variant;
>>   extern const struct hantro_variant rk3066_vpu_variant;
>> +extern const struct hantro_variant rk3036_vpu_variant;
>>   extern const struct hantro_variant imx8mq_vpu_variant;
>>   extern const struct hantro_variant sama5d4_vdec_variant;
>>   
>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> index 29805c4bd92f..c4684df4e012 100644
>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>> @@ -174,6 +174,13 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
>>          return IRQ_HANDLED;
>>   }
>>   
>> +static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
>> +{
>> +       /* Bump ACLKs to max. possible freq. to improve performance. */
>> +       clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
>> +       return 0;
>> +}
>> +
>>   static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>>   {
>>          /* Bump ACLKs to max. possible freq. to improve performance. */
>> @@ -209,6 +216,27 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
>>   /*
>>    * Supported codec ops.
>>    */
>> +static const struct hantro_codec_ops rk3036_vpu_codec_ops[] = {
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
>>   static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>>          [HANTRO_MODE_JPEG_ENC] = {
>>                  .run = hantro_h1_jpeg_enc_run,
>> @@ -269,6 +297,10 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>>    * VPU variant.
>>    */
>>   
>> +static const struct hantro_irq rk3036_irqs[] = {
>> +       { "vdpu", hantro_g1_irq },
>> +};
>> +
>>   static const struct hantro_irq rk3288_irqs[] = {
>>          { "vepu", rk3288_vepu_irq },
>>          { "vdpu", hantro_g1_irq },
>> @@ -283,6 +315,23 @@ static const char * const rk3288_clk_names[] = {
>>          "aclk", "hclk"
>>   };
>>   
>> +const struct hantro_variant rk3036_vpu_variant = {
>> +       .dec_offset = 0x400,
> If it doesn't have an encoder, then you should just
> use dec_offset = 0x0.
>
> Thanks,
> Ezequiel
>
That would mean, I'd have to adapt the register offset in the device 
tree - I'd prefer to keep it in line with the TRM. Unless you insist, 
I'd like to keep it this way (It's , btw, the very same for RK3328).

Alex

