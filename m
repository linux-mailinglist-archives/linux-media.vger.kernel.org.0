Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B9A3936DA
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 22:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbhE0UN1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 16:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhE0UN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 16:13:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE50C061574;
        Thu, 27 May 2021 13:11:52 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lz27so1940033ejb.11;
        Thu, 27 May 2021 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Z4O262zvwdzEulJ1jOXjydwpNCfVHkhFBEvdIzwEWgY=;
        b=Quo3b25aI5myNRSroj4sBbxZE43SnF6FdFJiHd3iyVpUvlabe1/MFfY+EN/T4dNNw6
         EErfCcDdl/ZnNpQEannARjFO+HI6xDdr4mnJL2Rl8L0w0KLHqS7I+r56TepRBMg920ds
         OOD2lfA7FyJh0KGuQkiIATP2qpLE9if5U54Y2RbWMFdSAFCIUPWlwBI0VFZ3IWqzwEE6
         IMuoXYb77w3x7eHTOFzf9mjcyKvumvIGOXPQo52IkQdxv/bVmOix7SomELWjq4UawnTH
         V8qm5KTtm6eX7suzm3Yq0BjkoTMh274p9W/FwQuTKK4EnAmfr4nZ98rQVdMEwuCGKxFf
         sqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Z4O262zvwdzEulJ1jOXjydwpNCfVHkhFBEvdIzwEWgY=;
        b=MH0IZa5BmPsWvcFrrbDKfU8lmP2gAixMCn5IEbpMuB+r/uQVg0jOkCYNSr/N1pi48j
         aqGTCSZyHxKJtKujvOPwmbb3by2+PsMH6lbu4G+eDLLpaJsLt8hr/OIZqqzVNWoMQbTR
         5k3Yqs0d265kZPwx1SxWfPeQfKCrOKlWtActcDTNMzlsibnwD3gcRhtL9NxSWEaCuTH0
         64INQJwe79it6N7chLSa+hF5oQN+IzIaj4ysVdt9tZmhAk2/kueBmPu2NjTpkEDaKSk5
         LL3xe2xZ898taz395GLw762VjZaFOxi53PWsOxjaU8f+GOwEDLJNUhNkGmbNWqQ6UO8F
         rM4g==
X-Gm-Message-State: AOAM532Khbc9gmFPlMDUTuImYbAy7Dgd18UVV8mbPq7cccQhyvs84eWv
        QtrsKjbVHmJTY65SSeTtSw==
X-Google-Smtp-Source: ABdhPJwrJbGNSMtyEy6jE13u3m0gWh7BUIHAkR5HvVPWV2Q1IOR/pipJ+wT5bvil1rm2VKGwaJH6+A==
X-Received: by 2002:a17:906:2854:: with SMTP id s20mr5694966ejc.335.1622146310491;
        Thu, 27 May 2021 13:11:50 -0700 (PDT)
Received: from ?IPv6:2a02:810b:f40:e00:34ce:e50a:89a4:5545? ([2a02:810b:f40:e00:34ce:e50a:89a4:5545])
        by smtp.gmail.com with ESMTPSA id j7sm1603121edr.79.2021.05.27.13.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 May 2021 13:11:49 -0700 (PDT)
Subject: Re: [PATCH 05/10] media: hantro: add support for Rockchip RK3036
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-staging@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20210525152225.154302-1-knaerzche@gmail.com>
 <b65236f3b8bbf35411b536df8b260d9f8a9dbd80.camel@collabora.com>
 <2640d65e-772b-6af4-f4be-8ed090693c22@gmail.com> <3559518.1BCLMh4Saa@diego>
 <4fadcb3d33beadb113e0e41596e5255d0d8d08dd.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <9113891e-ba88-7402-2226-5b3709215544@gmail.com>
Date:   Thu, 27 May 2021 22:11:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4fadcb3d33beadb113e0e41596e5255d0d8d08dd.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 27.05.21 um 03:27 schrieb Ezequiel Garcia:
> On Thu, 2021-05-27 at 01:58 +0200, Heiko Stübner wrote:
>> Am Donnerstag, 27. Mai 2021, 01:27:59 CEST schrieb Alex Bee:
>>> Hi Ezequiel,
>>>
>>> Am 26.05.21 um 12:28 schrieb Ezequiel Garcia:
>>>> Hi Alex,
>>>>
>>>> Thanks a lot for the patch.
>>>>
>>>> On Tue, 2021-05-25 at 17:22 +0200, Alex Bee wrote:
>>>>> RK3036's VPU IP block is the same as RK3288 has, except that it doesn't
>>>>> have an encoder, decoding is supported up to 1920x1088 only and the axi
>>>>> clock can be set to 300 MHz max.
>>>>>
>>>>> Add a new RK3036 variant which reflect this differences.
>>>>>
>>>>> Signed-off-by: Alex Bee <knaerzche@gmail.com>
>>>>> ---
>>>>>    drivers/staging/media/hantro/hantro_drv.c    |  1 +
>>>>>    drivers/staging/media/hantro/hantro_hw.h     |  1 +
>>>>>    drivers/staging/media/hantro/rk3288_vpu_hw.c | 49 ++++++++++++++++++++
>>>>>    3 files changed, 51 insertions(+)
>>>>>
>>>>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>>>>> index 38ea7b24036e..4f3c08e85bb8 100644
>>>>> --- a/drivers/staging/media/hantro/hantro_drv.c
>>>>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>>>>> @@ -490,6 +490,7 @@ static const struct of_device_id of_hantro_match[] = {
>>>>>           { .compatible = "rockchip,rk3328-vpu", .data = &rk3328_vpu_variant, },
>>>>>           { .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
>>>>>           { .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
>>>>> +       { .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
>>>>>    #endif
>>>>>    #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>>>>>           { .compatible = "nxp,imx8mq-vpu", .data = &imx8mq_vpu_variant, },
>>>>> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
>>>>> index de2bc367a15a..d8d6b0d3c3b3 100644
>>>>> --- a/drivers/staging/media/hantro/hantro_hw.h
>>>>> +++ b/drivers/staging/media/hantro/hantro_hw.h
>>>>> @@ -164,6 +164,7 @@ extern const struct hantro_variant rk3399_vpu_variant;
>>>>>    extern const struct hantro_variant rk3328_vpu_variant;
>>>>>    extern const struct hantro_variant rk3288_vpu_variant;
>>>>>    extern const struct hantro_variant rk3066_vpu_variant;
>>>>> +extern const struct hantro_variant rk3036_vpu_variant;
>>>>>    extern const struct hantro_variant imx8mq_vpu_variant;
>>>>>    extern const struct hantro_variant sama5d4_vdec_variant;
>>>>>    
>>>>> diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>>>>> index 29805c4bd92f..c4684df4e012 100644
>>>>> --- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
>>>>> +++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
>>>>> @@ -174,6 +174,13 @@ static irqreturn_t rk3288_vepu_irq(int irq, void *dev_id)
>>>>>           return IRQ_HANDLED;
>>>>>    }
>>>>>    
>>>>> +static int rk3036_vpu_hw_init(struct hantro_dev *vpu)
>>>>> +{
>>>>> +       /* Bump ACLKs to max. possible freq. to improve performance. */
>>>>> +       clk_set_rate(vpu->clocks[0].clk, RK3066_ACLK_MAX_FREQ);
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>>    static int rk3066_vpu_hw_init(struct hantro_dev *vpu)
>>>>>    {
>>>>>           /* Bump ACLKs to max. possible freq. to improve performance. */
>>>>> @@ -209,6 +216,27 @@ static void rk3288_vpu_enc_reset(struct hantro_ctx *ctx)
>>>>>    /*
>>>>>     * Supported codec ops.
>>>>>     */
>>>>> +static const struct hantro_codec_ops rk3036_vpu_codec_ops[] = {
>>>>> +       [HANTRO_MODE_H264_DEC] = {
>>>>> +               .run = hantro_g1_h264_dec_run,
>>>>> +               .reset = hantro_g1_reset,
>>>>> +               .init = hantro_h264_dec_init,
>>>>> +               .exit = hantro_h264_dec_exit,
>>>>> +       },
>>>>> +       [HANTRO_MODE_MPEG2_DEC] = {
>>>>> +               .run = hantro_g1_mpeg2_dec_run,
>>>>> +               .reset = hantro_g1_reset,
>>>>> +               .init = hantro_mpeg2_dec_init,
>>>>> +               .exit = hantro_mpeg2_dec_exit,
>>>>> +       },
>>>>> +       [HANTRO_MODE_VP8_DEC] = {
>>>>> +               .run = hantro_g1_vp8_dec_run,
>>>>> +               .reset = hantro_g1_reset,
>>>>> +               .init = hantro_vp8_dec_init,
>>>>> +               .exit = hantro_vp8_dec_exit,
>>>>> +       },
>>>>> +};
>>>>> +
>>>>>    static const struct hantro_codec_ops rk3066_vpu_codec_ops[] = {
>>>>>           [HANTRO_MODE_JPEG_ENC] = {
>>>>>                   .run = hantro_h1_jpeg_enc_run,
>>>>> @@ -269,6 +297,10 @@ static const struct hantro_codec_ops rk3288_vpu_codec_ops[] = {
>>>>>     * VPU variant.
>>>>>     */
>>>>>    
>>>>> +static const struct hantro_irq rk3036_irqs[] = {
>>>>> +       { "vdpu", hantro_g1_irq },
>>>>> +};
>>>>> +
>>>>>    static const struct hantro_irq rk3288_irqs[] = {
>>>>>           { "vepu", rk3288_vepu_irq },
>>>>>           { "vdpu", hantro_g1_irq },
>>>>> @@ -283,6 +315,23 @@ static const char * const rk3288_clk_names[] = {
>>>>>           "aclk", "hclk"
>>>>>    };
>>>>>    
>>>>> +const struct hantro_variant rk3036_vpu_variant = {
>>>>> +       .dec_offset = 0x400,
>>>> If it doesn't have an encoder, then you should just
>>>> use dec_offset = 0x0.
>>>>
>>>> Thanks,
>>>> Ezequiel
>>>>
>>> That would mean, I'd have to adapt the register offset in the device
>>> tree - I'd prefer to keep it in line with the TRM. Unless you insist,
>>> I'd like to keep it this way (It's , btw, the very same for RK3328).
>> I'd agree with Alex ... ideally the devicetree should match the block
>> register area from the TRM not some internal offset.
>> [DT describes hardware etc etc ;-) ]
>>
> Well, I've always considered this internal offset as something unfortunate
> we didn't do well when we upstreamed RK3288.
>
> The RK3288 TRM documents a so-called "VPU combo", and then documents
> the encoder and the decoder cores as separate engines, with
> separate register blocks (called VEPU and VDPU). In fact, for each
> register block you'll see swreg0 documented at offset 0x0.

I've always looked at the "Address Mapping" section in the TRMs when I 
checked the register offsets. I can't find a seperation the vpu block 
there (for any SoC).

I've found it more unfortunate, that they started with register offset 
0x0 for vdpu and vepu, since none of the SoCs (so far) can use the 
blocks separately.

> (In some integrations they can operate independently, but iirc not in RK3288.)
>
> So to be clear, instead of:
>
>          vpu: video-codec@ff9a0000 {
>                  compatible = "rockchip,rk3288-vpu";
>                  reg = <0x0 0xff9a0000 0x0 0x800>;
>                  interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
>                               <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
>                  interrupt-names = "vepu", "vdpu";
>                  clocks = <&cru ACLK_VCODEC>, <&cru HCLK_VCODEC>;
>                  clock-names = "aclk", "hclk";
>                  ...
>
> It could have looked like:
>
>          vpu: video-codec@ff9a0000 {
>                  compatible = "rockchip,rk3288-vpu";
>                  reg = <0x0 0xff9a0000 0x0 0x400>
>                        <0x0 0xff9a0400 0x0 0x400>;
>                  ...
>
> I guess I missed this when RK3328 was pushed, but OTOH I don't
> see any real impact in doing things this way. So at the end
> of the day, I'm fine either way.
>
> BTW, the series is not adding the vpu node for arch/arm/boot/dts/rk3036.dtsi right?

Ups, yes - I missed to submit this patch with v1 - I added it in its 
original version to v2 (so we know, what we are talking about)-

If you think it should be changed, please reply to v2.

> Thanks a lot!
> Ezequiel
>
Thanks,

Alex

