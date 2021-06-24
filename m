Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D583B394A
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 00:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhFXWmP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 18:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhFXWmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 18:42:14 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8403C061574
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 15:39:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id f15so8397982wro.8
        for <linux-media@vger.kernel.org>; Thu, 24 Jun 2021 15:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=awN+mLAoEH8adc/34pvvwVLjd8WD+JCjLBCZB/HNCcQ=;
        b=JLavQb/N/JXoQK2XZZoqYunHXclRnGv45pD/NpTyHnyjTIRRz0aPG6zP9n3hJi78zm
         3MyOhzaScJju7ZFGodLqSeKzDvvZTZ44cnQJTpNszBoeItywz8zCG59fakQXhvf876wz
         vwjpOyywH7OS7pS4zCCJJ4lVj6oEtEASi7Jl/6tAJPEQ0MXqBbXJL9SQ24uIjZP1rRwa
         RkI5U64TlsN5JQGJjPk9fQdkEjJsCYv0wOwpaGdp6hiT7Qr9UtXH0i0MaC8j1PYeq+6z
         72NGED6YhG4qUWbf5UGDPFwQKq+DFP/IDQXCvFbNEuL+PEGyI3pK5zI7rf8DFGRFT+oI
         HHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=awN+mLAoEH8adc/34pvvwVLjd8WD+JCjLBCZB/HNCcQ=;
        b=dBnUPPX1WrEnm7HWx6yrRUy2QPGScWJIG9/riE4Iz7K2fxv8k8xnICYknGIEhiNmSa
         NGISM/2Dn/8adB4C0WT7rybHzVTztnwWAilDijey5uH62dB/VEO0Q72SNy6Qf15wHOYt
         6Fr6jWxCt8aOyuLSWbVo/sg9PL7IRNplAtbGLHYQoPJOb+mwAs74eFlRg27NJGbiFzf3
         hXlhU9XG589C/Q4g2dHRawDuXcXk5WFvqPhmrlO6qKitBCIXRpUJKEUoGhY7PbDZeFoy
         qqEpDNRMcgzv3IJ8uploBpsTAetvO9MnLxlVu18emC3feHW6s98Byf03yjGiOEf/9bCS
         mQPQ==
X-Gm-Message-State: AOAM531KpTevF6ps92wscrduj+fuL8Yo98qmThNbkqISe6fQY6M01jvl
        46Pv6G3ZijunKDHKnqimjg==
X-Google-Smtp-Source: ABdhPJygubo/RGkTNuu7pObCdpCXdlq3c6h0pwkkNyTmzLedvjah5lEQaZ9fy3rRI0bGZRwlFm9Wew==
X-Received: by 2002:a5d:4589:: with SMTP id p9mr7355530wrq.30.1624574390996;
        Thu, 24 Jun 2021 15:39:50 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id c8sm4298080wri.91.2021.06.24.15.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 15:39:50 -0700 (PDT)
Subject: Re: [PATCH 12/12] media: hantro: Add support for the Rockchip PX30
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-13-ezequiel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <0f129376-1377-8288-7768-91a57790014d@gmail.com>
Date:   Fri, 25 Jun 2021 00:39:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-13-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
>
> The PX30 SoC includes both the VDPU2 and VEPU2 blocks which are similar
> to the RK3399 (Hantro G1/H1 with shuffled registers).
>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>   drivers/staging/media/hantro/hantro_drv.c     |  1 +
>   drivers/staging/media/hantro/hantro_hw.h      |  1 +
>   .../staging/media/hantro/rockchip_vpu_hw.c    | 28 +++++++++++++++++++
>   3 files changed, 30 insertions(+)
>
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index 9b5415176bfe..8a2edd67f2c6 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -582,6 +582,7 @@ static const struct v4l2_file_operations hantro_fops = {
>   
>   static const struct of_device_id of_hantro_match[] = {
>   #ifdef CONFIG_VIDEO_HANTRO_ROCKCHIP
> +	{ .compatible = "rockchip,px30-vpu",   .data = &px30_vpu_variant, },
>   	{ .compatible = "rockchip,rk3036-vpu", .data = &rk3036_vpu_variant, },
>   	{ .compatible = "rockchip,rk3066-vpu", .data = &rk3066_vpu_variant, },
>   	{ .compatible = "rockchip,rk3288-vpu", .data = &rk3288_vpu_variant, },
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 9296624654a6..df7b5e3a57b9 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -209,6 +209,7 @@ enum hantro_enc_fmt {
>   
>   extern const struct hantro_variant imx8mq_vpu_g2_variant;
>   extern const struct hantro_variant imx8mq_vpu_variant;
> +extern const struct hantro_variant px30_vpu_variant;
>   extern const struct hantro_variant rk3036_vpu_variant;
>   extern const struct hantro_variant rk3066_vpu_variant;
>   extern const struct hantro_variant rk3288_vpu_variant;
> diff --git a/drivers/staging/media/hantro/rockchip_vpu_hw.c b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> index e4e3b5e7689b..e7f56e30b4a8 100644
> --- a/drivers/staging/media/hantro/rockchip_vpu_hw.c
> +++ b/drivers/staging/media/hantro/rockchip_vpu_hw.c
> @@ -16,6 +16,7 @@
>   
>   #define RK3066_ACLK_MAX_FREQ (300 * 1000 * 1000)
>   #define RK3288_ACLK_MAX_FREQ (400 * 1000 * 1000)
> +#define PX30_ACLK_MAX_FREQ (300 * 1000 * 1000)
>   

Not sure it is required (besides semantics) to introduce a new 
*ACLK_MAX_FREQ here. rk3036_vpu_hw_init could be used to entirely 
replace px30_vpu_hw_init in px30_vpu_variant.

(Maybe we can find some more common names, after we know which variant 
combinations exist)

>   /*
>    * Supported formats.
> @@ -279,6 +280,12 @@ static int rockchip_vpu_hw_init(struct hantro_dev *vpu)
>   	return 0;
>   }
>   
> +static int px30_vpu_hw_init(struct hantro_dev *vpu)
> +{
> +	clk_set_rate(vpu->clocks[0].clk, PX30_ACLK_MAX_FREQ);
> +	return 0;
> +}
> +
>   static void rk3066_vpu_dec_reset(struct hantro_ctx *ctx)
>   {
>   	struct hantro_dev *vpu = ctx->dev;
> @@ -452,6 +459,10 @@ static const char * const rockchip_vpu_clk_names[] = {
>   	"aclk", "hclk"
>   };
>   
> +static const char * const px30_clk_names[] = {
> +	"aclk", "hclk"
> +};
> +
>   /* VDPU1/VEPU1 */
>   
>   const struct hantro_variant rk3036_vpu_variant = {
> @@ -548,3 +559,20 @@ const struct hantro_variant rk3399_vpu_variant = {
>   	.clk_names = rockchip_vpu_clk_names,
>   	.num_clocks = ARRAY_SIZE(rockchip_vpu_clk_names)
>   };
> +
> +const struct hantro_variant px30_vpu_variant = {
> +	.enc_offset = 0x0,
> +	.enc_fmts = rockchip_vpu_enc_fmts,
> +	.num_enc_fmts = ARRAY_SIZE(rockchip_vpu_enc_fmts),
> +	.dec_offset = 0x400,
> +	.dec_fmts = rk3399_vpu_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
> +	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER |
> +		 HANTRO_VP8_DECODER | HANTRO_H264_DECODER,
> +	.codec_ops = rk3399_vpu_codec_ops,
> +	.irqs = rockchip_vpu2_irqs,
> +	.num_irqs = ARRAY_SIZE(rockchip_vpu2_irqs),
> +	.init = px30_vpu_hw_init,
> +	.clk_names = px30_clk_names,
> +	.num_clocks = ARRAY_SIZE(px30_clk_names)
Better re-use rockchip_vpu_clk_names for these two.
> +};
Alex.
